return {
	Play910201001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 910201001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play910201002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST02"

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
				local var_4_5 = arg_1_1.bgs_.ST02

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
					if iter_4_0 ~= "ST02" then
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
				local var_4_24 = "stop"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.5
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")
			end

			local var_4_30 = 0
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "effect"

				arg_1_1:AudioAction(var_4_32, var_4_33, "se_story_birthday", "se_story_birthday_shaokaodian", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.5

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_37 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_38 = arg_1_1:GetWordFromCfg(910201001)
				local var_4_39 = arg_1_1:FormatText(var_4_38.content)

				arg_1_1.text_.text = var_4_39

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_40 = 20
				local var_4_41 = utf8.len(var_4_39)
				local var_4_42 = var_4_40 <= 0 and var_4_35 or var_4_35 * (var_4_41 / var_4_40)

				if var_4_42 > 0 and var_4_35 < var_4_42 then
					arg_1_1.talkMaxDuration = var_4_42
					var_4_34 = var_4_34 + 0.3

					if var_4_42 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_42 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_39
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_43 = var_4_34 + 0.3
			local var_4_44 = math.max(var_4_35, arg_1_1.talkMaxDuration)

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
	Play910201002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 910201002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play910201003(arg_7_1)
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

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[7].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(910201002)
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
	Play910201003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 910201003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play910201004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.75

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

				local var_14_2 = arg_11_1:GetWordFromCfg(910201003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 30
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
	Play910201004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 910201004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play910201005(arg_15_1)
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

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_18_16 = arg_15_1.actors_["1084ui_story"]
			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_18 = 0.2

			if var_18_17 <= arg_15_1.time_ and arg_15_1.time_ < var_18_17 + var_18_18 then
				local var_18_19 = (arg_15_1.time_ - var_18_17) / var_18_18

				if arg_15_1.var_.characterEffect1084ui_story then
					arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_17 + var_18_18 and arg_15_1.time_ < var_18_17 + var_18_18 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_18_20 = 0
			local var_18_21 = 0.3

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

				local var_18_23 = arg_15_1:GetWordFromCfg(910201004)
				local var_18_24 = arg_15_1:FormatText(var_18_23.content)

				arg_15_1.text_.text = var_18_24

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_25 = 12
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
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_28 = math.max(var_18_21, arg_15_1.talkMaxDuration)

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_28 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_20) / var_18_28

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_20 + var_18_28 and arg_15_1.time_ < var_18_20 + var_18_28 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play910201005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 910201005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play910201006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action432")
			end

			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_22_2 = 0
			local var_22_3 = 0.525

			if var_22_2 < arg_19_1.time_ and arg_19_1.time_ <= var_22_2 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_4 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_5 = arg_19_1:GetWordFromCfg(910201005)
				local var_22_6 = arg_19_1:FormatText(var_22_5.content)

				arg_19_1.text_.text = var_22_6

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_7 = 21
				local var_22_8 = utf8.len(var_22_6)
				local var_22_9 = var_22_7 <= 0 and var_22_3 or var_22_3 * (var_22_8 / var_22_7)

				if var_22_9 > 0 and var_22_3 < var_22_9 then
					arg_19_1.talkMaxDuration = var_22_9

					if var_22_9 + var_22_2 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_9 + var_22_2
					end
				end

				arg_19_1.text_.text = var_22_6
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_10 = math.max(var_22_3, arg_19_1.talkMaxDuration)

			if var_22_2 <= arg_19_1.time_ and arg_19_1.time_ < var_22_2 + var_22_10 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_2) / var_22_10

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_2 + var_22_10 and arg_19_1.time_ < var_22_2 + var_22_10 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play910201006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 910201006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play910201007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1084ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1084ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_2")
			end

			local var_26_7 = 0
			local var_26_8 = 0.55

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_9 = arg_23_1:FormatText(StoryNameCfg[331].name)

				arg_23_1.leftNameTxt_.text = var_26_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_10 = arg_23_1:GetWordFromCfg(910201006)
				local var_26_11 = arg_23_1:FormatText(var_26_10.content)

				arg_23_1.text_.text = var_26_11

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_12 = 22
				local var_26_13 = utf8.len(var_26_11)
				local var_26_14 = var_26_12 <= 0 and var_26_8 or var_26_8 * (var_26_13 / var_26_12)

				if var_26_14 > 0 and var_26_8 < var_26_14 then
					arg_23_1.talkMaxDuration = var_26_14

					if var_26_14 + var_26_7 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_7
					end
				end

				arg_23_1.text_.text = var_26_11
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_15 = math.max(var_26_8, arg_23_1.talkMaxDuration)

			if var_26_7 <= arg_23_1.time_ and arg_23_1.time_ < var_26_7 + var_26_15 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_7) / var_26_15

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_7 + var_26_15 and arg_23_1.time_ < var_26_7 + var_26_15 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play910201007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 910201007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play910201008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.2

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

				local var_30_3 = arg_27_1:GetWordFromCfg(910201007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 8
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
	Play910201008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 910201008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play910201009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.625

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

				local var_34_3 = arg_31_1:GetWordFromCfg(910201008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 25
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
	Play910201009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 910201009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play910201010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1084ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story == nil then
				arg_35_1.var_.characterEffect1084ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1084ui_story then
					arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story then
				arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_38_4 = 0

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_38_6 = 0
			local var_38_7 = 0.625

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[6].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(910201009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 25
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_7 or var_38_7 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_7 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_14 and arg_35_1.time_ < var_38_6 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play910201010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 910201010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play910201011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action486")
			end

			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_42_2 = 0
			local var_42_3 = 0.325

			if var_42_2 < arg_39_1.time_ and arg_39_1.time_ <= var_42_2 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_4 = arg_39_1:FormatText(StoryNameCfg[6].name)

				arg_39_1.leftNameTxt_.text = var_42_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_5 = arg_39_1:GetWordFromCfg(910201010)
				local var_42_6 = arg_39_1:FormatText(var_42_5.content)

				arg_39_1.text_.text = var_42_6

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_7 = 13
				local var_42_8 = utf8.len(var_42_6)
				local var_42_9 = var_42_7 <= 0 and var_42_3 or var_42_3 * (var_42_8 / var_42_7)

				if var_42_9 > 0 and var_42_3 < var_42_9 then
					arg_39_1.talkMaxDuration = var_42_9

					if var_42_9 + var_42_2 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_9 + var_42_2
					end
				end

				arg_39_1.text_.text = var_42_6
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_10 = math.max(var_42_3, arg_39_1.talkMaxDuration)

			if var_42_2 <= arg_39_1.time_ and arg_39_1.time_ < var_42_2 + var_42_10 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_2) / var_42_10

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_2 + var_42_10 and arg_39_1.time_ < var_42_2 + var_42_10 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play910201011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 910201011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play910201012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1084ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1084ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0
			local var_46_7 = 0.9

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_8 = arg_43_1:GetWordFromCfg(910201011)
				local var_46_9 = arg_43_1:FormatText(var_46_8.content)

				arg_43_1.text_.text = var_46_9

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_10 = 36
				local var_46_11 = utf8.len(var_46_9)
				local var_46_12 = var_46_10 <= 0 and var_46_7 or var_46_7 * (var_46_11 / var_46_10)

				if var_46_12 > 0 and var_46_7 < var_46_12 then
					arg_43_1.talkMaxDuration = var_46_12

					if var_46_12 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_9
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_13 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_13 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_13

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_13 and arg_43_1.time_ < var_46_6 + var_46_13 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play910201012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 910201012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play910201013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.35

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[331].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(910201012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 14
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
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_8 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_8 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_8

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_8 and arg_47_1.time_ < var_50_0 + var_50_8 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play910201013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 910201013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play910201014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.65

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

				local var_54_2 = arg_51_1:GetWordFromCfg(910201013)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 26
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
	Play910201014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 910201014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play910201015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.9

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_2 = arg_55_1:GetWordFromCfg(910201014)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 36
				local var_58_5 = utf8.len(var_58_3)
				local var_58_6 = var_58_4 <= 0 and var_58_1 or var_58_1 * (var_58_5 / var_58_4)

				if var_58_6 > 0 and var_58_1 < var_58_6 then
					arg_55_1.talkMaxDuration = var_58_6

					if var_58_6 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_6 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_3
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_7 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_7 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_7

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_7 and arg_55_1.time_ < var_58_0 + var_58_7 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play910201015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 910201015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play910201016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.225

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[36].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(910201015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 18
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
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_8 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_8 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_8

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_8 and arg_59_1.time_ < var_62_0 + var_62_8 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play910201016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 910201016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play910201017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.25

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[36].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(910201016)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 10
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
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_8 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_8 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_8

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_8 and arg_63_1.time_ < var_66_0 + var_66_8 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play910201017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 910201017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play910201018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1084ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story == nil then
				arg_67_1.var_.characterEffect1084ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1084ui_story then
					arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story then
				arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_70_4 = 0

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action463")
			end

			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_70_6 = 0
			local var_70_7 = 0.35

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[6].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(910201017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 14
				local var_70_12 = utf8.len(var_70_10)
				local var_70_13 = var_70_11 <= 0 and var_70_7 or var_70_7 * (var_70_12 / var_70_11)

				if var_70_13 > 0 and var_70_7 < var_70_13 then
					arg_67_1.talkMaxDuration = var_70_13

					if var_70_13 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_13 + var_70_6
					end
				end

				arg_67_1.text_.text = var_70_10
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_14 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_14 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_14

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_14 and arg_67_1.time_ < var_70_6 + var_70_14 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play910201018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 910201018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play910201019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1084ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story == nil then
				arg_71_1.var_.characterEffect1084ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.2

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
			local var_74_7 = 0.225

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_8 = arg_71_1:FormatText(StoryNameCfg[7].name)

				arg_71_1.leftNameTxt_.text = var_74_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_9 = arg_71_1:GetWordFromCfg(910201018)
				local var_74_10 = arg_71_1:FormatText(var_74_9.content)

				arg_71_1.text_.text = var_74_10

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_11 = 9
				local var_74_12 = utf8.len(var_74_10)
				local var_74_13 = var_74_11 <= 0 and var_74_7 or var_74_7 * (var_74_12 / var_74_11)

				if var_74_13 > 0 and var_74_7 < var_74_13 then
					arg_71_1.talkMaxDuration = var_74_13

					if var_74_13 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_13 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_10
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_14 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_14 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_14

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_14 and arg_71_1.time_ < var_74_6 + var_74_14 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play910201019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 910201019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play910201020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.325

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

				local var_78_3 = arg_75_1:GetWordFromCfg(910201019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 14
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
	Play910201020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 910201020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play910201021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1084ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1084ui_story then
					arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_82_4 = 0

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action436")
			end

			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_82_6 = 0
			local var_82_7 = 0.6

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(910201020)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 24
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
	Play910201021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 910201021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play910201022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action468")
			end

			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_86_2 = 0
			local var_86_3 = 0.625

			if var_86_2 < arg_83_1.time_ and arg_83_1.time_ <= var_86_2 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_4 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_5 = arg_83_1:GetWordFromCfg(910201021)
				local var_86_6 = arg_83_1:FormatText(var_86_5.content)

				arg_83_1.text_.text = var_86_6

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_7 = 25
				local var_86_8 = utf8.len(var_86_6)
				local var_86_9 = var_86_7 <= 0 and var_86_3 or var_86_3 * (var_86_8 / var_86_7)

				if var_86_9 > 0 and var_86_3 < var_86_9 then
					arg_83_1.talkMaxDuration = var_86_9

					if var_86_9 + var_86_2 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_9 + var_86_2
					end
				end

				arg_83_1.text_.text = var_86_6
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_3, arg_83_1.talkMaxDuration)

			if var_86_2 <= arg_83_1.time_ and arg_83_1.time_ < var_86_2 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_2) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_2 + var_86_10 and arg_83_1.time_ < var_86_2 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play910201022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 910201022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play910201023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1084ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story == nil then
				arg_87_1.var_.characterEffect1084ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.2

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

			local var_90_6 = 0
			local var_90_7 = 0.1

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

				local var_90_9 = arg_87_1:GetWordFromCfg(910201022)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 4
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
	Play910201023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 910201023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play910201024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1084ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story == nil then
				arg_91_1.var_.characterEffect1084ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1084ui_story then
					arg_91_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story then
				arg_91_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_94_4 = 0

			if var_94_4 < arg_91_1.time_ and arg_91_1.time_ <= var_94_4 + arg_94_0 then
				arg_91_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action483")
			end

			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_94_6 = 0
			local var_94_7 = 0.925

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_8 = arg_91_1:FormatText(StoryNameCfg[6].name)

				arg_91_1.leftNameTxt_.text = var_94_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_9 = arg_91_1:GetWordFromCfg(910201023)
				local var_94_10 = arg_91_1:FormatText(var_94_9.content)

				arg_91_1.text_.text = var_94_10

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_11 = 37
				local var_94_12 = utf8.len(var_94_10)
				local var_94_13 = var_94_11 <= 0 and var_94_7 or var_94_7 * (var_94_12 / var_94_11)

				if var_94_13 > 0 and var_94_7 < var_94_13 then
					arg_91_1.talkMaxDuration = var_94_13

					if var_94_13 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_13 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_10
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_14 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_14 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_14

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_14 and arg_91_1.time_ < var_94_6 + var_94_14 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play910201024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 910201024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play910201025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.525

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_2 = arg_95_1:GetWordFromCfg(910201024)
				local var_98_3 = arg_95_1:FormatText(var_98_2.content)

				arg_95_1.text_.text = var_98_3

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_4 = 21
				local var_98_5 = utf8.len(var_98_3)
				local var_98_6 = var_98_4 <= 0 and var_98_1 or var_98_1 * (var_98_5 / var_98_4)

				if var_98_6 > 0 and var_98_1 < var_98_6 then
					arg_95_1.talkMaxDuration = var_98_6

					if var_98_6 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_6 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_3
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_7 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_7 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_7

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_7 and arg_95_1.time_ < var_98_0 + var_98_7 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play910201025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 910201025
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play910201026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1084ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story == nil then
				arg_99_1.var_.characterEffect1084ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.2

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

			local var_102_6 = 0

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_102_7 = 0
			local var_102_8 = 0.925

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_9 = arg_99_1:FormatText(StoryNameCfg[7].name)

				arg_99_1.leftNameTxt_.text = var_102_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_10 = arg_99_1:GetWordFromCfg(910201025)
				local var_102_11 = arg_99_1:FormatText(var_102_10.content)

				arg_99_1.text_.text = var_102_11

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_12 = 37
				local var_102_13 = utf8.len(var_102_11)
				local var_102_14 = var_102_12 <= 0 and var_102_8 or var_102_8 * (var_102_13 / var_102_12)

				if var_102_14 > 0 and var_102_8 < var_102_14 then
					arg_99_1.talkMaxDuration = var_102_14

					if var_102_14 + var_102_7 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_14 + var_102_7
					end
				end

				arg_99_1.text_.text = var_102_11
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_15 = math.max(var_102_8, arg_99_1.talkMaxDuration)

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_15 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_7) / var_102_15

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_7 + var_102_15 and arg_99_1.time_ < var_102_7 + var_102_15 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play910201026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 910201026
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play910201027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1084ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story == nil then
				arg_103_1.var_.characterEffect1084ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1084ui_story then
					arg_103_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story then
				arg_103_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_106_4 = 0

			if var_106_4 < arg_103_1.time_ and arg_103_1.time_ <= var_106_4 + arg_106_0 then
				arg_103_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_106_6 = 0
			local var_106_7 = 0.75

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[6].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(910201026)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 30
				local var_106_12 = utf8.len(var_106_10)
				local var_106_13 = var_106_11 <= 0 and var_106_7 or var_106_7 * (var_106_12 / var_106_11)

				if var_106_13 > 0 and var_106_7 < var_106_13 then
					arg_103_1.talkMaxDuration = var_106_13

					if var_106_13 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_13 + var_106_6
					end
				end

				arg_103_1.text_.text = var_106_10
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_14 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_14 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_14

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_14 and arg_103_1.time_ < var_106_6 + var_106_14 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play910201027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 910201027
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play910201028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action478")
			end

			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_110_2 = 0
			local var_110_3 = 0.675

			if var_110_2 < arg_107_1.time_ and arg_107_1.time_ <= var_110_2 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_4 = arg_107_1:FormatText(StoryNameCfg[6].name)

				arg_107_1.leftNameTxt_.text = var_110_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_5 = arg_107_1:GetWordFromCfg(910201027)
				local var_110_6 = arg_107_1:FormatText(var_110_5.content)

				arg_107_1.text_.text = var_110_6

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_7 = 27
				local var_110_8 = utf8.len(var_110_6)
				local var_110_9 = var_110_7 <= 0 and var_110_3 or var_110_3 * (var_110_8 / var_110_7)

				if var_110_9 > 0 and var_110_3 < var_110_9 then
					arg_107_1.talkMaxDuration = var_110_9

					if var_110_9 + var_110_2 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_9 + var_110_2
					end
				end

				arg_107_1.text_.text = var_110_6
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_10 = math.max(var_110_3, arg_107_1.talkMaxDuration)

			if var_110_2 <= arg_107_1.time_ and arg_107_1.time_ < var_110_2 + var_110_10 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_2) / var_110_10

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_2 + var_110_10 and arg_107_1.time_ < var_110_2 + var_110_10 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play910201028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 910201028
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play910201029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_114_1 = 0
			local var_114_2 = 0.775

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_3 = arg_111_1:FormatText(StoryNameCfg[6].name)

				arg_111_1.leftNameTxt_.text = var_114_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_4 = arg_111_1:GetWordFromCfg(910201028)
				local var_114_5 = arg_111_1:FormatText(var_114_4.content)

				arg_111_1.text_.text = var_114_5

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_6 = 31
				local var_114_7 = utf8.len(var_114_5)
				local var_114_8 = var_114_6 <= 0 and var_114_2 or var_114_2 * (var_114_7 / var_114_6)

				if var_114_8 > 0 and var_114_2 < var_114_8 then
					arg_111_1.talkMaxDuration = var_114_8

					if var_114_8 + var_114_1 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_1
					end
				end

				arg_111_1.text_.text = var_114_5
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_9 = math.max(var_114_2, arg_111_1.talkMaxDuration)

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_9 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_1) / var_114_9

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_1 + var_114_9 and arg_111_1.time_ < var_114_1 + var_114_9 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play910201029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 910201029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play910201030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action483")
			end

			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_118_2 = 0
			local var_118_3 = 0.725

			if var_118_2 < arg_115_1.time_ and arg_115_1.time_ <= var_118_2 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_4 = arg_115_1:FormatText(StoryNameCfg[6].name)

				arg_115_1.leftNameTxt_.text = var_118_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_5 = arg_115_1:GetWordFromCfg(910201029)
				local var_118_6 = arg_115_1:FormatText(var_118_5.content)

				arg_115_1.text_.text = var_118_6

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_7 = 29
				local var_118_8 = utf8.len(var_118_6)
				local var_118_9 = var_118_7 <= 0 and var_118_3 or var_118_3 * (var_118_8 / var_118_7)

				if var_118_9 > 0 and var_118_3 < var_118_9 then
					arg_115_1.talkMaxDuration = var_118_9

					if var_118_9 + var_118_2 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_9 + var_118_2
					end
				end

				arg_115_1.text_.text = var_118_6
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_10 = math.max(var_118_3, arg_115_1.talkMaxDuration)

			if var_118_2 <= arg_115_1.time_ and arg_115_1.time_ < var_118_2 + var_118_10 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_2) / var_118_10

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_2 + var_118_10 and arg_115_1.time_ < var_118_2 + var_118_10 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play910201030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 910201030
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play910201031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_122_2 = 0
			local var_122_3 = 0.575

			if var_122_2 < arg_119_1.time_ and arg_119_1.time_ <= var_122_2 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_4 = arg_119_1:FormatText(StoryNameCfg[6].name)

				arg_119_1.leftNameTxt_.text = var_122_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_5 = arg_119_1:GetWordFromCfg(910201030)
				local var_122_6 = arg_119_1:FormatText(var_122_5.content)

				arg_119_1.text_.text = var_122_6

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_7 = 23
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
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_10 = math.max(var_122_3, arg_119_1.talkMaxDuration)

			if var_122_2 <= arg_119_1.time_ and arg_119_1.time_ < var_122_2 + var_122_10 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_2) / var_122_10

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_2 + var_122_10 and arg_119_1.time_ < var_122_2 + var_122_10 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play910201031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 910201031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play910201032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1084ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story == nil then
				arg_123_1.var_.characterEffect1084ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1084ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1084ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1084ui_story.fillRatio = var_126_5
			end

			local var_126_6 = 0
			local var_126_7 = 0.575

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_8 = arg_123_1:FormatText(StoryNameCfg[7].name)

				arg_123_1.leftNameTxt_.text = var_126_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_9 = arg_123_1:GetWordFromCfg(910201031)
				local var_126_10 = arg_123_1:FormatText(var_126_9.content)

				arg_123_1.text_.text = var_126_10

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_11 = 23
				local var_126_12 = utf8.len(var_126_10)
				local var_126_13 = var_126_11 <= 0 and var_126_7 or var_126_7 * (var_126_12 / var_126_11)

				if var_126_13 > 0 and var_126_7 < var_126_13 then
					arg_123_1.talkMaxDuration = var_126_13

					if var_126_13 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_13 + var_126_6
					end
				end

				arg_123_1.text_.text = var_126_10
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_14 = math.max(var_126_7, arg_123_1.talkMaxDuration)

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_14 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_6) / var_126_14

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_6 + var_126_14 and arg_123_1.time_ < var_126_6 + var_126_14 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play910201032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 910201032
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play910201033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.825

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[7].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(910201032)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 33
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
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_8 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_8 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_8

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_8 and arg_127_1.time_ < var_130_0 + var_130_8 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play910201033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 910201033
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play910201034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1084ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1084ui_story == nil then
				arg_131_1.var_.characterEffect1084ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.2

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1084ui_story then
					arg_131_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1084ui_story then
				arg_131_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_134_4 = 0

			if var_134_4 < arg_131_1.time_ and arg_131_1.time_ <= var_134_4 + arg_134_0 then
				arg_131_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_134_6 = 0
			local var_134_7 = 0.15

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_8 = arg_131_1:FormatText(StoryNameCfg[6].name)

				arg_131_1.leftNameTxt_.text = var_134_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_9 = arg_131_1:GetWordFromCfg(910201033)
				local var_134_10 = arg_131_1:FormatText(var_134_9.content)

				arg_131_1.text_.text = var_134_10

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_11 = 6
				local var_134_12 = utf8.len(var_134_10)
				local var_134_13 = var_134_11 <= 0 and var_134_7 or var_134_7 * (var_134_12 / var_134_11)

				if var_134_13 > 0 and var_134_7 < var_134_13 then
					arg_131_1.talkMaxDuration = var_134_13

					if var_134_13 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_13 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_10
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_14 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_14 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_14

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_14 and arg_131_1.time_ < var_134_6 + var_134_14 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play910201034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 910201034
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play910201035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1084ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story == nil then
				arg_135_1.var_.characterEffect1084ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.2

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1084ui_story then
					local var_138_4 = Mathf.Lerp(0, 0.5, var_138_3)

					arg_135_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1084ui_story.fillRatio = var_138_4
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story then
				local var_138_5 = 0.5

				arg_135_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1084ui_story.fillRatio = var_138_5
			end

			local var_138_6 = 0
			local var_138_7 = 1.025

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_8 = arg_135_1:FormatText(StoryNameCfg[7].name)

				arg_135_1.leftNameTxt_.text = var_138_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_9 = arg_135_1:GetWordFromCfg(910201034)
				local var_138_10 = arg_135_1:FormatText(var_138_9.content)

				arg_135_1.text_.text = var_138_10

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_11 = 41
				local var_138_12 = utf8.len(var_138_10)
				local var_138_13 = var_138_11 <= 0 and var_138_7 or var_138_7 * (var_138_12 / var_138_11)

				if var_138_13 > 0 and var_138_7 < var_138_13 then
					arg_135_1.talkMaxDuration = var_138_13

					if var_138_13 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_13 + var_138_6
					end
				end

				arg_135_1.text_.text = var_138_10
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_14 = math.max(var_138_7, arg_135_1.talkMaxDuration)

			if var_138_6 <= arg_135_1.time_ and arg_135_1.time_ < var_138_6 + var_138_14 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_6) / var_138_14

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_6 + var_138_14 and arg_135_1.time_ < var_138_6 + var_138_14 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play910201035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 910201035
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play910201036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1084ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1084ui_story == nil then
				arg_139_1.var_.characterEffect1084ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.2

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1084ui_story then
					arg_139_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1084ui_story then
				arg_139_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_142_4 = 0

			if var_142_4 < arg_139_1.time_ and arg_139_1.time_ <= var_142_4 + arg_142_0 then
				arg_139_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action435")
			end

			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 then
				arg_139_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_142_6 = 0
			local var_142_7 = 0.45

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_8 = arg_139_1:FormatText(StoryNameCfg[6].name)

				arg_139_1.leftNameTxt_.text = var_142_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_9 = arg_139_1:GetWordFromCfg(910201035)
				local var_142_10 = arg_139_1:FormatText(var_142_9.content)

				arg_139_1.text_.text = var_142_10

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_11 = 18
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
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_14 = math.max(var_142_7, arg_139_1.talkMaxDuration)

			if var_142_6 <= arg_139_1.time_ and arg_139_1.time_ < var_142_6 + var_142_14 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_6) / var_142_14

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_6 + var_142_14 and arg_139_1.time_ < var_142_6 + var_142_14 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play910201036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 910201036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play910201037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1084ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1084ui_story == nil then
				arg_143_1.var_.characterEffect1084ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.2

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1084ui_story then
					local var_146_4 = Mathf.Lerp(0, 0.5, var_146_3)

					arg_143_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1084ui_story.fillRatio = var_146_4
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1084ui_story then
				local var_146_5 = 0.5

				arg_143_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1084ui_story.fillRatio = var_146_5
			end

			local var_146_6 = 0
			local var_146_7 = 0.225

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_8 = arg_143_1:FormatText(StoryNameCfg[7].name)

				arg_143_1.leftNameTxt_.text = var_146_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_9 = arg_143_1:GetWordFromCfg(910201036)
				local var_146_10 = arg_143_1:FormatText(var_146_9.content)

				arg_143_1.text_.text = var_146_10

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_11 = 9
				local var_146_12 = utf8.len(var_146_10)
				local var_146_13 = var_146_11 <= 0 and var_146_7 or var_146_7 * (var_146_12 / var_146_11)

				if var_146_13 > 0 and var_146_7 < var_146_13 then
					arg_143_1.talkMaxDuration = var_146_13

					if var_146_13 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_13 + var_146_6
					end
				end

				arg_143_1.text_.text = var_146_10
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_14 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_14 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_14

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_14 and arg_143_1.time_ < var_146_6 + var_146_14 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play910201037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 910201037
		arg_147_1.duration_ = 9

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play910201038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = "STblack"

			if arg_147_1.bgs_[var_150_0] == nil then
				local var_150_1 = Object.Instantiate(arg_147_1.paintGo_)

				var_150_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_150_0)
				var_150_1.name = var_150_0
				var_150_1.transform.parent = arg_147_1.stage_.transform
				var_150_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_147_1.bgs_[var_150_0] = var_150_1
			end

			local var_150_2 = 2

			if var_150_2 < arg_147_1.time_ and arg_147_1.time_ <= var_150_2 + arg_150_0 then
				local var_150_3 = manager.ui.mainCamera.transform.localPosition
				local var_150_4 = Vector3.New(0, 0, 10) + Vector3.New(var_150_3.x, var_150_3.y, 0)
				local var_150_5 = arg_147_1.bgs_.STblack

				var_150_5.transform.localPosition = var_150_4
				var_150_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_150_6 = var_150_5:GetComponent("SpriteRenderer")

				if var_150_6 and var_150_6.sprite then
					local var_150_7 = (var_150_5.transform.localPosition - var_150_3).z
					local var_150_8 = manager.ui.mainCameraCom_
					local var_150_9 = 2 * var_150_7 * Mathf.Tan(var_150_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_150_10 = var_150_9 * var_150_8.aspect
					local var_150_11 = var_150_6.sprite.bounds.size.x
					local var_150_12 = var_150_6.sprite.bounds.size.y
					local var_150_13 = var_150_10 / var_150_11
					local var_150_14 = var_150_9 / var_150_12
					local var_150_15 = var_150_14 < var_150_13 and var_150_13 or var_150_14

					var_150_5.transform.localScale = Vector3.New(var_150_15, var_150_15, 0)
				end

				for iter_150_0, iter_150_1 in pairs(arg_147_1.bgs_) do
					if iter_150_0 ~= "STblack" then
						iter_150_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_150_16 = 0

			if var_150_16 < arg_147_1.time_ and arg_147_1.time_ <= var_150_16 + arg_150_0 then
				arg_147_1.mask_.enabled = true
				arg_147_1.mask_.raycastTarget = true

				arg_147_1:SetGaussion(false)
			end

			local var_150_17 = 2

			if var_150_16 <= arg_147_1.time_ and arg_147_1.time_ < var_150_16 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_16) / var_150_17
				local var_150_19 = Color.New(0, 0, 0)

				var_150_19.a = Mathf.Lerp(0, 1, var_150_18)
				arg_147_1.mask_.color = var_150_19
			end

			if arg_147_1.time_ >= var_150_16 + var_150_17 and arg_147_1.time_ < var_150_16 + var_150_17 + arg_150_0 then
				local var_150_20 = Color.New(0, 0, 0)

				var_150_20.a = 1
				arg_147_1.mask_.color = var_150_20
			end

			local var_150_21 = 2

			if var_150_21 < arg_147_1.time_ and arg_147_1.time_ <= var_150_21 + arg_150_0 then
				arg_147_1.mask_.enabled = true
				arg_147_1.mask_.raycastTarget = true

				arg_147_1:SetGaussion(false)
			end

			local var_150_22 = 2

			if var_150_21 <= arg_147_1.time_ and arg_147_1.time_ < var_150_21 + var_150_22 then
				local var_150_23 = (arg_147_1.time_ - var_150_21) / var_150_22
				local var_150_24 = Color.New(0, 0, 0)

				var_150_24.a = Mathf.Lerp(1, 0, var_150_23)
				arg_147_1.mask_.color = var_150_24
			end

			if arg_147_1.time_ >= var_150_21 + var_150_22 and arg_147_1.time_ < var_150_21 + var_150_22 + arg_150_0 then
				local var_150_25 = Color.New(0, 0, 0)
				local var_150_26 = 0

				arg_147_1.mask_.enabled = false
				var_150_25.a = var_150_26
				arg_147_1.mask_.color = var_150_25
			end

			local var_150_27 = arg_147_1.actors_["1084ui_story"].transform
			local var_150_28 = 1.966

			if var_150_28 < arg_147_1.time_ and arg_147_1.time_ <= var_150_28 + arg_150_0 then
				arg_147_1.var_.moveOldPos1084ui_story = var_150_27.localPosition
			end

			local var_150_29 = 0.001

			if var_150_28 <= arg_147_1.time_ and arg_147_1.time_ < var_150_28 + var_150_29 then
				local var_150_30 = (arg_147_1.time_ - var_150_28) / var_150_29
				local var_150_31 = Vector3.New(0, 100, 0)

				var_150_27.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1084ui_story, var_150_31, var_150_30)

				local var_150_32 = manager.ui.mainCamera.transform.position - var_150_27.position

				var_150_27.forward = Vector3.New(var_150_32.x, var_150_32.y, var_150_32.z)

				local var_150_33 = var_150_27.localEulerAngles

				var_150_33.z = 0
				var_150_33.x = 0
				var_150_27.localEulerAngles = var_150_33
			end

			if arg_147_1.time_ >= var_150_28 + var_150_29 and arg_147_1.time_ < var_150_28 + var_150_29 + arg_150_0 then
				var_150_27.localPosition = Vector3.New(0, 100, 0)

				local var_150_34 = manager.ui.mainCamera.transform.position - var_150_27.position

				var_150_27.forward = Vector3.New(var_150_34.x, var_150_34.y, var_150_34.z)

				local var_150_35 = var_150_27.localEulerAngles

				var_150_35.z = 0
				var_150_35.x = 0
				var_150_27.localEulerAngles = var_150_35
			end

			local var_150_36 = 0
			local var_150_37 = 1

			if var_150_36 < arg_147_1.time_ and arg_147_1.time_ <= var_150_36 + arg_150_0 then
				local var_150_38 = "stop"
				local var_150_39 = "effect"

				arg_147_1:AudioAction(var_150_38, var_150_39, "se_story_birthday", "se_story_birthday_shaokaodian", "")
			end

			if arg_147_1.frameCnt_ <= 1 then
				arg_147_1.dialog_:SetActive(false)
			end

			local var_150_40 = 4
			local var_150_41 = 0.55

			if var_150_40 < arg_147_1.time_ and arg_147_1.time_ <= var_150_40 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0

				arg_147_1.dialog_:SetActive(true)

				local var_150_42 = LeanTween.value(arg_147_1.dialog_, 0, 1, 0.3)

				var_150_42:setOnUpdate(LuaHelper.FloatAction(function(arg_151_0)
					arg_147_1.dialogCg_.alpha = arg_151_0
				end))
				var_150_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_147_1.dialog_)
					var_150_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_147_1.duration_ = arg_147_1.duration_ + 0.3

				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_43 = arg_147_1:FormatText(StoryNameCfg[36].name)

				arg_147_1.leftNameTxt_.text = var_150_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_44 = arg_147_1:GetWordFromCfg(910201037)
				local var_150_45 = arg_147_1:FormatText(var_150_44.content)

				arg_147_1.text_.text = var_150_45

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_46 = 22
				local var_150_47 = utf8.len(var_150_45)
				local var_150_48 = var_150_46 <= 0 and var_150_41 or var_150_41 * (var_150_47 / var_150_46)

				if var_150_48 > 0 and var_150_41 < var_150_48 then
					arg_147_1.talkMaxDuration = var_150_48
					var_150_40 = var_150_40 + 0.3

					if var_150_48 + var_150_40 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_48 + var_150_40
					end
				end

				arg_147_1.text_.text = var_150_45
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_49 = var_150_40 + 0.3
			local var_150_50 = math.max(var_150_41, arg_147_1.talkMaxDuration)

			if var_150_49 <= arg_147_1.time_ and arg_147_1.time_ < var_150_49 + var_150_50 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_49) / var_150_50

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_49 + var_150_50 and arg_147_1.time_ < var_150_49 + var_150_50 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play910201038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 910201038
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play910201039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.475

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[36].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(910201038)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 19
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
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_8 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_8 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_8

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_8 and arg_153_1.time_ < var_156_0 + var_156_8 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play910201039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 910201039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play910201040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.15

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[36].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(910201039)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 6
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
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_8 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_8 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_8

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_8 and arg_157_1.time_ < var_160_0 + var_160_8 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play910201040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 910201040
		arg_161_1.duration_ = 9

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play910201041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = "A00"

			if arg_161_1.bgs_[var_164_0] == nil then
				local var_164_1 = Object.Instantiate(arg_161_1.paintGo_)

				var_164_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_164_0)
				var_164_1.name = var_164_0
				var_164_1.transform.parent = arg_161_1.stage_.transform
				var_164_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_161_1.bgs_[var_164_0] = var_164_1
			end

			local var_164_2 = 2

			if var_164_2 < arg_161_1.time_ and arg_161_1.time_ <= var_164_2 + arg_164_0 then
				local var_164_3 = manager.ui.mainCamera.transform.localPosition
				local var_164_4 = Vector3.New(0, 0, 10) + Vector3.New(var_164_3.x, var_164_3.y, 0)
				local var_164_5 = arg_161_1.bgs_.A00

				var_164_5.transform.localPosition = var_164_4
				var_164_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_164_6 = var_164_5:GetComponent("SpriteRenderer")

				if var_164_6 and var_164_6.sprite then
					local var_164_7 = (var_164_5.transform.localPosition - var_164_3).z
					local var_164_8 = manager.ui.mainCameraCom_
					local var_164_9 = 2 * var_164_7 * Mathf.Tan(var_164_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_164_10 = var_164_9 * var_164_8.aspect
					local var_164_11 = var_164_6.sprite.bounds.size.x
					local var_164_12 = var_164_6.sprite.bounds.size.y
					local var_164_13 = var_164_10 / var_164_11
					local var_164_14 = var_164_9 / var_164_12
					local var_164_15 = var_164_14 < var_164_13 and var_164_13 or var_164_14

					var_164_5.transform.localScale = Vector3.New(var_164_15, var_164_15, 0)
				end

				for iter_164_0, iter_164_1 in pairs(arg_161_1.bgs_) do
					if iter_164_0 ~= "A00" then
						iter_164_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_164_16 = 0

			if var_164_16 < arg_161_1.time_ and arg_161_1.time_ <= var_164_16 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_17 = 2

			if var_164_16 <= arg_161_1.time_ and arg_161_1.time_ < var_164_16 + var_164_17 then
				local var_164_18 = (arg_161_1.time_ - var_164_16) / var_164_17
				local var_164_19 = Color.New(0, 0, 0)

				var_164_19.a = Mathf.Lerp(0, 1, var_164_18)
				arg_161_1.mask_.color = var_164_19
			end

			if arg_161_1.time_ >= var_164_16 + var_164_17 and arg_161_1.time_ < var_164_16 + var_164_17 + arg_164_0 then
				local var_164_20 = Color.New(0, 0, 0)

				var_164_20.a = 1
				arg_161_1.mask_.color = var_164_20
			end

			local var_164_21 = 2

			if var_164_21 < arg_161_1.time_ and arg_161_1.time_ <= var_164_21 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_22 = 2

			if var_164_21 <= arg_161_1.time_ and arg_161_1.time_ < var_164_21 + var_164_22 then
				local var_164_23 = (arg_161_1.time_ - var_164_21) / var_164_22
				local var_164_24 = Color.New(0, 0, 0)

				var_164_24.a = Mathf.Lerp(1, 0, var_164_23)
				arg_161_1.mask_.color = var_164_24
			end

			if arg_161_1.time_ >= var_164_21 + var_164_22 and arg_161_1.time_ < var_164_21 + var_164_22 + arg_164_0 then
				local var_164_25 = Color.New(0, 0, 0)
				local var_164_26 = 0

				arg_161_1.mask_.enabled = false
				var_164_25.a = var_164_26
				arg_161_1.mask_.color = var_164_25
			end

			local var_164_27 = "1019ui_story"

			if arg_161_1.actors_[var_164_27] == nil then
				local var_164_28 = Object.Instantiate(Asset.Load("Char/" .. var_164_27), arg_161_1.stage_.transform)

				var_164_28.name = var_164_27
				var_164_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_161_1.actors_[var_164_27] = var_164_28

				local var_164_29 = var_164_28:GetComponentInChildren(typeof(CharacterEffect))

				var_164_29.enabled = true

				local var_164_30 = GameObjectTools.GetOrAddComponent(var_164_28, typeof(DynamicBoneHelper))

				if var_164_30 then
					var_164_30:EnableDynamicBone(false)
				end

				arg_161_1:ShowWeapon(var_164_29.transform, false)

				arg_161_1.var_[var_164_27 .. "Animator"] = var_164_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_161_1.var_[var_164_27 .. "Animator"].applyRootMotion = true
				arg_161_1.var_[var_164_27 .. "LipSync"] = var_164_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_164_31 = arg_161_1.actors_["1019ui_story"].transform
			local var_164_32 = 3.8

			if var_164_32 < arg_161_1.time_ and arg_161_1.time_ <= var_164_32 + arg_164_0 then
				arg_161_1.var_.moveOldPos1019ui_story = var_164_31.localPosition
			end

			local var_164_33 = 0.001

			if var_164_32 <= arg_161_1.time_ and arg_161_1.time_ < var_164_32 + var_164_33 then
				local var_164_34 = (arg_161_1.time_ - var_164_32) / var_164_33
				local var_164_35 = Vector3.New(0, -1.08, -5.9)

				var_164_31.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1019ui_story, var_164_35, var_164_34)

				local var_164_36 = manager.ui.mainCamera.transform.position - var_164_31.position

				var_164_31.forward = Vector3.New(var_164_36.x, var_164_36.y, var_164_36.z)

				local var_164_37 = var_164_31.localEulerAngles

				var_164_37.z = 0
				var_164_37.x = 0
				var_164_31.localEulerAngles = var_164_37
			end

			if arg_161_1.time_ >= var_164_32 + var_164_33 and arg_161_1.time_ < var_164_32 + var_164_33 + arg_164_0 then
				var_164_31.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_164_38 = manager.ui.mainCamera.transform.position - var_164_31.position

				var_164_31.forward = Vector3.New(var_164_38.x, var_164_38.y, var_164_38.z)

				local var_164_39 = var_164_31.localEulerAngles

				var_164_39.z = 0
				var_164_39.x = 0
				var_164_31.localEulerAngles = var_164_39
			end

			local var_164_40 = arg_161_1.actors_["1019ui_story"]
			local var_164_41 = 3.8

			if var_164_41 < arg_161_1.time_ and arg_161_1.time_ <= var_164_41 + arg_164_0 and arg_161_1.var_.characterEffect1019ui_story == nil then
				arg_161_1.var_.characterEffect1019ui_story = var_164_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_42 = 0.2

			if var_164_41 <= arg_161_1.time_ and arg_161_1.time_ < var_164_41 + var_164_42 then
				local var_164_43 = (arg_161_1.time_ - var_164_41) / var_164_42

				if arg_161_1.var_.characterEffect1019ui_story then
					arg_161_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_41 + var_164_42 and arg_161_1.time_ < var_164_41 + var_164_42 + arg_164_0 and arg_161_1.var_.characterEffect1019ui_story then
				arg_161_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_164_44 = 3.8

			if var_164_44 < arg_161_1.time_ and arg_161_1.time_ <= var_164_44 + arg_164_0 then
				arg_161_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_164_45 = 3.8

			if var_164_45 < arg_161_1.time_ and arg_161_1.time_ <= var_164_45 + arg_164_0 then
				arg_161_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_164_46 = 0
			local var_164_47 = 1

			if var_164_46 < arg_161_1.time_ and arg_161_1.time_ <= var_164_46 + arg_164_0 then
				local var_164_48 = "play"
				local var_164_49 = "music"

				arg_161_1:AudioAction(var_164_48, var_164_49, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_164_50 = 3.8
			local var_164_51 = 1

			if var_164_50 < arg_161_1.time_ and arg_161_1.time_ <= var_164_50 + arg_164_0 then
				local var_164_52 = "play"
				local var_164_53 = "music"

				arg_161_1:AudioAction(var_164_52, var_164_53, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_164_54 = 4
			local var_164_55 = 0.9

			if var_164_54 < arg_161_1.time_ and arg_161_1.time_ <= var_164_54 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_56 = arg_161_1:FormatText(StoryNameCfg[13].name)

				arg_161_1.leftNameTxt_.text = var_164_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_57 = arg_161_1:GetWordFromCfg(910201040)
				local var_164_58 = arg_161_1:FormatText(var_164_57.content)

				arg_161_1.text_.text = var_164_58

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_59 = 36
				local var_164_60 = utf8.len(var_164_58)
				local var_164_61 = var_164_59 <= 0 and var_164_55 or var_164_55 * (var_164_60 / var_164_59)

				if var_164_61 > 0 and var_164_55 < var_164_61 then
					arg_161_1.talkMaxDuration = var_164_61

					if var_164_61 + var_164_54 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_61 + var_164_54
					end
				end

				arg_161_1.text_.text = var_164_58
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_62 = math.max(var_164_55, arg_161_1.talkMaxDuration)

			if var_164_54 <= arg_161_1.time_ and arg_161_1.time_ < var_164_54 + var_164_62 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_54) / var_164_62

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_54 + var_164_62 and arg_161_1.time_ < var_164_54 + var_164_62 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play910201041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 910201041
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play910201042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action465")
			end

			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_168_2 = 0
			local var_168_3 = 0.825

			if var_168_2 < arg_165_1.time_ and arg_165_1.time_ <= var_168_2 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_4 = arg_165_1:FormatText(StoryNameCfg[13].name)

				arg_165_1.leftNameTxt_.text = var_168_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_5 = arg_165_1:GetWordFromCfg(910201041)
				local var_168_6 = arg_165_1:FormatText(var_168_5.content)

				arg_165_1.text_.text = var_168_6

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_7 = 33
				local var_168_8 = utf8.len(var_168_6)
				local var_168_9 = var_168_7 <= 0 and var_168_3 or var_168_3 * (var_168_8 / var_168_7)

				if var_168_9 > 0 and var_168_3 < var_168_9 then
					arg_165_1.talkMaxDuration = var_168_9

					if var_168_9 + var_168_2 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_9 + var_168_2
					end
				end

				arg_165_1.text_.text = var_168_6
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_10 = math.max(var_168_3, arg_165_1.talkMaxDuration)

			if var_168_2 <= arg_165_1.time_ and arg_165_1.time_ < var_168_2 + var_168_10 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_2) / var_168_10

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_2 + var_168_10 and arg_165_1.time_ < var_168_2 + var_168_10 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play910201042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 910201042
		arg_169_1.duration_ = 0.199999999999

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"

			SetActive(arg_169_1.choicesGo_, true)

			for iter_170_0, iter_170_1 in ipairs(arg_169_1.choices_) do
				local var_170_0 = iter_170_0 <= 1

				SetActive(iter_170_1.go, var_170_0)
			end

			arg_169_1.choices_[1].txt.text = arg_169_1:FormatText(StoryChoiceCfg[247].name)
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play910201043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1019ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect1019ui_story == nil then
				arg_169_1.var_.characterEffect1019ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.2

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect1019ui_story then
					local var_172_4 = Mathf.Lerp(0, 0.5, var_172_3)

					arg_169_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1019ui_story.fillRatio = var_172_4
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect1019ui_story then
				local var_172_5 = 0.5

				arg_169_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1019ui_story.fillRatio = var_172_5
			end
		end
	end,
	Play910201043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 910201043
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play910201044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1019ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect1019ui_story == nil then
				arg_173_1.var_.characterEffect1019ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect1019ui_story then
					arg_173_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect1019ui_story then
				arg_173_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_176_4 = 0

			if var_176_4 < arg_173_1.time_ and arg_173_1.time_ <= var_176_4 + arg_176_0 then
				arg_173_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_176_5 = 0

			if var_176_5 < arg_173_1.time_ and arg_173_1.time_ <= var_176_5 + arg_176_0 then
				arg_173_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_176_6 = 0
			local var_176_7 = 0.575

			if var_176_6 < arg_173_1.time_ and arg_173_1.time_ <= var_176_6 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_8 = arg_173_1:FormatText(StoryNameCfg[13].name)

				arg_173_1.leftNameTxt_.text = var_176_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_9 = arg_173_1:GetWordFromCfg(910201043)
				local var_176_10 = arg_173_1:FormatText(var_176_9.content)

				arg_173_1.text_.text = var_176_10

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_11 = 23
				local var_176_12 = utf8.len(var_176_10)
				local var_176_13 = var_176_11 <= 0 and var_176_7 or var_176_7 * (var_176_12 / var_176_11)

				if var_176_13 > 0 and var_176_7 < var_176_13 then
					arg_173_1.talkMaxDuration = var_176_13

					if var_176_13 + var_176_6 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_13 + var_176_6
					end
				end

				arg_173_1.text_.text = var_176_10
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_14 = math.max(var_176_7, arg_173_1.talkMaxDuration)

			if var_176_6 <= arg_173_1.time_ and arg_173_1.time_ < var_176_6 + var_176_14 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_6) / var_176_14

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_6 + var_176_14 and arg_173_1.time_ < var_176_6 + var_176_14 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play910201044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 910201044
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play910201045(arg_177_1)
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
			local var_180_7 = 0.15

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

				local var_180_9 = arg_177_1:GetWordFromCfg(910201044)
				local var_180_10 = arg_177_1:FormatText(var_180_9.content)

				arg_177_1.text_.text = var_180_10

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_11 = 6
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
	Play910201045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 910201045
		arg_181_1.duration_ = 4.999999999999

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

			arg_181_1.choices_[1].txt.text = arg_181_1:FormatText(StoryChoiceCfg[248].name)
			arg_181_1.choices_[2].txt.text = arg_181_1:FormatText(StoryChoiceCfg[249].name)
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play910201046(arg_181_1)
			end

			if arg_183_0 == 2 then
				arg_181_0:Play910201046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 4.96666666666667
			local var_184_1 = 0.0333333333333333

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

				local var_184_3 = arg_181_1:GetWordFromCfg(100012006)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 0
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
	Play910201046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 910201046
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play910201047(arg_185_1)
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
				arg_185_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action467")
			end

			local var_188_5 = 0
			local var_188_6 = 0.75

			if var_188_5 < arg_185_1.time_ and arg_185_1.time_ <= var_188_5 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_7 = arg_185_1:FormatText(StoryNameCfg[13].name)

				arg_185_1.leftNameTxt_.text = var_188_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_8 = arg_185_1:GetWordFromCfg(910201046)
				local var_188_9 = arg_185_1:FormatText(var_188_8.content)

				arg_185_1.text_.text = var_188_9

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_10 = 30
				local var_188_11 = utf8.len(var_188_9)
				local var_188_12 = var_188_10 <= 0 and var_188_6 or var_188_6 * (var_188_11 / var_188_10)

				if var_188_12 > 0 and var_188_6 < var_188_12 then
					arg_185_1.talkMaxDuration = var_188_12

					if var_188_12 + var_188_5 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_12 + var_188_5
					end
				end

				arg_185_1.text_.text = var_188_9
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_13 = math.max(var_188_6, arg_185_1.talkMaxDuration)

			if var_188_5 <= arg_185_1.time_ and arg_185_1.time_ < var_188_5 + var_188_13 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_5) / var_188_13

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_5 + var_188_13 and arg_185_1.time_ < var_188_5 + var_188_13 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play910201047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 910201047
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play910201048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action472")
			end

			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface9903cva")
			end

			local var_192_2 = 0
			local var_192_3 = 0.775

			if var_192_2 < arg_189_1.time_ and arg_189_1.time_ <= var_192_2 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_4 = arg_189_1:FormatText(StoryNameCfg[13].name)

				arg_189_1.leftNameTxt_.text = var_192_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_5 = arg_189_1:GetWordFromCfg(910201047)
				local var_192_6 = arg_189_1:FormatText(var_192_5.content)

				arg_189_1.text_.text = var_192_6

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_7 = 31
				local var_192_8 = utf8.len(var_192_6)
				local var_192_9 = var_192_7 <= 0 and var_192_3 or var_192_3 * (var_192_8 / var_192_7)

				if var_192_9 > 0 and var_192_3 < var_192_9 then
					arg_189_1.talkMaxDuration = var_192_9

					if var_192_9 + var_192_2 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_9 + var_192_2
					end
				end

				arg_189_1.text_.text = var_192_6
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_10 = math.max(var_192_3, arg_189_1.talkMaxDuration)

			if var_192_2 <= arg_189_1.time_ and arg_189_1.time_ < var_192_2 + var_192_10 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_2) / var_192_10

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_2 + var_192_10 and arg_189_1.time_ < var_192_2 + var_192_10 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play910201048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 910201048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play910201049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action425")
			end

			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_196_2 = 0
			local var_196_3 = 0.4

			if var_196_2 < arg_193_1.time_ and arg_193_1.time_ <= var_196_2 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_4 = arg_193_1:FormatText(StoryNameCfg[13].name)

				arg_193_1.leftNameTxt_.text = var_196_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_5 = arg_193_1:GetWordFromCfg(910201048)
				local var_196_6 = arg_193_1:FormatText(var_196_5.content)

				arg_193_1.text_.text = var_196_6

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_7 = 16
				local var_196_8 = utf8.len(var_196_6)
				local var_196_9 = var_196_7 <= 0 and var_196_3 or var_196_3 * (var_196_8 / var_196_7)

				if var_196_9 > 0 and var_196_3 < var_196_9 then
					arg_193_1.talkMaxDuration = var_196_9

					if var_196_9 + var_196_2 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_9 + var_196_2
					end
				end

				arg_193_1.text_.text = var_196_6
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_10 = math.max(var_196_3, arg_193_1.talkMaxDuration)

			if var_196_2 <= arg_193_1.time_ and arg_193_1.time_ < var_196_2 + var_196_10 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_2) / var_196_10

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_2 + var_196_10 and arg_193_1.time_ < var_196_2 + var_196_10 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play910201049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 910201049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play910201050(arg_197_1)
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
			local var_200_7 = 0.2

			if var_200_6 < arg_197_1.time_ and arg_197_1.time_ <= var_200_6 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_8 = arg_197_1:FormatText(StoryNameCfg[7].name)

				arg_197_1.leftNameTxt_.text = var_200_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_9 = arg_197_1:GetWordFromCfg(910201049)
				local var_200_10 = arg_197_1:FormatText(var_200_9.content)

				arg_197_1.text_.text = var_200_10

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_11 = 8
				local var_200_12 = utf8.len(var_200_10)
				local var_200_13 = var_200_11 <= 0 and var_200_7 or var_200_7 * (var_200_12 / var_200_11)

				if var_200_13 > 0 and var_200_7 < var_200_13 then
					arg_197_1.talkMaxDuration = var_200_13

					if var_200_13 + var_200_6 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_13 + var_200_6
					end
				end

				arg_197_1.text_.text = var_200_10
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_14 = math.max(var_200_7, arg_197_1.talkMaxDuration)

			if var_200_6 <= arg_197_1.time_ and arg_197_1.time_ < var_200_6 + var_200_14 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_6) / var_200_14

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_6 + var_200_14 and arg_197_1.time_ < var_200_6 + var_200_14 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play910201050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 910201050
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play910201051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1019ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect1019ui_story == nil then
				arg_201_1.var_.characterEffect1019ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.2

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect1019ui_story then
					arg_201_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect1019ui_story then
				arg_201_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_204_4 = 0

			if var_204_4 < arg_201_1.time_ and arg_201_1.time_ <= var_204_4 + arg_204_0 then
				arg_201_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_204_5 = 0

			if var_204_5 < arg_201_1.time_ and arg_201_1.time_ <= var_204_5 + arg_204_0 then
				arg_201_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_204_6 = 0
			local var_204_7 = 0.525

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_8 = arg_201_1:FormatText(StoryNameCfg[13].name)

				arg_201_1.leftNameTxt_.text = var_204_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_9 = arg_201_1:GetWordFromCfg(910201050)
				local var_204_10 = arg_201_1:FormatText(var_204_9.content)

				arg_201_1.text_.text = var_204_10

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_11 = 21
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
	Play910201051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 910201051
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play910201052(arg_205_1)
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
					local var_208_4 = Mathf.Lerp(0, 0.5, var_208_3)

					arg_205_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1019ui_story.fillRatio = var_208_4
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect1019ui_story then
				local var_208_5 = 0.5

				arg_205_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1019ui_story.fillRatio = var_208_5
			end

			local var_208_6 = 0
			local var_208_7 = 0.3

			if var_208_6 < arg_205_1.time_ and arg_205_1.time_ <= var_208_6 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_8 = arg_205_1:FormatText(StoryNameCfg[7].name)

				arg_205_1.leftNameTxt_.text = var_208_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_9 = arg_205_1:GetWordFromCfg(910201051)
				local var_208_10 = arg_205_1:FormatText(var_208_9.content)

				arg_205_1.text_.text = var_208_10

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_11 = 12
				local var_208_12 = utf8.len(var_208_10)
				local var_208_13 = var_208_11 <= 0 and var_208_7 or var_208_7 * (var_208_12 / var_208_11)

				if var_208_13 > 0 and var_208_7 < var_208_13 then
					arg_205_1.talkMaxDuration = var_208_13

					if var_208_13 + var_208_6 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_13 + var_208_6
					end
				end

				arg_205_1.text_.text = var_208_10
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_14 = math.max(var_208_7, arg_205_1.talkMaxDuration)

			if var_208_6 <= arg_205_1.time_ and arg_205_1.time_ < var_208_6 + var_208_14 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_6) / var_208_14

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_6 + var_208_14 and arg_205_1.time_ < var_208_6 + var_208_14 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play910201052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 910201052
		arg_209_1.duration_ = 9

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play910201053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = "B13"

			if arg_209_1.bgs_[var_212_0] == nil then
				local var_212_1 = Object.Instantiate(arg_209_1.paintGo_)

				var_212_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_212_0)
				var_212_1.name = var_212_0
				var_212_1.transform.parent = arg_209_1.stage_.transform
				var_212_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_209_1.bgs_[var_212_0] = var_212_1
			end

			local var_212_2 = 1.966

			if var_212_2 < arg_209_1.time_ and arg_209_1.time_ <= var_212_2 + arg_212_0 then
				local var_212_3 = manager.ui.mainCamera.transform.localPosition
				local var_212_4 = Vector3.New(0, 0, 10) + Vector3.New(var_212_3.x, var_212_3.y, 0)
				local var_212_5 = arg_209_1.bgs_.B13

				var_212_5.transform.localPosition = var_212_4
				var_212_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_212_6 = var_212_5:GetComponent("SpriteRenderer")

				if var_212_6 and var_212_6.sprite then
					local var_212_7 = (var_212_5.transform.localPosition - var_212_3).z
					local var_212_8 = manager.ui.mainCameraCom_
					local var_212_9 = 2 * var_212_7 * Mathf.Tan(var_212_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_212_10 = var_212_9 * var_212_8.aspect
					local var_212_11 = var_212_6.sprite.bounds.size.x
					local var_212_12 = var_212_6.sprite.bounds.size.y
					local var_212_13 = var_212_10 / var_212_11
					local var_212_14 = var_212_9 / var_212_12
					local var_212_15 = var_212_14 < var_212_13 and var_212_13 or var_212_14

					var_212_5.transform.localScale = Vector3.New(var_212_15, var_212_15, 0)
				end

				for iter_212_0, iter_212_1 in pairs(arg_209_1.bgs_) do
					if iter_212_0 ~= "B13" then
						iter_212_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_212_16 = 0

			if var_212_16 < arg_209_1.time_ and arg_209_1.time_ <= var_212_16 + arg_212_0 then
				arg_209_1.mask_.enabled = true
				arg_209_1.mask_.raycastTarget = true

				arg_209_1:SetGaussion(false)
			end

			local var_212_17 = 2

			if var_212_16 <= arg_209_1.time_ and arg_209_1.time_ < var_212_16 + var_212_17 then
				local var_212_18 = (arg_209_1.time_ - var_212_16) / var_212_17
				local var_212_19 = Color.New(0, 0, 0)

				var_212_19.a = Mathf.Lerp(0, 1, var_212_18)
				arg_209_1.mask_.color = var_212_19
			end

			if arg_209_1.time_ >= var_212_16 + var_212_17 and arg_209_1.time_ < var_212_16 + var_212_17 + arg_212_0 then
				local var_212_20 = Color.New(0, 0, 0)

				var_212_20.a = 1
				arg_209_1.mask_.color = var_212_20
			end

			local var_212_21 = 2

			if var_212_21 < arg_209_1.time_ and arg_209_1.time_ <= var_212_21 + arg_212_0 then
				arg_209_1.mask_.enabled = true
				arg_209_1.mask_.raycastTarget = true

				arg_209_1:SetGaussion(false)
			end

			local var_212_22 = 2

			if var_212_21 <= arg_209_1.time_ and arg_209_1.time_ < var_212_21 + var_212_22 then
				local var_212_23 = (arg_209_1.time_ - var_212_21) / var_212_22
				local var_212_24 = Color.New(0, 0, 0)

				var_212_24.a = Mathf.Lerp(1, 0, var_212_23)
				arg_209_1.mask_.color = var_212_24
			end

			if arg_209_1.time_ >= var_212_21 + var_212_22 and arg_209_1.time_ < var_212_21 + var_212_22 + arg_212_0 then
				local var_212_25 = Color.New(0, 0, 0)
				local var_212_26 = 0

				arg_209_1.mask_.enabled = false
				var_212_25.a = var_212_26
				arg_209_1.mask_.color = var_212_25
			end

			local var_212_27 = arg_209_1.actors_["1019ui_story"].transform
			local var_212_28 = 1.966

			if var_212_28 < arg_209_1.time_ and arg_209_1.time_ <= var_212_28 + arg_212_0 then
				arg_209_1.var_.moveOldPos1019ui_story = var_212_27.localPosition
			end

			local var_212_29 = 0.001

			if var_212_28 <= arg_209_1.time_ and arg_209_1.time_ < var_212_28 + var_212_29 then
				local var_212_30 = (arg_209_1.time_ - var_212_28) / var_212_29
				local var_212_31 = Vector3.New(0, 100, 0)

				var_212_27.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1019ui_story, var_212_31, var_212_30)

				local var_212_32 = manager.ui.mainCamera.transform.position - var_212_27.position

				var_212_27.forward = Vector3.New(var_212_32.x, var_212_32.y, var_212_32.z)

				local var_212_33 = var_212_27.localEulerAngles

				var_212_33.z = 0
				var_212_33.x = 0
				var_212_27.localEulerAngles = var_212_33
			end

			if arg_209_1.time_ >= var_212_28 + var_212_29 and arg_209_1.time_ < var_212_28 + var_212_29 + arg_212_0 then
				var_212_27.localPosition = Vector3.New(0, 100, 0)

				local var_212_34 = manager.ui.mainCamera.transform.position - var_212_27.position

				var_212_27.forward = Vector3.New(var_212_34.x, var_212_34.y, var_212_34.z)

				local var_212_35 = var_212_27.localEulerAngles

				var_212_35.z = 0
				var_212_35.x = 0
				var_212_27.localEulerAngles = var_212_35
			end

			if arg_209_1.frameCnt_ <= 1 then
				arg_209_1.dialog_:SetActive(false)
			end

			local var_212_36 = 4
			local var_212_37 = 0.875

			if var_212_36 < arg_209_1.time_ and arg_209_1.time_ <= var_212_36 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0

				arg_209_1.dialog_:SetActive(true)

				local var_212_38 = LeanTween.value(arg_209_1.dialog_, 0, 1, 0.3)

				var_212_38:setOnUpdate(LuaHelper.FloatAction(function(arg_213_0)
					arg_209_1.dialogCg_.alpha = arg_213_0
				end))
				var_212_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_209_1.dialog_)
					var_212_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_209_1.duration_ = arg_209_1.duration_ + 0.3

				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_39 = arg_209_1:GetWordFromCfg(910201052)
				local var_212_40 = arg_209_1:FormatText(var_212_39.content)

				arg_209_1.text_.text = var_212_40

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_41 = 35
				local var_212_42 = utf8.len(var_212_40)
				local var_212_43 = var_212_41 <= 0 and var_212_37 or var_212_37 * (var_212_42 / var_212_41)

				if var_212_43 > 0 and var_212_37 < var_212_43 then
					arg_209_1.talkMaxDuration = var_212_43
					var_212_36 = var_212_36 + 0.3

					if var_212_43 + var_212_36 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_43 + var_212_36
					end
				end

				arg_209_1.text_.text = var_212_40
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_44 = var_212_36 + 0.3
			local var_212_45 = math.max(var_212_37, arg_209_1.talkMaxDuration)

			if var_212_44 <= arg_209_1.time_ and arg_209_1.time_ < var_212_44 + var_212_45 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_44) / var_212_45

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_44 + var_212_45 and arg_209_1.time_ < var_212_44 + var_212_45 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play910201053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 910201053
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play910201054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = "1039ui_story"

			if arg_215_1.actors_[var_218_0] == nil then
				local var_218_1 = Object.Instantiate(Asset.Load("Char/" .. var_218_0), arg_215_1.stage_.transform)

				var_218_1.name = var_218_0
				var_218_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_215_1.actors_[var_218_0] = var_218_1

				local var_218_2 = var_218_1:GetComponentInChildren(typeof(CharacterEffect))

				var_218_2.enabled = true

				local var_218_3 = GameObjectTools.GetOrAddComponent(var_218_1, typeof(DynamicBoneHelper))

				if var_218_3 then
					var_218_3:EnableDynamicBone(false)
				end

				arg_215_1:ShowWeapon(var_218_2.transform, false)

				arg_215_1.var_[var_218_0 .. "Animator"] = var_218_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_215_1.var_[var_218_0 .. "Animator"].applyRootMotion = true
				arg_215_1.var_[var_218_0 .. "LipSync"] = var_218_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_218_4 = arg_215_1.actors_["1039ui_story"].transform
			local var_218_5 = 0

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 then
				arg_215_1.var_.moveOldPos1039ui_story = var_218_4.localPosition
			end

			local var_218_6 = 0.001

			if var_218_5 <= arg_215_1.time_ and arg_215_1.time_ < var_218_5 + var_218_6 then
				local var_218_7 = (arg_215_1.time_ - var_218_5) / var_218_6
				local var_218_8 = Vector3.New(0, -1.01, -5.9)

				var_218_4.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1039ui_story, var_218_8, var_218_7)

				local var_218_9 = manager.ui.mainCamera.transform.position - var_218_4.position

				var_218_4.forward = Vector3.New(var_218_9.x, var_218_9.y, var_218_9.z)

				local var_218_10 = var_218_4.localEulerAngles

				var_218_10.z = 0
				var_218_10.x = 0
				var_218_4.localEulerAngles = var_218_10
			end

			if arg_215_1.time_ >= var_218_5 + var_218_6 and arg_215_1.time_ < var_218_5 + var_218_6 + arg_218_0 then
				var_218_4.localPosition = Vector3.New(0, -1.01, -5.9)

				local var_218_11 = manager.ui.mainCamera.transform.position - var_218_4.position

				var_218_4.forward = Vector3.New(var_218_11.x, var_218_11.y, var_218_11.z)

				local var_218_12 = var_218_4.localEulerAngles

				var_218_12.z = 0
				var_218_12.x = 0
				var_218_4.localEulerAngles = var_218_12
			end

			local var_218_13 = 0

			if var_218_13 < arg_215_1.time_ and arg_215_1.time_ <= var_218_13 + arg_218_0 then
				arg_215_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_218_14 = 0

			if var_218_14 < arg_215_1.time_ and arg_215_1.time_ <= var_218_14 + arg_218_0 then
				arg_215_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_218_15 = arg_215_1.actors_["1039ui_story"]
			local var_218_16 = 0

			if var_218_16 < arg_215_1.time_ and arg_215_1.time_ <= var_218_16 + arg_218_0 and arg_215_1.var_.characterEffect1039ui_story == nil then
				arg_215_1.var_.characterEffect1039ui_story = var_218_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_17 = 0.2

			if var_218_16 <= arg_215_1.time_ and arg_215_1.time_ < var_218_16 + var_218_17 then
				local var_218_18 = (arg_215_1.time_ - var_218_16) / var_218_17

				if arg_215_1.var_.characterEffect1039ui_story then
					arg_215_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_16 + var_218_17 and arg_215_1.time_ < var_218_16 + var_218_17 + arg_218_0 and arg_215_1.var_.characterEffect1039ui_story then
				arg_215_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_218_19 = 0
			local var_218_20 = 0.225

			if var_218_19 < arg_215_1.time_ and arg_215_1.time_ <= var_218_19 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_21 = arg_215_1:FormatText(StoryNameCfg[9].name)

				arg_215_1.leftNameTxt_.text = var_218_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_22 = arg_215_1:GetWordFromCfg(910201053)
				local var_218_23 = arg_215_1:FormatText(var_218_22.content)

				arg_215_1.text_.text = var_218_23

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_24 = 9
				local var_218_25 = utf8.len(var_218_23)
				local var_218_26 = var_218_24 <= 0 and var_218_20 or var_218_20 * (var_218_25 / var_218_24)

				if var_218_26 > 0 and var_218_20 < var_218_26 then
					arg_215_1.talkMaxDuration = var_218_26

					if var_218_26 + var_218_19 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_26 + var_218_19
					end
				end

				arg_215_1.text_.text = var_218_23
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_27 = math.max(var_218_20, arg_215_1.talkMaxDuration)

			if var_218_19 <= arg_215_1.time_ and arg_215_1.time_ < var_218_19 + var_218_27 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_19) / var_218_27

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_19 + var_218_27 and arg_215_1.time_ < var_218_19 + var_218_27 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play910201054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 910201054
		arg_219_1.duration_ = 5

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play910201055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1039ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1039ui_story == nil then
				arg_219_1.var_.characterEffect1039ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1039ui_story then
					local var_222_4 = Mathf.Lerp(0, 0.5, var_222_3)

					arg_219_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1039ui_story.fillRatio = var_222_4
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1039ui_story then
				local var_222_5 = 0.5

				arg_219_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1039ui_story.fillRatio = var_222_5
			end

			local var_222_6 = 0
			local var_222_7 = 0.55

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_8 = arg_219_1:FormatText(StoryNameCfg[7].name)

				arg_219_1.leftNameTxt_.text = var_222_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_9 = arg_219_1:GetWordFromCfg(910201054)
				local var_222_10 = arg_219_1:FormatText(var_222_9.content)

				arg_219_1.text_.text = var_222_10

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_11 = 22
				local var_222_12 = utf8.len(var_222_10)
				local var_222_13 = var_222_11 <= 0 and var_222_7 or var_222_7 * (var_222_12 / var_222_11)

				if var_222_13 > 0 and var_222_7 < var_222_13 then
					arg_219_1.talkMaxDuration = var_222_13

					if var_222_13 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_13 + var_222_6
					end
				end

				arg_219_1.text_.text = var_222_10
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)
				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_14 = math.max(var_222_7, arg_219_1.talkMaxDuration)

			if var_222_6 <= arg_219_1.time_ and arg_219_1.time_ < var_222_6 + var_222_14 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_6) / var_222_14

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_6 + var_222_14 and arg_219_1.time_ < var_222_6 + var_222_14 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play910201055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 910201055
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play910201056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1039ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1039ui_story == nil then
				arg_223_1.var_.characterEffect1039ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.2

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1039ui_story then
					arg_223_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1039ui_story then
				arg_223_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_226_4 = 0

			if var_226_4 < arg_223_1.time_ and arg_223_1.time_ <= var_226_4 + arg_226_0 then
				arg_223_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action457")
			end

			local var_226_5 = 0

			if var_226_5 < arg_223_1.time_ and arg_223_1.time_ <= var_226_5 + arg_226_0 then
				arg_223_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface9903cva")
			end

			local var_226_6 = 0
			local var_226_7 = 0.375

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[9].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(910201055)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 15
				local var_226_12 = utf8.len(var_226_10)
				local var_226_13 = var_226_11 <= 0 and var_226_7 or var_226_7 * (var_226_12 / var_226_11)

				if var_226_13 > 0 and var_226_7 < var_226_13 then
					arg_223_1.talkMaxDuration = var_226_13

					if var_226_13 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_13 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_10
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_14 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_14 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_14

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_14 and arg_223_1.time_ < var_226_6 + var_226_14 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play910201056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 910201056
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play910201057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1039ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1039ui_story == nil then
				arg_227_1.var_.characterEffect1039ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.2

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1039ui_story then
					local var_230_4 = Mathf.Lerp(0, 0.5, var_230_3)

					arg_227_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1039ui_story.fillRatio = var_230_4
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1039ui_story then
				local var_230_5 = 0.5

				arg_227_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1039ui_story.fillRatio = var_230_5
			end

			local var_230_6 = 0
			local var_230_7 = 0.825

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

				local var_230_9 = arg_227_1:GetWordFromCfg(910201056)
				local var_230_10 = arg_227_1:FormatText(var_230_9.content)

				arg_227_1.text_.text = var_230_10

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_11 = 33
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
	Play910201057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 910201057
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play910201058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1039ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1039ui_story == nil then
				arg_231_1.var_.characterEffect1039ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1039ui_story then
					arg_231_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1039ui_story then
				arg_231_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_234_4 = 0

			if var_234_4 < arg_231_1.time_ and arg_231_1.time_ <= var_234_4 + arg_234_0 then
				arg_231_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action472")
			end

			local var_234_5 = 0

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 then
				arg_231_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_234_6 = 0
			local var_234_7 = 0.875

			if var_234_6 < arg_231_1.time_ and arg_231_1.time_ <= var_234_6 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_8 = arg_231_1:FormatText(StoryNameCfg[9].name)

				arg_231_1.leftNameTxt_.text = var_234_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_9 = arg_231_1:GetWordFromCfg(910201057)
				local var_234_10 = arg_231_1:FormatText(var_234_9.content)

				arg_231_1.text_.text = var_234_10

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_11 = 35
				local var_234_12 = utf8.len(var_234_10)
				local var_234_13 = var_234_11 <= 0 and var_234_7 or var_234_7 * (var_234_12 / var_234_11)

				if var_234_13 > 0 and var_234_7 < var_234_13 then
					arg_231_1.talkMaxDuration = var_234_13

					if var_234_13 + var_234_6 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_13 + var_234_6
					end
				end

				arg_231_1.text_.text = var_234_10
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_14 = math.max(var_234_7, arg_231_1.talkMaxDuration)

			if var_234_6 <= arg_231_1.time_ and arg_231_1.time_ < var_234_6 + var_234_14 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_6) / var_234_14

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_6 + var_234_14 and arg_231_1.time_ < var_234_6 + var_234_14 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play910201058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 910201058
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play910201059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action425")
			end

			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_238_2 = 0
			local var_238_3 = 0.875

			if var_238_2 < arg_235_1.time_ and arg_235_1.time_ <= var_238_2 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_4 = arg_235_1:FormatText(StoryNameCfg[9].name)

				arg_235_1.leftNameTxt_.text = var_238_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_5 = arg_235_1:GetWordFromCfg(910201058)
				local var_238_6 = arg_235_1:FormatText(var_238_5.content)

				arg_235_1.text_.text = var_238_6

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_7 = 35
				local var_238_8 = utf8.len(var_238_6)
				local var_238_9 = var_238_7 <= 0 and var_238_3 or var_238_3 * (var_238_8 / var_238_7)

				if var_238_9 > 0 and var_238_3 < var_238_9 then
					arg_235_1.talkMaxDuration = var_238_9

					if var_238_9 + var_238_2 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_9 + var_238_2
					end
				end

				arg_235_1.text_.text = var_238_6
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_10 = math.max(var_238_3, arg_235_1.talkMaxDuration)

			if var_238_2 <= arg_235_1.time_ and arg_235_1.time_ < var_238_2 + var_238_10 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_2) / var_238_10

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_2 + var_238_10 and arg_235_1.time_ < var_238_2 + var_238_10 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play910201059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 910201059
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play910201060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action454")
			end

			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_242_2 = 0
			local var_242_3 = 0.775

			if var_242_2 < arg_239_1.time_ and arg_239_1.time_ <= var_242_2 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_4 = arg_239_1:FormatText(StoryNameCfg[9].name)

				arg_239_1.leftNameTxt_.text = var_242_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_5 = arg_239_1:GetWordFromCfg(910201059)
				local var_242_6 = arg_239_1:FormatText(var_242_5.content)

				arg_239_1.text_.text = var_242_6

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_7 = 31
				local var_242_8 = utf8.len(var_242_6)
				local var_242_9 = var_242_7 <= 0 and var_242_3 or var_242_3 * (var_242_8 / var_242_7)

				if var_242_9 > 0 and var_242_3 < var_242_9 then
					arg_239_1.talkMaxDuration = var_242_9

					if var_242_9 + var_242_2 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_9 + var_242_2
					end
				end

				arg_239_1.text_.text = var_242_6
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_10 = math.max(var_242_3, arg_239_1.talkMaxDuration)

			if var_242_2 <= arg_239_1.time_ and arg_239_1.time_ < var_242_2 + var_242_10 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_2) / var_242_10

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_2 + var_242_10 and arg_239_1.time_ < var_242_2 + var_242_10 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play910201060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 910201060
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play910201061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action442")
			end

			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_246_2 = 0
			local var_246_3 = 0.625

			if var_246_2 < arg_243_1.time_ and arg_243_1.time_ <= var_246_2 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_4 = arg_243_1:FormatText(StoryNameCfg[9].name)

				arg_243_1.leftNameTxt_.text = var_246_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_5 = arg_243_1:GetWordFromCfg(910201060)
				local var_246_6 = arg_243_1:FormatText(var_246_5.content)

				arg_243_1.text_.text = var_246_6

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_7 = 25
				local var_246_8 = utf8.len(var_246_6)
				local var_246_9 = var_246_7 <= 0 and var_246_3 or var_246_3 * (var_246_8 / var_246_7)

				if var_246_9 > 0 and var_246_3 < var_246_9 then
					arg_243_1.talkMaxDuration = var_246_9

					if var_246_9 + var_246_2 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_9 + var_246_2
					end
				end

				arg_243_1.text_.text = var_246_6
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_10 = math.max(var_246_3, arg_243_1.talkMaxDuration)

			if var_246_2 <= arg_243_1.time_ and arg_243_1.time_ < var_246_2 + var_246_10 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_2) / var_246_10

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_2 + var_246_10 and arg_243_1.time_ < var_246_2 + var_246_10 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play910201061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 910201061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play910201062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1039ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1039ui_story == nil then
				arg_247_1.var_.characterEffect1039ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1039ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1039ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1039ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1039ui_story.fillRatio = var_250_5
			end

			local var_250_6 = 0
			local var_250_7 = 0.75

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_8 = arg_247_1:FormatText(StoryNameCfg[7].name)

				arg_247_1.leftNameTxt_.text = var_250_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_9 = arg_247_1:GetWordFromCfg(910201061)
				local var_250_10 = arg_247_1:FormatText(var_250_9.content)

				arg_247_1.text_.text = var_250_10

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_11 = 30
				local var_250_12 = utf8.len(var_250_10)
				local var_250_13 = var_250_11 <= 0 and var_250_7 or var_250_7 * (var_250_12 / var_250_11)

				if var_250_13 > 0 and var_250_7 < var_250_13 then
					arg_247_1.talkMaxDuration = var_250_13

					if var_250_13 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_13 + var_250_6
					end
				end

				arg_247_1.text_.text = var_250_10
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_14 = math.max(var_250_7, arg_247_1.talkMaxDuration)

			if var_250_6 <= arg_247_1.time_ and arg_247_1.time_ < var_250_6 + var_250_14 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_6) / var_250_14

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_6 + var_250_14 and arg_247_1.time_ < var_250_6 + var_250_14 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play910201062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 910201062
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play910201063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1039ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect1039ui_story == nil then
				arg_251_1.var_.characterEffect1039ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.2

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect1039ui_story then
					arg_251_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect1039ui_story then
				arg_251_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_254_4 = 0

			if var_254_4 < arg_251_1.time_ and arg_251_1.time_ <= var_254_4 + arg_254_0 then
				arg_251_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action425")
			end

			local var_254_5 = 0

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 then
				arg_251_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_254_6 = 0
			local var_254_7 = 0.125

			if var_254_6 < arg_251_1.time_ and arg_251_1.time_ <= var_254_6 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_8 = arg_251_1:FormatText(StoryNameCfg[9].name)

				arg_251_1.leftNameTxt_.text = var_254_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_9 = arg_251_1:GetWordFromCfg(910201062)
				local var_254_10 = arg_251_1:FormatText(var_254_9.content)

				arg_251_1.text_.text = var_254_10

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_11 = 5
				local var_254_12 = utf8.len(var_254_10)
				local var_254_13 = var_254_11 <= 0 and var_254_7 or var_254_7 * (var_254_12 / var_254_11)

				if var_254_13 > 0 and var_254_7 < var_254_13 then
					arg_251_1.talkMaxDuration = var_254_13

					if var_254_13 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_13 + var_254_6
					end
				end

				arg_251_1.text_.text = var_254_10
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_14 = math.max(var_254_7, arg_251_1.talkMaxDuration)

			if var_254_6 <= arg_251_1.time_ and arg_251_1.time_ < var_254_6 + var_254_14 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_6) / var_254_14

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_6 + var_254_14 and arg_251_1.time_ < var_254_6 + var_254_14 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play910201063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 910201063
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play910201064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1039ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1039ui_story == nil then
				arg_255_1.var_.characterEffect1039ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.2

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1039ui_story then
					local var_258_4 = Mathf.Lerp(0, 0.5, var_258_3)

					arg_255_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1039ui_story.fillRatio = var_258_4
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1039ui_story then
				local var_258_5 = 0.5

				arg_255_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1039ui_story.fillRatio = var_258_5
			end

			local var_258_6 = 0
			local var_258_7 = 0.45

			if var_258_6 < arg_255_1.time_ and arg_255_1.time_ <= var_258_6 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_8 = arg_255_1:FormatText(StoryNameCfg[7].name)

				arg_255_1.leftNameTxt_.text = var_258_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_9 = arg_255_1:GetWordFromCfg(910201063)
				local var_258_10 = arg_255_1:FormatText(var_258_9.content)

				arg_255_1.text_.text = var_258_10

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_11 = 18
				local var_258_12 = utf8.len(var_258_10)
				local var_258_13 = var_258_11 <= 0 and var_258_7 or var_258_7 * (var_258_12 / var_258_11)

				if var_258_13 > 0 and var_258_7 < var_258_13 then
					arg_255_1.talkMaxDuration = var_258_13

					if var_258_13 + var_258_6 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_13 + var_258_6
					end
				end

				arg_255_1.text_.text = var_258_10
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_14 = math.max(var_258_7, arg_255_1.talkMaxDuration)

			if var_258_6 <= arg_255_1.time_ and arg_255_1.time_ < var_258_6 + var_258_14 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_6) / var_258_14

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_6 + var_258_14 and arg_255_1.time_ < var_258_6 + var_258_14 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play910201064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 910201064
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play910201065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1039ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1039ui_story == nil then
				arg_259_1.var_.characterEffect1039ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.2

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1039ui_story then
					arg_259_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1039ui_story then
				arg_259_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_262_4 = 0

			if var_262_4 < arg_259_1.time_ and arg_259_1.time_ <= var_262_4 + arg_262_0 then
				arg_259_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action453")
			end

			local var_262_5 = 0

			if var_262_5 < arg_259_1.time_ and arg_259_1.time_ <= var_262_5 + arg_262_0 then
				arg_259_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_262_6 = 0
			local var_262_7 = 0.575

			if var_262_6 < arg_259_1.time_ and arg_259_1.time_ <= var_262_6 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_8 = arg_259_1:FormatText(StoryNameCfg[9].name)

				arg_259_1.leftNameTxt_.text = var_262_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_9 = arg_259_1:GetWordFromCfg(910201064)
				local var_262_10 = arg_259_1:FormatText(var_262_9.content)

				arg_259_1.text_.text = var_262_10

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_11 = 23
				local var_262_12 = utf8.len(var_262_10)
				local var_262_13 = var_262_11 <= 0 and var_262_7 or var_262_7 * (var_262_12 / var_262_11)

				if var_262_13 > 0 and var_262_7 < var_262_13 then
					arg_259_1.talkMaxDuration = var_262_13

					if var_262_13 + var_262_6 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_13 + var_262_6
					end
				end

				arg_259_1.text_.text = var_262_10
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_14 = math.max(var_262_7, arg_259_1.talkMaxDuration)

			if var_262_6 <= arg_259_1.time_ and arg_259_1.time_ < var_262_6 + var_262_14 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_6) / var_262_14

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_6 + var_262_14 and arg_259_1.time_ < var_262_6 + var_262_14 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play910201065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 910201065
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play910201066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action437")
			end

			local var_266_2 = 0
			local var_266_3 = 0.8

			if var_266_2 < arg_263_1.time_ and arg_263_1.time_ <= var_266_2 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_4 = arg_263_1:FormatText(StoryNameCfg[9].name)

				arg_263_1.leftNameTxt_.text = var_266_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_5 = arg_263_1:GetWordFromCfg(910201065)
				local var_266_6 = arg_263_1:FormatText(var_266_5.content)

				arg_263_1.text_.text = var_266_6

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_7 = 32
				local var_266_8 = utf8.len(var_266_6)
				local var_266_9 = var_266_7 <= 0 and var_266_3 or var_266_3 * (var_266_8 / var_266_7)

				if var_266_9 > 0 and var_266_3 < var_266_9 then
					arg_263_1.talkMaxDuration = var_266_9

					if var_266_9 + var_266_2 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_9 + var_266_2
					end
				end

				arg_263_1.text_.text = var_266_6
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_10 = math.max(var_266_3, arg_263_1.talkMaxDuration)

			if var_266_2 <= arg_263_1.time_ and arg_263_1.time_ < var_266_2 + var_266_10 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_2) / var_266_10

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_2 + var_266_10 and arg_263_1.time_ < var_266_2 + var_266_10 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play910201066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 910201066
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play910201067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1039ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect1039ui_story == nil then
				arg_267_1.var_.characterEffect1039ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.2

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect1039ui_story then
					local var_270_4 = Mathf.Lerp(0, 0.5, var_270_3)

					arg_267_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1039ui_story.fillRatio = var_270_4
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect1039ui_story then
				local var_270_5 = 0.5

				arg_267_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1039ui_story.fillRatio = var_270_5
			end

			local var_270_6 = 0
			local var_270_7 = 0.5

			if var_270_6 < arg_267_1.time_ and arg_267_1.time_ <= var_270_6 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_8 = arg_267_1:GetWordFromCfg(910201066)
				local var_270_9 = arg_267_1:FormatText(var_270_8.content)

				arg_267_1.text_.text = var_270_9

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_10 = 20
				local var_270_11 = utf8.len(var_270_9)
				local var_270_12 = var_270_10 <= 0 and var_270_7 or var_270_7 * (var_270_11 / var_270_10)

				if var_270_12 > 0 and var_270_7 < var_270_12 then
					arg_267_1.talkMaxDuration = var_270_12

					if var_270_12 + var_270_6 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_12 + var_270_6
					end
				end

				arg_267_1.text_.text = var_270_9
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_13 = math.max(var_270_7, arg_267_1.talkMaxDuration)

			if var_270_6 <= arg_267_1.time_ and arg_267_1.time_ < var_270_6 + var_270_13 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_6) / var_270_13

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_6 + var_270_13 and arg_267_1.time_ < var_270_6 + var_270_13 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play910201067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 910201067
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play910201068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action474")
			end

			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_274_2 = arg_271_1.actors_["1039ui_story"]
			local var_274_3 = 0

			if var_274_3 < arg_271_1.time_ and arg_271_1.time_ <= var_274_3 + arg_274_0 and arg_271_1.var_.characterEffect1039ui_story == nil then
				arg_271_1.var_.characterEffect1039ui_story = var_274_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_4 = 0.2

			if var_274_3 <= arg_271_1.time_ and arg_271_1.time_ < var_274_3 + var_274_4 then
				local var_274_5 = (arg_271_1.time_ - var_274_3) / var_274_4

				if arg_271_1.var_.characterEffect1039ui_story then
					arg_271_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_3 + var_274_4 and arg_271_1.time_ < var_274_3 + var_274_4 + arg_274_0 and arg_271_1.var_.characterEffect1039ui_story then
				arg_271_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_274_6 = 0
			local var_274_7 = 0.875

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_8 = arg_271_1:FormatText(StoryNameCfg[9].name)

				arg_271_1.leftNameTxt_.text = var_274_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_9 = arg_271_1:GetWordFromCfg(910201067)
				local var_274_10 = arg_271_1:FormatText(var_274_9.content)

				arg_271_1.text_.text = var_274_10

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_11 = 35
				local var_274_12 = utf8.len(var_274_10)
				local var_274_13 = var_274_11 <= 0 and var_274_7 or var_274_7 * (var_274_12 / var_274_11)

				if var_274_13 > 0 and var_274_7 < var_274_13 then
					arg_271_1.talkMaxDuration = var_274_13

					if var_274_13 + var_274_6 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_13 + var_274_6
					end
				end

				arg_271_1.text_.text = var_274_10
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_14 = math.max(var_274_7, arg_271_1.talkMaxDuration)

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_14 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_6) / var_274_14

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_6 + var_274_14 and arg_271_1.time_ < var_274_6 + var_274_14 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play910201068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 910201068
		arg_275_1.duration_ = 5

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play910201069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1039ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect1039ui_story == nil then
				arg_275_1.var_.characterEffect1039ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.2

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect1039ui_story then
					local var_278_4 = Mathf.Lerp(0, 0.5, var_278_3)

					arg_275_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_275_1.var_.characterEffect1039ui_story.fillRatio = var_278_4
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect1039ui_story then
				local var_278_5 = 0.5

				arg_275_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_275_1.var_.characterEffect1039ui_story.fillRatio = var_278_5
			end

			local var_278_6 = 0
			local var_278_7 = 0.225

			if var_278_6 < arg_275_1.time_ and arg_275_1.time_ <= var_278_6 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_8 = arg_275_1:FormatText(StoryNameCfg[7].name)

				arg_275_1.leftNameTxt_.text = var_278_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_9 = arg_275_1:GetWordFromCfg(910201068)
				local var_278_10 = arg_275_1:FormatText(var_278_9.content)

				arg_275_1.text_.text = var_278_10

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_11 = 9
				local var_278_12 = utf8.len(var_278_10)
				local var_278_13 = var_278_11 <= 0 and var_278_7 or var_278_7 * (var_278_12 / var_278_11)

				if var_278_13 > 0 and var_278_7 < var_278_13 then
					arg_275_1.talkMaxDuration = var_278_13

					if var_278_13 + var_278_6 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_13 + var_278_6
					end
				end

				arg_275_1.text_.text = var_278_10
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_14 = math.max(var_278_7, arg_275_1.talkMaxDuration)

			if var_278_6 <= arg_275_1.time_ and arg_275_1.time_ < var_278_6 + var_278_14 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_6) / var_278_14

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_6 + var_278_14 and arg_275_1.time_ < var_278_6 + var_278_14 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play910201069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 910201069
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play910201070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1039ui_story"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect1039ui_story == nil then
				arg_279_1.var_.characterEffect1039ui_story = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.2

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect1039ui_story then
					arg_279_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1039ui_story then
				arg_279_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_282_4 = 0

			if var_282_4 < arg_279_1.time_ and arg_279_1.time_ <= var_282_4 + arg_282_0 then
				arg_279_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action442")
			end

			local var_282_5 = 0

			if var_282_5 < arg_279_1.time_ and arg_279_1.time_ <= var_282_5 + arg_282_0 then
				arg_279_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_282_6 = 0
			local var_282_7 = 0.425

			if var_282_6 < arg_279_1.time_ and arg_279_1.time_ <= var_282_6 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_8 = arg_279_1:FormatText(StoryNameCfg[9].name)

				arg_279_1.leftNameTxt_.text = var_282_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_9 = arg_279_1:GetWordFromCfg(910201069)
				local var_282_10 = arg_279_1:FormatText(var_282_9.content)

				arg_279_1.text_.text = var_282_10

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_11 = 17
				local var_282_12 = utf8.len(var_282_10)
				local var_282_13 = var_282_11 <= 0 and var_282_7 or var_282_7 * (var_282_12 / var_282_11)

				if var_282_13 > 0 and var_282_7 < var_282_13 then
					arg_279_1.talkMaxDuration = var_282_13

					if var_282_13 + var_282_6 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_13 + var_282_6
					end
				end

				arg_279_1.text_.text = var_282_10
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_14 = math.max(var_282_7, arg_279_1.talkMaxDuration)

			if var_282_6 <= arg_279_1.time_ and arg_279_1.time_ < var_282_6 + var_282_14 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_6) / var_282_14

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_6 + var_282_14 and arg_279_1.time_ < var_282_6 + var_282_14 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play910201070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 910201070
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play910201071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action424")
			end

			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_286_2 = 0
			local var_286_3 = 0.8

			if var_286_2 < arg_283_1.time_ and arg_283_1.time_ <= var_286_2 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_4 = arg_283_1:FormatText(StoryNameCfg[9].name)

				arg_283_1.leftNameTxt_.text = var_286_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_5 = arg_283_1:GetWordFromCfg(910201070)
				local var_286_6 = arg_283_1:FormatText(var_286_5.content)

				arg_283_1.text_.text = var_286_6

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_7 = 32
				local var_286_8 = utf8.len(var_286_6)
				local var_286_9 = var_286_7 <= 0 and var_286_3 or var_286_3 * (var_286_8 / var_286_7)

				if var_286_9 > 0 and var_286_3 < var_286_9 then
					arg_283_1.talkMaxDuration = var_286_9

					if var_286_9 + var_286_2 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_9 + var_286_2
					end
				end

				arg_283_1.text_.text = var_286_6
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_10 = math.max(var_286_3, arg_283_1.talkMaxDuration)

			if var_286_2 <= arg_283_1.time_ and arg_283_1.time_ < var_286_2 + var_286_10 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_2) / var_286_10

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_2 + var_286_10 and arg_283_1.time_ < var_286_2 + var_286_10 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play910201071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 910201071
		arg_287_1.duration_ = 9

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play910201072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = "ST12"

			if arg_287_1.bgs_[var_290_0] == nil then
				local var_290_1 = Object.Instantiate(arg_287_1.paintGo_)

				var_290_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_290_0)
				var_290_1.name = var_290_0
				var_290_1.transform.parent = arg_287_1.stage_.transform
				var_290_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_287_1.bgs_[var_290_0] = var_290_1
			end

			local var_290_2 = 2

			if var_290_2 < arg_287_1.time_ and arg_287_1.time_ <= var_290_2 + arg_290_0 then
				local var_290_3 = manager.ui.mainCamera.transform.localPosition
				local var_290_4 = Vector3.New(0, 0, 10) + Vector3.New(var_290_3.x, var_290_3.y, 0)
				local var_290_5 = arg_287_1.bgs_.ST12

				var_290_5.transform.localPosition = var_290_4
				var_290_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_290_6 = var_290_5:GetComponent("SpriteRenderer")

				if var_290_6 and var_290_6.sprite then
					local var_290_7 = (var_290_5.transform.localPosition - var_290_3).z
					local var_290_8 = manager.ui.mainCameraCom_
					local var_290_9 = 2 * var_290_7 * Mathf.Tan(var_290_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_290_10 = var_290_9 * var_290_8.aspect
					local var_290_11 = var_290_6.sprite.bounds.size.x
					local var_290_12 = var_290_6.sprite.bounds.size.y
					local var_290_13 = var_290_10 / var_290_11
					local var_290_14 = var_290_9 / var_290_12
					local var_290_15 = var_290_14 < var_290_13 and var_290_13 or var_290_14

					var_290_5.transform.localScale = Vector3.New(var_290_15, var_290_15, 0)
				end

				for iter_290_0, iter_290_1 in pairs(arg_287_1.bgs_) do
					if iter_290_0 ~= "ST12" then
						iter_290_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_290_16 = 0

			if var_290_16 < arg_287_1.time_ and arg_287_1.time_ <= var_290_16 + arg_290_0 then
				arg_287_1.mask_.enabled = true
				arg_287_1.mask_.raycastTarget = true

				arg_287_1:SetGaussion(false)
			end

			local var_290_17 = 2

			if var_290_16 <= arg_287_1.time_ and arg_287_1.time_ < var_290_16 + var_290_17 then
				local var_290_18 = (arg_287_1.time_ - var_290_16) / var_290_17
				local var_290_19 = Color.New(0, 0, 0)

				var_290_19.a = Mathf.Lerp(0, 1, var_290_18)
				arg_287_1.mask_.color = var_290_19
			end

			if arg_287_1.time_ >= var_290_16 + var_290_17 and arg_287_1.time_ < var_290_16 + var_290_17 + arg_290_0 then
				local var_290_20 = Color.New(0, 0, 0)

				var_290_20.a = 1
				arg_287_1.mask_.color = var_290_20
			end

			local var_290_21 = 2

			if var_290_21 < arg_287_1.time_ and arg_287_1.time_ <= var_290_21 + arg_290_0 then
				arg_287_1.mask_.enabled = true
				arg_287_1.mask_.raycastTarget = true

				arg_287_1:SetGaussion(false)
			end

			local var_290_22 = 2

			if var_290_21 <= arg_287_1.time_ and arg_287_1.time_ < var_290_21 + var_290_22 then
				local var_290_23 = (arg_287_1.time_ - var_290_21) / var_290_22
				local var_290_24 = Color.New(0, 0, 0)

				var_290_24.a = Mathf.Lerp(1, 0, var_290_23)
				arg_287_1.mask_.color = var_290_24
			end

			if arg_287_1.time_ >= var_290_21 + var_290_22 and arg_287_1.time_ < var_290_21 + var_290_22 + arg_290_0 then
				local var_290_25 = Color.New(0, 0, 0)
				local var_290_26 = 0

				arg_287_1.mask_.enabled = false
				var_290_25.a = var_290_26
				arg_287_1.mask_.color = var_290_25
			end

			local var_290_27 = arg_287_1.actors_["1039ui_story"].transform
			local var_290_28 = 1.966

			if var_290_28 < arg_287_1.time_ and arg_287_1.time_ <= var_290_28 + arg_290_0 then
				arg_287_1.var_.moveOldPos1039ui_story = var_290_27.localPosition
			end

			local var_290_29 = 0.001

			if var_290_28 <= arg_287_1.time_ and arg_287_1.time_ < var_290_28 + var_290_29 then
				local var_290_30 = (arg_287_1.time_ - var_290_28) / var_290_29
				local var_290_31 = Vector3.New(0, 100, 0)

				var_290_27.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1039ui_story, var_290_31, var_290_30)

				local var_290_32 = manager.ui.mainCamera.transform.position - var_290_27.position

				var_290_27.forward = Vector3.New(var_290_32.x, var_290_32.y, var_290_32.z)

				local var_290_33 = var_290_27.localEulerAngles

				var_290_33.z = 0
				var_290_33.x = 0
				var_290_27.localEulerAngles = var_290_33
			end

			if arg_287_1.time_ >= var_290_28 + var_290_29 and arg_287_1.time_ < var_290_28 + var_290_29 + arg_290_0 then
				var_290_27.localPosition = Vector3.New(0, 100, 0)

				local var_290_34 = manager.ui.mainCamera.transform.position - var_290_27.position

				var_290_27.forward = Vector3.New(var_290_34.x, var_290_34.y, var_290_34.z)

				local var_290_35 = var_290_27.localEulerAngles

				var_290_35.z = 0
				var_290_35.x = 0
				var_290_27.localEulerAngles = var_290_35
			end

			if arg_287_1.frameCnt_ <= 1 then
				arg_287_1.dialog_:SetActive(false)
			end

			local var_290_36 = 4
			local var_290_37 = 0.8

			if var_290_36 < arg_287_1.time_ and arg_287_1.time_ <= var_290_36 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0

				arg_287_1.dialog_:SetActive(true)

				local var_290_38 = LeanTween.value(arg_287_1.dialog_, 0, 1, 0.3)

				var_290_38:setOnUpdate(LuaHelper.FloatAction(function(arg_291_0)
					arg_287_1.dialogCg_.alpha = arg_291_0
				end))
				var_290_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_287_1.dialog_)
					var_290_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_287_1.duration_ = arg_287_1.duration_ + 0.3

				SetActive(arg_287_1.leftNameGo_, false)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_39 = arg_287_1:GetWordFromCfg(910201071)
				local var_290_40 = arg_287_1:FormatText(var_290_39.content)

				arg_287_1.text_.text = var_290_40

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_41 = 32
				local var_290_42 = utf8.len(var_290_40)
				local var_290_43 = var_290_41 <= 0 and var_290_37 or var_290_37 * (var_290_42 / var_290_41)

				if var_290_43 > 0 and var_290_37 < var_290_43 then
					arg_287_1.talkMaxDuration = var_290_43
					var_290_36 = var_290_36 + 0.3

					if var_290_43 + var_290_36 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_43 + var_290_36
					end
				end

				arg_287_1.text_.text = var_290_40
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_44 = var_290_36 + 0.3
			local var_290_45 = math.max(var_290_37, arg_287_1.talkMaxDuration)

			if var_290_44 <= arg_287_1.time_ and arg_287_1.time_ < var_290_44 + var_290_45 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_44) / var_290_45

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_44 + var_290_45 and arg_287_1.time_ < var_290_44 + var_290_45 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play910201072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 910201072
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play910201073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 0.625

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[7].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(910201072)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 25
				local var_296_6 = utf8.len(var_296_4)
				local var_296_7 = var_296_5 <= 0 and var_296_1 or var_296_1 * (var_296_6 / var_296_5)

				if var_296_7 > 0 and var_296_1 < var_296_7 then
					arg_293_1.talkMaxDuration = var_296_7

					if var_296_7 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_7 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_4
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_8 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_8 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_8

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_8 and arg_293_1.time_ < var_296_0 + var_296_8 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play910201073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 910201073
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play910201074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.2

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[35].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, true)
				arg_297_1.iconController_:SetSelectedState("hero")

				arg_297_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1013")

				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(910201073)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 8
				local var_300_6 = utf8.len(var_300_4)
				local var_300_7 = var_300_5 <= 0 and var_300_1 or var_300_1 * (var_300_6 / var_300_5)

				if var_300_7 > 0 and var_300_1 < var_300_7 then
					arg_297_1.talkMaxDuration = var_300_7

					if var_300_7 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_7 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_4
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_8 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_8 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_8

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_8 and arg_297_1.time_ < var_300_0 + var_300_8 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play910201074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 910201074
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play910201075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.4

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_2 = arg_301_1:GetWordFromCfg(910201074)
				local var_304_3 = arg_301_1:FormatText(var_304_2.content)

				arg_301_1.text_.text = var_304_3

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_4 = 16
				local var_304_5 = utf8.len(var_304_3)
				local var_304_6 = var_304_4 <= 0 and var_304_1 or var_304_1 * (var_304_5 / var_304_4)

				if var_304_6 > 0 and var_304_1 < var_304_6 then
					arg_301_1.talkMaxDuration = var_304_6

					if var_304_6 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_6 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_3
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_7 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_7 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_7

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_7 and arg_301_1.time_ < var_304_0 + var_304_7 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play910201075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 910201075
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play910201076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.275

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[7].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(910201075)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 11
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
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_8 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_8 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_8

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_8 and arg_305_1.time_ < var_308_0 + var_308_8 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play910201076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 910201076
		arg_309_1.duration_ = 5

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play910201077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = "1013ui_story"

			if arg_309_1.actors_[var_312_0] == nil then
				local var_312_1 = Object.Instantiate(Asset.Load("Char/" .. var_312_0), arg_309_1.stage_.transform)

				var_312_1.name = var_312_0
				var_312_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_309_1.actors_[var_312_0] = var_312_1

				local var_312_2 = var_312_1:GetComponentInChildren(typeof(CharacterEffect))

				var_312_2.enabled = true

				local var_312_3 = GameObjectTools.GetOrAddComponent(var_312_1, typeof(DynamicBoneHelper))

				if var_312_3 then
					var_312_3:EnableDynamicBone(false)
				end

				arg_309_1:ShowWeapon(var_312_2.transform, false)

				arg_309_1.var_[var_312_0 .. "Animator"] = var_312_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_309_1.var_[var_312_0 .. "Animator"].applyRootMotion = true
				arg_309_1.var_[var_312_0 .. "LipSync"] = var_312_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_312_4 = arg_309_1.actors_["1013ui_story"].transform
			local var_312_5 = 0

			if var_312_5 < arg_309_1.time_ and arg_309_1.time_ <= var_312_5 + arg_312_0 then
				arg_309_1.var_.moveOldPos1013ui_story = var_312_4.localPosition
			end

			local var_312_6 = 0.001

			if var_312_5 <= arg_309_1.time_ and arg_309_1.time_ < var_312_5 + var_312_6 then
				local var_312_7 = (arg_309_1.time_ - var_312_5) / var_312_6
				local var_312_8 = Vector3.New(0, -0.66, -6.15)

				var_312_4.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1013ui_story, var_312_8, var_312_7)

				local var_312_9 = manager.ui.mainCamera.transform.position - var_312_4.position

				var_312_4.forward = Vector3.New(var_312_9.x, var_312_9.y, var_312_9.z)

				local var_312_10 = var_312_4.localEulerAngles

				var_312_10.z = 0
				var_312_10.x = 0
				var_312_4.localEulerAngles = var_312_10
			end

			if arg_309_1.time_ >= var_312_5 + var_312_6 and arg_309_1.time_ < var_312_5 + var_312_6 + arg_312_0 then
				var_312_4.localPosition = Vector3.New(0, -0.66, -6.15)

				local var_312_11 = manager.ui.mainCamera.transform.position - var_312_4.position

				var_312_4.forward = Vector3.New(var_312_11.x, var_312_11.y, var_312_11.z)

				local var_312_12 = var_312_4.localEulerAngles

				var_312_12.z = 0
				var_312_12.x = 0
				var_312_4.localEulerAngles = var_312_12
			end

			local var_312_13 = 0

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action11_1")
			end

			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 then
				arg_309_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_312_15 = arg_309_1.actors_["1013ui_story"]
			local var_312_16 = 0

			if var_312_16 < arg_309_1.time_ and arg_309_1.time_ <= var_312_16 + arg_312_0 and arg_309_1.var_.characterEffect1013ui_story == nil then
				arg_309_1.var_.characterEffect1013ui_story = var_312_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_17 = 0.2

			if var_312_16 <= arg_309_1.time_ and arg_309_1.time_ < var_312_16 + var_312_17 then
				local var_312_18 = (arg_309_1.time_ - var_312_16) / var_312_17

				if arg_309_1.var_.characterEffect1013ui_story then
					arg_309_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_16 + var_312_17 and arg_309_1.time_ < var_312_16 + var_312_17 + arg_312_0 and arg_309_1.var_.characterEffect1013ui_story then
				arg_309_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_312_19 = 0
			local var_312_20 = 0.3

			if var_312_19 < arg_309_1.time_ and arg_309_1.time_ <= var_312_19 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_21 = arg_309_1:FormatText(StoryNameCfg[35].name)

				arg_309_1.leftNameTxt_.text = var_312_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_22 = arg_309_1:GetWordFromCfg(910201076)
				local var_312_23 = arg_309_1:FormatText(var_312_22.content)

				arg_309_1.text_.text = var_312_23

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_24 = 12
				local var_312_25 = utf8.len(var_312_23)
				local var_312_26 = var_312_24 <= 0 and var_312_20 or var_312_20 * (var_312_25 / var_312_24)

				if var_312_26 > 0 and var_312_20 < var_312_26 then
					arg_309_1.talkMaxDuration = var_312_26

					if var_312_26 + var_312_19 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_26 + var_312_19
					end
				end

				arg_309_1.text_.text = var_312_23
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_27 = math.max(var_312_20, arg_309_1.talkMaxDuration)

			if var_312_19 <= arg_309_1.time_ and arg_309_1.time_ < var_312_19 + var_312_27 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_19) / var_312_27

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_19 + var_312_27 and arg_309_1.time_ < var_312_19 + var_312_27 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play910201077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 910201077
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play910201078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1013ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect1013ui_story == nil then
				arg_313_1.var_.characterEffect1013ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.2

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect1013ui_story then
					local var_316_4 = Mathf.Lerp(0, 0.5, var_316_3)

					arg_313_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1013ui_story.fillRatio = var_316_4
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect1013ui_story then
				local var_316_5 = 0.5

				arg_313_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1013ui_story.fillRatio = var_316_5
			end

			local var_316_6 = 0
			local var_316_7 = 0.1

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

				local var_316_9 = arg_313_1:GetWordFromCfg(910201077)
				local var_316_10 = arg_313_1:FormatText(var_316_9.content)

				arg_313_1.text_.text = var_316_10

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_11 = 4
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
	Play910201078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 910201078
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play910201079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1013ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect1013ui_story == nil then
				arg_317_1.var_.characterEffect1013ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.2

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect1013ui_story then
					arg_317_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect1013ui_story then
				arg_317_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_320_4 = 0

			if var_320_4 < arg_317_1.time_ and arg_317_1.time_ <= var_320_4 + arg_320_0 then
				arg_317_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action4112")
			end

			local var_320_5 = 0

			if var_320_5 < arg_317_1.time_ and arg_317_1.time_ <= var_320_5 + arg_320_0 then
				arg_317_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_320_6 = 0
			local var_320_7 = 0.85

			if var_320_6 < arg_317_1.time_ and arg_317_1.time_ <= var_320_6 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_8 = arg_317_1:FormatText(StoryNameCfg[35].name)

				arg_317_1.leftNameTxt_.text = var_320_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_9 = arg_317_1:GetWordFromCfg(910201078)
				local var_320_10 = arg_317_1:FormatText(var_320_9.content)

				arg_317_1.text_.text = var_320_10

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_11 = 34
				local var_320_12 = utf8.len(var_320_10)
				local var_320_13 = var_320_11 <= 0 and var_320_7 or var_320_7 * (var_320_12 / var_320_11)

				if var_320_13 > 0 and var_320_7 < var_320_13 then
					arg_317_1.talkMaxDuration = var_320_13

					if var_320_13 + var_320_6 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_13 + var_320_6
					end
				end

				arg_317_1.text_.text = var_320_10
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_14 = math.max(var_320_7, arg_317_1.talkMaxDuration)

			if var_320_6 <= arg_317_1.time_ and arg_317_1.time_ < var_320_6 + var_320_14 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_6) / var_320_14

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_6 + var_320_14 and arg_317_1.time_ < var_320_6 + var_320_14 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play910201079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 910201079
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play910201080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1013ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect1013ui_story == nil then
				arg_321_1.var_.characterEffect1013ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.2

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect1013ui_story then
					local var_324_4 = Mathf.Lerp(0, 0.5, var_324_3)

					arg_321_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1013ui_story.fillRatio = var_324_4
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect1013ui_story then
				local var_324_5 = 0.5

				arg_321_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1013ui_story.fillRatio = var_324_5
			end

			local var_324_6 = 0
			local var_324_7 = 0.6

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

				local var_324_9 = arg_321_1:GetWordFromCfg(910201079)
				local var_324_10 = arg_321_1:FormatText(var_324_9.content)

				arg_321_1.text_.text = var_324_10

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_11 = 24
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
	Play910201080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 910201080
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play910201081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1013ui_story"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.characterEffect1013ui_story == nil then
				arg_325_1.var_.characterEffect1013ui_story = var_328_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_2 = 0.2

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.characterEffect1013ui_story then
					arg_325_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.characterEffect1013ui_story then
				arg_325_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_328_4 = 0

			if var_328_4 < arg_325_1.time_ and arg_325_1.time_ <= var_328_4 + arg_328_0 then
				arg_325_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action425")
			end

			local var_328_5 = 0

			if var_328_5 < arg_325_1.time_ and arg_325_1.time_ <= var_328_5 + arg_328_0 then
				arg_325_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_328_6 = 0
			local var_328_7 = 0.6

			if var_328_6 < arg_325_1.time_ and arg_325_1.time_ <= var_328_6 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_8 = arg_325_1:FormatText(StoryNameCfg[35].name)

				arg_325_1.leftNameTxt_.text = var_328_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_9 = arg_325_1:GetWordFromCfg(910201080)
				local var_328_10 = arg_325_1:FormatText(var_328_9.content)

				arg_325_1.text_.text = var_328_10

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_11 = 24
				local var_328_12 = utf8.len(var_328_10)
				local var_328_13 = var_328_11 <= 0 and var_328_7 or var_328_7 * (var_328_12 / var_328_11)

				if var_328_13 > 0 and var_328_7 < var_328_13 then
					arg_325_1.talkMaxDuration = var_328_13

					if var_328_13 + var_328_6 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_13 + var_328_6
					end
				end

				arg_325_1.text_.text = var_328_10
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_14 = math.max(var_328_7, arg_325_1.talkMaxDuration)

			if var_328_6 <= arg_325_1.time_ and arg_325_1.time_ < var_328_6 + var_328_14 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_6) / var_328_14

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_6 + var_328_14 and arg_325_1.time_ < var_328_6 + var_328_14 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play910201081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 910201081
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play910201082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1013ui_story"]
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 and arg_329_1.var_.characterEffect1013ui_story == nil then
				arg_329_1.var_.characterEffect1013ui_story = var_332_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_2 = 0.2

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2

				if arg_329_1.var_.characterEffect1013ui_story then
					local var_332_4 = Mathf.Lerp(0, 0.5, var_332_3)

					arg_329_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_329_1.var_.characterEffect1013ui_story.fillRatio = var_332_4
				end
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 and arg_329_1.var_.characterEffect1013ui_story then
				local var_332_5 = 0.5

				arg_329_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_329_1.var_.characterEffect1013ui_story.fillRatio = var_332_5
			end

			local var_332_6 = 0
			local var_332_7 = 0.125

			if var_332_6 < arg_329_1.time_ and arg_329_1.time_ <= var_332_6 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_8 = arg_329_1:FormatText(StoryNameCfg[7].name)

				arg_329_1.leftNameTxt_.text = var_332_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_9 = arg_329_1:GetWordFromCfg(910201081)
				local var_332_10 = arg_329_1:FormatText(var_332_9.content)

				arg_329_1.text_.text = var_332_10

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_11 = 5
				local var_332_12 = utf8.len(var_332_10)
				local var_332_13 = var_332_11 <= 0 and var_332_7 or var_332_7 * (var_332_12 / var_332_11)

				if var_332_13 > 0 and var_332_7 < var_332_13 then
					arg_329_1.talkMaxDuration = var_332_13

					if var_332_13 + var_332_6 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_13 + var_332_6
					end
				end

				arg_329_1.text_.text = var_332_10
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_14 = math.max(var_332_7, arg_329_1.talkMaxDuration)

			if var_332_6 <= arg_329_1.time_ and arg_329_1.time_ < var_332_6 + var_332_14 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_6) / var_332_14

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_6 + var_332_14 and arg_329_1.time_ < var_332_6 + var_332_14 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play910201082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 910201082
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play910201083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.425

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

				local var_336_2 = arg_333_1:GetWordFromCfg(910201082)
				local var_336_3 = arg_333_1:FormatText(var_336_2.content)

				arg_333_1.text_.text = var_336_3

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_4 = 17
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
	Play910201083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 910201083
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play910201084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.475

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

				local var_340_3 = arg_337_1:GetWordFromCfg(910201083)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 19
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
	Play910201084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 910201084
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play910201085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1013ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1013ui_story == nil then
				arg_341_1.var_.characterEffect1013ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.2

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1013ui_story then
					arg_341_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1013ui_story then
				arg_341_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_344_4 = 0

			if var_344_4 < arg_341_1.time_ and arg_341_1.time_ <= var_344_4 + arg_344_0 then
				arg_341_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action452")
			end

			local var_344_5 = 0

			if var_344_5 < arg_341_1.time_ and arg_341_1.time_ <= var_344_5 + arg_344_0 then
				arg_341_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_344_6 = 0
			local var_344_7 = 0.775

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_8 = arg_341_1:FormatText(StoryNameCfg[35].name)

				arg_341_1.leftNameTxt_.text = var_344_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_9 = arg_341_1:GetWordFromCfg(910201084)
				local var_344_10 = arg_341_1:FormatText(var_344_9.content)

				arg_341_1.text_.text = var_344_10

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_11 = 31
				local var_344_12 = utf8.len(var_344_10)
				local var_344_13 = var_344_11 <= 0 and var_344_7 or var_344_7 * (var_344_12 / var_344_11)

				if var_344_13 > 0 and var_344_7 < var_344_13 then
					arg_341_1.talkMaxDuration = var_344_13

					if var_344_13 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_13 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_10
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_14 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_14 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_14

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_14 and arg_341_1.time_ < var_344_6 + var_344_14 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play910201085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 910201085
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play910201086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1013ui_story"]
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 and arg_345_1.var_.characterEffect1013ui_story == nil then
				arg_345_1.var_.characterEffect1013ui_story = var_348_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_2 = 0.2

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2

				if arg_345_1.var_.characterEffect1013ui_story then
					local var_348_4 = Mathf.Lerp(0, 0.5, var_348_3)

					arg_345_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_345_1.var_.characterEffect1013ui_story.fillRatio = var_348_4
				end
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 and arg_345_1.var_.characterEffect1013ui_story then
				local var_348_5 = 0.5

				arg_345_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_345_1.var_.characterEffect1013ui_story.fillRatio = var_348_5
			end

			local var_348_6 = 0
			local var_348_7 = 0.225

			if var_348_6 < arg_345_1.time_ and arg_345_1.time_ <= var_348_6 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_8 = arg_345_1:FormatText(StoryNameCfg[7].name)

				arg_345_1.leftNameTxt_.text = var_348_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_9 = arg_345_1:GetWordFromCfg(910201085)
				local var_348_10 = arg_345_1:FormatText(var_348_9.content)

				arg_345_1.text_.text = var_348_10

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_11 = 9
				local var_348_12 = utf8.len(var_348_10)
				local var_348_13 = var_348_11 <= 0 and var_348_7 or var_348_7 * (var_348_12 / var_348_11)

				if var_348_13 > 0 and var_348_7 < var_348_13 then
					arg_345_1.talkMaxDuration = var_348_13

					if var_348_13 + var_348_6 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_13 + var_348_6
					end
				end

				arg_345_1.text_.text = var_348_10
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_14 = math.max(var_348_7, arg_345_1.talkMaxDuration)

			if var_348_6 <= arg_345_1.time_ and arg_345_1.time_ < var_348_6 + var_348_14 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_6) / var_348_14

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_6 + var_348_14 and arg_345_1.time_ < var_348_6 + var_348_14 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play910201086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 910201086
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play910201087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 0.075

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, false)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_2 = arg_349_1:GetWordFromCfg(910201086)
				local var_352_3 = arg_349_1:FormatText(var_352_2.content)

				arg_349_1.text_.text = var_352_3

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_4 = 3
				local var_352_5 = utf8.len(var_352_3)
				local var_352_6 = var_352_4 <= 0 and var_352_1 or var_352_1 * (var_352_5 / var_352_4)

				if var_352_6 > 0 and var_352_1 < var_352_6 then
					arg_349_1.talkMaxDuration = var_352_6

					if var_352_6 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_6 + var_352_0
					end
				end

				arg_349_1.text_.text = var_352_3
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_7 = math.max(var_352_1, arg_349_1.talkMaxDuration)

			if var_352_0 <= arg_349_1.time_ and arg_349_1.time_ < var_352_0 + var_352_7 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_0) / var_352_7

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_0 + var_352_7 and arg_349_1.time_ < var_352_0 + var_352_7 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play910201087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 910201087
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play910201088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1013ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.characterEffect1013ui_story == nil then
				arg_353_1.var_.characterEffect1013ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.2

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect1013ui_story then
					arg_353_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.characterEffect1013ui_story then
				arg_353_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_356_4 = 0

			if var_356_4 < arg_353_1.time_ and arg_353_1.time_ <= var_356_4 + arg_356_0 then
				arg_353_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action425")
			end

			local var_356_5 = 0

			if var_356_5 < arg_353_1.time_ and arg_353_1.time_ <= var_356_5 + arg_356_0 then
				arg_353_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_356_6 = 0
			local var_356_7 = 0.35

			if var_356_6 < arg_353_1.time_ and arg_353_1.time_ <= var_356_6 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_8 = arg_353_1:FormatText(StoryNameCfg[35].name)

				arg_353_1.leftNameTxt_.text = var_356_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_9 = arg_353_1:GetWordFromCfg(910201087)
				local var_356_10 = arg_353_1:FormatText(var_356_9.content)

				arg_353_1.text_.text = var_356_10

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_11 = 14
				local var_356_12 = utf8.len(var_356_10)
				local var_356_13 = var_356_11 <= 0 and var_356_7 or var_356_7 * (var_356_12 / var_356_11)

				if var_356_13 > 0 and var_356_7 < var_356_13 then
					arg_353_1.talkMaxDuration = var_356_13

					if var_356_13 + var_356_6 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_13 + var_356_6
					end
				end

				arg_353_1.text_.text = var_356_10
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_14 = math.max(var_356_7, arg_353_1.talkMaxDuration)

			if var_356_6 <= arg_353_1.time_ and arg_353_1.time_ < var_356_6 + var_356_14 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_6) / var_356_14

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_6 + var_356_14 and arg_353_1.time_ < var_356_6 + var_356_14 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play910201088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 910201088
		arg_357_1.duration_ = 5

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play910201089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action454")
			end

			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				arg_357_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_360_2 = 0
			local var_360_3 = 0.65

			if var_360_2 < arg_357_1.time_ and arg_357_1.time_ <= var_360_2 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_4 = arg_357_1:FormatText(StoryNameCfg[35].name)

				arg_357_1.leftNameTxt_.text = var_360_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_5 = arg_357_1:GetWordFromCfg(910201088)
				local var_360_6 = arg_357_1:FormatText(var_360_5.content)

				arg_357_1.text_.text = var_360_6

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_7 = 26
				local var_360_8 = utf8.len(var_360_6)
				local var_360_9 = var_360_7 <= 0 and var_360_3 or var_360_3 * (var_360_8 / var_360_7)

				if var_360_9 > 0 and var_360_3 < var_360_9 then
					arg_357_1.talkMaxDuration = var_360_9

					if var_360_9 + var_360_2 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_9 + var_360_2
					end
				end

				arg_357_1.text_.text = var_360_6
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)
				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_10 = math.max(var_360_3, arg_357_1.talkMaxDuration)

			if var_360_2 <= arg_357_1.time_ and arg_357_1.time_ < var_360_2 + var_360_10 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_2) / var_360_10

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_2 + var_360_10 and arg_357_1.time_ < var_360_2 + var_360_10 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play910201089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 910201089
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play910201090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1013ui_story"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.characterEffect1013ui_story == nil then
				arg_361_1.var_.characterEffect1013ui_story = var_364_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_2 = 0.2

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.characterEffect1013ui_story then
					local var_364_4 = Mathf.Lerp(0, 0.5, var_364_3)

					arg_361_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_361_1.var_.characterEffect1013ui_story.fillRatio = var_364_4
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect1013ui_story then
				local var_364_5 = 0.5

				arg_361_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_361_1.var_.characterEffect1013ui_story.fillRatio = var_364_5
			end

			local var_364_6 = 0
			local var_364_7 = 0.1

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

				local var_364_9 = arg_361_1:GetWordFromCfg(910201089)
				local var_364_10 = arg_361_1:FormatText(var_364_9.content)

				arg_361_1.text_.text = var_364_10

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_11 = 4
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
	Play910201090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 910201090
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play910201091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1013ui_story"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos1013ui_story = var_368_0.localPosition
			end

			local var_368_2 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2
				local var_368_4 = Vector3.New(0, 100, 0)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1013ui_story, var_368_4, var_368_3)

				local var_368_5 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_5.x, var_368_5.y, var_368_5.z)

				local var_368_6 = var_368_0.localEulerAngles

				var_368_6.z = 0
				var_368_6.x = 0
				var_368_0.localEulerAngles = var_368_6
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(0, 100, 0)

				local var_368_7 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_7.x, var_368_7.y, var_368_7.z)

				local var_368_8 = var_368_0.localEulerAngles

				var_368_8.z = 0
				var_368_8.x = 0
				var_368_0.localEulerAngles = var_368_8
			end

			local var_368_9 = 0
			local var_368_10 = 0.825

			if var_368_9 < arg_365_1.time_ and arg_365_1.time_ <= var_368_9 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, false)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_11 = arg_365_1:GetWordFromCfg(910201090)
				local var_368_12 = arg_365_1:FormatText(var_368_11.content)

				arg_365_1.text_.text = var_368_12

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_13 = 33
				local var_368_14 = utf8.len(var_368_12)
				local var_368_15 = var_368_13 <= 0 and var_368_10 or var_368_10 * (var_368_14 / var_368_13)

				if var_368_15 > 0 and var_368_10 < var_368_15 then
					arg_365_1.talkMaxDuration = var_368_15

					if var_368_15 + var_368_9 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_15 + var_368_9
					end
				end

				arg_365_1.text_.text = var_368_12
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_16 = math.max(var_368_10, arg_365_1.talkMaxDuration)

			if var_368_9 <= arg_365_1.time_ and arg_365_1.time_ < var_368_9 + var_368_16 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_9) / var_368_16

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_9 + var_368_16 and arg_365_1.time_ < var_368_9 + var_368_16 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play910201091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 910201091
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play910201092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.2

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[7].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(910201091)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 8
				local var_372_6 = utf8.len(var_372_4)
				local var_372_7 = var_372_5 <= 0 and var_372_1 or var_372_1 * (var_372_6 / var_372_5)

				if var_372_7 > 0 and var_372_1 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_4
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_8 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_8 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_8

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_8 and arg_369_1.time_ < var_372_0 + var_372_8 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play910201092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 910201092
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play910201093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.475

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_2 = arg_373_1:FormatText(StoryNameCfg[7].name)

				arg_373_1.leftNameTxt_.text = var_376_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_3 = arg_373_1:GetWordFromCfg(910201092)
				local var_376_4 = arg_373_1:FormatText(var_376_3.content)

				arg_373_1.text_.text = var_376_4

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_5 = 19
				local var_376_6 = utf8.len(var_376_4)
				local var_376_7 = var_376_5 <= 0 and var_376_1 or var_376_1 * (var_376_6 / var_376_5)

				if var_376_7 > 0 and var_376_1 < var_376_7 then
					arg_373_1.talkMaxDuration = var_376_7

					if var_376_7 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_7 + var_376_0
					end
				end

				arg_373_1.text_.text = var_376_4
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_8 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_8 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_8

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_8 and arg_373_1.time_ < var_376_0 + var_376_8 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play910201093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 910201093
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play910201094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 0.625

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

				local var_380_2 = arg_377_1:GetWordFromCfg(910201093)
				local var_380_3 = arg_377_1:FormatText(var_380_2.content)

				arg_377_1.text_.text = var_380_3

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_4 = 25
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
	Play910201094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 910201094
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play910201095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = "1080ui_story"

			if arg_381_1.actors_[var_384_0] == nil then
				local var_384_1 = Object.Instantiate(Asset.Load("Char/" .. var_384_0), arg_381_1.stage_.transform)

				var_384_1.name = var_384_0
				var_384_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_381_1.actors_[var_384_0] = var_384_1

				local var_384_2 = var_384_1:GetComponentInChildren(typeof(CharacterEffect))

				var_384_2.enabled = true

				local var_384_3 = GameObjectTools.GetOrAddComponent(var_384_1, typeof(DynamicBoneHelper))

				if var_384_3 then
					var_384_3:EnableDynamicBone(false)
				end

				arg_381_1:ShowWeapon(var_384_2.transform, false)

				arg_381_1.var_[var_384_0 .. "Animator"] = var_384_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_381_1.var_[var_384_0 .. "Animator"].applyRootMotion = true
				arg_381_1.var_[var_384_0 .. "LipSync"] = var_384_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_384_4 = arg_381_1.actors_["1080ui_story"].transform
			local var_384_5 = 0

			if var_384_5 < arg_381_1.time_ and arg_381_1.time_ <= var_384_5 + arg_384_0 then
				arg_381_1.var_.moveOldPos1080ui_story = var_384_4.localPosition
			end

			local var_384_6 = 0.001

			if var_384_5 <= arg_381_1.time_ and arg_381_1.time_ < var_384_5 + var_384_6 then
				local var_384_7 = (arg_381_1.time_ - var_384_5) / var_384_6
				local var_384_8 = Vector3.New(0, -1.01, -6.05)

				var_384_4.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos1080ui_story, var_384_8, var_384_7)

				local var_384_9 = manager.ui.mainCamera.transform.position - var_384_4.position

				var_384_4.forward = Vector3.New(var_384_9.x, var_384_9.y, var_384_9.z)

				local var_384_10 = var_384_4.localEulerAngles

				var_384_10.z = 0
				var_384_10.x = 0
				var_384_4.localEulerAngles = var_384_10
			end

			if arg_381_1.time_ >= var_384_5 + var_384_6 and arg_381_1.time_ < var_384_5 + var_384_6 + arg_384_0 then
				var_384_4.localPosition = Vector3.New(0, -1.01, -6.05)

				local var_384_11 = manager.ui.mainCamera.transform.position - var_384_4.position

				var_384_4.forward = Vector3.New(var_384_11.x, var_384_11.y, var_384_11.z)

				local var_384_12 = var_384_4.localEulerAngles

				var_384_12.z = 0
				var_384_12.x = 0
				var_384_4.localEulerAngles = var_384_12
			end

			local var_384_13 = 0

			if var_384_13 < arg_381_1.time_ and arg_381_1.time_ <= var_384_13 + arg_384_0 then
				arg_381_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action6_1")
			end

			local var_384_14 = 0

			if var_384_14 < arg_381_1.time_ and arg_381_1.time_ <= var_384_14 + arg_384_0 then
				arg_381_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_384_15 = arg_381_1.actors_["1080ui_story"]
			local var_384_16 = 0

			if var_384_16 < arg_381_1.time_ and arg_381_1.time_ <= var_384_16 + arg_384_0 and arg_381_1.var_.characterEffect1080ui_story == nil then
				arg_381_1.var_.characterEffect1080ui_story = var_384_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_17 = 0.2

			if var_384_16 <= arg_381_1.time_ and arg_381_1.time_ < var_384_16 + var_384_17 then
				local var_384_18 = (arg_381_1.time_ - var_384_16) / var_384_17

				if arg_381_1.var_.characterEffect1080ui_story then
					arg_381_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_381_1.time_ >= var_384_16 + var_384_17 and arg_381_1.time_ < var_384_16 + var_384_17 + arg_384_0 and arg_381_1.var_.characterEffect1080ui_story then
				arg_381_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_384_19 = 0
			local var_384_20 = 0.125

			if var_384_19 < arg_381_1.time_ and arg_381_1.time_ <= var_384_19 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_21 = arg_381_1:FormatText(StoryNameCfg[55].name)

				arg_381_1.leftNameTxt_.text = var_384_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_22 = arg_381_1:GetWordFromCfg(910201094)
				local var_384_23 = arg_381_1:FormatText(var_384_22.content)

				arg_381_1.text_.text = var_384_23

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_24 = 5
				local var_384_25 = utf8.len(var_384_23)
				local var_384_26 = var_384_24 <= 0 and var_384_20 or var_384_20 * (var_384_25 / var_384_24)

				if var_384_26 > 0 and var_384_20 < var_384_26 then
					arg_381_1.talkMaxDuration = var_384_26

					if var_384_26 + var_384_19 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_26 + var_384_19
					end
				end

				arg_381_1.text_.text = var_384_23
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_27 = math.max(var_384_20, arg_381_1.talkMaxDuration)

			if var_384_19 <= arg_381_1.time_ and arg_381_1.time_ < var_384_19 + var_384_27 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_19) / var_384_27

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_19 + var_384_27 and arg_381_1.time_ < var_384_19 + var_384_27 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play910201095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 910201095
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play910201096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1080ui_story"]
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 and arg_385_1.var_.characterEffect1080ui_story == nil then
				arg_385_1.var_.characterEffect1080ui_story = var_388_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_2 = 0.2

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2

				if arg_385_1.var_.characterEffect1080ui_story then
					local var_388_4 = Mathf.Lerp(0, 0.5, var_388_3)

					arg_385_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_385_1.var_.characterEffect1080ui_story.fillRatio = var_388_4
				end
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 and arg_385_1.var_.characterEffect1080ui_story then
				local var_388_5 = 0.5

				arg_385_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_385_1.var_.characterEffect1080ui_story.fillRatio = var_388_5
			end

			local var_388_6 = 0
			local var_388_7 = 0.25

			if var_388_6 < arg_385_1.time_ and arg_385_1.time_ <= var_388_6 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_8 = arg_385_1:FormatText(StoryNameCfg[7].name)

				arg_385_1.leftNameTxt_.text = var_388_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_9 = arg_385_1:GetWordFromCfg(910201095)
				local var_388_10 = arg_385_1:FormatText(var_388_9.content)

				arg_385_1.text_.text = var_388_10

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_11 = 10
				local var_388_12 = utf8.len(var_388_10)
				local var_388_13 = var_388_11 <= 0 and var_388_7 or var_388_7 * (var_388_12 / var_388_11)

				if var_388_13 > 0 and var_388_7 < var_388_13 then
					arg_385_1.talkMaxDuration = var_388_13

					if var_388_13 + var_388_6 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_13 + var_388_6
					end
				end

				arg_385_1.text_.text = var_388_10
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_14 = math.max(var_388_7, arg_385_1.talkMaxDuration)

			if var_388_6 <= arg_385_1.time_ and arg_385_1.time_ < var_388_6 + var_388_14 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_6) / var_388_14

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_6 + var_388_14 and arg_385_1.time_ < var_388_6 + var_388_14 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play910201096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 910201096
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play910201097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1080ui_story"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.characterEffect1080ui_story == nil then
				arg_389_1.var_.characterEffect1080ui_story = var_392_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_2 = 0.2

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.characterEffect1080ui_story then
					arg_389_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect1080ui_story then
				arg_389_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_392_4 = 0

			if var_392_4 < arg_389_1.time_ and arg_389_1.time_ <= var_392_4 + arg_392_0 then
				arg_389_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080actionlink/1080action464")
			end

			local var_392_5 = 0

			if var_392_5 < arg_389_1.time_ and arg_389_1.time_ <= var_392_5 + arg_392_0 then
				arg_389_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_392_6 = 0
			local var_392_7 = 0.275

			if var_392_6 < arg_389_1.time_ and arg_389_1.time_ <= var_392_6 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_8 = arg_389_1:FormatText(StoryNameCfg[55].name)

				arg_389_1.leftNameTxt_.text = var_392_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_9 = arg_389_1:GetWordFromCfg(910201096)
				local var_392_10 = arg_389_1:FormatText(var_392_9.content)

				arg_389_1.text_.text = var_392_10

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_11 = 11
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
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_14 = math.max(var_392_7, arg_389_1.talkMaxDuration)

			if var_392_6 <= arg_389_1.time_ and arg_389_1.time_ < var_392_6 + var_392_14 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_6) / var_392_14

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_6 + var_392_14 and arg_389_1.time_ < var_392_6 + var_392_14 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play910201097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 910201097
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play910201098(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1080ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect1080ui_story == nil then
				arg_393_1.var_.characterEffect1080ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.2

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect1080ui_story then
					local var_396_4 = Mathf.Lerp(0, 0.5, var_396_3)

					arg_393_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1080ui_story.fillRatio = var_396_4
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect1080ui_story then
				local var_396_5 = 0.5

				arg_393_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1080ui_story.fillRatio = var_396_5
			end

			local var_396_6 = 0
			local var_396_7 = 0.3

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

				local var_396_9 = arg_393_1:GetWordFromCfg(910201097)
				local var_396_10 = arg_393_1:FormatText(var_396_9.content)

				arg_393_1.text_.text = var_396_10

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_11 = 12
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
	Play910201098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 910201098
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play910201099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1080ui_story"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.characterEffect1080ui_story == nil then
				arg_397_1.var_.characterEffect1080ui_story = var_400_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_2 = 0.2

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.characterEffect1080ui_story then
					arg_397_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.characterEffect1080ui_story then
				arg_397_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_400_4 = 0

			if var_400_4 < arg_397_1.time_ and arg_397_1.time_ <= var_400_4 + arg_400_0 then
				arg_397_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080actionlink/1080action446")
			end

			local var_400_5 = 0

			if var_400_5 < arg_397_1.time_ and arg_397_1.time_ <= var_400_5 + arg_400_0 then
				arg_397_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_400_6 = 0
			local var_400_7 = 0.1

			if var_400_6 < arg_397_1.time_ and arg_397_1.time_ <= var_400_6 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_8 = arg_397_1:FormatText(StoryNameCfg[55].name)

				arg_397_1.leftNameTxt_.text = var_400_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_9 = arg_397_1:GetWordFromCfg(910201098)
				local var_400_10 = arg_397_1:FormatText(var_400_9.content)

				arg_397_1.text_.text = var_400_10

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_11 = 4
				local var_400_12 = utf8.len(var_400_10)
				local var_400_13 = var_400_11 <= 0 and var_400_7 or var_400_7 * (var_400_12 / var_400_11)

				if var_400_13 > 0 and var_400_7 < var_400_13 then
					arg_397_1.talkMaxDuration = var_400_13

					if var_400_13 + var_400_6 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_13 + var_400_6
					end
				end

				arg_397_1.text_.text = var_400_10
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_14 = math.max(var_400_7, arg_397_1.talkMaxDuration)

			if var_400_6 <= arg_397_1.time_ and arg_397_1.time_ < var_400_6 + var_400_14 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_6) / var_400_14

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_6 + var_400_14 and arg_397_1.time_ < var_400_6 + var_400_14 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play910201099 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 910201099
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play910201100(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1080ui_story"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and arg_401_1.var_.characterEffect1080ui_story == nil then
				arg_401_1.var_.characterEffect1080ui_story = var_404_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_2 = 0.2

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.characterEffect1080ui_story then
					local var_404_4 = Mathf.Lerp(0, 0.5, var_404_3)

					arg_401_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_401_1.var_.characterEffect1080ui_story.fillRatio = var_404_4
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and arg_401_1.var_.characterEffect1080ui_story then
				local var_404_5 = 0.5

				arg_401_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_401_1.var_.characterEffect1080ui_story.fillRatio = var_404_5
			end

			local var_404_6 = 0
			local var_404_7 = 0.45

			if var_404_6 < arg_401_1.time_ and arg_401_1.time_ <= var_404_6 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_8 = arg_401_1:FormatText(StoryNameCfg[7].name)

				arg_401_1.leftNameTxt_.text = var_404_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_9 = arg_401_1:GetWordFromCfg(910201099)
				local var_404_10 = arg_401_1:FormatText(var_404_9.content)

				arg_401_1.text_.text = var_404_10

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_11 = 18
				local var_404_12 = utf8.len(var_404_10)
				local var_404_13 = var_404_11 <= 0 and var_404_7 or var_404_7 * (var_404_12 / var_404_11)

				if var_404_13 > 0 and var_404_7 < var_404_13 then
					arg_401_1.talkMaxDuration = var_404_13

					if var_404_13 + var_404_6 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_13 + var_404_6
					end
				end

				arg_401_1.text_.text = var_404_10
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_14 = math.max(var_404_7, arg_401_1.talkMaxDuration)

			if var_404_6 <= arg_401_1.time_ and arg_401_1.time_ < var_404_6 + var_404_14 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_6) / var_404_14

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_6 + var_404_14 and arg_401_1.time_ < var_404_6 + var_404_14 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play910201100 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 910201100
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play910201101(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1080ui_story"]
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 and arg_405_1.var_.characterEffect1080ui_story == nil then
				arg_405_1.var_.characterEffect1080ui_story = var_408_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_2 = 0.2

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2

				if arg_405_1.var_.characterEffect1080ui_story then
					arg_405_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 and arg_405_1.var_.characterEffect1080ui_story then
				arg_405_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_408_4 = 0

			if var_408_4 < arg_405_1.time_ and arg_405_1.time_ <= var_408_4 + arg_408_0 then
				arg_405_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080actionlink/1080action464")
			end

			local var_408_5 = 0

			if var_408_5 < arg_405_1.time_ and arg_405_1.time_ <= var_408_5 + arg_408_0 then
				arg_405_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_408_6 = 0
			local var_408_7 = 0.275

			if var_408_6 < arg_405_1.time_ and arg_405_1.time_ <= var_408_6 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_8 = arg_405_1:FormatText(StoryNameCfg[55].name)

				arg_405_1.leftNameTxt_.text = var_408_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_9 = arg_405_1:GetWordFromCfg(910201100)
				local var_408_10 = arg_405_1:FormatText(var_408_9.content)

				arg_405_1.text_.text = var_408_10

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_11 = 11
				local var_408_12 = utf8.len(var_408_10)
				local var_408_13 = var_408_11 <= 0 and var_408_7 or var_408_7 * (var_408_12 / var_408_11)

				if var_408_13 > 0 and var_408_7 < var_408_13 then
					arg_405_1.talkMaxDuration = var_408_13

					if var_408_13 + var_408_6 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_13 + var_408_6
					end
				end

				arg_405_1.text_.text = var_408_10
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_14 = math.max(var_408_7, arg_405_1.talkMaxDuration)

			if var_408_6 <= arg_405_1.time_ and arg_405_1.time_ < var_408_6 + var_408_14 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_6) / var_408_14

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_6 + var_408_14 and arg_405_1.time_ < var_408_6 + var_408_14 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play910201101 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 910201101
		arg_409_1.duration_ = 5

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play910201102(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1080ui_story"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 and arg_409_1.var_.characterEffect1080ui_story == nil then
				arg_409_1.var_.characterEffect1080ui_story = var_412_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_2 = 0.2

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2

				if arg_409_1.var_.characterEffect1080ui_story then
					local var_412_4 = Mathf.Lerp(0, 0.5, var_412_3)

					arg_409_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_409_1.var_.characterEffect1080ui_story.fillRatio = var_412_4
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 and arg_409_1.var_.characterEffect1080ui_story then
				local var_412_5 = 0.5

				arg_409_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_409_1.var_.characterEffect1080ui_story.fillRatio = var_412_5
			end

			local var_412_6 = 0
			local var_412_7 = 0.075

			if var_412_6 < arg_409_1.time_ and arg_409_1.time_ <= var_412_6 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_8 = arg_409_1:FormatText(StoryNameCfg[7].name)

				arg_409_1.leftNameTxt_.text = var_412_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_9 = arg_409_1:GetWordFromCfg(910201101)
				local var_412_10 = arg_409_1:FormatText(var_412_9.content)

				arg_409_1.text_.text = var_412_10

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_11 = 3
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
				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_14 = math.max(var_412_7, arg_409_1.talkMaxDuration)

			if var_412_6 <= arg_409_1.time_ and arg_409_1.time_ < var_412_6 + var_412_14 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_6) / var_412_14

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_6 + var_412_14 and arg_409_1.time_ < var_412_6 + var_412_14 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play910201102 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 910201102
		arg_413_1.duration_ = 5

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play910201103(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1080ui_story"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.characterEffect1080ui_story == nil then
				arg_413_1.var_.characterEffect1080ui_story = var_416_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_2 = 0.2

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.characterEffect1080ui_story then
					arg_413_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.characterEffect1080ui_story then
				arg_413_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_416_4 = 0

			if var_416_4 < arg_413_1.time_ and arg_413_1.time_ <= var_416_4 + arg_416_0 then
				arg_413_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_416_5 = 0
			local var_416_6 = 0.175

			if var_416_5 < arg_413_1.time_ and arg_413_1.time_ <= var_416_5 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_7 = arg_413_1:FormatText(StoryNameCfg[55].name)

				arg_413_1.leftNameTxt_.text = var_416_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_8 = arg_413_1:GetWordFromCfg(910201102)
				local var_416_9 = arg_413_1:FormatText(var_416_8.content)

				arg_413_1.text_.text = var_416_9

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_10 = 7
				local var_416_11 = utf8.len(var_416_9)
				local var_416_12 = var_416_10 <= 0 and var_416_6 or var_416_6 * (var_416_11 / var_416_10)

				if var_416_12 > 0 and var_416_6 < var_416_12 then
					arg_413_1.talkMaxDuration = var_416_12

					if var_416_12 + var_416_5 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_12 + var_416_5
					end
				end

				arg_413_1.text_.text = var_416_9
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_13 = math.max(var_416_6, arg_413_1.talkMaxDuration)

			if var_416_5 <= arg_413_1.time_ and arg_413_1.time_ < var_416_5 + var_416_13 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_5) / var_416_13

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_5 + var_416_13 and arg_413_1.time_ < var_416_5 + var_416_13 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play910201103 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 910201103
		arg_417_1.duration_ = 5

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play910201104(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1080ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect1080ui_story == nil then
				arg_417_1.var_.characterEffect1080ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.2

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect1080ui_story then
					local var_420_4 = Mathf.Lerp(0, 0.5, var_420_3)

					arg_417_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1080ui_story.fillRatio = var_420_4
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect1080ui_story then
				local var_420_5 = 0.5

				arg_417_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1080ui_story.fillRatio = var_420_5
			end

			local var_420_6 = 0
			local var_420_7 = 0.375

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

				local var_420_9 = arg_417_1:GetWordFromCfg(910201103)
				local var_420_10 = arg_417_1:FormatText(var_420_9.content)

				arg_417_1.text_.text = var_420_10

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_11 = 15
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
	Play910201104 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 910201104
		arg_421_1.duration_ = 5

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play910201105(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1080ui_story"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 and arg_421_1.var_.characterEffect1080ui_story == nil then
				arg_421_1.var_.characterEffect1080ui_story = var_424_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_2 = 0.2

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2

				if arg_421_1.var_.characterEffect1080ui_story then
					arg_421_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 and arg_421_1.var_.characterEffect1080ui_story then
				arg_421_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_424_4 = 0

			if var_424_4 < arg_421_1.time_ and arg_421_1.time_ <= var_424_4 + arg_424_0 then
				arg_421_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080actionlink/1080action442")
			end

			local var_424_5 = 0

			if var_424_5 < arg_421_1.time_ and arg_421_1.time_ <= var_424_5 + arg_424_0 then
				arg_421_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_424_6 = 0
			local var_424_7 = 0.3

			if var_424_6 < arg_421_1.time_ and arg_421_1.time_ <= var_424_6 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_8 = arg_421_1:FormatText(StoryNameCfg[55].name)

				arg_421_1.leftNameTxt_.text = var_424_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_9 = arg_421_1:GetWordFromCfg(910201104)
				local var_424_10 = arg_421_1:FormatText(var_424_9.content)

				arg_421_1.text_.text = var_424_10

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_11 = 12
				local var_424_12 = utf8.len(var_424_10)
				local var_424_13 = var_424_11 <= 0 and var_424_7 or var_424_7 * (var_424_12 / var_424_11)

				if var_424_13 > 0 and var_424_7 < var_424_13 then
					arg_421_1.talkMaxDuration = var_424_13

					if var_424_13 + var_424_6 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_13 + var_424_6
					end
				end

				arg_421_1.text_.text = var_424_10
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_14 = math.max(var_424_7, arg_421_1.talkMaxDuration)

			if var_424_6 <= arg_421_1.time_ and arg_421_1.time_ < var_424_6 + var_424_14 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_6) / var_424_14

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_6 + var_424_14 and arg_421_1.time_ < var_424_6 + var_424_14 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play910201105 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 910201105
		arg_425_1.duration_ = 5

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play910201106(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1080ui_story"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.characterEffect1080ui_story == nil then
				arg_425_1.var_.characterEffect1080ui_story = var_428_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_2 = 0.2

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.characterEffect1080ui_story then
					local var_428_4 = Mathf.Lerp(0, 0.5, var_428_3)

					arg_425_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_425_1.var_.characterEffect1080ui_story.fillRatio = var_428_4
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.characterEffect1080ui_story then
				local var_428_5 = 0.5

				arg_425_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_425_1.var_.characterEffect1080ui_story.fillRatio = var_428_5
			end

			local var_428_6 = 0
			local var_428_7 = 0.675

			if var_428_6 < arg_425_1.time_ and arg_425_1.time_ <= var_428_6 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_8 = arg_425_1:FormatText(StoryNameCfg[7].name)

				arg_425_1.leftNameTxt_.text = var_428_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_9 = arg_425_1:GetWordFromCfg(910201105)
				local var_428_10 = arg_425_1:FormatText(var_428_9.content)

				arg_425_1.text_.text = var_428_10

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_11 = 27
				local var_428_12 = utf8.len(var_428_10)
				local var_428_13 = var_428_11 <= 0 and var_428_7 or var_428_7 * (var_428_12 / var_428_11)

				if var_428_13 > 0 and var_428_7 < var_428_13 then
					arg_425_1.talkMaxDuration = var_428_13

					if var_428_13 + var_428_6 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_13 + var_428_6
					end
				end

				arg_425_1.text_.text = var_428_10
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_14 = math.max(var_428_7, arg_425_1.talkMaxDuration)

			if var_428_6 <= arg_425_1.time_ and arg_425_1.time_ < var_428_6 + var_428_14 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_6) / var_428_14

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_6 + var_428_14 and arg_425_1.time_ < var_428_6 + var_428_14 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play910201106 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 910201106
		arg_429_1.duration_ = 5

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play910201107(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1080ui_story"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.characterEffect1080ui_story == nil then
				arg_429_1.var_.characterEffect1080ui_story = var_432_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_2 = 0.2

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.characterEffect1080ui_story then
					arg_429_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.characterEffect1080ui_story then
				arg_429_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_432_4 = 0

			if var_432_4 < arg_429_1.time_ and arg_429_1.time_ <= var_432_4 + arg_432_0 then
				arg_429_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080actionlink/1080action424")
			end

			local var_432_5 = 0

			if var_432_5 < arg_429_1.time_ and arg_429_1.time_ <= var_432_5 + arg_432_0 then
				arg_429_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_432_6 = 0
			local var_432_7 = 0.125

			if var_432_6 < arg_429_1.time_ and arg_429_1.time_ <= var_432_6 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_8 = arg_429_1:FormatText(StoryNameCfg[55].name)

				arg_429_1.leftNameTxt_.text = var_432_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_9 = arg_429_1:GetWordFromCfg(910201106)
				local var_432_10 = arg_429_1:FormatText(var_432_9.content)

				arg_429_1.text_.text = var_432_10

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_11 = 5
				local var_432_12 = utf8.len(var_432_10)
				local var_432_13 = var_432_11 <= 0 and var_432_7 or var_432_7 * (var_432_12 / var_432_11)

				if var_432_13 > 0 and var_432_7 < var_432_13 then
					arg_429_1.talkMaxDuration = var_432_13

					if var_432_13 + var_432_6 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_13 + var_432_6
					end
				end

				arg_429_1.text_.text = var_432_10
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_14 = math.max(var_432_7, arg_429_1.talkMaxDuration)

			if var_432_6 <= arg_429_1.time_ and arg_429_1.time_ < var_432_6 + var_432_14 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_6) / var_432_14

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_6 + var_432_14 and arg_429_1.time_ < var_432_6 + var_432_14 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play910201107 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 910201107
		arg_433_1.duration_ = 5

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play910201108(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1080ui_story"]
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 and arg_433_1.var_.characterEffect1080ui_story == nil then
				arg_433_1.var_.characterEffect1080ui_story = var_436_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_2 = 0.2

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2

				if arg_433_1.var_.characterEffect1080ui_story then
					local var_436_4 = Mathf.Lerp(0, 0.5, var_436_3)

					arg_433_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_433_1.var_.characterEffect1080ui_story.fillRatio = var_436_4
				end
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 and arg_433_1.var_.characterEffect1080ui_story then
				local var_436_5 = 0.5

				arg_433_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_433_1.var_.characterEffect1080ui_story.fillRatio = var_436_5
			end

			local var_436_6 = 0
			local var_436_7 = 0.425

			if var_436_6 < arg_433_1.time_ and arg_433_1.time_ <= var_436_6 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_8 = arg_433_1:FormatText(StoryNameCfg[7].name)

				arg_433_1.leftNameTxt_.text = var_436_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_9 = arg_433_1:GetWordFromCfg(910201107)
				local var_436_10 = arg_433_1:FormatText(var_436_9.content)

				arg_433_1.text_.text = var_436_10

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_11 = 17
				local var_436_12 = utf8.len(var_436_10)
				local var_436_13 = var_436_11 <= 0 and var_436_7 or var_436_7 * (var_436_12 / var_436_11)

				if var_436_13 > 0 and var_436_7 < var_436_13 then
					arg_433_1.talkMaxDuration = var_436_13

					if var_436_13 + var_436_6 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_13 + var_436_6
					end
				end

				arg_433_1.text_.text = var_436_10
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)
				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_14 = math.max(var_436_7, arg_433_1.talkMaxDuration)

			if var_436_6 <= arg_433_1.time_ and arg_433_1.time_ < var_436_6 + var_436_14 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_6) / var_436_14

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_6 + var_436_14 and arg_433_1.time_ < var_436_6 + var_436_14 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play910201108 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 910201108
		arg_437_1.duration_ = 5

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play910201109(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1080ui_story"]
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 and arg_437_1.var_.characterEffect1080ui_story == nil then
				arg_437_1.var_.characterEffect1080ui_story = var_440_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_2 = 0.2

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2

				if arg_437_1.var_.characterEffect1080ui_story then
					arg_437_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 and arg_437_1.var_.characterEffect1080ui_story then
				arg_437_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_440_4 = 0

			if var_440_4 < arg_437_1.time_ and arg_437_1.time_ <= var_440_4 + arg_440_0 then
				arg_437_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080actionlink/1080action446")
			end

			local var_440_5 = 0

			if var_440_5 < arg_437_1.time_ and arg_437_1.time_ <= var_440_5 + arg_440_0 then
				arg_437_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_440_6 = 0
			local var_440_7 = 0.4

			if var_440_6 < arg_437_1.time_ and arg_437_1.time_ <= var_440_6 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_8 = arg_437_1:FormatText(StoryNameCfg[55].name)

				arg_437_1.leftNameTxt_.text = var_440_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_9 = arg_437_1:GetWordFromCfg(910201108)
				local var_440_10 = arg_437_1:FormatText(var_440_9.content)

				arg_437_1.text_.text = var_440_10

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_11 = 16
				local var_440_12 = utf8.len(var_440_10)
				local var_440_13 = var_440_11 <= 0 and var_440_7 or var_440_7 * (var_440_12 / var_440_11)

				if var_440_13 > 0 and var_440_7 < var_440_13 then
					arg_437_1.talkMaxDuration = var_440_13

					if var_440_13 + var_440_6 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_13 + var_440_6
					end
				end

				arg_437_1.text_.text = var_440_10
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)
				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_14 = math.max(var_440_7, arg_437_1.talkMaxDuration)

			if var_440_6 <= arg_437_1.time_ and arg_437_1.time_ < var_440_6 + var_440_14 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_6) / var_440_14

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_6 + var_440_14 and arg_437_1.time_ < var_440_6 + var_440_14 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play910201109 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 910201109
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play910201110(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["1080ui_story"]
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 and arg_441_1.var_.characterEffect1080ui_story == nil then
				arg_441_1.var_.characterEffect1080ui_story = var_444_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_2 = 0.2

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2

				if arg_441_1.var_.characterEffect1080ui_story then
					local var_444_4 = Mathf.Lerp(0, 0.5, var_444_3)

					arg_441_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_441_1.var_.characterEffect1080ui_story.fillRatio = var_444_4
				end
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 and arg_441_1.var_.characterEffect1080ui_story then
				local var_444_5 = 0.5

				arg_441_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_441_1.var_.characterEffect1080ui_story.fillRatio = var_444_5
			end

			local var_444_6 = 0
			local var_444_7 = 0.8

			if var_444_6 < arg_441_1.time_ and arg_441_1.time_ <= var_444_6 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, false)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_8 = arg_441_1:GetWordFromCfg(910201109)
				local var_444_9 = arg_441_1:FormatText(var_444_8.content)

				arg_441_1.text_.text = var_444_9

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_10 = 32
				local var_444_11 = utf8.len(var_444_9)
				local var_444_12 = var_444_10 <= 0 and var_444_7 or var_444_7 * (var_444_11 / var_444_10)

				if var_444_12 > 0 and var_444_7 < var_444_12 then
					arg_441_1.talkMaxDuration = var_444_12

					if var_444_12 + var_444_6 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_12 + var_444_6
					end
				end

				arg_441_1.text_.text = var_444_9
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)
				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_13 = math.max(var_444_7, arg_441_1.talkMaxDuration)

			if var_444_6 <= arg_441_1.time_ and arg_441_1.time_ < var_444_6 + var_444_13 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_6) / var_444_13

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_6 + var_444_13 and arg_441_1.time_ < var_444_6 + var_444_13 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play910201110 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 910201110
		arg_445_1.duration_ = 5

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play910201111(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1080ui_story"].transform
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 then
				arg_445_1.var_.moveOldPos1080ui_story = var_448_0.localPosition
			end

			local var_448_2 = 0.001

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2
				local var_448_4 = Vector3.New(0, 100, 0)

				var_448_0.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos1080ui_story, var_448_4, var_448_3)

				local var_448_5 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_5.x, var_448_5.y, var_448_5.z)

				local var_448_6 = var_448_0.localEulerAngles

				var_448_6.z = 0
				var_448_6.x = 0
				var_448_0.localEulerAngles = var_448_6
			end

			if arg_445_1.time_ >= var_448_1 + var_448_2 and arg_445_1.time_ < var_448_1 + var_448_2 + arg_448_0 then
				var_448_0.localPosition = Vector3.New(0, 100, 0)

				local var_448_7 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_7.x, var_448_7.y, var_448_7.z)

				local var_448_8 = var_448_0.localEulerAngles

				var_448_8.z = 0
				var_448_8.x = 0
				var_448_0.localEulerAngles = var_448_8
			end

			local var_448_9 = 0
			local var_448_10 = 0.775

			if var_448_9 < arg_445_1.time_ and arg_445_1.time_ <= var_448_9 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_11 = arg_445_1:FormatText(StoryNameCfg[7].name)

				arg_445_1.leftNameTxt_.text = var_448_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_12 = arg_445_1:GetWordFromCfg(910201110)
				local var_448_13 = arg_445_1:FormatText(var_448_12.content)

				arg_445_1.text_.text = var_448_13

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_14 = 31
				local var_448_15 = utf8.len(var_448_13)
				local var_448_16 = var_448_14 <= 0 and var_448_10 or var_448_10 * (var_448_15 / var_448_14)

				if var_448_16 > 0 and var_448_10 < var_448_16 then
					arg_445_1.talkMaxDuration = var_448_16

					if var_448_16 + var_448_9 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_16 + var_448_9
					end
				end

				arg_445_1.text_.text = var_448_13
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)
				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_17 = math.max(var_448_10, arg_445_1.talkMaxDuration)

			if var_448_9 <= arg_445_1.time_ and arg_445_1.time_ < var_448_9 + var_448_17 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_9) / var_448_17

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_9 + var_448_17 and arg_445_1.time_ < var_448_9 + var_448_17 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play910201111 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 910201111
		arg_449_1.duration_ = 5

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play910201112(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 0
			local var_452_1 = 0.275

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, false)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_2 = arg_449_1:GetWordFromCfg(910201111)
				local var_452_3 = arg_449_1:FormatText(var_452_2.content)

				arg_449_1.text_.text = var_452_3

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_4 = 11
				local var_452_5 = utf8.len(var_452_3)
				local var_452_6 = var_452_4 <= 0 and var_452_1 or var_452_1 * (var_452_5 / var_452_4)

				if var_452_6 > 0 and var_452_1 < var_452_6 then
					arg_449_1.talkMaxDuration = var_452_6

					if var_452_6 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_6 + var_452_0
					end
				end

				arg_449_1.text_.text = var_452_3
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_7 = math.max(var_452_1, arg_449_1.talkMaxDuration)

			if var_452_0 <= arg_449_1.time_ and arg_449_1.time_ < var_452_0 + var_452_7 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_0) / var_452_7

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_0 + var_452_7 and arg_449_1.time_ < var_452_0 + var_452_7 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play910201112 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 910201112
		arg_453_1.duration_ = 5

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play910201113(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = 0
			local var_456_1 = 0.5

			if var_456_0 < arg_453_1.time_ and arg_453_1.time_ <= var_456_0 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, false)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_2 = arg_453_1:GetWordFromCfg(910201112)
				local var_456_3 = arg_453_1:FormatText(var_456_2.content)

				arg_453_1.text_.text = var_456_3

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_4 = 20
				local var_456_5 = utf8.len(var_456_3)
				local var_456_6 = var_456_4 <= 0 and var_456_1 or var_456_1 * (var_456_5 / var_456_4)

				if var_456_6 > 0 and var_456_1 < var_456_6 then
					arg_453_1.talkMaxDuration = var_456_6

					if var_456_6 + var_456_0 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_6 + var_456_0
					end
				end

				arg_453_1.text_.text = var_456_3
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)
				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_7 = math.max(var_456_1, arg_453_1.talkMaxDuration)

			if var_456_0 <= arg_453_1.time_ and arg_453_1.time_ < var_456_0 + var_456_7 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_0) / var_456_7

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_0 + var_456_7 and arg_453_1.time_ < var_456_0 + var_456_7 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play910201113 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 910201113
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play910201114(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = 0
			local var_460_1 = 0.675

			if var_460_0 < arg_457_1.time_ and arg_457_1.time_ <= var_460_0 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_2 = arg_457_1:FormatText(StoryNameCfg[7].name)

				arg_457_1.leftNameTxt_.text = var_460_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_3 = arg_457_1:GetWordFromCfg(910201113)
				local var_460_4 = arg_457_1:FormatText(var_460_3.content)

				arg_457_1.text_.text = var_460_4

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_5 = 27
				local var_460_6 = utf8.len(var_460_4)
				local var_460_7 = var_460_5 <= 0 and var_460_1 or var_460_1 * (var_460_6 / var_460_5)

				if var_460_7 > 0 and var_460_1 < var_460_7 then
					arg_457_1.talkMaxDuration = var_460_7

					if var_460_7 + var_460_0 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_7 + var_460_0
					end
				end

				arg_457_1.text_.text = var_460_4
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_8 = math.max(var_460_1, arg_457_1.talkMaxDuration)

			if var_460_0 <= arg_457_1.time_ and arg_457_1.time_ < var_460_0 + var_460_8 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_0) / var_460_8

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_0 + var_460_8 and arg_457_1.time_ < var_460_0 + var_460_8 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play910201114 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 910201114
		arg_461_1.duration_ = 5

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play910201115(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = "1096ui_story"

			if arg_461_1.actors_[var_464_0] == nil then
				local var_464_1 = Object.Instantiate(Asset.Load("Char/" .. var_464_0), arg_461_1.stage_.transform)

				var_464_1.name = var_464_0
				var_464_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_461_1.actors_[var_464_0] = var_464_1

				local var_464_2 = var_464_1:GetComponentInChildren(typeof(CharacterEffect))

				var_464_2.enabled = true

				local var_464_3 = GameObjectTools.GetOrAddComponent(var_464_1, typeof(DynamicBoneHelper))

				if var_464_3 then
					var_464_3:EnableDynamicBone(false)
				end

				arg_461_1:ShowWeapon(var_464_2.transform, false)

				arg_461_1.var_[var_464_0 .. "Animator"] = var_464_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_461_1.var_[var_464_0 .. "Animator"].applyRootMotion = true
				arg_461_1.var_[var_464_0 .. "LipSync"] = var_464_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_464_4 = arg_461_1.actors_["1096ui_story"].transform
			local var_464_5 = 0

			if var_464_5 < arg_461_1.time_ and arg_461_1.time_ <= var_464_5 + arg_464_0 then
				arg_461_1.var_.moveOldPos1096ui_story = var_464_4.localPosition
			end

			local var_464_6 = 0.001

			if var_464_5 <= arg_461_1.time_ and arg_461_1.time_ < var_464_5 + var_464_6 then
				local var_464_7 = (arg_461_1.time_ - var_464_5) / var_464_6
				local var_464_8 = Vector3.New(0, -1.13, -5.6)

				var_464_4.localPosition = Vector3.Lerp(arg_461_1.var_.moveOldPos1096ui_story, var_464_8, var_464_7)

				local var_464_9 = manager.ui.mainCamera.transform.position - var_464_4.position

				var_464_4.forward = Vector3.New(var_464_9.x, var_464_9.y, var_464_9.z)

				local var_464_10 = var_464_4.localEulerAngles

				var_464_10.z = 0
				var_464_10.x = 0
				var_464_4.localEulerAngles = var_464_10
			end

			if arg_461_1.time_ >= var_464_5 + var_464_6 and arg_461_1.time_ < var_464_5 + var_464_6 + arg_464_0 then
				var_464_4.localPosition = Vector3.New(0, -1.13, -5.6)

				local var_464_11 = manager.ui.mainCamera.transform.position - var_464_4.position

				var_464_4.forward = Vector3.New(var_464_11.x, var_464_11.y, var_464_11.z)

				local var_464_12 = var_464_4.localEulerAngles

				var_464_12.z = 0
				var_464_12.x = 0
				var_464_4.localEulerAngles = var_464_12
			end

			local var_464_13 = arg_461_1.actors_["1096ui_story"]
			local var_464_14 = 0

			if var_464_14 < arg_461_1.time_ and arg_461_1.time_ <= var_464_14 + arg_464_0 and arg_461_1.var_.characterEffect1096ui_story == nil then
				arg_461_1.var_.characterEffect1096ui_story = var_464_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_15 = 0.2

			if var_464_14 <= arg_461_1.time_ and arg_461_1.time_ < var_464_14 + var_464_15 then
				local var_464_16 = (arg_461_1.time_ - var_464_14) / var_464_15

				if arg_461_1.var_.characterEffect1096ui_story then
					arg_461_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_461_1.time_ >= var_464_14 + var_464_15 and arg_461_1.time_ < var_464_14 + var_464_15 + arg_464_0 and arg_461_1.var_.characterEffect1096ui_story then
				arg_461_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_464_17 = 0

			if var_464_17 < arg_461_1.time_ and arg_461_1.time_ <= var_464_17 + arg_464_0 then
				arg_461_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096action/1096action3_1")
			end

			local var_464_18 = 0

			if var_464_18 < arg_461_1.time_ and arg_461_1.time_ <= var_464_18 + arg_464_0 then
				arg_461_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_464_19 = 0
			local var_464_20 = 0.125

			if var_464_19 < arg_461_1.time_ and arg_461_1.time_ <= var_464_19 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_21 = arg_461_1:FormatText(StoryNameCfg[169].name)

				arg_461_1.leftNameTxt_.text = var_464_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_22 = arg_461_1:GetWordFromCfg(910201114)
				local var_464_23 = arg_461_1:FormatText(var_464_22.content)

				arg_461_1.text_.text = var_464_23

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_24 = 5
				local var_464_25 = utf8.len(var_464_23)
				local var_464_26 = var_464_24 <= 0 and var_464_20 or var_464_20 * (var_464_25 / var_464_24)

				if var_464_26 > 0 and var_464_20 < var_464_26 then
					arg_461_1.talkMaxDuration = var_464_26

					if var_464_26 + var_464_19 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_26 + var_464_19
					end
				end

				arg_461_1.text_.text = var_464_23
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)
				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_27 = math.max(var_464_20, arg_461_1.talkMaxDuration)

			if var_464_19 <= arg_461_1.time_ and arg_461_1.time_ < var_464_19 + var_464_27 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_19) / var_464_27

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_19 + var_464_27 and arg_461_1.time_ < var_464_19 + var_464_27 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play910201115 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 910201115
		arg_465_1.duration_ = 5

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play910201116(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["1096ui_story"]
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 and arg_465_1.var_.characterEffect1096ui_story == nil then
				arg_465_1.var_.characterEffect1096ui_story = var_468_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_2 = 0.2

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2

				if arg_465_1.var_.characterEffect1096ui_story then
					local var_468_4 = Mathf.Lerp(0, 0.5, var_468_3)

					arg_465_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_465_1.var_.characterEffect1096ui_story.fillRatio = var_468_4
				end
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 and arg_465_1.var_.characterEffect1096ui_story then
				local var_468_5 = 0.5

				arg_465_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_465_1.var_.characterEffect1096ui_story.fillRatio = var_468_5
			end

			local var_468_6 = 0
			local var_468_7 = 0.6

			if var_468_6 < arg_465_1.time_ and arg_465_1.time_ <= var_468_6 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_8 = arg_465_1:FormatText(StoryNameCfg[7].name)

				arg_465_1.leftNameTxt_.text = var_468_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_9 = arg_465_1:GetWordFromCfg(910201115)
				local var_468_10 = arg_465_1:FormatText(var_468_9.content)

				arg_465_1.text_.text = var_468_10

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_11 = 24
				local var_468_12 = utf8.len(var_468_10)
				local var_468_13 = var_468_11 <= 0 and var_468_7 or var_468_7 * (var_468_12 / var_468_11)

				if var_468_13 > 0 and var_468_7 < var_468_13 then
					arg_465_1.talkMaxDuration = var_468_13

					if var_468_13 + var_468_6 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_13 + var_468_6
					end
				end

				arg_465_1.text_.text = var_468_10
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)
				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_14 = math.max(var_468_7, arg_465_1.talkMaxDuration)

			if var_468_6 <= arg_465_1.time_ and arg_465_1.time_ < var_468_6 + var_468_14 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_6) / var_468_14

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_6 + var_468_14 and arg_465_1.time_ < var_468_6 + var_468_14 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play910201116 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 910201116
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play910201117(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1096ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect1096ui_story == nil then
				arg_469_1.var_.characterEffect1096ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.2

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect1096ui_story then
					arg_469_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect1096ui_story then
				arg_469_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_472_4 = 0

			if var_472_4 < arg_469_1.time_ and arg_469_1.time_ <= var_472_4 + arg_472_0 then
				arg_469_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action434")
			end

			local var_472_5 = 0

			if var_472_5 < arg_469_1.time_ and arg_469_1.time_ <= var_472_5 + arg_472_0 then
				arg_469_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_472_6 = 0
			local var_472_7 = 0.45

			if var_472_6 < arg_469_1.time_ and arg_469_1.time_ <= var_472_6 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_8 = arg_469_1:FormatText(StoryNameCfg[169].name)

				arg_469_1.leftNameTxt_.text = var_472_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_9 = arg_469_1:GetWordFromCfg(910201116)
				local var_472_10 = arg_469_1:FormatText(var_472_9.content)

				arg_469_1.text_.text = var_472_10

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_11 = 18
				local var_472_12 = utf8.len(var_472_10)
				local var_472_13 = var_472_11 <= 0 and var_472_7 or var_472_7 * (var_472_12 / var_472_11)

				if var_472_13 > 0 and var_472_7 < var_472_13 then
					arg_469_1.talkMaxDuration = var_472_13

					if var_472_13 + var_472_6 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_13 + var_472_6
					end
				end

				arg_469_1.text_.text = var_472_10
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_14 = math.max(var_472_7, arg_469_1.talkMaxDuration)

			if var_472_6 <= arg_469_1.time_ and arg_469_1.time_ < var_472_6 + var_472_14 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_6) / var_472_14

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_6 + var_472_14 and arg_469_1.time_ < var_472_6 + var_472_14 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play910201117 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 910201117
		arg_473_1.duration_ = 5

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play910201118(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["1096ui_story"]
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 and arg_473_1.var_.characterEffect1096ui_story == nil then
				arg_473_1.var_.characterEffect1096ui_story = var_476_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_2 = 0.2

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2

				if arg_473_1.var_.characterEffect1096ui_story then
					local var_476_4 = Mathf.Lerp(0, 0.5, var_476_3)

					arg_473_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_473_1.var_.characterEffect1096ui_story.fillRatio = var_476_4
				end
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 and arg_473_1.var_.characterEffect1096ui_story then
				local var_476_5 = 0.5

				arg_473_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_473_1.var_.characterEffect1096ui_story.fillRatio = var_476_5
			end

			local var_476_6 = 0
			local var_476_7 = 0.425

			if var_476_6 < arg_473_1.time_ and arg_473_1.time_ <= var_476_6 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_8 = arg_473_1:FormatText(StoryNameCfg[7].name)

				arg_473_1.leftNameTxt_.text = var_476_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_9 = arg_473_1:GetWordFromCfg(910201117)
				local var_476_10 = arg_473_1:FormatText(var_476_9.content)

				arg_473_1.text_.text = var_476_10

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_11 = 17
				local var_476_12 = utf8.len(var_476_10)
				local var_476_13 = var_476_11 <= 0 and var_476_7 or var_476_7 * (var_476_12 / var_476_11)

				if var_476_13 > 0 and var_476_7 < var_476_13 then
					arg_473_1.talkMaxDuration = var_476_13

					if var_476_13 + var_476_6 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_13 + var_476_6
					end
				end

				arg_473_1.text_.text = var_476_10
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)
				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_14 = math.max(var_476_7, arg_473_1.talkMaxDuration)

			if var_476_6 <= arg_473_1.time_ and arg_473_1.time_ < var_476_6 + var_476_14 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_6) / var_476_14

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_6 + var_476_14 and arg_473_1.time_ < var_476_6 + var_476_14 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play910201118 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 910201118
		arg_477_1.duration_ = 5

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play910201119(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1096ui_story"]
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 and arg_477_1.var_.characterEffect1096ui_story == nil then
				arg_477_1.var_.characterEffect1096ui_story = var_480_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_2 = 0.2

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2

				if arg_477_1.var_.characterEffect1096ui_story then
					arg_477_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 and arg_477_1.var_.characterEffect1096ui_story then
				arg_477_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_480_4 = 0

			if var_480_4 < arg_477_1.time_ and arg_477_1.time_ <= var_480_4 + arg_480_0 then
				arg_477_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action445")
			end

			local var_480_5 = 0

			if var_480_5 < arg_477_1.time_ and arg_477_1.time_ <= var_480_5 + arg_480_0 then
				arg_477_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_480_6 = 0
			local var_480_7 = 0.8

			if var_480_6 < arg_477_1.time_ and arg_477_1.time_ <= var_480_6 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_8 = arg_477_1:FormatText(StoryNameCfg[169].name)

				arg_477_1.leftNameTxt_.text = var_480_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_9 = arg_477_1:GetWordFromCfg(910201118)
				local var_480_10 = arg_477_1:FormatText(var_480_9.content)

				arg_477_1.text_.text = var_480_10

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_11 = 32
				local var_480_12 = utf8.len(var_480_10)
				local var_480_13 = var_480_11 <= 0 and var_480_7 or var_480_7 * (var_480_12 / var_480_11)

				if var_480_13 > 0 and var_480_7 < var_480_13 then
					arg_477_1.talkMaxDuration = var_480_13

					if var_480_13 + var_480_6 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_13 + var_480_6
					end
				end

				arg_477_1.text_.text = var_480_10
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)
				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_14 = math.max(var_480_7, arg_477_1.talkMaxDuration)

			if var_480_6 <= arg_477_1.time_ and arg_477_1.time_ < var_480_6 + var_480_14 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_6) / var_480_14

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_6 + var_480_14 and arg_477_1.time_ < var_480_6 + var_480_14 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play910201119 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 910201119
		arg_481_1.duration_ = 5

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play910201120(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 0

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				arg_481_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action453")
			end

			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 then
				arg_481_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_484_2 = 0
			local var_484_3 = 1.05

			if var_484_2 < arg_481_1.time_ and arg_481_1.time_ <= var_484_2 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_4 = arg_481_1:FormatText(StoryNameCfg[169].name)

				arg_481_1.leftNameTxt_.text = var_484_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_5 = arg_481_1:GetWordFromCfg(910201119)
				local var_484_6 = arg_481_1:FormatText(var_484_5.content)

				arg_481_1.text_.text = var_484_6

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_7 = 42
				local var_484_8 = utf8.len(var_484_6)
				local var_484_9 = var_484_7 <= 0 and var_484_3 or var_484_3 * (var_484_8 / var_484_7)

				if var_484_9 > 0 and var_484_3 < var_484_9 then
					arg_481_1.talkMaxDuration = var_484_9

					if var_484_9 + var_484_2 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_9 + var_484_2
					end
				end

				arg_481_1.text_.text = var_484_6
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)
				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_10 = math.max(var_484_3, arg_481_1.talkMaxDuration)

			if var_484_2 <= arg_481_1.time_ and arg_481_1.time_ < var_484_2 + var_484_10 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_2) / var_484_10

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_2 + var_484_10 and arg_481_1.time_ < var_484_2 + var_484_10 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play910201120 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 910201120
		arg_485_1.duration_ = 5

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play910201121(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = arg_485_1.actors_["1096ui_story"]
			local var_488_1 = 0

			if var_488_1 < arg_485_1.time_ and arg_485_1.time_ <= var_488_1 + arg_488_0 and arg_485_1.var_.characterEffect1096ui_story == nil then
				arg_485_1.var_.characterEffect1096ui_story = var_488_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_2 = 0.2

			if var_488_1 <= arg_485_1.time_ and arg_485_1.time_ < var_488_1 + var_488_2 then
				local var_488_3 = (arg_485_1.time_ - var_488_1) / var_488_2

				if arg_485_1.var_.characterEffect1096ui_story then
					local var_488_4 = Mathf.Lerp(0, 0.5, var_488_3)

					arg_485_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_485_1.var_.characterEffect1096ui_story.fillRatio = var_488_4
				end
			end

			if arg_485_1.time_ >= var_488_1 + var_488_2 and arg_485_1.time_ < var_488_1 + var_488_2 + arg_488_0 and arg_485_1.var_.characterEffect1096ui_story then
				local var_488_5 = 0.5

				arg_485_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_485_1.var_.characterEffect1096ui_story.fillRatio = var_488_5
			end

			local var_488_6 = 0
			local var_488_7 = 0.425

			if var_488_6 < arg_485_1.time_ and arg_485_1.time_ <= var_488_6 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_8 = arg_485_1:FormatText(StoryNameCfg[7].name)

				arg_485_1.leftNameTxt_.text = var_488_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_9 = arg_485_1:GetWordFromCfg(910201120)
				local var_488_10 = arg_485_1:FormatText(var_488_9.content)

				arg_485_1.text_.text = var_488_10

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_11 = 17
				local var_488_12 = utf8.len(var_488_10)
				local var_488_13 = var_488_11 <= 0 and var_488_7 or var_488_7 * (var_488_12 / var_488_11)

				if var_488_13 > 0 and var_488_7 < var_488_13 then
					arg_485_1.talkMaxDuration = var_488_13

					if var_488_13 + var_488_6 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_13 + var_488_6
					end
				end

				arg_485_1.text_.text = var_488_10
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)
				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_14 = math.max(var_488_7, arg_485_1.talkMaxDuration)

			if var_488_6 <= arg_485_1.time_ and arg_485_1.time_ < var_488_6 + var_488_14 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_6) / var_488_14

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_6 + var_488_14 and arg_485_1.time_ < var_488_6 + var_488_14 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play910201121 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 910201121
		arg_489_1.duration_ = 5

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play910201122(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["1096ui_story"]
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 and arg_489_1.var_.characterEffect1096ui_story == nil then
				arg_489_1.var_.characterEffect1096ui_story = var_492_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_2 = 0.2

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2

				if arg_489_1.var_.characterEffect1096ui_story then
					arg_489_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 and arg_489_1.var_.characterEffect1096ui_story then
				arg_489_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_492_4 = 0

			if var_492_4 < arg_489_1.time_ and arg_489_1.time_ <= var_492_4 + arg_492_0 then
				arg_489_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action432")
			end

			local var_492_5 = 0

			if var_492_5 < arg_489_1.time_ and arg_489_1.time_ <= var_492_5 + arg_492_0 then
				arg_489_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_492_6 = 0
			local var_492_7 = 0.775

			if var_492_6 < arg_489_1.time_ and arg_489_1.time_ <= var_492_6 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_8 = arg_489_1:FormatText(StoryNameCfg[169].name)

				arg_489_1.leftNameTxt_.text = var_492_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_9 = arg_489_1:GetWordFromCfg(910201121)
				local var_492_10 = arg_489_1:FormatText(var_492_9.content)

				arg_489_1.text_.text = var_492_10

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_11 = 31
				local var_492_12 = utf8.len(var_492_10)
				local var_492_13 = var_492_11 <= 0 and var_492_7 or var_492_7 * (var_492_12 / var_492_11)

				if var_492_13 > 0 and var_492_7 < var_492_13 then
					arg_489_1.talkMaxDuration = var_492_13

					if var_492_13 + var_492_6 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_13 + var_492_6
					end
				end

				arg_489_1.text_.text = var_492_10
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)
				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_14 = math.max(var_492_7, arg_489_1.talkMaxDuration)

			if var_492_6 <= arg_489_1.time_ and arg_489_1.time_ < var_492_6 + var_492_14 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_6) / var_492_14

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_6 + var_492_14 and arg_489_1.time_ < var_492_6 + var_492_14 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play910201122 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 910201122
		arg_493_1.duration_ = 5

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play910201123(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = 0

			if var_496_0 < arg_493_1.time_ and arg_493_1.time_ <= var_496_0 + arg_496_0 then
				arg_493_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action423")
			end

			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 then
				arg_493_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_496_2 = 0
			local var_496_3 = 0.575

			if var_496_2 < arg_493_1.time_ and arg_493_1.time_ <= var_496_2 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_4 = arg_493_1:FormatText(StoryNameCfg[169].name)

				arg_493_1.leftNameTxt_.text = var_496_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_5 = arg_493_1:GetWordFromCfg(910201122)
				local var_496_6 = arg_493_1:FormatText(var_496_5.content)

				arg_493_1.text_.text = var_496_6

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_7 = 23
				local var_496_8 = utf8.len(var_496_6)
				local var_496_9 = var_496_7 <= 0 and var_496_3 or var_496_3 * (var_496_8 / var_496_7)

				if var_496_9 > 0 and var_496_3 < var_496_9 then
					arg_493_1.talkMaxDuration = var_496_9

					if var_496_9 + var_496_2 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_9 + var_496_2
					end
				end

				arg_493_1.text_.text = var_496_6
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_10 = math.max(var_496_3, arg_493_1.talkMaxDuration)

			if var_496_2 <= arg_493_1.time_ and arg_493_1.time_ < var_496_2 + var_496_10 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_2) / var_496_10

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_2 + var_496_10 and arg_493_1.time_ < var_496_2 + var_496_10 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play910201123 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 910201123
		arg_497_1.duration_ = 5

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play910201124(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = arg_497_1.actors_["1096ui_story"]
			local var_500_1 = 0

			if var_500_1 < arg_497_1.time_ and arg_497_1.time_ <= var_500_1 + arg_500_0 and arg_497_1.var_.characterEffect1096ui_story == nil then
				arg_497_1.var_.characterEffect1096ui_story = var_500_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_2 = 0.2

			if var_500_1 <= arg_497_1.time_ and arg_497_1.time_ < var_500_1 + var_500_2 then
				local var_500_3 = (arg_497_1.time_ - var_500_1) / var_500_2

				if arg_497_1.var_.characterEffect1096ui_story then
					local var_500_4 = Mathf.Lerp(0, 0.5, var_500_3)

					arg_497_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_497_1.var_.characterEffect1096ui_story.fillRatio = var_500_4
				end
			end

			if arg_497_1.time_ >= var_500_1 + var_500_2 and arg_497_1.time_ < var_500_1 + var_500_2 + arg_500_0 and arg_497_1.var_.characterEffect1096ui_story then
				local var_500_5 = 0.5

				arg_497_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_497_1.var_.characterEffect1096ui_story.fillRatio = var_500_5
			end

			local var_500_6 = 0
			local var_500_7 = 0.575

			if var_500_6 < arg_497_1.time_ and arg_497_1.time_ <= var_500_6 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_8 = arg_497_1:FormatText(StoryNameCfg[7].name)

				arg_497_1.leftNameTxt_.text = var_500_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_9 = arg_497_1:GetWordFromCfg(910201123)
				local var_500_10 = arg_497_1:FormatText(var_500_9.content)

				arg_497_1.text_.text = var_500_10

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_11 = 23
				local var_500_12 = utf8.len(var_500_10)
				local var_500_13 = var_500_11 <= 0 and var_500_7 or var_500_7 * (var_500_12 / var_500_11)

				if var_500_13 > 0 and var_500_7 < var_500_13 then
					arg_497_1.talkMaxDuration = var_500_13

					if var_500_13 + var_500_6 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_13 + var_500_6
					end
				end

				arg_497_1.text_.text = var_500_10
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)
				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_14 = math.max(var_500_7, arg_497_1.talkMaxDuration)

			if var_500_6 <= arg_497_1.time_ and arg_497_1.time_ < var_500_6 + var_500_14 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_6) / var_500_14

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_6 + var_500_14 and arg_497_1.time_ < var_500_6 + var_500_14 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play910201124 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 910201124
		arg_501_1.duration_ = 5

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play910201125(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = arg_501_1.actors_["1096ui_story"]
			local var_504_1 = 0

			if var_504_1 < arg_501_1.time_ and arg_501_1.time_ <= var_504_1 + arg_504_0 and arg_501_1.var_.characterEffect1096ui_story == nil then
				arg_501_1.var_.characterEffect1096ui_story = var_504_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_2 = 0.2

			if var_504_1 <= arg_501_1.time_ and arg_501_1.time_ < var_504_1 + var_504_2 then
				local var_504_3 = (arg_501_1.time_ - var_504_1) / var_504_2

				if arg_501_1.var_.characterEffect1096ui_story then
					arg_501_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_501_1.time_ >= var_504_1 + var_504_2 and arg_501_1.time_ < var_504_1 + var_504_2 + arg_504_0 and arg_501_1.var_.characterEffect1096ui_story then
				arg_501_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_504_4 = 0

			if var_504_4 < arg_501_1.time_ and arg_501_1.time_ <= var_504_4 + arg_504_0 then
				arg_501_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action434")
			end

			local var_504_5 = 0

			if var_504_5 < arg_501_1.time_ and arg_501_1.time_ <= var_504_5 + arg_504_0 then
				arg_501_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_504_6 = 0
			local var_504_7 = 0.625

			if var_504_6 < arg_501_1.time_ and arg_501_1.time_ <= var_504_6 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_8 = arg_501_1:FormatText(StoryNameCfg[169].name)

				arg_501_1.leftNameTxt_.text = var_504_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_9 = arg_501_1:GetWordFromCfg(910201124)
				local var_504_10 = arg_501_1:FormatText(var_504_9.content)

				arg_501_1.text_.text = var_504_10

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_11 = 25
				local var_504_12 = utf8.len(var_504_10)
				local var_504_13 = var_504_11 <= 0 and var_504_7 or var_504_7 * (var_504_12 / var_504_11)

				if var_504_13 > 0 and var_504_7 < var_504_13 then
					arg_501_1.talkMaxDuration = var_504_13

					if var_504_13 + var_504_6 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_13 + var_504_6
					end
				end

				arg_501_1.text_.text = var_504_10
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)
				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_14 = math.max(var_504_7, arg_501_1.talkMaxDuration)

			if var_504_6 <= arg_501_1.time_ and arg_501_1.time_ < var_504_6 + var_504_14 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_6) / var_504_14

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_6 + var_504_14 and arg_501_1.time_ < var_504_6 + var_504_14 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play910201125 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 910201125
		arg_505_1.duration_ = 5

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play910201126(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = arg_505_1.actors_["1096ui_story"]
			local var_508_1 = 0

			if var_508_1 < arg_505_1.time_ and arg_505_1.time_ <= var_508_1 + arg_508_0 and arg_505_1.var_.characterEffect1096ui_story == nil then
				arg_505_1.var_.characterEffect1096ui_story = var_508_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_2 = 0.2

			if var_508_1 <= arg_505_1.time_ and arg_505_1.time_ < var_508_1 + var_508_2 then
				local var_508_3 = (arg_505_1.time_ - var_508_1) / var_508_2

				if arg_505_1.var_.characterEffect1096ui_story then
					local var_508_4 = Mathf.Lerp(0, 0.5, var_508_3)

					arg_505_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_505_1.var_.characterEffect1096ui_story.fillRatio = var_508_4
				end
			end

			if arg_505_1.time_ >= var_508_1 + var_508_2 and arg_505_1.time_ < var_508_1 + var_508_2 + arg_508_0 and arg_505_1.var_.characterEffect1096ui_story then
				local var_508_5 = 0.5

				arg_505_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_505_1.var_.characterEffect1096ui_story.fillRatio = var_508_5
			end

			local var_508_6 = 0
			local var_508_7 = 0.9

			if var_508_6 < arg_505_1.time_ and arg_505_1.time_ <= var_508_6 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, false)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_8 = arg_505_1:GetWordFromCfg(910201125)
				local var_508_9 = arg_505_1:FormatText(var_508_8.content)

				arg_505_1.text_.text = var_508_9

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_10 = 36
				local var_508_11 = utf8.len(var_508_9)
				local var_508_12 = var_508_10 <= 0 and var_508_7 or var_508_7 * (var_508_11 / var_508_10)

				if var_508_12 > 0 and var_508_7 < var_508_12 then
					arg_505_1.talkMaxDuration = var_508_12

					if var_508_12 + var_508_6 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_12 + var_508_6
					end
				end

				arg_505_1.text_.text = var_508_9
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)
				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_13 = math.max(var_508_7, arg_505_1.talkMaxDuration)

			if var_508_6 <= arg_505_1.time_ and arg_505_1.time_ < var_508_6 + var_508_13 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_6) / var_508_13

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_6 + var_508_13 and arg_505_1.time_ < var_508_6 + var_508_13 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play910201126 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 910201126
		arg_509_1.duration_ = 5

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play910201127(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = 0
			local var_512_1 = 0.75

			if var_512_0 < arg_509_1.time_ and arg_509_1.time_ <= var_512_0 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, true)

				local var_512_2 = arg_509_1:FormatText(StoryNameCfg[7].name)

				arg_509_1.leftNameTxt_.text = var_512_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_509_1.leftNameTxt_.transform)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1.leftNameTxt_.text)
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_3 = arg_509_1:GetWordFromCfg(910201126)
				local var_512_4 = arg_509_1:FormatText(var_512_3.content)

				arg_509_1.text_.text = var_512_4

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_5 = 30
				local var_512_6 = utf8.len(var_512_4)
				local var_512_7 = var_512_5 <= 0 and var_512_1 or var_512_1 * (var_512_6 / var_512_5)

				if var_512_7 > 0 and var_512_1 < var_512_7 then
					arg_509_1.talkMaxDuration = var_512_7

					if var_512_7 + var_512_0 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_7 + var_512_0
					end
				end

				arg_509_1.text_.text = var_512_4
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)
				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_8 = math.max(var_512_1, arg_509_1.talkMaxDuration)

			if var_512_0 <= arg_509_1.time_ and arg_509_1.time_ < var_512_0 + var_512_8 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_0) / var_512_8

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_0 + var_512_8 and arg_509_1.time_ < var_512_0 + var_512_8 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play910201127 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 910201127
		arg_513_1.duration_ = 5

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play910201128(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = arg_513_1.actors_["1096ui_story"]
			local var_516_1 = 0

			if var_516_1 < arg_513_1.time_ and arg_513_1.time_ <= var_516_1 + arg_516_0 and arg_513_1.var_.characterEffect1096ui_story == nil then
				arg_513_1.var_.characterEffect1096ui_story = var_516_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_2 = 0.2

			if var_516_1 <= arg_513_1.time_ and arg_513_1.time_ < var_516_1 + var_516_2 then
				local var_516_3 = (arg_513_1.time_ - var_516_1) / var_516_2

				if arg_513_1.var_.characterEffect1096ui_story then
					arg_513_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_513_1.time_ >= var_516_1 + var_516_2 and arg_513_1.time_ < var_516_1 + var_516_2 + arg_516_0 and arg_513_1.var_.characterEffect1096ui_story then
				arg_513_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_516_4 = 0

			if var_516_4 < arg_513_1.time_ and arg_513_1.time_ <= var_516_4 + arg_516_0 then
				arg_513_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action443")
			end

			local var_516_5 = 0

			if var_516_5 < arg_513_1.time_ and arg_513_1.time_ <= var_516_5 + arg_516_0 then
				arg_513_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_516_6 = 0
			local var_516_7 = 0.225

			if var_516_6 < arg_513_1.time_ and arg_513_1.time_ <= var_516_6 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_8 = arg_513_1:FormatText(StoryNameCfg[169].name)

				arg_513_1.leftNameTxt_.text = var_516_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_9 = arg_513_1:GetWordFromCfg(910201127)
				local var_516_10 = arg_513_1:FormatText(var_516_9.content)

				arg_513_1.text_.text = var_516_10

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_11 = 9
				local var_516_12 = utf8.len(var_516_10)
				local var_516_13 = var_516_11 <= 0 and var_516_7 or var_516_7 * (var_516_12 / var_516_11)

				if var_516_13 > 0 and var_516_7 < var_516_13 then
					arg_513_1.talkMaxDuration = var_516_13

					if var_516_13 + var_516_6 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_13 + var_516_6
					end
				end

				arg_513_1.text_.text = var_516_10
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)
				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_14 = math.max(var_516_7, arg_513_1.talkMaxDuration)

			if var_516_6 <= arg_513_1.time_ and arg_513_1.time_ < var_516_6 + var_516_14 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_6) / var_516_14

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_6 + var_516_14 and arg_513_1.time_ < var_516_6 + var_516_14 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play910201128 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 910201128
		arg_517_1.duration_ = 5

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play910201129(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = arg_517_1.actors_["1096ui_story"]
			local var_520_1 = 0

			if var_520_1 < arg_517_1.time_ and arg_517_1.time_ <= var_520_1 + arg_520_0 and arg_517_1.var_.characterEffect1096ui_story == nil then
				arg_517_1.var_.characterEffect1096ui_story = var_520_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_2 = 0.2

			if var_520_1 <= arg_517_1.time_ and arg_517_1.time_ < var_520_1 + var_520_2 then
				local var_520_3 = (arg_517_1.time_ - var_520_1) / var_520_2

				if arg_517_1.var_.characterEffect1096ui_story then
					local var_520_4 = Mathf.Lerp(0, 0.5, var_520_3)

					arg_517_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_517_1.var_.characterEffect1096ui_story.fillRatio = var_520_4
				end
			end

			if arg_517_1.time_ >= var_520_1 + var_520_2 and arg_517_1.time_ < var_520_1 + var_520_2 + arg_520_0 and arg_517_1.var_.characterEffect1096ui_story then
				local var_520_5 = 0.5

				arg_517_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_517_1.var_.characterEffect1096ui_story.fillRatio = var_520_5
			end

			local var_520_6 = 0
			local var_520_7 = 0.75

			if var_520_6 < arg_517_1.time_ and arg_517_1.time_ <= var_520_6 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_8 = arg_517_1:FormatText(StoryNameCfg[7].name)

				arg_517_1.leftNameTxt_.text = var_520_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_9 = arg_517_1:GetWordFromCfg(910201128)
				local var_520_10 = arg_517_1:FormatText(var_520_9.content)

				arg_517_1.text_.text = var_520_10

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_11 = 30
				local var_520_12 = utf8.len(var_520_10)
				local var_520_13 = var_520_11 <= 0 and var_520_7 or var_520_7 * (var_520_12 / var_520_11)

				if var_520_13 > 0 and var_520_7 < var_520_13 then
					arg_517_1.talkMaxDuration = var_520_13

					if var_520_13 + var_520_6 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_13 + var_520_6
					end
				end

				arg_517_1.text_.text = var_520_10
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)
				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_14 = math.max(var_520_7, arg_517_1.talkMaxDuration)

			if var_520_6 <= arg_517_1.time_ and arg_517_1.time_ < var_520_6 + var_520_14 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_6) / var_520_14

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_6 + var_520_14 and arg_517_1.time_ < var_520_6 + var_520_14 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play910201129 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 910201129
		arg_521_1.duration_ = 5

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play910201130(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = arg_521_1.actors_["1096ui_story"]
			local var_524_1 = 0

			if var_524_1 < arg_521_1.time_ and arg_521_1.time_ <= var_524_1 + arg_524_0 and arg_521_1.var_.characterEffect1096ui_story == nil then
				arg_521_1.var_.characterEffect1096ui_story = var_524_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_2 = 0.2

			if var_524_1 <= arg_521_1.time_ and arg_521_1.time_ < var_524_1 + var_524_2 then
				local var_524_3 = (arg_521_1.time_ - var_524_1) / var_524_2

				if arg_521_1.var_.characterEffect1096ui_story then
					arg_521_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_521_1.time_ >= var_524_1 + var_524_2 and arg_521_1.time_ < var_524_1 + var_524_2 + arg_524_0 and arg_521_1.var_.characterEffect1096ui_story then
				arg_521_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_524_4 = 0

			if var_524_4 < arg_521_1.time_ and arg_521_1.time_ <= var_524_4 + arg_524_0 then
				arg_521_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action435")
			end

			local var_524_5 = 0

			if var_524_5 < arg_521_1.time_ and arg_521_1.time_ <= var_524_5 + arg_524_0 then
				arg_521_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_524_6 = 0
			local var_524_7 = 0.275

			if var_524_6 < arg_521_1.time_ and arg_521_1.time_ <= var_524_6 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_8 = arg_521_1:FormatText(StoryNameCfg[169].name)

				arg_521_1.leftNameTxt_.text = var_524_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_9 = arg_521_1:GetWordFromCfg(910201129)
				local var_524_10 = arg_521_1:FormatText(var_524_9.content)

				arg_521_1.text_.text = var_524_10

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_11 = 11
				local var_524_12 = utf8.len(var_524_10)
				local var_524_13 = var_524_11 <= 0 and var_524_7 or var_524_7 * (var_524_12 / var_524_11)

				if var_524_13 > 0 and var_524_7 < var_524_13 then
					arg_521_1.talkMaxDuration = var_524_13

					if var_524_13 + var_524_6 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_13 + var_524_6
					end
				end

				arg_521_1.text_.text = var_524_10
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)
				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_14 = math.max(var_524_7, arg_521_1.talkMaxDuration)

			if var_524_6 <= arg_521_1.time_ and arg_521_1.time_ < var_524_6 + var_524_14 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_6) / var_524_14

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_6 + var_524_14 and arg_521_1.time_ < var_524_6 + var_524_14 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play910201130 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 910201130
		arg_525_1.duration_ = 5

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play910201131(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = arg_525_1.actors_["1096ui_story"]
			local var_528_1 = 0

			if var_528_1 < arg_525_1.time_ and arg_525_1.time_ <= var_528_1 + arg_528_0 and arg_525_1.var_.characterEffect1096ui_story == nil then
				arg_525_1.var_.characterEffect1096ui_story = var_528_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_528_2 = 0.2

			if var_528_1 <= arg_525_1.time_ and arg_525_1.time_ < var_528_1 + var_528_2 then
				local var_528_3 = (arg_525_1.time_ - var_528_1) / var_528_2

				if arg_525_1.var_.characterEffect1096ui_story then
					local var_528_4 = Mathf.Lerp(0, 0.5, var_528_3)

					arg_525_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_525_1.var_.characterEffect1096ui_story.fillRatio = var_528_4
				end
			end

			if arg_525_1.time_ >= var_528_1 + var_528_2 and arg_525_1.time_ < var_528_1 + var_528_2 + arg_528_0 and arg_525_1.var_.characterEffect1096ui_story then
				local var_528_5 = 0.5

				arg_525_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_525_1.var_.characterEffect1096ui_story.fillRatio = var_528_5
			end

			local var_528_6 = 0
			local var_528_7 = 1.05

			if var_528_6 < arg_525_1.time_ and arg_525_1.time_ <= var_528_6 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_8 = arg_525_1:FormatText(StoryNameCfg[7].name)

				arg_525_1.leftNameTxt_.text = var_528_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_9 = arg_525_1:GetWordFromCfg(910201130)
				local var_528_10 = arg_525_1:FormatText(var_528_9.content)

				arg_525_1.text_.text = var_528_10

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_11 = 42
				local var_528_12 = utf8.len(var_528_10)
				local var_528_13 = var_528_11 <= 0 and var_528_7 or var_528_7 * (var_528_12 / var_528_11)

				if var_528_13 > 0 and var_528_7 < var_528_13 then
					arg_525_1.talkMaxDuration = var_528_13

					if var_528_13 + var_528_6 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_13 + var_528_6
					end
				end

				arg_525_1.text_.text = var_528_10
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)
				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_14 = math.max(var_528_7, arg_525_1.talkMaxDuration)

			if var_528_6 <= arg_525_1.time_ and arg_525_1.time_ < var_528_6 + var_528_14 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_6) / var_528_14

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_6 + var_528_14 and arg_525_1.time_ < var_528_6 + var_528_14 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play910201131 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 910201131
		arg_529_1.duration_ = 5

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play910201132(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = arg_529_1.actors_["1096ui_story"]
			local var_532_1 = 0

			if var_532_1 < arg_529_1.time_ and arg_529_1.time_ <= var_532_1 + arg_532_0 and arg_529_1.var_.characterEffect1096ui_story == nil then
				arg_529_1.var_.characterEffect1096ui_story = var_532_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_2 = 0.2

			if var_532_1 <= arg_529_1.time_ and arg_529_1.time_ < var_532_1 + var_532_2 then
				local var_532_3 = (arg_529_1.time_ - var_532_1) / var_532_2

				if arg_529_1.var_.characterEffect1096ui_story then
					arg_529_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_529_1.time_ >= var_532_1 + var_532_2 and arg_529_1.time_ < var_532_1 + var_532_2 + arg_532_0 and arg_529_1.var_.characterEffect1096ui_story then
				arg_529_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_532_4 = 0

			if var_532_4 < arg_529_1.time_ and arg_529_1.time_ <= var_532_4 + arg_532_0 then
				arg_529_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action452")
			end

			local var_532_5 = 0

			if var_532_5 < arg_529_1.time_ and arg_529_1.time_ <= var_532_5 + arg_532_0 then
				arg_529_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_532_6 = 0
			local var_532_7 = 0.8

			if var_532_6 < arg_529_1.time_ and arg_529_1.time_ <= var_532_6 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, true)

				local var_532_8 = arg_529_1:FormatText(StoryNameCfg[169].name)

				arg_529_1.leftNameTxt_.text = var_532_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_529_1.leftNameTxt_.transform)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1.leftNameTxt_.text)
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_9 = arg_529_1:GetWordFromCfg(910201131)
				local var_532_10 = arg_529_1:FormatText(var_532_9.content)

				arg_529_1.text_.text = var_532_10

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_11 = 32
				local var_532_12 = utf8.len(var_532_10)
				local var_532_13 = var_532_11 <= 0 and var_532_7 or var_532_7 * (var_532_12 / var_532_11)

				if var_532_13 > 0 and var_532_7 < var_532_13 then
					arg_529_1.talkMaxDuration = var_532_13

					if var_532_13 + var_532_6 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_13 + var_532_6
					end
				end

				arg_529_1.text_.text = var_532_10
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_14 = math.max(var_532_7, arg_529_1.talkMaxDuration)

			if var_532_6 <= arg_529_1.time_ and arg_529_1.time_ < var_532_6 + var_532_14 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_6) / var_532_14

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_6 + var_532_14 and arg_529_1.time_ < var_532_6 + var_532_14 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play910201132 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 910201132
		arg_533_1.duration_ = 5

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play910201133(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = 0

			if var_536_0 < arg_533_1.time_ and arg_533_1.time_ <= var_536_0 + arg_536_0 then
				arg_533_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action424")
			end

			local var_536_1 = 0

			if var_536_1 < arg_533_1.time_ and arg_533_1.time_ <= var_536_1 + arg_536_0 then
				arg_533_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_536_2 = 0
			local var_536_3 = 0.9

			if var_536_2 < arg_533_1.time_ and arg_533_1.time_ <= var_536_2 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, true)

				local var_536_4 = arg_533_1:FormatText(StoryNameCfg[169].name)

				arg_533_1.leftNameTxt_.text = var_536_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_533_1.leftNameTxt_.transform)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1.leftNameTxt_.text)
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_5 = arg_533_1:GetWordFromCfg(910201132)
				local var_536_6 = arg_533_1:FormatText(var_536_5.content)

				arg_533_1.text_.text = var_536_6

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_7 = 36
				local var_536_8 = utf8.len(var_536_6)
				local var_536_9 = var_536_7 <= 0 and var_536_3 or var_536_3 * (var_536_8 / var_536_7)

				if var_536_9 > 0 and var_536_3 < var_536_9 then
					arg_533_1.talkMaxDuration = var_536_9

					if var_536_9 + var_536_2 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_9 + var_536_2
					end
				end

				arg_533_1.text_.text = var_536_6
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)
				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_10 = math.max(var_536_3, arg_533_1.talkMaxDuration)

			if var_536_2 <= arg_533_1.time_ and arg_533_1.time_ < var_536_2 + var_536_10 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_2) / var_536_10

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_2 + var_536_10 and arg_533_1.time_ < var_536_2 + var_536_10 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play910201133 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 910201133
		arg_537_1.duration_ = 5

		SetActive(arg_537_1.tipsGo_, false)

		function arg_537_1.onSingleLineFinish_()
			arg_537_1.onSingleLineUpdate_ = nil
			arg_537_1.onSingleLineFinish_ = nil
			arg_537_1.state_ = "waiting"
		end

		function arg_537_1.playNext_(arg_539_0)
			if arg_539_0 == 1 then
				arg_537_0:Play910201134(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = arg_537_1.actors_["1096ui_story"]
			local var_540_1 = 0

			if var_540_1 < arg_537_1.time_ and arg_537_1.time_ <= var_540_1 + arg_540_0 and arg_537_1.var_.characterEffect1096ui_story == nil then
				arg_537_1.var_.characterEffect1096ui_story = var_540_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_540_2 = 0.2

			if var_540_1 <= arg_537_1.time_ and arg_537_1.time_ < var_540_1 + var_540_2 then
				local var_540_3 = (arg_537_1.time_ - var_540_1) / var_540_2

				if arg_537_1.var_.characterEffect1096ui_story then
					local var_540_4 = Mathf.Lerp(0, 0.5, var_540_3)

					arg_537_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_537_1.var_.characterEffect1096ui_story.fillRatio = var_540_4
				end
			end

			if arg_537_1.time_ >= var_540_1 + var_540_2 and arg_537_1.time_ < var_540_1 + var_540_2 + arg_540_0 and arg_537_1.var_.characterEffect1096ui_story then
				local var_540_5 = 0.5

				arg_537_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_537_1.var_.characterEffect1096ui_story.fillRatio = var_540_5
			end

			local var_540_6 = 0
			local var_540_7 = 0.575

			if var_540_6 < arg_537_1.time_ and arg_537_1.time_ <= var_540_6 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_8 = arg_537_1:FormatText(StoryNameCfg[7].name)

				arg_537_1.leftNameTxt_.text = var_540_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_9 = arg_537_1:GetWordFromCfg(910201133)
				local var_540_10 = arg_537_1:FormatText(var_540_9.content)

				arg_537_1.text_.text = var_540_10

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_11 = 23
				local var_540_12 = utf8.len(var_540_10)
				local var_540_13 = var_540_11 <= 0 and var_540_7 or var_540_7 * (var_540_12 / var_540_11)

				if var_540_13 > 0 and var_540_7 < var_540_13 then
					arg_537_1.talkMaxDuration = var_540_13

					if var_540_13 + var_540_6 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_13 + var_540_6
					end
				end

				arg_537_1.text_.text = var_540_10
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)
				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_14 = math.max(var_540_7, arg_537_1.talkMaxDuration)

			if var_540_6 <= arg_537_1.time_ and arg_537_1.time_ < var_540_6 + var_540_14 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_6) / var_540_14

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_6 + var_540_14 and arg_537_1.time_ < var_540_6 + var_540_14 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play910201134 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 910201134
		arg_541_1.duration_ = 5

		SetActive(arg_541_1.tipsGo_, false)

		function arg_541_1.onSingleLineFinish_()
			arg_541_1.onSingleLineUpdate_ = nil
			arg_541_1.onSingleLineFinish_ = nil
			arg_541_1.state_ = "waiting"
		end

		function arg_541_1.playNext_(arg_543_0)
			if arg_543_0 == 1 then
				arg_541_0:Play910201135(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = 0
			local var_544_1 = 0.45

			if var_544_0 < arg_541_1.time_ and arg_541_1.time_ <= var_544_0 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_2 = arg_541_1:FormatText(StoryNameCfg[7].name)

				arg_541_1.leftNameTxt_.text = var_544_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_3 = arg_541_1:GetWordFromCfg(910201134)
				local var_544_4 = arg_541_1:FormatText(var_544_3.content)

				arg_541_1.text_.text = var_544_4

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_5 = 18
				local var_544_6 = utf8.len(var_544_4)
				local var_544_7 = var_544_5 <= 0 and var_544_1 or var_544_1 * (var_544_6 / var_544_5)

				if var_544_7 > 0 and var_544_1 < var_544_7 then
					arg_541_1.talkMaxDuration = var_544_7

					if var_544_7 + var_544_0 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_7 + var_544_0
					end
				end

				arg_541_1.text_.text = var_544_4
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)
				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_8 = math.max(var_544_1, arg_541_1.talkMaxDuration)

			if var_544_0 <= arg_541_1.time_ and arg_541_1.time_ < var_544_0 + var_544_8 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_0) / var_544_8

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_0 + var_544_8 and arg_541_1.time_ < var_544_0 + var_544_8 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play910201135 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 910201135
		arg_545_1.duration_ = 5

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play910201136(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = 0

			if var_548_0 < arg_545_1.time_ and arg_545_1.time_ <= var_548_0 + arg_548_0 then
				arg_545_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action445")
			end

			local var_548_1 = arg_545_1.actors_["1096ui_story"]
			local var_548_2 = 0

			if var_548_2 < arg_545_1.time_ and arg_545_1.time_ <= var_548_2 + arg_548_0 and arg_545_1.var_.characterEffect1096ui_story == nil then
				arg_545_1.var_.characterEffect1096ui_story = var_548_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_548_3 = 0.2

			if var_548_2 <= arg_545_1.time_ and arg_545_1.time_ < var_548_2 + var_548_3 then
				local var_548_4 = (arg_545_1.time_ - var_548_2) / var_548_3

				if arg_545_1.var_.characterEffect1096ui_story then
					arg_545_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_545_1.time_ >= var_548_2 + var_548_3 and arg_545_1.time_ < var_548_2 + var_548_3 + arg_548_0 and arg_545_1.var_.characterEffect1096ui_story then
				arg_545_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_548_5 = 0

			if var_548_5 < arg_545_1.time_ and arg_545_1.time_ <= var_548_5 + arg_548_0 then
				arg_545_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_548_6 = 0
			local var_548_7 = 0.4

			if var_548_6 < arg_545_1.time_ and arg_545_1.time_ <= var_548_6 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, true)

				local var_548_8 = arg_545_1:FormatText(StoryNameCfg[169].name)

				arg_545_1.leftNameTxt_.text = var_548_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_545_1.leftNameTxt_.transform)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1.leftNameTxt_.text)
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_9 = arg_545_1:GetWordFromCfg(910201135)
				local var_548_10 = arg_545_1:FormatText(var_548_9.content)

				arg_545_1.text_.text = var_548_10

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_11 = 16
				local var_548_12 = utf8.len(var_548_10)
				local var_548_13 = var_548_11 <= 0 and var_548_7 or var_548_7 * (var_548_12 / var_548_11)

				if var_548_13 > 0 and var_548_7 < var_548_13 then
					arg_545_1.talkMaxDuration = var_548_13

					if var_548_13 + var_548_6 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_13 + var_548_6
					end
				end

				arg_545_1.text_.text = var_548_10
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)
				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_14 = math.max(var_548_7, arg_545_1.talkMaxDuration)

			if var_548_6 <= arg_545_1.time_ and arg_545_1.time_ < var_548_6 + var_548_14 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_6) / var_548_14

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_6 + var_548_14 and arg_545_1.time_ < var_548_6 + var_548_14 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play910201136 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 910201136
		arg_549_1.duration_ = 5

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play910201137(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = arg_549_1.actors_["1096ui_story"]
			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 and arg_549_1.var_.characterEffect1096ui_story == nil then
				arg_549_1.var_.characterEffect1096ui_story = var_552_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_552_2 = 0.2

			if var_552_1 <= arg_549_1.time_ and arg_549_1.time_ < var_552_1 + var_552_2 then
				local var_552_3 = (arg_549_1.time_ - var_552_1) / var_552_2

				if arg_549_1.var_.characterEffect1096ui_story then
					local var_552_4 = Mathf.Lerp(0, 0.5, var_552_3)

					arg_549_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_549_1.var_.characterEffect1096ui_story.fillRatio = var_552_4
				end
			end

			if arg_549_1.time_ >= var_552_1 + var_552_2 and arg_549_1.time_ < var_552_1 + var_552_2 + arg_552_0 and arg_549_1.var_.characterEffect1096ui_story then
				local var_552_5 = 0.5

				arg_549_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_549_1.var_.characterEffect1096ui_story.fillRatio = var_552_5
			end

			local var_552_6 = 0
			local var_552_7 = 0.55

			if var_552_6 < arg_549_1.time_ and arg_549_1.time_ <= var_552_6 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, false)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_8 = arg_549_1:GetWordFromCfg(910201136)
				local var_552_9 = arg_549_1:FormatText(var_552_8.content)

				arg_549_1.text_.text = var_552_9

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_10 = 22
				local var_552_11 = utf8.len(var_552_9)
				local var_552_12 = var_552_10 <= 0 and var_552_7 or var_552_7 * (var_552_11 / var_552_10)

				if var_552_12 > 0 and var_552_7 < var_552_12 then
					arg_549_1.talkMaxDuration = var_552_12

					if var_552_12 + var_552_6 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_12 + var_552_6
					end
				end

				arg_549_1.text_.text = var_552_9
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)
				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_13 = math.max(var_552_7, arg_549_1.talkMaxDuration)

			if var_552_6 <= arg_549_1.time_ and arg_549_1.time_ < var_552_6 + var_552_13 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_6) / var_552_13

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_6 + var_552_13 and arg_549_1.time_ < var_552_6 + var_552_13 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play910201137 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 910201137
		arg_553_1.duration_ = 5

		SetActive(arg_553_1.tipsGo_, false)

		function arg_553_1.onSingleLineFinish_()
			arg_553_1.onSingleLineUpdate_ = nil
			arg_553_1.onSingleLineFinish_ = nil
			arg_553_1.state_ = "waiting"
		end

		function arg_553_1.playNext_(arg_555_0)
			if arg_555_0 == 1 then
				arg_553_0:Play910201138(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = arg_553_1.actors_["1096ui_story"]
			local var_556_1 = 0

			if var_556_1 < arg_553_1.time_ and arg_553_1.time_ <= var_556_1 + arg_556_0 and arg_553_1.var_.characterEffect1096ui_story == nil then
				arg_553_1.var_.characterEffect1096ui_story = var_556_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_556_2 = 0.2

			if var_556_1 <= arg_553_1.time_ and arg_553_1.time_ < var_556_1 + var_556_2 then
				local var_556_3 = (arg_553_1.time_ - var_556_1) / var_556_2

				if arg_553_1.var_.characterEffect1096ui_story then
					arg_553_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_553_1.time_ >= var_556_1 + var_556_2 and arg_553_1.time_ < var_556_1 + var_556_2 + arg_556_0 and arg_553_1.var_.characterEffect1096ui_story then
				arg_553_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_556_4 = 0

			if var_556_4 < arg_553_1.time_ and arg_553_1.time_ <= var_556_4 + arg_556_0 then
				arg_553_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_556_5 = 0
			local var_556_6 = 0.8

			if var_556_5 < arg_553_1.time_ and arg_553_1.time_ <= var_556_5 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0
				arg_553_1.dialogCg_.alpha = 1

				arg_553_1.dialog_:SetActive(true)
				SetActive(arg_553_1.leftNameGo_, true)

				local var_556_7 = arg_553_1:FormatText(StoryNameCfg[169].name)

				arg_553_1.leftNameTxt_.text = var_556_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_553_1.leftNameTxt_.transform)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1.leftNameTxt_.text)
				SetActive(arg_553_1.iconTrs_.gameObject, false)
				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_8 = arg_553_1:GetWordFromCfg(910201137)
				local var_556_9 = arg_553_1:FormatText(var_556_8.content)

				arg_553_1.text_.text = var_556_9

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_10 = 32
				local var_556_11 = utf8.len(var_556_9)
				local var_556_12 = var_556_10 <= 0 and var_556_6 or var_556_6 * (var_556_11 / var_556_10)

				if var_556_12 > 0 and var_556_6 < var_556_12 then
					arg_553_1.talkMaxDuration = var_556_12

					if var_556_12 + var_556_5 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_12 + var_556_5
					end
				end

				arg_553_1.text_.text = var_556_9
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)
				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_13 = math.max(var_556_6, arg_553_1.talkMaxDuration)

			if var_556_5 <= arg_553_1.time_ and arg_553_1.time_ < var_556_5 + var_556_13 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_5) / var_556_13

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_5 + var_556_13 and arg_553_1.time_ < var_556_5 + var_556_13 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play910201138 = function(arg_557_0, arg_557_1)
		arg_557_1.time_ = 0
		arg_557_1.frameCnt_ = 0
		arg_557_1.state_ = "playing"
		arg_557_1.curTalkId_ = 910201138
		arg_557_1.duration_ = 5

		SetActive(arg_557_1.tipsGo_, false)

		function arg_557_1.onSingleLineFinish_()
			arg_557_1.onSingleLineUpdate_ = nil
			arg_557_1.onSingleLineFinish_ = nil
			arg_557_1.state_ = "waiting"
		end

		function arg_557_1.playNext_(arg_559_0)
			if arg_559_0 == 1 then
				arg_557_0:Play910201139(arg_557_1)
			end
		end

		function arg_557_1.onSingleLineUpdate_(arg_560_0)
			local var_560_0 = arg_557_1.actors_["1096ui_story"]
			local var_560_1 = 0

			if var_560_1 < arg_557_1.time_ and arg_557_1.time_ <= var_560_1 + arg_560_0 and arg_557_1.var_.characterEffect1096ui_story == nil then
				arg_557_1.var_.characterEffect1096ui_story = var_560_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_560_2 = 0.2

			if var_560_1 <= arg_557_1.time_ and arg_557_1.time_ < var_560_1 + var_560_2 then
				local var_560_3 = (arg_557_1.time_ - var_560_1) / var_560_2

				if arg_557_1.var_.characterEffect1096ui_story then
					local var_560_4 = Mathf.Lerp(0, 0.5, var_560_3)

					arg_557_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_557_1.var_.characterEffect1096ui_story.fillRatio = var_560_4
				end
			end

			if arg_557_1.time_ >= var_560_1 + var_560_2 and arg_557_1.time_ < var_560_1 + var_560_2 + arg_560_0 and arg_557_1.var_.characterEffect1096ui_story then
				local var_560_5 = 0.5

				arg_557_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_557_1.var_.characterEffect1096ui_story.fillRatio = var_560_5
			end

			local var_560_6 = 0
			local var_560_7 = 0.5

			if var_560_6 < arg_557_1.time_ and arg_557_1.time_ <= var_560_6 + arg_560_0 then
				arg_557_1.talkMaxDuration = 0
				arg_557_1.dialogCg_.alpha = 1

				arg_557_1.dialog_:SetActive(true)
				SetActive(arg_557_1.leftNameGo_, true)

				local var_560_8 = arg_557_1:FormatText(StoryNameCfg[7].name)

				arg_557_1.leftNameTxt_.text = var_560_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_557_1.leftNameTxt_.transform)

				arg_557_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_557_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_557_1:RecordName(arg_557_1.leftNameTxt_.text)
				SetActive(arg_557_1.iconTrs_.gameObject, false)
				arg_557_1.callingController_:SetSelectedState("normal")

				local var_560_9 = arg_557_1:GetWordFromCfg(910201138)
				local var_560_10 = arg_557_1:FormatText(var_560_9.content)

				arg_557_1.text_.text = var_560_10

				LuaForUtil.ClearLinePrefixSymbol(arg_557_1.text_)

				local var_560_11 = 20
				local var_560_12 = utf8.len(var_560_10)
				local var_560_13 = var_560_11 <= 0 and var_560_7 or var_560_7 * (var_560_12 / var_560_11)

				if var_560_13 > 0 and var_560_7 < var_560_13 then
					arg_557_1.talkMaxDuration = var_560_13

					if var_560_13 + var_560_6 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_13 + var_560_6
					end
				end

				arg_557_1.text_.text = var_560_10
				arg_557_1.typewritter.percent = 0

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(false)
				arg_557_1:RecordContent(arg_557_1.text_.text)
			end

			local var_560_14 = math.max(var_560_7, arg_557_1.talkMaxDuration)

			if var_560_6 <= arg_557_1.time_ and arg_557_1.time_ < var_560_6 + var_560_14 then
				arg_557_1.typewritter.percent = (arg_557_1.time_ - var_560_6) / var_560_14

				arg_557_1.typewritter:SetDirty()
			end

			if arg_557_1.time_ >= var_560_6 + var_560_14 and arg_557_1.time_ < var_560_6 + var_560_14 + arg_560_0 then
				arg_557_1.typewritter.percent = 1

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(true)
			end
		end
	end,
	Play910201139 = function(arg_561_0, arg_561_1)
		arg_561_1.time_ = 0
		arg_561_1.frameCnt_ = 0
		arg_561_1.state_ = "playing"
		arg_561_1.curTalkId_ = 910201139
		arg_561_1.duration_ = 5

		SetActive(arg_561_1.tipsGo_, false)

		function arg_561_1.onSingleLineFinish_()
			arg_561_1.onSingleLineUpdate_ = nil
			arg_561_1.onSingleLineFinish_ = nil
			arg_561_1.state_ = "waiting"
		end

		function arg_561_1.playNext_(arg_563_0)
			if arg_563_0 == 1 then
				arg_561_0:Play910201140(arg_561_1)
			end
		end

		function arg_561_1.onSingleLineUpdate_(arg_564_0)
			local var_564_0 = arg_561_1.actors_["1096ui_story"]
			local var_564_1 = 0

			if var_564_1 < arg_561_1.time_ and arg_561_1.time_ <= var_564_1 + arg_564_0 and arg_561_1.var_.characterEffect1096ui_story == nil then
				arg_561_1.var_.characterEffect1096ui_story = var_564_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_564_2 = 0.2

			if var_564_1 <= arg_561_1.time_ and arg_561_1.time_ < var_564_1 + var_564_2 then
				local var_564_3 = (arg_561_1.time_ - var_564_1) / var_564_2

				if arg_561_1.var_.characterEffect1096ui_story then
					arg_561_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_561_1.time_ >= var_564_1 + var_564_2 and arg_561_1.time_ < var_564_1 + var_564_2 + arg_564_0 and arg_561_1.var_.characterEffect1096ui_story then
				arg_561_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_564_4 = 0

			if var_564_4 < arg_561_1.time_ and arg_561_1.time_ <= var_564_4 + arg_564_0 then
				arg_561_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action453")
			end

			local var_564_5 = 0

			if var_564_5 < arg_561_1.time_ and arg_561_1.time_ <= var_564_5 + arg_564_0 then
				arg_561_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_564_6 = 0
			local var_564_7 = 1.075

			if var_564_6 < arg_561_1.time_ and arg_561_1.time_ <= var_564_6 + arg_564_0 then
				arg_561_1.talkMaxDuration = 0
				arg_561_1.dialogCg_.alpha = 1

				arg_561_1.dialog_:SetActive(true)
				SetActive(arg_561_1.leftNameGo_, true)

				local var_564_8 = arg_561_1:FormatText(StoryNameCfg[169].name)

				arg_561_1.leftNameTxt_.text = var_564_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_561_1.leftNameTxt_.transform)

				arg_561_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_561_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_561_1:RecordName(arg_561_1.leftNameTxt_.text)
				SetActive(arg_561_1.iconTrs_.gameObject, false)
				arg_561_1.callingController_:SetSelectedState("normal")

				local var_564_9 = arg_561_1:GetWordFromCfg(910201139)
				local var_564_10 = arg_561_1:FormatText(var_564_9.content)

				arg_561_1.text_.text = var_564_10

				LuaForUtil.ClearLinePrefixSymbol(arg_561_1.text_)

				local var_564_11 = 43
				local var_564_12 = utf8.len(var_564_10)
				local var_564_13 = var_564_11 <= 0 and var_564_7 or var_564_7 * (var_564_12 / var_564_11)

				if var_564_13 > 0 and var_564_7 < var_564_13 then
					arg_561_1.talkMaxDuration = var_564_13

					if var_564_13 + var_564_6 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_13 + var_564_6
					end
				end

				arg_561_1.text_.text = var_564_10
				arg_561_1.typewritter.percent = 0

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(false)
				arg_561_1:RecordContent(arg_561_1.text_.text)
			end

			local var_564_14 = math.max(var_564_7, arg_561_1.talkMaxDuration)

			if var_564_6 <= arg_561_1.time_ and arg_561_1.time_ < var_564_6 + var_564_14 then
				arg_561_1.typewritter.percent = (arg_561_1.time_ - var_564_6) / var_564_14

				arg_561_1.typewritter:SetDirty()
			end

			if arg_561_1.time_ >= var_564_6 + var_564_14 and arg_561_1.time_ < var_564_6 + var_564_14 + arg_564_0 then
				arg_561_1.typewritter.percent = 1

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(true)
			end
		end
	end,
	Play910201140 = function(arg_565_0, arg_565_1)
		arg_565_1.time_ = 0
		arg_565_1.frameCnt_ = 0
		arg_565_1.state_ = "playing"
		arg_565_1.curTalkId_ = 910201140
		arg_565_1.duration_ = 5

		SetActive(arg_565_1.tipsGo_, false)

		function arg_565_1.onSingleLineFinish_()
			arg_565_1.onSingleLineUpdate_ = nil
			arg_565_1.onSingleLineFinish_ = nil
			arg_565_1.state_ = "waiting"
		end

		function arg_565_1.playNext_(arg_567_0)
			if arg_567_0 == 1 then
				arg_565_0:Play910201141(arg_565_1)
			end
		end

		function arg_565_1.onSingleLineUpdate_(arg_568_0)
			local var_568_0 = arg_565_1.actors_["1096ui_story"]
			local var_568_1 = 0

			if var_568_1 < arg_565_1.time_ and arg_565_1.time_ <= var_568_1 + arg_568_0 and arg_565_1.var_.characterEffect1096ui_story == nil then
				arg_565_1.var_.characterEffect1096ui_story = var_568_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_568_2 = 0.2

			if var_568_1 <= arg_565_1.time_ and arg_565_1.time_ < var_568_1 + var_568_2 then
				local var_568_3 = (arg_565_1.time_ - var_568_1) / var_568_2

				if arg_565_1.var_.characterEffect1096ui_story then
					local var_568_4 = Mathf.Lerp(0, 0.5, var_568_3)

					arg_565_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_565_1.var_.characterEffect1096ui_story.fillRatio = var_568_4
				end
			end

			if arg_565_1.time_ >= var_568_1 + var_568_2 and arg_565_1.time_ < var_568_1 + var_568_2 + arg_568_0 and arg_565_1.var_.characterEffect1096ui_story then
				local var_568_5 = 0.5

				arg_565_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_565_1.var_.characterEffect1096ui_story.fillRatio = var_568_5
			end

			local var_568_6 = 0
			local var_568_7 = 0.3

			if var_568_6 < arg_565_1.time_ and arg_565_1.time_ <= var_568_6 + arg_568_0 then
				arg_565_1.talkMaxDuration = 0
				arg_565_1.dialogCg_.alpha = 1

				arg_565_1.dialog_:SetActive(true)
				SetActive(arg_565_1.leftNameGo_, true)

				local var_568_8 = arg_565_1:FormatText(StoryNameCfg[7].name)

				arg_565_1.leftNameTxt_.text = var_568_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_565_1.leftNameTxt_.transform)

				arg_565_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_565_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_565_1:RecordName(arg_565_1.leftNameTxt_.text)
				SetActive(arg_565_1.iconTrs_.gameObject, false)
				arg_565_1.callingController_:SetSelectedState("normal")

				local var_568_9 = arg_565_1:GetWordFromCfg(910201140)
				local var_568_10 = arg_565_1:FormatText(var_568_9.content)

				arg_565_1.text_.text = var_568_10

				LuaForUtil.ClearLinePrefixSymbol(arg_565_1.text_)

				local var_568_11 = 12
				local var_568_12 = utf8.len(var_568_10)
				local var_568_13 = var_568_11 <= 0 and var_568_7 or var_568_7 * (var_568_12 / var_568_11)

				if var_568_13 > 0 and var_568_7 < var_568_13 then
					arg_565_1.talkMaxDuration = var_568_13

					if var_568_13 + var_568_6 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_13 + var_568_6
					end
				end

				arg_565_1.text_.text = var_568_10
				arg_565_1.typewritter.percent = 0

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(false)
				arg_565_1:RecordContent(arg_565_1.text_.text)
			end

			local var_568_14 = math.max(var_568_7, arg_565_1.talkMaxDuration)

			if var_568_6 <= arg_565_1.time_ and arg_565_1.time_ < var_568_6 + var_568_14 then
				arg_565_1.typewritter.percent = (arg_565_1.time_ - var_568_6) / var_568_14

				arg_565_1.typewritter:SetDirty()
			end

			if arg_565_1.time_ >= var_568_6 + var_568_14 and arg_565_1.time_ < var_568_6 + var_568_14 + arg_568_0 then
				arg_565_1.typewritter.percent = 1

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(true)
			end
		end
	end,
	Play910201141 = function(arg_569_0, arg_569_1)
		arg_569_1.time_ = 0
		arg_569_1.frameCnt_ = 0
		arg_569_1.state_ = "playing"
		arg_569_1.curTalkId_ = 910201141
		arg_569_1.duration_ = 5

		SetActive(arg_569_1.tipsGo_, false)

		function arg_569_1.onSingleLineFinish_()
			arg_569_1.onSingleLineUpdate_ = nil
			arg_569_1.onSingleLineFinish_ = nil
			arg_569_1.state_ = "waiting"
		end

		function arg_569_1.playNext_(arg_571_0)
			if arg_571_0 == 1 then
				arg_569_0:Play910201142(arg_569_1)
			end
		end

		function arg_569_1.onSingleLineUpdate_(arg_572_0)
			local var_572_0 = arg_569_1.actors_["1096ui_story"]
			local var_572_1 = 0

			if var_572_1 < arg_569_1.time_ and arg_569_1.time_ <= var_572_1 + arg_572_0 and arg_569_1.var_.characterEffect1096ui_story == nil then
				arg_569_1.var_.characterEffect1096ui_story = var_572_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_572_2 = 0.2

			if var_572_1 <= arg_569_1.time_ and arg_569_1.time_ < var_572_1 + var_572_2 then
				local var_572_3 = (arg_569_1.time_ - var_572_1) / var_572_2

				if arg_569_1.var_.characterEffect1096ui_story then
					arg_569_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_569_1.time_ >= var_572_1 + var_572_2 and arg_569_1.time_ < var_572_1 + var_572_2 + arg_572_0 and arg_569_1.var_.characterEffect1096ui_story then
				arg_569_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_572_4 = 0

			if var_572_4 < arg_569_1.time_ and arg_569_1.time_ <= var_572_4 + arg_572_0 then
				arg_569_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action435")
			end

			local var_572_5 = 0

			if var_572_5 < arg_569_1.time_ and arg_569_1.time_ <= var_572_5 + arg_572_0 then
				arg_569_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_572_6 = 0
			local var_572_7 = 0.175

			if var_572_6 < arg_569_1.time_ and arg_569_1.time_ <= var_572_6 + arg_572_0 then
				arg_569_1.talkMaxDuration = 0
				arg_569_1.dialogCg_.alpha = 1

				arg_569_1.dialog_:SetActive(true)
				SetActive(arg_569_1.leftNameGo_, true)

				local var_572_8 = arg_569_1:FormatText(StoryNameCfg[169].name)

				arg_569_1.leftNameTxt_.text = var_572_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_569_1.leftNameTxt_.transform)

				arg_569_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_569_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_569_1:RecordName(arg_569_1.leftNameTxt_.text)
				SetActive(arg_569_1.iconTrs_.gameObject, false)
				arg_569_1.callingController_:SetSelectedState("normal")

				local var_572_9 = arg_569_1:GetWordFromCfg(910201141)
				local var_572_10 = arg_569_1:FormatText(var_572_9.content)

				arg_569_1.text_.text = var_572_10

				LuaForUtil.ClearLinePrefixSymbol(arg_569_1.text_)

				local var_572_11 = 7
				local var_572_12 = utf8.len(var_572_10)
				local var_572_13 = var_572_11 <= 0 and var_572_7 or var_572_7 * (var_572_12 / var_572_11)

				if var_572_13 > 0 and var_572_7 < var_572_13 then
					arg_569_1.talkMaxDuration = var_572_13

					if var_572_13 + var_572_6 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_13 + var_572_6
					end
				end

				arg_569_1.text_.text = var_572_10
				arg_569_1.typewritter.percent = 0

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(false)
				arg_569_1:RecordContent(arg_569_1.text_.text)
			end

			local var_572_14 = math.max(var_572_7, arg_569_1.talkMaxDuration)

			if var_572_6 <= arg_569_1.time_ and arg_569_1.time_ < var_572_6 + var_572_14 then
				arg_569_1.typewritter.percent = (arg_569_1.time_ - var_572_6) / var_572_14

				arg_569_1.typewritter:SetDirty()
			end

			if arg_569_1.time_ >= var_572_6 + var_572_14 and arg_569_1.time_ < var_572_6 + var_572_14 + arg_572_0 then
				arg_569_1.typewritter.percent = 1

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(true)
			end
		end
	end,
	Play910201142 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 910201142
		arg_573_1.duration_ = 5

		SetActive(arg_573_1.tipsGo_, false)

		function arg_573_1.onSingleLineFinish_()
			arg_573_1.onSingleLineUpdate_ = nil
			arg_573_1.onSingleLineFinish_ = nil
			arg_573_1.state_ = "waiting"
		end

		function arg_573_1.playNext_(arg_575_0)
			if arg_575_0 == 1 then
				arg_573_0:Play910201143(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = arg_573_1.actors_["1096ui_story"]
			local var_576_1 = 0

			if var_576_1 < arg_573_1.time_ and arg_573_1.time_ <= var_576_1 + arg_576_0 and arg_573_1.var_.characterEffect1096ui_story == nil then
				arg_573_1.var_.characterEffect1096ui_story = var_576_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_576_2 = 0.2

			if var_576_1 <= arg_573_1.time_ and arg_573_1.time_ < var_576_1 + var_576_2 then
				local var_576_3 = (arg_573_1.time_ - var_576_1) / var_576_2

				if arg_573_1.var_.characterEffect1096ui_story then
					local var_576_4 = Mathf.Lerp(0, 0.5, var_576_3)

					arg_573_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_573_1.var_.characterEffect1096ui_story.fillRatio = var_576_4
				end
			end

			if arg_573_1.time_ >= var_576_1 + var_576_2 and arg_573_1.time_ < var_576_1 + var_576_2 + arg_576_0 and arg_573_1.var_.characterEffect1096ui_story then
				local var_576_5 = 0.5

				arg_573_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_573_1.var_.characterEffect1096ui_story.fillRatio = var_576_5
			end

			local var_576_6 = 0
			local var_576_7 = 0.075

			if var_576_6 < arg_573_1.time_ and arg_573_1.time_ <= var_576_6 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0
				arg_573_1.dialogCg_.alpha = 1

				arg_573_1.dialog_:SetActive(true)
				SetActive(arg_573_1.leftNameGo_, true)

				local var_576_8 = arg_573_1:FormatText(StoryNameCfg[7].name)

				arg_573_1.leftNameTxt_.text = var_576_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_573_1.leftNameTxt_.transform)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1.leftNameTxt_.text)
				SetActive(arg_573_1.iconTrs_.gameObject, false)
				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_9 = arg_573_1:GetWordFromCfg(910201142)
				local var_576_10 = arg_573_1:FormatText(var_576_9.content)

				arg_573_1.text_.text = var_576_10

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_11 = 3
				local var_576_12 = utf8.len(var_576_10)
				local var_576_13 = var_576_11 <= 0 and var_576_7 or var_576_7 * (var_576_12 / var_576_11)

				if var_576_13 > 0 and var_576_7 < var_576_13 then
					arg_573_1.talkMaxDuration = var_576_13

					if var_576_13 + var_576_6 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_13 + var_576_6
					end
				end

				arg_573_1.text_.text = var_576_10
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)
				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_14 = math.max(var_576_7, arg_573_1.talkMaxDuration)

			if var_576_6 <= arg_573_1.time_ and arg_573_1.time_ < var_576_6 + var_576_14 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_6) / var_576_14

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_6 + var_576_14 and arg_573_1.time_ < var_576_6 + var_576_14 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play910201143 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 910201143
		arg_577_1.duration_ = 5

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play910201144(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = arg_577_1.actors_["1096ui_story"]
			local var_580_1 = 0

			if var_580_1 < arg_577_1.time_ and arg_577_1.time_ <= var_580_1 + arg_580_0 and arg_577_1.var_.characterEffect1096ui_story == nil then
				arg_577_1.var_.characterEffect1096ui_story = var_580_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_580_2 = 0.2

			if var_580_1 <= arg_577_1.time_ and arg_577_1.time_ < var_580_1 + var_580_2 then
				local var_580_3 = (arg_577_1.time_ - var_580_1) / var_580_2

				if arg_577_1.var_.characterEffect1096ui_story then
					arg_577_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_577_1.time_ >= var_580_1 + var_580_2 and arg_577_1.time_ < var_580_1 + var_580_2 + arg_580_0 and arg_577_1.var_.characterEffect1096ui_story then
				arg_577_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_580_4 = 0

			if var_580_4 < arg_577_1.time_ and arg_577_1.time_ <= var_580_4 + arg_580_0 then
				arg_577_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_580_5 = 0
			local var_580_6 = 0.325

			if var_580_5 < arg_577_1.time_ and arg_577_1.time_ <= var_580_5 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, true)

				local var_580_7 = arg_577_1:FormatText(StoryNameCfg[169].name)

				arg_577_1.leftNameTxt_.text = var_580_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_577_1.leftNameTxt_.transform)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1.leftNameTxt_.text)
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_8 = arg_577_1:GetWordFromCfg(910201143)
				local var_580_9 = arg_577_1:FormatText(var_580_8.content)

				arg_577_1.text_.text = var_580_9

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_10 = 13
				local var_580_11 = utf8.len(var_580_9)
				local var_580_12 = var_580_10 <= 0 and var_580_6 or var_580_6 * (var_580_11 / var_580_10)

				if var_580_12 > 0 and var_580_6 < var_580_12 then
					arg_577_1.talkMaxDuration = var_580_12

					if var_580_12 + var_580_5 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_12 + var_580_5
					end
				end

				arg_577_1.text_.text = var_580_9
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)
				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_13 = math.max(var_580_6, arg_577_1.talkMaxDuration)

			if var_580_5 <= arg_577_1.time_ and arg_577_1.time_ < var_580_5 + var_580_13 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_5) / var_580_13

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_5 + var_580_13 and arg_577_1.time_ < var_580_5 + var_580_13 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play910201144 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 910201144
		arg_581_1.duration_ = 5

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play910201145(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = 0

			if var_584_0 < arg_581_1.time_ and arg_581_1.time_ <= var_584_0 + arg_584_0 then
				arg_581_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action453")
			end

			local var_584_1 = 0
			local var_584_2 = 1.25

			if var_584_1 < arg_581_1.time_ and arg_581_1.time_ <= var_584_1 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, false)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_3 = arg_581_1:GetWordFromCfg(910201144)
				local var_584_4 = arg_581_1:FormatText(var_584_3.content)

				arg_581_1.text_.text = var_584_4

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_5 = 50
				local var_584_6 = utf8.len(var_584_4)
				local var_584_7 = var_584_5 <= 0 and var_584_2 or var_584_2 * (var_584_6 / var_584_5)

				if var_584_7 > 0 and var_584_2 < var_584_7 then
					arg_581_1.talkMaxDuration = var_584_7

					if var_584_7 + var_584_1 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_7 + var_584_1
					end
				end

				arg_581_1.text_.text = var_584_4
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)
				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_8 = math.max(var_584_2, arg_581_1.talkMaxDuration)

			if var_584_1 <= arg_581_1.time_ and arg_581_1.time_ < var_584_1 + var_584_8 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_1) / var_584_8

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_1 + var_584_8 and arg_581_1.time_ < var_584_1 + var_584_8 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play910201145 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 910201145
		arg_585_1.duration_ = 6.533333333332

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play910201146(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = arg_585_1.actors_["1096ui_story"].transform
			local var_588_1 = 1.966

			if var_588_1 < arg_585_1.time_ and arg_585_1.time_ <= var_588_1 + arg_588_0 then
				arg_585_1.var_.moveOldPos1096ui_story = var_588_0.localPosition
			end

			local var_588_2 = 0.001

			if var_588_1 <= arg_585_1.time_ and arg_585_1.time_ < var_588_1 + var_588_2 then
				local var_588_3 = (arg_585_1.time_ - var_588_1) / var_588_2
				local var_588_4 = Vector3.New(0, 100, 0)

				var_588_0.localPosition = Vector3.Lerp(arg_585_1.var_.moveOldPos1096ui_story, var_588_4, var_588_3)

				local var_588_5 = manager.ui.mainCamera.transform.position - var_588_0.position

				var_588_0.forward = Vector3.New(var_588_5.x, var_588_5.y, var_588_5.z)

				local var_588_6 = var_588_0.localEulerAngles

				var_588_6.z = 0
				var_588_6.x = 0
				var_588_0.localEulerAngles = var_588_6
			end

			if arg_585_1.time_ >= var_588_1 + var_588_2 and arg_585_1.time_ < var_588_1 + var_588_2 + arg_588_0 then
				var_588_0.localPosition = Vector3.New(0, 100, 0)

				local var_588_7 = manager.ui.mainCamera.transform.position - var_588_0.position

				var_588_0.forward = Vector3.New(var_588_7.x, var_588_7.y, var_588_7.z)

				local var_588_8 = var_588_0.localEulerAngles

				var_588_8.z = 0
				var_588_8.x = 0
				var_588_0.localEulerAngles = var_588_8
			end

			local var_588_9 = 0

			if var_588_9 < arg_585_1.time_ and arg_585_1.time_ <= var_588_9 + arg_588_0 then
				arg_585_1.mask_.enabled = true
				arg_585_1.mask_.raycastTarget = true

				arg_585_1:SetGaussion(false)
			end

			local var_588_10 = 1.966

			if var_588_9 <= arg_585_1.time_ and arg_585_1.time_ < var_588_9 + var_588_10 then
				local var_588_11 = (arg_585_1.time_ - var_588_9) / var_588_10
				local var_588_12 = Color.New(0, 0, 0)

				var_588_12.a = Mathf.Lerp(0, 1, var_588_11)
				arg_585_1.mask_.color = var_588_12
			end

			if arg_585_1.time_ >= var_588_9 + var_588_10 and arg_585_1.time_ < var_588_9 + var_588_10 + arg_588_0 then
				local var_588_13 = Color.New(0, 0, 0)

				var_588_13.a = 1
				arg_585_1.mask_.color = var_588_13
			end

			local var_588_14 = 1.966

			if var_588_14 < arg_585_1.time_ and arg_585_1.time_ <= var_588_14 + arg_588_0 then
				arg_585_1.mask_.enabled = true
				arg_585_1.mask_.raycastTarget = true

				arg_585_1:SetGaussion(false)
			end

			local var_588_15 = 1.966

			if var_588_14 <= arg_585_1.time_ and arg_585_1.time_ < var_588_14 + var_588_15 then
				local var_588_16 = (arg_585_1.time_ - var_588_14) / var_588_15
				local var_588_17 = Color.New(0, 0, 0)

				var_588_17.a = Mathf.Lerp(1, 0, var_588_16)
				arg_585_1.mask_.color = var_588_17
			end

			if arg_585_1.time_ >= var_588_14 + var_588_15 and arg_585_1.time_ < var_588_14 + var_588_15 + arg_588_0 then
				local var_588_18 = Color.New(0, 0, 0)
				local var_588_19 = 0

				arg_585_1.mask_.enabled = false
				var_588_18.a = var_588_19
				arg_585_1.mask_.color = var_588_18
			end

			local var_588_20 = 1.98266666666667

			if var_588_20 < arg_585_1.time_ and arg_585_1.time_ <= var_588_20 + arg_588_0 then
				arg_585_1.var_.oldValueTypewriter = arg_585_1.fswtw_.percent

				arg_585_1:ShowNextGo(false)
			end

			local var_588_21 = 14
			local var_588_22 = 0.933333333333333
			local var_588_23 = arg_585_1:GetWordFromCfg(910201145)
			local var_588_24 = arg_585_1:FormatText(var_588_23.content)
			local var_588_25, var_588_26 = arg_585_1:GetPercentByPara(var_588_24, 1)

			if var_588_20 < arg_585_1.time_ and arg_585_1.time_ <= var_588_20 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0

				local var_588_27 = var_588_21 <= 0 and var_588_22 or var_588_22 * ((var_588_26 - arg_585_1.typewritterCharCountI18N) / var_588_21)

				if var_588_27 > 0 and var_588_22 < var_588_27 then
					arg_585_1.talkMaxDuration = var_588_27

					if var_588_27 + var_588_20 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_27 + var_588_20
					end
				end
			end

			local var_588_28 = 0.933333333333333
			local var_588_29 = math.max(var_588_28, arg_585_1.talkMaxDuration)

			if var_588_20 <= arg_585_1.time_ and arg_585_1.time_ < var_588_20 + var_588_29 then
				local var_588_30 = (arg_585_1.time_ - var_588_20) / var_588_29

				arg_585_1.fswtw_.percent = Mathf.Lerp(arg_585_1.var_.oldValueTypewriter, var_588_25, var_588_30)
				arg_585_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_585_1.fswtw_:SetDirty()
			end

			if arg_585_1.time_ >= var_588_20 + var_588_29 and arg_585_1.time_ < var_588_20 + var_588_29 + arg_588_0 then
				arg_585_1.fswtw_.percent = var_588_25

				arg_585_1.fswtw_:SetDirty()
				arg_585_1:ShowNextGo(true)

				arg_585_1.typewritterCharCountI18N = var_588_26
			end

			local var_588_31 = 1.966

			if var_588_31 < arg_585_1.time_ and arg_585_1.time_ <= var_588_31 + arg_588_0 then
				arg_585_1.fswbg_:SetActive(true)
				arg_585_1.dialog_:SetActive(false)

				arg_585_1.fswtw_.percent = 0

				local var_588_32 = arg_585_1:GetWordFromCfg(910201145)
				local var_588_33 = arg_585_1:FormatText(var_588_32.content)

				arg_585_1.fswt_.text = var_588_33

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.fswt_)

				arg_585_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_585_1.fswtw_:SetDirty()

				arg_585_1.typewritterCharCountI18N = 0

				SetActive(arg_585_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_585_1:ShowNextGo(false)
			end

			local var_588_34 = 1.966

			if var_588_34 < arg_585_1.time_ and arg_585_1.time_ <= var_588_34 + arg_588_0 then
				local var_588_35 = arg_585_1.fswbg_.transform:Find("textbox/adapt/content") or arg_585_1.fswbg_.transform:Find("textbox/content")
				local var_588_36 = var_588_35:GetComponent("Text")
				local var_588_37 = var_588_35:GetComponent("RectTransform")

				var_588_36.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_588_37.offsetMin = Vector2.New(0, 0)
				var_588_37.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play910201146 = function(arg_589_0, arg_589_1)
		arg_589_1.time_ = 0
		arg_589_1.frameCnt_ = 0
		arg_589_1.state_ = "playing"
		arg_589_1.curTalkId_ = 910201146
		arg_589_1.duration_ = 1.333333333332

		SetActive(arg_589_1.tipsGo_, false)

		function arg_589_1.onSingleLineFinish_()
			arg_589_1.onSingleLineUpdate_ = nil
			arg_589_1.onSingleLineFinish_ = nil
			arg_589_1.state_ = "waiting"
		end

		function arg_589_1.playNext_(arg_591_0)
			if arg_591_0 == 1 then
				arg_589_0:Play910201147(arg_589_1)
			end
		end

		function arg_589_1.onSingleLineUpdate_(arg_592_0)
			local var_592_0 = 0

			if var_592_0 < arg_589_1.time_ and arg_589_1.time_ <= var_592_0 + arg_592_0 then
				arg_589_1.var_.oldValueTypewriter = arg_589_1.fswtw_.percent

				arg_589_1:ShowNextGo(false)
			end

			local var_592_1 = 34
			local var_592_2 = 1.33333333333333
			local var_592_3 = arg_589_1:GetWordFromCfg(910201145)
			local var_592_4 = arg_589_1:FormatText(var_592_3.content)
			local var_592_5, var_592_6 = arg_589_1:GetPercentByPara(var_592_4, 2)

			if var_592_0 < arg_589_1.time_ and arg_589_1.time_ <= var_592_0 + arg_592_0 then
				arg_589_1.talkMaxDuration = 0

				local var_592_7 = var_592_1 <= 0 and var_592_2 or var_592_2 * ((var_592_6 - arg_589_1.typewritterCharCountI18N) / var_592_1)

				if var_592_7 > 0 and var_592_2 < var_592_7 then
					arg_589_1.talkMaxDuration = var_592_7

					if var_592_7 + var_592_0 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_7 + var_592_0
					end
				end
			end

			local var_592_8 = 1.33333333333333
			local var_592_9 = math.max(var_592_8, arg_589_1.talkMaxDuration)

			if var_592_0 <= arg_589_1.time_ and arg_589_1.time_ < var_592_0 + var_592_9 then
				local var_592_10 = (arg_589_1.time_ - var_592_0) / var_592_9

				arg_589_1.fswtw_.percent = Mathf.Lerp(arg_589_1.var_.oldValueTypewriter, var_592_5, var_592_10)
				arg_589_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_589_1.fswtw_:SetDirty()
			end

			if arg_589_1.time_ >= var_592_0 + var_592_9 and arg_589_1.time_ < var_592_0 + var_592_9 + arg_592_0 then
				arg_589_1.fswtw_.percent = var_592_5

				arg_589_1.fswtw_:SetDirty()
				arg_589_1:ShowNextGo(true)

				arg_589_1.typewritterCharCountI18N = var_592_6
			end
		end
	end,
	Play910201147 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 910201147
		arg_593_1.duration_ = 0.999999999999

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play910201148(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = 0

			if var_596_0 < arg_593_1.time_ and arg_593_1.time_ <= var_596_0 + arg_596_0 then
				arg_593_1.var_.oldValueTypewriter = arg_593_1.fswtw_.percent

				arg_593_1:ShowNextGo(false)
			end

			local var_596_1 = 5
			local var_596_2 = 0.333333333333333
			local var_596_3 = arg_593_1:GetWordFromCfg(910201145)
			local var_596_4 = arg_593_1:FormatText(var_596_3.content)
			local var_596_5, var_596_6 = arg_593_1:GetPercentByPara(var_596_4, 3)

			if var_596_0 < arg_593_1.time_ and arg_593_1.time_ <= var_596_0 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0

				local var_596_7 = var_596_1 <= 0 and var_596_2 or var_596_2 * ((var_596_6 - arg_593_1.typewritterCharCountI18N) / var_596_1)

				if var_596_7 > 0 and var_596_2 < var_596_7 then
					arg_593_1.talkMaxDuration = var_596_7

					if var_596_7 + var_596_0 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_7 + var_596_0
					end
				end
			end

			local var_596_8 = 0.333333333333333
			local var_596_9 = math.max(var_596_8, arg_593_1.talkMaxDuration)

			if var_596_0 <= arg_593_1.time_ and arg_593_1.time_ < var_596_0 + var_596_9 then
				local var_596_10 = (arg_593_1.time_ - var_596_0) / var_596_9

				arg_593_1.fswtw_.percent = Mathf.Lerp(arg_593_1.var_.oldValueTypewriter, var_596_5, var_596_10)
				arg_593_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_593_1.fswtw_:SetDirty()
			end

			if arg_593_1.time_ >= var_596_0 + var_596_9 and arg_593_1.time_ < var_596_0 + var_596_9 + arg_596_0 then
				arg_593_1.fswtw_.percent = var_596_5

				arg_593_1.fswtw_:SetDirty()
				arg_593_1:ShowNextGo(true)

				arg_593_1.typewritterCharCountI18N = var_596_6
			end
		end
	end,
	Play910201148 = function(arg_597_0, arg_597_1)
		arg_597_1.time_ = 0
		arg_597_1.frameCnt_ = 0
		arg_597_1.state_ = "playing"
		arg_597_1.curTalkId_ = 910201148
		arg_597_1.duration_ = 9

		SetActive(arg_597_1.tipsGo_, false)

		function arg_597_1.onSingleLineFinish_()
			arg_597_1.onSingleLineUpdate_ = nil
			arg_597_1.onSingleLineFinish_ = nil
			arg_597_1.state_ = "waiting"
		end

		function arg_597_1.playNext_(arg_599_0)
			if arg_599_0 == 1 then
				arg_597_0:Play910201149(arg_597_1)
			end
		end

		function arg_597_1.onSingleLineUpdate_(arg_600_0)
			local var_600_0 = 0

			if var_600_0 < arg_597_1.time_ and arg_597_1.time_ <= var_600_0 + arg_600_0 then
				arg_597_1.mask_.enabled = true
				arg_597_1.mask_.raycastTarget = true

				arg_597_1:SetGaussion(false)
			end

			local var_600_1 = 2

			if var_600_0 <= arg_597_1.time_ and arg_597_1.time_ < var_600_0 + var_600_1 then
				local var_600_2 = (arg_597_1.time_ - var_600_0) / var_600_1
				local var_600_3 = Color.New(0, 0, 0)

				var_600_3.a = Mathf.Lerp(0, 1, var_600_2)
				arg_597_1.mask_.color = var_600_3
			end

			if arg_597_1.time_ >= var_600_0 + var_600_1 and arg_597_1.time_ < var_600_0 + var_600_1 + arg_600_0 then
				local var_600_4 = Color.New(0, 0, 0)

				var_600_4.a = 1
				arg_597_1.mask_.color = var_600_4
			end

			local var_600_5 = 2

			if var_600_5 < arg_597_1.time_ and arg_597_1.time_ <= var_600_5 + arg_600_0 then
				arg_597_1.mask_.enabled = true
				arg_597_1.mask_.raycastTarget = true

				arg_597_1:SetGaussion(false)
			end

			local var_600_6 = 2

			if var_600_5 <= arg_597_1.time_ and arg_597_1.time_ < var_600_5 + var_600_6 then
				local var_600_7 = (arg_597_1.time_ - var_600_5) / var_600_6
				local var_600_8 = Color.New(0, 0, 0)

				var_600_8.a = Mathf.Lerp(1, 0, var_600_7)
				arg_597_1.mask_.color = var_600_8
			end

			if arg_597_1.time_ >= var_600_5 + var_600_6 and arg_597_1.time_ < var_600_5 + var_600_6 + arg_600_0 then
				local var_600_9 = Color.New(0, 0, 0)
				local var_600_10 = 0

				arg_597_1.mask_.enabled = false
				var_600_9.a = var_600_10
				arg_597_1.mask_.color = var_600_9
			end

			local var_600_11 = 1.98333333333333

			if var_600_11 < arg_597_1.time_ and arg_597_1.time_ <= var_600_11 + arg_600_0 then
				arg_597_1.fswbg_:SetActive(false)
				arg_597_1.dialog_:SetActive(true)
				arg_597_1:ShowNextGo(false)
			end

			if arg_597_1.frameCnt_ <= 1 then
				arg_597_1.dialog_:SetActive(false)
			end

			local var_600_12 = 4
			local var_600_13 = 0.5

			if var_600_12 < arg_597_1.time_ and arg_597_1.time_ <= var_600_12 + arg_600_0 then
				arg_597_1.talkMaxDuration = 0

				arg_597_1.dialog_:SetActive(true)

				local var_600_14 = LeanTween.value(arg_597_1.dialog_, 0, 1, 0.3)

				var_600_14:setOnUpdate(LuaHelper.FloatAction(function(arg_601_0)
					arg_597_1.dialogCg_.alpha = arg_601_0
				end))
				var_600_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_597_1.dialog_)
					var_600_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_597_1.duration_ = arg_597_1.duration_ + 0.3

				SetActive(arg_597_1.leftNameGo_, false)

				arg_597_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_597_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_597_1:RecordName(arg_597_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_597_1.iconTrs_.gameObject, false)
				arg_597_1.callingController_:SetSelectedState("normal")

				local var_600_15 = arg_597_1:GetWordFromCfg(910201148)
				local var_600_16 = arg_597_1:FormatText(var_600_15.content)

				arg_597_1.text_.text = var_600_16

				LuaForUtil.ClearLinePrefixSymbol(arg_597_1.text_)

				local var_600_17 = 20
				local var_600_18 = utf8.len(var_600_16)
				local var_600_19 = var_600_17 <= 0 and var_600_13 or var_600_13 * (var_600_18 / var_600_17)

				if var_600_19 > 0 and var_600_13 < var_600_19 then
					arg_597_1.talkMaxDuration = var_600_19
					var_600_12 = var_600_12 + 0.3

					if var_600_19 + var_600_12 > arg_597_1.duration_ then
						arg_597_1.duration_ = var_600_19 + var_600_12
					end
				end

				arg_597_1.text_.text = var_600_16
				arg_597_1.typewritter.percent = 0

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(false)
				arg_597_1:RecordContent(arg_597_1.text_.text)
			end

			local var_600_20 = var_600_12 + 0.3
			local var_600_21 = math.max(var_600_13, arg_597_1.talkMaxDuration)

			if var_600_20 <= arg_597_1.time_ and arg_597_1.time_ < var_600_20 + var_600_21 then
				arg_597_1.typewritter.percent = (arg_597_1.time_ - var_600_20) / var_600_21

				arg_597_1.typewritter:SetDirty()
			end

			if arg_597_1.time_ >= var_600_20 + var_600_21 and arg_597_1.time_ < var_600_20 + var_600_21 + arg_600_0 then
				arg_597_1.typewritter.percent = 1

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(true)
			end
		end
	end,
	Play910201149 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 910201149
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play910201150(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = arg_603_1.actors_["1096ui_story"]
			local var_606_1 = 0

			if var_606_1 < arg_603_1.time_ and arg_603_1.time_ <= var_606_1 + arg_606_0 and arg_603_1.var_.characterEffect1096ui_story == nil then
				arg_603_1.var_.characterEffect1096ui_story = var_606_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_606_2 = 0.2

			if var_606_1 <= arg_603_1.time_ and arg_603_1.time_ < var_606_1 + var_606_2 then
				local var_606_3 = (arg_603_1.time_ - var_606_1) / var_606_2

				if arg_603_1.var_.characterEffect1096ui_story then
					arg_603_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_603_1.time_ >= var_606_1 + var_606_2 and arg_603_1.time_ < var_606_1 + var_606_2 + arg_606_0 and arg_603_1.var_.characterEffect1096ui_story then
				arg_603_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_606_4 = 0

			if var_606_4 < arg_603_1.time_ and arg_603_1.time_ <= var_606_4 + arg_606_0 then
				arg_603_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action432")
			end

			local var_606_5 = 0

			if var_606_5 < arg_603_1.time_ and arg_603_1.time_ <= var_606_5 + arg_606_0 then
				arg_603_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_606_6 = arg_603_1.actors_["1096ui_story"].transform
			local var_606_7 = 0

			if var_606_7 < arg_603_1.time_ and arg_603_1.time_ <= var_606_7 + arg_606_0 then
				arg_603_1.var_.moveOldPos1096ui_story = var_606_6.localPosition
			end

			local var_606_8 = 0.001

			if var_606_7 <= arg_603_1.time_ and arg_603_1.time_ < var_606_7 + var_606_8 then
				local var_606_9 = (arg_603_1.time_ - var_606_7) / var_606_8
				local var_606_10 = Vector3.New(0, -1.13, -5.6)

				var_606_6.localPosition = Vector3.Lerp(arg_603_1.var_.moveOldPos1096ui_story, var_606_10, var_606_9)

				local var_606_11 = manager.ui.mainCamera.transform.position - var_606_6.position

				var_606_6.forward = Vector3.New(var_606_11.x, var_606_11.y, var_606_11.z)

				local var_606_12 = var_606_6.localEulerAngles

				var_606_12.z = 0
				var_606_12.x = 0
				var_606_6.localEulerAngles = var_606_12
			end

			if arg_603_1.time_ >= var_606_7 + var_606_8 and arg_603_1.time_ < var_606_7 + var_606_8 + arg_606_0 then
				var_606_6.localPosition = Vector3.New(0, -1.13, -5.6)

				local var_606_13 = manager.ui.mainCamera.transform.position - var_606_6.position

				var_606_6.forward = Vector3.New(var_606_13.x, var_606_13.y, var_606_13.z)

				local var_606_14 = var_606_6.localEulerAngles

				var_606_14.z = 0
				var_606_14.x = 0
				var_606_6.localEulerAngles = var_606_14
			end

			local var_606_15 = 0
			local var_606_16 = 0.25

			if var_606_15 < arg_603_1.time_ and arg_603_1.time_ <= var_606_15 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_17 = arg_603_1:FormatText(StoryNameCfg[169].name)

				arg_603_1.leftNameTxt_.text = var_606_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_18 = arg_603_1:GetWordFromCfg(910201149)
				local var_606_19 = arg_603_1:FormatText(var_606_18.content)

				arg_603_1.text_.text = var_606_19

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_20 = 10
				local var_606_21 = utf8.len(var_606_19)
				local var_606_22 = var_606_20 <= 0 and var_606_16 or var_606_16 * (var_606_21 / var_606_20)

				if var_606_22 > 0 and var_606_16 < var_606_22 then
					arg_603_1.talkMaxDuration = var_606_22

					if var_606_22 + var_606_15 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_22 + var_606_15
					end
				end

				arg_603_1.text_.text = var_606_19
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_23 = math.max(var_606_16, arg_603_1.talkMaxDuration)

			if var_606_15 <= arg_603_1.time_ and arg_603_1.time_ < var_606_15 + var_606_23 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_15) / var_606_23

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_15 + var_606_23 and arg_603_1.time_ < var_606_15 + var_606_23 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play910201150 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 910201150
		arg_607_1.duration_ = 5

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play910201151(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["1096ui_story"]
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 and arg_607_1.var_.characterEffect1096ui_story == nil then
				arg_607_1.var_.characterEffect1096ui_story = var_610_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_2 = 0.2

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_2 then
				local var_610_3 = (arg_607_1.time_ - var_610_1) / var_610_2

				if arg_607_1.var_.characterEffect1096ui_story then
					local var_610_4 = Mathf.Lerp(0, 0.5, var_610_3)

					arg_607_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_607_1.var_.characterEffect1096ui_story.fillRatio = var_610_4
				end
			end

			if arg_607_1.time_ >= var_610_1 + var_610_2 and arg_607_1.time_ < var_610_1 + var_610_2 + arg_610_0 and arg_607_1.var_.characterEffect1096ui_story then
				local var_610_5 = 0.5

				arg_607_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_607_1.var_.characterEffect1096ui_story.fillRatio = var_610_5
			end

			local var_610_6 = 0
			local var_610_7 = 0.75

			if var_610_6 < arg_607_1.time_ and arg_607_1.time_ <= var_610_6 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_8 = arg_607_1:FormatText(StoryNameCfg[7].name)

				arg_607_1.leftNameTxt_.text = var_610_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_9 = arg_607_1:GetWordFromCfg(910201150)
				local var_610_10 = arg_607_1:FormatText(var_610_9.content)

				arg_607_1.text_.text = var_610_10

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_11 = 30
				local var_610_12 = utf8.len(var_610_10)
				local var_610_13 = var_610_11 <= 0 and var_610_7 or var_610_7 * (var_610_12 / var_610_11)

				if var_610_13 > 0 and var_610_7 < var_610_13 then
					arg_607_1.talkMaxDuration = var_610_13

					if var_610_13 + var_610_6 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_13 + var_610_6
					end
				end

				arg_607_1.text_.text = var_610_10
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)
				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_14 = math.max(var_610_7, arg_607_1.talkMaxDuration)

			if var_610_6 <= arg_607_1.time_ and arg_607_1.time_ < var_610_6 + var_610_14 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_6) / var_610_14

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_6 + var_610_14 and arg_607_1.time_ < var_610_6 + var_610_14 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play910201151 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 910201151
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play910201152(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = 0
			local var_614_1 = 0.725

			if var_614_0 < arg_611_1.time_ and arg_611_1.time_ <= var_614_0 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_2 = arg_611_1:FormatText(StoryNameCfg[7].name)

				arg_611_1.leftNameTxt_.text = var_614_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_3 = arg_611_1:GetWordFromCfg(910201151)
				local var_614_4 = arg_611_1:FormatText(var_614_3.content)

				arg_611_1.text_.text = var_614_4

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_5 = 29
				local var_614_6 = utf8.len(var_614_4)
				local var_614_7 = var_614_5 <= 0 and var_614_1 or var_614_1 * (var_614_6 / var_614_5)

				if var_614_7 > 0 and var_614_1 < var_614_7 then
					arg_611_1.talkMaxDuration = var_614_7

					if var_614_7 + var_614_0 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_7 + var_614_0
					end
				end

				arg_611_1.text_.text = var_614_4
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_8 = math.max(var_614_1, arg_611_1.talkMaxDuration)

			if var_614_0 <= arg_611_1.time_ and arg_611_1.time_ < var_614_0 + var_614_8 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_0) / var_614_8

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_0 + var_614_8 and arg_611_1.time_ < var_614_0 + var_614_8 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play910201152 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 910201152
		arg_615_1.duration_ = 9

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play910201153(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = "ST05"

			if arg_615_1.bgs_[var_618_0] == nil then
				local var_618_1 = Object.Instantiate(arg_615_1.paintGo_)

				var_618_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_618_0)
				var_618_1.name = var_618_0
				var_618_1.transform.parent = arg_615_1.stage_.transform
				var_618_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_615_1.bgs_[var_618_0] = var_618_1
			end

			local var_618_2 = 2

			if var_618_2 < arg_615_1.time_ and arg_615_1.time_ <= var_618_2 + arg_618_0 then
				local var_618_3 = manager.ui.mainCamera.transform.localPosition
				local var_618_4 = Vector3.New(0, 0, 10) + Vector3.New(var_618_3.x, var_618_3.y, 0)
				local var_618_5 = arg_615_1.bgs_.ST05

				var_618_5.transform.localPosition = var_618_4
				var_618_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_618_6 = var_618_5:GetComponent("SpriteRenderer")

				if var_618_6 and var_618_6.sprite then
					local var_618_7 = (var_618_5.transform.localPosition - var_618_3).z
					local var_618_8 = manager.ui.mainCameraCom_
					local var_618_9 = 2 * var_618_7 * Mathf.Tan(var_618_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_618_10 = var_618_9 * var_618_8.aspect
					local var_618_11 = var_618_6.sprite.bounds.size.x
					local var_618_12 = var_618_6.sprite.bounds.size.y
					local var_618_13 = var_618_10 / var_618_11
					local var_618_14 = var_618_9 / var_618_12
					local var_618_15 = var_618_14 < var_618_13 and var_618_13 or var_618_14

					var_618_5.transform.localScale = Vector3.New(var_618_15, var_618_15, 0)
				end

				for iter_618_0, iter_618_1 in pairs(arg_615_1.bgs_) do
					if iter_618_0 ~= "ST05" then
						iter_618_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_618_16 = 0

			if var_618_16 < arg_615_1.time_ and arg_615_1.time_ <= var_618_16 + arg_618_0 then
				arg_615_1.mask_.enabled = true
				arg_615_1.mask_.raycastTarget = true

				arg_615_1:SetGaussion(false)
			end

			local var_618_17 = 2

			if var_618_16 <= arg_615_1.time_ and arg_615_1.time_ < var_618_16 + var_618_17 then
				local var_618_18 = (arg_615_1.time_ - var_618_16) / var_618_17
				local var_618_19 = Color.New(0, 0, 0)

				var_618_19.a = Mathf.Lerp(0, 1, var_618_18)
				arg_615_1.mask_.color = var_618_19
			end

			if arg_615_1.time_ >= var_618_16 + var_618_17 and arg_615_1.time_ < var_618_16 + var_618_17 + arg_618_0 then
				local var_618_20 = Color.New(0, 0, 0)

				var_618_20.a = 1
				arg_615_1.mask_.color = var_618_20
			end

			local var_618_21 = 2

			if var_618_21 < arg_615_1.time_ and arg_615_1.time_ <= var_618_21 + arg_618_0 then
				arg_615_1.mask_.enabled = true
				arg_615_1.mask_.raycastTarget = true

				arg_615_1:SetGaussion(false)
			end

			local var_618_22 = 2.166667

			if var_618_21 <= arg_615_1.time_ and arg_615_1.time_ < var_618_21 + var_618_22 then
				local var_618_23 = (arg_615_1.time_ - var_618_21) / var_618_22
				local var_618_24 = Color.New(0, 0, 0)

				var_618_24.a = Mathf.Lerp(1, 0, var_618_23)
				arg_615_1.mask_.color = var_618_24
			end

			if arg_615_1.time_ >= var_618_21 + var_618_22 and arg_615_1.time_ < var_618_21 + var_618_22 + arg_618_0 then
				local var_618_25 = Color.New(0, 0, 0)
				local var_618_26 = 0

				arg_615_1.mask_.enabled = false
				var_618_25.a = var_618_26
				arg_615_1.mask_.color = var_618_25
			end

			local var_618_27 = arg_615_1.actors_["1096ui_story"].transform
			local var_618_28 = 1.966

			if var_618_28 < arg_615_1.time_ and arg_615_1.time_ <= var_618_28 + arg_618_0 then
				arg_615_1.var_.moveOldPos1096ui_story = var_618_27.localPosition
			end

			local var_618_29 = 0.001

			if var_618_28 <= arg_615_1.time_ and arg_615_1.time_ < var_618_28 + var_618_29 then
				local var_618_30 = (arg_615_1.time_ - var_618_28) / var_618_29
				local var_618_31 = Vector3.New(0, 100, 0)

				var_618_27.localPosition = Vector3.Lerp(arg_615_1.var_.moveOldPos1096ui_story, var_618_31, var_618_30)

				local var_618_32 = manager.ui.mainCamera.transform.position - var_618_27.position

				var_618_27.forward = Vector3.New(var_618_32.x, var_618_32.y, var_618_32.z)

				local var_618_33 = var_618_27.localEulerAngles

				var_618_33.z = 0
				var_618_33.x = 0
				var_618_27.localEulerAngles = var_618_33
			end

			if arg_615_1.time_ >= var_618_28 + var_618_29 and arg_615_1.time_ < var_618_28 + var_618_29 + arg_618_0 then
				var_618_27.localPosition = Vector3.New(0, 100, 0)

				local var_618_34 = manager.ui.mainCamera.transform.position - var_618_27.position

				var_618_27.forward = Vector3.New(var_618_34.x, var_618_34.y, var_618_34.z)

				local var_618_35 = var_618_27.localEulerAngles

				var_618_35.z = 0
				var_618_35.x = 0
				var_618_27.localEulerAngles = var_618_35
			end

			local var_618_36 = arg_615_1.bgs_.ST05
			local var_618_37 = 2

			if var_618_37 < arg_615_1.time_ and arg_615_1.time_ <= var_618_37 + arg_618_0 then
				local var_618_38 = var_618_36:GetComponent("SpriteRenderer")

				if var_618_38 then
					var_618_38.material = arg_615_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_618_39 = var_618_38.material
					local var_618_40 = var_618_39:GetColor("_Color")

					arg_615_1.var_.alphaOldValueST05 = var_618_40.a
					arg_615_1.var_.alphaMatValueST05 = var_618_39
				end
			end

			local var_618_41 = 2.43333333333333

			if var_618_37 <= arg_615_1.time_ and arg_615_1.time_ < var_618_37 + var_618_41 then
				local var_618_42 = (arg_615_1.time_ - var_618_37) / var_618_41
				local var_618_43 = Mathf.Lerp(arg_615_1.var_.alphaOldValueST05, 0.5, var_618_42)

				if arg_615_1.var_.alphaMatValueST05 then
					local var_618_44 = arg_615_1.var_.alphaMatValueST05
					local var_618_45 = var_618_44:GetColor("_Color")

					var_618_45.a = var_618_43

					var_618_44:SetColor("_Color", var_618_45)
				end
			end

			if arg_615_1.time_ >= var_618_37 + var_618_41 and arg_615_1.time_ < var_618_37 + var_618_41 + arg_618_0 and arg_615_1.var_.alphaMatValueST05 then
				local var_618_46 = arg_615_1.var_.alphaMatValueST05
				local var_618_47 = var_618_46:GetColor("_Color")

				var_618_47.a = 0.5

				var_618_46:SetColor("_Color", var_618_47)
			end

			local var_618_48 = 0
			local var_618_49 = 1

			if var_618_48 < arg_615_1.time_ and arg_615_1.time_ <= var_618_48 + arg_618_0 then
				local var_618_50 = "play"
				local var_618_51 = "music"

				arg_615_1:AudioAction(var_618_50, var_618_51, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_618_52 = 4
			local var_618_53 = 0.975

			if var_618_52 < arg_615_1.time_ and arg_615_1.time_ <= var_618_52 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, false)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_54 = arg_615_1:GetWordFromCfg(910201152)
				local var_618_55 = arg_615_1:FormatText(var_618_54.content)

				arg_615_1.text_.text = var_618_55

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_56 = 39
				local var_618_57 = utf8.len(var_618_55)
				local var_618_58 = var_618_56 <= 0 and var_618_53 or var_618_53 * (var_618_57 / var_618_56)

				if var_618_58 > 0 and var_618_53 < var_618_58 then
					arg_615_1.talkMaxDuration = var_618_58

					if var_618_58 + var_618_52 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_58 + var_618_52
					end
				end

				arg_615_1.text_.text = var_618_55
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)
				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_59 = math.max(var_618_53, arg_615_1.talkMaxDuration)

			if var_618_52 <= arg_615_1.time_ and arg_615_1.time_ < var_618_52 + var_618_59 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_52) / var_618_59

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_52 + var_618_59 and arg_615_1.time_ < var_618_52 + var_618_59 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play910201153 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 910201153
		arg_619_1.duration_ = 5

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play910201154(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 0.3

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_2 = arg_619_1:FormatText(StoryNameCfg[7].name)

				arg_619_1.leftNameTxt_.text = var_622_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_3 = arg_619_1:GetWordFromCfg(910201153)
				local var_622_4 = arg_619_1:FormatText(var_622_3.content)

				arg_619_1.text_.text = var_622_4

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_5 = 12
				local var_622_6 = utf8.len(var_622_4)
				local var_622_7 = var_622_5 <= 0 and var_622_1 or var_622_1 * (var_622_6 / var_622_5)

				if var_622_7 > 0 and var_622_1 < var_622_7 then
					arg_619_1.talkMaxDuration = var_622_7

					if var_622_7 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_7 + var_622_0
					end
				end

				arg_619_1.text_.text = var_622_4
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)
				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_8 = math.max(var_622_1, arg_619_1.talkMaxDuration)

			if var_622_0 <= arg_619_1.time_ and arg_619_1.time_ < var_622_0 + var_622_8 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_0) / var_622_8

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_0 + var_622_8 and arg_619_1.time_ < var_622_0 + var_622_8 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play910201154 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 910201154
		arg_623_1.duration_ = 5

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play910201155(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = arg_623_1.actors_["1096ui_story"].transform
			local var_626_1 = 0

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 then
				arg_623_1.var_.moveOldPos1096ui_story = var_626_0.localPosition
			end

			local var_626_2 = 0.001

			if var_626_1 <= arg_623_1.time_ and arg_623_1.time_ < var_626_1 + var_626_2 then
				local var_626_3 = (arg_623_1.time_ - var_626_1) / var_626_2
				local var_626_4 = Vector3.New(0, -1.13, -5.6)

				var_626_0.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1096ui_story, var_626_4, var_626_3)

				local var_626_5 = manager.ui.mainCamera.transform.position - var_626_0.position

				var_626_0.forward = Vector3.New(var_626_5.x, var_626_5.y, var_626_5.z)

				local var_626_6 = var_626_0.localEulerAngles

				var_626_6.z = 0
				var_626_6.x = 0
				var_626_0.localEulerAngles = var_626_6
			end

			if arg_623_1.time_ >= var_626_1 + var_626_2 and arg_623_1.time_ < var_626_1 + var_626_2 + arg_626_0 then
				var_626_0.localPosition = Vector3.New(0, -1.13, -5.6)

				local var_626_7 = manager.ui.mainCamera.transform.position - var_626_0.position

				var_626_0.forward = Vector3.New(var_626_7.x, var_626_7.y, var_626_7.z)

				local var_626_8 = var_626_0.localEulerAngles

				var_626_8.z = 0
				var_626_8.x = 0
				var_626_0.localEulerAngles = var_626_8
			end

			local var_626_9 = 0

			if var_626_9 < arg_623_1.time_ and arg_623_1.time_ <= var_626_9 + arg_626_0 then
				arg_623_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096action/1096action5_1")
			end

			local var_626_10 = 0

			if var_626_10 < arg_623_1.time_ and arg_623_1.time_ <= var_626_10 + arg_626_0 then
				arg_623_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_626_11 = arg_623_1.actors_["1096ui_story"]
			local var_626_12 = 0

			if var_626_12 < arg_623_1.time_ and arg_623_1.time_ <= var_626_12 + arg_626_0 and arg_623_1.var_.characterEffect1096ui_story == nil then
				arg_623_1.var_.characterEffect1096ui_story = var_626_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_13 = 0.2

			if var_626_12 <= arg_623_1.time_ and arg_623_1.time_ < var_626_12 + var_626_13 then
				local var_626_14 = (arg_623_1.time_ - var_626_12) / var_626_13

				if arg_623_1.var_.characterEffect1096ui_story then
					arg_623_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_12 + var_626_13 and arg_623_1.time_ < var_626_12 + var_626_13 + arg_626_0 and arg_623_1.var_.characterEffect1096ui_story then
				arg_623_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_626_15 = 0
			local var_626_16 = 0.5

			if var_626_15 < arg_623_1.time_ and arg_623_1.time_ <= var_626_15 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_17 = arg_623_1:FormatText(StoryNameCfg[169].name)

				arg_623_1.leftNameTxt_.text = var_626_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_18 = arg_623_1:GetWordFromCfg(910201154)
				local var_626_19 = arg_623_1:FormatText(var_626_18.content)

				arg_623_1.text_.text = var_626_19

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_20 = 20
				local var_626_21 = utf8.len(var_626_19)
				local var_626_22 = var_626_20 <= 0 and var_626_16 or var_626_16 * (var_626_21 / var_626_20)

				if var_626_22 > 0 and var_626_16 < var_626_22 then
					arg_623_1.talkMaxDuration = var_626_22

					if var_626_22 + var_626_15 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_22 + var_626_15
					end
				end

				arg_623_1.text_.text = var_626_19
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)
				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_23 = math.max(var_626_16, arg_623_1.talkMaxDuration)

			if var_626_15 <= arg_623_1.time_ and arg_623_1.time_ < var_626_15 + var_626_23 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_15) / var_626_23

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_15 + var_626_23 and arg_623_1.time_ < var_626_15 + var_626_23 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play910201155 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 910201155
		arg_627_1.duration_ = 5

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play910201156(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["1096ui_story"]
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 and arg_627_1.var_.characterEffect1096ui_story == nil then
				arg_627_1.var_.characterEffect1096ui_story = var_630_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_2 = 0.2

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2

				if arg_627_1.var_.characterEffect1096ui_story then
					local var_630_4 = Mathf.Lerp(0, 0.5, var_630_3)

					arg_627_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_627_1.var_.characterEffect1096ui_story.fillRatio = var_630_4
				end
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 and arg_627_1.var_.characterEffect1096ui_story then
				local var_630_5 = 0.5

				arg_627_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_627_1.var_.characterEffect1096ui_story.fillRatio = var_630_5
			end

			local var_630_6 = 0
			local var_630_7 = 0.575

			if var_630_6 < arg_627_1.time_ and arg_627_1.time_ <= var_630_6 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_8 = arg_627_1:FormatText(StoryNameCfg[7].name)

				arg_627_1.leftNameTxt_.text = var_630_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_9 = arg_627_1:GetWordFromCfg(910201155)
				local var_630_10 = arg_627_1:FormatText(var_630_9.content)

				arg_627_1.text_.text = var_630_10

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_11 = 23
				local var_630_12 = utf8.len(var_630_10)
				local var_630_13 = var_630_11 <= 0 and var_630_7 or var_630_7 * (var_630_12 / var_630_11)

				if var_630_13 > 0 and var_630_7 < var_630_13 then
					arg_627_1.talkMaxDuration = var_630_13

					if var_630_13 + var_630_6 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_13 + var_630_6
					end
				end

				arg_627_1.text_.text = var_630_10
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)
				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_14 = math.max(var_630_7, arg_627_1.talkMaxDuration)

			if var_630_6 <= arg_627_1.time_ and arg_627_1.time_ < var_630_6 + var_630_14 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_6) / var_630_14

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_6 + var_630_14 and arg_627_1.time_ < var_630_6 + var_630_14 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play910201156 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 910201156
		arg_631_1.duration_ = 5

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play910201157(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1096ui_story"]
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 and arg_631_1.var_.characterEffect1096ui_story == nil then
				arg_631_1.var_.characterEffect1096ui_story = var_634_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_2 = 0.2

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2

				if arg_631_1.var_.characterEffect1096ui_story then
					arg_631_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 and arg_631_1.var_.characterEffect1096ui_story then
				arg_631_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_634_4 = 0

			if var_634_4 < arg_631_1.time_ and arg_631_1.time_ <= var_634_4 + arg_634_0 then
				arg_631_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096actionlink/1096action452")
			end

			local var_634_5 = 0

			if var_634_5 < arg_631_1.time_ and arg_631_1.time_ <= var_634_5 + arg_634_0 then
				arg_631_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_634_6 = 0
			local var_634_7 = 0.35

			if var_634_6 < arg_631_1.time_ and arg_631_1.time_ <= var_634_6 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_8 = arg_631_1:FormatText(StoryNameCfg[169].name)

				arg_631_1.leftNameTxt_.text = var_634_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_9 = arg_631_1:GetWordFromCfg(910201156)
				local var_634_10 = arg_631_1:FormatText(var_634_9.content)

				arg_631_1.text_.text = var_634_10

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_11 = 14
				local var_634_12 = utf8.len(var_634_10)
				local var_634_13 = var_634_11 <= 0 and var_634_7 or var_634_7 * (var_634_12 / var_634_11)

				if var_634_13 > 0 and var_634_7 < var_634_13 then
					arg_631_1.talkMaxDuration = var_634_13

					if var_634_13 + var_634_6 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_13 + var_634_6
					end
				end

				arg_631_1.text_.text = var_634_10
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)
				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_14 = math.max(var_634_7, arg_631_1.talkMaxDuration)

			if var_634_6 <= arg_631_1.time_ and arg_631_1.time_ < var_634_6 + var_634_14 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_6) / var_634_14

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_6 + var_634_14 and arg_631_1.time_ < var_634_6 + var_634_14 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play910201157 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 910201157
		arg_635_1.duration_ = 5

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play910201158(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1096ui_story"]
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 and arg_635_1.var_.characterEffect1096ui_story == nil then
				arg_635_1.var_.characterEffect1096ui_story = var_638_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_2 = 0.2

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2

				if arg_635_1.var_.characterEffect1096ui_story then
					local var_638_4 = Mathf.Lerp(0, 0.5, var_638_3)

					arg_635_1.var_.characterEffect1096ui_story.fillFlat = true
					arg_635_1.var_.characterEffect1096ui_story.fillRatio = var_638_4
				end
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 and arg_635_1.var_.characterEffect1096ui_story then
				local var_638_5 = 0.5

				arg_635_1.var_.characterEffect1096ui_story.fillFlat = true
				arg_635_1.var_.characterEffect1096ui_story.fillRatio = var_638_5
			end

			local var_638_6 = 0
			local var_638_7 = 0.35

			if var_638_6 < arg_635_1.time_ and arg_635_1.time_ <= var_638_6 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_8 = arg_635_1:FormatText(StoryNameCfg[7].name)

				arg_635_1.leftNameTxt_.text = var_638_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_9 = arg_635_1:GetWordFromCfg(910201157)
				local var_638_10 = arg_635_1:FormatText(var_638_9.content)

				arg_635_1.text_.text = var_638_10

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_11 = 14
				local var_638_12 = utf8.len(var_638_10)
				local var_638_13 = var_638_11 <= 0 and var_638_7 or var_638_7 * (var_638_12 / var_638_11)

				if var_638_13 > 0 and var_638_7 < var_638_13 then
					arg_635_1.talkMaxDuration = var_638_13

					if var_638_13 + var_638_6 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_13 + var_638_6
					end
				end

				arg_635_1.text_.text = var_638_10
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)
				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_14 = math.max(var_638_7, arg_635_1.talkMaxDuration)

			if var_638_6 <= arg_635_1.time_ and arg_635_1.time_ < var_638_6 + var_638_14 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_6) / var_638_14

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_6 + var_638_14 and arg_635_1.time_ < var_638_6 + var_638_14 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play910201158 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 910201158
		arg_639_1.duration_ = 7

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play910201159(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = 0

			if var_642_0 < arg_639_1.time_ and arg_639_1.time_ <= var_642_0 + arg_642_0 then
				arg_639_1.mask_.enabled = true
				arg_639_1.mask_.raycastTarget = true

				arg_639_1:SetGaussion(false)
			end

			local var_642_1 = 2

			if var_642_0 <= arg_639_1.time_ and arg_639_1.time_ < var_642_0 + var_642_1 then
				local var_642_2 = (arg_639_1.time_ - var_642_0) / var_642_1
				local var_642_3 = Color.New(1, 1, 1)

				var_642_3.a = Mathf.Lerp(1, 0, var_642_2)
				arg_639_1.mask_.color = var_642_3
			end

			if arg_639_1.time_ >= var_642_0 + var_642_1 and arg_639_1.time_ < var_642_0 + var_642_1 + arg_642_0 then
				local var_642_4 = Color.New(1, 1, 1)
				local var_642_5 = 0

				arg_639_1.mask_.enabled = false
				var_642_4.a = var_642_5
				arg_639_1.mask_.color = var_642_4
			end

			local var_642_6 = arg_639_1.actors_["1096ui_story"].transform
			local var_642_7 = 0

			if var_642_7 < arg_639_1.time_ and arg_639_1.time_ <= var_642_7 + arg_642_0 then
				arg_639_1.var_.moveOldPos1096ui_story = var_642_6.localPosition
			end

			local var_642_8 = 0.001

			if var_642_7 <= arg_639_1.time_ and arg_639_1.time_ < var_642_7 + var_642_8 then
				local var_642_9 = (arg_639_1.time_ - var_642_7) / var_642_8
				local var_642_10 = Vector3.New(0, 100, 0)

				var_642_6.localPosition = Vector3.Lerp(arg_639_1.var_.moveOldPos1096ui_story, var_642_10, var_642_9)

				local var_642_11 = manager.ui.mainCamera.transform.position - var_642_6.position

				var_642_6.forward = Vector3.New(var_642_11.x, var_642_11.y, var_642_11.z)

				local var_642_12 = var_642_6.localEulerAngles

				var_642_12.z = 0
				var_642_12.x = 0
				var_642_6.localEulerAngles = var_642_12
			end

			if arg_639_1.time_ >= var_642_7 + var_642_8 and arg_639_1.time_ < var_642_7 + var_642_8 + arg_642_0 then
				var_642_6.localPosition = Vector3.New(0, 100, 0)

				local var_642_13 = manager.ui.mainCamera.transform.position - var_642_6.position

				var_642_6.forward = Vector3.New(var_642_13.x, var_642_13.y, var_642_13.z)

				local var_642_14 = var_642_6.localEulerAngles

				var_642_14.z = 0
				var_642_14.x = 0
				var_642_6.localEulerAngles = var_642_14
			end

			local var_642_15 = arg_639_1.bgs_.ST05
			local var_642_16 = 0

			if var_642_16 < arg_639_1.time_ and arg_639_1.time_ <= var_642_16 + arg_642_0 then
				local var_642_17 = var_642_15:GetComponent("SpriteRenderer")

				if var_642_17 then
					var_642_17.material = arg_639_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_642_18 = var_642_17.material
					local var_642_19 = var_642_18:GetColor("_Color")

					arg_639_1.var_.alphaOldValueST05 = var_642_19.a
					arg_639_1.var_.alphaMatValueST05 = var_642_18
				end

				arg_639_1.var_.alphaOldValueST05 = 0
			end

			local var_642_20 = 3.2

			if var_642_16 <= arg_639_1.time_ and arg_639_1.time_ < var_642_16 + var_642_20 then
				local var_642_21 = (arg_639_1.time_ - var_642_16) / var_642_20
				local var_642_22 = Mathf.Lerp(arg_639_1.var_.alphaOldValueST05, 1, var_642_21)

				if arg_639_1.var_.alphaMatValueST05 then
					local var_642_23 = arg_639_1.var_.alphaMatValueST05
					local var_642_24 = var_642_23:GetColor("_Color")

					var_642_24.a = var_642_22

					var_642_23:SetColor("_Color", var_642_24)
				end
			end

			if arg_639_1.time_ >= var_642_16 + var_642_20 and arg_639_1.time_ < var_642_16 + var_642_20 + arg_642_0 and arg_639_1.var_.alphaMatValueST05 then
				local var_642_25 = arg_639_1.var_.alphaMatValueST05
				local var_642_26 = var_642_25:GetColor("_Color")

				var_642_26.a = 1

				var_642_25:SetColor("_Color", var_642_26)
			end

			local var_642_27 = 2
			local var_642_28 = 0.075

			if var_642_27 < arg_639_1.time_ and arg_639_1.time_ <= var_642_27 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, false)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_29 = arg_639_1:GetWordFromCfg(910201158)
				local var_642_30 = arg_639_1:FormatText(var_642_29.content)

				arg_639_1.text_.text = var_642_30

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_31 = 3
				local var_642_32 = utf8.len(var_642_30)
				local var_642_33 = var_642_31 <= 0 and var_642_28 or var_642_28 * (var_642_32 / var_642_31)

				if var_642_33 > 0 and var_642_28 < var_642_33 then
					arg_639_1.talkMaxDuration = var_642_33

					if var_642_33 + var_642_27 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_33 + var_642_27
					end
				end

				arg_639_1.text_.text = var_642_30
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)
				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_34 = math.max(var_642_28, arg_639_1.talkMaxDuration)

			if var_642_27 <= arg_639_1.time_ and arg_639_1.time_ < var_642_27 + var_642_34 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_27) / var_642_34

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_27 + var_642_34 and arg_639_1.time_ < var_642_27 + var_642_34 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play910201159 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 910201159
		arg_643_1.duration_ = 5

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play910201160(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = 0
			local var_646_1 = 0.35

			if var_646_0 < arg_643_1.time_ and arg_643_1.time_ <= var_646_0 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_2 = arg_643_1:FormatText(StoryNameCfg[7].name)

				arg_643_1.leftNameTxt_.text = var_646_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_3 = arg_643_1:GetWordFromCfg(910201159)
				local var_646_4 = arg_643_1:FormatText(var_646_3.content)

				arg_643_1.text_.text = var_646_4

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_5 = 14
				local var_646_6 = utf8.len(var_646_4)
				local var_646_7 = var_646_5 <= 0 and var_646_1 or var_646_1 * (var_646_6 / var_646_5)

				if var_646_7 > 0 and var_646_1 < var_646_7 then
					arg_643_1.talkMaxDuration = var_646_7

					if var_646_7 + var_646_0 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_7 + var_646_0
					end
				end

				arg_643_1.text_.text = var_646_4
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)
				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_8 = math.max(var_646_1, arg_643_1.talkMaxDuration)

			if var_646_0 <= arg_643_1.time_ and arg_643_1.time_ < var_646_0 + var_646_8 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_0) / var_646_8

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_0 + var_646_8 and arg_643_1.time_ < var_646_0 + var_646_8 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play910201160 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 910201160
		arg_647_1.duration_ = 5

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play910201161(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = 0

			if var_650_0 < arg_647_1.time_ and arg_647_1.time_ <= var_650_0 + arg_650_0 then
				arg_647_1.mask_.enabled = true
				arg_647_1.mask_.raycastTarget = true

				arg_647_1:SetGaussion(false)
			end

			local var_650_1 = 2

			if var_650_0 <= arg_647_1.time_ and arg_647_1.time_ < var_650_0 + var_650_1 then
				local var_650_2 = (arg_647_1.time_ - var_650_0) / var_650_1
				local var_650_3 = Color.New(1, 1, 1)

				var_650_3.a = Mathf.Lerp(1, 0, var_650_2)
				arg_647_1.mask_.color = var_650_3
			end

			if arg_647_1.time_ >= var_650_0 + var_650_1 and arg_647_1.time_ < var_650_0 + var_650_1 + arg_650_0 then
				local var_650_4 = Color.New(1, 1, 1)
				local var_650_5 = 0

				arg_647_1.mask_.enabled = false
				var_650_4.a = var_650_5
				arg_647_1.mask_.color = var_650_4
			end

			local var_650_6 = 0
			local var_650_7 = 1

			if var_650_6 < arg_647_1.time_ and arg_647_1.time_ <= var_650_6 + arg_650_0 then
				local var_650_8 = "play"
				local var_650_9 = "effect"

				arg_647_1:AudioAction(var_650_8, var_650_9, "se_story_birthday", "se_story_birthday_kaideng", "")
			end

			local var_650_10 = 0
			local var_650_11 = 0.075

			if var_650_10 < arg_647_1.time_ and arg_647_1.time_ <= var_650_10 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, false)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_12 = arg_647_1:GetWordFromCfg(910201160)
				local var_650_13 = arg_647_1:FormatText(var_650_12.content)

				arg_647_1.text_.text = var_650_13

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_14 = 3
				local var_650_15 = utf8.len(var_650_13)
				local var_650_16 = var_650_14 <= 0 and var_650_11 or var_650_11 * (var_650_15 / var_650_14)

				if var_650_16 > 0 and var_650_11 < var_650_16 then
					arg_647_1.talkMaxDuration = var_650_16

					if var_650_16 + var_650_10 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_16 + var_650_10
					end
				end

				arg_647_1.text_.text = var_650_13
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)
				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_17 = math.max(var_650_11, arg_647_1.talkMaxDuration)

			if var_650_10 <= arg_647_1.time_ and arg_647_1.time_ < var_650_10 + var_650_17 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_10) / var_650_17

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_10 + var_650_17 and arg_647_1.time_ < var_650_10 + var_650_17 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play910201161 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 910201161
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play910201162(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = 0
			local var_654_1 = 1

			if var_654_0 < arg_651_1.time_ and arg_651_1.time_ <= var_654_0 + arg_654_0 then
				local var_654_2 = "play"
				local var_654_3 = "effect"

				arg_651_1:AudioAction(var_654_2, var_654_3, "se_story_birthday", "se_story_birthday_lapao", "")
			end

			local var_654_4 = 0
			local var_654_5 = 0.1

			if var_654_4 < arg_651_1.time_ and arg_651_1.time_ <= var_654_4 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, false)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_6 = arg_651_1:GetWordFromCfg(910201161)
				local var_654_7 = arg_651_1:FormatText(var_654_6.content)

				arg_651_1.text_.text = var_654_7

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_8 = 4
				local var_654_9 = utf8.len(var_654_7)
				local var_654_10 = var_654_8 <= 0 and var_654_5 or var_654_5 * (var_654_9 / var_654_8)

				if var_654_10 > 0 and var_654_5 < var_654_10 then
					arg_651_1.talkMaxDuration = var_654_10

					if var_654_10 + var_654_4 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_10 + var_654_4
					end
				end

				arg_651_1.text_.text = var_654_7
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_11 = math.max(var_654_5, arg_651_1.talkMaxDuration)

			if var_654_4 <= arg_651_1.time_ and arg_651_1.time_ < var_654_4 + var_654_11 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_4) / var_654_11

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_4 + var_654_11 and arg_651_1.time_ < var_654_4 + var_654_11 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play910201162 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 910201162
		arg_655_1.duration_ = 5

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play910201163(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = 0
			local var_658_1 = 0.2

			if var_658_0 < arg_655_1.time_ and arg_655_1.time_ <= var_658_0 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_2 = arg_655_1:FormatText(StoryNameCfg[330].name)

				arg_655_1.leftNameTxt_.text = var_658_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_3 = arg_655_1:GetWordFromCfg(910201162)
				local var_658_4 = arg_655_1:FormatText(var_658_3.content)

				arg_655_1.text_.text = var_658_4

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_5 = 8
				local var_658_6 = utf8.len(var_658_4)
				local var_658_7 = var_658_5 <= 0 and var_658_1 or var_658_1 * (var_658_6 / var_658_5)

				if var_658_7 > 0 and var_658_1 < var_658_7 then
					arg_655_1.talkMaxDuration = var_658_7

					if var_658_7 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_7 + var_658_0
					end
				end

				arg_655_1.text_.text = var_658_4
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)
				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_8 = math.max(var_658_1, arg_655_1.talkMaxDuration)

			if var_658_0 <= arg_655_1.time_ and arg_655_1.time_ < var_658_0 + var_658_8 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_0) / var_658_8

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_0 + var_658_8 and arg_655_1.time_ < var_658_0 + var_658_8 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play910201163 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 910201163
		arg_659_1.duration_ = 5

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play910201164(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = 0
			local var_662_1 = 1

			if var_662_0 < arg_659_1.time_ and arg_659_1.time_ <= var_662_0 + arg_662_0 then
				local var_662_2 = "play"
				local var_662_3 = "music"

				arg_659_1:AudioAction(var_662_2, var_662_3, "bgm_side_daily01", "bgm_side_daily01", "bgm_side_daily01.awb")
			end

			local var_662_4 = 0
			local var_662_5 = 0.2

			if var_662_4 < arg_659_1.time_ and arg_659_1.time_ <= var_662_4 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_6 = arg_659_1:FormatText(StoryNameCfg[330].name)

				arg_659_1.leftNameTxt_.text = var_662_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_7 = arg_659_1:GetWordFromCfg(910201163)
				local var_662_8 = arg_659_1:FormatText(var_662_7.content)

				arg_659_1.text_.text = var_662_8

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_9 = 8
				local var_662_10 = utf8.len(var_662_8)
				local var_662_11 = var_662_9 <= 0 and var_662_5 or var_662_5 * (var_662_10 / var_662_9)

				if var_662_11 > 0 and var_662_5 < var_662_11 then
					arg_659_1.talkMaxDuration = var_662_11

					if var_662_11 + var_662_4 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_11 + var_662_4
					end
				end

				arg_659_1.text_.text = var_662_8
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)
				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_12 = math.max(var_662_5, arg_659_1.talkMaxDuration)

			if var_662_4 <= arg_659_1.time_ and arg_659_1.time_ < var_662_4 + var_662_12 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_4) / var_662_12

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_4 + var_662_12 and arg_659_1.time_ < var_662_4 + var_662_12 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play910201164 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 910201164
		arg_663_1.duration_ = 5

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play910201165(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = 0
			local var_666_1 = 0.975

			if var_666_0 < arg_663_1.time_ and arg_663_1.time_ <= var_666_0 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, false)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_2 = arg_663_1:GetWordFromCfg(910201164)
				local var_666_3 = arg_663_1:FormatText(var_666_2.content)

				arg_663_1.text_.text = var_666_3

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_4 = 39
				local var_666_5 = utf8.len(var_666_3)
				local var_666_6 = var_666_4 <= 0 and var_666_1 or var_666_1 * (var_666_5 / var_666_4)

				if var_666_6 > 0 and var_666_1 < var_666_6 then
					arg_663_1.talkMaxDuration = var_666_6

					if var_666_6 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_6 + var_666_0
					end
				end

				arg_663_1.text_.text = var_666_3
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)
				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_7 = math.max(var_666_1, arg_663_1.talkMaxDuration)

			if var_666_0 <= arg_663_1.time_ and arg_663_1.time_ < var_666_0 + var_666_7 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_0) / var_666_7

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_0 + var_666_7 and arg_663_1.time_ < var_666_0 + var_666_7 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play910201165 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 910201165
		arg_667_1.duration_ = 5

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play910201166(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0
			local var_670_1 = 0.3

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_2 = arg_667_1:FormatText(StoryNameCfg[7].name)

				arg_667_1.leftNameTxt_.text = var_670_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_3 = arg_667_1:GetWordFromCfg(910201165)
				local var_670_4 = arg_667_1:FormatText(var_670_3.content)

				arg_667_1.text_.text = var_670_4

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_5 = 12
				local var_670_6 = utf8.len(var_670_4)
				local var_670_7 = var_670_5 <= 0 and var_670_1 or var_670_1 * (var_670_6 / var_670_5)

				if var_670_7 > 0 and var_670_1 < var_670_7 then
					arg_667_1.talkMaxDuration = var_670_7

					if var_670_7 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_7 + var_670_0
					end
				end

				arg_667_1.text_.text = var_670_4
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)
				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_8 = math.max(var_670_1, arg_667_1.talkMaxDuration)

			if var_670_0 <= arg_667_1.time_ and arg_667_1.time_ < var_670_0 + var_670_8 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_0) / var_670_8

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_0 + var_670_8 and arg_667_1.time_ < var_670_0 + var_670_8 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play910201166 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 910201166
		arg_671_1.duration_ = 5

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play910201167(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = "1036ui_story"

			if arg_671_1.actors_[var_674_0] == nil then
				local var_674_1 = Object.Instantiate(Asset.Load("Char/" .. var_674_0), arg_671_1.stage_.transform)

				var_674_1.name = var_674_0
				var_674_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_671_1.actors_[var_674_0] = var_674_1

				local var_674_2 = var_674_1:GetComponentInChildren(typeof(CharacterEffect))

				var_674_2.enabled = true

				local var_674_3 = GameObjectTools.GetOrAddComponent(var_674_1, typeof(DynamicBoneHelper))

				if var_674_3 then
					var_674_3:EnableDynamicBone(false)
				end

				arg_671_1:ShowWeapon(var_674_2.transform, false)

				arg_671_1.var_[var_674_0 .. "Animator"] = var_674_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_671_1.var_[var_674_0 .. "Animator"].applyRootMotion = true
				arg_671_1.var_[var_674_0 .. "LipSync"] = var_674_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_674_4 = arg_671_1.actors_["1036ui_story"].transform
			local var_674_5 = 0

			if var_674_5 < arg_671_1.time_ and arg_671_1.time_ <= var_674_5 + arg_674_0 then
				arg_671_1.var_.moveOldPos1036ui_story = var_674_4.localPosition
			end

			local var_674_6 = 0.001

			if var_674_5 <= arg_671_1.time_ and arg_671_1.time_ < var_674_5 + var_674_6 then
				local var_674_7 = (arg_671_1.time_ - var_674_5) / var_674_6
				local var_674_8 = Vector3.New(0, -1.09, -5.78)

				var_674_4.localPosition = Vector3.Lerp(arg_671_1.var_.moveOldPos1036ui_story, var_674_8, var_674_7)

				local var_674_9 = manager.ui.mainCamera.transform.position - var_674_4.position

				var_674_4.forward = Vector3.New(var_674_9.x, var_674_9.y, var_674_9.z)

				local var_674_10 = var_674_4.localEulerAngles

				var_674_10.z = 0
				var_674_10.x = 0
				var_674_4.localEulerAngles = var_674_10
			end

			if arg_671_1.time_ >= var_674_5 + var_674_6 and arg_671_1.time_ < var_674_5 + var_674_6 + arg_674_0 then
				var_674_4.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_674_11 = manager.ui.mainCamera.transform.position - var_674_4.position

				var_674_4.forward = Vector3.New(var_674_11.x, var_674_11.y, var_674_11.z)

				local var_674_12 = var_674_4.localEulerAngles

				var_674_12.z = 0
				var_674_12.x = 0
				var_674_4.localEulerAngles = var_674_12
			end

			local var_674_13 = arg_671_1.actors_["1036ui_story"]
			local var_674_14 = 0

			if var_674_14 < arg_671_1.time_ and arg_671_1.time_ <= var_674_14 + arg_674_0 and arg_671_1.var_.characterEffect1036ui_story == nil then
				arg_671_1.var_.characterEffect1036ui_story = var_674_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_674_15 = 0.2

			if var_674_14 <= arg_671_1.time_ and arg_671_1.time_ < var_674_14 + var_674_15 then
				local var_674_16 = (arg_671_1.time_ - var_674_14) / var_674_15

				if arg_671_1.var_.characterEffect1036ui_story then
					arg_671_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_671_1.time_ >= var_674_14 + var_674_15 and arg_671_1.time_ < var_674_14 + var_674_15 + arg_674_0 and arg_671_1.var_.characterEffect1036ui_story then
				arg_671_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_674_17 = 0

			if var_674_17 < arg_671_1.time_ and arg_671_1.time_ <= var_674_17 + arg_674_0 then
				arg_671_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action4_1")
			end

			local var_674_18 = 0

			if var_674_18 < arg_671_1.time_ and arg_671_1.time_ <= var_674_18 + arg_674_0 then
				arg_671_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_674_19 = 0
			local var_674_20 = 1

			if var_674_19 < arg_671_1.time_ and arg_671_1.time_ <= var_674_19 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_21 = arg_671_1:FormatText(StoryNameCfg[5].name)

				arg_671_1.leftNameTxt_.text = var_674_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_22 = arg_671_1:GetWordFromCfg(910201166)
				local var_674_23 = arg_671_1:FormatText(var_674_22.content)

				arg_671_1.text_.text = var_674_23

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_24 = 40
				local var_674_25 = utf8.len(var_674_23)
				local var_674_26 = var_674_24 <= 0 and var_674_20 or var_674_20 * (var_674_25 / var_674_24)

				if var_674_26 > 0 and var_674_20 < var_674_26 then
					arg_671_1.talkMaxDuration = var_674_26

					if var_674_26 + var_674_19 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_26 + var_674_19
					end
				end

				arg_671_1.text_.text = var_674_23
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)
				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_27 = math.max(var_674_20, arg_671_1.talkMaxDuration)

			if var_674_19 <= arg_671_1.time_ and arg_671_1.time_ < var_674_19 + var_674_27 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_19) / var_674_27

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_19 + var_674_27 and arg_671_1.time_ < var_674_19 + var_674_27 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play910201167 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 910201167
		arg_675_1.duration_ = 5

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play910201168(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = "1037ui_story"

			if arg_675_1.actors_[var_678_0] == nil then
				local var_678_1 = Object.Instantiate(Asset.Load("Char/" .. var_678_0), arg_675_1.stage_.transform)

				var_678_1.name = var_678_0
				var_678_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_675_1.actors_[var_678_0] = var_678_1

				local var_678_2 = var_678_1:GetComponentInChildren(typeof(CharacterEffect))

				var_678_2.enabled = true

				local var_678_3 = GameObjectTools.GetOrAddComponent(var_678_1, typeof(DynamicBoneHelper))

				if var_678_3 then
					var_678_3:EnableDynamicBone(false)
				end

				arg_675_1:ShowWeapon(var_678_2.transform, false)

				arg_675_1.var_[var_678_0 .. "Animator"] = var_678_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_675_1.var_[var_678_0 .. "Animator"].applyRootMotion = true
				arg_675_1.var_[var_678_0 .. "LipSync"] = var_678_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_678_4 = arg_675_1.actors_["1037ui_story"]
			local var_678_5 = 0

			if var_678_5 < arg_675_1.time_ and arg_675_1.time_ <= var_678_5 + arg_678_0 and arg_675_1.var_.characterEffect1037ui_story == nil then
				arg_675_1.var_.characterEffect1037ui_story = var_678_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_6 = 0.2

			if var_678_5 <= arg_675_1.time_ and arg_675_1.time_ < var_678_5 + var_678_6 then
				local var_678_7 = (arg_675_1.time_ - var_678_5) / var_678_6

				if arg_675_1.var_.characterEffect1037ui_story then
					arg_675_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_675_1.time_ >= var_678_5 + var_678_6 and arg_675_1.time_ < var_678_5 + var_678_6 + arg_678_0 and arg_675_1.var_.characterEffect1037ui_story then
				arg_675_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_678_8 = arg_675_1.actors_["1036ui_story"]
			local var_678_9 = 0

			if var_678_9 < arg_675_1.time_ and arg_675_1.time_ <= var_678_9 + arg_678_0 and arg_675_1.var_.characterEffect1036ui_story == nil then
				arg_675_1.var_.characterEffect1036ui_story = var_678_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_10 = 0.2

			if var_678_9 <= arg_675_1.time_ and arg_675_1.time_ < var_678_9 + var_678_10 then
				local var_678_11 = (arg_675_1.time_ - var_678_9) / var_678_10

				if arg_675_1.var_.characterEffect1036ui_story then
					local var_678_12 = Mathf.Lerp(0, 0.5, var_678_11)

					arg_675_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_675_1.var_.characterEffect1036ui_story.fillRatio = var_678_12
				end
			end

			if arg_675_1.time_ >= var_678_9 + var_678_10 and arg_675_1.time_ < var_678_9 + var_678_10 + arg_678_0 and arg_675_1.var_.characterEffect1036ui_story then
				local var_678_13 = 0.5

				arg_675_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_675_1.var_.characterEffect1036ui_story.fillRatio = var_678_13
			end

			local var_678_14 = 0

			if var_678_14 < arg_675_1.time_ and arg_675_1.time_ <= var_678_14 + arg_678_0 then
				arg_675_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action3_1")
			end

			local var_678_15 = 0

			if var_678_15 < arg_675_1.time_ and arg_675_1.time_ <= var_678_15 + arg_678_0 then
				arg_675_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_678_16 = 0

			if var_678_16 < arg_675_1.time_ and arg_675_1.time_ <= var_678_16 + arg_678_0 then
				arg_675_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action4_2")
			end

			local var_678_17 = arg_675_1.actors_["1037ui_story"].transform
			local var_678_18 = 0

			if var_678_18 < arg_675_1.time_ and arg_675_1.time_ <= var_678_18 + arg_678_0 then
				arg_675_1.var_.moveOldPos1037ui_story = var_678_17.localPosition
			end

			local var_678_19 = 0.001

			if var_678_18 <= arg_675_1.time_ and arg_675_1.time_ < var_678_18 + var_678_19 then
				local var_678_20 = (arg_675_1.time_ - var_678_18) / var_678_19
				local var_678_21 = Vector3.New(0, -1.09, -5.81)

				var_678_17.localPosition = Vector3.Lerp(arg_675_1.var_.moveOldPos1037ui_story, var_678_21, var_678_20)

				local var_678_22 = manager.ui.mainCamera.transform.position - var_678_17.position

				var_678_17.forward = Vector3.New(var_678_22.x, var_678_22.y, var_678_22.z)

				local var_678_23 = var_678_17.localEulerAngles

				var_678_23.z = 0
				var_678_23.x = 0
				var_678_17.localEulerAngles = var_678_23
			end

			if arg_675_1.time_ >= var_678_18 + var_678_19 and arg_675_1.time_ < var_678_18 + var_678_19 + arg_678_0 then
				var_678_17.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_678_24 = manager.ui.mainCamera.transform.position - var_678_17.position

				var_678_17.forward = Vector3.New(var_678_24.x, var_678_24.y, var_678_24.z)

				local var_678_25 = var_678_17.localEulerAngles

				var_678_25.z = 0
				var_678_25.x = 0
				var_678_17.localEulerAngles = var_678_25
			end

			local var_678_26 = arg_675_1.actors_["1036ui_story"].transform
			local var_678_27 = 0

			if var_678_27 < arg_675_1.time_ and arg_675_1.time_ <= var_678_27 + arg_678_0 then
				arg_675_1.var_.moveOldPos1036ui_story = var_678_26.localPosition
			end

			local var_678_28 = 0.001

			if var_678_27 <= arg_675_1.time_ and arg_675_1.time_ < var_678_27 + var_678_28 then
				local var_678_29 = (arg_675_1.time_ - var_678_27) / var_678_28
				local var_678_30 = Vector3.New(-0.7, -1.09, -5.78)

				var_678_26.localPosition = Vector3.Lerp(arg_675_1.var_.moveOldPos1036ui_story, var_678_30, var_678_29)

				local var_678_31 = manager.ui.mainCamera.transform.position - var_678_26.position

				var_678_26.forward = Vector3.New(var_678_31.x, var_678_31.y, var_678_31.z)

				local var_678_32 = var_678_26.localEulerAngles

				var_678_32.z = 0
				var_678_32.x = 0
				var_678_26.localEulerAngles = var_678_32
			end

			if arg_675_1.time_ >= var_678_27 + var_678_28 and arg_675_1.time_ < var_678_27 + var_678_28 + arg_678_0 then
				var_678_26.localPosition = Vector3.New(-0.7, -1.09, -5.78)

				local var_678_33 = manager.ui.mainCamera.transform.position - var_678_26.position

				var_678_26.forward = Vector3.New(var_678_33.x, var_678_33.y, var_678_33.z)

				local var_678_34 = var_678_26.localEulerAngles

				var_678_34.z = 0
				var_678_34.x = 0
				var_678_26.localEulerAngles = var_678_34
			end

			local var_678_35 = 0
			local var_678_36 = 0.2

			if var_678_35 < arg_675_1.time_ and arg_675_1.time_ <= var_678_35 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_37 = arg_675_1:FormatText(StoryNameCfg[15].name)

				arg_675_1.leftNameTxt_.text = var_678_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_38 = arg_675_1:GetWordFromCfg(910201167)
				local var_678_39 = arg_675_1:FormatText(var_678_38.content)

				arg_675_1.text_.text = var_678_39

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_40 = 8
				local var_678_41 = utf8.len(var_678_39)
				local var_678_42 = var_678_40 <= 0 and var_678_36 or var_678_36 * (var_678_41 / var_678_40)

				if var_678_42 > 0 and var_678_36 < var_678_42 then
					arg_675_1.talkMaxDuration = var_678_42

					if var_678_42 + var_678_35 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_42 + var_678_35
					end
				end

				arg_675_1.text_.text = var_678_39
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)
				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_43 = math.max(var_678_36, arg_675_1.talkMaxDuration)

			if var_678_35 <= arg_675_1.time_ and arg_675_1.time_ < var_678_35 + var_678_43 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_35) / var_678_43

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_35 + var_678_43 and arg_675_1.time_ < var_678_35 + var_678_43 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play910201168 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 910201168
		arg_679_1.duration_ = 5

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play910201169(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = arg_679_1.actors_["1036ui_story"].transform
			local var_682_1 = 0

			if var_682_1 < arg_679_1.time_ and arg_679_1.time_ <= var_682_1 + arg_682_0 then
				arg_679_1.var_.moveOldPos1036ui_story = var_682_0.localPosition
			end

			local var_682_2 = 0.001

			if var_682_1 <= arg_679_1.time_ and arg_679_1.time_ < var_682_1 + var_682_2 then
				local var_682_3 = (arg_679_1.time_ - var_682_1) / var_682_2
				local var_682_4 = Vector3.New(0, 100, 0)

				var_682_0.localPosition = Vector3.Lerp(arg_679_1.var_.moveOldPos1036ui_story, var_682_4, var_682_3)

				local var_682_5 = manager.ui.mainCamera.transform.position - var_682_0.position

				var_682_0.forward = Vector3.New(var_682_5.x, var_682_5.y, var_682_5.z)

				local var_682_6 = var_682_0.localEulerAngles

				var_682_6.z = 0
				var_682_6.x = 0
				var_682_0.localEulerAngles = var_682_6
			end

			if arg_679_1.time_ >= var_682_1 + var_682_2 and arg_679_1.time_ < var_682_1 + var_682_2 + arg_682_0 then
				var_682_0.localPosition = Vector3.New(0, 100, 0)

				local var_682_7 = manager.ui.mainCamera.transform.position - var_682_0.position

				var_682_0.forward = Vector3.New(var_682_7.x, var_682_7.y, var_682_7.z)

				local var_682_8 = var_682_0.localEulerAngles

				var_682_8.z = 0
				var_682_8.x = 0
				var_682_0.localEulerAngles = var_682_8
			end

			local var_682_9 = arg_679_1.actors_["1037ui_story"].transform
			local var_682_10 = 0

			if var_682_10 < arg_679_1.time_ and arg_679_1.time_ <= var_682_10 + arg_682_0 then
				arg_679_1.var_.moveOldPos1037ui_story = var_682_9.localPosition
			end

			local var_682_11 = 0.001

			if var_682_10 <= arg_679_1.time_ and arg_679_1.time_ < var_682_10 + var_682_11 then
				local var_682_12 = (arg_679_1.time_ - var_682_10) / var_682_11
				local var_682_13 = Vector3.New(0, 100, 0)

				var_682_9.localPosition = Vector3.Lerp(arg_679_1.var_.moveOldPos1037ui_story, var_682_13, var_682_12)

				local var_682_14 = manager.ui.mainCamera.transform.position - var_682_9.position

				var_682_9.forward = Vector3.New(var_682_14.x, var_682_14.y, var_682_14.z)

				local var_682_15 = var_682_9.localEulerAngles

				var_682_15.z = 0
				var_682_15.x = 0
				var_682_9.localEulerAngles = var_682_15
			end

			if arg_679_1.time_ >= var_682_10 + var_682_11 and arg_679_1.time_ < var_682_10 + var_682_11 + arg_682_0 then
				var_682_9.localPosition = Vector3.New(0, 100, 0)

				local var_682_16 = manager.ui.mainCamera.transform.position - var_682_9.position

				var_682_9.forward = Vector3.New(var_682_16.x, var_682_16.y, var_682_16.z)

				local var_682_17 = var_682_9.localEulerAngles

				var_682_17.z = 0
				var_682_17.x = 0
				var_682_9.localEulerAngles = var_682_17
			end

			local var_682_18 = "1066ui_story"

			if arg_679_1.actors_[var_682_18] == nil then
				local var_682_19 = Object.Instantiate(Asset.Load("Char/" .. var_682_18), arg_679_1.stage_.transform)

				var_682_19.name = var_682_18
				var_682_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_679_1.actors_[var_682_18] = var_682_19

				local var_682_20 = var_682_19:GetComponentInChildren(typeof(CharacterEffect))

				var_682_20.enabled = true

				local var_682_21 = GameObjectTools.GetOrAddComponent(var_682_19, typeof(DynamicBoneHelper))

				if var_682_21 then
					var_682_21:EnableDynamicBone(false)
				end

				arg_679_1:ShowWeapon(var_682_20.transform, false)

				arg_679_1.var_[var_682_18 .. "Animator"] = var_682_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_679_1.var_[var_682_18 .. "Animator"].applyRootMotion = true
				arg_679_1.var_[var_682_18 .. "LipSync"] = var_682_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_682_22 = arg_679_1.actors_["1066ui_story"].transform
			local var_682_23 = 0

			if var_682_23 < arg_679_1.time_ and arg_679_1.time_ <= var_682_23 + arg_682_0 then
				arg_679_1.var_.moveOldPos1066ui_story = var_682_22.localPosition
			end

			local var_682_24 = 0.001

			if var_682_23 <= arg_679_1.time_ and arg_679_1.time_ < var_682_23 + var_682_24 then
				local var_682_25 = (arg_679_1.time_ - var_682_23) / var_682_24
				local var_682_26 = Vector3.New(0, -0.77, -6.1)

				var_682_22.localPosition = Vector3.Lerp(arg_679_1.var_.moveOldPos1066ui_story, var_682_26, var_682_25)

				local var_682_27 = manager.ui.mainCamera.transform.position - var_682_22.position

				var_682_22.forward = Vector3.New(var_682_27.x, var_682_27.y, var_682_27.z)

				local var_682_28 = var_682_22.localEulerAngles

				var_682_28.z = 0
				var_682_28.x = 0
				var_682_22.localEulerAngles = var_682_28
			end

			if arg_679_1.time_ >= var_682_23 + var_682_24 and arg_679_1.time_ < var_682_23 + var_682_24 + arg_682_0 then
				var_682_22.localPosition = Vector3.New(0, -0.77, -6.1)

				local var_682_29 = manager.ui.mainCamera.transform.position - var_682_22.position

				var_682_22.forward = Vector3.New(var_682_29.x, var_682_29.y, var_682_29.z)

				local var_682_30 = var_682_22.localEulerAngles

				var_682_30.z = 0
				var_682_30.x = 0
				var_682_22.localEulerAngles = var_682_30
			end

			local var_682_31 = 0

			if var_682_31 < arg_679_1.time_ and arg_679_1.time_ <= var_682_31 + arg_682_0 then
				arg_679_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/1066/1066action/1066action4_1")
			end

			local var_682_32 = arg_679_1.actors_["1066ui_story"]
			local var_682_33 = 0

			if var_682_33 < arg_679_1.time_ and arg_679_1.time_ <= var_682_33 + arg_682_0 and arg_679_1.var_.characterEffect1066ui_story == nil then
				arg_679_1.var_.characterEffect1066ui_story = var_682_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_682_34 = 0.2

			if var_682_33 <= arg_679_1.time_ and arg_679_1.time_ < var_682_33 + var_682_34 then
				local var_682_35 = (arg_679_1.time_ - var_682_33) / var_682_34

				if arg_679_1.var_.characterEffect1066ui_story then
					arg_679_1.var_.characterEffect1066ui_story.fillFlat = false
				end
			end

			if arg_679_1.time_ >= var_682_33 + var_682_34 and arg_679_1.time_ < var_682_33 + var_682_34 + arg_682_0 and arg_679_1.var_.characterEffect1066ui_story then
				arg_679_1.var_.characterEffect1066ui_story.fillFlat = false
			end

			local var_682_36 = 0

			if var_682_36 < arg_679_1.time_ and arg_679_1.time_ <= var_682_36 + arg_682_0 then
				arg_679_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_682_37 = 0
			local var_682_38 = 1

			if var_682_37 < arg_679_1.time_ and arg_679_1.time_ <= var_682_37 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_39 = arg_679_1:FormatText(StoryNameCfg[32].name)

				arg_679_1.leftNameTxt_.text = var_682_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_40 = arg_679_1:GetWordFromCfg(910201168)
				local var_682_41 = arg_679_1:FormatText(var_682_40.content)

				arg_679_1.text_.text = var_682_41

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_42 = 40
				local var_682_43 = utf8.len(var_682_41)
				local var_682_44 = var_682_42 <= 0 and var_682_38 or var_682_38 * (var_682_43 / var_682_42)

				if var_682_44 > 0 and var_682_38 < var_682_44 then
					arg_679_1.talkMaxDuration = var_682_44

					if var_682_44 + var_682_37 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_44 + var_682_37
					end
				end

				arg_679_1.text_.text = var_682_41
				arg_679_1.typewritter.percent = 0

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(false)
				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_45 = math.max(var_682_38, arg_679_1.talkMaxDuration)

			if var_682_37 <= arg_679_1.time_ and arg_679_1.time_ < var_682_37 + var_682_45 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_37) / var_682_45

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_37 + var_682_45 and arg_679_1.time_ < var_682_37 + var_682_45 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play910201169 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 910201169
		arg_683_1.duration_ = 5

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
		end

		function arg_683_1.playNext_(arg_685_0)
			if arg_685_0 == 1 then
				arg_683_0:Play910201170(arg_683_1)
			end
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = 0

			if var_686_0 < arg_683_1.time_ and arg_683_1.time_ <= var_686_0 + arg_686_0 then
				arg_683_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/1066/1066actionlink/1066action443")
			end

			local var_686_1 = 0

			if var_686_1 < arg_683_1.time_ and arg_683_1.time_ <= var_686_1 + arg_686_0 then
				arg_683_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_686_2 = 0
			local var_686_3 = 1.1

			if var_686_2 < arg_683_1.time_ and arg_683_1.time_ <= var_686_2 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0
				arg_683_1.dialogCg_.alpha = 1

				arg_683_1.dialog_:SetActive(true)
				SetActive(arg_683_1.leftNameGo_, true)

				local var_686_4 = arg_683_1:FormatText(StoryNameCfg[32].name)

				arg_683_1.leftNameTxt_.text = var_686_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_683_1.leftNameTxt_.transform)

				arg_683_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_683_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_683_1:RecordName(arg_683_1.leftNameTxt_.text)
				SetActive(arg_683_1.iconTrs_.gameObject, false)
				arg_683_1.callingController_:SetSelectedState("normal")

				local var_686_5 = arg_683_1:GetWordFromCfg(910201169)
				local var_686_6 = arg_683_1:FormatText(var_686_5.content)

				arg_683_1.text_.text = var_686_6

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.text_)

				local var_686_7 = 44
				local var_686_8 = utf8.len(var_686_6)
				local var_686_9 = var_686_7 <= 0 and var_686_3 or var_686_3 * (var_686_8 / var_686_7)

				if var_686_9 > 0 and var_686_3 < var_686_9 then
					arg_683_1.talkMaxDuration = var_686_9

					if var_686_9 + var_686_2 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_9 + var_686_2
					end
				end

				arg_683_1.text_.text = var_686_6
				arg_683_1.typewritter.percent = 0

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(false)
				arg_683_1:RecordContent(arg_683_1.text_.text)
			end

			local var_686_10 = math.max(var_686_3, arg_683_1.talkMaxDuration)

			if var_686_2 <= arg_683_1.time_ and arg_683_1.time_ < var_686_2 + var_686_10 then
				arg_683_1.typewritter.percent = (arg_683_1.time_ - var_686_2) / var_686_10

				arg_683_1.typewritter:SetDirty()
			end

			if arg_683_1.time_ >= var_686_2 + var_686_10 and arg_683_1.time_ < var_686_2 + var_686_10 + arg_686_0 then
				arg_683_1.typewritter.percent = 1

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(true)
			end
		end
	end,
	Play910201170 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 910201170
		arg_687_1.duration_ = 5

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play910201171(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = arg_687_1.actors_["1066ui_story"].transform
			local var_690_1 = 0

			if var_690_1 < arg_687_1.time_ and arg_687_1.time_ <= var_690_1 + arg_690_0 then
				arg_687_1.var_.moveOldPos1066ui_story = var_690_0.localPosition
			end

			local var_690_2 = 0.001

			if var_690_1 <= arg_687_1.time_ and arg_687_1.time_ < var_690_1 + var_690_2 then
				local var_690_3 = (arg_687_1.time_ - var_690_1) / var_690_2
				local var_690_4 = Vector3.New(0, 100, 0)

				var_690_0.localPosition = Vector3.Lerp(arg_687_1.var_.moveOldPos1066ui_story, var_690_4, var_690_3)

				local var_690_5 = manager.ui.mainCamera.transform.position - var_690_0.position

				var_690_0.forward = Vector3.New(var_690_5.x, var_690_5.y, var_690_5.z)

				local var_690_6 = var_690_0.localEulerAngles

				var_690_6.z = 0
				var_690_6.x = 0
				var_690_0.localEulerAngles = var_690_6
			end

			if arg_687_1.time_ >= var_690_1 + var_690_2 and arg_687_1.time_ < var_690_1 + var_690_2 + arg_690_0 then
				var_690_0.localPosition = Vector3.New(0, 100, 0)

				local var_690_7 = manager.ui.mainCamera.transform.position - var_690_0.position

				var_690_0.forward = Vector3.New(var_690_7.x, var_690_7.y, var_690_7.z)

				local var_690_8 = var_690_0.localEulerAngles

				var_690_8.z = 0
				var_690_8.x = 0
				var_690_0.localEulerAngles = var_690_8
			end

			local var_690_9 = "1027ui_story"

			if arg_687_1.actors_[var_690_9] == nil then
				local var_690_10 = Object.Instantiate(Asset.Load("Char/" .. var_690_9), arg_687_1.stage_.transform)

				var_690_10.name = var_690_9
				var_690_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_687_1.actors_[var_690_9] = var_690_10

				local var_690_11 = var_690_10:GetComponentInChildren(typeof(CharacterEffect))

				var_690_11.enabled = true

				local var_690_12 = GameObjectTools.GetOrAddComponent(var_690_10, typeof(DynamicBoneHelper))

				if var_690_12 then
					var_690_12:EnableDynamicBone(false)
				end

				arg_687_1:ShowWeapon(var_690_11.transform, false)

				arg_687_1.var_[var_690_9 .. "Animator"] = var_690_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_687_1.var_[var_690_9 .. "Animator"].applyRootMotion = true
				arg_687_1.var_[var_690_9 .. "LipSync"] = var_690_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_690_13 = arg_687_1.actors_["1027ui_story"].transform
			local var_690_14 = 0

			if var_690_14 < arg_687_1.time_ and arg_687_1.time_ <= var_690_14 + arg_690_0 then
				arg_687_1.var_.moveOldPos1027ui_story = var_690_13.localPosition
			end

			local var_690_15 = 0.001

			if var_690_14 <= arg_687_1.time_ and arg_687_1.time_ < var_690_14 + var_690_15 then
				local var_690_16 = (arg_687_1.time_ - var_690_14) / var_690_15
				local var_690_17 = Vector3.New(0, -0.81, -5.8)

				var_690_13.localPosition = Vector3.Lerp(arg_687_1.var_.moveOldPos1027ui_story, var_690_17, var_690_16)

				local var_690_18 = manager.ui.mainCamera.transform.position - var_690_13.position

				var_690_13.forward = Vector3.New(var_690_18.x, var_690_18.y, var_690_18.z)

				local var_690_19 = var_690_13.localEulerAngles

				var_690_19.z = 0
				var_690_19.x = 0
				var_690_13.localEulerAngles = var_690_19
			end

			if arg_687_1.time_ >= var_690_14 + var_690_15 and arg_687_1.time_ < var_690_14 + var_690_15 + arg_690_0 then
				var_690_13.localPosition = Vector3.New(0, -0.81, -5.8)

				local var_690_20 = manager.ui.mainCamera.transform.position - var_690_13.position

				var_690_13.forward = Vector3.New(var_690_20.x, var_690_20.y, var_690_20.z)

				local var_690_21 = var_690_13.localEulerAngles

				var_690_21.z = 0
				var_690_21.x = 0
				var_690_13.localEulerAngles = var_690_21
			end

			local var_690_22 = 0

			if var_690_22 < arg_687_1.time_ and arg_687_1.time_ <= var_690_22 + arg_690_0 then
				arg_687_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action7_1")
			end

			local var_690_23 = 0

			if var_690_23 < arg_687_1.time_ and arg_687_1.time_ <= var_690_23 + arg_690_0 then
				arg_687_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2203cva")
			end

			local var_690_24 = arg_687_1.actors_["1027ui_story"]
			local var_690_25 = 0

			if var_690_25 < arg_687_1.time_ and arg_687_1.time_ <= var_690_25 + arg_690_0 and arg_687_1.var_.characterEffect1027ui_story == nil then
				arg_687_1.var_.characterEffect1027ui_story = var_690_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_690_26 = 0.2

			if var_690_25 <= arg_687_1.time_ and arg_687_1.time_ < var_690_25 + var_690_26 then
				local var_690_27 = (arg_687_1.time_ - var_690_25) / var_690_26

				if arg_687_1.var_.characterEffect1027ui_story then
					arg_687_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_687_1.time_ >= var_690_25 + var_690_26 and arg_687_1.time_ < var_690_25 + var_690_26 + arg_690_0 and arg_687_1.var_.characterEffect1027ui_story then
				arg_687_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_690_28 = 0
			local var_690_29 = 0.3

			if var_690_28 < arg_687_1.time_ and arg_687_1.time_ <= var_690_28 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0
				arg_687_1.dialogCg_.alpha = 1

				arg_687_1.dialog_:SetActive(true)
				SetActive(arg_687_1.leftNameGo_, true)

				local var_690_30 = arg_687_1:FormatText(StoryNameCfg[56].name)

				arg_687_1.leftNameTxt_.text = var_690_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_687_1.leftNameTxt_.transform)

				arg_687_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_687_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_687_1:RecordName(arg_687_1.leftNameTxt_.text)
				SetActive(arg_687_1.iconTrs_.gameObject, false)
				arg_687_1.callingController_:SetSelectedState("normal")

				local var_690_31 = arg_687_1:GetWordFromCfg(910201170)
				local var_690_32 = arg_687_1:FormatText(var_690_31.content)

				arg_687_1.text_.text = var_690_32

				LuaForUtil.ClearLinePrefixSymbol(arg_687_1.text_)

				local var_690_33 = 12
				local var_690_34 = utf8.len(var_690_32)
				local var_690_35 = var_690_33 <= 0 and var_690_29 or var_690_29 * (var_690_34 / var_690_33)

				if var_690_35 > 0 and var_690_29 < var_690_35 then
					arg_687_1.talkMaxDuration = var_690_35

					if var_690_35 + var_690_28 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_35 + var_690_28
					end
				end

				arg_687_1.text_.text = var_690_32
				arg_687_1.typewritter.percent = 0

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(false)
				arg_687_1:RecordContent(arg_687_1.text_.text)
			end

			local var_690_36 = math.max(var_690_29, arg_687_1.talkMaxDuration)

			if var_690_28 <= arg_687_1.time_ and arg_687_1.time_ < var_690_28 + var_690_36 then
				arg_687_1.typewritter.percent = (arg_687_1.time_ - var_690_28) / var_690_36

				arg_687_1.typewritter:SetDirty()
			end

			if arg_687_1.time_ >= var_690_28 + var_690_36 and arg_687_1.time_ < var_690_28 + var_690_36 + arg_690_0 then
				arg_687_1.typewritter.percent = 1

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(true)
			end
		end
	end,
	Play910201171 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 910201171
		arg_691_1.duration_ = 5

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
		end

		function arg_691_1.playNext_(arg_693_0)
			if arg_693_0 == 1 then
				arg_691_0:Play910201172(arg_691_1)
			end
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = 0

			if var_694_0 < arg_691_1.time_ and arg_691_1.time_ <= var_694_0 + arg_694_0 then
				arg_691_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action476")
			end

			local var_694_1 = 0

			if var_694_1 < arg_691_1.time_ and arg_691_1.time_ <= var_694_1 + arg_694_0 then
				arg_691_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_694_2 = 0
			local var_694_3 = 0.85

			if var_694_2 < arg_691_1.time_ and arg_691_1.time_ <= var_694_2 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0
				arg_691_1.dialogCg_.alpha = 1

				arg_691_1.dialog_:SetActive(true)
				SetActive(arg_691_1.leftNameGo_, true)

				local var_694_4 = arg_691_1:FormatText(StoryNameCfg[56].name)

				arg_691_1.leftNameTxt_.text = var_694_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_691_1.leftNameTxt_.transform)

				arg_691_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_691_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_691_1:RecordName(arg_691_1.leftNameTxt_.text)
				SetActive(arg_691_1.iconTrs_.gameObject, false)
				arg_691_1.callingController_:SetSelectedState("normal")

				local var_694_5 = arg_691_1:GetWordFromCfg(910201171)
				local var_694_6 = arg_691_1:FormatText(var_694_5.content)

				arg_691_1.text_.text = var_694_6

				LuaForUtil.ClearLinePrefixSymbol(arg_691_1.text_)

				local var_694_7 = 34
				local var_694_8 = utf8.len(var_694_6)
				local var_694_9 = var_694_7 <= 0 and var_694_3 or var_694_3 * (var_694_8 / var_694_7)

				if var_694_9 > 0 and var_694_3 < var_694_9 then
					arg_691_1.talkMaxDuration = var_694_9

					if var_694_9 + var_694_2 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_9 + var_694_2
					end
				end

				arg_691_1.text_.text = var_694_6
				arg_691_1.typewritter.percent = 0

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(false)
				arg_691_1:RecordContent(arg_691_1.text_.text)
			end

			local var_694_10 = math.max(var_694_3, arg_691_1.talkMaxDuration)

			if var_694_2 <= arg_691_1.time_ and arg_691_1.time_ < var_694_2 + var_694_10 then
				arg_691_1.typewritter.percent = (arg_691_1.time_ - var_694_2) / var_694_10

				arg_691_1.typewritter:SetDirty()
			end

			if arg_691_1.time_ >= var_694_2 + var_694_10 and arg_691_1.time_ < var_694_2 + var_694_10 + arg_694_0 then
				arg_691_1.typewritter.percent = 1

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(true)
			end
		end
	end,
	Play910201172 = function(arg_695_0, arg_695_1)
		arg_695_1.time_ = 0
		arg_695_1.frameCnt_ = 0
		arg_695_1.state_ = "playing"
		arg_695_1.curTalkId_ = 910201172
		arg_695_1.duration_ = 5

		SetActive(arg_695_1.tipsGo_, false)

		function arg_695_1.onSingleLineFinish_()
			arg_695_1.onSingleLineUpdate_ = nil
			arg_695_1.onSingleLineFinish_ = nil
			arg_695_1.state_ = "waiting"
		end

		function arg_695_1.playNext_(arg_697_0)
			if arg_697_0 == 1 then
				arg_695_0:Play910201173(arg_695_1)
			end
		end

		function arg_695_1.onSingleLineUpdate_(arg_698_0)
			local var_698_0 = 0

			if var_698_0 < arg_695_1.time_ and arg_695_1.time_ <= var_698_0 + arg_698_0 then
				arg_695_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action462")
			end

			local var_698_1 = 0

			if var_698_1 < arg_695_1.time_ and arg_695_1.time_ <= var_698_1 + arg_698_0 then
				arg_695_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_698_2 = 0
			local var_698_3 = 0.275

			if var_698_2 < arg_695_1.time_ and arg_695_1.time_ <= var_698_2 + arg_698_0 then
				arg_695_1.talkMaxDuration = 0
				arg_695_1.dialogCg_.alpha = 1

				arg_695_1.dialog_:SetActive(true)
				SetActive(arg_695_1.leftNameGo_, true)

				local var_698_4 = arg_695_1:FormatText(StoryNameCfg[56].name)

				arg_695_1.leftNameTxt_.text = var_698_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_695_1.leftNameTxt_.transform)

				arg_695_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_695_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_695_1:RecordName(arg_695_1.leftNameTxt_.text)
				SetActive(arg_695_1.iconTrs_.gameObject, false)
				arg_695_1.callingController_:SetSelectedState("normal")

				local var_698_5 = arg_695_1:GetWordFromCfg(910201172)
				local var_698_6 = arg_695_1:FormatText(var_698_5.content)

				arg_695_1.text_.text = var_698_6

				LuaForUtil.ClearLinePrefixSymbol(arg_695_1.text_)

				local var_698_7 = 11
				local var_698_8 = utf8.len(var_698_6)
				local var_698_9 = var_698_7 <= 0 and var_698_3 or var_698_3 * (var_698_8 / var_698_7)

				if var_698_9 > 0 and var_698_3 < var_698_9 then
					arg_695_1.talkMaxDuration = var_698_9

					if var_698_9 + var_698_2 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_9 + var_698_2
					end
				end

				arg_695_1.text_.text = var_698_6
				arg_695_1.typewritter.percent = 0

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(false)
				arg_695_1:RecordContent(arg_695_1.text_.text)
			end

			local var_698_10 = math.max(var_698_3, arg_695_1.talkMaxDuration)

			if var_698_2 <= arg_695_1.time_ and arg_695_1.time_ < var_698_2 + var_698_10 then
				arg_695_1.typewritter.percent = (arg_695_1.time_ - var_698_2) / var_698_10

				arg_695_1.typewritter:SetDirty()
			end

			if arg_695_1.time_ >= var_698_2 + var_698_10 and arg_695_1.time_ < var_698_2 + var_698_10 + arg_698_0 then
				arg_695_1.typewritter.percent = 1

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(true)
			end
		end
	end,
	Play910201173 = function(arg_699_0, arg_699_1)
		arg_699_1.time_ = 0
		arg_699_1.frameCnt_ = 0
		arg_699_1.state_ = "playing"
		arg_699_1.curTalkId_ = 910201173
		arg_699_1.duration_ = 5

		SetActive(arg_699_1.tipsGo_, false)

		function arg_699_1.onSingleLineFinish_()
			arg_699_1.onSingleLineUpdate_ = nil
			arg_699_1.onSingleLineFinish_ = nil
			arg_699_1.state_ = "waiting"
		end

		function arg_699_1.playNext_(arg_701_0)
			if arg_701_0 == 1 then
				arg_699_0:Play910201174(arg_699_1)
			end
		end

		function arg_699_1.onSingleLineUpdate_(arg_702_0)
			local var_702_0 = arg_699_1.actors_["1027ui_story"].transform
			local var_702_1 = 0

			if var_702_1 < arg_699_1.time_ and arg_699_1.time_ <= var_702_1 + arg_702_0 then
				arg_699_1.var_.moveOldPos1027ui_story = var_702_0.localPosition
			end

			local var_702_2 = 0.001

			if var_702_1 <= arg_699_1.time_ and arg_699_1.time_ < var_702_1 + var_702_2 then
				local var_702_3 = (arg_699_1.time_ - var_702_1) / var_702_2
				local var_702_4 = Vector3.New(0, 100, 0)

				var_702_0.localPosition = Vector3.Lerp(arg_699_1.var_.moveOldPos1027ui_story, var_702_4, var_702_3)

				local var_702_5 = manager.ui.mainCamera.transform.position - var_702_0.position

				var_702_0.forward = Vector3.New(var_702_5.x, var_702_5.y, var_702_5.z)

				local var_702_6 = var_702_0.localEulerAngles

				var_702_6.z = 0
				var_702_6.x = 0
				var_702_0.localEulerAngles = var_702_6
			end

			if arg_699_1.time_ >= var_702_1 + var_702_2 and arg_699_1.time_ < var_702_1 + var_702_2 + arg_702_0 then
				var_702_0.localPosition = Vector3.New(0, 100, 0)

				local var_702_7 = manager.ui.mainCamera.transform.position - var_702_0.position

				var_702_0.forward = Vector3.New(var_702_7.x, var_702_7.y, var_702_7.z)

				local var_702_8 = var_702_0.localEulerAngles

				var_702_8.z = 0
				var_702_8.x = 0
				var_702_0.localEulerAngles = var_702_8
			end

			local var_702_9 = "1011ui_story"

			if arg_699_1.actors_[var_702_9] == nil then
				local var_702_10 = Object.Instantiate(Asset.Load("Char/" .. var_702_9), arg_699_1.stage_.transform)

				var_702_10.name = var_702_9
				var_702_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_699_1.actors_[var_702_9] = var_702_10

				local var_702_11 = var_702_10:GetComponentInChildren(typeof(CharacterEffect))

				var_702_11.enabled = true

				local var_702_12 = GameObjectTools.GetOrAddComponent(var_702_10, typeof(DynamicBoneHelper))

				if var_702_12 then
					var_702_12:EnableDynamicBone(false)
				end

				arg_699_1:ShowWeapon(var_702_11.transform, false)

				arg_699_1.var_[var_702_9 .. "Animator"] = var_702_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_699_1.var_[var_702_9 .. "Animator"].applyRootMotion = true
				arg_699_1.var_[var_702_9 .. "LipSync"] = var_702_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_702_13 = arg_699_1.actors_["1011ui_story"].transform
			local var_702_14 = 0

			if var_702_14 < arg_699_1.time_ and arg_699_1.time_ <= var_702_14 + arg_702_0 then
				arg_699_1.var_.moveOldPos1011ui_story = var_702_13.localPosition
			end

			local var_702_15 = 0.001

			if var_702_14 <= arg_699_1.time_ and arg_699_1.time_ < var_702_14 + var_702_15 then
				local var_702_16 = (arg_699_1.time_ - var_702_14) / var_702_15
				local var_702_17 = Vector3.New(0, -0.71, -6)

				var_702_13.localPosition = Vector3.Lerp(arg_699_1.var_.moveOldPos1011ui_story, var_702_17, var_702_16)

				local var_702_18 = manager.ui.mainCamera.transform.position - var_702_13.position

				var_702_13.forward = Vector3.New(var_702_18.x, var_702_18.y, var_702_18.z)

				local var_702_19 = var_702_13.localEulerAngles

				var_702_19.z = 0
				var_702_19.x = 0
				var_702_13.localEulerAngles = var_702_19
			end

			if arg_699_1.time_ >= var_702_14 + var_702_15 and arg_699_1.time_ < var_702_14 + var_702_15 + arg_702_0 then
				var_702_13.localPosition = Vector3.New(0, -0.71, -6)

				local var_702_20 = manager.ui.mainCamera.transform.position - var_702_13.position

				var_702_13.forward = Vector3.New(var_702_20.x, var_702_20.y, var_702_20.z)

				local var_702_21 = var_702_13.localEulerAngles

				var_702_21.z = 0
				var_702_21.x = 0
				var_702_13.localEulerAngles = var_702_21
			end

			local var_702_22 = 0

			if var_702_22 < arg_699_1.time_ and arg_699_1.time_ <= var_702_22 + arg_702_0 then
				arg_699_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_702_23 = 0

			if var_702_23 < arg_699_1.time_ and arg_699_1.time_ <= var_702_23 + arg_702_0 then
				arg_699_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_702_24 = arg_699_1.actors_["1011ui_story"]
			local var_702_25 = 0

			if var_702_25 < arg_699_1.time_ and arg_699_1.time_ <= var_702_25 + arg_702_0 and arg_699_1.var_.characterEffect1011ui_story == nil then
				arg_699_1.var_.characterEffect1011ui_story = var_702_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_702_26 = 0.2

			if var_702_25 <= arg_699_1.time_ and arg_699_1.time_ < var_702_25 + var_702_26 then
				local var_702_27 = (arg_699_1.time_ - var_702_25) / var_702_26

				if arg_699_1.var_.characterEffect1011ui_story then
					arg_699_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_699_1.time_ >= var_702_25 + var_702_26 and arg_699_1.time_ < var_702_25 + var_702_26 + arg_702_0 and arg_699_1.var_.characterEffect1011ui_story then
				arg_699_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_702_28 = 0
			local var_702_29 = 0.25

			if var_702_28 < arg_699_1.time_ and arg_699_1.time_ <= var_702_28 + arg_702_0 then
				arg_699_1.talkMaxDuration = 0
				arg_699_1.dialogCg_.alpha = 1

				arg_699_1.dialog_:SetActive(true)
				SetActive(arg_699_1.leftNameGo_, true)

				local var_702_30 = arg_699_1:FormatText(StoryNameCfg[37].name)

				arg_699_1.leftNameTxt_.text = var_702_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_699_1.leftNameTxt_.transform)

				arg_699_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_699_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_699_1:RecordName(arg_699_1.leftNameTxt_.text)
				SetActive(arg_699_1.iconTrs_.gameObject, false)
				arg_699_1.callingController_:SetSelectedState("normal")

				local var_702_31 = arg_699_1:GetWordFromCfg(910201173)
				local var_702_32 = arg_699_1:FormatText(var_702_31.content)

				arg_699_1.text_.text = var_702_32

				LuaForUtil.ClearLinePrefixSymbol(arg_699_1.text_)

				local var_702_33 = 10
				local var_702_34 = utf8.len(var_702_32)
				local var_702_35 = var_702_33 <= 0 and var_702_29 or var_702_29 * (var_702_34 / var_702_33)

				if var_702_35 > 0 and var_702_29 < var_702_35 then
					arg_699_1.talkMaxDuration = var_702_35

					if var_702_35 + var_702_28 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_35 + var_702_28
					end
				end

				arg_699_1.text_.text = var_702_32
				arg_699_1.typewritter.percent = 0

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(false)
				arg_699_1:RecordContent(arg_699_1.text_.text)
			end

			local var_702_36 = math.max(var_702_29, arg_699_1.talkMaxDuration)

			if var_702_28 <= arg_699_1.time_ and arg_699_1.time_ < var_702_28 + var_702_36 then
				arg_699_1.typewritter.percent = (arg_699_1.time_ - var_702_28) / var_702_36

				arg_699_1.typewritter:SetDirty()
			end

			if arg_699_1.time_ >= var_702_28 + var_702_36 and arg_699_1.time_ < var_702_28 + var_702_36 + arg_702_0 then
				arg_699_1.typewritter.percent = 1

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(true)
			end
		end
	end,
	Play910201174 = function(arg_703_0, arg_703_1)
		arg_703_1.time_ = 0
		arg_703_1.frameCnt_ = 0
		arg_703_1.state_ = "playing"
		arg_703_1.curTalkId_ = 910201174
		arg_703_1.duration_ = 5

		SetActive(arg_703_1.tipsGo_, false)

		function arg_703_1.onSingleLineFinish_()
			arg_703_1.onSingleLineUpdate_ = nil
			arg_703_1.onSingleLineFinish_ = nil
			arg_703_1.state_ = "waiting"
		end

		function arg_703_1.playNext_(arg_705_0)
			if arg_705_0 == 1 then
				arg_703_0:Play910201175(arg_703_1)
			end
		end

		function arg_703_1.onSingleLineUpdate_(arg_706_0)
			local var_706_0 = arg_703_1.actors_["1011ui_story"].transform
			local var_706_1 = 0

			if var_706_1 < arg_703_1.time_ and arg_703_1.time_ <= var_706_1 + arg_706_0 then
				arg_703_1.var_.moveOldPos1011ui_story = var_706_0.localPosition
			end

			local var_706_2 = 0.001

			if var_706_1 <= arg_703_1.time_ and arg_703_1.time_ < var_706_1 + var_706_2 then
				local var_706_3 = (arg_703_1.time_ - var_706_1) / var_706_2
				local var_706_4 = Vector3.New(0, 100, 0)

				var_706_0.localPosition = Vector3.Lerp(arg_703_1.var_.moveOldPos1011ui_story, var_706_4, var_706_3)

				local var_706_5 = manager.ui.mainCamera.transform.position - var_706_0.position

				var_706_0.forward = Vector3.New(var_706_5.x, var_706_5.y, var_706_5.z)

				local var_706_6 = var_706_0.localEulerAngles

				var_706_6.z = 0
				var_706_6.x = 0
				var_706_0.localEulerAngles = var_706_6
			end

			if arg_703_1.time_ >= var_706_1 + var_706_2 and arg_703_1.time_ < var_706_1 + var_706_2 + arg_706_0 then
				var_706_0.localPosition = Vector3.New(0, 100, 0)

				local var_706_7 = manager.ui.mainCamera.transform.position - var_706_0.position

				var_706_0.forward = Vector3.New(var_706_7.x, var_706_7.y, var_706_7.z)

				local var_706_8 = var_706_0.localEulerAngles

				var_706_8.z = 0
				var_706_8.x = 0
				var_706_0.localEulerAngles = var_706_8
			end

			local var_706_9 = 0
			local var_706_10 = 0.675

			if var_706_9 < arg_703_1.time_ and arg_703_1.time_ <= var_706_9 + arg_706_0 then
				arg_703_1.talkMaxDuration = 0
				arg_703_1.dialogCg_.alpha = 1

				arg_703_1.dialog_:SetActive(true)
				SetActive(arg_703_1.leftNameGo_, false)

				arg_703_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_703_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_703_1:RecordName(arg_703_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_703_1.iconTrs_.gameObject, false)
				arg_703_1.callingController_:SetSelectedState("normal")

				local var_706_11 = arg_703_1:GetWordFromCfg(910201174)
				local var_706_12 = arg_703_1:FormatText(var_706_11.content)

				arg_703_1.text_.text = var_706_12

				LuaForUtil.ClearLinePrefixSymbol(arg_703_1.text_)

				local var_706_13 = 27
				local var_706_14 = utf8.len(var_706_12)
				local var_706_15 = var_706_13 <= 0 and var_706_10 or var_706_10 * (var_706_14 / var_706_13)

				if var_706_15 > 0 and var_706_10 < var_706_15 then
					arg_703_1.talkMaxDuration = var_706_15

					if var_706_15 + var_706_9 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_15 + var_706_9
					end
				end

				arg_703_1.text_.text = var_706_12
				arg_703_1.typewritter.percent = 0

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(false)
				arg_703_1:RecordContent(arg_703_1.text_.text)
			end

			local var_706_16 = math.max(var_706_10, arg_703_1.talkMaxDuration)

			if var_706_9 <= arg_703_1.time_ and arg_703_1.time_ < var_706_9 + var_706_16 then
				arg_703_1.typewritter.percent = (arg_703_1.time_ - var_706_9) / var_706_16

				arg_703_1.typewritter:SetDirty()
			end

			if arg_703_1.time_ >= var_706_9 + var_706_16 and arg_703_1.time_ < var_706_9 + var_706_16 + arg_706_0 then
				arg_703_1.typewritter.percent = 1

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(true)
			end
		end
	end,
	Play910201175 = function(arg_707_0, arg_707_1)
		arg_707_1.time_ = 0
		arg_707_1.frameCnt_ = 0
		arg_707_1.state_ = "playing"
		arg_707_1.curTalkId_ = 910201175
		arg_707_1.duration_ = 5

		SetActive(arg_707_1.tipsGo_, false)

		function arg_707_1.onSingleLineFinish_()
			arg_707_1.onSingleLineUpdate_ = nil
			arg_707_1.onSingleLineFinish_ = nil
			arg_707_1.state_ = "waiting"
		end

		function arg_707_1.playNext_(arg_709_0)
			if arg_709_0 == 1 then
				arg_707_0:Play910201176(arg_707_1)
			end
		end

		function arg_707_1.onSingleLineUpdate_(arg_710_0)
			local var_710_0 = arg_707_1.actors_["1084ui_story"].transform
			local var_710_1 = 0

			if var_710_1 < arg_707_1.time_ and arg_707_1.time_ <= var_710_1 + arg_710_0 then
				arg_707_1.var_.moveOldPos1084ui_story = var_710_0.localPosition
			end

			local var_710_2 = 0.001

			if var_710_1 <= arg_707_1.time_ and arg_707_1.time_ < var_710_1 + var_710_2 then
				local var_710_3 = (arg_707_1.time_ - var_710_1) / var_710_2
				local var_710_4 = Vector3.New(0, -0.97, -6)

				var_710_0.localPosition = Vector3.Lerp(arg_707_1.var_.moveOldPos1084ui_story, var_710_4, var_710_3)

				local var_710_5 = manager.ui.mainCamera.transform.position - var_710_0.position

				var_710_0.forward = Vector3.New(var_710_5.x, var_710_5.y, var_710_5.z)

				local var_710_6 = var_710_0.localEulerAngles

				var_710_6.z = 0
				var_710_6.x = 0
				var_710_0.localEulerAngles = var_710_6
			end

			if arg_707_1.time_ >= var_710_1 + var_710_2 and arg_707_1.time_ < var_710_1 + var_710_2 + arg_710_0 then
				var_710_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_710_7 = manager.ui.mainCamera.transform.position - var_710_0.position

				var_710_0.forward = Vector3.New(var_710_7.x, var_710_7.y, var_710_7.z)

				local var_710_8 = var_710_0.localEulerAngles

				var_710_8.z = 0
				var_710_8.x = 0
				var_710_0.localEulerAngles = var_710_8
			end

			local var_710_9 = arg_707_1.actors_["1084ui_story"]
			local var_710_10 = 0

			if var_710_10 < arg_707_1.time_ and arg_707_1.time_ <= var_710_10 + arg_710_0 and arg_707_1.var_.characterEffect1084ui_story == nil then
				arg_707_1.var_.characterEffect1084ui_story = var_710_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_710_11 = 0.2

			if var_710_10 <= arg_707_1.time_ and arg_707_1.time_ < var_710_10 + var_710_11 then
				local var_710_12 = (arg_707_1.time_ - var_710_10) / var_710_11

				if arg_707_1.var_.characterEffect1084ui_story then
					arg_707_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_707_1.time_ >= var_710_10 + var_710_11 and arg_707_1.time_ < var_710_10 + var_710_11 + arg_710_0 and arg_707_1.var_.characterEffect1084ui_story then
				arg_707_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_710_13 = 0

			if var_710_13 < arg_707_1.time_ and arg_707_1.time_ <= var_710_13 + arg_710_0 then
				arg_707_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_710_14 = 0

			if var_710_14 < arg_707_1.time_ and arg_707_1.time_ <= var_710_14 + arg_710_0 then
				arg_707_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_710_15 = 0
			local var_710_16 = 0.35

			if var_710_15 < arg_707_1.time_ and arg_707_1.time_ <= var_710_15 + arg_710_0 then
				arg_707_1.talkMaxDuration = 0
				arg_707_1.dialogCg_.alpha = 1

				arg_707_1.dialog_:SetActive(true)
				SetActive(arg_707_1.leftNameGo_, true)

				local var_710_17 = arg_707_1:FormatText(StoryNameCfg[6].name)

				arg_707_1.leftNameTxt_.text = var_710_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_707_1.leftNameTxt_.transform)

				arg_707_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_707_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_707_1:RecordName(arg_707_1.leftNameTxt_.text)
				SetActive(arg_707_1.iconTrs_.gameObject, false)
				arg_707_1.callingController_:SetSelectedState("normal")

				local var_710_18 = arg_707_1:GetWordFromCfg(910201175)
				local var_710_19 = arg_707_1:FormatText(var_710_18.content)

				arg_707_1.text_.text = var_710_19

				LuaForUtil.ClearLinePrefixSymbol(arg_707_1.text_)

				local var_710_20 = 14
				local var_710_21 = utf8.len(var_710_19)
				local var_710_22 = var_710_20 <= 0 and var_710_16 or var_710_16 * (var_710_21 / var_710_20)

				if var_710_22 > 0 and var_710_16 < var_710_22 then
					arg_707_1.talkMaxDuration = var_710_22

					if var_710_22 + var_710_15 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_22 + var_710_15
					end
				end

				arg_707_1.text_.text = var_710_19
				arg_707_1.typewritter.percent = 0

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(false)
				arg_707_1:RecordContent(arg_707_1.text_.text)
			end

			local var_710_23 = math.max(var_710_16, arg_707_1.talkMaxDuration)

			if var_710_15 <= arg_707_1.time_ and arg_707_1.time_ < var_710_15 + var_710_23 then
				arg_707_1.typewritter.percent = (arg_707_1.time_ - var_710_15) / var_710_23

				arg_707_1.typewritter:SetDirty()
			end

			if arg_707_1.time_ >= var_710_15 + var_710_23 and arg_707_1.time_ < var_710_15 + var_710_23 + arg_710_0 then
				arg_707_1.typewritter.percent = 1

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(true)
			end
		end
	end,
	Play910201176 = function(arg_711_0, arg_711_1)
		arg_711_1.time_ = 0
		arg_711_1.frameCnt_ = 0
		arg_711_1.state_ = "playing"
		arg_711_1.curTalkId_ = 910201176
		arg_711_1.duration_ = 5

		SetActive(arg_711_1.tipsGo_, false)

		function arg_711_1.onSingleLineFinish_()
			arg_711_1.onSingleLineUpdate_ = nil
			arg_711_1.onSingleLineFinish_ = nil
			arg_711_1.state_ = "waiting"
		end

		function arg_711_1.playNext_(arg_713_0)
			if arg_713_0 == 1 then
				arg_711_0:Play910201177(arg_711_1)
			end
		end

		function arg_711_1.onSingleLineUpdate_(arg_714_0)
			local var_714_0 = arg_711_1.actors_["1084ui_story"]
			local var_714_1 = 0

			if var_714_1 < arg_711_1.time_ and arg_711_1.time_ <= var_714_1 + arg_714_0 and arg_711_1.var_.characterEffect1084ui_story == nil then
				arg_711_1.var_.characterEffect1084ui_story = var_714_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_714_2 = 0.2

			if var_714_1 <= arg_711_1.time_ and arg_711_1.time_ < var_714_1 + var_714_2 then
				local var_714_3 = (arg_711_1.time_ - var_714_1) / var_714_2

				if arg_711_1.var_.characterEffect1084ui_story then
					local var_714_4 = Mathf.Lerp(0, 0.5, var_714_3)

					arg_711_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_711_1.var_.characterEffect1084ui_story.fillRatio = var_714_4
				end
			end

			if arg_711_1.time_ >= var_714_1 + var_714_2 and arg_711_1.time_ < var_714_1 + var_714_2 + arg_714_0 and arg_711_1.var_.characterEffect1084ui_story then
				local var_714_5 = 0.5

				arg_711_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_711_1.var_.characterEffect1084ui_story.fillRatio = var_714_5
			end

			local var_714_6 = 0
			local var_714_7 = 0.4

			if var_714_6 < arg_711_1.time_ and arg_711_1.time_ <= var_714_6 + arg_714_0 then
				arg_711_1.talkMaxDuration = 0
				arg_711_1.dialogCg_.alpha = 1

				arg_711_1.dialog_:SetActive(true)
				SetActive(arg_711_1.leftNameGo_, true)

				local var_714_8 = arg_711_1:FormatText(StoryNameCfg[7].name)

				arg_711_1.leftNameTxt_.text = var_714_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_711_1.leftNameTxt_.transform)

				arg_711_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_711_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_711_1:RecordName(arg_711_1.leftNameTxt_.text)
				SetActive(arg_711_1.iconTrs_.gameObject, false)
				arg_711_1.callingController_:SetSelectedState("normal")

				local var_714_9 = arg_711_1:GetWordFromCfg(910201176)
				local var_714_10 = arg_711_1:FormatText(var_714_9.content)

				arg_711_1.text_.text = var_714_10

				LuaForUtil.ClearLinePrefixSymbol(arg_711_1.text_)

				local var_714_11 = 16
				local var_714_12 = utf8.len(var_714_10)
				local var_714_13 = var_714_11 <= 0 and var_714_7 or var_714_7 * (var_714_12 / var_714_11)

				if var_714_13 > 0 and var_714_7 < var_714_13 then
					arg_711_1.talkMaxDuration = var_714_13

					if var_714_13 + var_714_6 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_13 + var_714_6
					end
				end

				arg_711_1.text_.text = var_714_10
				arg_711_1.typewritter.percent = 0

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(false)
				arg_711_1:RecordContent(arg_711_1.text_.text)
			end

			local var_714_14 = math.max(var_714_7, arg_711_1.talkMaxDuration)

			if var_714_6 <= arg_711_1.time_ and arg_711_1.time_ < var_714_6 + var_714_14 then
				arg_711_1.typewritter.percent = (arg_711_1.time_ - var_714_6) / var_714_14

				arg_711_1.typewritter:SetDirty()
			end

			if arg_711_1.time_ >= var_714_6 + var_714_14 and arg_711_1.time_ < var_714_6 + var_714_14 + arg_714_0 then
				arg_711_1.typewritter.percent = 1

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(true)
			end
		end
	end,
	Play910201177 = function(arg_715_0, arg_715_1)
		arg_715_1.time_ = 0
		arg_715_1.frameCnt_ = 0
		arg_715_1.state_ = "playing"
		arg_715_1.curTalkId_ = 910201177
		arg_715_1.duration_ = 5

		SetActive(arg_715_1.tipsGo_, false)

		function arg_715_1.onSingleLineFinish_()
			arg_715_1.onSingleLineUpdate_ = nil
			arg_715_1.onSingleLineFinish_ = nil
			arg_715_1.state_ = "waiting"
		end

		function arg_715_1.playNext_(arg_717_0)
			if arg_717_0 == 1 then
				arg_715_0:Play910201178(arg_715_1)
			end
		end

		function arg_715_1.onSingleLineUpdate_(arg_718_0)
			local var_718_0 = arg_715_1.actors_["1084ui_story"]
			local var_718_1 = 0

			if var_718_1 < arg_715_1.time_ and arg_715_1.time_ <= var_718_1 + arg_718_0 and arg_715_1.var_.characterEffect1084ui_story == nil then
				arg_715_1.var_.characterEffect1084ui_story = var_718_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_718_2 = 0.2

			if var_718_1 <= arg_715_1.time_ and arg_715_1.time_ < var_718_1 + var_718_2 then
				local var_718_3 = (arg_715_1.time_ - var_718_1) / var_718_2

				if arg_715_1.var_.characterEffect1084ui_story then
					arg_715_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_715_1.time_ >= var_718_1 + var_718_2 and arg_715_1.time_ < var_718_1 + var_718_2 + arg_718_0 and arg_715_1.var_.characterEffect1084ui_story then
				arg_715_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_718_4 = 0

			if var_718_4 < arg_715_1.time_ and arg_715_1.time_ <= var_718_4 + arg_718_0 then
				arg_715_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action432")
			end

			local var_718_5 = 0

			if var_718_5 < arg_715_1.time_ and arg_715_1.time_ <= var_718_5 + arg_718_0 then
				arg_715_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_718_6 = 0
			local var_718_7 = 0.475

			if var_718_6 < arg_715_1.time_ and arg_715_1.time_ <= var_718_6 + arg_718_0 then
				arg_715_1.talkMaxDuration = 0
				arg_715_1.dialogCg_.alpha = 1

				arg_715_1.dialog_:SetActive(true)
				SetActive(arg_715_1.leftNameGo_, true)

				local var_718_8 = arg_715_1:FormatText(StoryNameCfg[6].name)

				arg_715_1.leftNameTxt_.text = var_718_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_715_1.leftNameTxt_.transform)

				arg_715_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_715_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_715_1:RecordName(arg_715_1.leftNameTxt_.text)
				SetActive(arg_715_1.iconTrs_.gameObject, false)
				arg_715_1.callingController_:SetSelectedState("normal")

				local var_718_9 = arg_715_1:GetWordFromCfg(910201177)
				local var_718_10 = arg_715_1:FormatText(var_718_9.content)

				arg_715_1.text_.text = var_718_10

				LuaForUtil.ClearLinePrefixSymbol(arg_715_1.text_)

				local var_718_11 = 19
				local var_718_12 = utf8.len(var_718_10)
				local var_718_13 = var_718_11 <= 0 and var_718_7 or var_718_7 * (var_718_12 / var_718_11)

				if var_718_13 > 0 and var_718_7 < var_718_13 then
					arg_715_1.talkMaxDuration = var_718_13

					if var_718_13 + var_718_6 > arg_715_1.duration_ then
						arg_715_1.duration_ = var_718_13 + var_718_6
					end
				end

				arg_715_1.text_.text = var_718_10
				arg_715_1.typewritter.percent = 0

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(false)
				arg_715_1:RecordContent(arg_715_1.text_.text)
			end

			local var_718_14 = math.max(var_718_7, arg_715_1.talkMaxDuration)

			if var_718_6 <= arg_715_1.time_ and arg_715_1.time_ < var_718_6 + var_718_14 then
				arg_715_1.typewritter.percent = (arg_715_1.time_ - var_718_6) / var_718_14

				arg_715_1.typewritter:SetDirty()
			end

			if arg_715_1.time_ >= var_718_6 + var_718_14 and arg_715_1.time_ < var_718_6 + var_718_14 + arg_718_0 then
				arg_715_1.typewritter.percent = 1

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(true)
			end
		end
	end,
	Play910201178 = function(arg_719_0, arg_719_1)
		arg_719_1.time_ = 0
		arg_719_1.frameCnt_ = 0
		arg_719_1.state_ = "playing"
		arg_719_1.curTalkId_ = 910201178
		arg_719_1.duration_ = 5

		SetActive(arg_719_1.tipsGo_, false)

		function arg_719_1.onSingleLineFinish_()
			arg_719_1.onSingleLineUpdate_ = nil
			arg_719_1.onSingleLineFinish_ = nil
			arg_719_1.state_ = "waiting"
		end

		function arg_719_1.playNext_(arg_721_0)
			if arg_721_0 == 1 then
				arg_719_0:Play910201179(arg_719_1)
			end
		end

		function arg_719_1.onSingleLineUpdate_(arg_722_0)
			local var_722_0 = arg_719_1.actors_["1084ui_story"]
			local var_722_1 = 0

			if var_722_1 < arg_719_1.time_ and arg_719_1.time_ <= var_722_1 + arg_722_0 and arg_719_1.var_.characterEffect1084ui_story == nil then
				arg_719_1.var_.characterEffect1084ui_story = var_722_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_722_2 = 0.2

			if var_722_1 <= arg_719_1.time_ and arg_719_1.time_ < var_722_1 + var_722_2 then
				local var_722_3 = (arg_719_1.time_ - var_722_1) / var_722_2

				if arg_719_1.var_.characterEffect1084ui_story then
					local var_722_4 = Mathf.Lerp(0, 0.5, var_722_3)

					arg_719_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_719_1.var_.characterEffect1084ui_story.fillRatio = var_722_4
				end
			end

			if arg_719_1.time_ >= var_722_1 + var_722_2 and arg_719_1.time_ < var_722_1 + var_722_2 + arg_722_0 and arg_719_1.var_.characterEffect1084ui_story then
				local var_722_5 = 0.5

				arg_719_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_719_1.var_.characterEffect1084ui_story.fillRatio = var_722_5
			end

			local var_722_6 = 0
			local var_722_7 = 0.175

			if var_722_6 < arg_719_1.time_ and arg_719_1.time_ <= var_722_6 + arg_722_0 then
				arg_719_1.talkMaxDuration = 0
				arg_719_1.dialogCg_.alpha = 1

				arg_719_1.dialog_:SetActive(true)
				SetActive(arg_719_1.leftNameGo_, true)

				local var_722_8 = arg_719_1:FormatText(StoryNameCfg[7].name)

				arg_719_1.leftNameTxt_.text = var_722_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_719_1.leftNameTxt_.transform)

				arg_719_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_719_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_719_1:RecordName(arg_719_1.leftNameTxt_.text)
				SetActive(arg_719_1.iconTrs_.gameObject, false)
				arg_719_1.callingController_:SetSelectedState("normal")

				local var_722_9 = arg_719_1:GetWordFromCfg(910201178)
				local var_722_10 = arg_719_1:FormatText(var_722_9.content)

				arg_719_1.text_.text = var_722_10

				LuaForUtil.ClearLinePrefixSymbol(arg_719_1.text_)

				local var_722_11 = 7
				local var_722_12 = utf8.len(var_722_10)
				local var_722_13 = var_722_11 <= 0 and var_722_7 or var_722_7 * (var_722_12 / var_722_11)

				if var_722_13 > 0 and var_722_7 < var_722_13 then
					arg_719_1.talkMaxDuration = var_722_13

					if var_722_13 + var_722_6 > arg_719_1.duration_ then
						arg_719_1.duration_ = var_722_13 + var_722_6
					end
				end

				arg_719_1.text_.text = var_722_10
				arg_719_1.typewritter.percent = 0

				arg_719_1.typewritter:SetDirty()
				arg_719_1:ShowNextGo(false)
				arg_719_1:RecordContent(arg_719_1.text_.text)
			end

			local var_722_14 = math.max(var_722_7, arg_719_1.talkMaxDuration)

			if var_722_6 <= arg_719_1.time_ and arg_719_1.time_ < var_722_6 + var_722_14 then
				arg_719_1.typewritter.percent = (arg_719_1.time_ - var_722_6) / var_722_14

				arg_719_1.typewritter:SetDirty()
			end

			if arg_719_1.time_ >= var_722_6 + var_722_14 and arg_719_1.time_ < var_722_6 + var_722_14 + arg_722_0 then
				arg_719_1.typewritter.percent = 1

				arg_719_1.typewritter:SetDirty()
				arg_719_1:ShowNextGo(true)
			end
		end
	end,
	Play910201179 = function(arg_723_0, arg_723_1)
		arg_723_1.time_ = 0
		arg_723_1.frameCnt_ = 0
		arg_723_1.state_ = "playing"
		arg_723_1.curTalkId_ = 910201179
		arg_723_1.duration_ = 5

		SetActive(arg_723_1.tipsGo_, false)

		function arg_723_1.onSingleLineFinish_()
			arg_723_1.onSingleLineUpdate_ = nil
			arg_723_1.onSingleLineFinish_ = nil
			arg_723_1.state_ = "waiting"
		end

		function arg_723_1.playNext_(arg_725_0)
			if arg_725_0 == 1 then
				arg_723_0:Play910201180(arg_723_1)
			end
		end

		function arg_723_1.onSingleLineUpdate_(arg_726_0)
			local var_726_0 = arg_723_1.actors_["1084ui_story"]
			local var_726_1 = 0

			if var_726_1 < arg_723_1.time_ and arg_723_1.time_ <= var_726_1 + arg_726_0 and arg_723_1.var_.characterEffect1084ui_story == nil then
				arg_723_1.var_.characterEffect1084ui_story = var_726_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_726_2 = 0.2

			if var_726_1 <= arg_723_1.time_ and arg_723_1.time_ < var_726_1 + var_726_2 then
				local var_726_3 = (arg_723_1.time_ - var_726_1) / var_726_2

				if arg_723_1.var_.characterEffect1084ui_story then
					arg_723_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_723_1.time_ >= var_726_1 + var_726_2 and arg_723_1.time_ < var_726_1 + var_726_2 + arg_726_0 and arg_723_1.var_.characterEffect1084ui_story then
				arg_723_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_726_4 = 0

			if var_726_4 < arg_723_1.time_ and arg_723_1.time_ <= var_726_4 + arg_726_0 then
				arg_723_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action428")
			end

			local var_726_5 = 0

			if var_726_5 < arg_723_1.time_ and arg_723_1.time_ <= var_726_5 + arg_726_0 then
				arg_723_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_726_6 = 0
			local var_726_7 = 0.475

			if var_726_6 < arg_723_1.time_ and arg_723_1.time_ <= var_726_6 + arg_726_0 then
				arg_723_1.talkMaxDuration = 0
				arg_723_1.dialogCg_.alpha = 1

				arg_723_1.dialog_:SetActive(true)
				SetActive(arg_723_1.leftNameGo_, true)

				local var_726_8 = arg_723_1:FormatText(StoryNameCfg[6].name)

				arg_723_1.leftNameTxt_.text = var_726_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_723_1.leftNameTxt_.transform)

				arg_723_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_723_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_723_1:RecordName(arg_723_1.leftNameTxt_.text)
				SetActive(arg_723_1.iconTrs_.gameObject, false)
				arg_723_1.callingController_:SetSelectedState("normal")

				local var_726_9 = arg_723_1:GetWordFromCfg(910201179)
				local var_726_10 = arg_723_1:FormatText(var_726_9.content)

				arg_723_1.text_.text = var_726_10

				LuaForUtil.ClearLinePrefixSymbol(arg_723_1.text_)

				local var_726_11 = 19
				local var_726_12 = utf8.len(var_726_10)
				local var_726_13 = var_726_11 <= 0 and var_726_7 or var_726_7 * (var_726_12 / var_726_11)

				if var_726_13 > 0 and var_726_7 < var_726_13 then
					arg_723_1.talkMaxDuration = var_726_13

					if var_726_13 + var_726_6 > arg_723_1.duration_ then
						arg_723_1.duration_ = var_726_13 + var_726_6
					end
				end

				arg_723_1.text_.text = var_726_10
				arg_723_1.typewritter.percent = 0

				arg_723_1.typewritter:SetDirty()
				arg_723_1:ShowNextGo(false)
				arg_723_1:RecordContent(arg_723_1.text_.text)
			end

			local var_726_14 = math.max(var_726_7, arg_723_1.talkMaxDuration)

			if var_726_6 <= arg_723_1.time_ and arg_723_1.time_ < var_726_6 + var_726_14 then
				arg_723_1.typewritter.percent = (arg_723_1.time_ - var_726_6) / var_726_14

				arg_723_1.typewritter:SetDirty()
			end

			if arg_723_1.time_ >= var_726_6 + var_726_14 and arg_723_1.time_ < var_726_6 + var_726_14 + arg_726_0 then
				arg_723_1.typewritter.percent = 1

				arg_723_1.typewritter:SetDirty()
				arg_723_1:ShowNextGo(true)
			end
		end
	end,
	Play910201180 = function(arg_727_0, arg_727_1)
		arg_727_1.time_ = 0
		arg_727_1.frameCnt_ = 0
		arg_727_1.state_ = "playing"
		arg_727_1.curTalkId_ = 910201180
		arg_727_1.duration_ = 5

		SetActive(arg_727_1.tipsGo_, false)

		function arg_727_1.onSingleLineFinish_()
			arg_727_1.onSingleLineUpdate_ = nil
			arg_727_1.onSingleLineFinish_ = nil
			arg_727_1.state_ = "waiting"
		end

		function arg_727_1.playNext_(arg_729_0)
			if arg_729_0 == 1 then
				arg_727_0:Play910201181(arg_727_1)
			end
		end

		function arg_727_1.onSingleLineUpdate_(arg_730_0)
			local var_730_0 = arg_727_1.actors_["1084ui_story"]
			local var_730_1 = 0

			if var_730_1 < arg_727_1.time_ and arg_727_1.time_ <= var_730_1 + arg_730_0 and arg_727_1.var_.characterEffect1084ui_story == nil then
				arg_727_1.var_.characterEffect1084ui_story = var_730_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_730_2 = 0.2

			if var_730_1 <= arg_727_1.time_ and arg_727_1.time_ < var_730_1 + var_730_2 then
				local var_730_3 = (arg_727_1.time_ - var_730_1) / var_730_2

				if arg_727_1.var_.characterEffect1084ui_story then
					local var_730_4 = Mathf.Lerp(0, 0.5, var_730_3)

					arg_727_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_727_1.var_.characterEffect1084ui_story.fillRatio = var_730_4
				end
			end

			if arg_727_1.time_ >= var_730_1 + var_730_2 and arg_727_1.time_ < var_730_1 + var_730_2 + arg_730_0 and arg_727_1.var_.characterEffect1084ui_story then
				local var_730_5 = 0.5

				arg_727_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_727_1.var_.characterEffect1084ui_story.fillRatio = var_730_5
			end

			local var_730_6 = 0
			local var_730_7 = 0.3

			if var_730_6 < arg_727_1.time_ and arg_727_1.time_ <= var_730_6 + arg_730_0 then
				arg_727_1.talkMaxDuration = 0
				arg_727_1.dialogCg_.alpha = 1

				arg_727_1.dialog_:SetActive(true)
				SetActive(arg_727_1.leftNameGo_, true)

				local var_730_8 = arg_727_1:FormatText(StoryNameCfg[7].name)

				arg_727_1.leftNameTxt_.text = var_730_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_727_1.leftNameTxt_.transform)

				arg_727_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_727_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_727_1:RecordName(arg_727_1.leftNameTxt_.text)
				SetActive(arg_727_1.iconTrs_.gameObject, false)
				arg_727_1.callingController_:SetSelectedState("normal")

				local var_730_9 = arg_727_1:GetWordFromCfg(910201180)
				local var_730_10 = arg_727_1:FormatText(var_730_9.content)

				arg_727_1.text_.text = var_730_10

				LuaForUtil.ClearLinePrefixSymbol(arg_727_1.text_)

				local var_730_11 = 12
				local var_730_12 = utf8.len(var_730_10)
				local var_730_13 = var_730_11 <= 0 and var_730_7 or var_730_7 * (var_730_12 / var_730_11)

				if var_730_13 > 0 and var_730_7 < var_730_13 then
					arg_727_1.talkMaxDuration = var_730_13

					if var_730_13 + var_730_6 > arg_727_1.duration_ then
						arg_727_1.duration_ = var_730_13 + var_730_6
					end
				end

				arg_727_1.text_.text = var_730_10
				arg_727_1.typewritter.percent = 0

				arg_727_1.typewritter:SetDirty()
				arg_727_1:ShowNextGo(false)
				arg_727_1:RecordContent(arg_727_1.text_.text)
			end

			local var_730_14 = math.max(var_730_7, arg_727_1.talkMaxDuration)

			if var_730_6 <= arg_727_1.time_ and arg_727_1.time_ < var_730_6 + var_730_14 then
				arg_727_1.typewritter.percent = (arg_727_1.time_ - var_730_6) / var_730_14

				arg_727_1.typewritter:SetDirty()
			end

			if arg_727_1.time_ >= var_730_6 + var_730_14 and arg_727_1.time_ < var_730_6 + var_730_14 + arg_730_0 then
				arg_727_1.typewritter.percent = 1

				arg_727_1.typewritter:SetDirty()
				arg_727_1:ShowNextGo(true)
			end
		end
	end,
	Play910201181 = function(arg_731_0, arg_731_1)
		arg_731_1.time_ = 0
		arg_731_1.frameCnt_ = 0
		arg_731_1.state_ = "playing"
		arg_731_1.curTalkId_ = 910201181
		arg_731_1.duration_ = 5

		SetActive(arg_731_1.tipsGo_, false)

		function arg_731_1.onSingleLineFinish_()
			arg_731_1.onSingleLineUpdate_ = nil
			arg_731_1.onSingleLineFinish_ = nil
			arg_731_1.state_ = "waiting"
		end

		function arg_731_1.playNext_(arg_733_0)
			if arg_733_0 == 1 then
				arg_731_0:Play910201182(arg_731_1)
			end
		end

		function arg_731_1.onSingleLineUpdate_(arg_734_0)
			local var_734_0 = arg_731_1.actors_["1084ui_story"]
			local var_734_1 = 0

			if var_734_1 < arg_731_1.time_ and arg_731_1.time_ <= var_734_1 + arg_734_0 and arg_731_1.var_.characterEffect1084ui_story == nil then
				arg_731_1.var_.characterEffect1084ui_story = var_734_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_734_2 = 0.2

			if var_734_1 <= arg_731_1.time_ and arg_731_1.time_ < var_734_1 + var_734_2 then
				local var_734_3 = (arg_731_1.time_ - var_734_1) / var_734_2

				if arg_731_1.var_.characterEffect1084ui_story then
					arg_731_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_731_1.time_ >= var_734_1 + var_734_2 and arg_731_1.time_ < var_734_1 + var_734_2 + arg_734_0 and arg_731_1.var_.characterEffect1084ui_story then
				arg_731_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_734_4 = 0

			if var_734_4 < arg_731_1.time_ and arg_731_1.time_ <= var_734_4 + arg_734_0 then
				arg_731_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action486")
			end

			local var_734_5 = 0

			if var_734_5 < arg_731_1.time_ and arg_731_1.time_ <= var_734_5 + arg_734_0 then
				arg_731_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_734_6 = 0
			local var_734_7 = 0.825

			if var_734_6 < arg_731_1.time_ and arg_731_1.time_ <= var_734_6 + arg_734_0 then
				arg_731_1.talkMaxDuration = 0
				arg_731_1.dialogCg_.alpha = 1

				arg_731_1.dialog_:SetActive(true)
				SetActive(arg_731_1.leftNameGo_, true)

				local var_734_8 = arg_731_1:FormatText(StoryNameCfg[6].name)

				arg_731_1.leftNameTxt_.text = var_734_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_731_1.leftNameTxt_.transform)

				arg_731_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_731_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_731_1:RecordName(arg_731_1.leftNameTxt_.text)
				SetActive(arg_731_1.iconTrs_.gameObject, false)
				arg_731_1.callingController_:SetSelectedState("normal")

				local var_734_9 = arg_731_1:GetWordFromCfg(910201181)
				local var_734_10 = arg_731_1:FormatText(var_734_9.content)

				arg_731_1.text_.text = var_734_10

				LuaForUtil.ClearLinePrefixSymbol(arg_731_1.text_)

				local var_734_11 = 33
				local var_734_12 = utf8.len(var_734_10)
				local var_734_13 = var_734_11 <= 0 and var_734_7 or var_734_7 * (var_734_12 / var_734_11)

				if var_734_13 > 0 and var_734_7 < var_734_13 then
					arg_731_1.talkMaxDuration = var_734_13

					if var_734_13 + var_734_6 > arg_731_1.duration_ then
						arg_731_1.duration_ = var_734_13 + var_734_6
					end
				end

				arg_731_1.text_.text = var_734_10
				arg_731_1.typewritter.percent = 0

				arg_731_1.typewritter:SetDirty()
				arg_731_1:ShowNextGo(false)
				arg_731_1:RecordContent(arg_731_1.text_.text)
			end

			local var_734_14 = math.max(var_734_7, arg_731_1.talkMaxDuration)

			if var_734_6 <= arg_731_1.time_ and arg_731_1.time_ < var_734_6 + var_734_14 then
				arg_731_1.typewritter.percent = (arg_731_1.time_ - var_734_6) / var_734_14

				arg_731_1.typewritter:SetDirty()
			end

			if arg_731_1.time_ >= var_734_6 + var_734_14 and arg_731_1.time_ < var_734_6 + var_734_14 + arg_734_0 then
				arg_731_1.typewritter.percent = 1

				arg_731_1.typewritter:SetDirty()
				arg_731_1:ShowNextGo(true)
			end
		end
	end,
	Play910201182 = function(arg_735_0, arg_735_1)
		arg_735_1.time_ = 0
		arg_735_1.frameCnt_ = 0
		arg_735_1.state_ = "playing"
		arg_735_1.curTalkId_ = 910201182
		arg_735_1.duration_ = 5

		SetActive(arg_735_1.tipsGo_, false)

		function arg_735_1.onSingleLineFinish_()
			arg_735_1.onSingleLineUpdate_ = nil
			arg_735_1.onSingleLineFinish_ = nil
			arg_735_1.state_ = "waiting"
		end

		function arg_735_1.playNext_(arg_737_0)
			if arg_737_0 == 1 then
				arg_735_0:Play910201183(arg_735_1)
			end
		end

		function arg_735_1.onSingleLineUpdate_(arg_738_0)
			local var_738_0 = 0

			if var_738_0 < arg_735_1.time_ and arg_735_1.time_ <= var_738_0 + arg_738_0 then
				arg_735_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action467")
			end

			local var_738_1 = 0

			if var_738_1 < arg_735_1.time_ and arg_735_1.time_ <= var_738_1 + arg_738_0 then
				arg_735_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_738_2 = 0
			local var_738_3 = 0.775

			if var_738_2 < arg_735_1.time_ and arg_735_1.time_ <= var_738_2 + arg_738_0 then
				arg_735_1.talkMaxDuration = 0
				arg_735_1.dialogCg_.alpha = 1

				arg_735_1.dialog_:SetActive(true)
				SetActive(arg_735_1.leftNameGo_, true)

				local var_738_4 = arg_735_1:FormatText(StoryNameCfg[6].name)

				arg_735_1.leftNameTxt_.text = var_738_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_735_1.leftNameTxt_.transform)

				arg_735_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_735_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_735_1:RecordName(arg_735_1.leftNameTxt_.text)
				SetActive(arg_735_1.iconTrs_.gameObject, false)
				arg_735_1.callingController_:SetSelectedState("normal")

				local var_738_5 = arg_735_1:GetWordFromCfg(910201182)
				local var_738_6 = arg_735_1:FormatText(var_738_5.content)

				arg_735_1.text_.text = var_738_6

				LuaForUtil.ClearLinePrefixSymbol(arg_735_1.text_)

				local var_738_7 = 31
				local var_738_8 = utf8.len(var_738_6)
				local var_738_9 = var_738_7 <= 0 and var_738_3 or var_738_3 * (var_738_8 / var_738_7)

				if var_738_9 > 0 and var_738_3 < var_738_9 then
					arg_735_1.talkMaxDuration = var_738_9

					if var_738_9 + var_738_2 > arg_735_1.duration_ then
						arg_735_1.duration_ = var_738_9 + var_738_2
					end
				end

				arg_735_1.text_.text = var_738_6
				arg_735_1.typewritter.percent = 0

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(false)
				arg_735_1:RecordContent(arg_735_1.text_.text)
			end

			local var_738_10 = math.max(var_738_3, arg_735_1.talkMaxDuration)

			if var_738_2 <= arg_735_1.time_ and arg_735_1.time_ < var_738_2 + var_738_10 then
				arg_735_1.typewritter.percent = (arg_735_1.time_ - var_738_2) / var_738_10

				arg_735_1.typewritter:SetDirty()
			end

			if arg_735_1.time_ >= var_738_2 + var_738_10 and arg_735_1.time_ < var_738_2 + var_738_10 + arg_738_0 then
				arg_735_1.typewritter.percent = 1

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(true)
			end
		end
	end,
	Play910201183 = function(arg_739_0, arg_739_1)
		arg_739_1.time_ = 0
		arg_739_1.frameCnt_ = 0
		arg_739_1.state_ = "playing"
		arg_739_1.curTalkId_ = 910201183
		arg_739_1.duration_ = 5

		SetActive(arg_739_1.tipsGo_, false)

		function arg_739_1.onSingleLineFinish_()
			arg_739_1.onSingleLineUpdate_ = nil
			arg_739_1.onSingleLineFinish_ = nil
			arg_739_1.state_ = "waiting"
		end

		function arg_739_1.playNext_(arg_741_0)
			if arg_741_0 == 1 then
				arg_739_0:Play910201184(arg_739_1)
			end
		end

		function arg_739_1.onSingleLineUpdate_(arg_742_0)
			local var_742_0 = 0

			if var_742_0 < arg_739_1.time_ and arg_739_1.time_ <= var_742_0 + arg_742_0 then
				arg_739_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_742_1 = 0
			local var_742_2 = 0.825

			if var_742_1 < arg_739_1.time_ and arg_739_1.time_ <= var_742_1 + arg_742_0 then
				arg_739_1.talkMaxDuration = 0
				arg_739_1.dialogCg_.alpha = 1

				arg_739_1.dialog_:SetActive(true)
				SetActive(arg_739_1.leftNameGo_, true)

				local var_742_3 = arg_739_1:FormatText(StoryNameCfg[6].name)

				arg_739_1.leftNameTxt_.text = var_742_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_739_1.leftNameTxt_.transform)

				arg_739_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_739_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_739_1:RecordName(arg_739_1.leftNameTxt_.text)
				SetActive(arg_739_1.iconTrs_.gameObject, false)
				arg_739_1.callingController_:SetSelectedState("normal")

				local var_742_4 = arg_739_1:GetWordFromCfg(910201183)
				local var_742_5 = arg_739_1:FormatText(var_742_4.content)

				arg_739_1.text_.text = var_742_5

				LuaForUtil.ClearLinePrefixSymbol(arg_739_1.text_)

				local var_742_6 = 33
				local var_742_7 = utf8.len(var_742_5)
				local var_742_8 = var_742_6 <= 0 and var_742_2 or var_742_2 * (var_742_7 / var_742_6)

				if var_742_8 > 0 and var_742_2 < var_742_8 then
					arg_739_1.talkMaxDuration = var_742_8

					if var_742_8 + var_742_1 > arg_739_1.duration_ then
						arg_739_1.duration_ = var_742_8 + var_742_1
					end
				end

				arg_739_1.text_.text = var_742_5
				arg_739_1.typewritter.percent = 0

				arg_739_1.typewritter:SetDirty()
				arg_739_1:ShowNextGo(false)
				arg_739_1:RecordContent(arg_739_1.text_.text)
			end

			local var_742_9 = math.max(var_742_2, arg_739_1.talkMaxDuration)

			if var_742_1 <= arg_739_1.time_ and arg_739_1.time_ < var_742_1 + var_742_9 then
				arg_739_1.typewritter.percent = (arg_739_1.time_ - var_742_1) / var_742_9

				arg_739_1.typewritter:SetDirty()
			end

			if arg_739_1.time_ >= var_742_1 + var_742_9 and arg_739_1.time_ < var_742_1 + var_742_9 + arg_742_0 then
				arg_739_1.typewritter.percent = 1

				arg_739_1.typewritter:SetDirty()
				arg_739_1:ShowNextGo(true)
			end
		end
	end,
	Play910201184 = function(arg_743_0, arg_743_1)
		arg_743_1.time_ = 0
		arg_743_1.frameCnt_ = 0
		arg_743_1.state_ = "playing"
		arg_743_1.curTalkId_ = 910201184
		arg_743_1.duration_ = 5

		SetActive(arg_743_1.tipsGo_, false)

		function arg_743_1.onSingleLineFinish_()
			arg_743_1.onSingleLineUpdate_ = nil
			arg_743_1.onSingleLineFinish_ = nil
			arg_743_1.state_ = "waiting"
		end

		function arg_743_1.playNext_(arg_745_0)
			if arg_745_0 == 1 then
				arg_743_0:Play910201185(arg_743_1)
			end
		end

		function arg_743_1.onSingleLineUpdate_(arg_746_0)
			local var_746_0 = 0

			if var_746_0 < arg_743_1.time_ and arg_743_1.time_ <= var_746_0 + arg_746_0 then
				arg_743_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action473")
			end

			local var_746_1 = 0

			if var_746_1 < arg_743_1.time_ and arg_743_1.time_ <= var_746_1 + arg_746_0 then
				arg_743_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_746_2 = 0
			local var_746_3 = 1.05

			if var_746_2 < arg_743_1.time_ and arg_743_1.time_ <= var_746_2 + arg_746_0 then
				arg_743_1.talkMaxDuration = 0
				arg_743_1.dialogCg_.alpha = 1

				arg_743_1.dialog_:SetActive(true)
				SetActive(arg_743_1.leftNameGo_, true)

				local var_746_4 = arg_743_1:FormatText(StoryNameCfg[6].name)

				arg_743_1.leftNameTxt_.text = var_746_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_743_1.leftNameTxt_.transform)

				arg_743_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_743_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_743_1:RecordName(arg_743_1.leftNameTxt_.text)
				SetActive(arg_743_1.iconTrs_.gameObject, false)
				arg_743_1.callingController_:SetSelectedState("normal")

				local var_746_5 = arg_743_1:GetWordFromCfg(910201184)
				local var_746_6 = arg_743_1:FormatText(var_746_5.content)

				arg_743_1.text_.text = var_746_6

				LuaForUtil.ClearLinePrefixSymbol(arg_743_1.text_)

				local var_746_7 = 42
				local var_746_8 = utf8.len(var_746_6)
				local var_746_9 = var_746_7 <= 0 and var_746_3 or var_746_3 * (var_746_8 / var_746_7)

				if var_746_9 > 0 and var_746_3 < var_746_9 then
					arg_743_1.talkMaxDuration = var_746_9

					if var_746_9 + var_746_2 > arg_743_1.duration_ then
						arg_743_1.duration_ = var_746_9 + var_746_2
					end
				end

				arg_743_1.text_.text = var_746_6
				arg_743_1.typewritter.percent = 0

				arg_743_1.typewritter:SetDirty()
				arg_743_1:ShowNextGo(false)
				arg_743_1:RecordContent(arg_743_1.text_.text)
			end

			local var_746_10 = math.max(var_746_3, arg_743_1.talkMaxDuration)

			if var_746_2 <= arg_743_1.time_ and arg_743_1.time_ < var_746_2 + var_746_10 then
				arg_743_1.typewritter.percent = (arg_743_1.time_ - var_746_2) / var_746_10

				arg_743_1.typewritter:SetDirty()
			end

			if arg_743_1.time_ >= var_746_2 + var_746_10 and arg_743_1.time_ < var_746_2 + var_746_10 + arg_746_0 then
				arg_743_1.typewritter.percent = 1

				arg_743_1.typewritter:SetDirty()
				arg_743_1:ShowNextGo(true)
			end
		end
	end,
	Play910201185 = function(arg_747_0, arg_747_1)
		arg_747_1.time_ = 0
		arg_747_1.frameCnt_ = 0
		arg_747_1.state_ = "playing"
		arg_747_1.curTalkId_ = 910201185
		arg_747_1.duration_ = 5

		SetActive(arg_747_1.tipsGo_, false)

		function arg_747_1.onSingleLineFinish_()
			arg_747_1.onSingleLineUpdate_ = nil
			arg_747_1.onSingleLineFinish_ = nil
			arg_747_1.state_ = "waiting"
		end

		function arg_747_1.playNext_(arg_749_0)
			if arg_749_0 == 1 then
				arg_747_0:Play910201186(arg_747_1)
			end
		end

		function arg_747_1.onSingleLineUpdate_(arg_750_0)
			local var_750_0 = arg_747_1.actors_["1084ui_story"]
			local var_750_1 = 0

			if var_750_1 < arg_747_1.time_ and arg_747_1.time_ <= var_750_1 + arg_750_0 and arg_747_1.var_.characterEffect1084ui_story == nil then
				arg_747_1.var_.characterEffect1084ui_story = var_750_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_750_2 = 0.2

			if var_750_1 <= arg_747_1.time_ and arg_747_1.time_ < var_750_1 + var_750_2 then
				local var_750_3 = (arg_747_1.time_ - var_750_1) / var_750_2

				if arg_747_1.var_.characterEffect1084ui_story then
					local var_750_4 = Mathf.Lerp(0, 0.5, var_750_3)

					arg_747_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_747_1.var_.characterEffect1084ui_story.fillRatio = var_750_4
				end
			end

			if arg_747_1.time_ >= var_750_1 + var_750_2 and arg_747_1.time_ < var_750_1 + var_750_2 + arg_750_0 and arg_747_1.var_.characterEffect1084ui_story then
				local var_750_5 = 0.5

				arg_747_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_747_1.var_.characterEffect1084ui_story.fillRatio = var_750_5
			end

			local var_750_6 = 0
			local var_750_7 = 0.425

			if var_750_6 < arg_747_1.time_ and arg_747_1.time_ <= var_750_6 + arg_750_0 then
				arg_747_1.talkMaxDuration = 0
				arg_747_1.dialogCg_.alpha = 1

				arg_747_1.dialog_:SetActive(true)
				SetActive(arg_747_1.leftNameGo_, true)

				local var_750_8 = arg_747_1:FormatText(StoryNameCfg[7].name)

				arg_747_1.leftNameTxt_.text = var_750_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_747_1.leftNameTxt_.transform)

				arg_747_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_747_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_747_1:RecordName(arg_747_1.leftNameTxt_.text)
				SetActive(arg_747_1.iconTrs_.gameObject, false)
				arg_747_1.callingController_:SetSelectedState("normal")

				local var_750_9 = arg_747_1:GetWordFromCfg(910201185)
				local var_750_10 = arg_747_1:FormatText(var_750_9.content)

				arg_747_1.text_.text = var_750_10

				LuaForUtil.ClearLinePrefixSymbol(arg_747_1.text_)

				local var_750_11 = 17
				local var_750_12 = utf8.len(var_750_10)
				local var_750_13 = var_750_11 <= 0 and var_750_7 or var_750_7 * (var_750_12 / var_750_11)

				if var_750_13 > 0 and var_750_7 < var_750_13 then
					arg_747_1.talkMaxDuration = var_750_13

					if var_750_13 + var_750_6 > arg_747_1.duration_ then
						arg_747_1.duration_ = var_750_13 + var_750_6
					end
				end

				arg_747_1.text_.text = var_750_10
				arg_747_1.typewritter.percent = 0

				arg_747_1.typewritter:SetDirty()
				arg_747_1:ShowNextGo(false)
				arg_747_1:RecordContent(arg_747_1.text_.text)
			end

			local var_750_14 = math.max(var_750_7, arg_747_1.talkMaxDuration)

			if var_750_6 <= arg_747_1.time_ and arg_747_1.time_ < var_750_6 + var_750_14 then
				arg_747_1.typewritter.percent = (arg_747_1.time_ - var_750_6) / var_750_14

				arg_747_1.typewritter:SetDirty()
			end

			if arg_747_1.time_ >= var_750_6 + var_750_14 and arg_747_1.time_ < var_750_6 + var_750_14 + arg_750_0 then
				arg_747_1.typewritter.percent = 1

				arg_747_1.typewritter:SetDirty()
				arg_747_1:ShowNextGo(true)
			end
		end
	end,
	Play910201186 = function(arg_751_0, arg_751_1)
		arg_751_1.time_ = 0
		arg_751_1.frameCnt_ = 0
		arg_751_1.state_ = "playing"
		arg_751_1.curTalkId_ = 910201186
		arg_751_1.duration_ = 5

		SetActive(arg_751_1.tipsGo_, false)

		function arg_751_1.onSingleLineFinish_()
			arg_751_1.onSingleLineUpdate_ = nil
			arg_751_1.onSingleLineFinish_ = nil
			arg_751_1.state_ = "waiting"
		end

		function arg_751_1.playNext_(arg_753_0)
			if arg_753_0 == 1 then
				arg_751_0:Play910201187(arg_751_1)
			end
		end

		function arg_751_1.onSingleLineUpdate_(arg_754_0)
			local var_754_0 = arg_751_1.actors_["1013ui_story"].transform
			local var_754_1 = 0

			if var_754_1 < arg_751_1.time_ and arg_751_1.time_ <= var_754_1 + arg_754_0 then
				arg_751_1.var_.moveOldPos1013ui_story = var_754_0.localPosition
			end

			local var_754_2 = 0.001

			if var_754_1 <= arg_751_1.time_ and arg_751_1.time_ < var_754_1 + var_754_2 then
				local var_754_3 = (arg_751_1.time_ - var_754_1) / var_754_2
				local var_754_4 = Vector3.New(0, -0.66, -6.15)

				var_754_0.localPosition = Vector3.Lerp(arg_751_1.var_.moveOldPos1013ui_story, var_754_4, var_754_3)

				local var_754_5 = manager.ui.mainCamera.transform.position - var_754_0.position

				var_754_0.forward = Vector3.New(var_754_5.x, var_754_5.y, var_754_5.z)

				local var_754_6 = var_754_0.localEulerAngles

				var_754_6.z = 0
				var_754_6.x = 0
				var_754_0.localEulerAngles = var_754_6
			end

			if arg_751_1.time_ >= var_754_1 + var_754_2 and arg_751_1.time_ < var_754_1 + var_754_2 + arg_754_0 then
				var_754_0.localPosition = Vector3.New(0, -0.66, -6.15)

				local var_754_7 = manager.ui.mainCamera.transform.position - var_754_0.position

				var_754_0.forward = Vector3.New(var_754_7.x, var_754_7.y, var_754_7.z)

				local var_754_8 = var_754_0.localEulerAngles

				var_754_8.z = 0
				var_754_8.x = 0
				var_754_0.localEulerAngles = var_754_8
			end

			local var_754_9 = 0

			if var_754_9 < arg_751_1.time_ and arg_751_1.time_ <= var_754_9 + arg_754_0 then
				arg_751_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action10_1")
			end

			local var_754_10 = arg_751_1.actors_["1084ui_story"].transform
			local var_754_11 = 0

			if var_754_11 < arg_751_1.time_ and arg_751_1.time_ <= var_754_11 + arg_754_0 then
				arg_751_1.var_.moveOldPos1084ui_story = var_754_10.localPosition
			end

			local var_754_12 = 0.001

			if var_754_11 <= arg_751_1.time_ and arg_751_1.time_ < var_754_11 + var_754_12 then
				local var_754_13 = (arg_751_1.time_ - var_754_11) / var_754_12
				local var_754_14 = Vector3.New(0, 100, 0)

				var_754_10.localPosition = Vector3.Lerp(arg_751_1.var_.moveOldPos1084ui_story, var_754_14, var_754_13)

				local var_754_15 = manager.ui.mainCamera.transform.position - var_754_10.position

				var_754_10.forward = Vector3.New(var_754_15.x, var_754_15.y, var_754_15.z)

				local var_754_16 = var_754_10.localEulerAngles

				var_754_16.z = 0
				var_754_16.x = 0
				var_754_10.localEulerAngles = var_754_16
			end

			if arg_751_1.time_ >= var_754_11 + var_754_12 and arg_751_1.time_ < var_754_11 + var_754_12 + arg_754_0 then
				var_754_10.localPosition = Vector3.New(0, 100, 0)

				local var_754_17 = manager.ui.mainCamera.transform.position - var_754_10.position

				var_754_10.forward = Vector3.New(var_754_17.x, var_754_17.y, var_754_17.z)

				local var_754_18 = var_754_10.localEulerAngles

				var_754_18.z = 0
				var_754_18.x = 0
				var_754_10.localEulerAngles = var_754_18
			end

			local var_754_19 = arg_751_1.actors_["1013ui_story"]
			local var_754_20 = 0

			if var_754_20 < arg_751_1.time_ and arg_751_1.time_ <= var_754_20 + arg_754_0 and arg_751_1.var_.characterEffect1013ui_story == nil then
				arg_751_1.var_.characterEffect1013ui_story = var_754_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_754_21 = 0.2

			if var_754_20 <= arg_751_1.time_ and arg_751_1.time_ < var_754_20 + var_754_21 then
				local var_754_22 = (arg_751_1.time_ - var_754_20) / var_754_21

				if arg_751_1.var_.characterEffect1013ui_story then
					arg_751_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_751_1.time_ >= var_754_20 + var_754_21 and arg_751_1.time_ < var_754_20 + var_754_21 + arg_754_0 and arg_751_1.var_.characterEffect1013ui_story then
				arg_751_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_754_23 = 0

			if var_754_23 < arg_751_1.time_ and arg_751_1.time_ <= var_754_23 + arg_754_0 then
				arg_751_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_754_24 = 0
			local var_754_25 = 0.575

			if var_754_24 < arg_751_1.time_ and arg_751_1.time_ <= var_754_24 + arg_754_0 then
				arg_751_1.talkMaxDuration = 0
				arg_751_1.dialogCg_.alpha = 1

				arg_751_1.dialog_:SetActive(true)
				SetActive(arg_751_1.leftNameGo_, true)

				local var_754_26 = arg_751_1:FormatText(StoryNameCfg[35].name)

				arg_751_1.leftNameTxt_.text = var_754_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_751_1.leftNameTxt_.transform)

				arg_751_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_751_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_751_1:RecordName(arg_751_1.leftNameTxt_.text)
				SetActive(arg_751_1.iconTrs_.gameObject, false)
				arg_751_1.callingController_:SetSelectedState("normal")

				local var_754_27 = arg_751_1:GetWordFromCfg(910201186)
				local var_754_28 = arg_751_1:FormatText(var_754_27.content)

				arg_751_1.text_.text = var_754_28

				LuaForUtil.ClearLinePrefixSymbol(arg_751_1.text_)

				local var_754_29 = 23
				local var_754_30 = utf8.len(var_754_28)
				local var_754_31 = var_754_29 <= 0 and var_754_25 or var_754_25 * (var_754_30 / var_754_29)

				if var_754_31 > 0 and var_754_25 < var_754_31 then
					arg_751_1.talkMaxDuration = var_754_31

					if var_754_31 + var_754_24 > arg_751_1.duration_ then
						arg_751_1.duration_ = var_754_31 + var_754_24
					end
				end

				arg_751_1.text_.text = var_754_28
				arg_751_1.typewritter.percent = 0

				arg_751_1.typewritter:SetDirty()
				arg_751_1:ShowNextGo(false)
				arg_751_1:RecordContent(arg_751_1.text_.text)
			end

			local var_754_32 = math.max(var_754_25, arg_751_1.talkMaxDuration)

			if var_754_24 <= arg_751_1.time_ and arg_751_1.time_ < var_754_24 + var_754_32 then
				arg_751_1.typewritter.percent = (arg_751_1.time_ - var_754_24) / var_754_32

				arg_751_1.typewritter:SetDirty()
			end

			if arg_751_1.time_ >= var_754_24 + var_754_32 and arg_751_1.time_ < var_754_24 + var_754_32 + arg_754_0 then
				arg_751_1.typewritter.percent = 1

				arg_751_1.typewritter:SetDirty()
				arg_751_1:ShowNextGo(true)
			end
		end
	end,
	Play910201187 = function(arg_755_0, arg_755_1)
		arg_755_1.time_ = 0
		arg_755_1.frameCnt_ = 0
		arg_755_1.state_ = "playing"
		arg_755_1.curTalkId_ = 910201187
		arg_755_1.duration_ = 5

		SetActive(arg_755_1.tipsGo_, false)

		function arg_755_1.onSingleLineFinish_()
			arg_755_1.onSingleLineUpdate_ = nil
			arg_755_1.onSingleLineFinish_ = nil
			arg_755_1.state_ = "waiting"
		end

		function arg_755_1.playNext_(arg_757_0)
			if arg_757_0 == 1 then
				arg_755_0:Play910201188(arg_755_1)
			end
		end

		function arg_755_1.onSingleLineUpdate_(arg_758_0)
			local var_758_0 = 0

			if var_758_0 < arg_755_1.time_ and arg_755_1.time_ <= var_758_0 + arg_758_0 then
				arg_755_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action4102")
			end

			local var_758_1 = 0

			if var_758_1 < arg_755_1.time_ and arg_755_1.time_ <= var_758_1 + arg_758_0 then
				arg_755_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_758_2 = 0
			local var_758_3 = 0.475

			if var_758_2 < arg_755_1.time_ and arg_755_1.time_ <= var_758_2 + arg_758_0 then
				arg_755_1.talkMaxDuration = 0
				arg_755_1.dialogCg_.alpha = 1

				arg_755_1.dialog_:SetActive(true)
				SetActive(arg_755_1.leftNameGo_, true)

				local var_758_4 = arg_755_1:FormatText(StoryNameCfg[35].name)

				arg_755_1.leftNameTxt_.text = var_758_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_755_1.leftNameTxt_.transform)

				arg_755_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_755_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_755_1:RecordName(arg_755_1.leftNameTxt_.text)
				SetActive(arg_755_1.iconTrs_.gameObject, false)
				arg_755_1.callingController_:SetSelectedState("normal")

				local var_758_5 = arg_755_1:GetWordFromCfg(910201187)
				local var_758_6 = arg_755_1:FormatText(var_758_5.content)

				arg_755_1.text_.text = var_758_6

				LuaForUtil.ClearLinePrefixSymbol(arg_755_1.text_)

				local var_758_7 = 19
				local var_758_8 = utf8.len(var_758_6)
				local var_758_9 = var_758_7 <= 0 and var_758_3 or var_758_3 * (var_758_8 / var_758_7)

				if var_758_9 > 0 and var_758_3 < var_758_9 then
					arg_755_1.talkMaxDuration = var_758_9

					if var_758_9 + var_758_2 > arg_755_1.duration_ then
						arg_755_1.duration_ = var_758_9 + var_758_2
					end
				end

				arg_755_1.text_.text = var_758_6
				arg_755_1.typewritter.percent = 0

				arg_755_1.typewritter:SetDirty()
				arg_755_1:ShowNextGo(false)
				arg_755_1:RecordContent(arg_755_1.text_.text)
			end

			local var_758_10 = math.max(var_758_3, arg_755_1.talkMaxDuration)

			if var_758_2 <= arg_755_1.time_ and arg_755_1.time_ < var_758_2 + var_758_10 then
				arg_755_1.typewritter.percent = (arg_755_1.time_ - var_758_2) / var_758_10

				arg_755_1.typewritter:SetDirty()
			end

			if arg_755_1.time_ >= var_758_2 + var_758_10 and arg_755_1.time_ < var_758_2 + var_758_10 + arg_758_0 then
				arg_755_1.typewritter.percent = 1

				arg_755_1.typewritter:SetDirty()
				arg_755_1:ShowNextGo(true)
			end
		end
	end,
	Play910201188 = function(arg_759_0, arg_759_1)
		arg_759_1.time_ = 0
		arg_759_1.frameCnt_ = 0
		arg_759_1.state_ = "playing"
		arg_759_1.curTalkId_ = 910201188
		arg_759_1.duration_ = 5

		SetActive(arg_759_1.tipsGo_, false)

		function arg_759_1.onSingleLineFinish_()
			arg_759_1.onSingleLineUpdate_ = nil
			arg_759_1.onSingleLineFinish_ = nil
			arg_759_1.state_ = "waiting"
		end

		function arg_759_1.playNext_(arg_761_0)
			if arg_761_0 == 1 then
				arg_759_0:Play910201189(arg_759_1)
			end
		end

		function arg_759_1.onSingleLineUpdate_(arg_762_0)
			local var_762_0 = arg_759_1.actors_["1013ui_story"].transform
			local var_762_1 = 0

			if var_762_1 < arg_759_1.time_ and arg_759_1.time_ <= var_762_1 + arg_762_0 then
				arg_759_1.var_.moveOldPos1013ui_story = var_762_0.localPosition
			end

			local var_762_2 = 0.001

			if var_762_1 <= arg_759_1.time_ and arg_759_1.time_ < var_762_1 + var_762_2 then
				local var_762_3 = (arg_759_1.time_ - var_762_1) / var_762_2
				local var_762_4 = Vector3.New(0, 100, 0)

				var_762_0.localPosition = Vector3.Lerp(arg_759_1.var_.moveOldPos1013ui_story, var_762_4, var_762_3)

				local var_762_5 = manager.ui.mainCamera.transform.position - var_762_0.position

				var_762_0.forward = Vector3.New(var_762_5.x, var_762_5.y, var_762_5.z)

				local var_762_6 = var_762_0.localEulerAngles

				var_762_6.z = 0
				var_762_6.x = 0
				var_762_0.localEulerAngles = var_762_6
			end

			if arg_759_1.time_ >= var_762_1 + var_762_2 and arg_759_1.time_ < var_762_1 + var_762_2 + arg_762_0 then
				var_762_0.localPosition = Vector3.New(0, 100, 0)

				local var_762_7 = manager.ui.mainCamera.transform.position - var_762_0.position

				var_762_0.forward = Vector3.New(var_762_7.x, var_762_7.y, var_762_7.z)

				local var_762_8 = var_762_0.localEulerAngles

				var_762_8.z = 0
				var_762_8.x = 0
				var_762_0.localEulerAngles = var_762_8
			end

			local var_762_9 = 0
			local var_762_10 = 0.225

			if var_762_9 < arg_759_1.time_ and arg_759_1.time_ <= var_762_9 + arg_762_0 then
				arg_759_1.talkMaxDuration = 0
				arg_759_1.dialogCg_.alpha = 1

				arg_759_1.dialog_:SetActive(true)
				SetActive(arg_759_1.leftNameGo_, true)

				local var_762_11 = arg_759_1:FormatText(StoryNameCfg[7].name)

				arg_759_1.leftNameTxt_.text = var_762_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_759_1.leftNameTxt_.transform)

				arg_759_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_759_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_759_1:RecordName(arg_759_1.leftNameTxt_.text)
				SetActive(arg_759_1.iconTrs_.gameObject, false)
				arg_759_1.callingController_:SetSelectedState("normal")

				local var_762_12 = arg_759_1:GetWordFromCfg(910201188)
				local var_762_13 = arg_759_1:FormatText(var_762_12.content)

				arg_759_1.text_.text = var_762_13

				LuaForUtil.ClearLinePrefixSymbol(arg_759_1.text_)

				local var_762_14 = 9
				local var_762_15 = utf8.len(var_762_13)
				local var_762_16 = var_762_14 <= 0 and var_762_10 or var_762_10 * (var_762_15 / var_762_14)

				if var_762_16 > 0 and var_762_10 < var_762_16 then
					arg_759_1.talkMaxDuration = var_762_16

					if var_762_16 + var_762_9 > arg_759_1.duration_ then
						arg_759_1.duration_ = var_762_16 + var_762_9
					end
				end

				arg_759_1.text_.text = var_762_13
				arg_759_1.typewritter.percent = 0

				arg_759_1.typewritter:SetDirty()
				arg_759_1:ShowNextGo(false)
				arg_759_1:RecordContent(arg_759_1.text_.text)
			end

			local var_762_17 = math.max(var_762_10, arg_759_1.talkMaxDuration)

			if var_762_9 <= arg_759_1.time_ and arg_759_1.time_ < var_762_9 + var_762_17 then
				arg_759_1.typewritter.percent = (arg_759_1.time_ - var_762_9) / var_762_17

				arg_759_1.typewritter:SetDirty()
			end

			if arg_759_1.time_ >= var_762_9 + var_762_17 and arg_759_1.time_ < var_762_9 + var_762_17 + arg_762_0 then
				arg_759_1.typewritter.percent = 1

				arg_759_1.typewritter:SetDirty()
				arg_759_1:ShowNextGo(true)
			end
		end
	end,
	Play910201189 = function(arg_763_0, arg_763_1)
		arg_763_1.time_ = 0
		arg_763_1.frameCnt_ = 0
		arg_763_1.state_ = "playing"
		arg_763_1.curTalkId_ = 910201189
		arg_763_1.duration_ = 5

		SetActive(arg_763_1.tipsGo_, false)

		function arg_763_1.onSingleLineFinish_()
			arg_763_1.onSingleLineUpdate_ = nil
			arg_763_1.onSingleLineFinish_ = nil
			arg_763_1.state_ = "waiting"
		end

		function arg_763_1.playNext_(arg_765_0)
			if arg_765_0 == 1 then
				arg_763_0:Play910201190(arg_763_1)
			end
		end

		function arg_763_1.onSingleLineUpdate_(arg_766_0)
			local var_766_0 = arg_763_1.actors_["1080ui_story"].transform
			local var_766_1 = 0

			if var_766_1 < arg_763_1.time_ and arg_763_1.time_ <= var_766_1 + arg_766_0 then
				arg_763_1.var_.moveOldPos1080ui_story = var_766_0.localPosition
			end

			local var_766_2 = 0.001

			if var_766_1 <= arg_763_1.time_ and arg_763_1.time_ < var_766_1 + var_766_2 then
				local var_766_3 = (arg_763_1.time_ - var_766_1) / var_766_2
				local var_766_4 = Vector3.New(0, -1.01, -6.05)

				var_766_0.localPosition = Vector3.Lerp(arg_763_1.var_.moveOldPos1080ui_story, var_766_4, var_766_3)

				local var_766_5 = manager.ui.mainCamera.transform.position - var_766_0.position

				var_766_0.forward = Vector3.New(var_766_5.x, var_766_5.y, var_766_5.z)

				local var_766_6 = var_766_0.localEulerAngles

				var_766_6.z = 0
				var_766_6.x = 0
				var_766_0.localEulerAngles = var_766_6
			end

			if arg_763_1.time_ >= var_766_1 + var_766_2 and arg_763_1.time_ < var_766_1 + var_766_2 + arg_766_0 then
				var_766_0.localPosition = Vector3.New(0, -1.01, -6.05)

				local var_766_7 = manager.ui.mainCamera.transform.position - var_766_0.position

				var_766_0.forward = Vector3.New(var_766_7.x, var_766_7.y, var_766_7.z)

				local var_766_8 = var_766_0.localEulerAngles

				var_766_8.z = 0
				var_766_8.x = 0
				var_766_0.localEulerAngles = var_766_8
			end

			local var_766_9 = arg_763_1.actors_["1080ui_story"]
			local var_766_10 = 0

			if var_766_10 < arg_763_1.time_ and arg_763_1.time_ <= var_766_10 + arg_766_0 and arg_763_1.var_.characterEffect1080ui_story == nil then
				arg_763_1.var_.characterEffect1080ui_story = var_766_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_766_11 = 0.2

			if var_766_10 <= arg_763_1.time_ and arg_763_1.time_ < var_766_10 + var_766_11 then
				local var_766_12 = (arg_763_1.time_ - var_766_10) / var_766_11

				if arg_763_1.var_.characterEffect1080ui_story then
					arg_763_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_763_1.time_ >= var_766_10 + var_766_11 and arg_763_1.time_ < var_766_10 + var_766_11 + arg_766_0 and arg_763_1.var_.characterEffect1080ui_story then
				arg_763_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_766_13 = 0

			if var_766_13 < arg_763_1.time_ and arg_763_1.time_ <= var_766_13 + arg_766_0 then
				arg_763_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action3_1")
			end

			local var_766_14 = 0

			if var_766_14 < arg_763_1.time_ and arg_763_1.time_ <= var_766_14 + arg_766_0 then
				arg_763_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_766_15 = 0
			local var_766_16 = 0.25

			if var_766_15 < arg_763_1.time_ and arg_763_1.time_ <= var_766_15 + arg_766_0 then
				arg_763_1.talkMaxDuration = 0
				arg_763_1.dialogCg_.alpha = 1

				arg_763_1.dialog_:SetActive(true)
				SetActive(arg_763_1.leftNameGo_, true)

				local var_766_17 = arg_763_1:FormatText(StoryNameCfg[55].name)

				arg_763_1.leftNameTxt_.text = var_766_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_763_1.leftNameTxt_.transform)

				arg_763_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_763_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_763_1:RecordName(arg_763_1.leftNameTxt_.text)
				SetActive(arg_763_1.iconTrs_.gameObject, false)
				arg_763_1.callingController_:SetSelectedState("normal")

				local var_766_18 = arg_763_1:GetWordFromCfg(910201189)
				local var_766_19 = arg_763_1:FormatText(var_766_18.content)

				arg_763_1.text_.text = var_766_19

				LuaForUtil.ClearLinePrefixSymbol(arg_763_1.text_)

				local var_766_20 = 10
				local var_766_21 = utf8.len(var_766_19)
				local var_766_22 = var_766_20 <= 0 and var_766_16 or var_766_16 * (var_766_21 / var_766_20)

				if var_766_22 > 0 and var_766_16 < var_766_22 then
					arg_763_1.talkMaxDuration = var_766_22

					if var_766_22 + var_766_15 > arg_763_1.duration_ then
						arg_763_1.duration_ = var_766_22 + var_766_15
					end
				end

				arg_763_1.text_.text = var_766_19
				arg_763_1.typewritter.percent = 0

				arg_763_1.typewritter:SetDirty()
				arg_763_1:ShowNextGo(false)
				arg_763_1:RecordContent(arg_763_1.text_.text)
			end

			local var_766_23 = math.max(var_766_16, arg_763_1.talkMaxDuration)

			if var_766_15 <= arg_763_1.time_ and arg_763_1.time_ < var_766_15 + var_766_23 then
				arg_763_1.typewritter.percent = (arg_763_1.time_ - var_766_15) / var_766_23

				arg_763_1.typewritter:SetDirty()
			end

			if arg_763_1.time_ >= var_766_15 + var_766_23 and arg_763_1.time_ < var_766_15 + var_766_23 + arg_766_0 then
				arg_763_1.typewritter.percent = 1

				arg_763_1.typewritter:SetDirty()
				arg_763_1:ShowNextGo(true)
			end
		end
	end,
	Play910201190 = function(arg_767_0, arg_767_1)
		arg_767_1.time_ = 0
		arg_767_1.frameCnt_ = 0
		arg_767_1.state_ = "playing"
		arg_767_1.curTalkId_ = 910201190
		arg_767_1.duration_ = 5

		SetActive(arg_767_1.tipsGo_, false)

		function arg_767_1.onSingleLineFinish_()
			arg_767_1.onSingleLineUpdate_ = nil
			arg_767_1.onSingleLineFinish_ = nil
			arg_767_1.state_ = "waiting"
		end

		function arg_767_1.playNext_(arg_769_0)
			if arg_769_0 == 1 then
				arg_767_0:Play910201191(arg_767_1)
			end
		end

		function arg_767_1.onSingleLineUpdate_(arg_770_0)
			local var_770_0 = arg_767_1.actors_["1080ui_story"]
			local var_770_1 = 0

			if var_770_1 < arg_767_1.time_ and arg_767_1.time_ <= var_770_1 + arg_770_0 and arg_767_1.var_.characterEffect1080ui_story == nil then
				arg_767_1.var_.characterEffect1080ui_story = var_770_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_770_2 = 0.2

			if var_770_1 <= arg_767_1.time_ and arg_767_1.time_ < var_770_1 + var_770_2 then
				local var_770_3 = (arg_767_1.time_ - var_770_1) / var_770_2

				if arg_767_1.var_.characterEffect1080ui_story then
					local var_770_4 = Mathf.Lerp(0, 0.5, var_770_3)

					arg_767_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_767_1.var_.characterEffect1080ui_story.fillRatio = var_770_4
				end
			end

			if arg_767_1.time_ >= var_770_1 + var_770_2 and arg_767_1.time_ < var_770_1 + var_770_2 + arg_770_0 and arg_767_1.var_.characterEffect1080ui_story then
				local var_770_5 = 0.5

				arg_767_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_767_1.var_.characterEffect1080ui_story.fillRatio = var_770_5
			end

			local var_770_6 = 0
			local var_770_7 = 0.275

			if var_770_6 < arg_767_1.time_ and arg_767_1.time_ <= var_770_6 + arg_770_0 then
				arg_767_1.talkMaxDuration = 0
				arg_767_1.dialogCg_.alpha = 1

				arg_767_1.dialog_:SetActive(true)
				SetActive(arg_767_1.leftNameGo_, false)

				arg_767_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_767_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_767_1:RecordName(arg_767_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_767_1.iconTrs_.gameObject, false)
				arg_767_1.callingController_:SetSelectedState("normal")

				local var_770_8 = arg_767_1:GetWordFromCfg(910201190)
				local var_770_9 = arg_767_1:FormatText(var_770_8.content)

				arg_767_1.text_.text = var_770_9

				LuaForUtil.ClearLinePrefixSymbol(arg_767_1.text_)

				local var_770_10 = 11
				local var_770_11 = utf8.len(var_770_9)
				local var_770_12 = var_770_10 <= 0 and var_770_7 or var_770_7 * (var_770_11 / var_770_10)

				if var_770_12 > 0 and var_770_7 < var_770_12 then
					arg_767_1.talkMaxDuration = var_770_12

					if var_770_12 + var_770_6 > arg_767_1.duration_ then
						arg_767_1.duration_ = var_770_12 + var_770_6
					end
				end

				arg_767_1.text_.text = var_770_9
				arg_767_1.typewritter.percent = 0

				arg_767_1.typewritter:SetDirty()
				arg_767_1:ShowNextGo(false)
				arg_767_1:RecordContent(arg_767_1.text_.text)
			end

			local var_770_13 = math.max(var_770_7, arg_767_1.talkMaxDuration)

			if var_770_6 <= arg_767_1.time_ and arg_767_1.time_ < var_770_6 + var_770_13 then
				arg_767_1.typewritter.percent = (arg_767_1.time_ - var_770_6) / var_770_13

				arg_767_1.typewritter:SetDirty()
			end

			if arg_767_1.time_ >= var_770_6 + var_770_13 and arg_767_1.time_ < var_770_6 + var_770_13 + arg_770_0 then
				arg_767_1.typewritter.percent = 1

				arg_767_1.typewritter:SetDirty()
				arg_767_1:ShowNextGo(true)
			end
		end
	end,
	Play910201191 = function(arg_771_0, arg_771_1)
		arg_771_1.time_ = 0
		arg_771_1.frameCnt_ = 0
		arg_771_1.state_ = "playing"
		arg_771_1.curTalkId_ = 910201191
		arg_771_1.duration_ = 5

		SetActive(arg_771_1.tipsGo_, false)

		function arg_771_1.onSingleLineFinish_()
			arg_771_1.onSingleLineUpdate_ = nil
			arg_771_1.onSingleLineFinish_ = nil
			arg_771_1.state_ = "waiting"
		end

		function arg_771_1.playNext_(arg_773_0)
			if arg_773_0 == 1 then
				arg_771_0:Play910201192(arg_771_1)
			end
		end

		function arg_771_1.onSingleLineUpdate_(arg_774_0)
			local var_774_0 = 0
			local var_774_1 = 0.225

			if var_774_0 < arg_771_1.time_ and arg_771_1.time_ <= var_774_0 + arg_774_0 then
				arg_771_1.talkMaxDuration = 0
				arg_771_1.dialogCg_.alpha = 1

				arg_771_1.dialog_:SetActive(true)
				SetActive(arg_771_1.leftNameGo_, true)

				local var_774_2 = arg_771_1:FormatText(StoryNameCfg[7].name)

				arg_771_1.leftNameTxt_.text = var_774_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_771_1.leftNameTxt_.transform)

				arg_771_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_771_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_771_1:RecordName(arg_771_1.leftNameTxt_.text)
				SetActive(arg_771_1.iconTrs_.gameObject, false)
				arg_771_1.callingController_:SetSelectedState("normal")

				local var_774_3 = arg_771_1:GetWordFromCfg(910201191)
				local var_774_4 = arg_771_1:FormatText(var_774_3.content)

				arg_771_1.text_.text = var_774_4

				LuaForUtil.ClearLinePrefixSymbol(arg_771_1.text_)

				local var_774_5 = 9
				local var_774_6 = utf8.len(var_774_4)
				local var_774_7 = var_774_5 <= 0 and var_774_1 or var_774_1 * (var_774_6 / var_774_5)

				if var_774_7 > 0 and var_774_1 < var_774_7 then
					arg_771_1.talkMaxDuration = var_774_7

					if var_774_7 + var_774_0 > arg_771_1.duration_ then
						arg_771_1.duration_ = var_774_7 + var_774_0
					end
				end

				arg_771_1.text_.text = var_774_4
				arg_771_1.typewritter.percent = 0

				arg_771_1.typewritter:SetDirty()
				arg_771_1:ShowNextGo(false)
				arg_771_1:RecordContent(arg_771_1.text_.text)
			end

			local var_774_8 = math.max(var_774_1, arg_771_1.talkMaxDuration)

			if var_774_0 <= arg_771_1.time_ and arg_771_1.time_ < var_774_0 + var_774_8 then
				arg_771_1.typewritter.percent = (arg_771_1.time_ - var_774_0) / var_774_8

				arg_771_1.typewritter:SetDirty()
			end

			if arg_771_1.time_ >= var_774_0 + var_774_8 and arg_771_1.time_ < var_774_0 + var_774_8 + arg_774_0 then
				arg_771_1.typewritter.percent = 1

				arg_771_1.typewritter:SetDirty()
				arg_771_1:ShowNextGo(true)
			end
		end
	end,
	Play910201192 = function(arg_775_0, arg_775_1)
		arg_775_1.time_ = 0
		arg_775_1.frameCnt_ = 0
		arg_775_1.state_ = "playing"
		arg_775_1.curTalkId_ = 910201192
		arg_775_1.duration_ = 5

		SetActive(arg_775_1.tipsGo_, false)

		function arg_775_1.onSingleLineFinish_()
			arg_775_1.onSingleLineUpdate_ = nil
			arg_775_1.onSingleLineFinish_ = nil
			arg_775_1.state_ = "waiting"
		end

		function arg_775_1.playNext_(arg_777_0)
			if arg_777_0 == 1 then
				arg_775_0:Play910201193(arg_775_1)
			end
		end

		function arg_775_1.onSingleLineUpdate_(arg_778_0)
			local var_778_0 = arg_775_1.actors_["1080ui_story"].transform
			local var_778_1 = 0

			if var_778_1 < arg_775_1.time_ and arg_775_1.time_ <= var_778_1 + arg_778_0 then
				arg_775_1.var_.moveOldPos1080ui_story = var_778_0.localPosition
			end

			local var_778_2 = 0.001

			if var_778_1 <= arg_775_1.time_ and arg_775_1.time_ < var_778_1 + var_778_2 then
				local var_778_3 = (arg_775_1.time_ - var_778_1) / var_778_2
				local var_778_4 = Vector3.New(0, 100, 0)

				var_778_0.localPosition = Vector3.Lerp(arg_775_1.var_.moveOldPos1080ui_story, var_778_4, var_778_3)

				local var_778_5 = manager.ui.mainCamera.transform.position - var_778_0.position

				var_778_0.forward = Vector3.New(var_778_5.x, var_778_5.y, var_778_5.z)

				local var_778_6 = var_778_0.localEulerAngles

				var_778_6.z = 0
				var_778_6.x = 0
				var_778_0.localEulerAngles = var_778_6
			end

			if arg_775_1.time_ >= var_778_1 + var_778_2 and arg_775_1.time_ < var_778_1 + var_778_2 + arg_778_0 then
				var_778_0.localPosition = Vector3.New(0, 100, 0)

				local var_778_7 = manager.ui.mainCamera.transform.position - var_778_0.position

				var_778_0.forward = Vector3.New(var_778_7.x, var_778_7.y, var_778_7.z)

				local var_778_8 = var_778_0.localEulerAngles

				var_778_8.z = 0
				var_778_8.x = 0
				var_778_0.localEulerAngles = var_778_8
			end

			local var_778_9 = 0
			local var_778_10 = 0.25

			if var_778_9 < arg_775_1.time_ and arg_775_1.time_ <= var_778_9 + arg_778_0 then
				arg_775_1.talkMaxDuration = 0
				arg_775_1.dialogCg_.alpha = 1

				arg_775_1.dialog_:SetActive(true)
				SetActive(arg_775_1.leftNameGo_, true)

				local var_778_11 = arg_775_1:FormatText(StoryNameCfg[7].name)

				arg_775_1.leftNameTxt_.text = var_778_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_775_1.leftNameTxt_.transform)

				arg_775_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_775_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_775_1:RecordName(arg_775_1.leftNameTxt_.text)
				SetActive(arg_775_1.iconTrs_.gameObject, false)
				arg_775_1.callingController_:SetSelectedState("normal")

				local var_778_12 = arg_775_1:GetWordFromCfg(910201192)
				local var_778_13 = arg_775_1:FormatText(var_778_12.content)

				arg_775_1.text_.text = var_778_13

				LuaForUtil.ClearLinePrefixSymbol(arg_775_1.text_)

				local var_778_14 = 10
				local var_778_15 = utf8.len(var_778_13)
				local var_778_16 = var_778_14 <= 0 and var_778_10 or var_778_10 * (var_778_15 / var_778_14)

				if var_778_16 > 0 and var_778_10 < var_778_16 then
					arg_775_1.talkMaxDuration = var_778_16

					if var_778_16 + var_778_9 > arg_775_1.duration_ then
						arg_775_1.duration_ = var_778_16 + var_778_9
					end
				end

				arg_775_1.text_.text = var_778_13
				arg_775_1.typewritter.percent = 0

				arg_775_1.typewritter:SetDirty()
				arg_775_1:ShowNextGo(false)
				arg_775_1:RecordContent(arg_775_1.text_.text)
			end

			local var_778_17 = math.max(var_778_10, arg_775_1.talkMaxDuration)

			if var_778_9 <= arg_775_1.time_ and arg_775_1.time_ < var_778_9 + var_778_17 then
				arg_775_1.typewritter.percent = (arg_775_1.time_ - var_778_9) / var_778_17

				arg_775_1.typewritter:SetDirty()
			end

			if arg_775_1.time_ >= var_778_9 + var_778_17 and arg_775_1.time_ < var_778_9 + var_778_17 + arg_778_0 then
				arg_775_1.typewritter.percent = 1

				arg_775_1.typewritter:SetDirty()
				arg_775_1:ShowNextGo(true)
			end
		end
	end,
	Play910201193 = function(arg_779_0, arg_779_1)
		arg_779_1.time_ = 0
		arg_779_1.frameCnt_ = 0
		arg_779_1.state_ = "playing"
		arg_779_1.curTalkId_ = 910201193
		arg_779_1.duration_ = 5

		SetActive(arg_779_1.tipsGo_, false)

		function arg_779_1.onSingleLineFinish_()
			arg_779_1.onSingleLineUpdate_ = nil
			arg_779_1.onSingleLineFinish_ = nil
			arg_779_1.state_ = "waiting"
		end

		function arg_779_1.playNext_(arg_781_0)
			if arg_781_0 == 1 then
				arg_779_0:Play910201194(arg_779_1)
			end
		end

		function arg_779_1.onSingleLineUpdate_(arg_782_0)
			local var_782_0 = "1059ui_story"

			if arg_779_1.actors_[var_782_0] == nil then
				local var_782_1 = Object.Instantiate(Asset.Load("Char/" .. var_782_0), arg_779_1.stage_.transform)

				var_782_1.name = var_782_0
				var_782_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_779_1.actors_[var_782_0] = var_782_1

				local var_782_2 = var_782_1:GetComponentInChildren(typeof(CharacterEffect))

				var_782_2.enabled = true

				local var_782_3 = GameObjectTools.GetOrAddComponent(var_782_1, typeof(DynamicBoneHelper))

				if var_782_3 then
					var_782_3:EnableDynamicBone(false)
				end

				arg_779_1:ShowWeapon(var_782_2.transform, false)

				arg_779_1.var_[var_782_0 .. "Animator"] = var_782_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_779_1.var_[var_782_0 .. "Animator"].applyRootMotion = true
				arg_779_1.var_[var_782_0 .. "LipSync"] = var_782_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_782_4 = arg_779_1.actors_["1059ui_story"].transform
			local var_782_5 = 0

			if var_782_5 < arg_779_1.time_ and arg_779_1.time_ <= var_782_5 + arg_782_0 then
				arg_779_1.var_.moveOldPos1059ui_story = var_782_4.localPosition
			end

			local var_782_6 = 0.001

			if var_782_5 <= arg_779_1.time_ and arg_779_1.time_ < var_782_5 + var_782_6 then
				local var_782_7 = (arg_779_1.time_ - var_782_5) / var_782_6
				local var_782_8 = Vector3.New(0, -1.05, -6)

				var_782_4.localPosition = Vector3.Lerp(arg_779_1.var_.moveOldPos1059ui_story, var_782_8, var_782_7)

				local var_782_9 = manager.ui.mainCamera.transform.position - var_782_4.position

				var_782_4.forward = Vector3.New(var_782_9.x, var_782_9.y, var_782_9.z)

				local var_782_10 = var_782_4.localEulerAngles

				var_782_10.z = 0
				var_782_10.x = 0
				var_782_4.localEulerAngles = var_782_10
			end

			if arg_779_1.time_ >= var_782_5 + var_782_6 and arg_779_1.time_ < var_782_5 + var_782_6 + arg_782_0 then
				var_782_4.localPosition = Vector3.New(0, -1.05, -6)

				local var_782_11 = manager.ui.mainCamera.transform.position - var_782_4.position

				var_782_4.forward = Vector3.New(var_782_11.x, var_782_11.y, var_782_11.z)

				local var_782_12 = var_782_4.localEulerAngles

				var_782_12.z = 0
				var_782_12.x = 0
				var_782_4.localEulerAngles = var_782_12
			end

			local var_782_13 = arg_779_1.actors_["1059ui_story"]
			local var_782_14 = 0

			if var_782_14 < arg_779_1.time_ and arg_779_1.time_ <= var_782_14 + arg_782_0 and arg_779_1.var_.characterEffect1059ui_story == nil then
				arg_779_1.var_.characterEffect1059ui_story = var_782_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_782_15 = 0.2

			if var_782_14 <= arg_779_1.time_ and arg_779_1.time_ < var_782_14 + var_782_15 then
				local var_782_16 = (arg_779_1.time_ - var_782_14) / var_782_15

				if arg_779_1.var_.characterEffect1059ui_story then
					arg_779_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_779_1.time_ >= var_782_14 + var_782_15 and arg_779_1.time_ < var_782_14 + var_782_15 + arg_782_0 and arg_779_1.var_.characterEffect1059ui_story then
				arg_779_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_782_17 = 0

			if var_782_17 < arg_779_1.time_ and arg_779_1.time_ <= var_782_17 + arg_782_0 then
				arg_779_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_782_18 = 0

			if var_782_18 < arg_779_1.time_ and arg_779_1.time_ <= var_782_18 + arg_782_0 then
				arg_779_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_782_19 = 0
			local var_782_20 = 0.5

			if var_782_19 < arg_779_1.time_ and arg_779_1.time_ <= var_782_19 + arg_782_0 then
				arg_779_1.talkMaxDuration = 0
				arg_779_1.dialogCg_.alpha = 1

				arg_779_1.dialog_:SetActive(true)
				SetActive(arg_779_1.leftNameGo_, true)

				local var_782_21 = arg_779_1:FormatText(StoryNameCfg[28].name)

				arg_779_1.leftNameTxt_.text = var_782_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_779_1.leftNameTxt_.transform)

				arg_779_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_779_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_779_1:RecordName(arg_779_1.leftNameTxt_.text)
				SetActive(arg_779_1.iconTrs_.gameObject, false)
				arg_779_1.callingController_:SetSelectedState("normal")

				local var_782_22 = arg_779_1:GetWordFromCfg(910201193)
				local var_782_23 = arg_779_1:FormatText(var_782_22.content)

				arg_779_1.text_.text = var_782_23

				LuaForUtil.ClearLinePrefixSymbol(arg_779_1.text_)

				local var_782_24 = 20
				local var_782_25 = utf8.len(var_782_23)
				local var_782_26 = var_782_24 <= 0 and var_782_20 or var_782_20 * (var_782_25 / var_782_24)

				if var_782_26 > 0 and var_782_20 < var_782_26 then
					arg_779_1.talkMaxDuration = var_782_26

					if var_782_26 + var_782_19 > arg_779_1.duration_ then
						arg_779_1.duration_ = var_782_26 + var_782_19
					end
				end

				arg_779_1.text_.text = var_782_23
				arg_779_1.typewritter.percent = 0

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(false)
				arg_779_1:RecordContent(arg_779_1.text_.text)
			end

			local var_782_27 = math.max(var_782_20, arg_779_1.talkMaxDuration)

			if var_782_19 <= arg_779_1.time_ and arg_779_1.time_ < var_782_19 + var_782_27 then
				arg_779_1.typewritter.percent = (arg_779_1.time_ - var_782_19) / var_782_27

				arg_779_1.typewritter:SetDirty()
			end

			if arg_779_1.time_ >= var_782_19 + var_782_27 and arg_779_1.time_ < var_782_19 + var_782_27 + arg_782_0 then
				arg_779_1.typewritter.percent = 1

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(true)
			end
		end
	end,
	Play910201194 = function(arg_783_0, arg_783_1)
		arg_783_1.time_ = 0
		arg_783_1.frameCnt_ = 0
		arg_783_1.state_ = "playing"
		arg_783_1.curTalkId_ = 910201194
		arg_783_1.duration_ = 5

		SetActive(arg_783_1.tipsGo_, false)

		function arg_783_1.onSingleLineFinish_()
			arg_783_1.onSingleLineUpdate_ = nil
			arg_783_1.onSingleLineFinish_ = nil
			arg_783_1.state_ = "waiting"
		end

		function arg_783_1.playNext_(arg_785_0)
			if arg_785_0 == 1 then
				arg_783_0:Play910201195(arg_783_1)
			end
		end

		function arg_783_1.onSingleLineUpdate_(arg_786_0)
			local var_786_0 = 0

			if var_786_0 < arg_783_1.time_ and arg_783_1.time_ <= var_786_0 + arg_786_0 then
				arg_783_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action425")
			end

			local var_786_1 = 0

			if var_786_1 < arg_783_1.time_ and arg_783_1.time_ <= var_786_1 + arg_786_0 then
				arg_783_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_786_2 = 0
			local var_786_3 = 1.05

			if var_786_2 < arg_783_1.time_ and arg_783_1.time_ <= var_786_2 + arg_786_0 then
				arg_783_1.talkMaxDuration = 0
				arg_783_1.dialogCg_.alpha = 1

				arg_783_1.dialog_:SetActive(true)
				SetActive(arg_783_1.leftNameGo_, true)

				local var_786_4 = arg_783_1:FormatText(StoryNameCfg[28].name)

				arg_783_1.leftNameTxt_.text = var_786_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_783_1.leftNameTxt_.transform)

				arg_783_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_783_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_783_1:RecordName(arg_783_1.leftNameTxt_.text)
				SetActive(arg_783_1.iconTrs_.gameObject, false)
				arg_783_1.callingController_:SetSelectedState("normal")

				local var_786_5 = arg_783_1:GetWordFromCfg(910201194)
				local var_786_6 = arg_783_1:FormatText(var_786_5.content)

				arg_783_1.text_.text = var_786_6

				LuaForUtil.ClearLinePrefixSymbol(arg_783_1.text_)

				local var_786_7 = 42
				local var_786_8 = utf8.len(var_786_6)
				local var_786_9 = var_786_7 <= 0 and var_786_3 or var_786_3 * (var_786_8 / var_786_7)

				if var_786_9 > 0 and var_786_3 < var_786_9 then
					arg_783_1.talkMaxDuration = var_786_9

					if var_786_9 + var_786_2 > arg_783_1.duration_ then
						arg_783_1.duration_ = var_786_9 + var_786_2
					end
				end

				arg_783_1.text_.text = var_786_6
				arg_783_1.typewritter.percent = 0

				arg_783_1.typewritter:SetDirty()
				arg_783_1:ShowNextGo(false)
				arg_783_1:RecordContent(arg_783_1.text_.text)
			end

			local var_786_10 = math.max(var_786_3, arg_783_1.talkMaxDuration)

			if var_786_2 <= arg_783_1.time_ and arg_783_1.time_ < var_786_2 + var_786_10 then
				arg_783_1.typewritter.percent = (arg_783_1.time_ - var_786_2) / var_786_10

				arg_783_1.typewritter:SetDirty()
			end

			if arg_783_1.time_ >= var_786_2 + var_786_10 and arg_783_1.time_ < var_786_2 + var_786_10 + arg_786_0 then
				arg_783_1.typewritter.percent = 1

				arg_783_1.typewritter:SetDirty()
				arg_783_1:ShowNextGo(true)
			end
		end
	end,
	Play910201195 = function(arg_787_0, arg_787_1)
		arg_787_1.time_ = 0
		arg_787_1.frameCnt_ = 0
		arg_787_1.state_ = "playing"
		arg_787_1.curTalkId_ = 910201195
		arg_787_1.duration_ = 5

		SetActive(arg_787_1.tipsGo_, false)

		function arg_787_1.onSingleLineFinish_()
			arg_787_1.onSingleLineUpdate_ = nil
			arg_787_1.onSingleLineFinish_ = nil
			arg_787_1.state_ = "waiting"
		end

		function arg_787_1.playNext_(arg_789_0)
			if arg_789_0 == 1 then
				arg_787_0:Play910201196(arg_787_1)
			end
		end

		function arg_787_1.onSingleLineUpdate_(arg_790_0)
			local var_790_0 = arg_787_1.actors_["1059ui_story"]
			local var_790_1 = 0

			if var_790_1 < arg_787_1.time_ and arg_787_1.time_ <= var_790_1 + arg_790_0 and arg_787_1.var_.characterEffect1059ui_story == nil then
				arg_787_1.var_.characterEffect1059ui_story = var_790_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_790_2 = 0.2

			if var_790_1 <= arg_787_1.time_ and arg_787_1.time_ < var_790_1 + var_790_2 then
				local var_790_3 = (arg_787_1.time_ - var_790_1) / var_790_2

				if arg_787_1.var_.characterEffect1059ui_story then
					local var_790_4 = Mathf.Lerp(0, 0.5, var_790_3)

					arg_787_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_787_1.var_.characterEffect1059ui_story.fillRatio = var_790_4
				end
			end

			if arg_787_1.time_ >= var_790_1 + var_790_2 and arg_787_1.time_ < var_790_1 + var_790_2 + arg_790_0 and arg_787_1.var_.characterEffect1059ui_story then
				local var_790_5 = 0.5

				arg_787_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_787_1.var_.characterEffect1059ui_story.fillRatio = var_790_5
			end

			local var_790_6 = 0
			local var_790_7 = 0.725

			if var_790_6 < arg_787_1.time_ and arg_787_1.time_ <= var_790_6 + arg_790_0 then
				arg_787_1.talkMaxDuration = 0
				arg_787_1.dialogCg_.alpha = 1

				arg_787_1.dialog_:SetActive(true)
				SetActive(arg_787_1.leftNameGo_, true)

				local var_790_8 = arg_787_1:FormatText(StoryNameCfg[7].name)

				arg_787_1.leftNameTxt_.text = var_790_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_787_1.leftNameTxt_.transform)

				arg_787_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_787_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_787_1:RecordName(arg_787_1.leftNameTxt_.text)
				SetActive(arg_787_1.iconTrs_.gameObject, false)
				arg_787_1.callingController_:SetSelectedState("normal")

				local var_790_9 = arg_787_1:GetWordFromCfg(910201195)
				local var_790_10 = arg_787_1:FormatText(var_790_9.content)

				arg_787_1.text_.text = var_790_10

				LuaForUtil.ClearLinePrefixSymbol(arg_787_1.text_)

				local var_790_11 = 29
				local var_790_12 = utf8.len(var_790_10)
				local var_790_13 = var_790_11 <= 0 and var_790_7 or var_790_7 * (var_790_12 / var_790_11)

				if var_790_13 > 0 and var_790_7 < var_790_13 then
					arg_787_1.talkMaxDuration = var_790_13

					if var_790_13 + var_790_6 > arg_787_1.duration_ then
						arg_787_1.duration_ = var_790_13 + var_790_6
					end
				end

				arg_787_1.text_.text = var_790_10
				arg_787_1.typewritter.percent = 0

				arg_787_1.typewritter:SetDirty()
				arg_787_1:ShowNextGo(false)
				arg_787_1:RecordContent(arg_787_1.text_.text)
			end

			local var_790_14 = math.max(var_790_7, arg_787_1.talkMaxDuration)

			if var_790_6 <= arg_787_1.time_ and arg_787_1.time_ < var_790_6 + var_790_14 then
				arg_787_1.typewritter.percent = (arg_787_1.time_ - var_790_6) / var_790_14

				arg_787_1.typewritter:SetDirty()
			end

			if arg_787_1.time_ >= var_790_6 + var_790_14 and arg_787_1.time_ < var_790_6 + var_790_14 + arg_790_0 then
				arg_787_1.typewritter.percent = 1

				arg_787_1.typewritter:SetDirty()
				arg_787_1:ShowNextGo(true)
			end
		end
	end,
	Play910201196 = function(arg_791_0, arg_791_1)
		arg_791_1.time_ = 0
		arg_791_1.frameCnt_ = 0
		arg_791_1.state_ = "playing"
		arg_791_1.curTalkId_ = 910201196
		arg_791_1.duration_ = 5

		SetActive(arg_791_1.tipsGo_, false)

		function arg_791_1.onSingleLineFinish_()
			arg_791_1.onSingleLineUpdate_ = nil
			arg_791_1.onSingleLineFinish_ = nil
			arg_791_1.state_ = "waiting"
		end

		function arg_791_1.playNext_(arg_793_0)
			if arg_793_0 == 1 then
				arg_791_0:Play910201197(arg_791_1)
			end
		end

		function arg_791_1.onSingleLineUpdate_(arg_794_0)
			local var_794_0 = arg_791_1.actors_["1059ui_story"]
			local var_794_1 = 0

			if var_794_1 < arg_791_1.time_ and arg_791_1.time_ <= var_794_1 + arg_794_0 and arg_791_1.var_.characterEffect1059ui_story == nil then
				arg_791_1.var_.characterEffect1059ui_story = var_794_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_794_2 = 0.2

			if var_794_1 <= arg_791_1.time_ and arg_791_1.time_ < var_794_1 + var_794_2 then
				local var_794_3 = (arg_791_1.time_ - var_794_1) / var_794_2

				if arg_791_1.var_.characterEffect1059ui_story then
					arg_791_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_791_1.time_ >= var_794_1 + var_794_2 and arg_791_1.time_ < var_794_1 + var_794_2 + arg_794_0 and arg_791_1.var_.characterEffect1059ui_story then
				arg_791_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_794_4 = 0

			if var_794_4 < arg_791_1.time_ and arg_791_1.time_ <= var_794_4 + arg_794_0 then
				arg_791_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action452")
			end

			local var_794_5 = 0

			if var_794_5 < arg_791_1.time_ and arg_791_1.time_ <= var_794_5 + arg_794_0 then
				arg_791_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_794_6 = 0
			local var_794_7 = 0.7

			if var_794_6 < arg_791_1.time_ and arg_791_1.time_ <= var_794_6 + arg_794_0 then
				arg_791_1.talkMaxDuration = 0
				arg_791_1.dialogCg_.alpha = 1

				arg_791_1.dialog_:SetActive(true)
				SetActive(arg_791_1.leftNameGo_, true)

				local var_794_8 = arg_791_1:FormatText(StoryNameCfg[28].name)

				arg_791_1.leftNameTxt_.text = var_794_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_791_1.leftNameTxt_.transform)

				arg_791_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_791_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_791_1:RecordName(arg_791_1.leftNameTxt_.text)
				SetActive(arg_791_1.iconTrs_.gameObject, false)
				arg_791_1.callingController_:SetSelectedState("normal")

				local var_794_9 = arg_791_1:GetWordFromCfg(910201196)
				local var_794_10 = arg_791_1:FormatText(var_794_9.content)

				arg_791_1.text_.text = var_794_10

				LuaForUtil.ClearLinePrefixSymbol(arg_791_1.text_)

				local var_794_11 = 28
				local var_794_12 = utf8.len(var_794_10)
				local var_794_13 = var_794_11 <= 0 and var_794_7 or var_794_7 * (var_794_12 / var_794_11)

				if var_794_13 > 0 and var_794_7 < var_794_13 then
					arg_791_1.talkMaxDuration = var_794_13

					if var_794_13 + var_794_6 > arg_791_1.duration_ then
						arg_791_1.duration_ = var_794_13 + var_794_6
					end
				end

				arg_791_1.text_.text = var_794_10
				arg_791_1.typewritter.percent = 0

				arg_791_1.typewritter:SetDirty()
				arg_791_1:ShowNextGo(false)
				arg_791_1:RecordContent(arg_791_1.text_.text)
			end

			local var_794_14 = math.max(var_794_7, arg_791_1.talkMaxDuration)

			if var_794_6 <= arg_791_1.time_ and arg_791_1.time_ < var_794_6 + var_794_14 then
				arg_791_1.typewritter.percent = (arg_791_1.time_ - var_794_6) / var_794_14

				arg_791_1.typewritter:SetDirty()
			end

			if arg_791_1.time_ >= var_794_6 + var_794_14 and arg_791_1.time_ < var_794_6 + var_794_14 + arg_794_0 then
				arg_791_1.typewritter.percent = 1

				arg_791_1.typewritter:SetDirty()
				arg_791_1:ShowNextGo(true)
			end
		end
	end,
	Play910201197 = function(arg_795_0, arg_795_1)
		arg_795_1.time_ = 0
		arg_795_1.frameCnt_ = 0
		arg_795_1.state_ = "playing"
		arg_795_1.curTalkId_ = 910201197
		arg_795_1.duration_ = 5

		SetActive(arg_795_1.tipsGo_, false)

		function arg_795_1.onSingleLineFinish_()
			arg_795_1.onSingleLineUpdate_ = nil
			arg_795_1.onSingleLineFinish_ = nil
			arg_795_1.state_ = "waiting"
		end

		function arg_795_1.playNext_(arg_797_0)
			if arg_797_0 == 1 then
				arg_795_0:Play910201198(arg_795_1)
			end
		end

		function arg_795_1.onSingleLineUpdate_(arg_798_0)
			local var_798_0 = arg_795_1.actors_["1059ui_story"]
			local var_798_1 = 0

			if var_798_1 < arg_795_1.time_ and arg_795_1.time_ <= var_798_1 + arg_798_0 and arg_795_1.var_.characterEffect1059ui_story == nil then
				arg_795_1.var_.characterEffect1059ui_story = var_798_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_798_2 = 0.2

			if var_798_1 <= arg_795_1.time_ and arg_795_1.time_ < var_798_1 + var_798_2 then
				local var_798_3 = (arg_795_1.time_ - var_798_1) / var_798_2

				if arg_795_1.var_.characterEffect1059ui_story then
					local var_798_4 = Mathf.Lerp(0, 0.5, var_798_3)

					arg_795_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_795_1.var_.characterEffect1059ui_story.fillRatio = var_798_4
				end
			end

			if arg_795_1.time_ >= var_798_1 + var_798_2 and arg_795_1.time_ < var_798_1 + var_798_2 + arg_798_0 and arg_795_1.var_.characterEffect1059ui_story then
				local var_798_5 = 0.5

				arg_795_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_795_1.var_.characterEffect1059ui_story.fillRatio = var_798_5
			end

			local var_798_6 = 0
			local var_798_7 = 0.125

			if var_798_6 < arg_795_1.time_ and arg_795_1.time_ <= var_798_6 + arg_798_0 then
				arg_795_1.talkMaxDuration = 0
				arg_795_1.dialogCg_.alpha = 1

				arg_795_1.dialog_:SetActive(true)
				SetActive(arg_795_1.leftNameGo_, true)

				local var_798_8 = arg_795_1:FormatText(StoryNameCfg[7].name)

				arg_795_1.leftNameTxt_.text = var_798_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_795_1.leftNameTxt_.transform)

				arg_795_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_795_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_795_1:RecordName(arg_795_1.leftNameTxt_.text)
				SetActive(arg_795_1.iconTrs_.gameObject, false)
				arg_795_1.callingController_:SetSelectedState("normal")

				local var_798_9 = arg_795_1:GetWordFromCfg(910201197)
				local var_798_10 = arg_795_1:FormatText(var_798_9.content)

				arg_795_1.text_.text = var_798_10

				LuaForUtil.ClearLinePrefixSymbol(arg_795_1.text_)

				local var_798_11 = 5
				local var_798_12 = utf8.len(var_798_10)
				local var_798_13 = var_798_11 <= 0 and var_798_7 or var_798_7 * (var_798_12 / var_798_11)

				if var_798_13 > 0 and var_798_7 < var_798_13 then
					arg_795_1.talkMaxDuration = var_798_13

					if var_798_13 + var_798_6 > arg_795_1.duration_ then
						arg_795_1.duration_ = var_798_13 + var_798_6
					end
				end

				arg_795_1.text_.text = var_798_10
				arg_795_1.typewritter.percent = 0

				arg_795_1.typewritter:SetDirty()
				arg_795_1:ShowNextGo(false)
				arg_795_1:RecordContent(arg_795_1.text_.text)
			end

			local var_798_14 = math.max(var_798_7, arg_795_1.talkMaxDuration)

			if var_798_6 <= arg_795_1.time_ and arg_795_1.time_ < var_798_6 + var_798_14 then
				arg_795_1.typewritter.percent = (arg_795_1.time_ - var_798_6) / var_798_14

				arg_795_1.typewritter:SetDirty()
			end

			if arg_795_1.time_ >= var_798_6 + var_798_14 and arg_795_1.time_ < var_798_6 + var_798_14 + arg_798_0 then
				arg_795_1.typewritter.percent = 1

				arg_795_1.typewritter:SetDirty()
				arg_795_1:ShowNextGo(true)
			end
		end
	end,
	Play910201198 = function(arg_799_0, arg_799_1)
		arg_799_1.time_ = 0
		arg_799_1.frameCnt_ = 0
		arg_799_1.state_ = "playing"
		arg_799_1.curTalkId_ = 910201198
		arg_799_1.duration_ = 5

		SetActive(arg_799_1.tipsGo_, false)

		function arg_799_1.onSingleLineFinish_()
			arg_799_1.onSingleLineUpdate_ = nil
			arg_799_1.onSingleLineFinish_ = nil
			arg_799_1.state_ = "waiting"
		end

		function arg_799_1.playNext_(arg_801_0)
			if arg_801_0 == 1 then
				arg_799_0:Play910201199(arg_799_1)
			end
		end

		function arg_799_1.onSingleLineUpdate_(arg_802_0)
			local var_802_0 = arg_799_1.actors_["1059ui_story"].transform
			local var_802_1 = 0

			if var_802_1 < arg_799_1.time_ and arg_799_1.time_ <= var_802_1 + arg_802_0 then
				arg_799_1.var_.moveOldPos1059ui_story = var_802_0.localPosition
			end

			local var_802_2 = 0.001

			if var_802_1 <= arg_799_1.time_ and arg_799_1.time_ < var_802_1 + var_802_2 then
				local var_802_3 = (arg_799_1.time_ - var_802_1) / var_802_2
				local var_802_4 = Vector3.New(0, 100, 0)

				var_802_0.localPosition = Vector3.Lerp(arg_799_1.var_.moveOldPos1059ui_story, var_802_4, var_802_3)

				local var_802_5 = manager.ui.mainCamera.transform.position - var_802_0.position

				var_802_0.forward = Vector3.New(var_802_5.x, var_802_5.y, var_802_5.z)

				local var_802_6 = var_802_0.localEulerAngles

				var_802_6.z = 0
				var_802_6.x = 0
				var_802_0.localEulerAngles = var_802_6
			end

			if arg_799_1.time_ >= var_802_1 + var_802_2 and arg_799_1.time_ < var_802_1 + var_802_2 + arg_802_0 then
				var_802_0.localPosition = Vector3.New(0, 100, 0)

				local var_802_7 = manager.ui.mainCamera.transform.position - var_802_0.position

				var_802_0.forward = Vector3.New(var_802_7.x, var_802_7.y, var_802_7.z)

				local var_802_8 = var_802_0.localEulerAngles

				var_802_8.z = 0
				var_802_8.x = 0
				var_802_0.localEulerAngles = var_802_8
			end

			local var_802_9 = "1032ui_story"

			if arg_799_1.actors_[var_802_9] == nil then
				local var_802_10 = Object.Instantiate(Asset.Load("Char/" .. var_802_9), arg_799_1.stage_.transform)

				var_802_10.name = var_802_9
				var_802_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_799_1.actors_[var_802_9] = var_802_10

				local var_802_11 = var_802_10:GetComponentInChildren(typeof(CharacterEffect))

				var_802_11.enabled = true

				local var_802_12 = GameObjectTools.GetOrAddComponent(var_802_10, typeof(DynamicBoneHelper))

				if var_802_12 then
					var_802_12:EnableDynamicBone(false)
				end

				arg_799_1:ShowWeapon(var_802_11.transform, false)

				arg_799_1.var_[var_802_9 .. "Animator"] = var_802_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_799_1.var_[var_802_9 .. "Animator"].applyRootMotion = true
				arg_799_1.var_[var_802_9 .. "LipSync"] = var_802_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_802_13 = 0

			if var_802_13 < arg_799_1.time_ and arg_799_1.time_ <= var_802_13 + arg_802_0 then
				arg_799_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/1032/1032action/1032action8_1")
			end

			local var_802_14 = arg_799_1.actors_["1032ui_story"].transform
			local var_802_15 = 0

			if var_802_15 < arg_799_1.time_ and arg_799_1.time_ <= var_802_15 + arg_802_0 then
				arg_799_1.var_.moveOldPos1032ui_story = var_802_14.localPosition
			end

			local var_802_16 = 0.001

			if var_802_15 <= arg_799_1.time_ and arg_799_1.time_ < var_802_15 + var_802_16 then
				local var_802_17 = (arg_799_1.time_ - var_802_15) / var_802_16
				local var_802_18 = Vector3.New(0, -1.05, -6.2)

				var_802_14.localPosition = Vector3.Lerp(arg_799_1.var_.moveOldPos1032ui_story, var_802_18, var_802_17)

				local var_802_19 = manager.ui.mainCamera.transform.position - var_802_14.position

				var_802_14.forward = Vector3.New(var_802_19.x, var_802_19.y, var_802_19.z)

				local var_802_20 = var_802_14.localEulerAngles

				var_802_20.z = 0
				var_802_20.x = 0
				var_802_14.localEulerAngles = var_802_20
			end

			if arg_799_1.time_ >= var_802_15 + var_802_16 and arg_799_1.time_ < var_802_15 + var_802_16 + arg_802_0 then
				var_802_14.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_802_21 = manager.ui.mainCamera.transform.position - var_802_14.position

				var_802_14.forward = Vector3.New(var_802_21.x, var_802_21.y, var_802_21.z)

				local var_802_22 = var_802_14.localEulerAngles

				var_802_22.z = 0
				var_802_22.x = 0
				var_802_14.localEulerAngles = var_802_22
			end

			local var_802_23 = 0

			if var_802_23 < arg_799_1.time_ and arg_799_1.time_ <= var_802_23 + arg_802_0 then
				arg_799_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_802_24 = arg_799_1.actors_["1032ui_story"]
			local var_802_25 = 0

			if var_802_25 < arg_799_1.time_ and arg_799_1.time_ <= var_802_25 + arg_802_0 and arg_799_1.var_.characterEffect1032ui_story == nil then
				arg_799_1.var_.characterEffect1032ui_story = var_802_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_802_26 = 0.2

			if var_802_25 <= arg_799_1.time_ and arg_799_1.time_ < var_802_25 + var_802_26 then
				local var_802_27 = (arg_799_1.time_ - var_802_25) / var_802_26

				if arg_799_1.var_.characterEffect1032ui_story then
					arg_799_1.var_.characterEffect1032ui_story.fillFlat = false
				end
			end

			if arg_799_1.time_ >= var_802_25 + var_802_26 and arg_799_1.time_ < var_802_25 + var_802_26 + arg_802_0 and arg_799_1.var_.characterEffect1032ui_story then
				arg_799_1.var_.characterEffect1032ui_story.fillFlat = false
			end

			local var_802_28 = 0
			local var_802_29 = 0.925

			if var_802_28 < arg_799_1.time_ and arg_799_1.time_ <= var_802_28 + arg_802_0 then
				arg_799_1.talkMaxDuration = 0
				arg_799_1.dialogCg_.alpha = 1

				arg_799_1.dialog_:SetActive(true)
				SetActive(arg_799_1.leftNameGo_, true)

				local var_802_30 = arg_799_1:FormatText(StoryNameCfg[61].name)

				arg_799_1.leftNameTxt_.text = var_802_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_799_1.leftNameTxt_.transform)

				arg_799_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_799_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_799_1:RecordName(arg_799_1.leftNameTxt_.text)
				SetActive(arg_799_1.iconTrs_.gameObject, false)
				arg_799_1.callingController_:SetSelectedState("normal")

				local var_802_31 = arg_799_1:GetWordFromCfg(910201198)
				local var_802_32 = arg_799_1:FormatText(var_802_31.content)

				arg_799_1.text_.text = var_802_32

				LuaForUtil.ClearLinePrefixSymbol(arg_799_1.text_)

				local var_802_33 = 37
				local var_802_34 = utf8.len(var_802_32)
				local var_802_35 = var_802_33 <= 0 and var_802_29 or var_802_29 * (var_802_34 / var_802_33)

				if var_802_35 > 0 and var_802_29 < var_802_35 then
					arg_799_1.talkMaxDuration = var_802_35

					if var_802_35 + var_802_28 > arg_799_1.duration_ then
						arg_799_1.duration_ = var_802_35 + var_802_28
					end
				end

				arg_799_1.text_.text = var_802_32
				arg_799_1.typewritter.percent = 0

				arg_799_1.typewritter:SetDirty()
				arg_799_1:ShowNextGo(false)
				arg_799_1:RecordContent(arg_799_1.text_.text)
			end

			local var_802_36 = math.max(var_802_29, arg_799_1.talkMaxDuration)

			if var_802_28 <= arg_799_1.time_ and arg_799_1.time_ < var_802_28 + var_802_36 then
				arg_799_1.typewritter.percent = (arg_799_1.time_ - var_802_28) / var_802_36

				arg_799_1.typewritter:SetDirty()
			end

			if arg_799_1.time_ >= var_802_28 + var_802_36 and arg_799_1.time_ < var_802_28 + var_802_36 + arg_802_0 then
				arg_799_1.typewritter.percent = 1

				arg_799_1.typewritter:SetDirty()
				arg_799_1:ShowNextGo(true)
			end
		end
	end,
	Play910201199 = function(arg_803_0, arg_803_1)
		arg_803_1.time_ = 0
		arg_803_1.frameCnt_ = 0
		arg_803_1.state_ = "playing"
		arg_803_1.curTalkId_ = 910201199
		arg_803_1.duration_ = 5

		SetActive(arg_803_1.tipsGo_, false)

		function arg_803_1.onSingleLineFinish_()
			arg_803_1.onSingleLineUpdate_ = nil
			arg_803_1.onSingleLineFinish_ = nil
			arg_803_1.state_ = "waiting"
		end

		function arg_803_1.playNext_(arg_805_0)
			if arg_805_0 == 1 then
				arg_803_0:Play910201200(arg_803_1)
			end
		end

		function arg_803_1.onSingleLineUpdate_(arg_806_0)
			local var_806_0 = 0

			if var_806_0 < arg_803_1.time_ and arg_803_1.time_ <= var_806_0 + arg_806_0 then
				arg_803_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/1032/1032actionlink/1032action486")
			end

			local var_806_1 = 0

			if var_806_1 < arg_803_1.time_ and arg_803_1.time_ <= var_806_1 + arg_806_0 then
				arg_803_1:PlayTimeline("1032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_806_2 = 0
			local var_806_3 = 0.775

			if var_806_2 < arg_803_1.time_ and arg_803_1.time_ <= var_806_2 + arg_806_0 then
				arg_803_1.talkMaxDuration = 0
				arg_803_1.dialogCg_.alpha = 1

				arg_803_1.dialog_:SetActive(true)
				SetActive(arg_803_1.leftNameGo_, true)

				local var_806_4 = arg_803_1:FormatText(StoryNameCfg[61].name)

				arg_803_1.leftNameTxt_.text = var_806_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_803_1.leftNameTxt_.transform)

				arg_803_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_803_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_803_1:RecordName(arg_803_1.leftNameTxt_.text)
				SetActive(arg_803_1.iconTrs_.gameObject, false)
				arg_803_1.callingController_:SetSelectedState("normal")

				local var_806_5 = arg_803_1:GetWordFromCfg(910201199)
				local var_806_6 = arg_803_1:FormatText(var_806_5.content)

				arg_803_1.text_.text = var_806_6

				LuaForUtil.ClearLinePrefixSymbol(arg_803_1.text_)

				local var_806_7 = 31
				local var_806_8 = utf8.len(var_806_6)
				local var_806_9 = var_806_7 <= 0 and var_806_3 or var_806_3 * (var_806_8 / var_806_7)

				if var_806_9 > 0 and var_806_3 < var_806_9 then
					arg_803_1.talkMaxDuration = var_806_9

					if var_806_9 + var_806_2 > arg_803_1.duration_ then
						arg_803_1.duration_ = var_806_9 + var_806_2
					end
				end

				arg_803_1.text_.text = var_806_6
				arg_803_1.typewritter.percent = 0

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(false)
				arg_803_1:RecordContent(arg_803_1.text_.text)
			end

			local var_806_10 = math.max(var_806_3, arg_803_1.talkMaxDuration)

			if var_806_2 <= arg_803_1.time_ and arg_803_1.time_ < var_806_2 + var_806_10 then
				arg_803_1.typewritter.percent = (arg_803_1.time_ - var_806_2) / var_806_10

				arg_803_1.typewritter:SetDirty()
			end

			if arg_803_1.time_ >= var_806_2 + var_806_10 and arg_803_1.time_ < var_806_2 + var_806_10 + arg_806_0 then
				arg_803_1.typewritter.percent = 1

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(true)
			end
		end
	end,
	Play910201200 = function(arg_807_0, arg_807_1)
		arg_807_1.time_ = 0
		arg_807_1.frameCnt_ = 0
		arg_807_1.state_ = "playing"
		arg_807_1.curTalkId_ = 910201200
		arg_807_1.duration_ = 5

		SetActive(arg_807_1.tipsGo_, false)

		function arg_807_1.onSingleLineFinish_()
			arg_807_1.onSingleLineUpdate_ = nil
			arg_807_1.onSingleLineFinish_ = nil
			arg_807_1.state_ = "waiting"
		end

		function arg_807_1.playNext_(arg_809_0)
			if arg_809_0 == 1 then
				arg_807_0:Play910201201(arg_807_1)
			end
		end

		function arg_807_1.onSingleLineUpdate_(arg_810_0)
			local var_810_0 = arg_807_1.actors_["1032ui_story"].transform
			local var_810_1 = 0

			if var_810_1 < arg_807_1.time_ and arg_807_1.time_ <= var_810_1 + arg_810_0 then
				arg_807_1.var_.moveOldPos1032ui_story = var_810_0.localPosition
			end

			local var_810_2 = 0.001

			if var_810_1 <= arg_807_1.time_ and arg_807_1.time_ < var_810_1 + var_810_2 then
				local var_810_3 = (arg_807_1.time_ - var_810_1) / var_810_2
				local var_810_4 = Vector3.New(0, 100, 0)

				var_810_0.localPosition = Vector3.Lerp(arg_807_1.var_.moveOldPos1032ui_story, var_810_4, var_810_3)

				local var_810_5 = manager.ui.mainCamera.transform.position - var_810_0.position

				var_810_0.forward = Vector3.New(var_810_5.x, var_810_5.y, var_810_5.z)

				local var_810_6 = var_810_0.localEulerAngles

				var_810_6.z = 0
				var_810_6.x = 0
				var_810_0.localEulerAngles = var_810_6
			end

			if arg_807_1.time_ >= var_810_1 + var_810_2 and arg_807_1.time_ < var_810_1 + var_810_2 + arg_810_0 then
				var_810_0.localPosition = Vector3.New(0, 100, 0)

				local var_810_7 = manager.ui.mainCamera.transform.position - var_810_0.position

				var_810_0.forward = Vector3.New(var_810_7.x, var_810_7.y, var_810_7.z)

				local var_810_8 = var_810_0.localEulerAngles

				var_810_8.z = 0
				var_810_8.x = 0
				var_810_0.localEulerAngles = var_810_8
			end

			local var_810_9 = 0
			local var_810_10 = 0.375

			if var_810_9 < arg_807_1.time_ and arg_807_1.time_ <= var_810_9 + arg_810_0 then
				arg_807_1.talkMaxDuration = 0
				arg_807_1.dialogCg_.alpha = 1

				arg_807_1.dialog_:SetActive(true)
				SetActive(arg_807_1.leftNameGo_, true)

				local var_810_11 = arg_807_1:FormatText(StoryNameCfg[7].name)

				arg_807_1.leftNameTxt_.text = var_810_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_807_1.leftNameTxt_.transform)

				arg_807_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_807_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_807_1:RecordName(arg_807_1.leftNameTxt_.text)
				SetActive(arg_807_1.iconTrs_.gameObject, false)
				arg_807_1.callingController_:SetSelectedState("normal")

				local var_810_12 = arg_807_1:GetWordFromCfg(910201200)
				local var_810_13 = arg_807_1:FormatText(var_810_12.content)

				arg_807_1.text_.text = var_810_13

				LuaForUtil.ClearLinePrefixSymbol(arg_807_1.text_)

				local var_810_14 = 15
				local var_810_15 = utf8.len(var_810_13)
				local var_810_16 = var_810_14 <= 0 and var_810_10 or var_810_10 * (var_810_15 / var_810_14)

				if var_810_16 > 0 and var_810_10 < var_810_16 then
					arg_807_1.talkMaxDuration = var_810_16

					if var_810_16 + var_810_9 > arg_807_1.duration_ then
						arg_807_1.duration_ = var_810_16 + var_810_9
					end
				end

				arg_807_1.text_.text = var_810_13
				arg_807_1.typewritter.percent = 0

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(false)
				arg_807_1:RecordContent(arg_807_1.text_.text)
			end

			local var_810_17 = math.max(var_810_10, arg_807_1.talkMaxDuration)

			if var_810_9 <= arg_807_1.time_ and arg_807_1.time_ < var_810_9 + var_810_17 then
				arg_807_1.typewritter.percent = (arg_807_1.time_ - var_810_9) / var_810_17

				arg_807_1.typewritter:SetDirty()
			end

			if arg_807_1.time_ >= var_810_9 + var_810_17 and arg_807_1.time_ < var_810_9 + var_810_17 + arg_810_0 then
				arg_807_1.typewritter.percent = 1

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(true)
			end
		end
	end,
	Play910201201 = function(arg_811_0, arg_811_1)
		arg_811_1.time_ = 0
		arg_811_1.frameCnt_ = 0
		arg_811_1.state_ = "playing"
		arg_811_1.curTalkId_ = 910201201
		arg_811_1.duration_ = 5

		SetActive(arg_811_1.tipsGo_, false)

		function arg_811_1.onSingleLineFinish_()
			arg_811_1.onSingleLineUpdate_ = nil
			arg_811_1.onSingleLineFinish_ = nil
			arg_811_1.state_ = "waiting"
		end

		function arg_811_1.playNext_(arg_813_0)
			if arg_813_0 == 1 then
				arg_811_0:Play910201202(arg_811_1)
			end
		end

		function arg_811_1.onSingleLineUpdate_(arg_814_0)
			local var_814_0 = arg_811_1.actors_["1096ui_story"].transform
			local var_814_1 = 0

			if var_814_1 < arg_811_1.time_ and arg_811_1.time_ <= var_814_1 + arg_814_0 then
				arg_811_1.var_.moveOldPos1096ui_story = var_814_0.localPosition
			end

			local var_814_2 = 0.001

			if var_814_1 <= arg_811_1.time_ and arg_811_1.time_ < var_814_1 + var_814_2 then
				local var_814_3 = (arg_811_1.time_ - var_814_1) / var_814_2
				local var_814_4 = Vector3.New(0, -1.13, -5.6)

				var_814_0.localPosition = Vector3.Lerp(arg_811_1.var_.moveOldPos1096ui_story, var_814_4, var_814_3)

				local var_814_5 = manager.ui.mainCamera.transform.position - var_814_0.position

				var_814_0.forward = Vector3.New(var_814_5.x, var_814_5.y, var_814_5.z)

				local var_814_6 = var_814_0.localEulerAngles

				var_814_6.z = 0
				var_814_6.x = 0
				var_814_0.localEulerAngles = var_814_6
			end

			if arg_811_1.time_ >= var_814_1 + var_814_2 and arg_811_1.time_ < var_814_1 + var_814_2 + arg_814_0 then
				var_814_0.localPosition = Vector3.New(0, -1.13, -5.6)

				local var_814_7 = manager.ui.mainCamera.transform.position - var_814_0.position

				var_814_0.forward = Vector3.New(var_814_7.x, var_814_7.y, var_814_7.z)

				local var_814_8 = var_814_0.localEulerAngles

				var_814_8.z = 0
				var_814_8.x = 0
				var_814_0.localEulerAngles = var_814_8
			end

			local var_814_9 = arg_811_1.actors_["1096ui_story"]
			local var_814_10 = 0

			if var_814_10 < arg_811_1.time_ and arg_811_1.time_ <= var_814_10 + arg_814_0 and arg_811_1.var_.characterEffect1096ui_story == nil then
				arg_811_1.var_.characterEffect1096ui_story = var_814_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_814_11 = 0.2

			if var_814_10 <= arg_811_1.time_ and arg_811_1.time_ < var_814_10 + var_814_11 then
				local var_814_12 = (arg_811_1.time_ - var_814_10) / var_814_11

				if arg_811_1.var_.characterEffect1096ui_story then
					arg_811_1.var_.characterEffect1096ui_story.fillFlat = false
				end
			end

			if arg_811_1.time_ >= var_814_10 + var_814_11 and arg_811_1.time_ < var_814_10 + var_814_11 + arg_814_0 and arg_811_1.var_.characterEffect1096ui_story then
				arg_811_1.var_.characterEffect1096ui_story.fillFlat = false
			end

			local var_814_13 = 0

			if var_814_13 < arg_811_1.time_ and arg_811_1.time_ <= var_814_13 + arg_814_0 then
				arg_811_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/1096/1096action/1096action3_1")
			end

			local var_814_14 = 0

			if var_814_14 < arg_811_1.time_ and arg_811_1.time_ <= var_814_14 + arg_814_0 then
				arg_811_1:PlayTimeline("1096ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_814_15 = 0
			local var_814_16 = 0.15

			if var_814_15 < arg_811_1.time_ and arg_811_1.time_ <= var_814_15 + arg_814_0 then
				arg_811_1.talkMaxDuration = 0
				arg_811_1.dialogCg_.alpha = 1

				arg_811_1.dialog_:SetActive(true)
				SetActive(arg_811_1.leftNameGo_, true)

				local var_814_17 = arg_811_1:FormatText(StoryNameCfg[169].name)

				arg_811_1.leftNameTxt_.text = var_814_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_811_1.leftNameTxt_.transform)

				arg_811_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_811_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_811_1:RecordName(arg_811_1.leftNameTxt_.text)
				SetActive(arg_811_1.iconTrs_.gameObject, false)
				arg_811_1.callingController_:SetSelectedState("normal")

				local var_814_18 = arg_811_1:GetWordFromCfg(910201201)
				local var_814_19 = arg_811_1:FormatText(var_814_18.content)

				arg_811_1.text_.text = var_814_19

				LuaForUtil.ClearLinePrefixSymbol(arg_811_1.text_)

				local var_814_20 = 6
				local var_814_21 = utf8.len(var_814_19)
				local var_814_22 = var_814_20 <= 0 and var_814_16 or var_814_16 * (var_814_21 / var_814_20)

				if var_814_22 > 0 and var_814_16 < var_814_22 then
					arg_811_1.talkMaxDuration = var_814_22

					if var_814_22 + var_814_15 > arg_811_1.duration_ then
						arg_811_1.duration_ = var_814_22 + var_814_15
					end
				end

				arg_811_1.text_.text = var_814_19
				arg_811_1.typewritter.percent = 0

				arg_811_1.typewritter:SetDirty()
				arg_811_1:ShowNextGo(false)
				arg_811_1:RecordContent(arg_811_1.text_.text)
			end

			local var_814_23 = math.max(var_814_16, arg_811_1.talkMaxDuration)

			if var_814_15 <= arg_811_1.time_ and arg_811_1.time_ < var_814_15 + var_814_23 then
				arg_811_1.typewritter.percent = (arg_811_1.time_ - var_814_15) / var_814_23

				arg_811_1.typewritter:SetDirty()
			end

			if arg_811_1.time_ >= var_814_15 + var_814_23 and arg_811_1.time_ < var_814_15 + var_814_23 + arg_814_0 then
				arg_811_1.typewritter.percent = 1

				arg_811_1.typewritter:SetDirty()
				arg_811_1:ShowNextGo(true)
			end
		end
	end,
	Play910201202 = function(arg_815_0, arg_815_1)
		arg_815_1.time_ = 0
		arg_815_1.frameCnt_ = 0
		arg_815_1.state_ = "playing"
		arg_815_1.curTalkId_ = 910201202
		arg_815_1.duration_ = 9

		SetActive(arg_815_1.tipsGo_, false)

		function arg_815_1.onSingleLineFinish_()
			arg_815_1.onSingleLineUpdate_ = nil
			arg_815_1.onSingleLineFinish_ = nil
			arg_815_1.state_ = "waiting"
		end

		function arg_815_1.playNext_(arg_817_0)
			if arg_817_0 == 1 then
				arg_815_0:Play910201203(arg_815_1)
			end
		end

		function arg_815_1.onSingleLineUpdate_(arg_818_0)
			local var_818_0 = "HB0101"

			if arg_815_1.bgs_[var_818_0] == nil then
				local var_818_1 = Object.Instantiate(arg_815_1.paintGo_)

				var_818_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_818_0)
				var_818_1.name = var_818_0
				var_818_1.transform.parent = arg_815_1.stage_.transform
				var_818_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_815_1.bgs_[var_818_0] = var_818_1
			end

			local var_818_2 = 2

			if var_818_2 < arg_815_1.time_ and arg_815_1.time_ <= var_818_2 + arg_818_0 then
				local var_818_3 = manager.ui.mainCamera.transform.localPosition
				local var_818_4 = Vector3.New(0, 0, 10) + Vector3.New(var_818_3.x, var_818_3.y, 0)
				local var_818_5 = arg_815_1.bgs_.HB0101

				var_818_5.transform.localPosition = var_818_4
				var_818_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_818_6 = var_818_5:GetComponent("SpriteRenderer")

				if var_818_6 and var_818_6.sprite then
					local var_818_7 = (var_818_5.transform.localPosition - var_818_3).z
					local var_818_8 = manager.ui.mainCameraCom_
					local var_818_9 = 2 * var_818_7 * Mathf.Tan(var_818_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_818_10 = var_818_9 * var_818_8.aspect
					local var_818_11 = var_818_6.sprite.bounds.size.x
					local var_818_12 = var_818_6.sprite.bounds.size.y
					local var_818_13 = var_818_10 / var_818_11
					local var_818_14 = var_818_9 / var_818_12
					local var_818_15 = var_818_14 < var_818_13 and var_818_13 or var_818_14

					var_818_5.transform.localScale = Vector3.New(var_818_15, var_818_15, 0)
				end

				for iter_818_0, iter_818_1 in pairs(arg_815_1.bgs_) do
					if iter_818_0 ~= "HB0101" then
						iter_818_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_818_16 = arg_815_1.actors_["1096ui_story"].transform
			local var_818_17 = 1.966

			if var_818_17 < arg_815_1.time_ and arg_815_1.time_ <= var_818_17 + arg_818_0 then
				arg_815_1.var_.moveOldPos1096ui_story = var_818_16.localPosition
			end

			local var_818_18 = 0.001

			if var_818_17 <= arg_815_1.time_ and arg_815_1.time_ < var_818_17 + var_818_18 then
				local var_818_19 = (arg_815_1.time_ - var_818_17) / var_818_18
				local var_818_20 = Vector3.New(0, 100, 0)

				var_818_16.localPosition = Vector3.Lerp(arg_815_1.var_.moveOldPos1096ui_story, var_818_20, var_818_19)

				local var_818_21 = manager.ui.mainCamera.transform.position - var_818_16.position

				var_818_16.forward = Vector3.New(var_818_21.x, var_818_21.y, var_818_21.z)

				local var_818_22 = var_818_16.localEulerAngles

				var_818_22.z = 0
				var_818_22.x = 0
				var_818_16.localEulerAngles = var_818_22
			end

			if arg_815_1.time_ >= var_818_17 + var_818_18 and arg_815_1.time_ < var_818_17 + var_818_18 + arg_818_0 then
				var_818_16.localPosition = Vector3.New(0, 100, 0)

				local var_818_23 = manager.ui.mainCamera.transform.position - var_818_16.position

				var_818_16.forward = Vector3.New(var_818_23.x, var_818_23.y, var_818_23.z)

				local var_818_24 = var_818_16.localEulerAngles

				var_818_24.z = 0
				var_818_24.x = 0
				var_818_16.localEulerAngles = var_818_24
			end

			local var_818_25 = 0

			if var_818_25 < arg_815_1.time_ and arg_815_1.time_ <= var_818_25 + arg_818_0 then
				arg_815_1.mask_.enabled = true
				arg_815_1.mask_.raycastTarget = true

				arg_815_1:SetGaussion(false)
			end

			local var_818_26 = 2

			if var_818_25 <= arg_815_1.time_ and arg_815_1.time_ < var_818_25 + var_818_26 then
				local var_818_27 = (arg_815_1.time_ - var_818_25) / var_818_26
				local var_818_28 = Color.New(0, 0, 0)

				var_818_28.a = Mathf.Lerp(0, 1, var_818_27)
				arg_815_1.mask_.color = var_818_28
			end

			if arg_815_1.time_ >= var_818_25 + var_818_26 and arg_815_1.time_ < var_818_25 + var_818_26 + arg_818_0 then
				local var_818_29 = Color.New(0, 0, 0)

				var_818_29.a = 1
				arg_815_1.mask_.color = var_818_29
			end

			local var_818_30 = 2

			if var_818_30 < arg_815_1.time_ and arg_815_1.time_ <= var_818_30 + arg_818_0 then
				arg_815_1.mask_.enabled = true
				arg_815_1.mask_.raycastTarget = true

				arg_815_1:SetGaussion(false)
			end

			local var_818_31 = 2

			if var_818_30 <= arg_815_1.time_ and arg_815_1.time_ < var_818_30 + var_818_31 then
				local var_818_32 = (arg_815_1.time_ - var_818_30) / var_818_31
				local var_818_33 = Color.New(0, 0, 0)

				var_818_33.a = Mathf.Lerp(1, 0, var_818_32)
				arg_815_1.mask_.color = var_818_33
			end

			if arg_815_1.time_ >= var_818_30 + var_818_31 and arg_815_1.time_ < var_818_30 + var_818_31 + arg_818_0 then
				local var_818_34 = Color.New(0, 0, 0)
				local var_818_35 = 0

				arg_815_1.mask_.enabled = false
				var_818_34.a = var_818_35
				arg_815_1.mask_.color = var_818_34
			end

			if arg_815_1.frameCnt_ <= 1 then
				arg_815_1.dialog_:SetActive(false)
			end

			local var_818_36 = 4
			local var_818_37 = 0.375

			if var_818_36 < arg_815_1.time_ and arg_815_1.time_ <= var_818_36 + arg_818_0 then
				arg_815_1.talkMaxDuration = 0

				arg_815_1.dialog_:SetActive(true)

				local var_818_38 = LeanTween.value(arg_815_1.dialog_, 0, 1, 0.3)

				var_818_38:setOnUpdate(LuaHelper.FloatAction(function(arg_819_0)
					arg_815_1.dialogCg_.alpha = arg_819_0
				end))
				var_818_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_815_1.dialog_)
					var_818_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_815_1.duration_ = arg_815_1.duration_ + 0.3

				SetActive(arg_815_1.leftNameGo_, true)

				local var_818_39 = arg_815_1:FormatText(StoryNameCfg[8].name)

				arg_815_1.leftNameTxt_.text = var_818_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_815_1.leftNameTxt_.transform)

				arg_815_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_815_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_815_1:RecordName(arg_815_1.leftNameTxt_.text)
				SetActive(arg_815_1.iconTrs_.gameObject, false)
				arg_815_1.callingController_:SetSelectedState("normal")

				local var_818_40 = arg_815_1:GetWordFromCfg(910201202)
				local var_818_41 = arg_815_1:FormatText(var_818_40.content)

				arg_815_1.text_.text = var_818_41

				LuaForUtil.ClearLinePrefixSymbol(arg_815_1.text_)

				local var_818_42 = 15
				local var_818_43 = utf8.len(var_818_41)
				local var_818_44 = var_818_42 <= 0 and var_818_37 or var_818_37 * (var_818_43 / var_818_42)

				if var_818_44 > 0 and var_818_37 < var_818_44 then
					arg_815_1.talkMaxDuration = var_818_44
					var_818_36 = var_818_36 + 0.3

					if var_818_44 + var_818_36 > arg_815_1.duration_ then
						arg_815_1.duration_ = var_818_44 + var_818_36
					end
				end

				arg_815_1.text_.text = var_818_41
				arg_815_1.typewritter.percent = 0

				arg_815_1.typewritter:SetDirty()
				arg_815_1:ShowNextGo(false)
				arg_815_1:RecordContent(arg_815_1.text_.text)
			end

			local var_818_45 = var_818_36 + 0.3
			local var_818_46 = math.max(var_818_37, arg_815_1.talkMaxDuration)

			if var_818_45 <= arg_815_1.time_ and arg_815_1.time_ < var_818_45 + var_818_46 then
				arg_815_1.typewritter.percent = (arg_815_1.time_ - var_818_45) / var_818_46

				arg_815_1.typewritter:SetDirty()
			end

			if arg_815_1.time_ >= var_818_45 + var_818_46 and arg_815_1.time_ < var_818_45 + var_818_46 + arg_818_0 then
				arg_815_1.typewritter.percent = 1

				arg_815_1.typewritter:SetDirty()
				arg_815_1:ShowNextGo(true)
			end
		end
	end,
	Play910201203 = function(arg_821_0, arg_821_1)
		arg_821_1.time_ = 0
		arg_821_1.frameCnt_ = 0
		arg_821_1.state_ = "playing"
		arg_821_1.curTalkId_ = 910201203
		arg_821_1.duration_ = 5

		SetActive(arg_821_1.tipsGo_, false)

		function arg_821_1.onSingleLineFinish_()
			arg_821_1.onSingleLineUpdate_ = nil
			arg_821_1.onSingleLineFinish_ = nil
			arg_821_1.state_ = "waiting"
		end

		function arg_821_1.playNext_(arg_823_0)
			if arg_823_0 == 1 then
				arg_821_0:Play910201204(arg_821_1)
			end
		end

		function arg_821_1.onSingleLineUpdate_(arg_824_0)
			local var_824_0 = 0
			local var_824_1 = 0.8

			if var_824_0 < arg_821_1.time_ and arg_821_1.time_ <= var_824_0 + arg_824_0 then
				arg_821_1.talkMaxDuration = 0
				arg_821_1.dialogCg_.alpha = 1

				arg_821_1.dialog_:SetActive(true)
				SetActive(arg_821_1.leftNameGo_, true)

				local var_824_2 = arg_821_1:FormatText(StoryNameCfg[8].name)

				arg_821_1.leftNameTxt_.text = var_824_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_821_1.leftNameTxt_.transform)

				arg_821_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_821_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_821_1:RecordName(arg_821_1.leftNameTxt_.text)
				SetActive(arg_821_1.iconTrs_.gameObject, false)
				arg_821_1.callingController_:SetSelectedState("normal")

				local var_824_3 = arg_821_1:GetWordFromCfg(910201203)
				local var_824_4 = arg_821_1:FormatText(var_824_3.content)

				arg_821_1.text_.text = var_824_4

				LuaForUtil.ClearLinePrefixSymbol(arg_821_1.text_)

				local var_824_5 = 32
				local var_824_6 = utf8.len(var_824_4)
				local var_824_7 = var_824_5 <= 0 and var_824_1 or var_824_1 * (var_824_6 / var_824_5)

				if var_824_7 > 0 and var_824_1 < var_824_7 then
					arg_821_1.talkMaxDuration = var_824_7

					if var_824_7 + var_824_0 > arg_821_1.duration_ then
						arg_821_1.duration_ = var_824_7 + var_824_0
					end
				end

				arg_821_1.text_.text = var_824_4
				arg_821_1.typewritter.percent = 0

				arg_821_1.typewritter:SetDirty()
				arg_821_1:ShowNextGo(false)
				arg_821_1:RecordContent(arg_821_1.text_.text)
			end

			local var_824_8 = math.max(var_824_1, arg_821_1.talkMaxDuration)

			if var_824_0 <= arg_821_1.time_ and arg_821_1.time_ < var_824_0 + var_824_8 then
				arg_821_1.typewritter.percent = (arg_821_1.time_ - var_824_0) / var_824_8

				arg_821_1.typewritter:SetDirty()
			end

			if arg_821_1.time_ >= var_824_0 + var_824_8 and arg_821_1.time_ < var_824_0 + var_824_8 + arg_824_0 then
				arg_821_1.typewritter.percent = 1

				arg_821_1.typewritter:SetDirty()
				arg_821_1:ShowNextGo(true)
			end
		end
	end,
	Play910201204 = function(arg_825_0, arg_825_1)
		arg_825_1.time_ = 0
		arg_825_1.frameCnt_ = 0
		arg_825_1.state_ = "playing"
		arg_825_1.curTalkId_ = 910201204
		arg_825_1.duration_ = 5

		SetActive(arg_825_1.tipsGo_, false)

		function arg_825_1.onSingleLineFinish_()
			arg_825_1.onSingleLineUpdate_ = nil
			arg_825_1.onSingleLineFinish_ = nil
			arg_825_1.state_ = "waiting"
		end

		function arg_825_1.playNext_(arg_827_0)
			if arg_827_0 == 1 then
				arg_825_0:Play910201205(arg_825_1)
			end
		end

		function arg_825_1.onSingleLineUpdate_(arg_828_0)
			local var_828_0 = 0
			local var_828_1 = 0.55

			if var_828_0 < arg_825_1.time_ and arg_825_1.time_ <= var_828_0 + arg_828_0 then
				arg_825_1.talkMaxDuration = 0
				arg_825_1.dialogCg_.alpha = 1

				arg_825_1.dialog_:SetActive(true)
				SetActive(arg_825_1.leftNameGo_, true)

				local var_828_2 = arg_825_1:FormatText(StoryNameCfg[8].name)

				arg_825_1.leftNameTxt_.text = var_828_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_825_1.leftNameTxt_.transform)

				arg_825_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_825_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_825_1:RecordName(arg_825_1.leftNameTxt_.text)
				SetActive(arg_825_1.iconTrs_.gameObject, false)
				arg_825_1.callingController_:SetSelectedState("normal")

				local var_828_3 = arg_825_1:GetWordFromCfg(910201204)
				local var_828_4 = arg_825_1:FormatText(var_828_3.content)

				arg_825_1.text_.text = var_828_4

				LuaForUtil.ClearLinePrefixSymbol(arg_825_1.text_)

				local var_828_5 = 22
				local var_828_6 = utf8.len(var_828_4)
				local var_828_7 = var_828_5 <= 0 and var_828_1 or var_828_1 * (var_828_6 / var_828_5)

				if var_828_7 > 0 and var_828_1 < var_828_7 then
					arg_825_1.talkMaxDuration = var_828_7

					if var_828_7 + var_828_0 > arg_825_1.duration_ then
						arg_825_1.duration_ = var_828_7 + var_828_0
					end
				end

				arg_825_1.text_.text = var_828_4
				arg_825_1.typewritter.percent = 0

				arg_825_1.typewritter:SetDirty()
				arg_825_1:ShowNextGo(false)
				arg_825_1:RecordContent(arg_825_1.text_.text)
			end

			local var_828_8 = math.max(var_828_1, arg_825_1.talkMaxDuration)

			if var_828_0 <= arg_825_1.time_ and arg_825_1.time_ < var_828_0 + var_828_8 then
				arg_825_1.typewritter.percent = (arg_825_1.time_ - var_828_0) / var_828_8

				arg_825_1.typewritter:SetDirty()
			end

			if arg_825_1.time_ >= var_828_0 + var_828_8 and arg_825_1.time_ < var_828_0 + var_828_8 + arg_828_0 then
				arg_825_1.typewritter.percent = 1

				arg_825_1.typewritter:SetDirty()
				arg_825_1:ShowNextGo(true)
			end
		end
	end,
	Play910201205 = function(arg_829_0, arg_829_1)
		arg_829_1.time_ = 0
		arg_829_1.frameCnt_ = 0
		arg_829_1.state_ = "playing"
		arg_829_1.curTalkId_ = 910201205
		arg_829_1.duration_ = 5

		SetActive(arg_829_1.tipsGo_, false)

		function arg_829_1.onSingleLineFinish_()
			arg_829_1.onSingleLineUpdate_ = nil
			arg_829_1.onSingleLineFinish_ = nil
			arg_829_1.state_ = "waiting"
		end

		function arg_829_1.playNext_(arg_831_0)
			if arg_831_0 == 1 then
				arg_829_0:Play910201206(arg_829_1)
			end
		end

		function arg_829_1.onSingleLineUpdate_(arg_832_0)
			local var_832_0 = 0
			local var_832_1 = 1.075

			if var_832_0 < arg_829_1.time_ and arg_829_1.time_ <= var_832_0 + arg_832_0 then
				arg_829_1.talkMaxDuration = 0
				arg_829_1.dialogCg_.alpha = 1

				arg_829_1.dialog_:SetActive(true)
				SetActive(arg_829_1.leftNameGo_, true)

				local var_832_2 = arg_829_1:FormatText(StoryNameCfg[8].name)

				arg_829_1.leftNameTxt_.text = var_832_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_829_1.leftNameTxt_.transform)

				arg_829_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_829_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_829_1:RecordName(arg_829_1.leftNameTxt_.text)
				SetActive(arg_829_1.iconTrs_.gameObject, false)
				arg_829_1.callingController_:SetSelectedState("normal")

				local var_832_3 = arg_829_1:GetWordFromCfg(910201205)
				local var_832_4 = arg_829_1:FormatText(var_832_3.content)

				arg_829_1.text_.text = var_832_4

				LuaForUtil.ClearLinePrefixSymbol(arg_829_1.text_)

				local var_832_5 = 43
				local var_832_6 = utf8.len(var_832_4)
				local var_832_7 = var_832_5 <= 0 and var_832_1 or var_832_1 * (var_832_6 / var_832_5)

				if var_832_7 > 0 and var_832_1 < var_832_7 then
					arg_829_1.talkMaxDuration = var_832_7

					if var_832_7 + var_832_0 > arg_829_1.duration_ then
						arg_829_1.duration_ = var_832_7 + var_832_0
					end
				end

				arg_829_1.text_.text = var_832_4
				arg_829_1.typewritter.percent = 0

				arg_829_1.typewritter:SetDirty()
				arg_829_1:ShowNextGo(false)
				arg_829_1:RecordContent(arg_829_1.text_.text)
			end

			local var_832_8 = math.max(var_832_1, arg_829_1.talkMaxDuration)

			if var_832_0 <= arg_829_1.time_ and arg_829_1.time_ < var_832_0 + var_832_8 then
				arg_829_1.typewritter.percent = (arg_829_1.time_ - var_832_0) / var_832_8

				arg_829_1.typewritter:SetDirty()
			end

			if arg_829_1.time_ >= var_832_0 + var_832_8 and arg_829_1.time_ < var_832_0 + var_832_8 + arg_832_0 then
				arg_829_1.typewritter.percent = 1

				arg_829_1.typewritter:SetDirty()
				arg_829_1:ShowNextGo(true)
			end
		end
	end,
	Play910201206 = function(arg_833_0, arg_833_1)
		arg_833_1.time_ = 0
		arg_833_1.frameCnt_ = 0
		arg_833_1.state_ = "playing"
		arg_833_1.curTalkId_ = 910201206
		arg_833_1.duration_ = 5

		SetActive(arg_833_1.tipsGo_, false)

		function arg_833_1.onSingleLineFinish_()
			arg_833_1.onSingleLineUpdate_ = nil
			arg_833_1.onSingleLineFinish_ = nil
			arg_833_1.state_ = "waiting"
		end

		function arg_833_1.playNext_(arg_835_0)
			if arg_835_0 == 1 then
				arg_833_0:Play910201207(arg_833_1)
			end
		end

		function arg_833_1.onSingleLineUpdate_(arg_836_0)
			local var_836_0 = 0
			local var_836_1 = 0.8

			if var_836_0 < arg_833_1.time_ and arg_833_1.time_ <= var_836_0 + arg_836_0 then
				arg_833_1.talkMaxDuration = 0
				arg_833_1.dialogCg_.alpha = 1

				arg_833_1.dialog_:SetActive(true)
				SetActive(arg_833_1.leftNameGo_, true)

				local var_836_2 = arg_833_1:FormatText(StoryNameCfg[8].name)

				arg_833_1.leftNameTxt_.text = var_836_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_833_1.leftNameTxt_.transform)

				arg_833_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_833_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_833_1:RecordName(arg_833_1.leftNameTxt_.text)
				SetActive(arg_833_1.iconTrs_.gameObject, false)
				arg_833_1.callingController_:SetSelectedState("normal")

				local var_836_3 = arg_833_1:GetWordFromCfg(910201206)
				local var_836_4 = arg_833_1:FormatText(var_836_3.content)

				arg_833_1.text_.text = var_836_4

				LuaForUtil.ClearLinePrefixSymbol(arg_833_1.text_)

				local var_836_5 = 32
				local var_836_6 = utf8.len(var_836_4)
				local var_836_7 = var_836_5 <= 0 and var_836_1 or var_836_1 * (var_836_6 / var_836_5)

				if var_836_7 > 0 and var_836_1 < var_836_7 then
					arg_833_1.talkMaxDuration = var_836_7

					if var_836_7 + var_836_0 > arg_833_1.duration_ then
						arg_833_1.duration_ = var_836_7 + var_836_0
					end
				end

				arg_833_1.text_.text = var_836_4
				arg_833_1.typewritter.percent = 0

				arg_833_1.typewritter:SetDirty()
				arg_833_1:ShowNextGo(false)
				arg_833_1:RecordContent(arg_833_1.text_.text)
			end

			local var_836_8 = math.max(var_836_1, arg_833_1.talkMaxDuration)

			if var_836_0 <= arg_833_1.time_ and arg_833_1.time_ < var_836_0 + var_836_8 then
				arg_833_1.typewritter.percent = (arg_833_1.time_ - var_836_0) / var_836_8

				arg_833_1.typewritter:SetDirty()
			end

			if arg_833_1.time_ >= var_836_0 + var_836_8 and arg_833_1.time_ < var_836_0 + var_836_8 + arg_836_0 then
				arg_833_1.typewritter.percent = 1

				arg_833_1.typewritter:SetDirty()
				arg_833_1:ShowNextGo(true)
			end
		end
	end,
	Play910201207 = function(arg_837_0, arg_837_1)
		arg_837_1.time_ = 0
		arg_837_1.frameCnt_ = 0
		arg_837_1.state_ = "playing"
		arg_837_1.curTalkId_ = 910201207
		arg_837_1.duration_ = 5

		SetActive(arg_837_1.tipsGo_, false)

		function arg_837_1.onSingleLineFinish_()
			arg_837_1.onSingleLineUpdate_ = nil
			arg_837_1.onSingleLineFinish_ = nil
			arg_837_1.state_ = "waiting"
		end

		function arg_837_1.playNext_(arg_839_0)
			if arg_839_0 == 1 then
				arg_837_0:Play910201208(arg_837_1)
			end
		end

		function arg_837_1.onSingleLineUpdate_(arg_840_0)
			local var_840_0 = 0
			local var_840_1 = 0.975

			if var_840_0 < arg_837_1.time_ and arg_837_1.time_ <= var_840_0 + arg_840_0 then
				arg_837_1.talkMaxDuration = 0
				arg_837_1.dialogCg_.alpha = 1

				arg_837_1.dialog_:SetActive(true)
				SetActive(arg_837_1.leftNameGo_, true)

				local var_840_2 = arg_837_1:FormatText(StoryNameCfg[8].name)

				arg_837_1.leftNameTxt_.text = var_840_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_837_1.leftNameTxt_.transform)

				arg_837_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_837_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_837_1:RecordName(arg_837_1.leftNameTxt_.text)
				SetActive(arg_837_1.iconTrs_.gameObject, false)
				arg_837_1.callingController_:SetSelectedState("normal")

				local var_840_3 = arg_837_1:GetWordFromCfg(910201207)
				local var_840_4 = arg_837_1:FormatText(var_840_3.content)

				arg_837_1.text_.text = var_840_4

				LuaForUtil.ClearLinePrefixSymbol(arg_837_1.text_)

				local var_840_5 = 39
				local var_840_6 = utf8.len(var_840_4)
				local var_840_7 = var_840_5 <= 0 and var_840_1 or var_840_1 * (var_840_6 / var_840_5)

				if var_840_7 > 0 and var_840_1 < var_840_7 then
					arg_837_1.talkMaxDuration = var_840_7

					if var_840_7 + var_840_0 > arg_837_1.duration_ then
						arg_837_1.duration_ = var_840_7 + var_840_0
					end
				end

				arg_837_1.text_.text = var_840_4
				arg_837_1.typewritter.percent = 0

				arg_837_1.typewritter:SetDirty()
				arg_837_1:ShowNextGo(false)
				arg_837_1:RecordContent(arg_837_1.text_.text)
			end

			local var_840_8 = math.max(var_840_1, arg_837_1.talkMaxDuration)

			if var_840_0 <= arg_837_1.time_ and arg_837_1.time_ < var_840_0 + var_840_8 then
				arg_837_1.typewritter.percent = (arg_837_1.time_ - var_840_0) / var_840_8

				arg_837_1.typewritter:SetDirty()
			end

			if arg_837_1.time_ >= var_840_0 + var_840_8 and arg_837_1.time_ < var_840_0 + var_840_8 + arg_840_0 then
				arg_837_1.typewritter.percent = 1

				arg_837_1.typewritter:SetDirty()
				arg_837_1:ShowNextGo(true)
			end
		end
	end,
	Play910201208 = function(arg_841_0, arg_841_1)
		arg_841_1.time_ = 0
		arg_841_1.frameCnt_ = 0
		arg_841_1.state_ = "playing"
		arg_841_1.curTalkId_ = 910201208
		arg_841_1.duration_ = 5

		SetActive(arg_841_1.tipsGo_, false)

		function arg_841_1.onSingleLineFinish_()
			arg_841_1.onSingleLineUpdate_ = nil
			arg_841_1.onSingleLineFinish_ = nil
			arg_841_1.state_ = "waiting"
		end

		function arg_841_1.playNext_(arg_843_0)
			if arg_843_0 == 1 then
				arg_841_0:Play910201209(arg_841_1)
			end
		end

		function arg_841_1.onSingleLineUpdate_(arg_844_0)
			local var_844_0 = 0
			local var_844_1 = 0.2

			if var_844_0 < arg_841_1.time_ and arg_841_1.time_ <= var_844_0 + arg_844_0 then
				arg_841_1.talkMaxDuration = 0
				arg_841_1.dialogCg_.alpha = 1

				arg_841_1.dialog_:SetActive(true)
				SetActive(arg_841_1.leftNameGo_, true)

				local var_844_2 = arg_841_1:FormatText(StoryNameCfg[13].name)

				arg_841_1.leftNameTxt_.text = var_844_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_841_1.leftNameTxt_.transform)

				arg_841_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_841_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_841_1:RecordName(arg_841_1.leftNameTxt_.text)
				SetActive(arg_841_1.iconTrs_.gameObject, false)
				arg_841_1.callingController_:SetSelectedState("normal")

				local var_844_3 = arg_841_1:GetWordFromCfg(910201208)
				local var_844_4 = arg_841_1:FormatText(var_844_3.content)

				arg_841_1.text_.text = var_844_4

				LuaForUtil.ClearLinePrefixSymbol(arg_841_1.text_)

				local var_844_5 = 8
				local var_844_6 = utf8.len(var_844_4)
				local var_844_7 = var_844_5 <= 0 and var_844_1 or var_844_1 * (var_844_6 / var_844_5)

				if var_844_7 > 0 and var_844_1 < var_844_7 then
					arg_841_1.talkMaxDuration = var_844_7

					if var_844_7 + var_844_0 > arg_841_1.duration_ then
						arg_841_1.duration_ = var_844_7 + var_844_0
					end
				end

				arg_841_1.text_.text = var_844_4
				arg_841_1.typewritter.percent = 0

				arg_841_1.typewritter:SetDirty()
				arg_841_1:ShowNextGo(false)
				arg_841_1:RecordContent(arg_841_1.text_.text)
			end

			local var_844_8 = math.max(var_844_1, arg_841_1.talkMaxDuration)

			if var_844_0 <= arg_841_1.time_ and arg_841_1.time_ < var_844_0 + var_844_8 then
				arg_841_1.typewritter.percent = (arg_841_1.time_ - var_844_0) / var_844_8

				arg_841_1.typewritter:SetDirty()
			end

			if arg_841_1.time_ >= var_844_0 + var_844_8 and arg_841_1.time_ < var_844_0 + var_844_8 + arg_844_0 then
				arg_841_1.typewritter.percent = 1

				arg_841_1.typewritter:SetDirty()
				arg_841_1:ShowNextGo(true)
			end
		end
	end,
	Play910201209 = function(arg_845_0, arg_845_1)
		arg_845_1.time_ = 0
		arg_845_1.frameCnt_ = 0
		arg_845_1.state_ = "playing"
		arg_845_1.curTalkId_ = 910201209
		arg_845_1.duration_ = 5

		SetActive(arg_845_1.tipsGo_, false)

		function arg_845_1.onSingleLineFinish_()
			arg_845_1.onSingleLineUpdate_ = nil
			arg_845_1.onSingleLineFinish_ = nil
			arg_845_1.state_ = "waiting"
		end

		function arg_845_1.playNext_(arg_847_0)
			if arg_847_0 == 1 then
				arg_845_0:Play910201210(arg_845_1)
			end
		end

		function arg_845_1.onSingleLineUpdate_(arg_848_0)
			local var_848_0 = 0
			local var_848_1 = 0.175

			if var_848_0 < arg_845_1.time_ and arg_845_1.time_ <= var_848_0 + arg_848_0 then
				arg_845_1.talkMaxDuration = 0
				arg_845_1.dialogCg_.alpha = 1

				arg_845_1.dialog_:SetActive(true)
				SetActive(arg_845_1.leftNameGo_, true)

				local var_848_2 = arg_845_1:FormatText(StoryNameCfg[8].name)

				arg_845_1.leftNameTxt_.text = var_848_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_845_1.leftNameTxt_.transform)

				arg_845_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_845_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_845_1:RecordName(arg_845_1.leftNameTxt_.text)
				SetActive(arg_845_1.iconTrs_.gameObject, false)
				arg_845_1.callingController_:SetSelectedState("normal")

				local var_848_3 = arg_845_1:GetWordFromCfg(910201209)
				local var_848_4 = arg_845_1:FormatText(var_848_3.content)

				arg_845_1.text_.text = var_848_4

				LuaForUtil.ClearLinePrefixSymbol(arg_845_1.text_)

				local var_848_5 = 7
				local var_848_6 = utf8.len(var_848_4)
				local var_848_7 = var_848_5 <= 0 and var_848_1 or var_848_1 * (var_848_6 / var_848_5)

				if var_848_7 > 0 and var_848_1 < var_848_7 then
					arg_845_1.talkMaxDuration = var_848_7

					if var_848_7 + var_848_0 > arg_845_1.duration_ then
						arg_845_1.duration_ = var_848_7 + var_848_0
					end
				end

				arg_845_1.text_.text = var_848_4
				arg_845_1.typewritter.percent = 0

				arg_845_1.typewritter:SetDirty()
				arg_845_1:ShowNextGo(false)
				arg_845_1:RecordContent(arg_845_1.text_.text)
			end

			local var_848_8 = math.max(var_848_1, arg_845_1.talkMaxDuration)

			if var_848_0 <= arg_845_1.time_ and arg_845_1.time_ < var_848_0 + var_848_8 then
				arg_845_1.typewritter.percent = (arg_845_1.time_ - var_848_0) / var_848_8

				arg_845_1.typewritter:SetDirty()
			end

			if arg_845_1.time_ >= var_848_0 + var_848_8 and arg_845_1.time_ < var_848_0 + var_848_8 + arg_848_0 then
				arg_845_1.typewritter.percent = 1

				arg_845_1.typewritter:SetDirty()
				arg_845_1:ShowNextGo(true)
			end
		end
	end,
	Play910201210 = function(arg_849_0, arg_849_1)
		arg_849_1.time_ = 0
		arg_849_1.frameCnt_ = 0
		arg_849_1.state_ = "playing"
		arg_849_1.curTalkId_ = 910201210
		arg_849_1.duration_ = 5

		SetActive(arg_849_1.tipsGo_, false)

		function arg_849_1.onSingleLineFinish_()
			arg_849_1.onSingleLineUpdate_ = nil
			arg_849_1.onSingleLineFinish_ = nil
			arg_849_1.state_ = "waiting"
		end

		function arg_849_1.playNext_(arg_851_0)
			if arg_851_0 == 1 then
				arg_849_0:Play910201211(arg_849_1)
			end
		end

		function arg_849_1.onSingleLineUpdate_(arg_852_0)
			local var_852_0 = 0
			local var_852_1 = 0.7

			if var_852_0 < arg_849_1.time_ and arg_849_1.time_ <= var_852_0 + arg_852_0 then
				arg_849_1.talkMaxDuration = 0
				arg_849_1.dialogCg_.alpha = 1

				arg_849_1.dialog_:SetActive(true)
				SetActive(arg_849_1.leftNameGo_, true)

				local var_852_2 = arg_849_1:FormatText(StoryNameCfg[13].name)

				arg_849_1.leftNameTxt_.text = var_852_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_849_1.leftNameTxt_.transform)

				arg_849_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_849_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_849_1:RecordName(arg_849_1.leftNameTxt_.text)
				SetActive(arg_849_1.iconTrs_.gameObject, false)
				arg_849_1.callingController_:SetSelectedState("normal")

				local var_852_3 = arg_849_1:GetWordFromCfg(910201210)
				local var_852_4 = arg_849_1:FormatText(var_852_3.content)

				arg_849_1.text_.text = var_852_4

				LuaForUtil.ClearLinePrefixSymbol(arg_849_1.text_)

				local var_852_5 = 28
				local var_852_6 = utf8.len(var_852_4)
				local var_852_7 = var_852_5 <= 0 and var_852_1 or var_852_1 * (var_852_6 / var_852_5)

				if var_852_7 > 0 and var_852_1 < var_852_7 then
					arg_849_1.talkMaxDuration = var_852_7

					if var_852_7 + var_852_0 > arg_849_1.duration_ then
						arg_849_1.duration_ = var_852_7 + var_852_0
					end
				end

				arg_849_1.text_.text = var_852_4
				arg_849_1.typewritter.percent = 0

				arg_849_1.typewritter:SetDirty()
				arg_849_1:ShowNextGo(false)
				arg_849_1:RecordContent(arg_849_1.text_.text)
			end

			local var_852_8 = math.max(var_852_1, arg_849_1.talkMaxDuration)

			if var_852_0 <= arg_849_1.time_ and arg_849_1.time_ < var_852_0 + var_852_8 then
				arg_849_1.typewritter.percent = (arg_849_1.time_ - var_852_0) / var_852_8

				arg_849_1.typewritter:SetDirty()
			end

			if arg_849_1.time_ >= var_852_0 + var_852_8 and arg_849_1.time_ < var_852_0 + var_852_8 + arg_852_0 then
				arg_849_1.typewritter.percent = 1

				arg_849_1.typewritter:SetDirty()
				arg_849_1:ShowNextGo(true)
			end
		end
	end,
	Play910201211 = function(arg_853_0, arg_853_1)
		arg_853_1.time_ = 0
		arg_853_1.frameCnt_ = 0
		arg_853_1.state_ = "playing"
		arg_853_1.curTalkId_ = 910201211
		arg_853_1.duration_ = 5

		SetActive(arg_853_1.tipsGo_, false)

		function arg_853_1.onSingleLineFinish_()
			arg_853_1.onSingleLineUpdate_ = nil
			arg_853_1.onSingleLineFinish_ = nil
			arg_853_1.state_ = "waiting"
		end

		function arg_853_1.playNext_(arg_855_0)
			if arg_855_0 == 1 then
				arg_853_0:Play910201212(arg_853_1)
			end
		end

		function arg_853_1.onSingleLineUpdate_(arg_856_0)
			local var_856_0 = 0
			local var_856_1 = 0.5

			if var_856_0 < arg_853_1.time_ and arg_853_1.time_ <= var_856_0 + arg_856_0 then
				arg_853_1.talkMaxDuration = 0
				arg_853_1.dialogCg_.alpha = 1

				arg_853_1.dialog_:SetActive(true)
				SetActive(arg_853_1.leftNameGo_, true)

				local var_856_2 = arg_853_1:FormatText(StoryNameCfg[8].name)

				arg_853_1.leftNameTxt_.text = var_856_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_853_1.leftNameTxt_.transform)

				arg_853_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_853_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_853_1:RecordName(arg_853_1.leftNameTxt_.text)
				SetActive(arg_853_1.iconTrs_.gameObject, false)
				arg_853_1.callingController_:SetSelectedState("normal")

				local var_856_3 = arg_853_1:GetWordFromCfg(910201211)
				local var_856_4 = arg_853_1:FormatText(var_856_3.content)

				arg_853_1.text_.text = var_856_4

				LuaForUtil.ClearLinePrefixSymbol(arg_853_1.text_)

				local var_856_5 = 21
				local var_856_6 = utf8.len(var_856_4)
				local var_856_7 = var_856_5 <= 0 and var_856_1 or var_856_1 * (var_856_6 / var_856_5)

				if var_856_7 > 0 and var_856_1 < var_856_7 then
					arg_853_1.talkMaxDuration = var_856_7

					if var_856_7 + var_856_0 > arg_853_1.duration_ then
						arg_853_1.duration_ = var_856_7 + var_856_0
					end
				end

				arg_853_1.text_.text = var_856_4
				arg_853_1.typewritter.percent = 0

				arg_853_1.typewritter:SetDirty()
				arg_853_1:ShowNextGo(false)
				arg_853_1:RecordContent(arg_853_1.text_.text)
			end

			local var_856_8 = math.max(var_856_1, arg_853_1.talkMaxDuration)

			if var_856_0 <= arg_853_1.time_ and arg_853_1.time_ < var_856_0 + var_856_8 then
				arg_853_1.typewritter.percent = (arg_853_1.time_ - var_856_0) / var_856_8

				arg_853_1.typewritter:SetDirty()
			end

			if arg_853_1.time_ >= var_856_0 + var_856_8 and arg_853_1.time_ < var_856_0 + var_856_8 + arg_856_0 then
				arg_853_1.typewritter.percent = 1

				arg_853_1.typewritter:SetDirty()
				arg_853_1:ShowNextGo(true)
			end
		end
	end,
	Play910201212 = function(arg_857_0, arg_857_1)
		arg_857_1.time_ = 0
		arg_857_1.frameCnt_ = 0
		arg_857_1.state_ = "playing"
		arg_857_1.curTalkId_ = 910201212
		arg_857_1.duration_ = 9

		SetActive(arg_857_1.tipsGo_, false)

		function arg_857_1.onSingleLineFinish_()
			arg_857_1.onSingleLineUpdate_ = nil
			arg_857_1.onSingleLineFinish_ = nil
			arg_857_1.state_ = "waiting"
		end

		function arg_857_1.playNext_(arg_859_0)
			if arg_859_0 == 1 then
				arg_857_0:Play910201213(arg_857_1)
			end
		end

		function arg_857_1.onSingleLineUpdate_(arg_860_0)
			local var_860_0 = arg_857_1.actors_["1039ui_story"].transform
			local var_860_1 = 3.8

			if var_860_1 < arg_857_1.time_ and arg_857_1.time_ <= var_860_1 + arg_860_0 then
				arg_857_1.var_.moveOldPos1039ui_story = var_860_0.localPosition
			end

			local var_860_2 = 0.001

			if var_860_1 <= arg_857_1.time_ and arg_857_1.time_ < var_860_1 + var_860_2 then
				local var_860_3 = (arg_857_1.time_ - var_860_1) / var_860_2
				local var_860_4 = Vector3.New(0, -1.01, -5.9)

				var_860_0.localPosition = Vector3.Lerp(arg_857_1.var_.moveOldPos1039ui_story, var_860_4, var_860_3)

				local var_860_5 = manager.ui.mainCamera.transform.position - var_860_0.position

				var_860_0.forward = Vector3.New(var_860_5.x, var_860_5.y, var_860_5.z)

				local var_860_6 = var_860_0.localEulerAngles

				var_860_6.z = 0
				var_860_6.x = 0
				var_860_0.localEulerAngles = var_860_6
			end

			if arg_857_1.time_ >= var_860_1 + var_860_2 and arg_857_1.time_ < var_860_1 + var_860_2 + arg_860_0 then
				var_860_0.localPosition = Vector3.New(0, -1.01, -5.9)

				local var_860_7 = manager.ui.mainCamera.transform.position - var_860_0.position

				var_860_0.forward = Vector3.New(var_860_7.x, var_860_7.y, var_860_7.z)

				local var_860_8 = var_860_0.localEulerAngles

				var_860_8.z = 0
				var_860_8.x = 0
				var_860_0.localEulerAngles = var_860_8
			end

			local var_860_9 = 3.8

			if var_860_9 < arg_857_1.time_ and arg_857_1.time_ <= var_860_9 + arg_860_0 then
				arg_857_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_860_10 = 3.8

			if var_860_10 < arg_857_1.time_ and arg_857_1.time_ <= var_860_10 + arg_860_0 then
				arg_857_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_860_11 = arg_857_1.actors_["1039ui_story"]
			local var_860_12 = 3.8

			if var_860_12 < arg_857_1.time_ and arg_857_1.time_ <= var_860_12 + arg_860_0 and arg_857_1.var_.characterEffect1039ui_story == nil then
				arg_857_1.var_.characterEffect1039ui_story = var_860_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_860_13 = 0.2

			if var_860_12 <= arg_857_1.time_ and arg_857_1.time_ < var_860_12 + var_860_13 then
				local var_860_14 = (arg_857_1.time_ - var_860_12) / var_860_13

				if arg_857_1.var_.characterEffect1039ui_story then
					arg_857_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_857_1.time_ >= var_860_12 + var_860_13 and arg_857_1.time_ < var_860_12 + var_860_13 + arg_860_0 and arg_857_1.var_.characterEffect1039ui_story then
				arg_857_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_860_15 = 0

			if var_860_15 < arg_857_1.time_ and arg_857_1.time_ <= var_860_15 + arg_860_0 then
				arg_857_1.mask_.enabled = true
				arg_857_1.mask_.raycastTarget = true

				arg_857_1:SetGaussion(false)
			end

			local var_860_16 = 2

			if var_860_15 <= arg_857_1.time_ and arg_857_1.time_ < var_860_15 + var_860_16 then
				local var_860_17 = (arg_857_1.time_ - var_860_15) / var_860_16
				local var_860_18 = Color.New(0, 0, 0)

				var_860_18.a = Mathf.Lerp(0, 1, var_860_17)
				arg_857_1.mask_.color = var_860_18
			end

			if arg_857_1.time_ >= var_860_15 + var_860_16 and arg_857_1.time_ < var_860_15 + var_860_16 + arg_860_0 then
				local var_860_19 = Color.New(0, 0, 0)

				var_860_19.a = 1
				arg_857_1.mask_.color = var_860_19
			end

			local var_860_20 = 2

			if var_860_20 < arg_857_1.time_ and arg_857_1.time_ <= var_860_20 + arg_860_0 then
				arg_857_1.mask_.enabled = true
				arg_857_1.mask_.raycastTarget = true

				arg_857_1:SetGaussion(false)
			end

			local var_860_21 = 2

			if var_860_20 <= arg_857_1.time_ and arg_857_1.time_ < var_860_20 + var_860_21 then
				local var_860_22 = (arg_857_1.time_ - var_860_20) / var_860_21
				local var_860_23 = Color.New(0, 0, 0)

				var_860_23.a = Mathf.Lerp(1, 0, var_860_22)
				arg_857_1.mask_.color = var_860_23
			end

			if arg_857_1.time_ >= var_860_20 + var_860_21 and arg_857_1.time_ < var_860_20 + var_860_21 + arg_860_0 then
				local var_860_24 = Color.New(0, 0, 0)
				local var_860_25 = 0

				arg_857_1.mask_.enabled = false
				var_860_24.a = var_860_25
				arg_857_1.mask_.color = var_860_24
			end

			local var_860_26 = 2

			if var_860_26 < arg_857_1.time_ and arg_857_1.time_ <= var_860_26 + arg_860_0 then
				local var_860_27 = manager.ui.mainCamera.transform.localPosition
				local var_860_28 = Vector3.New(0, 0, 10) + Vector3.New(var_860_27.x, var_860_27.y, 0)
				local var_860_29 = arg_857_1.bgs_.ST05

				var_860_29.transform.localPosition = var_860_28
				var_860_29.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_860_30 = var_860_29:GetComponent("SpriteRenderer")

				if var_860_30 and var_860_30.sprite then
					local var_860_31 = (var_860_29.transform.localPosition - var_860_27).z
					local var_860_32 = manager.ui.mainCameraCom_
					local var_860_33 = 2 * var_860_31 * Mathf.Tan(var_860_32.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_860_34 = var_860_33 * var_860_32.aspect
					local var_860_35 = var_860_30.sprite.bounds.size.x
					local var_860_36 = var_860_30.sprite.bounds.size.y
					local var_860_37 = var_860_34 / var_860_35
					local var_860_38 = var_860_33 / var_860_36
					local var_860_39 = var_860_38 < var_860_37 and var_860_37 or var_860_38

					var_860_29.transform.localScale = Vector3.New(var_860_39, var_860_39, 0)
				end

				for iter_860_0, iter_860_1 in pairs(arg_857_1.bgs_) do
					if iter_860_0 ~= "ST05" then
						iter_860_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_860_40 = 4
			local var_860_41 = 0.975

			if var_860_40 < arg_857_1.time_ and arg_857_1.time_ <= var_860_40 + arg_860_0 then
				arg_857_1.talkMaxDuration = 0
				arg_857_1.dialogCg_.alpha = 1

				arg_857_1.dialog_:SetActive(true)
				SetActive(arg_857_1.leftNameGo_, true)

				local var_860_42 = arg_857_1:FormatText(StoryNameCfg[9].name)

				arg_857_1.leftNameTxt_.text = var_860_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_857_1.leftNameTxt_.transform)

				arg_857_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_857_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_857_1:RecordName(arg_857_1.leftNameTxt_.text)
				SetActive(arg_857_1.iconTrs_.gameObject, false)
				arg_857_1.callingController_:SetSelectedState("normal")

				local var_860_43 = arg_857_1:GetWordFromCfg(910201212)
				local var_860_44 = arg_857_1:FormatText(var_860_43.content)

				arg_857_1.text_.text = var_860_44

				LuaForUtil.ClearLinePrefixSymbol(arg_857_1.text_)

				local var_860_45 = 39
				local var_860_46 = utf8.len(var_860_44)
				local var_860_47 = var_860_45 <= 0 and var_860_41 or var_860_41 * (var_860_46 / var_860_45)

				if var_860_47 > 0 and var_860_41 < var_860_47 then
					arg_857_1.talkMaxDuration = var_860_47

					if var_860_47 + var_860_40 > arg_857_1.duration_ then
						arg_857_1.duration_ = var_860_47 + var_860_40
					end
				end

				arg_857_1.text_.text = var_860_44
				arg_857_1.typewritter.percent = 0

				arg_857_1.typewritter:SetDirty()
				arg_857_1:ShowNextGo(false)
				arg_857_1:RecordContent(arg_857_1.text_.text)
			end

			local var_860_48 = math.max(var_860_41, arg_857_1.talkMaxDuration)

			if var_860_40 <= arg_857_1.time_ and arg_857_1.time_ < var_860_40 + var_860_48 then
				arg_857_1.typewritter.percent = (arg_857_1.time_ - var_860_40) / var_860_48

				arg_857_1.typewritter:SetDirty()
			end

			if arg_857_1.time_ >= var_860_40 + var_860_48 and arg_857_1.time_ < var_860_40 + var_860_48 + arg_860_0 then
				arg_857_1.typewritter.percent = 1

				arg_857_1.typewritter:SetDirty()
				arg_857_1:ShowNextGo(true)
			end
		end
	end,
	Play910201213 = function(arg_861_0, arg_861_1)
		arg_861_1.time_ = 0
		arg_861_1.frameCnt_ = 0
		arg_861_1.state_ = "playing"
		arg_861_1.curTalkId_ = 910201213
		arg_861_1.duration_ = 5

		SetActive(arg_861_1.tipsGo_, false)

		function arg_861_1.onSingleLineFinish_()
			arg_861_1.onSingleLineUpdate_ = nil
			arg_861_1.onSingleLineFinish_ = nil
			arg_861_1.state_ = "waiting"
		end

		function arg_861_1.playNext_(arg_863_0)
			if arg_863_0 == 1 then
				arg_861_0:Play910201214(arg_861_1)
			end
		end

		function arg_861_1.onSingleLineUpdate_(arg_864_0)
			local var_864_0 = 0

			if var_864_0 < arg_861_1.time_ and arg_861_1.time_ <= var_864_0 + arg_864_0 then
				arg_861_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action425")
			end

			local var_864_1 = 0

			if var_864_1 < arg_861_1.time_ and arg_861_1.time_ <= var_864_1 + arg_864_0 then
				arg_861_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_864_2 = 0
			local var_864_3 = 0.575

			if var_864_2 < arg_861_1.time_ and arg_861_1.time_ <= var_864_2 + arg_864_0 then
				arg_861_1.talkMaxDuration = 0
				arg_861_1.dialogCg_.alpha = 1

				arg_861_1.dialog_:SetActive(true)
				SetActive(arg_861_1.leftNameGo_, true)

				local var_864_4 = arg_861_1:FormatText(StoryNameCfg[9].name)

				arg_861_1.leftNameTxt_.text = var_864_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_861_1.leftNameTxt_.transform)

				arg_861_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_861_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_861_1:RecordName(arg_861_1.leftNameTxt_.text)
				SetActive(arg_861_1.iconTrs_.gameObject, false)
				arg_861_1.callingController_:SetSelectedState("normal")

				local var_864_5 = arg_861_1:GetWordFromCfg(910201213)
				local var_864_6 = arg_861_1:FormatText(var_864_5.content)

				arg_861_1.text_.text = var_864_6

				LuaForUtil.ClearLinePrefixSymbol(arg_861_1.text_)

				local var_864_7 = 23
				local var_864_8 = utf8.len(var_864_6)
				local var_864_9 = var_864_7 <= 0 and var_864_3 or var_864_3 * (var_864_8 / var_864_7)

				if var_864_9 > 0 and var_864_3 < var_864_9 then
					arg_861_1.talkMaxDuration = var_864_9

					if var_864_9 + var_864_2 > arg_861_1.duration_ then
						arg_861_1.duration_ = var_864_9 + var_864_2
					end
				end

				arg_861_1.text_.text = var_864_6
				arg_861_1.typewritter.percent = 0

				arg_861_1.typewritter:SetDirty()
				arg_861_1:ShowNextGo(false)
				arg_861_1:RecordContent(arg_861_1.text_.text)
			end

			local var_864_10 = math.max(var_864_3, arg_861_1.talkMaxDuration)

			if var_864_2 <= arg_861_1.time_ and arg_861_1.time_ < var_864_2 + var_864_10 then
				arg_861_1.typewritter.percent = (arg_861_1.time_ - var_864_2) / var_864_10

				arg_861_1.typewritter:SetDirty()
			end

			if arg_861_1.time_ >= var_864_2 + var_864_10 and arg_861_1.time_ < var_864_2 + var_864_10 + arg_864_0 then
				arg_861_1.typewritter.percent = 1

				arg_861_1.typewritter:SetDirty()
				arg_861_1:ShowNextGo(true)
			end
		end
	end,
	Play910201214 = function(arg_865_0, arg_865_1)
		arg_865_1.time_ = 0
		arg_865_1.frameCnt_ = 0
		arg_865_1.state_ = "playing"
		arg_865_1.curTalkId_ = 910201214
		arg_865_1.duration_ = 5

		SetActive(arg_865_1.tipsGo_, false)

		function arg_865_1.onSingleLineFinish_()
			arg_865_1.onSingleLineUpdate_ = nil
			arg_865_1.onSingleLineFinish_ = nil
			arg_865_1.state_ = "waiting"
		end

		function arg_865_1.playNext_(arg_867_0)
			if arg_867_0 == 1 then
				arg_865_0:Play910201215(arg_865_1)
			end
		end

		function arg_865_1.onSingleLineUpdate_(arg_868_0)
			local var_868_0 = arg_865_1.actors_["1039ui_story"]
			local var_868_1 = 0

			if var_868_1 < arg_865_1.time_ and arg_865_1.time_ <= var_868_1 + arg_868_0 and arg_865_1.var_.characterEffect1039ui_story == nil then
				arg_865_1.var_.characterEffect1039ui_story = var_868_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_868_2 = 0.2

			if var_868_1 <= arg_865_1.time_ and arg_865_1.time_ < var_868_1 + var_868_2 then
				local var_868_3 = (arg_865_1.time_ - var_868_1) / var_868_2

				if arg_865_1.var_.characterEffect1039ui_story then
					local var_868_4 = Mathf.Lerp(0, 0.5, var_868_3)

					arg_865_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_865_1.var_.characterEffect1039ui_story.fillRatio = var_868_4
				end
			end

			if arg_865_1.time_ >= var_868_1 + var_868_2 and arg_865_1.time_ < var_868_1 + var_868_2 + arg_868_0 and arg_865_1.var_.characterEffect1039ui_story then
				local var_868_5 = 0.5

				arg_865_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_865_1.var_.characterEffect1039ui_story.fillRatio = var_868_5
			end

			local var_868_6 = 0
			local var_868_7 = 0.35

			if var_868_6 < arg_865_1.time_ and arg_865_1.time_ <= var_868_6 + arg_868_0 then
				arg_865_1.talkMaxDuration = 0
				arg_865_1.dialogCg_.alpha = 1

				arg_865_1.dialog_:SetActive(true)
				SetActive(arg_865_1.leftNameGo_, true)

				local var_868_8 = arg_865_1:FormatText(StoryNameCfg[7].name)

				arg_865_1.leftNameTxt_.text = var_868_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_865_1.leftNameTxt_.transform)

				arg_865_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_865_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_865_1:RecordName(arg_865_1.leftNameTxt_.text)
				SetActive(arg_865_1.iconTrs_.gameObject, false)
				arg_865_1.callingController_:SetSelectedState("normal")

				local var_868_9 = arg_865_1:GetWordFromCfg(910201214)
				local var_868_10 = arg_865_1:FormatText(var_868_9.content)

				arg_865_1.text_.text = var_868_10

				LuaForUtil.ClearLinePrefixSymbol(arg_865_1.text_)

				local var_868_11 = 14
				local var_868_12 = utf8.len(var_868_10)
				local var_868_13 = var_868_11 <= 0 and var_868_7 or var_868_7 * (var_868_12 / var_868_11)

				if var_868_13 > 0 and var_868_7 < var_868_13 then
					arg_865_1.talkMaxDuration = var_868_13

					if var_868_13 + var_868_6 > arg_865_1.duration_ then
						arg_865_1.duration_ = var_868_13 + var_868_6
					end
				end

				arg_865_1.text_.text = var_868_10
				arg_865_1.typewritter.percent = 0

				arg_865_1.typewritter:SetDirty()
				arg_865_1:ShowNextGo(false)
				arg_865_1:RecordContent(arg_865_1.text_.text)
			end

			local var_868_14 = math.max(var_868_7, arg_865_1.talkMaxDuration)

			if var_868_6 <= arg_865_1.time_ and arg_865_1.time_ < var_868_6 + var_868_14 then
				arg_865_1.typewritter.percent = (arg_865_1.time_ - var_868_6) / var_868_14

				arg_865_1.typewritter:SetDirty()
			end

			if arg_865_1.time_ >= var_868_6 + var_868_14 and arg_865_1.time_ < var_868_6 + var_868_14 + arg_868_0 then
				arg_865_1.typewritter.percent = 1

				arg_865_1.typewritter:SetDirty()
				arg_865_1:ShowNextGo(true)
			end
		end
	end,
	Play910201215 = function(arg_869_0, arg_869_1)
		arg_869_1.time_ = 0
		arg_869_1.frameCnt_ = 0
		arg_869_1.state_ = "playing"
		arg_869_1.curTalkId_ = 910201215
		arg_869_1.duration_ = 5

		SetActive(arg_869_1.tipsGo_, false)

		function arg_869_1.onSingleLineFinish_()
			arg_869_1.onSingleLineUpdate_ = nil
			arg_869_1.onSingleLineFinish_ = nil
			arg_869_1.state_ = "waiting"
		end

		function arg_869_1.playNext_(arg_871_0)
			if arg_871_0 == 1 then
				arg_869_0:Play910201216(arg_869_1)
			end
		end

		function arg_869_1.onSingleLineUpdate_(arg_872_0)
			local var_872_0 = arg_869_1.actors_["1039ui_story"]
			local var_872_1 = 0

			if var_872_1 < arg_869_1.time_ and arg_869_1.time_ <= var_872_1 + arg_872_0 and arg_869_1.var_.characterEffect1039ui_story == nil then
				arg_869_1.var_.characterEffect1039ui_story = var_872_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_872_2 = 0.2

			if var_872_1 <= arg_869_1.time_ and arg_869_1.time_ < var_872_1 + var_872_2 then
				local var_872_3 = (arg_869_1.time_ - var_872_1) / var_872_2

				if arg_869_1.var_.characterEffect1039ui_story then
					arg_869_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_869_1.time_ >= var_872_1 + var_872_2 and arg_869_1.time_ < var_872_1 + var_872_2 + arg_872_0 and arg_869_1.var_.characterEffect1039ui_story then
				arg_869_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_872_4 = 0

			if var_872_4 < arg_869_1.time_ and arg_869_1.time_ <= var_872_4 + arg_872_0 then
				arg_869_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action454")
			end

			local var_872_5 = 0

			if var_872_5 < arg_869_1.time_ and arg_869_1.time_ <= var_872_5 + arg_872_0 then
				arg_869_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_872_6 = 0
			local var_872_7 = 0.25

			if var_872_6 < arg_869_1.time_ and arg_869_1.time_ <= var_872_6 + arg_872_0 then
				arg_869_1.talkMaxDuration = 0
				arg_869_1.dialogCg_.alpha = 1

				arg_869_1.dialog_:SetActive(true)
				SetActive(arg_869_1.leftNameGo_, true)

				local var_872_8 = arg_869_1:FormatText(StoryNameCfg[9].name)

				arg_869_1.leftNameTxt_.text = var_872_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_869_1.leftNameTxt_.transform)

				arg_869_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_869_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_869_1:RecordName(arg_869_1.leftNameTxt_.text)
				SetActive(arg_869_1.iconTrs_.gameObject, false)
				arg_869_1.callingController_:SetSelectedState("normal")

				local var_872_9 = arg_869_1:GetWordFromCfg(910201215)
				local var_872_10 = arg_869_1:FormatText(var_872_9.content)

				arg_869_1.text_.text = var_872_10

				LuaForUtil.ClearLinePrefixSymbol(arg_869_1.text_)

				local var_872_11 = 10
				local var_872_12 = utf8.len(var_872_10)
				local var_872_13 = var_872_11 <= 0 and var_872_7 or var_872_7 * (var_872_12 / var_872_11)

				if var_872_13 > 0 and var_872_7 < var_872_13 then
					arg_869_1.talkMaxDuration = var_872_13

					if var_872_13 + var_872_6 > arg_869_1.duration_ then
						arg_869_1.duration_ = var_872_13 + var_872_6
					end
				end

				arg_869_1.text_.text = var_872_10
				arg_869_1.typewritter.percent = 0

				arg_869_1.typewritter:SetDirty()
				arg_869_1:ShowNextGo(false)
				arg_869_1:RecordContent(arg_869_1.text_.text)
			end

			local var_872_14 = math.max(var_872_7, arg_869_1.talkMaxDuration)

			if var_872_6 <= arg_869_1.time_ and arg_869_1.time_ < var_872_6 + var_872_14 then
				arg_869_1.typewritter.percent = (arg_869_1.time_ - var_872_6) / var_872_14

				arg_869_1.typewritter:SetDirty()
			end

			if arg_869_1.time_ >= var_872_6 + var_872_14 and arg_869_1.time_ < var_872_6 + var_872_14 + arg_872_0 then
				arg_869_1.typewritter.percent = 1

				arg_869_1.typewritter:SetDirty()
				arg_869_1:ShowNextGo(true)
			end
		end
	end,
	Play910201216 = function(arg_873_0, arg_873_1)
		arg_873_1.time_ = 0
		arg_873_1.frameCnt_ = 0
		arg_873_1.state_ = "playing"
		arg_873_1.curTalkId_ = 910201216
		arg_873_1.duration_ = 5

		SetActive(arg_873_1.tipsGo_, false)

		function arg_873_1.onSingleLineFinish_()
			arg_873_1.onSingleLineUpdate_ = nil
			arg_873_1.onSingleLineFinish_ = nil
			arg_873_1.state_ = "waiting"
		end

		function arg_873_1.playNext_(arg_875_0)
			if arg_875_0 == 1 then
				arg_873_0:Play910201217(arg_873_1)
			end
		end

		function arg_873_1.onSingleLineUpdate_(arg_876_0)
			local var_876_0 = arg_873_1.actors_["1084ui_story"].transform
			local var_876_1 = 0

			if var_876_1 < arg_873_1.time_ and arg_873_1.time_ <= var_876_1 + arg_876_0 then
				arg_873_1.var_.moveOldPos1084ui_story = var_876_0.localPosition
			end

			local var_876_2 = 0.001

			if var_876_1 <= arg_873_1.time_ and arg_873_1.time_ < var_876_1 + var_876_2 then
				local var_876_3 = (arg_873_1.time_ - var_876_1) / var_876_2
				local var_876_4 = Vector3.New(0, -0.97, -6)

				var_876_0.localPosition = Vector3.Lerp(arg_873_1.var_.moveOldPos1084ui_story, var_876_4, var_876_3)

				local var_876_5 = manager.ui.mainCamera.transform.position - var_876_0.position

				var_876_0.forward = Vector3.New(var_876_5.x, var_876_5.y, var_876_5.z)

				local var_876_6 = var_876_0.localEulerAngles

				var_876_6.z = 0
				var_876_6.x = 0
				var_876_0.localEulerAngles = var_876_6
			end

			if arg_873_1.time_ >= var_876_1 + var_876_2 and arg_873_1.time_ < var_876_1 + var_876_2 + arg_876_0 then
				var_876_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_876_7 = manager.ui.mainCamera.transform.position - var_876_0.position

				var_876_0.forward = Vector3.New(var_876_7.x, var_876_7.y, var_876_7.z)

				local var_876_8 = var_876_0.localEulerAngles

				var_876_8.z = 0
				var_876_8.x = 0
				var_876_0.localEulerAngles = var_876_8
			end

			local var_876_9 = arg_873_1.actors_["1039ui_story"].transform
			local var_876_10 = 0

			if var_876_10 < arg_873_1.time_ and arg_873_1.time_ <= var_876_10 + arg_876_0 then
				arg_873_1.var_.moveOldPos1039ui_story = var_876_9.localPosition
			end

			local var_876_11 = 0.001

			if var_876_10 <= arg_873_1.time_ and arg_873_1.time_ < var_876_10 + var_876_11 then
				local var_876_12 = (arg_873_1.time_ - var_876_10) / var_876_11
				local var_876_13 = Vector3.New(0, 100, 0)

				var_876_9.localPosition = Vector3.Lerp(arg_873_1.var_.moveOldPos1039ui_story, var_876_13, var_876_12)

				local var_876_14 = manager.ui.mainCamera.transform.position - var_876_9.position

				var_876_9.forward = Vector3.New(var_876_14.x, var_876_14.y, var_876_14.z)

				local var_876_15 = var_876_9.localEulerAngles

				var_876_15.z = 0
				var_876_15.x = 0
				var_876_9.localEulerAngles = var_876_15
			end

			if arg_873_1.time_ >= var_876_10 + var_876_11 and arg_873_1.time_ < var_876_10 + var_876_11 + arg_876_0 then
				var_876_9.localPosition = Vector3.New(0, 100, 0)

				local var_876_16 = manager.ui.mainCamera.transform.position - var_876_9.position

				var_876_9.forward = Vector3.New(var_876_16.x, var_876_16.y, var_876_16.z)

				local var_876_17 = var_876_9.localEulerAngles

				var_876_17.z = 0
				var_876_17.x = 0
				var_876_9.localEulerAngles = var_876_17
			end

			local var_876_18 = 0

			if var_876_18 < arg_873_1.time_ and arg_873_1.time_ <= var_876_18 + arg_876_0 then
				arg_873_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_876_19 = arg_873_1.actors_["1084ui_story"]
			local var_876_20 = 0

			if var_876_20 < arg_873_1.time_ and arg_873_1.time_ <= var_876_20 + arg_876_0 and arg_873_1.var_.characterEffect1084ui_story == nil then
				arg_873_1.var_.characterEffect1084ui_story = var_876_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_876_21 = 0.2

			if var_876_20 <= arg_873_1.time_ and arg_873_1.time_ < var_876_20 + var_876_21 then
				local var_876_22 = (arg_873_1.time_ - var_876_20) / var_876_21

				if arg_873_1.var_.characterEffect1084ui_story then
					arg_873_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_873_1.time_ >= var_876_20 + var_876_21 and arg_873_1.time_ < var_876_20 + var_876_21 + arg_876_0 and arg_873_1.var_.characterEffect1084ui_story then
				arg_873_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_876_23 = 0

			if var_876_23 < arg_873_1.time_ and arg_873_1.time_ <= var_876_23 + arg_876_0 then
				arg_873_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_876_24 = 0
			local var_876_25 = 0.8

			if var_876_24 < arg_873_1.time_ and arg_873_1.time_ <= var_876_24 + arg_876_0 then
				arg_873_1.talkMaxDuration = 0
				arg_873_1.dialogCg_.alpha = 1

				arg_873_1.dialog_:SetActive(true)
				SetActive(arg_873_1.leftNameGo_, true)

				local var_876_26 = arg_873_1:FormatText(StoryNameCfg[6].name)

				arg_873_1.leftNameTxt_.text = var_876_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_873_1.leftNameTxt_.transform)

				arg_873_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_873_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_873_1:RecordName(arg_873_1.leftNameTxt_.text)
				SetActive(arg_873_1.iconTrs_.gameObject, false)
				arg_873_1.callingController_:SetSelectedState("normal")

				local var_876_27 = arg_873_1:GetWordFromCfg(910201216)
				local var_876_28 = arg_873_1:FormatText(var_876_27.content)

				arg_873_1.text_.text = var_876_28

				LuaForUtil.ClearLinePrefixSymbol(arg_873_1.text_)

				local var_876_29 = 32
				local var_876_30 = utf8.len(var_876_28)
				local var_876_31 = var_876_29 <= 0 and var_876_25 or var_876_25 * (var_876_30 / var_876_29)

				if var_876_31 > 0 and var_876_25 < var_876_31 then
					arg_873_1.talkMaxDuration = var_876_31

					if var_876_31 + var_876_24 > arg_873_1.duration_ then
						arg_873_1.duration_ = var_876_31 + var_876_24
					end
				end

				arg_873_1.text_.text = var_876_28
				arg_873_1.typewritter.percent = 0

				arg_873_1.typewritter:SetDirty()
				arg_873_1:ShowNextGo(false)
				arg_873_1:RecordContent(arg_873_1.text_.text)
			end

			local var_876_32 = math.max(var_876_25, arg_873_1.talkMaxDuration)

			if var_876_24 <= arg_873_1.time_ and arg_873_1.time_ < var_876_24 + var_876_32 then
				arg_873_1.typewritter.percent = (arg_873_1.time_ - var_876_24) / var_876_32

				arg_873_1.typewritter:SetDirty()
			end

			if arg_873_1.time_ >= var_876_24 + var_876_32 and arg_873_1.time_ < var_876_24 + var_876_32 + arg_876_0 then
				arg_873_1.typewritter.percent = 1

				arg_873_1.typewritter:SetDirty()
				arg_873_1:ShowNextGo(true)
			end
		end
	end,
	Play910201217 = function(arg_877_0, arg_877_1)
		arg_877_1.time_ = 0
		arg_877_1.frameCnt_ = 0
		arg_877_1.state_ = "playing"
		arg_877_1.curTalkId_ = 910201217
		arg_877_1.duration_ = 0.199999999999

		SetActive(arg_877_1.tipsGo_, false)

		function arg_877_1.onSingleLineFinish_()
			arg_877_1.onSingleLineUpdate_ = nil
			arg_877_1.onSingleLineFinish_ = nil
			arg_877_1.state_ = "waiting"

			SetActive(arg_877_1.choicesGo_, true)

			for iter_878_0, iter_878_1 in ipairs(arg_877_1.choices_) do
				local var_878_0 = iter_878_0 <= 2

				SetActive(iter_878_1.go, var_878_0)
			end

			arg_877_1.choices_[1].txt.text = arg_877_1:FormatText(StoryChoiceCfg[250].name)
			arg_877_1.choices_[2].txt.text = arg_877_1:FormatText(StoryChoiceCfg[251].name)
		end

		function arg_877_1.playNext_(arg_879_0)
			if arg_879_0 == 1 then
				arg_877_0:Play910201218(arg_877_1)
			end

			if arg_879_0 == 2 then
				arg_877_0:Play910201218(arg_877_1)
			end
		end

		function arg_877_1.onSingleLineUpdate_(arg_880_0)
			local var_880_0 = arg_877_1.actors_["1084ui_story"]
			local var_880_1 = 0

			if var_880_1 < arg_877_1.time_ and arg_877_1.time_ <= var_880_1 + arg_880_0 and arg_877_1.var_.characterEffect1084ui_story == nil then
				arg_877_1.var_.characterEffect1084ui_story = var_880_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_880_2 = 0.2

			if var_880_1 <= arg_877_1.time_ and arg_877_1.time_ < var_880_1 + var_880_2 then
				local var_880_3 = (arg_877_1.time_ - var_880_1) / var_880_2

				if arg_877_1.var_.characterEffect1084ui_story then
					local var_880_4 = Mathf.Lerp(0, 0.5, var_880_3)

					arg_877_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_877_1.var_.characterEffect1084ui_story.fillRatio = var_880_4
				end
			end

			if arg_877_1.time_ >= var_880_1 + var_880_2 and arg_877_1.time_ < var_880_1 + var_880_2 + arg_880_0 and arg_877_1.var_.characterEffect1084ui_story then
				local var_880_5 = 0.5

				arg_877_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_877_1.var_.characterEffect1084ui_story.fillRatio = var_880_5
			end
		end
	end,
	Play910201218 = function(arg_881_0, arg_881_1)
		arg_881_1.time_ = 0
		arg_881_1.frameCnt_ = 0
		arg_881_1.state_ = "playing"
		arg_881_1.curTalkId_ = 910201218
		arg_881_1.duration_ = 5

		SetActive(arg_881_1.tipsGo_, false)

		function arg_881_1.onSingleLineFinish_()
			arg_881_1.onSingleLineUpdate_ = nil
			arg_881_1.onSingleLineFinish_ = nil
			arg_881_1.state_ = "waiting"
		end

		function arg_881_1.playNext_(arg_883_0)
			if arg_883_0 == 1 then
				arg_881_0:Play910201219(arg_881_1)
			end
		end

		function arg_881_1.onSingleLineUpdate_(arg_884_0)
			local var_884_0 = 0

			if var_884_0 < arg_881_1.time_ and arg_881_1.time_ <= var_884_0 + arg_884_0 then
				arg_881_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_884_1 = 0
			local var_884_2 = 0.95

			if var_884_1 < arg_881_1.time_ and arg_881_1.time_ <= var_884_1 + arg_884_0 then
				arg_881_1.talkMaxDuration = 0
				arg_881_1.dialogCg_.alpha = 1

				arg_881_1.dialog_:SetActive(true)
				SetActive(arg_881_1.leftNameGo_, true)

				local var_884_3 = arg_881_1:FormatText(StoryNameCfg[7].name)

				arg_881_1.leftNameTxt_.text = var_884_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_881_1.leftNameTxt_.transform)

				arg_881_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_881_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_881_1:RecordName(arg_881_1.leftNameTxt_.text)
				SetActive(arg_881_1.iconTrs_.gameObject, false)
				arg_881_1.callingController_:SetSelectedState("normal")

				local var_884_4 = arg_881_1:GetWordFromCfg(910201218)
				local var_884_5 = arg_881_1:FormatText(var_884_4.content)

				arg_881_1.text_.text = var_884_5

				LuaForUtil.ClearLinePrefixSymbol(arg_881_1.text_)

				local var_884_6 = 38
				local var_884_7 = utf8.len(var_884_5)
				local var_884_8 = var_884_6 <= 0 and var_884_2 or var_884_2 * (var_884_7 / var_884_6)

				if var_884_8 > 0 and var_884_2 < var_884_8 then
					arg_881_1.talkMaxDuration = var_884_8

					if var_884_8 + var_884_1 > arg_881_1.duration_ then
						arg_881_1.duration_ = var_884_8 + var_884_1
					end
				end

				arg_881_1.text_.text = var_884_5
				arg_881_1.typewritter.percent = 0

				arg_881_1.typewritter:SetDirty()
				arg_881_1:ShowNextGo(false)
				arg_881_1:RecordContent(arg_881_1.text_.text)
			end

			local var_884_9 = math.max(var_884_2, arg_881_1.talkMaxDuration)

			if var_884_1 <= arg_881_1.time_ and arg_881_1.time_ < var_884_1 + var_884_9 then
				arg_881_1.typewritter.percent = (arg_881_1.time_ - var_884_1) / var_884_9

				arg_881_1.typewritter:SetDirty()
			end

			if arg_881_1.time_ >= var_884_1 + var_884_9 and arg_881_1.time_ < var_884_1 + var_884_9 + arg_884_0 then
				arg_881_1.typewritter.percent = 1

				arg_881_1.typewritter:SetDirty()
				arg_881_1:ShowNextGo(true)
			end
		end
	end,
	Play910201219 = function(arg_885_0, arg_885_1)
		arg_885_1.time_ = 0
		arg_885_1.frameCnt_ = 0
		arg_885_1.state_ = "playing"
		arg_885_1.curTalkId_ = 910201219
		arg_885_1.duration_ = 5

		SetActive(arg_885_1.tipsGo_, false)

		function arg_885_1.onSingleLineFinish_()
			arg_885_1.onSingleLineUpdate_ = nil
			arg_885_1.onSingleLineFinish_ = nil
			arg_885_1.state_ = "waiting"
		end

		function arg_885_1.playNext_(arg_887_0)
			if arg_887_0 == 1 then
				arg_885_0:Play910201220(arg_885_1)
			end
		end

		function arg_885_1.onSingleLineUpdate_(arg_888_0)
			local var_888_0 = 0
			local var_888_1 = 0.875

			if var_888_0 < arg_885_1.time_ and arg_885_1.time_ <= var_888_0 + arg_888_0 then
				arg_885_1.talkMaxDuration = 0
				arg_885_1.dialogCg_.alpha = 1

				arg_885_1.dialog_:SetActive(true)
				SetActive(arg_885_1.leftNameGo_, true)

				local var_888_2 = arg_885_1:FormatText(StoryNameCfg[7].name)

				arg_885_1.leftNameTxt_.text = var_888_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_885_1.leftNameTxt_.transform)

				arg_885_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_885_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_885_1:RecordName(arg_885_1.leftNameTxt_.text)
				SetActive(arg_885_1.iconTrs_.gameObject, false)
				arg_885_1.callingController_:SetSelectedState("normal")

				local var_888_3 = arg_885_1:GetWordFromCfg(910201219)
				local var_888_4 = arg_885_1:FormatText(var_888_3.content)

				arg_885_1.text_.text = var_888_4

				LuaForUtil.ClearLinePrefixSymbol(arg_885_1.text_)

				local var_888_5 = 35
				local var_888_6 = utf8.len(var_888_4)
				local var_888_7 = var_888_5 <= 0 and var_888_1 or var_888_1 * (var_888_6 / var_888_5)

				if var_888_7 > 0 and var_888_1 < var_888_7 then
					arg_885_1.talkMaxDuration = var_888_7

					if var_888_7 + var_888_0 > arg_885_1.duration_ then
						arg_885_1.duration_ = var_888_7 + var_888_0
					end
				end

				arg_885_1.text_.text = var_888_4
				arg_885_1.typewritter.percent = 0

				arg_885_1.typewritter:SetDirty()
				arg_885_1:ShowNextGo(false)
				arg_885_1:RecordContent(arg_885_1.text_.text)
			end

			local var_888_8 = math.max(var_888_1, arg_885_1.talkMaxDuration)

			if var_888_0 <= arg_885_1.time_ and arg_885_1.time_ < var_888_0 + var_888_8 then
				arg_885_1.typewritter.percent = (arg_885_1.time_ - var_888_0) / var_888_8

				arg_885_1.typewritter:SetDirty()
			end

			if arg_885_1.time_ >= var_888_0 + var_888_8 and arg_885_1.time_ < var_888_0 + var_888_8 + arg_888_0 then
				arg_885_1.typewritter.percent = 1

				arg_885_1.typewritter:SetDirty()
				arg_885_1:ShowNextGo(true)
			end
		end
	end,
	Play910201220 = function(arg_889_0, arg_889_1)
		arg_889_1.time_ = 0
		arg_889_1.frameCnt_ = 0
		arg_889_1.state_ = "playing"
		arg_889_1.curTalkId_ = 910201220
		arg_889_1.duration_ = 5

		SetActive(arg_889_1.tipsGo_, false)

		function arg_889_1.onSingleLineFinish_()
			arg_889_1.onSingleLineUpdate_ = nil
			arg_889_1.onSingleLineFinish_ = nil
			arg_889_1.state_ = "waiting"
		end

		function arg_889_1.playNext_(arg_891_0)
			if arg_891_0 == 1 then
				arg_889_0:Play910201221(arg_889_1)
			end
		end

		function arg_889_1.onSingleLineUpdate_(arg_892_0)
			local var_892_0 = 0
			local var_892_1 = 0.8

			if var_892_0 < arg_889_1.time_ and arg_889_1.time_ <= var_892_0 + arg_892_0 then
				arg_889_1.talkMaxDuration = 0
				arg_889_1.dialogCg_.alpha = 1

				arg_889_1.dialog_:SetActive(true)
				SetActive(arg_889_1.leftNameGo_, true)

				local var_892_2 = arg_889_1:FormatText(StoryNameCfg[7].name)

				arg_889_1.leftNameTxt_.text = var_892_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_889_1.leftNameTxt_.transform)

				arg_889_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_889_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_889_1:RecordName(arg_889_1.leftNameTxt_.text)
				SetActive(arg_889_1.iconTrs_.gameObject, false)
				arg_889_1.callingController_:SetSelectedState("normal")

				local var_892_3 = arg_889_1:GetWordFromCfg(910201220)
				local var_892_4 = arg_889_1:FormatText(var_892_3.content)

				arg_889_1.text_.text = var_892_4

				LuaForUtil.ClearLinePrefixSymbol(arg_889_1.text_)

				local var_892_5 = 32
				local var_892_6 = utf8.len(var_892_4)
				local var_892_7 = var_892_5 <= 0 and var_892_1 or var_892_1 * (var_892_6 / var_892_5)

				if var_892_7 > 0 and var_892_1 < var_892_7 then
					arg_889_1.talkMaxDuration = var_892_7

					if var_892_7 + var_892_0 > arg_889_1.duration_ then
						arg_889_1.duration_ = var_892_7 + var_892_0
					end
				end

				arg_889_1.text_.text = var_892_4
				arg_889_1.typewritter.percent = 0

				arg_889_1.typewritter:SetDirty()
				arg_889_1:ShowNextGo(false)
				arg_889_1:RecordContent(arg_889_1.text_.text)
			end

			local var_892_8 = math.max(var_892_1, arg_889_1.talkMaxDuration)

			if var_892_0 <= arg_889_1.time_ and arg_889_1.time_ < var_892_0 + var_892_8 then
				arg_889_1.typewritter.percent = (arg_889_1.time_ - var_892_0) / var_892_8

				arg_889_1.typewritter:SetDirty()
			end

			if arg_889_1.time_ >= var_892_0 + var_892_8 and arg_889_1.time_ < var_892_0 + var_892_8 + arg_892_0 then
				arg_889_1.typewritter.percent = 1

				arg_889_1.typewritter:SetDirty()
				arg_889_1:ShowNextGo(true)
			end
		end
	end,
	Play910201221 = function(arg_893_0, arg_893_1)
		arg_893_1.time_ = 0
		arg_893_1.frameCnt_ = 0
		arg_893_1.state_ = "playing"
		arg_893_1.curTalkId_ = 910201221
		arg_893_1.duration_ = 5

		SetActive(arg_893_1.tipsGo_, false)

		function arg_893_1.onSingleLineFinish_()
			arg_893_1.onSingleLineUpdate_ = nil
			arg_893_1.onSingleLineFinish_ = nil
			arg_893_1.state_ = "waiting"
		end

		function arg_893_1.playNext_(arg_895_0)
			if arg_895_0 == 1 then
				arg_893_0:Play910201222(arg_893_1)
			end
		end

		function arg_893_1.onSingleLineUpdate_(arg_896_0)
			local var_896_0 = 0
			local var_896_1 = 0.425

			if var_896_0 < arg_893_1.time_ and arg_893_1.time_ <= var_896_0 + arg_896_0 then
				arg_893_1.talkMaxDuration = 0
				arg_893_1.dialogCg_.alpha = 1

				arg_893_1.dialog_:SetActive(true)
				SetActive(arg_893_1.leftNameGo_, true)

				local var_896_2 = arg_893_1:FormatText(StoryNameCfg[7].name)

				arg_893_1.leftNameTxt_.text = var_896_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_893_1.leftNameTxt_.transform)

				arg_893_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_893_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_893_1:RecordName(arg_893_1.leftNameTxt_.text)
				SetActive(arg_893_1.iconTrs_.gameObject, false)
				arg_893_1.callingController_:SetSelectedState("normal")

				local var_896_3 = arg_893_1:GetWordFromCfg(910201221)
				local var_896_4 = arg_893_1:FormatText(var_896_3.content)

				arg_893_1.text_.text = var_896_4

				LuaForUtil.ClearLinePrefixSymbol(arg_893_1.text_)

				local var_896_5 = 17
				local var_896_6 = utf8.len(var_896_4)
				local var_896_7 = var_896_5 <= 0 and var_896_1 or var_896_1 * (var_896_6 / var_896_5)

				if var_896_7 > 0 and var_896_1 < var_896_7 then
					arg_893_1.talkMaxDuration = var_896_7

					if var_896_7 + var_896_0 > arg_893_1.duration_ then
						arg_893_1.duration_ = var_896_7 + var_896_0
					end
				end

				arg_893_1.text_.text = var_896_4
				arg_893_1.typewritter.percent = 0

				arg_893_1.typewritter:SetDirty()
				arg_893_1:ShowNextGo(false)
				arg_893_1:RecordContent(arg_893_1.text_.text)
			end

			local var_896_8 = math.max(var_896_1, arg_893_1.talkMaxDuration)

			if var_896_0 <= arg_893_1.time_ and arg_893_1.time_ < var_896_0 + var_896_8 then
				arg_893_1.typewritter.percent = (arg_893_1.time_ - var_896_0) / var_896_8

				arg_893_1.typewritter:SetDirty()
			end

			if arg_893_1.time_ >= var_896_0 + var_896_8 and arg_893_1.time_ < var_896_0 + var_896_8 + arg_896_0 then
				arg_893_1.typewritter.percent = 1

				arg_893_1.typewritter:SetDirty()
				arg_893_1:ShowNextGo(true)
			end
		end
	end,
	Play910201222 = function(arg_897_0, arg_897_1)
		arg_897_1.time_ = 0
		arg_897_1.frameCnt_ = 0
		arg_897_1.state_ = "playing"
		arg_897_1.curTalkId_ = 910201222
		arg_897_1.duration_ = 5

		SetActive(arg_897_1.tipsGo_, false)

		function arg_897_1.onSingleLineFinish_()
			arg_897_1.onSingleLineUpdate_ = nil
			arg_897_1.onSingleLineFinish_ = nil
			arg_897_1.state_ = "waiting"
		end

		function arg_897_1.playNext_(arg_899_0)
			if arg_899_0 == 1 then
				arg_897_0:Play910201223(arg_897_1)
			end
		end

		function arg_897_1.onSingleLineUpdate_(arg_900_0)
			local var_900_0 = arg_897_1.actors_["1084ui_story"]
			local var_900_1 = 0

			if var_900_1 < arg_897_1.time_ and arg_897_1.time_ <= var_900_1 + arg_900_0 and arg_897_1.var_.characterEffect1084ui_story == nil then
				arg_897_1.var_.characterEffect1084ui_story = var_900_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_900_2 = 0.2

			if var_900_1 <= arg_897_1.time_ and arg_897_1.time_ < var_900_1 + var_900_2 then
				local var_900_3 = (arg_897_1.time_ - var_900_1) / var_900_2

				if arg_897_1.var_.characterEffect1084ui_story then
					arg_897_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_897_1.time_ >= var_900_1 + var_900_2 and arg_897_1.time_ < var_900_1 + var_900_2 + arg_900_0 and arg_897_1.var_.characterEffect1084ui_story then
				arg_897_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_900_4 = 0

			if var_900_4 < arg_897_1.time_ and arg_897_1.time_ <= var_900_4 + arg_900_0 then
				arg_897_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_1")
			end

			local var_900_5 = 0

			if var_900_5 < arg_897_1.time_ and arg_897_1.time_ <= var_900_5 + arg_900_0 then
				arg_897_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_900_6 = 0
			local var_900_7 = 0.375

			if var_900_6 < arg_897_1.time_ and arg_897_1.time_ <= var_900_6 + arg_900_0 then
				arg_897_1.talkMaxDuration = 0
				arg_897_1.dialogCg_.alpha = 1

				arg_897_1.dialog_:SetActive(true)
				SetActive(arg_897_1.leftNameGo_, true)

				local var_900_8 = arg_897_1:FormatText(StoryNameCfg[6].name)

				arg_897_1.leftNameTxt_.text = var_900_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_897_1.leftNameTxt_.transform)

				arg_897_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_897_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_897_1:RecordName(arg_897_1.leftNameTxt_.text)
				SetActive(arg_897_1.iconTrs_.gameObject, false)
				arg_897_1.callingController_:SetSelectedState("normal")

				local var_900_9 = arg_897_1:GetWordFromCfg(910201222)
				local var_900_10 = arg_897_1:FormatText(var_900_9.content)

				arg_897_1.text_.text = var_900_10

				LuaForUtil.ClearLinePrefixSymbol(arg_897_1.text_)

				local var_900_11 = 15
				local var_900_12 = utf8.len(var_900_10)
				local var_900_13 = var_900_11 <= 0 and var_900_7 or var_900_7 * (var_900_12 / var_900_11)

				if var_900_13 > 0 and var_900_7 < var_900_13 then
					arg_897_1.talkMaxDuration = var_900_13

					if var_900_13 + var_900_6 > arg_897_1.duration_ then
						arg_897_1.duration_ = var_900_13 + var_900_6
					end
				end

				arg_897_1.text_.text = var_900_10
				arg_897_1.typewritter.percent = 0

				arg_897_1.typewritter:SetDirty()
				arg_897_1:ShowNextGo(false)
				arg_897_1:RecordContent(arg_897_1.text_.text)
			end

			local var_900_14 = math.max(var_900_7, arg_897_1.talkMaxDuration)

			if var_900_6 <= arg_897_1.time_ and arg_897_1.time_ < var_900_6 + var_900_14 then
				arg_897_1.typewritter.percent = (arg_897_1.time_ - var_900_6) / var_900_14

				arg_897_1.typewritter:SetDirty()
			end

			if arg_897_1.time_ >= var_900_6 + var_900_14 and arg_897_1.time_ < var_900_6 + var_900_14 + arg_900_0 then
				arg_897_1.typewritter.percent = 1

				arg_897_1.typewritter:SetDirty()
				arg_897_1:ShowNextGo(true)
			end
		end
	end,
	Play910201223 = function(arg_901_0, arg_901_1)
		arg_901_1.time_ = 0
		arg_901_1.frameCnt_ = 0
		arg_901_1.state_ = "playing"
		arg_901_1.curTalkId_ = 910201223
		arg_901_1.duration_ = 5

		SetActive(arg_901_1.tipsGo_, false)

		function arg_901_1.onSingleLineFinish_()
			arg_901_1.onSingleLineUpdate_ = nil
			arg_901_1.onSingleLineFinish_ = nil
			arg_901_1.state_ = "waiting"
		end

		function arg_901_1.playNext_(arg_903_0)
			if arg_903_0 == 1 then
				arg_901_0:Play910201224(arg_901_1)
			end
		end

		function arg_901_1.onSingleLineUpdate_(arg_904_0)
			local var_904_0 = 0

			if var_904_0 < arg_901_1.time_ and arg_901_1.time_ <= var_904_0 + arg_904_0 then
				arg_901_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_2")
			end

			local var_904_1 = arg_901_1.actors_["1084ui_story"].transform
			local var_904_2 = 0

			if var_904_2 < arg_901_1.time_ and arg_901_1.time_ <= var_904_2 + arg_904_0 then
				arg_901_1.var_.moveOldPos1084ui_story = var_904_1.localPosition
			end

			local var_904_3 = 0.001

			if var_904_2 <= arg_901_1.time_ and arg_901_1.time_ < var_904_2 + var_904_3 then
				local var_904_4 = (arg_901_1.time_ - var_904_2) / var_904_3
				local var_904_5 = Vector3.New(0, 100, 0)

				var_904_1.localPosition = Vector3.Lerp(arg_901_1.var_.moveOldPos1084ui_story, var_904_5, var_904_4)

				local var_904_6 = manager.ui.mainCamera.transform.position - var_904_1.position

				var_904_1.forward = Vector3.New(var_904_6.x, var_904_6.y, var_904_6.z)

				local var_904_7 = var_904_1.localEulerAngles

				var_904_7.z = 0
				var_904_7.x = 0
				var_904_1.localEulerAngles = var_904_7
			end

			if arg_901_1.time_ >= var_904_2 + var_904_3 and arg_901_1.time_ < var_904_2 + var_904_3 + arg_904_0 then
				var_904_1.localPosition = Vector3.New(0, 100, 0)

				local var_904_8 = manager.ui.mainCamera.transform.position - var_904_1.position

				var_904_1.forward = Vector3.New(var_904_8.x, var_904_8.y, var_904_8.z)

				local var_904_9 = var_904_1.localEulerAngles

				var_904_9.z = 0
				var_904_9.x = 0
				var_904_1.localEulerAngles = var_904_9
			end

			local var_904_10 = 0
			local var_904_11 = 0.25

			if var_904_10 < arg_901_1.time_ and arg_901_1.time_ <= var_904_10 + arg_904_0 then
				arg_901_1.talkMaxDuration = 0
				arg_901_1.dialogCg_.alpha = 1

				arg_901_1.dialog_:SetActive(true)
				SetActive(arg_901_1.leftNameGo_, true)

				local var_904_12 = arg_901_1:FormatText(StoryNameCfg[10].name)

				arg_901_1.leftNameTxt_.text = var_904_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_901_1.leftNameTxt_.transform)

				arg_901_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_901_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_901_1:RecordName(arg_901_1.leftNameTxt_.text)
				SetActive(arg_901_1.iconTrs_.gameObject, true)
				arg_901_1.iconController_:SetSelectedState("hero")

				arg_901_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_901_1.callingController_:SetSelectedState("normal")

				local var_904_13 = arg_901_1:GetWordFromCfg(910201223)
				local var_904_14 = arg_901_1:FormatText(var_904_13.content)

				arg_901_1.text_.text = var_904_14

				LuaForUtil.ClearLinePrefixSymbol(arg_901_1.text_)

				local var_904_15 = 10
				local var_904_16 = utf8.len(var_904_14)
				local var_904_17 = var_904_15 <= 0 and var_904_11 or var_904_11 * (var_904_16 / var_904_15)

				if var_904_17 > 0 and var_904_11 < var_904_17 then
					arg_901_1.talkMaxDuration = var_904_17

					if var_904_17 + var_904_10 > arg_901_1.duration_ then
						arg_901_1.duration_ = var_904_17 + var_904_10
					end
				end

				arg_901_1.text_.text = var_904_14
				arg_901_1.typewritter.percent = 0

				arg_901_1.typewritter:SetDirty()
				arg_901_1:ShowNextGo(false)
				arg_901_1:RecordContent(arg_901_1.text_.text)
			end

			local var_904_18 = math.max(var_904_11, arg_901_1.talkMaxDuration)

			if var_904_10 <= arg_901_1.time_ and arg_901_1.time_ < var_904_10 + var_904_18 then
				arg_901_1.typewritter.percent = (arg_901_1.time_ - var_904_10) / var_904_18

				arg_901_1.typewritter:SetDirty()
			end

			if arg_901_1.time_ >= var_904_10 + var_904_18 and arg_901_1.time_ < var_904_10 + var_904_18 + arg_904_0 then
				arg_901_1.typewritter.percent = 1

				arg_901_1.typewritter:SetDirty()
				arg_901_1:ShowNextGo(true)
			end
		end
	end,
	Play910201224 = function(arg_905_0, arg_905_1)
		arg_905_1.time_ = 0
		arg_905_1.frameCnt_ = 0
		arg_905_1.state_ = "playing"
		arg_905_1.curTalkId_ = 910201224
		arg_905_1.duration_ = 5

		SetActive(arg_905_1.tipsGo_, false)

		function arg_905_1.onSingleLineFinish_()
			arg_905_1.onSingleLineUpdate_ = nil
			arg_905_1.onSingleLineFinish_ = nil
			arg_905_1.state_ = "waiting"
		end

		function arg_905_1.playNext_(arg_907_0)
			if arg_907_0 == 1 then
				arg_905_0:Play910201225(arg_905_1)
			end
		end

		function arg_905_1.onSingleLineUpdate_(arg_908_0)
			local var_908_0 = arg_905_1.actors_["1059ui_story"].transform
			local var_908_1 = 0

			if var_908_1 < arg_905_1.time_ and arg_905_1.time_ <= var_908_1 + arg_908_0 then
				arg_905_1.var_.moveOldPos1059ui_story = var_908_0.localPosition
			end

			local var_908_2 = 0.001

			if var_908_1 <= arg_905_1.time_ and arg_905_1.time_ < var_908_1 + var_908_2 then
				local var_908_3 = (arg_905_1.time_ - var_908_1) / var_908_2
				local var_908_4 = Vector3.New(0, -1.05, -6)

				var_908_0.localPosition = Vector3.Lerp(arg_905_1.var_.moveOldPos1059ui_story, var_908_4, var_908_3)

				local var_908_5 = manager.ui.mainCamera.transform.position - var_908_0.position

				var_908_0.forward = Vector3.New(var_908_5.x, var_908_5.y, var_908_5.z)

				local var_908_6 = var_908_0.localEulerAngles

				var_908_6.z = 0
				var_908_6.x = 0
				var_908_0.localEulerAngles = var_908_6
			end

			if arg_905_1.time_ >= var_908_1 + var_908_2 and arg_905_1.time_ < var_908_1 + var_908_2 + arg_908_0 then
				var_908_0.localPosition = Vector3.New(0, -1.05, -6)

				local var_908_7 = manager.ui.mainCamera.transform.position - var_908_0.position

				var_908_0.forward = Vector3.New(var_908_7.x, var_908_7.y, var_908_7.z)

				local var_908_8 = var_908_0.localEulerAngles

				var_908_8.z = 0
				var_908_8.x = 0
				var_908_0.localEulerAngles = var_908_8
			end

			local var_908_9 = 0

			if var_908_9 < arg_905_1.time_ and arg_905_1.time_ <= var_908_9 + arg_908_0 then
				arg_905_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action5_1")
			end

			local var_908_10 = arg_905_1.actors_["1059ui_story"]
			local var_908_11 = 0

			if var_908_11 < arg_905_1.time_ and arg_905_1.time_ <= var_908_11 + arg_908_0 and arg_905_1.var_.characterEffect1059ui_story == nil then
				arg_905_1.var_.characterEffect1059ui_story = var_908_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_908_12 = 0.2

			if var_908_11 <= arg_905_1.time_ and arg_905_1.time_ < var_908_11 + var_908_12 then
				local var_908_13 = (arg_905_1.time_ - var_908_11) / var_908_12

				if arg_905_1.var_.characterEffect1059ui_story then
					arg_905_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_905_1.time_ >= var_908_11 + var_908_12 and arg_905_1.time_ < var_908_11 + var_908_12 + arg_908_0 and arg_905_1.var_.characterEffect1059ui_story then
				arg_905_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_908_14 = 0
			local var_908_15 = 0.325

			if var_908_14 < arg_905_1.time_ and arg_905_1.time_ <= var_908_14 + arg_908_0 then
				arg_905_1.talkMaxDuration = 0
				arg_905_1.dialogCg_.alpha = 1

				arg_905_1.dialog_:SetActive(true)
				SetActive(arg_905_1.leftNameGo_, true)

				local var_908_16 = arg_905_1:FormatText(StoryNameCfg[28].name)

				arg_905_1.leftNameTxt_.text = var_908_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_905_1.leftNameTxt_.transform)

				arg_905_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_905_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_905_1:RecordName(arg_905_1.leftNameTxt_.text)
				SetActive(arg_905_1.iconTrs_.gameObject, false)
				arg_905_1.callingController_:SetSelectedState("normal")

				local var_908_17 = arg_905_1:GetWordFromCfg(910201224)
				local var_908_18 = arg_905_1:FormatText(var_908_17.content)

				arg_905_1.text_.text = var_908_18

				LuaForUtil.ClearLinePrefixSymbol(arg_905_1.text_)

				local var_908_19 = 13
				local var_908_20 = utf8.len(var_908_18)
				local var_908_21 = var_908_19 <= 0 and var_908_15 or var_908_15 * (var_908_20 / var_908_19)

				if var_908_21 > 0 and var_908_15 < var_908_21 then
					arg_905_1.talkMaxDuration = var_908_21

					if var_908_21 + var_908_14 > arg_905_1.duration_ then
						arg_905_1.duration_ = var_908_21 + var_908_14
					end
				end

				arg_905_1.text_.text = var_908_18
				arg_905_1.typewritter.percent = 0

				arg_905_1.typewritter:SetDirty()
				arg_905_1:ShowNextGo(false)
				arg_905_1:RecordContent(arg_905_1.text_.text)
			end

			local var_908_22 = math.max(var_908_15, arg_905_1.talkMaxDuration)

			if var_908_14 <= arg_905_1.time_ and arg_905_1.time_ < var_908_14 + var_908_22 then
				arg_905_1.typewritter.percent = (arg_905_1.time_ - var_908_14) / var_908_22

				arg_905_1.typewritter:SetDirty()
			end

			if arg_905_1.time_ >= var_908_14 + var_908_22 and arg_905_1.time_ < var_908_14 + var_908_22 + arg_908_0 then
				arg_905_1.typewritter.percent = 1

				arg_905_1.typewritter:SetDirty()
				arg_905_1:ShowNextGo(true)
			end
		end
	end,
	Play910201225 = function(arg_909_0, arg_909_1)
		arg_909_1.time_ = 0
		arg_909_1.frameCnt_ = 0
		arg_909_1.state_ = "playing"
		arg_909_1.curTalkId_ = 910201225
		arg_909_1.duration_ = 5

		SetActive(arg_909_1.tipsGo_, false)

		function arg_909_1.onSingleLineFinish_()
			arg_909_1.onSingleLineUpdate_ = nil
			arg_909_1.onSingleLineFinish_ = nil
			arg_909_1.state_ = "waiting"
		end

		function arg_909_1.playNext_(arg_911_0)
			if arg_911_0 == 1 then
				arg_909_0:Play910201226(arg_909_1)
			end
		end

		function arg_909_1.onSingleLineUpdate_(arg_912_0)
			local var_912_0 = arg_909_1.actors_["1084ui_story"].transform
			local var_912_1 = 0

			if var_912_1 < arg_909_1.time_ and arg_909_1.time_ <= var_912_1 + arg_912_0 then
				arg_909_1.var_.moveOldPos1084ui_story = var_912_0.localPosition
			end

			local var_912_2 = 0.001

			if var_912_1 <= arg_909_1.time_ and arg_909_1.time_ < var_912_1 + var_912_2 then
				local var_912_3 = (arg_909_1.time_ - var_912_1) / var_912_2
				local var_912_4 = Vector3.New(0, -0.97, -6)

				var_912_0.localPosition = Vector3.Lerp(arg_909_1.var_.moveOldPos1084ui_story, var_912_4, var_912_3)

				local var_912_5 = manager.ui.mainCamera.transform.position - var_912_0.position

				var_912_0.forward = Vector3.New(var_912_5.x, var_912_5.y, var_912_5.z)

				local var_912_6 = var_912_0.localEulerAngles

				var_912_6.z = 0
				var_912_6.x = 0
				var_912_0.localEulerAngles = var_912_6
			end

			if arg_909_1.time_ >= var_912_1 + var_912_2 and arg_909_1.time_ < var_912_1 + var_912_2 + arg_912_0 then
				var_912_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_912_7 = manager.ui.mainCamera.transform.position - var_912_0.position

				var_912_0.forward = Vector3.New(var_912_7.x, var_912_7.y, var_912_7.z)

				local var_912_8 = var_912_0.localEulerAngles

				var_912_8.z = 0
				var_912_8.x = 0
				var_912_0.localEulerAngles = var_912_8
			end

			local var_912_9 = arg_909_1.actors_["1059ui_story"].transform
			local var_912_10 = 0

			if var_912_10 < arg_909_1.time_ and arg_909_1.time_ <= var_912_10 + arg_912_0 then
				arg_909_1.var_.moveOldPos1059ui_story = var_912_9.localPosition
			end

			local var_912_11 = 0.001

			if var_912_10 <= arg_909_1.time_ and arg_909_1.time_ < var_912_10 + var_912_11 then
				local var_912_12 = (arg_909_1.time_ - var_912_10) / var_912_11
				local var_912_13 = Vector3.New(0, 100, 0)

				var_912_9.localPosition = Vector3.Lerp(arg_909_1.var_.moveOldPos1059ui_story, var_912_13, var_912_12)

				local var_912_14 = manager.ui.mainCamera.transform.position - var_912_9.position

				var_912_9.forward = Vector3.New(var_912_14.x, var_912_14.y, var_912_14.z)

				local var_912_15 = var_912_9.localEulerAngles

				var_912_15.z = 0
				var_912_15.x = 0
				var_912_9.localEulerAngles = var_912_15
			end

			if arg_909_1.time_ >= var_912_10 + var_912_11 and arg_909_1.time_ < var_912_10 + var_912_11 + arg_912_0 then
				var_912_9.localPosition = Vector3.New(0, 100, 0)

				local var_912_16 = manager.ui.mainCamera.transform.position - var_912_9.position

				var_912_9.forward = Vector3.New(var_912_16.x, var_912_16.y, var_912_16.z)

				local var_912_17 = var_912_9.localEulerAngles

				var_912_17.z = 0
				var_912_17.x = 0
				var_912_9.localEulerAngles = var_912_17
			end

			local var_912_18 = 0

			if var_912_18 < arg_909_1.time_ and arg_909_1.time_ <= var_912_18 + arg_912_0 then
				arg_909_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_912_19 = arg_909_1.actors_["1084ui_story"]
			local var_912_20 = 0

			if var_912_20 < arg_909_1.time_ and arg_909_1.time_ <= var_912_20 + arg_912_0 and arg_909_1.var_.characterEffect1084ui_story == nil then
				arg_909_1.var_.characterEffect1084ui_story = var_912_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_912_21 = 0.2

			if var_912_20 <= arg_909_1.time_ and arg_909_1.time_ < var_912_20 + var_912_21 then
				local var_912_22 = (arg_909_1.time_ - var_912_20) / var_912_21

				if arg_909_1.var_.characterEffect1084ui_story then
					arg_909_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_909_1.time_ >= var_912_20 + var_912_21 and arg_909_1.time_ < var_912_20 + var_912_21 + arg_912_0 and arg_909_1.var_.characterEffect1084ui_story then
				arg_909_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_912_23 = 0

			if var_912_23 < arg_909_1.time_ and arg_909_1.time_ <= var_912_23 + arg_912_0 then
				arg_909_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_912_24 = 0
			local var_912_25 = 0.725

			if var_912_24 < arg_909_1.time_ and arg_909_1.time_ <= var_912_24 + arg_912_0 then
				arg_909_1.talkMaxDuration = 0
				arg_909_1.dialogCg_.alpha = 1

				arg_909_1.dialog_:SetActive(true)
				SetActive(arg_909_1.leftNameGo_, true)

				local var_912_26 = arg_909_1:FormatText(StoryNameCfg[6].name)

				arg_909_1.leftNameTxt_.text = var_912_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_909_1.leftNameTxt_.transform)

				arg_909_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_909_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_909_1:RecordName(arg_909_1.leftNameTxt_.text)
				SetActive(arg_909_1.iconTrs_.gameObject, false)
				arg_909_1.callingController_:SetSelectedState("normal")

				local var_912_27 = arg_909_1:GetWordFromCfg(910201225)
				local var_912_28 = arg_909_1:FormatText(var_912_27.content)

				arg_909_1.text_.text = var_912_28

				LuaForUtil.ClearLinePrefixSymbol(arg_909_1.text_)

				local var_912_29 = 29
				local var_912_30 = utf8.len(var_912_28)
				local var_912_31 = var_912_29 <= 0 and var_912_25 or var_912_25 * (var_912_30 / var_912_29)

				if var_912_31 > 0 and var_912_25 < var_912_31 then
					arg_909_1.talkMaxDuration = var_912_31

					if var_912_31 + var_912_24 > arg_909_1.duration_ then
						arg_909_1.duration_ = var_912_31 + var_912_24
					end
				end

				arg_909_1.text_.text = var_912_28
				arg_909_1.typewritter.percent = 0

				arg_909_1.typewritter:SetDirty()
				arg_909_1:ShowNextGo(false)
				arg_909_1:RecordContent(arg_909_1.text_.text)
			end

			local var_912_32 = math.max(var_912_25, arg_909_1.talkMaxDuration)

			if var_912_24 <= arg_909_1.time_ and arg_909_1.time_ < var_912_24 + var_912_32 then
				arg_909_1.typewritter.percent = (arg_909_1.time_ - var_912_24) / var_912_32

				arg_909_1.typewritter:SetDirty()
			end

			if arg_909_1.time_ >= var_912_24 + var_912_32 and arg_909_1.time_ < var_912_24 + var_912_32 + arg_912_0 then
				arg_909_1.typewritter.percent = 1

				arg_909_1.typewritter:SetDirty()
				arg_909_1:ShowNextGo(true)
			end
		end
	end,
	Play910201226 = function(arg_913_0, arg_913_1)
		arg_913_1.time_ = 0
		arg_913_1.frameCnt_ = 0
		arg_913_1.state_ = "playing"
		arg_913_1.curTalkId_ = 910201226
		arg_913_1.duration_ = 5

		SetActive(arg_913_1.tipsGo_, false)

		function arg_913_1.onSingleLineFinish_()
			arg_913_1.onSingleLineUpdate_ = nil
			arg_913_1.onSingleLineFinish_ = nil
			arg_913_1.state_ = "waiting"
		end

		function arg_913_1.playNext_(arg_915_0)
			if arg_915_0 == 1 then
				arg_913_0:Play910201227(arg_913_1)
			end
		end

		function arg_913_1.onSingleLineUpdate_(arg_916_0)
			local var_916_0 = arg_913_1.actors_["1084ui_story"].transform
			local var_916_1 = 0

			if var_916_1 < arg_913_1.time_ and arg_913_1.time_ <= var_916_1 + arg_916_0 then
				arg_913_1.var_.moveOldPos1084ui_story = var_916_0.localPosition
			end

			local var_916_2 = 0.001

			if var_916_1 <= arg_913_1.time_ and arg_913_1.time_ < var_916_1 + var_916_2 then
				local var_916_3 = (arg_913_1.time_ - var_916_1) / var_916_2
				local var_916_4 = Vector3.New(0, 100, 0)

				var_916_0.localPosition = Vector3.Lerp(arg_913_1.var_.moveOldPos1084ui_story, var_916_4, var_916_3)

				local var_916_5 = manager.ui.mainCamera.transform.position - var_916_0.position

				var_916_0.forward = Vector3.New(var_916_5.x, var_916_5.y, var_916_5.z)

				local var_916_6 = var_916_0.localEulerAngles

				var_916_6.z = 0
				var_916_6.x = 0
				var_916_0.localEulerAngles = var_916_6
			end

			if arg_913_1.time_ >= var_916_1 + var_916_2 and arg_913_1.time_ < var_916_1 + var_916_2 + arg_916_0 then
				var_916_0.localPosition = Vector3.New(0, 100, 0)

				local var_916_7 = manager.ui.mainCamera.transform.position - var_916_0.position

				var_916_0.forward = Vector3.New(var_916_7.x, var_916_7.y, var_916_7.z)

				local var_916_8 = var_916_0.localEulerAngles

				var_916_8.z = 0
				var_916_8.x = 0
				var_916_0.localEulerAngles = var_916_8
			end

			local var_916_9 = 0
			local var_916_10 = 0.35

			if var_916_9 < arg_913_1.time_ and arg_913_1.time_ <= var_916_9 + arg_916_0 then
				arg_913_1.talkMaxDuration = 0
				arg_913_1.dialogCg_.alpha = 1

				arg_913_1.dialog_:SetActive(true)
				SetActive(arg_913_1.leftNameGo_, true)

				local var_916_11 = arg_913_1:FormatText(StoryNameCfg[330].name)

				arg_913_1.leftNameTxt_.text = var_916_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_913_1.leftNameTxt_.transform)

				arg_913_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_913_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_913_1:RecordName(arg_913_1.leftNameTxt_.text)
				SetActive(arg_913_1.iconTrs_.gameObject, false)
				arg_913_1.callingController_:SetSelectedState("normal")

				local var_916_12 = arg_913_1:GetWordFromCfg(910201226)
				local var_916_13 = arg_913_1:FormatText(var_916_12.content)

				arg_913_1.text_.text = var_916_13

				LuaForUtil.ClearLinePrefixSymbol(arg_913_1.text_)

				local var_916_14 = 14
				local var_916_15 = utf8.len(var_916_13)
				local var_916_16 = var_916_14 <= 0 and var_916_10 or var_916_10 * (var_916_15 / var_916_14)

				if var_916_16 > 0 and var_916_10 < var_916_16 then
					arg_913_1.talkMaxDuration = var_916_16

					if var_916_16 + var_916_9 > arg_913_1.duration_ then
						arg_913_1.duration_ = var_916_16 + var_916_9
					end
				end

				arg_913_1.text_.text = var_916_13
				arg_913_1.typewritter.percent = 0

				arg_913_1.typewritter:SetDirty()
				arg_913_1:ShowNextGo(false)
				arg_913_1:RecordContent(arg_913_1.text_.text)
			end

			local var_916_17 = math.max(var_916_10, arg_913_1.talkMaxDuration)

			if var_916_9 <= arg_913_1.time_ and arg_913_1.time_ < var_916_9 + var_916_17 then
				arg_913_1.typewritter.percent = (arg_913_1.time_ - var_916_9) / var_916_17

				arg_913_1.typewritter:SetDirty()
			end

			if arg_913_1.time_ >= var_916_9 + var_916_17 and arg_913_1.time_ < var_916_9 + var_916_17 + arg_916_0 then
				arg_913_1.typewritter.percent = 1

				arg_913_1.typewritter:SetDirty()
				arg_913_1:ShowNextGo(true)
			end
		end
	end,
	Play910201227 = function(arg_917_0, arg_917_1)
		arg_917_1.time_ = 0
		arg_917_1.frameCnt_ = 0
		arg_917_1.state_ = "playing"
		arg_917_1.curTalkId_ = 910201227
		arg_917_1.duration_ = 5

		SetActive(arg_917_1.tipsGo_, false)

		function arg_917_1.onSingleLineFinish_()
			arg_917_1.onSingleLineUpdate_ = nil
			arg_917_1.onSingleLineFinish_ = nil
			arg_917_1.state_ = "waiting"
			arg_917_1.auto_ = false
		end

		function arg_917_1.playNext_(arg_919_0)
			arg_917_1.onStoryFinished_()
		end

		function arg_917_1.onSingleLineUpdate_(arg_920_0)
			local var_920_0 = 0
			local var_920_1 = 0.25

			if var_920_0 < arg_917_1.time_ and arg_917_1.time_ <= var_920_0 + arg_920_0 then
				arg_917_1.talkMaxDuration = 0
				arg_917_1.dialogCg_.alpha = 1

				arg_917_1.dialog_:SetActive(true)
				SetActive(arg_917_1.leftNameGo_, false)

				arg_917_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_917_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_917_1:RecordName(arg_917_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_917_1.iconTrs_.gameObject, false)
				arg_917_1.callingController_:SetSelectedState("normal")

				local var_920_2 = arg_917_1:GetWordFromCfg(910201227)
				local var_920_3 = arg_917_1:FormatText(var_920_2.content)

				arg_917_1.text_.text = var_920_3

				LuaForUtil.ClearLinePrefixSymbol(arg_917_1.text_)

				local var_920_4 = 10
				local var_920_5 = utf8.len(var_920_3)
				local var_920_6 = var_920_4 <= 0 and var_920_1 or var_920_1 * (var_920_5 / var_920_4)

				if var_920_6 > 0 and var_920_1 < var_920_6 then
					arg_917_1.talkMaxDuration = var_920_6

					if var_920_6 + var_920_0 > arg_917_1.duration_ then
						arg_917_1.duration_ = var_920_6 + var_920_0
					end
				end

				arg_917_1.text_.text = var_920_3
				arg_917_1.typewritter.percent = 0

				arg_917_1.typewritter:SetDirty()
				arg_917_1:ShowNextGo(false)
				arg_917_1:RecordContent(arg_917_1.text_.text)
			end

			local var_920_7 = math.max(var_920_1, arg_917_1.talkMaxDuration)

			if var_920_0 <= arg_917_1.time_ and arg_917_1.time_ < var_920_0 + var_920_7 then
				arg_917_1.typewritter.percent = (arg_917_1.time_ - var_920_0) / var_920_7

				arg_917_1.typewritter:SetDirty()
			end

			if arg_917_1.time_ >= var_920_0 + var_920_7 and arg_917_1.time_ < var_920_0 + var_920_7 + arg_920_0 then
				arg_917_1.typewritter.percent = 1

				arg_917_1.typewritter:SetDirty()
				arg_917_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST05",
		"Assets/UIResources/UI_AB/TextureConfig/Background/HB0101"
	},
	voices = {}
}
