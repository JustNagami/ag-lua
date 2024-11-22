return {
	Play116071001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116071001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play116071002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST18"

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
				if arg_1_0.sceneSettingEffect_ then
					arg_1_1.sceneSettingEffect_.enabled = false
				end

				arg_1_1.sceneSettingGo_:SetActive(true)

				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.ST18

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
					if iter_4_0 ~= "ST18" then
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
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.23333333333333
			local var_4_27 = 1.09166666666667

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story.awb")
			end

			local var_4_30 = 1.36666666666667
			local var_4_31 = 0.958333333332333

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_1_6_story_story", "dialog_init", "bgm_activity_1_6_story_story.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.325

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

				local var_4_37 = arg_1_1:FormatText(StoryNameCfg[7].name)

				arg_1_1.leftNameTxt_.text = var_4_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_38 = arg_1_1:GetWordFromCfg(116071001)
				local var_4_39 = arg_1_1:FormatText(var_4_38.content)

				arg_1_1.text_.text = var_4_39

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_40 = 13
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
	Play116071002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 116071002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play116071003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10025ui_story"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("Char/" .. var_10_0), arg_7_1.stage_.transform)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_0] = var_10_1

				local var_10_2 = var_10_1:GetComponentInChildren(typeof(CharacterEffect))

				var_10_2.enabled = true

				local var_10_3 = GameObjectTools.GetOrAddComponent(var_10_1, typeof(DynamicBoneHelper))

				if var_10_3 then
					var_10_3:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_2.transform, false)

				arg_7_1.var_[var_10_0 .. "Animator"] = var_10_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_0 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_0 .. "LipSync"] = var_10_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_4 = arg_7_1.actors_["10025ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect10025ui_story == nil then
				arg_7_1.var_.characterEffect10025ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.2

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect10025ui_story then
					arg_7_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect10025ui_story then
				arg_7_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_10_8 = 0

			if var_10_8 < arg_7_1.time_ and arg_7_1.time_ <= var_10_8 + arg_10_0 then
				arg_7_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action8_1")
			end

			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_10_10 = arg_7_1.actors_["10025ui_story"].transform
			local var_10_11 = 0

			if var_10_11 < arg_7_1.time_ and arg_7_1.time_ <= var_10_11 + arg_10_0 then
				arg_7_1.var_.moveOldPos10025ui_story = var_10_10.localPosition
			end

			local var_10_12 = 0.001

			if var_10_11 <= arg_7_1.time_ and arg_7_1.time_ < var_10_11 + var_10_12 then
				local var_10_13 = (arg_7_1.time_ - var_10_11) / var_10_12
				local var_10_14 = Vector3.New(0, -1.1, -5.9)

				var_10_10.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10025ui_story, var_10_14, var_10_13)

				local var_10_15 = manager.ui.mainCamera.transform.position - var_10_10.position

				var_10_10.forward = Vector3.New(var_10_15.x, var_10_15.y, var_10_15.z)

				local var_10_16 = var_10_10.localEulerAngles

				var_10_16.z = 0
				var_10_16.x = 0
				var_10_10.localEulerAngles = var_10_16
			end

			if arg_7_1.time_ >= var_10_11 + var_10_12 and arg_7_1.time_ < var_10_11 + var_10_12 + arg_10_0 then
				var_10_10.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_10_17 = manager.ui.mainCamera.transform.position - var_10_10.position

				var_10_10.forward = Vector3.New(var_10_17.x, var_10_17.y, var_10_17.z)

				local var_10_18 = var_10_10.localEulerAngles

				var_10_18.z = 0
				var_10_18.x = 0
				var_10_10.localEulerAngles = var_10_18
			end

			local var_10_19 = 0
			local var_10_20 = 0.45

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_21 = arg_7_1:GetWordFromCfg(116071002)
				local var_10_22 = arg_7_1:FormatText(var_10_21.content)

				arg_7_1.text_.text = var_10_22

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_23 = 18
				local var_10_24 = utf8.len(var_10_22)
				local var_10_25 = var_10_23 <= 0 and var_10_20 or var_10_20 * (var_10_24 / var_10_23)

				if var_10_25 > 0 and var_10_20 < var_10_25 then
					arg_7_1.talkMaxDuration = var_10_25

					if var_10_25 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_25 + var_10_19
					end
				end

				arg_7_1.text_.text = var_10_22
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_26 = math.max(var_10_20, arg_7_1.talkMaxDuration)

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_26 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_19) / var_10_26

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_19 + var_10_26 and arg_7_1.time_ < var_10_19 + var_10_26 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play116071003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 116071003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play116071004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10025ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect10025ui_story == nil then
				arg_11_1.var_.characterEffect10025ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.2

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect10025ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_11_1.var_.characterEffect10025ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect10025ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_11_1.var_.characterEffect10025ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.425

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[7].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(116071003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 17
				local var_14_12 = utf8.len(var_14_10)
				local var_14_13 = var_14_11 <= 0 and var_14_7 or var_14_7 * (var_14_12 / var_14_11)

				if var_14_13 > 0 and var_14_7 < var_14_13 then
					arg_11_1.talkMaxDuration = var_14_13

					if var_14_13 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_10
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_14 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_14 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_14

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_14 and arg_11_1.time_ < var_14_6 + var_14_14 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play116071004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 116071004
		arg_15_1.duration_ = 1.999999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play116071005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10025ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect10025ui_story == nil then
				arg_15_1.var_.characterEffect10025ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect10025ui_story then
					arg_15_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect10025ui_story then
				arg_15_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_18_4 = 0

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action8_2")
			end

			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_18_6 = 0
			local var_18_7 = 0.1

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[328].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(116071004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 4
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_7 or var_18_7 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_7 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071004", "story_v_out_116071.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_116071", "116071004", "story_v_out_116071.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_116071", "116071004", "story_v_out_116071.awb")

						arg_15_1:RecordAudio("116071004", var_18_15)
						arg_15_1:RecordAudio("116071004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_116071", "116071004", "story_v_out_116071.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_116071", "116071004", "story_v_out_116071.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_16 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_16 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_16

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_16 and arg_15_1.time_ < var_18_6 + var_18_16 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play116071005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 116071005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play116071006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10025ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect10025ui_story == nil then
				arg_19_1.var_.characterEffect10025ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect10025ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_19_1.var_.characterEffect10025ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect10025ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_19_1.var_.characterEffect10025ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0
			local var_22_7 = 0.85

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(116071005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 34
				local var_22_12 = utf8.len(var_22_10)
				local var_22_13 = var_22_11 <= 0 and var_22_7 or var_22_7 * (var_22_12 / var_22_11)

				if var_22_13 > 0 and var_22_7 < var_22_13 then
					arg_19_1.talkMaxDuration = var_22_13

					if var_22_13 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_6
					end
				end

				arg_19_1.text_.text = var_22_10
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_14 and arg_19_1.time_ < var_22_6 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play116071006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 116071006
		arg_23_1.duration_ = 6.566

		local var_23_0 = {
			zh = 5,
			ja = 6.566
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
				arg_23_0:Play116071007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10025ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect10025ui_story == nil then
				arg_23_1.var_.characterEffect10025ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect10025ui_story then
					arg_23_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect10025ui_story then
				arg_23_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_26_5 = 0
			local var_26_6 = 0.45

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_7 = arg_23_1:FormatText(StoryNameCfg[328].name)

				arg_23_1.leftNameTxt_.text = var_26_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(116071006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 18
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_6 or var_26_6 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_6 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_5 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_5
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071006", "story_v_out_116071.awb") ~= 0 then
					local var_26_13 = manager.audio:GetVoiceLength("story_v_out_116071", "116071006", "story_v_out_116071.awb") / 1000

					if var_26_13 + var_26_5 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_5
					end

					if var_26_8.prefab_name ~= "" and arg_23_1.actors_[var_26_8.prefab_name] ~= nil then
						local var_26_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_8.prefab_name].transform, "story_v_out_116071", "116071006", "story_v_out_116071.awb")

						arg_23_1:RecordAudio("116071006", var_26_14)
						arg_23_1:RecordAudio("116071006", var_26_14)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_116071", "116071006", "story_v_out_116071.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_116071", "116071006", "story_v_out_116071.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_15 = math.max(var_26_6, arg_23_1.talkMaxDuration)

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_15 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_5) / var_26_15

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_5 + var_26_15 and arg_23_1.time_ < var_26_5 + var_26_15 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play116071007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 116071007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play116071008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10025ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect10025ui_story == nil then
				arg_27_1.var_.characterEffect10025ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect10025ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_27_1.var_.characterEffect10025ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect10025ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_27_1.var_.characterEffect10025ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 0.125

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[7].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(116071007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 5
				local var_30_12 = utf8.len(var_30_10)
				local var_30_13 = var_30_11 <= 0 and var_30_7 or var_30_7 * (var_30_12 / var_30_11)

				if var_30_13 > 0 and var_30_7 < var_30_13 then
					arg_27_1.talkMaxDuration = var_30_13

					if var_30_13 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_13 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_10
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_14 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_14 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_14

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_14 and arg_27_1.time_ < var_30_6 + var_30_14 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play116071008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 116071008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play116071009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10025ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10025ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, 100, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10025ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, 100, 0)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = 0
			local var_34_10 = 1.5

			if var_34_9 < arg_31_1.time_ and arg_31_1.time_ <= var_34_9 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_11 = arg_31_1:GetWordFromCfg(116071008)
				local var_34_12 = arg_31_1:FormatText(var_34_11.content)

				arg_31_1.text_.text = var_34_12

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_13 = 60
				local var_34_14 = utf8.len(var_34_12)
				local var_34_15 = var_34_13 <= 0 and var_34_10 or var_34_10 * (var_34_14 / var_34_13)

				if var_34_15 > 0 and var_34_10 < var_34_15 then
					arg_31_1.talkMaxDuration = var_34_15

					if var_34_15 + var_34_9 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_15 + var_34_9
					end
				end

				arg_31_1.text_.text = var_34_12
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_16 = math.max(var_34_10, arg_31_1.talkMaxDuration)

			if var_34_9 <= arg_31_1.time_ and arg_31_1.time_ < var_34_9 + var_34_16 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_9) / var_34_16

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_9 + var_34_16 and arg_31_1.time_ < var_34_9 + var_34_16 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play116071009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 116071009
		arg_35_1.duration_ = 1.999999999999

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play116071010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10025ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect10025ui_story == nil then
				arg_35_1.var_.characterEffect10025ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect10025ui_story then
					arg_35_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect10025ui_story then
				arg_35_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_38_4 = 0

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_1")
			end

			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_38_6 = arg_35_1.actors_["10025ui_story"].transform
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1.var_.moveOldPos10025ui_story = var_38_6.localPosition
			end

			local var_38_8 = 0.001

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8
				local var_38_10 = Vector3.New(0, -1.1, -5.9)

				var_38_6.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10025ui_story, var_38_10, var_38_9)

				local var_38_11 = manager.ui.mainCamera.transform.position - var_38_6.position

				var_38_6.forward = Vector3.New(var_38_11.x, var_38_11.y, var_38_11.z)

				local var_38_12 = var_38_6.localEulerAngles

				var_38_12.z = 0
				var_38_12.x = 0
				var_38_6.localEulerAngles = var_38_12
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 then
				var_38_6.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_38_13 = manager.ui.mainCamera.transform.position - var_38_6.position

				var_38_6.forward = Vector3.New(var_38_13.x, var_38_13.y, var_38_13.z)

				local var_38_14 = var_38_6.localEulerAngles

				var_38_14.z = 0
				var_38_14.x = 0
				var_38_6.localEulerAngles = var_38_14
			end

			local var_38_15 = 0
			local var_38_16 = 0.1

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_17 = arg_35_1:FormatText(StoryNameCfg[328].name)

				arg_35_1.leftNameTxt_.text = var_38_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_18 = arg_35_1:GetWordFromCfg(116071009)
				local var_38_19 = arg_35_1:FormatText(var_38_18.content)

				arg_35_1.text_.text = var_38_19

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_20 = 4
				local var_38_21 = utf8.len(var_38_19)
				local var_38_22 = var_38_20 <= 0 and var_38_16 or var_38_16 * (var_38_21 / var_38_20)

				if var_38_22 > 0 and var_38_16 < var_38_22 then
					arg_35_1.talkMaxDuration = var_38_22

					if var_38_22 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_22 + var_38_15
					end
				end

				arg_35_1.text_.text = var_38_19
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071009", "story_v_out_116071.awb") ~= 0 then
					local var_38_23 = manager.audio:GetVoiceLength("story_v_out_116071", "116071009", "story_v_out_116071.awb") / 1000

					if var_38_23 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_23 + var_38_15
					end

					if var_38_18.prefab_name ~= "" and arg_35_1.actors_[var_38_18.prefab_name] ~= nil then
						local var_38_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_18.prefab_name].transform, "story_v_out_116071", "116071009", "story_v_out_116071.awb")

						arg_35_1:RecordAudio("116071009", var_38_24)
						arg_35_1:RecordAudio("116071009", var_38_24)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_116071", "116071009", "story_v_out_116071.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_116071", "116071009", "story_v_out_116071.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_25 = math.max(var_38_16, arg_35_1.talkMaxDuration)

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_25 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_15) / var_38_25

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_15 + var_38_25 and arg_35_1.time_ < var_38_15 + var_38_25 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play116071010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 116071010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play116071011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10025ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10025ui_story == nil then
				arg_39_1.var_.characterEffect10025ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10025ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_39_1.var_.characterEffect10025ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10025ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_39_1.var_.characterEffect10025ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.25

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(116071010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 10
				local var_42_12 = utf8.len(var_42_10)
				local var_42_13 = var_42_11 <= 0 and var_42_7 or var_42_7 * (var_42_12 / var_42_11)

				if var_42_13 > 0 and var_42_7 < var_42_13 then
					arg_39_1.talkMaxDuration = var_42_13

					if var_42_13 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_10
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_14 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_14 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_14

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_14 and arg_39_1.time_ < var_42_6 + var_42_14 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play116071011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 116071011
		arg_43_1.duration_ = 9.366

		local var_43_0 = {
			zh = 5.066,
			ja = 9.366
		}
		local var_43_1 = manager.audio:GetLocalizationFlag()

		if var_43_0[var_43_1] ~= nil then
			arg_43_1.duration_ = var_43_0[var_43_1]
		end

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play116071012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10025ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect10025ui_story == nil then
				arg_43_1.var_.characterEffect10025ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect10025ui_story then
					arg_43_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect10025ui_story then
				arg_43_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_46_4 = 0

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_46_5 = 0
			local var_46_6 = 0.5

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_7 = arg_43_1:FormatText(StoryNameCfg[328].name)

				arg_43_1.leftNameTxt_.text = var_46_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_8 = arg_43_1:GetWordFromCfg(116071011)
				local var_46_9 = arg_43_1:FormatText(var_46_8.content)

				arg_43_1.text_.text = var_46_9

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_10 = 20
				local var_46_11 = utf8.len(var_46_9)
				local var_46_12 = var_46_10 <= 0 and var_46_6 or var_46_6 * (var_46_11 / var_46_10)

				if var_46_12 > 0 and var_46_6 < var_46_12 then
					arg_43_1.talkMaxDuration = var_46_12

					if var_46_12 + var_46_5 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_5
					end
				end

				arg_43_1.text_.text = var_46_9
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071011", "story_v_out_116071.awb") ~= 0 then
					local var_46_13 = manager.audio:GetVoiceLength("story_v_out_116071", "116071011", "story_v_out_116071.awb") / 1000

					if var_46_13 + var_46_5 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_5
					end

					if var_46_8.prefab_name ~= "" and arg_43_1.actors_[var_46_8.prefab_name] ~= nil then
						local var_46_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_8.prefab_name].transform, "story_v_out_116071", "116071011", "story_v_out_116071.awb")

						arg_43_1:RecordAudio("116071011", var_46_14)
						arg_43_1:RecordAudio("116071011", var_46_14)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_116071", "116071011", "story_v_out_116071.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_116071", "116071011", "story_v_out_116071.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_15 = math.max(var_46_6, arg_43_1.talkMaxDuration)

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_15 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_5) / var_46_15

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_5 + var_46_15 and arg_43_1.time_ < var_46_5 + var_46_15 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play116071012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 116071012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play116071013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10025ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect10025ui_story == nil then
				arg_47_1.var_.characterEffect10025ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect10025ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_47_1.var_.characterEffect10025ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect10025ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_47_1.var_.characterEffect10025ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0
			local var_50_7 = 0.575

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[7].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(116071012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 23
				local var_50_12 = utf8.len(var_50_10)
				local var_50_13 = var_50_11 <= 0 and var_50_7 or var_50_7 * (var_50_12 / var_50_11)

				if var_50_13 > 0 and var_50_7 < var_50_13 then
					arg_47_1.talkMaxDuration = var_50_13

					if var_50_13 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_10
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_14 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_14 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_14

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_14 and arg_47_1.time_ < var_50_6 + var_50_14 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play116071013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 116071013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play116071014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.8

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

				local var_54_2 = arg_51_1:GetWordFromCfg(116071013)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 32
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
	Play116071014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 116071014
		arg_55_1.duration_ = 10.133

		local var_55_0 = {
			zh = 8.433,
			ja = 10.133
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
				arg_55_0:Play116071015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10025ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect10025ui_story == nil then
				arg_55_1.var_.characterEffect10025ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect10025ui_story then
					arg_55_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect10025ui_story then
				arg_55_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_58_4 = 0

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_2")
			end

			local var_58_6 = 0
			local var_58_7 = 0.625

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[328].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(116071014)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 25
				local var_58_12 = utf8.len(var_58_10)
				local var_58_13 = var_58_11 <= 0 and var_58_7 or var_58_7 * (var_58_12 / var_58_11)

				if var_58_13 > 0 and var_58_7 < var_58_13 then
					arg_55_1.talkMaxDuration = var_58_13

					if var_58_13 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_10
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071014", "story_v_out_116071.awb") ~= 0 then
					local var_58_14 = manager.audio:GetVoiceLength("story_v_out_116071", "116071014", "story_v_out_116071.awb") / 1000

					if var_58_14 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_14 + var_58_6
					end

					if var_58_9.prefab_name ~= "" and arg_55_1.actors_[var_58_9.prefab_name] ~= nil then
						local var_58_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_9.prefab_name].transform, "story_v_out_116071", "116071014", "story_v_out_116071.awb")

						arg_55_1:RecordAudio("116071014", var_58_15)
						arg_55_1:RecordAudio("116071014", var_58_15)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_116071", "116071014", "story_v_out_116071.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_116071", "116071014", "story_v_out_116071.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_16 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_16 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_16

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_16 and arg_55_1.time_ < var_58_6 + var_58_16 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play116071015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 116071015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play116071016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10025ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect10025ui_story == nil then
				arg_59_1.var_.characterEffect10025ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect10025ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_59_1.var_.characterEffect10025ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect10025ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_59_1.var_.characterEffect10025ui_story.fillRatio = var_62_5
			end

			local var_62_6 = 0
			local var_62_7 = 0.275

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(116071015)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 11
				local var_62_12 = utf8.len(var_62_10)
				local var_62_13 = var_62_11 <= 0 and var_62_7 or var_62_7 * (var_62_12 / var_62_11)

				if var_62_13 > 0 and var_62_7 < var_62_13 then
					arg_59_1.talkMaxDuration = var_62_13

					if var_62_13 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_10
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_14 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_14 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_14

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_14 and arg_59_1.time_ < var_62_6 + var_62_14 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play116071016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 116071016
		arg_63_1.duration_ = 16.533

		local var_63_0 = {
			zh = 6.9,
			ja = 16.533
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
				arg_63_0:Play116071017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10025ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect10025ui_story == nil then
				arg_63_1.var_.characterEffect10025ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect10025ui_story then
					arg_63_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect10025ui_story then
				arg_63_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_66_4 = 0

			if var_66_4 < arg_63_1.time_ and arg_63_1.time_ <= var_66_4 + arg_66_0 then
				arg_63_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action8_1")
			end

			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_66_6 = 0
			local var_66_7 = 0.5

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[328].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(116071016)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 20
				local var_66_12 = utf8.len(var_66_10)
				local var_66_13 = var_66_11 <= 0 and var_66_7 or var_66_7 * (var_66_12 / var_66_11)

				if var_66_13 > 0 and var_66_7 < var_66_13 then
					arg_63_1.talkMaxDuration = var_66_13

					if var_66_13 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_13 + var_66_6
					end
				end

				arg_63_1.text_.text = var_66_10
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071016", "story_v_out_116071.awb") ~= 0 then
					local var_66_14 = manager.audio:GetVoiceLength("story_v_out_116071", "116071016", "story_v_out_116071.awb") / 1000

					if var_66_14 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_14 + var_66_6
					end

					if var_66_9.prefab_name ~= "" and arg_63_1.actors_[var_66_9.prefab_name] ~= nil then
						local var_66_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_9.prefab_name].transform, "story_v_out_116071", "116071016", "story_v_out_116071.awb")

						arg_63_1:RecordAudio("116071016", var_66_15)
						arg_63_1:RecordAudio("116071016", var_66_15)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_116071", "116071016", "story_v_out_116071.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_116071", "116071016", "story_v_out_116071.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_16 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_16 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_16

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_16 and arg_63_1.time_ < var_66_6 + var_66_16 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play116071017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 116071017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play116071018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10025ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect10025ui_story == nil then
				arg_67_1.var_.characterEffect10025ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect10025ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10025ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect10025ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10025ui_story.fillRatio = var_70_5
			end

			local var_70_6 = 0
			local var_70_7 = 0.625

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[7].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(116071017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 25
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
	Play116071018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 116071018
		arg_71_1.duration_ = 3.4

		local var_71_0 = {
			zh = 1.999999999999,
			ja = 3.4
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
				arg_71_0:Play116071019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10025ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect10025ui_story == nil then
				arg_71_1.var_.characterEffect10025ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.2

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect10025ui_story then
					arg_71_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect10025ui_story then
				arg_71_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_74_4 = 0

			if var_74_4 < arg_71_1.time_ and arg_71_1.time_ <= var_74_4 + arg_74_0 then
				arg_71_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_74_5 = 0
			local var_74_6 = 0.2

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_7 = arg_71_1:FormatText(StoryNameCfg[328].name)

				arg_71_1.leftNameTxt_.text = var_74_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_8 = arg_71_1:GetWordFromCfg(116071018)
				local var_74_9 = arg_71_1:FormatText(var_74_8.content)

				arg_71_1.text_.text = var_74_9

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_10 = 8
				local var_74_11 = utf8.len(var_74_9)
				local var_74_12 = var_74_10 <= 0 and var_74_6 or var_74_6 * (var_74_11 / var_74_10)

				if var_74_12 > 0 and var_74_6 < var_74_12 then
					arg_71_1.talkMaxDuration = var_74_12

					if var_74_12 + var_74_5 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_5
					end
				end

				arg_71_1.text_.text = var_74_9
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071018", "story_v_out_116071.awb") ~= 0 then
					local var_74_13 = manager.audio:GetVoiceLength("story_v_out_116071", "116071018", "story_v_out_116071.awb") / 1000

					if var_74_13 + var_74_5 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_13 + var_74_5
					end

					if var_74_8.prefab_name ~= "" and arg_71_1.actors_[var_74_8.prefab_name] ~= nil then
						local var_74_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_8.prefab_name].transform, "story_v_out_116071", "116071018", "story_v_out_116071.awb")

						arg_71_1:RecordAudio("116071018", var_74_14)
						arg_71_1:RecordAudio("116071018", var_74_14)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_116071", "116071018", "story_v_out_116071.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_116071", "116071018", "story_v_out_116071.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_15 = math.max(var_74_6, arg_71_1.talkMaxDuration)

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_15 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_5) / var_74_15

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_5 + var_74_15 and arg_71_1.time_ < var_74_5 + var_74_15 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play116071019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 116071019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play116071020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10025ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect10025ui_story == nil then
				arg_75_1.var_.characterEffect10025ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.2

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect10025ui_story then
					local var_78_4 = Mathf.Lerp(0, 0.5, var_78_3)

					arg_75_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_75_1.var_.characterEffect10025ui_story.fillRatio = var_78_4
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect10025ui_story then
				local var_78_5 = 0.5

				arg_75_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_75_1.var_.characterEffect10025ui_story.fillRatio = var_78_5
			end

			local var_78_6 = 0
			local var_78_7 = 0.575

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_8 = arg_75_1:FormatText(StoryNameCfg[7].name)

				arg_75_1.leftNameTxt_.text = var_78_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_9 = arg_75_1:GetWordFromCfg(116071019)
				local var_78_10 = arg_75_1:FormatText(var_78_9.content)

				arg_75_1.text_.text = var_78_10

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_11 = 23
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
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_14 = math.max(var_78_7, arg_75_1.talkMaxDuration)

			if var_78_6 <= arg_75_1.time_ and arg_75_1.time_ < var_78_6 + var_78_14 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_6) / var_78_14

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_6 + var_78_14 and arg_75_1.time_ < var_78_6 + var_78_14 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play116071020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 116071020
		arg_79_1.duration_ = 5.366

		local var_79_0 = {
			zh = 5.366,
			ja = 3.8
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
				arg_79_0:Play116071021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10025ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect10025ui_story == nil then
				arg_79_1.var_.characterEffect10025ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect10025ui_story then
					arg_79_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect10025ui_story then
				arg_79_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_82_4 = 0

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action8_2")
			end

			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_82_6 = 0
			local var_82_7 = 0.4

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[328].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(116071020)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071020", "story_v_out_116071.awb") ~= 0 then
					local var_82_14 = manager.audio:GetVoiceLength("story_v_out_116071", "116071020", "story_v_out_116071.awb") / 1000

					if var_82_14 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_14 + var_82_6
					end

					if var_82_9.prefab_name ~= "" and arg_79_1.actors_[var_82_9.prefab_name] ~= nil then
						local var_82_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_9.prefab_name].transform, "story_v_out_116071", "116071020", "story_v_out_116071.awb")

						arg_79_1:RecordAudio("116071020", var_82_15)
						arg_79_1:RecordAudio("116071020", var_82_15)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_116071", "116071020", "story_v_out_116071.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_116071", "116071020", "story_v_out_116071.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_16 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_16 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_16

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_16 and arg_79_1.time_ < var_82_6 + var_82_16 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play116071021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 116071021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play116071022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10025ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect10025ui_story == nil then
				arg_83_1.var_.characterEffect10025ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.2

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect10025ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_83_1.var_.characterEffect10025ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect10025ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_83_1.var_.characterEffect10025ui_story.fillRatio = var_86_5
			end

			local var_86_6 = 0
			local var_86_7 = 0.375

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_8 = arg_83_1:FormatText(StoryNameCfg[7].name)

				arg_83_1.leftNameTxt_.text = var_86_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_9 = arg_83_1:GetWordFromCfg(116071021)
				local var_86_10 = arg_83_1:FormatText(var_86_9.content)

				arg_83_1.text_.text = var_86_10

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_11 = 15
				local var_86_12 = utf8.len(var_86_10)
				local var_86_13 = var_86_11 <= 0 and var_86_7 or var_86_7 * (var_86_12 / var_86_11)

				if var_86_13 > 0 and var_86_7 < var_86_13 then
					arg_83_1.talkMaxDuration = var_86_13

					if var_86_13 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_13 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_10
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_14 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_14 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_14

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_14 and arg_83_1.time_ < var_86_6 + var_86_14 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play116071022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 116071022
		arg_87_1.duration_ = 2.7

		local var_87_0 = {
			zh = 2.7,
			ja = 1.999999999999
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
				arg_87_0:Play116071023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10025ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect10025ui_story == nil then
				arg_87_1.var_.characterEffect10025ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.2

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect10025ui_story then
					arg_87_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect10025ui_story then
				arg_87_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_90_4 = 0

			if var_90_4 < arg_87_1.time_ and arg_87_1.time_ <= var_90_4 + arg_90_0 then
				arg_87_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action7_1")
			end

			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 then
				arg_87_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_90_6 = 0
			local var_90_7 = 0.1

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[328].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(116071022)
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

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071022", "story_v_out_116071.awb") ~= 0 then
					local var_90_14 = manager.audio:GetVoiceLength("story_v_out_116071", "116071022", "story_v_out_116071.awb") / 1000

					if var_90_14 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_14 + var_90_6
					end

					if var_90_9.prefab_name ~= "" and arg_87_1.actors_[var_90_9.prefab_name] ~= nil then
						local var_90_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_9.prefab_name].transform, "story_v_out_116071", "116071022", "story_v_out_116071.awb")

						arg_87_1:RecordAudio("116071022", var_90_15)
						arg_87_1:RecordAudio("116071022", var_90_15)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_116071", "116071022", "story_v_out_116071.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_116071", "116071022", "story_v_out_116071.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_16 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_16 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_16

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_16 and arg_87_1.time_ < var_90_6 + var_90_16 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play116071023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 116071023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play116071024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10025ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect10025ui_story == nil then
				arg_91_1.var_.characterEffect10025ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect10025ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_91_1.var_.characterEffect10025ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect10025ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_91_1.var_.characterEffect10025ui_story.fillRatio = var_94_5
			end

			local var_94_6 = arg_91_1.actors_["10025ui_story"].transform
			local var_94_7 = 0

			if var_94_7 < arg_91_1.time_ and arg_91_1.time_ <= var_94_7 + arg_94_0 then
				arg_91_1.var_.moveOldPos10025ui_story = var_94_6.localPosition
			end

			local var_94_8 = 0.001

			if var_94_7 <= arg_91_1.time_ and arg_91_1.time_ < var_94_7 + var_94_8 then
				local var_94_9 = (arg_91_1.time_ - var_94_7) / var_94_8
				local var_94_10 = Vector3.New(0, 100, 0)

				var_94_6.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10025ui_story, var_94_10, var_94_9)

				local var_94_11 = manager.ui.mainCamera.transform.position - var_94_6.position

				var_94_6.forward = Vector3.New(var_94_11.x, var_94_11.y, var_94_11.z)

				local var_94_12 = var_94_6.localEulerAngles

				var_94_12.z = 0
				var_94_12.x = 0
				var_94_6.localEulerAngles = var_94_12
			end

			if arg_91_1.time_ >= var_94_7 + var_94_8 and arg_91_1.time_ < var_94_7 + var_94_8 + arg_94_0 then
				var_94_6.localPosition = Vector3.New(0, 100, 0)

				local var_94_13 = manager.ui.mainCamera.transform.position - var_94_6.position

				var_94_6.forward = Vector3.New(var_94_13.x, var_94_13.y, var_94_13.z)

				local var_94_14 = var_94_6.localEulerAngles

				var_94_14.z = 0
				var_94_14.x = 0
				var_94_6.localEulerAngles = var_94_14
			end

			local var_94_15 = 0
			local var_94_16 = 0.65

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_17 = arg_91_1:GetWordFromCfg(116071023)
				local var_94_18 = arg_91_1:FormatText(var_94_17.content)

				arg_91_1.text_.text = var_94_18

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_19 = 26
				local var_94_20 = utf8.len(var_94_18)
				local var_94_21 = var_94_19 <= 0 and var_94_16 or var_94_16 * (var_94_20 / var_94_19)

				if var_94_21 > 0 and var_94_16 < var_94_21 then
					arg_91_1.talkMaxDuration = var_94_21

					if var_94_21 + var_94_15 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_15
					end
				end

				arg_91_1.text_.text = var_94_18
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_22 = math.max(var_94_16, arg_91_1.talkMaxDuration)

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_22 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_15) / var_94_22

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_15 + var_94_22 and arg_91_1.time_ < var_94_15 + var_94_22 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play116071024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 116071024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play116071025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.6

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[7].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(116071024)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 24
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
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_8 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_8 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_8

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_8 and arg_95_1.time_ < var_98_0 + var_98_8 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play116071025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 116071025
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play116071026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10025ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos10025ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0, -1.1, -5.9)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10025ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = 0

			if var_102_9 < arg_99_1.time_ and arg_99_1.time_ <= var_102_9 + arg_102_0 then
				arg_99_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_102_10 = arg_99_1.actors_["10025ui_story"]
			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect10025ui_story == nil then
				arg_99_1.var_.characterEffect10025ui_story = var_102_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_12 = 0.2

			if var_102_11 <= arg_99_1.time_ and arg_99_1.time_ < var_102_11 + var_102_12 then
				local var_102_13 = (arg_99_1.time_ - var_102_11) / var_102_12

				if arg_99_1.var_.characterEffect10025ui_story then
					local var_102_14 = Mathf.Lerp(0, 0.5, var_102_13)

					arg_99_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_99_1.var_.characterEffect10025ui_story.fillRatio = var_102_14
				end
			end

			if arg_99_1.time_ >= var_102_11 + var_102_12 and arg_99_1.time_ < var_102_11 + var_102_12 + arg_102_0 and arg_99_1.var_.characterEffect10025ui_story then
				local var_102_15 = 0.5

				arg_99_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_99_1.var_.characterEffect10025ui_story.fillRatio = var_102_15
			end

			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 then
				arg_99_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action1_1")
			end

			local var_102_17 = 0
			local var_102_18 = 0.175

			if var_102_17 < arg_99_1.time_ and arg_99_1.time_ <= var_102_17 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_19 = arg_99_1:FormatText(StoryNameCfg[7].name)

				arg_99_1.leftNameTxt_.text = var_102_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_20 = arg_99_1:GetWordFromCfg(116071025)
				local var_102_21 = arg_99_1:FormatText(var_102_20.content)

				arg_99_1.text_.text = var_102_21

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_22 = 7
				local var_102_23 = utf8.len(var_102_21)
				local var_102_24 = var_102_22 <= 0 and var_102_18 or var_102_18 * (var_102_23 / var_102_22)

				if var_102_24 > 0 and var_102_18 < var_102_24 then
					arg_99_1.talkMaxDuration = var_102_24

					if var_102_24 + var_102_17 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_24 + var_102_17
					end
				end

				arg_99_1.text_.text = var_102_21
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_25 = math.max(var_102_18, arg_99_1.talkMaxDuration)

			if var_102_17 <= arg_99_1.time_ and arg_99_1.time_ < var_102_17 + var_102_25 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_17) / var_102_25

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_17 + var_102_25 and arg_99_1.time_ < var_102_17 + var_102_25 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play116071026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 116071026
		arg_103_1.duration_ = 3.7

		local var_103_0 = {
			zh = 3.7,
			ja = 2.766
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
				arg_103_0:Play116071027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10025ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect10025ui_story == nil then
				arg_103_1.var_.characterEffect10025ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect10025ui_story then
					arg_103_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect10025ui_story then
				arg_103_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_106_4 = 0

			if var_106_4 < arg_103_1.time_ and arg_103_1.time_ <= var_106_4 + arg_106_0 then
				arg_103_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action3_1")
			end

			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_106_6 = 0
			local var_106_7 = 0.2

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[328].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(116071026)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071026", "story_v_out_116071.awb") ~= 0 then
					local var_106_14 = manager.audio:GetVoiceLength("story_v_out_116071", "116071026", "story_v_out_116071.awb") / 1000

					if var_106_14 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_14 + var_106_6
					end

					if var_106_9.prefab_name ~= "" and arg_103_1.actors_[var_106_9.prefab_name] ~= nil then
						local var_106_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_9.prefab_name].transform, "story_v_out_116071", "116071026", "story_v_out_116071.awb")

						arg_103_1:RecordAudio("116071026", var_106_15)
						arg_103_1:RecordAudio("116071026", var_106_15)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_116071", "116071026", "story_v_out_116071.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_116071", "116071026", "story_v_out_116071.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_16 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_16 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_16

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_16 and arg_103_1.time_ < var_106_6 + var_106_16 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play116071027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 116071027
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play116071028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10025ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect10025ui_story == nil then
				arg_107_1.var_.characterEffect10025ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect10025ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_107_1.var_.characterEffect10025ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect10025ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_107_1.var_.characterEffect10025ui_story.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 0.475

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[7].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(116071027)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 19
				local var_110_12 = utf8.len(var_110_10)
				local var_110_13 = var_110_11 <= 0 and var_110_7 or var_110_7 * (var_110_12 / var_110_11)

				if var_110_13 > 0 and var_110_7 < var_110_13 then
					arg_107_1.talkMaxDuration = var_110_13

					if var_110_13 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_10
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_14 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_14 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_14

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_14 and arg_107_1.time_ < var_110_6 + var_110_14 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play116071028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 116071028
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play116071029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10025ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect10025ui_story == nil then
				arg_111_1.var_.characterEffect10025ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect10025ui_story then
					arg_111_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect10025ui_story then
				arg_111_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_114_4 = 0

			if var_114_4 < arg_111_1.time_ and arg_111_1.time_ <= var_114_4 + arg_114_0 then
				arg_111_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025actionlink/10025action438")
			end

			local var_114_5 = 0

			if var_114_5 < arg_111_1.time_ and arg_111_1.time_ <= var_114_5 + arg_114_0 then
				arg_111_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_114_6 = 0
			local var_114_7 = 0.325

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_8 = arg_111_1:GetWordFromCfg(116071028)
				local var_114_9 = arg_111_1:FormatText(var_114_8.content)

				arg_111_1.text_.text = var_114_9

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_10 = 13
				local var_114_11 = utf8.len(var_114_9)
				local var_114_12 = var_114_10 <= 0 and var_114_7 or var_114_7 * (var_114_11 / var_114_10)

				if var_114_12 > 0 and var_114_7 < var_114_12 then
					arg_111_1.talkMaxDuration = var_114_12

					if var_114_12 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_12 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_9
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_13 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_13 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_13

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_13 and arg_111_1.time_ < var_114_6 + var_114_13 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play116071029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 116071029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play116071030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10025ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect10025ui_story == nil then
				arg_115_1.var_.characterEffect10025ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect10025ui_story then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_115_1.var_.characterEffect10025ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect10025ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_115_1.var_.characterEffect10025ui_story.fillRatio = var_118_5
			end

			local var_118_6 = 0
			local var_118_7 = 0.475

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_8 = arg_115_1:FormatText(StoryNameCfg[7].name)

				arg_115_1.leftNameTxt_.text = var_118_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_9 = arg_115_1:GetWordFromCfg(116071029)
				local var_118_10 = arg_115_1:FormatText(var_118_9.content)

				arg_115_1.text_.text = var_118_10

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_11 = 19
				local var_118_12 = utf8.len(var_118_10)
				local var_118_13 = var_118_11 <= 0 and var_118_7 or var_118_7 * (var_118_12 / var_118_11)

				if var_118_13 > 0 and var_118_7 < var_118_13 then
					arg_115_1.talkMaxDuration = var_118_13

					if var_118_13 + var_118_6 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_13 + var_118_6
					end
				end

				arg_115_1.text_.text = var_118_10
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_14 = math.max(var_118_7, arg_115_1.talkMaxDuration)

			if var_118_6 <= arg_115_1.time_ and arg_115_1.time_ < var_118_6 + var_118_14 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_6) / var_118_14

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_6 + var_118_14 and arg_115_1.time_ < var_118_6 + var_118_14 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play116071030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 116071030
		arg_119_1.duration_ = 7.1

		local var_119_0 = {
			zh = 4.1,
			ja = 7.1
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
				arg_119_0:Play116071031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10025ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect10025ui_story == nil then
				arg_119_1.var_.characterEffect10025ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect10025ui_story then
					arg_119_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect10025ui_story then
				arg_119_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_122_4 = 0

			if var_122_4 < arg_119_1.time_ and arg_119_1.time_ <= var_122_4 + arg_122_0 then
				arg_119_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025actionlink/10025action485")
			end

			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 then
				arg_119_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_122_6 = 0
			local var_122_7 = 0.275

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_8 = arg_119_1:FormatText(StoryNameCfg[328].name)

				arg_119_1.leftNameTxt_.text = var_122_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_9 = arg_119_1:GetWordFromCfg(116071030)
				local var_122_10 = arg_119_1:FormatText(var_122_9.content)

				arg_119_1.text_.text = var_122_10

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_11 = 11
				local var_122_12 = utf8.len(var_122_10)
				local var_122_13 = var_122_11 <= 0 and var_122_7 or var_122_7 * (var_122_12 / var_122_11)

				if var_122_13 > 0 and var_122_7 < var_122_13 then
					arg_119_1.talkMaxDuration = var_122_13

					if var_122_13 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_13 + var_122_6
					end
				end

				arg_119_1.text_.text = var_122_10
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116071", "116071030", "story_v_out_116071.awb") ~= 0 then
					local var_122_14 = manager.audio:GetVoiceLength("story_v_out_116071", "116071030", "story_v_out_116071.awb") / 1000

					if var_122_14 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_14 + var_122_6
					end

					if var_122_9.prefab_name ~= "" and arg_119_1.actors_[var_122_9.prefab_name] ~= nil then
						local var_122_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_9.prefab_name].transform, "story_v_out_116071", "116071030", "story_v_out_116071.awb")

						arg_119_1:RecordAudio("116071030", var_122_15)
						arg_119_1:RecordAudio("116071030", var_122_15)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_116071", "116071030", "story_v_out_116071.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_116071", "116071030", "story_v_out_116071.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_16 = math.max(var_122_7, arg_119_1.talkMaxDuration)

			if var_122_6 <= arg_119_1.time_ and arg_119_1.time_ < var_122_6 + var_122_16 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_6) / var_122_16

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_6 + var_122_16 and arg_119_1.time_ < var_122_6 + var_122_16 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play116071031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 116071031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play116071032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10025ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect10025ui_story == nil then
				arg_123_1.var_.characterEffect10025ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect10025ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_123_1.var_.characterEffect10025ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect10025ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_123_1.var_.characterEffect10025ui_story.fillRatio = var_126_5
			end

			local var_126_6 = 0
			local var_126_7 = 1

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

				local var_126_9 = arg_123_1:GetWordFromCfg(116071031)
				local var_126_10 = arg_123_1:FormatText(var_126_9.content)

				arg_123_1.text_.text = var_126_10

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_11 = 40
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
	Play116071032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 116071032
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play116071033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.725

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_2 = arg_127_1:GetWordFromCfg(116071032)
				local var_130_3 = arg_127_1:FormatText(var_130_2.content)

				arg_127_1.text_.text = var_130_3

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_4 = 29
				local var_130_5 = utf8.len(var_130_3)
				local var_130_6 = var_130_4 <= 0 and var_130_1 or var_130_1 * (var_130_5 / var_130_4)

				if var_130_6 > 0 and var_130_1 < var_130_6 then
					arg_127_1.talkMaxDuration = var_130_6

					if var_130_6 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_6 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_3
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_7 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_7 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_7

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_7 and arg_127_1.time_ < var_130_0 + var_130_7 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play116071033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 116071033
		arg_131_1.duration_ = 7.999999999999

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play116071034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = "SK0110"

			if arg_131_1.bgs_[var_134_0] == nil then
				local var_134_1 = Object.Instantiate(arg_131_1.paintGo_)

				var_134_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_134_0)
				var_134_1.name = var_134_0
				var_134_1.transform.parent = arg_131_1.stage_.transform
				var_134_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_131_1.bgs_[var_134_0] = var_134_1
			end

			local var_134_2 = 2

			if var_134_2 < arg_131_1.time_ and arg_131_1.time_ <= var_134_2 + arg_134_0 then
				local var_134_3 = manager.ui.mainCamera.transform.localPosition
				local var_134_4 = Vector3.New(0, 0, 10) + Vector3.New(var_134_3.x, var_134_3.y, 0)
				local var_134_5 = arg_131_1.bgs_.SK0110

				var_134_5.transform.localPosition = var_134_4
				var_134_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_134_6 = var_134_5:GetComponent("SpriteRenderer")

				if var_134_6 and var_134_6.sprite then
					local var_134_7 = (var_134_5.transform.localPosition - var_134_3).z
					local var_134_8 = manager.ui.mainCameraCom_
					local var_134_9 = 2 * var_134_7 * Mathf.Tan(var_134_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_134_10 = var_134_9 * var_134_8.aspect
					local var_134_11 = var_134_6.sprite.bounds.size.x
					local var_134_12 = var_134_6.sprite.bounds.size.y
					local var_134_13 = var_134_10 / var_134_11
					local var_134_14 = var_134_9 / var_134_12
					local var_134_15 = var_134_14 < var_134_13 and var_134_13 or var_134_14

					var_134_5.transform.localScale = Vector3.New(var_134_15, var_134_15, 0)
				end

				for iter_134_0, iter_134_1 in pairs(arg_131_1.bgs_) do
					if iter_134_0 ~= "SK0110" then
						iter_134_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_134_16 = 0

			if var_134_16 < arg_131_1.time_ and arg_131_1.time_ <= var_134_16 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_17 = 2

			if var_134_16 <= arg_131_1.time_ and arg_131_1.time_ < var_134_16 + var_134_17 then
				local var_134_18 = (arg_131_1.time_ - var_134_16) / var_134_17
				local var_134_19 = Color.New(0, 0, 0)

				var_134_19.a = Mathf.Lerp(0, 1, var_134_18)
				arg_131_1.mask_.color = var_134_19
			end

			if arg_131_1.time_ >= var_134_16 + var_134_17 and arg_131_1.time_ < var_134_16 + var_134_17 + arg_134_0 then
				local var_134_20 = Color.New(0, 0, 0)

				var_134_20.a = 1
				arg_131_1.mask_.color = var_134_20
			end

			local var_134_21 = 2

			if var_134_21 < arg_131_1.time_ and arg_131_1.time_ <= var_134_21 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_22 = 2

			if var_134_21 <= arg_131_1.time_ and arg_131_1.time_ < var_134_21 + var_134_22 then
				local var_134_23 = (arg_131_1.time_ - var_134_21) / var_134_22
				local var_134_24 = Color.New(0, 0, 0)

				var_134_24.a = Mathf.Lerp(1, 0, var_134_23)
				arg_131_1.mask_.color = var_134_24
			end

			if arg_131_1.time_ >= var_134_21 + var_134_22 and arg_131_1.time_ < var_134_21 + var_134_22 + arg_134_0 then
				local var_134_25 = Color.New(0, 0, 0)
				local var_134_26 = 0

				arg_131_1.mask_.enabled = false
				var_134_25.a = var_134_26
				arg_131_1.mask_.color = var_134_25
			end

			local var_134_27 = arg_131_1.actors_["10025ui_story"].transform
			local var_134_28 = 1.966

			if var_134_28 < arg_131_1.time_ and arg_131_1.time_ <= var_134_28 + arg_134_0 then
				arg_131_1.var_.moveOldPos10025ui_story = var_134_27.localPosition
			end

			local var_134_29 = 0.001

			if var_134_28 <= arg_131_1.time_ and arg_131_1.time_ < var_134_28 + var_134_29 then
				local var_134_30 = (arg_131_1.time_ - var_134_28) / var_134_29
				local var_134_31 = Vector3.New(0, 100, 0)

				var_134_27.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10025ui_story, var_134_31, var_134_30)

				local var_134_32 = manager.ui.mainCamera.transform.position - var_134_27.position

				var_134_27.forward = Vector3.New(var_134_32.x, var_134_32.y, var_134_32.z)

				local var_134_33 = var_134_27.localEulerAngles

				var_134_33.z = 0
				var_134_33.x = 0
				var_134_27.localEulerAngles = var_134_33
			end

			if arg_131_1.time_ >= var_134_28 + var_134_29 and arg_131_1.time_ < var_134_28 + var_134_29 + arg_134_0 then
				var_134_27.localPosition = Vector3.New(0, 100, 0)

				local var_134_34 = manager.ui.mainCamera.transform.position - var_134_27.position

				var_134_27.forward = Vector3.New(var_134_34.x, var_134_34.y, var_134_34.z)

				local var_134_35 = var_134_27.localEulerAngles

				var_134_35.z = 0
				var_134_35.x = 0
				var_134_27.localEulerAngles = var_134_35
			end

			local var_134_36 = arg_131_1.bgs_.SK0110.transform
			local var_134_37 = 2

			if var_134_37 < arg_131_1.time_ and arg_131_1.time_ <= var_134_37 + arg_134_0 then
				arg_131_1.var_.moveOldPosSK0110 = var_134_36.localPosition
			end

			local var_134_38 = 0.001

			if var_134_37 <= arg_131_1.time_ and arg_131_1.time_ < var_134_37 + var_134_38 then
				local var_134_39 = (arg_131_1.time_ - var_134_37) / var_134_38
				local var_134_40 = Vector3.New(0, 5, 5)

				var_134_36.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPosSK0110, var_134_40, var_134_39)
			end

			if arg_131_1.time_ >= var_134_37 + var_134_38 and arg_131_1.time_ < var_134_37 + var_134_38 + arg_134_0 then
				var_134_36.localPosition = Vector3.New(0, 5, 5)
			end

			local var_134_41 = arg_131_1.bgs_.SK0110.transform
			local var_134_42 = 2.034

			if var_134_42 < arg_131_1.time_ and arg_131_1.time_ <= var_134_42 + arg_134_0 then
				arg_131_1.var_.moveOldPosSK0110 = var_134_41.localPosition
			end

			local var_134_43 = 5

			if var_134_42 <= arg_131_1.time_ and arg_131_1.time_ < var_134_42 + var_134_43 then
				local var_134_44 = (arg_131_1.time_ - var_134_42) / var_134_43
				local var_134_45 = Vector3.New(0, 4.5, 5)

				var_134_41.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPosSK0110, var_134_45, var_134_44)
			end

			if arg_131_1.time_ >= var_134_42 + var_134_43 and arg_131_1.time_ < var_134_42 + var_134_43 + arg_134_0 then
				var_134_41.localPosition = Vector3.New(0, 4.5, 5)
			end

			local var_134_46 = 4

			if var_134_46 < arg_131_1.time_ and arg_131_1.time_ <= var_134_46 + arg_134_0 then
				arg_131_1.allBtn_.enabled = false
			end

			local var_134_47 = 3.034

			if arg_131_1.time_ >= var_134_46 + var_134_47 and arg_131_1.time_ < var_134_46 + var_134_47 + arg_134_0 then
				arg_131_1.allBtn_.enabled = true
			end

			local var_134_48 = 2.034

			if var_134_48 < arg_131_1.time_ and arg_131_1.time_ <= var_134_48 + arg_134_0 then
				arg_131_1.fswbg_:SetActive(true)
				arg_131_1.dialog_:SetActive(false)

				arg_131_1.fswtw_.percent = 0

				local var_134_49 = arg_131_1:GetWordFromCfg(116071033)
				local var_134_50 = arg_131_1:FormatText(var_134_49.content)

				arg_131_1.fswt_.text = var_134_50

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.fswt_)

				arg_131_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_131_1.fswtw_:SetDirty()

				arg_131_1.typewritterCharCountI18N = 0

				SetActive(arg_131_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_131_1:ShowNextGo(false)
			end

			local var_134_51 = 4

			if var_134_51 < arg_131_1.time_ and arg_131_1.time_ <= var_134_51 + arg_134_0 then
				arg_131_1.var_.oldValueTypewriter = arg_131_1.fswtw_.percent

				arg_131_1:ShowNextGo(false)
			end

			local var_134_52 = 24
			local var_134_53 = 4
			local var_134_54 = arg_131_1:GetWordFromCfg(116071033)
			local var_134_55 = arg_131_1:FormatText(var_134_54.content)
			local var_134_56, var_134_57 = arg_131_1:GetPercentByPara(var_134_55, 1)

			if var_134_51 < arg_131_1.time_ and arg_131_1.time_ <= var_134_51 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				local var_134_58 = var_134_52 <= 0 and var_134_53 or var_134_53 * ((var_134_57 - arg_131_1.typewritterCharCountI18N) / var_134_52)

				if var_134_58 > 0 and var_134_53 < var_134_58 then
					arg_131_1.talkMaxDuration = var_134_58

					if var_134_58 + var_134_51 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_58 + var_134_51
					end
				end
			end

			local var_134_59 = 4
			local var_134_60 = math.max(var_134_59, arg_131_1.talkMaxDuration)

			if var_134_51 <= arg_131_1.time_ and arg_131_1.time_ < var_134_51 + var_134_60 then
				local var_134_61 = (arg_131_1.time_ - var_134_51) / var_134_60

				arg_131_1.fswtw_.percent = Mathf.Lerp(arg_131_1.var_.oldValueTypewriter, var_134_56, var_134_61)
				arg_131_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_131_1.fswtw_:SetDirty()
			end

			if arg_131_1.time_ >= var_134_51 + var_134_60 and arg_131_1.time_ < var_134_51 + var_134_60 + arg_134_0 then
				arg_131_1.fswtw_.percent = var_134_56

				arg_131_1.fswtw_:SetDirty()
				arg_131_1:ShowNextGo(true)

				arg_131_1.typewritterCharCountI18N = var_134_57
			end

			local var_134_62 = 4

			if var_134_62 < arg_131_1.time_ and arg_131_1.time_ <= var_134_62 + arg_134_0 then
				local var_134_63 = arg_131_1.fswbg_.transform:Find("textbox/adapt/content") or arg_131_1.fswbg_.transform:Find("textbox/content")
				local var_134_64 = var_134_63:GetComponent("Text")
				local var_134_65 = var_134_63:GetComponent("RectTransform")

				var_134_64.alignment = UnityEngine.TextAnchor.MiddleLeft
				var_134_65.offsetMin = Vector2.New(150, 250)
				var_134_65.offsetMax = Vector2.New(0, 0)
			end

			local var_134_66 = 0
			local var_134_67 = 1

			if var_134_66 < arg_131_1.time_ and arg_131_1.time_ <= var_134_66 + arg_134_0 then
				local var_134_68 = "play"
				local var_134_69 = "music"

				arg_131_1:AudioAction(var_134_68, var_134_69, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_134_70 = 2
			local var_134_71 = 1.5

			if var_134_70 < arg_131_1.time_ and arg_131_1.time_ <= var_134_70 + arg_134_0 then
				local var_134_72 = "play"
				local var_134_73 = "music"

				arg_131_1:AudioAction(var_134_72, var_134_73, "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story.awb")
			end

			local var_134_74 = 2.2
			local var_134_75 = 0.733333333333333

			if var_134_74 < arg_131_1.time_ and arg_131_1.time_ <= var_134_74 + arg_134_0 then
				local var_134_76 = "play"
				local var_134_77 = "music"

				arg_131_1:AudioAction(var_134_76, var_134_77, "bgm_activity_1_6_story_story", "story", "bgm_activity_1_6_story_story.awb")
			end
		end
	end,
	Play116071034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 116071034
		arg_135_1.duration_ = 5.374999999999

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play116071035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.var_.oldValueTypewriter = arg_135_1.fswtw_.percent

				arg_135_1:ShowNextGo(false)
			end

			local var_138_1 = 43
			local var_138_2 = 5.375
			local var_138_3 = arg_135_1:GetWordFromCfg(116071033)
			local var_138_4 = arg_135_1:FormatText(var_138_3.content)
			local var_138_5, var_138_6 = arg_135_1:GetPercentByPara(var_138_4, 2)

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0

				local var_138_7 = var_138_1 <= 0 and var_138_2 or var_138_2 * ((var_138_6 - arg_135_1.typewritterCharCountI18N) / var_138_1)

				if var_138_7 > 0 and var_138_2 < var_138_7 then
					arg_135_1.talkMaxDuration = var_138_7

					if var_138_7 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_7 + var_138_0
					end
				end
			end

			local var_138_8 = 5.375
			local var_138_9 = math.max(var_138_8, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_0) / var_138_9

				arg_135_1.fswtw_.percent = Mathf.Lerp(arg_135_1.var_.oldValueTypewriter, var_138_5, var_138_10)
				arg_135_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_135_1.fswtw_:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_9 and arg_135_1.time_ < var_138_0 + var_138_9 + arg_138_0 then
				arg_135_1.fswtw_.percent = var_138_5

				arg_135_1.fswtw_:SetDirty()
				arg_135_1:ShowNextGo(true)

				arg_135_1.typewritterCharCountI18N = var_138_6
			end
		end
	end,
	Play116071035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 116071035
		arg_139_1.duration_ = 3.499999999999

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play116071036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.var_.oldValueTypewriter = arg_139_1.fswtw_.percent

				arg_139_1:ShowNextGo(false)
			end

			local var_142_1 = 21
			local var_142_2 = 3.5
			local var_142_3 = arg_139_1:GetWordFromCfg(116071033)
			local var_142_4 = arg_139_1:FormatText(var_142_3.content)
			local var_142_5, var_142_6 = arg_139_1:GetPercentByPara(var_142_4, 3)

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0

				local var_142_7 = var_142_1 <= 0 and var_142_2 or var_142_2 * ((var_142_6 - arg_139_1.typewritterCharCountI18N) / var_142_1)

				if var_142_7 > 0 and var_142_2 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end
			end

			local var_142_8 = 3.5
			local var_142_9 = math.max(var_142_8, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_9 then
				local var_142_10 = (arg_139_1.time_ - var_142_0) / var_142_9

				arg_139_1.fswtw_.percent = Mathf.Lerp(arg_139_1.var_.oldValueTypewriter, var_142_5, var_142_10)
				arg_139_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_139_1.fswtw_:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_9 and arg_139_1.time_ < var_142_0 + var_142_9 + arg_142_0 then
				arg_139_1.fswtw_.percent = var_142_5

				arg_139_1.fswtw_:SetDirty()
				arg_139_1:ShowNextGo(true)

				arg_139_1.typewritterCharCountI18N = var_142_6
			end
		end
	end,
	Play116071036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 116071036
		arg_143_1.duration_ = 1.301999999999

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play116071037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.fswbg_:SetActive(true)
				arg_143_1.dialog_:SetActive(false)

				arg_143_1.fswtw_.percent = 0

				local var_146_1 = arg_143_1:GetWordFromCfg(116071036)
				local var_146_2 = arg_143_1:FormatText(var_146_1.content)

				arg_143_1.fswt_.text = var_146_2

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.fswt_)

				arg_143_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_143_1.fswtw_:SetDirty()

				arg_143_1.typewritterCharCountI18N = 0

				SetActive(arg_143_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_143_1:ShowNextGo(false)
			end

			local var_146_3 = 0.0166666666666667

			if var_146_3 < arg_143_1.time_ and arg_143_1.time_ <= var_146_3 + arg_146_0 then
				arg_143_1.var_.oldValueTypewriter = arg_143_1.fswtw_.percent

				arg_143_1:ShowNextGo(false)
			end

			local var_146_4 = 5
			local var_146_5 = 0.833333333333333
			local var_146_6 = arg_143_1:GetWordFromCfg(116071036)
			local var_146_7 = arg_143_1:FormatText(var_146_6.content)
			local var_146_8, var_146_9 = arg_143_1:GetPercentByPara(var_146_7, 1)

			if var_146_3 < arg_143_1.time_ and arg_143_1.time_ <= var_146_3 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0

				local var_146_10 = var_146_4 <= 0 and var_146_5 or var_146_5 * ((var_146_9 - arg_143_1.typewritterCharCountI18N) / var_146_4)

				if var_146_10 > 0 and var_146_5 < var_146_10 then
					arg_143_1.talkMaxDuration = var_146_10

					if var_146_10 + var_146_3 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_10 + var_146_3
					end
				end
			end

			local var_146_11 = 0.833333333333333
			local var_146_12 = math.max(var_146_11, arg_143_1.talkMaxDuration)

			if var_146_3 <= arg_143_1.time_ and arg_143_1.time_ < var_146_3 + var_146_12 then
				local var_146_13 = (arg_143_1.time_ - var_146_3) / var_146_12

				arg_143_1.fswtw_.percent = Mathf.Lerp(arg_143_1.var_.oldValueTypewriter, var_146_8, var_146_13)
				arg_143_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_143_1.fswtw_:SetDirty()
			end

			if arg_143_1.time_ >= var_146_3 + var_146_12 and arg_143_1.time_ < var_146_3 + var_146_12 + arg_146_0 then
				arg_143_1.fswtw_.percent = var_146_8

				arg_143_1.fswtw_:SetDirty()
				arg_143_1:ShowNextGo(true)

				arg_143_1.typewritterCharCountI18N = var_146_9
			end

			local var_146_14 = 0

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 then
				local var_146_15 = arg_143_1.fswbg_.transform:Find("textbox/adapt/content") or arg_143_1.fswbg_.transform:Find("textbox/content")
				local var_146_16 = var_146_15:GetComponent("Text")
				local var_146_17 = var_146_15:GetComponent("RectTransform")

				var_146_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_146_17.offsetMin = Vector2.New(0, 0)
				var_146_17.offsetMax = Vector2.New(1000, -400)
			end

			local var_146_18 = 0
			local var_146_19 = 1.302
			local var_146_20 = manager.audio:GetVoiceLength("story_v_out_116071", "116071036", "story_v_out_116071.awb") / 1000

			if var_146_20 > 0 and var_146_19 < var_146_20 and var_146_20 + var_146_18 > arg_143_1.duration_ then
				local var_146_21 = var_146_20

				arg_143_1.duration_ = var_146_20 + var_146_18
			end

			if var_146_18 < arg_143_1.time_ and arg_143_1.time_ <= var_146_18 + arg_146_0 then
				local var_146_22 = "play"
				local var_146_23 = "voice"

				arg_143_1:AudioAction(var_146_22, var_146_23, "story_v_out_116071", "116071036", "story_v_out_116071.awb")
			end
		end
	end,
	Play116071037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 116071037
		arg_147_1.duration_ = 9.199999999999

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play116071038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.fswbg_:SetActive(true)
				arg_147_1.dialog_:SetActive(false)

				arg_147_1.fswtw_.percent = 0

				local var_150_1 = arg_147_1:GetWordFromCfg(116071037)
				local var_150_2 = arg_147_1:FormatText(var_150_1.content)

				arg_147_1.fswt_.text = var_150_2

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.fswt_)

				arg_147_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_147_1.fswtw_:SetDirty()

				arg_147_1.typewritterCharCountI18N = 0

				SetActive(arg_147_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_147_1:ShowNextGo(false)
			end

			local var_150_3 = 0.0333333333333332

			if var_150_3 < arg_147_1.time_ and arg_147_1.time_ <= var_150_3 + arg_150_0 then
				arg_147_1.var_.oldValueTypewriter = arg_147_1.fswtw_.percent

				arg_147_1:ShowNextGo(false)
			end

			local var_150_4 = 55
			local var_150_5 = 9.16666666666667
			local var_150_6 = arg_147_1:GetWordFromCfg(116071037)
			local var_150_7 = arg_147_1:FormatText(var_150_6.content)
			local var_150_8, var_150_9 = arg_147_1:GetPercentByPara(var_150_7, 2)

			if var_150_3 < arg_147_1.time_ and arg_147_1.time_ <= var_150_3 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0

				local var_150_10 = var_150_4 <= 0 and var_150_5 or var_150_5 * ((var_150_9 - arg_147_1.typewritterCharCountI18N) / var_150_4)

				if var_150_10 > 0 and var_150_5 < var_150_10 then
					arg_147_1.talkMaxDuration = var_150_10

					if var_150_10 + var_150_3 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_10 + var_150_3
					end
				end
			end

			local var_150_11 = 9.16666666666667
			local var_150_12 = math.max(var_150_11, arg_147_1.talkMaxDuration)

			if var_150_3 <= arg_147_1.time_ and arg_147_1.time_ < var_150_3 + var_150_12 then
				local var_150_13 = (arg_147_1.time_ - var_150_3) / var_150_12

				arg_147_1.fswtw_.percent = Mathf.Lerp(arg_147_1.var_.oldValueTypewriter, var_150_8, var_150_13)
				arg_147_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_147_1.fswtw_:SetDirty()
			end

			if arg_147_1.time_ >= var_150_3 + var_150_12 and arg_147_1.time_ < var_150_3 + var_150_12 + arg_150_0 then
				arg_147_1.fswtw_.percent = var_150_8

				arg_147_1.fswtw_:SetDirty()
				arg_147_1:ShowNextGo(true)

				arg_147_1.typewritterCharCountI18N = var_150_9
			end

			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				local var_150_15 = arg_147_1.fswbg_.transform:Find("textbox/adapt/content") or arg_147_1.fswbg_.transform:Find("textbox/content")
				local var_150_16 = var_150_15:GetComponent("Text")
				local var_150_17 = var_150_15:GetComponent("RectTransform")

				var_150_16.alignment = UnityEngine.TextAnchor.MiddleLeft
				var_150_17.offsetMin = Vector2.New(150, 250)
				var_150_17.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play116071038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 116071038
		arg_151_1.duration_ = 6.666666666666

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play116071039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.var_.oldValueTypewriter = arg_151_1.fswtw_.percent

				arg_151_1:ShowNextGo(false)
			end

			local var_154_1 = 40
			local var_154_2 = 6.66666666666667
			local var_154_3 = arg_151_1:GetWordFromCfg(116071037)
			local var_154_4 = arg_151_1:FormatText(var_154_3.content)
			local var_154_5, var_154_6 = arg_151_1:GetPercentByPara(var_154_4, 3)

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0

				local var_154_7 = var_154_1 <= 0 and var_154_2 or var_154_2 * ((var_154_6 - arg_151_1.typewritterCharCountI18N) / var_154_1)

				if var_154_7 > 0 and var_154_2 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end
			end

			local var_154_8 = 6.66666666666667
			local var_154_9 = math.max(var_154_8, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_9 then
				local var_154_10 = (arg_151_1.time_ - var_154_0) / var_154_9

				arg_151_1.fswtw_.percent = Mathf.Lerp(arg_151_1.var_.oldValueTypewriter, var_154_5, var_154_10)
				arg_151_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_151_1.fswtw_:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_9 and arg_151_1.time_ < var_154_0 + var_154_9 + arg_154_0 then
				arg_151_1.fswtw_.percent = var_154_5

				arg_151_1.fswtw_:SetDirty()
				arg_151_1:ShowNextGo(true)

				arg_151_1.typewritterCharCountI18N = var_154_6
			end
		end
	end,
	Play116071039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 116071039
		arg_155_1.duration_ = 5.699999999999

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play116071040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.fswbg_:SetActive(true)
				arg_155_1.dialog_:SetActive(false)

				arg_155_1.fswtw_.percent = 0

				local var_158_1 = arg_155_1:GetWordFromCfg(116071039)
				local var_158_2 = arg_155_1:FormatText(var_158_1.content)

				arg_155_1.fswt_.text = var_158_2

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.fswt_)

				arg_155_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_155_1.fswtw_:SetDirty()

				arg_155_1.typewritterCharCountI18N = 0

				SetActive(arg_155_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_155_1:ShowNextGo(false)
			end

			local var_158_3 = 0.0333333333333332

			if var_158_3 < arg_155_1.time_ and arg_155_1.time_ <= var_158_3 + arg_158_0 then
				arg_155_1.var_.oldValueTypewriter = arg_155_1.fswtw_.percent

				arg_155_1:ShowNextGo(false)
			end

			local var_158_4 = 34
			local var_158_5 = 5.66666666666667
			local var_158_6 = arg_155_1:GetWordFromCfg(116071039)
			local var_158_7 = arg_155_1:FormatText(var_158_6.content)
			local var_158_8, var_158_9 = arg_155_1:GetPercentByPara(var_158_7, 1)

			if var_158_3 < arg_155_1.time_ and arg_155_1.time_ <= var_158_3 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0

				local var_158_10 = var_158_4 <= 0 and var_158_5 or var_158_5 * ((var_158_9 - arg_155_1.typewritterCharCountI18N) / var_158_4)

				if var_158_10 > 0 and var_158_5 < var_158_10 then
					arg_155_1.talkMaxDuration = var_158_10

					if var_158_10 + var_158_3 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_10 + var_158_3
					end
				end
			end

			local var_158_11 = 5.66666666666667
			local var_158_12 = math.max(var_158_11, arg_155_1.talkMaxDuration)

			if var_158_3 <= arg_155_1.time_ and arg_155_1.time_ < var_158_3 + var_158_12 then
				local var_158_13 = (arg_155_1.time_ - var_158_3) / var_158_12

				arg_155_1.fswtw_.percent = Mathf.Lerp(arg_155_1.var_.oldValueTypewriter, var_158_8, var_158_13)
				arg_155_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_155_1.fswtw_:SetDirty()
			end

			if arg_155_1.time_ >= var_158_3 + var_158_12 and arg_155_1.time_ < var_158_3 + var_158_12 + arg_158_0 then
				arg_155_1.fswtw_.percent = var_158_8

				arg_155_1.fswtw_:SetDirty()
				arg_155_1:ShowNextGo(true)

				arg_155_1.typewritterCharCountI18N = var_158_9
			end
		end
	end,
	Play116071040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 116071040
		arg_159_1.duration_ = 3.999999999999

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play116071041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.var_.oldValueTypewriter = arg_159_1.fswtw_.percent

				arg_159_1:ShowNextGo(false)
			end

			local var_162_1 = 24
			local var_162_2 = 4
			local var_162_3 = arg_159_1:GetWordFromCfg(116071039)
			local var_162_4 = arg_159_1:FormatText(var_162_3.content)
			local var_162_5, var_162_6 = arg_159_1:GetPercentByPara(var_162_4, 2)

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0

				local var_162_7 = var_162_1 <= 0 and var_162_2 or var_162_2 * ((var_162_6 - arg_159_1.typewritterCharCountI18N) / var_162_1)

				if var_162_7 > 0 and var_162_2 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end
			end

			local var_162_8 = 4
			local var_162_9 = math.max(var_162_8, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_9 then
				local var_162_10 = (arg_159_1.time_ - var_162_0) / var_162_9

				arg_159_1.fswtw_.percent = Mathf.Lerp(arg_159_1.var_.oldValueTypewriter, var_162_5, var_162_10)
				arg_159_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_159_1.fswtw_:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_9 and arg_159_1.time_ < var_162_0 + var_162_9 + arg_162_0 then
				arg_159_1.fswtw_.percent = var_162_5

				arg_159_1.fswtw_:SetDirty()
				arg_159_1:ShowNextGo(true)

				arg_159_1.typewritterCharCountI18N = var_162_6
			end
		end
	end,
	Play116071041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 116071041
		arg_163_1.duration_ = 4.666666666666

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play116071042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.var_.oldValueTypewriter = arg_163_1.fswtw_.percent

				arg_163_1:ShowNextGo(false)
			end

			local var_166_1 = 28
			local var_166_2 = 4.66666666666667
			local var_166_3 = arg_163_1:GetWordFromCfg(116071039)
			local var_166_4 = arg_163_1:FormatText(var_166_3.content)
			local var_166_5, var_166_6 = arg_163_1:GetPercentByPara(var_166_4, 3)

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0

				local var_166_7 = var_166_1 <= 0 and var_166_2 or var_166_2 * ((var_166_6 - arg_163_1.typewritterCharCountI18N) / var_166_1)

				if var_166_7 > 0 and var_166_2 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end
			end

			local var_166_8 = 4.66666666666667
			local var_166_9 = math.max(var_166_8, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_0) / var_166_9

				arg_163_1.fswtw_.percent = Mathf.Lerp(arg_163_1.var_.oldValueTypewriter, var_166_5, var_166_10)
				arg_163_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_163_1.fswtw_:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_9 and arg_163_1.time_ < var_166_0 + var_166_9 + arg_166_0 then
				arg_163_1.fswtw_.percent = var_166_5

				arg_163_1.fswtw_:SetDirty()
				arg_163_1:ShowNextGo(true)

				arg_163_1.typewritterCharCountI18N = var_166_6
			end
		end
	end,
	Play116071042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 116071042
		arg_167_1.duration_ = 6.999999999999

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play116071043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.bgs_.SK0110.transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPosSK0110 = var_170_0.localPosition
			end

			local var_170_2 = 5

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(0, 4, 5)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPosSK0110, var_170_4, var_170_3)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, 4, 5)
			end

			local var_170_5 = 0

			if var_170_5 < arg_167_1.time_ and arg_167_1.time_ <= var_170_5 + arg_170_0 then
				arg_167_1.allBtn_.enabled = false
			end

			local var_170_6 = 5

			if arg_167_1.time_ >= var_170_5 + var_170_6 and arg_167_1.time_ < var_170_5 + var_170_6 + arg_170_0 then
				arg_167_1.allBtn_.enabled = true
			end

			local var_170_7 = 0

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 then
				arg_167_1.var_.oldValueTypewriter = arg_167_1.fswtw_.percent

				arg_167_1:ShowNextGo(false)
			end

			local var_170_8 = 42
			local var_170_9 = 7
			local var_170_10 = arg_167_1:GetWordFromCfg(116071039)
			local var_170_11 = arg_167_1:FormatText(var_170_10.content)
			local var_170_12, var_170_13 = arg_167_1:GetPercentByPara(var_170_11, 4)

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0

				local var_170_14 = var_170_8 <= 0 and var_170_9 or var_170_9 * ((var_170_13 - arg_167_1.typewritterCharCountI18N) / var_170_8)

				if var_170_14 > 0 and var_170_9 < var_170_14 then
					arg_167_1.talkMaxDuration = var_170_14

					if var_170_14 + var_170_7 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_14 + var_170_7
					end
				end
			end

			local var_170_15 = 7
			local var_170_16 = math.max(var_170_15, arg_167_1.talkMaxDuration)

			if var_170_7 <= arg_167_1.time_ and arg_167_1.time_ < var_170_7 + var_170_16 then
				local var_170_17 = (arg_167_1.time_ - var_170_7) / var_170_16

				arg_167_1.fswtw_.percent = Mathf.Lerp(arg_167_1.var_.oldValueTypewriter, var_170_12, var_170_17)
				arg_167_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_167_1.fswtw_:SetDirty()
			end

			if arg_167_1.time_ >= var_170_7 + var_170_16 and arg_167_1.time_ < var_170_7 + var_170_16 + arg_170_0 then
				arg_167_1.fswtw_.percent = var_170_12

				arg_167_1.fswtw_:SetDirty()
				arg_167_1:ShowNextGo(true)

				arg_167_1.typewritterCharCountI18N = var_170_13
			end
		end
	end,
	Play116071043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 116071043
		arg_171_1.duration_ = 5.191999999999

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play116071044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.fswbg_:SetActive(true)
				arg_171_1.dialog_:SetActive(false)

				arg_171_1.fswtw_.percent = 0

				local var_174_1 = arg_171_1:GetWordFromCfg(116071043)
				local var_174_2 = arg_171_1:FormatText(var_174_1.content)

				arg_171_1.fswt_.text = var_174_2

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.fswt_)

				arg_171_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_171_1.fswtw_:SetDirty()

				arg_171_1.typewritterCharCountI18N = 0

				SetActive(arg_171_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_171_1:ShowNextGo(false)
			end

			local var_174_3 = 0.0166666666666667

			if var_174_3 < arg_171_1.time_ and arg_171_1.time_ <= var_174_3 + arg_174_0 then
				arg_171_1.var_.oldValueTypewriter = arg_171_1.fswtw_.percent

				arg_171_1:ShowNextGo(false)
			end

			local var_174_4 = 13
			local var_174_5 = 2.16666666666667
			local var_174_6 = arg_171_1:GetWordFromCfg(116071043)
			local var_174_7 = arg_171_1:FormatText(var_174_6.content)
			local var_174_8, var_174_9 = arg_171_1:GetPercentByPara(var_174_7, 1)

			if var_174_3 < arg_171_1.time_ and arg_171_1.time_ <= var_174_3 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0

				local var_174_10 = var_174_4 <= 0 and var_174_5 or var_174_5 * ((var_174_9 - arg_171_1.typewritterCharCountI18N) / var_174_4)

				if var_174_10 > 0 and var_174_5 < var_174_10 then
					arg_171_1.talkMaxDuration = var_174_10

					if var_174_10 + var_174_3 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_10 + var_174_3
					end
				end
			end

			local var_174_11 = 2.16666666666667
			local var_174_12 = math.max(var_174_11, arg_171_1.talkMaxDuration)

			if var_174_3 <= arg_171_1.time_ and arg_171_1.time_ < var_174_3 + var_174_12 then
				local var_174_13 = (arg_171_1.time_ - var_174_3) / var_174_12

				arg_171_1.fswtw_.percent = Mathf.Lerp(arg_171_1.var_.oldValueTypewriter, var_174_8, var_174_13)
				arg_171_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_171_1.fswtw_:SetDirty()
			end

			if arg_171_1.time_ >= var_174_3 + var_174_12 and arg_171_1.time_ < var_174_3 + var_174_12 + arg_174_0 then
				arg_171_1.fswtw_.percent = var_174_8

				arg_171_1.fswtw_:SetDirty()
				arg_171_1:ShowNextGo(true)

				arg_171_1.typewritterCharCountI18N = var_174_9
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				local var_174_15 = arg_171_1.fswbg_.transform:Find("textbox/adapt/content") or arg_171_1.fswbg_.transform:Find("textbox/content")
				local var_174_16 = var_174_15:GetComponent("Text")
				local var_174_17 = var_174_15:GetComponent("RectTransform")

				var_174_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_174_17.offsetMin = Vector2.New(0, 0)
				var_174_17.offsetMax = Vector2.New(1000, -400)
			end

			local var_174_18 = 0
			local var_174_19 = 5.192
			local var_174_20 = manager.audio:GetVoiceLength("story_v_out_116071", "116071043", "story_v_out_116071.awb") / 1000

			if var_174_20 > 0 and var_174_19 < var_174_20 and var_174_20 + var_174_18 > arg_171_1.duration_ then
				local var_174_21 = var_174_20

				arg_171_1.duration_ = var_174_20 + var_174_18
			end

			if var_174_18 < arg_171_1.time_ and arg_171_1.time_ <= var_174_18 + arg_174_0 then
				local var_174_22 = "play"
				local var_174_23 = "voice"

				arg_171_1:AudioAction(var_174_22, var_174_23, "story_v_out_116071", "116071043", "story_v_out_116071.awb")
			end
		end
	end,
	Play116071044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 116071044
		arg_175_1.duration_ = 1.699999999999

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play116071045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.fswbg_:SetActive(true)
				arg_175_1.dialog_:SetActive(false)

				arg_175_1.fswtw_.percent = 0

				local var_178_1 = arg_175_1:GetWordFromCfg(116071044)
				local var_178_2 = arg_175_1:FormatText(var_178_1.content)

				arg_175_1.fswt_.text = var_178_2

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.fswt_)

				arg_175_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_175_1.fswtw_:SetDirty()

				arg_175_1.typewritterCharCountI18N = 0

				SetActive(arg_175_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_175_1:ShowNextGo(false)
			end

			local var_178_3 = 0.0333333333333332

			if var_178_3 < arg_175_1.time_ and arg_175_1.time_ <= var_178_3 + arg_178_0 then
				arg_175_1.var_.oldValueTypewriter = arg_175_1.fswtw_.percent

				arg_175_1:ShowNextGo(false)
			end

			local var_178_4 = 10
			local var_178_5 = 1.66666666666667
			local var_178_6 = arg_175_1:GetWordFromCfg(116071044)
			local var_178_7 = arg_175_1:FormatText(var_178_6.content)
			local var_178_8, var_178_9 = arg_175_1:GetPercentByPara(var_178_7, 1)

			if var_178_3 < arg_175_1.time_ and arg_175_1.time_ <= var_178_3 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0

				local var_178_10 = var_178_4 <= 0 and var_178_5 or var_178_5 * ((var_178_9 - arg_175_1.typewritterCharCountI18N) / var_178_4)

				if var_178_10 > 0 and var_178_5 < var_178_10 then
					arg_175_1.talkMaxDuration = var_178_10

					if var_178_10 + var_178_3 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_10 + var_178_3
					end
				end
			end

			local var_178_11 = 1.66666666666667
			local var_178_12 = math.max(var_178_11, arg_175_1.talkMaxDuration)

			if var_178_3 <= arg_175_1.time_ and arg_175_1.time_ < var_178_3 + var_178_12 then
				local var_178_13 = (arg_175_1.time_ - var_178_3) / var_178_12

				arg_175_1.fswtw_.percent = Mathf.Lerp(arg_175_1.var_.oldValueTypewriter, var_178_8, var_178_13)
				arg_175_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_175_1.fswtw_:SetDirty()
			end

			if arg_175_1.time_ >= var_178_3 + var_178_12 and arg_175_1.time_ < var_178_3 + var_178_12 + arg_178_0 then
				arg_175_1.fswtw_.percent = var_178_8

				arg_175_1.fswtw_:SetDirty()
				arg_175_1:ShowNextGo(true)

				arg_175_1.typewritterCharCountI18N = var_178_9
			end

			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				local var_178_15 = arg_175_1.fswbg_.transform:Find("textbox/adapt/content") or arg_175_1.fswbg_.transform:Find("textbox/content")
				local var_178_16 = var_178_15:GetComponent("Text")
				local var_178_17 = var_178_15:GetComponent("RectTransform")

				var_178_16.alignment = UnityEngine.TextAnchor.MiddleLeft
				var_178_17.offsetMin = Vector2.New(150, 250)
				var_178_17.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play116071045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 116071045
		arg_179_1.duration_ = 9.499999999999

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play116071046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.bgs_.SK0110.transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPosSK0110 = var_182_0.localPosition
			end

			local var_182_2 = 8

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0, 2, 5)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPosSK0110, var_182_4, var_182_3)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, 2, 5)
			end

			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 then
				arg_179_1.allBtn_.enabled = false
			end

			local var_182_6 = 7.999999999999

			if arg_179_1.time_ >= var_182_5 + var_182_6 and arg_179_1.time_ < var_182_5 + var_182_6 + arg_182_0 then
				arg_179_1.allBtn_.enabled = true
			end

			local var_182_7 = 0

			if var_182_7 < arg_179_1.time_ and arg_179_1.time_ <= var_182_7 + arg_182_0 then
				arg_179_1.var_.oldValueTypewriter = arg_179_1.fswtw_.percent

				arg_179_1:ShowNextGo(false)
			end

			local var_182_8 = 57
			local var_182_9 = 9.5
			local var_182_10 = arg_179_1:GetWordFromCfg(116071044)
			local var_182_11 = arg_179_1:FormatText(var_182_10.content)
			local var_182_12, var_182_13 = arg_179_1:GetPercentByPara(var_182_11, 3)

			if var_182_7 < arg_179_1.time_ and arg_179_1.time_ <= var_182_7 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0

				local var_182_14 = var_182_8 <= 0 and var_182_9 or var_182_9 * ((var_182_13 - arg_179_1.typewritterCharCountI18N) / var_182_8)

				if var_182_14 > 0 and var_182_9 < var_182_14 then
					arg_179_1.talkMaxDuration = var_182_14

					if var_182_14 + var_182_7 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_14 + var_182_7
					end
				end
			end

			local var_182_15 = 9.5
			local var_182_16 = math.max(var_182_15, arg_179_1.talkMaxDuration)

			if var_182_7 <= arg_179_1.time_ and arg_179_1.time_ < var_182_7 + var_182_16 then
				local var_182_17 = (arg_179_1.time_ - var_182_7) / var_182_16

				arg_179_1.fswtw_.percent = Mathf.Lerp(arg_179_1.var_.oldValueTypewriter, var_182_12, var_182_17)
				arg_179_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_179_1.fswtw_:SetDirty()
			end

			if arg_179_1.time_ >= var_182_7 + var_182_16 and arg_179_1.time_ < var_182_7 + var_182_16 + arg_182_0 then
				arg_179_1.fswtw_.percent = var_182_12

				arg_179_1.fswtw_:SetDirty()
				arg_179_1:ShowNextGo(true)

				arg_179_1.typewritterCharCountI18N = var_182_13
			end
		end
	end,
	Play116071046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 116071046
		arg_183_1.duration_ = 8.524999999999

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play116071047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = "SK0110b"

			if arg_183_1.bgs_[var_186_0] == nil then
				local var_186_1 = Object.Instantiate(arg_183_1.paintGo_)

				var_186_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_186_0)
				var_186_1.name = var_186_0
				var_186_1.transform.parent = arg_183_1.stage_.transform
				var_186_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_183_1.bgs_[var_186_0] = var_186_1
			end

			local var_186_2 = 0

			if var_186_2 < arg_183_1.time_ and arg_183_1.time_ <= var_186_2 + arg_186_0 then
				local var_186_3 = manager.ui.mainCamera.transform.localPosition
				local var_186_4 = Vector3.New(0, 0, 10) + Vector3.New(var_186_3.x, var_186_3.y, 0)
				local var_186_5 = arg_183_1.bgs_.SK0110b

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
					if iter_186_0 ~= "SK0110b" then
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
				local var_186_19 = Color.New(1, 1, 1)

				var_186_19.a = Mathf.Lerp(1, 0, var_186_18)
				arg_183_1.mask_.color = var_186_19
			end

			if arg_183_1.time_ >= var_186_16 + var_186_17 and arg_183_1.time_ < var_186_16 + var_186_17 + arg_186_0 then
				local var_186_20 = Color.New(1, 1, 1)
				local var_186_21 = 0

				arg_183_1.mask_.enabled = false
				var_186_20.a = var_186_21
				arg_183_1.mask_.color = var_186_20
			end

			local var_186_22 = 2
			local var_186_23 = 1

			if var_186_22 < arg_183_1.time_ and arg_183_1.time_ <= var_186_22 + arg_186_0 then
				local var_186_24 = "play"
				local var_186_25 = "effect"

				arg_183_1:AudioAction(var_186_24, var_186_25, "se_story_16", "se_story_16_thunder02", "")
			end

			local var_186_26 = arg_183_1.bgs_.SK0110b.transform
			local var_186_27 = 0

			if var_186_27 < arg_183_1.time_ and arg_183_1.time_ <= var_186_27 + arg_186_0 then
				arg_183_1.var_.moveOldPosSK0110b = var_186_26.localPosition
			end

			local var_186_28 = 0.001

			if var_186_27 <= arg_183_1.time_ and arg_183_1.time_ < var_186_27 + var_186_28 then
				local var_186_29 = (arg_183_1.time_ - var_186_27) / var_186_28
				local var_186_30 = Vector3.New(0, 2, 5)

				var_186_26.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPosSK0110b, var_186_30, var_186_29)
			end

			if arg_183_1.time_ >= var_186_27 + var_186_28 and arg_183_1.time_ < var_186_27 + var_186_28 + arg_186_0 then
				var_186_26.localPosition = Vector3.New(0, 2, 5)
			end

			local var_186_31 = 2.025

			if var_186_31 < arg_183_1.time_ and arg_183_1.time_ <= var_186_31 + arg_186_0 then
				arg_183_1.var_.oldValueTypewriter = arg_183_1.fswtw_.percent

				arg_183_1:ShowNextGo(false)
			end

			local var_186_32 = 39
			local var_186_33 = 6.5
			local var_186_34 = arg_183_1:GetWordFromCfg(116071044)
			local var_186_35 = arg_183_1:FormatText(var_186_34.content)
			local var_186_36, var_186_37 = arg_183_1:GetPercentByPara(var_186_35, 4)

			if var_186_31 < arg_183_1.time_ and arg_183_1.time_ <= var_186_31 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0

				local var_186_38 = var_186_32 <= 0 and var_186_33 or var_186_33 * ((var_186_37 - arg_183_1.typewritterCharCountI18N) / var_186_32)

				if var_186_38 > 0 and var_186_33 < var_186_38 then
					arg_183_1.talkMaxDuration = var_186_38

					if var_186_38 + var_186_31 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_38 + var_186_31
					end
				end
			end

			local var_186_39 = 6.5
			local var_186_40 = math.max(var_186_39, arg_183_1.talkMaxDuration)

			if var_186_31 <= arg_183_1.time_ and arg_183_1.time_ < var_186_31 + var_186_40 then
				local var_186_41 = (arg_183_1.time_ - var_186_31) / var_186_40

				arg_183_1.fswtw_.percent = Mathf.Lerp(arg_183_1.var_.oldValueTypewriter, var_186_36, var_186_41)
				arg_183_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_183_1.fswtw_:SetDirty()
			end

			if arg_183_1.time_ >= var_186_31 + var_186_40 and arg_183_1.time_ < var_186_31 + var_186_40 + arg_186_0 then
				arg_183_1.fswtw_.percent = var_186_36

				arg_183_1.fswtw_:SetDirty()
				arg_183_1:ShowNextGo(true)

				arg_183_1.typewritterCharCountI18N = var_186_37
			end
		end
	end,
	Play116071047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 116071047
		arg_187_1.duration_ = 4.027999999999

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play116071048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.fswbg_:SetActive(true)
				arg_187_1.dialog_:SetActive(false)

				arg_187_1.fswtw_.percent = 0

				local var_190_1 = arg_187_1:GetWordFromCfg(116071047)
				local var_190_2 = arg_187_1:FormatText(var_190_1.content)

				arg_187_1.fswt_.text = var_190_2

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.fswt_)

				arg_187_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_187_1.fswtw_:SetDirty()

				arg_187_1.typewritterCharCountI18N = 0

				SetActive(arg_187_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_187_1:ShowNextGo(false)
			end

			local var_190_3 = 0.0166666666666667

			if var_190_3 < arg_187_1.time_ and arg_187_1.time_ <= var_190_3 + arg_190_0 then
				arg_187_1.var_.oldValueTypewriter = arg_187_1.fswtw_.percent

				arg_187_1:ShowNextGo(false)
			end

			local var_190_4 = 8
			local var_190_5 = 1.33333333333333
			local var_190_6 = arg_187_1:GetWordFromCfg(116071047)
			local var_190_7 = arg_187_1:FormatText(var_190_6.content)
			local var_190_8, var_190_9 = arg_187_1:GetPercentByPara(var_190_7, 1)

			if var_190_3 < arg_187_1.time_ and arg_187_1.time_ <= var_190_3 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0

				local var_190_10 = var_190_4 <= 0 and var_190_5 or var_190_5 * ((var_190_9 - arg_187_1.typewritterCharCountI18N) / var_190_4)

				if var_190_10 > 0 and var_190_5 < var_190_10 then
					arg_187_1.talkMaxDuration = var_190_10

					if var_190_10 + var_190_3 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_10 + var_190_3
					end
				end
			end

			local var_190_11 = 1.33333333333333
			local var_190_12 = math.max(var_190_11, arg_187_1.talkMaxDuration)

			if var_190_3 <= arg_187_1.time_ and arg_187_1.time_ < var_190_3 + var_190_12 then
				local var_190_13 = (arg_187_1.time_ - var_190_3) / var_190_12

				arg_187_1.fswtw_.percent = Mathf.Lerp(arg_187_1.var_.oldValueTypewriter, var_190_8, var_190_13)
				arg_187_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_187_1.fswtw_:SetDirty()
			end

			if arg_187_1.time_ >= var_190_3 + var_190_12 and arg_187_1.time_ < var_190_3 + var_190_12 + arg_190_0 then
				arg_187_1.fswtw_.percent = var_190_8

				arg_187_1.fswtw_:SetDirty()
				arg_187_1:ShowNextGo(true)

				arg_187_1.typewritterCharCountI18N = var_190_9
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				local var_190_15 = arg_187_1.fswbg_.transform:Find("textbox/adapt/content") or arg_187_1.fswbg_.transform:Find("textbox/content")
				local var_190_16 = var_190_15:GetComponent("Text")
				local var_190_17 = var_190_15:GetComponent("RectTransform")

				var_190_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_190_17.offsetMin = Vector2.New(0, 0)
				var_190_17.offsetMax = Vector2.New(1000, -400)
			end

			local var_190_18 = 0
			local var_190_19 = 4.028
			local var_190_20 = manager.audio:GetVoiceLength("story_v_out_116071", "116071047", "story_v_out_116071.awb") / 1000

			if var_190_20 > 0 and var_190_19 < var_190_20 and var_190_20 + var_190_18 > arg_187_1.duration_ then
				local var_190_21 = var_190_20

				arg_187_1.duration_ = var_190_20 + var_190_18
			end

			if var_190_18 < arg_187_1.time_ and arg_187_1.time_ <= var_190_18 + arg_190_0 then
				local var_190_22 = "play"
				local var_190_23 = "voice"

				arg_187_1:AudioAction(var_190_22, var_190_23, "story_v_out_116071", "116071047", "story_v_out_116071.awb")
			end
		end
	end,
	Play116071048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 116071048
		arg_191_1.duration_ = 5.555999999999

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play116071049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.fswbg_:SetActive(true)
				arg_191_1.dialog_:SetActive(false)

				arg_191_1.fswtw_.percent = 0

				local var_194_1 = arg_191_1:GetWordFromCfg(116071048)
				local var_194_2 = arg_191_1:FormatText(var_194_1.content)

				arg_191_1.fswt_.text = var_194_2

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.fswt_)

				arg_191_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_191_1.fswtw_:SetDirty()

				arg_191_1.typewritterCharCountI18N = 0

				SetActive(arg_191_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_191_1:ShowNextGo(false)
			end

			local var_194_3 = 0.0166666666666667

			if var_194_3 < arg_191_1.time_ and arg_191_1.time_ <= var_194_3 + arg_194_0 then
				arg_191_1.var_.oldValueTypewriter = arg_191_1.fswtw_.percent

				arg_191_1:ShowNextGo(false)
			end

			local var_194_4 = 11
			local var_194_5 = 1.83333333333333
			local var_194_6 = arg_191_1:GetWordFromCfg(116071048)
			local var_194_7 = arg_191_1:FormatText(var_194_6.content)
			local var_194_8, var_194_9 = arg_191_1:GetPercentByPara(var_194_7, 1)

			if var_194_3 < arg_191_1.time_ and arg_191_1.time_ <= var_194_3 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0

				local var_194_10 = var_194_4 <= 0 and var_194_5 or var_194_5 * ((var_194_9 - arg_191_1.typewritterCharCountI18N) / var_194_4)

				if var_194_10 > 0 and var_194_5 < var_194_10 then
					arg_191_1.talkMaxDuration = var_194_10

					if var_194_10 + var_194_3 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_10 + var_194_3
					end
				end
			end

			local var_194_11 = 1.83333333333333
			local var_194_12 = math.max(var_194_11, arg_191_1.talkMaxDuration)

			if var_194_3 <= arg_191_1.time_ and arg_191_1.time_ < var_194_3 + var_194_12 then
				local var_194_13 = (arg_191_1.time_ - var_194_3) / var_194_12

				arg_191_1.fswtw_.percent = Mathf.Lerp(arg_191_1.var_.oldValueTypewriter, var_194_8, var_194_13)
				arg_191_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_191_1.fswtw_:SetDirty()
			end

			if arg_191_1.time_ >= var_194_3 + var_194_12 and arg_191_1.time_ < var_194_3 + var_194_12 + arg_194_0 then
				arg_191_1.fswtw_.percent = var_194_8

				arg_191_1.fswtw_:SetDirty()
				arg_191_1:ShowNextGo(true)

				arg_191_1.typewritterCharCountI18N = var_194_9
			end

			local var_194_14 = 0
			local var_194_15 = 5.556
			local var_194_16 = manager.audio:GetVoiceLength("story_v_out_116071", "116071048", "story_v_out_116071.awb") / 1000

			if var_194_16 > 0 and var_194_15 < var_194_16 and var_194_16 + var_194_14 > arg_191_1.duration_ then
				local var_194_17 = var_194_16

				arg_191_1.duration_ = var_194_16 + var_194_14
			end

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 then
				local var_194_18 = "play"
				local var_194_19 = "voice"

				arg_191_1:AudioAction(var_194_18, var_194_19, "story_v_out_116071", "116071048", "story_v_out_116071.awb")
			end
		end
	end,
	Play116071049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 116071049
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play116071050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.fswbg_:SetActive(false)
				arg_195_1.dialog_:SetActive(true)
				arg_195_1:ShowNextGo(false)
			end

			local var_198_1 = 0
			local var_198_2 = 0.725

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0

				arg_195_1.dialog_:SetActive(true)

				local var_198_3 = LeanTween.value(arg_195_1.dialog_, 0, 1, 0.3)

				var_198_3:setOnUpdate(LuaHelper.FloatAction(function(arg_199_0)
					arg_195_1.dialogCg_.alpha = arg_199_0
				end))
				var_198_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_195_1.dialog_)
					var_198_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_195_1.duration_ = arg_195_1.duration_ + 0.3

				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_4 = arg_195_1:FormatText(StoryNameCfg[7].name)

				arg_195_1.leftNameTxt_.text = var_198_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_5 = arg_195_1:GetWordFromCfg(116071049)
				local var_198_6 = arg_195_1:FormatText(var_198_5.content)

				arg_195_1.text_.text = var_198_6

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_7 = 29
				local var_198_8 = utf8.len(var_198_6)
				local var_198_9 = var_198_7 <= 0 and var_198_2 or var_198_2 * (var_198_8 / var_198_7)

				if var_198_9 > 0 and var_198_2 < var_198_9 then
					arg_195_1.talkMaxDuration = var_198_9
					var_198_1 = var_198_1 + 0.3

					if var_198_9 + var_198_1 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_9 + var_198_1
					end
				end

				arg_195_1.text_.text = var_198_6
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_10 = var_198_1 + 0.3
			local var_198_11 = math.max(var_198_2, arg_195_1.talkMaxDuration)

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_10) / var_198_11

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play116071050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 116071050
		arg_201_1.duration_ = 9

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play116071051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = "ST01a"

			if arg_201_1.bgs_[var_204_0] == nil then
				local var_204_1 = Object.Instantiate(arg_201_1.paintGo_)

				var_204_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_204_0)
				var_204_1.name = var_204_0
				var_204_1.transform.parent = arg_201_1.stage_.transform
				var_204_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_201_1.bgs_[var_204_0] = var_204_1
			end

			local var_204_2 = 2

			if var_204_2 < arg_201_1.time_ and arg_201_1.time_ <= var_204_2 + arg_204_0 then
				local var_204_3 = manager.ui.mainCamera.transform.localPosition
				local var_204_4 = Vector3.New(0, 0, 10) + Vector3.New(var_204_3.x, var_204_3.y, 0)
				local var_204_5 = arg_201_1.bgs_.ST01a

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
					if iter_204_0 ~= "ST01a" then
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

			local var_204_17 = 2

			if var_204_16 <= arg_201_1.time_ and arg_201_1.time_ < var_204_16 + var_204_17 then
				local var_204_18 = (arg_201_1.time_ - var_204_16) / var_204_17
				local var_204_19 = Color.New(0, 0, 0)

				var_204_19.a = Mathf.Lerp(0, 1, var_204_18)
				arg_201_1.mask_.color = var_204_19
			end

			if arg_201_1.time_ >= var_204_16 + var_204_17 and arg_201_1.time_ < var_204_16 + var_204_17 + arg_204_0 then
				local var_204_20 = Color.New(0, 0, 0)

				var_204_20.a = 1
				arg_201_1.mask_.color = var_204_20
			end

			local var_204_21 = 2

			if var_204_21 < arg_201_1.time_ and arg_201_1.time_ <= var_204_21 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_22 = 2

			if var_204_21 <= arg_201_1.time_ and arg_201_1.time_ < var_204_21 + var_204_22 then
				local var_204_23 = (arg_201_1.time_ - var_204_21) / var_204_22
				local var_204_24 = Color.New(0, 0, 0)

				var_204_24.a = Mathf.Lerp(1, 0, var_204_23)
				arg_201_1.mask_.color = var_204_24
			end

			if arg_201_1.time_ >= var_204_21 + var_204_22 and arg_201_1.time_ < var_204_21 + var_204_22 + arg_204_0 then
				local var_204_25 = Color.New(0, 0, 0)
				local var_204_26 = 0

				arg_201_1.mask_.enabled = false
				var_204_25.a = var_204_26
				arg_201_1.mask_.color = var_204_25
			end

			if arg_201_1.frameCnt_ <= 1 then
				arg_201_1.dialog_:SetActive(false)
			end

			local var_204_27 = 4
			local var_204_28 = 0.6

			if var_204_27 < arg_201_1.time_ and arg_201_1.time_ <= var_204_27 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0

				arg_201_1.dialog_:SetActive(true)

				local var_204_29 = LeanTween.value(arg_201_1.dialog_, 0, 1, 0.3)

				var_204_29:setOnUpdate(LuaHelper.FloatAction(function(arg_205_0)
					arg_201_1.dialogCg_.alpha = arg_205_0
				end))
				var_204_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_201_1.dialog_)
					var_204_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_201_1.duration_ = arg_201_1.duration_ + 0.3

				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_30 = arg_201_1:GetWordFromCfg(116071050)
				local var_204_31 = arg_201_1:FormatText(var_204_30.content)

				arg_201_1.text_.text = var_204_31

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_32 = 24
				local var_204_33 = utf8.len(var_204_31)
				local var_204_34 = var_204_32 <= 0 and var_204_28 or var_204_28 * (var_204_33 / var_204_32)

				if var_204_34 > 0 and var_204_28 < var_204_34 then
					arg_201_1.talkMaxDuration = var_204_34
					var_204_27 = var_204_27 + 0.3

					if var_204_34 + var_204_27 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_34 + var_204_27
					end
				end

				arg_201_1.text_.text = var_204_31
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_35 = var_204_27 + 0.3
			local var_204_36 = math.max(var_204_28, arg_201_1.talkMaxDuration)

			if var_204_35 <= arg_201_1.time_ and arg_201_1.time_ < var_204_35 + var_204_36 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_35) / var_204_36

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_35 + var_204_36 and arg_201_1.time_ < var_204_35 + var_204_36 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play116071051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 116071051
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play116071052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.775

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_2 = arg_207_1:GetWordFromCfg(116071051)
				local var_210_3 = arg_207_1:FormatText(var_210_2.content)

				arg_207_1.text_.text = var_210_3

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_4 = 31
				local var_210_5 = utf8.len(var_210_3)
				local var_210_6 = var_210_4 <= 0 and var_210_1 or var_210_1 * (var_210_5 / var_210_4)

				if var_210_6 > 0 and var_210_1 < var_210_6 then
					arg_207_1.talkMaxDuration = var_210_6

					if var_210_6 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_6 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_3
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_7 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_7 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_7

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_7 and arg_207_1.time_ < var_210_0 + var_210_7 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play116071052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 116071052
		arg_211_1.duration_ = 5.066666666666

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play116071053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 2

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.fswbg_:SetActive(true)
				arg_211_1.dialog_:SetActive(false)

				arg_211_1.fswtw_.percent = 0

				local var_214_1 = arg_211_1:GetWordFromCfg(116071052)
				local var_214_2 = arg_211_1:FormatText(var_214_1.content)

				arg_211_1.fswt_.text = var_214_2

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.fswt_)

				arg_211_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_211_1.fswtw_:SetDirty()

				arg_211_1.typewritterCharCountI18N = 0

				SetActive(arg_211_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_211_1:ShowNextGo(false)
			end

			local var_214_3 = 2.86666666666667

			if var_214_3 < arg_211_1.time_ and arg_211_1.time_ <= var_214_3 + arg_214_0 then
				arg_211_1.var_.oldValueTypewriter = arg_211_1.fswtw_.percent

				arg_211_1:ShowNextGo(false)
			end

			local var_214_4 = 17
			local var_214_5 = 1.13333333333333
			local var_214_6 = arg_211_1:GetWordFromCfg(116071052)
			local var_214_7 = arg_211_1:FormatText(var_214_6.content)
			local var_214_8, var_214_9 = arg_211_1:GetPercentByPara(var_214_7, 1)

			if var_214_3 < arg_211_1.time_ and arg_211_1.time_ <= var_214_3 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0

				local var_214_10 = var_214_4 <= 0 and var_214_5 or var_214_5 * ((var_214_9 - arg_211_1.typewritterCharCountI18N) / var_214_4)

				if var_214_10 > 0 and var_214_5 < var_214_10 then
					arg_211_1.talkMaxDuration = var_214_10

					if var_214_10 + var_214_3 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_10 + var_214_3
					end
				end
			end

			local var_214_11 = 1.13333333333333
			local var_214_12 = math.max(var_214_11, arg_211_1.talkMaxDuration)

			if var_214_3 <= arg_211_1.time_ and arg_211_1.time_ < var_214_3 + var_214_12 then
				local var_214_13 = (arg_211_1.time_ - var_214_3) / var_214_12

				arg_211_1.fswtw_.percent = Mathf.Lerp(arg_211_1.var_.oldValueTypewriter, var_214_8, var_214_13)
				arg_211_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_211_1.fswtw_:SetDirty()
			end

			if arg_211_1.time_ >= var_214_3 + var_214_12 and arg_211_1.time_ < var_214_3 + var_214_12 + arg_214_0 then
				arg_211_1.fswtw_.percent = var_214_8

				arg_211_1.fswtw_:SetDirty()
				arg_211_1:ShowNextGo(true)

				arg_211_1.typewritterCharCountI18N = var_214_9
			end

			local var_214_14 = 2.85

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 then
				local var_214_15 = arg_211_1.fswbg_.transform:Find("textbox/adapt/content") or arg_211_1.fswbg_.transform:Find("textbox/content")
				local var_214_16 = var_214_15:GetComponent("Text")
				local var_214_17 = var_214_15:GetComponent("RectTransform")

				var_214_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_214_17.offsetMin = Vector2.New(0, 0)
				var_214_17.offsetMax = Vector2.New(0, 0)
			end

			local var_214_18 = 0

			if var_214_18 < arg_211_1.time_ and arg_211_1.time_ <= var_214_18 + arg_214_0 then
				arg_211_1.mask_.enabled = true
				arg_211_1.mask_.raycastTarget = true

				arg_211_1:SetGaussion(false)
			end

			local var_214_19 = 2

			if var_214_18 <= arg_211_1.time_ and arg_211_1.time_ < var_214_18 + var_214_19 then
				local var_214_20 = (arg_211_1.time_ - var_214_18) / var_214_19
				local var_214_21 = Color.New(0, 0, 0)

				var_214_21.a = Mathf.Lerp(0, 1, var_214_20)
				arg_211_1.mask_.color = var_214_21
			end

			if arg_211_1.time_ >= var_214_18 + var_214_19 and arg_211_1.time_ < var_214_18 + var_214_19 + arg_214_0 then
				local var_214_22 = Color.New(0, 0, 0)

				var_214_22.a = 1
				arg_211_1.mask_.color = var_214_22
			end

			local var_214_23 = 2

			if var_214_23 < arg_211_1.time_ and arg_211_1.time_ <= var_214_23 + arg_214_0 then
				arg_211_1.mask_.enabled = true
				arg_211_1.mask_.raycastTarget = true

				arg_211_1:SetGaussion(false)
			end

			local var_214_24 = 2

			if var_214_23 <= arg_211_1.time_ and arg_211_1.time_ < var_214_23 + var_214_24 then
				local var_214_25 = (arg_211_1.time_ - var_214_23) / var_214_24
				local var_214_26 = Color.New(0, 0, 0)

				var_214_26.a = Mathf.Lerp(1, 0, var_214_25)
				arg_211_1.mask_.color = var_214_26
			end

			if arg_211_1.time_ >= var_214_23 + var_214_24 and arg_211_1.time_ < var_214_23 + var_214_24 + arg_214_0 then
				local var_214_27 = Color.New(0, 0, 0)
				local var_214_28 = 0

				arg_211_1.mask_.enabled = false
				var_214_27.a = var_214_28
				arg_211_1.mask_.color = var_214_27
			end

			local var_214_29 = "STblack"

			if arg_211_1.bgs_[var_214_29] == nil then
				local var_214_30 = Object.Instantiate(arg_211_1.paintGo_)

				var_214_30:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_214_29)
				var_214_30.name = var_214_29
				var_214_30.transform.parent = arg_211_1.stage_.transform
				var_214_30.transform.localPosition = Vector3.New(0, 100, 0)
				arg_211_1.bgs_[var_214_29] = var_214_30
			end

			local var_214_31 = 2

			if var_214_31 < arg_211_1.time_ and arg_211_1.time_ <= var_214_31 + arg_214_0 then
				local var_214_32 = manager.ui.mainCamera.transform.localPosition
				local var_214_33 = Vector3.New(0, 0, 10) + Vector3.New(var_214_32.x, var_214_32.y, 0)
				local var_214_34 = arg_211_1.bgs_.STblack

				var_214_34.transform.localPosition = var_214_33
				var_214_34.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_214_35 = var_214_34:GetComponent("SpriteRenderer")

				if var_214_35 and var_214_35.sprite then
					local var_214_36 = (var_214_34.transform.localPosition - var_214_32).z
					local var_214_37 = manager.ui.mainCameraCom_
					local var_214_38 = 2 * var_214_36 * Mathf.Tan(var_214_37.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_214_39 = var_214_38 * var_214_37.aspect
					local var_214_40 = var_214_35.sprite.bounds.size.x
					local var_214_41 = var_214_35.sprite.bounds.size.y
					local var_214_42 = var_214_39 / var_214_40
					local var_214_43 = var_214_38 / var_214_41
					local var_214_44 = var_214_43 < var_214_42 and var_214_42 or var_214_43

					var_214_34.transform.localScale = Vector3.New(var_214_44, var_214_44, 0)
				end

				for iter_214_0, iter_214_1 in pairs(arg_211_1.bgs_) do
					if iter_214_0 ~= "STblack" then
						iter_214_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end
		end
	end,
	Play116071053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 116071053
		arg_215_1.duration_ = 1.816666666666

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play116071054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.fswbg_:SetActive(true)
				arg_215_1.dialog_:SetActive(false)

				arg_215_1.fswtw_.percent = 0

				local var_218_1 = arg_215_1:GetWordFromCfg(116071053)
				local var_218_2 = arg_215_1:FormatText(var_218_1.content)

				arg_215_1.fswt_.text = var_218_2

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.fswt_)

				arg_215_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_215_1.fswtw_:SetDirty()

				arg_215_1.typewritterCharCountI18N = 0

				SetActive(arg_215_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_215_1:ShowNextGo(false)
			end

			local var_218_3 = 0.0166666666666667

			if var_218_3 < arg_215_1.time_ and arg_215_1.time_ <= var_218_3 + arg_218_0 then
				arg_215_1.var_.oldValueTypewriter = arg_215_1.fswtw_.percent

				arg_215_1:ShowNextGo(false)
			end

			local var_218_4 = 27
			local var_218_5 = 1.8
			local var_218_6 = arg_215_1:GetWordFromCfg(116071053)
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

			local var_218_11 = 1.8
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
	Play116071054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 116071054
		arg_219_1.duration_ = 1.466666666666

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
			arg_219_1.auto_ = false
		end

		function arg_219_1.playNext_(arg_221_0)
			arg_219_1.onStoryFinished_()
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.fswbg_:SetActive(true)
				arg_219_1.dialog_:SetActive(false)

				arg_219_1.fswtw_.percent = 0

				local var_222_1 = arg_219_1:GetWordFromCfg(116071054)
				local var_222_2 = arg_219_1:FormatText(var_222_1.content)

				arg_219_1.fswt_.text = var_222_2

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.fswt_)

				arg_219_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_219_1.fswtw_:SetDirty()

				arg_219_1.typewritterCharCountI18N = 0

				SetActive(arg_219_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_219_1:ShowNextGo(false)
			end

			local var_222_3 = 0.0166666666666667

			if var_222_3 < arg_219_1.time_ and arg_219_1.time_ <= var_222_3 + arg_222_0 then
				arg_219_1.var_.oldValueTypewriter = arg_219_1.fswtw_.percent

				arg_219_1:ShowNextGo(false)
			end

			local var_222_4 = 19
			local var_222_5 = 1.26666666666667
			local var_222_6 = arg_219_1:GetWordFromCfg(116071054)
			local var_222_7 = arg_219_1:FormatText(var_222_6.content)
			local var_222_8, var_222_9 = arg_219_1:GetPercentByPara(var_222_7, 1)

			if var_222_3 < arg_219_1.time_ and arg_219_1.time_ <= var_222_3 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0

				local var_222_10 = var_222_4 <= 0 and var_222_5 or var_222_5 * ((var_222_9 - arg_219_1.typewritterCharCountI18N) / var_222_4)

				if var_222_10 > 0 and var_222_5 < var_222_10 then
					arg_219_1.talkMaxDuration = var_222_10

					if var_222_10 + var_222_3 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_10 + var_222_3
					end
				end
			end

			local var_222_11 = 1.26666666666667
			local var_222_12 = math.max(var_222_11, arg_219_1.talkMaxDuration)

			if var_222_3 <= arg_219_1.time_ and arg_219_1.time_ < var_222_3 + var_222_12 then
				local var_222_13 = (arg_219_1.time_ - var_222_3) / var_222_12

				arg_219_1.fswtw_.percent = Mathf.Lerp(arg_219_1.var_.oldValueTypewriter, var_222_8, var_222_13)
				arg_219_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_219_1.fswtw_:SetDirty()
			end

			if arg_219_1.time_ >= var_222_3 + var_222_12 and arg_219_1.time_ < var_222_3 + var_222_12 + arg_222_0 then
				arg_219_1.fswtw_.percent = var_222_8

				arg_219_1.fswtw_:SetDirty()
				arg_219_1:ShowNextGo(true)

				arg_219_1.typewritterCharCountI18N = var_222_9
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST18",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0110",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0110b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_116071.awb"
	}
}
