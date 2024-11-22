return {
	Play120121001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120121001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play120121002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST31"

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
				local var_4_5 = arg_1_1.bgs_.ST31

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
					if iter_4_0 ~= "ST31" then
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
			local var_4_23 = 0.166666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.8
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.25

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_32 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_32:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_33 = arg_1_1:GetWordFromCfg(120121001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 10
				local var_4_36 = utf8.len(var_4_34)
				local var_4_37 = var_4_35 <= 0 and var_4_31 or var_4_31 * (var_4_36 / var_4_35)

				if var_4_37 > 0 and var_4_31 < var_4_37 then
					arg_1_1.talkMaxDuration = var_4_37
					var_4_30 = var_4_30 + 0.3

					if var_4_37 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_37 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_34
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_38 = var_4_30 + 0.3
			local var_4_39 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_38) / var_4_39

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play120121002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120121002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play120121003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.825

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

				local var_10_2 = arg_7_1:GetWordFromCfg(120121002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 33
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
	Play120121003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 120121003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play120121004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1071ui_story"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("Char/" .. var_14_0), arg_11_1.stage_.transform)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_0] = var_14_1

				local var_14_2 = var_14_1:GetComponentInChildren(typeof(CharacterEffect))

				var_14_2.enabled = true

				local var_14_3 = GameObjectTools.GetOrAddComponent(var_14_1, typeof(DynamicBoneHelper))

				if var_14_3 then
					var_14_3:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_2.transform, false)

				arg_11_1.var_[var_14_0 .. "Animator"] = var_14_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_0 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_0 .. "LipSync"] = var_14_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_4 = 0

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_14_5 = 0
			local var_14_6 = 0.725

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_7 = arg_11_1:GetWordFromCfg(120121003)
				local var_14_8 = arg_11_1:FormatText(var_14_7.content)

				arg_11_1.text_.text = var_14_8

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_9 = 29
				local var_14_10 = utf8.len(var_14_8)
				local var_14_11 = var_14_9 <= 0 and var_14_6 or var_14_6 * (var_14_10 / var_14_9)

				if var_14_11 > 0 and var_14_6 < var_14_11 then
					arg_11_1.talkMaxDuration = var_14_11

					if var_14_11 + var_14_5 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_11 + var_14_5
					end
				end

				arg_11_1.text_.text = var_14_8
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_12 = math.max(var_14_6, arg_11_1.talkMaxDuration)

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_12 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_5) / var_14_12

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_5 + var_14_12 and arg_11_1.time_ < var_14_5 + var_14_12 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play120121004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 120121004
		arg_15_1.duration_ = 8.2

		local var_15_0 = {
			zh = 6.266,
			ja = 8.2
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
				arg_15_0:Play120121005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1071ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1071ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1071ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = "10042ui_story"

			if arg_15_1.actors_[var_18_9] == nil then
				local var_18_10 = Object.Instantiate(Asset.Load("Char/" .. var_18_9), arg_15_1.stage_.transform)

				var_18_10.name = var_18_9
				var_18_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_9] = var_18_10

				local var_18_11 = var_18_10:GetComponentInChildren(typeof(CharacterEffect))

				var_18_11.enabled = true

				local var_18_12 = GameObjectTools.GetOrAddComponent(var_18_10, typeof(DynamicBoneHelper))

				if var_18_12 then
					var_18_12:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_11.transform, false)

				arg_15_1.var_[var_18_9 .. "Animator"] = var_18_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_9 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_9 .. "LipSync"] = var_18_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_13 = arg_15_1.actors_["10042ui_story"].transform
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1.var_.moveOldPos10042ui_story = var_18_13.localPosition
			end

			local var_18_15 = 0.001

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_15 then
				local var_18_16 = (arg_15_1.time_ - var_18_14) / var_18_15
				local var_18_17 = Vector3.New(0.7, -1.12, -6.2)

				var_18_13.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10042ui_story, var_18_17, var_18_16)

				local var_18_18 = manager.ui.mainCamera.transform.position - var_18_13.position

				var_18_13.forward = Vector3.New(var_18_18.x, var_18_18.y, var_18_18.z)

				local var_18_19 = var_18_13.localEulerAngles

				var_18_19.z = 0
				var_18_19.x = 0
				var_18_13.localEulerAngles = var_18_19
			end

			if arg_15_1.time_ >= var_18_14 + var_18_15 and arg_15_1.time_ < var_18_14 + var_18_15 + arg_18_0 then
				var_18_13.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_18_20 = manager.ui.mainCamera.transform.position - var_18_13.position

				var_18_13.forward = Vector3.New(var_18_20.x, var_18_20.y, var_18_20.z)

				local var_18_21 = var_18_13.localEulerAngles

				var_18_21.z = 0
				var_18_21.x = 0
				var_18_13.localEulerAngles = var_18_21
			end

			local var_18_22 = arg_15_1.actors_["1071ui_story"]
			local var_18_23 = 0

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 and arg_15_1.var_.characterEffect1071ui_story == nil then
				arg_15_1.var_.characterEffect1071ui_story = var_18_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_24 = 0.2

			if var_18_23 <= arg_15_1.time_ and arg_15_1.time_ < var_18_23 + var_18_24 then
				local var_18_25 = (arg_15_1.time_ - var_18_23) / var_18_24

				if arg_15_1.var_.characterEffect1071ui_story then
					arg_15_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_23 + var_18_24 and arg_15_1.time_ < var_18_23 + var_18_24 + arg_18_0 and arg_15_1.var_.characterEffect1071ui_story then
				arg_15_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_18_26 = arg_15_1.actors_["10042ui_story"]
			local var_18_27 = 0

			if var_18_27 < arg_15_1.time_ and arg_15_1.time_ <= var_18_27 + arg_18_0 and arg_15_1.var_.characterEffect10042ui_story == nil then
				arg_15_1.var_.characterEffect10042ui_story = var_18_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_28 = 0.034

			if var_18_27 <= arg_15_1.time_ and arg_15_1.time_ < var_18_27 + var_18_28 then
				local var_18_29 = (arg_15_1.time_ - var_18_27) / var_18_28

				if arg_15_1.var_.characterEffect10042ui_story then
					local var_18_30 = Mathf.Lerp(0, 0.5, var_18_29)

					arg_15_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_15_1.var_.characterEffect10042ui_story.fillRatio = var_18_30
				end
			end

			if arg_15_1.time_ >= var_18_27 + var_18_28 and arg_15_1.time_ < var_18_27 + var_18_28 + arg_18_0 and arg_15_1.var_.characterEffect10042ui_story then
				local var_18_31 = 0.5

				arg_15_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_15_1.var_.characterEffect10042ui_story.fillRatio = var_18_31
			end

			local var_18_32 = 0

			if var_18_32 < arg_15_1.time_ and arg_15_1.time_ <= var_18_32 + arg_18_0 then
				arg_15_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_18_33 = 0
			local var_18_34 = 0.625

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_35 = arg_15_1:FormatText(StoryNameCfg[384].name)

				arg_15_1.leftNameTxt_.text = var_18_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_36 = arg_15_1:GetWordFromCfg(120121004)
				local var_18_37 = arg_15_1:FormatText(var_18_36.content)

				arg_15_1.text_.text = var_18_37

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_38 = 25
				local var_18_39 = utf8.len(var_18_37)
				local var_18_40 = var_18_38 <= 0 and var_18_34 or var_18_34 * (var_18_39 / var_18_38)

				if var_18_40 > 0 and var_18_34 < var_18_40 then
					arg_15_1.talkMaxDuration = var_18_40

					if var_18_40 + var_18_33 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_40 + var_18_33
					end
				end

				arg_15_1.text_.text = var_18_37
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121004", "story_v_out_120121.awb") ~= 0 then
					local var_18_41 = manager.audio:GetVoiceLength("story_v_out_120121", "120121004", "story_v_out_120121.awb") / 1000

					if var_18_41 + var_18_33 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_41 + var_18_33
					end

					if var_18_36.prefab_name ~= "" and arg_15_1.actors_[var_18_36.prefab_name] ~= nil then
						local var_18_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_36.prefab_name].transform, "story_v_out_120121", "120121004", "story_v_out_120121.awb")

						arg_15_1:RecordAudio("120121004", var_18_42)
						arg_15_1:RecordAudio("120121004", var_18_42)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_120121", "120121004", "story_v_out_120121.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_120121", "120121004", "story_v_out_120121.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_43 = math.max(var_18_34, arg_15_1.talkMaxDuration)

			if var_18_33 <= arg_15_1.time_ and arg_15_1.time_ < var_18_33 + var_18_43 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_33) / var_18_43

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_33 + var_18_43 and arg_15_1.time_ < var_18_33 + var_18_43 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play120121005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 120121005
		arg_19_1.duration_ = 6.133

		local var_19_0 = {
			zh = 3.833,
			ja = 6.133
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
				arg_19_0:Play120121006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1071ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1071ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1071ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["10042ui_story"].transform
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1.var_.moveOldPos10042ui_story = var_22_9.localPosition
			end

			local var_22_11 = 0.001

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11
				local var_22_13 = Vector3.New(0.7, -1.12, -6.2)

				var_22_9.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10042ui_story, var_22_13, var_22_12)

				local var_22_14 = manager.ui.mainCamera.transform.position - var_22_9.position

				var_22_9.forward = Vector3.New(var_22_14.x, var_22_14.y, var_22_14.z)

				local var_22_15 = var_22_9.localEulerAngles

				var_22_15.z = 0
				var_22_15.x = 0
				var_22_9.localEulerAngles = var_22_15
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 then
				var_22_9.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_22_16 = manager.ui.mainCamera.transform.position - var_22_9.position

				var_22_9.forward = Vector3.New(var_22_16.x, var_22_16.y, var_22_16.z)

				local var_22_17 = var_22_9.localEulerAngles

				var_22_17.z = 0
				var_22_17.x = 0
				var_22_9.localEulerAngles = var_22_17
			end

			local var_22_18 = arg_19_1.actors_["1071ui_story"]
			local var_22_19 = 0

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 and arg_19_1.var_.characterEffect1071ui_story == nil then
				arg_19_1.var_.characterEffect1071ui_story = var_22_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_20 = 0.2

			if var_22_19 <= arg_19_1.time_ and arg_19_1.time_ < var_22_19 + var_22_20 then
				local var_22_21 = (arg_19_1.time_ - var_22_19) / var_22_20

				if arg_19_1.var_.characterEffect1071ui_story then
					local var_22_22 = Mathf.Lerp(0, 0.5, var_22_21)

					arg_19_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1071ui_story.fillRatio = var_22_22
				end
			end

			if arg_19_1.time_ >= var_22_19 + var_22_20 and arg_19_1.time_ < var_22_19 + var_22_20 + arg_22_0 and arg_19_1.var_.characterEffect1071ui_story then
				local var_22_23 = 0.5

				arg_19_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1071ui_story.fillRatio = var_22_23
			end

			local var_22_24 = arg_19_1.actors_["10042ui_story"]
			local var_22_25 = 0

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 and arg_19_1.var_.characterEffect10042ui_story == nil then
				arg_19_1.var_.characterEffect10042ui_story = var_22_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_26 = 0.2

			if var_22_25 <= arg_19_1.time_ and arg_19_1.time_ < var_22_25 + var_22_26 then
				local var_22_27 = (arg_19_1.time_ - var_22_25) / var_22_26

				if arg_19_1.var_.characterEffect10042ui_story then
					arg_19_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_25 + var_22_26 and arg_19_1.time_ < var_22_25 + var_22_26 + arg_22_0 and arg_19_1.var_.characterEffect10042ui_story then
				arg_19_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_22_28 = 0

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042action/10042action2_1")
			end

			local var_22_29 = 0
			local var_22_30 = 0.525

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_31 = arg_19_1:FormatText(StoryNameCfg[388].name)

				arg_19_1.leftNameTxt_.text = var_22_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_32 = arg_19_1:GetWordFromCfg(120121005)
				local var_22_33 = arg_19_1:FormatText(var_22_32.content)

				arg_19_1.text_.text = var_22_33

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_34 = 21
				local var_22_35 = utf8.len(var_22_33)
				local var_22_36 = var_22_34 <= 0 and var_22_30 or var_22_30 * (var_22_35 / var_22_34)

				if var_22_36 > 0 and var_22_30 < var_22_36 then
					arg_19_1.talkMaxDuration = var_22_36

					if var_22_36 + var_22_29 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_36 + var_22_29
					end
				end

				arg_19_1.text_.text = var_22_33
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121005", "story_v_out_120121.awb") ~= 0 then
					local var_22_37 = manager.audio:GetVoiceLength("story_v_out_120121", "120121005", "story_v_out_120121.awb") / 1000

					if var_22_37 + var_22_29 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_37 + var_22_29
					end

					if var_22_32.prefab_name ~= "" and arg_19_1.actors_[var_22_32.prefab_name] ~= nil then
						local var_22_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_32.prefab_name].transform, "story_v_out_120121", "120121005", "story_v_out_120121.awb")

						arg_19_1:RecordAudio("120121005", var_22_38)
						arg_19_1:RecordAudio("120121005", var_22_38)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_120121", "120121005", "story_v_out_120121.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_120121", "120121005", "story_v_out_120121.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_39 = math.max(var_22_30, arg_19_1.talkMaxDuration)

			if var_22_29 <= arg_19_1.time_ and arg_19_1.time_ < var_22_29 + var_22_39 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_29) / var_22_39

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_29 + var_22_39 and arg_19_1.time_ < var_22_29 + var_22_39 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play120121006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 120121006
		arg_23_1.duration_ = 8.7

		local var_23_0 = {
			zh = 8.7,
			ja = 6.2
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
				arg_23_0:Play120121007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1071ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1071ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1071ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["10042ui_story"].transform
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 then
				arg_23_1.var_.moveOldPos10042ui_story = var_26_9.localPosition
			end

			local var_26_11 = 0.001

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11
				local var_26_13 = Vector3.New(0.7, -1.12, -6.2)

				var_26_9.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10042ui_story, var_26_13, var_26_12)

				local var_26_14 = manager.ui.mainCamera.transform.position - var_26_9.position

				var_26_9.forward = Vector3.New(var_26_14.x, var_26_14.y, var_26_14.z)

				local var_26_15 = var_26_9.localEulerAngles

				var_26_15.z = 0
				var_26_15.x = 0
				var_26_9.localEulerAngles = var_26_15
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 then
				var_26_9.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_26_16 = manager.ui.mainCamera.transform.position - var_26_9.position

				var_26_9.forward = Vector3.New(var_26_16.x, var_26_16.y, var_26_16.z)

				local var_26_17 = var_26_9.localEulerAngles

				var_26_17.z = 0
				var_26_17.x = 0
				var_26_9.localEulerAngles = var_26_17
			end

			local var_26_18 = arg_23_1.actors_["1071ui_story"]
			local var_26_19 = 0

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 and arg_23_1.var_.characterEffect1071ui_story == nil then
				arg_23_1.var_.characterEffect1071ui_story = var_26_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_20 = 0.2

			if var_26_19 <= arg_23_1.time_ and arg_23_1.time_ < var_26_19 + var_26_20 then
				local var_26_21 = (arg_23_1.time_ - var_26_19) / var_26_20

				if arg_23_1.var_.characterEffect1071ui_story then
					arg_23_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_19 + var_26_20 and arg_23_1.time_ < var_26_19 + var_26_20 + arg_26_0 and arg_23_1.var_.characterEffect1071ui_story then
				arg_23_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_26_22 = arg_23_1.actors_["10042ui_story"]
			local var_26_23 = 0

			if var_26_23 < arg_23_1.time_ and arg_23_1.time_ <= var_26_23 + arg_26_0 and arg_23_1.var_.characterEffect10042ui_story == nil then
				arg_23_1.var_.characterEffect10042ui_story = var_26_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_24 = 0.2

			if var_26_23 <= arg_23_1.time_ and arg_23_1.time_ < var_26_23 + var_26_24 then
				local var_26_25 = (arg_23_1.time_ - var_26_23) / var_26_24

				if arg_23_1.var_.characterEffect10042ui_story then
					local var_26_26 = Mathf.Lerp(0, 0.5, var_26_25)

					arg_23_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10042ui_story.fillRatio = var_26_26
				end
			end

			if arg_23_1.time_ >= var_26_23 + var_26_24 and arg_23_1.time_ < var_26_23 + var_26_24 + arg_26_0 and arg_23_1.var_.characterEffect10042ui_story then
				local var_26_27 = 0.5

				arg_23_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10042ui_story.fillRatio = var_26_27
			end

			local var_26_28 = 0
			local var_26_29 = 1.075

			if var_26_28 < arg_23_1.time_ and arg_23_1.time_ <= var_26_28 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_30 = arg_23_1:FormatText(StoryNameCfg[384].name)

				arg_23_1.leftNameTxt_.text = var_26_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_31 = arg_23_1:GetWordFromCfg(120121006)
				local var_26_32 = arg_23_1:FormatText(var_26_31.content)

				arg_23_1.text_.text = var_26_32

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_33 = 43
				local var_26_34 = utf8.len(var_26_32)
				local var_26_35 = var_26_33 <= 0 and var_26_29 or var_26_29 * (var_26_34 / var_26_33)

				if var_26_35 > 0 and var_26_29 < var_26_35 then
					arg_23_1.talkMaxDuration = var_26_35

					if var_26_35 + var_26_28 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_35 + var_26_28
					end
				end

				arg_23_1.text_.text = var_26_32
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121006", "story_v_out_120121.awb") ~= 0 then
					local var_26_36 = manager.audio:GetVoiceLength("story_v_out_120121", "120121006", "story_v_out_120121.awb") / 1000

					if var_26_36 + var_26_28 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_36 + var_26_28
					end

					if var_26_31.prefab_name ~= "" and arg_23_1.actors_[var_26_31.prefab_name] ~= nil then
						local var_26_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_31.prefab_name].transform, "story_v_out_120121", "120121006", "story_v_out_120121.awb")

						arg_23_1:RecordAudio("120121006", var_26_37)
						arg_23_1:RecordAudio("120121006", var_26_37)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_120121", "120121006", "story_v_out_120121.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_120121", "120121006", "story_v_out_120121.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_38 = math.max(var_26_29, arg_23_1.talkMaxDuration)

			if var_26_28 <= arg_23_1.time_ and arg_23_1.time_ < var_26_28 + var_26_38 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_28) / var_26_38

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_28 + var_26_38 and arg_23_1.time_ < var_26_28 + var_26_38 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play120121007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 120121007
		arg_27_1.duration_ = 5

		local var_27_0 = {
			zh = 4.366,
			ja = 5
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
				arg_27_0:Play120121008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1071ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1071ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1071ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["10042ui_story"].transform
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1.var_.moveOldPos10042ui_story = var_30_9.localPosition
			end

			local var_30_11 = 0.001

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11
				local var_30_13 = Vector3.New(0.7, -1.12, -6.2)

				var_30_9.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10042ui_story, var_30_13, var_30_12)

				local var_30_14 = manager.ui.mainCamera.transform.position - var_30_9.position

				var_30_9.forward = Vector3.New(var_30_14.x, var_30_14.y, var_30_14.z)

				local var_30_15 = var_30_9.localEulerAngles

				var_30_15.z = 0
				var_30_15.x = 0
				var_30_9.localEulerAngles = var_30_15
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 then
				var_30_9.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_30_16 = manager.ui.mainCamera.transform.position - var_30_9.position

				var_30_9.forward = Vector3.New(var_30_16.x, var_30_16.y, var_30_16.z)

				local var_30_17 = var_30_9.localEulerAngles

				var_30_17.z = 0
				var_30_17.x = 0
				var_30_9.localEulerAngles = var_30_17
			end

			local var_30_18 = arg_27_1.actors_["1071ui_story"]
			local var_30_19 = 0

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 and arg_27_1.var_.characterEffect1071ui_story == nil then
				arg_27_1.var_.characterEffect1071ui_story = var_30_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_20 = 0.2

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_20 then
				local var_30_21 = (arg_27_1.time_ - var_30_19) / var_30_20

				if arg_27_1.var_.characterEffect1071ui_story then
					local var_30_22 = Mathf.Lerp(0, 0.5, var_30_21)

					arg_27_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1071ui_story.fillRatio = var_30_22
				end
			end

			if arg_27_1.time_ >= var_30_19 + var_30_20 and arg_27_1.time_ < var_30_19 + var_30_20 + arg_30_0 and arg_27_1.var_.characterEffect1071ui_story then
				local var_30_23 = 0.5

				arg_27_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1071ui_story.fillRatio = var_30_23
			end

			local var_30_24 = arg_27_1.actors_["10042ui_story"]
			local var_30_25 = 0

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 and arg_27_1.var_.characterEffect10042ui_story == nil then
				arg_27_1.var_.characterEffect10042ui_story = var_30_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_26 = 0.2

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_26 then
				local var_30_27 = (arg_27_1.time_ - var_30_25) / var_30_26

				if arg_27_1.var_.characterEffect10042ui_story then
					arg_27_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_25 + var_30_26 and arg_27_1.time_ < var_30_25 + var_30_26 + arg_30_0 and arg_27_1.var_.characterEffect10042ui_story then
				arg_27_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_30_28 = 0
			local var_30_29 = 0.5

			if var_30_28 < arg_27_1.time_ and arg_27_1.time_ <= var_30_28 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_30 = arg_27_1:FormatText(StoryNameCfg[388].name)

				arg_27_1.leftNameTxt_.text = var_30_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_31 = arg_27_1:GetWordFromCfg(120121007)
				local var_30_32 = arg_27_1:FormatText(var_30_31.content)

				arg_27_1.text_.text = var_30_32

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_33 = 20
				local var_30_34 = utf8.len(var_30_32)
				local var_30_35 = var_30_33 <= 0 and var_30_29 or var_30_29 * (var_30_34 / var_30_33)

				if var_30_35 > 0 and var_30_29 < var_30_35 then
					arg_27_1.talkMaxDuration = var_30_35

					if var_30_35 + var_30_28 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_35 + var_30_28
					end
				end

				arg_27_1.text_.text = var_30_32
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121007", "story_v_out_120121.awb") ~= 0 then
					local var_30_36 = manager.audio:GetVoiceLength("story_v_out_120121", "120121007", "story_v_out_120121.awb") / 1000

					if var_30_36 + var_30_28 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_36 + var_30_28
					end

					if var_30_31.prefab_name ~= "" and arg_27_1.actors_[var_30_31.prefab_name] ~= nil then
						local var_30_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_31.prefab_name].transform, "story_v_out_120121", "120121007", "story_v_out_120121.awb")

						arg_27_1:RecordAudio("120121007", var_30_37)
						arg_27_1:RecordAudio("120121007", var_30_37)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_120121", "120121007", "story_v_out_120121.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_120121", "120121007", "story_v_out_120121.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_38 = math.max(var_30_29, arg_27_1.talkMaxDuration)

			if var_30_28 <= arg_27_1.time_ and arg_27_1.time_ < var_30_28 + var_30_38 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_28) / var_30_38

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_28 + var_30_38 and arg_27_1.time_ < var_30_28 + var_30_38 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play120121008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 120121008
		arg_31_1.duration_ = 7.5

		local var_31_0 = {
			zh = 6.066,
			ja = 7.5
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
				arg_31_0:Play120121009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1071ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1071ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1071ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["10042ui_story"].transform
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.var_.moveOldPos10042ui_story = var_34_9.localPosition
			end

			local var_34_11 = 0.001

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11
				local var_34_13 = Vector3.New(0.7, -1.12, -6.2)

				var_34_9.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10042ui_story, var_34_13, var_34_12)

				local var_34_14 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_14.x, var_34_14.y, var_34_14.z)

				local var_34_15 = var_34_9.localEulerAngles

				var_34_15.z = 0
				var_34_15.x = 0
				var_34_9.localEulerAngles = var_34_15
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 then
				var_34_9.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_34_16 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_16.x, var_34_16.y, var_34_16.z)

				local var_34_17 = var_34_9.localEulerAngles

				var_34_17.z = 0
				var_34_17.x = 0
				var_34_9.localEulerAngles = var_34_17
			end

			local var_34_18 = arg_31_1.actors_["1071ui_story"]
			local var_34_19 = 0

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 and arg_31_1.var_.characterEffect1071ui_story == nil then
				arg_31_1.var_.characterEffect1071ui_story = var_34_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_20 = 0.2

			if var_34_19 <= arg_31_1.time_ and arg_31_1.time_ < var_34_19 + var_34_20 then
				local var_34_21 = (arg_31_1.time_ - var_34_19) / var_34_20

				if arg_31_1.var_.characterEffect1071ui_story then
					arg_31_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_19 + var_34_20 and arg_31_1.time_ < var_34_19 + var_34_20 + arg_34_0 and arg_31_1.var_.characterEffect1071ui_story then
				arg_31_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_34_22 = arg_31_1.actors_["10042ui_story"]
			local var_34_23 = 0

			if var_34_23 < arg_31_1.time_ and arg_31_1.time_ <= var_34_23 + arg_34_0 and arg_31_1.var_.characterEffect10042ui_story == nil then
				arg_31_1.var_.characterEffect10042ui_story = var_34_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_24 = 0.2

			if var_34_23 <= arg_31_1.time_ and arg_31_1.time_ < var_34_23 + var_34_24 then
				local var_34_25 = (arg_31_1.time_ - var_34_23) / var_34_24

				if arg_31_1.var_.characterEffect10042ui_story then
					local var_34_26 = Mathf.Lerp(0, 0.5, var_34_25)

					arg_31_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_31_1.var_.characterEffect10042ui_story.fillRatio = var_34_26
				end
			end

			if arg_31_1.time_ >= var_34_23 + var_34_24 and arg_31_1.time_ < var_34_23 + var_34_24 + arg_34_0 and arg_31_1.var_.characterEffect10042ui_story then
				local var_34_27 = 0.5

				arg_31_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_31_1.var_.characterEffect10042ui_story.fillRatio = var_34_27
			end

			local var_34_28 = 0

			if var_34_28 < arg_31_1.time_ and arg_31_1.time_ <= var_34_28 + arg_34_0 then
				arg_31_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action435")
			end

			local var_34_29 = 0
			local var_34_30 = 0.8

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_31 = arg_31_1:FormatText(StoryNameCfg[384].name)

				arg_31_1.leftNameTxt_.text = var_34_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_32 = arg_31_1:GetWordFromCfg(120121008)
				local var_34_33 = arg_31_1:FormatText(var_34_32.content)

				arg_31_1.text_.text = var_34_33

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_34 = 32
				local var_34_35 = utf8.len(var_34_33)
				local var_34_36 = var_34_34 <= 0 and var_34_30 or var_34_30 * (var_34_35 / var_34_34)

				if var_34_36 > 0 and var_34_30 < var_34_36 then
					arg_31_1.talkMaxDuration = var_34_36

					if var_34_36 + var_34_29 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_36 + var_34_29
					end
				end

				arg_31_1.text_.text = var_34_33
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121008", "story_v_out_120121.awb") ~= 0 then
					local var_34_37 = manager.audio:GetVoiceLength("story_v_out_120121", "120121008", "story_v_out_120121.awb") / 1000

					if var_34_37 + var_34_29 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_37 + var_34_29
					end

					if var_34_32.prefab_name ~= "" and arg_31_1.actors_[var_34_32.prefab_name] ~= nil then
						local var_34_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_32.prefab_name].transform, "story_v_out_120121", "120121008", "story_v_out_120121.awb")

						arg_31_1:RecordAudio("120121008", var_34_38)
						arg_31_1:RecordAudio("120121008", var_34_38)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_120121", "120121008", "story_v_out_120121.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_120121", "120121008", "story_v_out_120121.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_39 = math.max(var_34_30, arg_31_1.talkMaxDuration)

			if var_34_29 <= arg_31_1.time_ and arg_31_1.time_ < var_34_29 + var_34_39 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_29) / var_34_39

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_29 + var_34_39 and arg_31_1.time_ < var_34_29 + var_34_39 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play120121009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 120121009
		arg_35_1.duration_ = 7.2

		local var_35_0 = {
			zh = 5.333,
			ja = 7.2
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
				arg_35_0:Play120121010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.725

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[384].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(120121009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121009", "story_v_out_120121.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_120121", "120121009", "story_v_out_120121.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_120121", "120121009", "story_v_out_120121.awb")

						arg_35_1:RecordAudio("120121009", var_38_9)
						arg_35_1:RecordAudio("120121009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_120121", "120121009", "story_v_out_120121.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_120121", "120121009", "story_v_out_120121.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_10 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_10 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_10

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_10 and arg_35_1.time_ < var_38_0 + var_38_10 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play120121010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 120121010
		arg_39_1.duration_ = 10.7

		local var_39_0 = {
			zh = 3.966,
			ja = 10.7
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
				arg_39_0:Play120121011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1071ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1071ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1071ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["10042ui_story"].transform
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.var_.moveOldPos10042ui_story = var_42_9.localPosition
			end

			local var_42_11 = 0.001

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11
				local var_42_13 = Vector3.New(0.7, -1.12, -6.2)

				var_42_9.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10042ui_story, var_42_13, var_42_12)

				local var_42_14 = manager.ui.mainCamera.transform.position - var_42_9.position

				var_42_9.forward = Vector3.New(var_42_14.x, var_42_14.y, var_42_14.z)

				local var_42_15 = var_42_9.localEulerAngles

				var_42_15.z = 0
				var_42_15.x = 0
				var_42_9.localEulerAngles = var_42_15
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 then
				var_42_9.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_42_16 = manager.ui.mainCamera.transform.position - var_42_9.position

				var_42_9.forward = Vector3.New(var_42_16.x, var_42_16.y, var_42_16.z)

				local var_42_17 = var_42_9.localEulerAngles

				var_42_17.z = 0
				var_42_17.x = 0
				var_42_9.localEulerAngles = var_42_17
			end

			local var_42_18 = arg_39_1.actors_["1071ui_story"]
			local var_42_19 = 0

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 and arg_39_1.var_.characterEffect1071ui_story == nil then
				arg_39_1.var_.characterEffect1071ui_story = var_42_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_20 = 0.2

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_20 then
				local var_42_21 = (arg_39_1.time_ - var_42_19) / var_42_20

				if arg_39_1.var_.characterEffect1071ui_story then
					local var_42_22 = Mathf.Lerp(0, 0.5, var_42_21)

					arg_39_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1071ui_story.fillRatio = var_42_22
				end
			end

			if arg_39_1.time_ >= var_42_19 + var_42_20 and arg_39_1.time_ < var_42_19 + var_42_20 + arg_42_0 and arg_39_1.var_.characterEffect1071ui_story then
				local var_42_23 = 0.5

				arg_39_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1071ui_story.fillRatio = var_42_23
			end

			local var_42_24 = arg_39_1.actors_["10042ui_story"]
			local var_42_25 = 0

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 and arg_39_1.var_.characterEffect10042ui_story == nil then
				arg_39_1.var_.characterEffect10042ui_story = var_42_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_26 = 0.2

			if var_42_25 <= arg_39_1.time_ and arg_39_1.time_ < var_42_25 + var_42_26 then
				local var_42_27 = (arg_39_1.time_ - var_42_25) / var_42_26

				if arg_39_1.var_.characterEffect10042ui_story then
					arg_39_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_25 + var_42_26 and arg_39_1.time_ < var_42_25 + var_42_26 + arg_42_0 and arg_39_1.var_.characterEffect10042ui_story then
				arg_39_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_42_28 = 0
			local var_42_29 = 0.6

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_30 = arg_39_1:FormatText(StoryNameCfg[388].name)

				arg_39_1.leftNameTxt_.text = var_42_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_31 = arg_39_1:GetWordFromCfg(120121010)
				local var_42_32 = arg_39_1:FormatText(var_42_31.content)

				arg_39_1.text_.text = var_42_32

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_33 = 24
				local var_42_34 = utf8.len(var_42_32)
				local var_42_35 = var_42_33 <= 0 and var_42_29 or var_42_29 * (var_42_34 / var_42_33)

				if var_42_35 > 0 and var_42_29 < var_42_35 then
					arg_39_1.talkMaxDuration = var_42_35

					if var_42_35 + var_42_28 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_35 + var_42_28
					end
				end

				arg_39_1.text_.text = var_42_32
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121010", "story_v_out_120121.awb") ~= 0 then
					local var_42_36 = manager.audio:GetVoiceLength("story_v_out_120121", "120121010", "story_v_out_120121.awb") / 1000

					if var_42_36 + var_42_28 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_36 + var_42_28
					end

					if var_42_31.prefab_name ~= "" and arg_39_1.actors_[var_42_31.prefab_name] ~= nil then
						local var_42_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_31.prefab_name].transform, "story_v_out_120121", "120121010", "story_v_out_120121.awb")

						arg_39_1:RecordAudio("120121010", var_42_37)
						arg_39_1:RecordAudio("120121010", var_42_37)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_120121", "120121010", "story_v_out_120121.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_120121", "120121010", "story_v_out_120121.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_38 = math.max(var_42_29, arg_39_1.talkMaxDuration)

			if var_42_28 <= arg_39_1.time_ and arg_39_1.time_ < var_42_28 + var_42_38 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_28) / var_42_38

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_28 + var_42_38 and arg_39_1.time_ < var_42_28 + var_42_38 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play120121011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 120121011
		arg_43_1.duration_ = 3

		local var_43_0 = {
			zh = 3,
			ja = 2.2
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
				arg_43_0:Play120121012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1071ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1071ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1071ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["10042ui_story"].transform
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1.var_.moveOldPos10042ui_story = var_46_9.localPosition
			end

			local var_46_11 = 0.001

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11
				local var_46_13 = Vector3.New(0.7, -1.12, -6.2)

				var_46_9.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10042ui_story, var_46_13, var_46_12)

				local var_46_14 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_14.x, var_46_14.y, var_46_14.z)

				local var_46_15 = var_46_9.localEulerAngles

				var_46_15.z = 0
				var_46_15.x = 0
				var_46_9.localEulerAngles = var_46_15
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 then
				var_46_9.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_46_16 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_16.x, var_46_16.y, var_46_16.z)

				local var_46_17 = var_46_9.localEulerAngles

				var_46_17.z = 0
				var_46_17.x = 0
				var_46_9.localEulerAngles = var_46_17
			end

			local var_46_18 = arg_43_1.actors_["1071ui_story"]
			local var_46_19 = 0

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 and arg_43_1.var_.characterEffect1071ui_story == nil then
				arg_43_1.var_.characterEffect1071ui_story = var_46_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_20 = 0.2

			if var_46_19 <= arg_43_1.time_ and arg_43_1.time_ < var_46_19 + var_46_20 then
				local var_46_21 = (arg_43_1.time_ - var_46_19) / var_46_20

				if arg_43_1.var_.characterEffect1071ui_story then
					arg_43_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_19 + var_46_20 and arg_43_1.time_ < var_46_19 + var_46_20 + arg_46_0 and arg_43_1.var_.characterEffect1071ui_story then
				arg_43_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_46_22 = arg_43_1.actors_["10042ui_story"]
			local var_46_23 = 0

			if var_46_23 < arg_43_1.time_ and arg_43_1.time_ <= var_46_23 + arg_46_0 and arg_43_1.var_.characterEffect10042ui_story == nil then
				arg_43_1.var_.characterEffect10042ui_story = var_46_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_24 = 0.2

			if var_46_23 <= arg_43_1.time_ and arg_43_1.time_ < var_46_23 + var_46_24 then
				local var_46_25 = (arg_43_1.time_ - var_46_23) / var_46_24

				if arg_43_1.var_.characterEffect10042ui_story then
					local var_46_26 = Mathf.Lerp(0, 0.5, var_46_25)

					arg_43_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_43_1.var_.characterEffect10042ui_story.fillRatio = var_46_26
				end
			end

			if arg_43_1.time_ >= var_46_23 + var_46_24 and arg_43_1.time_ < var_46_23 + var_46_24 + arg_46_0 and arg_43_1.var_.characterEffect10042ui_story then
				local var_46_27 = 0.5

				arg_43_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_43_1.var_.characterEffect10042ui_story.fillRatio = var_46_27
			end

			local var_46_28 = 0
			local var_46_29 = 0.2

			if var_46_28 < arg_43_1.time_ and arg_43_1.time_ <= var_46_28 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_30 = arg_43_1:FormatText(StoryNameCfg[384].name)

				arg_43_1.leftNameTxt_.text = var_46_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_31 = arg_43_1:GetWordFromCfg(120121011)
				local var_46_32 = arg_43_1:FormatText(var_46_31.content)

				arg_43_1.text_.text = var_46_32

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_33 = 8
				local var_46_34 = utf8.len(var_46_32)
				local var_46_35 = var_46_33 <= 0 and var_46_29 or var_46_29 * (var_46_34 / var_46_33)

				if var_46_35 > 0 and var_46_29 < var_46_35 then
					arg_43_1.talkMaxDuration = var_46_35

					if var_46_35 + var_46_28 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_35 + var_46_28
					end
				end

				arg_43_1.text_.text = var_46_32
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121011", "story_v_out_120121.awb") ~= 0 then
					local var_46_36 = manager.audio:GetVoiceLength("story_v_out_120121", "120121011", "story_v_out_120121.awb") / 1000

					if var_46_36 + var_46_28 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_36 + var_46_28
					end

					if var_46_31.prefab_name ~= "" and arg_43_1.actors_[var_46_31.prefab_name] ~= nil then
						local var_46_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_31.prefab_name].transform, "story_v_out_120121", "120121011", "story_v_out_120121.awb")

						arg_43_1:RecordAudio("120121011", var_46_37)
						arg_43_1:RecordAudio("120121011", var_46_37)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_120121", "120121011", "story_v_out_120121.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_120121", "120121011", "story_v_out_120121.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_38 = math.max(var_46_29, arg_43_1.talkMaxDuration)

			if var_46_28 <= arg_43_1.time_ and arg_43_1.time_ < var_46_28 + var_46_38 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_28) / var_46_38

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_28 + var_46_38 and arg_43_1.time_ < var_46_28 + var_46_38 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play120121012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 120121012
		arg_47_1.duration_ = 7.1

		local var_47_0 = {
			zh = 3.7,
			ja = 7.1
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
				arg_47_0:Play120121013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1071ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1071ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0, 100, 0)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1071ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, 100, 0)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["10042ui_story"].transform
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1.var_.moveOldPos10042ui_story = var_50_9.localPosition
			end

			local var_50_11 = 0.001

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11
				local var_50_13 = Vector3.New(0, 100, 0)

				var_50_9.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10042ui_story, var_50_13, var_50_12)

				local var_50_14 = manager.ui.mainCamera.transform.position - var_50_9.position

				var_50_9.forward = Vector3.New(var_50_14.x, var_50_14.y, var_50_14.z)

				local var_50_15 = var_50_9.localEulerAngles

				var_50_15.z = 0
				var_50_15.x = 0
				var_50_9.localEulerAngles = var_50_15
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 then
				var_50_9.localPosition = Vector3.New(0, 100, 0)

				local var_50_16 = manager.ui.mainCamera.transform.position - var_50_9.position

				var_50_9.forward = Vector3.New(var_50_16.x, var_50_16.y, var_50_16.z)

				local var_50_17 = var_50_9.localEulerAngles

				var_50_17.z = 0
				var_50_17.x = 0
				var_50_9.localEulerAngles = var_50_17
			end

			local var_50_18 = 0
			local var_50_19 = 0.5

			if var_50_18 < arg_47_1.time_ and arg_47_1.time_ <= var_50_18 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_20 = arg_47_1:FormatText(StoryNameCfg[384].name)

				arg_47_1.leftNameTxt_.text = var_50_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_21 = arg_47_1:GetWordFromCfg(120121012)
				local var_50_22 = arg_47_1:FormatText(var_50_21.content)

				arg_47_1.text_.text = var_50_22

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_23 = 20
				local var_50_24 = utf8.len(var_50_22)
				local var_50_25 = var_50_23 <= 0 and var_50_19 or var_50_19 * (var_50_24 / var_50_23)

				if var_50_25 > 0 and var_50_19 < var_50_25 then
					arg_47_1.talkMaxDuration = var_50_25

					if var_50_25 + var_50_18 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_25 + var_50_18
					end
				end

				arg_47_1.text_.text = var_50_22
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121012", "story_v_out_120121.awb") ~= 0 then
					local var_50_26 = manager.audio:GetVoiceLength("story_v_out_120121", "120121012", "story_v_out_120121.awb") / 1000

					if var_50_26 + var_50_18 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_26 + var_50_18
					end

					if var_50_21.prefab_name ~= "" and arg_47_1.actors_[var_50_21.prefab_name] ~= nil then
						local var_50_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_21.prefab_name].transform, "story_v_out_120121", "120121012", "story_v_out_120121.awb")

						arg_47_1:RecordAudio("120121012", var_50_27)
						arg_47_1:RecordAudio("120121012", var_50_27)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_120121", "120121012", "story_v_out_120121.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_120121", "120121012", "story_v_out_120121.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_28 = math.max(var_50_19, arg_47_1.talkMaxDuration)

			if var_50_18 <= arg_47_1.time_ and arg_47_1.time_ < var_50_18 + var_50_28 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_18) / var_50_28

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_18 + var_50_28 and arg_47_1.time_ < var_50_18 + var_50_28 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play120121013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 120121013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play120121014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 1

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

				local var_54_2 = arg_51_1:GetWordFromCfg(120121013)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 40
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
	Play120121014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120121014
		arg_55_1.duration_ = 10.966

		local var_55_0 = {
			zh = 9.566,
			ja = 10.966
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
				arg_55_0:Play120121015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1071ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1071ui_story == nil then
				arg_55_1.var_.characterEffect1071ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1071ui_story then
					arg_55_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1071ui_story then
				arg_55_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1071ui_story"].transform
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1.var_.moveOldPos1071ui_story = var_58_4.localPosition
			end

			local var_58_6 = 0.001

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6
				local var_58_8 = Vector3.New(0, -1.05, -6.2)

				var_58_4.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1071ui_story, var_58_8, var_58_7)

				local var_58_9 = manager.ui.mainCamera.transform.position - var_58_4.position

				var_58_4.forward = Vector3.New(var_58_9.x, var_58_9.y, var_58_9.z)

				local var_58_10 = var_58_4.localEulerAngles

				var_58_10.z = 0
				var_58_10.x = 0
				var_58_4.localEulerAngles = var_58_10
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 then
				var_58_4.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_58_11 = manager.ui.mainCamera.transform.position - var_58_4.position

				var_58_4.forward = Vector3.New(var_58_11.x, var_58_11.y, var_58_11.z)

				local var_58_12 = var_58_4.localEulerAngles

				var_58_12.z = 0
				var_58_12.x = 0
				var_58_4.localEulerAngles = var_58_12
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_58_15 = 0
			local var_58_16 = 0.9

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_17 = arg_55_1:FormatText(StoryNameCfg[384].name)

				arg_55_1.leftNameTxt_.text = var_58_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_18 = arg_55_1:GetWordFromCfg(120121014)
				local var_58_19 = arg_55_1:FormatText(var_58_18.content)

				arg_55_1.text_.text = var_58_19

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_20 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121014", "story_v_out_120121.awb") ~= 0 then
					local var_58_23 = manager.audio:GetVoiceLength("story_v_out_120121", "120121014", "story_v_out_120121.awb") / 1000

					if var_58_23 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_23 + var_58_15
					end

					if var_58_18.prefab_name ~= "" and arg_55_1.actors_[var_58_18.prefab_name] ~= nil then
						local var_58_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_18.prefab_name].transform, "story_v_out_120121", "120121014", "story_v_out_120121.awb")

						arg_55_1:RecordAudio("120121014", var_58_24)
						arg_55_1:RecordAudio("120121014", var_58_24)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_120121", "120121014", "story_v_out_120121.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_120121", "120121014", "story_v_out_120121.awb")
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
	Play120121015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 120121015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play120121016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1071ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1071ui_story == nil then
				arg_59_1.var_.characterEffect1071ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1071ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1071ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1071ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1071ui_story.fillRatio = var_62_5
			end

			local var_62_6 = arg_59_1.actors_["1071ui_story"].transform
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 then
				arg_59_1.var_.moveOldPos1071ui_story = var_62_6.localPosition
			end

			local var_62_8 = 0.001

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8
				local var_62_10 = Vector3.New(0, -1.05, -6.2)

				var_62_6.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1071ui_story, var_62_10, var_62_9)

				local var_62_11 = manager.ui.mainCamera.transform.position - var_62_6.position

				var_62_6.forward = Vector3.New(var_62_11.x, var_62_11.y, var_62_11.z)

				local var_62_12 = var_62_6.localEulerAngles

				var_62_12.z = 0
				var_62_12.x = 0
				var_62_6.localEulerAngles = var_62_12
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 then
				var_62_6.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_62_13 = manager.ui.mainCamera.transform.position - var_62_6.position

				var_62_6.forward = Vector3.New(var_62_13.x, var_62_13.y, var_62_13.z)

				local var_62_14 = var_62_6.localEulerAngles

				var_62_14.z = 0
				var_62_14.x = 0
				var_62_6.localEulerAngles = var_62_14
			end

			local var_62_15 = 0
			local var_62_16 = 0.4

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_17 = arg_59_1:GetWordFromCfg(120121015)
				local var_62_18 = arg_59_1:FormatText(var_62_17.content)

				arg_59_1.text_.text = var_62_18

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_19 = 16
				local var_62_20 = utf8.len(var_62_18)
				local var_62_21 = var_62_19 <= 0 and var_62_16 or var_62_16 * (var_62_20 / var_62_19)

				if var_62_21 > 0 and var_62_16 < var_62_21 then
					arg_59_1.talkMaxDuration = var_62_21

					if var_62_21 + var_62_15 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_21 + var_62_15
					end
				end

				arg_59_1.text_.text = var_62_18
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_22 = math.max(var_62_16, arg_59_1.talkMaxDuration)

			if var_62_15 <= arg_59_1.time_ and arg_59_1.time_ < var_62_15 + var_62_22 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_15) / var_62_22

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_15 + var_62_22 and arg_59_1.time_ < var_62_15 + var_62_22 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play120121016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 120121016
		arg_63_1.duration_ = 7.966

		local var_63_0 = {
			zh = 5.333,
			ja = 7.966
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
				arg_63_0:Play120121017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1071ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1071ui_story == nil then
				arg_63_1.var_.characterEffect1071ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1071ui_story then
					arg_63_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1071ui_story then
				arg_63_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["1071ui_story"].transform
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1.var_.moveOldPos1071ui_story = var_66_4.localPosition
			end

			local var_66_6 = 0.001

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6
				local var_66_8 = Vector3.New(0, -1.05, -6.2)

				var_66_4.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1071ui_story, var_66_8, var_66_7)

				local var_66_9 = manager.ui.mainCamera.transform.position - var_66_4.position

				var_66_4.forward = Vector3.New(var_66_9.x, var_66_9.y, var_66_9.z)

				local var_66_10 = var_66_4.localEulerAngles

				var_66_10.z = 0
				var_66_10.x = 0
				var_66_4.localEulerAngles = var_66_10
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 then
				var_66_4.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_66_11 = manager.ui.mainCamera.transform.position - var_66_4.position

				var_66_4.forward = Vector3.New(var_66_11.x, var_66_11.y, var_66_11.z)

				local var_66_12 = var_66_4.localEulerAngles

				var_66_12.z = 0
				var_66_12.x = 0
				var_66_4.localEulerAngles = var_66_12
			end

			local var_66_13 = 0
			local var_66_14 = 0.6

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_15 = arg_63_1:FormatText(StoryNameCfg[384].name)

				arg_63_1.leftNameTxt_.text = var_66_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_16 = arg_63_1:GetWordFromCfg(120121016)
				local var_66_17 = arg_63_1:FormatText(var_66_16.content)

				arg_63_1.text_.text = var_66_17

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_18 = 24
				local var_66_19 = utf8.len(var_66_17)
				local var_66_20 = var_66_18 <= 0 and var_66_14 or var_66_14 * (var_66_19 / var_66_18)

				if var_66_20 > 0 and var_66_14 < var_66_20 then
					arg_63_1.talkMaxDuration = var_66_20

					if var_66_20 + var_66_13 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_13
					end
				end

				arg_63_1.text_.text = var_66_17
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121016", "story_v_out_120121.awb") ~= 0 then
					local var_66_21 = manager.audio:GetVoiceLength("story_v_out_120121", "120121016", "story_v_out_120121.awb") / 1000

					if var_66_21 + var_66_13 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_21 + var_66_13
					end

					if var_66_16.prefab_name ~= "" and arg_63_1.actors_[var_66_16.prefab_name] ~= nil then
						local var_66_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_16.prefab_name].transform, "story_v_out_120121", "120121016", "story_v_out_120121.awb")

						arg_63_1:RecordAudio("120121016", var_66_22)
						arg_63_1:RecordAudio("120121016", var_66_22)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_120121", "120121016", "story_v_out_120121.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_120121", "120121016", "story_v_out_120121.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_23 = math.max(var_66_14, arg_63_1.talkMaxDuration)

			if var_66_13 <= arg_63_1.time_ and arg_63_1.time_ < var_66_13 + var_66_23 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_13) / var_66_23

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_13 + var_66_23 and arg_63_1.time_ < var_66_13 + var_66_23 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play120121017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 120121017
		arg_67_1.duration_ = 5.333

		local var_67_0 = {
			zh = 3.5,
			ja = 5.333
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
				arg_67_0:Play120121018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.375

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[384].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(120121017)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121017", "story_v_out_120121.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_120121", "120121017", "story_v_out_120121.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_120121", "120121017", "story_v_out_120121.awb")

						arg_67_1:RecordAudio("120121017", var_70_9)
						arg_67_1:RecordAudio("120121017", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_120121", "120121017", "story_v_out_120121.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_120121", "120121017", "story_v_out_120121.awb")
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
	Play120121018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 120121018
		arg_71_1.duration_ = 4.674999999999

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play120121019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = "STblack"

			if arg_71_1.bgs_[var_74_0] == nil then
				local var_74_1 = Object.Instantiate(arg_71_1.paintGo_)

				var_74_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_74_0)
				var_74_1.name = var_74_0
				var_74_1.transform.parent = arg_71_1.stage_.transform
				var_74_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_71_1.bgs_[var_74_0] = var_74_1
			end

			local var_74_2 = 2

			if var_74_2 < arg_71_1.time_ and arg_71_1.time_ <= var_74_2 + arg_74_0 then
				local var_74_3 = manager.ui.mainCamera.transform.localPosition
				local var_74_4 = Vector3.New(0, 0, 10) + Vector3.New(var_74_3.x, var_74_3.y, 0)
				local var_74_5 = arg_71_1.bgs_.STblack

				var_74_5.transform.localPosition = var_74_4
				var_74_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_74_6 = var_74_5:GetComponent("SpriteRenderer")

				if var_74_6 and var_74_6.sprite then
					local var_74_7 = (var_74_5.transform.localPosition - var_74_3).z
					local var_74_8 = manager.ui.mainCameraCom_
					local var_74_9 = 2 * var_74_7 * Mathf.Tan(var_74_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_74_10 = var_74_9 * var_74_8.aspect
					local var_74_11 = var_74_6.sprite.bounds.size.x
					local var_74_12 = var_74_6.sprite.bounds.size.y
					local var_74_13 = var_74_10 / var_74_11
					local var_74_14 = var_74_9 / var_74_12
					local var_74_15 = var_74_14 < var_74_13 and var_74_13 or var_74_14

					var_74_5.transform.localScale = Vector3.New(var_74_15, var_74_15, 0)
				end

				for iter_74_0, iter_74_1 in pairs(arg_71_1.bgs_) do
					if iter_74_0 ~= "STblack" then
						iter_74_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_17 = 2

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / var_74_17
				local var_74_19 = Color.New(0, 0, 0)

				var_74_19.a = Mathf.Lerp(0, 1, var_74_18)
				arg_71_1.mask_.color = var_74_19
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 then
				local var_74_20 = Color.New(0, 0, 0)

				var_74_20.a = 1
				arg_71_1.mask_.color = var_74_20
			end

			local var_74_21 = 2

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_22 = 2

			if var_74_21 <= arg_71_1.time_ and arg_71_1.time_ < var_74_21 + var_74_22 then
				local var_74_23 = (arg_71_1.time_ - var_74_21) / var_74_22
				local var_74_24 = Color.New(0, 0, 0)

				var_74_24.a = Mathf.Lerp(1, 0, var_74_23)
				arg_71_1.mask_.color = var_74_24
			end

			if arg_71_1.time_ >= var_74_21 + var_74_22 and arg_71_1.time_ < var_74_21 + var_74_22 + arg_74_0 then
				local var_74_25 = Color.New(0, 0, 0)
				local var_74_26 = 0

				arg_71_1.mask_.enabled = false
				var_74_25.a = var_74_26
				arg_71_1.mask_.color = var_74_25
			end

			local var_74_27 = arg_71_1.actors_["1071ui_story"].transform
			local var_74_28 = 1.966

			if var_74_28 < arg_71_1.time_ and arg_71_1.time_ <= var_74_28 + arg_74_0 then
				arg_71_1.var_.moveOldPos1071ui_story = var_74_27.localPosition
			end

			local var_74_29 = 0.001

			if var_74_28 <= arg_71_1.time_ and arg_71_1.time_ < var_74_28 + var_74_29 then
				local var_74_30 = (arg_71_1.time_ - var_74_28) / var_74_29
				local var_74_31 = Vector3.New(0, 100, 0)

				var_74_27.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1071ui_story, var_74_31, var_74_30)

				local var_74_32 = manager.ui.mainCamera.transform.position - var_74_27.position

				var_74_27.forward = Vector3.New(var_74_32.x, var_74_32.y, var_74_32.z)

				local var_74_33 = var_74_27.localEulerAngles

				var_74_33.z = 0
				var_74_33.x = 0
				var_74_27.localEulerAngles = var_74_33
			end

			if arg_71_1.time_ >= var_74_28 + var_74_29 and arg_71_1.time_ < var_74_28 + var_74_29 + arg_74_0 then
				var_74_27.localPosition = Vector3.New(0, 100, 0)

				local var_74_34 = manager.ui.mainCamera.transform.position - var_74_27.position

				var_74_27.forward = Vector3.New(var_74_34.x, var_74_34.y, var_74_34.z)

				local var_74_35 = var_74_27.localEulerAngles

				var_74_35.z = 0
				var_74_35.x = 0
				var_74_27.localEulerAngles = var_74_35
			end

			local var_74_36 = 2

			if var_74_36 < arg_71_1.time_ and arg_71_1.time_ <= var_74_36 + arg_74_0 then
				arg_71_1.fswbg_:SetActive(true)
				arg_71_1.dialog_:SetActive(false)

				arg_71_1.fswtw_.percent = 0

				local var_74_37 = arg_71_1:GetWordFromCfg(120121018)
				local var_74_38 = arg_71_1:FormatText(var_74_37.content)

				arg_71_1.fswt_.text = var_74_38

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.fswt_)

				arg_71_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_71_1.fswtw_:SetDirty()

				arg_71_1.typewritterCharCountI18N = 0

				SetActive(arg_71_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_71_1:ShowNextGo(false)
			end

			local var_74_39 = 2.01666666666667

			if var_74_39 < arg_71_1.time_ and arg_71_1.time_ <= var_74_39 + arg_74_0 then
				arg_71_1.var_.oldValueTypewriter = arg_71_1.fswtw_.percent

				arg_71_1:ShowNextGo(false)
			end

			local var_74_40 = 27
			local var_74_41 = 1.8
			local var_74_42 = arg_71_1:GetWordFromCfg(120121018)
			local var_74_43 = arg_71_1:FormatText(var_74_42.content)
			local var_74_44, var_74_45 = arg_71_1:GetPercentByPara(var_74_43, 1)

			if var_74_39 < arg_71_1.time_ and arg_71_1.time_ <= var_74_39 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				local var_74_46 = var_74_40 <= 0 and var_74_41 or var_74_41 * ((var_74_45 - arg_71_1.typewritterCharCountI18N) / var_74_40)

				if var_74_46 > 0 and var_74_41 < var_74_46 then
					arg_71_1.talkMaxDuration = var_74_46

					if var_74_46 + var_74_39 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_46 + var_74_39
					end
				end
			end

			local var_74_47 = 1.8
			local var_74_48 = math.max(var_74_47, arg_71_1.talkMaxDuration)

			if var_74_39 <= arg_71_1.time_ and arg_71_1.time_ < var_74_39 + var_74_48 then
				local var_74_49 = (arg_71_1.time_ - var_74_39) / var_74_48

				arg_71_1.fswtw_.percent = Mathf.Lerp(arg_71_1.var_.oldValueTypewriter, var_74_44, var_74_49)
				arg_71_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_71_1.fswtw_:SetDirty()
			end

			if arg_71_1.time_ >= var_74_39 + var_74_48 and arg_71_1.time_ < var_74_39 + var_74_48 + arg_74_0 then
				arg_71_1.fswtw_.percent = var_74_44

				arg_71_1.fswtw_:SetDirty()
				arg_71_1:ShowNextGo(true)

				arg_71_1.typewritterCharCountI18N = var_74_45
			end

			local var_74_50 = 2

			if var_74_50 < arg_71_1.time_ and arg_71_1.time_ <= var_74_50 + arg_74_0 then
				local var_74_51 = arg_71_1.fswbg_.transform:Find("textbox/adapt/content") or arg_71_1.fswbg_.transform:Find("textbox/content")
				local var_74_52 = var_74_51:GetComponent("Text")
				local var_74_53 = var_74_51:GetComponent("RectTransform")

				var_74_52.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_74_53.offsetMin = Vector2.New(0, 0)
				var_74_53.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play120121019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 120121019
		arg_75_1.duration_ = 2.083333333332

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play120121020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.fswbg_:SetActive(true)
				arg_75_1.dialog_:SetActive(false)

				arg_75_1.fswtw_.percent = 0

				local var_78_1 = arg_75_1:GetWordFromCfg(120121019)
				local var_78_2 = arg_75_1:FormatText(var_78_1.content)

				arg_75_1.fswt_.text = var_78_2

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.fswt_)

				arg_75_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_75_1.fswtw_:SetDirty()

				arg_75_1.typewritterCharCountI18N = 0

				SetActive(arg_75_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_75_1:ShowNextGo(false)
			end

			local var_78_3 = 0.0166666666666667

			if var_78_3 < arg_75_1.time_ and arg_75_1.time_ <= var_78_3 + arg_78_0 then
				arg_75_1.var_.oldValueTypewriter = arg_75_1.fswtw_.percent

				arg_75_1:ShowNextGo(false)
			end

			local var_78_4 = 31
			local var_78_5 = 2.06666666666667
			local var_78_6 = arg_75_1:GetWordFromCfg(120121019)
			local var_78_7 = arg_75_1:FormatText(var_78_6.content)
			local var_78_8, var_78_9 = arg_75_1:GetPercentByPara(var_78_7, 1)

			if var_78_3 < arg_75_1.time_ and arg_75_1.time_ <= var_78_3 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0

				local var_78_10 = var_78_4 <= 0 and var_78_5 or var_78_5 * ((var_78_9 - arg_75_1.typewritterCharCountI18N) / var_78_4)

				if var_78_10 > 0 and var_78_5 < var_78_10 then
					arg_75_1.talkMaxDuration = var_78_10

					if var_78_10 + var_78_3 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_10 + var_78_3
					end
				end
			end

			local var_78_11 = 2.06666666666667
			local var_78_12 = math.max(var_78_11, arg_75_1.talkMaxDuration)

			if var_78_3 <= arg_75_1.time_ and arg_75_1.time_ < var_78_3 + var_78_12 then
				local var_78_13 = (arg_75_1.time_ - var_78_3) / var_78_12

				arg_75_1.fswtw_.percent = Mathf.Lerp(arg_75_1.var_.oldValueTypewriter, var_78_8, var_78_13)
				arg_75_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_75_1.fswtw_:SetDirty()
			end

			if arg_75_1.time_ >= var_78_3 + var_78_12 and arg_75_1.time_ < var_78_3 + var_78_12 + arg_78_0 then
				arg_75_1.fswtw_.percent = var_78_8

				arg_75_1.fswtw_:SetDirty()
				arg_75_1:ShowNextGo(true)

				arg_75_1.typewritterCharCountI18N = var_78_9
			end
		end
	end,
	Play120121020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 120121020
		arg_79_1.duration_ = 4.083333333332

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play120121021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.fswbg_:SetActive(true)
				arg_79_1.dialog_:SetActive(false)

				arg_79_1.fswtw_.percent = 0

				local var_82_1 = arg_79_1:GetWordFromCfg(120121020)
				local var_82_2 = arg_79_1:FormatText(var_82_1.content)

				arg_79_1.fswt_.text = var_82_2

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.fswt_)

				arg_79_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_79_1.fswtw_:SetDirty()

				arg_79_1.typewritterCharCountI18N = 0

				SetActive(arg_79_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_79_1:ShowNextGo(false)
			end

			local var_82_3 = 0.0166666666666666

			if var_82_3 < arg_79_1.time_ and arg_79_1.time_ <= var_82_3 + arg_82_0 then
				arg_79_1.var_.oldValueTypewriter = arg_79_1.fswtw_.percent

				arg_79_1:ShowNextGo(false)
			end

			local var_82_4 = 62
			local var_82_5 = 4.06666666666667
			local var_82_6 = arg_79_1:GetWordFromCfg(120121020)
			local var_82_7 = arg_79_1:FormatText(var_82_6.content)
			local var_82_8, var_82_9 = arg_79_1:GetPercentByPara(var_82_7, 1)

			if var_82_3 < arg_79_1.time_ and arg_79_1.time_ <= var_82_3 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0

				local var_82_10 = var_82_4 <= 0 and var_82_5 or var_82_5 * ((var_82_9 - arg_79_1.typewritterCharCountI18N) / var_82_4)

				if var_82_10 > 0 and var_82_5 < var_82_10 then
					arg_79_1.talkMaxDuration = var_82_10

					if var_82_10 + var_82_3 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_10 + var_82_3
					end
				end
			end

			local var_82_11 = 4.06666666666667
			local var_82_12 = math.max(var_82_11, arg_79_1.talkMaxDuration)

			if var_82_3 <= arg_79_1.time_ and arg_79_1.time_ < var_82_3 + var_82_12 then
				local var_82_13 = (arg_79_1.time_ - var_82_3) / var_82_12

				arg_79_1.fswtw_.percent = Mathf.Lerp(arg_79_1.var_.oldValueTypewriter, var_82_8, var_82_13)
				arg_79_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_79_1.fswtw_:SetDirty()
			end

			if arg_79_1.time_ >= var_82_3 + var_82_12 and arg_79_1.time_ < var_82_3 + var_82_12 + arg_82_0 then
				arg_79_1.fswtw_.percent = var_82_8

				arg_79_1.fswtw_:SetDirty()
				arg_79_1:ShowNextGo(true)

				arg_79_1.typewritterCharCountI18N = var_82_9
			end
		end
	end,
	Play120121021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 120121021
		arg_83_1.duration_ = 9

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play120121022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = "J13f"

			if arg_83_1.bgs_[var_86_0] == nil then
				local var_86_1 = Object.Instantiate(arg_83_1.paintGo_)

				var_86_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_86_0)
				var_86_1.name = var_86_0
				var_86_1.transform.parent = arg_83_1.stage_.transform
				var_86_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_83_1.bgs_[var_86_0] = var_86_1
			end

			local var_86_2 = 2

			if var_86_2 < arg_83_1.time_ and arg_83_1.time_ <= var_86_2 + arg_86_0 then
				local var_86_3 = manager.ui.mainCamera.transform.localPosition
				local var_86_4 = Vector3.New(0, 0, 10) + Vector3.New(var_86_3.x, var_86_3.y, 0)
				local var_86_5 = arg_83_1.bgs_.J13f

				var_86_5.transform.localPosition = var_86_4
				var_86_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_86_6 = var_86_5:GetComponent("SpriteRenderer")

				if var_86_6 and var_86_6.sprite then
					local var_86_7 = (var_86_5.transform.localPosition - var_86_3).z
					local var_86_8 = manager.ui.mainCameraCom_
					local var_86_9 = 2 * var_86_7 * Mathf.Tan(var_86_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_86_10 = var_86_9 * var_86_8.aspect
					local var_86_11 = var_86_6.sprite.bounds.size.x
					local var_86_12 = var_86_6.sprite.bounds.size.y
					local var_86_13 = var_86_10 / var_86_11
					local var_86_14 = var_86_9 / var_86_12
					local var_86_15 = var_86_14 < var_86_13 and var_86_13 or var_86_14

					var_86_5.transform.localScale = Vector3.New(var_86_15, var_86_15, 0)
				end

				for iter_86_0, iter_86_1 in pairs(arg_83_1.bgs_) do
					if iter_86_0 ~= "J13f" then
						iter_86_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_17 = 2

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17
				local var_86_19 = Color.New(0, 0, 0)

				var_86_19.a = Mathf.Lerp(0, 1, var_86_18)
				arg_83_1.mask_.color = var_86_19
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 then
				local var_86_20 = Color.New(0, 0, 0)

				var_86_20.a = 1
				arg_83_1.mask_.color = var_86_20
			end

			local var_86_21 = 2

			if var_86_21 < arg_83_1.time_ and arg_83_1.time_ <= var_86_21 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_22 = 2

			if var_86_21 <= arg_83_1.time_ and arg_83_1.time_ < var_86_21 + var_86_22 then
				local var_86_23 = (arg_83_1.time_ - var_86_21) / var_86_22
				local var_86_24 = Color.New(0, 0, 0)

				var_86_24.a = Mathf.Lerp(1, 0, var_86_23)
				arg_83_1.mask_.color = var_86_24
			end

			if arg_83_1.time_ >= var_86_21 + var_86_22 and arg_83_1.time_ < var_86_21 + var_86_22 + arg_86_0 then
				local var_86_25 = Color.New(0, 0, 0)
				local var_86_26 = 0

				arg_83_1.mask_.enabled = false
				var_86_25.a = var_86_26
				arg_83_1.mask_.color = var_86_25
			end

			local var_86_27 = 0
			local var_86_28 = 0.866666666666667

			if var_86_27 < arg_83_1.time_ and arg_83_1.time_ <= var_86_27 + arg_86_0 then
				local var_86_29 = "play"
				local var_86_30 = "music"

				arg_83_1:AudioAction(var_86_29, var_86_30, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_86_31 = 2

			if var_86_31 < arg_83_1.time_ and arg_83_1.time_ <= var_86_31 + arg_86_0 then
				arg_83_1.fswbg_:SetActive(false)
				arg_83_1.dialog_:SetActive(false)
				arg_83_1:ShowNextGo(false)
			end

			local var_86_32 = "J13f_blur"

			if arg_83_1.bgs_[var_86_32] == nil then
				local var_86_33 = Object.Instantiate(arg_83_1.blurPaintGo_)
				local var_86_34 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_86_32)

				var_86_33:GetComponent("SpriteRenderer").sprite = var_86_34
				var_86_33.name = var_86_32
				var_86_33.transform.parent = arg_83_1.stage_.transform
				var_86_33.transform.localPosition = Vector3.New(0, 100, 0)
				arg_83_1.bgs_[var_86_32] = var_86_33
			end

			local var_86_35 = 2
			local var_86_36 = arg_83_1.bgs_[var_86_32]

			if var_86_35 < arg_83_1.time_ and arg_83_1.time_ <= var_86_35 + arg_86_0 then
				local var_86_37 = manager.ui.mainCamera.transform.localPosition
				local var_86_38 = Vector3.New(0, 0, 10) + Vector3.New(var_86_37.x, var_86_37.y, 0)

				var_86_36.transform.localPosition = var_86_38
				var_86_36.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_86_39 = var_86_36:GetComponent("SpriteRenderer")

				if var_86_39 and var_86_39.sprite then
					local var_86_40 = (var_86_36.transform.localPosition - var_86_37).z
					local var_86_41 = manager.ui.mainCameraCom_
					local var_86_42 = 2 * var_86_40 * Mathf.Tan(var_86_41.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_86_43 = var_86_42 * var_86_41.aspect
					local var_86_44 = var_86_39.sprite.bounds.size.x
					local var_86_45 = var_86_39.sprite.bounds.size.y
					local var_86_46 = var_86_43 / var_86_44
					local var_86_47 = var_86_42 / var_86_45
					local var_86_48 = var_86_47 < var_86_46 and var_86_46 or var_86_47

					var_86_36.transform.localScale = Vector3.New(var_86_48, var_86_48, 0)
				end
			end

			local var_86_49 = 2

			if var_86_35 <= arg_83_1.time_ and arg_83_1.time_ < var_86_35 + var_86_49 then
				local var_86_50 = (arg_83_1.time_ - var_86_35) / var_86_49
				local var_86_51 = Color.New(1, 1, 1)

				var_86_51.a = Mathf.Lerp(1, 0, var_86_50)

				var_86_36:GetComponent("SpriteRenderer").material:SetColor("_Color", var_86_51)
			end

			if arg_83_1.frameCnt_ <= 1 then
				arg_83_1.dialog_:SetActive(false)
			end

			local var_86_52 = 4
			local var_86_53 = 0.825

			if var_86_52 < arg_83_1.time_ and arg_83_1.time_ <= var_86_52 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				arg_83_1.dialog_:SetActive(true)

				local var_86_54 = LeanTween.value(arg_83_1.dialog_, 0, 1, 0.3)

				var_86_54:setOnUpdate(LuaHelper.FloatAction(function(arg_87_0)
					arg_83_1.dialogCg_.alpha = arg_87_0
				end))
				var_86_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_83_1.dialog_)
					var_86_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_83_1.duration_ = arg_83_1.duration_ + 0.3

				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_55 = arg_83_1:GetWordFromCfg(120121021)
				local var_86_56 = arg_83_1:FormatText(var_86_55.content)

				arg_83_1.text_.text = var_86_56

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_57 = 33
				local var_86_58 = utf8.len(var_86_56)
				local var_86_59 = var_86_57 <= 0 and var_86_53 or var_86_53 * (var_86_58 / var_86_57)

				if var_86_59 > 0 and var_86_53 < var_86_59 then
					arg_83_1.talkMaxDuration = var_86_59
					var_86_52 = var_86_52 + 0.3

					if var_86_59 + var_86_52 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_59 + var_86_52
					end
				end

				arg_83_1.text_.text = var_86_56
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_60 = var_86_52 + 0.3
			local var_86_61 = math.max(var_86_53, arg_83_1.talkMaxDuration)

			if var_86_60 <= arg_83_1.time_ and arg_83_1.time_ < var_86_60 + var_86_61 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_60) / var_86_61

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_60 + var_86_61 and arg_83_1.time_ < var_86_60 + var_86_61 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play120121022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 120121022
		arg_89_1.duration_ = 8.533

		local var_89_0 = {
			zh = 4.333,
			ja = 8.533
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
				arg_89_0:Play120121023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.5

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[384].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, true)
				arg_89_1.iconController_:SetSelectedState("hero")

				arg_89_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(120121022)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121022", "story_v_out_120121.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_120121", "120121022", "story_v_out_120121.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_120121", "120121022", "story_v_out_120121.awb")

						arg_89_1:RecordAudio("120121022", var_92_9)
						arg_89_1:RecordAudio("120121022", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_120121", "120121022", "story_v_out_120121.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_120121", "120121022", "story_v_out_120121.awb")
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
	Play120121023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 120121023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play120121024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.4

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_2 = arg_93_1:GetWordFromCfg(120121023)
				local var_96_3 = arg_93_1:FormatText(var_96_2.content)

				arg_93_1.text_.text = var_96_3

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_4 = 16
				local var_96_5 = utf8.len(var_96_3)
				local var_96_6 = var_96_4 <= 0 and var_96_1 or var_96_1 * (var_96_5 / var_96_4)

				if var_96_6 > 0 and var_96_1 < var_96_6 then
					arg_93_1.talkMaxDuration = var_96_6

					if var_96_6 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_6 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_3
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_7 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_7 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_7

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_7 and arg_93_1.time_ < var_96_0 + var_96_7 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play120121024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 120121024
		arg_97_1.duration_ = 2.399999999999

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play120121025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = "1075ui_story"

			if arg_97_1.actors_[var_100_0] == nil then
				local var_100_1 = Object.Instantiate(Asset.Load("Char/" .. var_100_0), arg_97_1.stage_.transform)

				var_100_1.name = var_100_0
				var_100_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_97_1.actors_[var_100_0] = var_100_1

				local var_100_2 = var_100_1:GetComponentInChildren(typeof(CharacterEffect))

				var_100_2.enabled = true

				local var_100_3 = GameObjectTools.GetOrAddComponent(var_100_1, typeof(DynamicBoneHelper))

				if var_100_3 then
					var_100_3:EnableDynamicBone(false)
				end

				arg_97_1:ShowWeapon(var_100_2.transform, false)

				arg_97_1.var_[var_100_0 .. "Animator"] = var_100_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_97_1.var_[var_100_0 .. "Animator"].applyRootMotion = true
				arg_97_1.var_[var_100_0 .. "LipSync"] = var_100_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_100_4 = arg_97_1.actors_["1075ui_story"].transform
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1.var_.moveOldPos1075ui_story = var_100_4.localPosition
			end

			local var_100_6 = 0.001

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6
				local var_100_8 = Vector3.New(0, -1.055, -6.16)

				var_100_4.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1075ui_story, var_100_8, var_100_7)

				local var_100_9 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_9.x, var_100_9.y, var_100_9.z)

				local var_100_10 = var_100_4.localEulerAngles

				var_100_10.z = 0
				var_100_10.x = 0
				var_100_4.localEulerAngles = var_100_10
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 then
				var_100_4.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_100_11 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_11.x, var_100_11.y, var_100_11.z)

				local var_100_12 = var_100_4.localEulerAngles

				var_100_12.z = 0
				var_100_12.x = 0
				var_100_4.localEulerAngles = var_100_12
			end

			local var_100_13 = 0

			if var_100_13 < arg_97_1.time_ and arg_97_1.time_ <= var_100_13 + arg_100_0 then
				arg_97_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_100_15 = 0
			local var_100_16 = 0.15

			if var_100_15 < arg_97_1.time_ and arg_97_1.time_ <= var_100_15 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_17 = arg_97_1:FormatText(StoryNameCfg[381].name)

				arg_97_1.leftNameTxt_.text = var_100_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_18 = arg_97_1:GetWordFromCfg(120121024)
				local var_100_19 = arg_97_1:FormatText(var_100_18.content)

				arg_97_1.text_.text = var_100_19

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_20 = 6
				local var_100_21 = utf8.len(var_100_19)
				local var_100_22 = var_100_20 <= 0 and var_100_16 or var_100_16 * (var_100_21 / var_100_20)

				if var_100_22 > 0 and var_100_16 < var_100_22 then
					arg_97_1.talkMaxDuration = var_100_22

					if var_100_22 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_22 + var_100_15
					end
				end

				arg_97_1.text_.text = var_100_19
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121024", "story_v_out_120121.awb") ~= 0 then
					local var_100_23 = manager.audio:GetVoiceLength("story_v_out_120121", "120121024", "story_v_out_120121.awb") / 1000

					if var_100_23 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_23 + var_100_15
					end

					if var_100_18.prefab_name ~= "" and arg_97_1.actors_[var_100_18.prefab_name] ~= nil then
						local var_100_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_18.prefab_name].transform, "story_v_out_120121", "120121024", "story_v_out_120121.awb")

						arg_97_1:RecordAudio("120121024", var_100_24)
						arg_97_1:RecordAudio("120121024", var_100_24)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_120121", "120121024", "story_v_out_120121.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_120121", "120121024", "story_v_out_120121.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_25 = math.max(var_100_16, arg_97_1.talkMaxDuration)

			if var_100_15 <= arg_97_1.time_ and arg_97_1.time_ < var_100_15 + var_100_25 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_15) / var_100_25

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_15 + var_100_25 and arg_97_1.time_ < var_100_15 + var_100_25 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play120121025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 120121025
		arg_101_1.duration_ = 5.266

		local var_101_0 = {
			zh = 4.1,
			ja = 5.266
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
				arg_101_0:Play120121026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.525

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[381].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(120121025)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121025", "story_v_out_120121.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_120121", "120121025", "story_v_out_120121.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_120121", "120121025", "story_v_out_120121.awb")

						arg_101_1:RecordAudio("120121025", var_104_9)
						arg_101_1:RecordAudio("120121025", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_120121", "120121025", "story_v_out_120121.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_120121", "120121025", "story_v_out_120121.awb")
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
	Play120121026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 120121026
		arg_105_1.duration_ = 1.999999999999

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play120121027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.166666666666667

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				local var_108_2 = "play"
				local var_108_3 = "music"

				arg_105_1:AudioAction(var_108_2, var_108_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_108_4 = 0.233333333333333
			local var_108_5 = 1

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				local var_108_6 = "play"
				local var_108_7 = "music"

				arg_105_1:AudioAction(var_108_6, var_108_7, "bgm_activity_2_0_story_jingdu", "bgm_activity_2_0_story_jingdu", "bgm_activity_2_0_story_jingdu.awb")
			end

			local var_108_8 = 0

			if var_108_8 < arg_105_1.time_ and arg_105_1.time_ <= var_108_8 + arg_108_0 then
				arg_105_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_108_9 = arg_105_1.actors_["1075ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect1075ui_story == nil then
				arg_105_1.var_.characterEffect1075ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.2

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect1075ui_story then
					local var_108_13 = Mathf.Lerp(0, 0.5, var_108_12)

					arg_105_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1075ui_story.fillRatio = var_108_13
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect1075ui_story then
				local var_108_14 = 0.5

				arg_105_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1075ui_story.fillRatio = var_108_14
			end

			local var_108_15 = 0
			local var_108_16 = 0.05

			if var_108_15 < arg_105_1.time_ and arg_105_1.time_ <= var_108_15 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_17 = arg_105_1:FormatText(StoryNameCfg[384].name)

				arg_105_1.leftNameTxt_.text = var_108_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, true)
				arg_105_1.iconController_:SetSelectedState("hero")

				arg_105_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_18 = arg_105_1:GetWordFromCfg(120121026)
				local var_108_19 = arg_105_1:FormatText(var_108_18.content)

				arg_105_1.text_.text = var_108_19

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_20 = 2
				local var_108_21 = utf8.len(var_108_19)
				local var_108_22 = var_108_20 <= 0 and var_108_16 or var_108_16 * (var_108_21 / var_108_20)

				if var_108_22 > 0 and var_108_16 < var_108_22 then
					arg_105_1.talkMaxDuration = var_108_22

					if var_108_22 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_22 + var_108_15
					end
				end

				arg_105_1.text_.text = var_108_19
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121026", "story_v_out_120121.awb") ~= 0 then
					local var_108_23 = manager.audio:GetVoiceLength("story_v_out_120121", "120121026", "story_v_out_120121.awb") / 1000

					if var_108_23 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_23 + var_108_15
					end

					if var_108_18.prefab_name ~= "" and arg_105_1.actors_[var_108_18.prefab_name] ~= nil then
						local var_108_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_18.prefab_name].transform, "story_v_out_120121", "120121026", "story_v_out_120121.awb")

						arg_105_1:RecordAudio("120121026", var_108_24)
						arg_105_1:RecordAudio("120121026", var_108_24)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_120121", "120121026", "story_v_out_120121.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_120121", "120121026", "story_v_out_120121.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_25 = math.max(var_108_16, arg_105_1.talkMaxDuration)

			if var_108_15 <= arg_105_1.time_ and arg_105_1.time_ < var_108_15 + var_108_25 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_15) / var_108_25

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_15 + var_108_25 and arg_105_1.time_ < var_108_15 + var_108_25 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play120121027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 120121027
		arg_109_1.duration_ = 11.6

		local var_109_0 = {
			zh = 11.6,
			ja = 7.433
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
				arg_109_0:Play120121028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1071ui_story"].transform
			local var_112_1 = 3.8

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1071ui_story = var_112_0.localPosition
			end

			local var_112_2 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2
				local var_112_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1071ui_story, var_112_4, var_112_3)

				local var_112_5 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_5.x, var_112_5.y, var_112_5.z)

				local var_112_6 = var_112_0.localEulerAngles

				var_112_6.z = 0
				var_112_6.x = 0
				var_112_0.localEulerAngles = var_112_6
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_112_7 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_7.x, var_112_7.y, var_112_7.z)

				local var_112_8 = var_112_0.localEulerAngles

				var_112_8.z = 0
				var_112_8.x = 0
				var_112_0.localEulerAngles = var_112_8
			end

			local var_112_9 = arg_109_1.actors_["1075ui_story"].transform
			local var_112_10 = 3.8

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 then
				arg_109_1.var_.moveOldPos1075ui_story = var_112_9.localPosition
			end

			local var_112_11 = 0.001

			if var_112_10 <= arg_109_1.time_ and arg_109_1.time_ < var_112_10 + var_112_11 then
				local var_112_12 = (arg_109_1.time_ - var_112_10) / var_112_11
				local var_112_13 = Vector3.New(0.7, -1.055, -6.16)

				var_112_9.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1075ui_story, var_112_13, var_112_12)

				local var_112_14 = manager.ui.mainCamera.transform.position - var_112_9.position

				var_112_9.forward = Vector3.New(var_112_14.x, var_112_14.y, var_112_14.z)

				local var_112_15 = var_112_9.localEulerAngles

				var_112_15.z = 0
				var_112_15.x = 0
				var_112_9.localEulerAngles = var_112_15
			end

			if arg_109_1.time_ >= var_112_10 + var_112_11 and arg_109_1.time_ < var_112_10 + var_112_11 + arg_112_0 then
				var_112_9.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_112_16 = manager.ui.mainCamera.transform.position - var_112_9.position

				var_112_9.forward = Vector3.New(var_112_16.x, var_112_16.y, var_112_16.z)

				local var_112_17 = var_112_9.localEulerAngles

				var_112_17.z = 0
				var_112_17.x = 0
				var_112_9.localEulerAngles = var_112_17
			end

			local var_112_18 = arg_109_1.actors_["1071ui_story"]
			local var_112_19 = 3.8

			if var_112_19 < arg_109_1.time_ and arg_109_1.time_ <= var_112_19 + arg_112_0 and arg_109_1.var_.characterEffect1071ui_story == nil then
				arg_109_1.var_.characterEffect1071ui_story = var_112_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_20 = 0.2

			if var_112_19 <= arg_109_1.time_ and arg_109_1.time_ < var_112_19 + var_112_20 then
				local var_112_21 = (arg_109_1.time_ - var_112_19) / var_112_20

				if arg_109_1.var_.characterEffect1071ui_story then
					arg_109_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_19 + var_112_20 and arg_109_1.time_ < var_112_19 + var_112_20 + arg_112_0 and arg_109_1.var_.characterEffect1071ui_story then
				arg_109_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_112_22 = arg_109_1.actors_["1075ui_story"]
			local var_112_23 = 3.8

			if var_112_23 < arg_109_1.time_ and arg_109_1.time_ <= var_112_23 + arg_112_0 and arg_109_1.var_.characterEffect1075ui_story == nil then
				arg_109_1.var_.characterEffect1075ui_story = var_112_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_24 = 0.034

			if var_112_23 <= arg_109_1.time_ and arg_109_1.time_ < var_112_23 + var_112_24 then
				local var_112_25 = (arg_109_1.time_ - var_112_23) / var_112_24

				if arg_109_1.var_.characterEffect1075ui_story then
					local var_112_26 = Mathf.Lerp(0, 0.5, var_112_25)

					arg_109_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1075ui_story.fillRatio = var_112_26
				end
			end

			if arg_109_1.time_ >= var_112_23 + var_112_24 and arg_109_1.time_ < var_112_23 + var_112_24 + arg_112_0 and arg_109_1.var_.characterEffect1075ui_story then
				local var_112_27 = 0.5

				arg_109_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1075ui_story.fillRatio = var_112_27
			end

			local var_112_28 = 3.8

			if var_112_28 < arg_109_1.time_ and arg_109_1.time_ <= var_112_28 + arg_112_0 then
				arg_109_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action7_1")
			end

			local var_112_29 = 3.8

			if var_112_29 < arg_109_1.time_ and arg_109_1.time_ <= var_112_29 + arg_112_0 then
				arg_109_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_112_30 = 0

			if var_112_30 < arg_109_1.time_ and arg_109_1.time_ <= var_112_30 + arg_112_0 then
				arg_109_1.mask_.enabled = true
				arg_109_1.mask_.raycastTarget = true

				arg_109_1:SetGaussion(false)
			end

			local var_112_31 = 2

			if var_112_30 <= arg_109_1.time_ and arg_109_1.time_ < var_112_30 + var_112_31 then
				local var_112_32 = (arg_109_1.time_ - var_112_30) / var_112_31
				local var_112_33 = Color.New(0, 0, 0)

				var_112_33.a = Mathf.Lerp(0, 1, var_112_32)
				arg_109_1.mask_.color = var_112_33
			end

			if arg_109_1.time_ >= var_112_30 + var_112_31 and arg_109_1.time_ < var_112_30 + var_112_31 + arg_112_0 then
				local var_112_34 = Color.New(0, 0, 0)

				var_112_34.a = 1
				arg_109_1.mask_.color = var_112_34
			end

			local var_112_35 = 2

			if var_112_35 < arg_109_1.time_ and arg_109_1.time_ <= var_112_35 + arg_112_0 then
				arg_109_1.mask_.enabled = true
				arg_109_1.mask_.raycastTarget = true

				arg_109_1:SetGaussion(false)
			end

			local var_112_36 = 2

			if var_112_35 <= arg_109_1.time_ and arg_109_1.time_ < var_112_35 + var_112_36 then
				local var_112_37 = (arg_109_1.time_ - var_112_35) / var_112_36
				local var_112_38 = Color.New(0, 0, 0)

				var_112_38.a = Mathf.Lerp(1, 0, var_112_37)
				arg_109_1.mask_.color = var_112_38
			end

			if arg_109_1.time_ >= var_112_35 + var_112_36 and arg_109_1.time_ < var_112_35 + var_112_36 + arg_112_0 then
				local var_112_39 = Color.New(0, 0, 0)
				local var_112_40 = 0

				arg_109_1.mask_.enabled = false
				var_112_39.a = var_112_40
				arg_109_1.mask_.color = var_112_39
			end

			local var_112_41 = arg_109_1.actors_["1075ui_story"].transform
			local var_112_42 = 1.966

			if var_112_42 < arg_109_1.time_ and arg_109_1.time_ <= var_112_42 + arg_112_0 then
				arg_109_1.var_.moveOldPos1075ui_story = var_112_41.localPosition
			end

			local var_112_43 = 0.001

			if var_112_42 <= arg_109_1.time_ and arg_109_1.time_ < var_112_42 + var_112_43 then
				local var_112_44 = (arg_109_1.time_ - var_112_42) / var_112_43
				local var_112_45 = Vector3.New(0, 100, 0)

				var_112_41.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1075ui_story, var_112_45, var_112_44)

				local var_112_46 = manager.ui.mainCamera.transform.position - var_112_41.position

				var_112_41.forward = Vector3.New(var_112_46.x, var_112_46.y, var_112_46.z)

				local var_112_47 = var_112_41.localEulerAngles

				var_112_47.z = 0
				var_112_47.x = 0
				var_112_41.localEulerAngles = var_112_47
			end

			if arg_109_1.time_ >= var_112_42 + var_112_43 and arg_109_1.time_ < var_112_42 + var_112_43 + arg_112_0 then
				var_112_41.localPosition = Vector3.New(0, 100, 0)

				local var_112_48 = manager.ui.mainCamera.transform.position - var_112_41.position

				var_112_41.forward = Vector3.New(var_112_48.x, var_112_48.y, var_112_48.z)

				local var_112_49 = var_112_41.localEulerAngles

				var_112_49.z = 0
				var_112_49.x = 0
				var_112_41.localEulerAngles = var_112_49
			end

			if arg_109_1.frameCnt_ <= 1 then
				arg_109_1.dialog_:SetActive(false)
			end

			local var_112_50 = 4
			local var_112_51 = 0.625

			if var_112_50 < arg_109_1.time_ and arg_109_1.time_ <= var_112_50 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0

				arg_109_1.dialog_:SetActive(true)

				local var_112_52 = LeanTween.value(arg_109_1.dialog_, 0, 1, 0.3)

				var_112_52:setOnUpdate(LuaHelper.FloatAction(function(arg_113_0)
					arg_109_1.dialogCg_.alpha = arg_113_0
				end))
				var_112_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_109_1.dialog_)
					var_112_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_109_1.duration_ = arg_109_1.duration_ + 0.3

				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_53 = arg_109_1:FormatText(StoryNameCfg[384].name)

				arg_109_1.leftNameTxt_.text = var_112_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_54 = arg_109_1:GetWordFromCfg(120121027)
				local var_112_55 = arg_109_1:FormatText(var_112_54.content)

				arg_109_1.text_.text = var_112_55

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_56 = 25
				local var_112_57 = utf8.len(var_112_55)
				local var_112_58 = var_112_56 <= 0 and var_112_51 or var_112_51 * (var_112_57 / var_112_56)

				if var_112_58 > 0 and var_112_51 < var_112_58 then
					arg_109_1.talkMaxDuration = var_112_58
					var_112_50 = var_112_50 + 0.3

					if var_112_58 + var_112_50 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_58 + var_112_50
					end
				end

				arg_109_1.text_.text = var_112_55
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121027", "story_v_out_120121.awb") ~= 0 then
					local var_112_59 = manager.audio:GetVoiceLength("story_v_out_120121", "120121027", "story_v_out_120121.awb") / 1000

					if var_112_59 + var_112_50 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_59 + var_112_50
					end

					if var_112_54.prefab_name ~= "" and arg_109_1.actors_[var_112_54.prefab_name] ~= nil then
						local var_112_60 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_54.prefab_name].transform, "story_v_out_120121", "120121027", "story_v_out_120121.awb")

						arg_109_1:RecordAudio("120121027", var_112_60)
						arg_109_1:RecordAudio("120121027", var_112_60)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_120121", "120121027", "story_v_out_120121.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_120121", "120121027", "story_v_out_120121.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_61 = var_112_50 + 0.3
			local var_112_62 = math.max(var_112_51, arg_109_1.talkMaxDuration)

			if var_112_61 <= arg_109_1.time_ and arg_109_1.time_ < var_112_61 + var_112_62 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_61) / var_112_62

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_61 + var_112_62 and arg_109_1.time_ < var_112_61 + var_112_62 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play120121028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 120121028
		arg_115_1.duration_ = 5.9

		local var_115_0 = {
			zh = 5.566,
			ja = 5.9
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
				arg_115_0:Play120121029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1071ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1071ui_story == nil then
				arg_115_1.var_.characterEffect1071ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1071ui_story then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1071ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1071ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1071ui_story.fillRatio = var_118_5
			end

			local var_118_6 = arg_115_1.actors_["1075ui_story"]
			local var_118_7 = 0

			if var_118_7 < arg_115_1.time_ and arg_115_1.time_ <= var_118_7 + arg_118_0 and arg_115_1.var_.characterEffect1075ui_story == nil then
				arg_115_1.var_.characterEffect1075ui_story = var_118_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_8 = 0.2

			if var_118_7 <= arg_115_1.time_ and arg_115_1.time_ < var_118_7 + var_118_8 then
				local var_118_9 = (arg_115_1.time_ - var_118_7) / var_118_8

				if arg_115_1.var_.characterEffect1075ui_story then
					arg_115_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_7 + var_118_8 and arg_115_1.time_ < var_118_7 + var_118_8 + arg_118_0 and arg_115_1.var_.characterEffect1075ui_story then
				arg_115_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 then
				arg_115_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action2_1")
			end

			local var_118_11 = 0

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_118_12 = 0
			local var_118_13 = 0.7

			if var_118_12 < arg_115_1.time_ and arg_115_1.time_ <= var_118_12 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_14 = arg_115_1:FormatText(StoryNameCfg[381].name)

				arg_115_1.leftNameTxt_.text = var_118_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_15 = arg_115_1:GetWordFromCfg(120121028)
				local var_118_16 = arg_115_1:FormatText(var_118_15.content)

				arg_115_1.text_.text = var_118_16

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_17 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121028", "story_v_out_120121.awb") ~= 0 then
					local var_118_20 = manager.audio:GetVoiceLength("story_v_out_120121", "120121028", "story_v_out_120121.awb") / 1000

					if var_118_20 + var_118_12 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_20 + var_118_12
					end

					if var_118_15.prefab_name ~= "" and arg_115_1.actors_[var_118_15.prefab_name] ~= nil then
						local var_118_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_15.prefab_name].transform, "story_v_out_120121", "120121028", "story_v_out_120121.awb")

						arg_115_1:RecordAudio("120121028", var_118_21)
						arg_115_1:RecordAudio("120121028", var_118_21)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_120121", "120121028", "story_v_out_120121.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_120121", "120121028", "story_v_out_120121.awb")
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
	Play120121029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 120121029
		arg_119_1.duration_ = 6.933

		local var_119_0 = {
			zh = 3.533,
			ja = 6.933
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
				arg_119_0:Play120121030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1071ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1071ui_story == nil then
				arg_119_1.var_.characterEffect1071ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1071ui_story then
					arg_119_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1071ui_story then
				arg_119_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_122_4 = arg_119_1.actors_["1075ui_story"]
			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 and arg_119_1.var_.characterEffect1075ui_story == nil then
				arg_119_1.var_.characterEffect1075ui_story = var_122_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_6 = 0.2

			if var_122_5 <= arg_119_1.time_ and arg_119_1.time_ < var_122_5 + var_122_6 then
				local var_122_7 = (arg_119_1.time_ - var_122_5) / var_122_6

				if arg_119_1.var_.characterEffect1075ui_story then
					local var_122_8 = Mathf.Lerp(0, 0.5, var_122_7)

					arg_119_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1075ui_story.fillRatio = var_122_8
				end
			end

			if arg_119_1.time_ >= var_122_5 + var_122_6 and arg_119_1.time_ < var_122_5 + var_122_6 + arg_122_0 and arg_119_1.var_.characterEffect1075ui_story then
				local var_122_9 = 0.5

				arg_119_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1075ui_story.fillRatio = var_122_9
			end

			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 then
				arg_119_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action7_2")
			end

			local var_122_11 = 0
			local var_122_12 = 0.4

			if var_122_11 < arg_119_1.time_ and arg_119_1.time_ <= var_122_11 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_13 = arg_119_1:FormatText(StoryNameCfg[384].name)

				arg_119_1.leftNameTxt_.text = var_122_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_14 = arg_119_1:GetWordFromCfg(120121029)
				local var_122_15 = arg_119_1:FormatText(var_122_14.content)

				arg_119_1.text_.text = var_122_15

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_16 = 16
				local var_122_17 = utf8.len(var_122_15)
				local var_122_18 = var_122_16 <= 0 and var_122_12 or var_122_12 * (var_122_17 / var_122_16)

				if var_122_18 > 0 and var_122_12 < var_122_18 then
					arg_119_1.talkMaxDuration = var_122_18

					if var_122_18 + var_122_11 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_18 + var_122_11
					end
				end

				arg_119_1.text_.text = var_122_15
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121029", "story_v_out_120121.awb") ~= 0 then
					local var_122_19 = manager.audio:GetVoiceLength("story_v_out_120121", "120121029", "story_v_out_120121.awb") / 1000

					if var_122_19 + var_122_11 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_19 + var_122_11
					end

					if var_122_14.prefab_name ~= "" and arg_119_1.actors_[var_122_14.prefab_name] ~= nil then
						local var_122_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_14.prefab_name].transform, "story_v_out_120121", "120121029", "story_v_out_120121.awb")

						arg_119_1:RecordAudio("120121029", var_122_20)
						arg_119_1:RecordAudio("120121029", var_122_20)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_120121", "120121029", "story_v_out_120121.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_120121", "120121029", "story_v_out_120121.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_21 = math.max(var_122_12, arg_119_1.talkMaxDuration)

			if var_122_11 <= arg_119_1.time_ and arg_119_1.time_ < var_122_11 + var_122_21 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_11) / var_122_21

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_11 + var_122_21 and arg_119_1.time_ < var_122_11 + var_122_21 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play120121030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 120121030
		arg_123_1.duration_ = 4.533

		local var_123_0 = {
			zh = 2.133,
			ja = 4.533
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
				arg_123_0:Play120121031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1071ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1071ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1071ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["1075ui_story"].transform
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 then
				arg_123_1.var_.moveOldPos1075ui_story = var_126_9.localPosition
			end

			local var_126_11 = 0.001

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11
				local var_126_13 = Vector3.New(0.7, -1.055, -6.16)

				var_126_9.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1075ui_story, var_126_13, var_126_12)

				local var_126_14 = manager.ui.mainCamera.transform.position - var_126_9.position

				var_126_9.forward = Vector3.New(var_126_14.x, var_126_14.y, var_126_14.z)

				local var_126_15 = var_126_9.localEulerAngles

				var_126_15.z = 0
				var_126_15.x = 0
				var_126_9.localEulerAngles = var_126_15
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 then
				var_126_9.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_126_16 = manager.ui.mainCamera.transform.position - var_126_9.position

				var_126_9.forward = Vector3.New(var_126_16.x, var_126_16.y, var_126_16.z)

				local var_126_17 = var_126_9.localEulerAngles

				var_126_17.z = 0
				var_126_17.x = 0
				var_126_9.localEulerAngles = var_126_17
			end

			local var_126_18 = arg_123_1.actors_["1071ui_story"]
			local var_126_19 = 0

			if var_126_19 < arg_123_1.time_ and arg_123_1.time_ <= var_126_19 + arg_126_0 and arg_123_1.var_.characterEffect1071ui_story == nil then
				arg_123_1.var_.characterEffect1071ui_story = var_126_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_20 = 0.2

			if var_126_19 <= arg_123_1.time_ and arg_123_1.time_ < var_126_19 + var_126_20 then
				local var_126_21 = (arg_123_1.time_ - var_126_19) / var_126_20

				if arg_123_1.var_.characterEffect1071ui_story then
					local var_126_22 = Mathf.Lerp(0, 0.5, var_126_21)

					arg_123_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1071ui_story.fillRatio = var_126_22
				end
			end

			if arg_123_1.time_ >= var_126_19 + var_126_20 and arg_123_1.time_ < var_126_19 + var_126_20 + arg_126_0 and arg_123_1.var_.characterEffect1071ui_story then
				local var_126_23 = 0.5

				arg_123_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1071ui_story.fillRatio = var_126_23
			end

			local var_126_24 = arg_123_1.actors_["1075ui_story"]
			local var_126_25 = 0

			if var_126_25 < arg_123_1.time_ and arg_123_1.time_ <= var_126_25 + arg_126_0 and arg_123_1.var_.characterEffect1075ui_story == nil then
				arg_123_1.var_.characterEffect1075ui_story = var_126_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_26 = 0.2

			if var_126_25 <= arg_123_1.time_ and arg_123_1.time_ < var_126_25 + var_126_26 then
				local var_126_27 = (arg_123_1.time_ - var_126_25) / var_126_26

				if arg_123_1.var_.characterEffect1075ui_story then
					arg_123_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_25 + var_126_26 and arg_123_1.time_ < var_126_25 + var_126_26 + arg_126_0 and arg_123_1.var_.characterEffect1075ui_story then
				arg_123_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_126_28 = 0

			if var_126_28 < arg_123_1.time_ and arg_123_1.time_ <= var_126_28 + arg_126_0 then
				arg_123_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action2_2")
			end

			local var_126_29 = 0

			if var_126_29 < arg_123_1.time_ and arg_123_1.time_ <= var_126_29 + arg_126_0 then
				arg_123_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_126_30 = 0
			local var_126_31 = 0.25

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_32 = arg_123_1:FormatText(StoryNameCfg[381].name)

				arg_123_1.leftNameTxt_.text = var_126_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_33 = arg_123_1:GetWordFromCfg(120121030)
				local var_126_34 = arg_123_1:FormatText(var_126_33.content)

				arg_123_1.text_.text = var_126_34

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_35 = 10
				local var_126_36 = utf8.len(var_126_34)
				local var_126_37 = var_126_35 <= 0 and var_126_31 or var_126_31 * (var_126_36 / var_126_35)

				if var_126_37 > 0 and var_126_31 < var_126_37 then
					arg_123_1.talkMaxDuration = var_126_37

					if var_126_37 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_37 + var_126_30
					end
				end

				arg_123_1.text_.text = var_126_34
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121030", "story_v_out_120121.awb") ~= 0 then
					local var_126_38 = manager.audio:GetVoiceLength("story_v_out_120121", "120121030", "story_v_out_120121.awb") / 1000

					if var_126_38 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_38 + var_126_30
					end

					if var_126_33.prefab_name ~= "" and arg_123_1.actors_[var_126_33.prefab_name] ~= nil then
						local var_126_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_33.prefab_name].transform, "story_v_out_120121", "120121030", "story_v_out_120121.awb")

						arg_123_1:RecordAudio("120121030", var_126_39)
						arg_123_1:RecordAudio("120121030", var_126_39)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_120121", "120121030", "story_v_out_120121.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_120121", "120121030", "story_v_out_120121.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_40 = math.max(var_126_31, arg_123_1.talkMaxDuration)

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_40 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_30) / var_126_40

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_30 + var_126_40 and arg_123_1.time_ < var_126_30 + var_126_40 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play120121031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 120121031
		arg_127_1.duration_ = 3.3

		local var_127_0 = {
			zh = 3.3,
			ja = 3.2
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
				arg_127_0:Play120121032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1071ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1071ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1071ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["1075ui_story"].transform
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 then
				arg_127_1.var_.moveOldPos1075ui_story = var_130_9.localPosition
			end

			local var_130_11 = 0.001

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11
				local var_130_13 = Vector3.New(0.7, -1.055, -6.16)

				var_130_9.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1075ui_story, var_130_13, var_130_12)

				local var_130_14 = manager.ui.mainCamera.transform.position - var_130_9.position

				var_130_9.forward = Vector3.New(var_130_14.x, var_130_14.y, var_130_14.z)

				local var_130_15 = var_130_9.localEulerAngles

				var_130_15.z = 0
				var_130_15.x = 0
				var_130_9.localEulerAngles = var_130_15
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 then
				var_130_9.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_130_16 = manager.ui.mainCamera.transform.position - var_130_9.position

				var_130_9.forward = Vector3.New(var_130_16.x, var_130_16.y, var_130_16.z)

				local var_130_17 = var_130_9.localEulerAngles

				var_130_17.z = 0
				var_130_17.x = 0
				var_130_9.localEulerAngles = var_130_17
			end

			local var_130_18 = arg_127_1.actors_["1071ui_story"]
			local var_130_19 = 0

			if var_130_19 < arg_127_1.time_ and arg_127_1.time_ <= var_130_19 + arg_130_0 and arg_127_1.var_.characterEffect1071ui_story == nil then
				arg_127_1.var_.characterEffect1071ui_story = var_130_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_20 = 0.2

			if var_130_19 <= arg_127_1.time_ and arg_127_1.time_ < var_130_19 + var_130_20 then
				local var_130_21 = (arg_127_1.time_ - var_130_19) / var_130_20

				if arg_127_1.var_.characterEffect1071ui_story then
					arg_127_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_19 + var_130_20 and arg_127_1.time_ < var_130_19 + var_130_20 + arg_130_0 and arg_127_1.var_.characterEffect1071ui_story then
				arg_127_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_130_22 = arg_127_1.actors_["1075ui_story"]
			local var_130_23 = 0

			if var_130_23 < arg_127_1.time_ and arg_127_1.time_ <= var_130_23 + arg_130_0 and arg_127_1.var_.characterEffect1075ui_story == nil then
				arg_127_1.var_.characterEffect1075ui_story = var_130_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_24 = 0.2

			if var_130_23 <= arg_127_1.time_ and arg_127_1.time_ < var_130_23 + var_130_24 then
				local var_130_25 = (arg_127_1.time_ - var_130_23) / var_130_24

				if arg_127_1.var_.characterEffect1075ui_story then
					local var_130_26 = Mathf.Lerp(0, 0.5, var_130_25)

					arg_127_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1075ui_story.fillRatio = var_130_26
				end
			end

			if arg_127_1.time_ >= var_130_23 + var_130_24 and arg_127_1.time_ < var_130_23 + var_130_24 + arg_130_0 and arg_127_1.var_.characterEffect1075ui_story then
				local var_130_27 = 0.5

				arg_127_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1075ui_story.fillRatio = var_130_27
			end

			local var_130_28 = 0

			if var_130_28 < arg_127_1.time_ and arg_127_1.time_ <= var_130_28 + arg_130_0 then
				arg_127_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_130_29 = 0
			local var_130_30 = 0.35

			if var_130_29 < arg_127_1.time_ and arg_127_1.time_ <= var_130_29 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_31 = arg_127_1:FormatText(StoryNameCfg[384].name)

				arg_127_1.leftNameTxt_.text = var_130_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_32 = arg_127_1:GetWordFromCfg(120121031)
				local var_130_33 = arg_127_1:FormatText(var_130_32.content)

				arg_127_1.text_.text = var_130_33

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_34 = 14
				local var_130_35 = utf8.len(var_130_33)
				local var_130_36 = var_130_34 <= 0 and var_130_30 or var_130_30 * (var_130_35 / var_130_34)

				if var_130_36 > 0 and var_130_30 < var_130_36 then
					arg_127_1.talkMaxDuration = var_130_36

					if var_130_36 + var_130_29 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_36 + var_130_29
					end
				end

				arg_127_1.text_.text = var_130_33
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121031", "story_v_out_120121.awb") ~= 0 then
					local var_130_37 = manager.audio:GetVoiceLength("story_v_out_120121", "120121031", "story_v_out_120121.awb") / 1000

					if var_130_37 + var_130_29 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_37 + var_130_29
					end

					if var_130_32.prefab_name ~= "" and arg_127_1.actors_[var_130_32.prefab_name] ~= nil then
						local var_130_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_32.prefab_name].transform, "story_v_out_120121", "120121031", "story_v_out_120121.awb")

						arg_127_1:RecordAudio("120121031", var_130_38)
						arg_127_1:RecordAudio("120121031", var_130_38)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_120121", "120121031", "story_v_out_120121.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_120121", "120121031", "story_v_out_120121.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_39 = math.max(var_130_30, arg_127_1.talkMaxDuration)

			if var_130_29 <= arg_127_1.time_ and arg_127_1.time_ < var_130_29 + var_130_39 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_29) / var_130_39

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_29 + var_130_39 and arg_127_1.time_ < var_130_29 + var_130_39 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play120121032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 120121032
		arg_131_1.duration_ = 8.366

		local var_131_0 = {
			zh = 5.7,
			ja = 8.366
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
				arg_131_0:Play120121033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.675

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[384].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(120121032)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121032", "story_v_out_120121.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_120121", "120121032", "story_v_out_120121.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_120121", "120121032", "story_v_out_120121.awb")

						arg_131_1:RecordAudio("120121032", var_134_9)
						arg_131_1:RecordAudio("120121032", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_120121", "120121032", "story_v_out_120121.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_120121", "120121032", "story_v_out_120121.awb")
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
	Play120121033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 120121033
		arg_135_1.duration_ = 6.133

		local var_135_0 = {
			zh = 4.933,
			ja = 6.133
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
				arg_135_0:Play120121034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1071ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1071ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1071ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = arg_135_1.actors_["1075ui_story"].transform
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 then
				arg_135_1.var_.moveOldPos1075ui_story = var_138_9.localPosition
			end

			local var_138_11 = 0.001

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11
				local var_138_13 = Vector3.New(0.7, -1.055, -6.16)

				var_138_9.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1075ui_story, var_138_13, var_138_12)

				local var_138_14 = manager.ui.mainCamera.transform.position - var_138_9.position

				var_138_9.forward = Vector3.New(var_138_14.x, var_138_14.y, var_138_14.z)

				local var_138_15 = var_138_9.localEulerAngles

				var_138_15.z = 0
				var_138_15.x = 0
				var_138_9.localEulerAngles = var_138_15
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 then
				var_138_9.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_138_16 = manager.ui.mainCamera.transform.position - var_138_9.position

				var_138_9.forward = Vector3.New(var_138_16.x, var_138_16.y, var_138_16.z)

				local var_138_17 = var_138_9.localEulerAngles

				var_138_17.z = 0
				var_138_17.x = 0
				var_138_9.localEulerAngles = var_138_17
			end

			local var_138_18 = arg_135_1.actors_["1071ui_story"]
			local var_138_19 = 0

			if var_138_19 < arg_135_1.time_ and arg_135_1.time_ <= var_138_19 + arg_138_0 and arg_135_1.var_.characterEffect1071ui_story == nil then
				arg_135_1.var_.characterEffect1071ui_story = var_138_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_20 = 0.2

			if var_138_19 <= arg_135_1.time_ and arg_135_1.time_ < var_138_19 + var_138_20 then
				local var_138_21 = (arg_135_1.time_ - var_138_19) / var_138_20

				if arg_135_1.var_.characterEffect1071ui_story then
					local var_138_22 = Mathf.Lerp(0, 0.5, var_138_21)

					arg_135_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1071ui_story.fillRatio = var_138_22
				end
			end

			if arg_135_1.time_ >= var_138_19 + var_138_20 and arg_135_1.time_ < var_138_19 + var_138_20 + arg_138_0 and arg_135_1.var_.characterEffect1071ui_story then
				local var_138_23 = 0.5

				arg_135_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1071ui_story.fillRatio = var_138_23
			end

			local var_138_24 = arg_135_1.actors_["1075ui_story"]
			local var_138_25 = 0

			if var_138_25 < arg_135_1.time_ and arg_135_1.time_ <= var_138_25 + arg_138_0 and arg_135_1.var_.characterEffect1075ui_story == nil then
				arg_135_1.var_.characterEffect1075ui_story = var_138_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_26 = 0.2

			if var_138_25 <= arg_135_1.time_ and arg_135_1.time_ < var_138_25 + var_138_26 then
				local var_138_27 = (arg_135_1.time_ - var_138_25) / var_138_26

				if arg_135_1.var_.characterEffect1075ui_story then
					arg_135_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_25 + var_138_26 and arg_135_1.time_ < var_138_25 + var_138_26 + arg_138_0 and arg_135_1.var_.characterEffect1075ui_story then
				arg_135_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_138_28 = 0

			if var_138_28 < arg_135_1.time_ and arg_135_1.time_ <= var_138_28 + arg_138_0 then
				arg_135_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_138_29 = 0
			local var_138_30 = 0.625

			if var_138_29 < arg_135_1.time_ and arg_135_1.time_ <= var_138_29 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_31 = arg_135_1:FormatText(StoryNameCfg[381].name)

				arg_135_1.leftNameTxt_.text = var_138_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_32 = arg_135_1:GetWordFromCfg(120121033)
				local var_138_33 = arg_135_1:FormatText(var_138_32.content)

				arg_135_1.text_.text = var_138_33

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_34 = 25
				local var_138_35 = utf8.len(var_138_33)
				local var_138_36 = var_138_34 <= 0 and var_138_30 or var_138_30 * (var_138_35 / var_138_34)

				if var_138_36 > 0 and var_138_30 < var_138_36 then
					arg_135_1.talkMaxDuration = var_138_36

					if var_138_36 + var_138_29 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_36 + var_138_29
					end
				end

				arg_135_1.text_.text = var_138_33
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121033", "story_v_out_120121.awb") ~= 0 then
					local var_138_37 = manager.audio:GetVoiceLength("story_v_out_120121", "120121033", "story_v_out_120121.awb") / 1000

					if var_138_37 + var_138_29 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_37 + var_138_29
					end

					if var_138_32.prefab_name ~= "" and arg_135_1.actors_[var_138_32.prefab_name] ~= nil then
						local var_138_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_32.prefab_name].transform, "story_v_out_120121", "120121033", "story_v_out_120121.awb")

						arg_135_1:RecordAudio("120121033", var_138_38)
						arg_135_1:RecordAudio("120121033", var_138_38)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_120121", "120121033", "story_v_out_120121.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_120121", "120121033", "story_v_out_120121.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_39 = math.max(var_138_30, arg_135_1.talkMaxDuration)

			if var_138_29 <= arg_135_1.time_ and arg_135_1.time_ < var_138_29 + var_138_39 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_29) / var_138_39

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_29 + var_138_39 and arg_135_1.time_ < var_138_29 + var_138_39 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play120121034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 120121034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play120121035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1071ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1071ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(0, 100, 0)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1071ui_story, var_142_4, var_142_3)

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

			local var_142_9 = arg_139_1.actors_["1075ui_story"].transform
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 then
				arg_139_1.var_.moveOldPos1075ui_story = var_142_9.localPosition
			end

			local var_142_11 = 0.001

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11
				local var_142_13 = Vector3.New(0, 100, 0)

				var_142_9.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1075ui_story, var_142_13, var_142_12)

				local var_142_14 = manager.ui.mainCamera.transform.position - var_142_9.position

				var_142_9.forward = Vector3.New(var_142_14.x, var_142_14.y, var_142_14.z)

				local var_142_15 = var_142_9.localEulerAngles

				var_142_15.z = 0
				var_142_15.x = 0
				var_142_9.localEulerAngles = var_142_15
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 then
				var_142_9.localPosition = Vector3.New(0, 100, 0)

				local var_142_16 = manager.ui.mainCamera.transform.position - var_142_9.position

				var_142_9.forward = Vector3.New(var_142_16.x, var_142_16.y, var_142_16.z)

				local var_142_17 = var_142_9.localEulerAngles

				var_142_17.z = 0
				var_142_17.x = 0
				var_142_9.localEulerAngles = var_142_17
			end

			local var_142_18 = 0
			local var_142_19 = 1.25

			if var_142_18 < arg_139_1.time_ and arg_139_1.time_ <= var_142_18 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_20 = arg_139_1:GetWordFromCfg(120121034)
				local var_142_21 = arg_139_1:FormatText(var_142_20.content)

				arg_139_1.text_.text = var_142_21

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_22 = 50
				local var_142_23 = utf8.len(var_142_21)
				local var_142_24 = var_142_22 <= 0 and var_142_19 or var_142_19 * (var_142_23 / var_142_22)

				if var_142_24 > 0 and var_142_19 < var_142_24 then
					arg_139_1.talkMaxDuration = var_142_24

					if var_142_24 + var_142_18 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_24 + var_142_18
					end
				end

				arg_139_1.text_.text = var_142_21
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_25 = math.max(var_142_19, arg_139_1.talkMaxDuration)

			if var_142_18 <= arg_139_1.time_ and arg_139_1.time_ < var_142_18 + var_142_25 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_18) / var_142_25

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_18 + var_142_25 and arg_139_1.time_ < var_142_18 + var_142_25 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play120121035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 120121035
		arg_143_1.duration_ = 4.733

		local var_143_0 = {
			zh = 2.066,
			ja = 4.733
		}
		local var_143_1 = manager.audio:GetLocalizationFlag()

		if var_143_0[var_143_1] ~= nil then
			arg_143_1.duration_ = var_143_0[var_143_1]
		end

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play120121036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1071ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1071ui_story == nil then
				arg_143_1.var_.characterEffect1071ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.2

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1071ui_story then
					arg_143_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1071ui_story then
				arg_143_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_146_4 = arg_143_1.actors_["1075ui_story"]
			local var_146_5 = 0

			if var_146_5 < arg_143_1.time_ and arg_143_1.time_ <= var_146_5 + arg_146_0 and arg_143_1.var_.characterEffect1075ui_story == nil then
				arg_143_1.var_.characterEffect1075ui_story = var_146_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_6 = 0.2

			if var_146_5 <= arg_143_1.time_ and arg_143_1.time_ < var_146_5 + var_146_6 then
				local var_146_7 = (arg_143_1.time_ - var_146_5) / var_146_6

				if arg_143_1.var_.characterEffect1075ui_story then
					local var_146_8 = Mathf.Lerp(0, 0.5, var_146_7)

					arg_143_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1075ui_story.fillRatio = var_146_8
				end
			end

			if arg_143_1.time_ >= var_146_5 + var_146_6 and arg_143_1.time_ < var_146_5 + var_146_6 + arg_146_0 and arg_143_1.var_.characterEffect1075ui_story then
				local var_146_9 = 0.5

				arg_143_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1075ui_story.fillRatio = var_146_9
			end

			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_146_11 = arg_143_1.actors_["1071ui_story"].transform
			local var_146_12 = 0

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1.var_.moveOldPos1071ui_story = var_146_11.localPosition
			end

			local var_146_13 = 0.001

			if var_146_12 <= arg_143_1.time_ and arg_143_1.time_ < var_146_12 + var_146_13 then
				local var_146_14 = (arg_143_1.time_ - var_146_12) / var_146_13
				local var_146_15 = Vector3.New(-0.7, -1.05, -6.2)

				var_146_11.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1071ui_story, var_146_15, var_146_14)

				local var_146_16 = manager.ui.mainCamera.transform.position - var_146_11.position

				var_146_11.forward = Vector3.New(var_146_16.x, var_146_16.y, var_146_16.z)

				local var_146_17 = var_146_11.localEulerAngles

				var_146_17.z = 0
				var_146_17.x = 0
				var_146_11.localEulerAngles = var_146_17
			end

			if arg_143_1.time_ >= var_146_12 + var_146_13 and arg_143_1.time_ < var_146_12 + var_146_13 + arg_146_0 then
				var_146_11.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_146_18 = manager.ui.mainCamera.transform.position - var_146_11.position

				var_146_11.forward = Vector3.New(var_146_18.x, var_146_18.y, var_146_18.z)

				local var_146_19 = var_146_11.localEulerAngles

				var_146_19.z = 0
				var_146_19.x = 0
				var_146_11.localEulerAngles = var_146_19
			end

			local var_146_20 = arg_143_1.actors_["1075ui_story"].transform
			local var_146_21 = 0

			if var_146_21 < arg_143_1.time_ and arg_143_1.time_ <= var_146_21 + arg_146_0 then
				arg_143_1.var_.moveOldPos1075ui_story = var_146_20.localPosition
			end

			local var_146_22 = 0.001

			if var_146_21 <= arg_143_1.time_ and arg_143_1.time_ < var_146_21 + var_146_22 then
				local var_146_23 = (arg_143_1.time_ - var_146_21) / var_146_22
				local var_146_24 = Vector3.New(0.7, -1.055, -6.16)

				var_146_20.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1075ui_story, var_146_24, var_146_23)

				local var_146_25 = manager.ui.mainCamera.transform.position - var_146_20.position

				var_146_20.forward = Vector3.New(var_146_25.x, var_146_25.y, var_146_25.z)

				local var_146_26 = var_146_20.localEulerAngles

				var_146_26.z = 0
				var_146_26.x = 0
				var_146_20.localEulerAngles = var_146_26
			end

			if arg_143_1.time_ >= var_146_21 + var_146_22 and arg_143_1.time_ < var_146_21 + var_146_22 + arg_146_0 then
				var_146_20.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_146_27 = manager.ui.mainCamera.transform.position - var_146_20.position

				var_146_20.forward = Vector3.New(var_146_27.x, var_146_27.y, var_146_27.z)

				local var_146_28 = var_146_20.localEulerAngles

				var_146_28.z = 0
				var_146_28.x = 0
				var_146_20.localEulerAngles = var_146_28
			end

			local var_146_29 = 0
			local var_146_30 = 0.225

			if var_146_29 < arg_143_1.time_ and arg_143_1.time_ <= var_146_29 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_31 = arg_143_1:FormatText(StoryNameCfg[384].name)

				arg_143_1.leftNameTxt_.text = var_146_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_32 = arg_143_1:GetWordFromCfg(120121035)
				local var_146_33 = arg_143_1:FormatText(var_146_32.content)

				arg_143_1.text_.text = var_146_33

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_34 = 9
				local var_146_35 = utf8.len(var_146_33)
				local var_146_36 = var_146_34 <= 0 and var_146_30 or var_146_30 * (var_146_35 / var_146_34)

				if var_146_36 > 0 and var_146_30 < var_146_36 then
					arg_143_1.talkMaxDuration = var_146_36

					if var_146_36 + var_146_29 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_36 + var_146_29
					end
				end

				arg_143_1.text_.text = var_146_33
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121035", "story_v_out_120121.awb") ~= 0 then
					local var_146_37 = manager.audio:GetVoiceLength("story_v_out_120121", "120121035", "story_v_out_120121.awb") / 1000

					if var_146_37 + var_146_29 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_37 + var_146_29
					end

					if var_146_32.prefab_name ~= "" and arg_143_1.actors_[var_146_32.prefab_name] ~= nil then
						local var_146_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_32.prefab_name].transform, "story_v_out_120121", "120121035", "story_v_out_120121.awb")

						arg_143_1:RecordAudio("120121035", var_146_38)
						arg_143_1:RecordAudio("120121035", var_146_38)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_120121", "120121035", "story_v_out_120121.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_120121", "120121035", "story_v_out_120121.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_39 = math.max(var_146_30, arg_143_1.talkMaxDuration)

			if var_146_29 <= arg_143_1.time_ and arg_143_1.time_ < var_146_29 + var_146_39 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_29) / var_146_39

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_29 + var_146_39 and arg_143_1.time_ < var_146_29 + var_146_39 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play120121036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 120121036
		arg_147_1.duration_ = 7.4

		local var_147_0 = {
			zh = 7.4,
			ja = 6.8
		}
		local var_147_1 = manager.audio:GetLocalizationFlag()

		if var_147_0[var_147_1] ~= nil then
			arg_147_1.duration_ = var_147_0[var_147_1]
		end

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play120121037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1071ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1071ui_story == nil then
				arg_147_1.var_.characterEffect1071ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.2

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1071ui_story then
					local var_150_4 = Mathf.Lerp(0, 0.5, var_150_3)

					arg_147_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1071ui_story.fillRatio = var_150_4
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1071ui_story then
				local var_150_5 = 0.5

				arg_147_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1071ui_story.fillRatio = var_150_5
			end

			local var_150_6 = arg_147_1.actors_["1075ui_story"]
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 and arg_147_1.var_.characterEffect1075ui_story == nil then
				arg_147_1.var_.characterEffect1075ui_story = var_150_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_8 = 0.2

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_8 then
				local var_150_9 = (arg_147_1.time_ - var_150_7) / var_150_8

				if arg_147_1.var_.characterEffect1075ui_story then
					arg_147_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_7 + var_150_8 and arg_147_1.time_ < var_150_7 + var_150_8 + arg_150_0 and arg_147_1.var_.characterEffect1075ui_story then
				arg_147_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 then
				arg_147_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_150_11 = 0

			if var_150_11 < arg_147_1.time_ and arg_147_1.time_ <= var_150_11 + arg_150_0 then
				arg_147_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_150_12 = 0
			local var_150_13 = 1

			if var_150_12 < arg_147_1.time_ and arg_147_1.time_ <= var_150_12 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_14 = arg_147_1:FormatText(StoryNameCfg[381].name)

				arg_147_1.leftNameTxt_.text = var_150_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_15 = arg_147_1:GetWordFromCfg(120121036)
				local var_150_16 = arg_147_1:FormatText(var_150_15.content)

				arg_147_1.text_.text = var_150_16

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_17 = 42
				local var_150_18 = utf8.len(var_150_16)
				local var_150_19 = var_150_17 <= 0 and var_150_13 or var_150_13 * (var_150_18 / var_150_17)

				if var_150_19 > 0 and var_150_13 < var_150_19 then
					arg_147_1.talkMaxDuration = var_150_19

					if var_150_19 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_19 + var_150_12
					end
				end

				arg_147_1.text_.text = var_150_16
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121036", "story_v_out_120121.awb") ~= 0 then
					local var_150_20 = manager.audio:GetVoiceLength("story_v_out_120121", "120121036", "story_v_out_120121.awb") / 1000

					if var_150_20 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_20 + var_150_12
					end

					if var_150_15.prefab_name ~= "" and arg_147_1.actors_[var_150_15.prefab_name] ~= nil then
						local var_150_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_15.prefab_name].transform, "story_v_out_120121", "120121036", "story_v_out_120121.awb")

						arg_147_1:RecordAudio("120121036", var_150_21)
						arg_147_1:RecordAudio("120121036", var_150_21)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_120121", "120121036", "story_v_out_120121.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_120121", "120121036", "story_v_out_120121.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_22 = math.max(var_150_13, arg_147_1.talkMaxDuration)

			if var_150_12 <= arg_147_1.time_ and arg_147_1.time_ < var_150_12 + var_150_22 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_12) / var_150_22

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_12 + var_150_22 and arg_147_1.time_ < var_150_12 + var_150_22 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play120121037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 120121037
		arg_151_1.duration_ = 5.766

		local var_151_0 = {
			zh = 4.066,
			ja = 5.766
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
				arg_151_0:Play120121038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1071ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1071ui_story == nil then
				arg_151_1.var_.characterEffect1071ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.2

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1071ui_story then
					arg_151_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1071ui_story then
				arg_151_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_154_4 = arg_151_1.actors_["1075ui_story"]
			local var_154_5 = 0

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 and arg_151_1.var_.characterEffect1075ui_story == nil then
				arg_151_1.var_.characterEffect1075ui_story = var_154_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_6 = 0.2

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6

				if arg_151_1.var_.characterEffect1075ui_story then
					local var_154_8 = Mathf.Lerp(0, 0.5, var_154_7)

					arg_151_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1075ui_story.fillRatio = var_154_8
				end
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1075ui_story then
				local var_154_9 = 0.5

				arg_151_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1075ui_story.fillRatio = var_154_9
			end

			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 then
				arg_151_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_154_11 = 0

			if var_154_11 < arg_151_1.time_ and arg_151_1.time_ <= var_154_11 + arg_154_0 then
				arg_151_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_2")
			end

			local var_154_12 = 0
			local var_154_13 = 0.45

			if var_154_12 < arg_151_1.time_ and arg_151_1.time_ <= var_154_12 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_14 = arg_151_1:FormatText(StoryNameCfg[384].name)

				arg_151_1.leftNameTxt_.text = var_154_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_15 = arg_151_1:GetWordFromCfg(120121037)
				local var_154_16 = arg_151_1:FormatText(var_154_15.content)

				arg_151_1.text_.text = var_154_16

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_17 = 18
				local var_154_18 = utf8.len(var_154_16)
				local var_154_19 = var_154_17 <= 0 and var_154_13 or var_154_13 * (var_154_18 / var_154_17)

				if var_154_19 > 0 and var_154_13 < var_154_19 then
					arg_151_1.talkMaxDuration = var_154_19

					if var_154_19 + var_154_12 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_19 + var_154_12
					end
				end

				arg_151_1.text_.text = var_154_16
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121037", "story_v_out_120121.awb") ~= 0 then
					local var_154_20 = manager.audio:GetVoiceLength("story_v_out_120121", "120121037", "story_v_out_120121.awb") / 1000

					if var_154_20 + var_154_12 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_20 + var_154_12
					end

					if var_154_15.prefab_name ~= "" and arg_151_1.actors_[var_154_15.prefab_name] ~= nil then
						local var_154_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_15.prefab_name].transform, "story_v_out_120121", "120121037", "story_v_out_120121.awb")

						arg_151_1:RecordAudio("120121037", var_154_21)
						arg_151_1:RecordAudio("120121037", var_154_21)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_120121", "120121037", "story_v_out_120121.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_120121", "120121037", "story_v_out_120121.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_22 = math.max(var_154_13, arg_151_1.talkMaxDuration)

			if var_154_12 <= arg_151_1.time_ and arg_151_1.time_ < var_154_12 + var_154_22 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_12) / var_154_22

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_12 + var_154_22 and arg_151_1.time_ < var_154_12 + var_154_22 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play120121038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 120121038
		arg_155_1.duration_ = 4.6

		local var_155_0 = {
			zh = 4.6,
			ja = 3
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
				arg_155_0:Play120121039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action435")
			end

			local var_158_1 = 0
			local var_158_2 = 0.5

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_3 = arg_155_1:FormatText(StoryNameCfg[384].name)

				arg_155_1.leftNameTxt_.text = var_158_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_4 = arg_155_1:GetWordFromCfg(120121038)
				local var_158_5 = arg_155_1:FormatText(var_158_4.content)

				arg_155_1.text_.text = var_158_5

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_6 = 20
				local var_158_7 = utf8.len(var_158_5)
				local var_158_8 = var_158_6 <= 0 and var_158_2 or var_158_2 * (var_158_7 / var_158_6)

				if var_158_8 > 0 and var_158_2 < var_158_8 then
					arg_155_1.talkMaxDuration = var_158_8

					if var_158_8 + var_158_1 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_1
					end
				end

				arg_155_1.text_.text = var_158_5
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121038", "story_v_out_120121.awb") ~= 0 then
					local var_158_9 = manager.audio:GetVoiceLength("story_v_out_120121", "120121038", "story_v_out_120121.awb") / 1000

					if var_158_9 + var_158_1 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_9 + var_158_1
					end

					if var_158_4.prefab_name ~= "" and arg_155_1.actors_[var_158_4.prefab_name] ~= nil then
						local var_158_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_4.prefab_name].transform, "story_v_out_120121", "120121038", "story_v_out_120121.awb")

						arg_155_1:RecordAudio("120121038", var_158_10)
						arg_155_1:RecordAudio("120121038", var_158_10)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_120121", "120121038", "story_v_out_120121.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_120121", "120121038", "story_v_out_120121.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_11 = math.max(var_158_2, arg_155_1.talkMaxDuration)

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_11 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_1) / var_158_11

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_1 + var_158_11 and arg_155_1.time_ < var_158_1 + var_158_11 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play120121039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 120121039
		arg_159_1.duration_ = 5.5

		local var_159_0 = {
			zh = 5.5,
			ja = 4.766
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
				arg_159_0:Play120121040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_162_1 = 0
			local var_162_2 = 0.425

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_3 = arg_159_1:FormatText(StoryNameCfg[384].name)

				arg_159_1.leftNameTxt_.text = var_162_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_4 = arg_159_1:GetWordFromCfg(120121039)
				local var_162_5 = arg_159_1:FormatText(var_162_4.content)

				arg_159_1.text_.text = var_162_5

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_6 = 17
				local var_162_7 = utf8.len(var_162_5)
				local var_162_8 = var_162_6 <= 0 and var_162_2 or var_162_2 * (var_162_7 / var_162_6)

				if var_162_8 > 0 and var_162_2 < var_162_8 then
					arg_159_1.talkMaxDuration = var_162_8

					if var_162_8 + var_162_1 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_1
					end
				end

				arg_159_1.text_.text = var_162_5
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121039", "story_v_out_120121.awb") ~= 0 then
					local var_162_9 = manager.audio:GetVoiceLength("story_v_out_120121", "120121039", "story_v_out_120121.awb") / 1000

					if var_162_9 + var_162_1 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_9 + var_162_1
					end

					if var_162_4.prefab_name ~= "" and arg_159_1.actors_[var_162_4.prefab_name] ~= nil then
						local var_162_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_4.prefab_name].transform, "story_v_out_120121", "120121039", "story_v_out_120121.awb")

						arg_159_1:RecordAudio("120121039", var_162_10)
						arg_159_1:RecordAudio("120121039", var_162_10)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_120121", "120121039", "story_v_out_120121.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_120121", "120121039", "story_v_out_120121.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_11 = math.max(var_162_2, arg_159_1.talkMaxDuration)

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_11 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_1) / var_162_11

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_1 + var_162_11 and arg_159_1.time_ < var_162_1 + var_162_11 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play120121040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 120121040
		arg_163_1.duration_ = 4.766

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play120121041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1071ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1071ui_story == nil then
				arg_163_1.var_.characterEffect1071ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.2

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1071ui_story then
					local var_166_4 = Mathf.Lerp(0, 0.5, var_166_3)

					arg_163_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1071ui_story.fillRatio = var_166_4
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1071ui_story then
				local var_166_5 = 0.5

				arg_163_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1071ui_story.fillRatio = var_166_5
			end

			local var_166_6 = arg_163_1.actors_["1075ui_story"]
			local var_166_7 = 0

			if var_166_7 < arg_163_1.time_ and arg_163_1.time_ <= var_166_7 + arg_166_0 and arg_163_1.var_.characterEffect1075ui_story == nil then
				arg_163_1.var_.characterEffect1075ui_story = var_166_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_8 = 0.2

			if var_166_7 <= arg_163_1.time_ and arg_163_1.time_ < var_166_7 + var_166_8 then
				local var_166_9 = (arg_163_1.time_ - var_166_7) / var_166_8

				if arg_163_1.var_.characterEffect1075ui_story then
					arg_163_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_7 + var_166_8 and arg_163_1.time_ < var_166_7 + var_166_8 + arg_166_0 and arg_163_1.var_.characterEffect1075ui_story then
				arg_163_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_166_11 = 0
			local var_166_12 = 0.575

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_13 = arg_163_1:FormatText(StoryNameCfg[381].name)

				arg_163_1.leftNameTxt_.text = var_166_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_14 = arg_163_1:GetWordFromCfg(120121040)
				local var_166_15 = arg_163_1:FormatText(var_166_14.content)

				arg_163_1.text_.text = var_166_15

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_16 = 23
				local var_166_17 = utf8.len(var_166_15)
				local var_166_18 = var_166_16 <= 0 and var_166_12 or var_166_12 * (var_166_17 / var_166_16)

				if var_166_18 > 0 and var_166_12 < var_166_18 then
					arg_163_1.talkMaxDuration = var_166_18

					if var_166_18 + var_166_11 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_18 + var_166_11
					end
				end

				arg_163_1.text_.text = var_166_15
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121040", "story_v_out_120121.awb") ~= 0 then
					local var_166_19 = manager.audio:GetVoiceLength("story_v_out_120121", "120121040", "story_v_out_120121.awb") / 1000

					if var_166_19 + var_166_11 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_19 + var_166_11
					end

					if var_166_14.prefab_name ~= "" and arg_163_1.actors_[var_166_14.prefab_name] ~= nil then
						local var_166_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_14.prefab_name].transform, "story_v_out_120121", "120121040", "story_v_out_120121.awb")

						arg_163_1:RecordAudio("120121040", var_166_20)
						arg_163_1:RecordAudio("120121040", var_166_20)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_120121", "120121040", "story_v_out_120121.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_120121", "120121040", "story_v_out_120121.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_21 = math.max(var_166_12, arg_163_1.talkMaxDuration)

			if var_166_11 <= arg_163_1.time_ and arg_163_1.time_ < var_166_11 + var_166_21 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_11) / var_166_21

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_11 + var_166_21 and arg_163_1.time_ < var_166_11 + var_166_21 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play120121041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 120121041
		arg_167_1.duration_ = 3.4

		local var_167_0 = {
			zh = 3.1,
			ja = 3.4
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
				arg_167_0:Play120121042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1071ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1071ui_story == nil then
				arg_167_1.var_.characterEffect1071ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.2

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1071ui_story then
					arg_167_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1071ui_story then
				arg_167_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_170_4 = arg_167_1.actors_["1075ui_story"]
			local var_170_5 = 0

			if var_170_5 < arg_167_1.time_ and arg_167_1.time_ <= var_170_5 + arg_170_0 and arg_167_1.var_.characterEffect1075ui_story == nil then
				arg_167_1.var_.characterEffect1075ui_story = var_170_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_6 = 0.2

			if var_170_5 <= arg_167_1.time_ and arg_167_1.time_ < var_170_5 + var_170_6 then
				local var_170_7 = (arg_167_1.time_ - var_170_5) / var_170_6

				if arg_167_1.var_.characterEffect1075ui_story then
					local var_170_8 = Mathf.Lerp(0, 0.5, var_170_7)

					arg_167_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1075ui_story.fillRatio = var_170_8
				end
			end

			if arg_167_1.time_ >= var_170_5 + var_170_6 and arg_167_1.time_ < var_170_5 + var_170_6 + arg_170_0 and arg_167_1.var_.characterEffect1075ui_story then
				local var_170_9 = 0.5

				arg_167_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1075ui_story.fillRatio = var_170_9
			end

			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action6_1")
			end

			local var_170_11 = 0
			local var_170_12 = 0.275

			if var_170_11 < arg_167_1.time_ and arg_167_1.time_ <= var_170_11 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_13 = arg_167_1:FormatText(StoryNameCfg[384].name)

				arg_167_1.leftNameTxt_.text = var_170_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_14 = arg_167_1:GetWordFromCfg(120121041)
				local var_170_15 = arg_167_1:FormatText(var_170_14.content)

				arg_167_1.text_.text = var_170_15

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_16 = 11
				local var_170_17 = utf8.len(var_170_15)
				local var_170_18 = var_170_16 <= 0 and var_170_12 or var_170_12 * (var_170_17 / var_170_16)

				if var_170_18 > 0 and var_170_12 < var_170_18 then
					arg_167_1.talkMaxDuration = var_170_18

					if var_170_18 + var_170_11 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_18 + var_170_11
					end
				end

				arg_167_1.text_.text = var_170_15
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121041", "story_v_out_120121.awb") ~= 0 then
					local var_170_19 = manager.audio:GetVoiceLength("story_v_out_120121", "120121041", "story_v_out_120121.awb") / 1000

					if var_170_19 + var_170_11 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_19 + var_170_11
					end

					if var_170_14.prefab_name ~= "" and arg_167_1.actors_[var_170_14.prefab_name] ~= nil then
						local var_170_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_14.prefab_name].transform, "story_v_out_120121", "120121041", "story_v_out_120121.awb")

						arg_167_1:RecordAudio("120121041", var_170_20)
						arg_167_1:RecordAudio("120121041", var_170_20)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_120121", "120121041", "story_v_out_120121.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_120121", "120121041", "story_v_out_120121.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_21 = math.max(var_170_12, arg_167_1.talkMaxDuration)

			if var_170_11 <= arg_167_1.time_ and arg_167_1.time_ < var_170_11 + var_170_21 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_11) / var_170_21

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_11 + var_170_21 and arg_167_1.time_ < var_170_11 + var_170_21 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play120121042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 120121042
		arg_171_1.duration_ = 9.566

		local var_171_0 = {
			zh = 5.1,
			ja = 9.566
		}
		local var_171_1 = manager.audio:GetLocalizationFlag()

		if var_171_0[var_171_1] ~= nil then
			arg_171_1.duration_ = var_171_0[var_171_1]
		end

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play120121043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1071ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect1071ui_story == nil then
				arg_171_1.var_.characterEffect1071ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.2

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect1071ui_story then
					local var_174_4 = Mathf.Lerp(0, 0.5, var_174_3)

					arg_171_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1071ui_story.fillRatio = var_174_4
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect1071ui_story then
				local var_174_5 = 0.5

				arg_171_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1071ui_story.fillRatio = var_174_5
			end

			local var_174_6 = arg_171_1.actors_["1075ui_story"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 and arg_171_1.var_.characterEffect1075ui_story == nil then
				arg_171_1.var_.characterEffect1075ui_story = var_174_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_8 = 0.2

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_8 then
				local var_174_9 = (arg_171_1.time_ - var_174_7) / var_174_8

				if arg_171_1.var_.characterEffect1075ui_story then
					arg_171_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_8 and arg_171_1.time_ < var_174_7 + var_174_8 + arg_174_0 and arg_171_1.var_.characterEffect1075ui_story then
				arg_171_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 then
				arg_171_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_174_11 = 0

			if var_174_11 < arg_171_1.time_ and arg_171_1.time_ <= var_174_11 + arg_174_0 then
				arg_171_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_174_12 = 0
			local var_174_13 = 0.525

			if var_174_12 < arg_171_1.time_ and arg_171_1.time_ <= var_174_12 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_14 = arg_171_1:FormatText(StoryNameCfg[381].name)

				arg_171_1.leftNameTxt_.text = var_174_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_15 = arg_171_1:GetWordFromCfg(120121042)
				local var_174_16 = arg_171_1:FormatText(var_174_15.content)

				arg_171_1.text_.text = var_174_16

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_17 = 21
				local var_174_18 = utf8.len(var_174_16)
				local var_174_19 = var_174_17 <= 0 and var_174_13 or var_174_13 * (var_174_18 / var_174_17)

				if var_174_19 > 0 and var_174_13 < var_174_19 then
					arg_171_1.talkMaxDuration = var_174_19

					if var_174_19 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_19 + var_174_12
					end
				end

				arg_171_1.text_.text = var_174_16
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121042", "story_v_out_120121.awb") ~= 0 then
					local var_174_20 = manager.audio:GetVoiceLength("story_v_out_120121", "120121042", "story_v_out_120121.awb") / 1000

					if var_174_20 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_20 + var_174_12
					end

					if var_174_15.prefab_name ~= "" and arg_171_1.actors_[var_174_15.prefab_name] ~= nil then
						local var_174_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_15.prefab_name].transform, "story_v_out_120121", "120121042", "story_v_out_120121.awb")

						arg_171_1:RecordAudio("120121042", var_174_21)
						arg_171_1:RecordAudio("120121042", var_174_21)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_120121", "120121042", "story_v_out_120121.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_120121", "120121042", "story_v_out_120121.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_22 = math.max(var_174_13, arg_171_1.talkMaxDuration)

			if var_174_12 <= arg_171_1.time_ and arg_171_1.time_ < var_174_12 + var_174_22 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_12) / var_174_22

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_12 + var_174_22 and arg_171_1.time_ < var_174_12 + var_174_22 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play120121043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 120121043
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play120121044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1071ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1071ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, 100, 0)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1071ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, 100, 0)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["1075ui_story"].transform
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 then
				arg_175_1.var_.moveOldPos1075ui_story = var_178_9.localPosition
			end

			local var_178_11 = 0.001

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11
				local var_178_13 = Vector3.New(0, 100, 0)

				var_178_9.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1075ui_story, var_178_13, var_178_12)

				local var_178_14 = manager.ui.mainCamera.transform.position - var_178_9.position

				var_178_9.forward = Vector3.New(var_178_14.x, var_178_14.y, var_178_14.z)

				local var_178_15 = var_178_9.localEulerAngles

				var_178_15.z = 0
				var_178_15.x = 0
				var_178_9.localEulerAngles = var_178_15
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 then
				var_178_9.localPosition = Vector3.New(0, 100, 0)

				local var_178_16 = manager.ui.mainCamera.transform.position - var_178_9.position

				var_178_9.forward = Vector3.New(var_178_16.x, var_178_16.y, var_178_16.z)

				local var_178_17 = var_178_9.localEulerAngles

				var_178_17.z = 0
				var_178_17.x = 0
				var_178_9.localEulerAngles = var_178_17
			end

			local var_178_18 = 0
			local var_178_19 = 0.55

			if var_178_18 < arg_175_1.time_ and arg_175_1.time_ <= var_178_18 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_20 = arg_175_1:GetWordFromCfg(120121043)
				local var_178_21 = arg_175_1:FormatText(var_178_20.content)

				arg_175_1.text_.text = var_178_21

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_22 = 22
				local var_178_23 = utf8.len(var_178_21)
				local var_178_24 = var_178_22 <= 0 and var_178_19 or var_178_19 * (var_178_23 / var_178_22)

				if var_178_24 > 0 and var_178_19 < var_178_24 then
					arg_175_1.talkMaxDuration = var_178_24

					if var_178_24 + var_178_18 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_24 + var_178_18
					end
				end

				arg_175_1.text_.text = var_178_21
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_25 = math.max(var_178_19, arg_175_1.talkMaxDuration)

			if var_178_18 <= arg_175_1.time_ and arg_175_1.time_ < var_178_18 + var_178_25 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_18) / var_178_25

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_18 + var_178_25 and arg_175_1.time_ < var_178_18 + var_178_25 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play120121044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120121044
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play120121045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.925

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_2 = arg_179_1:GetWordFromCfg(120121044)
				local var_182_3 = arg_179_1:FormatText(var_182_2.content)

				arg_179_1.text_.text = var_182_3

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_4 = 37
				local var_182_5 = utf8.len(var_182_3)
				local var_182_6 = var_182_4 <= 0 and var_182_1 or var_182_1 * (var_182_5 / var_182_4)

				if var_182_6 > 0 and var_182_1 < var_182_6 then
					arg_179_1.talkMaxDuration = var_182_6

					if var_182_6 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_6 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_3
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_7 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_7 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_7

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_7 and arg_179_1.time_ < var_182_0 + var_182_7 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play120121045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120121045
		arg_183_1.duration_ = 10.566

		local var_183_0 = {
			zh = 5.666,
			ja = 10.566
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
				arg_183_0:Play120121046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1071ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1071ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1071ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = arg_183_1.actors_["1075ui_story"].transform
			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 then
				arg_183_1.var_.moveOldPos1075ui_story = var_186_9.localPosition
			end

			local var_186_11 = 0.001

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_11 then
				local var_186_12 = (arg_183_1.time_ - var_186_10) / var_186_11
				local var_186_13 = Vector3.New(0.7, -1.055, -6.16)

				var_186_9.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1075ui_story, var_186_13, var_186_12)

				local var_186_14 = manager.ui.mainCamera.transform.position - var_186_9.position

				var_186_9.forward = Vector3.New(var_186_14.x, var_186_14.y, var_186_14.z)

				local var_186_15 = var_186_9.localEulerAngles

				var_186_15.z = 0
				var_186_15.x = 0
				var_186_9.localEulerAngles = var_186_15
			end

			if arg_183_1.time_ >= var_186_10 + var_186_11 and arg_183_1.time_ < var_186_10 + var_186_11 + arg_186_0 then
				var_186_9.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_186_16 = manager.ui.mainCamera.transform.position - var_186_9.position

				var_186_9.forward = Vector3.New(var_186_16.x, var_186_16.y, var_186_16.z)

				local var_186_17 = var_186_9.localEulerAngles

				var_186_17.z = 0
				var_186_17.x = 0
				var_186_9.localEulerAngles = var_186_17
			end

			local var_186_18 = arg_183_1.actors_["1071ui_story"]
			local var_186_19 = 0

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 and arg_183_1.var_.characterEffect1071ui_story == nil then
				arg_183_1.var_.characterEffect1071ui_story = var_186_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_20 = 0.2

			if var_186_19 <= arg_183_1.time_ and arg_183_1.time_ < var_186_19 + var_186_20 then
				local var_186_21 = (arg_183_1.time_ - var_186_19) / var_186_20

				if arg_183_1.var_.characterEffect1071ui_story then
					arg_183_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_19 + var_186_20 and arg_183_1.time_ < var_186_19 + var_186_20 + arg_186_0 and arg_183_1.var_.characterEffect1071ui_story then
				arg_183_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_186_22 = arg_183_1.actors_["1075ui_story"]
			local var_186_23 = 0

			if var_186_23 < arg_183_1.time_ and arg_183_1.time_ <= var_186_23 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story == nil then
				arg_183_1.var_.characterEffect1075ui_story = var_186_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_24 = 0.034

			if var_186_23 <= arg_183_1.time_ and arg_183_1.time_ < var_186_23 + var_186_24 then
				local var_186_25 = (arg_183_1.time_ - var_186_23) / var_186_24

				if arg_183_1.var_.characterEffect1075ui_story then
					arg_183_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_23 + var_186_24 and arg_183_1.time_ < var_186_23 + var_186_24 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story then
				arg_183_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_186_26 = 0

			if var_186_26 < arg_183_1.time_ and arg_183_1.time_ <= var_186_26 + arg_186_0 then
				arg_183_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_186_27 = arg_183_1.actors_["1075ui_story"]
			local var_186_28 = 0

			if var_186_28 < arg_183_1.time_ and arg_183_1.time_ <= var_186_28 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story == nil then
				arg_183_1.var_.characterEffect1075ui_story = var_186_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_29 = 0.034

			if var_186_28 <= arg_183_1.time_ and arg_183_1.time_ < var_186_28 + var_186_29 then
				local var_186_30 = (arg_183_1.time_ - var_186_28) / var_186_29

				if arg_183_1.var_.characterEffect1075ui_story then
					local var_186_31 = Mathf.Lerp(0, 0.5, var_186_30)

					arg_183_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1075ui_story.fillRatio = var_186_31
				end
			end

			if arg_183_1.time_ >= var_186_28 + var_186_29 and arg_183_1.time_ < var_186_28 + var_186_29 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story then
				local var_186_32 = 0.5

				arg_183_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1075ui_story.fillRatio = var_186_32
			end

			local var_186_33 = 0
			local var_186_34 = 0.675

			if var_186_33 < arg_183_1.time_ and arg_183_1.time_ <= var_186_33 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_35 = arg_183_1:FormatText(StoryNameCfg[384].name)

				arg_183_1.leftNameTxt_.text = var_186_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_36 = arg_183_1:GetWordFromCfg(120121045)
				local var_186_37 = arg_183_1:FormatText(var_186_36.content)

				arg_183_1.text_.text = var_186_37

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_38 = 27
				local var_186_39 = utf8.len(var_186_37)
				local var_186_40 = var_186_38 <= 0 and var_186_34 or var_186_34 * (var_186_39 / var_186_38)

				if var_186_40 > 0 and var_186_34 < var_186_40 then
					arg_183_1.talkMaxDuration = var_186_40

					if var_186_40 + var_186_33 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_40 + var_186_33
					end
				end

				arg_183_1.text_.text = var_186_37
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121045", "story_v_out_120121.awb") ~= 0 then
					local var_186_41 = manager.audio:GetVoiceLength("story_v_out_120121", "120121045", "story_v_out_120121.awb") / 1000

					if var_186_41 + var_186_33 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_41 + var_186_33
					end

					if var_186_36.prefab_name ~= "" and arg_183_1.actors_[var_186_36.prefab_name] ~= nil then
						local var_186_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_36.prefab_name].transform, "story_v_out_120121", "120121045", "story_v_out_120121.awb")

						arg_183_1:RecordAudio("120121045", var_186_42)
						arg_183_1:RecordAudio("120121045", var_186_42)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_120121", "120121045", "story_v_out_120121.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_120121", "120121045", "story_v_out_120121.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_43 = math.max(var_186_34, arg_183_1.talkMaxDuration)

			if var_186_33 <= arg_183_1.time_ and arg_183_1.time_ < var_186_33 + var_186_43 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_33) / var_186_43

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_33 + var_186_43 and arg_183_1.time_ < var_186_33 + var_186_43 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play120121046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120121046
		arg_187_1.duration_ = 5.233

		local var_187_0 = {
			zh = 1.999999999999,
			ja = 5.233
		}
		local var_187_1 = manager.audio:GetLocalizationFlag()

		if var_187_0[var_187_1] ~= nil then
			arg_187_1.duration_ = var_187_0[var_187_1]
		end

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play120121047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1071ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1071ui_story == nil then
				arg_187_1.var_.characterEffect1071ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.2

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1071ui_story then
					local var_190_4 = Mathf.Lerp(0, 0.5, var_190_3)

					arg_187_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1071ui_story.fillRatio = var_190_4
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1071ui_story then
				local var_190_5 = 0.5

				arg_187_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1071ui_story.fillRatio = var_190_5
			end

			local var_190_6 = arg_187_1.actors_["1075ui_story"]
			local var_190_7 = 0

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story == nil then
				arg_187_1.var_.characterEffect1075ui_story = var_190_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_8 = 0.2

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_7) / var_190_8

				if arg_187_1.var_.characterEffect1075ui_story then
					arg_187_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_7 + var_190_8 and arg_187_1.time_ < var_190_7 + var_190_8 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story then
				arg_187_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 then
				arg_187_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_190_11 = 0
			local var_190_12 = 0.225

			if var_190_11 < arg_187_1.time_ and arg_187_1.time_ <= var_190_11 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_13 = arg_187_1:FormatText(StoryNameCfg[381].name)

				arg_187_1.leftNameTxt_.text = var_190_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_14 = arg_187_1:GetWordFromCfg(120121046)
				local var_190_15 = arg_187_1:FormatText(var_190_14.content)

				arg_187_1.text_.text = var_190_15

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_16 = 9
				local var_190_17 = utf8.len(var_190_15)
				local var_190_18 = var_190_16 <= 0 and var_190_12 or var_190_12 * (var_190_17 / var_190_16)

				if var_190_18 > 0 and var_190_12 < var_190_18 then
					arg_187_1.talkMaxDuration = var_190_18

					if var_190_18 + var_190_11 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_18 + var_190_11
					end
				end

				arg_187_1.text_.text = var_190_15
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121046", "story_v_out_120121.awb") ~= 0 then
					local var_190_19 = manager.audio:GetVoiceLength("story_v_out_120121", "120121046", "story_v_out_120121.awb") / 1000

					if var_190_19 + var_190_11 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_19 + var_190_11
					end

					if var_190_14.prefab_name ~= "" and arg_187_1.actors_[var_190_14.prefab_name] ~= nil then
						local var_190_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_14.prefab_name].transform, "story_v_out_120121", "120121046", "story_v_out_120121.awb")

						arg_187_1:RecordAudio("120121046", var_190_20)
						arg_187_1:RecordAudio("120121046", var_190_20)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_120121", "120121046", "story_v_out_120121.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_120121", "120121046", "story_v_out_120121.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_21 = math.max(var_190_12, arg_187_1.talkMaxDuration)

			if var_190_11 <= arg_187_1.time_ and arg_187_1.time_ < var_190_11 + var_190_21 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_11) / var_190_21

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_11 + var_190_21 and arg_187_1.time_ < var_190_11 + var_190_21 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play120121047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120121047
		arg_191_1.duration_ = 5.133

		local var_191_0 = {
			zh = 4.033,
			ja = 5.133
		}
		local var_191_1 = manager.audio:GetLocalizationFlag()

		if var_191_0[var_191_1] ~= nil then
			arg_191_1.duration_ = var_191_0[var_191_1]
		end

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play120121048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1071ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1071ui_story == nil then
				arg_191_1.var_.characterEffect1071ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.2

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1071ui_story then
					arg_191_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1071ui_story then
				arg_191_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_194_4 = arg_191_1.actors_["1075ui_story"]
			local var_194_5 = 0

			if var_194_5 < arg_191_1.time_ and arg_191_1.time_ <= var_194_5 + arg_194_0 and arg_191_1.var_.characterEffect1075ui_story == nil then
				arg_191_1.var_.characterEffect1075ui_story = var_194_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_6 = 0.2

			if var_194_5 <= arg_191_1.time_ and arg_191_1.time_ < var_194_5 + var_194_6 then
				local var_194_7 = (arg_191_1.time_ - var_194_5) / var_194_6

				if arg_191_1.var_.characterEffect1075ui_story then
					local var_194_8 = Mathf.Lerp(0, 0.5, var_194_7)

					arg_191_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1075ui_story.fillRatio = var_194_8
				end
			end

			if arg_191_1.time_ >= var_194_5 + var_194_6 and arg_191_1.time_ < var_194_5 + var_194_6 + arg_194_0 and arg_191_1.var_.characterEffect1075ui_story then
				local var_194_9 = 0.5

				arg_191_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1075ui_story.fillRatio = var_194_9
			end

			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 then
				arg_191_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_194_11 = 0
			local var_194_12 = 0.4

			if var_194_11 < arg_191_1.time_ and arg_191_1.time_ <= var_194_11 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_13 = arg_191_1:FormatText(StoryNameCfg[384].name)

				arg_191_1.leftNameTxt_.text = var_194_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_14 = arg_191_1:GetWordFromCfg(120121047)
				local var_194_15 = arg_191_1:FormatText(var_194_14.content)

				arg_191_1.text_.text = var_194_15

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_16 = 16
				local var_194_17 = utf8.len(var_194_15)
				local var_194_18 = var_194_16 <= 0 and var_194_12 or var_194_12 * (var_194_17 / var_194_16)

				if var_194_18 > 0 and var_194_12 < var_194_18 then
					arg_191_1.talkMaxDuration = var_194_18

					if var_194_18 + var_194_11 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_18 + var_194_11
					end
				end

				arg_191_1.text_.text = var_194_15
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121047", "story_v_out_120121.awb") ~= 0 then
					local var_194_19 = manager.audio:GetVoiceLength("story_v_out_120121", "120121047", "story_v_out_120121.awb") / 1000

					if var_194_19 + var_194_11 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_19 + var_194_11
					end

					if var_194_14.prefab_name ~= "" and arg_191_1.actors_[var_194_14.prefab_name] ~= nil then
						local var_194_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_14.prefab_name].transform, "story_v_out_120121", "120121047", "story_v_out_120121.awb")

						arg_191_1:RecordAudio("120121047", var_194_20)
						arg_191_1:RecordAudio("120121047", var_194_20)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_120121", "120121047", "story_v_out_120121.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_120121", "120121047", "story_v_out_120121.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_21 = math.max(var_194_12, arg_191_1.talkMaxDuration)

			if var_194_11 <= arg_191_1.time_ and arg_191_1.time_ < var_194_11 + var_194_21 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_11) / var_194_21

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_11 + var_194_21 and arg_191_1.time_ < var_194_11 + var_194_21 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play120121048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120121048
		arg_195_1.duration_ = 12.133

		local var_195_0 = {
			zh = 11.866,
			ja = 12.133
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
				arg_195_0:Play120121049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 1.375

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[384].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(120121048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 55
				local var_198_6 = utf8.len(var_198_4)
				local var_198_7 = var_198_5 <= 0 and var_198_1 or var_198_1 * (var_198_6 / var_198_5)

				if var_198_7 > 0 and var_198_1 < var_198_7 then
					arg_195_1.talkMaxDuration = var_198_7

					if var_198_7 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_7 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_4
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121048", "story_v_out_120121.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_120121", "120121048", "story_v_out_120121.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_120121", "120121048", "story_v_out_120121.awb")

						arg_195_1:RecordAudio("120121048", var_198_9)
						arg_195_1:RecordAudio("120121048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_120121", "120121048", "story_v_out_120121.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_120121", "120121048", "story_v_out_120121.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_10 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_10 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_10

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_10 and arg_195_1.time_ < var_198_0 + var_198_10 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play120121049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 120121049
		arg_199_1.duration_ = 11.766

		local var_199_0 = {
			zh = 7.5,
			ja = 11.766
		}
		local var_199_1 = manager.audio:GetLocalizationFlag()

		if var_199_0[var_199_1] ~= nil then
			arg_199_1.duration_ = var_199_0[var_199_1]
		end

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play120121050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.9

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[384].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(120121049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 36
				local var_202_6 = utf8.len(var_202_4)
				local var_202_7 = var_202_5 <= 0 and var_202_1 or var_202_1 * (var_202_6 / var_202_5)

				if var_202_7 > 0 and var_202_1 < var_202_7 then
					arg_199_1.talkMaxDuration = var_202_7

					if var_202_7 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_7 + var_202_0
					end
				end

				arg_199_1.text_.text = var_202_4
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121049", "story_v_out_120121.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_120121", "120121049", "story_v_out_120121.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_120121", "120121049", "story_v_out_120121.awb")

						arg_199_1:RecordAudio("120121049", var_202_9)
						arg_199_1:RecordAudio("120121049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_120121", "120121049", "story_v_out_120121.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_120121", "120121049", "story_v_out_120121.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_10 = math.max(var_202_1, arg_199_1.talkMaxDuration)

			if var_202_0 <= arg_199_1.time_ and arg_199_1.time_ < var_202_0 + var_202_10 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_0) / var_202_10

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_0 + var_202_10 and arg_199_1.time_ < var_202_0 + var_202_10 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play120121050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 120121050
		arg_203_1.duration_ = 7.9

		local var_203_0 = {
			zh = 6.5,
			ja = 7.9
		}
		local var_203_1 = manager.audio:GetLocalizationFlag()

		if var_203_0[var_203_1] ~= nil then
			arg_203_1.duration_ = var_203_0[var_203_1]
		end

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
			arg_203_1.auto_ = false
		end

		function arg_203_1.playNext_(arg_205_0)
			arg_203_1.onStoryFinished_()
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action423")
			end

			local var_206_1 = 0
			local var_206_2 = 0.75

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_3 = arg_203_1:FormatText(StoryNameCfg[384].name)

				arg_203_1.leftNameTxt_.text = var_206_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_4 = arg_203_1:GetWordFromCfg(120121050)
				local var_206_5 = arg_203_1:FormatText(var_206_4.content)

				arg_203_1.text_.text = var_206_5

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_6 = 30
				local var_206_7 = utf8.len(var_206_5)
				local var_206_8 = var_206_6 <= 0 and var_206_2 or var_206_2 * (var_206_7 / var_206_6)

				if var_206_8 > 0 and var_206_2 < var_206_8 then
					arg_203_1.talkMaxDuration = var_206_8

					if var_206_8 + var_206_1 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_1
					end
				end

				arg_203_1.text_.text = var_206_5
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120121", "120121050", "story_v_out_120121.awb") ~= 0 then
					local var_206_9 = manager.audio:GetVoiceLength("story_v_out_120121", "120121050", "story_v_out_120121.awb") / 1000

					if var_206_9 + var_206_1 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_9 + var_206_1
					end

					if var_206_4.prefab_name ~= "" and arg_203_1.actors_[var_206_4.prefab_name] ~= nil then
						local var_206_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_4.prefab_name].transform, "story_v_out_120121", "120121050", "story_v_out_120121.awb")

						arg_203_1:RecordAudio("120121050", var_206_10)
						arg_203_1:RecordAudio("120121050", var_206_10)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_120121", "120121050", "story_v_out_120121.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_120121", "120121050", "story_v_out_120121.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_11 = math.max(var_206_2, arg_203_1.talkMaxDuration)

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_11 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_1) / var_206_11

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_1 + var_206_11 and arg_203_1.time_ < var_206_1 + var_206_11 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/J13f"
	},
	voices = {
		"story_v_out_120121.awb"
	}
}
