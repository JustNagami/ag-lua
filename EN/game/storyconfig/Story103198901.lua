return {
	Play319891001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319891001
		arg_1_1.duration_ = 4.999999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319891002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 0.2

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_4 = 0.233333333333333
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "music"

				arg_1_1:AudioAction(var_4_6, var_4_7, "bgm_activity_3_0_story_sad", "bgm_activity_3_0_story_sad", "bgm_activity_3_0_story_sad.awb")
			end

			local var_4_8 = 0

			if var_4_8 < arg_1_1.time_ and arg_1_1.time_ <= var_4_8 + arg_4_0 then
				local var_4_9 = arg_1_1.fswbg_.transform:Find("textbox/adapt/content") or arg_1_1.fswbg_.transform:Find("textbox/content")
				local var_4_10 = var_4_9:GetComponent("Text")
				local var_4_11 = var_4_9:GetComponent("RectTransform")

				var_4_10.alignment = UnityEngine.TextAnchor.LowerCenter
				var_4_11.offsetMin = Vector2.New(0, 0)
				var_4_11.offsetMax = Vector2.New(0, 0)
			end

			local var_4_12 = 0

			if var_4_12 < arg_1_1.time_ and arg_1_1.time_ <= var_4_12 + arg_4_0 then
				arg_1_1.fswbg_:SetActive(true)
				arg_1_1.dialog_:SetActive(false)

				arg_1_1.fswtw_.percent = 0

				local var_4_13 = arg_1_1:GetWordFromCfg(319891001)
				local var_4_14 = arg_1_1:FormatText(var_4_13.content)

				arg_1_1.fswt_.text = var_4_14

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.fswt_)

				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()

				arg_1_1.typewritterCharCountI18N = 0

				SetActive(arg_1_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_1_1:ShowNextGo(false)
			end

			local var_4_15 = 0.633333333333333

			if var_4_15 < arg_1_1.time_ and arg_1_1.time_ <= var_4_15 + arg_4_0 then
				arg_1_1.var_.oldValueTypewriter = arg_1_1.fswtw_.percent

				arg_1_1:ShowNextGo(false)
			end

			local var_4_16 = 9
			local var_4_17 = 0.6
			local var_4_18 = arg_1_1:GetWordFromCfg(319891001)
			local var_4_19 = arg_1_1:FormatText(var_4_18.content)
			local var_4_20, var_4_21 = arg_1_1:GetPercentByPara(var_4_19, 1)

			if var_4_15 < arg_1_1.time_ and arg_1_1.time_ <= var_4_15 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				local var_4_22 = var_4_16 <= 0 and var_4_17 or var_4_17 * ((var_4_21 - arg_1_1.typewritterCharCountI18N) / var_4_16)

				if var_4_22 > 0 and var_4_17 < var_4_22 then
					arg_1_1.talkMaxDuration = var_4_22

					if var_4_22 + var_4_15 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_22 + var_4_15
					end
				end
			end

			local var_4_23 = 0.6
			local var_4_24 = math.max(var_4_23, arg_1_1.talkMaxDuration)

			if var_4_15 <= arg_1_1.time_ and arg_1_1.time_ < var_4_15 + var_4_24 then
				local var_4_25 = (arg_1_1.time_ - var_4_15) / var_4_24

				arg_1_1.fswtw_.percent = Mathf.Lerp(arg_1_1.var_.oldValueTypewriter, var_4_20, var_4_25)
				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()
			end

			if arg_1_1.time_ >= var_4_15 + var_4_24 and arg_1_1.time_ < var_4_15 + var_4_24 + arg_4_0 then
				arg_1_1.fswtw_.percent = var_4_20

				arg_1_1.fswtw_:SetDirty()
				arg_1_1:ShowNextGo(true)

				arg_1_1.typewritterCharCountI18N = var_4_21
			end

			local var_4_26 = "STblack"

			if arg_1_1.bgs_[var_4_26] == nil then
				local var_4_27 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_27:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_26)
				var_4_27.name = var_4_26
				var_4_27.transform.parent = arg_1_1.stage_.transform
				var_4_27.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_26] = var_4_27
			end

			local var_4_28 = 0

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_29 = manager.ui.mainCamera.transform.localPosition
				local var_4_30 = Vector3.New(0, 0, 10) + Vector3.New(var_4_29.x, var_4_29.y, 0)
				local var_4_31 = arg_1_1.bgs_.STblack

				var_4_31.transform.localPosition = var_4_30
				var_4_31.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_32 = var_4_31:GetComponent("SpriteRenderer")

				if var_4_32 and var_4_32.sprite then
					local var_4_33 = (var_4_31.transform.localPosition - var_4_29).z
					local var_4_34 = manager.ui.mainCameraCom_
					local var_4_35 = 2 * var_4_33 * Mathf.Tan(var_4_34.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_36 = var_4_35 * var_4_34.aspect
					local var_4_37 = var_4_32.sprite.bounds.size.x
					local var_4_38 = var_4_32.sprite.bounds.size.y
					local var_4_39 = var_4_36 / var_4_37
					local var_4_40 = var_4_35 / var_4_38
					local var_4_41 = var_4_40 < var_4_39 and var_4_39 or var_4_40

					var_4_31.transform.localScale = Vector3.New(var_4_41, var_4_41, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "STblack" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_42 = 0.633333333333333
			local var_4_43 = 1.833
			local var_4_44 = manager.audio:GetVoiceLength("story_v_out_319891", "319891001", "story_v_out_319891.awb") / 1000

			if var_4_44 > 0 and var_4_43 < var_4_44 and var_4_44 + var_4_42 > arg_1_1.duration_ then
				local var_4_45 = var_4_44

				arg_1_1.duration_ = var_4_44 + var_4_42
			end

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				local var_4_46 = "play"
				local var_4_47 = "voice"

				arg_1_1:AudioAction(var_4_46, var_4_47, "story_v_out_319891", "319891001", "story_v_out_319891.awb")
			end

			local var_4_48 = 0

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				arg_1_1.cswbg_:SetActive(true)

				local var_4_49 = arg_1_1.cswt_:GetComponent("RectTransform")

				arg_1_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_4_49.offsetMin = Vector2.New(410, 330)
				var_4_49.offsetMax = Vector2.New(-400, -180)

				local var_4_50 = arg_1_1:GetWordFromCfg(419064)
				local var_4_51 = arg_1_1:FormatText(var_4_50.content)

				arg_1_1.cswt_.text = var_4_51

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.cswt_)

				arg_1_1.cswt_.fontSize = 173
				arg_1_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_1_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 319891002
		arg_5_1.duration_ = 6.23333333333333

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play319891003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = "ST15a"

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
				local var_8_5 = arg_5_1.bgs_.ST15a

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
					if iter_8_0 ~= "ST15a" then
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

			local var_8_17 = 1.4

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

			local var_8_22 = "1084ui_story"

			if arg_5_1.actors_[var_8_22] == nil then
				local var_8_23 = Object.Instantiate(Asset.Load("Char/" .. var_8_22), arg_5_1.stage_.transform)

				var_8_23.name = var_8_22
				var_8_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_5_1.actors_[var_8_22] = var_8_23

				local var_8_24 = var_8_23:GetComponentInChildren(typeof(CharacterEffect))

				var_8_24.enabled = true

				local var_8_25 = GameObjectTools.GetOrAddComponent(var_8_23, typeof(DynamicBoneHelper))

				if var_8_25 then
					var_8_25:EnableDynamicBone(false)
				end

				arg_5_1:ShowWeapon(var_8_24.transform, false)

				arg_5_1.var_[var_8_22 .. "Animator"] = var_8_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_5_1.var_[var_8_22 .. "Animator"].applyRootMotion = true
				arg_5_1.var_[var_8_22 .. "LipSync"] = var_8_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_8_26 = arg_5_1.actors_["1084ui_story"]
			local var_8_27 = 0

			if var_8_27 < arg_5_1.time_ and arg_5_1.time_ <= var_8_27 + arg_8_0 and arg_5_1.var_.characterEffect1084ui_story == nil then
				arg_5_1.var_.characterEffect1084ui_story = var_8_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_28 = 0.200000002980232

			if var_8_27 <= arg_5_1.time_ and arg_5_1.time_ < var_8_27 + var_8_28 then
				local var_8_29 = (arg_5_1.time_ - var_8_27) / var_8_28

				if arg_5_1.var_.characterEffect1084ui_story then
					local var_8_30 = Mathf.Lerp(0, 0.5, var_8_29)

					arg_5_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_5_1.var_.characterEffect1084ui_story.fillRatio = var_8_30
				end
			end

			if arg_5_1.time_ >= var_8_27 + var_8_28 and arg_5_1.time_ < var_8_27 + var_8_28 + arg_8_0 and arg_5_1.var_.characterEffect1084ui_story then
				local var_8_31 = 0.5

				arg_5_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_5_1.var_.characterEffect1084ui_story.fillRatio = var_8_31
			end

			local var_8_32 = 0
			local var_8_33 = 1

			if var_8_32 < arg_5_1.time_ and arg_5_1.time_ <= var_8_32 + arg_8_0 then
				local var_8_34 = "play"
				local var_8_35 = "effect"

				arg_5_1:AudioAction(var_8_34, var_8_35, "se_story_130", "se_story_130_sea", "")
			end

			local var_8_36 = 0

			if var_8_36 < arg_5_1.time_ and arg_5_1.time_ <= var_8_36 + arg_8_0 then
				arg_5_1.fswbg_:SetActive(false)
				arg_5_1.dialog_:SetActive(false)
				arg_5_1:ShowNextGo(false)
			end

			local var_8_37 = 0.1

			if var_8_37 < arg_5_1.time_ and arg_5_1.time_ <= var_8_37 + arg_8_0 then
				arg_5_1.fswbg_:SetActive(false)
				arg_5_1.dialog_:SetActive(false)
				arg_5_1:ShowNextGo(false)
			end

			local var_8_38 = 0

			if var_8_38 < arg_5_1.time_ and arg_5_1.time_ <= var_8_38 + arg_8_0 then
				arg_5_1.cswbg_:SetActive(false)
			end

			if arg_5_1.frameCnt_ <= 1 then
				arg_5_1.dialog_:SetActive(false)
			end

			local var_8_39 = 1.23333333333333
			local var_8_40 = 1.475

			if var_8_39 < arg_5_1.time_ and arg_5_1.time_ <= var_8_39 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0

				arg_5_1.dialog_:SetActive(true)

				local var_8_41 = LeanTween.value(arg_5_1.dialog_, 0, 1, 0.3)

				var_8_41:setOnUpdate(LuaHelper.FloatAction(function(arg_9_0)
					arg_5_1.dialogCg_.alpha = arg_9_0
				end))
				var_8_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_5_1.dialog_)
					var_8_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_5_1.duration_ = arg_5_1.duration_ + 0.3

				SetActive(arg_5_1.leftNameGo_, false)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_42 = arg_5_1:GetWordFromCfg(319891002)
				local var_8_43 = arg_5_1:FormatText(var_8_42.content)

				arg_5_1.text_.text = var_8_43

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_44 = 59
				local var_8_45 = utf8.len(var_8_43)
				local var_8_46 = var_8_44 <= 0 and var_8_40 or var_8_40 * (var_8_45 / var_8_44)

				if var_8_46 > 0 and var_8_40 < var_8_46 then
					arg_5_1.talkMaxDuration = var_8_46
					var_8_39 = var_8_39 + 0.3

					if var_8_46 + var_8_39 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_46 + var_8_39
					end
				end

				arg_5_1.text_.text = var_8_43
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)
				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_47 = var_8_39 + 0.3
			local var_8_48 = math.max(var_8_40, arg_5_1.talkMaxDuration)

			if var_8_47 <= arg_5_1.time_ and arg_5_1.time_ < var_8_47 + var_8_48 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_47) / var_8_48

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_47 + var_8_48 and arg_5_1.time_ < var_8_47 + var_8_48 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play319891003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319891003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play319891004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.425

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

				local var_14_2 = arg_11_1:GetWordFromCfg(319891003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 57
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
	Play319891004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319891004
		arg_15_1.duration_ = 2.566

		local var_15_0 = {
			zh = 1.999999999999,
			ja = 2.566
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
				arg_15_0:Play319891005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_0.localPosition

				local var_18_2 = "1084ui_story"

				arg_15_1:ShowWeapon(arg_15_1.var_[var_18_2 .. "Animator"].transform, false)
			end

			local var_18_3 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_3 then
				local var_18_4 = (arg_15_1.time_ - var_18_1) / var_18_3
				local var_18_5 = Vector3.New(0, -0.97, -6)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_5, var_18_4)

				local var_18_6 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_6.x, var_18_6.y, var_18_6.z)

				local var_18_7 = var_18_0.localEulerAngles

				var_18_7.z = 0
				var_18_7.x = 0
				var_18_0.localEulerAngles = var_18_7
			end

			if arg_15_1.time_ >= var_18_1 + var_18_3 and arg_15_1.time_ < var_18_1 + var_18_3 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_18_8 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_8.x, var_18_8.y, var_18_8.z)

				local var_18_9 = var_18_0.localEulerAngles

				var_18_9.z = 0
				var_18_9.x = 0
				var_18_0.localEulerAngles = var_18_9
			end

			local var_18_10 = arg_15_1.actors_["1084ui_story"]
			local var_18_11 = 0

			if var_18_11 < arg_15_1.time_ and arg_15_1.time_ <= var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_12 = 0.200000002980232

			if var_18_11 <= arg_15_1.time_ and arg_15_1.time_ < var_18_11 + var_18_12 then
				local var_18_13 = (arg_15_1.time_ - var_18_11) / var_18_12

				if arg_15_1.var_.characterEffect1084ui_story then
					arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_11 + var_18_12 and arg_15_1.time_ < var_18_11 + var_18_12 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_18_16 = 0
			local var_18_17 = 0.25

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_18 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_19 = arg_15_1:GetWordFromCfg(319891004)
				local var_18_20 = arg_15_1:FormatText(var_18_19.content)

				arg_15_1.text_.text = var_18_20

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_21 = 10
				local var_18_22 = utf8.len(var_18_20)
				local var_18_23 = var_18_21 <= 0 and var_18_17 or var_18_17 * (var_18_22 / var_18_21)

				if var_18_23 > 0 and var_18_17 < var_18_23 then
					arg_15_1.talkMaxDuration = var_18_23

					if var_18_23 + var_18_16 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_23 + var_18_16
					end
				end

				arg_15_1.text_.text = var_18_20
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891004", "story_v_out_319891.awb") ~= 0 then
					local var_18_24 = manager.audio:GetVoiceLength("story_v_out_319891", "319891004", "story_v_out_319891.awb") / 1000

					if var_18_24 + var_18_16 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_24 + var_18_16
					end

					if var_18_19.prefab_name ~= "" and arg_15_1.actors_[var_18_19.prefab_name] ~= nil then
						local var_18_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_19.prefab_name].transform, "story_v_out_319891", "319891004", "story_v_out_319891.awb")

						arg_15_1:RecordAudio("319891004", var_18_25)
						arg_15_1:RecordAudio("319891004", var_18_25)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319891", "319891004", "story_v_out_319891.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319891", "319891004", "story_v_out_319891.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_26 = math.max(var_18_17, arg_15_1.talkMaxDuration)

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_26 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_16) / var_18_26

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_16 + var_18_26 and arg_15_1.time_ < var_18_16 + var_18_26 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319891005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319891005
		arg_19_1.duration_ = 2.999999999999

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play319891006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, 100, 0)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, 100, 0)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = 0

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 then
				local var_22_10 = arg_19_1.fswbg_.transform:Find("textbox/adapt/content") or arg_19_1.fswbg_.transform:Find("textbox/content")
				local var_22_11 = var_22_10:GetComponent("Text")
				local var_22_12 = var_22_10:GetComponent("RectTransform")

				var_22_11.alignment = UnityEngine.TextAnchor.LowerCenter
				var_22_12.offsetMin = Vector2.New(0, 0)
				var_22_12.offsetMax = Vector2.New(0, 0)
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1.fswbg_:SetActive(true)
				arg_19_1.dialog_:SetActive(false)

				arg_19_1.fswtw_.percent = 0

				local var_22_14 = arg_19_1:GetWordFromCfg(319891005)
				local var_22_15 = arg_19_1:FormatText(var_22_14.content)

				arg_19_1.fswt_.text = var_22_15

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.fswt_)

				arg_19_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_19_1.fswtw_:SetDirty()

				arg_19_1.typewritterCharCountI18N = 0

				SetActive(arg_19_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_19_1:ShowNextGo(false)
			end

			local var_22_16 = 0.666666666666667

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.var_.oldValueTypewriter = arg_19_1.fswtw_.percent

				arg_19_1:ShowNextGo(false)
			end

			local var_22_17 = 6
			local var_22_18 = 0.4
			local var_22_19 = arg_19_1:GetWordFromCfg(319891005)
			local var_22_20 = arg_19_1:FormatText(var_22_19.content)
			local var_22_21, var_22_22 = arg_19_1:GetPercentByPara(var_22_20, 1)

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				local var_22_23 = var_22_17 <= 0 and var_22_18 or var_22_18 * ((var_22_22 - arg_19_1.typewritterCharCountI18N) / var_22_17)

				if var_22_23 > 0 and var_22_18 < var_22_23 then
					arg_19_1.talkMaxDuration = var_22_23

					if var_22_23 + var_22_16 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_23 + var_22_16
					end
				end
			end

			local var_22_24 = 0.4
			local var_22_25 = math.max(var_22_24, arg_19_1.talkMaxDuration)

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_25 then
				local var_22_26 = (arg_19_1.time_ - var_22_16) / var_22_25

				arg_19_1.fswtw_.percent = Mathf.Lerp(arg_19_1.var_.oldValueTypewriter, var_22_21, var_22_26)
				arg_19_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_19_1.fswtw_:SetDirty()
			end

			if arg_19_1.time_ >= var_22_16 + var_22_25 and arg_19_1.time_ < var_22_16 + var_22_25 + arg_22_0 then
				arg_19_1.fswtw_.percent = var_22_21

				arg_19_1.fswtw_:SetDirty()
				arg_19_1:ShowNextGo(true)

				arg_19_1.typewritterCharCountI18N = var_22_22
			end

			local var_22_27 = 0

			if var_22_27 < arg_19_1.time_ and arg_19_1.time_ <= var_22_27 + arg_22_0 then
				local var_22_28 = manager.ui.mainCamera.transform.localPosition
				local var_22_29 = Vector3.New(0, 0, 10) + Vector3.New(var_22_28.x, var_22_28.y, 0)
				local var_22_30 = arg_19_1.bgs_.STblack

				var_22_30.transform.localPosition = var_22_29
				var_22_30.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_22_31 = var_22_30:GetComponent("SpriteRenderer")

				if var_22_31 and var_22_31.sprite then
					local var_22_32 = (var_22_30.transform.localPosition - var_22_28).z
					local var_22_33 = manager.ui.mainCameraCom_
					local var_22_34 = 2 * var_22_32 * Mathf.Tan(var_22_33.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_22_35 = var_22_34 * var_22_33.aspect
					local var_22_36 = var_22_31.sprite.bounds.size.x
					local var_22_37 = var_22_31.sprite.bounds.size.y
					local var_22_38 = var_22_35 / var_22_36
					local var_22_39 = var_22_34 / var_22_37
					local var_22_40 = var_22_39 < var_22_38 and var_22_38 or var_22_39

					var_22_30.transform.localScale = Vector3.New(var_22_40, var_22_40, 0)
				end

				for iter_22_0, iter_22_1 in pairs(arg_19_1.bgs_) do
					if iter_22_0 ~= "STblack" then
						iter_22_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_22_41 = 0.666666666666667
			local var_22_42 = 1.366
			local var_22_43 = manager.audio:GetVoiceLength("story_v_out_319891", "319891005", "story_v_out_319891.awb") / 1000

			if var_22_43 > 0 and var_22_42 < var_22_43 and var_22_43 + var_22_41 > arg_19_1.duration_ then
				local var_22_44 = var_22_43

				arg_19_1.duration_ = var_22_43 + var_22_41
			end

			if var_22_41 < arg_19_1.time_ and arg_19_1.time_ <= var_22_41 + arg_22_0 then
				local var_22_45 = "play"
				local var_22_46 = "voice"

				arg_19_1:AudioAction(var_22_45, var_22_46, "story_v_out_319891", "319891005", "story_v_out_319891.awb")
			end

			local var_22_47 = 0

			if var_22_47 < arg_19_1.time_ and arg_19_1.time_ <= var_22_47 + arg_22_0 then
				arg_19_1.cswbg_:SetActive(true)

				local var_22_48 = arg_19_1.cswt_:GetComponent("RectTransform")

				arg_19_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_22_48.offsetMin = Vector2.New(0, 330)
				var_22_48.offsetMax = Vector2.New(0, -180)

				local var_22_49 = arg_19_1:GetWordFromCfg(419065)
				local var_22_50 = arg_19_1:FormatText(var_22_49.content)

				arg_19_1.cswt_.text = var_22_50

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.cswt_)

				arg_19_1.cswt_.fontSize = 173
				arg_19_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_19_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319891006
		arg_23_1.duration_ = 5.86666666666667

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play319891007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				local var_26_1 = manager.ui.mainCamera.transform.localPosition
				local var_26_2 = Vector3.New(0, 0, 10) + Vector3.New(var_26_1.x, var_26_1.y, 0)
				local var_26_3 = arg_23_1.bgs_.ST15a

				var_26_3.transform.localPosition = var_26_2
				var_26_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_26_4 = var_26_3:GetComponent("SpriteRenderer")

				if var_26_4 and var_26_4.sprite then
					local var_26_5 = (var_26_3.transform.localPosition - var_26_1).z
					local var_26_6 = manager.ui.mainCameraCom_
					local var_26_7 = 2 * var_26_5 * Mathf.Tan(var_26_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_26_8 = var_26_7 * var_26_6.aspect
					local var_26_9 = var_26_4.sprite.bounds.size.x
					local var_26_10 = var_26_4.sprite.bounds.size.y
					local var_26_11 = var_26_8 / var_26_9
					local var_26_12 = var_26_7 / var_26_10
					local var_26_13 = var_26_12 < var_26_11 and var_26_11 or var_26_12

					var_26_3.transform.localScale = Vector3.New(var_26_13, var_26_13, 0)
				end

				for iter_26_0, iter_26_1 in pairs(arg_23_1.bgs_) do
					if iter_26_0 ~= "ST15a" then
						iter_26_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_26_14 = "1095ui_story"

			if arg_23_1.actors_[var_26_14] == nil then
				local var_26_15 = Object.Instantiate(Asset.Load("Char/" .. var_26_14), arg_23_1.stage_.transform)

				var_26_15.name = var_26_14
				var_26_15.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_14] = var_26_15

				local var_26_16 = var_26_15:GetComponentInChildren(typeof(CharacterEffect))

				var_26_16.enabled = true

				local var_26_17 = GameObjectTools.GetOrAddComponent(var_26_15, typeof(DynamicBoneHelper))

				if var_26_17 then
					var_26_17:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_16.transform, false)

				arg_23_1.var_[var_26_14 .. "Animator"] = var_26_16.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_14 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_14 .. "LipSync"] = var_26_16.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_18 = arg_23_1.actors_["1095ui_story"]
			local var_26_19 = 0

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story == nil then
				arg_23_1.var_.characterEffect1095ui_story = var_26_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_20 = 0.200000002980232

			if var_26_19 <= arg_23_1.time_ and arg_23_1.time_ < var_26_19 + var_26_20 then
				local var_26_21 = (arg_23_1.time_ - var_26_19) / var_26_20

				if arg_23_1.var_.characterEffect1095ui_story then
					local var_26_22 = Mathf.Lerp(0, 0.5, var_26_21)

					arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_22
				end
			end

			if arg_23_1.time_ >= var_26_19 + var_26_20 and arg_23_1.time_ < var_26_19 + var_26_20 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story then
				local var_26_23 = 0.5

				arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_23
			end

			local var_26_24 = 0

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1.fswbg_:SetActive(false)
				arg_23_1.dialog_:SetActive(false)
				arg_23_1:ShowNextGo(false)
			end

			local var_26_25 = 0.1

			if var_26_25 < arg_23_1.time_ and arg_23_1.time_ <= var_26_25 + arg_26_0 then
				arg_23_1.fswbg_:SetActive(false)
				arg_23_1.dialog_:SetActive(false)
				arg_23_1:ShowNextGo(false)
			end

			local var_26_26 = 0

			if var_26_26 < arg_23_1.time_ and arg_23_1.time_ <= var_26_26 + arg_26_0 then
				arg_23_1.cswbg_:SetActive(false)
			end

			if arg_23_1.frameCnt_ <= 1 then
				arg_23_1.dialog_:SetActive(false)
			end

			local var_26_27 = 0.866666666666667
			local var_26_28 = 0.775

			if var_26_27 < arg_23_1.time_ and arg_23_1.time_ <= var_26_27 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0

				arg_23_1.dialog_:SetActive(true)

				local var_26_29 = LeanTween.value(arg_23_1.dialog_, 0, 1, 0.3)

				var_26_29:setOnUpdate(LuaHelper.FloatAction(function(arg_27_0)
					arg_23_1.dialogCg_.alpha = arg_27_0
				end))
				var_26_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_23_1.dialog_)
					var_26_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_23_1.duration_ = arg_23_1.duration_ + 0.3

				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_30 = arg_23_1:GetWordFromCfg(319891006)
				local var_26_31 = arg_23_1:FormatText(var_26_30.content)

				arg_23_1.text_.text = var_26_31

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_32 = 31
				local var_26_33 = utf8.len(var_26_31)
				local var_26_34 = var_26_32 <= 0 and var_26_28 or var_26_28 * (var_26_33 / var_26_32)

				if var_26_34 > 0 and var_26_28 < var_26_34 then
					arg_23_1.talkMaxDuration = var_26_34
					var_26_27 = var_26_27 + 0.3

					if var_26_34 + var_26_27 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_34 + var_26_27
					end
				end

				arg_23_1.text_.text = var_26_31
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_35 = var_26_27 + 0.3
			local var_26_36 = math.max(var_26_28, arg_23_1.talkMaxDuration)

			if var_26_35 <= arg_23_1.time_ and arg_23_1.time_ < var_26_35 + var_26_36 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_35) / var_26_36

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_35 + var_26_36 and arg_23_1.time_ < var_26_35 + var_26_36 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319891007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 319891007
		arg_29_1.duration_ = 9.633

		local var_29_0 = {
			zh = 6.5,
			ja = 9.633
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
				arg_29_0:Play319891008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1084ui_story"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos1084ui_story = var_32_0.localPosition

				local var_32_2 = "1084ui_story"

				arg_29_1:ShowWeapon(arg_29_1.var_[var_32_2 .. "Animator"].transform, false)
			end

			local var_32_3 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_3 then
				local var_32_4 = (arg_29_1.time_ - var_32_1) / var_32_3
				local var_32_5 = Vector3.New(-0.7, -0.97, -6)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1084ui_story, var_32_5, var_32_4)

				local var_32_6 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_6.x, var_32_6.y, var_32_6.z)

				local var_32_7 = var_32_0.localEulerAngles

				var_32_7.z = 0
				var_32_7.x = 0
				var_32_0.localEulerAngles = var_32_7
			end

			if arg_29_1.time_ >= var_32_1 + var_32_3 and arg_29_1.time_ < var_32_1 + var_32_3 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_32_8 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_8.x, var_32_8.y, var_32_8.z)

				local var_32_9 = var_32_0.localEulerAngles

				var_32_9.z = 0
				var_32_9.x = 0
				var_32_0.localEulerAngles = var_32_9
			end

			local var_32_10 = arg_29_1.actors_["1084ui_story"]
			local var_32_11 = 0

			if var_32_11 < arg_29_1.time_ and arg_29_1.time_ <= var_32_11 + arg_32_0 and arg_29_1.var_.characterEffect1084ui_story == nil then
				arg_29_1.var_.characterEffect1084ui_story = var_32_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_12 = 0.200000002980232

			if var_32_11 <= arg_29_1.time_ and arg_29_1.time_ < var_32_11 + var_32_12 then
				local var_32_13 = (arg_29_1.time_ - var_32_11) / var_32_12

				if arg_29_1.var_.characterEffect1084ui_story then
					arg_29_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_11 + var_32_12 and arg_29_1.time_ < var_32_11 + var_32_12 + arg_32_0 and arg_29_1.var_.characterEffect1084ui_story then
				arg_29_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_32_14 = 0

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 then
				arg_29_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_32_15 = 0
			local var_32_16 = 0.65

			if var_32_15 < arg_29_1.time_ and arg_29_1.time_ <= var_32_15 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_17 = arg_29_1:FormatText(StoryNameCfg[6].name)

				arg_29_1.leftNameTxt_.text = var_32_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_18 = arg_29_1:GetWordFromCfg(319891007)
				local var_32_19 = arg_29_1:FormatText(var_32_18.content)

				arg_29_1.text_.text = var_32_19

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_20 = 26
				local var_32_21 = utf8.len(var_32_19)
				local var_32_22 = var_32_20 <= 0 and var_32_16 or var_32_16 * (var_32_21 / var_32_20)

				if var_32_22 > 0 and var_32_16 < var_32_22 then
					arg_29_1.talkMaxDuration = var_32_22

					if var_32_22 + var_32_15 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_22 + var_32_15
					end
				end

				arg_29_1.text_.text = var_32_19
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891007", "story_v_out_319891.awb") ~= 0 then
					local var_32_23 = manager.audio:GetVoiceLength("story_v_out_319891", "319891007", "story_v_out_319891.awb") / 1000

					if var_32_23 + var_32_15 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_23 + var_32_15
					end

					if var_32_18.prefab_name ~= "" and arg_29_1.actors_[var_32_18.prefab_name] ~= nil then
						local var_32_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_18.prefab_name].transform, "story_v_out_319891", "319891007", "story_v_out_319891.awb")

						arg_29_1:RecordAudio("319891007", var_32_24)
						arg_29_1:RecordAudio("319891007", var_32_24)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_319891", "319891007", "story_v_out_319891.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_319891", "319891007", "story_v_out_319891.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_25 = math.max(var_32_16, arg_29_1.talkMaxDuration)

			if var_32_15 <= arg_29_1.time_ and arg_29_1.time_ < var_32_15 + var_32_25 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_15) / var_32_25

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_15 + var_32_25 and arg_29_1.time_ < var_32_15 + var_32_25 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play319891008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 319891008
		arg_33_1.duration_ = 3.266

		local var_33_0 = {
			zh = 3.266,
			ja = 1.999999999999
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
				arg_33_0:Play319891009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1095ui_story"].transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos1095ui_story = var_36_0.localPosition

				local var_36_2 = "1095ui_story"

				arg_33_1:ShowWeapon(arg_33_1.var_[var_36_2 .. "Animator"].transform, false)
			end

			local var_36_3 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_3 then
				local var_36_4 = (arg_33_1.time_ - var_36_1) / var_36_3
				local var_36_5 = Vector3.New(0.7, -0.98, -6.1)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1095ui_story, var_36_5, var_36_4)

				local var_36_6 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_6.x, var_36_6.y, var_36_6.z)

				local var_36_7 = var_36_0.localEulerAngles

				var_36_7.z = 0
				var_36_7.x = 0
				var_36_0.localEulerAngles = var_36_7
			end

			if arg_33_1.time_ >= var_36_1 + var_36_3 and arg_33_1.time_ < var_36_1 + var_36_3 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_36_8 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_8.x, var_36_8.y, var_36_8.z)

				local var_36_9 = var_36_0.localEulerAngles

				var_36_9.z = 0
				var_36_9.x = 0
				var_36_0.localEulerAngles = var_36_9
			end

			local var_36_10 = arg_33_1.actors_["1095ui_story"]
			local var_36_11 = 0

			if var_36_11 < arg_33_1.time_ and arg_33_1.time_ <= var_36_11 + arg_36_0 and arg_33_1.var_.characterEffect1095ui_story == nil then
				arg_33_1.var_.characterEffect1095ui_story = var_36_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_12 = 0.200000002980232

			if var_36_11 <= arg_33_1.time_ and arg_33_1.time_ < var_36_11 + var_36_12 then
				local var_36_13 = (arg_33_1.time_ - var_36_11) / var_36_12

				if arg_33_1.var_.characterEffect1095ui_story then
					arg_33_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_11 + var_36_12 and arg_33_1.time_ < var_36_11 + var_36_12 + arg_36_0 and arg_33_1.var_.characterEffect1095ui_story then
				arg_33_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_36_14 = 0

			if var_36_14 < arg_33_1.time_ and arg_33_1.time_ <= var_36_14 + arg_36_0 then
				arg_33_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_36_15 = arg_33_1.actors_["1084ui_story"].transform
			local var_36_16 = 0

			if var_36_16 < arg_33_1.time_ and arg_33_1.time_ <= var_36_16 + arg_36_0 then
				arg_33_1.var_.moveOldPos1084ui_story = var_36_15.localPosition

				local var_36_17 = "1084ui_story"

				arg_33_1:ShowWeapon(arg_33_1.var_[var_36_17 .. "Animator"].transform, false)
			end

			local var_36_18 = 0.001

			if var_36_16 <= arg_33_1.time_ and arg_33_1.time_ < var_36_16 + var_36_18 then
				local var_36_19 = (arg_33_1.time_ - var_36_16) / var_36_18
				local var_36_20 = Vector3.New(-0.7, -0.97, -6)

				var_36_15.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1084ui_story, var_36_20, var_36_19)

				local var_36_21 = manager.ui.mainCamera.transform.position - var_36_15.position

				var_36_15.forward = Vector3.New(var_36_21.x, var_36_21.y, var_36_21.z)

				local var_36_22 = var_36_15.localEulerAngles

				var_36_22.z = 0
				var_36_22.x = 0
				var_36_15.localEulerAngles = var_36_22
			end

			if arg_33_1.time_ >= var_36_16 + var_36_18 and arg_33_1.time_ < var_36_16 + var_36_18 + arg_36_0 then
				var_36_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_36_23 = manager.ui.mainCamera.transform.position - var_36_15.position

				var_36_15.forward = Vector3.New(var_36_23.x, var_36_23.y, var_36_23.z)

				local var_36_24 = var_36_15.localEulerAngles

				var_36_24.z = 0
				var_36_24.x = 0
				var_36_15.localEulerAngles = var_36_24
			end

			local var_36_25 = arg_33_1.actors_["1084ui_story"]
			local var_36_26 = 0

			if var_36_26 < arg_33_1.time_ and arg_33_1.time_ <= var_36_26 + arg_36_0 and arg_33_1.var_.characterEffect1084ui_story == nil then
				arg_33_1.var_.characterEffect1084ui_story = var_36_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_27 = 0.200000002980232

			if var_36_26 <= arg_33_1.time_ and arg_33_1.time_ < var_36_26 + var_36_27 then
				local var_36_28 = (arg_33_1.time_ - var_36_26) / var_36_27

				if arg_33_1.var_.characterEffect1084ui_story then
					local var_36_29 = Mathf.Lerp(0, 0.5, var_36_28)

					arg_33_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1084ui_story.fillRatio = var_36_29
				end
			end

			if arg_33_1.time_ >= var_36_26 + var_36_27 and arg_33_1.time_ < var_36_26 + var_36_27 + arg_36_0 and arg_33_1.var_.characterEffect1084ui_story then
				local var_36_30 = 0.5

				arg_33_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1084ui_story.fillRatio = var_36_30
			end

			local var_36_31 = 0
			local var_36_32 = 0.3

			if var_36_31 < arg_33_1.time_ and arg_33_1.time_ <= var_36_31 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_33 = arg_33_1:FormatText(StoryNameCfg[471].name)

				arg_33_1.leftNameTxt_.text = var_36_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_34 = arg_33_1:GetWordFromCfg(319891008)
				local var_36_35 = arg_33_1:FormatText(var_36_34.content)

				arg_33_1.text_.text = var_36_35

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_36 = 12
				local var_36_37 = utf8.len(var_36_35)
				local var_36_38 = var_36_36 <= 0 and var_36_32 or var_36_32 * (var_36_37 / var_36_36)

				if var_36_38 > 0 and var_36_32 < var_36_38 then
					arg_33_1.talkMaxDuration = var_36_38

					if var_36_38 + var_36_31 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_38 + var_36_31
					end
				end

				arg_33_1.text_.text = var_36_35
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891008", "story_v_out_319891.awb") ~= 0 then
					local var_36_39 = manager.audio:GetVoiceLength("story_v_out_319891", "319891008", "story_v_out_319891.awb") / 1000

					if var_36_39 + var_36_31 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_39 + var_36_31
					end

					if var_36_34.prefab_name ~= "" and arg_33_1.actors_[var_36_34.prefab_name] ~= nil then
						local var_36_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_34.prefab_name].transform, "story_v_out_319891", "319891008", "story_v_out_319891.awb")

						arg_33_1:RecordAudio("319891008", var_36_40)
						arg_33_1:RecordAudio("319891008", var_36_40)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_319891", "319891008", "story_v_out_319891.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_319891", "319891008", "story_v_out_319891.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_41 = math.max(var_36_32, arg_33_1.talkMaxDuration)

			if var_36_31 <= arg_33_1.time_ and arg_33_1.time_ < var_36_31 + var_36_41 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_31) / var_36_41

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_31 + var_36_41 and arg_33_1.time_ < var_36_31 + var_36_41 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play319891009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 319891009
		arg_37_1.duration_ = 2.9

		local var_37_0 = {
			zh = 1.666,
			ja = 2.9
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
				arg_37_0:Play319891010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1084ui_story"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos1084ui_story = var_40_0.localPosition
			end

			local var_40_2 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2
				local var_40_4 = Vector3.New(-0.7, -0.97, -6)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1084ui_story, var_40_4, var_40_3)

				local var_40_5 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_5.x, var_40_5.y, var_40_5.z)

				local var_40_6 = var_40_0.localEulerAngles

				var_40_6.z = 0
				var_40_6.x = 0
				var_40_0.localEulerAngles = var_40_6
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_40_7 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_7.x, var_40_7.y, var_40_7.z)

				local var_40_8 = var_40_0.localEulerAngles

				var_40_8.z = 0
				var_40_8.x = 0
				var_40_0.localEulerAngles = var_40_8
			end

			local var_40_9 = arg_37_1.actors_["1084ui_story"]
			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 and arg_37_1.var_.characterEffect1084ui_story == nil then
				arg_37_1.var_.characterEffect1084ui_story = var_40_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_11 = 0.200000002980232

			if var_40_10 <= arg_37_1.time_ and arg_37_1.time_ < var_40_10 + var_40_11 then
				local var_40_12 = (arg_37_1.time_ - var_40_10) / var_40_11

				if arg_37_1.var_.characterEffect1084ui_story then
					arg_37_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_10 + var_40_11 and arg_37_1.time_ < var_40_10 + var_40_11 + arg_40_0 and arg_37_1.var_.characterEffect1084ui_story then
				arg_37_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_40_13 = arg_37_1.actors_["1095ui_story"].transform
			local var_40_14 = 0

			if var_40_14 < arg_37_1.time_ and arg_37_1.time_ <= var_40_14 + arg_40_0 then
				arg_37_1.var_.moveOldPos1095ui_story = var_40_13.localPosition
			end

			local var_40_15 = 0.001

			if var_40_14 <= arg_37_1.time_ and arg_37_1.time_ < var_40_14 + var_40_15 then
				local var_40_16 = (arg_37_1.time_ - var_40_14) / var_40_15
				local var_40_17 = Vector3.New(0.7, -0.98, -6.1)

				var_40_13.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1095ui_story, var_40_17, var_40_16)

				local var_40_18 = manager.ui.mainCamera.transform.position - var_40_13.position

				var_40_13.forward = Vector3.New(var_40_18.x, var_40_18.y, var_40_18.z)

				local var_40_19 = var_40_13.localEulerAngles

				var_40_19.z = 0
				var_40_19.x = 0
				var_40_13.localEulerAngles = var_40_19
			end

			if arg_37_1.time_ >= var_40_14 + var_40_15 and arg_37_1.time_ < var_40_14 + var_40_15 + arg_40_0 then
				var_40_13.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_40_20 = manager.ui.mainCamera.transform.position - var_40_13.position

				var_40_13.forward = Vector3.New(var_40_20.x, var_40_20.y, var_40_20.z)

				local var_40_21 = var_40_13.localEulerAngles

				var_40_21.z = 0
				var_40_21.x = 0
				var_40_13.localEulerAngles = var_40_21
			end

			local var_40_22 = arg_37_1.actors_["1095ui_story"]
			local var_40_23 = 0

			if var_40_23 < arg_37_1.time_ and arg_37_1.time_ <= var_40_23 + arg_40_0 and arg_37_1.var_.characterEffect1095ui_story == nil then
				arg_37_1.var_.characterEffect1095ui_story = var_40_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_24 = 0.200000002980232

			if var_40_23 <= arg_37_1.time_ and arg_37_1.time_ < var_40_23 + var_40_24 then
				local var_40_25 = (arg_37_1.time_ - var_40_23) / var_40_24

				if arg_37_1.var_.characterEffect1095ui_story then
					local var_40_26 = Mathf.Lerp(0, 0.5, var_40_25)

					arg_37_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1095ui_story.fillRatio = var_40_26
				end
			end

			if arg_37_1.time_ >= var_40_23 + var_40_24 and arg_37_1.time_ < var_40_23 + var_40_24 + arg_40_0 and arg_37_1.var_.characterEffect1095ui_story then
				local var_40_27 = 0.5

				arg_37_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1095ui_story.fillRatio = var_40_27
			end

			local var_40_28 = 0
			local var_40_29 = 0.1

			if var_40_28 < arg_37_1.time_ and arg_37_1.time_ <= var_40_28 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_30 = arg_37_1:FormatText(StoryNameCfg[6].name)

				arg_37_1.leftNameTxt_.text = var_40_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_31 = arg_37_1:GetWordFromCfg(319891009)
				local var_40_32 = arg_37_1:FormatText(var_40_31.content)

				arg_37_1.text_.text = var_40_32

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_33 = 4
				local var_40_34 = utf8.len(var_40_32)
				local var_40_35 = var_40_33 <= 0 and var_40_29 or var_40_29 * (var_40_34 / var_40_33)

				if var_40_35 > 0 and var_40_29 < var_40_35 then
					arg_37_1.talkMaxDuration = var_40_35

					if var_40_35 + var_40_28 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_35 + var_40_28
					end
				end

				arg_37_1.text_.text = var_40_32
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891009", "story_v_out_319891.awb") ~= 0 then
					local var_40_36 = manager.audio:GetVoiceLength("story_v_out_319891", "319891009", "story_v_out_319891.awb") / 1000

					if var_40_36 + var_40_28 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_36 + var_40_28
					end

					if var_40_31.prefab_name ~= "" and arg_37_1.actors_[var_40_31.prefab_name] ~= nil then
						local var_40_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_31.prefab_name].transform, "story_v_out_319891", "319891009", "story_v_out_319891.awb")

						arg_37_1:RecordAudio("319891009", var_40_37)
						arg_37_1:RecordAudio("319891009", var_40_37)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_319891", "319891009", "story_v_out_319891.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_319891", "319891009", "story_v_out_319891.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_38 = math.max(var_40_29, arg_37_1.talkMaxDuration)

			if var_40_28 <= arg_37_1.time_ and arg_37_1.time_ < var_40_28 + var_40_38 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_28) / var_40_38

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_28 + var_40_38 and arg_37_1.time_ < var_40_28 + var_40_38 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play319891010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 319891010
		arg_41_1.duration_ = 4.199999999999

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play319891011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1084ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos1084ui_story = var_44_0.localPosition
			end

			local var_44_2 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2
				local var_44_4 = Vector3.New(0, 100, 0)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1084ui_story, var_44_4, var_44_3)

				local var_44_5 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_5.x, var_44_5.y, var_44_5.z)

				local var_44_6 = var_44_0.localEulerAngles

				var_44_6.z = 0
				var_44_6.x = 0
				var_44_0.localEulerAngles = var_44_6
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(0, 100, 0)

				local var_44_7 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_7.x, var_44_7.y, var_44_7.z)

				local var_44_8 = var_44_0.localEulerAngles

				var_44_8.z = 0
				var_44_8.x = 0
				var_44_0.localEulerAngles = var_44_8
			end

			local var_44_9 = arg_41_1.actors_["1095ui_story"].transform
			local var_44_10 = 0

			if var_44_10 < arg_41_1.time_ and arg_41_1.time_ <= var_44_10 + arg_44_0 then
				arg_41_1.var_.moveOldPos1095ui_story = var_44_9.localPosition
			end

			local var_44_11 = 0.001

			if var_44_10 <= arg_41_1.time_ and arg_41_1.time_ < var_44_10 + var_44_11 then
				local var_44_12 = (arg_41_1.time_ - var_44_10) / var_44_11
				local var_44_13 = Vector3.New(0, 100, 0)

				var_44_9.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1095ui_story, var_44_13, var_44_12)

				local var_44_14 = manager.ui.mainCamera.transform.position - var_44_9.position

				var_44_9.forward = Vector3.New(var_44_14.x, var_44_14.y, var_44_14.z)

				local var_44_15 = var_44_9.localEulerAngles

				var_44_15.z = 0
				var_44_15.x = 0
				var_44_9.localEulerAngles = var_44_15
			end

			if arg_41_1.time_ >= var_44_10 + var_44_11 and arg_41_1.time_ < var_44_10 + var_44_11 + arg_44_0 then
				var_44_9.localPosition = Vector3.New(0, 100, 0)

				local var_44_16 = manager.ui.mainCamera.transform.position - var_44_9.position

				var_44_9.forward = Vector3.New(var_44_16.x, var_44_16.y, var_44_16.z)

				local var_44_17 = var_44_9.localEulerAngles

				var_44_17.z = 0
				var_44_17.x = 0
				var_44_9.localEulerAngles = var_44_17
			end

			local var_44_18 = 0

			if var_44_18 < arg_41_1.time_ and arg_41_1.time_ <= var_44_18 + arg_44_0 then
				local var_44_19 = arg_41_1.fswbg_.transform:Find("textbox/adapt/content") or arg_41_1.fswbg_.transform:Find("textbox/content")
				local var_44_20 = var_44_19:GetComponent("Text")
				local var_44_21 = var_44_19:GetComponent("RectTransform")

				var_44_20.alignment = UnityEngine.TextAnchor.LowerCenter
				var_44_21.offsetMin = Vector2.New(0, 0)
				var_44_21.offsetMax = Vector2.New(0, 0)
			end

			local var_44_22 = 0

			if var_44_22 < arg_41_1.time_ and arg_41_1.time_ <= var_44_22 + arg_44_0 then
				arg_41_1.fswbg_:SetActive(true)
				arg_41_1.dialog_:SetActive(false)

				arg_41_1.fswtw_.percent = 0

				local var_44_23 = arg_41_1:GetWordFromCfg(319891010)
				local var_44_24 = arg_41_1:FormatText(var_44_23.content)

				arg_41_1.fswt_.text = var_44_24

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.fswt_)

				arg_41_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_41_1.fswtw_:SetDirty()

				arg_41_1.typewritterCharCountI18N = 0

				SetActive(arg_41_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_41_1:ShowNextGo(false)
			end

			local var_44_25 = 0.5

			if var_44_25 < arg_41_1.time_ and arg_41_1.time_ <= var_44_25 + arg_44_0 then
				arg_41_1.var_.oldValueTypewriter = arg_41_1.fswtw_.percent

				arg_41_1:ShowNextGo(false)
			end

			local var_44_26 = 22
			local var_44_27 = 1.46666666666667
			local var_44_28 = arg_41_1:GetWordFromCfg(319891010)
			local var_44_29 = arg_41_1:FormatText(var_44_28.content)
			local var_44_30, var_44_31 = arg_41_1:GetPercentByPara(var_44_29, 1)

			if var_44_25 < arg_41_1.time_ and arg_41_1.time_ <= var_44_25 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0

				local var_44_32 = var_44_26 <= 0 and var_44_27 or var_44_27 * ((var_44_31 - arg_41_1.typewritterCharCountI18N) / var_44_26)

				if var_44_32 > 0 and var_44_27 < var_44_32 then
					arg_41_1.talkMaxDuration = var_44_32

					if var_44_32 + var_44_25 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_32 + var_44_25
					end
				end
			end

			local var_44_33 = 1.46666666666667
			local var_44_34 = math.max(var_44_33, arg_41_1.talkMaxDuration)

			if var_44_25 <= arg_41_1.time_ and arg_41_1.time_ < var_44_25 + var_44_34 then
				local var_44_35 = (arg_41_1.time_ - var_44_25) / var_44_34

				arg_41_1.fswtw_.percent = Mathf.Lerp(arg_41_1.var_.oldValueTypewriter, var_44_30, var_44_35)
				arg_41_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_41_1.fswtw_:SetDirty()
			end

			if arg_41_1.time_ >= var_44_25 + var_44_34 and arg_41_1.time_ < var_44_25 + var_44_34 + arg_44_0 then
				arg_41_1.fswtw_.percent = var_44_30

				arg_41_1.fswtw_:SetDirty()
				arg_41_1:ShowNextGo(true)

				arg_41_1.typewritterCharCountI18N = var_44_31
			end

			local var_44_36 = 0

			if var_44_36 < arg_41_1.time_ and arg_41_1.time_ <= var_44_36 + arg_44_0 then
				local var_44_37 = manager.ui.mainCamera.transform.localPosition
				local var_44_38 = Vector3.New(0, 0, 10) + Vector3.New(var_44_37.x, var_44_37.y, 0)
				local var_44_39 = arg_41_1.bgs_.STblack

				var_44_39.transform.localPosition = var_44_38
				var_44_39.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_44_40 = var_44_39:GetComponent("SpriteRenderer")

				if var_44_40 and var_44_40.sprite then
					local var_44_41 = (var_44_39.transform.localPosition - var_44_37).z
					local var_44_42 = manager.ui.mainCameraCom_
					local var_44_43 = 2 * var_44_41 * Mathf.Tan(var_44_42.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_44_44 = var_44_43 * var_44_42.aspect
					local var_44_45 = var_44_40.sprite.bounds.size.x
					local var_44_46 = var_44_40.sprite.bounds.size.y
					local var_44_47 = var_44_44 / var_44_45
					local var_44_48 = var_44_43 / var_44_46
					local var_44_49 = var_44_48 < var_44_47 and var_44_47 or var_44_48

					var_44_39.transform.localScale = Vector3.New(var_44_49, var_44_49, 0)
				end

				for iter_44_0, iter_44_1 in pairs(arg_41_1.bgs_) do
					if iter_44_0 ~= "STblack" then
						iter_44_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_44_50 = 0.5
			local var_44_51 = 3.7
			local var_44_52 = manager.audio:GetVoiceLength("story_v_out_319891", "319891010", "story_v_out_319891.awb") / 1000

			if var_44_52 > 0 and var_44_51 < var_44_52 and var_44_52 + var_44_50 > arg_41_1.duration_ then
				local var_44_53 = var_44_52

				arg_41_1.duration_ = var_44_52 + var_44_50
			end

			if var_44_50 < arg_41_1.time_ and arg_41_1.time_ <= var_44_50 + arg_44_0 then
				local var_44_54 = "play"
				local var_44_55 = "voice"

				arg_41_1:AudioAction(var_44_54, var_44_55, "story_v_out_319891", "319891010", "story_v_out_319891.awb")
			end

			local var_44_56 = 0

			if var_44_56 < arg_41_1.time_ and arg_41_1.time_ <= var_44_56 + arg_44_0 then
				arg_41_1.cswbg_:SetActive(true)

				local var_44_57 = arg_41_1.cswt_:GetComponent("RectTransform")

				arg_41_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_44_57.offsetMin = Vector2.New(410, 330)
				var_44_57.offsetMax = Vector2.New(-400, -180)

				local var_44_58 = arg_41_1:GetWordFromCfg(419066)
				local var_44_59 = arg_41_1:FormatText(var_44_58.content)

				arg_41_1.cswt_.text = var_44_59

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.cswt_)

				arg_41_1.cswt_.fontSize = 177
				arg_41_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_41_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 319891011
		arg_45_1.duration_ = 5.449999999999

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play319891012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				local var_48_1 = manager.ui.mainCamera.transform.localPosition
				local var_48_2 = Vector3.New(0, 0, 10) + Vector3.New(var_48_1.x, var_48_1.y, 0)
				local var_48_3 = arg_45_1.bgs_.ST15a

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
					if iter_48_0 ~= "ST15a" then
						iter_48_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 then
				arg_45_1.fswbg_:SetActive(false)
				arg_45_1.dialog_:SetActive(false)
				arg_45_1:ShowNextGo(false)
			end

			local var_48_15 = 0.1

			if var_48_15 < arg_45_1.time_ and arg_45_1.time_ <= var_48_15 + arg_48_0 then
				arg_45_1.fswbg_:SetActive(false)
				arg_45_1.dialog_:SetActive(false)
				arg_45_1:ShowNextGo(false)
			end

			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 then
				arg_45_1.cswbg_:SetActive(false)
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_17 = 0.449999999999
			local var_48_18 = 0.55

			if var_48_17 < arg_45_1.time_ and arg_45_1.time_ <= var_48_17 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_19 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_19:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_19:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_19:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_20 = arg_45_1:GetWordFromCfg(319891011)
				local var_48_21 = arg_45_1:FormatText(var_48_20.content)

				arg_45_1.text_.text = var_48_21

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_22 = 22
				local var_48_23 = utf8.len(var_48_21)
				local var_48_24 = var_48_22 <= 0 and var_48_18 or var_48_18 * (var_48_23 / var_48_22)

				if var_48_24 > 0 and var_48_18 < var_48_24 then
					arg_45_1.talkMaxDuration = var_48_24
					var_48_17 = var_48_17 + 0.3

					if var_48_24 + var_48_17 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_24 + var_48_17
					end
				end

				arg_45_1.text_.text = var_48_21
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_25 = var_48_17 + 0.3
			local var_48_26 = math.max(var_48_18, arg_45_1.talkMaxDuration)

			if var_48_25 <= arg_45_1.time_ and arg_45_1.time_ < var_48_25 + var_48_26 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_25) / var_48_26

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_25 + var_48_26 and arg_45_1.time_ < var_48_25 + var_48_26 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play319891012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319891012
		arg_51_1.duration_ = 5.333

		local var_51_0 = {
			zh = 3.633,
			ja = 5.333
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
				arg_51_0:Play319891013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "1029ui_story"

			if arg_51_1.actors_[var_54_0] == nil then
				local var_54_1 = Object.Instantiate(Asset.Load("Char/" .. var_54_0), arg_51_1.stage_.transform)

				var_54_1.name = var_54_0
				var_54_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.actors_[var_54_0] = var_54_1

				local var_54_2 = var_54_1:GetComponentInChildren(typeof(CharacterEffect))

				var_54_2.enabled = true

				local var_54_3 = GameObjectTools.GetOrAddComponent(var_54_1, typeof(DynamicBoneHelper))

				if var_54_3 then
					var_54_3:EnableDynamicBone(false)
				end

				arg_51_1:ShowWeapon(var_54_2.transform, false)

				arg_51_1.var_[var_54_0 .. "Animator"] = var_54_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_51_1.var_[var_54_0 .. "Animator"].applyRootMotion = true
				arg_51_1.var_[var_54_0 .. "LipSync"] = var_54_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_54_4 = arg_51_1.actors_["1029ui_story"].transform
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 then
				arg_51_1.var_.moveOldPos1029ui_story = var_54_4.localPosition

				local var_54_6 = "1029ui_story"

				arg_51_1:ShowWeapon(arg_51_1.var_[var_54_6 .. "Animator"].transform, false)
			end

			local var_54_7 = 0.001

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_7 then
				local var_54_8 = (arg_51_1.time_ - var_54_5) / var_54_7
				local var_54_9 = Vector3.New(0.7, -1.09, -6.2)

				var_54_4.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1029ui_story, var_54_9, var_54_8)

				local var_54_10 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_10.x, var_54_10.y, var_54_10.z)

				local var_54_11 = var_54_4.localEulerAngles

				var_54_11.z = 0
				var_54_11.x = 0
				var_54_4.localEulerAngles = var_54_11
			end

			if arg_51_1.time_ >= var_54_5 + var_54_7 and arg_51_1.time_ < var_54_5 + var_54_7 + arg_54_0 then
				var_54_4.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_54_12 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_12.x, var_54_12.y, var_54_12.z)

				local var_54_13 = var_54_4.localEulerAngles

				var_54_13.z = 0
				var_54_13.x = 0
				var_54_4.localEulerAngles = var_54_13
			end

			local var_54_14 = arg_51_1.actors_["1029ui_story"]
			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 and arg_51_1.var_.characterEffect1029ui_story == nil then
				arg_51_1.var_.characterEffect1029ui_story = var_54_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_16 = 0.200000002980232

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_16 then
				local var_54_17 = (arg_51_1.time_ - var_54_15) / var_54_16

				if arg_51_1.var_.characterEffect1029ui_story then
					arg_51_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_15 + var_54_16 and arg_51_1.time_ < var_54_15 + var_54_16 + arg_54_0 and arg_51_1.var_.characterEffect1029ui_story then
				arg_51_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_54_18 = 0

			if var_54_18 < arg_51_1.time_ and arg_51_1.time_ <= var_54_18 + arg_54_0 then
				arg_51_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_54_19 = 0

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_54_20 = 0
			local var_54_21 = 0.475

			if var_54_20 < arg_51_1.time_ and arg_51_1.time_ <= var_54_20 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_22 = arg_51_1:FormatText(StoryNameCfg[319].name)

				arg_51_1.leftNameTxt_.text = var_54_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_23 = arg_51_1:GetWordFromCfg(319891012)
				local var_54_24 = arg_51_1:FormatText(var_54_23.content)

				arg_51_1.text_.text = var_54_24

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_25 = 19
				local var_54_26 = utf8.len(var_54_24)
				local var_54_27 = var_54_25 <= 0 and var_54_21 or var_54_21 * (var_54_26 / var_54_25)

				if var_54_27 > 0 and var_54_21 < var_54_27 then
					arg_51_1.talkMaxDuration = var_54_27

					if var_54_27 + var_54_20 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_20
					end
				end

				arg_51_1.text_.text = var_54_24
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891012", "story_v_out_319891.awb") ~= 0 then
					local var_54_28 = manager.audio:GetVoiceLength("story_v_out_319891", "319891012", "story_v_out_319891.awb") / 1000

					if var_54_28 + var_54_20 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_28 + var_54_20
					end

					if var_54_23.prefab_name ~= "" and arg_51_1.actors_[var_54_23.prefab_name] ~= nil then
						local var_54_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_23.prefab_name].transform, "story_v_out_319891", "319891012", "story_v_out_319891.awb")

						arg_51_1:RecordAudio("319891012", var_54_29)
						arg_51_1:RecordAudio("319891012", var_54_29)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319891", "319891012", "story_v_out_319891.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319891", "319891012", "story_v_out_319891.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_30 = math.max(var_54_21, arg_51_1.talkMaxDuration)

			if var_54_20 <= arg_51_1.time_ and arg_51_1.time_ < var_54_20 + var_54_30 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_20) / var_54_30

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_20 + var_54_30 and arg_51_1.time_ < var_54_20 + var_54_30 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319891013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319891013
		arg_55_1.duration_ = 8.49966666666667

		local var_55_0 = {
			zh = 5.36666666666667,
			ja = 8.49966666666667
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
				arg_55_0:Play319891014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1084ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1084ui_story = var_58_0.localPosition

				local var_58_2 = "1084ui_story"

				arg_55_1:ShowWeapon(arg_55_1.var_[var_58_2 .. "Animator"].transform, false)
			end

			local var_58_3 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_3 then
				local var_58_4 = (arg_55_1.time_ - var_58_1) / var_58_3
				local var_58_5 = Vector3.New(-0.7, -0.97, -6)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1084ui_story, var_58_5, var_58_4)

				local var_58_6 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_6.x, var_58_6.y, var_58_6.z)

				local var_58_7 = var_58_0.localEulerAngles

				var_58_7.z = 0
				var_58_7.x = 0
				var_58_0.localEulerAngles = var_58_7
			end

			if arg_55_1.time_ >= var_58_1 + var_58_3 and arg_55_1.time_ < var_58_1 + var_58_3 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_58_8 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_8.x, var_58_8.y, var_58_8.z)

				local var_58_9 = var_58_0.localEulerAngles

				var_58_9.z = 0
				var_58_9.x = 0
				var_58_0.localEulerAngles = var_58_9
			end

			local var_58_10 = arg_55_1.actors_["1084ui_story"]
			local var_58_11 = 0

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1084ui_story == nil then
				arg_55_1.var_.characterEffect1084ui_story = var_58_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_12 = 0.200000002980232

			if var_58_11 <= arg_55_1.time_ and arg_55_1.time_ < var_58_11 + var_58_12 then
				local var_58_13 = (arg_55_1.time_ - var_58_11) / var_58_12

				if arg_55_1.var_.characterEffect1084ui_story then
					arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_11 + var_58_12 and arg_55_1.time_ < var_58_11 + var_58_12 + arg_58_0 and arg_55_1.var_.characterEffect1084ui_story then
				arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_58_15 = arg_55_1.actors_["1029ui_story"]
			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 and arg_55_1.var_.characterEffect1029ui_story == nil then
				arg_55_1.var_.characterEffect1029ui_story = var_58_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_17 = 0.200000002980232

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17

				if arg_55_1.var_.characterEffect1029ui_story then
					local var_58_19 = Mathf.Lerp(0, 0.5, var_58_18)

					arg_55_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1029ui_story.fillRatio = var_58_19
				end
			end

			if arg_55_1.time_ >= var_58_16 + var_58_17 and arg_55_1.time_ < var_58_16 + var_58_17 + arg_58_0 and arg_55_1.var_.characterEffect1029ui_story then
				local var_58_20 = 0.5

				arg_55_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1029ui_story.fillRatio = var_58_20
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_21 = 0.666666666666667
			local var_58_22 = 0.625

			if var_58_21 < arg_55_1.time_ and arg_55_1.time_ <= var_58_21 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_23 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_23:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_24 = arg_55_1:FormatText(StoryNameCfg[6].name)

				arg_55_1.leftNameTxt_.text = var_58_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_25 = arg_55_1:GetWordFromCfg(319891013)
				local var_58_26 = arg_55_1:FormatText(var_58_25.content)

				arg_55_1.text_.text = var_58_26

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_27 = 25
				local var_58_28 = utf8.len(var_58_26)
				local var_58_29 = var_58_27 <= 0 and var_58_22 or var_58_22 * (var_58_28 / var_58_27)

				if var_58_29 > 0 and var_58_22 < var_58_29 then
					arg_55_1.talkMaxDuration = var_58_29
					var_58_21 = var_58_21 + 0.3

					if var_58_29 + var_58_21 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_29 + var_58_21
					end
				end

				arg_55_1.text_.text = var_58_26
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891013", "story_v_out_319891.awb") ~= 0 then
					local var_58_30 = manager.audio:GetVoiceLength("story_v_out_319891", "319891013", "story_v_out_319891.awb") / 1000

					if var_58_30 + var_58_21 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_30 + var_58_21
					end

					if var_58_25.prefab_name ~= "" and arg_55_1.actors_[var_58_25.prefab_name] ~= nil then
						local var_58_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_25.prefab_name].transform, "story_v_out_319891", "319891013", "story_v_out_319891.awb")

						arg_55_1:RecordAudio("319891013", var_58_31)
						arg_55_1:RecordAudio("319891013", var_58_31)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_319891", "319891013", "story_v_out_319891.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_319891", "319891013", "story_v_out_319891.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_32 = var_58_21 + 0.3
			local var_58_33 = math.max(var_58_22, arg_55_1.talkMaxDuration)

			if var_58_32 <= arg_55_1.time_ and arg_55_1.time_ < var_58_32 + var_58_33 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_32) / var_58_33

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_32 + var_58_33 and arg_55_1.time_ < var_58_32 + var_58_33 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play319891014 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319891014
		arg_61_1.duration_ = 2.5

		local var_61_0 = {
			zh = 1.766,
			ja = 2.5
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
				arg_61_0:Play319891015(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1029ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect1029ui_story == nil then
				arg_61_1.var_.characterEffect1029ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.200000002980232

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1029ui_story then
					arg_61_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect1029ui_story then
				arg_61_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["1084ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and arg_61_1.var_.characterEffect1084ui_story == nil then
				arg_61_1.var_.characterEffect1084ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.200000002980232

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect1084ui_story then
					local var_64_8 = Mathf.Lerp(0, 0.5, var_64_7)

					arg_61_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1084ui_story.fillRatio = var_64_8
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and arg_61_1.var_.characterEffect1084ui_story then
				local var_64_9 = 0.5

				arg_61_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1084ui_story.fillRatio = var_64_9
			end

			local var_64_10 = 0
			local var_64_11 = 0.225

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_12 = arg_61_1:FormatText(StoryNameCfg[319].name)

				arg_61_1.leftNameTxt_.text = var_64_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_13 = arg_61_1:GetWordFromCfg(319891014)
				local var_64_14 = arg_61_1:FormatText(var_64_13.content)

				arg_61_1.text_.text = var_64_14

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_15 = 9
				local var_64_16 = utf8.len(var_64_14)
				local var_64_17 = var_64_15 <= 0 and var_64_11 or var_64_11 * (var_64_16 / var_64_15)

				if var_64_17 > 0 and var_64_11 < var_64_17 then
					arg_61_1.talkMaxDuration = var_64_17

					if var_64_17 + var_64_10 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_17 + var_64_10
					end
				end

				arg_61_1.text_.text = var_64_14
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891014", "story_v_out_319891.awb") ~= 0 then
					local var_64_18 = manager.audio:GetVoiceLength("story_v_out_319891", "319891014", "story_v_out_319891.awb") / 1000

					if var_64_18 + var_64_10 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_18 + var_64_10
					end

					if var_64_13.prefab_name ~= "" and arg_61_1.actors_[var_64_13.prefab_name] ~= nil then
						local var_64_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_13.prefab_name].transform, "story_v_out_319891", "319891014", "story_v_out_319891.awb")

						arg_61_1:RecordAudio("319891014", var_64_19)
						arg_61_1:RecordAudio("319891014", var_64_19)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_319891", "319891014", "story_v_out_319891.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_319891", "319891014", "story_v_out_319891.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_20 = math.max(var_64_11, arg_61_1.talkMaxDuration)

			if var_64_10 <= arg_61_1.time_ and arg_61_1.time_ < var_64_10 + var_64_20 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_10) / var_64_20

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_10 + var_64_20 and arg_61_1.time_ < var_64_10 + var_64_20 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play319891015 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319891015
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play319891016(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1029ui_story"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos1029ui_story = var_68_0.localPosition
			end

			local var_68_2 = 0.001

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2
				local var_68_4 = Vector3.New(0, 100, 0)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1029ui_story, var_68_4, var_68_3)

				local var_68_5 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_5.x, var_68_5.y, var_68_5.z)

				local var_68_6 = var_68_0.localEulerAngles

				var_68_6.z = 0
				var_68_6.x = 0
				var_68_0.localEulerAngles = var_68_6
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(0, 100, 0)

				local var_68_7 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_7.x, var_68_7.y, var_68_7.z)

				local var_68_8 = var_68_0.localEulerAngles

				var_68_8.z = 0
				var_68_8.x = 0
				var_68_0.localEulerAngles = var_68_8
			end

			local var_68_9 = arg_65_1.actors_["1029ui_story"]
			local var_68_10 = 0

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 and arg_65_1.var_.characterEffect1029ui_story == nil then
				arg_65_1.var_.characterEffect1029ui_story = var_68_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_11 = 0.200000002980232

			if var_68_10 <= arg_65_1.time_ and arg_65_1.time_ < var_68_10 + var_68_11 then
				local var_68_12 = (arg_65_1.time_ - var_68_10) / var_68_11

				if arg_65_1.var_.characterEffect1029ui_story then
					local var_68_13 = Mathf.Lerp(0, 0.5, var_68_12)

					arg_65_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1029ui_story.fillRatio = var_68_13
				end
			end

			if arg_65_1.time_ >= var_68_10 + var_68_11 and arg_65_1.time_ < var_68_10 + var_68_11 + arg_68_0 and arg_65_1.var_.characterEffect1029ui_story then
				local var_68_14 = 0.5

				arg_65_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1029ui_story.fillRatio = var_68_14
			end

			local var_68_15 = arg_65_1.actors_["1084ui_story"].transform
			local var_68_16 = 0

			if var_68_16 < arg_65_1.time_ and arg_65_1.time_ <= var_68_16 + arg_68_0 then
				arg_65_1.var_.moveOldPos1084ui_story = var_68_15.localPosition
			end

			local var_68_17 = 0.001

			if var_68_16 <= arg_65_1.time_ and arg_65_1.time_ < var_68_16 + var_68_17 then
				local var_68_18 = (arg_65_1.time_ - var_68_16) / var_68_17
				local var_68_19 = Vector3.New(0, 100, 0)

				var_68_15.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1084ui_story, var_68_19, var_68_18)

				local var_68_20 = manager.ui.mainCamera.transform.position - var_68_15.position

				var_68_15.forward = Vector3.New(var_68_20.x, var_68_20.y, var_68_20.z)

				local var_68_21 = var_68_15.localEulerAngles

				var_68_21.z = 0
				var_68_21.x = 0
				var_68_15.localEulerAngles = var_68_21
			end

			if arg_65_1.time_ >= var_68_16 + var_68_17 and arg_65_1.time_ < var_68_16 + var_68_17 + arg_68_0 then
				var_68_15.localPosition = Vector3.New(0, 100, 0)

				local var_68_22 = manager.ui.mainCamera.transform.position - var_68_15.position

				var_68_15.forward = Vector3.New(var_68_22.x, var_68_22.y, var_68_22.z)

				local var_68_23 = var_68_15.localEulerAngles

				var_68_23.z = 0
				var_68_23.x = 0
				var_68_15.localEulerAngles = var_68_23
			end

			local var_68_24 = arg_65_1.actors_["1084ui_story"]
			local var_68_25 = 0

			if var_68_25 < arg_65_1.time_ and arg_65_1.time_ <= var_68_25 + arg_68_0 and arg_65_1.var_.characterEffect1084ui_story == nil then
				arg_65_1.var_.characterEffect1084ui_story = var_68_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_26 = 0.200000002980232

			if var_68_25 <= arg_65_1.time_ and arg_65_1.time_ < var_68_25 + var_68_26 then
				local var_68_27 = (arg_65_1.time_ - var_68_25) / var_68_26

				if arg_65_1.var_.characterEffect1084ui_story then
					local var_68_28 = Mathf.Lerp(0, 0.5, var_68_27)

					arg_65_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1084ui_story.fillRatio = var_68_28
				end
			end

			if arg_65_1.time_ >= var_68_25 + var_68_26 and arg_65_1.time_ < var_68_25 + var_68_26 + arg_68_0 and arg_65_1.var_.characterEffect1084ui_story then
				local var_68_29 = 0.5

				arg_65_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1084ui_story.fillRatio = var_68_29
			end

			local var_68_30 = 0
			local var_68_31 = 1.175

			if var_68_30 < arg_65_1.time_ and arg_65_1.time_ <= var_68_30 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_32 = arg_65_1:GetWordFromCfg(319891015)
				local var_68_33 = arg_65_1:FormatText(var_68_32.content)

				arg_65_1.text_.text = var_68_33

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_34 = 47
				local var_68_35 = utf8.len(var_68_33)
				local var_68_36 = var_68_34 <= 0 and var_68_31 or var_68_31 * (var_68_35 / var_68_34)

				if var_68_36 > 0 and var_68_31 < var_68_36 then
					arg_65_1.talkMaxDuration = var_68_36

					if var_68_36 + var_68_30 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_36 + var_68_30
					end
				end

				arg_65_1.text_.text = var_68_33
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_37 = math.max(var_68_31, arg_65_1.talkMaxDuration)

			if var_68_30 <= arg_65_1.time_ and arg_65_1.time_ < var_68_30 + var_68_37 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_30) / var_68_37

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_30 + var_68_37 and arg_65_1.time_ < var_68_30 + var_68_37 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play319891016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319891016
		arg_69_1.duration_ = 3.532999999999

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play319891017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1084ui_story"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1084ui_story = var_72_0.localPosition
			end

			local var_72_2 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2
				local var_72_4 = Vector3.New(0, 100, 0)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1084ui_story, var_72_4, var_72_3)

				local var_72_5 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_5.x, var_72_5.y, var_72_5.z)

				local var_72_6 = var_72_0.localEulerAngles

				var_72_6.z = 0
				var_72_6.x = 0
				var_72_0.localEulerAngles = var_72_6
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(0, 100, 0)

				local var_72_7 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_7.x, var_72_7.y, var_72_7.z)

				local var_72_8 = var_72_0.localEulerAngles

				var_72_8.z = 0
				var_72_8.x = 0
				var_72_0.localEulerAngles = var_72_8
			end

			local var_72_9 = 0

			if var_72_9 < arg_69_1.time_ and arg_69_1.time_ <= var_72_9 + arg_72_0 then
				local var_72_10 = arg_69_1.fswbg_.transform:Find("textbox/adapt/content") or arg_69_1.fswbg_.transform:Find("textbox/content")
				local var_72_11 = var_72_10:GetComponent("Text")
				local var_72_12 = var_72_10:GetComponent("RectTransform")

				var_72_11.alignment = UnityEngine.TextAnchor.LowerCenter
				var_72_12.offsetMin = Vector2.New(0, 0)
				var_72_12.offsetMax = Vector2.New(0, 0)
			end

			local var_72_13 = 0

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1.fswbg_:SetActive(true)
				arg_69_1.dialog_:SetActive(false)

				arg_69_1.fswtw_.percent = 0

				local var_72_14 = arg_69_1:GetWordFromCfg(319891016)
				local var_72_15 = arg_69_1:FormatText(var_72_14.content)

				arg_69_1.fswt_.text = var_72_15

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.fswt_)

				arg_69_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_69_1.fswtw_:SetDirty()

				arg_69_1.typewritterCharCountI18N = 0

				SetActive(arg_69_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_69_1:ShowNextGo(false)
			end

			local var_72_16 = 1.3

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 then
				arg_69_1.var_.oldValueTypewriter = arg_69_1.fswtw_.percent

				arg_69_1:ShowNextGo(false)
			end

			local var_72_17 = 9
			local var_72_18 = 0.6
			local var_72_19 = arg_69_1:GetWordFromCfg(319891016)
			local var_72_20 = arg_69_1:FormatText(var_72_19.content)
			local var_72_21, var_72_22 = arg_69_1:GetPercentByPara(var_72_20, 1)

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				local var_72_23 = var_72_17 <= 0 and var_72_18 or var_72_18 * ((var_72_22 - arg_69_1.typewritterCharCountI18N) / var_72_17)

				if var_72_23 > 0 and var_72_18 < var_72_23 then
					arg_69_1.talkMaxDuration = var_72_23

					if var_72_23 + var_72_16 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_23 + var_72_16
					end
				end
			end

			local var_72_24 = 0.6
			local var_72_25 = math.max(var_72_24, arg_69_1.talkMaxDuration)

			if var_72_16 <= arg_69_1.time_ and arg_69_1.time_ < var_72_16 + var_72_25 then
				local var_72_26 = (arg_69_1.time_ - var_72_16) / var_72_25

				arg_69_1.fswtw_.percent = Mathf.Lerp(arg_69_1.var_.oldValueTypewriter, var_72_21, var_72_26)
				arg_69_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_69_1.fswtw_:SetDirty()
			end

			if arg_69_1.time_ >= var_72_16 + var_72_25 and arg_69_1.time_ < var_72_16 + var_72_25 + arg_72_0 then
				arg_69_1.fswtw_.percent = var_72_21

				arg_69_1.fswtw_:SetDirty()
				arg_69_1:ShowNextGo(true)

				arg_69_1.typewritterCharCountI18N = var_72_22
			end

			local var_72_27 = 0

			if var_72_27 < arg_69_1.time_ and arg_69_1.time_ <= var_72_27 + arg_72_0 then
				local var_72_28 = manager.ui.mainCamera.transform.localPosition
				local var_72_29 = Vector3.New(0, 0, 10) + Vector3.New(var_72_28.x, var_72_28.y, 0)
				local var_72_30 = arg_69_1.bgs_.STblack

				var_72_30.transform.localPosition = var_72_29
				var_72_30.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_72_31 = var_72_30:GetComponent("SpriteRenderer")

				if var_72_31 and var_72_31.sprite then
					local var_72_32 = (var_72_30.transform.localPosition - var_72_28).z
					local var_72_33 = manager.ui.mainCameraCom_
					local var_72_34 = 2 * var_72_32 * Mathf.Tan(var_72_33.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_72_35 = var_72_34 * var_72_33.aspect
					local var_72_36 = var_72_31.sprite.bounds.size.x
					local var_72_37 = var_72_31.sprite.bounds.size.y
					local var_72_38 = var_72_35 / var_72_36
					local var_72_39 = var_72_34 / var_72_37
					local var_72_40 = var_72_39 < var_72_38 and var_72_38 or var_72_39

					var_72_30.transform.localScale = Vector3.New(var_72_40, var_72_40, 0)
				end

				for iter_72_0, iter_72_1 in pairs(arg_69_1.bgs_) do
					if iter_72_0 ~= "STblack" then
						iter_72_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_72_41 = 1.3
			local var_72_42 = 2.233
			local var_72_43 = manager.audio:GetVoiceLength("story_v_out_319891", "319891016", "story_v_out_319891.awb") / 1000

			if var_72_43 > 0 and var_72_42 < var_72_43 and var_72_43 + var_72_41 > arg_69_1.duration_ then
				local var_72_44 = var_72_43

				arg_69_1.duration_ = var_72_43 + var_72_41
			end

			if var_72_41 < arg_69_1.time_ and arg_69_1.time_ <= var_72_41 + arg_72_0 then
				local var_72_45 = "play"
				local var_72_46 = "voice"

				arg_69_1:AudioAction(var_72_45, var_72_46, "story_v_out_319891", "319891016", "story_v_out_319891.awb")
			end

			local var_72_47 = 0

			if var_72_47 < arg_69_1.time_ and arg_69_1.time_ <= var_72_47 + arg_72_0 then
				arg_69_1.cswbg_:SetActive(true)

				local var_72_48 = arg_69_1.cswt_:GetComponent("RectTransform")

				arg_69_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_72_48.offsetMin = Vector2.New(0, 330)
				var_72_48.offsetMax = Vector2.New(0, -180)

				local var_72_49 = arg_69_1:GetWordFromCfg(419067)
				local var_72_50 = arg_69_1:FormatText(var_72_49.content)

				arg_69_1.cswt_.text = var_72_50

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.cswt_)

				arg_69_1.cswt_.fontSize = 175
				arg_69_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_69_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319891017
		arg_73_1.duration_ = 3.800000002979

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play319891018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = "10050ui_story"

			if arg_73_1.actors_[var_76_0] == nil then
				local var_76_1 = Object.Instantiate(Asset.Load("Char/" .. var_76_0), arg_73_1.stage_.transform)

				var_76_1.name = var_76_0
				var_76_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.actors_[var_76_0] = var_76_1

				local var_76_2 = var_76_1:GetComponentInChildren(typeof(CharacterEffect))

				var_76_2.enabled = true

				local var_76_3 = GameObjectTools.GetOrAddComponent(var_76_1, typeof(DynamicBoneHelper))

				if var_76_3 then
					var_76_3:EnableDynamicBone(false)
				end

				arg_73_1:ShowWeapon(var_76_2.transform, false)

				arg_73_1.var_[var_76_0 .. "Animator"] = var_76_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_73_1.var_[var_76_0 .. "Animator"].applyRootMotion = true
				arg_73_1.var_[var_76_0 .. "LipSync"] = var_76_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_76_4 = arg_73_1.actors_["10050ui_story"]
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 and arg_73_1.var_.characterEffect10050ui_story == nil then
				arg_73_1.var_.characterEffect10050ui_story = var_76_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_6 = 0.200000002980232

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6

				if arg_73_1.var_.characterEffect10050ui_story then
					local var_76_8 = Mathf.Lerp(0, 0.5, var_76_7)

					arg_73_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_73_1.var_.characterEffect10050ui_story.fillRatio = var_76_8
				end
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 and arg_73_1.var_.characterEffect10050ui_story then
				local var_76_9 = 0.5

				arg_73_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_73_1.var_.characterEffect10050ui_story.fillRatio = var_76_9
			end

			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1.fswbg_:SetActive(true)
				arg_73_1.dialog_:SetActive(false)

				arg_73_1.fswtw_.percent = 0

				local var_76_11 = arg_73_1:GetWordFromCfg(319891017)
				local var_76_12 = arg_73_1:FormatText(var_76_11.content)

				arg_73_1.fswt_.text = var_76_12

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.fswt_)

				arg_73_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_73_1.fswtw_:SetDirty()

				arg_73_1.typewritterCharCountI18N = 0

				SetActive(arg_73_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_73_1:ShowNextGo(false)
			end

			local var_76_13 = 0.200000002980232

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1.var_.oldValueTypewriter = arg_73_1.fswtw_.percent

				arg_73_1:ShowNextGo(false)
			end

			local var_76_14 = 16
			local var_76_15 = 1.06666666666667
			local var_76_16 = arg_73_1:GetWordFromCfg(319891017)
			local var_76_17 = arg_73_1:FormatText(var_76_16.content)
			local var_76_18, var_76_19 = arg_73_1:GetPercentByPara(var_76_17, 1)

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				local var_76_20 = var_76_14 <= 0 and var_76_15 or var_76_15 * ((var_76_19 - arg_73_1.typewritterCharCountI18N) / var_76_14)

				if var_76_20 > 0 and var_76_15 < var_76_20 then
					arg_73_1.talkMaxDuration = var_76_20

					if var_76_20 + var_76_13 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_13
					end
				end
			end

			local var_76_21 = 1.06666666666667
			local var_76_22 = math.max(var_76_21, arg_73_1.talkMaxDuration)

			if var_76_13 <= arg_73_1.time_ and arg_73_1.time_ < var_76_13 + var_76_22 then
				local var_76_23 = (arg_73_1.time_ - var_76_13) / var_76_22

				arg_73_1.fswtw_.percent = Mathf.Lerp(arg_73_1.var_.oldValueTypewriter, var_76_18, var_76_23)
				arg_73_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_73_1.fswtw_:SetDirty()
			end

			if arg_73_1.time_ >= var_76_13 + var_76_22 and arg_73_1.time_ < var_76_13 + var_76_22 + arg_76_0 then
				arg_73_1.fswtw_.percent = var_76_18

				arg_73_1.fswtw_:SetDirty()
				arg_73_1:ShowNextGo(true)

				arg_73_1.typewritterCharCountI18N = var_76_19
			end

			local var_76_24 = 0.200000002980232
			local var_76_25 = 3.6
			local var_76_26 = manager.audio:GetVoiceLength("story_v_out_319891", "319891017", "story_v_out_319891.awb") / 1000

			if var_76_26 > 0 and var_76_25 < var_76_26 and var_76_26 + var_76_24 > arg_73_1.duration_ then
				local var_76_27 = var_76_26

				arg_73_1.duration_ = var_76_26 + var_76_24
			end

			if var_76_24 < arg_73_1.time_ and arg_73_1.time_ <= var_76_24 + arg_76_0 then
				local var_76_28 = "play"
				local var_76_29 = "voice"

				arg_73_1:AudioAction(var_76_28, var_76_29, "story_v_out_319891", "319891017", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319891018
		arg_77_1.duration_ = 14.265999999999

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play319891019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.fswbg_:SetActive(true)
				arg_77_1.dialog_:SetActive(false)

				arg_77_1.fswtw_.percent = 0

				local var_80_1 = arg_77_1:GetWordFromCfg(319891018)
				local var_80_2 = arg_77_1:FormatText(var_80_1.content)

				arg_77_1.fswt_.text = var_80_2

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.fswt_)

				arg_77_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_77_1.fswtw_:SetDirty()

				arg_77_1.typewritterCharCountI18N = 0

				SetActive(arg_77_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_77_1:ShowNextGo(false)
			end

			local var_80_3 = 0.7

			if var_80_3 < arg_77_1.time_ and arg_77_1.time_ <= var_80_3 + arg_80_0 then
				arg_77_1.var_.oldValueTypewriter = arg_77_1.fswtw_.percent

				arg_77_1:ShowNextGo(false)
			end

			local var_80_4 = 48
			local var_80_5 = 3.2
			local var_80_6 = arg_77_1:GetWordFromCfg(319891018)
			local var_80_7 = arg_77_1:FormatText(var_80_6.content)
			local var_80_8, var_80_9 = arg_77_1:GetPercentByPara(var_80_7, 1)

			if var_80_3 < arg_77_1.time_ and arg_77_1.time_ <= var_80_3 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0

				local var_80_10 = var_80_4 <= 0 and var_80_5 or var_80_5 * ((var_80_9 - arg_77_1.typewritterCharCountI18N) / var_80_4)

				if var_80_10 > 0 and var_80_5 < var_80_10 then
					arg_77_1.talkMaxDuration = var_80_10

					if var_80_10 + var_80_3 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_10 + var_80_3
					end
				end
			end

			local var_80_11 = 3.2
			local var_80_12 = math.max(var_80_11, arg_77_1.talkMaxDuration)

			if var_80_3 <= arg_77_1.time_ and arg_77_1.time_ < var_80_3 + var_80_12 then
				local var_80_13 = (arg_77_1.time_ - var_80_3) / var_80_12

				arg_77_1.fswtw_.percent = Mathf.Lerp(arg_77_1.var_.oldValueTypewriter, var_80_8, var_80_13)
				arg_77_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_77_1.fswtw_:SetDirty()
			end

			if arg_77_1.time_ >= var_80_3 + var_80_12 and arg_77_1.time_ < var_80_3 + var_80_12 + arg_80_0 then
				arg_77_1.fswtw_.percent = var_80_8

				arg_77_1.fswtw_:SetDirty()
				arg_77_1:ShowNextGo(true)

				arg_77_1.typewritterCharCountI18N = var_80_9
			end

			local var_80_14 = 0.7
			local var_80_15 = 13.566
			local var_80_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891018", "story_v_out_319891.awb") / 1000

			if var_80_16 > 0 and var_80_15 < var_80_16 and var_80_16 + var_80_14 > arg_77_1.duration_ then
				local var_80_17 = var_80_16

				arg_77_1.duration_ = var_80_16 + var_80_14
			end

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				local var_80_18 = "play"
				local var_80_19 = "voice"

				arg_77_1:AudioAction(var_80_18, var_80_19, "story_v_out_319891", "319891018", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319891019
		arg_81_1.duration_ = 7.466000002979

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play319891020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.fswbg_:SetActive(true)
				arg_81_1.dialog_:SetActive(false)

				arg_81_1.fswtw_.percent = 0

				local var_84_1 = arg_81_1:GetWordFromCfg(319891019)
				local var_84_2 = arg_81_1:FormatText(var_84_1.content)

				arg_81_1.fswt_.text = var_84_2

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.fswt_)

				arg_81_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_81_1.fswtw_:SetDirty()

				arg_81_1.typewritterCharCountI18N = 0

				SetActive(arg_81_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_81_1:ShowNextGo(false)
			end

			local var_84_3 = 0.200000002980232

			if var_84_3 < arg_81_1.time_ and arg_81_1.time_ <= var_84_3 + arg_84_0 then
				arg_81_1.var_.oldValueTypewriter = arg_81_1.fswtw_.percent

				arg_81_1:ShowNextGo(false)
			end

			local var_84_4 = 31
			local var_84_5 = 2.06666666666667
			local var_84_6 = arg_81_1:GetWordFromCfg(319891019)
			local var_84_7 = arg_81_1:FormatText(var_84_6.content)
			local var_84_8, var_84_9 = arg_81_1:GetPercentByPara(var_84_7, 1)

			if var_84_3 < arg_81_1.time_ and arg_81_1.time_ <= var_84_3 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0

				local var_84_10 = var_84_4 <= 0 and var_84_5 or var_84_5 * ((var_84_9 - arg_81_1.typewritterCharCountI18N) / var_84_4)

				if var_84_10 > 0 and var_84_5 < var_84_10 then
					arg_81_1.talkMaxDuration = var_84_10

					if var_84_10 + var_84_3 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_10 + var_84_3
					end
				end
			end

			local var_84_11 = 2.06666666666667
			local var_84_12 = math.max(var_84_11, arg_81_1.talkMaxDuration)

			if var_84_3 <= arg_81_1.time_ and arg_81_1.time_ < var_84_3 + var_84_12 then
				local var_84_13 = (arg_81_1.time_ - var_84_3) / var_84_12

				arg_81_1.fswtw_.percent = Mathf.Lerp(arg_81_1.var_.oldValueTypewriter, var_84_8, var_84_13)
				arg_81_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_81_1.fswtw_:SetDirty()
			end

			if arg_81_1.time_ >= var_84_3 + var_84_12 and arg_81_1.time_ < var_84_3 + var_84_12 + arg_84_0 then
				arg_81_1.fswtw_.percent = var_84_8

				arg_81_1.fswtw_:SetDirty()
				arg_81_1:ShowNextGo(true)

				arg_81_1.typewritterCharCountI18N = var_84_9
			end

			local var_84_14 = 0.200000002980232
			local var_84_15 = 7.266
			local var_84_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891019", "story_v_out_319891.awb") / 1000

			if var_84_16 > 0 and var_84_15 < var_84_16 and var_84_16 + var_84_14 > arg_81_1.duration_ then
				local var_84_17 = var_84_16

				arg_81_1.duration_ = var_84_16 + var_84_14
			end

			if var_84_14 < arg_81_1.time_ and arg_81_1.time_ <= var_84_14 + arg_84_0 then
				local var_84_18 = "play"
				local var_84_19 = "voice"

				arg_81_1:AudioAction(var_84_18, var_84_19, "story_v_out_319891", "319891019", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 319891020
		arg_85_1.duration_ = 4.266666666666

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play319891021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.fswbg_:SetActive(true)
				arg_85_1.dialog_:SetActive(false)

				arg_85_1.fswtw_.percent = 0

				local var_88_1 = arg_85_1:GetWordFromCfg(319891020)
				local var_88_2 = arg_85_1:FormatText(var_88_1.content)

				arg_85_1.fswt_.text = var_88_2

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.fswt_)

				arg_85_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_85_1.fswtw_:SetDirty()

				arg_85_1.typewritterCharCountI18N = 0

				SetActive(arg_85_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_85_1:ShowNextGo(false)
			end

			local var_88_3 = 0.866666666666667

			if var_88_3 < arg_85_1.time_ and arg_85_1.time_ <= var_88_3 + arg_88_0 then
				arg_85_1.var_.oldValueTypewriter = arg_85_1.fswtw_.percent

				arg_85_1:ShowNextGo(false)
			end

			local var_88_4 = 13
			local var_88_5 = 0.866666666666667
			local var_88_6 = arg_85_1:GetWordFromCfg(319891020)
			local var_88_7 = arg_85_1:FormatText(var_88_6.content)
			local var_88_8, var_88_9 = arg_85_1:GetPercentByPara(var_88_7, 1)

			if var_88_3 < arg_85_1.time_ and arg_85_1.time_ <= var_88_3 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0

				local var_88_10 = var_88_4 <= 0 and var_88_5 or var_88_5 * ((var_88_9 - arg_85_1.typewritterCharCountI18N) / var_88_4)

				if var_88_10 > 0 and var_88_5 < var_88_10 then
					arg_85_1.talkMaxDuration = var_88_10

					if var_88_10 + var_88_3 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_10 + var_88_3
					end
				end
			end

			local var_88_11 = 0.866666666666667
			local var_88_12 = math.max(var_88_11, arg_85_1.talkMaxDuration)

			if var_88_3 <= arg_85_1.time_ and arg_85_1.time_ < var_88_3 + var_88_12 then
				local var_88_13 = (arg_85_1.time_ - var_88_3) / var_88_12

				arg_85_1.fswtw_.percent = Mathf.Lerp(arg_85_1.var_.oldValueTypewriter, var_88_8, var_88_13)
				arg_85_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_85_1.fswtw_:SetDirty()
			end

			if arg_85_1.time_ >= var_88_3 + var_88_12 and arg_85_1.time_ < var_88_3 + var_88_12 + arg_88_0 then
				arg_85_1.fswtw_.percent = var_88_8

				arg_85_1.fswtw_:SetDirty()
				arg_85_1:ShowNextGo(true)

				arg_85_1.typewritterCharCountI18N = var_88_9
			end

			local var_88_14 = 0.866666666666667
			local var_88_15 = 3.4
			local var_88_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891020", "story_v_out_319891.awb") / 1000

			if var_88_16 > 0 and var_88_15 < var_88_16 and var_88_16 + var_88_14 > arg_85_1.duration_ then
				local var_88_17 = var_88_16

				arg_85_1.duration_ = var_88_16 + var_88_14
			end

			if var_88_14 < arg_85_1.time_ and arg_85_1.time_ <= var_88_14 + arg_88_0 then
				local var_88_18 = "play"
				local var_88_19 = "voice"

				arg_85_1:AudioAction(var_88_18, var_88_19, "story_v_out_319891", "319891020", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 319891021
		arg_89_1.duration_ = 7.132999999999

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play319891022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				local var_92_1 = arg_89_1.fswbg_.transform:Find("textbox/adapt/content") or arg_89_1.fswbg_.transform:Find("textbox/content")
				local var_92_2 = var_92_1:GetComponent("Text")
				local var_92_3 = var_92_1:GetComponent("RectTransform")

				var_92_2.alignment = UnityEngine.TextAnchor.LowerCenter
				var_92_3.offsetMin = Vector2.New(0, 0)
				var_92_3.offsetMax = Vector2.New(0, 0)
			end

			local var_92_4 = 0

			if var_92_4 < arg_89_1.time_ and arg_89_1.time_ <= var_92_4 + arg_92_0 then
				arg_89_1.fswbg_:SetActive(true)
				arg_89_1.dialog_:SetActive(false)

				arg_89_1.fswtw_.percent = 0

				local var_92_5 = arg_89_1:GetWordFromCfg(319891021)
				local var_92_6 = arg_89_1:FormatText(var_92_5.content)

				arg_89_1.fswt_.text = var_92_6

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.fswt_)

				arg_89_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_89_1.fswtw_:SetDirty()

				arg_89_1.typewritterCharCountI18N = 0

				SetActive(arg_89_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_89_1:ShowNextGo(false)
			end

			local var_92_7 = 1

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 then
				arg_89_1.var_.oldValueTypewriter = arg_89_1.fswtw_.percent

				arg_89_1:ShowNextGo(false)
			end

			local var_92_8 = 25
			local var_92_9 = 1.66666666666667
			local var_92_10 = arg_89_1:GetWordFromCfg(319891021)
			local var_92_11 = arg_89_1:FormatText(var_92_10.content)
			local var_92_12, var_92_13 = arg_89_1:GetPercentByPara(var_92_11, 1)

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0

				local var_92_14 = var_92_8 <= 0 and var_92_9 or var_92_9 * ((var_92_13 - arg_89_1.typewritterCharCountI18N) / var_92_8)

				if var_92_14 > 0 and var_92_9 < var_92_14 then
					arg_89_1.talkMaxDuration = var_92_14

					if var_92_14 + var_92_7 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_14 + var_92_7
					end
				end
			end

			local var_92_15 = 1.66666666666667
			local var_92_16 = math.max(var_92_15, arg_89_1.talkMaxDuration)

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_16 then
				local var_92_17 = (arg_89_1.time_ - var_92_7) / var_92_16

				arg_89_1.fswtw_.percent = Mathf.Lerp(arg_89_1.var_.oldValueTypewriter, var_92_12, var_92_17)
				arg_89_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_89_1.fswtw_:SetDirty()
			end

			if arg_89_1.time_ >= var_92_7 + var_92_16 and arg_89_1.time_ < var_92_7 + var_92_16 + arg_92_0 then
				arg_89_1.fswtw_.percent = var_92_12

				arg_89_1.fswtw_:SetDirty()
				arg_89_1:ShowNextGo(true)

				arg_89_1.typewritterCharCountI18N = var_92_13
			end

			local var_92_18 = 0

			if var_92_18 < arg_89_1.time_ and arg_89_1.time_ <= var_92_18 + arg_92_0 then
				local var_92_19 = manager.ui.mainCamera.transform.localPosition
				local var_92_20 = Vector3.New(0, 0, 10) + Vector3.New(var_92_19.x, var_92_19.y, 0)
				local var_92_21 = arg_89_1.bgs_.STblack

				var_92_21.transform.localPosition = var_92_20
				var_92_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_92_22 = var_92_21:GetComponent("SpriteRenderer")

				if var_92_22 and var_92_22.sprite then
					local var_92_23 = (var_92_21.transform.localPosition - var_92_19).z
					local var_92_24 = manager.ui.mainCameraCom_
					local var_92_25 = 2 * var_92_23 * Mathf.Tan(var_92_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_92_26 = var_92_25 * var_92_24.aspect
					local var_92_27 = var_92_22.sprite.bounds.size.x
					local var_92_28 = var_92_22.sprite.bounds.size.y
					local var_92_29 = var_92_26 / var_92_27
					local var_92_30 = var_92_25 / var_92_28
					local var_92_31 = var_92_30 < var_92_29 and var_92_29 or var_92_30

					var_92_21.transform.localScale = Vector3.New(var_92_31, var_92_31, 0)
				end

				for iter_92_0, iter_92_1 in pairs(arg_89_1.bgs_) do
					if iter_92_0 ~= "STblack" then
						iter_92_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_92_32 = 1
			local var_92_33 = 6.133
			local var_92_34 = manager.audio:GetVoiceLength("story_v_out_319891", "319891021", "story_v_out_319891.awb") / 1000

			if var_92_34 > 0 and var_92_33 < var_92_34 and var_92_34 + var_92_32 > arg_89_1.duration_ then
				local var_92_35 = var_92_34

				arg_89_1.duration_ = var_92_34 + var_92_32
			end

			if var_92_32 < arg_89_1.time_ and arg_89_1.time_ <= var_92_32 + arg_92_0 then
				local var_92_36 = "play"
				local var_92_37 = "voice"

				arg_89_1:AudioAction(var_92_36, var_92_37, "story_v_out_319891", "319891021", "story_v_out_319891.awb")
			end

			local var_92_38 = 0

			if var_92_38 < arg_89_1.time_ and arg_89_1.time_ <= var_92_38 + arg_92_0 then
				arg_89_1.cswbg_:SetActive(true)

				local var_92_39 = arg_89_1.cswt_:GetComponent("RectTransform")

				arg_89_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_92_39.offsetMin = Vector2.New(0, 0)
				var_92_39.offsetMax = Vector2.New(0, 0)

				local var_92_40 = arg_89_1:GetWordFromCfg(419068)
				local var_92_41 = arg_89_1:FormatText(var_92_40.content)

				arg_89_1.cswt_.text = var_92_41

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.cswt_)

				arg_89_1.cswt_.fontSize = 130
				arg_89_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_89_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 319891022
		arg_93_1.duration_ = 2.733000002979

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play319891023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.fswbg_:SetActive(true)
				arg_93_1.dialog_:SetActive(false)

				arg_93_1.fswtw_.percent = 0

				local var_96_1 = arg_93_1:GetWordFromCfg(319891022)
				local var_96_2 = arg_93_1:FormatText(var_96_1.content)

				arg_93_1.fswt_.text = var_96_2

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.fswt_)

				arg_93_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_93_1.fswtw_:SetDirty()

				arg_93_1.typewritterCharCountI18N = 0

				SetActive(arg_93_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_93_1:ShowNextGo(false)
			end

			local var_96_3 = 0.200000002980232

			if var_96_3 < arg_93_1.time_ and arg_93_1.time_ <= var_96_3 + arg_96_0 then
				arg_93_1.var_.oldValueTypewriter = arg_93_1.fswtw_.percent

				arg_93_1:ShowNextGo(false)
			end

			local var_96_4 = 5
			local var_96_5 = 0.333333333333333
			local var_96_6 = arg_93_1:GetWordFromCfg(319891022)
			local var_96_7 = arg_93_1:FormatText(var_96_6.content)
			local var_96_8, var_96_9 = arg_93_1:GetPercentByPara(var_96_7, 1)

			if var_96_3 < arg_93_1.time_ and arg_93_1.time_ <= var_96_3 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0

				local var_96_10 = var_96_4 <= 0 and var_96_5 or var_96_5 * ((var_96_9 - arg_93_1.typewritterCharCountI18N) / var_96_4)

				if var_96_10 > 0 and var_96_5 < var_96_10 then
					arg_93_1.talkMaxDuration = var_96_10

					if var_96_10 + var_96_3 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_10 + var_96_3
					end
				end
			end

			local var_96_11 = 0.333333333333333
			local var_96_12 = math.max(var_96_11, arg_93_1.talkMaxDuration)

			if var_96_3 <= arg_93_1.time_ and arg_93_1.time_ < var_96_3 + var_96_12 then
				local var_96_13 = (arg_93_1.time_ - var_96_3) / var_96_12

				arg_93_1.fswtw_.percent = Mathf.Lerp(arg_93_1.var_.oldValueTypewriter, var_96_8, var_96_13)
				arg_93_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_93_1.fswtw_:SetDirty()
			end

			if arg_93_1.time_ >= var_96_3 + var_96_12 and arg_93_1.time_ < var_96_3 + var_96_12 + arg_96_0 then
				arg_93_1.fswtw_.percent = var_96_8

				arg_93_1.fswtw_:SetDirty()
				arg_93_1:ShowNextGo(true)

				arg_93_1.typewritterCharCountI18N = var_96_9
			end

			local var_96_14 = 0.200000002980232
			local var_96_15 = 2.533
			local var_96_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891022", "story_v_out_319891.awb") / 1000

			if var_96_16 > 0 and var_96_15 < var_96_16 and var_96_16 + var_96_14 > arg_93_1.duration_ then
				local var_96_17 = var_96_16

				arg_93_1.duration_ = var_96_16 + var_96_14
			end

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				local var_96_18 = "play"
				local var_96_19 = "voice"

				arg_93_1:AudioAction(var_96_18, var_96_19, "story_v_out_319891", "319891022", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 319891023
		arg_97_1.duration_ = 5.700000002979

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play319891024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.fswbg_:SetActive(true)
				arg_97_1.dialog_:SetActive(false)

				arg_97_1.fswtw_.percent = 0

				local var_100_1 = arg_97_1:GetWordFromCfg(319891023)
				local var_100_2 = arg_97_1:FormatText(var_100_1.content)

				arg_97_1.fswt_.text = var_100_2

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.fswt_)

				arg_97_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_97_1.fswtw_:SetDirty()

				arg_97_1.typewritterCharCountI18N = 0

				SetActive(arg_97_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_97_1:ShowNextGo(false)
			end

			local var_100_3 = 0.200000002980232

			if var_100_3 < arg_97_1.time_ and arg_97_1.time_ <= var_100_3 + arg_100_0 then
				arg_97_1.var_.oldValueTypewriter = arg_97_1.fswtw_.percent

				arg_97_1:ShowNextGo(false)
			end

			local var_100_4 = 17
			local var_100_5 = 1.13333333333333
			local var_100_6 = arg_97_1:GetWordFromCfg(319891023)
			local var_100_7 = arg_97_1:FormatText(var_100_6.content)
			local var_100_8, var_100_9 = arg_97_1:GetPercentByPara(var_100_7, 1)

			if var_100_3 < arg_97_1.time_ and arg_97_1.time_ <= var_100_3 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0

				local var_100_10 = var_100_4 <= 0 and var_100_5 or var_100_5 * ((var_100_9 - arg_97_1.typewritterCharCountI18N) / var_100_4)

				if var_100_10 > 0 and var_100_5 < var_100_10 then
					arg_97_1.talkMaxDuration = var_100_10

					if var_100_10 + var_100_3 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_10 + var_100_3
					end
				end
			end

			local var_100_11 = 1.13333333333333
			local var_100_12 = math.max(var_100_11, arg_97_1.talkMaxDuration)

			if var_100_3 <= arg_97_1.time_ and arg_97_1.time_ < var_100_3 + var_100_12 then
				local var_100_13 = (arg_97_1.time_ - var_100_3) / var_100_12

				arg_97_1.fswtw_.percent = Mathf.Lerp(arg_97_1.var_.oldValueTypewriter, var_100_8, var_100_13)
				arg_97_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_97_1.fswtw_:SetDirty()
			end

			if arg_97_1.time_ >= var_100_3 + var_100_12 and arg_97_1.time_ < var_100_3 + var_100_12 + arg_100_0 then
				arg_97_1.fswtw_.percent = var_100_8

				arg_97_1.fswtw_:SetDirty()
				arg_97_1:ShowNextGo(true)

				arg_97_1.typewritterCharCountI18N = var_100_9
			end

			local var_100_14 = 0.200000002980232
			local var_100_15 = 5.5
			local var_100_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891023", "story_v_out_319891.awb") / 1000

			if var_100_16 > 0 and var_100_15 < var_100_16 and var_100_16 + var_100_14 > arg_97_1.duration_ then
				local var_100_17 = var_100_16

				arg_97_1.duration_ = var_100_16 + var_100_14
			end

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				local var_100_18 = "play"
				local var_100_19 = "voice"

				arg_97_1:AudioAction(var_100_18, var_100_19, "story_v_out_319891", "319891023", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 319891024
		arg_101_1.duration_ = 2.300000002979

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play319891025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.fswbg_:SetActive(true)
				arg_101_1.dialog_:SetActive(false)

				arg_101_1.fswtw_.percent = 0

				local var_104_1 = arg_101_1:GetWordFromCfg(319891024)
				local var_104_2 = arg_101_1:FormatText(var_104_1.content)

				arg_101_1.fswt_.text = var_104_2

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.fswt_)

				arg_101_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_101_1.fswtw_:SetDirty()

				arg_101_1.typewritterCharCountI18N = 0

				SetActive(arg_101_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_101_1:ShowNextGo(false)
			end

			local var_104_3 = 0.200000002980232

			if var_104_3 < arg_101_1.time_ and arg_101_1.time_ <= var_104_3 + arg_104_0 then
				arg_101_1.var_.oldValueTypewriter = arg_101_1.fswtw_.percent

				arg_101_1:ShowNextGo(false)
			end

			local var_104_4 = 11
			local var_104_5 = 0.733333333333333
			local var_104_6 = arg_101_1:GetWordFromCfg(319891024)
			local var_104_7 = arg_101_1:FormatText(var_104_6.content)
			local var_104_8, var_104_9 = arg_101_1:GetPercentByPara(var_104_7, 1)

			if var_104_3 < arg_101_1.time_ and arg_101_1.time_ <= var_104_3 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0

				local var_104_10 = var_104_4 <= 0 and var_104_5 or var_104_5 * ((var_104_9 - arg_101_1.typewritterCharCountI18N) / var_104_4)

				if var_104_10 > 0 and var_104_5 < var_104_10 then
					arg_101_1.talkMaxDuration = var_104_10

					if var_104_10 + var_104_3 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_10 + var_104_3
					end
				end
			end

			local var_104_11 = 0.733333333333333
			local var_104_12 = math.max(var_104_11, arg_101_1.talkMaxDuration)

			if var_104_3 <= arg_101_1.time_ and arg_101_1.time_ < var_104_3 + var_104_12 then
				local var_104_13 = (arg_101_1.time_ - var_104_3) / var_104_12

				arg_101_1.fswtw_.percent = Mathf.Lerp(arg_101_1.var_.oldValueTypewriter, var_104_8, var_104_13)
				arg_101_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_101_1.fswtw_:SetDirty()
			end

			if arg_101_1.time_ >= var_104_3 + var_104_12 and arg_101_1.time_ < var_104_3 + var_104_12 + arg_104_0 then
				arg_101_1.fswtw_.percent = var_104_8

				arg_101_1.fswtw_:SetDirty()
				arg_101_1:ShowNextGo(true)

				arg_101_1.typewritterCharCountI18N = var_104_9
			end

			local var_104_14 = 0.200000002980232
			local var_104_15 = 2.1
			local var_104_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891024", "story_v_out_319891.awb") / 1000

			if var_104_16 > 0 and var_104_15 < var_104_16 and var_104_16 + var_104_14 > arg_101_1.duration_ then
				local var_104_17 = var_104_16

				arg_101_1.duration_ = var_104_16 + var_104_14
			end

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				local var_104_18 = "play"
				local var_104_19 = "voice"

				arg_101_1:AudioAction(var_104_18, var_104_19, "story_v_out_319891", "319891024", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319891025
		arg_105_1.duration_ = 5.699666666666

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play319891026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				local var_108_1 = arg_105_1.fswbg_.transform:Find("textbox/adapt/content") or arg_105_1.fswbg_.transform:Find("textbox/content")
				local var_108_2 = var_108_1:GetComponent("Text")
				local var_108_3 = var_108_1:GetComponent("RectTransform")

				var_108_2.alignment = UnityEngine.TextAnchor.LowerCenter
				var_108_3.offsetMin = Vector2.New(0, 0)
				var_108_3.offsetMax = Vector2.New(0, 0)
			end

			local var_108_4 = 0

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				arg_105_1.fswbg_:SetActive(true)
				arg_105_1.dialog_:SetActive(false)

				arg_105_1.fswtw_.percent = 0

				local var_108_5 = arg_105_1:GetWordFromCfg(319891025)
				local var_108_6 = arg_105_1:FormatText(var_108_5.content)

				arg_105_1.fswt_.text = var_108_6

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.fswt_)

				arg_105_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_105_1.fswtw_:SetDirty()

				arg_105_1.typewritterCharCountI18N = 0

				SetActive(arg_105_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_105_1:ShowNextGo(false)
			end

			local var_108_7 = 0.866666666666667

			if var_108_7 < arg_105_1.time_ and arg_105_1.time_ <= var_108_7 + arg_108_0 then
				arg_105_1.var_.oldValueTypewriter = arg_105_1.fswtw_.percent

				arg_105_1:ShowNextGo(false)
			end

			local var_108_8 = 16
			local var_108_9 = 1.06666666666667
			local var_108_10 = arg_105_1:GetWordFromCfg(319891025)
			local var_108_11 = arg_105_1:FormatText(var_108_10.content)
			local var_108_12, var_108_13 = arg_105_1:GetPercentByPara(var_108_11, 1)

			if var_108_7 < arg_105_1.time_ and arg_105_1.time_ <= var_108_7 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0

				local var_108_14 = var_108_8 <= 0 and var_108_9 or var_108_9 * ((var_108_13 - arg_105_1.typewritterCharCountI18N) / var_108_8)

				if var_108_14 > 0 and var_108_9 < var_108_14 then
					arg_105_1.talkMaxDuration = var_108_14

					if var_108_14 + var_108_7 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_14 + var_108_7
					end
				end
			end

			local var_108_15 = 1.06666666666667
			local var_108_16 = math.max(var_108_15, arg_105_1.talkMaxDuration)

			if var_108_7 <= arg_105_1.time_ and arg_105_1.time_ < var_108_7 + var_108_16 then
				local var_108_17 = (arg_105_1.time_ - var_108_7) / var_108_16

				arg_105_1.fswtw_.percent = Mathf.Lerp(arg_105_1.var_.oldValueTypewriter, var_108_12, var_108_17)
				arg_105_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_105_1.fswtw_:SetDirty()
			end

			if arg_105_1.time_ >= var_108_7 + var_108_16 and arg_105_1.time_ < var_108_7 + var_108_16 + arg_108_0 then
				arg_105_1.fswtw_.percent = var_108_12

				arg_105_1.fswtw_:SetDirty()
				arg_105_1:ShowNextGo(true)

				arg_105_1.typewritterCharCountI18N = var_108_13
			end

			local var_108_18 = 0

			if var_108_18 < arg_105_1.time_ and arg_105_1.time_ <= var_108_18 + arg_108_0 then
				local var_108_19 = manager.ui.mainCamera.transform.localPosition
				local var_108_20 = Vector3.New(0, 0, 10) + Vector3.New(var_108_19.x, var_108_19.y, 0)
				local var_108_21 = arg_105_1.bgs_.STblack

				var_108_21.transform.localPosition = var_108_20
				var_108_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_108_22 = var_108_21:GetComponent("SpriteRenderer")

				if var_108_22 and var_108_22.sprite then
					local var_108_23 = (var_108_21.transform.localPosition - var_108_19).z
					local var_108_24 = manager.ui.mainCameraCom_
					local var_108_25 = 2 * var_108_23 * Mathf.Tan(var_108_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_108_26 = var_108_25 * var_108_24.aspect
					local var_108_27 = var_108_22.sprite.bounds.size.x
					local var_108_28 = var_108_22.sprite.bounds.size.y
					local var_108_29 = var_108_26 / var_108_27
					local var_108_30 = var_108_25 / var_108_28
					local var_108_31 = var_108_30 < var_108_29 and var_108_29 or var_108_30

					var_108_21.transform.localScale = Vector3.New(var_108_31, var_108_31, 0)
				end

				for iter_108_0, iter_108_1 in pairs(arg_105_1.bgs_) do
					if iter_108_0 ~= "STblack" then
						iter_108_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_108_32 = 0.866666666666667
			local var_108_33 = 4.833
			local var_108_34 = manager.audio:GetVoiceLength("story_v_out_319891", "319891025", "story_v_out_319891.awb") / 1000

			if var_108_34 > 0 and var_108_33 < var_108_34 and var_108_34 + var_108_32 > arg_105_1.duration_ then
				local var_108_35 = var_108_34

				arg_105_1.duration_ = var_108_34 + var_108_32
			end

			if var_108_32 < arg_105_1.time_ and arg_105_1.time_ <= var_108_32 + arg_108_0 then
				local var_108_36 = "play"
				local var_108_37 = "voice"

				arg_105_1:AudioAction(var_108_36, var_108_37, "story_v_out_319891", "319891025", "story_v_out_319891.awb")
			end

			local var_108_38 = 0

			if var_108_38 < arg_105_1.time_ and arg_105_1.time_ <= var_108_38 + arg_108_0 then
				arg_105_1.cswbg_:SetActive(true)

				local var_108_39 = arg_105_1.cswt_:GetComponent("RectTransform")

				arg_105_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_108_39.offsetMin = Vector2.New(0, 330)
				var_108_39.offsetMax = Vector2.New(0, -180)

				local var_108_40 = arg_105_1:GetWordFromCfg(419069)
				local var_108_41 = arg_105_1:FormatText(var_108_40.content)

				arg_105_1.cswt_.text = var_108_41

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.cswt_)

				arg_105_1.cswt_.fontSize = 175
				arg_105_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_105_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319891026
		arg_109_1.duration_ = 1.066000002979

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play319891027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.fswbg_:SetActive(true)
				arg_109_1.dialog_:SetActive(false)

				arg_109_1.fswtw_.percent = 0

				local var_112_1 = arg_109_1:GetWordFromCfg(319891026)
				local var_112_2 = arg_109_1:FormatText(var_112_1.content)

				arg_109_1.fswt_.text = var_112_2

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.fswt_)

				arg_109_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_109_1.fswtw_:SetDirty()

				arg_109_1.typewritterCharCountI18N = 0

				SetActive(arg_109_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_109_1:ShowNextGo(false)
			end

			local var_112_3 = 0.200000002980232

			if var_112_3 < arg_109_1.time_ and arg_109_1.time_ <= var_112_3 + arg_112_0 then
				arg_109_1.var_.oldValueTypewriter = arg_109_1.fswtw_.percent

				arg_109_1:ShowNextGo(false)
			end

			local var_112_4 = 2
			local var_112_5 = 0.133333333333333
			local var_112_6 = arg_109_1:GetWordFromCfg(319891026)
			local var_112_7 = arg_109_1:FormatText(var_112_6.content)
			local var_112_8, var_112_9 = arg_109_1:GetPercentByPara(var_112_7, 1)

			if var_112_3 < arg_109_1.time_ and arg_109_1.time_ <= var_112_3 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0

				local var_112_10 = var_112_4 <= 0 and var_112_5 or var_112_5 * ((var_112_9 - arg_109_1.typewritterCharCountI18N) / var_112_4)

				if var_112_10 > 0 and var_112_5 < var_112_10 then
					arg_109_1.talkMaxDuration = var_112_10

					if var_112_10 + var_112_3 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_10 + var_112_3
					end
				end
			end

			local var_112_11 = 0.133333333333333
			local var_112_12 = math.max(var_112_11, arg_109_1.talkMaxDuration)

			if var_112_3 <= arg_109_1.time_ and arg_109_1.time_ < var_112_3 + var_112_12 then
				local var_112_13 = (arg_109_1.time_ - var_112_3) / var_112_12

				arg_109_1.fswtw_.percent = Mathf.Lerp(arg_109_1.var_.oldValueTypewriter, var_112_8, var_112_13)
				arg_109_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_109_1.fswtw_:SetDirty()
			end

			if arg_109_1.time_ >= var_112_3 + var_112_12 and arg_109_1.time_ < var_112_3 + var_112_12 + arg_112_0 then
				arg_109_1.fswtw_.percent = var_112_8

				arg_109_1.fswtw_:SetDirty()
				arg_109_1:ShowNextGo(true)

				arg_109_1.typewritterCharCountI18N = var_112_9
			end

			local var_112_14 = 0.200000002980232
			local var_112_15 = 0.866
			local var_112_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891026", "story_v_out_319891.awb") / 1000

			if var_112_16 > 0 and var_112_15 < var_112_16 and var_112_16 + var_112_14 > arg_109_1.duration_ then
				local var_112_17 = var_112_16

				arg_109_1.duration_ = var_112_16 + var_112_14
			end

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 then
				local var_112_18 = "play"
				local var_112_19 = "voice"

				arg_109_1:AudioAction(var_112_18, var_112_19, "story_v_out_319891", "319891026", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319891027
		arg_113_1.duration_ = 12.866

		local var_113_0 = {
			zh = 9.3,
			ja = 12.866
		}
		local var_113_1 = manager.audio:GetLocalizationFlag()

		if var_113_0[var_113_1] ~= nil then
			arg_113_1.duration_ = var_113_0[var_113_1]
		end

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play319891028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				local var_116_1 = manager.ui.mainCamera.transform.localPosition
				local var_116_2 = Vector3.New(0, 0, 10) + Vector3.New(var_116_1.x, var_116_1.y, 0)
				local var_116_3 = arg_113_1.bgs_.ST15a

				var_116_3.transform.localPosition = var_116_2
				var_116_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_116_4 = var_116_3:GetComponent("SpriteRenderer")

				if var_116_4 and var_116_4.sprite then
					local var_116_5 = (var_116_3.transform.localPosition - var_116_1).z
					local var_116_6 = manager.ui.mainCameraCom_
					local var_116_7 = 2 * var_116_5 * Mathf.Tan(var_116_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_116_8 = var_116_7 * var_116_6.aspect
					local var_116_9 = var_116_4.sprite.bounds.size.x
					local var_116_10 = var_116_4.sprite.bounds.size.y
					local var_116_11 = var_116_8 / var_116_9
					local var_116_12 = var_116_7 / var_116_10
					local var_116_13 = var_116_12 < var_116_11 and var_116_11 or var_116_12

					var_116_3.transform.localScale = Vector3.New(var_116_13, var_116_13, 0)
				end

				for iter_116_0, iter_116_1 in pairs(arg_113_1.bgs_) do
					if iter_116_0 ~= "ST15a" then
						iter_116_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_116_14 = 0

			if var_116_14 < arg_113_1.time_ and arg_113_1.time_ <= var_116_14 + arg_116_0 then
				arg_113_1.mask_.enabled = true
				arg_113_1.mask_.raycastTarget = true

				arg_113_1:SetGaussion(false)
			end

			local var_116_15 = 2

			if var_116_14 <= arg_113_1.time_ and arg_113_1.time_ < var_116_14 + var_116_15 then
				local var_116_16 = (arg_113_1.time_ - var_116_14) / var_116_15
				local var_116_17 = Color.New(0, 0, 0)

				var_116_17.a = Mathf.Lerp(1, 0, var_116_16)
				arg_113_1.mask_.color = var_116_17
			end

			if arg_113_1.time_ >= var_116_14 + var_116_15 and arg_113_1.time_ < var_116_14 + var_116_15 + arg_116_0 then
				local var_116_18 = Color.New(0, 0, 0)
				local var_116_19 = 0

				arg_113_1.mask_.enabled = false
				var_116_18.a = var_116_19
				arg_113_1.mask_.color = var_116_18
			end

			local var_116_20 = arg_113_1.actors_["1084ui_story"]
			local var_116_21 = 0

			if var_116_21 < arg_113_1.time_ and arg_113_1.time_ <= var_116_21 + arg_116_0 and arg_113_1.var_.characterEffect1084ui_story == nil then
				arg_113_1.var_.characterEffect1084ui_story = var_116_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_22 = 0.200000002980232

			if var_116_21 <= arg_113_1.time_ and arg_113_1.time_ < var_116_21 + var_116_22 then
				local var_116_23 = (arg_113_1.time_ - var_116_21) / var_116_22

				if arg_113_1.var_.characterEffect1084ui_story then
					local var_116_24 = Mathf.Lerp(0, 0.5, var_116_23)

					arg_113_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1084ui_story.fillRatio = var_116_24
				end
			end

			if arg_113_1.time_ >= var_116_21 + var_116_22 and arg_113_1.time_ < var_116_21 + var_116_22 + arg_116_0 and arg_113_1.var_.characterEffect1084ui_story then
				local var_116_25 = 0.5

				arg_113_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1084ui_story.fillRatio = var_116_25
			end

			local var_116_26 = 0

			if var_116_26 < arg_113_1.time_ and arg_113_1.time_ <= var_116_26 + arg_116_0 then
				arg_113_1.fswbg_:SetActive(false)
				arg_113_1.dialog_:SetActive(false)
				arg_113_1:ShowNextGo(false)
			end

			local var_116_27 = 0.1

			if var_116_27 < arg_113_1.time_ and arg_113_1.time_ <= var_116_27 + arg_116_0 then
				arg_113_1.fswbg_:SetActive(false)
				arg_113_1.dialog_:SetActive(false)
				arg_113_1:ShowNextGo(false)
			end

			local var_116_28 = 0

			if var_116_28 < arg_113_1.time_ and arg_113_1.time_ <= var_116_28 + arg_116_0 then
				arg_113_1.cswbg_:SetActive(false)
			end

			local var_116_29 = "4037ui_story"

			if arg_113_1.actors_[var_116_29] == nil then
				local var_116_30 = Object.Instantiate(Asset.Load("Char/" .. var_116_29), arg_113_1.stage_.transform)

				var_116_30.name = var_116_29
				var_116_30.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.actors_[var_116_29] = var_116_30

				local var_116_31 = var_116_30:GetComponentInChildren(typeof(CharacterEffect))

				var_116_31.enabled = true

				local var_116_32 = GameObjectTools.GetOrAddComponent(var_116_30, typeof(DynamicBoneHelper))

				if var_116_32 then
					var_116_32:EnableDynamicBone(false)
				end

				arg_113_1:ShowWeapon(var_116_31.transform, false)

				arg_113_1.var_[var_116_29 .. "Animator"] = var_116_31.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_113_1.var_[var_116_29 .. "Animator"].applyRootMotion = true
				arg_113_1.var_[var_116_29 .. "LipSync"] = var_116_31.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_116_33 = arg_113_1.actors_["4037ui_story"].transform
			local var_116_34 = 1.86666666666667

			if var_116_34 < arg_113_1.time_ and arg_113_1.time_ <= var_116_34 + arg_116_0 then
				arg_113_1.var_.moveOldPos4037ui_story = var_116_33.localPosition
			end

			local var_116_35 = 0.001

			if var_116_34 <= arg_113_1.time_ and arg_113_1.time_ < var_116_34 + var_116_35 then
				local var_116_36 = (arg_113_1.time_ - var_116_34) / var_116_35
				local var_116_37 = Vector3.New(0, -1.12, -6.2)

				var_116_33.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos4037ui_story, var_116_37, var_116_36)

				local var_116_38 = manager.ui.mainCamera.transform.position - var_116_33.position

				var_116_33.forward = Vector3.New(var_116_38.x, var_116_38.y, var_116_38.z)

				local var_116_39 = var_116_33.localEulerAngles

				var_116_39.z = 0
				var_116_39.x = 0
				var_116_33.localEulerAngles = var_116_39
			end

			if arg_113_1.time_ >= var_116_34 + var_116_35 and arg_113_1.time_ < var_116_34 + var_116_35 + arg_116_0 then
				var_116_33.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_116_40 = manager.ui.mainCamera.transform.position - var_116_33.position

				var_116_33.forward = Vector3.New(var_116_40.x, var_116_40.y, var_116_40.z)

				local var_116_41 = var_116_33.localEulerAngles

				var_116_41.z = 0
				var_116_41.x = 0
				var_116_33.localEulerAngles = var_116_41
			end

			local var_116_42 = arg_113_1.actors_["4037ui_story"]
			local var_116_43 = 1.86666666666667

			if var_116_43 < arg_113_1.time_ and arg_113_1.time_ <= var_116_43 + arg_116_0 and arg_113_1.var_.characterEffect4037ui_story == nil then
				arg_113_1.var_.characterEffect4037ui_story = var_116_42:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_44 = 0.200000002980232

			if var_116_43 <= arg_113_1.time_ and arg_113_1.time_ < var_116_43 + var_116_44 then
				local var_116_45 = (arg_113_1.time_ - var_116_43) / var_116_44

				if arg_113_1.var_.characterEffect4037ui_story then
					arg_113_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_43 + var_116_44 and arg_113_1.time_ < var_116_43 + var_116_44 + arg_116_0 and arg_113_1.var_.characterEffect4037ui_story then
				arg_113_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_116_46 = 1.86666666666667

			if var_116_46 < arg_113_1.time_ and arg_113_1.time_ <= var_116_46 + arg_116_0 then
				arg_113_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_116_47 = 1.86666666666667

			if var_116_47 < arg_113_1.time_ and arg_113_1.time_ <= var_116_47 + arg_116_0 then
				arg_113_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_113_1.frameCnt_ <= 1 then
				arg_113_1.dialog_:SetActive(false)
			end

			local var_116_48 = 2
			local var_116_49 = 0.725

			if var_116_48 < arg_113_1.time_ and arg_113_1.time_ <= var_116_48 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0

				arg_113_1.dialog_:SetActive(true)

				local var_116_50 = LeanTween.value(arg_113_1.dialog_, 0, 1, 0.3)

				var_116_50:setOnUpdate(LuaHelper.FloatAction(function(arg_117_0)
					arg_113_1.dialogCg_.alpha = arg_117_0
				end))
				var_116_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_113_1.dialog_)
					var_116_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_113_1.duration_ = arg_113_1.duration_ + 0.3

				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_51 = arg_113_1:FormatText(StoryNameCfg[453].name)

				arg_113_1.leftNameTxt_.text = var_116_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_52 = arg_113_1:GetWordFromCfg(319891027)
				local var_116_53 = arg_113_1:FormatText(var_116_52.content)

				arg_113_1.text_.text = var_116_53

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_54 = 29
				local var_116_55 = utf8.len(var_116_53)
				local var_116_56 = var_116_54 <= 0 and var_116_49 or var_116_49 * (var_116_55 / var_116_54)

				if var_116_56 > 0 and var_116_49 < var_116_56 then
					arg_113_1.talkMaxDuration = var_116_56
					var_116_48 = var_116_48 + 0.3

					if var_116_56 + var_116_48 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_56 + var_116_48
					end
				end

				arg_113_1.text_.text = var_116_53
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891027", "story_v_out_319891.awb") ~= 0 then
					local var_116_57 = manager.audio:GetVoiceLength("story_v_out_319891", "319891027", "story_v_out_319891.awb") / 1000

					if var_116_57 + var_116_48 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_57 + var_116_48
					end

					if var_116_52.prefab_name ~= "" and arg_113_1.actors_[var_116_52.prefab_name] ~= nil then
						local var_116_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_52.prefab_name].transform, "story_v_out_319891", "319891027", "story_v_out_319891.awb")

						arg_113_1:RecordAudio("319891027", var_116_58)
						arg_113_1:RecordAudio("319891027", var_116_58)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_319891", "319891027", "story_v_out_319891.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_319891", "319891027", "story_v_out_319891.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_59 = var_116_48 + 0.3
			local var_116_60 = math.max(var_116_49, arg_113_1.talkMaxDuration)

			if var_116_59 <= arg_113_1.time_ and arg_113_1.time_ < var_116_59 + var_116_60 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_59) / var_116_60

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_59 + var_116_60 and arg_113_1.time_ < var_116_59 + var_116_60 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319891028 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319891028
		arg_119_1.duration_ = 11.366

		local var_119_0 = {
			zh = 11.366,
			ja = 7.033
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
				arg_119_0:Play319891029(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action2_1")
			end

			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_122_2 = 0
			local var_122_3 = 1.1

			if var_122_2 < arg_119_1.time_ and arg_119_1.time_ <= var_122_2 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_4 = arg_119_1:FormatText(StoryNameCfg[453].name)

				arg_119_1.leftNameTxt_.text = var_122_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_5 = arg_119_1:GetWordFromCfg(319891028)
				local var_122_6 = arg_119_1:FormatText(var_122_5.content)

				arg_119_1.text_.text = var_122_6

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_7 = 44
				local var_122_8 = utf8.len(var_122_6)
				local var_122_9 = var_122_7 <= 0 and var_122_3 or var_122_3 * (var_122_8 / var_122_7)

				if var_122_9 > 0 and var_122_3 < var_122_9 then
					arg_119_1.talkMaxDuration = var_122_9

					if var_122_9 + var_122_2 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_9 + var_122_2
					end
				end

				arg_119_1.text_.text = var_122_6
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891028", "story_v_out_319891.awb") ~= 0 then
					local var_122_10 = manager.audio:GetVoiceLength("story_v_out_319891", "319891028", "story_v_out_319891.awb") / 1000

					if var_122_10 + var_122_2 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_10 + var_122_2
					end

					if var_122_5.prefab_name ~= "" and arg_119_1.actors_[var_122_5.prefab_name] ~= nil then
						local var_122_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_5.prefab_name].transform, "story_v_out_319891", "319891028", "story_v_out_319891.awb")

						arg_119_1:RecordAudio("319891028", var_122_11)
						arg_119_1:RecordAudio("319891028", var_122_11)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_319891", "319891028", "story_v_out_319891.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_319891", "319891028", "story_v_out_319891.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_12 = math.max(var_122_3, arg_119_1.talkMaxDuration)

			if var_122_2 <= arg_119_1.time_ and arg_119_1.time_ < var_122_2 + var_122_12 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_2) / var_122_12

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_2 + var_122_12 and arg_119_1.time_ < var_122_2 + var_122_12 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play319891029 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319891029
		arg_123_1.duration_ = 15.933

		local var_123_0 = {
			zh = 14.2,
			ja = 15.933
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
				arg_123_0:Play319891030(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 1.3

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[453].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(319891029)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891029", "story_v_out_319891.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_319891", "319891029", "story_v_out_319891.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_319891", "319891029", "story_v_out_319891.awb")

						arg_123_1:RecordAudio("319891029", var_126_9)
						arg_123_1:RecordAudio("319891029", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_319891", "319891029", "story_v_out_319891.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_319891", "319891029", "story_v_out_319891.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_10 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_10 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_10

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_10 and arg_123_1.time_ < var_126_0 + var_126_10 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play319891030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 319891030
		arg_127_1.duration_ = 5.566

		local var_127_0 = {
			zh = 5.566,
			ja = 4.433
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
				arg_127_0:Play319891031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.375

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[453].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(319891030)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891030", "story_v_out_319891.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_319891", "319891030", "story_v_out_319891.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_319891", "319891030", "story_v_out_319891.awb")

						arg_127_1:RecordAudio("319891030", var_130_9)
						arg_127_1:RecordAudio("319891030", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_319891", "319891030", "story_v_out_319891.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_319891", "319891030", "story_v_out_319891.awb")
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
	Play319891031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 319891031
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play319891032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				local var_134_2 = "play"
				local var_134_3 = "effect"

				arg_131_1:AudioAction(var_134_2, var_134_3, "se_story_128", "se_story_128_stab", "")
			end

			local var_134_4 = arg_131_1.actors_["4037ui_story"].transform
			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1.var_.moveOldPos4037ui_story = var_134_4.localPosition
			end

			local var_134_6 = 0.001

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6
				local var_134_8 = Vector3.New(0, 100, 0)

				var_134_4.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos4037ui_story, var_134_8, var_134_7)

				local var_134_9 = manager.ui.mainCamera.transform.position - var_134_4.position

				var_134_4.forward = Vector3.New(var_134_9.x, var_134_9.y, var_134_9.z)

				local var_134_10 = var_134_4.localEulerAngles

				var_134_10.z = 0
				var_134_10.x = 0
				var_134_4.localEulerAngles = var_134_10
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 then
				var_134_4.localPosition = Vector3.New(0, 100, 0)

				local var_134_11 = manager.ui.mainCamera.transform.position - var_134_4.position

				var_134_4.forward = Vector3.New(var_134_11.x, var_134_11.y, var_134_11.z)

				local var_134_12 = var_134_4.localEulerAngles

				var_134_12.z = 0
				var_134_12.x = 0
				var_134_4.localEulerAngles = var_134_12
			end

			local var_134_13 = 0
			local var_134_14 = 0.825

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_15 = arg_131_1:GetWordFromCfg(319891031)
				local var_134_16 = arg_131_1:FormatText(var_134_15.content)

				arg_131_1.text_.text = var_134_16

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_17 = 33
				local var_134_18 = utf8.len(var_134_16)
				local var_134_19 = var_134_17 <= 0 and var_134_14 or var_134_14 * (var_134_18 / var_134_17)

				if var_134_19 > 0 and var_134_14 < var_134_19 then
					arg_131_1.talkMaxDuration = var_134_19

					if var_134_19 + var_134_13 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_19 + var_134_13
					end
				end

				arg_131_1.text_.text = var_134_16
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_20 = math.max(var_134_14, arg_131_1.talkMaxDuration)

			if var_134_13 <= arg_131_1.time_ and arg_131_1.time_ < var_134_13 + var_134_20 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_13) / var_134_20

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_13 + var_134_20 and arg_131_1.time_ < var_134_13 + var_134_20 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play319891032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 319891032
		arg_135_1.duration_ = 2.999999999999

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play319891033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				local var_138_1 = arg_135_1.fswbg_.transform:Find("textbox/adapt/content") or arg_135_1.fswbg_.transform:Find("textbox/content")
				local var_138_2 = var_138_1:GetComponent("Text")
				local var_138_3 = var_138_1:GetComponent("RectTransform")

				var_138_2.alignment = UnityEngine.TextAnchor.LowerCenter
				var_138_3.offsetMin = Vector2.New(0, 0)
				var_138_3.offsetMax = Vector2.New(0, 0)
			end

			local var_138_4 = 0

			if var_138_4 < arg_135_1.time_ and arg_135_1.time_ <= var_138_4 + arg_138_0 then
				arg_135_1.fswbg_:SetActive(true)
				arg_135_1.dialog_:SetActive(false)

				arg_135_1.fswtw_.percent = 0

				local var_138_5 = arg_135_1:GetWordFromCfg(319891032)
				local var_138_6 = arg_135_1:FormatText(var_138_5.content)

				arg_135_1.fswt_.text = var_138_6

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.fswt_)

				arg_135_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_135_1.fswtw_:SetDirty()

				arg_135_1.typewritterCharCountI18N = 0

				SetActive(arg_135_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_135_1:ShowNextGo(false)
			end

			local var_138_7 = 1

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 then
				arg_135_1.var_.oldValueTypewriter = arg_135_1.fswtw_.percent

				arg_135_1:ShowNextGo(false)
			end

			local var_138_8 = 7
			local var_138_9 = 0.466666666666667
			local var_138_10 = arg_135_1:GetWordFromCfg(319891032)
			local var_138_11 = arg_135_1:FormatText(var_138_10.content)
			local var_138_12, var_138_13 = arg_135_1:GetPercentByPara(var_138_11, 1)

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0

				local var_138_14 = var_138_8 <= 0 and var_138_9 or var_138_9 * ((var_138_13 - arg_135_1.typewritterCharCountI18N) / var_138_8)

				if var_138_14 > 0 and var_138_9 < var_138_14 then
					arg_135_1.talkMaxDuration = var_138_14

					if var_138_14 + var_138_7 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_14 + var_138_7
					end
				end
			end

			local var_138_15 = 0.466666666666667
			local var_138_16 = math.max(var_138_15, arg_135_1.talkMaxDuration)

			if var_138_7 <= arg_135_1.time_ and arg_135_1.time_ < var_138_7 + var_138_16 then
				local var_138_17 = (arg_135_1.time_ - var_138_7) / var_138_16

				arg_135_1.fswtw_.percent = Mathf.Lerp(arg_135_1.var_.oldValueTypewriter, var_138_12, var_138_17)
				arg_135_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_135_1.fswtw_:SetDirty()
			end

			if arg_135_1.time_ >= var_138_7 + var_138_16 and arg_135_1.time_ < var_138_7 + var_138_16 + arg_138_0 then
				arg_135_1.fswtw_.percent = var_138_12

				arg_135_1.fswtw_:SetDirty()
				arg_135_1:ShowNextGo(true)

				arg_135_1.typewritterCharCountI18N = var_138_13
			end

			local var_138_18 = 0

			if var_138_18 < arg_135_1.time_ and arg_135_1.time_ <= var_138_18 + arg_138_0 then
				local var_138_19 = manager.ui.mainCamera.transform.localPosition
				local var_138_20 = Vector3.New(0, 0, 10) + Vector3.New(var_138_19.x, var_138_19.y, 0)
				local var_138_21 = arg_135_1.bgs_.STblack

				var_138_21.transform.localPosition = var_138_20
				var_138_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_138_22 = var_138_21:GetComponent("SpriteRenderer")

				if var_138_22 and var_138_22.sprite then
					local var_138_23 = (var_138_21.transform.localPosition - var_138_19).z
					local var_138_24 = manager.ui.mainCameraCom_
					local var_138_25 = 2 * var_138_23 * Mathf.Tan(var_138_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_138_26 = var_138_25 * var_138_24.aspect
					local var_138_27 = var_138_22.sprite.bounds.size.x
					local var_138_28 = var_138_22.sprite.bounds.size.y
					local var_138_29 = var_138_26 / var_138_27
					local var_138_30 = var_138_25 / var_138_28
					local var_138_31 = var_138_30 < var_138_29 and var_138_29 or var_138_30

					var_138_21.transform.localScale = Vector3.New(var_138_31, var_138_31, 0)
				end

				for iter_138_0, iter_138_1 in pairs(arg_135_1.bgs_) do
					if iter_138_0 ~= "STblack" then
						iter_138_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_138_32 = 1
			local var_138_33 = 1.966
			local var_138_34 = manager.audio:GetVoiceLength("story_v_out_319891", "319891032", "story_v_out_319891.awb") / 1000

			if var_138_34 > 0 and var_138_33 < var_138_34 and var_138_34 + var_138_32 > arg_135_1.duration_ then
				local var_138_35 = var_138_34

				arg_135_1.duration_ = var_138_34 + var_138_32
			end

			if var_138_32 < arg_135_1.time_ and arg_135_1.time_ <= var_138_32 + arg_138_0 then
				local var_138_36 = "play"
				local var_138_37 = "voice"

				arg_135_1:AudioAction(var_138_36, var_138_37, "story_v_out_319891", "319891032", "story_v_out_319891.awb")
			end

			local var_138_38 = 0

			if var_138_38 < arg_135_1.time_ and arg_135_1.time_ <= var_138_38 + arg_138_0 then
				arg_135_1.cswbg_:SetActive(true)

				local var_138_39 = arg_135_1.cswt_:GetComponent("RectTransform")

				arg_135_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_138_39.offsetMin = Vector2.New(0, 330)
				var_138_39.offsetMax = Vector2.New(0, -180)

				local var_138_40 = arg_135_1:GetWordFromCfg(419070)
				local var_138_41 = arg_135_1:FormatText(var_138_40.content)

				arg_135_1.cswt_.text = var_138_41

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.cswt_)

				arg_135_1.cswt_.fontSize = 175
				arg_135_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_135_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 319891033
		arg_139_1.duration_ = 5.33333333333333

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play319891034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1084ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1084ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(0, 100, 0)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1084ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, 100, 0)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = arg_139_1.actors_["1084ui_story"]
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 and arg_139_1.var_.characterEffect1084ui_story == nil then
				arg_139_1.var_.characterEffect1084ui_story = var_142_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_11 = 0.200000002980232

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11

				if arg_139_1.var_.characterEffect1084ui_story then
					local var_142_13 = Mathf.Lerp(0, 0.5, var_142_12)

					arg_139_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1084ui_story.fillRatio = var_142_13
				end
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect1084ui_story then
				local var_142_14 = 0.5

				arg_139_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1084ui_story.fillRatio = var_142_14
			end

			local var_142_15 = arg_139_1.actors_["4037ui_story"].transform
			local var_142_16 = 0

			if var_142_16 < arg_139_1.time_ and arg_139_1.time_ <= var_142_16 + arg_142_0 then
				arg_139_1.var_.moveOldPos4037ui_story = var_142_15.localPosition
			end

			local var_142_17 = 0.001

			if var_142_16 <= arg_139_1.time_ and arg_139_1.time_ < var_142_16 + var_142_17 then
				local var_142_18 = (arg_139_1.time_ - var_142_16) / var_142_17
				local var_142_19 = Vector3.New(0, 100, 0)

				var_142_15.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos4037ui_story, var_142_19, var_142_18)

				local var_142_20 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_20.x, var_142_20.y, var_142_20.z)

				local var_142_21 = var_142_15.localEulerAngles

				var_142_21.z = 0
				var_142_21.x = 0
				var_142_15.localEulerAngles = var_142_21
			end

			if arg_139_1.time_ >= var_142_16 + var_142_17 and arg_139_1.time_ < var_142_16 + var_142_17 + arg_142_0 then
				var_142_15.localPosition = Vector3.New(0, 100, 0)

				local var_142_22 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_22.x, var_142_22.y, var_142_22.z)

				local var_142_23 = var_142_15.localEulerAngles

				var_142_23.z = 0
				var_142_23.x = 0
				var_142_15.localEulerAngles = var_142_23
			end

			local var_142_24 = arg_139_1.actors_["4037ui_story"]
			local var_142_25 = 0

			if var_142_25 < arg_139_1.time_ and arg_139_1.time_ <= var_142_25 + arg_142_0 and arg_139_1.var_.characterEffect4037ui_story == nil then
				arg_139_1.var_.characterEffect4037ui_story = var_142_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_26 = 0.200000002980232

			if var_142_25 <= arg_139_1.time_ and arg_139_1.time_ < var_142_25 + var_142_26 then
				local var_142_27 = (arg_139_1.time_ - var_142_25) / var_142_26

				if arg_139_1.var_.characterEffect4037ui_story then
					local var_142_28 = Mathf.Lerp(0, 0.5, var_142_27)

					arg_139_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_139_1.var_.characterEffect4037ui_story.fillRatio = var_142_28
				end
			end

			if arg_139_1.time_ >= var_142_25 + var_142_26 and arg_139_1.time_ < var_142_25 + var_142_26 + arg_142_0 and arg_139_1.var_.characterEffect4037ui_story then
				local var_142_29 = 0.5

				arg_139_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_139_1.var_.characterEffect4037ui_story.fillRatio = var_142_29
			end

			local var_142_30 = 0

			if var_142_30 < arg_139_1.time_ and arg_139_1.time_ <= var_142_30 + arg_142_0 then
				arg_139_1.fswbg_:SetActive(false)
				arg_139_1.dialog_:SetActive(false)
				arg_139_1:ShowNextGo(false)
			end

			local var_142_31 = 0.1

			if var_142_31 < arg_139_1.time_ and arg_139_1.time_ <= var_142_31 + arg_142_0 then
				arg_139_1.fswbg_:SetActive(false)
				arg_139_1.dialog_:SetActive(false)
				arg_139_1:ShowNextGo(false)
			end

			local var_142_32 = 0

			if var_142_32 < arg_139_1.time_ and arg_139_1.time_ <= var_142_32 + arg_142_0 then
				arg_139_1.cswbg_:SetActive(false)
			end

			local var_142_33 = 0

			if var_142_33 < arg_139_1.time_ and arg_139_1.time_ <= var_142_33 + arg_142_0 then
				local var_142_34 = manager.ui.mainCamera.transform.localPosition
				local var_142_35 = Vector3.New(0, 0, 10) + Vector3.New(var_142_34.x, var_142_34.y, 0)
				local var_142_36 = arg_139_1.bgs_.ST15a

				var_142_36.transform.localPosition = var_142_35
				var_142_36.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_142_37 = var_142_36:GetComponent("SpriteRenderer")

				if var_142_37 and var_142_37.sprite then
					local var_142_38 = (var_142_36.transform.localPosition - var_142_34).z
					local var_142_39 = manager.ui.mainCameraCom_
					local var_142_40 = 2 * var_142_38 * Mathf.Tan(var_142_39.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_142_41 = var_142_40 * var_142_39.aspect
					local var_142_42 = var_142_37.sprite.bounds.size.x
					local var_142_43 = var_142_37.sprite.bounds.size.y
					local var_142_44 = var_142_41 / var_142_42
					local var_142_45 = var_142_40 / var_142_43
					local var_142_46 = var_142_45 < var_142_44 and var_142_44 or var_142_45

					var_142_36.transform.localScale = Vector3.New(var_142_46, var_142_46, 0)
				end

				for iter_142_0, iter_142_1 in pairs(arg_139_1.bgs_) do
					if iter_142_0 ~= "ST15a" then
						iter_142_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_139_1.frameCnt_ <= 1 then
				arg_139_1.dialog_:SetActive(false)
			end

			local var_142_47 = 0.333333333333333
			local var_142_48 = 1.2

			if var_142_47 < arg_139_1.time_ and arg_139_1.time_ <= var_142_47 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0

				arg_139_1.dialog_:SetActive(true)

				local var_142_49 = LeanTween.value(arg_139_1.dialog_, 0, 1, 0.3)

				var_142_49:setOnUpdate(LuaHelper.FloatAction(function(arg_143_0)
					arg_139_1.dialogCg_.alpha = arg_143_0
				end))
				var_142_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_139_1.dialog_)
					var_142_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_139_1.duration_ = arg_139_1.duration_ + 0.3

				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_50 = arg_139_1:GetWordFromCfg(319891033)
				local var_142_51 = arg_139_1:FormatText(var_142_50.content)

				arg_139_1.text_.text = var_142_51

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_52 = 48
				local var_142_53 = utf8.len(var_142_51)
				local var_142_54 = var_142_52 <= 0 and var_142_48 or var_142_48 * (var_142_53 / var_142_52)

				if var_142_54 > 0 and var_142_48 < var_142_54 then
					arg_139_1.talkMaxDuration = var_142_54
					var_142_47 = var_142_47 + 0.3

					if var_142_54 + var_142_47 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_54 + var_142_47
					end
				end

				arg_139_1.text_.text = var_142_51
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_55 = var_142_47 + 0.3
			local var_142_56 = math.max(var_142_48, arg_139_1.talkMaxDuration)

			if var_142_55 <= arg_139_1.time_ and arg_139_1.time_ < var_142_55 + var_142_56 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_55) / var_142_56

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_55 + var_142_56 and arg_139_1.time_ < var_142_55 + var_142_56 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play319891034 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319891034
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play319891035(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.25

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

				local var_148_2 = arg_145_1:GetWordFromCfg(319891034)
				local var_148_3 = arg_145_1:FormatText(var_148_2.content)

				arg_145_1.text_.text = var_148_3

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_4 = 50
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
	Play319891035 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319891035
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play319891036(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.725

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_2 = arg_149_1:GetWordFromCfg(319891035)
				local var_152_3 = arg_149_1:FormatText(var_152_2.content)

				arg_149_1.text_.text = var_152_3

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_4 = 29
				local var_152_5 = utf8.len(var_152_3)
				local var_152_6 = var_152_4 <= 0 and var_152_1 or var_152_1 * (var_152_5 / var_152_4)

				if var_152_6 > 0 and var_152_1 < var_152_6 then
					arg_149_1.talkMaxDuration = var_152_6

					if var_152_6 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_6 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_3
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_7 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_7 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_7

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_7 and arg_149_1.time_ < var_152_0 + var_152_7 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play319891036 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319891036
		arg_153_1.duration_ = 2.5

		local var_153_0 = {
			zh = 2.2,
			ja = 2.5
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
				arg_153_0:Play319891037(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.15

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[724].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, true)
				arg_153_1.iconController_:SetSelectedState("hero")

				arg_153_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(319891036)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 6
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891036", "story_v_out_319891.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_319891", "319891036", "story_v_out_319891.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_319891", "319891036", "story_v_out_319891.awb")

						arg_153_1:RecordAudio("319891036", var_156_9)
						arg_153_1:RecordAudio("319891036", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_319891", "319891036", "story_v_out_319891.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_319891", "319891036", "story_v_out_319891.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_10 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_10 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_10

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_10 and arg_153_1.time_ < var_156_0 + var_156_10 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319891037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319891037
		arg_157_1.duration_ = 2.7

		local var_157_0 = {
			zh = 1.999999999999,
			ja = 2.7
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
				arg_157_0:Play319891038(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1084ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1084ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0, -0.97, -6)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1084ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["1084ui_story"]
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 and arg_157_1.var_.characterEffect1084ui_story == nil then
				arg_157_1.var_.characterEffect1084ui_story = var_160_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_11 = 0.200000002980232

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11

				if arg_157_1.var_.characterEffect1084ui_story then
					arg_157_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 and arg_157_1.var_.characterEffect1084ui_story then
				arg_157_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_160_13 = 0

			if var_160_13 < arg_157_1.time_ and arg_157_1.time_ <= var_160_13 + arg_160_0 then
				arg_157_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_160_15 = 0
			local var_160_16 = 0.075

			if var_160_15 < arg_157_1.time_ and arg_157_1.time_ <= var_160_15 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_17 = arg_157_1:FormatText(StoryNameCfg[6].name)

				arg_157_1.leftNameTxt_.text = var_160_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_18 = arg_157_1:GetWordFromCfg(319891037)
				local var_160_19 = arg_157_1:FormatText(var_160_18.content)

				arg_157_1.text_.text = var_160_19

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_20 = 3
				local var_160_21 = utf8.len(var_160_19)
				local var_160_22 = var_160_20 <= 0 and var_160_16 or var_160_16 * (var_160_21 / var_160_20)

				if var_160_22 > 0 and var_160_16 < var_160_22 then
					arg_157_1.talkMaxDuration = var_160_22

					if var_160_22 + var_160_15 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_22 + var_160_15
					end
				end

				arg_157_1.text_.text = var_160_19
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891037", "story_v_out_319891.awb") ~= 0 then
					local var_160_23 = manager.audio:GetVoiceLength("story_v_out_319891", "319891037", "story_v_out_319891.awb") / 1000

					if var_160_23 + var_160_15 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_23 + var_160_15
					end

					if var_160_18.prefab_name ~= "" and arg_157_1.actors_[var_160_18.prefab_name] ~= nil then
						local var_160_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_18.prefab_name].transform, "story_v_out_319891", "319891037", "story_v_out_319891.awb")

						arg_157_1:RecordAudio("319891037", var_160_24)
						arg_157_1:RecordAudio("319891037", var_160_24)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_319891", "319891037", "story_v_out_319891.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_319891", "319891037", "story_v_out_319891.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_25 = math.max(var_160_16, arg_157_1.talkMaxDuration)

			if var_160_15 <= arg_157_1.time_ and arg_157_1.time_ < var_160_15 + var_160_25 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_15) / var_160_25

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_15 + var_160_25 and arg_157_1.time_ < var_160_15 + var_160_25 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319891038 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319891038
		arg_161_1.duration_ = 3.1

		local var_161_0 = {
			zh = 3.1,
			ja = 2.9
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
				arg_161_0:Play319891039(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1084ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1084ui_story == nil then
				arg_161_1.var_.characterEffect1084ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1084ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1084ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1084ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1084ui_story.fillRatio = var_164_5
			end

			local var_164_6 = 0
			local var_164_7 = 0.15

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_8 = arg_161_1:FormatText(StoryNameCfg[724].name)

				arg_161_1.leftNameTxt_.text = var_164_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, true)
				arg_161_1.iconController_:SetSelectedState("hero")

				arg_161_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_9 = arg_161_1:GetWordFromCfg(319891038)
				local var_164_10 = arg_161_1:FormatText(var_164_9.content)

				arg_161_1.text_.text = var_164_10

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_11 = 6
				local var_164_12 = utf8.len(var_164_10)
				local var_164_13 = var_164_11 <= 0 and var_164_7 or var_164_7 * (var_164_12 / var_164_11)

				if var_164_13 > 0 and var_164_7 < var_164_13 then
					arg_161_1.talkMaxDuration = var_164_13

					if var_164_13 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_13 + var_164_6
					end
				end

				arg_161_1.text_.text = var_164_10
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891038", "story_v_out_319891.awb") ~= 0 then
					local var_164_14 = manager.audio:GetVoiceLength("story_v_out_319891", "319891038", "story_v_out_319891.awb") / 1000

					if var_164_14 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_14 + var_164_6
					end

					if var_164_9.prefab_name ~= "" and arg_161_1.actors_[var_164_9.prefab_name] ~= nil then
						local var_164_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_9.prefab_name].transform, "story_v_out_319891", "319891038", "story_v_out_319891.awb")

						arg_161_1:RecordAudio("319891038", var_164_15)
						arg_161_1:RecordAudio("319891038", var_164_15)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_319891", "319891038", "story_v_out_319891.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_319891", "319891038", "story_v_out_319891.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_16 = math.max(var_164_7, arg_161_1.talkMaxDuration)

			if var_164_6 <= arg_161_1.time_ and arg_161_1.time_ < var_164_6 + var_164_16 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_6) / var_164_16

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_6 + var_164_16 and arg_161_1.time_ < var_164_6 + var_164_16 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319891039 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 319891039
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play319891040(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1084ui_story"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1084ui_story = var_168_0.localPosition
			end

			local var_168_2 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2
				local var_168_4 = Vector3.New(0, 100, 0)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1084ui_story, var_168_4, var_168_3)

				local var_168_5 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_5.x, var_168_5.y, var_168_5.z)

				local var_168_6 = var_168_0.localEulerAngles

				var_168_6.z = 0
				var_168_6.x = 0
				var_168_0.localEulerAngles = var_168_6
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(0, 100, 0)

				local var_168_7 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_7.x, var_168_7.y, var_168_7.z)

				local var_168_8 = var_168_0.localEulerAngles

				var_168_8.z = 0
				var_168_8.x = 0
				var_168_0.localEulerAngles = var_168_8
			end

			local var_168_9 = 0
			local var_168_10 = 0.925

			if var_168_9 < arg_165_1.time_ and arg_165_1.time_ <= var_168_9 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_11 = arg_165_1:GetWordFromCfg(319891039)
				local var_168_12 = arg_165_1:FormatText(var_168_11.content)

				arg_165_1.text_.text = var_168_12

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_13 = 37
				local var_168_14 = utf8.len(var_168_12)
				local var_168_15 = var_168_13 <= 0 and var_168_10 or var_168_10 * (var_168_14 / var_168_13)

				if var_168_15 > 0 and var_168_10 < var_168_15 then
					arg_165_1.talkMaxDuration = var_168_15

					if var_168_15 + var_168_9 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_15 + var_168_9
					end
				end

				arg_165_1.text_.text = var_168_12
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_16 = math.max(var_168_10, arg_165_1.talkMaxDuration)

			if var_168_9 <= arg_165_1.time_ and arg_165_1.time_ < var_168_9 + var_168_16 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_9) / var_168_16

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_9 + var_168_16 and arg_165_1.time_ < var_168_9 + var_168_16 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play319891040 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 319891040
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play319891041(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 1.225

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_2 = arg_169_1:GetWordFromCfg(319891040)
				local var_172_3 = arg_169_1:FormatText(var_172_2.content)

				arg_169_1.text_.text = var_172_3

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_4 = 49
				local var_172_5 = utf8.len(var_172_3)
				local var_172_6 = var_172_4 <= 0 and var_172_1 or var_172_1 * (var_172_5 / var_172_4)

				if var_172_6 > 0 and var_172_1 < var_172_6 then
					arg_169_1.talkMaxDuration = var_172_6

					if var_172_6 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_6 + var_172_0
					end
				end

				arg_169_1.text_.text = var_172_3
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_7 = math.max(var_172_1, arg_169_1.talkMaxDuration)

			if var_172_0 <= arg_169_1.time_ and arg_169_1.time_ < var_172_0 + var_172_7 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_0) / var_172_7

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_0 + var_172_7 and arg_169_1.time_ < var_172_0 + var_172_7 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play319891041 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319891041
		arg_173_1.duration_ = 2.999999999999

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play319891042(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				local var_176_1 = arg_173_1.fswbg_.transform:Find("textbox/adapt/content") or arg_173_1.fswbg_.transform:Find("textbox/content")
				local var_176_2 = var_176_1:GetComponent("Text")
				local var_176_3 = var_176_1:GetComponent("RectTransform")

				var_176_2.alignment = UnityEngine.TextAnchor.LowerCenter
				var_176_3.offsetMin = Vector2.New(0, 0)
				var_176_3.offsetMax = Vector2.New(0, 0)
			end

			local var_176_4 = 0

			if var_176_4 < arg_173_1.time_ and arg_173_1.time_ <= var_176_4 + arg_176_0 then
				arg_173_1.fswbg_:SetActive(true)
				arg_173_1.dialog_:SetActive(false)

				arg_173_1.fswtw_.percent = 0

				local var_176_5 = arg_173_1:GetWordFromCfg(319891041)
				local var_176_6 = arg_173_1:FormatText(var_176_5.content)

				arg_173_1.fswt_.text = var_176_6

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.fswt_)

				arg_173_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_173_1.fswtw_:SetDirty()

				arg_173_1.typewritterCharCountI18N = 0

				SetActive(arg_173_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_173_1:ShowNextGo(false)
			end

			local var_176_7 = 1.36666666666667

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 then
				arg_173_1.var_.oldValueTypewriter = arg_173_1.fswtw_.percent

				arg_173_1:ShowNextGo(false)
			end

			local var_176_8 = 5
			local var_176_9 = 0.333333333333333
			local var_176_10 = arg_173_1:GetWordFromCfg(319891041)
			local var_176_11 = arg_173_1:FormatText(var_176_10.content)
			local var_176_12, var_176_13 = arg_173_1:GetPercentByPara(var_176_11, 1)

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0

				local var_176_14 = var_176_8 <= 0 and var_176_9 or var_176_9 * ((var_176_13 - arg_173_1.typewritterCharCountI18N) / var_176_8)

				if var_176_14 > 0 and var_176_9 < var_176_14 then
					arg_173_1.talkMaxDuration = var_176_14

					if var_176_14 + var_176_7 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_14 + var_176_7
					end
				end
			end

			local var_176_15 = 0.333333333333333
			local var_176_16 = math.max(var_176_15, arg_173_1.talkMaxDuration)

			if var_176_7 <= arg_173_1.time_ and arg_173_1.time_ < var_176_7 + var_176_16 then
				local var_176_17 = (arg_173_1.time_ - var_176_7) / var_176_16

				arg_173_1.fswtw_.percent = Mathf.Lerp(arg_173_1.var_.oldValueTypewriter, var_176_12, var_176_17)
				arg_173_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_173_1.fswtw_:SetDirty()
			end

			if arg_173_1.time_ >= var_176_7 + var_176_16 and arg_173_1.time_ < var_176_7 + var_176_16 + arg_176_0 then
				arg_173_1.fswtw_.percent = var_176_12

				arg_173_1.fswtw_:SetDirty()
				arg_173_1:ShowNextGo(true)

				arg_173_1.typewritterCharCountI18N = var_176_13
			end

			local var_176_18 = 0

			if var_176_18 < arg_173_1.time_ and arg_173_1.time_ <= var_176_18 + arg_176_0 then
				local var_176_19 = manager.ui.mainCamera.transform.localPosition
				local var_176_20 = Vector3.New(0, 0, 10) + Vector3.New(var_176_19.x, var_176_19.y, 0)
				local var_176_21 = arg_173_1.bgs_.STblack

				var_176_21.transform.localPosition = var_176_20
				var_176_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_176_22 = var_176_21:GetComponent("SpriteRenderer")

				if var_176_22 and var_176_22.sprite then
					local var_176_23 = (var_176_21.transform.localPosition - var_176_19).z
					local var_176_24 = manager.ui.mainCameraCom_
					local var_176_25 = 2 * var_176_23 * Mathf.Tan(var_176_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_176_26 = var_176_25 * var_176_24.aspect
					local var_176_27 = var_176_22.sprite.bounds.size.x
					local var_176_28 = var_176_22.sprite.bounds.size.y
					local var_176_29 = var_176_26 / var_176_27
					local var_176_30 = var_176_25 / var_176_28
					local var_176_31 = var_176_30 < var_176_29 and var_176_29 or var_176_30

					var_176_21.transform.localScale = Vector3.New(var_176_31, var_176_31, 0)
				end

				for iter_176_0, iter_176_1 in pairs(arg_173_1.bgs_) do
					if iter_176_0 ~= "STblack" then
						iter_176_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_176_32 = 1.36666666666667
			local var_176_33 = 1.633
			local var_176_34 = manager.audio:GetVoiceLength("story_v_out_319891", "319891041", "story_v_out_319891.awb") / 1000

			if var_176_34 > 0 and var_176_33 < var_176_34 and var_176_34 + var_176_32 > arg_173_1.duration_ then
				local var_176_35 = var_176_34

				arg_173_1.duration_ = var_176_34 + var_176_32
			end

			if var_176_32 < arg_173_1.time_ and arg_173_1.time_ <= var_176_32 + arg_176_0 then
				local var_176_36 = "play"
				local var_176_37 = "voice"

				arg_173_1:AudioAction(var_176_36, var_176_37, "story_v_out_319891", "319891041", "story_v_out_319891.awb")
			end

			local var_176_38 = 0

			if var_176_38 < arg_173_1.time_ and arg_173_1.time_ <= var_176_38 + arg_176_0 then
				arg_173_1.cswbg_:SetActive(true)

				local var_176_39 = arg_173_1.cswt_:GetComponent("RectTransform")

				arg_173_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_176_39.offsetMin = Vector2.New(410, 330)
				var_176_39.offsetMax = Vector2.New(-400, -175)

				local var_176_40 = arg_173_1:GetWordFromCfg(419071)
				local var_176_41 = arg_173_1:FormatText(var_176_40.content)

				arg_173_1.cswt_.text = var_176_41

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.cswt_)

				arg_173_1.cswt_.fontSize = 180
				arg_173_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_173_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891042 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 319891042
		arg_177_1.duration_ = 5.33333333333333

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play319891043(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.fswbg_:SetActive(false)
				arg_177_1.dialog_:SetActive(false)
				arg_177_1:ShowNextGo(false)
			end

			local var_180_1 = 0.1

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.fswbg_:SetActive(false)
				arg_177_1.dialog_:SetActive(false)
				arg_177_1:ShowNextGo(false)
			end

			local var_180_2 = 0

			if var_180_2 < arg_177_1.time_ and arg_177_1.time_ <= var_180_2 + arg_180_0 then
				arg_177_1.cswbg_:SetActive(false)
			end

			local var_180_3 = 0

			if var_180_3 < arg_177_1.time_ and arg_177_1.time_ <= var_180_3 + arg_180_0 then
				local var_180_4 = manager.ui.mainCamera.transform.localPosition
				local var_180_5 = Vector3.New(0, 0, 10) + Vector3.New(var_180_4.x, var_180_4.y, 0)
				local var_180_6 = arg_177_1.bgs_.ST15a

				var_180_6.transform.localPosition = var_180_5
				var_180_6.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_180_7 = var_180_6:GetComponent("SpriteRenderer")

				if var_180_7 and var_180_7.sprite then
					local var_180_8 = (var_180_6.transform.localPosition - var_180_4).z
					local var_180_9 = manager.ui.mainCameraCom_
					local var_180_10 = 2 * var_180_8 * Mathf.Tan(var_180_9.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_180_11 = var_180_10 * var_180_9.aspect
					local var_180_12 = var_180_7.sprite.bounds.size.x
					local var_180_13 = var_180_7.sprite.bounds.size.y
					local var_180_14 = var_180_11 / var_180_12
					local var_180_15 = var_180_10 / var_180_13
					local var_180_16 = var_180_15 < var_180_14 and var_180_14 or var_180_15

					var_180_6.transform.localScale = Vector3.New(var_180_16, var_180_16, 0)
				end

				for iter_180_0, iter_180_1 in pairs(arg_177_1.bgs_) do
					if iter_180_0 ~= "ST15a" then
						iter_180_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_177_1.frameCnt_ <= 1 then
				arg_177_1.dialog_:SetActive(false)
			end

			local var_180_17 = 0.333333333333333
			local var_180_18 = 1.075

			if var_180_17 < arg_177_1.time_ and arg_177_1.time_ <= var_180_17 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0

				arg_177_1.dialog_:SetActive(true)

				local var_180_19 = LeanTween.value(arg_177_1.dialog_, 0, 1, 0.3)

				var_180_19:setOnUpdate(LuaHelper.FloatAction(function(arg_181_0)
					arg_177_1.dialogCg_.alpha = arg_181_0
				end))
				var_180_19:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_177_1.dialog_)
					var_180_19:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_177_1.duration_ = arg_177_1.duration_ + 0.3

				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_20 = arg_177_1:GetWordFromCfg(319891042)
				local var_180_21 = arg_177_1:FormatText(var_180_20.content)

				arg_177_1.text_.text = var_180_21

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_22 = 43
				local var_180_23 = utf8.len(var_180_21)
				local var_180_24 = var_180_22 <= 0 and var_180_18 or var_180_18 * (var_180_23 / var_180_22)

				if var_180_24 > 0 and var_180_18 < var_180_24 then
					arg_177_1.talkMaxDuration = var_180_24
					var_180_17 = var_180_17 + 0.3

					if var_180_24 + var_180_17 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_24 + var_180_17
					end
				end

				arg_177_1.text_.text = var_180_21
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_25 = var_180_17 + 0.3
			local var_180_26 = math.max(var_180_18, arg_177_1.talkMaxDuration)

			if var_180_25 <= arg_177_1.time_ and arg_177_1.time_ < var_180_25 + var_180_26 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_25) / var_180_26

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_25 + var_180_26 and arg_177_1.time_ < var_180_25 + var_180_26 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play319891043 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 319891043
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play319891044(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.85

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_2 = arg_183_1:GetWordFromCfg(319891043)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 34
				local var_186_5 = utf8.len(var_186_3)
				local var_186_6 = var_186_4 <= 0 and var_186_1 or var_186_1 * (var_186_5 / var_186_4)

				if var_186_6 > 0 and var_186_1 < var_186_6 then
					arg_183_1.talkMaxDuration = var_186_6

					if var_186_6 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_6 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_3
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_7 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_7 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_7

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_7 and arg_183_1.time_ < var_186_0 + var_186_7 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play319891044 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 319891044
		arg_187_1.duration_ = 5.66666666666667

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play319891045(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = manager.ui.mainCamera.transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				local var_190_2 = arg_187_1.var_.effect191

				if not var_190_2 then
					var_190_2 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_190_2.name = "191"
					arg_187_1.var_.effect191 = var_190_2
				end

				local var_190_3 = var_190_0:Find("")

				if var_190_3 then
					var_190_2.transform.parent = var_190_3
				else
					var_190_2.transform.parent = var_190_0
				end

				var_190_2.transform.localPosition = Vector3.New(0, 0, 0)
				var_190_2.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_190_4 = manager.ui.mainCamera.transform
			local var_190_5 = 1.13333333333333

			if var_190_5 < arg_187_1.time_ and arg_187_1.time_ <= var_190_5 + arg_190_0 then
				local var_190_6 = arg_187_1.var_.effect191

				if var_190_6 then
					Object.Destroy(var_190_6)

					arg_187_1.var_.effect191 = nil
				end
			end

			local var_190_7 = 0.666666666666667
			local var_190_8 = 1.675

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_9 = arg_187_1:GetWordFromCfg(319891044)
				local var_190_10 = arg_187_1:FormatText(var_190_9.content)

				arg_187_1.text_.text = var_190_10

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_11 = 67
				local var_190_12 = utf8.len(var_190_10)
				local var_190_13 = var_190_11 <= 0 and var_190_8 or var_190_8 * (var_190_12 / var_190_11)

				if var_190_13 > 0 and var_190_8 < var_190_13 then
					arg_187_1.talkMaxDuration = var_190_13

					if var_190_13 + var_190_7 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_13 + var_190_7
					end
				end

				arg_187_1.text_.text = var_190_10
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_14 = math.max(var_190_8, arg_187_1.talkMaxDuration)

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_14 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_7) / var_190_14

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_7 + var_190_14 and arg_187_1.time_ < var_190_7 + var_190_14 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play319891045 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 319891045
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play319891046(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.95

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

				local var_194_2 = arg_191_1:GetWordFromCfg(319891045)
				local var_194_3 = arg_191_1:FormatText(var_194_2.content)

				arg_191_1.text_.text = var_194_3

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_4 = 38
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
	Play319891046 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 319891046
		arg_195_1.duration_ = 5.299666666666

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play319891047(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				local var_198_1 = arg_195_1.fswbg_.transform:Find("textbox/adapt/content") or arg_195_1.fswbg_.transform:Find("textbox/content")
				local var_198_2 = var_198_1:GetComponent("Text")
				local var_198_3 = var_198_1:GetComponent("RectTransform")

				var_198_2.alignment = UnityEngine.TextAnchor.LowerCenter
				var_198_3.offsetMin = Vector2.New(0, 0)
				var_198_3.offsetMax = Vector2.New(0, 0)
			end

			local var_198_4 = 0

			if var_198_4 < arg_195_1.time_ and arg_195_1.time_ <= var_198_4 + arg_198_0 then
				arg_195_1.fswbg_:SetActive(true)
				arg_195_1.dialog_:SetActive(false)

				arg_195_1.fswtw_.percent = 0

				local var_198_5 = arg_195_1:GetWordFromCfg(319891046)
				local var_198_6 = arg_195_1:FormatText(var_198_5.content)

				arg_195_1.fswt_.text = var_198_6

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.fswt_)

				arg_195_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_195_1.fswtw_:SetDirty()

				arg_195_1.typewritterCharCountI18N = 0

				SetActive(arg_195_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_195_1:ShowNextGo(false)
			end

			local var_198_7 = 0.666666666666667

			if var_198_7 < arg_195_1.time_ and arg_195_1.time_ <= var_198_7 + arg_198_0 then
				arg_195_1.var_.oldValueTypewriter = arg_195_1.fswtw_.percent

				arg_195_1:ShowNextGo(false)
			end

			local var_198_8 = 22
			local var_198_9 = 1.46666666666667
			local var_198_10 = arg_195_1:GetWordFromCfg(319891046)
			local var_198_11 = arg_195_1:FormatText(var_198_10.content)
			local var_198_12, var_198_13 = arg_195_1:GetPercentByPara(var_198_11, 1)

			if var_198_7 < arg_195_1.time_ and arg_195_1.time_ <= var_198_7 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0

				local var_198_14 = var_198_8 <= 0 and var_198_9 or var_198_9 * ((var_198_13 - arg_195_1.typewritterCharCountI18N) / var_198_8)

				if var_198_14 > 0 and var_198_9 < var_198_14 then
					arg_195_1.talkMaxDuration = var_198_14

					if var_198_14 + var_198_7 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_14 + var_198_7
					end
				end
			end

			local var_198_15 = 1.46666666666667
			local var_198_16 = math.max(var_198_15, arg_195_1.talkMaxDuration)

			if var_198_7 <= arg_195_1.time_ and arg_195_1.time_ < var_198_7 + var_198_16 then
				local var_198_17 = (arg_195_1.time_ - var_198_7) / var_198_16

				arg_195_1.fswtw_.percent = Mathf.Lerp(arg_195_1.var_.oldValueTypewriter, var_198_12, var_198_17)
				arg_195_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_195_1.fswtw_:SetDirty()
			end

			if arg_195_1.time_ >= var_198_7 + var_198_16 and arg_195_1.time_ < var_198_7 + var_198_16 + arg_198_0 then
				arg_195_1.fswtw_.percent = var_198_12

				arg_195_1.fswtw_:SetDirty()
				arg_195_1:ShowNextGo(true)

				arg_195_1.typewritterCharCountI18N = var_198_13
			end

			local var_198_18 = 0

			if var_198_18 < arg_195_1.time_ and arg_195_1.time_ <= var_198_18 + arg_198_0 then
				local var_198_19 = manager.ui.mainCamera.transform.localPosition
				local var_198_20 = Vector3.New(0, 0, 10) + Vector3.New(var_198_19.x, var_198_19.y, 0)
				local var_198_21 = arg_195_1.bgs_.STblack

				var_198_21.transform.localPosition = var_198_20
				var_198_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_198_22 = var_198_21:GetComponent("SpriteRenderer")

				if var_198_22 and var_198_22.sprite then
					local var_198_23 = (var_198_21.transform.localPosition - var_198_19).z
					local var_198_24 = manager.ui.mainCameraCom_
					local var_198_25 = 2 * var_198_23 * Mathf.Tan(var_198_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_198_26 = var_198_25 * var_198_24.aspect
					local var_198_27 = var_198_22.sprite.bounds.size.x
					local var_198_28 = var_198_22.sprite.bounds.size.y
					local var_198_29 = var_198_26 / var_198_27
					local var_198_30 = var_198_25 / var_198_28
					local var_198_31 = var_198_30 < var_198_29 and var_198_29 or var_198_30

					var_198_21.transform.localScale = Vector3.New(var_198_31, var_198_31, 0)
				end

				for iter_198_0, iter_198_1 in pairs(arg_195_1.bgs_) do
					if iter_198_0 ~= "STblack" then
						iter_198_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_198_32 = manager.ui.mainCamera.transform
			local var_198_33 = 0

			if var_198_33 < arg_195_1.time_ and arg_195_1.time_ <= var_198_33 + arg_198_0 then
				local var_198_34 = arg_195_1.var_.effect191

				if var_198_34 then
					Object.Destroy(var_198_34)

					arg_195_1.var_.effect191 = nil
				end
			end

			local var_198_35 = 0.666666666666667
			local var_198_36 = 4.633
			local var_198_37 = manager.audio:GetVoiceLength("story_v_out_319891", "319891046", "story_v_out_319891.awb") / 1000

			if var_198_37 > 0 and var_198_36 < var_198_37 and var_198_37 + var_198_35 > arg_195_1.duration_ then
				local var_198_38 = var_198_37

				arg_195_1.duration_ = var_198_37 + var_198_35
			end

			if var_198_35 < arg_195_1.time_ and arg_195_1.time_ <= var_198_35 + arg_198_0 then
				local var_198_39 = "play"
				local var_198_40 = "voice"

				arg_195_1:AudioAction(var_198_39, var_198_40, "story_v_out_319891", "319891046", "story_v_out_319891.awb")
			end

			local var_198_41 = 0

			if var_198_41 < arg_195_1.time_ and arg_195_1.time_ <= var_198_41 + arg_198_0 then
				arg_195_1.cswbg_:SetActive(true)

				local var_198_42 = arg_195_1.cswt_:GetComponent("RectTransform")

				arg_195_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_198_42.offsetMin = Vector2.New(0, 330)
				var_198_42.offsetMax = Vector2.New(0, -180)

				local var_198_43 = arg_195_1:GetWordFromCfg(419072)
				local var_198_44 = arg_195_1:FormatText(var_198_43.content)

				arg_195_1.cswt_.text = var_198_44

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.cswt_)

				arg_195_1.cswt_.fontSize = 175
				arg_195_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_195_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891047 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319891047
		arg_199_1.duration_ = 5.699333333332

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play319891048(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.fswbg_:SetActive(true)
				arg_199_1.dialog_:SetActive(false)

				arg_199_1.fswtw_.percent = 0

				local var_202_1 = arg_199_1:GetWordFromCfg(319891047)
				local var_202_2 = arg_199_1:FormatText(var_202_1.content)

				arg_199_1.fswt_.text = var_202_2

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.fswt_)

				arg_199_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_199_1.fswtw_:SetDirty()

				arg_199_1.typewritterCharCountI18N = 0

				SetActive(arg_199_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_199_1:ShowNextGo(false)
			end

			local var_202_3 = 0.333333333333333

			if var_202_3 < arg_199_1.time_ and arg_199_1.time_ <= var_202_3 + arg_202_0 then
				arg_199_1.var_.oldValueTypewriter = arg_199_1.fswtw_.percent

				arg_199_1:ShowNextGo(false)
			end

			local var_202_4 = 23
			local var_202_5 = 1.53333333333333
			local var_202_6 = arg_199_1:GetWordFromCfg(319891047)
			local var_202_7 = arg_199_1:FormatText(var_202_6.content)
			local var_202_8, var_202_9 = arg_199_1:GetPercentByPara(var_202_7, 1)

			if var_202_3 < arg_199_1.time_ and arg_199_1.time_ <= var_202_3 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0

				local var_202_10 = var_202_4 <= 0 and var_202_5 or var_202_5 * ((var_202_9 - arg_199_1.typewritterCharCountI18N) / var_202_4)

				if var_202_10 > 0 and var_202_5 < var_202_10 then
					arg_199_1.talkMaxDuration = var_202_10

					if var_202_10 + var_202_3 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_10 + var_202_3
					end
				end
			end

			local var_202_11 = 1.53333333333333
			local var_202_12 = math.max(var_202_11, arg_199_1.talkMaxDuration)

			if var_202_3 <= arg_199_1.time_ and arg_199_1.time_ < var_202_3 + var_202_12 then
				local var_202_13 = (arg_199_1.time_ - var_202_3) / var_202_12

				arg_199_1.fswtw_.percent = Mathf.Lerp(arg_199_1.var_.oldValueTypewriter, var_202_8, var_202_13)
				arg_199_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_199_1.fswtw_:SetDirty()
			end

			if arg_199_1.time_ >= var_202_3 + var_202_12 and arg_199_1.time_ < var_202_3 + var_202_12 + arg_202_0 then
				arg_199_1.fswtw_.percent = var_202_8

				arg_199_1.fswtw_:SetDirty()
				arg_199_1:ShowNextGo(true)

				arg_199_1.typewritterCharCountI18N = var_202_9
			end

			local var_202_14 = 0.333333333333333
			local var_202_15 = 5.366
			local var_202_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891047", "story_v_out_319891.awb") / 1000

			if var_202_16 > 0 and var_202_15 < var_202_16 and var_202_16 + var_202_14 > arg_199_1.duration_ then
				local var_202_17 = var_202_16

				arg_199_1.duration_ = var_202_16 + var_202_14
			end

			if var_202_14 < arg_199_1.time_ and arg_199_1.time_ <= var_202_14 + arg_202_0 then
				local var_202_18 = "play"
				local var_202_19 = "voice"

				arg_199_1:AudioAction(var_202_18, var_202_19, "story_v_out_319891", "319891047", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891048 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319891048
		arg_203_1.duration_ = 3.866666666666

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play319891049(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.fswbg_:SetActive(true)
				arg_203_1.dialog_:SetActive(false)

				arg_203_1.fswtw_.percent = 0

				local var_206_1 = arg_203_1:GetWordFromCfg(319891048)
				local var_206_2 = arg_203_1:FormatText(var_206_1.content)

				arg_203_1.fswt_.text = var_206_2

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.fswt_)

				arg_203_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_203_1.fswtw_:SetDirty()

				arg_203_1.typewritterCharCountI18N = 0

				SetActive(arg_203_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_203_1:ShowNextGo(false)
			end

			local var_206_3 = 0.566666666666667

			if var_206_3 < arg_203_1.time_ and arg_203_1.time_ <= var_206_3 + arg_206_0 then
				arg_203_1.var_.oldValueTypewriter = arg_203_1.fswtw_.percent

				arg_203_1:ShowNextGo(false)
			end

			local var_206_4 = 13
			local var_206_5 = 0.866666666666667
			local var_206_6 = arg_203_1:GetWordFromCfg(319891048)
			local var_206_7 = arg_203_1:FormatText(var_206_6.content)
			local var_206_8, var_206_9 = arg_203_1:GetPercentByPara(var_206_7, 1)

			if var_206_3 < arg_203_1.time_ and arg_203_1.time_ <= var_206_3 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0

				local var_206_10 = var_206_4 <= 0 and var_206_5 or var_206_5 * ((var_206_9 - arg_203_1.typewritterCharCountI18N) / var_206_4)

				if var_206_10 > 0 and var_206_5 < var_206_10 then
					arg_203_1.talkMaxDuration = var_206_10

					if var_206_10 + var_206_3 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_10 + var_206_3
					end
				end
			end

			local var_206_11 = 0.866666666666667
			local var_206_12 = math.max(var_206_11, arg_203_1.talkMaxDuration)

			if var_206_3 <= arg_203_1.time_ and arg_203_1.time_ < var_206_3 + var_206_12 then
				local var_206_13 = (arg_203_1.time_ - var_206_3) / var_206_12

				arg_203_1.fswtw_.percent = Mathf.Lerp(arg_203_1.var_.oldValueTypewriter, var_206_8, var_206_13)
				arg_203_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_203_1.fswtw_:SetDirty()
			end

			if arg_203_1.time_ >= var_206_3 + var_206_12 and arg_203_1.time_ < var_206_3 + var_206_12 + arg_206_0 then
				arg_203_1.fswtw_.percent = var_206_8

				arg_203_1.fswtw_:SetDirty()
				arg_203_1:ShowNextGo(true)

				arg_203_1.typewritterCharCountI18N = var_206_9
			end

			local var_206_14 = 0.566666666666667
			local var_206_15 = 3.3
			local var_206_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891048", "story_v_out_319891.awb") / 1000

			if var_206_16 > 0 and var_206_15 < var_206_16 and var_206_16 + var_206_14 > arg_203_1.duration_ then
				local var_206_17 = var_206_16

				arg_203_1.duration_ = var_206_16 + var_206_14
			end

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				local var_206_18 = "play"
				local var_206_19 = "voice"

				arg_203_1:AudioAction(var_206_18, var_206_19, "story_v_out_319891", "319891048", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891049 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 319891049
		arg_207_1.duration_ = 4.732666666666

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play319891050(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.fswbg_:SetActive(true)
				arg_207_1.dialog_:SetActive(false)

				arg_207_1.fswtw_.percent = 0

				local var_210_1 = arg_207_1:GetWordFromCfg(319891049)
				local var_210_2 = arg_207_1:FormatText(var_210_1.content)

				arg_207_1.fswt_.text = var_210_2

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.fswt_)

				arg_207_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_207_1.fswtw_:SetDirty()

				arg_207_1.typewritterCharCountI18N = 0

				SetActive(arg_207_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_207_1:ShowNextGo(false)
			end

			local var_210_3 = 0.766666666666667

			if var_210_3 < arg_207_1.time_ and arg_207_1.time_ <= var_210_3 + arg_210_0 then
				arg_207_1.var_.oldValueTypewriter = arg_207_1.fswtw_.percent

				arg_207_1:ShowNextGo(false)
			end

			local var_210_4 = 14
			local var_210_5 = 0.933333333333333
			local var_210_6 = arg_207_1:GetWordFromCfg(319891049)
			local var_210_7 = arg_207_1:FormatText(var_210_6.content)
			local var_210_8, var_210_9 = arg_207_1:GetPercentByPara(var_210_7, 1)

			if var_210_3 < arg_207_1.time_ and arg_207_1.time_ <= var_210_3 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0

				local var_210_10 = var_210_4 <= 0 and var_210_5 or var_210_5 * ((var_210_9 - arg_207_1.typewritterCharCountI18N) / var_210_4)

				if var_210_10 > 0 and var_210_5 < var_210_10 then
					arg_207_1.talkMaxDuration = var_210_10

					if var_210_10 + var_210_3 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_10 + var_210_3
					end
				end
			end

			local var_210_11 = 0.933333333333333
			local var_210_12 = math.max(var_210_11, arg_207_1.talkMaxDuration)

			if var_210_3 <= arg_207_1.time_ and arg_207_1.time_ < var_210_3 + var_210_12 then
				local var_210_13 = (arg_207_1.time_ - var_210_3) / var_210_12

				arg_207_1.fswtw_.percent = Mathf.Lerp(arg_207_1.var_.oldValueTypewriter, var_210_8, var_210_13)
				arg_207_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_207_1.fswtw_:SetDirty()
			end

			if arg_207_1.time_ >= var_210_3 + var_210_12 and arg_207_1.time_ < var_210_3 + var_210_12 + arg_210_0 then
				arg_207_1.fswtw_.percent = var_210_8

				arg_207_1.fswtw_:SetDirty()
				arg_207_1:ShowNextGo(true)

				arg_207_1.typewritterCharCountI18N = var_210_9
			end

			local var_210_14 = 0.766666666666667
			local var_210_15 = 3.966
			local var_210_16 = manager.audio:GetVoiceLength("story_v_out_319891", "319891049", "story_v_out_319891.awb") / 1000

			if var_210_16 > 0 and var_210_15 < var_210_16 and var_210_16 + var_210_14 > arg_207_1.duration_ then
				local var_210_17 = var_210_16

				arg_207_1.duration_ = var_210_16 + var_210_14
			end

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 then
				local var_210_18 = "play"
				local var_210_19 = "voice"

				arg_207_1:AudioAction(var_210_18, var_210_19, "story_v_out_319891", "319891049", "story_v_out_319891.awb")
			end
		end
	end,
	Play319891050 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 319891050
		arg_211_1.duration_ = 4.499999999999

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play319891051(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				local var_214_2 = "play"
				local var_214_3 = "effect"

				arg_211_1:AudioAction(var_214_2, var_214_3, "se_story_130", "se_story_130_police", "")
			end

			local var_214_4 = 0

			if var_214_4 < arg_211_1.time_ and arg_211_1.time_ <= var_214_4 + arg_214_0 then
				local var_214_5 = arg_211_1.fswbg_.transform:Find("textbox/adapt/content") or arg_211_1.fswbg_.transform:Find("textbox/content")
				local var_214_6 = var_214_5:GetComponent("Text")
				local var_214_7 = var_214_5:GetComponent("RectTransform")

				var_214_6.alignment = UnityEngine.TextAnchor.LowerCenter
				var_214_7.offsetMin = Vector2.New(0, 0)
				var_214_7.offsetMax = Vector2.New(0, 0)
			end

			local var_214_8 = 0

			if var_214_8 < arg_211_1.time_ and arg_211_1.time_ <= var_214_8 + arg_214_0 then
				arg_211_1.fswbg_:SetActive(true)
				arg_211_1.dialog_:SetActive(false)

				arg_211_1.fswtw_.percent = 0

				local var_214_9 = arg_211_1:GetWordFromCfg(319891050)
				local var_214_10 = arg_211_1:FormatText(var_214_9.content)

				arg_211_1.fswt_.text = var_214_10

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.fswt_)

				arg_211_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_211_1.fswtw_:SetDirty()

				arg_211_1.typewritterCharCountI18N = 0

				SetActive(arg_211_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_211_1:ShowNextGo(false)
			end

			local var_214_11 = 1.16666666666667

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1.var_.oldValueTypewriter = arg_211_1.fswtw_.percent

				arg_211_1:ShowNextGo(false)
			end

			local var_214_12 = 50
			local var_214_13 = 3.33333333333333
			local var_214_14 = arg_211_1:GetWordFromCfg(319891050)
			local var_214_15 = arg_211_1:FormatText(var_214_14.content)
			local var_214_16, var_214_17 = arg_211_1:GetPercentByPara(var_214_15, 1)

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0

				local var_214_18 = var_214_12 <= 0 and var_214_13 or var_214_13 * ((var_214_17 - arg_211_1.typewritterCharCountI18N) / var_214_12)

				if var_214_18 > 0 and var_214_13 < var_214_18 then
					arg_211_1.talkMaxDuration = var_214_18

					if var_214_18 + var_214_11 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_18 + var_214_11
					end
				end
			end

			local var_214_19 = 3.33333333333333
			local var_214_20 = math.max(var_214_19, arg_211_1.talkMaxDuration)

			if var_214_11 <= arg_211_1.time_ and arg_211_1.time_ < var_214_11 + var_214_20 then
				local var_214_21 = (arg_211_1.time_ - var_214_11) / var_214_20

				arg_211_1.fswtw_.percent = Mathf.Lerp(arg_211_1.var_.oldValueTypewriter, var_214_16, var_214_21)
				arg_211_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_211_1.fswtw_:SetDirty()
			end

			if arg_211_1.time_ >= var_214_11 + var_214_20 and arg_211_1.time_ < var_214_11 + var_214_20 + arg_214_0 then
				arg_211_1.fswtw_.percent = var_214_16

				arg_211_1.fswtw_:SetDirty()
				arg_211_1:ShowNextGo(true)

				arg_211_1.typewritterCharCountI18N = var_214_17
			end

			local var_214_22 = 0

			if var_214_22 < arg_211_1.time_ and arg_211_1.time_ <= var_214_22 + arg_214_0 then
				local var_214_23 = manager.ui.mainCamera.transform.localPosition
				local var_214_24 = Vector3.New(0, 0, 10) + Vector3.New(var_214_23.x, var_214_23.y, 0)
				local var_214_25 = arg_211_1.bgs_.STblack

				var_214_25.transform.localPosition = var_214_24
				var_214_25.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_214_26 = var_214_25:GetComponent("SpriteRenderer")

				if var_214_26 and var_214_26.sprite then
					local var_214_27 = (var_214_25.transform.localPosition - var_214_23).z
					local var_214_28 = manager.ui.mainCameraCom_
					local var_214_29 = 2 * var_214_27 * Mathf.Tan(var_214_28.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_214_30 = var_214_29 * var_214_28.aspect
					local var_214_31 = var_214_26.sprite.bounds.size.x
					local var_214_32 = var_214_26.sprite.bounds.size.y
					local var_214_33 = var_214_30 / var_214_31
					local var_214_34 = var_214_29 / var_214_32
					local var_214_35 = var_214_34 < var_214_33 and var_214_33 or var_214_34

					var_214_25.transform.localScale = Vector3.New(var_214_35, var_214_35, 0)
				end

				for iter_214_0, iter_214_1 in pairs(arg_211_1.bgs_) do
					if iter_214_0 ~= "STblack" then
						iter_214_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_214_36 = 0

			if var_214_36 < arg_211_1.time_ and arg_211_1.time_ <= var_214_36 + arg_214_0 then
				arg_211_1.cswbg_:SetActive(true)

				local var_214_37 = arg_211_1.cswt_:GetComponent("RectTransform")

				arg_211_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_214_37.offsetMin = Vector2.New(410, 330)
				var_214_37.offsetMax = Vector2.New(-400, -175)

				local var_214_38 = arg_211_1:GetWordFromCfg(419073)
				local var_214_39 = arg_211_1:FormatText(var_214_38.content)

				arg_211_1.cswt_.text = var_214_39

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.cswt_)

				arg_211_1.cswt_.fontSize = 180
				arg_211_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_211_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319891051 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 319891051
		arg_215_1.duration_ = 3.699999999999

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play319891052(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.fswbg_:SetActive(true)
				arg_215_1.dialog_:SetActive(false)

				arg_215_1.fswtw_.percent = 0

				local var_218_1 = arg_215_1:GetWordFromCfg(319891051)
				local var_218_2 = arg_215_1:FormatText(var_218_1.content)

				arg_215_1.fswt_.text = var_218_2

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.fswt_)

				arg_215_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_215_1.fswtw_:SetDirty()

				arg_215_1.typewritterCharCountI18N = 0

				SetActive(arg_215_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_215_1:ShowNextGo(false)
			end

			local var_218_3 = 0.366666666666667

			if var_218_3 < arg_215_1.time_ and arg_215_1.time_ <= var_218_3 + arg_218_0 then
				arg_215_1.var_.oldValueTypewriter = arg_215_1.fswtw_.percent

				arg_215_1:ShowNextGo(false)
			end

			local var_218_4 = 50
			local var_218_5 = 3.33333333333333
			local var_218_6 = arg_215_1:GetWordFromCfg(319891051)
			local var_218_7 = arg_215_1:FormatText(var_218_6.content)
			local var_218_8, var_218_9 = arg_215_1:GetPercentByPara(var_218_7, 1)

			if var_218_3 < arg_215_1.time_ and arg_215_1.time_ <= var_218_3 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0

				local var_218_10 = var_218_4 <= 0 and var_218_5 or var_218_5 * ((var_218_9 - arg_215_1.typewritterCharCountI18N) / var_218_4)

				if var_218_10 > 0 and var_218_5 < var_218_10 then
					arg_215_1.talkMaxDuration = var_218_10

					if var_218_10 + var_218_3 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_10 + var_218_3
					end
				end
			end

			local var_218_11 = 3.33333333333333
			local var_218_12 = math.max(var_218_11, arg_215_1.talkMaxDuration)

			if var_218_3 <= arg_215_1.time_ and arg_215_1.time_ < var_218_3 + var_218_12 then
				local var_218_13 = (arg_215_1.time_ - var_218_3) / var_218_12

				arg_215_1.fswtw_.percent = Mathf.Lerp(arg_215_1.var_.oldValueTypewriter, var_218_8, var_218_13)
				arg_215_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_215_1.fswtw_:SetDirty()
			end

			if arg_215_1.time_ >= var_218_3 + var_218_12 and arg_215_1.time_ < var_218_3 + var_218_12 + arg_218_0 then
				arg_215_1.fswtw_.percent = var_218_8

				arg_215_1.fswtw_:SetDirty()
				arg_215_1:ShowNextGo(true)

				arg_215_1.typewritterCharCountI18N = var_218_9
			end
		end
	end,
	Play319891052 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 319891052
		arg_219_1.duration_ = 4.70833333631357

		local var_219_0 = {
			zh = 3.333333333332,
			ja = 4.70833333631357
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
				arg_219_0:Play319891053(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				local var_222_1 = manager.ui.mainCamera.transform.localPosition
				local var_222_2 = Vector3.New(0, 0, 10) + Vector3.New(var_222_1.x, var_222_1.y, 0)
				local var_222_3 = arg_219_1.bgs_.ST15a

				var_222_3.transform.localPosition = var_222_2
				var_222_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_222_4 = var_222_3:GetComponent("SpriteRenderer")

				if var_222_4 and var_222_4.sprite then
					local var_222_5 = (var_222_3.transform.localPosition - var_222_1).z
					local var_222_6 = manager.ui.mainCameraCom_
					local var_222_7 = 2 * var_222_5 * Mathf.Tan(var_222_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_222_8 = var_222_7 * var_222_6.aspect
					local var_222_9 = var_222_4.sprite.bounds.size.x
					local var_222_10 = var_222_4.sprite.bounds.size.y
					local var_222_11 = var_222_8 / var_222_9
					local var_222_12 = var_222_7 / var_222_10
					local var_222_13 = var_222_12 < var_222_11 and var_222_11 or var_222_12

					var_222_3.transform.localScale = Vector3.New(var_222_13, var_222_13, 0)
				end

				for iter_222_0, iter_222_1 in pairs(arg_219_1.bgs_) do
					if iter_222_0 ~= "ST15a" then
						iter_222_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1.allBtn_.enabled = false
			end

			local var_222_15 = 0.3

			if arg_219_1.time_ >= var_222_14 + var_222_15 and arg_219_1.time_ < var_222_14 + var_222_15 + arg_222_0 then
				arg_219_1.allBtn_.enabled = true
			end

			local var_222_16 = 0

			if var_222_16 < arg_219_1.time_ and arg_219_1.time_ <= var_222_16 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = true

				arg_219_1:SetGaussion(false)
			end

			local var_222_17 = 1.33333333333333

			if var_222_16 <= arg_219_1.time_ and arg_219_1.time_ < var_222_16 + var_222_17 then
				local var_222_18 = (arg_219_1.time_ - var_222_16) / var_222_17
				local var_222_19 = Color.New(0, 0, 0)

				var_222_19.a = Mathf.Lerp(1, 0, var_222_18)
				arg_219_1.mask_.color = var_222_19
			end

			if arg_219_1.time_ >= var_222_16 + var_222_17 and arg_219_1.time_ < var_222_16 + var_222_17 + arg_222_0 then
				local var_222_20 = Color.New(0, 0, 0)
				local var_222_21 = 0

				arg_219_1.mask_.enabled = false
				var_222_20.a = var_222_21
				arg_219_1.mask_.color = var_222_20
			end

			local var_222_22 = arg_219_1.actors_["1084ui_story"].transform
			local var_222_23 = 1.33333333333333

			if var_222_23 < arg_219_1.time_ and arg_219_1.time_ <= var_222_23 + arg_222_0 then
				arg_219_1.var_.moveOldPos1084ui_story = var_222_22.localPosition
			end

			local var_222_24 = 0.001

			if var_222_23 <= arg_219_1.time_ and arg_219_1.time_ < var_222_23 + var_222_24 then
				local var_222_25 = (arg_219_1.time_ - var_222_23) / var_222_24
				local var_222_26 = Vector3.New(0, -0.97, -6)

				var_222_22.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1084ui_story, var_222_26, var_222_25)

				local var_222_27 = manager.ui.mainCamera.transform.position - var_222_22.position

				var_222_22.forward = Vector3.New(var_222_27.x, var_222_27.y, var_222_27.z)

				local var_222_28 = var_222_22.localEulerAngles

				var_222_28.z = 0
				var_222_28.x = 0
				var_222_22.localEulerAngles = var_222_28
			end

			if arg_219_1.time_ >= var_222_23 + var_222_24 and arg_219_1.time_ < var_222_23 + var_222_24 + arg_222_0 then
				var_222_22.localPosition = Vector3.New(0, -0.97, -6)

				local var_222_29 = manager.ui.mainCamera.transform.position - var_222_22.position

				var_222_22.forward = Vector3.New(var_222_29.x, var_222_29.y, var_222_29.z)

				local var_222_30 = var_222_22.localEulerAngles

				var_222_30.z = 0
				var_222_30.x = 0
				var_222_22.localEulerAngles = var_222_30
			end

			local var_222_31 = arg_219_1.actors_["1084ui_story"]
			local var_222_32 = 1.33333333333333

			if var_222_32 < arg_219_1.time_ and arg_219_1.time_ <= var_222_32 + arg_222_0 and arg_219_1.var_.characterEffect1084ui_story == nil then
				arg_219_1.var_.characterEffect1084ui_story = var_222_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_33 = 0.200000002980232

			if var_222_32 <= arg_219_1.time_ and arg_219_1.time_ < var_222_32 + var_222_33 then
				local var_222_34 = (arg_219_1.time_ - var_222_32) / var_222_33

				if arg_219_1.var_.characterEffect1084ui_story then
					arg_219_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_32 + var_222_33 and arg_219_1.time_ < var_222_32 + var_222_33 + arg_222_0 and arg_219_1.var_.characterEffect1084ui_story then
				arg_219_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_222_35 = 1.33333333333333

			if var_222_35 < arg_219_1.time_ and arg_219_1.time_ <= var_222_35 + arg_222_0 then
				arg_219_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_222_36 = 1.33333333333333

			if var_222_36 < arg_219_1.time_ and arg_219_1.time_ <= var_222_36 + arg_222_0 then
				arg_219_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_222_37 = 0

			if var_222_37 < arg_219_1.time_ and arg_219_1.time_ <= var_222_37 + arg_222_0 then
				arg_219_1.fswbg_:SetActive(false)
				arg_219_1.dialog_:SetActive(false)
				arg_219_1:ShowNextGo(false)
			end

			local var_222_38 = 0.1

			if var_222_38 < arg_219_1.time_ and arg_219_1.time_ <= var_222_38 + arg_222_0 then
				arg_219_1.fswbg_:SetActive(false)
				arg_219_1.dialog_:SetActive(false)
				arg_219_1:ShowNextGo(false)
			end

			local var_222_39 = 0

			if var_222_39 < arg_219_1.time_ and arg_219_1.time_ <= var_222_39 + arg_222_0 then
				arg_219_1.cswbg_:SetActive(false)
			end

			if arg_219_1.frameCnt_ <= 1 then
				arg_219_1.dialog_:SetActive(false)
			end

			local var_222_40 = 1.40833333631357
			local var_222_41 = 0.125

			if var_222_40 < arg_219_1.time_ and arg_219_1.time_ <= var_222_40 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0

				arg_219_1.dialog_:SetActive(true)

				local var_222_42 = LeanTween.value(arg_219_1.dialog_, 0, 1, 0.3)

				var_222_42:setOnUpdate(LuaHelper.FloatAction(function(arg_223_0)
					arg_219_1.dialogCg_.alpha = arg_223_0
				end))
				var_222_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_219_1.dialog_)
					var_222_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_219_1.duration_ = arg_219_1.duration_ + 0.3

				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_43 = arg_219_1:FormatText(StoryNameCfg[6].name)

				arg_219_1.leftNameTxt_.text = var_222_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_44 = arg_219_1:GetWordFromCfg(319891052)
				local var_222_45 = arg_219_1:FormatText(var_222_44.content)

				arg_219_1.text_.text = var_222_45

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_46 = 5
				local var_222_47 = utf8.len(var_222_45)
				local var_222_48 = var_222_46 <= 0 and var_222_41 or var_222_41 * (var_222_47 / var_222_46)

				if var_222_48 > 0 and var_222_41 < var_222_48 then
					arg_219_1.talkMaxDuration = var_222_48
					var_222_40 = var_222_40 + 0.3

					if var_222_48 + var_222_40 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_48 + var_222_40
					end
				end

				arg_219_1.text_.text = var_222_45
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891052", "story_v_out_319891.awb") ~= 0 then
					local var_222_49 = manager.audio:GetVoiceLength("story_v_out_319891", "319891052", "story_v_out_319891.awb") / 1000

					if var_222_49 + var_222_40 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_49 + var_222_40
					end

					if var_222_44.prefab_name ~= "" and arg_219_1.actors_[var_222_44.prefab_name] ~= nil then
						local var_222_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_44.prefab_name].transform, "story_v_out_319891", "319891052", "story_v_out_319891.awb")

						arg_219_1:RecordAudio("319891052", var_222_50)
						arg_219_1:RecordAudio("319891052", var_222_50)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_319891", "319891052", "story_v_out_319891.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_319891", "319891052", "story_v_out_319891.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_51 = var_222_40 + 0.3
			local var_222_52 = math.max(var_222_41, arg_219_1.talkMaxDuration)

			if var_222_51 <= arg_219_1.time_ and arg_219_1.time_ < var_222_51 + var_222_52 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_51) / var_222_52

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_51 + var_222_52 and arg_219_1.time_ < var_222_51 + var_222_52 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play319891053 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 319891053
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play319891054(arg_225_1)
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

			local var_228_6 = arg_225_1.actors_["1084ui_story"].transform
			local var_228_7 = 0

			if var_228_7 < arg_225_1.time_ and arg_225_1.time_ <= var_228_7 + arg_228_0 then
				arg_225_1.var_.moveOldPos1084ui_story = var_228_6.localPosition
			end

			local var_228_8 = 0.001

			if var_228_7 <= arg_225_1.time_ and arg_225_1.time_ < var_228_7 + var_228_8 then
				local var_228_9 = (arg_225_1.time_ - var_228_7) / var_228_8
				local var_228_10 = Vector3.New(0, 100, 0)

				var_228_6.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1084ui_story, var_228_10, var_228_9)

				local var_228_11 = manager.ui.mainCamera.transform.position - var_228_6.position

				var_228_6.forward = Vector3.New(var_228_11.x, var_228_11.y, var_228_11.z)

				local var_228_12 = var_228_6.localEulerAngles

				var_228_12.z = 0
				var_228_12.x = 0
				var_228_6.localEulerAngles = var_228_12
			end

			if arg_225_1.time_ >= var_228_7 + var_228_8 and arg_225_1.time_ < var_228_7 + var_228_8 + arg_228_0 then
				var_228_6.localPosition = Vector3.New(0, 100, 0)

				local var_228_13 = manager.ui.mainCamera.transform.position - var_228_6.position

				var_228_6.forward = Vector3.New(var_228_13.x, var_228_13.y, var_228_13.z)

				local var_228_14 = var_228_6.localEulerAngles

				var_228_14.z = 0
				var_228_14.x = 0
				var_228_6.localEulerAngles = var_228_14
			end

			local var_228_15 = 0
			local var_228_16 = 0.975

			if var_228_15 < arg_225_1.time_ and arg_225_1.time_ <= var_228_15 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_17 = arg_225_1:GetWordFromCfg(319891053)
				local var_228_18 = arg_225_1:FormatText(var_228_17.content)

				arg_225_1.text_.text = var_228_18

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_19 = 39
				local var_228_20 = utf8.len(var_228_18)
				local var_228_21 = var_228_19 <= 0 and var_228_16 or var_228_16 * (var_228_20 / var_228_19)

				if var_228_21 > 0 and var_228_16 < var_228_21 then
					arg_225_1.talkMaxDuration = var_228_21

					if var_228_21 + var_228_15 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_21 + var_228_15
					end
				end

				arg_225_1.text_.text = var_228_18
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_22 = math.max(var_228_16, arg_225_1.talkMaxDuration)

			if var_228_15 <= arg_225_1.time_ and arg_225_1.time_ < var_228_15 + var_228_22 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_15) / var_228_22

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_15 + var_228_22 and arg_225_1.time_ < var_228_15 + var_228_22 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play319891054 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 319891054
		arg_229_1.duration_ = 6.9

		local var_229_0 = {
			zh = 4.966,
			ja = 6.9
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
				arg_229_0:Play319891055(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 1

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				local var_232_2 = "stop"
				local var_232_3 = "effect"

				arg_229_1:AudioAction(var_232_2, var_232_3, "se_story_130", "se_story_130_police", "")
			end

			local var_232_4 = arg_229_1.actors_["1084ui_story"].transform
			local var_232_5 = 0

			if var_232_5 < arg_229_1.time_ and arg_229_1.time_ <= var_232_5 + arg_232_0 then
				arg_229_1.var_.moveOldPos1084ui_story = var_232_4.localPosition
			end

			local var_232_6 = 0.001

			if var_232_5 <= arg_229_1.time_ and arg_229_1.time_ < var_232_5 + var_232_6 then
				local var_232_7 = (arg_229_1.time_ - var_232_5) / var_232_6
				local var_232_8 = Vector3.New(0, -0.97, -6)

				var_232_4.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1084ui_story, var_232_8, var_232_7)

				local var_232_9 = manager.ui.mainCamera.transform.position - var_232_4.position

				var_232_4.forward = Vector3.New(var_232_9.x, var_232_9.y, var_232_9.z)

				local var_232_10 = var_232_4.localEulerAngles

				var_232_10.z = 0
				var_232_10.x = 0
				var_232_4.localEulerAngles = var_232_10
			end

			if arg_229_1.time_ >= var_232_5 + var_232_6 and arg_229_1.time_ < var_232_5 + var_232_6 + arg_232_0 then
				var_232_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_232_11 = manager.ui.mainCamera.transform.position - var_232_4.position

				var_232_4.forward = Vector3.New(var_232_11.x, var_232_11.y, var_232_11.z)

				local var_232_12 = var_232_4.localEulerAngles

				var_232_12.z = 0
				var_232_12.x = 0
				var_232_4.localEulerAngles = var_232_12
			end

			local var_232_13 = arg_229_1.actors_["1084ui_story"]
			local var_232_14 = 0

			if var_232_14 < arg_229_1.time_ and arg_229_1.time_ <= var_232_14 + arg_232_0 and arg_229_1.var_.characterEffect1084ui_story == nil then
				arg_229_1.var_.characterEffect1084ui_story = var_232_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_15 = 0.200000002980232

			if var_232_14 <= arg_229_1.time_ and arg_229_1.time_ < var_232_14 + var_232_15 then
				local var_232_16 = (arg_229_1.time_ - var_232_14) / var_232_15

				if arg_229_1.var_.characterEffect1084ui_story then
					arg_229_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_14 + var_232_15 and arg_229_1.time_ < var_232_14 + var_232_15 + arg_232_0 and arg_229_1.var_.characterEffect1084ui_story then
				arg_229_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_232_17 = 0

			if var_232_17 < arg_229_1.time_ and arg_229_1.time_ <= var_232_17 + arg_232_0 then
				arg_229_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_232_18 = 0

			if var_232_18 < arg_229_1.time_ and arg_229_1.time_ <= var_232_18 + arg_232_0 then
				arg_229_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_232_19 = 0
			local var_232_20 = 0.5

			if var_232_19 < arg_229_1.time_ and arg_229_1.time_ <= var_232_19 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_21 = arg_229_1:FormatText(StoryNameCfg[6].name)

				arg_229_1.leftNameTxt_.text = var_232_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_22 = arg_229_1:GetWordFromCfg(319891054)
				local var_232_23 = arg_229_1:FormatText(var_232_22.content)

				arg_229_1.text_.text = var_232_23

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_24 = 20
				local var_232_25 = utf8.len(var_232_23)
				local var_232_26 = var_232_24 <= 0 and var_232_20 or var_232_20 * (var_232_25 / var_232_24)

				if var_232_26 > 0 and var_232_20 < var_232_26 then
					arg_229_1.talkMaxDuration = var_232_26

					if var_232_26 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_26 + var_232_19
					end
				end

				arg_229_1.text_.text = var_232_23
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891054", "story_v_out_319891.awb") ~= 0 then
					local var_232_27 = manager.audio:GetVoiceLength("story_v_out_319891", "319891054", "story_v_out_319891.awb") / 1000

					if var_232_27 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_27 + var_232_19
					end

					if var_232_22.prefab_name ~= "" and arg_229_1.actors_[var_232_22.prefab_name] ~= nil then
						local var_232_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_22.prefab_name].transform, "story_v_out_319891", "319891054", "story_v_out_319891.awb")

						arg_229_1:RecordAudio("319891054", var_232_28)
						arg_229_1:RecordAudio("319891054", var_232_28)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_319891", "319891054", "story_v_out_319891.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_319891", "319891054", "story_v_out_319891.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_29 = math.max(var_232_20, arg_229_1.talkMaxDuration)

			if var_232_19 <= arg_229_1.time_ and arg_229_1.time_ < var_232_19 + var_232_29 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_19) / var_232_29

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_19 + var_232_29 and arg_229_1.time_ < var_232_19 + var_232_29 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play319891055 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 319891055
		arg_233_1.duration_ = 8.833

		local var_233_0 = {
			zh = 7.566,
			ja = 8.833
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
				arg_233_0:Play319891056(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1084ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.characterEffect1084ui_story == nil then
				arg_233_1.var_.characterEffect1084ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.200000002980232

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect1084ui_story then
					local var_236_4 = Mathf.Lerp(0, 0.5, var_236_3)

					arg_233_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1084ui_story.fillRatio = var_236_4
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1084ui_story then
				local var_236_5 = 0.5

				arg_233_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1084ui_story.fillRatio = var_236_5
			end

			local var_236_6 = 0
			local var_236_7 = 0.925

			if var_236_6 < arg_233_1.time_ and arg_233_1.time_ <= var_236_6 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_8 = arg_233_1:FormatText(StoryNameCfg[694].name)

				arg_233_1.leftNameTxt_.text = var_236_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, true)
				arg_233_1.iconController_:SetSelectedState("hero")

				arg_233_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_9 = arg_233_1:GetWordFromCfg(319891055)
				local var_236_10 = arg_233_1:FormatText(var_236_9.content)

				arg_233_1.text_.text = var_236_10

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_11 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891055", "story_v_out_319891.awb") ~= 0 then
					local var_236_14 = manager.audio:GetVoiceLength("story_v_out_319891", "319891055", "story_v_out_319891.awb") / 1000

					if var_236_14 + var_236_6 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_14 + var_236_6
					end

					if var_236_9.prefab_name ~= "" and arg_233_1.actors_[var_236_9.prefab_name] ~= nil then
						local var_236_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_9.prefab_name].transform, "story_v_out_319891", "319891055", "story_v_out_319891.awb")

						arg_233_1:RecordAudio("319891055", var_236_15)
						arg_233_1:RecordAudio("319891055", var_236_15)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_319891", "319891055", "story_v_out_319891.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_319891", "319891055", "story_v_out_319891.awb")
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
	Play319891056 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 319891056
		arg_237_1.duration_ = 3.466

		local var_237_0 = {
			zh = 1.733,
			ja = 3.466
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
				arg_237_0:Play319891057(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.25

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[694].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, true)
				arg_237_1.iconController_:SetSelectedState("hero")

				arg_237_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(319891056)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 10
				local var_240_6 = utf8.len(var_240_4)
				local var_240_7 = var_240_5 <= 0 and var_240_1 or var_240_1 * (var_240_6 / var_240_5)

				if var_240_7 > 0 and var_240_1 < var_240_7 then
					arg_237_1.talkMaxDuration = var_240_7

					if var_240_7 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_7 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_4
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891056", "story_v_out_319891.awb") ~= 0 then
					local var_240_8 = manager.audio:GetVoiceLength("story_v_out_319891", "319891056", "story_v_out_319891.awb") / 1000

					if var_240_8 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_0
					end

					if var_240_3.prefab_name ~= "" and arg_237_1.actors_[var_240_3.prefab_name] ~= nil then
						local var_240_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_3.prefab_name].transform, "story_v_out_319891", "319891056", "story_v_out_319891.awb")

						arg_237_1:RecordAudio("319891056", var_240_9)
						arg_237_1:RecordAudio("319891056", var_240_9)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_319891", "319891056", "story_v_out_319891.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_319891", "319891056", "story_v_out_319891.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_10 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_10 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_10

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_10 and arg_237_1.time_ < var_240_0 + var_240_10 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play319891057 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 319891057
		arg_241_1.duration_ = 5.9

		local var_241_0 = {
			zh = 1.999999999999,
			ja = 5.9
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
				arg_241_0:Play319891058(arg_241_1)
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
					arg_241_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1084ui_story then
				arg_241_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_244_4 = 0

			if var_244_4 < arg_241_1.time_ and arg_241_1.time_ <= var_244_4 + arg_244_0 then
				arg_241_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_244_5 = 0

			if var_244_5 < arg_241_1.time_ and arg_241_1.time_ <= var_244_5 + arg_244_0 then
				arg_241_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_244_6 = 0
			local var_244_7 = 0.275

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_8 = arg_241_1:FormatText(StoryNameCfg[6].name)

				arg_241_1.leftNameTxt_.text = var_244_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_9 = arg_241_1:GetWordFromCfg(319891057)
				local var_244_10 = arg_241_1:FormatText(var_244_9.content)

				arg_241_1.text_.text = var_244_10

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_11 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891057", "story_v_out_319891.awb") ~= 0 then
					local var_244_14 = manager.audio:GetVoiceLength("story_v_out_319891", "319891057", "story_v_out_319891.awb") / 1000

					if var_244_14 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_14 + var_244_6
					end

					if var_244_9.prefab_name ~= "" and arg_241_1.actors_[var_244_9.prefab_name] ~= nil then
						local var_244_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_9.prefab_name].transform, "story_v_out_319891", "319891057", "story_v_out_319891.awb")

						arg_241_1:RecordAudio("319891057", var_244_15)
						arg_241_1:RecordAudio("319891057", var_244_15)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_319891", "319891057", "story_v_out_319891.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_319891", "319891057", "story_v_out_319891.awb")
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
	Play319891058 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 319891058
		arg_245_1.duration_ = 8.6

		local var_245_0 = {
			zh = 5.633,
			ja = 8.6
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
				arg_245_0:Play319891059(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1084ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1084ui_story == nil then
				arg_245_1.var_.characterEffect1084ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1084ui_story then
					local var_248_4 = Mathf.Lerp(0, 0.5, var_248_3)

					arg_245_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1084ui_story.fillRatio = var_248_4
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1084ui_story then
				local var_248_5 = 0.5

				arg_245_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1084ui_story.fillRatio = var_248_5
			end

			local var_248_6 = 0
			local var_248_7 = 0.55

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_8 = arg_245_1:FormatText(StoryNameCfg[694].name)

				arg_245_1.leftNameTxt_.text = var_248_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, true)
				arg_245_1.iconController_:SetSelectedState("hero")

				arg_245_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_9 = arg_245_1:GetWordFromCfg(319891058)
				local var_248_10 = arg_245_1:FormatText(var_248_9.content)

				arg_245_1.text_.text = var_248_10

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_11 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891058", "story_v_out_319891.awb") ~= 0 then
					local var_248_14 = manager.audio:GetVoiceLength("story_v_out_319891", "319891058", "story_v_out_319891.awb") / 1000

					if var_248_14 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_14 + var_248_6
					end

					if var_248_9.prefab_name ~= "" and arg_245_1.actors_[var_248_9.prefab_name] ~= nil then
						local var_248_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_9.prefab_name].transform, "story_v_out_319891", "319891058", "story_v_out_319891.awb")

						arg_245_1:RecordAudio("319891058", var_248_15)
						arg_245_1:RecordAudio("319891058", var_248_15)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_319891", "319891058", "story_v_out_319891.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_319891", "319891058", "story_v_out_319891.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_16 = math.max(var_248_7, arg_245_1.talkMaxDuration)

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_16 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_6) / var_248_16

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_6 + var_248_16 and arg_245_1.time_ < var_248_6 + var_248_16 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play319891059 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 319891059
		arg_249_1.duration_ = 8.8

		local var_249_0 = {
			zh = 5.433,
			ja = 8.8
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
				arg_249_0:Play319891060(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.65

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[694].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, true)
				arg_249_1.iconController_:SetSelectedState("hero")

				arg_249_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(319891059)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 26
				local var_252_6 = utf8.len(var_252_4)
				local var_252_7 = var_252_5 <= 0 and var_252_1 or var_252_1 * (var_252_6 / var_252_5)

				if var_252_7 > 0 and var_252_1 < var_252_7 then
					arg_249_1.talkMaxDuration = var_252_7

					if var_252_7 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_7 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_4
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891059", "story_v_out_319891.awb") ~= 0 then
					local var_252_8 = manager.audio:GetVoiceLength("story_v_out_319891", "319891059", "story_v_out_319891.awb") / 1000

					if var_252_8 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_0
					end

					if var_252_3.prefab_name ~= "" and arg_249_1.actors_[var_252_3.prefab_name] ~= nil then
						local var_252_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_3.prefab_name].transform, "story_v_out_319891", "319891059", "story_v_out_319891.awb")

						arg_249_1:RecordAudio("319891059", var_252_9)
						arg_249_1:RecordAudio("319891059", var_252_9)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_319891", "319891059", "story_v_out_319891.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_319891", "319891059", "story_v_out_319891.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_10 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_10 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_10

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_10 and arg_249_1.time_ < var_252_0 + var_252_10 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play319891060 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 319891060
		arg_253_1.duration_ = 14.5

		local var_253_0 = {
			zh = 6.1,
			ja = 14.5
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
				arg_253_0:Play319891061(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_256_1 = 0
			local var_256_2 = 0.8

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_3 = arg_253_1:FormatText(StoryNameCfg[694].name)

				arg_253_1.leftNameTxt_.text = var_256_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, true)
				arg_253_1.iconController_:SetSelectedState("hero")

				arg_253_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_4 = arg_253_1:GetWordFromCfg(319891060)
				local var_256_5 = arg_253_1:FormatText(var_256_4.content)

				arg_253_1.text_.text = var_256_5

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_6 = 32
				local var_256_7 = utf8.len(var_256_5)
				local var_256_8 = var_256_6 <= 0 and var_256_2 or var_256_2 * (var_256_7 / var_256_6)

				if var_256_8 > 0 and var_256_2 < var_256_8 then
					arg_253_1.talkMaxDuration = var_256_8

					if var_256_8 + var_256_1 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_1
					end
				end

				arg_253_1.text_.text = var_256_5
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891060", "story_v_out_319891.awb") ~= 0 then
					local var_256_9 = manager.audio:GetVoiceLength("story_v_out_319891", "319891060", "story_v_out_319891.awb") / 1000

					if var_256_9 + var_256_1 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_9 + var_256_1
					end

					if var_256_4.prefab_name ~= "" and arg_253_1.actors_[var_256_4.prefab_name] ~= nil then
						local var_256_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_4.prefab_name].transform, "story_v_out_319891", "319891060", "story_v_out_319891.awb")

						arg_253_1:RecordAudio("319891060", var_256_10)
						arg_253_1:RecordAudio("319891060", var_256_10)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_319891", "319891060", "story_v_out_319891.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_319891", "319891060", "story_v_out_319891.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_11 = math.max(var_256_2, arg_253_1.talkMaxDuration)

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_11 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_1) / var_256_11

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_1 + var_256_11 and arg_253_1.time_ < var_256_1 + var_256_11 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play319891061 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 319891061
		arg_257_1.duration_ = 8.90066666851441

		local var_257_0 = {
			zh = 6.83366666851441,
			ja = 8.90066666851441
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
				arg_257_0:Play319891062(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = "ST74a"

			if arg_257_1.bgs_[var_260_0] == nil then
				local var_260_1 = Object.Instantiate(arg_257_1.paintGo_)

				var_260_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_260_0)
				var_260_1.name = var_260_0
				var_260_1.transform.parent = arg_257_1.stage_.transform
				var_260_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_257_1.bgs_[var_260_0] = var_260_1
			end

			local var_260_2 = 2

			if var_260_2 < arg_257_1.time_ and arg_257_1.time_ <= var_260_2 + arg_260_0 then
				local var_260_3 = manager.ui.mainCamera.transform.localPosition
				local var_260_4 = Vector3.New(0, 0, 10) + Vector3.New(var_260_3.x, var_260_3.y, 0)
				local var_260_5 = arg_257_1.bgs_.ST74a

				var_260_5.transform.localPosition = var_260_4
				var_260_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_260_6 = var_260_5:GetComponent("SpriteRenderer")

				if var_260_6 and var_260_6.sprite then
					local var_260_7 = (var_260_5.transform.localPosition - var_260_3).z
					local var_260_8 = manager.ui.mainCameraCom_
					local var_260_9 = 2 * var_260_7 * Mathf.Tan(var_260_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_260_10 = var_260_9 * var_260_8.aspect
					local var_260_11 = var_260_6.sprite.bounds.size.x
					local var_260_12 = var_260_6.sprite.bounds.size.y
					local var_260_13 = var_260_10 / var_260_11
					local var_260_14 = var_260_9 / var_260_12
					local var_260_15 = var_260_14 < var_260_13 and var_260_13 or var_260_14

					var_260_5.transform.localScale = Vector3.New(var_260_15, var_260_15, 0)
				end

				for iter_260_0, iter_260_1 in pairs(arg_257_1.bgs_) do
					if iter_260_0 ~= "ST74a" then
						iter_260_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_260_16 = 0

			if var_260_16 < arg_257_1.time_ and arg_257_1.time_ <= var_260_16 + arg_260_0 then
				arg_257_1.allBtn_.enabled = false
			end

			local var_260_17 = 0.3

			if arg_257_1.time_ >= var_260_16 + var_260_17 and arg_257_1.time_ < var_260_16 + var_260_17 + arg_260_0 then
				arg_257_1.allBtn_.enabled = true
			end

			local var_260_18 = 0

			if var_260_18 < arg_257_1.time_ and arg_257_1.time_ <= var_260_18 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_19 = 2

			if var_260_18 <= arg_257_1.time_ and arg_257_1.time_ < var_260_18 + var_260_19 then
				local var_260_20 = (arg_257_1.time_ - var_260_18) / var_260_19
				local var_260_21 = Color.New(0, 0, 0)

				var_260_21.a = Mathf.Lerp(0, 1, var_260_20)
				arg_257_1.mask_.color = var_260_21
			end

			if arg_257_1.time_ >= var_260_18 + var_260_19 and arg_257_1.time_ < var_260_18 + var_260_19 + arg_260_0 then
				local var_260_22 = Color.New(0, 0, 0)

				var_260_22.a = 1
				arg_257_1.mask_.color = var_260_22
			end

			local var_260_23 = 2

			if var_260_23 < arg_257_1.time_ and arg_257_1.time_ <= var_260_23 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_24 = 2

			if var_260_23 <= arg_257_1.time_ and arg_257_1.time_ < var_260_23 + var_260_24 then
				local var_260_25 = (arg_257_1.time_ - var_260_23) / var_260_24
				local var_260_26 = Color.New(0, 0, 0)

				var_260_26.a = Mathf.Lerp(1, 0, var_260_25)
				arg_257_1.mask_.color = var_260_26
			end

			if arg_257_1.time_ >= var_260_23 + var_260_24 and arg_257_1.time_ < var_260_23 + var_260_24 + arg_260_0 then
				local var_260_27 = Color.New(0, 0, 0)
				local var_260_28 = 0

				arg_257_1.mask_.enabled = false
				var_260_27.a = var_260_28
				arg_257_1.mask_.color = var_260_27
			end

			local var_260_29 = "4040ui_story"

			if arg_257_1.actors_[var_260_29] == nil then
				local var_260_30 = Object.Instantiate(Asset.Load("Char/" .. var_260_29), arg_257_1.stage_.transform)

				var_260_30.name = var_260_29
				var_260_30.transform.localPosition = Vector3.New(0, 100, 0)
				arg_257_1.actors_[var_260_29] = var_260_30

				local var_260_31 = var_260_30:GetComponentInChildren(typeof(CharacterEffect))

				var_260_31.enabled = true

				local var_260_32 = GameObjectTools.GetOrAddComponent(var_260_30, typeof(DynamicBoneHelper))

				if var_260_32 then
					var_260_32:EnableDynamicBone(false)
				end

				arg_257_1:ShowWeapon(var_260_31.transform, false)

				arg_257_1.var_[var_260_29 .. "Animator"] = var_260_31.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_257_1.var_[var_260_29 .. "Animator"].applyRootMotion = true
				arg_257_1.var_[var_260_29 .. "LipSync"] = var_260_31.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_260_33 = arg_257_1.actors_["4040ui_story"].transform
			local var_260_34 = 3.86666666666667

			if var_260_34 < arg_257_1.time_ and arg_257_1.time_ <= var_260_34 + arg_260_0 then
				arg_257_1.var_.moveOldPos4040ui_story = var_260_33.localPosition
			end

			local var_260_35 = 0.001

			if var_260_34 <= arg_257_1.time_ and arg_257_1.time_ < var_260_34 + var_260_35 then
				local var_260_36 = (arg_257_1.time_ - var_260_34) / var_260_35
				local var_260_37 = Vector3.New(0, -1.55, -5.5)

				var_260_33.localPosition = Vector3.Lerp(arg_257_1.var_.moveOldPos4040ui_story, var_260_37, var_260_36)

				local var_260_38 = manager.ui.mainCamera.transform.position - var_260_33.position

				var_260_33.forward = Vector3.New(var_260_38.x, var_260_38.y, var_260_38.z)

				local var_260_39 = var_260_33.localEulerAngles

				var_260_39.z = 0
				var_260_39.x = 0
				var_260_33.localEulerAngles = var_260_39
			end

			if arg_257_1.time_ >= var_260_34 + var_260_35 and arg_257_1.time_ < var_260_34 + var_260_35 + arg_260_0 then
				var_260_33.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_260_40 = manager.ui.mainCamera.transform.position - var_260_33.position

				var_260_33.forward = Vector3.New(var_260_40.x, var_260_40.y, var_260_40.z)

				local var_260_41 = var_260_33.localEulerAngles

				var_260_41.z = 0
				var_260_41.x = 0
				var_260_33.localEulerAngles = var_260_41
			end

			local var_260_42 = arg_257_1.actors_["4040ui_story"]
			local var_260_43 = 3.86666666666667

			if var_260_43 < arg_257_1.time_ and arg_257_1.time_ <= var_260_43 + arg_260_0 and arg_257_1.var_.characterEffect4040ui_story == nil then
				arg_257_1.var_.characterEffect4040ui_story = var_260_42:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_44 = 0.200000002980232

			if var_260_43 <= arg_257_1.time_ and arg_257_1.time_ < var_260_43 + var_260_44 then
				local var_260_45 = (arg_257_1.time_ - var_260_43) / var_260_44

				if arg_257_1.var_.characterEffect4040ui_story then
					arg_257_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_43 + var_260_44 and arg_257_1.time_ < var_260_43 + var_260_44 + arg_260_0 and arg_257_1.var_.characterEffect4040ui_story then
				arg_257_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_260_46 = 3.86666666666667

			if var_260_46 < arg_257_1.time_ and arg_257_1.time_ <= var_260_46 + arg_260_0 then
				arg_257_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_260_47 = 3.86666666666667

			if var_260_47 < arg_257_1.time_ and arg_257_1.time_ <= var_260_47 + arg_260_0 then
				arg_257_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_260_48 = arg_257_1.actors_["1084ui_story"].transform
			local var_260_49 = 2

			if var_260_49 < arg_257_1.time_ and arg_257_1.time_ <= var_260_49 + arg_260_0 then
				arg_257_1.var_.moveOldPos1084ui_story = var_260_48.localPosition
			end

			local var_260_50 = 0.001

			if var_260_49 <= arg_257_1.time_ and arg_257_1.time_ < var_260_49 + var_260_50 then
				local var_260_51 = (arg_257_1.time_ - var_260_49) / var_260_50
				local var_260_52 = Vector3.New(0, 100, 0)

				var_260_48.localPosition = Vector3.Lerp(arg_257_1.var_.moveOldPos1084ui_story, var_260_52, var_260_51)

				local var_260_53 = manager.ui.mainCamera.transform.position - var_260_48.position

				var_260_48.forward = Vector3.New(var_260_53.x, var_260_53.y, var_260_53.z)

				local var_260_54 = var_260_48.localEulerAngles

				var_260_54.z = 0
				var_260_54.x = 0
				var_260_48.localEulerAngles = var_260_54
			end

			if arg_257_1.time_ >= var_260_49 + var_260_50 and arg_257_1.time_ < var_260_49 + var_260_50 + arg_260_0 then
				var_260_48.localPosition = Vector3.New(0, 100, 0)

				local var_260_55 = manager.ui.mainCamera.transform.position - var_260_48.position

				var_260_48.forward = Vector3.New(var_260_55.x, var_260_55.y, var_260_55.z)

				local var_260_56 = var_260_48.localEulerAngles

				var_260_56.z = 0
				var_260_56.x = 0
				var_260_48.localEulerAngles = var_260_56
			end

			local var_260_57 = 0
			local var_260_58 = 1

			if var_260_57 < arg_257_1.time_ and arg_257_1.time_ <= var_260_57 + arg_260_0 then
				local var_260_59 = "stop"
				local var_260_60 = "effect"

				arg_257_1:AudioAction(var_260_59, var_260_60, "se_story_130", "se_story_130_sea", "")
			end

			if arg_257_1.frameCnt_ <= 1 then
				arg_257_1.dialog_:SetActive(false)
			end

			local var_260_61 = 3.90066666851441
			local var_260_62 = 0.325

			if var_260_61 < arg_257_1.time_ and arg_257_1.time_ <= var_260_61 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0

				arg_257_1.dialog_:SetActive(true)

				local var_260_63 = LeanTween.value(arg_257_1.dialog_, 0, 1, 0.3)

				var_260_63:setOnUpdate(LuaHelper.FloatAction(function(arg_261_0)
					arg_257_1.dialogCg_.alpha = arg_261_0
				end))
				var_260_63:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_257_1.dialog_)
					var_260_63:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_257_1.duration_ = arg_257_1.duration_ + 0.3

				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_64 = arg_257_1:FormatText(StoryNameCfg[668].name)

				arg_257_1.leftNameTxt_.text = var_260_64

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_65 = arg_257_1:GetWordFromCfg(319891061)
				local var_260_66 = arg_257_1:FormatText(var_260_65.content)

				arg_257_1.text_.text = var_260_66

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_67 = 13
				local var_260_68 = utf8.len(var_260_66)
				local var_260_69 = var_260_67 <= 0 and var_260_62 or var_260_62 * (var_260_68 / var_260_67)

				if var_260_69 > 0 and var_260_62 < var_260_69 then
					arg_257_1.talkMaxDuration = var_260_69
					var_260_61 = var_260_61 + 0.3

					if var_260_69 + var_260_61 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_69 + var_260_61
					end
				end

				arg_257_1.text_.text = var_260_66
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891061", "story_v_out_319891.awb") ~= 0 then
					local var_260_70 = manager.audio:GetVoiceLength("story_v_out_319891", "319891061", "story_v_out_319891.awb") / 1000

					if var_260_70 + var_260_61 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_70 + var_260_61
					end

					if var_260_65.prefab_name ~= "" and arg_257_1.actors_[var_260_65.prefab_name] ~= nil then
						local var_260_71 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_65.prefab_name].transform, "story_v_out_319891", "319891061", "story_v_out_319891.awb")

						arg_257_1:RecordAudio("319891061", var_260_71)
						arg_257_1:RecordAudio("319891061", var_260_71)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_319891", "319891061", "story_v_out_319891.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_319891", "319891061", "story_v_out_319891.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_72 = var_260_61 + 0.3
			local var_260_73 = math.max(var_260_62, arg_257_1.talkMaxDuration)

			if var_260_72 <= arg_257_1.time_ and arg_257_1.time_ < var_260_72 + var_260_73 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_72) / var_260_73

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_72 + var_260_73 and arg_257_1.time_ < var_260_72 + var_260_73 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play319891062 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 319891062
		arg_263_1.duration_ = 1.999999999999

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play319891063(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["4040ui_story"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.characterEffect4040ui_story == nil then
				arg_263_1.var_.characterEffect4040ui_story = var_266_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_2 = 0.200000002980232

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.characterEffect4040ui_story then
					local var_266_4 = Mathf.Lerp(0, 0.5, var_266_3)

					arg_263_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_263_1.var_.characterEffect4040ui_story.fillRatio = var_266_4
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.characterEffect4040ui_story then
				local var_266_5 = 0.5

				arg_263_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_263_1.var_.characterEffect4040ui_story.fillRatio = var_266_5
			end

			local var_266_6 = arg_263_1.actors_["1084ui_story"].transform
			local var_266_7 = 0

			if var_266_7 < arg_263_1.time_ and arg_263_1.time_ <= var_266_7 + arg_266_0 then
				arg_263_1.var_.moveOldPos1084ui_story = var_266_6.localPosition
			end

			local var_266_8 = 0.001

			if var_266_7 <= arg_263_1.time_ and arg_263_1.time_ < var_266_7 + var_266_8 then
				local var_266_9 = (arg_263_1.time_ - var_266_7) / var_266_8
				local var_266_10 = Vector3.New(-0.7, -0.97, -6)

				var_266_6.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1084ui_story, var_266_10, var_266_9)

				local var_266_11 = manager.ui.mainCamera.transform.position - var_266_6.position

				var_266_6.forward = Vector3.New(var_266_11.x, var_266_11.y, var_266_11.z)

				local var_266_12 = var_266_6.localEulerAngles

				var_266_12.z = 0
				var_266_12.x = 0
				var_266_6.localEulerAngles = var_266_12
			end

			if arg_263_1.time_ >= var_266_7 + var_266_8 and arg_263_1.time_ < var_266_7 + var_266_8 + arg_266_0 then
				var_266_6.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_266_13 = manager.ui.mainCamera.transform.position - var_266_6.position

				var_266_6.forward = Vector3.New(var_266_13.x, var_266_13.y, var_266_13.z)

				local var_266_14 = var_266_6.localEulerAngles

				var_266_14.z = 0
				var_266_14.x = 0
				var_266_6.localEulerAngles = var_266_14
			end

			local var_266_15 = arg_263_1.actors_["4040ui_story"].transform
			local var_266_16 = 0

			if var_266_16 < arg_263_1.time_ and arg_263_1.time_ <= var_266_16 + arg_266_0 then
				arg_263_1.var_.moveOldPos4040ui_story = var_266_15.localPosition
			end

			local var_266_17 = 0.001

			if var_266_16 <= arg_263_1.time_ and arg_263_1.time_ < var_266_16 + var_266_17 then
				local var_266_18 = (arg_263_1.time_ - var_266_16) / var_266_17
				local var_266_19 = Vector3.New(0.7, -1.55, -5.5)

				var_266_15.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos4040ui_story, var_266_19, var_266_18)

				local var_266_20 = manager.ui.mainCamera.transform.position - var_266_15.position

				var_266_15.forward = Vector3.New(var_266_20.x, var_266_20.y, var_266_20.z)

				local var_266_21 = var_266_15.localEulerAngles

				var_266_21.z = 0
				var_266_21.x = 0
				var_266_15.localEulerAngles = var_266_21
			end

			if arg_263_1.time_ >= var_266_16 + var_266_17 and arg_263_1.time_ < var_266_16 + var_266_17 + arg_266_0 then
				var_266_15.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_266_22 = manager.ui.mainCamera.transform.position - var_266_15.position

				var_266_15.forward = Vector3.New(var_266_22.x, var_266_22.y, var_266_22.z)

				local var_266_23 = var_266_15.localEulerAngles

				var_266_23.z = 0
				var_266_23.x = 0
				var_266_15.localEulerAngles = var_266_23
			end

			local var_266_24 = 0

			if var_266_24 < arg_263_1.time_ and arg_263_1.time_ <= var_266_24 + arg_266_0 then
				arg_263_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_266_25 = arg_263_1.actors_["1084ui_story"]
			local var_266_26 = 0

			if var_266_26 < arg_263_1.time_ and arg_263_1.time_ <= var_266_26 + arg_266_0 and arg_263_1.var_.characterEffect1084ui_story == nil then
				arg_263_1.var_.characterEffect1084ui_story = var_266_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_27 = 0.200000002980232

			if var_266_26 <= arg_263_1.time_ and arg_263_1.time_ < var_266_26 + var_266_27 then
				local var_266_28 = (arg_263_1.time_ - var_266_26) / var_266_27

				if arg_263_1.var_.characterEffect1084ui_story then
					arg_263_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_26 + var_266_27 and arg_263_1.time_ < var_266_26 + var_266_27 + arg_266_0 and arg_263_1.var_.characterEffect1084ui_story then
				arg_263_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_266_29 = 0
			local var_266_30 = 0.05

			if var_266_29 < arg_263_1.time_ and arg_263_1.time_ <= var_266_29 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_31 = arg_263_1:FormatText(StoryNameCfg[6].name)

				arg_263_1.leftNameTxt_.text = var_266_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_32 = arg_263_1:GetWordFromCfg(319891062)
				local var_266_33 = arg_263_1:FormatText(var_266_32.content)

				arg_263_1.text_.text = var_266_33

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_34 = 2
				local var_266_35 = utf8.len(var_266_33)
				local var_266_36 = var_266_34 <= 0 and var_266_30 or var_266_30 * (var_266_35 / var_266_34)

				if var_266_36 > 0 and var_266_30 < var_266_36 then
					arg_263_1.talkMaxDuration = var_266_36

					if var_266_36 + var_266_29 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_36 + var_266_29
					end
				end

				arg_263_1.text_.text = var_266_33
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891062", "story_v_out_319891.awb") ~= 0 then
					local var_266_37 = manager.audio:GetVoiceLength("story_v_out_319891", "319891062", "story_v_out_319891.awb") / 1000

					if var_266_37 + var_266_29 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_37 + var_266_29
					end

					if var_266_32.prefab_name ~= "" and arg_263_1.actors_[var_266_32.prefab_name] ~= nil then
						local var_266_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_32.prefab_name].transform, "story_v_out_319891", "319891062", "story_v_out_319891.awb")

						arg_263_1:RecordAudio("319891062", var_266_38)
						arg_263_1:RecordAudio("319891062", var_266_38)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_319891", "319891062", "story_v_out_319891.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_319891", "319891062", "story_v_out_319891.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_39 = math.max(var_266_30, arg_263_1.talkMaxDuration)

			if var_266_29 <= arg_263_1.time_ and arg_263_1.time_ < var_266_29 + var_266_39 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_29) / var_266_39

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_29 + var_266_39 and arg_263_1.time_ < var_266_29 + var_266_39 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play319891063 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 319891063
		arg_267_1.duration_ = 5.266

		local var_267_0 = {
			zh = 4.6,
			ja = 5.266
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
				arg_267_0:Play319891064(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["4040ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect4040ui_story == nil then
				arg_267_1.var_.characterEffect4040ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.200000002980232

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect4040ui_story then
					arg_267_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect4040ui_story then
				arg_267_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_270_4 = 0

			if var_270_4 < arg_267_1.time_ and arg_267_1.time_ <= var_270_4 + arg_270_0 then
				arg_267_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_270_5 = 0

			if var_270_5 < arg_267_1.time_ and arg_267_1.time_ <= var_270_5 + arg_270_0 then
				arg_267_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_270_6 = arg_267_1.actors_["1084ui_story"]
			local var_270_7 = 0

			if var_270_7 < arg_267_1.time_ and arg_267_1.time_ <= var_270_7 + arg_270_0 and arg_267_1.var_.characterEffect1084ui_story == nil then
				arg_267_1.var_.characterEffect1084ui_story = var_270_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_8 = 0.200000002980232

			if var_270_7 <= arg_267_1.time_ and arg_267_1.time_ < var_270_7 + var_270_8 then
				local var_270_9 = (arg_267_1.time_ - var_270_7) / var_270_8

				if arg_267_1.var_.characterEffect1084ui_story then
					local var_270_10 = Mathf.Lerp(0, 0.5, var_270_9)

					arg_267_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1084ui_story.fillRatio = var_270_10
				end
			end

			if arg_267_1.time_ >= var_270_7 + var_270_8 and arg_267_1.time_ < var_270_7 + var_270_8 + arg_270_0 and arg_267_1.var_.characterEffect1084ui_story then
				local var_270_11 = 0.5

				arg_267_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1084ui_story.fillRatio = var_270_11
			end

			local var_270_12 = 0
			local var_270_13 = 0.525

			if var_270_12 < arg_267_1.time_ and arg_267_1.time_ <= var_270_12 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_14 = arg_267_1:FormatText(StoryNameCfg[668].name)

				arg_267_1.leftNameTxt_.text = var_270_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_15 = arg_267_1:GetWordFromCfg(319891063)
				local var_270_16 = arg_267_1:FormatText(var_270_15.content)

				arg_267_1.text_.text = var_270_16

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_17 = 21
				local var_270_18 = utf8.len(var_270_16)
				local var_270_19 = var_270_17 <= 0 and var_270_13 or var_270_13 * (var_270_18 / var_270_17)

				if var_270_19 > 0 and var_270_13 < var_270_19 then
					arg_267_1.talkMaxDuration = var_270_19

					if var_270_19 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_19 + var_270_12
					end
				end

				arg_267_1.text_.text = var_270_16
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891063", "story_v_out_319891.awb") ~= 0 then
					local var_270_20 = manager.audio:GetVoiceLength("story_v_out_319891", "319891063", "story_v_out_319891.awb") / 1000

					if var_270_20 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_20 + var_270_12
					end

					if var_270_15.prefab_name ~= "" and arg_267_1.actors_[var_270_15.prefab_name] ~= nil then
						local var_270_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_15.prefab_name].transform, "story_v_out_319891", "319891063", "story_v_out_319891.awb")

						arg_267_1:RecordAudio("319891063", var_270_21)
						arg_267_1:RecordAudio("319891063", var_270_21)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_319891", "319891063", "story_v_out_319891.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_319891", "319891063", "story_v_out_319891.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_22 = math.max(var_270_13, arg_267_1.talkMaxDuration)

			if var_270_12 <= arg_267_1.time_ and arg_267_1.time_ < var_270_12 + var_270_22 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_12) / var_270_22

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_12 + var_270_22 and arg_267_1.time_ < var_270_12 + var_270_22 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play319891064 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 319891064
		arg_271_1.duration_ = 5.466

		local var_271_0 = {
			zh = 2.1,
			ja = 5.466
		}
		local var_271_1 = manager.audio:GetLocalizationFlag()

		if var_271_0[var_271_1] ~= nil then
			arg_271_1.duration_ = var_271_0[var_271_1]
		end

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play319891065(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["4040ui_story"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos4040ui_story = var_274_0.localPosition
			end

			local var_274_2 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2
				local var_274_4 = Vector3.New(0.7, -1.55, -5.5)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos4040ui_story, var_274_4, var_274_3)

				local var_274_5 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_5.x, var_274_5.y, var_274_5.z)

				local var_274_6 = var_274_0.localEulerAngles

				var_274_6.z = 0
				var_274_6.x = 0
				var_274_0.localEulerAngles = var_274_6
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_274_7 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_7.x, var_274_7.y, var_274_7.z)

				local var_274_8 = var_274_0.localEulerAngles

				var_274_8.z = 0
				var_274_8.x = 0
				var_274_0.localEulerAngles = var_274_8
			end

			local var_274_9 = 0
			local var_274_10 = 0.25

			if var_274_9 < arg_271_1.time_ and arg_271_1.time_ <= var_274_9 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_11 = arg_271_1:FormatText(StoryNameCfg[668].name)

				arg_271_1.leftNameTxt_.text = var_274_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_12 = arg_271_1:GetWordFromCfg(319891064)
				local var_274_13 = arg_271_1:FormatText(var_274_12.content)

				arg_271_1.text_.text = var_274_13

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_14 = 10
				local var_274_15 = utf8.len(var_274_13)
				local var_274_16 = var_274_14 <= 0 and var_274_10 or var_274_10 * (var_274_15 / var_274_14)

				if var_274_16 > 0 and var_274_10 < var_274_16 then
					arg_271_1.talkMaxDuration = var_274_16

					if var_274_16 + var_274_9 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_16 + var_274_9
					end
				end

				arg_271_1.text_.text = var_274_13
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891064", "story_v_out_319891.awb") ~= 0 then
					local var_274_17 = manager.audio:GetVoiceLength("story_v_out_319891", "319891064", "story_v_out_319891.awb") / 1000

					if var_274_17 + var_274_9 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_17 + var_274_9
					end

					if var_274_12.prefab_name ~= "" and arg_271_1.actors_[var_274_12.prefab_name] ~= nil then
						local var_274_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_12.prefab_name].transform, "story_v_out_319891", "319891064", "story_v_out_319891.awb")

						arg_271_1:RecordAudio("319891064", var_274_18)
						arg_271_1:RecordAudio("319891064", var_274_18)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_319891", "319891064", "story_v_out_319891.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_319891", "319891064", "story_v_out_319891.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_19 = math.max(var_274_10, arg_271_1.talkMaxDuration)

			if var_274_9 <= arg_271_1.time_ and arg_271_1.time_ < var_274_9 + var_274_19 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_9) / var_274_19

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_9 + var_274_19 and arg_271_1.time_ < var_274_9 + var_274_19 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play319891065 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 319891065
		arg_275_1.duration_ = 2.966

		local var_275_0 = {
			zh = 1,
			ja = 2.966
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
				arg_275_0:Play319891066(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["4040ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect4040ui_story == nil then
				arg_275_1.var_.characterEffect4040ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.200000002980232

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect4040ui_story then
					local var_278_4 = Mathf.Lerp(0, 0.5, var_278_3)

					arg_275_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_275_1.var_.characterEffect4040ui_story.fillRatio = var_278_4
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect4040ui_story then
				local var_278_5 = 0.5

				arg_275_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_275_1.var_.characterEffect4040ui_story.fillRatio = var_278_5
			end

			local var_278_6 = arg_275_1.actors_["1084ui_story"]
			local var_278_7 = 0

			if var_278_7 < arg_275_1.time_ and arg_275_1.time_ <= var_278_7 + arg_278_0 and arg_275_1.var_.characterEffect1084ui_story == nil then
				arg_275_1.var_.characterEffect1084ui_story = var_278_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_8 = 0.200000002980232

			if var_278_7 <= arg_275_1.time_ and arg_275_1.time_ < var_278_7 + var_278_8 then
				local var_278_9 = (arg_275_1.time_ - var_278_7) / var_278_8

				if arg_275_1.var_.characterEffect1084ui_story then
					arg_275_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_7 + var_278_8 and arg_275_1.time_ < var_278_7 + var_278_8 + arg_278_0 and arg_275_1.var_.characterEffect1084ui_story then
				arg_275_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_278_10 = 0
			local var_278_11 = 0.075

			if var_278_10 < arg_275_1.time_ and arg_275_1.time_ <= var_278_10 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_12 = arg_275_1:FormatText(StoryNameCfg[6].name)

				arg_275_1.leftNameTxt_.text = var_278_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_13 = arg_275_1:GetWordFromCfg(319891065)
				local var_278_14 = arg_275_1:FormatText(var_278_13.content)

				arg_275_1.text_.text = var_278_14

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_15 = 3
				local var_278_16 = utf8.len(var_278_14)
				local var_278_17 = var_278_15 <= 0 and var_278_11 or var_278_11 * (var_278_16 / var_278_15)

				if var_278_17 > 0 and var_278_11 < var_278_17 then
					arg_275_1.talkMaxDuration = var_278_17

					if var_278_17 + var_278_10 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_17 + var_278_10
					end
				end

				arg_275_1.text_.text = var_278_14
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891065", "story_v_out_319891.awb") ~= 0 then
					local var_278_18 = manager.audio:GetVoiceLength("story_v_out_319891", "319891065", "story_v_out_319891.awb") / 1000

					if var_278_18 + var_278_10 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_18 + var_278_10
					end

					if var_278_13.prefab_name ~= "" and arg_275_1.actors_[var_278_13.prefab_name] ~= nil then
						local var_278_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_13.prefab_name].transform, "story_v_out_319891", "319891065", "story_v_out_319891.awb")

						arg_275_1:RecordAudio("319891065", var_278_19)
						arg_275_1:RecordAudio("319891065", var_278_19)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_319891", "319891065", "story_v_out_319891.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_319891", "319891065", "story_v_out_319891.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_20 = math.max(var_278_11, arg_275_1.talkMaxDuration)

			if var_278_10 <= arg_275_1.time_ and arg_275_1.time_ < var_278_10 + var_278_20 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_10) / var_278_20

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_10 + var_278_20 and arg_275_1.time_ < var_278_10 + var_278_20 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play319891066 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 319891066
		arg_279_1.duration_ = 6

		local var_279_0 = {
			zh = 2.733,
			ja = 6
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
				arg_279_0:Play319891067(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_282_2 = 0
			local var_282_3 = 0.325

			if var_282_2 < arg_279_1.time_ and arg_279_1.time_ <= var_282_2 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_4 = arg_279_1:FormatText(StoryNameCfg[6].name)

				arg_279_1.leftNameTxt_.text = var_282_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_5 = arg_279_1:GetWordFromCfg(319891066)
				local var_282_6 = arg_279_1:FormatText(var_282_5.content)

				arg_279_1.text_.text = var_282_6

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_7 = 13
				local var_282_8 = utf8.len(var_282_6)
				local var_282_9 = var_282_7 <= 0 and var_282_3 or var_282_3 * (var_282_8 / var_282_7)

				if var_282_9 > 0 and var_282_3 < var_282_9 then
					arg_279_1.talkMaxDuration = var_282_9

					if var_282_9 + var_282_2 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_9 + var_282_2
					end
				end

				arg_279_1.text_.text = var_282_6
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891066", "story_v_out_319891.awb") ~= 0 then
					local var_282_10 = manager.audio:GetVoiceLength("story_v_out_319891", "319891066", "story_v_out_319891.awb") / 1000

					if var_282_10 + var_282_2 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_10 + var_282_2
					end

					if var_282_5.prefab_name ~= "" and arg_279_1.actors_[var_282_5.prefab_name] ~= nil then
						local var_282_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_5.prefab_name].transform, "story_v_out_319891", "319891066", "story_v_out_319891.awb")

						arg_279_1:RecordAudio("319891066", var_282_11)
						arg_279_1:RecordAudio("319891066", var_282_11)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_319891", "319891066", "story_v_out_319891.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_319891", "319891066", "story_v_out_319891.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_12 = math.max(var_282_3, arg_279_1.talkMaxDuration)

			if var_282_2 <= arg_279_1.time_ and arg_279_1.time_ < var_282_2 + var_282_12 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_2) / var_282_12

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_2 + var_282_12 and arg_279_1.time_ < var_282_2 + var_282_12 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play319891067 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 319891067
		arg_283_1.duration_ = 1.566

		local var_283_0 = {
			zh = 1.566,
			ja = 0.999999999999
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
				arg_283_0:Play319891068(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["4040ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect4040ui_story == nil then
				arg_283_1.var_.characterEffect4040ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.200000002980232

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect4040ui_story then
					arg_283_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect4040ui_story then
				arg_283_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_286_4 = arg_283_1.actors_["1084ui_story"]
			local var_286_5 = 0

			if var_286_5 < arg_283_1.time_ and arg_283_1.time_ <= var_286_5 + arg_286_0 and arg_283_1.var_.characterEffect1084ui_story == nil then
				arg_283_1.var_.characterEffect1084ui_story = var_286_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_6 = 0.200000002980232

			if var_286_5 <= arg_283_1.time_ and arg_283_1.time_ < var_286_5 + var_286_6 then
				local var_286_7 = (arg_283_1.time_ - var_286_5) / var_286_6

				if arg_283_1.var_.characterEffect1084ui_story then
					local var_286_8 = Mathf.Lerp(0, 0.5, var_286_7)

					arg_283_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1084ui_story.fillRatio = var_286_8
				end
			end

			if arg_283_1.time_ >= var_286_5 + var_286_6 and arg_283_1.time_ < var_286_5 + var_286_6 + arg_286_0 and arg_283_1.var_.characterEffect1084ui_story then
				local var_286_9 = 0.5

				arg_283_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1084ui_story.fillRatio = var_286_9
			end

			local var_286_10 = 0
			local var_286_11 = 0.05

			if var_286_10 < arg_283_1.time_ and arg_283_1.time_ <= var_286_10 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_12 = arg_283_1:FormatText(StoryNameCfg[668].name)

				arg_283_1.leftNameTxt_.text = var_286_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_13 = arg_283_1:GetWordFromCfg(319891067)
				local var_286_14 = arg_283_1:FormatText(var_286_13.content)

				arg_283_1.text_.text = var_286_14

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_15 = 2
				local var_286_16 = utf8.len(var_286_14)
				local var_286_17 = var_286_15 <= 0 and var_286_11 or var_286_11 * (var_286_16 / var_286_15)

				if var_286_17 > 0 and var_286_11 < var_286_17 then
					arg_283_1.talkMaxDuration = var_286_17

					if var_286_17 + var_286_10 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_17 + var_286_10
					end
				end

				arg_283_1.text_.text = var_286_14
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891067", "story_v_out_319891.awb") ~= 0 then
					local var_286_18 = manager.audio:GetVoiceLength("story_v_out_319891", "319891067", "story_v_out_319891.awb") / 1000

					if var_286_18 + var_286_10 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_18 + var_286_10
					end

					if var_286_13.prefab_name ~= "" and arg_283_1.actors_[var_286_13.prefab_name] ~= nil then
						local var_286_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_13.prefab_name].transform, "story_v_out_319891", "319891067", "story_v_out_319891.awb")

						arg_283_1:RecordAudio("319891067", var_286_19)
						arg_283_1:RecordAudio("319891067", var_286_19)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_319891", "319891067", "story_v_out_319891.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_319891", "319891067", "story_v_out_319891.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_20 = math.max(var_286_11, arg_283_1.talkMaxDuration)

			if var_286_10 <= arg_283_1.time_ and arg_283_1.time_ < var_286_10 + var_286_20 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_10) / var_286_20

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_10 + var_286_20 and arg_283_1.time_ < var_286_10 + var_286_20 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play319891068 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 319891068
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play319891069(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1084ui_story"].transform
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.var_.moveOldPos1084ui_story = var_290_0.localPosition
			end

			local var_290_2 = 0.001

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2
				local var_290_4 = Vector3.New(0, 100, 0)

				var_290_0.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1084ui_story, var_290_4, var_290_3)

				local var_290_5 = manager.ui.mainCamera.transform.position - var_290_0.position

				var_290_0.forward = Vector3.New(var_290_5.x, var_290_5.y, var_290_5.z)

				local var_290_6 = var_290_0.localEulerAngles

				var_290_6.z = 0
				var_290_6.x = 0
				var_290_0.localEulerAngles = var_290_6
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 then
				var_290_0.localPosition = Vector3.New(0, 100, 0)

				local var_290_7 = manager.ui.mainCamera.transform.position - var_290_0.position

				var_290_0.forward = Vector3.New(var_290_7.x, var_290_7.y, var_290_7.z)

				local var_290_8 = var_290_0.localEulerAngles

				var_290_8.z = 0
				var_290_8.x = 0
				var_290_0.localEulerAngles = var_290_8
			end

			local var_290_9 = arg_287_1.actors_["4040ui_story"].transform
			local var_290_10 = 0

			if var_290_10 < arg_287_1.time_ and arg_287_1.time_ <= var_290_10 + arg_290_0 then
				arg_287_1.var_.moveOldPos4040ui_story = var_290_9.localPosition
			end

			local var_290_11 = 0.001

			if var_290_10 <= arg_287_1.time_ and arg_287_1.time_ < var_290_10 + var_290_11 then
				local var_290_12 = (arg_287_1.time_ - var_290_10) / var_290_11
				local var_290_13 = Vector3.New(0, 100, 0)

				var_290_9.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos4040ui_story, var_290_13, var_290_12)

				local var_290_14 = manager.ui.mainCamera.transform.position - var_290_9.position

				var_290_9.forward = Vector3.New(var_290_14.x, var_290_14.y, var_290_14.z)

				local var_290_15 = var_290_9.localEulerAngles

				var_290_15.z = 0
				var_290_15.x = 0
				var_290_9.localEulerAngles = var_290_15
			end

			if arg_287_1.time_ >= var_290_10 + var_290_11 and arg_287_1.time_ < var_290_10 + var_290_11 + arg_290_0 then
				var_290_9.localPosition = Vector3.New(0, 100, 0)

				local var_290_16 = manager.ui.mainCamera.transform.position - var_290_9.position

				var_290_9.forward = Vector3.New(var_290_16.x, var_290_16.y, var_290_16.z)

				local var_290_17 = var_290_9.localEulerAngles

				var_290_17.z = 0
				var_290_17.x = 0
				var_290_9.localEulerAngles = var_290_17
			end

			local var_290_18 = 0
			local var_290_19 = 1.075

			if var_290_18 < arg_287_1.time_ and arg_287_1.time_ <= var_290_18 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, false)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_20 = arg_287_1:GetWordFromCfg(319891068)
				local var_290_21 = arg_287_1:FormatText(var_290_20.content)

				arg_287_1.text_.text = var_290_21

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_22 = 43
				local var_290_23 = utf8.len(var_290_21)
				local var_290_24 = var_290_22 <= 0 and var_290_19 or var_290_19 * (var_290_23 / var_290_22)

				if var_290_24 > 0 and var_290_19 < var_290_24 then
					arg_287_1.talkMaxDuration = var_290_24

					if var_290_24 + var_290_18 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_24 + var_290_18
					end
				end

				arg_287_1.text_.text = var_290_21
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_25 = math.max(var_290_19, arg_287_1.talkMaxDuration)

			if var_290_18 <= arg_287_1.time_ and arg_287_1.time_ < var_290_18 + var_290_25 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_18) / var_290_25

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_18 + var_290_25 and arg_287_1.time_ < var_290_18 + var_290_25 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play319891069 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 319891069
		arg_291_1.duration_ = 1.999999999999

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play319891070(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1095ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1095ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0, -0.98, -6.1)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1095ui_story, var_294_4, var_294_3)

				local var_294_5 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_5.x, var_294_5.y, var_294_5.z)

				local var_294_6 = var_294_0.localEulerAngles

				var_294_6.z = 0
				var_294_6.x = 0
				var_294_0.localEulerAngles = var_294_6
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_294_7 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_7.x, var_294_7.y, var_294_7.z)

				local var_294_8 = var_294_0.localEulerAngles

				var_294_8.z = 0
				var_294_8.x = 0
				var_294_0.localEulerAngles = var_294_8
			end

			local var_294_9 = arg_291_1.actors_["1095ui_story"]
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 and arg_291_1.var_.characterEffect1095ui_story == nil then
				arg_291_1.var_.characterEffect1095ui_story = var_294_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_11 = 0.200000002980232

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11

				if arg_291_1.var_.characterEffect1095ui_story then
					arg_291_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 and arg_291_1.var_.characterEffect1095ui_story then
				arg_291_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_294_13 = 0

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action5_1")
			end

			local var_294_14 = 0

			if var_294_14 < arg_291_1.time_ and arg_291_1.time_ <= var_294_14 + arg_294_0 then
				arg_291_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_294_15 = arg_291_1.actors_["1084ui_story"].transform
			local var_294_16 = 0

			if var_294_16 < arg_291_1.time_ and arg_291_1.time_ <= var_294_16 + arg_294_0 then
				arg_291_1.var_.moveOldPos1084ui_story = var_294_15.localPosition
			end

			local var_294_17 = 0.001

			if var_294_16 <= arg_291_1.time_ and arg_291_1.time_ < var_294_16 + var_294_17 then
				local var_294_18 = (arg_291_1.time_ - var_294_16) / var_294_17
				local var_294_19 = Vector3.New(0, 100, 0)

				var_294_15.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1084ui_story, var_294_19, var_294_18)

				local var_294_20 = manager.ui.mainCamera.transform.position - var_294_15.position

				var_294_15.forward = Vector3.New(var_294_20.x, var_294_20.y, var_294_20.z)

				local var_294_21 = var_294_15.localEulerAngles

				var_294_21.z = 0
				var_294_21.x = 0
				var_294_15.localEulerAngles = var_294_21
			end

			if arg_291_1.time_ >= var_294_16 + var_294_17 and arg_291_1.time_ < var_294_16 + var_294_17 + arg_294_0 then
				var_294_15.localPosition = Vector3.New(0, 100, 0)

				local var_294_22 = manager.ui.mainCamera.transform.position - var_294_15.position

				var_294_15.forward = Vector3.New(var_294_22.x, var_294_22.y, var_294_22.z)

				local var_294_23 = var_294_15.localEulerAngles

				var_294_23.z = 0
				var_294_23.x = 0
				var_294_15.localEulerAngles = var_294_23
			end

			local var_294_24 = arg_291_1.actors_["1084ui_story"]
			local var_294_25 = 0

			if var_294_25 < arg_291_1.time_ and arg_291_1.time_ <= var_294_25 + arg_294_0 and arg_291_1.var_.characterEffect1084ui_story == nil then
				arg_291_1.var_.characterEffect1084ui_story = var_294_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_26 = 0.200000002980232

			if var_294_25 <= arg_291_1.time_ and arg_291_1.time_ < var_294_25 + var_294_26 then
				local var_294_27 = (arg_291_1.time_ - var_294_25) / var_294_26

				if arg_291_1.var_.characterEffect1084ui_story then
					local var_294_28 = Mathf.Lerp(0, 0.5, var_294_27)

					arg_291_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1084ui_story.fillRatio = var_294_28
				end
			end

			if arg_291_1.time_ >= var_294_25 + var_294_26 and arg_291_1.time_ < var_294_25 + var_294_26 + arg_294_0 and arg_291_1.var_.characterEffect1084ui_story then
				local var_294_29 = 0.5

				arg_291_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1084ui_story.fillRatio = var_294_29
			end

			local var_294_30 = arg_291_1.actors_["4040ui_story"].transform
			local var_294_31 = 0

			if var_294_31 < arg_291_1.time_ and arg_291_1.time_ <= var_294_31 + arg_294_0 then
				arg_291_1.var_.moveOldPos4040ui_story = var_294_30.localPosition
			end

			local var_294_32 = 0.001

			if var_294_31 <= arg_291_1.time_ and arg_291_1.time_ < var_294_31 + var_294_32 then
				local var_294_33 = (arg_291_1.time_ - var_294_31) / var_294_32
				local var_294_34 = Vector3.New(0, 100, 0)

				var_294_30.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos4040ui_story, var_294_34, var_294_33)

				local var_294_35 = manager.ui.mainCamera.transform.position - var_294_30.position

				var_294_30.forward = Vector3.New(var_294_35.x, var_294_35.y, var_294_35.z)

				local var_294_36 = var_294_30.localEulerAngles

				var_294_36.z = 0
				var_294_36.x = 0
				var_294_30.localEulerAngles = var_294_36
			end

			if arg_291_1.time_ >= var_294_31 + var_294_32 and arg_291_1.time_ < var_294_31 + var_294_32 + arg_294_0 then
				var_294_30.localPosition = Vector3.New(0, 100, 0)

				local var_294_37 = manager.ui.mainCamera.transform.position - var_294_30.position

				var_294_30.forward = Vector3.New(var_294_37.x, var_294_37.y, var_294_37.z)

				local var_294_38 = var_294_30.localEulerAngles

				var_294_38.z = 0
				var_294_38.x = 0
				var_294_30.localEulerAngles = var_294_38
			end

			local var_294_39 = arg_291_1.actors_["4040ui_story"]
			local var_294_40 = 0

			if var_294_40 < arg_291_1.time_ and arg_291_1.time_ <= var_294_40 + arg_294_0 and arg_291_1.var_.characterEffect4040ui_story == nil then
				arg_291_1.var_.characterEffect4040ui_story = var_294_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_41 = 0.200000002980232

			if var_294_40 <= arg_291_1.time_ and arg_291_1.time_ < var_294_40 + var_294_41 then
				local var_294_42 = (arg_291_1.time_ - var_294_40) / var_294_41

				if arg_291_1.var_.characterEffect4040ui_story then
					local var_294_43 = Mathf.Lerp(0, 0.5, var_294_42)

					arg_291_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_291_1.var_.characterEffect4040ui_story.fillRatio = var_294_43
				end
			end

			if arg_291_1.time_ >= var_294_40 + var_294_41 and arg_291_1.time_ < var_294_40 + var_294_41 + arg_294_0 and arg_291_1.var_.characterEffect4040ui_story then
				local var_294_44 = 0.5

				arg_291_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_291_1.var_.characterEffect4040ui_story.fillRatio = var_294_44
			end

			local var_294_45 = 0
			local var_294_46 = 0.05

			if var_294_45 < arg_291_1.time_ and arg_291_1.time_ <= var_294_45 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_47 = arg_291_1:FormatText(StoryNameCfg[471].name)

				arg_291_1.leftNameTxt_.text = var_294_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_48 = arg_291_1:GetWordFromCfg(319891069)
				local var_294_49 = arg_291_1:FormatText(var_294_48.content)

				arg_291_1.text_.text = var_294_49

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_50 = 2
				local var_294_51 = utf8.len(var_294_49)
				local var_294_52 = var_294_50 <= 0 and var_294_46 or var_294_46 * (var_294_51 / var_294_50)

				if var_294_52 > 0 and var_294_46 < var_294_52 then
					arg_291_1.talkMaxDuration = var_294_52

					if var_294_52 + var_294_45 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_52 + var_294_45
					end
				end

				arg_291_1.text_.text = var_294_49
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891069", "story_v_out_319891.awb") ~= 0 then
					local var_294_53 = manager.audio:GetVoiceLength("story_v_out_319891", "319891069", "story_v_out_319891.awb") / 1000

					if var_294_53 + var_294_45 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_53 + var_294_45
					end

					if var_294_48.prefab_name ~= "" and arg_291_1.actors_[var_294_48.prefab_name] ~= nil then
						local var_294_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_48.prefab_name].transform, "story_v_out_319891", "319891069", "story_v_out_319891.awb")

						arg_291_1:RecordAudio("319891069", var_294_54)
						arg_291_1:RecordAudio("319891069", var_294_54)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_319891", "319891069", "story_v_out_319891.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_319891", "319891069", "story_v_out_319891.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_55 = math.max(var_294_46, arg_291_1.talkMaxDuration)

			if var_294_45 <= arg_291_1.time_ and arg_291_1.time_ < var_294_45 + var_294_55 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_45) / var_294_55

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_45 + var_294_55 and arg_291_1.time_ < var_294_45 + var_294_55 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play319891070 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 319891070
		arg_295_1.duration_ = 8.23333333333333

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play319891071(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = "D02a"

			if arg_295_1.bgs_[var_298_0] == nil then
				local var_298_1 = Object.Instantiate(arg_295_1.paintGo_)

				var_298_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_298_0)
				var_298_1.name = var_298_0
				var_298_1.transform.parent = arg_295_1.stage_.transform
				var_298_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_295_1.bgs_[var_298_0] = var_298_1
			end

			local var_298_2 = 1.23333333333333

			if var_298_2 < arg_295_1.time_ and arg_295_1.time_ <= var_298_2 + arg_298_0 then
				local var_298_3 = manager.ui.mainCamera.transform.localPosition
				local var_298_4 = Vector3.New(0, 0, 10) + Vector3.New(var_298_3.x, var_298_3.y, 0)
				local var_298_5 = arg_295_1.bgs_.D02a

				var_298_5.transform.localPosition = var_298_4
				var_298_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_298_6 = var_298_5:GetComponent("SpriteRenderer")

				if var_298_6 and var_298_6.sprite then
					local var_298_7 = (var_298_5.transform.localPosition - var_298_3).z
					local var_298_8 = manager.ui.mainCameraCom_
					local var_298_9 = 2 * var_298_7 * Mathf.Tan(var_298_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_298_10 = var_298_9 * var_298_8.aspect
					local var_298_11 = var_298_6.sprite.bounds.size.x
					local var_298_12 = var_298_6.sprite.bounds.size.y
					local var_298_13 = var_298_10 / var_298_11
					local var_298_14 = var_298_9 / var_298_12
					local var_298_15 = var_298_14 < var_298_13 and var_298_13 or var_298_14

					var_298_5.transform.localScale = Vector3.New(var_298_15, var_298_15, 0)
				end

				for iter_298_0, iter_298_1 in pairs(arg_295_1.bgs_) do
					if iter_298_0 ~= "D02a" then
						iter_298_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_298_16 = 0

			if var_298_16 < arg_295_1.time_ and arg_295_1.time_ <= var_298_16 + arg_298_0 then
				arg_295_1.mask_.enabled = true
				arg_295_1.mask_.raycastTarget = true

				arg_295_1:SetGaussion(false)
			end

			local var_298_17 = 1.23333333333333

			if var_298_16 <= arg_295_1.time_ and arg_295_1.time_ < var_298_16 + var_298_17 then
				local var_298_18 = (arg_295_1.time_ - var_298_16) / var_298_17
				local var_298_19 = Color.New(0, 0, 0)

				var_298_19.a = Mathf.Lerp(0, 1, var_298_18)
				arg_295_1.mask_.color = var_298_19
			end

			if arg_295_1.time_ >= var_298_16 + var_298_17 and arg_295_1.time_ < var_298_16 + var_298_17 + arg_298_0 then
				local var_298_20 = Color.New(0, 0, 0)

				var_298_20.a = 1
				arg_295_1.mask_.color = var_298_20
			end

			local var_298_21 = 1.23333333333333

			if var_298_21 < arg_295_1.time_ and arg_295_1.time_ <= var_298_21 + arg_298_0 then
				arg_295_1.mask_.enabled = true
				arg_295_1.mask_.raycastTarget = true

				arg_295_1:SetGaussion(false)
			end

			local var_298_22 = 2

			if var_298_21 <= arg_295_1.time_ and arg_295_1.time_ < var_298_21 + var_298_22 then
				local var_298_23 = (arg_295_1.time_ - var_298_21) / var_298_22
				local var_298_24 = Color.New(0, 0, 0)

				var_298_24.a = Mathf.Lerp(1, 0, var_298_23)
				arg_295_1.mask_.color = var_298_24
			end

			if arg_295_1.time_ >= var_298_21 + var_298_22 and arg_295_1.time_ < var_298_21 + var_298_22 + arg_298_0 then
				local var_298_25 = Color.New(0, 0, 0)
				local var_298_26 = 0

				arg_295_1.mask_.enabled = false
				var_298_25.a = var_298_26
				arg_295_1.mask_.color = var_298_25
			end

			local var_298_27 = arg_295_1.actors_["1095ui_story"].transform
			local var_298_28 = 1.23333333333333

			if var_298_28 < arg_295_1.time_ and arg_295_1.time_ <= var_298_28 + arg_298_0 then
				arg_295_1.var_.moveOldPos1095ui_story = var_298_27.localPosition
			end

			local var_298_29 = 0.001

			if var_298_28 <= arg_295_1.time_ and arg_295_1.time_ < var_298_28 + var_298_29 then
				local var_298_30 = (arg_295_1.time_ - var_298_28) / var_298_29
				local var_298_31 = Vector3.New(0, 100, 0)

				var_298_27.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1095ui_story, var_298_31, var_298_30)

				local var_298_32 = manager.ui.mainCamera.transform.position - var_298_27.position

				var_298_27.forward = Vector3.New(var_298_32.x, var_298_32.y, var_298_32.z)

				local var_298_33 = var_298_27.localEulerAngles

				var_298_33.z = 0
				var_298_33.x = 0
				var_298_27.localEulerAngles = var_298_33
			end

			if arg_295_1.time_ >= var_298_28 + var_298_29 and arg_295_1.time_ < var_298_28 + var_298_29 + arg_298_0 then
				var_298_27.localPosition = Vector3.New(0, 100, 0)

				local var_298_34 = manager.ui.mainCamera.transform.position - var_298_27.position

				var_298_27.forward = Vector3.New(var_298_34.x, var_298_34.y, var_298_34.z)

				local var_298_35 = var_298_27.localEulerAngles

				var_298_35.z = 0
				var_298_35.x = 0
				var_298_27.localEulerAngles = var_298_35
			end

			if arg_295_1.frameCnt_ <= 1 then
				arg_295_1.dialog_:SetActive(false)
			end

			local var_298_36 = 3.23333333333333
			local var_298_37 = 0.875

			if var_298_36 < arg_295_1.time_ and arg_295_1.time_ <= var_298_36 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0

				arg_295_1.dialog_:SetActive(true)

				local var_298_38 = LeanTween.value(arg_295_1.dialog_, 0, 1, 0.3)

				var_298_38:setOnUpdate(LuaHelper.FloatAction(function(arg_299_0)
					arg_295_1.dialogCg_.alpha = arg_299_0
				end))
				var_298_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_295_1.dialog_)
					var_298_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_295_1.duration_ = arg_295_1.duration_ + 0.3

				SetActive(arg_295_1.leftNameGo_, false)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_39 = arg_295_1:GetWordFromCfg(319891070)
				local var_298_40 = arg_295_1:FormatText(var_298_39.content)

				arg_295_1.text_.text = var_298_40

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_41 = 35
				local var_298_42 = utf8.len(var_298_40)
				local var_298_43 = var_298_41 <= 0 and var_298_37 or var_298_37 * (var_298_42 / var_298_41)

				if var_298_43 > 0 and var_298_37 < var_298_43 then
					arg_295_1.talkMaxDuration = var_298_43
					var_298_36 = var_298_36 + 0.3

					if var_298_43 + var_298_36 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_43 + var_298_36
					end
				end

				arg_295_1.text_.text = var_298_40
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_44 = var_298_36 + 0.3
			local var_298_45 = math.max(var_298_37, arg_295_1.talkMaxDuration)

			if var_298_44 <= arg_295_1.time_ and arg_295_1.time_ < var_298_44 + var_298_45 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_44) / var_298_45

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_44 + var_298_45 and arg_295_1.time_ < var_298_44 + var_298_45 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play319891071 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 319891071
		arg_301_1.duration_ = 3.233

		local var_301_0 = {
			zh = 2.366,
			ja = 3.233
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
				arg_301_0:Play319891072(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1084ui_story"].transform
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1.var_.moveOldPos1084ui_story = var_304_0.localPosition
			end

			local var_304_2 = 0.001

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2
				local var_304_4 = Vector3.New(0, -0.97, -6)

				var_304_0.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1084ui_story, var_304_4, var_304_3)

				local var_304_5 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_5.x, var_304_5.y, var_304_5.z)

				local var_304_6 = var_304_0.localEulerAngles

				var_304_6.z = 0
				var_304_6.x = 0
				var_304_0.localEulerAngles = var_304_6
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 then
				var_304_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_304_7 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_7.x, var_304_7.y, var_304_7.z)

				local var_304_8 = var_304_0.localEulerAngles

				var_304_8.z = 0
				var_304_8.x = 0
				var_304_0.localEulerAngles = var_304_8
			end

			local var_304_9 = arg_301_1.actors_["1084ui_story"]
			local var_304_10 = 0

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 and arg_301_1.var_.characterEffect1084ui_story == nil then
				arg_301_1.var_.characterEffect1084ui_story = var_304_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_11 = 0.200000002980232

			if var_304_10 <= arg_301_1.time_ and arg_301_1.time_ < var_304_10 + var_304_11 then
				local var_304_12 = (arg_301_1.time_ - var_304_10) / var_304_11

				if arg_301_1.var_.characterEffect1084ui_story then
					arg_301_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_10 + var_304_11 and arg_301_1.time_ < var_304_10 + var_304_11 + arg_304_0 and arg_301_1.var_.characterEffect1084ui_story then
				arg_301_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_304_13 = 0

			if var_304_13 < arg_301_1.time_ and arg_301_1.time_ <= var_304_13 + arg_304_0 then
				arg_301_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_304_14 = 0

			if var_304_14 < arg_301_1.time_ and arg_301_1.time_ <= var_304_14 + arg_304_0 then
				arg_301_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_304_15 = 0
			local var_304_16 = 0.35

			if var_304_15 < arg_301_1.time_ and arg_301_1.time_ <= var_304_15 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_17 = arg_301_1:FormatText(StoryNameCfg[6].name)

				arg_301_1.leftNameTxt_.text = var_304_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_18 = arg_301_1:GetWordFromCfg(319891071)
				local var_304_19 = arg_301_1:FormatText(var_304_18.content)

				arg_301_1.text_.text = var_304_19

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_20 = 14
				local var_304_21 = utf8.len(var_304_19)
				local var_304_22 = var_304_20 <= 0 and var_304_16 or var_304_16 * (var_304_21 / var_304_20)

				if var_304_22 > 0 and var_304_16 < var_304_22 then
					arg_301_1.talkMaxDuration = var_304_22

					if var_304_22 + var_304_15 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_22 + var_304_15
					end
				end

				arg_301_1.text_.text = var_304_19
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891071", "story_v_out_319891.awb") ~= 0 then
					local var_304_23 = manager.audio:GetVoiceLength("story_v_out_319891", "319891071", "story_v_out_319891.awb") / 1000

					if var_304_23 + var_304_15 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_23 + var_304_15
					end

					if var_304_18.prefab_name ~= "" and arg_301_1.actors_[var_304_18.prefab_name] ~= nil then
						local var_304_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_18.prefab_name].transform, "story_v_out_319891", "319891071", "story_v_out_319891.awb")

						arg_301_1:RecordAudio("319891071", var_304_24)
						arg_301_1:RecordAudio("319891071", var_304_24)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_319891", "319891071", "story_v_out_319891.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_319891", "319891071", "story_v_out_319891.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_25 = math.max(var_304_16, arg_301_1.talkMaxDuration)

			if var_304_15 <= arg_301_1.time_ and arg_301_1.time_ < var_304_15 + var_304_25 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_15) / var_304_25

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_15 + var_304_25 and arg_301_1.time_ < var_304_15 + var_304_25 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play319891072 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 319891072
		arg_305_1.duration_ = 3.3

		local var_305_0 = {
			zh = 1.7,
			ja = 3.3
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
				arg_305_0:Play319891073(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.225

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[6].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(319891072)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 9
				local var_308_6 = utf8.len(var_308_4)
				local var_308_7 = var_308_5 <= 0 and var_308_1 or var_308_1 * (var_308_6 / var_308_5)

				if var_308_7 > 0 and var_308_1 < var_308_7 then
					arg_305_1.talkMaxDuration = var_308_7

					if var_308_7 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_7 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_4
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891072", "story_v_out_319891.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_319891", "319891072", "story_v_out_319891.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_319891", "319891072", "story_v_out_319891.awb")

						arg_305_1:RecordAudio("319891072", var_308_9)
						arg_305_1:RecordAudio("319891072", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_319891", "319891072", "story_v_out_319891.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_319891", "319891072", "story_v_out_319891.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_10 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_10 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_10

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_10 and arg_305_1.time_ < var_308_0 + var_308_10 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play319891073 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 319891073
		arg_309_1.duration_ = 5.6

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play319891074(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1084ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos1084ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0, 100, 0)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1084ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0, 100, 0)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["1084ui_story"]
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 and arg_309_1.var_.characterEffect1084ui_story == nil then
				arg_309_1.var_.characterEffect1084ui_story = var_312_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_11 = 0.200000002980232

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11

				if arg_309_1.var_.characterEffect1084ui_story then
					arg_309_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 and arg_309_1.var_.characterEffect1084ui_story then
				arg_309_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			if arg_309_1.frameCnt_ <= 1 then
				arg_309_1.dialog_:SetActive(false)
			end

			local var_312_13 = 0.6
			local var_312_14 = 0.5

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0

				arg_309_1.dialog_:SetActive(true)

				local var_312_15 = LeanTween.value(arg_309_1.dialog_, 0, 1, 0.3)

				var_312_15:setOnUpdate(LuaHelper.FloatAction(function(arg_313_0)
					arg_309_1.dialogCg_.alpha = arg_313_0
				end))
				var_312_15:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_309_1.dialog_)
					var_312_15:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_309_1.duration_ = arg_309_1.duration_ + 0.3

				SetActive(arg_309_1.leftNameGo_, false)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_16 = arg_309_1:GetWordFromCfg(319891073)
				local var_312_17 = arg_309_1:FormatText(var_312_16.content)

				arg_309_1.text_.text = var_312_17

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_18 = 20
				local var_312_19 = utf8.len(var_312_17)
				local var_312_20 = var_312_18 <= 0 and var_312_14 or var_312_14 * (var_312_19 / var_312_18)

				if var_312_20 > 0 and var_312_14 < var_312_20 then
					arg_309_1.talkMaxDuration = var_312_20
					var_312_13 = var_312_13 + 0.3

					if var_312_20 + var_312_13 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_20 + var_312_13
					end
				end

				arg_309_1.text_.text = var_312_17
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_21 = var_312_13 + 0.3
			local var_312_22 = math.max(var_312_14, arg_309_1.talkMaxDuration)

			if var_312_21 <= arg_309_1.time_ and arg_309_1.time_ < var_312_21 + var_312_22 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_21) / var_312_22

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_21 + var_312_22 and arg_309_1.time_ < var_312_21 + var_312_22 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play319891074 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 319891074
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play319891075(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0
			local var_318_1 = 1.35

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_2 = arg_315_1:GetWordFromCfg(319891074)
				local var_318_3 = arg_315_1:FormatText(var_318_2.content)

				arg_315_1.text_.text = var_318_3

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_4 = 54
				local var_318_5 = utf8.len(var_318_3)
				local var_318_6 = var_318_4 <= 0 and var_318_1 or var_318_1 * (var_318_5 / var_318_4)

				if var_318_6 > 0 and var_318_1 < var_318_6 then
					arg_315_1.talkMaxDuration = var_318_6

					if var_318_6 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_6 + var_318_0
					end
				end

				arg_315_1.text_.text = var_318_3
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_7 = math.max(var_318_1, arg_315_1.talkMaxDuration)

			if var_318_0 <= arg_315_1.time_ and arg_315_1.time_ < var_318_0 + var_318_7 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_0) / var_318_7

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_0 + var_318_7 and arg_315_1.time_ < var_318_0 + var_318_7 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play319891075 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 319891075
		arg_319_1.duration_ = 5.066

		local var_319_0 = {
			zh = 3.633,
			ja = 5.066
		}
		local var_319_1 = manager.audio:GetLocalizationFlag()

		if var_319_0[var_319_1] ~= nil then
			arg_319_1.duration_ = var_319_0[var_319_1]
		end

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play319891076(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1084ui_story"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos1084ui_story = var_322_0.localPosition

				local var_322_2 = "1084ui_story"

				arg_319_1:ShowWeapon(arg_319_1.var_[var_322_2 .. "Animator"].transform, true)
			end

			local var_322_3 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_3 then
				local var_322_4 = (arg_319_1.time_ - var_322_1) / var_322_3
				local var_322_5 = Vector3.New(0, -0.97, -6)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1084ui_story, var_322_5, var_322_4)

				local var_322_6 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_6.x, var_322_6.y, var_322_6.z)

				local var_322_7 = var_322_0.localEulerAngles

				var_322_7.z = 0
				var_322_7.x = 0
				var_322_0.localEulerAngles = var_322_7
			end

			if arg_319_1.time_ >= var_322_1 + var_322_3 and arg_319_1.time_ < var_322_1 + var_322_3 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_322_8 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_8.x, var_322_8.y, var_322_8.z)

				local var_322_9 = var_322_0.localEulerAngles

				var_322_9.z = 0
				var_322_9.x = 0
				var_322_0.localEulerAngles = var_322_9
			end

			local var_322_10 = arg_319_1.actors_["1084ui_story"]
			local var_322_11 = 0

			if var_322_11 < arg_319_1.time_ and arg_319_1.time_ <= var_322_11 + arg_322_0 and arg_319_1.var_.characterEffect1084ui_story == nil then
				arg_319_1.var_.characterEffect1084ui_story = var_322_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_12 = 0.200000002980232

			if var_322_11 <= arg_319_1.time_ and arg_319_1.time_ < var_322_11 + var_322_12 then
				local var_322_13 = (arg_319_1.time_ - var_322_11) / var_322_12

				if arg_319_1.var_.characterEffect1084ui_story then
					arg_319_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_11 + var_322_12 and arg_319_1.time_ < var_322_11 + var_322_12 + arg_322_0 and arg_319_1.var_.characterEffect1084ui_story then
				arg_319_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_322_15 = 0

			if var_322_15 < arg_319_1.time_ and arg_319_1.time_ <= var_322_15 + arg_322_0 then
				arg_319_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			if arg_319_1.frameCnt_ <= 1 then
				arg_319_1.dialog_:SetActive(false)
			end

			local var_322_16 = 0.9
			local var_322_17 = 0.25

			if var_322_16 < arg_319_1.time_ and arg_319_1.time_ <= var_322_16 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0

				arg_319_1.dialog_:SetActive(true)

				local var_322_18 = LeanTween.value(arg_319_1.dialog_, 0, 1, 0.3)

				var_322_18:setOnUpdate(LuaHelper.FloatAction(function(arg_323_0)
					arg_319_1.dialogCg_.alpha = arg_323_0
				end))
				var_322_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_319_1.dialog_)
					var_322_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_319_1.duration_ = arg_319_1.duration_ + 0.3

				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_19 = arg_319_1:FormatText(StoryNameCfg[6].name)

				arg_319_1.leftNameTxt_.text = var_322_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_20 = arg_319_1:GetWordFromCfg(319891075)
				local var_322_21 = arg_319_1:FormatText(var_322_20.content)

				arg_319_1.text_.text = var_322_21

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_22 = 10
				local var_322_23 = utf8.len(var_322_21)
				local var_322_24 = var_322_22 <= 0 and var_322_17 or var_322_17 * (var_322_23 / var_322_22)

				if var_322_24 > 0 and var_322_17 < var_322_24 then
					arg_319_1.talkMaxDuration = var_322_24
					var_322_16 = var_322_16 + 0.3

					if var_322_24 + var_322_16 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_24 + var_322_16
					end
				end

				arg_319_1.text_.text = var_322_21
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891075", "story_v_out_319891.awb") ~= 0 then
					local var_322_25 = manager.audio:GetVoiceLength("story_v_out_319891", "319891075", "story_v_out_319891.awb") / 1000

					if var_322_25 + var_322_16 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_25 + var_322_16
					end

					if var_322_20.prefab_name ~= "" and arg_319_1.actors_[var_322_20.prefab_name] ~= nil then
						local var_322_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_20.prefab_name].transform, "story_v_out_319891", "319891075", "story_v_out_319891.awb")

						arg_319_1:RecordAudio("319891075", var_322_26)
						arg_319_1:RecordAudio("319891075", var_322_26)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_319891", "319891075", "story_v_out_319891.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_319891", "319891075", "story_v_out_319891.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_27 = var_322_16 + 0.3
			local var_322_28 = math.max(var_322_17, arg_319_1.talkMaxDuration)

			if var_322_27 <= arg_319_1.time_ and arg_319_1.time_ < var_322_27 + var_322_28 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_27) / var_322_28

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_27 + var_322_28 and arg_319_1.time_ < var_322_27 + var_322_28 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play319891076 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 319891076
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play319891077(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1084ui_story"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.characterEffect1084ui_story == nil then
				arg_325_1.var_.characterEffect1084ui_story = var_328_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_2 = 0.200000002980232

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.characterEffect1084ui_story then
					local var_328_4 = Mathf.Lerp(0, 0.5, var_328_3)

					arg_325_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_325_1.var_.characterEffect1084ui_story.fillRatio = var_328_4
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.characterEffect1084ui_story then
				local var_328_5 = 0.5

				arg_325_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_325_1.var_.characterEffect1084ui_story.fillRatio = var_328_5
			end

			local var_328_6 = 0
			local var_328_7 = 1.125

			if var_328_6 < arg_325_1.time_ and arg_325_1.time_ <= var_328_6 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_8 = arg_325_1:GetWordFromCfg(319891076)
				local var_328_9 = arg_325_1:FormatText(var_328_8.content)

				arg_325_1.text_.text = var_328_9

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_10 = 45
				local var_328_11 = utf8.len(var_328_9)
				local var_328_12 = var_328_10 <= 0 and var_328_7 or var_328_7 * (var_328_11 / var_328_10)

				if var_328_12 > 0 and var_328_7 < var_328_12 then
					arg_325_1.talkMaxDuration = var_328_12

					if var_328_12 + var_328_6 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_12 + var_328_6
					end
				end

				arg_325_1.text_.text = var_328_9
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_13 = math.max(var_328_7, arg_325_1.talkMaxDuration)

			if var_328_6 <= arg_325_1.time_ and arg_325_1.time_ < var_328_6 + var_328_13 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_6) / var_328_13

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_6 + var_328_13 and arg_325_1.time_ < var_328_6 + var_328_13 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play319891077 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 319891077
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play319891078(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1084ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1084ui_story = var_332_0.localPosition

				local var_332_2 = "1084ui_story"

				arg_329_1:ShowWeapon(arg_329_1.var_[var_332_2 .. "Animator"].transform, true)
			end

			local var_332_3 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_3 then
				local var_332_4 = (arg_329_1.time_ - var_332_1) / var_332_3
				local var_332_5 = Vector3.New(0, 100, 0)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1084ui_story, var_332_5, var_332_4)

				local var_332_6 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_6.x, var_332_6.y, var_332_6.z)

				local var_332_7 = var_332_0.localEulerAngles

				var_332_7.z = 0
				var_332_7.x = 0
				var_332_0.localEulerAngles = var_332_7
			end

			if arg_329_1.time_ >= var_332_1 + var_332_3 and arg_329_1.time_ < var_332_1 + var_332_3 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0, 100, 0)

				local var_332_8 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_8.x, var_332_8.y, var_332_8.z)

				local var_332_9 = var_332_0.localEulerAngles

				var_332_9.z = 0
				var_332_9.x = 0
				var_332_0.localEulerAngles = var_332_9
			end

			local var_332_10 = 0
			local var_332_11 = 1.625

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, false)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_12 = arg_329_1:GetWordFromCfg(319891077)
				local var_332_13 = arg_329_1:FormatText(var_332_12.content)

				arg_329_1.text_.text = var_332_13

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_14 = 65
				local var_332_15 = utf8.len(var_332_13)
				local var_332_16 = var_332_14 <= 0 and var_332_11 or var_332_11 * (var_332_15 / var_332_14)

				if var_332_16 > 0 and var_332_11 < var_332_16 then
					arg_329_1.talkMaxDuration = var_332_16

					if var_332_16 + var_332_10 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_16 + var_332_10
					end
				end

				arg_329_1.text_.text = var_332_13
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_17 = math.max(var_332_11, arg_329_1.talkMaxDuration)

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_17 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_10) / var_332_17

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_10 + var_332_17 and arg_329_1.time_ < var_332_10 + var_332_17 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play319891078 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 319891078
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play319891079(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.975

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

				local var_336_2 = arg_333_1:GetWordFromCfg(319891078)
				local var_336_3 = arg_333_1:FormatText(var_336_2.content)

				arg_333_1.text_.text = var_336_3

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_4 = 39
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
	Play319891079 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 319891079
		arg_337_1.duration_ = 3.4

		local var_337_0 = {
			zh = 1.999999999999,
			ja = 3.4
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play319891080(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1084ui_story"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1084ui_story = var_340_0.localPosition
			end

			local var_340_2 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2
				local var_340_4 = Vector3.New(0, -0.97, -6)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1084ui_story, var_340_4, var_340_3)

				local var_340_5 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_5.x, var_340_5.y, var_340_5.z)

				local var_340_6 = var_340_0.localEulerAngles

				var_340_6.z = 0
				var_340_6.x = 0
				var_340_0.localEulerAngles = var_340_6
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_340_7 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_7.x, var_340_7.y, var_340_7.z)

				local var_340_8 = var_340_0.localEulerAngles

				var_340_8.z = 0
				var_340_8.x = 0
				var_340_0.localEulerAngles = var_340_8
			end

			local var_340_9 = arg_337_1.actors_["1084ui_story"]
			local var_340_10 = 0

			if var_340_10 < arg_337_1.time_ and arg_337_1.time_ <= var_340_10 + arg_340_0 and arg_337_1.var_.characterEffect1084ui_story == nil then
				arg_337_1.var_.characterEffect1084ui_story = var_340_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_11 = 0.200000002980232

			if var_340_10 <= arg_337_1.time_ and arg_337_1.time_ < var_340_10 + var_340_11 then
				local var_340_12 = (arg_337_1.time_ - var_340_10) / var_340_11

				if arg_337_1.var_.characterEffect1084ui_story then
					arg_337_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_10 + var_340_11 and arg_337_1.time_ < var_340_10 + var_340_11 + arg_340_0 and arg_337_1.var_.characterEffect1084ui_story then
				arg_337_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_340_13 = 0

			if var_340_13 < arg_337_1.time_ and arg_337_1.time_ <= var_340_13 + arg_340_0 then
				arg_337_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_340_14 = 0
			local var_340_15 = 0.125

			if var_340_14 < arg_337_1.time_ and arg_337_1.time_ <= var_340_14 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_16 = arg_337_1:FormatText(StoryNameCfg[6].name)

				arg_337_1.leftNameTxt_.text = var_340_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_17 = arg_337_1:GetWordFromCfg(319891079)
				local var_340_18 = arg_337_1:FormatText(var_340_17.content)

				arg_337_1.text_.text = var_340_18

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_19 = 5
				local var_340_20 = utf8.len(var_340_18)
				local var_340_21 = var_340_19 <= 0 and var_340_15 or var_340_15 * (var_340_20 / var_340_19)

				if var_340_21 > 0 and var_340_15 < var_340_21 then
					arg_337_1.talkMaxDuration = var_340_21

					if var_340_21 + var_340_14 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_21 + var_340_14
					end
				end

				arg_337_1.text_.text = var_340_18
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891079", "story_v_out_319891.awb") ~= 0 then
					local var_340_22 = manager.audio:GetVoiceLength("story_v_out_319891", "319891079", "story_v_out_319891.awb") / 1000

					if var_340_22 + var_340_14 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_22 + var_340_14
					end

					if var_340_17.prefab_name ~= "" and arg_337_1.actors_[var_340_17.prefab_name] ~= nil then
						local var_340_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_17.prefab_name].transform, "story_v_out_319891", "319891079", "story_v_out_319891.awb")

						arg_337_1:RecordAudio("319891079", var_340_23)
						arg_337_1:RecordAudio("319891079", var_340_23)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_319891", "319891079", "story_v_out_319891.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_319891", "319891079", "story_v_out_319891.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_24 = math.max(var_340_15, arg_337_1.talkMaxDuration)

			if var_340_14 <= arg_337_1.time_ and arg_337_1.time_ < var_340_14 + var_340_24 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_14) / var_340_24

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_14 + var_340_24 and arg_337_1.time_ < var_340_14 + var_340_24 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play319891080 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 319891080
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play319891081(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1084ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1084ui_story == nil then
				arg_341_1.var_.characterEffect1084ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.200000002980232

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1084ui_story then
					local var_344_4 = Mathf.Lerp(0, 0.5, var_344_3)

					arg_341_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1084ui_story.fillRatio = var_344_4
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1084ui_story then
				local var_344_5 = 0.5

				arg_341_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1084ui_story.fillRatio = var_344_5
			end

			local var_344_6 = 0
			local var_344_7 = 0.85

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, false)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_8 = arg_341_1:GetWordFromCfg(319891080)
				local var_344_9 = arg_341_1:FormatText(var_344_8.content)

				arg_341_1.text_.text = var_344_9

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_10 = 34
				local var_344_11 = utf8.len(var_344_9)
				local var_344_12 = var_344_10 <= 0 and var_344_7 or var_344_7 * (var_344_11 / var_344_10)

				if var_344_12 > 0 and var_344_7 < var_344_12 then
					arg_341_1.talkMaxDuration = var_344_12

					if var_344_12 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_12 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_9
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_13 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_13 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_13

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_13 and arg_341_1.time_ < var_344_6 + var_344_13 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play319891081 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 319891081
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play319891082(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1084ui_story"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1084ui_story = var_348_0.localPosition
			end

			local var_348_2 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2
				local var_348_4 = Vector3.New(0, 100, 0)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1084ui_story, var_348_4, var_348_3)

				local var_348_5 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_5.x, var_348_5.y, var_348_5.z)

				local var_348_6 = var_348_0.localEulerAngles

				var_348_6.z = 0
				var_348_6.x = 0
				var_348_0.localEulerAngles = var_348_6
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(0, 100, 0)

				local var_348_7 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_7.x, var_348_7.y, var_348_7.z)

				local var_348_8 = var_348_0.localEulerAngles

				var_348_8.z = 0
				var_348_8.x = 0
				var_348_0.localEulerAngles = var_348_8
			end

			local var_348_9 = 0
			local var_348_10 = 1.175

			if var_348_9 < arg_345_1.time_ and arg_345_1.time_ <= var_348_9 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, false)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_11 = arg_345_1:GetWordFromCfg(319891081)
				local var_348_12 = arg_345_1:FormatText(var_348_11.content)

				arg_345_1.text_.text = var_348_12

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_13 = 47
				local var_348_14 = utf8.len(var_348_12)
				local var_348_15 = var_348_13 <= 0 and var_348_10 or var_348_10 * (var_348_14 / var_348_13)

				if var_348_15 > 0 and var_348_10 < var_348_15 then
					arg_345_1.talkMaxDuration = var_348_15

					if var_348_15 + var_348_9 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_15 + var_348_9
					end
				end

				arg_345_1.text_.text = var_348_12
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_16 = math.max(var_348_10, arg_345_1.talkMaxDuration)

			if var_348_9 <= arg_345_1.time_ and arg_345_1.time_ < var_348_9 + var_348_16 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_9) / var_348_16

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_9 + var_348_16 and arg_345_1.time_ < var_348_9 + var_348_16 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play319891082 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 319891082
		arg_349_1.duration_ = 5.53266666666667

		local var_349_0 = {
			zh = 3.066666663685,
			ja = 5.53266666666667
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play319891083(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1084ui_story"].transform
			local var_352_1 = 1.06666666368643

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos1084ui_story = var_352_0.localPosition
			end

			local var_352_2 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2
				local var_352_4 = Vector3.New(0, -0.97, -6)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1084ui_story, var_352_4, var_352_3)

				local var_352_5 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_5.x, var_352_5.y, var_352_5.z)

				local var_352_6 = var_352_0.localEulerAngles

				var_352_6.z = 0
				var_352_6.x = 0
				var_352_0.localEulerAngles = var_352_6
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_352_7 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_7.x, var_352_7.y, var_352_7.z)

				local var_352_8 = var_352_0.localEulerAngles

				var_352_8.z = 0
				var_352_8.x = 0
				var_352_0.localEulerAngles = var_352_8
			end

			local var_352_9 = arg_349_1.actors_["1084ui_story"]
			local var_352_10 = 1.06666666368643

			if var_352_10 < arg_349_1.time_ and arg_349_1.time_ <= var_352_10 + arg_352_0 and arg_349_1.var_.characterEffect1084ui_story == nil then
				arg_349_1.var_.characterEffect1084ui_story = var_352_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_11 = 0.200000002980232

			if var_352_10 <= arg_349_1.time_ and arg_349_1.time_ < var_352_10 + var_352_11 then
				local var_352_12 = (arg_349_1.time_ - var_352_10) / var_352_11

				if arg_349_1.var_.characterEffect1084ui_story then
					arg_349_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_10 + var_352_11 and arg_349_1.time_ < var_352_10 + var_352_11 + arg_352_0 and arg_349_1.var_.characterEffect1084ui_story then
				arg_349_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_352_13 = manager.ui.mainCamera.transform
			local var_352_14 = 0

			if var_352_14 < arg_349_1.time_ and arg_349_1.time_ <= var_352_14 + arg_352_0 then
				local var_352_15 = arg_349_1.var_.effect1616

				if not var_352_15 then
					var_352_15 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_352_15.name = "1616"
					arg_349_1.var_.effect1616 = var_352_15
				end

				local var_352_16 = var_352_13:Find("")

				if var_352_16 then
					var_352_15.transform.parent = var_352_16
				else
					var_352_15.transform.parent = var_352_13
				end

				var_352_15.transform.localPosition = Vector3.New(0, 0, 0)
				var_352_15.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_352_17 = 1.06666666368643

			if var_352_17 < arg_349_1.time_ and arg_349_1.time_ <= var_352_17 + arg_352_0 then
				arg_349_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			if arg_349_1.frameCnt_ <= 1 then
				arg_349_1.dialog_:SetActive(false)
			end

			local var_352_18 = 1.26666666666667
			local var_352_19 = 0.2

			if var_352_18 < arg_349_1.time_ and arg_349_1.time_ <= var_352_18 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0

				arg_349_1.dialog_:SetActive(true)

				local var_352_20 = LeanTween.value(arg_349_1.dialog_, 0, 1, 0.3)

				var_352_20:setOnUpdate(LuaHelper.FloatAction(function(arg_353_0)
					arg_349_1.dialogCg_.alpha = arg_353_0
				end))
				var_352_20:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_349_1.dialog_)
					var_352_20:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_349_1.duration_ = arg_349_1.duration_ + 0.3

				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_21 = arg_349_1:FormatText(StoryNameCfg[6].name)

				arg_349_1.leftNameTxt_.text = var_352_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_22 = arg_349_1:GetWordFromCfg(319891082)
				local var_352_23 = arg_349_1:FormatText(var_352_22.content)

				arg_349_1.text_.text = var_352_23

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_24 = 8
				local var_352_25 = utf8.len(var_352_23)
				local var_352_26 = var_352_24 <= 0 and var_352_19 or var_352_19 * (var_352_25 / var_352_24)

				if var_352_26 > 0 and var_352_19 < var_352_26 then
					arg_349_1.talkMaxDuration = var_352_26
					var_352_18 = var_352_18 + 0.3

					if var_352_26 + var_352_18 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_26 + var_352_18
					end
				end

				arg_349_1.text_.text = var_352_23
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891082", "story_v_out_319891.awb") ~= 0 then
					local var_352_27 = manager.audio:GetVoiceLength("story_v_out_319891", "319891082", "story_v_out_319891.awb") / 1000

					if var_352_27 + var_352_18 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_27 + var_352_18
					end

					if var_352_22.prefab_name ~= "" and arg_349_1.actors_[var_352_22.prefab_name] ~= nil then
						local var_352_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_22.prefab_name].transform, "story_v_out_319891", "319891082", "story_v_out_319891.awb")

						arg_349_1:RecordAudio("319891082", var_352_28)
						arg_349_1:RecordAudio("319891082", var_352_28)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_319891", "319891082", "story_v_out_319891.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_319891", "319891082", "story_v_out_319891.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_29 = var_352_18 + 0.3
			local var_352_30 = math.max(var_352_19, arg_349_1.talkMaxDuration)

			if var_352_29 <= arg_349_1.time_ and arg_349_1.time_ < var_352_29 + var_352_30 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_29) / var_352_30

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_29 + var_352_30 and arg_349_1.time_ < var_352_29 + var_352_30 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play319891083 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 319891083
		arg_355_1.duration_ = 2.3

		local var_355_0 = {
			zh = 1.6,
			ja = 2.3
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
				arg_355_0:Play319891084(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0
			local var_358_1 = 0.175

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_2 = arg_355_1:FormatText(StoryNameCfg[6].name)

				arg_355_1.leftNameTxt_.text = var_358_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_3 = arg_355_1:GetWordFromCfg(319891083)
				local var_358_4 = arg_355_1:FormatText(var_358_3.content)

				arg_355_1.text_.text = var_358_4

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_5 = 7
				local var_358_6 = utf8.len(var_358_4)
				local var_358_7 = var_358_5 <= 0 and var_358_1 or var_358_1 * (var_358_6 / var_358_5)

				if var_358_7 > 0 and var_358_1 < var_358_7 then
					arg_355_1.talkMaxDuration = var_358_7

					if var_358_7 + var_358_0 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_7 + var_358_0
					end
				end

				arg_355_1.text_.text = var_358_4
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891083", "story_v_out_319891.awb") ~= 0 then
					local var_358_8 = manager.audio:GetVoiceLength("story_v_out_319891", "319891083", "story_v_out_319891.awb") / 1000

					if var_358_8 + var_358_0 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_8 + var_358_0
					end

					if var_358_3.prefab_name ~= "" and arg_355_1.actors_[var_358_3.prefab_name] ~= nil then
						local var_358_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_3.prefab_name].transform, "story_v_out_319891", "319891083", "story_v_out_319891.awb")

						arg_355_1:RecordAudio("319891083", var_358_9)
						arg_355_1:RecordAudio("319891083", var_358_9)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_319891", "319891083", "story_v_out_319891.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_319891", "319891083", "story_v_out_319891.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_10 = math.max(var_358_1, arg_355_1.talkMaxDuration)

			if var_358_0 <= arg_355_1.time_ and arg_355_1.time_ < var_358_0 + var_358_10 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_0) / var_358_10

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_0 + var_358_10 and arg_355_1.time_ < var_358_0 + var_358_10 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play319891084 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 319891084
		arg_359_1.duration_ = 5.9

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play319891085(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = manager.ui.mainCamera.transform
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 then
				local var_362_2 = arg_359_1.var_.effect1616

				if var_362_2 then
					Object.Destroy(var_362_2)

					arg_359_1.var_.effect1616 = nil
				end
			end

			local var_362_3 = 0

			if var_362_3 < arg_359_1.time_ and arg_359_1.time_ <= var_362_3 + arg_362_0 then
				arg_359_1.mask_.enabled = true
				arg_359_1.mask_.raycastTarget = false

				arg_359_1:SetGaussion(false)
			end

			local var_362_4 = 0.633333333333333

			if var_362_3 <= arg_359_1.time_ and arg_359_1.time_ < var_362_3 + var_362_4 then
				local var_362_5 = (arg_359_1.time_ - var_362_3) / var_362_4
				local var_362_6 = Color.New(0.7169812, 0.01690993, 0.01690993)

				var_362_6.a = Mathf.Lerp(1, 0, var_362_5)
				arg_359_1.mask_.color = var_362_6
			end

			if arg_359_1.time_ >= var_362_3 + var_362_4 and arg_359_1.time_ < var_362_3 + var_362_4 + arg_362_0 then
				local var_362_7 = Color.New(0.7169812, 0.01690993, 0.01690993)
				local var_362_8 = 0

				arg_359_1.mask_.enabled = false
				var_362_7.a = var_362_8
				arg_359_1.mask_.color = var_362_7
			end

			local var_362_9 = arg_359_1.actors_["1084ui_story"]
			local var_362_10 = 0

			if var_362_10 < arg_359_1.time_ and arg_359_1.time_ <= var_362_10 + arg_362_0 and arg_359_1.var_.characterEffect1084ui_story == nil then
				arg_359_1.var_.characterEffect1084ui_story = var_362_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_11 = 0.200000002980232

			if var_362_10 <= arg_359_1.time_ and arg_359_1.time_ < var_362_10 + var_362_11 then
				local var_362_12 = (arg_359_1.time_ - var_362_10) / var_362_11

				if arg_359_1.var_.characterEffect1084ui_story then
					arg_359_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_10 + var_362_11 and arg_359_1.time_ < var_362_10 + var_362_11 + arg_362_0 and arg_359_1.var_.characterEffect1084ui_story then
				arg_359_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_362_13 = 0
			local var_362_14 = 1

			if var_362_13 < arg_359_1.time_ and arg_359_1.time_ <= var_362_13 + arg_362_0 then
				local var_362_15 = "play"
				local var_362_16 = "effect"

				arg_359_1:AudioAction(var_362_15, var_362_16, "se_story_123_02", "se_story_123_02_fire", "")
			end

			local var_362_17 = arg_359_1.actors_["1084ui_story"].transform
			local var_362_18 = 0

			if var_362_18 < arg_359_1.time_ and arg_359_1.time_ <= var_362_18 + arg_362_0 then
				arg_359_1.var_.moveOldPos1084ui_story = var_362_17.localPosition
			end

			local var_362_19 = 0.001

			if var_362_18 <= arg_359_1.time_ and arg_359_1.time_ < var_362_18 + var_362_19 then
				local var_362_20 = (arg_359_1.time_ - var_362_18) / var_362_19
				local var_362_21 = Vector3.New(0, 100, 0)

				var_362_17.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1084ui_story, var_362_21, var_362_20)

				local var_362_22 = manager.ui.mainCamera.transform.position - var_362_17.position

				var_362_17.forward = Vector3.New(var_362_22.x, var_362_22.y, var_362_22.z)

				local var_362_23 = var_362_17.localEulerAngles

				var_362_23.z = 0
				var_362_23.x = 0
				var_362_17.localEulerAngles = var_362_23
			end

			if arg_359_1.time_ >= var_362_18 + var_362_19 and arg_359_1.time_ < var_362_18 + var_362_19 + arg_362_0 then
				var_362_17.localPosition = Vector3.New(0, 100, 0)

				local var_362_24 = manager.ui.mainCamera.transform.position - var_362_17.position

				var_362_17.forward = Vector3.New(var_362_24.x, var_362_24.y, var_362_24.z)

				local var_362_25 = var_362_17.localEulerAngles

				var_362_25.z = 0
				var_362_25.x = 0
				var_362_17.localEulerAngles = var_362_25
			end

			if arg_359_1.frameCnt_ <= 1 then
				arg_359_1.dialog_:SetActive(false)
			end

			local var_362_26 = 0.9
			local var_362_27 = 1.475

			if var_362_26 < arg_359_1.time_ and arg_359_1.time_ <= var_362_26 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0

				arg_359_1.dialog_:SetActive(true)

				local var_362_28 = LeanTween.value(arg_359_1.dialog_, 0, 1, 0.3)

				var_362_28:setOnUpdate(LuaHelper.FloatAction(function(arg_363_0)
					arg_359_1.dialogCg_.alpha = arg_363_0
				end))
				var_362_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_359_1.dialog_)
					var_362_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_359_1.duration_ = arg_359_1.duration_ + 0.3

				SetActive(arg_359_1.leftNameGo_, false)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_29 = arg_359_1:GetWordFromCfg(319891084)
				local var_362_30 = arg_359_1:FormatText(var_362_29.content)

				arg_359_1.text_.text = var_362_30

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_31 = 59
				local var_362_32 = utf8.len(var_362_30)
				local var_362_33 = var_362_31 <= 0 and var_362_27 or var_362_27 * (var_362_32 / var_362_31)

				if var_362_33 > 0 and var_362_27 < var_362_33 then
					arg_359_1.talkMaxDuration = var_362_33
					var_362_26 = var_362_26 + 0.3

					if var_362_33 + var_362_26 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_33 + var_362_26
					end
				end

				arg_359_1.text_.text = var_362_30
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_34 = var_362_26 + 0.3
			local var_362_35 = math.max(var_362_27, arg_359_1.talkMaxDuration)

			if var_362_34 <= arg_359_1.time_ and arg_359_1.time_ < var_362_34 + var_362_35 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_34) / var_362_35

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_34 + var_362_35 and arg_359_1.time_ < var_362_34 + var_362_35 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play319891085 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 319891085
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play319891086(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 1.025

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, false)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_2 = arg_365_1:GetWordFromCfg(319891085)
				local var_368_3 = arg_365_1:FormatText(var_368_2.content)

				arg_365_1.text_.text = var_368_3

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_4 = 41
				local var_368_5 = utf8.len(var_368_3)
				local var_368_6 = var_368_4 <= 0 and var_368_1 or var_368_1 * (var_368_5 / var_368_4)

				if var_368_6 > 0 and var_368_1 < var_368_6 then
					arg_365_1.talkMaxDuration = var_368_6

					if var_368_6 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_6 + var_368_0
					end
				end

				arg_365_1.text_.text = var_368_3
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_7 = math.max(var_368_1, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_7 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_0) / var_368_7

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_7 and arg_365_1.time_ < var_368_0 + var_368_7 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play319891086 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 319891086
		arg_369_1.duration_ = 1.999999999999

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play319891087(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["1084ui_story"].transform
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.var_.moveOldPos1084ui_story = var_372_0.localPosition

				local var_372_2 = "1084ui_story"

				arg_369_1:ShowWeapon(arg_369_1.var_[var_372_2 .. "Animator"].transform, true)
			end

			local var_372_3 = 0.001

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_3 then
				local var_372_4 = (arg_369_1.time_ - var_372_1) / var_372_3
				local var_372_5 = Vector3.New(0, -0.97, -6)

				var_372_0.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos1084ui_story, var_372_5, var_372_4)

				local var_372_6 = manager.ui.mainCamera.transform.position - var_372_0.position

				var_372_0.forward = Vector3.New(var_372_6.x, var_372_6.y, var_372_6.z)

				local var_372_7 = var_372_0.localEulerAngles

				var_372_7.z = 0
				var_372_7.x = 0
				var_372_0.localEulerAngles = var_372_7
			end

			if arg_369_1.time_ >= var_372_1 + var_372_3 and arg_369_1.time_ < var_372_1 + var_372_3 + arg_372_0 then
				var_372_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_372_8 = manager.ui.mainCamera.transform.position - var_372_0.position

				var_372_0.forward = Vector3.New(var_372_8.x, var_372_8.y, var_372_8.z)

				local var_372_9 = var_372_0.localEulerAngles

				var_372_9.z = 0
				var_372_9.x = 0
				var_372_0.localEulerAngles = var_372_9
			end

			local var_372_10 = arg_369_1.actors_["1084ui_story"]
			local var_372_11 = 0

			if var_372_11 < arg_369_1.time_ and arg_369_1.time_ <= var_372_11 + arg_372_0 and arg_369_1.var_.characterEffect1084ui_story == nil then
				arg_369_1.var_.characterEffect1084ui_story = var_372_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_12 = 0.200000002980232

			if var_372_11 <= arg_369_1.time_ and arg_369_1.time_ < var_372_11 + var_372_12 then
				local var_372_13 = (arg_369_1.time_ - var_372_11) / var_372_12

				if arg_369_1.var_.characterEffect1084ui_story then
					arg_369_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_369_1.time_ >= var_372_11 + var_372_12 and arg_369_1.time_ < var_372_11 + var_372_12 + arg_372_0 and arg_369_1.var_.characterEffect1084ui_story then
				arg_369_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_372_14 = 0

			if var_372_14 < arg_369_1.time_ and arg_369_1.time_ <= var_372_14 + arg_372_0 then
				arg_369_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_372_15 = 0
			local var_372_16 = 0.075

			if var_372_15 < arg_369_1.time_ and arg_369_1.time_ <= var_372_15 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_17 = arg_369_1:FormatText(StoryNameCfg[6].name)

				arg_369_1.leftNameTxt_.text = var_372_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_18 = arg_369_1:GetWordFromCfg(319891086)
				local var_372_19 = arg_369_1:FormatText(var_372_18.content)

				arg_369_1.text_.text = var_372_19

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_20 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891086", "story_v_out_319891.awb") ~= 0 then
					local var_372_23 = manager.audio:GetVoiceLength("story_v_out_319891", "319891086", "story_v_out_319891.awb") / 1000

					if var_372_23 + var_372_15 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_23 + var_372_15
					end

					if var_372_18.prefab_name ~= "" and arg_369_1.actors_[var_372_18.prefab_name] ~= nil then
						local var_372_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_18.prefab_name].transform, "story_v_out_319891", "319891086", "story_v_out_319891.awb")

						arg_369_1:RecordAudio("319891086", var_372_24)
						arg_369_1:RecordAudio("319891086", var_372_24)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_319891", "319891086", "story_v_out_319891.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_319891", "319891086", "story_v_out_319891.awb")
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
	Play319891087 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 319891087
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play319891088(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1084ui_story"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos1084ui_story = var_376_0.localPosition

				local var_376_2 = "1084ui_story"

				arg_373_1:ShowWeapon(arg_373_1.var_[var_376_2 .. "Animator"].transform, true)
			end

			local var_376_3 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_3 then
				local var_376_4 = (arg_373_1.time_ - var_376_1) / var_376_3
				local var_376_5 = Vector3.New(0, 100, 0)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1084ui_story, var_376_5, var_376_4)

				local var_376_6 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_6.x, var_376_6.y, var_376_6.z)

				local var_376_7 = var_376_0.localEulerAngles

				var_376_7.z = 0
				var_376_7.x = 0
				var_376_0.localEulerAngles = var_376_7
			end

			if arg_373_1.time_ >= var_376_1 + var_376_3 and arg_373_1.time_ < var_376_1 + var_376_3 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(0, 100, 0)

				local var_376_8 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_8.x, var_376_8.y, var_376_8.z)

				local var_376_9 = var_376_0.localEulerAngles

				var_376_9.z = 0
				var_376_9.x = 0
				var_376_0.localEulerAngles = var_376_9
			end

			local var_376_10 = 0
			local var_376_11 = 1.175

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, false)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_12 = arg_373_1:GetWordFromCfg(319891087)
				local var_376_13 = arg_373_1:FormatText(var_376_12.content)

				arg_373_1.text_.text = var_376_13

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_14 = 47
				local var_376_15 = utf8.len(var_376_13)
				local var_376_16 = var_376_14 <= 0 and var_376_11 or var_376_11 * (var_376_15 / var_376_14)

				if var_376_16 > 0 and var_376_11 < var_376_16 then
					arg_373_1.talkMaxDuration = var_376_16

					if var_376_16 + var_376_10 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_16 + var_376_10
					end
				end

				arg_373_1.text_.text = var_376_13
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_17 = math.max(var_376_11, arg_373_1.talkMaxDuration)

			if var_376_10 <= arg_373_1.time_ and arg_373_1.time_ < var_376_10 + var_376_17 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_10) / var_376_17

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_10 + var_376_17 and arg_373_1.time_ < var_376_10 + var_376_17 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play319891088 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 319891088
		arg_377_1.duration_ = 5.86666666666667

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play319891089(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 1

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				local var_380_2 = "play"
				local var_380_3 = "effect"

				arg_377_1:AudioAction(var_380_2, var_380_3, "se_story_side_1148", "se_story_1148_explosion", "")
			end

			local var_380_4 = manager.ui.mainCamera.transform
			local var_380_5 = 0

			if var_380_5 < arg_377_1.time_ and arg_377_1.time_ <= var_380_5 + arg_380_0 then
				arg_377_1.var_.shakeOldPos = var_380_4.localPosition
			end

			local var_380_6 = 0.766666666666667

			if var_380_5 <= arg_377_1.time_ and arg_377_1.time_ < var_380_5 + var_380_6 then
				local var_380_7 = (arg_377_1.time_ - var_380_5) / 0.066
				local var_380_8, var_380_9 = math.modf(var_380_7)

				var_380_4.localPosition = Vector3.New(var_380_9 * 0.13, var_380_9 * 0.13, var_380_9 * 0.13) + arg_377_1.var_.shakeOldPos
			end

			if arg_377_1.time_ >= var_380_5 + var_380_6 and arg_377_1.time_ < var_380_5 + var_380_6 + arg_380_0 then
				var_380_4.localPosition = arg_377_1.var_.shakeOldPos
			end

			if arg_377_1.frameCnt_ <= 1 then
				arg_377_1.dialog_:SetActive(false)
			end

			local var_380_10 = 0.866666666666667
			local var_380_11 = 1.45

			if var_380_10 < arg_377_1.time_ and arg_377_1.time_ <= var_380_10 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0

				arg_377_1.dialog_:SetActive(true)

				local var_380_12 = LeanTween.value(arg_377_1.dialog_, 0, 1, 0.3)

				var_380_12:setOnUpdate(LuaHelper.FloatAction(function(arg_381_0)
					arg_377_1.dialogCg_.alpha = arg_381_0
				end))
				var_380_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_377_1.dialog_)
					var_380_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_377_1.duration_ = arg_377_1.duration_ + 0.3

				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_13 = arg_377_1:GetWordFromCfg(319891088)
				local var_380_14 = arg_377_1:FormatText(var_380_13.content)

				arg_377_1.text_.text = var_380_14

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_15 = 58
				local var_380_16 = utf8.len(var_380_14)
				local var_380_17 = var_380_15 <= 0 and var_380_11 or var_380_11 * (var_380_16 / var_380_15)

				if var_380_17 > 0 and var_380_11 < var_380_17 then
					arg_377_1.talkMaxDuration = var_380_17
					var_380_10 = var_380_10 + 0.3

					if var_380_17 + var_380_10 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_17 + var_380_10
					end
				end

				arg_377_1.text_.text = var_380_14
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_18 = var_380_10 + 0.3
			local var_380_19 = math.max(var_380_11, arg_377_1.talkMaxDuration)

			if var_380_18 <= arg_377_1.time_ and arg_377_1.time_ < var_380_18 + var_380_19 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_18) / var_380_19

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_18 + var_380_19 and arg_377_1.time_ < var_380_18 + var_380_19 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play319891089 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 319891089
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play319891090(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0
			local var_386_1 = 1

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				local var_386_2 = "play"
				local var_386_3 = "effect"

				arg_383_1:AudioAction(var_386_2, var_386_3, "se_story_126_01", "se_story_126_01_noise", "")
			end

			local var_386_4 = manager.ui.mainCamera.transform
			local var_386_5 = 0

			if var_386_5 < arg_383_1.time_ and arg_383_1.time_ <= var_386_5 + arg_386_0 then
				arg_383_1.var_.shakeOldPos = var_386_4.localPosition
			end

			local var_386_6 = 0.766666666666667

			if var_386_5 <= arg_383_1.time_ and arg_383_1.time_ < var_386_5 + var_386_6 then
				local var_386_7 = (arg_383_1.time_ - var_386_5) / 0.066
				local var_386_8, var_386_9 = math.modf(var_386_7)

				var_386_4.localPosition = Vector3.New(var_386_9 * 0.13, var_386_9 * 0.13, var_386_9 * 0.13) + arg_383_1.var_.shakeOldPos
			end

			if arg_383_1.time_ >= var_386_5 + var_386_6 and arg_383_1.time_ < var_386_5 + var_386_6 + arg_386_0 then
				var_386_4.localPosition = arg_383_1.var_.shakeOldPos
			end

			local var_386_10 = manager.ui.mainCamera.transform
			local var_386_11 = 0

			if var_386_11 < arg_383_1.time_ and arg_383_1.time_ <= var_386_11 + arg_386_0 then
				local var_386_12 = arg_383_1.var_.effect1617

				if not var_386_12 then
					var_386_12 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_386_12.name = "1617"
					arg_383_1.var_.effect1617 = var_386_12
				end

				local var_386_13 = var_386_10:Find("")

				if var_386_13 then
					var_386_12.transform.parent = var_386_13
				else
					var_386_12.transform.parent = var_386_10
				end

				var_386_12.transform.localPosition = Vector3.New(0, 0, 0)
				var_386_12.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_386_14 = 0
			local var_386_15 = 1.325

			if var_386_14 < arg_383_1.time_ and arg_383_1.time_ <= var_386_14 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, false)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_16 = arg_383_1:GetWordFromCfg(319891089)
				local var_386_17 = arg_383_1:FormatText(var_386_16.content)

				arg_383_1.text_.text = var_386_17

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_18 = 53
				local var_386_19 = utf8.len(var_386_17)
				local var_386_20 = var_386_18 <= 0 and var_386_15 or var_386_15 * (var_386_19 / var_386_18)

				if var_386_20 > 0 and var_386_15 < var_386_20 then
					arg_383_1.talkMaxDuration = var_386_20

					if var_386_20 + var_386_14 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_20 + var_386_14
					end
				end

				arg_383_1.text_.text = var_386_17
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_21 = math.max(var_386_15, arg_383_1.talkMaxDuration)

			if var_386_14 <= arg_383_1.time_ and arg_383_1.time_ < var_386_14 + var_386_21 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_14) / var_386_21

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_14 + var_386_21 and arg_383_1.time_ < var_386_14 + var_386_21 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play319891090 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 319891090
		arg_387_1.duration_ = 3.8

		local var_387_0 = {
			zh = 1.999999999999,
			ja = 3.8
		}
		local var_387_1 = manager.audio:GetLocalizationFlag()

		if var_387_0[var_387_1] ~= nil then
			arg_387_1.duration_ = var_387_0[var_387_1]
		end

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play319891091(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["1084ui_story"].transform
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 then
				arg_387_1.var_.moveOldPos1084ui_story = var_390_0.localPosition

				local var_390_2 = "1084ui_story"

				arg_387_1:ShowWeapon(arg_387_1.var_[var_390_2 .. "Animator"].transform, false)
			end

			local var_390_3 = 0.001

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_3 then
				local var_390_4 = (arg_387_1.time_ - var_390_1) / var_390_3
				local var_390_5 = Vector3.New(0, -0.97, -6)

				var_390_0.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos1084ui_story, var_390_5, var_390_4)

				local var_390_6 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_6.x, var_390_6.y, var_390_6.z)

				local var_390_7 = var_390_0.localEulerAngles

				var_390_7.z = 0
				var_390_7.x = 0
				var_390_0.localEulerAngles = var_390_7
			end

			if arg_387_1.time_ >= var_390_1 + var_390_3 and arg_387_1.time_ < var_390_1 + var_390_3 + arg_390_0 then
				var_390_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_390_8 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_8.x, var_390_8.y, var_390_8.z)

				local var_390_9 = var_390_0.localEulerAngles

				var_390_9.z = 0
				var_390_9.x = 0
				var_390_0.localEulerAngles = var_390_9
			end

			local var_390_10 = arg_387_1.actors_["1084ui_story"]
			local var_390_11 = 0

			if var_390_11 < arg_387_1.time_ and arg_387_1.time_ <= var_390_11 + arg_390_0 and arg_387_1.var_.characterEffect1084ui_story == nil then
				arg_387_1.var_.characterEffect1084ui_story = var_390_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_12 = 0.200000002980232

			if var_390_11 <= arg_387_1.time_ and arg_387_1.time_ < var_390_11 + var_390_12 then
				local var_390_13 = (arg_387_1.time_ - var_390_11) / var_390_12

				if arg_387_1.var_.characterEffect1084ui_story then
					arg_387_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_387_1.time_ >= var_390_11 + var_390_12 and arg_387_1.time_ < var_390_11 + var_390_12 + arg_390_0 and arg_387_1.var_.characterEffect1084ui_story then
				arg_387_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_390_14 = 0

			if var_390_14 < arg_387_1.time_ and arg_387_1.time_ <= var_390_14 + arg_390_0 then
				arg_387_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_390_15 = manager.ui.mainCamera.transform
			local var_390_16 = 0

			if var_390_16 < arg_387_1.time_ and arg_387_1.time_ <= var_390_16 + arg_390_0 then
				local var_390_17 = arg_387_1.var_.effect1617

				if var_390_17 then
					Object.Destroy(var_390_17)

					arg_387_1.var_.effect1617 = nil
				end
			end

			local var_390_18 = 0

			if var_390_18 < arg_387_1.time_ and arg_387_1.time_ <= var_390_18 + arg_390_0 then
				arg_387_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_2")
			end

			local var_390_19 = 0
			local var_390_20 = 0.1

			if var_390_19 < arg_387_1.time_ and arg_387_1.time_ <= var_390_19 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_21 = arg_387_1:FormatText(StoryNameCfg[6].name)

				arg_387_1.leftNameTxt_.text = var_390_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_22 = arg_387_1:GetWordFromCfg(319891090)
				local var_390_23 = arg_387_1:FormatText(var_390_22.content)

				arg_387_1.text_.text = var_390_23

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_24 = 4
				local var_390_25 = utf8.len(var_390_23)
				local var_390_26 = var_390_24 <= 0 and var_390_20 or var_390_20 * (var_390_25 / var_390_24)

				if var_390_26 > 0 and var_390_20 < var_390_26 then
					arg_387_1.talkMaxDuration = var_390_26

					if var_390_26 + var_390_19 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_26 + var_390_19
					end
				end

				arg_387_1.text_.text = var_390_23
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319891", "319891090", "story_v_out_319891.awb") ~= 0 then
					local var_390_27 = manager.audio:GetVoiceLength("story_v_out_319891", "319891090", "story_v_out_319891.awb") / 1000

					if var_390_27 + var_390_19 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_27 + var_390_19
					end

					if var_390_22.prefab_name ~= "" and arg_387_1.actors_[var_390_22.prefab_name] ~= nil then
						local var_390_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_22.prefab_name].transform, "story_v_out_319891", "319891090", "story_v_out_319891.awb")

						arg_387_1:RecordAudio("319891090", var_390_28)
						arg_387_1:RecordAudio("319891090", var_390_28)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_319891", "319891090", "story_v_out_319891.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_319891", "319891090", "story_v_out_319891.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_29 = math.max(var_390_20, arg_387_1.talkMaxDuration)

			if var_390_19 <= arg_387_1.time_ and arg_387_1.time_ < var_390_19 + var_390_29 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_19) / var_390_29

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_19 + var_390_29 and arg_387_1.time_ < var_390_19 + var_390_29 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play319891091 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 319891091
		arg_391_1.duration_ = 6.46666666666667

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play319891092(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = 0

			if var_394_0 < arg_391_1.time_ and arg_391_1.time_ <= var_394_0 + arg_394_0 then
				local var_394_1 = manager.ui.mainCamera.transform.localPosition
				local var_394_2 = Vector3.New(0, 0, 10) + Vector3.New(var_394_1.x, var_394_1.y, 0)
				local var_394_3 = arg_391_1.bgs_.STblack

				var_394_3.transform.localPosition = var_394_2
				var_394_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_394_4 = var_394_3:GetComponent("SpriteRenderer")

				if var_394_4 and var_394_4.sprite then
					local var_394_5 = (var_394_3.transform.localPosition - var_394_1).z
					local var_394_6 = manager.ui.mainCameraCom_
					local var_394_7 = 2 * var_394_5 * Mathf.Tan(var_394_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_394_8 = var_394_7 * var_394_6.aspect
					local var_394_9 = var_394_4.sprite.bounds.size.x
					local var_394_10 = var_394_4.sprite.bounds.size.y
					local var_394_11 = var_394_8 / var_394_9
					local var_394_12 = var_394_7 / var_394_10
					local var_394_13 = var_394_12 < var_394_11 and var_394_11 or var_394_12

					var_394_3.transform.localScale = Vector3.New(var_394_13, var_394_13, 0)
				end

				for iter_394_0, iter_394_1 in pairs(arg_391_1.bgs_) do
					if iter_394_0 ~= "STblack" then
						iter_394_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_394_14 = 0

			if var_394_14 < arg_391_1.time_ and arg_391_1.time_ <= var_394_14 + arg_394_0 then
				arg_391_1.allBtn_.enabled = false
			end

			local var_394_15 = 0.3

			if arg_391_1.time_ >= var_394_14 + var_394_15 and arg_391_1.time_ < var_394_14 + var_394_15 + arg_394_0 then
				arg_391_1.allBtn_.enabled = true
			end

			local var_394_16 = 0

			if var_394_16 < arg_391_1.time_ and arg_391_1.time_ <= var_394_16 + arg_394_0 then
				arg_391_1.mask_.enabled = true
				arg_391_1.mask_.raycastTarget = true

				arg_391_1:SetGaussion(false)
			end

			local var_394_17 = 2

			if var_394_16 <= arg_391_1.time_ and arg_391_1.time_ < var_394_16 + var_394_17 then
				local var_394_18 = (arg_391_1.time_ - var_394_16) / var_394_17
				local var_394_19 = Color.New(0, 0, 0)

				var_394_19.a = Mathf.Lerp(1, 0, var_394_18)
				arg_391_1.mask_.color = var_394_19
			end

			if arg_391_1.time_ >= var_394_16 + var_394_17 and arg_391_1.time_ < var_394_16 + var_394_17 + arg_394_0 then
				local var_394_20 = Color.New(0, 0, 0)
				local var_394_21 = 0

				arg_391_1.mask_.enabled = false
				var_394_20.a = var_394_21
				arg_391_1.mask_.color = var_394_20
			end

			local var_394_22 = arg_391_1.actors_["1084ui_story"].transform
			local var_394_23 = 0

			if var_394_23 < arg_391_1.time_ and arg_391_1.time_ <= var_394_23 + arg_394_0 then
				arg_391_1.var_.moveOldPos1084ui_story = var_394_22.localPosition
			end

			local var_394_24 = 0.001

			if var_394_23 <= arg_391_1.time_ and arg_391_1.time_ < var_394_23 + var_394_24 then
				local var_394_25 = (arg_391_1.time_ - var_394_23) / var_394_24
				local var_394_26 = Vector3.New(0, 100, 0)

				var_394_22.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1084ui_story, var_394_26, var_394_25)

				local var_394_27 = manager.ui.mainCamera.transform.position - var_394_22.position

				var_394_22.forward = Vector3.New(var_394_27.x, var_394_27.y, var_394_27.z)

				local var_394_28 = var_394_22.localEulerAngles

				var_394_28.z = 0
				var_394_28.x = 0
				var_394_22.localEulerAngles = var_394_28
			end

			if arg_391_1.time_ >= var_394_23 + var_394_24 and arg_391_1.time_ < var_394_23 + var_394_24 + arg_394_0 then
				var_394_22.localPosition = Vector3.New(0, 100, 0)

				local var_394_29 = manager.ui.mainCamera.transform.position - var_394_22.position

				var_394_22.forward = Vector3.New(var_394_29.x, var_394_29.y, var_394_29.z)

				local var_394_30 = var_394_22.localEulerAngles

				var_394_30.z = 0
				var_394_30.x = 0
				var_394_22.localEulerAngles = var_394_30
			end

			local var_394_31 = arg_391_1.actors_["1084ui_story"]
			local var_394_32 = 0

			if var_394_32 < arg_391_1.time_ and arg_391_1.time_ <= var_394_32 + arg_394_0 and arg_391_1.var_.characterEffect1084ui_story == nil then
				arg_391_1.var_.characterEffect1084ui_story = var_394_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_33 = 0.200000002980232

			if var_394_32 <= arg_391_1.time_ and arg_391_1.time_ < var_394_32 + var_394_33 then
				local var_394_34 = (arg_391_1.time_ - var_394_32) / var_394_33

				if arg_391_1.var_.characterEffect1084ui_story then
					local var_394_35 = Mathf.Lerp(0, 0.5, var_394_34)

					arg_391_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_391_1.var_.characterEffect1084ui_story.fillRatio = var_394_35
				end
			end

			if arg_391_1.time_ >= var_394_32 + var_394_33 and arg_391_1.time_ < var_394_32 + var_394_33 + arg_394_0 and arg_391_1.var_.characterEffect1084ui_story then
				local var_394_36 = 0.5

				arg_391_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_391_1.var_.characterEffect1084ui_story.fillRatio = var_394_36
			end

			if arg_391_1.frameCnt_ <= 1 then
				arg_391_1.dialog_:SetActive(false)
			end

			local var_394_37 = 1.46666666666667
			local var_394_38 = 1.225

			if var_394_37 < arg_391_1.time_ and arg_391_1.time_ <= var_394_37 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0

				arg_391_1.dialog_:SetActive(true)

				local var_394_39 = LeanTween.value(arg_391_1.dialog_, 0, 1, 0.3)

				var_394_39:setOnUpdate(LuaHelper.FloatAction(function(arg_395_0)
					arg_391_1.dialogCg_.alpha = arg_395_0
				end))
				var_394_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_391_1.dialog_)
					var_394_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_391_1.duration_ = arg_391_1.duration_ + 0.3

				SetActive(arg_391_1.leftNameGo_, false)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_40 = arg_391_1:GetWordFromCfg(319891091)
				local var_394_41 = arg_391_1:FormatText(var_394_40.content)

				arg_391_1.text_.text = var_394_41

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_42 = 49
				local var_394_43 = utf8.len(var_394_41)
				local var_394_44 = var_394_42 <= 0 and var_394_38 or var_394_38 * (var_394_43 / var_394_42)

				if var_394_44 > 0 and var_394_38 < var_394_44 then
					arg_391_1.talkMaxDuration = var_394_44
					var_394_37 = var_394_37 + 0.3

					if var_394_44 + var_394_37 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_44 + var_394_37
					end
				end

				arg_391_1.text_.text = var_394_41
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_45 = var_394_37 + 0.3
			local var_394_46 = math.max(var_394_38, arg_391_1.talkMaxDuration)

			if var_394_45 <= arg_391_1.time_ and arg_391_1.time_ < var_394_45 + var_394_46 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_45) / var_394_46

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_45 + var_394_46 and arg_391_1.time_ < var_394_45 + var_394_46 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play319891092 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 319891092
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
			arg_397_1.auto_ = false
		end

		function arg_397_1.playNext_(arg_399_0)
			arg_397_1.onStoryFinished_()
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 1.15

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

				local var_400_2 = arg_397_1:GetWordFromCfg(319891092)
				local var_400_3 = arg_397_1:FormatText(var_400_2.content)

				arg_397_1.text_.text = var_400_3

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_4 = 46
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST15a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D02a"
	},
	voices = {
		"story_v_out_319891.awb"
	}
}
