return {
	Play121021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 121021001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play121021002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J07f"

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
				local var_4_5 = arg_1_1.bgs_.J07f

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
					if iter_4_0 ~= "J07f" then
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
			local var_4_23 = 0.266666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.15

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

				local var_4_33 = arg_1_1:GetWordFromCfg(121021001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 46
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
	Play121021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 121021002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play121021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.25

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

				local var_10_2 = arg_7_1:GetWordFromCfg(121021002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 50
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
	Play121021003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 121021003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play121021004(arg_11_1)
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

				local var_14_2 = arg_11_1:GetWordFromCfg(121021003)
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
	Play121021004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 121021004
		arg_15_1.duration_ = 4.666

		local var_15_0 = {
			ja = 4.666,
			ko = 3.666,
			zh = 3.666
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
				arg_15_0:Play121021005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1076ui_story"

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

			local var_18_4 = arg_15_1.actors_["1076ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos1076ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(-0.7, -1.06, -6.2)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1076ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = arg_15_1.actors_["1076ui_story"]
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 and arg_15_1.var_.characterEffect1076ui_story == nil then
				arg_15_1.var_.characterEffect1076ui_story = var_18_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_15 = 0.200000002980232

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_15 then
				local var_18_16 = (arg_15_1.time_ - var_18_14) / var_18_15

				if arg_15_1.var_.characterEffect1076ui_story then
					arg_15_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_14 + var_18_15 and arg_15_1.time_ < var_18_14 + var_18_15 + arg_18_0 and arg_15_1.var_.characterEffect1076ui_story then
				arg_15_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action2_1")
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_19 = "1029ui_story"

			if arg_15_1.actors_[var_18_19] == nil then
				local var_18_20 = Object.Instantiate(Asset.Load("Char/" .. var_18_19), arg_15_1.stage_.transform)

				var_18_20.name = var_18_19
				var_18_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_19] = var_18_20

				local var_18_21 = var_18_20:GetComponentInChildren(typeof(CharacterEffect))

				var_18_21.enabled = true

				local var_18_22 = GameObjectTools.GetOrAddComponent(var_18_20, typeof(DynamicBoneHelper))

				if var_18_22 then
					var_18_22:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_21.transform, false)

				arg_15_1.var_[var_18_19 .. "Animator"] = var_18_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_19 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_19 .. "LipSync"] = var_18_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_23 = arg_15_1.actors_["1029ui_story"].transform
			local var_18_24 = 0

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.var_.moveOldPos1029ui_story = var_18_23.localPosition
			end

			local var_18_25 = 0.001

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_25 then
				local var_18_26 = (arg_15_1.time_ - var_18_24) / var_18_25
				local var_18_27 = Vector3.New(0.7, -1.09, -6.2)

				var_18_23.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1029ui_story, var_18_27, var_18_26)

				local var_18_28 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_28.x, var_18_28.y, var_18_28.z)

				local var_18_29 = var_18_23.localEulerAngles

				var_18_29.z = 0
				var_18_29.x = 0
				var_18_23.localEulerAngles = var_18_29
			end

			if arg_15_1.time_ >= var_18_24 + var_18_25 and arg_15_1.time_ < var_18_24 + var_18_25 + arg_18_0 then
				var_18_23.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_18_30 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_30.x, var_18_30.y, var_18_30.z)

				local var_18_31 = var_18_23.localEulerAngles

				var_18_31.z = 0
				var_18_31.x = 0
				var_18_23.localEulerAngles = var_18_31
			end

			local var_18_32 = arg_15_1.actors_["1029ui_story"]
			local var_18_33 = 0

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 and arg_15_1.var_.characterEffect1029ui_story == nil then
				arg_15_1.var_.characterEffect1029ui_story = var_18_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_34 = 0.200000002980232

			if var_18_33 <= arg_15_1.time_ and arg_15_1.time_ < var_18_33 + var_18_34 then
				local var_18_35 = (arg_15_1.time_ - var_18_33) / var_18_34

				if arg_15_1.var_.characterEffect1029ui_story then
					local var_18_36 = Mathf.Lerp(0, 0.5, var_18_35)

					arg_15_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1029ui_story.fillRatio = var_18_36
				end
			end

			if arg_15_1.time_ >= var_18_33 + var_18_34 and arg_15_1.time_ < var_18_33 + var_18_34 + arg_18_0 and arg_15_1.var_.characterEffect1029ui_story then
				local var_18_37 = 0.5

				arg_15_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1029ui_story.fillRatio = var_18_37
			end

			local var_18_38 = 0
			local var_18_39 = 0.4

			if var_18_38 < arg_15_1.time_ and arg_15_1.time_ <= var_18_38 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_40 = arg_15_1:FormatText(StoryNameCfg[389].name)

				arg_15_1.leftNameTxt_.text = var_18_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_41 = arg_15_1:GetWordFromCfg(121021004)
				local var_18_42 = arg_15_1:FormatText(var_18_41.content)

				arg_15_1.text_.text = var_18_42

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_43 = 16
				local var_18_44 = utf8.len(var_18_42)
				local var_18_45 = var_18_43 <= 0 and var_18_39 or var_18_39 * (var_18_44 / var_18_43)

				if var_18_45 > 0 and var_18_39 < var_18_45 then
					arg_15_1.talkMaxDuration = var_18_45

					if var_18_45 + var_18_38 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_45 + var_18_38
					end
				end

				arg_15_1.text_.text = var_18_42
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021004", "story_v_out_121021.awb") ~= 0 then
					local var_18_46 = manager.audio:GetVoiceLength("story_v_out_121021", "121021004", "story_v_out_121021.awb") / 1000

					if var_18_46 + var_18_38 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_46 + var_18_38
					end

					if var_18_41.prefab_name ~= "" and arg_15_1.actors_[var_18_41.prefab_name] ~= nil then
						local var_18_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_41.prefab_name].transform, "story_v_out_121021", "121021004", "story_v_out_121021.awb")

						arg_15_1:RecordAudio("121021004", var_18_47)
						arg_15_1:RecordAudio("121021004", var_18_47)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_121021", "121021004", "story_v_out_121021.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_121021", "121021004", "story_v_out_121021.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_48 = math.max(var_18_39, arg_15_1.talkMaxDuration)

			if var_18_38 <= arg_15_1.time_ and arg_15_1.time_ < var_18_38 + var_18_48 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_38) / var_18_48

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_38 + var_18_48 and arg_15_1.time_ < var_18_38 + var_18_48 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play121021005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 121021005
		arg_19_1.duration_ = 7.966

		local var_19_0 = {
			ja = 7.966,
			ko = 5.1,
			zh = 5.1
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
				arg_19_0:Play121021006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1029ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1029ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0.7, -1.09, -6.2)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1029ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["1029ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect1029ui_story == nil then
				arg_19_1.var_.characterEffect1029ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect1029ui_story then
					arg_19_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect1029ui_story then
				arg_19_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_15 = arg_19_1.actors_["1076ui_story"]
			local var_22_16 = 0

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 and arg_19_1.var_.characterEffect1076ui_story == nil then
				arg_19_1.var_.characterEffect1076ui_story = var_22_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_17 = 0.200000002980232

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_16) / var_22_17

				if arg_19_1.var_.characterEffect1076ui_story then
					local var_22_19 = Mathf.Lerp(0, 0.5, var_22_18)

					arg_19_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1076ui_story.fillRatio = var_22_19
				end
			end

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 and arg_19_1.var_.characterEffect1076ui_story then
				local var_22_20 = 0.5

				arg_19_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1076ui_story.fillRatio = var_22_20
			end

			local var_22_21 = 0
			local var_22_22 = 0.525

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_23 = arg_19_1:FormatText(StoryNameCfg[319].name)

				arg_19_1.leftNameTxt_.text = var_22_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_24 = arg_19_1:GetWordFromCfg(121021005)
				local var_22_25 = arg_19_1:FormatText(var_22_24.content)

				arg_19_1.text_.text = var_22_25

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_26 = 21
				local var_22_27 = utf8.len(var_22_25)
				local var_22_28 = var_22_26 <= 0 and var_22_22 or var_22_22 * (var_22_27 / var_22_26)

				if var_22_28 > 0 and var_22_22 < var_22_28 then
					arg_19_1.talkMaxDuration = var_22_28

					if var_22_28 + var_22_21 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_28 + var_22_21
					end
				end

				arg_19_1.text_.text = var_22_25
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021005", "story_v_out_121021.awb") ~= 0 then
					local var_22_29 = manager.audio:GetVoiceLength("story_v_out_121021", "121021005", "story_v_out_121021.awb") / 1000

					if var_22_29 + var_22_21 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_29 + var_22_21
					end

					if var_22_24.prefab_name ~= "" and arg_19_1.actors_[var_22_24.prefab_name] ~= nil then
						local var_22_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_24.prefab_name].transform, "story_v_out_121021", "121021005", "story_v_out_121021.awb")

						arg_19_1:RecordAudio("121021005", var_22_30)
						arg_19_1:RecordAudio("121021005", var_22_30)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_121021", "121021005", "story_v_out_121021.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_121021", "121021005", "story_v_out_121021.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_31 = math.max(var_22_22, arg_19_1.talkMaxDuration)

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_31 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_21) / var_22_31

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_21 + var_22_31 and arg_19_1.time_ < var_22_21 + var_22_31 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play121021006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 121021006
		arg_23_1.duration_ = 6.7

		local var_23_0 = {
			ja = 6.7,
			ko = 2.366,
			zh = 2.366
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
				arg_23_0:Play121021007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1076ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1076ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1076ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1076ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1076ui_story == nil then
				arg_23_1.var_.characterEffect1076ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1076ui_story then
					arg_23_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1076ui_story then
				arg_23_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_14 = arg_23_1.actors_["1029ui_story"]
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 and arg_23_1.var_.characterEffect1029ui_story == nil then
				arg_23_1.var_.characterEffect1029ui_story = var_26_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_16 = 0.200000002980232

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16

				if arg_23_1.var_.characterEffect1029ui_story then
					local var_26_18 = Mathf.Lerp(0, 0.5, var_26_17)

					arg_23_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1029ui_story.fillRatio = var_26_18
				end
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 and arg_23_1.var_.characterEffect1029ui_story then
				local var_26_19 = 0.5

				arg_23_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1029ui_story.fillRatio = var_26_19
			end

			local var_26_20 = 0
			local var_26_21 = 0.35

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_22 = arg_23_1:FormatText(StoryNameCfg[389].name)

				arg_23_1.leftNameTxt_.text = var_26_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_23 = arg_23_1:GetWordFromCfg(121021006)
				local var_26_24 = arg_23_1:FormatText(var_26_23.content)

				arg_23_1.text_.text = var_26_24

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_25 = 14
				local var_26_26 = utf8.len(var_26_24)
				local var_26_27 = var_26_25 <= 0 and var_26_21 or var_26_21 * (var_26_26 / var_26_25)

				if var_26_27 > 0 and var_26_21 < var_26_27 then
					arg_23_1.talkMaxDuration = var_26_27

					if var_26_27 + var_26_20 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_20
					end
				end

				arg_23_1.text_.text = var_26_24
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021006", "story_v_out_121021.awb") ~= 0 then
					local var_26_28 = manager.audio:GetVoiceLength("story_v_out_121021", "121021006", "story_v_out_121021.awb") / 1000

					if var_26_28 + var_26_20 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_28 + var_26_20
					end

					if var_26_23.prefab_name ~= "" and arg_23_1.actors_[var_26_23.prefab_name] ~= nil then
						local var_26_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_23.prefab_name].transform, "story_v_out_121021", "121021006", "story_v_out_121021.awb")

						arg_23_1:RecordAudio("121021006", var_26_29)
						arg_23_1:RecordAudio("121021006", var_26_29)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_121021", "121021006", "story_v_out_121021.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_121021", "121021006", "story_v_out_121021.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_30 = math.max(var_26_21, arg_23_1.talkMaxDuration)

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_30 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_20) / var_26_30

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_20 + var_26_30 and arg_23_1.time_ < var_26_20 + var_26_30 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play121021007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 121021007
		arg_27_1.duration_ = 6.733

		local var_27_0 = {
			ja = 6.733,
			ko = 5.633,
			zh = 5.633
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
				arg_27_0:Play121021008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1029ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1029ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0.7, -1.09, -6.2)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1029ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["1029ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1029ui_story == nil then
				arg_27_1.var_.characterEffect1029ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect1029ui_story then
					arg_27_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect1029ui_story then
				arg_27_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_14 = arg_27_1.actors_["1076ui_story"]
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 and arg_27_1.var_.characterEffect1076ui_story == nil then
				arg_27_1.var_.characterEffect1076ui_story = var_30_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_16 = 0.200000002980232

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_15) / var_30_16

				if arg_27_1.var_.characterEffect1076ui_story then
					local var_30_18 = Mathf.Lerp(0, 0.5, var_30_17)

					arg_27_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1076ui_story.fillRatio = var_30_18
				end
			end

			if arg_27_1.time_ >= var_30_15 + var_30_16 and arg_27_1.time_ < var_30_15 + var_30_16 + arg_30_0 and arg_27_1.var_.characterEffect1076ui_story then
				local var_30_19 = 0.5

				arg_27_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1076ui_story.fillRatio = var_30_19
			end

			local var_30_20 = 0
			local var_30_21 = 0.425

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_22 = arg_27_1:FormatText(StoryNameCfg[319].name)

				arg_27_1.leftNameTxt_.text = var_30_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_23 = arg_27_1:GetWordFromCfg(121021007)
				local var_30_24 = arg_27_1:FormatText(var_30_23.content)

				arg_27_1.text_.text = var_30_24

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_25 = 17
				local var_30_26 = utf8.len(var_30_24)
				local var_30_27 = var_30_25 <= 0 and var_30_21 or var_30_21 * (var_30_26 / var_30_25)

				if var_30_27 > 0 and var_30_21 < var_30_27 then
					arg_27_1.talkMaxDuration = var_30_27

					if var_30_27 + var_30_20 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_20
					end
				end

				arg_27_1.text_.text = var_30_24
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021007", "story_v_out_121021.awb") ~= 0 then
					local var_30_28 = manager.audio:GetVoiceLength("story_v_out_121021", "121021007", "story_v_out_121021.awb") / 1000

					if var_30_28 + var_30_20 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_28 + var_30_20
					end

					if var_30_23.prefab_name ~= "" and arg_27_1.actors_[var_30_23.prefab_name] ~= nil then
						local var_30_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_23.prefab_name].transform, "story_v_out_121021", "121021007", "story_v_out_121021.awb")

						arg_27_1:RecordAudio("121021007", var_30_29)
						arg_27_1:RecordAudio("121021007", var_30_29)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_121021", "121021007", "story_v_out_121021.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_121021", "121021007", "story_v_out_121021.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_30 = math.max(var_30_21, arg_27_1.talkMaxDuration)

			if var_30_20 <= arg_27_1.time_ and arg_27_1.time_ < var_30_20 + var_30_30 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_20) / var_30_30

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_20 + var_30_30 and arg_27_1.time_ < var_30_20 + var_30_30 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play121021008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 121021008
		arg_31_1.duration_ = 5.5

		local var_31_0 = {
			ja = 5.5,
			ko = 3.033,
			zh = 3.033
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
				arg_31_0:Play121021009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.4

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[319].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(121021008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021008", "story_v_out_121021.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_121021", "121021008", "story_v_out_121021.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_121021", "121021008", "story_v_out_121021.awb")

						arg_31_1:RecordAudio("121021008", var_34_9)
						arg_31_1:RecordAudio("121021008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_121021", "121021008", "story_v_out_121021.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_121021", "121021008", "story_v_out_121021.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_10 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_10 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_10

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_10 and arg_31_1.time_ < var_34_0 + var_34_10 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play121021009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 121021009
		arg_35_1.duration_ = 10.9

		local var_35_0 = {
			ja = 10.9,
			ko = 6.566,
			zh = 6.566
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
				arg_35_0:Play121021010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1076ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1076ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1076ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1076ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1076ui_story == nil then
				arg_35_1.var_.characterEffect1076ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1076ui_story then
					arg_35_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1076ui_story then
				arg_35_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076actionlink/1076action425")
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_38_15 = arg_35_1.actors_["1029ui_story"]
			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 and arg_35_1.var_.characterEffect1029ui_story == nil then
				arg_35_1.var_.characterEffect1029ui_story = var_38_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_17 = 0.200000002980232

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17

				if arg_35_1.var_.characterEffect1029ui_story then
					local var_38_19 = Mathf.Lerp(0, 0.5, var_38_18)

					arg_35_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1029ui_story.fillRatio = var_38_19
				end
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 and arg_35_1.var_.characterEffect1029ui_story then
				local var_38_20 = 0.5

				arg_35_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1029ui_story.fillRatio = var_38_20
			end

			local var_38_21 = 0
			local var_38_22 = 0.8

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_23 = arg_35_1:FormatText(StoryNameCfg[389].name)

				arg_35_1.leftNameTxt_.text = var_38_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_24 = arg_35_1:GetWordFromCfg(121021009)
				local var_38_25 = arg_35_1:FormatText(var_38_24.content)

				arg_35_1.text_.text = var_38_25

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_26 = 32
				local var_38_27 = utf8.len(var_38_25)
				local var_38_28 = var_38_26 <= 0 and var_38_22 or var_38_22 * (var_38_27 / var_38_26)

				if var_38_28 > 0 and var_38_22 < var_38_28 then
					arg_35_1.talkMaxDuration = var_38_28

					if var_38_28 + var_38_21 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_28 + var_38_21
					end
				end

				arg_35_1.text_.text = var_38_25
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021009", "story_v_out_121021.awb") ~= 0 then
					local var_38_29 = manager.audio:GetVoiceLength("story_v_out_121021", "121021009", "story_v_out_121021.awb") / 1000

					if var_38_29 + var_38_21 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_29 + var_38_21
					end

					if var_38_24.prefab_name ~= "" and arg_35_1.actors_[var_38_24.prefab_name] ~= nil then
						local var_38_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_24.prefab_name].transform, "story_v_out_121021", "121021009", "story_v_out_121021.awb")

						arg_35_1:RecordAudio("121021009", var_38_30)
						arg_35_1:RecordAudio("121021009", var_38_30)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_121021", "121021009", "story_v_out_121021.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_121021", "121021009", "story_v_out_121021.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_31 = math.max(var_38_22, arg_35_1.talkMaxDuration)

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_31 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_21) / var_38_31

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_21 + var_38_31 and arg_35_1.time_ < var_38_21 + var_38_31 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play121021010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 121021010
		arg_39_1.duration_ = 2.733

		local var_39_0 = {
			ja = 2.733,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_39_0:Play121021011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1029ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1029ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0.7, -1.09, -6.2)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1029ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1029ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1029ui_story == nil then
				arg_39_1.var_.characterEffect1029ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1029ui_story then
					arg_39_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1029ui_story then
				arg_39_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_42_13 = 0

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_42_14 = arg_39_1.actors_["1076ui_story"]
			local var_42_15 = 0

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 and arg_39_1.var_.characterEffect1076ui_story == nil then
				arg_39_1.var_.characterEffect1076ui_story = var_42_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_16 = 0.200000002980232

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_16 then
				local var_42_17 = (arg_39_1.time_ - var_42_15) / var_42_16

				if arg_39_1.var_.characterEffect1076ui_story then
					local var_42_18 = Mathf.Lerp(0, 0.5, var_42_17)

					arg_39_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1076ui_story.fillRatio = var_42_18
				end
			end

			if arg_39_1.time_ >= var_42_15 + var_42_16 and arg_39_1.time_ < var_42_15 + var_42_16 + arg_42_0 and arg_39_1.var_.characterEffect1076ui_story then
				local var_42_19 = 0.5

				arg_39_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1076ui_story.fillRatio = var_42_19
			end

			local var_42_20 = 0
			local var_42_21 = 0.25

			if var_42_20 < arg_39_1.time_ and arg_39_1.time_ <= var_42_20 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_22 = arg_39_1:FormatText(StoryNameCfg[319].name)

				arg_39_1.leftNameTxt_.text = var_42_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_23 = arg_39_1:GetWordFromCfg(121021010)
				local var_42_24 = arg_39_1:FormatText(var_42_23.content)

				arg_39_1.text_.text = var_42_24

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_25 = 10
				local var_42_26 = utf8.len(var_42_24)
				local var_42_27 = var_42_25 <= 0 and var_42_21 or var_42_21 * (var_42_26 / var_42_25)

				if var_42_27 > 0 and var_42_21 < var_42_27 then
					arg_39_1.talkMaxDuration = var_42_27

					if var_42_27 + var_42_20 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_27 + var_42_20
					end
				end

				arg_39_1.text_.text = var_42_24
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021010", "story_v_out_121021.awb") ~= 0 then
					local var_42_28 = manager.audio:GetVoiceLength("story_v_out_121021", "121021010", "story_v_out_121021.awb") / 1000

					if var_42_28 + var_42_20 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_28 + var_42_20
					end

					if var_42_23.prefab_name ~= "" and arg_39_1.actors_[var_42_23.prefab_name] ~= nil then
						local var_42_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_23.prefab_name].transform, "story_v_out_121021", "121021010", "story_v_out_121021.awb")

						arg_39_1:RecordAudio("121021010", var_42_29)
						arg_39_1:RecordAudio("121021010", var_42_29)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_121021", "121021010", "story_v_out_121021.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_121021", "121021010", "story_v_out_121021.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_30 = math.max(var_42_21, arg_39_1.talkMaxDuration)

			if var_42_20 <= arg_39_1.time_ and arg_39_1.time_ < var_42_20 + var_42_30 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_20) / var_42_30

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_20 + var_42_30 and arg_39_1.time_ < var_42_20 + var_42_30 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play121021011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 121021011
		arg_43_1.duration_ = 1.999999999999

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play121021012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1076ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1076ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1076ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1076ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1076ui_story == nil then
				arg_43_1.var_.characterEffect1076ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1076ui_story then
					arg_43_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1076ui_story then
				arg_43_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action5_2")
			end

			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_15 = arg_43_1.actors_["1029ui_story"]
			local var_46_16 = 0

			if var_46_16 < arg_43_1.time_ and arg_43_1.time_ <= var_46_16 + arg_46_0 and arg_43_1.var_.characterEffect1029ui_story == nil then
				arg_43_1.var_.characterEffect1029ui_story = var_46_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_17 = 0.200000002980232

			if var_46_16 <= arg_43_1.time_ and arg_43_1.time_ < var_46_16 + var_46_17 then
				local var_46_18 = (arg_43_1.time_ - var_46_16) / var_46_17

				if arg_43_1.var_.characterEffect1029ui_story then
					local var_46_19 = Mathf.Lerp(0, 0.5, var_46_18)

					arg_43_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1029ui_story.fillRatio = var_46_19
				end
			end

			if arg_43_1.time_ >= var_46_16 + var_46_17 and arg_43_1.time_ < var_46_16 + var_46_17 + arg_46_0 and arg_43_1.var_.characterEffect1029ui_story then
				local var_46_20 = 0.5

				arg_43_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1029ui_story.fillRatio = var_46_20
			end

			local var_46_21 = 0
			local var_46_22 = 0.05

			if var_46_21 < arg_43_1.time_ and arg_43_1.time_ <= var_46_21 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_23 = arg_43_1:FormatText(StoryNameCfg[389].name)

				arg_43_1.leftNameTxt_.text = var_46_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_24 = arg_43_1:GetWordFromCfg(121021011)
				local var_46_25 = arg_43_1:FormatText(var_46_24.content)

				arg_43_1.text_.text = var_46_25

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_26 = 2
				local var_46_27 = utf8.len(var_46_25)
				local var_46_28 = var_46_26 <= 0 and var_46_22 or var_46_22 * (var_46_27 / var_46_26)

				if var_46_28 > 0 and var_46_22 < var_46_28 then
					arg_43_1.talkMaxDuration = var_46_28

					if var_46_28 + var_46_21 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_28 + var_46_21
					end
				end

				arg_43_1.text_.text = var_46_25
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021011", "story_v_out_121021.awb") ~= 0 then
					local var_46_29 = manager.audio:GetVoiceLength("story_v_out_121021", "121021011", "story_v_out_121021.awb") / 1000

					if var_46_29 + var_46_21 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_29 + var_46_21
					end

					if var_46_24.prefab_name ~= "" and arg_43_1.actors_[var_46_24.prefab_name] ~= nil then
						local var_46_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_24.prefab_name].transform, "story_v_out_121021", "121021011", "story_v_out_121021.awb")

						arg_43_1:RecordAudio("121021011", var_46_30)
						arg_43_1:RecordAudio("121021011", var_46_30)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_121021", "121021011", "story_v_out_121021.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_121021", "121021011", "story_v_out_121021.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_31 = math.max(var_46_22, arg_43_1.talkMaxDuration)

			if var_46_21 <= arg_43_1.time_ and arg_43_1.time_ < var_46_21 + var_46_31 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_21) / var_46_31

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_21 + var_46_31 and arg_43_1.time_ < var_46_21 + var_46_31 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play121021012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 121021012
		arg_47_1.duration_ = 8.433

		local var_47_0 = {
			ja = 8.433,
			ko = 4.3,
			zh = 4.3
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
				arg_47_0:Play121021013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1029ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1029ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0.7, -1.09, -6.2)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1029ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1029ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1029ui_story == nil then
				arg_47_1.var_.characterEffect1029ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1029ui_story then
					arg_47_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1029ui_story then
				arg_47_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action7_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_15 = arg_47_1.actors_["1076ui_story"]
			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 and arg_47_1.var_.characterEffect1076ui_story == nil then
				arg_47_1.var_.characterEffect1076ui_story = var_50_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_17 = 0.200000002980232

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17

				if arg_47_1.var_.characterEffect1076ui_story then
					local var_50_19 = Mathf.Lerp(0, 0.5, var_50_18)

					arg_47_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1076ui_story.fillRatio = var_50_19
				end
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 and arg_47_1.var_.characterEffect1076ui_story then
				local var_50_20 = 0.5

				arg_47_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1076ui_story.fillRatio = var_50_20
			end

			local var_50_21 = 0
			local var_50_22 = 0.525

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_23 = arg_47_1:FormatText(StoryNameCfg[319].name)

				arg_47_1.leftNameTxt_.text = var_50_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_24 = arg_47_1:GetWordFromCfg(121021012)
				local var_50_25 = arg_47_1:FormatText(var_50_24.content)

				arg_47_1.text_.text = var_50_25

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_26 = 21
				local var_50_27 = utf8.len(var_50_25)
				local var_50_28 = var_50_26 <= 0 and var_50_22 or var_50_22 * (var_50_27 / var_50_26)

				if var_50_28 > 0 and var_50_22 < var_50_28 then
					arg_47_1.talkMaxDuration = var_50_28

					if var_50_28 + var_50_21 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_28 + var_50_21
					end
				end

				arg_47_1.text_.text = var_50_25
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021012", "story_v_out_121021.awb") ~= 0 then
					local var_50_29 = manager.audio:GetVoiceLength("story_v_out_121021", "121021012", "story_v_out_121021.awb") / 1000

					if var_50_29 + var_50_21 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_29 + var_50_21
					end

					if var_50_24.prefab_name ~= "" and arg_47_1.actors_[var_50_24.prefab_name] ~= nil then
						local var_50_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_24.prefab_name].transform, "story_v_out_121021", "121021012", "story_v_out_121021.awb")

						arg_47_1:RecordAudio("121021012", var_50_30)
						arg_47_1:RecordAudio("121021012", var_50_30)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_121021", "121021012", "story_v_out_121021.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_121021", "121021012", "story_v_out_121021.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_31 = math.max(var_50_22, arg_47_1.talkMaxDuration)

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_31 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_21) / var_50_31

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_21 + var_50_31 and arg_47_1.time_ < var_50_21 + var_50_31 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play121021013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 121021013
		arg_51_1.duration_ = 10.6

		local var_51_0 = {
			ja = 10.6,
			ko = 6.833,
			zh = 6.833
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
				arg_51_0:Play121021014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1029ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1029ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0.7, -1.09, -6.2)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1029ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["1029ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect1029ui_story == nil then
				arg_51_1.var_.characterEffect1029ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect1029ui_story then
					arg_51_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect1029ui_story then
				arg_51_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action474")
			end

			local var_54_15 = 0
			local var_54_16 = 0.825

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_17 = arg_51_1:FormatText(StoryNameCfg[319].name)

				arg_51_1.leftNameTxt_.text = var_54_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_18 = arg_51_1:GetWordFromCfg(121021013)
				local var_54_19 = arg_51_1:FormatText(var_54_18.content)

				arg_51_1.text_.text = var_54_19

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_20 = 33
				local var_54_21 = utf8.len(var_54_19)
				local var_54_22 = var_54_20 <= 0 and var_54_16 or var_54_16 * (var_54_21 / var_54_20)

				if var_54_22 > 0 and var_54_16 < var_54_22 then
					arg_51_1.talkMaxDuration = var_54_22

					if var_54_22 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_22 + var_54_15
					end
				end

				arg_51_1.text_.text = var_54_19
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021013", "story_v_out_121021.awb") ~= 0 then
					local var_54_23 = manager.audio:GetVoiceLength("story_v_out_121021", "121021013", "story_v_out_121021.awb") / 1000

					if var_54_23 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_23 + var_54_15
					end

					if var_54_18.prefab_name ~= "" and arg_51_1.actors_[var_54_18.prefab_name] ~= nil then
						local var_54_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_18.prefab_name].transform, "story_v_out_121021", "121021013", "story_v_out_121021.awb")

						arg_51_1:RecordAudio("121021013", var_54_24)
						arg_51_1:RecordAudio("121021013", var_54_24)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_121021", "121021013", "story_v_out_121021.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_121021", "121021013", "story_v_out_121021.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_25 = math.max(var_54_16, arg_51_1.talkMaxDuration)

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_25 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_15) / var_54_25

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_15 + var_54_25 and arg_51_1.time_ < var_54_15 + var_54_25 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play121021014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 121021014
		arg_55_1.duration_ = 8.233

		local var_55_0 = {
			ja = 8.233,
			ko = 5.866,
			zh = 5.866
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
				arg_55_0:Play121021015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1029ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1029ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0.7, -1.09, -6.2)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1029ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1029ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1029ui_story == nil then
				arg_55_1.var_.characterEffect1029ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1029ui_story then
					arg_55_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1029ui_story then
				arg_55_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_58_14 = 0
			local var_58_15 = 0.55

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_16 = arg_55_1:FormatText(StoryNameCfg[319].name)

				arg_55_1.leftNameTxt_.text = var_58_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_17 = arg_55_1:GetWordFromCfg(121021014)
				local var_58_18 = arg_55_1:FormatText(var_58_17.content)

				arg_55_1.text_.text = var_58_18

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_19 = 22
				local var_58_20 = utf8.len(var_58_18)
				local var_58_21 = var_58_19 <= 0 and var_58_15 or var_58_15 * (var_58_20 / var_58_19)

				if var_58_21 > 0 and var_58_15 < var_58_21 then
					arg_55_1.talkMaxDuration = var_58_21

					if var_58_21 + var_58_14 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_21 + var_58_14
					end
				end

				arg_55_1.text_.text = var_58_18
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021014", "story_v_out_121021.awb") ~= 0 then
					local var_58_22 = manager.audio:GetVoiceLength("story_v_out_121021", "121021014", "story_v_out_121021.awb") / 1000

					if var_58_22 + var_58_14 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_22 + var_58_14
					end

					if var_58_17.prefab_name ~= "" and arg_55_1.actors_[var_58_17.prefab_name] ~= nil then
						local var_58_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_17.prefab_name].transform, "story_v_out_121021", "121021014", "story_v_out_121021.awb")

						arg_55_1:RecordAudio("121021014", var_58_23)
						arg_55_1:RecordAudio("121021014", var_58_23)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_121021", "121021014", "story_v_out_121021.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_121021", "121021014", "story_v_out_121021.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_24 = math.max(var_58_15, arg_55_1.talkMaxDuration)

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_24 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_14) / var_58_24

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_14 + var_58_24 and arg_55_1.time_ < var_58_14 + var_58_24 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play121021015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 121021015
		arg_59_1.duration_ = 7.466

		local var_59_0 = {
			ja = 7.466,
			ko = 4.4,
			zh = 4.4
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
				arg_59_0:Play121021016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1076ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1076ui_story == nil then
				arg_59_1.var_.characterEffect1076ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1076ui_story then
					arg_59_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1076ui_story then
				arg_59_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_62_4 = 0

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 then
				arg_59_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_6 = arg_59_1.actors_["1029ui_story"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.characterEffect1029ui_story == nil then
				arg_59_1.var_.characterEffect1029ui_story = var_62_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_8 = 0.200000002980232

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8

				if arg_59_1.var_.characterEffect1029ui_story then
					local var_62_10 = Mathf.Lerp(0, 0.5, var_62_9)

					arg_59_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1029ui_story.fillRatio = var_62_10
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 and arg_59_1.var_.characterEffect1029ui_story then
				local var_62_11 = 0.5

				arg_59_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1029ui_story.fillRatio = var_62_11
			end

			local var_62_12 = 0
			local var_62_13 = 0.425

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[389].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(121021015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 17
				local var_62_18 = utf8.len(var_62_16)
				local var_62_19 = var_62_17 <= 0 and var_62_13 or var_62_13 * (var_62_18 / var_62_17)

				if var_62_19 > 0 and var_62_13 < var_62_19 then
					arg_59_1.talkMaxDuration = var_62_19

					if var_62_19 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_19 + var_62_12
					end
				end

				arg_59_1.text_.text = var_62_16
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021015", "story_v_out_121021.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_121021", "121021015", "story_v_out_121021.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_121021", "121021015", "story_v_out_121021.awb")

						arg_59_1:RecordAudio("121021015", var_62_21)
						arg_59_1:RecordAudio("121021015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_121021", "121021015", "story_v_out_121021.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_121021", "121021015", "story_v_out_121021.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_22 = math.max(var_62_13, arg_59_1.talkMaxDuration)

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_22 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_12) / var_62_22

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_12 + var_62_22 and arg_59_1.time_ < var_62_12 + var_62_22 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play121021016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 121021016
		arg_63_1.duration_ = 11.233

		local var_63_0 = {
			ja = 11.233,
			ko = 6.766,
			zh = 6.766
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
				arg_63_0:Play121021017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1029ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1029ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0.7, -1.09, -6.2)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1029ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1029ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect1029ui_story == nil then
				arg_63_1.var_.characterEffect1029ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1029ui_story then
					arg_63_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect1029ui_story then
				arg_63_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_14 = arg_63_1.actors_["1076ui_story"]
			local var_66_15 = 0

			if var_66_15 < arg_63_1.time_ and arg_63_1.time_ <= var_66_15 + arg_66_0 and arg_63_1.var_.characterEffect1076ui_story == nil then
				arg_63_1.var_.characterEffect1076ui_story = var_66_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_16 = 0.200000002980232

			if var_66_15 <= arg_63_1.time_ and arg_63_1.time_ < var_66_15 + var_66_16 then
				local var_66_17 = (arg_63_1.time_ - var_66_15) / var_66_16

				if arg_63_1.var_.characterEffect1076ui_story then
					local var_66_18 = Mathf.Lerp(0, 0.5, var_66_17)

					arg_63_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1076ui_story.fillRatio = var_66_18
				end
			end

			if arg_63_1.time_ >= var_66_15 + var_66_16 and arg_63_1.time_ < var_66_15 + var_66_16 + arg_66_0 and arg_63_1.var_.characterEffect1076ui_story then
				local var_66_19 = 0.5

				arg_63_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1076ui_story.fillRatio = var_66_19
			end

			local var_66_20 = 0
			local var_66_21 = 0.775

			if var_66_20 < arg_63_1.time_ and arg_63_1.time_ <= var_66_20 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_22 = arg_63_1:FormatText(StoryNameCfg[319].name)

				arg_63_1.leftNameTxt_.text = var_66_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_23 = arg_63_1:GetWordFromCfg(121021016)
				local var_66_24 = arg_63_1:FormatText(var_66_23.content)

				arg_63_1.text_.text = var_66_24

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_25 = 31
				local var_66_26 = utf8.len(var_66_24)
				local var_66_27 = var_66_25 <= 0 and var_66_21 or var_66_21 * (var_66_26 / var_66_25)

				if var_66_27 > 0 and var_66_21 < var_66_27 then
					arg_63_1.talkMaxDuration = var_66_27

					if var_66_27 + var_66_20 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_27 + var_66_20
					end
				end

				arg_63_1.text_.text = var_66_24
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021016", "story_v_out_121021.awb") ~= 0 then
					local var_66_28 = manager.audio:GetVoiceLength("story_v_out_121021", "121021016", "story_v_out_121021.awb") / 1000

					if var_66_28 + var_66_20 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_28 + var_66_20
					end

					if var_66_23.prefab_name ~= "" and arg_63_1.actors_[var_66_23.prefab_name] ~= nil then
						local var_66_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_23.prefab_name].transform, "story_v_out_121021", "121021016", "story_v_out_121021.awb")

						arg_63_1:RecordAudio("121021016", var_66_29)
						arg_63_1:RecordAudio("121021016", var_66_29)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_121021", "121021016", "story_v_out_121021.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_121021", "121021016", "story_v_out_121021.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_30 = math.max(var_66_21, arg_63_1.talkMaxDuration)

			if var_66_20 <= arg_63_1.time_ and arg_63_1.time_ < var_66_20 + var_66_30 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_20) / var_66_30

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_20 + var_66_30 and arg_63_1.time_ < var_66_20 + var_66_30 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play121021017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 121021017
		arg_67_1.duration_ = 7.366

		local var_67_0 = {
			ja = 5.5,
			ko = 7.366,
			zh = 7.366
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
				arg_67_0:Play121021018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_70_1 = 0
			local var_70_2 = 0.775

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_3 = arg_67_1:FormatText(StoryNameCfg[319].name)

				arg_67_1.leftNameTxt_.text = var_70_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_4 = arg_67_1:GetWordFromCfg(121021017)
				local var_70_5 = arg_67_1:FormatText(var_70_4.content)

				arg_67_1.text_.text = var_70_5

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_6 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021017", "story_v_out_121021.awb") ~= 0 then
					local var_70_9 = manager.audio:GetVoiceLength("story_v_out_121021", "121021017", "story_v_out_121021.awb") / 1000

					if var_70_9 + var_70_1 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_9 + var_70_1
					end

					if var_70_4.prefab_name ~= "" and arg_67_1.actors_[var_70_4.prefab_name] ~= nil then
						local var_70_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_4.prefab_name].transform, "story_v_out_121021", "121021017", "story_v_out_121021.awb")

						arg_67_1:RecordAudio("121021017", var_70_10)
						arg_67_1:RecordAudio("121021017", var_70_10)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_121021", "121021017", "story_v_out_121021.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_121021", "121021017", "story_v_out_121021.awb")
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
	Play121021018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 121021018
		arg_71_1.duration_ = 5.366

		local var_71_0 = {
			ja = 5.366,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_71_0:Play121021019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1076ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1076ui_story == nil then
				arg_71_1.var_.characterEffect1076ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1076ui_story then
					arg_71_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1076ui_story then
				arg_71_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_74_4 = 0

			if var_74_4 < arg_71_1.time_ and arg_71_1.time_ <= var_74_4 + arg_74_0 then
				arg_71_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action2_1")
			end

			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 then
				arg_71_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_74_6 = arg_71_1.actors_["1029ui_story"]
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 and arg_71_1.var_.characterEffect1029ui_story == nil then
				arg_71_1.var_.characterEffect1029ui_story = var_74_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_8 = 0.200000002980232

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / var_74_8

				if arg_71_1.var_.characterEffect1029ui_story then
					local var_74_10 = Mathf.Lerp(0, 0.5, var_74_9)

					arg_71_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1029ui_story.fillRatio = var_74_10
				end
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 and arg_71_1.var_.characterEffect1029ui_story then
				local var_74_11 = 0.5

				arg_71_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1029ui_story.fillRatio = var_74_11
			end

			local var_74_12 = 0
			local var_74_13 = 0.125

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_14 = arg_71_1:FormatText(StoryNameCfg[389].name)

				arg_71_1.leftNameTxt_.text = var_74_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_15 = arg_71_1:GetWordFromCfg(121021018)
				local var_74_16 = arg_71_1:FormatText(var_74_15.content)

				arg_71_1.text_.text = var_74_16

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_17 = 5
				local var_74_18 = utf8.len(var_74_16)
				local var_74_19 = var_74_17 <= 0 and var_74_13 or var_74_13 * (var_74_18 / var_74_17)

				if var_74_19 > 0 and var_74_13 < var_74_19 then
					arg_71_1.talkMaxDuration = var_74_19

					if var_74_19 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_19 + var_74_12
					end
				end

				arg_71_1.text_.text = var_74_16
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021018", "story_v_out_121021.awb") ~= 0 then
					local var_74_20 = manager.audio:GetVoiceLength("story_v_out_121021", "121021018", "story_v_out_121021.awb") / 1000

					if var_74_20 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_12
					end

					if var_74_15.prefab_name ~= "" and arg_71_1.actors_[var_74_15.prefab_name] ~= nil then
						local var_74_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_15.prefab_name].transform, "story_v_out_121021", "121021018", "story_v_out_121021.awb")

						arg_71_1:RecordAudio("121021018", var_74_21)
						arg_71_1:RecordAudio("121021018", var_74_21)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_121021", "121021018", "story_v_out_121021.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_121021", "121021018", "story_v_out_121021.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_22 = math.max(var_74_13, arg_71_1.talkMaxDuration)

			if var_74_12 <= arg_71_1.time_ and arg_71_1.time_ < var_74_12 + var_74_22 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_12) / var_74_22

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_12 + var_74_22 and arg_71_1.time_ < var_74_12 + var_74_22 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play121021019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 121021019
		arg_75_1.duration_ = 5

		local var_75_0 = {
			ja = 5,
			ko = 3.166,
			zh = 3.166
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
				arg_75_0:Play121021020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1029ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1029ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0.7, -1.09, -6.2)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1029ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1029ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect1029ui_story == nil then
				arg_75_1.var_.characterEffect1029ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect1029ui_story then
					arg_75_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect1029ui_story then
				arg_75_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_2")
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_15 = arg_75_1.actors_["1076ui_story"]
			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 and arg_75_1.var_.characterEffect1076ui_story == nil then
				arg_75_1.var_.characterEffect1076ui_story = var_78_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_17 = 0.200000002980232

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17

				if arg_75_1.var_.characterEffect1076ui_story then
					local var_78_19 = Mathf.Lerp(0, 0.5, var_78_18)

					arg_75_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1076ui_story.fillRatio = var_78_19
				end
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 and arg_75_1.var_.characterEffect1076ui_story then
				local var_78_20 = 0.5

				arg_75_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1076ui_story.fillRatio = var_78_20
			end

			local var_78_21 = 0
			local var_78_22 = 0.4

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_23 = arg_75_1:FormatText(StoryNameCfg[319].name)

				arg_75_1.leftNameTxt_.text = var_78_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_24 = arg_75_1:GetWordFromCfg(121021019)
				local var_78_25 = arg_75_1:FormatText(var_78_24.content)

				arg_75_1.text_.text = var_78_25

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_26 = 16
				local var_78_27 = utf8.len(var_78_25)
				local var_78_28 = var_78_26 <= 0 and var_78_22 or var_78_22 * (var_78_27 / var_78_26)

				if var_78_28 > 0 and var_78_22 < var_78_28 then
					arg_75_1.talkMaxDuration = var_78_28

					if var_78_28 + var_78_21 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_28 + var_78_21
					end
				end

				arg_75_1.text_.text = var_78_25
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021019", "story_v_out_121021.awb") ~= 0 then
					local var_78_29 = manager.audio:GetVoiceLength("story_v_out_121021", "121021019", "story_v_out_121021.awb") / 1000

					if var_78_29 + var_78_21 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_29 + var_78_21
					end

					if var_78_24.prefab_name ~= "" and arg_75_1.actors_[var_78_24.prefab_name] ~= nil then
						local var_78_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_24.prefab_name].transform, "story_v_out_121021", "121021019", "story_v_out_121021.awb")

						arg_75_1:RecordAudio("121021019", var_78_30)
						arg_75_1:RecordAudio("121021019", var_78_30)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_121021", "121021019", "story_v_out_121021.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_121021", "121021019", "story_v_out_121021.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_31 = math.max(var_78_22, arg_75_1.talkMaxDuration)

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_31 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_21) / var_78_31

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_21 + var_78_31 and arg_75_1.time_ < var_78_21 + var_78_31 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play121021020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 121021020
		arg_79_1.duration_ = 5.566

		local var_79_0 = {
			ja = 5.566,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_79_0:Play121021021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1076ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1076ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1076ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["1076ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect1076ui_story == nil then
				arg_79_1.var_.characterEffect1076ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect1076ui_story then
					arg_79_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect1076ui_story then
				arg_79_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_82_14 = arg_79_1.actors_["1029ui_story"]
			local var_82_15 = 0

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 and arg_79_1.var_.characterEffect1029ui_story == nil then
				arg_79_1.var_.characterEffect1029ui_story = var_82_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_16 = 0.200000002980232

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_16 then
				local var_82_17 = (arg_79_1.time_ - var_82_15) / var_82_16

				if arg_79_1.var_.characterEffect1029ui_story then
					local var_82_18 = Mathf.Lerp(0, 0.5, var_82_17)

					arg_79_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1029ui_story.fillRatio = var_82_18
				end
			end

			if arg_79_1.time_ >= var_82_15 + var_82_16 and arg_79_1.time_ < var_82_15 + var_82_16 + arg_82_0 and arg_79_1.var_.characterEffect1029ui_story then
				local var_82_19 = 0.5

				arg_79_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1029ui_story.fillRatio = var_82_19
			end

			local var_82_20 = 0
			local var_82_21 = 0.2

			if var_82_20 < arg_79_1.time_ and arg_79_1.time_ <= var_82_20 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_22 = arg_79_1:FormatText(StoryNameCfg[389].name)

				arg_79_1.leftNameTxt_.text = var_82_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_23 = arg_79_1:GetWordFromCfg(121021020)
				local var_82_24 = arg_79_1:FormatText(var_82_23.content)

				arg_79_1.text_.text = var_82_24

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_25 = 8
				local var_82_26 = utf8.len(var_82_24)
				local var_82_27 = var_82_25 <= 0 and var_82_21 or var_82_21 * (var_82_26 / var_82_25)

				if var_82_27 > 0 and var_82_21 < var_82_27 then
					arg_79_1.talkMaxDuration = var_82_27

					if var_82_27 + var_82_20 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_20
					end
				end

				arg_79_1.text_.text = var_82_24
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021020", "story_v_out_121021.awb") ~= 0 then
					local var_82_28 = manager.audio:GetVoiceLength("story_v_out_121021", "121021020", "story_v_out_121021.awb") / 1000

					if var_82_28 + var_82_20 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_28 + var_82_20
					end

					if var_82_23.prefab_name ~= "" and arg_79_1.actors_[var_82_23.prefab_name] ~= nil then
						local var_82_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_23.prefab_name].transform, "story_v_out_121021", "121021020", "story_v_out_121021.awb")

						arg_79_1:RecordAudio("121021020", var_82_29)
						arg_79_1:RecordAudio("121021020", var_82_29)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_121021", "121021020", "story_v_out_121021.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_121021", "121021020", "story_v_out_121021.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_30 = math.max(var_82_21, arg_79_1.talkMaxDuration)

			if var_82_20 <= arg_79_1.time_ and arg_79_1.time_ < var_82_20 + var_82_30 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_20) / var_82_30

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_20 + var_82_30 and arg_79_1.time_ < var_82_20 + var_82_30 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play121021021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 121021021
		arg_83_1.duration_ = 7.966

		local var_83_0 = {
			ja = 7.966,
			ko = 7.766,
			zh = 7.766
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
				arg_83_0:Play121021022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1029ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1029ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0.7, -1.09, -6.2)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1029ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1029ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1029ui_story == nil then
				arg_83_1.var_.characterEffect1029ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1029ui_story then
					arg_83_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1029ui_story then
				arg_83_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_86_15 = arg_83_1.actors_["1076ui_story"]
			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 and arg_83_1.var_.characterEffect1076ui_story == nil then
				arg_83_1.var_.characterEffect1076ui_story = var_86_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_17 = 0.200000002980232

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17

				if arg_83_1.var_.characterEffect1076ui_story then
					local var_86_19 = Mathf.Lerp(0, 0.5, var_86_18)

					arg_83_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1076ui_story.fillRatio = var_86_19
				end
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 and arg_83_1.var_.characterEffect1076ui_story then
				local var_86_20 = 0.5

				arg_83_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1076ui_story.fillRatio = var_86_20
			end

			local var_86_21 = 0
			local var_86_22 = 0.825

			if var_86_21 < arg_83_1.time_ and arg_83_1.time_ <= var_86_21 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_23 = arg_83_1:FormatText(StoryNameCfg[319].name)

				arg_83_1.leftNameTxt_.text = var_86_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_24 = arg_83_1:GetWordFromCfg(121021021)
				local var_86_25 = arg_83_1:FormatText(var_86_24.content)

				arg_83_1.text_.text = var_86_25

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_26 = 34
				local var_86_27 = utf8.len(var_86_25)
				local var_86_28 = var_86_26 <= 0 and var_86_22 or var_86_22 * (var_86_27 / var_86_26)

				if var_86_28 > 0 and var_86_22 < var_86_28 then
					arg_83_1.talkMaxDuration = var_86_28

					if var_86_28 + var_86_21 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_28 + var_86_21
					end
				end

				arg_83_1.text_.text = var_86_25
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021021", "story_v_out_121021.awb") ~= 0 then
					local var_86_29 = manager.audio:GetVoiceLength("story_v_out_121021", "121021021", "story_v_out_121021.awb") / 1000

					if var_86_29 + var_86_21 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_29 + var_86_21
					end

					if var_86_24.prefab_name ~= "" and arg_83_1.actors_[var_86_24.prefab_name] ~= nil then
						local var_86_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_24.prefab_name].transform, "story_v_out_121021", "121021021", "story_v_out_121021.awb")

						arg_83_1:RecordAudio("121021021", var_86_30)
						arg_83_1:RecordAudio("121021021", var_86_30)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_121021", "121021021", "story_v_out_121021.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_121021", "121021021", "story_v_out_121021.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_31 = math.max(var_86_22, arg_83_1.talkMaxDuration)

			if var_86_21 <= arg_83_1.time_ and arg_83_1.time_ < var_86_21 + var_86_31 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_21) / var_86_31

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_21 + var_86_31 and arg_83_1.time_ < var_86_21 + var_86_31 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play121021022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 121021022
		arg_87_1.duration_ = 7.866

		local var_87_0 = {
			ja = 7.866,
			ko = 5.133,
			zh = 5.133
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
				arg_87_0:Play121021023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1029ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1029ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0.7, -1.09, -6.2)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1029ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1029ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect1029ui_story == nil then
				arg_87_1.var_.characterEffect1029ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect1029ui_story then
					arg_87_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect1029ui_story then
				arg_87_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action5_1")
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_90_15 = 0
			local var_90_16 = 0.55

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_17 = arg_87_1:FormatText(StoryNameCfg[319].name)

				arg_87_1.leftNameTxt_.text = var_90_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_18 = arg_87_1:GetWordFromCfg(121021022)
				local var_90_19 = arg_87_1:FormatText(var_90_18.content)

				arg_87_1.text_.text = var_90_19

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_20 = 22
				local var_90_21 = utf8.len(var_90_19)
				local var_90_22 = var_90_20 <= 0 and var_90_16 or var_90_16 * (var_90_21 / var_90_20)

				if var_90_22 > 0 and var_90_16 < var_90_22 then
					arg_87_1.talkMaxDuration = var_90_22

					if var_90_22 + var_90_15 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_22 + var_90_15
					end
				end

				arg_87_1.text_.text = var_90_19
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021022", "story_v_out_121021.awb") ~= 0 then
					local var_90_23 = manager.audio:GetVoiceLength("story_v_out_121021", "121021022", "story_v_out_121021.awb") / 1000

					if var_90_23 + var_90_15 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_23 + var_90_15
					end

					if var_90_18.prefab_name ~= "" and arg_87_1.actors_[var_90_18.prefab_name] ~= nil then
						local var_90_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_18.prefab_name].transform, "story_v_out_121021", "121021022", "story_v_out_121021.awb")

						arg_87_1:RecordAudio("121021022", var_90_24)
						arg_87_1:RecordAudio("121021022", var_90_24)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_121021", "121021022", "story_v_out_121021.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_121021", "121021022", "story_v_out_121021.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_25 = math.max(var_90_16, arg_87_1.talkMaxDuration)

			if var_90_15 <= arg_87_1.time_ and arg_87_1.time_ < var_90_15 + var_90_25 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_15) / var_90_25

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_15 + var_90_25 and arg_87_1.time_ < var_90_15 + var_90_25 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play121021023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 121021023
		arg_91_1.duration_ = 12.5

		local var_91_0 = {
			ja = 12.5,
			ko = 10.433,
			zh = 10.433
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
				arg_91_0:Play121021024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1029ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1029ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0.7, -1.09, -6.2)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1029ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["1029ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect1029ui_story == nil then
				arg_91_1.var_.characterEffect1029ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect1029ui_story then
					arg_91_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1029ui_story then
				arg_91_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_94_13 = 0
			local var_94_14 = 1.1

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_15 = arg_91_1:FormatText(StoryNameCfg[319].name)

				arg_91_1.leftNameTxt_.text = var_94_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_16 = arg_91_1:GetWordFromCfg(121021023)
				local var_94_17 = arg_91_1:FormatText(var_94_16.content)

				arg_91_1.text_.text = var_94_17

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_18 = 44
				local var_94_19 = utf8.len(var_94_17)
				local var_94_20 = var_94_18 <= 0 and var_94_14 or var_94_14 * (var_94_19 / var_94_18)

				if var_94_20 > 0 and var_94_14 < var_94_20 then
					arg_91_1.talkMaxDuration = var_94_20

					if var_94_20 + var_94_13 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_20 + var_94_13
					end
				end

				arg_91_1.text_.text = var_94_17
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021023", "story_v_out_121021.awb") ~= 0 then
					local var_94_21 = manager.audio:GetVoiceLength("story_v_out_121021", "121021023", "story_v_out_121021.awb") / 1000

					if var_94_21 + var_94_13 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_13
					end

					if var_94_16.prefab_name ~= "" and arg_91_1.actors_[var_94_16.prefab_name] ~= nil then
						local var_94_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_16.prefab_name].transform, "story_v_out_121021", "121021023", "story_v_out_121021.awb")

						arg_91_1:RecordAudio("121021023", var_94_22)
						arg_91_1:RecordAudio("121021023", var_94_22)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_121021", "121021023", "story_v_out_121021.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_121021", "121021023", "story_v_out_121021.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_23 = math.max(var_94_14, arg_91_1.talkMaxDuration)

			if var_94_13 <= arg_91_1.time_ and arg_91_1.time_ < var_94_13 + var_94_23 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_13) / var_94_23

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_13 + var_94_23 and arg_91_1.time_ < var_94_13 + var_94_23 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play121021024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 121021024
		arg_95_1.duration_ = 1.999999999999

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play121021025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1076ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1076ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1076ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["1076ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect1076ui_story == nil then
				arg_95_1.var_.characterEffect1076ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect1076ui_story then
					arg_95_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect1076ui_story then
				arg_95_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_98_14 = arg_95_1.actors_["1029ui_story"]
			local var_98_15 = 0

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 and arg_95_1.var_.characterEffect1029ui_story == nil then
				arg_95_1.var_.characterEffect1029ui_story = var_98_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_16 = 0.200000002980232

			if var_98_15 <= arg_95_1.time_ and arg_95_1.time_ < var_98_15 + var_98_16 then
				local var_98_17 = (arg_95_1.time_ - var_98_15) / var_98_16

				if arg_95_1.var_.characterEffect1029ui_story then
					local var_98_18 = Mathf.Lerp(0, 0.5, var_98_17)

					arg_95_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1029ui_story.fillRatio = var_98_18
				end
			end

			if arg_95_1.time_ >= var_98_15 + var_98_16 and arg_95_1.time_ < var_98_15 + var_98_16 + arg_98_0 and arg_95_1.var_.characterEffect1029ui_story then
				local var_98_19 = 0.5

				arg_95_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1029ui_story.fillRatio = var_98_19
			end

			local var_98_20 = 0
			local var_98_21 = 0.05

			if var_98_20 < arg_95_1.time_ and arg_95_1.time_ <= var_98_20 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_22 = arg_95_1:FormatText(StoryNameCfg[389].name)

				arg_95_1.leftNameTxt_.text = var_98_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_23 = arg_95_1:GetWordFromCfg(121021024)
				local var_98_24 = arg_95_1:FormatText(var_98_23.content)

				arg_95_1.text_.text = var_98_24

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_25 = 2
				local var_98_26 = utf8.len(var_98_24)
				local var_98_27 = var_98_25 <= 0 and var_98_21 or var_98_21 * (var_98_26 / var_98_25)

				if var_98_27 > 0 and var_98_21 < var_98_27 then
					arg_95_1.talkMaxDuration = var_98_27

					if var_98_27 + var_98_20 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_27 + var_98_20
					end
				end

				arg_95_1.text_.text = var_98_24
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021024", "story_v_out_121021.awb") ~= 0 then
					local var_98_28 = manager.audio:GetVoiceLength("story_v_out_121021", "121021024", "story_v_out_121021.awb") / 1000

					if var_98_28 + var_98_20 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_28 + var_98_20
					end

					if var_98_23.prefab_name ~= "" and arg_95_1.actors_[var_98_23.prefab_name] ~= nil then
						local var_98_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_23.prefab_name].transform, "story_v_out_121021", "121021024", "story_v_out_121021.awb")

						arg_95_1:RecordAudio("121021024", var_98_29)
						arg_95_1:RecordAudio("121021024", var_98_29)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_121021", "121021024", "story_v_out_121021.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_121021", "121021024", "story_v_out_121021.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_30 = math.max(var_98_21, arg_95_1.talkMaxDuration)

			if var_98_20 <= arg_95_1.time_ and arg_95_1.time_ < var_98_20 + var_98_30 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_20) / var_98_30

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_20 + var_98_30 and arg_95_1.time_ < var_98_20 + var_98_30 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play121021025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 121021025
		arg_99_1.duration_ = 8.866

		local var_99_0 = {
			ja = 8.866,
			ko = 7.6,
			zh = 7.6
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
				arg_99_0:Play121021026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1029ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1029ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0.7, -1.09, -6.2)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1029ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1029ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1029ui_story == nil then
				arg_99_1.var_.characterEffect1029ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1029ui_story then
					arg_99_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1029ui_story then
				arg_99_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action5_2")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_102_15 = arg_99_1.actors_["1076ui_story"]
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 and arg_99_1.var_.characterEffect1076ui_story == nil then
				arg_99_1.var_.characterEffect1076ui_story = var_102_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_17 = 0.200000002980232

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17

				if arg_99_1.var_.characterEffect1076ui_story then
					local var_102_19 = Mathf.Lerp(0, 0.5, var_102_18)

					arg_99_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1076ui_story.fillRatio = var_102_19
				end
			end

			if arg_99_1.time_ >= var_102_16 + var_102_17 and arg_99_1.time_ < var_102_16 + var_102_17 + arg_102_0 and arg_99_1.var_.characterEffect1076ui_story then
				local var_102_20 = 0.5

				arg_99_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1076ui_story.fillRatio = var_102_20
			end

			local var_102_21 = 0
			local var_102_22 = 0.675

			if var_102_21 < arg_99_1.time_ and arg_99_1.time_ <= var_102_21 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_23 = arg_99_1:FormatText(StoryNameCfg[319].name)

				arg_99_1.leftNameTxt_.text = var_102_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_24 = arg_99_1:GetWordFromCfg(121021025)
				local var_102_25 = arg_99_1:FormatText(var_102_24.content)

				arg_99_1.text_.text = var_102_25

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_26 = 27
				local var_102_27 = utf8.len(var_102_25)
				local var_102_28 = var_102_26 <= 0 and var_102_22 or var_102_22 * (var_102_27 / var_102_26)

				if var_102_28 > 0 and var_102_22 < var_102_28 then
					arg_99_1.talkMaxDuration = var_102_28

					if var_102_28 + var_102_21 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_28 + var_102_21
					end
				end

				arg_99_1.text_.text = var_102_25
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021025", "story_v_out_121021.awb") ~= 0 then
					local var_102_29 = manager.audio:GetVoiceLength("story_v_out_121021", "121021025", "story_v_out_121021.awb") / 1000

					if var_102_29 + var_102_21 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_29 + var_102_21
					end

					if var_102_24.prefab_name ~= "" and arg_99_1.actors_[var_102_24.prefab_name] ~= nil then
						local var_102_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_24.prefab_name].transform, "story_v_out_121021", "121021025", "story_v_out_121021.awb")

						arg_99_1:RecordAudio("121021025", var_102_30)
						arg_99_1:RecordAudio("121021025", var_102_30)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_121021", "121021025", "story_v_out_121021.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_121021", "121021025", "story_v_out_121021.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_31 = math.max(var_102_22, arg_99_1.talkMaxDuration)

			if var_102_21 <= arg_99_1.time_ and arg_99_1.time_ < var_102_21 + var_102_31 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_21) / var_102_31

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_21 + var_102_31 and arg_99_1.time_ < var_102_21 + var_102_31 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play121021026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 121021026
		arg_103_1.duration_ = 7.6

		local var_103_0 = {
			ja = 7.6,
			ko = 4.666,
			zh = 4.666
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
				arg_103_0:Play121021027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_106_1 = 0
			local var_106_2 = 0.575

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_3 = arg_103_1:FormatText(StoryNameCfg[319].name)

				arg_103_1.leftNameTxt_.text = var_106_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_4 = arg_103_1:GetWordFromCfg(121021026)
				local var_106_5 = arg_103_1:FormatText(var_106_4.content)

				arg_103_1.text_.text = var_106_5

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_6 = 23
				local var_106_7 = utf8.len(var_106_5)
				local var_106_8 = var_106_6 <= 0 and var_106_2 or var_106_2 * (var_106_7 / var_106_6)

				if var_106_8 > 0 and var_106_2 < var_106_8 then
					arg_103_1.talkMaxDuration = var_106_8

					if var_106_8 + var_106_1 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_1
					end
				end

				arg_103_1.text_.text = var_106_5
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021026", "story_v_out_121021.awb") ~= 0 then
					local var_106_9 = manager.audio:GetVoiceLength("story_v_out_121021", "121021026", "story_v_out_121021.awb") / 1000

					if var_106_9 + var_106_1 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_9 + var_106_1
					end

					if var_106_4.prefab_name ~= "" and arg_103_1.actors_[var_106_4.prefab_name] ~= nil then
						local var_106_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_4.prefab_name].transform, "story_v_out_121021", "121021026", "story_v_out_121021.awb")

						arg_103_1:RecordAudio("121021026", var_106_10)
						arg_103_1:RecordAudio("121021026", var_106_10)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_121021", "121021026", "story_v_out_121021.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_121021", "121021026", "story_v_out_121021.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_11 = math.max(var_106_2, arg_103_1.talkMaxDuration)

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_11 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_1) / var_106_11

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_1 + var_106_11 and arg_103_1.time_ < var_106_1 + var_106_11 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play121021027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 121021027
		arg_107_1.duration_ = 6.466

		local var_107_0 = {
			ja = 6.466,
			ko = 3.666,
			zh = 3.666
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
			arg_107_1.auto_ = false
		end

		function arg_107_1.playNext_(arg_109_0)
			arg_107_1.onStoryFinished_()
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_110_1 = 0
			local var_110_2 = 0.375

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_3 = arg_107_1:FormatText(StoryNameCfg[319].name)

				arg_107_1.leftNameTxt_.text = var_110_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_4 = arg_107_1:GetWordFromCfg(121021027)
				local var_110_5 = arg_107_1:FormatText(var_110_4.content)

				arg_107_1.text_.text = var_110_5

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_6 = 15
				local var_110_7 = utf8.len(var_110_5)
				local var_110_8 = var_110_6 <= 0 and var_110_2 or var_110_2 * (var_110_7 / var_110_6)

				if var_110_8 > 0 and var_110_2 < var_110_8 then
					arg_107_1.talkMaxDuration = var_110_8

					if var_110_8 + var_110_1 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_1
					end
				end

				arg_107_1.text_.text = var_110_5
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121021", "121021027", "story_v_out_121021.awb") ~= 0 then
					local var_110_9 = manager.audio:GetVoiceLength("story_v_out_121021", "121021027", "story_v_out_121021.awb") / 1000

					if var_110_9 + var_110_1 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_9 + var_110_1
					end

					if var_110_4.prefab_name ~= "" and arg_107_1.actors_[var_110_4.prefab_name] ~= nil then
						local var_110_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_4.prefab_name].transform, "story_v_out_121021", "121021027", "story_v_out_121021.awb")

						arg_107_1:RecordAudio("121021027", var_110_10)
						arg_107_1:RecordAudio("121021027", var_110_10)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_121021", "121021027", "story_v_out_121021.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_121021", "121021027", "story_v_out_121021.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_11 = math.max(var_110_2, arg_107_1.talkMaxDuration)

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_11 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_1) / var_110_11

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_1 + var_110_11 and arg_107_1.time_ < var_110_1 + var_110_11 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J07f"
	},
	voices = {
		"story_v_out_121021.awb"
	}
}
