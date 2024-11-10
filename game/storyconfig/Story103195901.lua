return {
	Play319591001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319591001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319591002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I12h"

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
				local var_4_5 = arg_1_1.bgs_.I12h

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
					if iter_4_0 ~= "I12h" then
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
			local var_4_23 = 0.0666666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_26 = 2
			local var_4_27 = 0.875

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_28 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_28:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_29 = arg_1_1:GetWordFromCfg(319591001)
				local var_4_30 = arg_1_1:FormatText(var_4_29.content)

				arg_1_1.text_.text = var_4_30

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_31 = 35
				local var_4_32 = utf8.len(var_4_30)
				local var_4_33 = var_4_31 <= 0 and var_4_27 or var_4_27 * (var_4_32 / var_4_31)

				if var_4_33 > 0 and var_4_27 < var_4_33 then
					arg_1_1.talkMaxDuration = var_4_33
					var_4_26 = var_4_26 + 0.3

					if var_4_33 + var_4_26 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_33 + var_4_26
					end
				end

				arg_1_1.text_.text = var_4_30
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_34 = var_4_26 + 0.3
			local var_4_35 = math.max(var_4_27, arg_1_1.talkMaxDuration)

			if var_4_34 <= arg_1_1.time_ and arg_1_1.time_ < var_4_34 + var_4_35 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_34) / var_4_35

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_34 + var_4_35 and arg_1_1.time_ < var_4_34 + var_4_35 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319591002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319591002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play319591003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.8

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

				local var_10_2 = arg_7_1:GetWordFromCfg(319591002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 32
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
	Play319591003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319591003
		arg_11_1.duration_ = 4.766

		local var_11_0 = {
			zh = 3.999999999999,
			ja = 4.766
		}
		local var_11_1 = manager.audio:GetLocalizationFlag()

		if var_11_0[var_11_1] ~= nil then
			arg_11_1.duration_ = var_11_0[var_11_1]
		end

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play319591004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "A08f"

			if arg_11_1.bgs_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(arg_11_1.paintGo_)

				var_14_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_14_0)
				var_14_1.name = var_14_0
				var_14_1.transform.parent = arg_11_1.stage_.transform
				var_14_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.bgs_[var_14_0] = var_14_1
			end

			local var_14_2 = 2

			if var_14_2 < arg_11_1.time_ and arg_11_1.time_ <= var_14_2 + arg_14_0 then
				local var_14_3 = manager.ui.mainCamera.transform.localPosition
				local var_14_4 = Vector3.New(0, 0, 10) + Vector3.New(var_14_3.x, var_14_3.y, 0)
				local var_14_5 = arg_11_1.bgs_.A08f

				var_14_5.transform.localPosition = var_14_4
				var_14_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_14_6 = var_14_5:GetComponent("SpriteRenderer")

				if var_14_6 and var_14_6.sprite then
					local var_14_7 = (var_14_5.transform.localPosition - var_14_3).z
					local var_14_8 = manager.ui.mainCameraCom_
					local var_14_9 = 2 * var_14_7 * Mathf.Tan(var_14_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_14_10 = var_14_9 * var_14_8.aspect
					local var_14_11 = var_14_6.sprite.bounds.size.x
					local var_14_12 = var_14_6.sprite.bounds.size.y
					local var_14_13 = var_14_10 / var_14_11
					local var_14_14 = var_14_9 / var_14_12
					local var_14_15 = var_14_14 < var_14_13 and var_14_13 or var_14_14

					var_14_5.transform.localScale = Vector3.New(var_14_15, var_14_15, 0)
				end

				for iter_14_0, iter_14_1 in pairs(arg_11_1.bgs_) do
					if iter_14_0 ~= "A08f" then
						iter_14_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 then
				arg_11_1.mask_.enabled = true
				arg_11_1.mask_.raycastTarget = true

				arg_11_1:SetGaussion(false)
			end

			local var_14_17 = 2

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17
				local var_14_19 = Color.New(0, 0, 0)

				var_14_19.a = Mathf.Lerp(0, 1, var_14_18)
				arg_11_1.mask_.color = var_14_19
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 then
				local var_14_20 = Color.New(0, 0, 0)

				var_14_20.a = 1
				arg_11_1.mask_.color = var_14_20
			end

			local var_14_21 = 2

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				arg_11_1.mask_.enabled = true
				arg_11_1.mask_.raycastTarget = true

				arg_11_1:SetGaussion(false)
			end

			local var_14_22 = 2

			if var_14_21 <= arg_11_1.time_ and arg_11_1.time_ < var_14_21 + var_14_22 then
				local var_14_23 = (arg_11_1.time_ - var_14_21) / var_14_22
				local var_14_24 = Color.New(0, 0, 0)

				var_14_24.a = Mathf.Lerp(1, 0, var_14_23)
				arg_11_1.mask_.color = var_14_24
			end

			if arg_11_1.time_ >= var_14_21 + var_14_22 and arg_11_1.time_ < var_14_21 + var_14_22 + arg_14_0 then
				local var_14_25 = Color.New(0, 0, 0)
				local var_14_26 = 0

				arg_11_1.mask_.enabled = false
				var_14_25.a = var_14_26
				arg_11_1.mask_.color = var_14_25
			end

			local var_14_27 = "4040ui_story"

			if arg_11_1.actors_[var_14_27] == nil then
				local var_14_28 = Object.Instantiate(Asset.Load("Char/" .. var_14_27), arg_11_1.stage_.transform)

				var_14_28.name = var_14_27
				var_14_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_27] = var_14_28

				local var_14_29 = var_14_28:GetComponentInChildren(typeof(CharacterEffect))

				var_14_29.enabled = true

				local var_14_30 = GameObjectTools.GetOrAddComponent(var_14_28, typeof(DynamicBoneHelper))

				if var_14_30 then
					var_14_30:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_29.transform, false)

				arg_11_1.var_[var_14_27 .. "Animator"] = var_14_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_27 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_27 .. "LipSync"] = var_14_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_31 = arg_11_1.actors_["4040ui_story"].transform
			local var_14_32 = 2

			if var_14_32 < arg_11_1.time_ and arg_11_1.time_ <= var_14_32 + arg_14_0 then
				arg_11_1.var_.moveOldPos4040ui_story = var_14_31.localPosition
			end

			local var_14_33 = 0.001

			if var_14_32 <= arg_11_1.time_ and arg_11_1.time_ < var_14_32 + var_14_33 then
				local var_14_34 = (arg_11_1.time_ - var_14_32) / var_14_33
				local var_14_35 = Vector3.New(0, -1.55, -5.5)

				var_14_31.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos4040ui_story, var_14_35, var_14_34)

				local var_14_36 = manager.ui.mainCamera.transform.position - var_14_31.position

				var_14_31.forward = Vector3.New(var_14_36.x, var_14_36.y, var_14_36.z)

				local var_14_37 = var_14_31.localEulerAngles

				var_14_37.z = 0
				var_14_37.x = 0
				var_14_31.localEulerAngles = var_14_37
			end

			if arg_11_1.time_ >= var_14_32 + var_14_33 and arg_11_1.time_ < var_14_32 + var_14_33 + arg_14_0 then
				var_14_31.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_14_38 = manager.ui.mainCamera.transform.position - var_14_31.position

				var_14_31.forward = Vector3.New(var_14_38.x, var_14_38.y, var_14_38.z)

				local var_14_39 = var_14_31.localEulerAngles

				var_14_39.z = 0
				var_14_39.x = 0
				var_14_31.localEulerAngles = var_14_39
			end

			local var_14_40 = arg_11_1.actors_["4040ui_story"]
			local var_14_41 = 2

			if var_14_41 < arg_11_1.time_ and arg_11_1.time_ <= var_14_41 + arg_14_0 and arg_11_1.var_.characterEffect4040ui_story == nil then
				arg_11_1.var_.characterEffect4040ui_story = var_14_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_42 = 0.200000002980232

			if var_14_41 <= arg_11_1.time_ and arg_11_1.time_ < var_14_41 + var_14_42 then
				local var_14_43 = (arg_11_1.time_ - var_14_41) / var_14_42

				if arg_11_1.var_.characterEffect4040ui_story then
					arg_11_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_41 + var_14_42 and arg_11_1.time_ < var_14_41 + var_14_42 + arg_14_0 and arg_11_1.var_.characterEffect4040ui_story then
				arg_11_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_14_44 = 2

			if var_14_44 < arg_11_1.time_ and arg_11_1.time_ <= var_14_44 + arg_14_0 then
				arg_11_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_14_45 = 2

			if var_14_45 < arg_11_1.time_ and arg_11_1.time_ <= var_14_45 + arg_14_0 then
				arg_11_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_46 = 0
			local var_14_47 = 0.0666666666666667

			if var_14_46 < arg_11_1.time_ and arg_11_1.time_ <= var_14_46 + arg_14_0 then
				local var_14_48 = "play"
				local var_14_49 = "music"

				arg_11_1:AudioAction(var_14_48, var_14_49, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_14_50 = 0.1
			local var_14_51 = 1

			if var_14_50 < arg_11_1.time_ and arg_11_1.time_ <= var_14_50 + arg_14_0 then
				local var_14_52 = "play"
				local var_14_53 = "music"

				arg_11_1:AudioAction(var_14_52, var_14_53, "bgm_activity_3_0_story_forbidden_space", "bgm_activity_3_0_story_forbidden_space", "bgm_activity_3_0_story_forbidden_space.awb")
			end

			if arg_11_1.frameCnt_ <= 1 then
				arg_11_1.dialog_:SetActive(false)
			end

			local var_14_54 = 2
			local var_14_55 = 0.175

			if var_14_54 < arg_11_1.time_ and arg_11_1.time_ <= var_14_54 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0

				arg_11_1.dialog_:SetActive(true)

				local var_14_56 = LeanTween.value(arg_11_1.dialog_, 0, 1, 0.3)

				var_14_56:setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
					arg_11_1.dialogCg_.alpha = arg_15_0
				end))
				var_14_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_11_1.dialog_)
					var_14_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_11_1.duration_ = arg_11_1.duration_ + 0.3

				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_57 = arg_11_1:FormatText(StoryNameCfg[668].name)

				arg_11_1.leftNameTxt_.text = var_14_57

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_58 = arg_11_1:GetWordFromCfg(319591003)
				local var_14_59 = arg_11_1:FormatText(var_14_58.content)

				arg_11_1.text_.text = var_14_59

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_60 = 7
				local var_14_61 = utf8.len(var_14_59)
				local var_14_62 = var_14_60 <= 0 and var_14_55 or var_14_55 * (var_14_61 / var_14_60)

				if var_14_62 > 0 and var_14_55 < var_14_62 then
					arg_11_1.talkMaxDuration = var_14_62
					var_14_54 = var_14_54 + 0.3

					if var_14_62 + var_14_54 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_62 + var_14_54
					end
				end

				arg_11_1.text_.text = var_14_59
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591003", "story_v_out_319591.awb") ~= 0 then
					local var_14_63 = manager.audio:GetVoiceLength("story_v_out_319591", "319591003", "story_v_out_319591.awb") / 1000

					if var_14_63 + var_14_54 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_63 + var_14_54
					end

					if var_14_58.prefab_name ~= "" and arg_11_1.actors_[var_14_58.prefab_name] ~= nil then
						local var_14_64 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_58.prefab_name].transform, "story_v_out_319591", "319591003", "story_v_out_319591.awb")

						arg_11_1:RecordAudio("319591003", var_14_64)
						arg_11_1:RecordAudio("319591003", var_14_64)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319591", "319591003", "story_v_out_319591.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319591", "319591003", "story_v_out_319591.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_65 = var_14_54 + 0.3
			local var_14_66 = math.max(var_14_55, arg_11_1.talkMaxDuration)

			if var_14_65 <= arg_11_1.time_ and arg_11_1.time_ < var_14_65 + var_14_66 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_65) / var_14_66

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_65 + var_14_66 and arg_11_1.time_ < var_14_65 + var_14_66 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319591004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 319591004
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play319591005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["4040ui_story"]
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 and arg_17_1.var_.characterEffect4040ui_story == nil then
				arg_17_1.var_.characterEffect4040ui_story = var_20_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_2 = 0.200000002980232

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2

				if arg_17_1.var_.characterEffect4040ui_story then
					local var_20_4 = Mathf.Lerp(0, 0.5, var_20_3)

					arg_17_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_17_1.var_.characterEffect4040ui_story.fillRatio = var_20_4
				end
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 and arg_17_1.var_.characterEffect4040ui_story then
				local var_20_5 = 0.5

				arg_17_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_17_1.var_.characterEffect4040ui_story.fillRatio = var_20_5
			end

			local var_20_6 = 0
			local var_20_7 = 1.25

			if var_20_6 < arg_17_1.time_ and arg_17_1.time_ <= var_20_6 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_8 = arg_17_1:GetWordFromCfg(319591004)
				local var_20_9 = arg_17_1:FormatText(var_20_8.content)

				arg_17_1.text_.text = var_20_9

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_10 = 49
				local var_20_11 = utf8.len(var_20_9)
				local var_20_12 = var_20_10 <= 0 and var_20_7 or var_20_7 * (var_20_11 / var_20_10)

				if var_20_12 > 0 and var_20_7 < var_20_12 then
					arg_17_1.talkMaxDuration = var_20_12

					if var_20_12 + var_20_6 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_12 + var_20_6
					end
				end

				arg_17_1.text_.text = var_20_9
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_13 = math.max(var_20_7, arg_17_1.talkMaxDuration)

			if var_20_6 <= arg_17_1.time_ and arg_17_1.time_ < var_20_6 + var_20_13 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_6) / var_20_13

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_6 + var_20_13 and arg_17_1.time_ < var_20_6 + var_20_13 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play319591005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 319591005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play319591006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.9

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

				local var_24_2 = arg_21_1:GetWordFromCfg(319591005)
				local var_24_3 = arg_21_1:FormatText(var_24_2.content)

				arg_21_1.text_.text = var_24_3

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_4 = 36
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
	Play319591006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 319591006
		arg_25_1.duration_ = 2.6

		local var_25_0 = {
			zh = 2,
			ja = 2.6
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
				arg_25_0:Play319591007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["4040ui_story"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and arg_25_1.var_.characterEffect4040ui_story == nil then
				arg_25_1.var_.characterEffect4040ui_story = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.200000002980232

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect4040ui_story then
					arg_25_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and arg_25_1.var_.characterEffect4040ui_story then
				arg_25_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_28_4 = 0
			local var_28_5 = 0.175

			if var_28_4 < arg_25_1.time_ and arg_25_1.time_ <= var_28_4 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_6 = arg_25_1:FormatText(StoryNameCfg[668].name)

				arg_25_1.leftNameTxt_.text = var_28_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_7 = arg_25_1:GetWordFromCfg(319591006)
				local var_28_8 = arg_25_1:FormatText(var_28_7.content)

				arg_25_1.text_.text = var_28_8

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_9 = 7
				local var_28_10 = utf8.len(var_28_8)
				local var_28_11 = var_28_9 <= 0 and var_28_5 or var_28_5 * (var_28_10 / var_28_9)

				if var_28_11 > 0 and var_28_5 < var_28_11 then
					arg_25_1.talkMaxDuration = var_28_11

					if var_28_11 + var_28_4 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_11 + var_28_4
					end
				end

				arg_25_1.text_.text = var_28_8
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591006", "story_v_out_319591.awb") ~= 0 then
					local var_28_12 = manager.audio:GetVoiceLength("story_v_out_319591", "319591006", "story_v_out_319591.awb") / 1000

					if var_28_12 + var_28_4 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_12 + var_28_4
					end

					if var_28_7.prefab_name ~= "" and arg_25_1.actors_[var_28_7.prefab_name] ~= nil then
						local var_28_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_7.prefab_name].transform, "story_v_out_319591", "319591006", "story_v_out_319591.awb")

						arg_25_1:RecordAudio("319591006", var_28_13)
						arg_25_1:RecordAudio("319591006", var_28_13)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_319591", "319591006", "story_v_out_319591.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_319591", "319591006", "story_v_out_319591.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_14 = math.max(var_28_5, arg_25_1.talkMaxDuration)

			if var_28_4 <= arg_25_1.time_ and arg_25_1.time_ < var_28_4 + var_28_14 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_4) / var_28_14

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_4 + var_28_14 and arg_25_1.time_ < var_28_4 + var_28_14 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play319591007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 319591007
		arg_29_1.duration_ = 5.5

		local var_29_0 = {
			zh = 2.7,
			ja = 5.5
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
				arg_29_0:Play319591008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = "10079ui_story"

			if arg_29_1.actors_[var_32_0] == nil then
				local var_32_1 = Object.Instantiate(Asset.Load("Char/" .. var_32_0), arg_29_1.stage_.transform)

				var_32_1.name = var_32_0
				var_32_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.actors_[var_32_0] = var_32_1

				local var_32_2 = var_32_1:GetComponentInChildren(typeof(CharacterEffect))

				var_32_2.enabled = true

				local var_32_3 = GameObjectTools.GetOrAddComponent(var_32_1, typeof(DynamicBoneHelper))

				if var_32_3 then
					var_32_3:EnableDynamicBone(false)
				end

				arg_29_1:ShowWeapon(var_32_2.transform, false)

				arg_29_1.var_[var_32_0 .. "Animator"] = var_32_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_29_1.var_[var_32_0 .. "Animator"].applyRootMotion = true
				arg_29_1.var_[var_32_0 .. "LipSync"] = var_32_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_32_4 = arg_29_1.actors_["10079ui_story"].transform
			local var_32_5 = 0

			if var_32_5 < arg_29_1.time_ and arg_29_1.time_ <= var_32_5 + arg_32_0 then
				arg_29_1.var_.moveOldPos10079ui_story = var_32_4.localPosition
			end

			local var_32_6 = 0.001

			if var_32_5 <= arg_29_1.time_ and arg_29_1.time_ < var_32_5 + var_32_6 then
				local var_32_7 = (arg_29_1.time_ - var_32_5) / var_32_6
				local var_32_8 = Vector3.New(0.7, -0.95, -6.05)

				var_32_4.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos10079ui_story, var_32_8, var_32_7)

				local var_32_9 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_9.x, var_32_9.y, var_32_9.z)

				local var_32_10 = var_32_4.localEulerAngles

				var_32_10.z = 0
				var_32_10.x = 0
				var_32_4.localEulerAngles = var_32_10
			end

			if arg_29_1.time_ >= var_32_5 + var_32_6 and arg_29_1.time_ < var_32_5 + var_32_6 + arg_32_0 then
				var_32_4.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_32_11 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_11.x, var_32_11.y, var_32_11.z)

				local var_32_12 = var_32_4.localEulerAngles

				var_32_12.z = 0
				var_32_12.x = 0
				var_32_4.localEulerAngles = var_32_12
			end

			local var_32_13 = arg_29_1.actors_["10079ui_story"]
			local var_32_14 = 0

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 and arg_29_1.var_.characterEffect10079ui_story == nil then
				arg_29_1.var_.characterEffect10079ui_story = var_32_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_15 = 0.200000002980232

			if var_32_14 <= arg_29_1.time_ and arg_29_1.time_ < var_32_14 + var_32_15 then
				local var_32_16 = (arg_29_1.time_ - var_32_14) / var_32_15

				if arg_29_1.var_.characterEffect10079ui_story then
					arg_29_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_14 + var_32_15 and arg_29_1.time_ < var_32_14 + var_32_15 + arg_32_0 and arg_29_1.var_.characterEffect10079ui_story then
				arg_29_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_32_17 = 0

			if var_32_17 < arg_29_1.time_ and arg_29_1.time_ <= var_32_17 + arg_32_0 then
				arg_29_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_32_18 = 0

			if var_32_18 < arg_29_1.time_ and arg_29_1.time_ <= var_32_18 + arg_32_0 then
				arg_29_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_32_19 = arg_29_1.actors_["4040ui_story"].transform
			local var_32_20 = 0

			if var_32_20 < arg_29_1.time_ and arg_29_1.time_ <= var_32_20 + arg_32_0 then
				arg_29_1.var_.moveOldPos4040ui_story = var_32_19.localPosition
			end

			local var_32_21 = 0.001

			if var_32_20 <= arg_29_1.time_ and arg_29_1.time_ < var_32_20 + var_32_21 then
				local var_32_22 = (arg_29_1.time_ - var_32_20) / var_32_21
				local var_32_23 = Vector3.New(-0.7, -1.55, -5.5)

				var_32_19.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos4040ui_story, var_32_23, var_32_22)

				local var_32_24 = manager.ui.mainCamera.transform.position - var_32_19.position

				var_32_19.forward = Vector3.New(var_32_24.x, var_32_24.y, var_32_24.z)

				local var_32_25 = var_32_19.localEulerAngles

				var_32_25.z = 0
				var_32_25.x = 0
				var_32_19.localEulerAngles = var_32_25
			end

			if arg_29_1.time_ >= var_32_20 + var_32_21 and arg_29_1.time_ < var_32_20 + var_32_21 + arg_32_0 then
				var_32_19.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_32_26 = manager.ui.mainCamera.transform.position - var_32_19.position

				var_32_19.forward = Vector3.New(var_32_26.x, var_32_26.y, var_32_26.z)

				local var_32_27 = var_32_19.localEulerAngles

				var_32_27.z = 0
				var_32_27.x = 0
				var_32_19.localEulerAngles = var_32_27
			end

			local var_32_28 = arg_29_1.actors_["4040ui_story"]
			local var_32_29 = 0

			if var_32_29 < arg_29_1.time_ and arg_29_1.time_ <= var_32_29 + arg_32_0 and arg_29_1.var_.characterEffect4040ui_story == nil then
				arg_29_1.var_.characterEffect4040ui_story = var_32_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_30 = 0.200000002980232

			if var_32_29 <= arg_29_1.time_ and arg_29_1.time_ < var_32_29 + var_32_30 then
				local var_32_31 = (arg_29_1.time_ - var_32_29) / var_32_30

				if arg_29_1.var_.characterEffect4040ui_story then
					local var_32_32 = Mathf.Lerp(0, 0.5, var_32_31)

					arg_29_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_29_1.var_.characterEffect4040ui_story.fillRatio = var_32_32
				end
			end

			if arg_29_1.time_ >= var_32_29 + var_32_30 and arg_29_1.time_ < var_32_29 + var_32_30 + arg_32_0 and arg_29_1.var_.characterEffect4040ui_story then
				local var_32_33 = 0.5

				arg_29_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_29_1.var_.characterEffect4040ui_story.fillRatio = var_32_33
			end

			local var_32_34 = 0
			local var_32_35 = 0.225

			if var_32_34 < arg_29_1.time_ and arg_29_1.time_ <= var_32_34 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_36 = arg_29_1:FormatText(StoryNameCfg[6].name)

				arg_29_1.leftNameTxt_.text = var_32_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_37 = arg_29_1:GetWordFromCfg(319591007)
				local var_32_38 = arg_29_1:FormatText(var_32_37.content)

				arg_29_1.text_.text = var_32_38

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_39 = 9
				local var_32_40 = utf8.len(var_32_38)
				local var_32_41 = var_32_39 <= 0 and var_32_35 or var_32_35 * (var_32_40 / var_32_39)

				if var_32_41 > 0 and var_32_35 < var_32_41 then
					arg_29_1.talkMaxDuration = var_32_41

					if var_32_41 + var_32_34 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_41 + var_32_34
					end
				end

				arg_29_1.text_.text = var_32_38
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591007", "story_v_out_319591.awb") ~= 0 then
					local var_32_42 = manager.audio:GetVoiceLength("story_v_out_319591", "319591007", "story_v_out_319591.awb") / 1000

					if var_32_42 + var_32_34 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_42 + var_32_34
					end

					if var_32_37.prefab_name ~= "" and arg_29_1.actors_[var_32_37.prefab_name] ~= nil then
						local var_32_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_37.prefab_name].transform, "story_v_out_319591", "319591007", "story_v_out_319591.awb")

						arg_29_1:RecordAudio("319591007", var_32_43)
						arg_29_1:RecordAudio("319591007", var_32_43)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_319591", "319591007", "story_v_out_319591.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_319591", "319591007", "story_v_out_319591.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_44 = math.max(var_32_35, arg_29_1.talkMaxDuration)

			if var_32_34 <= arg_29_1.time_ and arg_29_1.time_ < var_32_34 + var_32_44 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_34) / var_32_44

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_34 + var_32_44 and arg_29_1.time_ < var_32_34 + var_32_44 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play319591008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 319591008
		arg_33_1.duration_ = 8.9

		local var_33_0 = {
			zh = 5.633,
			ja = 8.9
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
				arg_33_0:Play319591009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["10079ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect10079ui_story == nil then
				arg_33_1.var_.characterEffect10079ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.200000002980232

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect10079ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_33_1.var_.characterEffect10079ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect10079ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_33_1.var_.characterEffect10079ui_story.fillRatio = var_36_5
			end

			local var_36_6 = arg_33_1.actors_["4040ui_story"]
			local var_36_7 = 0

			if var_36_7 < arg_33_1.time_ and arg_33_1.time_ <= var_36_7 + arg_36_0 and arg_33_1.var_.characterEffect4040ui_story == nil then
				arg_33_1.var_.characterEffect4040ui_story = var_36_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_8 = 0.200000002980232

			if var_36_7 <= arg_33_1.time_ and arg_33_1.time_ < var_36_7 + var_36_8 then
				local var_36_9 = (arg_33_1.time_ - var_36_7) / var_36_8

				if arg_33_1.var_.characterEffect4040ui_story then
					arg_33_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_7 + var_36_8 and arg_33_1.time_ < var_36_7 + var_36_8 + arg_36_0 and arg_33_1.var_.characterEffect4040ui_story then
				arg_33_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_36_10 = 0
			local var_36_11 = 0.525

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_12 = arg_33_1:FormatText(StoryNameCfg[668].name)

				arg_33_1.leftNameTxt_.text = var_36_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_13 = arg_33_1:GetWordFromCfg(319591008)
				local var_36_14 = arg_33_1:FormatText(var_36_13.content)

				arg_33_1.text_.text = var_36_14

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_15 = 21
				local var_36_16 = utf8.len(var_36_14)
				local var_36_17 = var_36_15 <= 0 and var_36_11 or var_36_11 * (var_36_16 / var_36_15)

				if var_36_17 > 0 and var_36_11 < var_36_17 then
					arg_33_1.talkMaxDuration = var_36_17

					if var_36_17 + var_36_10 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_17 + var_36_10
					end
				end

				arg_33_1.text_.text = var_36_14
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591008", "story_v_out_319591.awb") ~= 0 then
					local var_36_18 = manager.audio:GetVoiceLength("story_v_out_319591", "319591008", "story_v_out_319591.awb") / 1000

					if var_36_18 + var_36_10 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_18 + var_36_10
					end

					if var_36_13.prefab_name ~= "" and arg_33_1.actors_[var_36_13.prefab_name] ~= nil then
						local var_36_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_13.prefab_name].transform, "story_v_out_319591", "319591008", "story_v_out_319591.awb")

						arg_33_1:RecordAudio("319591008", var_36_19)
						arg_33_1:RecordAudio("319591008", var_36_19)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_319591", "319591008", "story_v_out_319591.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_319591", "319591008", "story_v_out_319591.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_20 = math.max(var_36_11, arg_33_1.talkMaxDuration)

			if var_36_10 <= arg_33_1.time_ and arg_33_1.time_ < var_36_10 + var_36_20 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_10) / var_36_20

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_10 + var_36_20 and arg_33_1.time_ < var_36_10 + var_36_20 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play319591009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 319591009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play319591010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["4040ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect4040ui_story == nil then
				arg_37_1.var_.characterEffect4040ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.200000002980232

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect4040ui_story then
					local var_40_4 = Mathf.Lerp(0, 0.5, var_40_3)

					arg_37_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_37_1.var_.characterEffect4040ui_story.fillRatio = var_40_4
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect4040ui_story then
				local var_40_5 = 0.5

				arg_37_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_37_1.var_.characterEffect4040ui_story.fillRatio = var_40_5
			end

			local var_40_6 = 0
			local var_40_7 = 0.625

			if var_40_6 < arg_37_1.time_ and arg_37_1.time_ <= var_40_6 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_8 = arg_37_1:GetWordFromCfg(319591009)
				local var_40_9 = arg_37_1:FormatText(var_40_8.content)

				arg_37_1.text_.text = var_40_9

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_10 = 25
				local var_40_11 = utf8.len(var_40_9)
				local var_40_12 = var_40_10 <= 0 and var_40_7 or var_40_7 * (var_40_11 / var_40_10)

				if var_40_12 > 0 and var_40_7 < var_40_12 then
					arg_37_1.talkMaxDuration = var_40_12

					if var_40_12 + var_40_6 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_12 + var_40_6
					end
				end

				arg_37_1.text_.text = var_40_9
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_13 = math.max(var_40_7, arg_37_1.talkMaxDuration)

			if var_40_6 <= arg_37_1.time_ and arg_37_1.time_ < var_40_6 + var_40_13 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_6) / var_40_13

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_6 + var_40_13 and arg_37_1.time_ < var_40_6 + var_40_13 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play319591010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 319591010
		arg_41_1.duration_ = 13.3

		local var_41_0 = {
			zh = 6.333,
			ja = 13.3
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
				arg_41_0:Play319591011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["10079ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect10079ui_story == nil then
				arg_41_1.var_.characterEffect10079ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.200000002980232

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect10079ui_story then
					arg_41_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect10079ui_story then
				arg_41_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_44_4 = 0

			if var_44_4 < arg_41_1.time_ and arg_41_1.time_ <= var_44_4 + arg_44_0 then
				arg_41_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_44_5 = 0
			local var_44_6 = 0.775

			if var_44_5 < arg_41_1.time_ and arg_41_1.time_ <= var_44_5 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_7 = arg_41_1:FormatText(StoryNameCfg[6].name)

				arg_41_1.leftNameTxt_.text = var_44_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_8 = arg_41_1:GetWordFromCfg(319591010)
				local var_44_9 = arg_41_1:FormatText(var_44_8.content)

				arg_41_1.text_.text = var_44_9

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_10 = 31
				local var_44_11 = utf8.len(var_44_9)
				local var_44_12 = var_44_10 <= 0 and var_44_6 or var_44_6 * (var_44_11 / var_44_10)

				if var_44_12 > 0 and var_44_6 < var_44_12 then
					arg_41_1.talkMaxDuration = var_44_12

					if var_44_12 + var_44_5 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_12 + var_44_5
					end
				end

				arg_41_1.text_.text = var_44_9
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591010", "story_v_out_319591.awb") ~= 0 then
					local var_44_13 = manager.audio:GetVoiceLength("story_v_out_319591", "319591010", "story_v_out_319591.awb") / 1000

					if var_44_13 + var_44_5 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_13 + var_44_5
					end

					if var_44_8.prefab_name ~= "" and arg_41_1.actors_[var_44_8.prefab_name] ~= nil then
						local var_44_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_8.prefab_name].transform, "story_v_out_319591", "319591010", "story_v_out_319591.awb")

						arg_41_1:RecordAudio("319591010", var_44_14)
						arg_41_1:RecordAudio("319591010", var_44_14)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_319591", "319591010", "story_v_out_319591.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_319591", "319591010", "story_v_out_319591.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_15 = math.max(var_44_6, arg_41_1.talkMaxDuration)

			if var_44_5 <= arg_41_1.time_ and arg_41_1.time_ < var_44_5 + var_44_15 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_5) / var_44_15

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_5 + var_44_15 and arg_41_1.time_ < var_44_5 + var_44_15 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play319591011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 319591011
		arg_45_1.duration_ = 13.266

		local var_45_0 = {
			zh = 4.066,
			ja = 13.266
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
				arg_45_0:Play319591012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["4040ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos4040ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos4040ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = arg_45_1.actors_["4040ui_story"]
			local var_48_10 = 0

			if var_48_10 < arg_45_1.time_ and arg_45_1.time_ <= var_48_10 + arg_48_0 and arg_45_1.var_.characterEffect4040ui_story == nil then
				arg_45_1.var_.characterEffect4040ui_story = var_48_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_11 = 0.200000002980232

			if var_48_10 <= arg_45_1.time_ and arg_45_1.time_ < var_48_10 + var_48_11 then
				local var_48_12 = (arg_45_1.time_ - var_48_10) / var_48_11

				if arg_45_1.var_.characterEffect4040ui_story then
					arg_45_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_10 + var_48_11 and arg_45_1.time_ < var_48_10 + var_48_11 + arg_48_0 and arg_45_1.var_.characterEffect4040ui_story then
				arg_45_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_48_13 = 0

			if var_48_13 < arg_45_1.time_ and arg_45_1.time_ <= var_48_13 + arg_48_0 then
				arg_45_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 then
				arg_45_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_48_15 = arg_45_1.actors_["10079ui_story"]
			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 and arg_45_1.var_.characterEffect10079ui_story == nil then
				arg_45_1.var_.characterEffect10079ui_story = var_48_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_17 = 0.200000002980232

			if var_48_16 <= arg_45_1.time_ and arg_45_1.time_ < var_48_16 + var_48_17 then
				local var_48_18 = (arg_45_1.time_ - var_48_16) / var_48_17

				if arg_45_1.var_.characterEffect10079ui_story then
					local var_48_19 = Mathf.Lerp(0, 0.5, var_48_18)

					arg_45_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_45_1.var_.characterEffect10079ui_story.fillRatio = var_48_19
				end
			end

			if arg_45_1.time_ >= var_48_16 + var_48_17 and arg_45_1.time_ < var_48_16 + var_48_17 + arg_48_0 and arg_45_1.var_.characterEffect10079ui_story then
				local var_48_20 = 0.5

				arg_45_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_45_1.var_.characterEffect10079ui_story.fillRatio = var_48_20
			end

			local var_48_21 = 0
			local var_48_22 = 0.525

			if var_48_21 < arg_45_1.time_ and arg_45_1.time_ <= var_48_21 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_23 = arg_45_1:FormatText(StoryNameCfg[668].name)

				arg_45_1.leftNameTxt_.text = var_48_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_24 = arg_45_1:GetWordFromCfg(319591011)
				local var_48_25 = arg_45_1:FormatText(var_48_24.content)

				arg_45_1.text_.text = var_48_25

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_26 = 21
				local var_48_27 = utf8.len(var_48_25)
				local var_48_28 = var_48_26 <= 0 and var_48_22 or var_48_22 * (var_48_27 / var_48_26)

				if var_48_28 > 0 and var_48_22 < var_48_28 then
					arg_45_1.talkMaxDuration = var_48_28

					if var_48_28 + var_48_21 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_28 + var_48_21
					end
				end

				arg_45_1.text_.text = var_48_25
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591011", "story_v_out_319591.awb") ~= 0 then
					local var_48_29 = manager.audio:GetVoiceLength("story_v_out_319591", "319591011", "story_v_out_319591.awb") / 1000

					if var_48_29 + var_48_21 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_29 + var_48_21
					end

					if var_48_24.prefab_name ~= "" and arg_45_1.actors_[var_48_24.prefab_name] ~= nil then
						local var_48_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_24.prefab_name].transform, "story_v_out_319591", "319591011", "story_v_out_319591.awb")

						arg_45_1:RecordAudio("319591011", var_48_30)
						arg_45_1:RecordAudio("319591011", var_48_30)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_319591", "319591011", "story_v_out_319591.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_319591", "319591011", "story_v_out_319591.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_31 = math.max(var_48_22, arg_45_1.talkMaxDuration)

			if var_48_21 <= arg_45_1.time_ and arg_45_1.time_ < var_48_21 + var_48_31 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_21) / var_48_31

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_21 + var_48_31 and arg_45_1.time_ < var_48_21 + var_48_31 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play319591012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 319591012
		arg_49_1.duration_ = 4.566

		local var_49_0 = {
			zh = 2.166,
			ja = 4.566
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
				arg_49_0:Play319591013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_2")
			end

			local var_52_2 = 0
			local var_52_3 = 0.2

			if var_52_2 < arg_49_1.time_ and arg_49_1.time_ <= var_52_2 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_4 = arg_49_1:FormatText(StoryNameCfg[668].name)

				arg_49_1.leftNameTxt_.text = var_52_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_5 = arg_49_1:GetWordFromCfg(319591012)
				local var_52_6 = arg_49_1:FormatText(var_52_5.content)

				arg_49_1.text_.text = var_52_6

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_7 = 8
				local var_52_8 = utf8.len(var_52_6)
				local var_52_9 = var_52_7 <= 0 and var_52_3 or var_52_3 * (var_52_8 / var_52_7)

				if var_52_9 > 0 and var_52_3 < var_52_9 then
					arg_49_1.talkMaxDuration = var_52_9

					if var_52_9 + var_52_2 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_9 + var_52_2
					end
				end

				arg_49_1.text_.text = var_52_6
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591012", "story_v_out_319591.awb") ~= 0 then
					local var_52_10 = manager.audio:GetVoiceLength("story_v_out_319591", "319591012", "story_v_out_319591.awb") / 1000

					if var_52_10 + var_52_2 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_10 + var_52_2
					end

					if var_52_5.prefab_name ~= "" and arg_49_1.actors_[var_52_5.prefab_name] ~= nil then
						local var_52_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_5.prefab_name].transform, "story_v_out_319591", "319591012", "story_v_out_319591.awb")

						arg_49_1:RecordAudio("319591012", var_52_11)
						arg_49_1:RecordAudio("319591012", var_52_11)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_319591", "319591012", "story_v_out_319591.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_319591", "319591012", "story_v_out_319591.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_12 = math.max(var_52_3, arg_49_1.talkMaxDuration)

			if var_52_2 <= arg_49_1.time_ and arg_49_1.time_ < var_52_2 + var_52_12 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_2) / var_52_12

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_2 + var_52_12 and arg_49_1.time_ < var_52_2 + var_52_12 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play319591013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319591013
		arg_53_1.duration_ = 6.233

		local var_53_0 = {
			zh = 3.3,
			ja = 6.233
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
				arg_53_0:Play319591014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["10079ui_story"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos10079ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(0.7, -0.95, -6.05)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos10079ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = arg_53_1.actors_["10079ui_story"]
			local var_56_10 = 0

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 and arg_53_1.var_.characterEffect10079ui_story == nil then
				arg_53_1.var_.characterEffect10079ui_story = var_56_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_11 = 0.200000002980232

			if var_56_10 <= arg_53_1.time_ and arg_53_1.time_ < var_56_10 + var_56_11 then
				local var_56_12 = (arg_53_1.time_ - var_56_10) / var_56_11

				if arg_53_1.var_.characterEffect10079ui_story then
					arg_53_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_10 + var_56_11 and arg_53_1.time_ < var_56_10 + var_56_11 + arg_56_0 and arg_53_1.var_.characterEffect10079ui_story then
				arg_53_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_56_13 = 0

			if var_56_13 < arg_53_1.time_ and arg_53_1.time_ <= var_56_13 + arg_56_0 then
				arg_53_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_56_14 = 0

			if var_56_14 < arg_53_1.time_ and arg_53_1.time_ <= var_56_14 + arg_56_0 then
				arg_53_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_56_15 = arg_53_1.actors_["4040ui_story"]
			local var_56_16 = 0

			if var_56_16 < arg_53_1.time_ and arg_53_1.time_ <= var_56_16 + arg_56_0 and arg_53_1.var_.characterEffect4040ui_story == nil then
				arg_53_1.var_.characterEffect4040ui_story = var_56_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_17 = 0.200000002980232

			if var_56_16 <= arg_53_1.time_ and arg_53_1.time_ < var_56_16 + var_56_17 then
				local var_56_18 = (arg_53_1.time_ - var_56_16) / var_56_17

				if arg_53_1.var_.characterEffect4040ui_story then
					local var_56_19 = Mathf.Lerp(0, 0.5, var_56_18)

					arg_53_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_53_1.var_.characterEffect4040ui_story.fillRatio = var_56_19
				end
			end

			if arg_53_1.time_ >= var_56_16 + var_56_17 and arg_53_1.time_ < var_56_16 + var_56_17 + arg_56_0 and arg_53_1.var_.characterEffect4040ui_story then
				local var_56_20 = 0.5

				arg_53_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_53_1.var_.characterEffect4040ui_story.fillRatio = var_56_20
			end

			local var_56_21 = 0
			local var_56_22 = 0.375

			if var_56_21 < arg_53_1.time_ and arg_53_1.time_ <= var_56_21 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_23 = arg_53_1:FormatText(StoryNameCfg[6].name)

				arg_53_1.leftNameTxt_.text = var_56_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_24 = arg_53_1:GetWordFromCfg(319591013)
				local var_56_25 = arg_53_1:FormatText(var_56_24.content)

				arg_53_1.text_.text = var_56_25

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_26 = 15
				local var_56_27 = utf8.len(var_56_25)
				local var_56_28 = var_56_26 <= 0 and var_56_22 or var_56_22 * (var_56_27 / var_56_26)

				if var_56_28 > 0 and var_56_22 < var_56_28 then
					arg_53_1.talkMaxDuration = var_56_28

					if var_56_28 + var_56_21 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_28 + var_56_21
					end
				end

				arg_53_1.text_.text = var_56_25
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591013", "story_v_out_319591.awb") ~= 0 then
					local var_56_29 = manager.audio:GetVoiceLength("story_v_out_319591", "319591013", "story_v_out_319591.awb") / 1000

					if var_56_29 + var_56_21 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_29 + var_56_21
					end

					if var_56_24.prefab_name ~= "" and arg_53_1.actors_[var_56_24.prefab_name] ~= nil then
						local var_56_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_24.prefab_name].transform, "story_v_out_319591", "319591013", "story_v_out_319591.awb")

						arg_53_1:RecordAudio("319591013", var_56_30)
						arg_53_1:RecordAudio("319591013", var_56_30)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_319591", "319591013", "story_v_out_319591.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_319591", "319591013", "story_v_out_319591.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_31 = math.max(var_56_22, arg_53_1.talkMaxDuration)

			if var_56_21 <= arg_53_1.time_ and arg_53_1.time_ < var_56_21 + var_56_31 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_21) / var_56_31

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_21 + var_56_31 and arg_53_1.time_ < var_56_21 + var_56_31 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play319591014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319591014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play319591015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10079ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect10079ui_story == nil then
				arg_57_1.var_.characterEffect10079ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.200000002980232

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect10079ui_story then
					local var_60_4 = Mathf.Lerp(0, 0.5, var_60_3)

					arg_57_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_57_1.var_.characterEffect10079ui_story.fillRatio = var_60_4
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect10079ui_story then
				local var_60_5 = 0.5

				arg_57_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_57_1.var_.characterEffect10079ui_story.fillRatio = var_60_5
			end

			local var_60_6 = arg_57_1.actors_["4040ui_story"].transform
			local var_60_7 = 0

			if var_60_7 < arg_57_1.time_ and arg_57_1.time_ <= var_60_7 + arg_60_0 then
				arg_57_1.var_.moveOldPos4040ui_story = var_60_6.localPosition
			end

			local var_60_8 = 0.001

			if var_60_7 <= arg_57_1.time_ and arg_57_1.time_ < var_60_7 + var_60_8 then
				local var_60_9 = (arg_57_1.time_ - var_60_7) / var_60_8
				local var_60_10 = Vector3.New(0, 100, 0)

				var_60_6.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos4040ui_story, var_60_10, var_60_9)

				local var_60_11 = manager.ui.mainCamera.transform.position - var_60_6.position

				var_60_6.forward = Vector3.New(var_60_11.x, var_60_11.y, var_60_11.z)

				local var_60_12 = var_60_6.localEulerAngles

				var_60_12.z = 0
				var_60_12.x = 0
				var_60_6.localEulerAngles = var_60_12
			end

			if arg_57_1.time_ >= var_60_7 + var_60_8 and arg_57_1.time_ < var_60_7 + var_60_8 + arg_60_0 then
				var_60_6.localPosition = Vector3.New(0, 100, 0)

				local var_60_13 = manager.ui.mainCamera.transform.position - var_60_6.position

				var_60_6.forward = Vector3.New(var_60_13.x, var_60_13.y, var_60_13.z)

				local var_60_14 = var_60_6.localEulerAngles

				var_60_14.z = 0
				var_60_14.x = 0
				var_60_6.localEulerAngles = var_60_14
			end

			local var_60_15 = arg_57_1.actors_["10079ui_story"].transform
			local var_60_16 = 0

			if var_60_16 < arg_57_1.time_ and arg_57_1.time_ <= var_60_16 + arg_60_0 then
				arg_57_1.var_.moveOldPos10079ui_story = var_60_15.localPosition
			end

			local var_60_17 = 0.001

			if var_60_16 <= arg_57_1.time_ and arg_57_1.time_ < var_60_16 + var_60_17 then
				local var_60_18 = (arg_57_1.time_ - var_60_16) / var_60_17
				local var_60_19 = Vector3.New(0, 100, 0)

				var_60_15.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10079ui_story, var_60_19, var_60_18)

				local var_60_20 = manager.ui.mainCamera.transform.position - var_60_15.position

				var_60_15.forward = Vector3.New(var_60_20.x, var_60_20.y, var_60_20.z)

				local var_60_21 = var_60_15.localEulerAngles

				var_60_21.z = 0
				var_60_21.x = 0
				var_60_15.localEulerAngles = var_60_21
			end

			if arg_57_1.time_ >= var_60_16 + var_60_17 and arg_57_1.time_ < var_60_16 + var_60_17 + arg_60_0 then
				var_60_15.localPosition = Vector3.New(0, 100, 0)

				local var_60_22 = manager.ui.mainCamera.transform.position - var_60_15.position

				var_60_15.forward = Vector3.New(var_60_22.x, var_60_22.y, var_60_22.z)

				local var_60_23 = var_60_15.localEulerAngles

				var_60_23.z = 0
				var_60_23.x = 0
				var_60_15.localEulerAngles = var_60_23
			end

			local var_60_24 = 0
			local var_60_25 = 1.325

			if var_60_24 < arg_57_1.time_ and arg_57_1.time_ <= var_60_24 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_26 = arg_57_1:GetWordFromCfg(319591014)
				local var_60_27 = arg_57_1:FormatText(var_60_26.content)

				arg_57_1.text_.text = var_60_27

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_28 = 53
				local var_60_29 = utf8.len(var_60_27)
				local var_60_30 = var_60_28 <= 0 and var_60_25 or var_60_25 * (var_60_29 / var_60_28)

				if var_60_30 > 0 and var_60_25 < var_60_30 then
					arg_57_1.talkMaxDuration = var_60_30

					if var_60_30 + var_60_24 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_30 + var_60_24
					end
				end

				arg_57_1.text_.text = var_60_27
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_31 = math.max(var_60_25, arg_57_1.talkMaxDuration)

			if var_60_24 <= arg_57_1.time_ and arg_57_1.time_ < var_60_24 + var_60_31 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_24) / var_60_31

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_24 + var_60_31 and arg_57_1.time_ < var_60_24 + var_60_31 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play319591015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319591015
		arg_61_1.duration_ = 8.56666666666667

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play319591016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = "STwhite"

			if arg_61_1.bgs_[var_64_0] == nil then
				local var_64_1 = Object.Instantiate(arg_61_1.paintGo_)

				var_64_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_64_0)
				var_64_1.name = var_64_0
				var_64_1.transform.parent = arg_61_1.stage_.transform
				var_64_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.bgs_[var_64_0] = var_64_1
			end

			local var_64_2 = 2

			if var_64_2 < arg_61_1.time_ and arg_61_1.time_ <= var_64_2 + arg_64_0 then
				local var_64_3 = manager.ui.mainCamera.transform.localPosition
				local var_64_4 = Vector3.New(0, 0, 10) + Vector3.New(var_64_3.x, var_64_3.y, 0)
				local var_64_5 = arg_61_1.bgs_.STwhite

				var_64_5.transform.localPosition = var_64_4
				var_64_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_64_6 = var_64_5:GetComponent("SpriteRenderer")

				if var_64_6 and var_64_6.sprite then
					local var_64_7 = (var_64_5.transform.localPosition - var_64_3).z
					local var_64_8 = manager.ui.mainCameraCom_
					local var_64_9 = 2 * var_64_7 * Mathf.Tan(var_64_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_64_10 = var_64_9 * var_64_8.aspect
					local var_64_11 = var_64_6.sprite.bounds.size.x
					local var_64_12 = var_64_6.sprite.bounds.size.y
					local var_64_13 = var_64_10 / var_64_11
					local var_64_14 = var_64_9 / var_64_12
					local var_64_15 = var_64_14 < var_64_13 and var_64_13 or var_64_14

					var_64_5.transform.localScale = Vector3.New(var_64_15, var_64_15, 0)
				end

				for iter_64_0, iter_64_1 in pairs(arg_61_1.bgs_) do
					if iter_64_0 ~= "STwhite" then
						iter_64_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_64_16 = 0

			if var_64_16 < arg_61_1.time_ and arg_61_1.time_ <= var_64_16 + arg_64_0 then
				arg_61_1.mask_.enabled = true
				arg_61_1.mask_.raycastTarget = true

				arg_61_1:SetGaussion(false)
			end

			local var_64_17 = 2

			if var_64_16 <= arg_61_1.time_ and arg_61_1.time_ < var_64_16 + var_64_17 then
				local var_64_18 = (arg_61_1.time_ - var_64_16) / var_64_17
				local var_64_19 = Color.New(0, 0, 0)

				var_64_19.a = Mathf.Lerp(0, 1, var_64_18)
				arg_61_1.mask_.color = var_64_19
			end

			if arg_61_1.time_ >= var_64_16 + var_64_17 and arg_61_1.time_ < var_64_16 + var_64_17 + arg_64_0 then
				local var_64_20 = Color.New(0, 0, 0)

				var_64_20.a = 1
				arg_61_1.mask_.color = var_64_20
			end

			local var_64_21 = 2

			if var_64_21 < arg_61_1.time_ and arg_61_1.time_ <= var_64_21 + arg_64_0 then
				arg_61_1.mask_.enabled = true
				arg_61_1.mask_.raycastTarget = true

				arg_61_1:SetGaussion(false)
			end

			local var_64_22 = 2

			if var_64_21 <= arg_61_1.time_ and arg_61_1.time_ < var_64_21 + var_64_22 then
				local var_64_23 = (arg_61_1.time_ - var_64_21) / var_64_22
				local var_64_24 = Color.New(0, 0, 0)

				var_64_24.a = Mathf.Lerp(1, 0, var_64_23)
				arg_61_1.mask_.color = var_64_24
			end

			if arg_61_1.time_ >= var_64_21 + var_64_22 and arg_61_1.time_ < var_64_21 + var_64_22 + arg_64_0 then
				local var_64_25 = Color.New(0, 0, 0)
				local var_64_26 = 0

				arg_61_1.mask_.enabled = false
				var_64_25.a = var_64_26
				arg_61_1.mask_.color = var_64_25
			end

			local var_64_27 = arg_61_1.actors_["10079ui_story"].transform
			local var_64_28 = 2

			if var_64_28 < arg_61_1.time_ and arg_61_1.time_ <= var_64_28 + arg_64_0 then
				arg_61_1.var_.moveOldPos10079ui_story = var_64_27.localPosition
			end

			local var_64_29 = 0.001

			if var_64_28 <= arg_61_1.time_ and arg_61_1.time_ < var_64_28 + var_64_29 then
				local var_64_30 = (arg_61_1.time_ - var_64_28) / var_64_29
				local var_64_31 = Vector3.New(0, 100, 0)

				var_64_27.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos10079ui_story, var_64_31, var_64_30)

				local var_64_32 = manager.ui.mainCamera.transform.position - var_64_27.position

				var_64_27.forward = Vector3.New(var_64_32.x, var_64_32.y, var_64_32.z)

				local var_64_33 = var_64_27.localEulerAngles

				var_64_33.z = 0
				var_64_33.x = 0
				var_64_27.localEulerAngles = var_64_33
			end

			if arg_61_1.time_ >= var_64_28 + var_64_29 and arg_61_1.time_ < var_64_28 + var_64_29 + arg_64_0 then
				var_64_27.localPosition = Vector3.New(0, 100, 0)

				local var_64_34 = manager.ui.mainCamera.transform.position - var_64_27.position

				var_64_27.forward = Vector3.New(var_64_34.x, var_64_34.y, var_64_34.z)

				local var_64_35 = var_64_27.localEulerAngles

				var_64_35.z = 0
				var_64_35.x = 0
				var_64_27.localEulerAngles = var_64_35
			end

			local var_64_36 = arg_61_1.actors_["10079ui_story"]
			local var_64_37 = 2

			if var_64_37 < arg_61_1.time_ and arg_61_1.time_ <= var_64_37 + arg_64_0 and arg_61_1.var_.characterEffect10079ui_story == nil then
				arg_61_1.var_.characterEffect10079ui_story = var_64_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_38 = 0.200000002980232

			if var_64_37 <= arg_61_1.time_ and arg_61_1.time_ < var_64_37 + var_64_38 then
				local var_64_39 = (arg_61_1.time_ - var_64_37) / var_64_38

				if arg_61_1.var_.characterEffect10079ui_story then
					local var_64_40 = Mathf.Lerp(0, 0.5, var_64_39)

					arg_61_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_61_1.var_.characterEffect10079ui_story.fillRatio = var_64_40
				end
			end

			if arg_61_1.time_ >= var_64_37 + var_64_38 and arg_61_1.time_ < var_64_37 + var_64_38 + arg_64_0 and arg_61_1.var_.characterEffect10079ui_story then
				local var_64_41 = 0.5

				arg_61_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_61_1.var_.characterEffect10079ui_story.fillRatio = var_64_41
			end

			local var_64_42 = arg_61_1.actors_["4040ui_story"].transform
			local var_64_43 = 2

			if var_64_43 < arg_61_1.time_ and arg_61_1.time_ <= var_64_43 + arg_64_0 then
				arg_61_1.var_.moveOldPos4040ui_story = var_64_42.localPosition
			end

			local var_64_44 = 0.001

			if var_64_43 <= arg_61_1.time_ and arg_61_1.time_ < var_64_43 + var_64_44 then
				local var_64_45 = (arg_61_1.time_ - var_64_43) / var_64_44
				local var_64_46 = Vector3.New(0, 100, 0)

				var_64_42.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos4040ui_story, var_64_46, var_64_45)

				local var_64_47 = manager.ui.mainCamera.transform.position - var_64_42.position

				var_64_42.forward = Vector3.New(var_64_47.x, var_64_47.y, var_64_47.z)

				local var_64_48 = var_64_42.localEulerAngles

				var_64_48.z = 0
				var_64_48.x = 0
				var_64_42.localEulerAngles = var_64_48
			end

			if arg_61_1.time_ >= var_64_43 + var_64_44 and arg_61_1.time_ < var_64_43 + var_64_44 + arg_64_0 then
				var_64_42.localPosition = Vector3.New(0, 100, 0)

				local var_64_49 = manager.ui.mainCamera.transform.position - var_64_42.position

				var_64_42.forward = Vector3.New(var_64_49.x, var_64_49.y, var_64_49.z)

				local var_64_50 = var_64_42.localEulerAngles

				var_64_50.z = 0
				var_64_50.x = 0
				var_64_42.localEulerAngles = var_64_50
			end

			local var_64_51 = arg_61_1.actors_["4040ui_story"]
			local var_64_52 = 2

			if var_64_52 < arg_61_1.time_ and arg_61_1.time_ <= var_64_52 + arg_64_0 and arg_61_1.var_.characterEffect4040ui_story == nil then
				arg_61_1.var_.characterEffect4040ui_story = var_64_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_53 = 0.200000002980232

			if var_64_52 <= arg_61_1.time_ and arg_61_1.time_ < var_64_52 + var_64_53 then
				local var_64_54 = (arg_61_1.time_ - var_64_52) / var_64_53

				if arg_61_1.var_.characterEffect4040ui_story then
					local var_64_55 = Mathf.Lerp(0, 0.5, var_64_54)

					arg_61_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_61_1.var_.characterEffect4040ui_story.fillRatio = var_64_55
				end
			end

			if arg_61_1.time_ >= var_64_52 + var_64_53 and arg_61_1.time_ < var_64_52 + var_64_53 + arg_64_0 and arg_61_1.var_.characterEffect4040ui_story then
				local var_64_56 = 0.5

				arg_61_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_61_1.var_.characterEffect4040ui_story.fillRatio = var_64_56
			end

			if arg_61_1.frameCnt_ <= 1 then
				arg_61_1.dialog_:SetActive(false)
			end

			local var_64_57 = 3.56666666666667
			local var_64_58 = 0.875

			if var_64_57 < arg_61_1.time_ and arg_61_1.time_ <= var_64_57 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				arg_61_1.dialog_:SetActive(true)

				local var_64_59 = LeanTween.value(arg_61_1.dialog_, 0, 1, 0.3)

				var_64_59:setOnUpdate(LuaHelper.FloatAction(function(arg_65_0)
					arg_61_1.dialogCg_.alpha = arg_65_0
				end))
				var_64_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_61_1.dialog_)
					var_64_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_61_1.duration_ = arg_61_1.duration_ + 0.3

				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_60 = arg_61_1:GetWordFromCfg(319591015)
				local var_64_61 = arg_61_1:FormatText(var_64_60.content)

				arg_61_1.text_.text = var_64_61

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_62 = 35
				local var_64_63 = utf8.len(var_64_61)
				local var_64_64 = var_64_62 <= 0 and var_64_58 or var_64_58 * (var_64_63 / var_64_62)

				if var_64_64 > 0 and var_64_58 < var_64_64 then
					arg_61_1.talkMaxDuration = var_64_64
					var_64_57 = var_64_57 + 0.3

					if var_64_64 + var_64_57 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_64 + var_64_57
					end
				end

				arg_61_1.text_.text = var_64_61
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_65 = var_64_57 + 0.3
			local var_64_66 = math.max(var_64_58, arg_61_1.talkMaxDuration)

			if var_64_65 <= arg_61_1.time_ and arg_61_1.time_ < var_64_65 + var_64_66 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_65) / var_64_66

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_65 + var_64_66 and arg_61_1.time_ < var_64_65 + var_64_66 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play319591016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319591016
		arg_67_1.duration_ = 7.133

		local var_67_0 = {
			zh = 6.7,
			ja = 7.133
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
				arg_67_0:Play319591017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "I10f"

			if arg_67_1.bgs_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(arg_67_1.paintGo_)

				var_70_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_70_0)
				var_70_1.name = var_70_0
				var_70_1.transform.parent = arg_67_1.stage_.transform
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.bgs_[var_70_0] = var_70_1
			end

			local var_70_2 = 2

			if var_70_2 < arg_67_1.time_ and arg_67_1.time_ <= var_70_2 + arg_70_0 then
				local var_70_3 = manager.ui.mainCamera.transform.localPosition
				local var_70_4 = Vector3.New(0, 0, 10) + Vector3.New(var_70_3.x, var_70_3.y, 0)
				local var_70_5 = arg_67_1.bgs_.I10f

				var_70_5.transform.localPosition = var_70_4
				var_70_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_6 = var_70_5:GetComponent("SpriteRenderer")

				if var_70_6 and var_70_6.sprite then
					local var_70_7 = (var_70_5.transform.localPosition - var_70_3).z
					local var_70_8 = manager.ui.mainCameraCom_
					local var_70_9 = 2 * var_70_7 * Mathf.Tan(var_70_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_10 = var_70_9 * var_70_8.aspect
					local var_70_11 = var_70_6.sprite.bounds.size.x
					local var_70_12 = var_70_6.sprite.bounds.size.y
					local var_70_13 = var_70_10 / var_70_11
					local var_70_14 = var_70_9 / var_70_12
					local var_70_15 = var_70_14 < var_70_13 and var_70_13 or var_70_14

					var_70_5.transform.localScale = Vector3.New(var_70_15, var_70_15, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "I10f" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_17 = 2

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17
				local var_70_19 = Color.New(0, 0, 0)

				var_70_19.a = Mathf.Lerp(0, 1, var_70_18)
				arg_67_1.mask_.color = var_70_19
			end

			if arg_67_1.time_ >= var_70_16 + var_70_17 and arg_67_1.time_ < var_70_16 + var_70_17 + arg_70_0 then
				local var_70_20 = Color.New(0, 0, 0)

				var_70_20.a = 1
				arg_67_1.mask_.color = var_70_20
			end

			local var_70_21 = 2

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_22 = 2

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_22 then
				local var_70_23 = (arg_67_1.time_ - var_70_21) / var_70_22
				local var_70_24 = Color.New(0, 0, 0)

				var_70_24.a = Mathf.Lerp(1, 0, var_70_23)
				arg_67_1.mask_.color = var_70_24
			end

			if arg_67_1.time_ >= var_70_21 + var_70_22 and arg_67_1.time_ < var_70_21 + var_70_22 + arg_70_0 then
				local var_70_25 = Color.New(0, 0, 0)
				local var_70_26 = 0

				arg_67_1.mask_.enabled = false
				var_70_25.a = var_70_26
				arg_67_1.mask_.color = var_70_25
			end

			local var_70_27 = "1095ui_story"

			if arg_67_1.actors_[var_70_27] == nil then
				local var_70_28 = Object.Instantiate(Asset.Load("Char/" .. var_70_27), arg_67_1.stage_.transform)

				var_70_28.name = var_70_27
				var_70_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.actors_[var_70_27] = var_70_28

				local var_70_29 = var_70_28:GetComponentInChildren(typeof(CharacterEffect))

				var_70_29.enabled = true

				local var_70_30 = GameObjectTools.GetOrAddComponent(var_70_28, typeof(DynamicBoneHelper))

				if var_70_30 then
					var_70_30:EnableDynamicBone(false)
				end

				arg_67_1:ShowWeapon(var_70_29.transform, false)

				arg_67_1.var_[var_70_27 .. "Animator"] = var_70_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_67_1.var_[var_70_27 .. "Animator"].applyRootMotion = true
				arg_67_1.var_[var_70_27 .. "LipSync"] = var_70_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_70_31 = arg_67_1.actors_["1095ui_story"].transform
			local var_70_32 = 3.86666666666667

			if var_70_32 < arg_67_1.time_ and arg_67_1.time_ <= var_70_32 + arg_70_0 then
				arg_67_1.var_.moveOldPos1095ui_story = var_70_31.localPosition
			end

			local var_70_33 = 0.001

			if var_70_32 <= arg_67_1.time_ and arg_67_1.time_ < var_70_32 + var_70_33 then
				local var_70_34 = (arg_67_1.time_ - var_70_32) / var_70_33
				local var_70_35 = Vector3.New(0, -0.98, -6.1)

				var_70_31.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1095ui_story, var_70_35, var_70_34)

				local var_70_36 = manager.ui.mainCamera.transform.position - var_70_31.position

				var_70_31.forward = Vector3.New(var_70_36.x, var_70_36.y, var_70_36.z)

				local var_70_37 = var_70_31.localEulerAngles

				var_70_37.z = 0
				var_70_37.x = 0
				var_70_31.localEulerAngles = var_70_37
			end

			if arg_67_1.time_ >= var_70_32 + var_70_33 and arg_67_1.time_ < var_70_32 + var_70_33 + arg_70_0 then
				var_70_31.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_70_38 = manager.ui.mainCamera.transform.position - var_70_31.position

				var_70_31.forward = Vector3.New(var_70_38.x, var_70_38.y, var_70_38.z)

				local var_70_39 = var_70_31.localEulerAngles

				var_70_39.z = 0
				var_70_39.x = 0
				var_70_31.localEulerAngles = var_70_39
			end

			local var_70_40 = arg_67_1.actors_["1095ui_story"]
			local var_70_41 = 3.86666666666667

			if var_70_41 < arg_67_1.time_ and arg_67_1.time_ <= var_70_41 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story == nil then
				arg_67_1.var_.characterEffect1095ui_story = var_70_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_42 = 0.200000002980232

			if var_70_41 <= arg_67_1.time_ and arg_67_1.time_ < var_70_41 + var_70_42 then
				local var_70_43 = (arg_67_1.time_ - var_70_41) / var_70_42

				if arg_67_1.var_.characterEffect1095ui_story then
					arg_67_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_41 + var_70_42 and arg_67_1.time_ < var_70_41 + var_70_42 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story then
				arg_67_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_70_44 = 3.86666666666667

			if var_70_44 < arg_67_1.time_ and arg_67_1.time_ <= var_70_44 + arg_70_0 then
				arg_67_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_70_45 = 3.86666666666667

			if var_70_45 < arg_67_1.time_ and arg_67_1.time_ <= var_70_45 + arg_70_0 then
				arg_67_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_46 = 4
			local var_70_47 = 0.25

			if var_70_46 < arg_67_1.time_ and arg_67_1.time_ <= var_70_46 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_48 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_48:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_49 = arg_67_1:FormatText(StoryNameCfg[471].name)

				arg_67_1.leftNameTxt_.text = var_70_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_50 = arg_67_1:GetWordFromCfg(319591016)
				local var_70_51 = arg_67_1:FormatText(var_70_50.content)

				arg_67_1.text_.text = var_70_51

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_52 = 10
				local var_70_53 = utf8.len(var_70_51)
				local var_70_54 = var_70_52 <= 0 and var_70_47 or var_70_47 * (var_70_53 / var_70_52)

				if var_70_54 > 0 and var_70_47 < var_70_54 then
					arg_67_1.talkMaxDuration = var_70_54
					var_70_46 = var_70_46 + 0.3

					if var_70_54 + var_70_46 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_54 + var_70_46
					end
				end

				arg_67_1.text_.text = var_70_51
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591016", "story_v_out_319591.awb") ~= 0 then
					local var_70_55 = manager.audio:GetVoiceLength("story_v_out_319591", "319591016", "story_v_out_319591.awb") / 1000

					if var_70_55 + var_70_46 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_55 + var_70_46
					end

					if var_70_50.prefab_name ~= "" and arg_67_1.actors_[var_70_50.prefab_name] ~= nil then
						local var_70_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_50.prefab_name].transform, "story_v_out_319591", "319591016", "story_v_out_319591.awb")

						arg_67_1:RecordAudio("319591016", var_70_56)
						arg_67_1:RecordAudio("319591016", var_70_56)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_319591", "319591016", "story_v_out_319591.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_319591", "319591016", "story_v_out_319591.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_57 = var_70_46 + 0.3
			local var_70_58 = math.max(var_70_47, arg_67_1.talkMaxDuration)

			if var_70_57 <= arg_67_1.time_ and arg_67_1.time_ < var_70_57 + var_70_58 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_57) / var_70_58

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_57 + var_70_58 and arg_67_1.time_ < var_70_57 + var_70_58 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319591017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319591017
		arg_73_1.duration_ = 3.2

		local var_73_0 = {
			zh = 1.999999999999,
			ja = 3.2
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
				arg_73_0:Play319591018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10079ui_story"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos10079ui_story = var_76_0.localPosition
			end

			local var_76_2 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2
				local var_76_4 = Vector3.New(0.7, -0.95, -6.05)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos10079ui_story, var_76_4, var_76_3)

				local var_76_5 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_5.x, var_76_5.y, var_76_5.z)

				local var_76_6 = var_76_0.localEulerAngles

				var_76_6.z = 0
				var_76_6.x = 0
				var_76_0.localEulerAngles = var_76_6
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_76_7 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_7.x, var_76_7.y, var_76_7.z)

				local var_76_8 = var_76_0.localEulerAngles

				var_76_8.z = 0
				var_76_8.x = 0
				var_76_0.localEulerAngles = var_76_8
			end

			local var_76_9 = arg_73_1.actors_["10079ui_story"]
			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 and arg_73_1.var_.characterEffect10079ui_story == nil then
				arg_73_1.var_.characterEffect10079ui_story = var_76_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_11 = 0.200000002980232

			if var_76_10 <= arg_73_1.time_ and arg_73_1.time_ < var_76_10 + var_76_11 then
				local var_76_12 = (arg_73_1.time_ - var_76_10) / var_76_11

				if arg_73_1.var_.characterEffect10079ui_story then
					arg_73_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_10 + var_76_11 and arg_73_1.time_ < var_76_10 + var_76_11 + arg_76_0 and arg_73_1.var_.characterEffect10079ui_story then
				arg_73_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_76_13 = 0

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 then
				arg_73_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_76_15 = arg_73_1.actors_["1095ui_story"].transform
			local var_76_16 = 0

			if var_76_16 < arg_73_1.time_ and arg_73_1.time_ <= var_76_16 + arg_76_0 then
				arg_73_1.var_.moveOldPos1095ui_story = var_76_15.localPosition
			end

			local var_76_17 = 0.001

			if var_76_16 <= arg_73_1.time_ and arg_73_1.time_ < var_76_16 + var_76_17 then
				local var_76_18 = (arg_73_1.time_ - var_76_16) / var_76_17
				local var_76_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_76_15.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1095ui_story, var_76_19, var_76_18)

				local var_76_20 = manager.ui.mainCamera.transform.position - var_76_15.position

				var_76_15.forward = Vector3.New(var_76_20.x, var_76_20.y, var_76_20.z)

				local var_76_21 = var_76_15.localEulerAngles

				var_76_21.z = 0
				var_76_21.x = 0
				var_76_15.localEulerAngles = var_76_21
			end

			if arg_73_1.time_ >= var_76_16 + var_76_17 and arg_73_1.time_ < var_76_16 + var_76_17 + arg_76_0 then
				var_76_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_76_22 = manager.ui.mainCamera.transform.position - var_76_15.position

				var_76_15.forward = Vector3.New(var_76_22.x, var_76_22.y, var_76_22.z)

				local var_76_23 = var_76_15.localEulerAngles

				var_76_23.z = 0
				var_76_23.x = 0
				var_76_15.localEulerAngles = var_76_23
			end

			local var_76_24 = arg_73_1.actors_["1095ui_story"]
			local var_76_25 = 0

			if var_76_25 < arg_73_1.time_ and arg_73_1.time_ <= var_76_25 + arg_76_0 and arg_73_1.var_.characterEffect1095ui_story == nil then
				arg_73_1.var_.characterEffect1095ui_story = var_76_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_26 = 0.200000002980232

			if var_76_25 <= arg_73_1.time_ and arg_73_1.time_ < var_76_25 + var_76_26 then
				local var_76_27 = (arg_73_1.time_ - var_76_25) / var_76_26

				if arg_73_1.var_.characterEffect1095ui_story then
					local var_76_28 = Mathf.Lerp(0, 0.5, var_76_27)

					arg_73_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1095ui_story.fillRatio = var_76_28
				end
			end

			if arg_73_1.time_ >= var_76_25 + var_76_26 and arg_73_1.time_ < var_76_25 + var_76_26 + arg_76_0 and arg_73_1.var_.characterEffect1095ui_story then
				local var_76_29 = 0.5

				arg_73_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1095ui_story.fillRatio = var_76_29
			end

			local var_76_30 = 0
			local var_76_31 = 0.125

			if var_76_30 < arg_73_1.time_ and arg_73_1.time_ <= var_76_30 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_32 = arg_73_1:FormatText(StoryNameCfg[6].name)

				arg_73_1.leftNameTxt_.text = var_76_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_33 = arg_73_1:GetWordFromCfg(319591017)
				local var_76_34 = arg_73_1:FormatText(var_76_33.content)

				arg_73_1.text_.text = var_76_34

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_35 = 5
				local var_76_36 = utf8.len(var_76_34)
				local var_76_37 = var_76_35 <= 0 and var_76_31 or var_76_31 * (var_76_36 / var_76_35)

				if var_76_37 > 0 and var_76_31 < var_76_37 then
					arg_73_1.talkMaxDuration = var_76_37

					if var_76_37 + var_76_30 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_37 + var_76_30
					end
				end

				arg_73_1.text_.text = var_76_34
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591017", "story_v_out_319591.awb") ~= 0 then
					local var_76_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591017", "story_v_out_319591.awb") / 1000

					if var_76_38 + var_76_30 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_38 + var_76_30
					end

					if var_76_33.prefab_name ~= "" and arg_73_1.actors_[var_76_33.prefab_name] ~= nil then
						local var_76_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_33.prefab_name].transform, "story_v_out_319591", "319591017", "story_v_out_319591.awb")

						arg_73_1:RecordAudio("319591017", var_76_39)
						arg_73_1:RecordAudio("319591017", var_76_39)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_319591", "319591017", "story_v_out_319591.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_319591", "319591017", "story_v_out_319591.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_40 = math.max(var_76_31, arg_73_1.talkMaxDuration)

			if var_76_30 <= arg_73_1.time_ and arg_73_1.time_ < var_76_30 + var_76_40 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_30) / var_76_40

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_30 + var_76_40 and arg_73_1.time_ < var_76_30 + var_76_40 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play319591018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319591018
		arg_77_1.duration_ = 6.4

		local var_77_0 = {
			zh = 6.4,
			ja = 4.5
		}
		local var_77_1 = manager.audio:GetLocalizationFlag()

		if var_77_0[var_77_1] ~= nil then
			arg_77_1.duration_ = var_77_0[var_77_1]
		end

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play319591019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["4040ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos4040ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(0, -1.55, -5.5)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos4040ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = arg_77_1.actors_["4040ui_story"]
			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 and arg_77_1.var_.characterEffect4040ui_story == nil then
				arg_77_1.var_.characterEffect4040ui_story = var_80_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_11 = 0.200000002980232

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_10) / var_80_11

				if arg_77_1.var_.characterEffect4040ui_story then
					arg_77_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_10 + var_80_11 and arg_77_1.time_ < var_80_10 + var_80_11 + arg_80_0 and arg_77_1.var_.characterEffect4040ui_story then
				arg_77_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_80_13 = 0

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_80_15 = arg_77_1.actors_["10079ui_story"].transform
			local var_80_16 = 0

			if var_80_16 < arg_77_1.time_ and arg_77_1.time_ <= var_80_16 + arg_80_0 then
				arg_77_1.var_.moveOldPos10079ui_story = var_80_15.localPosition
			end

			local var_80_17 = 0.001

			if var_80_16 <= arg_77_1.time_ and arg_77_1.time_ < var_80_16 + var_80_17 then
				local var_80_18 = (arg_77_1.time_ - var_80_16) / var_80_17
				local var_80_19 = Vector3.New(0, 100, 0)

				var_80_15.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10079ui_story, var_80_19, var_80_18)

				local var_80_20 = manager.ui.mainCamera.transform.position - var_80_15.position

				var_80_15.forward = Vector3.New(var_80_20.x, var_80_20.y, var_80_20.z)

				local var_80_21 = var_80_15.localEulerAngles

				var_80_21.z = 0
				var_80_21.x = 0
				var_80_15.localEulerAngles = var_80_21
			end

			if arg_77_1.time_ >= var_80_16 + var_80_17 and arg_77_1.time_ < var_80_16 + var_80_17 + arg_80_0 then
				var_80_15.localPosition = Vector3.New(0, 100, 0)

				local var_80_22 = manager.ui.mainCamera.transform.position - var_80_15.position

				var_80_15.forward = Vector3.New(var_80_22.x, var_80_22.y, var_80_22.z)

				local var_80_23 = var_80_15.localEulerAngles

				var_80_23.z = 0
				var_80_23.x = 0
				var_80_15.localEulerAngles = var_80_23
			end

			local var_80_24 = arg_77_1.actors_["10079ui_story"]
			local var_80_25 = 0

			if var_80_25 < arg_77_1.time_ and arg_77_1.time_ <= var_80_25 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story == nil then
				arg_77_1.var_.characterEffect10079ui_story = var_80_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_26 = 0.200000002980232

			if var_80_25 <= arg_77_1.time_ and arg_77_1.time_ < var_80_25 + var_80_26 then
				local var_80_27 = (arg_77_1.time_ - var_80_25) / var_80_26

				if arg_77_1.var_.characterEffect10079ui_story then
					local var_80_28 = Mathf.Lerp(0, 0.5, var_80_27)

					arg_77_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_77_1.var_.characterEffect10079ui_story.fillRatio = var_80_28
				end
			end

			if arg_77_1.time_ >= var_80_25 + var_80_26 and arg_77_1.time_ < var_80_25 + var_80_26 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story then
				local var_80_29 = 0.5

				arg_77_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_77_1.var_.characterEffect10079ui_story.fillRatio = var_80_29
			end

			local var_80_30 = arg_77_1.actors_["1095ui_story"].transform
			local var_80_31 = 0

			if var_80_31 < arg_77_1.time_ and arg_77_1.time_ <= var_80_31 + arg_80_0 then
				arg_77_1.var_.moveOldPos1095ui_story = var_80_30.localPosition
			end

			local var_80_32 = 0.001

			if var_80_31 <= arg_77_1.time_ and arg_77_1.time_ < var_80_31 + var_80_32 then
				local var_80_33 = (arg_77_1.time_ - var_80_31) / var_80_32
				local var_80_34 = Vector3.New(0, 100, 0)

				var_80_30.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1095ui_story, var_80_34, var_80_33)

				local var_80_35 = manager.ui.mainCamera.transform.position - var_80_30.position

				var_80_30.forward = Vector3.New(var_80_35.x, var_80_35.y, var_80_35.z)

				local var_80_36 = var_80_30.localEulerAngles

				var_80_36.z = 0
				var_80_36.x = 0
				var_80_30.localEulerAngles = var_80_36
			end

			if arg_77_1.time_ >= var_80_31 + var_80_32 and arg_77_1.time_ < var_80_31 + var_80_32 + arg_80_0 then
				var_80_30.localPosition = Vector3.New(0, 100, 0)

				local var_80_37 = manager.ui.mainCamera.transform.position - var_80_30.position

				var_80_30.forward = Vector3.New(var_80_37.x, var_80_37.y, var_80_37.z)

				local var_80_38 = var_80_30.localEulerAngles

				var_80_38.z = 0
				var_80_38.x = 0
				var_80_30.localEulerAngles = var_80_38
			end

			local var_80_39 = arg_77_1.actors_["1095ui_story"]
			local var_80_40 = 0

			if var_80_40 < arg_77_1.time_ and arg_77_1.time_ <= var_80_40 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story == nil then
				arg_77_1.var_.characterEffect1095ui_story = var_80_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_41 = 0.200000002980232

			if var_80_40 <= arg_77_1.time_ and arg_77_1.time_ < var_80_40 + var_80_41 then
				local var_80_42 = (arg_77_1.time_ - var_80_40) / var_80_41

				if arg_77_1.var_.characterEffect1095ui_story then
					local var_80_43 = Mathf.Lerp(0, 0.5, var_80_42)

					arg_77_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1095ui_story.fillRatio = var_80_43
				end
			end

			if arg_77_1.time_ >= var_80_40 + var_80_41 and arg_77_1.time_ < var_80_40 + var_80_41 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story then
				local var_80_44 = 0.5

				arg_77_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1095ui_story.fillRatio = var_80_44
			end

			local var_80_45 = 0
			local var_80_46 = 0.625

			if var_80_45 < arg_77_1.time_ and arg_77_1.time_ <= var_80_45 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_47 = arg_77_1:FormatText(StoryNameCfg[668].name)

				arg_77_1.leftNameTxt_.text = var_80_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_48 = arg_77_1:GetWordFromCfg(319591018)
				local var_80_49 = arg_77_1:FormatText(var_80_48.content)

				arg_77_1.text_.text = var_80_49

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_50 = 25
				local var_80_51 = utf8.len(var_80_49)
				local var_80_52 = var_80_50 <= 0 and var_80_46 or var_80_46 * (var_80_51 / var_80_50)

				if var_80_52 > 0 and var_80_46 < var_80_52 then
					arg_77_1.talkMaxDuration = var_80_52

					if var_80_52 + var_80_45 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_52 + var_80_45
					end
				end

				arg_77_1.text_.text = var_80_49
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591018", "story_v_out_319591.awb") ~= 0 then
					local var_80_53 = manager.audio:GetVoiceLength("story_v_out_319591", "319591018", "story_v_out_319591.awb") / 1000

					if var_80_53 + var_80_45 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_53 + var_80_45
					end

					if var_80_48.prefab_name ~= "" and arg_77_1.actors_[var_80_48.prefab_name] ~= nil then
						local var_80_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_48.prefab_name].transform, "story_v_out_319591", "319591018", "story_v_out_319591.awb")

						arg_77_1:RecordAudio("319591018", var_80_54)
						arg_77_1:RecordAudio("319591018", var_80_54)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_319591", "319591018", "story_v_out_319591.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_319591", "319591018", "story_v_out_319591.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_55 = math.max(var_80_46, arg_77_1.talkMaxDuration)

			if var_80_45 <= arg_77_1.time_ and arg_77_1.time_ < var_80_45 + var_80_55 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_45) / var_80_55

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_45 + var_80_55 and arg_77_1.time_ < var_80_45 + var_80_55 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319591019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319591019
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play319591020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["4040ui_story"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos4040ui_story = var_84_0.localPosition
			end

			local var_84_2 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2
				local var_84_4 = Vector3.New(0, 100, 0)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos4040ui_story, var_84_4, var_84_3)

				local var_84_5 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_5.x, var_84_5.y, var_84_5.z)

				local var_84_6 = var_84_0.localEulerAngles

				var_84_6.z = 0
				var_84_6.x = 0
				var_84_0.localEulerAngles = var_84_6
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0, 100, 0)

				local var_84_7 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_7.x, var_84_7.y, var_84_7.z)

				local var_84_8 = var_84_0.localEulerAngles

				var_84_8.z = 0
				var_84_8.x = 0
				var_84_0.localEulerAngles = var_84_8
			end

			local var_84_9 = arg_81_1.actors_["4040ui_story"]
			local var_84_10 = 0

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 and arg_81_1.var_.characterEffect4040ui_story == nil then
				arg_81_1.var_.characterEffect4040ui_story = var_84_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_11 = 0.200000002980232

			if var_84_10 <= arg_81_1.time_ and arg_81_1.time_ < var_84_10 + var_84_11 then
				local var_84_12 = (arg_81_1.time_ - var_84_10) / var_84_11

				if arg_81_1.var_.characterEffect4040ui_story then
					local var_84_13 = Mathf.Lerp(0, 0.5, var_84_12)

					arg_81_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_81_1.var_.characterEffect4040ui_story.fillRatio = var_84_13
				end
			end

			if arg_81_1.time_ >= var_84_10 + var_84_11 and arg_81_1.time_ < var_84_10 + var_84_11 + arg_84_0 and arg_81_1.var_.characterEffect4040ui_story then
				local var_84_14 = 0.5

				arg_81_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_81_1.var_.characterEffect4040ui_story.fillRatio = var_84_14
			end

			local var_84_15 = 0
			local var_84_16 = 1.4

			if var_84_15 < arg_81_1.time_ and arg_81_1.time_ <= var_84_15 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_17 = arg_81_1:GetWordFromCfg(319591019)
				local var_84_18 = arg_81_1:FormatText(var_84_17.content)

				arg_81_1.text_.text = var_84_18

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_19 = 56
				local var_84_20 = utf8.len(var_84_18)
				local var_84_21 = var_84_19 <= 0 and var_84_16 or var_84_16 * (var_84_20 / var_84_19)

				if var_84_21 > 0 and var_84_16 < var_84_21 then
					arg_81_1.talkMaxDuration = var_84_21

					if var_84_21 + var_84_15 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_21 + var_84_15
					end
				end

				arg_81_1.text_.text = var_84_18
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_22 = math.max(var_84_16, arg_81_1.talkMaxDuration)

			if var_84_15 <= arg_81_1.time_ and arg_81_1.time_ < var_84_15 + var_84_22 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_15) / var_84_22

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_15 + var_84_22 and arg_81_1.time_ < var_84_15 + var_84_22 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play319591020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 319591020
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play319591021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 1.275

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_2 = arg_85_1:GetWordFromCfg(319591020)
				local var_88_3 = arg_85_1:FormatText(var_88_2.content)

				arg_85_1.text_.text = var_88_3

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_4 = 51
				local var_88_5 = utf8.len(var_88_3)
				local var_88_6 = var_88_4 <= 0 and var_88_1 or var_88_1 * (var_88_5 / var_88_4)

				if var_88_6 > 0 and var_88_1 < var_88_6 then
					arg_85_1.talkMaxDuration = var_88_6

					if var_88_6 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_6 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_3
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_7 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_7 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_7

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_7 and arg_85_1.time_ < var_88_0 + var_88_7 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play319591021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 319591021
		arg_89_1.duration_ = 5.7

		local var_89_0 = {
			zh = 5.7,
			ja = 5.6
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
				arg_89_0:Play319591022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = "4037ui_story"

			if arg_89_1.actors_[var_92_0] == nil then
				local var_92_1 = Object.Instantiate(Asset.Load("Char/" .. var_92_0), arg_89_1.stage_.transform)

				var_92_1.name = var_92_0
				var_92_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_89_1.actors_[var_92_0] = var_92_1

				local var_92_2 = var_92_1:GetComponentInChildren(typeof(CharacterEffect))

				var_92_2.enabled = true

				local var_92_3 = GameObjectTools.GetOrAddComponent(var_92_1, typeof(DynamicBoneHelper))

				if var_92_3 then
					var_92_3:EnableDynamicBone(false)
				end

				arg_89_1:ShowWeapon(var_92_2.transform, false)

				arg_89_1.var_[var_92_0 .. "Animator"] = var_92_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_89_1.var_[var_92_0 .. "Animator"].applyRootMotion = true
				arg_89_1.var_[var_92_0 .. "LipSync"] = var_92_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_92_4 = arg_89_1.actors_["4037ui_story"].transform
			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 then
				arg_89_1.var_.moveOldPos4037ui_story = var_92_4.localPosition
			end

			local var_92_6 = 0.001

			if var_92_5 <= arg_89_1.time_ and arg_89_1.time_ < var_92_5 + var_92_6 then
				local var_92_7 = (arg_89_1.time_ - var_92_5) / var_92_6
				local var_92_8 = Vector3.New(0, -1.12, -6.2)

				var_92_4.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos4037ui_story, var_92_8, var_92_7)

				local var_92_9 = manager.ui.mainCamera.transform.position - var_92_4.position

				var_92_4.forward = Vector3.New(var_92_9.x, var_92_9.y, var_92_9.z)

				local var_92_10 = var_92_4.localEulerAngles

				var_92_10.z = 0
				var_92_10.x = 0
				var_92_4.localEulerAngles = var_92_10
			end

			if arg_89_1.time_ >= var_92_5 + var_92_6 and arg_89_1.time_ < var_92_5 + var_92_6 + arg_92_0 then
				var_92_4.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_92_11 = manager.ui.mainCamera.transform.position - var_92_4.position

				var_92_4.forward = Vector3.New(var_92_11.x, var_92_11.y, var_92_11.z)

				local var_92_12 = var_92_4.localEulerAngles

				var_92_12.z = 0
				var_92_12.x = 0
				var_92_4.localEulerAngles = var_92_12
			end

			local var_92_13 = arg_89_1.actors_["4037ui_story"]
			local var_92_14 = 0

			if var_92_14 < arg_89_1.time_ and arg_89_1.time_ <= var_92_14 + arg_92_0 and arg_89_1.var_.characterEffect4037ui_story == nil then
				arg_89_1.var_.characterEffect4037ui_story = var_92_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_15 = 0.200000002980232

			if var_92_14 <= arg_89_1.time_ and arg_89_1.time_ < var_92_14 + var_92_15 then
				local var_92_16 = (arg_89_1.time_ - var_92_14) / var_92_15

				if arg_89_1.var_.characterEffect4037ui_story then
					arg_89_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_14 + var_92_15 and arg_89_1.time_ < var_92_14 + var_92_15 + arg_92_0 and arg_89_1.var_.characterEffect4037ui_story then
				arg_89_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_92_17 = 0

			if var_92_17 < arg_89_1.time_ and arg_89_1.time_ <= var_92_17 + arg_92_0 then
				arg_89_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_92_18 = 0

			if var_92_18 < arg_89_1.time_ and arg_89_1.time_ <= var_92_18 + arg_92_0 then
				arg_89_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_92_19 = 0
			local var_92_20 = 0.425

			if var_92_19 < arg_89_1.time_ and arg_89_1.time_ <= var_92_19 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_21 = arg_89_1:FormatText(StoryNameCfg[453].name)

				arg_89_1.leftNameTxt_.text = var_92_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_22 = arg_89_1:GetWordFromCfg(319591021)
				local var_92_23 = arg_89_1:FormatText(var_92_22.content)

				arg_89_1.text_.text = var_92_23

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_24 = 17
				local var_92_25 = utf8.len(var_92_23)
				local var_92_26 = var_92_24 <= 0 and var_92_20 or var_92_20 * (var_92_25 / var_92_24)

				if var_92_26 > 0 and var_92_20 < var_92_26 then
					arg_89_1.talkMaxDuration = var_92_26

					if var_92_26 + var_92_19 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_26 + var_92_19
					end
				end

				arg_89_1.text_.text = var_92_23
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591021", "story_v_out_319591.awb") ~= 0 then
					local var_92_27 = manager.audio:GetVoiceLength("story_v_out_319591", "319591021", "story_v_out_319591.awb") / 1000

					if var_92_27 + var_92_19 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_27 + var_92_19
					end

					if var_92_22.prefab_name ~= "" and arg_89_1.actors_[var_92_22.prefab_name] ~= nil then
						local var_92_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_22.prefab_name].transform, "story_v_out_319591", "319591021", "story_v_out_319591.awb")

						arg_89_1:RecordAudio("319591021", var_92_28)
						arg_89_1:RecordAudio("319591021", var_92_28)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_319591", "319591021", "story_v_out_319591.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_319591", "319591021", "story_v_out_319591.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_29 = math.max(var_92_20, arg_89_1.talkMaxDuration)

			if var_92_19 <= arg_89_1.time_ and arg_89_1.time_ < var_92_19 + var_92_29 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_19) / var_92_29

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_19 + var_92_29 and arg_89_1.time_ < var_92_19 + var_92_29 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play319591022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 319591022
		arg_93_1.duration_ = 8.433

		local var_93_0 = {
			zh = 1.3,
			ja = 8.433
		}
		local var_93_1 = manager.audio:GetLocalizationFlag()

		if var_93_0[var_93_1] ~= nil then
			arg_93_1.duration_ = var_93_0[var_93_1]
		end

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play319591023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = "10037ui_story"

			if arg_93_1.actors_[var_96_0] == nil then
				local var_96_1 = Object.Instantiate(Asset.Load("Char/" .. var_96_0), arg_93_1.stage_.transform)

				var_96_1.name = var_96_0
				var_96_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_93_1.actors_[var_96_0] = var_96_1

				local var_96_2 = var_96_1:GetComponentInChildren(typeof(CharacterEffect))

				var_96_2.enabled = true

				local var_96_3 = GameObjectTools.GetOrAddComponent(var_96_1, typeof(DynamicBoneHelper))

				if var_96_3 then
					var_96_3:EnableDynamicBone(false)
				end

				arg_93_1:ShowWeapon(var_96_2.transform, false)

				arg_93_1.var_[var_96_0 .. "Animator"] = var_96_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_93_1.var_[var_96_0 .. "Animator"].applyRootMotion = true
				arg_93_1.var_[var_96_0 .. "LipSync"] = var_96_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_96_4 = arg_93_1.actors_["10037ui_story"].transform
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 then
				arg_93_1.var_.moveOldPos10037ui_story = var_96_4.localPosition
			end

			local var_96_6 = 0.001

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6
				local var_96_8 = Vector3.New(0.7, -1.13, -6.2)

				var_96_4.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10037ui_story, var_96_8, var_96_7)

				local var_96_9 = manager.ui.mainCamera.transform.position - var_96_4.position

				var_96_4.forward = Vector3.New(var_96_9.x, var_96_9.y, var_96_9.z)

				local var_96_10 = var_96_4.localEulerAngles

				var_96_10.z = 0
				var_96_10.x = 0
				var_96_4.localEulerAngles = var_96_10
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 then
				var_96_4.localPosition = Vector3.New(0.7, -1.13, -6.2)

				local var_96_11 = manager.ui.mainCamera.transform.position - var_96_4.position

				var_96_4.forward = Vector3.New(var_96_11.x, var_96_11.y, var_96_11.z)

				local var_96_12 = var_96_4.localEulerAngles

				var_96_12.z = 0
				var_96_12.x = 0
				var_96_4.localEulerAngles = var_96_12
			end

			local var_96_13 = arg_93_1.actors_["10037ui_story"]
			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 and arg_93_1.var_.characterEffect10037ui_story == nil then
				arg_93_1.var_.characterEffect10037ui_story = var_96_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_15 = 0.200000002980232

			if var_96_14 <= arg_93_1.time_ and arg_93_1.time_ < var_96_14 + var_96_15 then
				local var_96_16 = (arg_93_1.time_ - var_96_14) / var_96_15

				if arg_93_1.var_.characterEffect10037ui_story then
					arg_93_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_14 + var_96_15 and arg_93_1.time_ < var_96_14 + var_96_15 + arg_96_0 and arg_93_1.var_.characterEffect10037ui_story then
				arg_93_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_96_17 = 0

			if var_96_17 < arg_93_1.time_ and arg_93_1.time_ <= var_96_17 + arg_96_0 then
				arg_93_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action1_1")
			end

			local var_96_18 = 0

			if var_96_18 < arg_93_1.time_ and arg_93_1.time_ <= var_96_18 + arg_96_0 then
				arg_93_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_96_19 = arg_93_1.actors_["4037ui_story"].transform
			local var_96_20 = 0

			if var_96_20 < arg_93_1.time_ and arg_93_1.time_ <= var_96_20 + arg_96_0 then
				arg_93_1.var_.moveOldPos4037ui_story = var_96_19.localPosition
			end

			local var_96_21 = 0.001

			if var_96_20 <= arg_93_1.time_ and arg_93_1.time_ < var_96_20 + var_96_21 then
				local var_96_22 = (arg_93_1.time_ - var_96_20) / var_96_21
				local var_96_23 = Vector3.New(-0.7, -1.12, -6.2)

				var_96_19.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos4037ui_story, var_96_23, var_96_22)

				local var_96_24 = manager.ui.mainCamera.transform.position - var_96_19.position

				var_96_19.forward = Vector3.New(var_96_24.x, var_96_24.y, var_96_24.z)

				local var_96_25 = var_96_19.localEulerAngles

				var_96_25.z = 0
				var_96_25.x = 0
				var_96_19.localEulerAngles = var_96_25
			end

			if arg_93_1.time_ >= var_96_20 + var_96_21 and arg_93_1.time_ < var_96_20 + var_96_21 + arg_96_0 then
				var_96_19.localPosition = Vector3.New(-0.7, -1.12, -6.2)

				local var_96_26 = manager.ui.mainCamera.transform.position - var_96_19.position

				var_96_19.forward = Vector3.New(var_96_26.x, var_96_26.y, var_96_26.z)

				local var_96_27 = var_96_19.localEulerAngles

				var_96_27.z = 0
				var_96_27.x = 0
				var_96_19.localEulerAngles = var_96_27
			end

			local var_96_28 = arg_93_1.actors_["4037ui_story"]
			local var_96_29 = 0

			if var_96_29 < arg_93_1.time_ and arg_93_1.time_ <= var_96_29 + arg_96_0 and arg_93_1.var_.characterEffect4037ui_story == nil then
				arg_93_1.var_.characterEffect4037ui_story = var_96_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_30 = 0.200000002980232

			if var_96_29 <= arg_93_1.time_ and arg_93_1.time_ < var_96_29 + var_96_30 then
				local var_96_31 = (arg_93_1.time_ - var_96_29) / var_96_30

				if arg_93_1.var_.characterEffect4037ui_story then
					local var_96_32 = Mathf.Lerp(0, 0.5, var_96_31)

					arg_93_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_93_1.var_.characterEffect4037ui_story.fillRatio = var_96_32
				end
			end

			if arg_93_1.time_ >= var_96_29 + var_96_30 and arg_93_1.time_ < var_96_29 + var_96_30 + arg_96_0 and arg_93_1.var_.characterEffect4037ui_story then
				local var_96_33 = 0.5

				arg_93_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_93_1.var_.characterEffect4037ui_story.fillRatio = var_96_33
			end

			local var_96_34 = 0
			local var_96_35 = 0.15

			if var_96_34 < arg_93_1.time_ and arg_93_1.time_ <= var_96_34 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_36 = arg_93_1:FormatText(StoryNameCfg[383].name)

				arg_93_1.leftNameTxt_.text = var_96_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_37 = arg_93_1:GetWordFromCfg(319591022)
				local var_96_38 = arg_93_1:FormatText(var_96_37.content)

				arg_93_1.text_.text = var_96_38

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_39 = 6
				local var_96_40 = utf8.len(var_96_38)
				local var_96_41 = var_96_39 <= 0 and var_96_35 or var_96_35 * (var_96_40 / var_96_39)

				if var_96_41 > 0 and var_96_35 < var_96_41 then
					arg_93_1.talkMaxDuration = var_96_41

					if var_96_41 + var_96_34 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_41 + var_96_34
					end
				end

				arg_93_1.text_.text = var_96_38
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591022", "story_v_out_319591.awb") ~= 0 then
					local var_96_42 = manager.audio:GetVoiceLength("story_v_out_319591", "319591022", "story_v_out_319591.awb") / 1000

					if var_96_42 + var_96_34 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_42 + var_96_34
					end

					if var_96_37.prefab_name ~= "" and arg_93_1.actors_[var_96_37.prefab_name] ~= nil then
						local var_96_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_37.prefab_name].transform, "story_v_out_319591", "319591022", "story_v_out_319591.awb")

						arg_93_1:RecordAudio("319591022", var_96_43)
						arg_93_1:RecordAudio("319591022", var_96_43)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_319591", "319591022", "story_v_out_319591.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_319591", "319591022", "story_v_out_319591.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_44 = math.max(var_96_35, arg_93_1.talkMaxDuration)

			if var_96_34 <= arg_93_1.time_ and arg_93_1.time_ < var_96_34 + var_96_44 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_34) / var_96_44

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_34 + var_96_44 and arg_93_1.time_ < var_96_34 + var_96_44 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play319591023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 319591023
		arg_97_1.duration_ = 7.733

		local var_97_0 = {
			zh = 2.5,
			ja = 7.733
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
				arg_97_0:Play319591024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1095ui_story"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos1095ui_story = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(0, -0.98, -6.1)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1095ui_story, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = arg_97_1.actors_["1095ui_story"]
			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story == nil then
				arg_97_1.var_.characterEffect1095ui_story = var_100_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_11 = 0.200000002980232

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_11 then
				local var_100_12 = (arg_97_1.time_ - var_100_10) / var_100_11

				if arg_97_1.var_.characterEffect1095ui_story then
					arg_97_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_10 + var_100_11 and arg_97_1.time_ < var_100_10 + var_100_11 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story then
				arg_97_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_100_13 = 0

			if var_100_13 < arg_97_1.time_ and arg_97_1.time_ <= var_100_13 + arg_100_0 then
				arg_97_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_100_15 = arg_97_1.actors_["10037ui_story"].transform
			local var_100_16 = 0

			if var_100_16 < arg_97_1.time_ and arg_97_1.time_ <= var_100_16 + arg_100_0 then
				arg_97_1.var_.moveOldPos10037ui_story = var_100_15.localPosition
			end

			local var_100_17 = 0.001

			if var_100_16 <= arg_97_1.time_ and arg_97_1.time_ < var_100_16 + var_100_17 then
				local var_100_18 = (arg_97_1.time_ - var_100_16) / var_100_17
				local var_100_19 = Vector3.New(0, 100, 0)

				var_100_15.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos10037ui_story, var_100_19, var_100_18)

				local var_100_20 = manager.ui.mainCamera.transform.position - var_100_15.position

				var_100_15.forward = Vector3.New(var_100_20.x, var_100_20.y, var_100_20.z)

				local var_100_21 = var_100_15.localEulerAngles

				var_100_21.z = 0
				var_100_21.x = 0
				var_100_15.localEulerAngles = var_100_21
			end

			if arg_97_1.time_ >= var_100_16 + var_100_17 and arg_97_1.time_ < var_100_16 + var_100_17 + arg_100_0 then
				var_100_15.localPosition = Vector3.New(0, 100, 0)

				local var_100_22 = manager.ui.mainCamera.transform.position - var_100_15.position

				var_100_15.forward = Vector3.New(var_100_22.x, var_100_22.y, var_100_22.z)

				local var_100_23 = var_100_15.localEulerAngles

				var_100_23.z = 0
				var_100_23.x = 0
				var_100_15.localEulerAngles = var_100_23
			end

			local var_100_24 = arg_97_1.actors_["10037ui_story"]
			local var_100_25 = 0

			if var_100_25 < arg_97_1.time_ and arg_97_1.time_ <= var_100_25 + arg_100_0 and arg_97_1.var_.characterEffect10037ui_story == nil then
				arg_97_1.var_.characterEffect10037ui_story = var_100_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_26 = 0.200000002980232

			if var_100_25 <= arg_97_1.time_ and arg_97_1.time_ < var_100_25 + var_100_26 then
				local var_100_27 = (arg_97_1.time_ - var_100_25) / var_100_26

				if arg_97_1.var_.characterEffect10037ui_story then
					local var_100_28 = Mathf.Lerp(0, 0.5, var_100_27)

					arg_97_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_97_1.var_.characterEffect10037ui_story.fillRatio = var_100_28
				end
			end

			if arg_97_1.time_ >= var_100_25 + var_100_26 and arg_97_1.time_ < var_100_25 + var_100_26 + arg_100_0 and arg_97_1.var_.characterEffect10037ui_story then
				local var_100_29 = 0.5

				arg_97_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_97_1.var_.characterEffect10037ui_story.fillRatio = var_100_29
			end

			local var_100_30 = arg_97_1.actors_["4037ui_story"].transform
			local var_100_31 = 0

			if var_100_31 < arg_97_1.time_ and arg_97_1.time_ <= var_100_31 + arg_100_0 then
				arg_97_1.var_.moveOldPos4037ui_story = var_100_30.localPosition
			end

			local var_100_32 = 0.001

			if var_100_31 <= arg_97_1.time_ and arg_97_1.time_ < var_100_31 + var_100_32 then
				local var_100_33 = (arg_97_1.time_ - var_100_31) / var_100_32
				local var_100_34 = Vector3.New(0, 100, 0)

				var_100_30.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos4037ui_story, var_100_34, var_100_33)

				local var_100_35 = manager.ui.mainCamera.transform.position - var_100_30.position

				var_100_30.forward = Vector3.New(var_100_35.x, var_100_35.y, var_100_35.z)

				local var_100_36 = var_100_30.localEulerAngles

				var_100_36.z = 0
				var_100_36.x = 0
				var_100_30.localEulerAngles = var_100_36
			end

			if arg_97_1.time_ >= var_100_31 + var_100_32 and arg_97_1.time_ < var_100_31 + var_100_32 + arg_100_0 then
				var_100_30.localPosition = Vector3.New(0, 100, 0)

				local var_100_37 = manager.ui.mainCamera.transform.position - var_100_30.position

				var_100_30.forward = Vector3.New(var_100_37.x, var_100_37.y, var_100_37.z)

				local var_100_38 = var_100_30.localEulerAngles

				var_100_38.z = 0
				var_100_38.x = 0
				var_100_30.localEulerAngles = var_100_38
			end

			local var_100_39 = arg_97_1.actors_["4037ui_story"]
			local var_100_40 = 0

			if var_100_40 < arg_97_1.time_ and arg_97_1.time_ <= var_100_40 + arg_100_0 and arg_97_1.var_.characterEffect4037ui_story == nil then
				arg_97_1.var_.characterEffect4037ui_story = var_100_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_41 = 0.200000002980232

			if var_100_40 <= arg_97_1.time_ and arg_97_1.time_ < var_100_40 + var_100_41 then
				local var_100_42 = (arg_97_1.time_ - var_100_40) / var_100_41

				if arg_97_1.var_.characterEffect4037ui_story then
					local var_100_43 = Mathf.Lerp(0, 0.5, var_100_42)

					arg_97_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_97_1.var_.characterEffect4037ui_story.fillRatio = var_100_43
				end
			end

			if arg_97_1.time_ >= var_100_40 + var_100_41 and arg_97_1.time_ < var_100_40 + var_100_41 + arg_100_0 and arg_97_1.var_.characterEffect4037ui_story then
				local var_100_44 = 0.5

				arg_97_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_97_1.var_.characterEffect4037ui_story.fillRatio = var_100_44
			end

			local var_100_45 = 0
			local var_100_46 = 0.3

			if var_100_45 < arg_97_1.time_ and arg_97_1.time_ <= var_100_45 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_47 = arg_97_1:FormatText(StoryNameCfg[471].name)

				arg_97_1.leftNameTxt_.text = var_100_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_48 = arg_97_1:GetWordFromCfg(319591023)
				local var_100_49 = arg_97_1:FormatText(var_100_48.content)

				arg_97_1.text_.text = var_100_49

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_50 = 12
				local var_100_51 = utf8.len(var_100_49)
				local var_100_52 = var_100_50 <= 0 and var_100_46 or var_100_46 * (var_100_51 / var_100_50)

				if var_100_52 > 0 and var_100_46 < var_100_52 then
					arg_97_1.talkMaxDuration = var_100_52

					if var_100_52 + var_100_45 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_52 + var_100_45
					end
				end

				arg_97_1.text_.text = var_100_49
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591023", "story_v_out_319591.awb") ~= 0 then
					local var_100_53 = manager.audio:GetVoiceLength("story_v_out_319591", "319591023", "story_v_out_319591.awb") / 1000

					if var_100_53 + var_100_45 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_53 + var_100_45
					end

					if var_100_48.prefab_name ~= "" and arg_97_1.actors_[var_100_48.prefab_name] ~= nil then
						local var_100_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_48.prefab_name].transform, "story_v_out_319591", "319591023", "story_v_out_319591.awb")

						arg_97_1:RecordAudio("319591023", var_100_54)
						arg_97_1:RecordAudio("319591023", var_100_54)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_319591", "319591023", "story_v_out_319591.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_319591", "319591023", "story_v_out_319591.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_55 = math.max(var_100_46, arg_97_1.talkMaxDuration)

			if var_100_45 <= arg_97_1.time_ and arg_97_1.time_ < var_100_45 + var_100_55 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_45) / var_100_55

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_45 + var_100_55 and arg_97_1.time_ < var_100_45 + var_100_55 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play319591024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 319591024
		arg_101_1.duration_ = 3.633

		local var_101_0 = {
			zh = 2.166,
			ja = 3.633
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
				arg_101_0:Play319591025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["4040ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos4040ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0.7, -1.55, -5.5)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos4040ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["4040ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect4040ui_story == nil then
				arg_101_1.var_.characterEffect4040ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect4040ui_story then
					arg_101_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect4040ui_story then
				arg_101_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_104_13 = 0

			if var_104_13 < arg_101_1.time_ and arg_101_1.time_ <= var_104_13 + arg_104_0 then
				arg_101_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_104_14 = 0

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_104_15 = arg_101_1.actors_["1095ui_story"].transform
			local var_104_16 = 0

			if var_104_16 < arg_101_1.time_ and arg_101_1.time_ <= var_104_16 + arg_104_0 then
				arg_101_1.var_.moveOldPos1095ui_story = var_104_15.localPosition
			end

			local var_104_17 = 0.001

			if var_104_16 <= arg_101_1.time_ and arg_101_1.time_ < var_104_16 + var_104_17 then
				local var_104_18 = (arg_101_1.time_ - var_104_16) / var_104_17
				local var_104_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_104_15.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1095ui_story, var_104_19, var_104_18)

				local var_104_20 = manager.ui.mainCamera.transform.position - var_104_15.position

				var_104_15.forward = Vector3.New(var_104_20.x, var_104_20.y, var_104_20.z)

				local var_104_21 = var_104_15.localEulerAngles

				var_104_21.z = 0
				var_104_21.x = 0
				var_104_15.localEulerAngles = var_104_21
			end

			if arg_101_1.time_ >= var_104_16 + var_104_17 and arg_101_1.time_ < var_104_16 + var_104_17 + arg_104_0 then
				var_104_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_104_22 = manager.ui.mainCamera.transform.position - var_104_15.position

				var_104_15.forward = Vector3.New(var_104_22.x, var_104_22.y, var_104_22.z)

				local var_104_23 = var_104_15.localEulerAngles

				var_104_23.z = 0
				var_104_23.x = 0
				var_104_15.localEulerAngles = var_104_23
			end

			local var_104_24 = arg_101_1.actors_["1095ui_story"]
			local var_104_25 = 0

			if var_104_25 < arg_101_1.time_ and arg_101_1.time_ <= var_104_25 + arg_104_0 and arg_101_1.var_.characterEffect1095ui_story == nil then
				arg_101_1.var_.characterEffect1095ui_story = var_104_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_26 = 0.200000002980232

			if var_104_25 <= arg_101_1.time_ and arg_101_1.time_ < var_104_25 + var_104_26 then
				local var_104_27 = (arg_101_1.time_ - var_104_25) / var_104_26

				if arg_101_1.var_.characterEffect1095ui_story then
					local var_104_28 = Mathf.Lerp(0, 0.5, var_104_27)

					arg_101_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1095ui_story.fillRatio = var_104_28
				end
			end

			if arg_101_1.time_ >= var_104_25 + var_104_26 and arg_101_1.time_ < var_104_25 + var_104_26 + arg_104_0 and arg_101_1.var_.characterEffect1095ui_story then
				local var_104_29 = 0.5

				arg_101_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1095ui_story.fillRatio = var_104_29
			end

			local var_104_30 = 0
			local var_104_31 = 0.25

			if var_104_30 < arg_101_1.time_ and arg_101_1.time_ <= var_104_30 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_32 = arg_101_1:FormatText(StoryNameCfg[668].name)

				arg_101_1.leftNameTxt_.text = var_104_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_33 = arg_101_1:GetWordFromCfg(319591024)
				local var_104_34 = arg_101_1:FormatText(var_104_33.content)

				arg_101_1.text_.text = var_104_34

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_35 = 10
				local var_104_36 = utf8.len(var_104_34)
				local var_104_37 = var_104_35 <= 0 and var_104_31 or var_104_31 * (var_104_36 / var_104_35)

				if var_104_37 > 0 and var_104_31 < var_104_37 then
					arg_101_1.talkMaxDuration = var_104_37

					if var_104_37 + var_104_30 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_37 + var_104_30
					end
				end

				arg_101_1.text_.text = var_104_34
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591024", "story_v_out_319591.awb") ~= 0 then
					local var_104_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591024", "story_v_out_319591.awb") / 1000

					if var_104_38 + var_104_30 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_38 + var_104_30
					end

					if var_104_33.prefab_name ~= "" and arg_101_1.actors_[var_104_33.prefab_name] ~= nil then
						local var_104_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_33.prefab_name].transform, "story_v_out_319591", "319591024", "story_v_out_319591.awb")

						arg_101_1:RecordAudio("319591024", var_104_39)
						arg_101_1:RecordAudio("319591024", var_104_39)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_319591", "319591024", "story_v_out_319591.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_319591", "319591024", "story_v_out_319591.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_40 = math.max(var_104_31, arg_101_1.talkMaxDuration)

			if var_104_30 <= arg_101_1.time_ and arg_101_1.time_ < var_104_30 + var_104_40 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_30) / var_104_40

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_30 + var_104_40 and arg_101_1.time_ < var_104_30 + var_104_40 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play319591025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319591025
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play319591026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["4040ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect4040ui_story == nil then
				arg_105_1.var_.characterEffect4040ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect4040ui_story then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_105_1.var_.characterEffect4040ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect4040ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_105_1.var_.characterEffect4040ui_story.fillRatio = var_108_5
			end

			local var_108_6 = 0
			local var_108_7 = 0.825

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_8 = arg_105_1:GetWordFromCfg(319591025)
				local var_108_9 = arg_105_1:FormatText(var_108_8.content)

				arg_105_1.text_.text = var_108_9

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_10 = 33
				local var_108_11 = utf8.len(var_108_9)
				local var_108_12 = var_108_10 <= 0 and var_108_7 or var_108_7 * (var_108_11 / var_108_10)

				if var_108_12 > 0 and var_108_7 < var_108_12 then
					arg_105_1.talkMaxDuration = var_108_12

					if var_108_12 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_12 + var_108_6
					end
				end

				arg_105_1.text_.text = var_108_9
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_13 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_13 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_13

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_13 and arg_105_1.time_ < var_108_6 + var_108_13 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play319591026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319591026
		arg_109_1.duration_ = 4.8

		local var_109_0 = {
			zh = 3,
			ja = 4.8
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
				arg_109_0:Play319591027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["4040ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect4040ui_story == nil then
				arg_109_1.var_.characterEffect4040ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect4040ui_story then
					arg_109_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect4040ui_story then
				arg_109_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_112_4 = 0
			local var_112_5 = 0.325

			if var_112_4 < arg_109_1.time_ and arg_109_1.time_ <= var_112_4 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_6 = arg_109_1:FormatText(StoryNameCfg[668].name)

				arg_109_1.leftNameTxt_.text = var_112_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_7 = arg_109_1:GetWordFromCfg(319591026)
				local var_112_8 = arg_109_1:FormatText(var_112_7.content)

				arg_109_1.text_.text = var_112_8

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_9 = 13
				local var_112_10 = utf8.len(var_112_8)
				local var_112_11 = var_112_9 <= 0 and var_112_5 or var_112_5 * (var_112_10 / var_112_9)

				if var_112_11 > 0 and var_112_5 < var_112_11 then
					arg_109_1.talkMaxDuration = var_112_11

					if var_112_11 + var_112_4 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_11 + var_112_4
					end
				end

				arg_109_1.text_.text = var_112_8
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591026", "story_v_out_319591.awb") ~= 0 then
					local var_112_12 = manager.audio:GetVoiceLength("story_v_out_319591", "319591026", "story_v_out_319591.awb") / 1000

					if var_112_12 + var_112_4 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_12 + var_112_4
					end

					if var_112_7.prefab_name ~= "" and arg_109_1.actors_[var_112_7.prefab_name] ~= nil then
						local var_112_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_7.prefab_name].transform, "story_v_out_319591", "319591026", "story_v_out_319591.awb")

						arg_109_1:RecordAudio("319591026", var_112_13)
						arg_109_1:RecordAudio("319591026", var_112_13)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_319591", "319591026", "story_v_out_319591.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_319591", "319591026", "story_v_out_319591.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_14 = math.max(var_112_5, arg_109_1.talkMaxDuration)

			if var_112_4 <= arg_109_1.time_ and arg_109_1.time_ < var_112_4 + var_112_14 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_4) / var_112_14

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_4 + var_112_14 and arg_109_1.time_ < var_112_4 + var_112_14 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play319591027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319591027
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play319591028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["4040ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect4040ui_story == nil then
				arg_113_1.var_.characterEffect4040ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect4040ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_113_1.var_.characterEffect4040ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect4040ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_113_1.var_.characterEffect4040ui_story.fillRatio = var_116_5
			end

			local var_116_6 = arg_113_1.actors_["4040ui_story"].transform
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 then
				arg_113_1.var_.moveOldPos4040ui_story = var_116_6.localPosition
			end

			local var_116_8 = 0.001

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8
				local var_116_10 = Vector3.New(0, 100, 0)

				var_116_6.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos4040ui_story, var_116_10, var_116_9)

				local var_116_11 = manager.ui.mainCamera.transform.position - var_116_6.position

				var_116_6.forward = Vector3.New(var_116_11.x, var_116_11.y, var_116_11.z)

				local var_116_12 = var_116_6.localEulerAngles

				var_116_12.z = 0
				var_116_12.x = 0
				var_116_6.localEulerAngles = var_116_12
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 then
				var_116_6.localPosition = Vector3.New(0, 100, 0)

				local var_116_13 = manager.ui.mainCamera.transform.position - var_116_6.position

				var_116_6.forward = Vector3.New(var_116_13.x, var_116_13.y, var_116_13.z)

				local var_116_14 = var_116_6.localEulerAngles

				var_116_14.z = 0
				var_116_14.x = 0
				var_116_6.localEulerAngles = var_116_14
			end

			local var_116_15 = arg_113_1.actors_["1095ui_story"].transform
			local var_116_16 = 0

			if var_116_16 < arg_113_1.time_ and arg_113_1.time_ <= var_116_16 + arg_116_0 then
				arg_113_1.var_.moveOldPos1095ui_story = var_116_15.localPosition
			end

			local var_116_17 = 0.001

			if var_116_16 <= arg_113_1.time_ and arg_113_1.time_ < var_116_16 + var_116_17 then
				local var_116_18 = (arg_113_1.time_ - var_116_16) / var_116_17
				local var_116_19 = Vector3.New(0, 100, 0)

				var_116_15.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1095ui_story, var_116_19, var_116_18)

				local var_116_20 = manager.ui.mainCamera.transform.position - var_116_15.position

				var_116_15.forward = Vector3.New(var_116_20.x, var_116_20.y, var_116_20.z)

				local var_116_21 = var_116_15.localEulerAngles

				var_116_21.z = 0
				var_116_21.x = 0
				var_116_15.localEulerAngles = var_116_21
			end

			if arg_113_1.time_ >= var_116_16 + var_116_17 and arg_113_1.time_ < var_116_16 + var_116_17 + arg_116_0 then
				var_116_15.localPosition = Vector3.New(0, 100, 0)

				local var_116_22 = manager.ui.mainCamera.transform.position - var_116_15.position

				var_116_15.forward = Vector3.New(var_116_22.x, var_116_22.y, var_116_22.z)

				local var_116_23 = var_116_15.localEulerAngles

				var_116_23.z = 0
				var_116_23.x = 0
				var_116_15.localEulerAngles = var_116_23
			end

			local var_116_24 = 0
			local var_116_25 = 1.3

			if var_116_24 < arg_113_1.time_ and arg_113_1.time_ <= var_116_24 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_26 = arg_113_1:GetWordFromCfg(319591027)
				local var_116_27 = arg_113_1:FormatText(var_116_26.content)

				arg_113_1.text_.text = var_116_27

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_28 = 52
				local var_116_29 = utf8.len(var_116_27)
				local var_116_30 = var_116_28 <= 0 and var_116_25 or var_116_25 * (var_116_29 / var_116_28)

				if var_116_30 > 0 and var_116_25 < var_116_30 then
					arg_113_1.talkMaxDuration = var_116_30

					if var_116_30 + var_116_24 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_30 + var_116_24
					end
				end

				arg_113_1.text_.text = var_116_27
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_31 = math.max(var_116_25, arg_113_1.talkMaxDuration)

			if var_116_24 <= arg_113_1.time_ and arg_113_1.time_ < var_116_24 + var_116_31 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_24) / var_116_31

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_24 + var_116_31 and arg_113_1.time_ < var_116_24 + var_116_31 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319591028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319591028
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play319591029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 0.75

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_2 = arg_117_1:GetWordFromCfg(319591028)
				local var_120_3 = arg_117_1:FormatText(var_120_2.content)

				arg_117_1.text_.text = var_120_3

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_4 = 30
				local var_120_5 = utf8.len(var_120_3)
				local var_120_6 = var_120_4 <= 0 and var_120_1 or var_120_1 * (var_120_5 / var_120_4)

				if var_120_6 > 0 and var_120_1 < var_120_6 then
					arg_117_1.talkMaxDuration = var_120_6

					if var_120_6 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_6 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_3
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_7 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_7 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_7

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_7 and arg_117_1.time_ < var_120_0 + var_120_7 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319591029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319591029
		arg_121_1.duration_ = 4.533

		local var_121_0 = {
			zh = 2.533,
			ja = 4.533
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
				arg_121_0:Play319591030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.25

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[694].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10072")

				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(319591029)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591029", "story_v_out_319591.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_out_319591", "319591029", "story_v_out_319591.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_out_319591", "319591029", "story_v_out_319591.awb")

						arg_121_1:RecordAudio("319591029", var_124_9)
						arg_121_1:RecordAudio("319591029", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_319591", "319591029", "story_v_out_319591.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_319591", "319591029", "story_v_out_319591.awb")
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
	Play319591030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319591030
		arg_125_1.duration_ = 6.966

		local var_125_0 = {
			zh = 4.5,
			ja = 6.966
		}
		local var_125_1 = manager.audio:GetLocalizationFlag()

		if var_125_0[var_125_1] ~= nil then
			arg_125_1.duration_ = var_125_0[var_125_1]
		end

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play319591031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1095ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1095ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1095ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = arg_125_1.actors_["1095ui_story"]
			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 and arg_125_1.var_.characterEffect1095ui_story == nil then
				arg_125_1.var_.characterEffect1095ui_story = var_128_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_11 = 0.200000002980232

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_11 then
				local var_128_12 = (arg_125_1.time_ - var_128_10) / var_128_11

				if arg_125_1.var_.characterEffect1095ui_story then
					arg_125_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_10 + var_128_11 and arg_125_1.time_ < var_128_10 + var_128_11 + arg_128_0 and arg_125_1.var_.characterEffect1095ui_story then
				arg_125_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_128_13 = 0

			if var_128_13 < arg_125_1.time_ and arg_125_1.time_ <= var_128_13 + arg_128_0 then
				arg_125_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 then
				arg_125_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_128_15 = 0
			local var_128_16 = 0.475

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_17 = arg_125_1:FormatText(StoryNameCfg[471].name)

				arg_125_1.leftNameTxt_.text = var_128_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_18 = arg_125_1:GetWordFromCfg(319591030)
				local var_128_19 = arg_125_1:FormatText(var_128_18.content)

				arg_125_1.text_.text = var_128_19

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_20 = 19
				local var_128_21 = utf8.len(var_128_19)
				local var_128_22 = var_128_20 <= 0 and var_128_16 or var_128_16 * (var_128_21 / var_128_20)

				if var_128_22 > 0 and var_128_16 < var_128_22 then
					arg_125_1.talkMaxDuration = var_128_22

					if var_128_22 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_22 + var_128_15
					end
				end

				arg_125_1.text_.text = var_128_19
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591030", "story_v_out_319591.awb") ~= 0 then
					local var_128_23 = manager.audio:GetVoiceLength("story_v_out_319591", "319591030", "story_v_out_319591.awb") / 1000

					if var_128_23 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_23 + var_128_15
					end

					if var_128_18.prefab_name ~= "" and arg_125_1.actors_[var_128_18.prefab_name] ~= nil then
						local var_128_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_18.prefab_name].transform, "story_v_out_319591", "319591030", "story_v_out_319591.awb")

						arg_125_1:RecordAudio("319591030", var_128_24)
						arg_125_1:RecordAudio("319591030", var_128_24)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319591", "319591030", "story_v_out_319591.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319591", "319591030", "story_v_out_319591.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_25 = math.max(var_128_16, arg_125_1.talkMaxDuration)

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_25 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_15) / var_128_25

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_15 + var_128_25 and arg_125_1.time_ < var_128_15 + var_128_25 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319591031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319591031
		arg_129_1.duration_ = 3.2

		local var_129_0 = {
			zh = 3.2,
			ja = 3.1
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
				arg_129_0:Play319591032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1095ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story == nil then
				arg_129_1.var_.characterEffect1095ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1095ui_story then
					local var_132_4 = Mathf.Lerp(0, 0.5, var_132_3)

					arg_129_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1095ui_story.fillRatio = var_132_4
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story then
				local var_132_5 = 0.5

				arg_129_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1095ui_story.fillRatio = var_132_5
			end

			local var_132_6 = arg_129_1.actors_["4040ui_story"]
			local var_132_7 = 0

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 and arg_129_1.var_.characterEffect4040ui_story == nil then
				arg_129_1.var_.characterEffect4040ui_story = var_132_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_8 = 0.200000002980232

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_8 then
				local var_132_9 = (arg_129_1.time_ - var_132_7) / var_132_8

				if arg_129_1.var_.characterEffect4040ui_story then
					arg_129_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_7 + var_132_8 and arg_129_1.time_ < var_132_7 + var_132_8 + arg_132_0 and arg_129_1.var_.characterEffect4040ui_story then
				arg_129_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_132_10 = arg_129_1.actors_["4040ui_story"].transform
			local var_132_11 = 0

			if var_132_11 < arg_129_1.time_ and arg_129_1.time_ <= var_132_11 + arg_132_0 then
				arg_129_1.var_.moveOldPos4040ui_story = var_132_10.localPosition
			end

			local var_132_12 = 0.001

			if var_132_11 <= arg_129_1.time_ and arg_129_1.time_ < var_132_11 + var_132_12 then
				local var_132_13 = (arg_129_1.time_ - var_132_11) / var_132_12
				local var_132_14 = Vector3.New(0.7, -1.55, -5.5)

				var_132_10.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos4040ui_story, var_132_14, var_132_13)

				local var_132_15 = manager.ui.mainCamera.transform.position - var_132_10.position

				var_132_10.forward = Vector3.New(var_132_15.x, var_132_15.y, var_132_15.z)

				local var_132_16 = var_132_10.localEulerAngles

				var_132_16.z = 0
				var_132_16.x = 0
				var_132_10.localEulerAngles = var_132_16
			end

			if arg_129_1.time_ >= var_132_11 + var_132_12 and arg_129_1.time_ < var_132_11 + var_132_12 + arg_132_0 then
				var_132_10.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_132_17 = manager.ui.mainCamera.transform.position - var_132_10.position

				var_132_10.forward = Vector3.New(var_132_17.x, var_132_17.y, var_132_17.z)

				local var_132_18 = var_132_10.localEulerAngles

				var_132_18.z = 0
				var_132_18.x = 0
				var_132_10.localEulerAngles = var_132_18
			end

			local var_132_19 = 0

			if var_132_19 < arg_129_1.time_ and arg_129_1.time_ <= var_132_19 + arg_132_0 then
				arg_129_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_132_20 = 0
			local var_132_21 = 0.275

			if var_132_20 < arg_129_1.time_ and arg_129_1.time_ <= var_132_20 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_22 = arg_129_1:FormatText(StoryNameCfg[668].name)

				arg_129_1.leftNameTxt_.text = var_132_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_23 = arg_129_1:GetWordFromCfg(319591031)
				local var_132_24 = arg_129_1:FormatText(var_132_23.content)

				arg_129_1.text_.text = var_132_24

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_25 = 11
				local var_132_26 = utf8.len(var_132_24)
				local var_132_27 = var_132_25 <= 0 and var_132_21 or var_132_21 * (var_132_26 / var_132_25)

				if var_132_27 > 0 and var_132_21 < var_132_27 then
					arg_129_1.talkMaxDuration = var_132_27

					if var_132_27 + var_132_20 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_27 + var_132_20
					end
				end

				arg_129_1.text_.text = var_132_24
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591031", "story_v_out_319591.awb") ~= 0 then
					local var_132_28 = manager.audio:GetVoiceLength("story_v_out_319591", "319591031", "story_v_out_319591.awb") / 1000

					if var_132_28 + var_132_20 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_28 + var_132_20
					end

					if var_132_23.prefab_name ~= "" and arg_129_1.actors_[var_132_23.prefab_name] ~= nil then
						local var_132_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_23.prefab_name].transform, "story_v_out_319591", "319591031", "story_v_out_319591.awb")

						arg_129_1:RecordAudio("319591031", var_132_29)
						arg_129_1:RecordAudio("319591031", var_132_29)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319591", "319591031", "story_v_out_319591.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319591", "319591031", "story_v_out_319591.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_30 = math.max(var_132_21, arg_129_1.talkMaxDuration)

			if var_132_20 <= arg_129_1.time_ and arg_129_1.time_ < var_132_20 + var_132_30 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_20) / var_132_30

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_20 + var_132_30 and arg_129_1.time_ < var_132_20 + var_132_30 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319591032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319591032
		arg_133_1.duration_ = 10.3

		local var_133_0 = {
			zh = 4.1,
			ja = 10.3
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
				arg_133_0:Play319591033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_136_2 = 0
			local var_136_3 = 0.4

			if var_136_2 < arg_133_1.time_ and arg_133_1.time_ <= var_136_2 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_4 = arg_133_1:FormatText(StoryNameCfg[668].name)

				arg_133_1.leftNameTxt_.text = var_136_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_5 = arg_133_1:GetWordFromCfg(319591032)
				local var_136_6 = arg_133_1:FormatText(var_136_5.content)

				arg_133_1.text_.text = var_136_6

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_7 = 16
				local var_136_8 = utf8.len(var_136_6)
				local var_136_9 = var_136_7 <= 0 and var_136_3 or var_136_3 * (var_136_8 / var_136_7)

				if var_136_9 > 0 and var_136_3 < var_136_9 then
					arg_133_1.talkMaxDuration = var_136_9

					if var_136_9 + var_136_2 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_9 + var_136_2
					end
				end

				arg_133_1.text_.text = var_136_6
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591032", "story_v_out_319591.awb") ~= 0 then
					local var_136_10 = manager.audio:GetVoiceLength("story_v_out_319591", "319591032", "story_v_out_319591.awb") / 1000

					if var_136_10 + var_136_2 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_10 + var_136_2
					end

					if var_136_5.prefab_name ~= "" and arg_133_1.actors_[var_136_5.prefab_name] ~= nil then
						local var_136_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_5.prefab_name].transform, "story_v_out_319591", "319591032", "story_v_out_319591.awb")

						arg_133_1:RecordAudio("319591032", var_136_11)
						arg_133_1:RecordAudio("319591032", var_136_11)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319591", "319591032", "story_v_out_319591.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319591", "319591032", "story_v_out_319591.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_12 = math.max(var_136_3, arg_133_1.talkMaxDuration)

			if var_136_2 <= arg_133_1.time_ and arg_133_1.time_ < var_136_2 + var_136_12 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_2) / var_136_12

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_2 + var_136_12 and arg_133_1.time_ < var_136_2 + var_136_12 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319591033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319591033
		arg_137_1.duration_ = 8.4

		local var_137_0 = {
			zh = 4.066,
			ja = 8.4
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
				arg_137_0:Play319591034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["4040ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect4040ui_story == nil then
				arg_137_1.var_.characterEffect4040ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect4040ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_137_1.var_.characterEffect4040ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect4040ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_137_1.var_.characterEffect4040ui_story.fillRatio = var_140_5
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
					arg_137_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.characterEffect1095ui_story then
				arg_137_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_140_10 = 0
			local var_140_11 = 0.55

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_12 = arg_137_1:FormatText(StoryNameCfg[471].name)

				arg_137_1.leftNameTxt_.text = var_140_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_13 = arg_137_1:GetWordFromCfg(319591033)
				local var_140_14 = arg_137_1:FormatText(var_140_13.content)

				arg_137_1.text_.text = var_140_14

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_15 = 22
				local var_140_16 = utf8.len(var_140_14)
				local var_140_17 = var_140_15 <= 0 and var_140_11 or var_140_11 * (var_140_16 / var_140_15)

				if var_140_17 > 0 and var_140_11 < var_140_17 then
					arg_137_1.talkMaxDuration = var_140_17

					if var_140_17 + var_140_10 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_17 + var_140_10
					end
				end

				arg_137_1.text_.text = var_140_14
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591033", "story_v_out_319591.awb") ~= 0 then
					local var_140_18 = manager.audio:GetVoiceLength("story_v_out_319591", "319591033", "story_v_out_319591.awb") / 1000

					if var_140_18 + var_140_10 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_18 + var_140_10
					end

					if var_140_13.prefab_name ~= "" and arg_137_1.actors_[var_140_13.prefab_name] ~= nil then
						local var_140_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_13.prefab_name].transform, "story_v_out_319591", "319591033", "story_v_out_319591.awb")

						arg_137_1:RecordAudio("319591033", var_140_19)
						arg_137_1:RecordAudio("319591033", var_140_19)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319591", "319591033", "story_v_out_319591.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319591", "319591033", "story_v_out_319591.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_20 = math.max(var_140_11, arg_137_1.talkMaxDuration)

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_20 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_10) / var_140_20

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_10 + var_140_20 and arg_137_1.time_ < var_140_10 + var_140_20 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319591034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319591034
		arg_141_1.duration_ = 6.3

		local var_141_0 = {
			zh = 6.3,
			ja = 6.133
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
				arg_141_0:Play319591035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["4040ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect4040ui_story == nil then
				arg_141_1.var_.characterEffect4040ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect4040ui_story then
					arg_141_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect4040ui_story then
				arg_141_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_144_4 = 0

			if var_144_4 < arg_141_1.time_ and arg_141_1.time_ <= var_144_4 + arg_144_0 then
				arg_141_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_144_5 = 0

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 then
				arg_141_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
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
					local var_144_10 = Mathf.Lerp(0, 0.5, var_144_9)

					arg_141_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1095ui_story.fillRatio = var_144_10
				end
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 and arg_141_1.var_.characterEffect1095ui_story then
				local var_144_11 = 0.5

				arg_141_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1095ui_story.fillRatio = var_144_11
			end

			local var_144_12 = 0
			local var_144_13 = 0.625

			if var_144_12 < arg_141_1.time_ and arg_141_1.time_ <= var_144_12 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_14 = arg_141_1:FormatText(StoryNameCfg[668].name)

				arg_141_1.leftNameTxt_.text = var_144_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_15 = arg_141_1:GetWordFromCfg(319591034)
				local var_144_16 = arg_141_1:FormatText(var_144_15.content)

				arg_141_1.text_.text = var_144_16

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_17 = 25
				local var_144_18 = utf8.len(var_144_16)
				local var_144_19 = var_144_17 <= 0 and var_144_13 or var_144_13 * (var_144_18 / var_144_17)

				if var_144_19 > 0 and var_144_13 < var_144_19 then
					arg_141_1.talkMaxDuration = var_144_19

					if var_144_19 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_12
					end
				end

				arg_141_1.text_.text = var_144_16
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591034", "story_v_out_319591.awb") ~= 0 then
					local var_144_20 = manager.audio:GetVoiceLength("story_v_out_319591", "319591034", "story_v_out_319591.awb") / 1000

					if var_144_20 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_20 + var_144_12
					end

					if var_144_15.prefab_name ~= "" and arg_141_1.actors_[var_144_15.prefab_name] ~= nil then
						local var_144_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_15.prefab_name].transform, "story_v_out_319591", "319591034", "story_v_out_319591.awb")

						arg_141_1:RecordAudio("319591034", var_144_21)
						arg_141_1:RecordAudio("319591034", var_144_21)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319591", "319591034", "story_v_out_319591.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319591", "319591034", "story_v_out_319591.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_22 = math.max(var_144_13, arg_141_1.talkMaxDuration)

			if var_144_12 <= arg_141_1.time_ and arg_141_1.time_ < var_144_12 + var_144_22 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_12) / var_144_22

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_12 + var_144_22 and arg_141_1.time_ < var_144_12 + var_144_22 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319591035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319591035
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play319591036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["4040ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect4040ui_story == nil then
				arg_145_1.var_.characterEffect4040ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect4040ui_story then
					local var_148_4 = Mathf.Lerp(0, 0.5, var_148_3)

					arg_145_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_145_1.var_.characterEffect4040ui_story.fillRatio = var_148_4
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect4040ui_story then
				local var_148_5 = 0.5

				arg_145_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_145_1.var_.characterEffect4040ui_story.fillRatio = var_148_5
			end

			local var_148_6 = arg_145_1.actors_["1095ui_story"]
			local var_148_7 = 0

			if var_148_7 < arg_145_1.time_ and arg_145_1.time_ <= var_148_7 + arg_148_0 and arg_145_1.var_.characterEffect1095ui_story == nil then
				arg_145_1.var_.characterEffect1095ui_story = var_148_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_8 = 0.200000002980232

			if var_148_7 <= arg_145_1.time_ and arg_145_1.time_ < var_148_7 + var_148_8 then
				local var_148_9 = (arg_145_1.time_ - var_148_7) / var_148_8

				if arg_145_1.var_.characterEffect1095ui_story then
					local var_148_10 = Mathf.Lerp(0, 0.5, var_148_9)

					arg_145_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1095ui_story.fillRatio = var_148_10
				end
			end

			if arg_145_1.time_ >= var_148_7 + var_148_8 and arg_145_1.time_ < var_148_7 + var_148_8 + arg_148_0 and arg_145_1.var_.characterEffect1095ui_story then
				local var_148_11 = 0.5

				arg_145_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1095ui_story.fillRatio = var_148_11
			end

			local var_148_12 = 0
			local var_148_13 = 1

			if var_148_12 < arg_145_1.time_ and arg_145_1.time_ <= var_148_12 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_14 = arg_145_1:GetWordFromCfg(319591035)
				local var_148_15 = arg_145_1:FormatText(var_148_14.content)

				arg_145_1.text_.text = var_148_15

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_16 = 40
				local var_148_17 = utf8.len(var_148_15)
				local var_148_18 = var_148_16 <= 0 and var_148_13 or var_148_13 * (var_148_17 / var_148_16)

				if var_148_18 > 0 and var_148_13 < var_148_18 then
					arg_145_1.talkMaxDuration = var_148_18

					if var_148_18 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_18 + var_148_12
					end
				end

				arg_145_1.text_.text = var_148_15
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_19 = math.max(var_148_13, arg_145_1.talkMaxDuration)

			if var_148_12 <= arg_145_1.time_ and arg_145_1.time_ < var_148_12 + var_148_19 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_12) / var_148_19

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_12 + var_148_19 and arg_145_1.time_ < var_148_12 + var_148_19 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play319591036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319591036
		arg_149_1.duration_ = 6

		local var_149_0 = {
			zh = 3.433,
			ja = 6
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
				arg_149_0:Play319591037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["4040ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect4040ui_story == nil then
				arg_149_1.var_.characterEffect4040ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect4040ui_story then
					arg_149_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect4040ui_story then
				arg_149_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_152_4 = 0
			local var_152_5 = 0.325

			if var_152_4 < arg_149_1.time_ and arg_149_1.time_ <= var_152_4 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_6 = arg_149_1:FormatText(StoryNameCfg[668].name)

				arg_149_1.leftNameTxt_.text = var_152_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_7 = arg_149_1:GetWordFromCfg(319591036)
				local var_152_8 = arg_149_1:FormatText(var_152_7.content)

				arg_149_1.text_.text = var_152_8

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_9 = 13
				local var_152_10 = utf8.len(var_152_8)
				local var_152_11 = var_152_9 <= 0 and var_152_5 or var_152_5 * (var_152_10 / var_152_9)

				if var_152_11 > 0 and var_152_5 < var_152_11 then
					arg_149_1.talkMaxDuration = var_152_11

					if var_152_11 + var_152_4 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_11 + var_152_4
					end
				end

				arg_149_1.text_.text = var_152_8
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591036", "story_v_out_319591.awb") ~= 0 then
					local var_152_12 = manager.audio:GetVoiceLength("story_v_out_319591", "319591036", "story_v_out_319591.awb") / 1000

					if var_152_12 + var_152_4 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_12 + var_152_4
					end

					if var_152_7.prefab_name ~= "" and arg_149_1.actors_[var_152_7.prefab_name] ~= nil then
						local var_152_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_7.prefab_name].transform, "story_v_out_319591", "319591036", "story_v_out_319591.awb")

						arg_149_1:RecordAudio("319591036", var_152_13)
						arg_149_1:RecordAudio("319591036", var_152_13)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_319591", "319591036", "story_v_out_319591.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_319591", "319591036", "story_v_out_319591.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_14 = math.max(var_152_5, arg_149_1.talkMaxDuration)

			if var_152_4 <= arg_149_1.time_ and arg_149_1.time_ < var_152_4 + var_152_14 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_4) / var_152_14

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_4 + var_152_14 and arg_149_1.time_ < var_152_4 + var_152_14 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play319591037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319591037
		arg_153_1.duration_ = 2.6

		local var_153_0 = {
			zh = 1.999999999999,
			ja = 2.6
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
				arg_153_0:Play319591038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1095ui_story"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1095ui_story = var_156_0.localPosition
			end

			local var_156_2 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2
				local var_156_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1095ui_story, var_156_4, var_156_3)

				local var_156_5 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_5.x, var_156_5.y, var_156_5.z)

				local var_156_6 = var_156_0.localEulerAngles

				var_156_6.z = 0
				var_156_6.x = 0
				var_156_0.localEulerAngles = var_156_6
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_156_7 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_7.x, var_156_7.y, var_156_7.z)

				local var_156_8 = var_156_0.localEulerAngles

				var_156_8.z = 0
				var_156_8.x = 0
				var_156_0.localEulerAngles = var_156_8
			end

			local var_156_9 = arg_153_1.actors_["1095ui_story"]
			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 and arg_153_1.var_.characterEffect1095ui_story == nil then
				arg_153_1.var_.characterEffect1095ui_story = var_156_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_11 = 0.200000002980232

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_11 then
				local var_156_12 = (arg_153_1.time_ - var_156_10) / var_156_11

				if arg_153_1.var_.characterEffect1095ui_story then
					arg_153_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_10 + var_156_11 and arg_153_1.time_ < var_156_10 + var_156_11 + arg_156_0 and arg_153_1.var_.characterEffect1095ui_story then
				arg_153_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_156_13 = 0

			if var_156_13 < arg_153_1.time_ and arg_153_1.time_ <= var_156_13 + arg_156_0 then
				arg_153_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_156_14 = 0

			if var_156_14 < arg_153_1.time_ and arg_153_1.time_ <= var_156_14 + arg_156_0 then
				arg_153_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_156_15 = arg_153_1.actors_["4040ui_story"]
			local var_156_16 = 0

			if var_156_16 < arg_153_1.time_ and arg_153_1.time_ <= var_156_16 + arg_156_0 and arg_153_1.var_.characterEffect4040ui_story == nil then
				arg_153_1.var_.characterEffect4040ui_story = var_156_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_17 = 0.200000002980232

			if var_156_16 <= arg_153_1.time_ and arg_153_1.time_ < var_156_16 + var_156_17 then
				local var_156_18 = (arg_153_1.time_ - var_156_16) / var_156_17

				if arg_153_1.var_.characterEffect4040ui_story then
					local var_156_19 = Mathf.Lerp(0, 0.5, var_156_18)

					arg_153_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_153_1.var_.characterEffect4040ui_story.fillRatio = var_156_19
				end
			end

			if arg_153_1.time_ >= var_156_16 + var_156_17 and arg_153_1.time_ < var_156_16 + var_156_17 + arg_156_0 and arg_153_1.var_.characterEffect4040ui_story then
				local var_156_20 = 0.5

				arg_153_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_153_1.var_.characterEffect4040ui_story.fillRatio = var_156_20
			end

			local var_156_21 = 0
			local var_156_22 = 0.05

			if var_156_21 < arg_153_1.time_ and arg_153_1.time_ <= var_156_21 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_23 = arg_153_1:FormatText(StoryNameCfg[471].name)

				arg_153_1.leftNameTxt_.text = var_156_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_24 = arg_153_1:GetWordFromCfg(319591037)
				local var_156_25 = arg_153_1:FormatText(var_156_24.content)

				arg_153_1.text_.text = var_156_25

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_26 = 2
				local var_156_27 = utf8.len(var_156_25)
				local var_156_28 = var_156_26 <= 0 and var_156_22 or var_156_22 * (var_156_27 / var_156_26)

				if var_156_28 > 0 and var_156_22 < var_156_28 then
					arg_153_1.talkMaxDuration = var_156_28

					if var_156_28 + var_156_21 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_28 + var_156_21
					end
				end

				arg_153_1.text_.text = var_156_25
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591037", "story_v_out_319591.awb") ~= 0 then
					local var_156_29 = manager.audio:GetVoiceLength("story_v_out_319591", "319591037", "story_v_out_319591.awb") / 1000

					if var_156_29 + var_156_21 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_29 + var_156_21
					end

					if var_156_24.prefab_name ~= "" and arg_153_1.actors_[var_156_24.prefab_name] ~= nil then
						local var_156_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_24.prefab_name].transform, "story_v_out_319591", "319591037", "story_v_out_319591.awb")

						arg_153_1:RecordAudio("319591037", var_156_30)
						arg_153_1:RecordAudio("319591037", var_156_30)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_319591", "319591037", "story_v_out_319591.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_319591", "319591037", "story_v_out_319591.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_31 = math.max(var_156_22, arg_153_1.talkMaxDuration)

			if var_156_21 <= arg_153_1.time_ and arg_153_1.time_ < var_156_21 + var_156_31 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_21) / var_156_31

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_21 + var_156_31 and arg_153_1.time_ < var_156_21 + var_156_31 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319591038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319591038
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play319591039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0.5

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				local var_160_1 = manager.ui.mainCamera.transform.localPosition
				local var_160_2 = Vector3.New(0, 0, 10) + Vector3.New(var_160_1.x, var_160_1.y, 0)
				local var_160_3 = arg_157_1.bgs_.STwhite

				var_160_3.transform.localPosition = var_160_2
				var_160_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_160_4 = var_160_3:GetComponent("SpriteRenderer")

				if var_160_4 and var_160_4.sprite then
					local var_160_5 = (var_160_3.transform.localPosition - var_160_1).z
					local var_160_6 = manager.ui.mainCameraCom_
					local var_160_7 = 2 * var_160_5 * Mathf.Tan(var_160_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_160_8 = var_160_7 * var_160_6.aspect
					local var_160_9 = var_160_4.sprite.bounds.size.x
					local var_160_10 = var_160_4.sprite.bounds.size.y
					local var_160_11 = var_160_8 / var_160_9
					local var_160_12 = var_160_7 / var_160_10
					local var_160_13 = var_160_12 < var_160_11 and var_160_11 or var_160_12

					var_160_3.transform.localScale = Vector3.New(var_160_13, var_160_13, 0)
				end

				for iter_160_0, iter_160_1 in pairs(arg_157_1.bgs_) do
					if iter_160_0 ~= "STwhite" then
						iter_160_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_160_14 = arg_157_1.actors_["1095ui_story"]
			local var_160_15 = 0

			if var_160_15 < arg_157_1.time_ and arg_157_1.time_ <= var_160_15 + arg_160_0 and arg_157_1.var_.characterEffect1095ui_story == nil then
				arg_157_1.var_.characterEffect1095ui_story = var_160_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_16 = 0.200000002980232

			if var_160_15 <= arg_157_1.time_ and arg_157_1.time_ < var_160_15 + var_160_16 then
				local var_160_17 = (arg_157_1.time_ - var_160_15) / var_160_16

				if arg_157_1.var_.characterEffect1095ui_story then
					local var_160_18 = Mathf.Lerp(0, 0.5, var_160_17)

					arg_157_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1095ui_story.fillRatio = var_160_18
				end
			end

			if arg_157_1.time_ >= var_160_15 + var_160_16 and arg_157_1.time_ < var_160_15 + var_160_16 + arg_160_0 and arg_157_1.var_.characterEffect1095ui_story then
				local var_160_19 = 0.5

				arg_157_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1095ui_story.fillRatio = var_160_19
			end

			local var_160_20 = arg_157_1.actors_["1095ui_story"].transform
			local var_160_21 = 0

			if var_160_21 < arg_157_1.time_ and arg_157_1.time_ <= var_160_21 + arg_160_0 then
				arg_157_1.var_.moveOldPos1095ui_story = var_160_20.localPosition
			end

			local var_160_22 = 0.001

			if var_160_21 <= arg_157_1.time_ and arg_157_1.time_ < var_160_21 + var_160_22 then
				local var_160_23 = (arg_157_1.time_ - var_160_21) / var_160_22
				local var_160_24 = Vector3.New(0, 100, 0)

				var_160_20.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1095ui_story, var_160_24, var_160_23)

				local var_160_25 = manager.ui.mainCamera.transform.position - var_160_20.position

				var_160_20.forward = Vector3.New(var_160_25.x, var_160_25.y, var_160_25.z)

				local var_160_26 = var_160_20.localEulerAngles

				var_160_26.z = 0
				var_160_26.x = 0
				var_160_20.localEulerAngles = var_160_26
			end

			if arg_157_1.time_ >= var_160_21 + var_160_22 and arg_157_1.time_ < var_160_21 + var_160_22 + arg_160_0 then
				var_160_20.localPosition = Vector3.New(0, 100, 0)

				local var_160_27 = manager.ui.mainCamera.transform.position - var_160_20.position

				var_160_20.forward = Vector3.New(var_160_27.x, var_160_27.y, var_160_27.z)

				local var_160_28 = var_160_20.localEulerAngles

				var_160_28.z = 0
				var_160_28.x = 0
				var_160_20.localEulerAngles = var_160_28
			end

			local var_160_29 = arg_157_1.actors_["4040ui_story"].transform
			local var_160_30 = 0

			if var_160_30 < arg_157_1.time_ and arg_157_1.time_ <= var_160_30 + arg_160_0 then
				arg_157_1.var_.moveOldPos4040ui_story = var_160_29.localPosition
			end

			local var_160_31 = 0.001

			if var_160_30 <= arg_157_1.time_ and arg_157_1.time_ < var_160_30 + var_160_31 then
				local var_160_32 = (arg_157_1.time_ - var_160_30) / var_160_31
				local var_160_33 = Vector3.New(0, 100, 0)

				var_160_29.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos4040ui_story, var_160_33, var_160_32)

				local var_160_34 = manager.ui.mainCamera.transform.position - var_160_29.position

				var_160_29.forward = Vector3.New(var_160_34.x, var_160_34.y, var_160_34.z)

				local var_160_35 = var_160_29.localEulerAngles

				var_160_35.z = 0
				var_160_35.x = 0
				var_160_29.localEulerAngles = var_160_35
			end

			if arg_157_1.time_ >= var_160_30 + var_160_31 and arg_157_1.time_ < var_160_30 + var_160_31 + arg_160_0 then
				var_160_29.localPosition = Vector3.New(0, 100, 0)

				local var_160_36 = manager.ui.mainCamera.transform.position - var_160_29.position

				var_160_29.forward = Vector3.New(var_160_36.x, var_160_36.y, var_160_36.z)

				local var_160_37 = var_160_29.localEulerAngles

				var_160_37.z = 0
				var_160_37.x = 0
				var_160_29.localEulerAngles = var_160_37
			end

			local var_160_38 = 0.5

			if var_160_38 < arg_157_1.time_ and arg_157_1.time_ <= var_160_38 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = true

				arg_157_1:SetGaussion(false)
			end

			local var_160_39 = 1

			if var_160_38 <= arg_157_1.time_ and arg_157_1.time_ < var_160_38 + var_160_39 then
				local var_160_40 = (arg_157_1.time_ - var_160_38) / var_160_39
				local var_160_41 = Color.New(1, 1, 1)

				var_160_41.a = Mathf.Lerp(1, 0, var_160_40)
				arg_157_1.mask_.color = var_160_41
			end

			if arg_157_1.time_ >= var_160_38 + var_160_39 and arg_157_1.time_ < var_160_38 + var_160_39 + arg_160_0 then
				local var_160_42 = Color.New(1, 1, 1)
				local var_160_43 = 0

				arg_157_1.mask_.enabled = false
				var_160_42.a = var_160_43
				arg_157_1.mask_.color = var_160_42
			end

			local var_160_44 = arg_157_1.bgs_.I10f.transform
			local var_160_45 = 0

			if var_160_45 < arg_157_1.time_ and arg_157_1.time_ <= var_160_45 + arg_160_0 then
				arg_157_1.var_.moveOldPosI10f = var_160_44.localPosition
			end

			local var_160_46 = 0.5

			if var_160_45 <= arg_157_1.time_ and arg_157_1.time_ < var_160_45 + var_160_46 then
				local var_160_47 = (arg_157_1.time_ - var_160_45) / var_160_46
				local var_160_48 = Vector3.New(0, 1, 3)

				var_160_44.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPosI10f, var_160_48, var_160_47)
			end

			if arg_157_1.time_ >= var_160_45 + var_160_46 and arg_157_1.time_ < var_160_45 + var_160_46 + arg_160_0 then
				var_160_44.localPosition = Vector3.New(0, 1, 3)
			end

			local var_160_49 = arg_157_1.bgs_.STwhite.transform
			local var_160_50 = 0.5

			if var_160_50 < arg_157_1.time_ and arg_157_1.time_ <= var_160_50 + arg_160_0 then
				arg_157_1.var_.moveOldPosSTwhite = var_160_49.localPosition
			end

			local var_160_51 = 0.5

			if var_160_50 <= arg_157_1.time_ and arg_157_1.time_ < var_160_50 + var_160_51 then
				local var_160_52 = (arg_157_1.time_ - var_160_50) / var_160_51
				local var_160_53 = Vector3.New(0, 1, 10)

				var_160_49.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPosSTwhite, var_160_53, var_160_52)
			end

			if arg_157_1.time_ >= var_160_50 + var_160_51 and arg_157_1.time_ < var_160_50 + var_160_51 + arg_160_0 then
				var_160_49.localPosition = Vector3.New(0, 1, 10)
			end

			local var_160_54 = 0.5
			local var_160_55 = 1

			if var_160_54 < arg_157_1.time_ and arg_157_1.time_ <= var_160_54 + arg_160_0 then
				local var_160_56 = "play"
				local var_160_57 = "effect"

				arg_157_1:AudioAction(var_160_56, var_160_57, "se_story_123_01", "se_story_123_01_whoosh", "")
			end

			local var_160_58 = 0
			local var_160_59 = 0.8

			if var_160_58 < arg_157_1.time_ and arg_157_1.time_ <= var_160_58 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_60 = arg_157_1:GetWordFromCfg(319591038)
				local var_160_61 = arg_157_1:FormatText(var_160_60.content)

				arg_157_1.text_.text = var_160_61

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_62 = 32
				local var_160_63 = utf8.len(var_160_61)
				local var_160_64 = var_160_62 <= 0 and var_160_59 or var_160_59 * (var_160_63 / var_160_62)

				if var_160_64 > 0 and var_160_59 < var_160_64 then
					arg_157_1.talkMaxDuration = var_160_64

					if var_160_64 + var_160_58 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_64 + var_160_58
					end
				end

				arg_157_1.text_.text = var_160_61
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_65 = math.max(var_160_59, arg_157_1.talkMaxDuration)

			if var_160_58 <= arg_157_1.time_ and arg_157_1.time_ < var_160_58 + var_160_65 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_58) / var_160_65

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_58 + var_160_65 and arg_157_1.time_ < var_160_58 + var_160_65 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319591039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319591039
		arg_161_1.duration_ = 6

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play319591040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 1

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				local var_164_2 = "play"
				local var_164_3 = "effect"

				arg_161_1:AudioAction(var_164_2, var_164_3, "se_story_123_02", "se_story_123_02_whoosh", "")
			end

			local var_164_4 = 0

			if var_164_4 < arg_161_1.time_ and arg_161_1.time_ <= var_164_4 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_5 = 1

			if var_164_4 <= arg_161_1.time_ and arg_161_1.time_ < var_164_4 + var_164_5 then
				local var_164_6 = (arg_161_1.time_ - var_164_4) / var_164_5
				local var_164_7 = Color.New(1, 1, 1)

				var_164_7.a = Mathf.Lerp(1, 0, var_164_6)
				arg_161_1.mask_.color = var_164_7
			end

			if arg_161_1.time_ >= var_164_4 + var_164_5 and arg_161_1.time_ < var_164_4 + var_164_5 + arg_164_0 then
				local var_164_8 = Color.New(1, 1, 1)
				local var_164_9 = 0

				arg_161_1.mask_.enabled = false
				var_164_8.a = var_164_9
				arg_161_1.mask_.color = var_164_8
			end

			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				local var_164_11 = manager.ui.mainCamera.transform.localPosition
				local var_164_12 = Vector3.New(0, 0, 10) + Vector3.New(var_164_11.x, var_164_11.y, 0)
				local var_164_13 = arg_161_1.bgs_.I10f

				var_164_13.transform.localPosition = var_164_12
				var_164_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_164_14 = var_164_13:GetComponent("SpriteRenderer")

				if var_164_14 and var_164_14.sprite then
					local var_164_15 = (var_164_13.transform.localPosition - var_164_11).z
					local var_164_16 = manager.ui.mainCameraCom_
					local var_164_17 = 2 * var_164_15 * Mathf.Tan(var_164_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_164_18 = var_164_17 * var_164_16.aspect
					local var_164_19 = var_164_14.sprite.bounds.size.x
					local var_164_20 = var_164_14.sprite.bounds.size.y
					local var_164_21 = var_164_18 / var_164_19
					local var_164_22 = var_164_17 / var_164_20
					local var_164_23 = var_164_22 < var_164_21 and var_164_21 or var_164_22

					var_164_13.transform.localScale = Vector3.New(var_164_23, var_164_23, 0)
				end

				for iter_164_0, iter_164_1 in pairs(arg_161_1.bgs_) do
					if iter_164_0 ~= "I10f" then
						iter_164_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_161_1.frameCnt_ <= 1 then
				arg_161_1.dialog_:SetActive(false)
			end

			local var_164_24 = 1
			local var_164_25 = 1.3

			if var_164_24 < arg_161_1.time_ and arg_161_1.time_ <= var_164_24 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0

				arg_161_1.dialog_:SetActive(true)

				local var_164_26 = LeanTween.value(arg_161_1.dialog_, 0, 1, 0.3)

				var_164_26:setOnUpdate(LuaHelper.FloatAction(function(arg_165_0)
					arg_161_1.dialogCg_.alpha = arg_165_0
				end))
				var_164_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_161_1.dialog_)
					var_164_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_161_1.duration_ = arg_161_1.duration_ + 0.3

				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_27 = arg_161_1:GetWordFromCfg(319591039)
				local var_164_28 = arg_161_1:FormatText(var_164_27.content)

				arg_161_1.text_.text = var_164_28

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_29 = 52
				local var_164_30 = utf8.len(var_164_28)
				local var_164_31 = var_164_29 <= 0 and var_164_25 or var_164_25 * (var_164_30 / var_164_29)

				if var_164_31 > 0 and var_164_25 < var_164_31 then
					arg_161_1.talkMaxDuration = var_164_31
					var_164_24 = var_164_24 + 0.3

					if var_164_31 + var_164_24 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_31 + var_164_24
					end
				end

				arg_161_1.text_.text = var_164_28
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_32 = var_164_24 + 0.3
			local var_164_33 = math.max(var_164_25, arg_161_1.talkMaxDuration)

			if var_164_32 <= arg_161_1.time_ and arg_161_1.time_ < var_164_32 + var_164_33 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_32) / var_164_33

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_32 + var_164_33 and arg_161_1.time_ < var_164_32 + var_164_33 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319591040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319591040
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play319591041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 1

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				local var_170_2 = "play"
				local var_170_3 = "effect"

				arg_167_1:AudioAction(var_170_2, var_170_3, "se_story_127", "se_story_127_hit", "")
			end

			local var_170_4 = 0
			local var_170_5 = 1.3

			if var_170_4 < arg_167_1.time_ and arg_167_1.time_ <= var_170_4 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_6 = arg_167_1:GetWordFromCfg(319591040)
				local var_170_7 = arg_167_1:FormatText(var_170_6.content)

				arg_167_1.text_.text = var_170_7

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_8 = 52
				local var_170_9 = utf8.len(var_170_7)
				local var_170_10 = var_170_8 <= 0 and var_170_5 or var_170_5 * (var_170_9 / var_170_8)

				if var_170_10 > 0 and var_170_5 < var_170_10 then
					arg_167_1.talkMaxDuration = var_170_10

					if var_170_10 + var_170_4 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_10 + var_170_4
					end
				end

				arg_167_1.text_.text = var_170_7
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_11 = math.max(var_170_5, arg_167_1.talkMaxDuration)

			if var_170_4 <= arg_167_1.time_ and arg_167_1.time_ < var_170_4 + var_170_11 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_4) / var_170_11

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_4 + var_170_11 and arg_167_1.time_ < var_170_4 + var_170_11 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319591041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319591041
		arg_171_1.duration_ = 1.6

		local var_171_0 = {
			zh = 1.6,
			ja = 1.433
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
				arg_171_0:Play319591042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["4037ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos4037ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0, -1.12, -6.2)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos4037ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["4037ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect4037ui_story == nil then
				arg_171_1.var_.characterEffect4037ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.200000002980232

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect4037ui_story then
					arg_171_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect4037ui_story then
				arg_171_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_174_13 = 0

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_174_15 = arg_171_1.actors_["4040ui_story"].transform
			local var_174_16 = 0

			if var_174_16 < arg_171_1.time_ and arg_171_1.time_ <= var_174_16 + arg_174_0 then
				arg_171_1.var_.moveOldPos4040ui_story = var_174_15.localPosition
			end

			local var_174_17 = 0.001

			if var_174_16 <= arg_171_1.time_ and arg_171_1.time_ < var_174_16 + var_174_17 then
				local var_174_18 = (arg_171_1.time_ - var_174_16) / var_174_17
				local var_174_19 = Vector3.New(0, 100, 0)

				var_174_15.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos4040ui_story, var_174_19, var_174_18)

				local var_174_20 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_20.x, var_174_20.y, var_174_20.z)

				local var_174_21 = var_174_15.localEulerAngles

				var_174_21.z = 0
				var_174_21.x = 0
				var_174_15.localEulerAngles = var_174_21
			end

			if arg_171_1.time_ >= var_174_16 + var_174_17 and arg_171_1.time_ < var_174_16 + var_174_17 + arg_174_0 then
				var_174_15.localPosition = Vector3.New(0, 100, 0)

				local var_174_22 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_22.x, var_174_22.y, var_174_22.z)

				local var_174_23 = var_174_15.localEulerAngles

				var_174_23.z = 0
				var_174_23.x = 0
				var_174_15.localEulerAngles = var_174_23
			end

			local var_174_24 = arg_171_1.actors_["4040ui_story"]
			local var_174_25 = 0

			if var_174_25 < arg_171_1.time_ and arg_171_1.time_ <= var_174_25 + arg_174_0 and arg_171_1.var_.characterEffect4040ui_story == nil then
				arg_171_1.var_.characterEffect4040ui_story = var_174_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_26 = 0.200000002980232

			if var_174_25 <= arg_171_1.time_ and arg_171_1.time_ < var_174_25 + var_174_26 then
				local var_174_27 = (arg_171_1.time_ - var_174_25) / var_174_26

				if arg_171_1.var_.characterEffect4040ui_story then
					local var_174_28 = Mathf.Lerp(0, 0.5, var_174_27)

					arg_171_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_171_1.var_.characterEffect4040ui_story.fillRatio = var_174_28
				end
			end

			if arg_171_1.time_ >= var_174_25 + var_174_26 and arg_171_1.time_ < var_174_25 + var_174_26 + arg_174_0 and arg_171_1.var_.characterEffect4040ui_story then
				local var_174_29 = 0.5

				arg_171_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_171_1.var_.characterEffect4040ui_story.fillRatio = var_174_29
			end

			local var_174_30 = arg_171_1.actors_["1095ui_story"].transform
			local var_174_31 = 0

			if var_174_31 < arg_171_1.time_ and arg_171_1.time_ <= var_174_31 + arg_174_0 then
				arg_171_1.var_.moveOldPos1095ui_story = var_174_30.localPosition
			end

			local var_174_32 = 0.001

			if var_174_31 <= arg_171_1.time_ and arg_171_1.time_ < var_174_31 + var_174_32 then
				local var_174_33 = (arg_171_1.time_ - var_174_31) / var_174_32
				local var_174_34 = Vector3.New(0, 100, 0)

				var_174_30.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1095ui_story, var_174_34, var_174_33)

				local var_174_35 = manager.ui.mainCamera.transform.position - var_174_30.position

				var_174_30.forward = Vector3.New(var_174_35.x, var_174_35.y, var_174_35.z)

				local var_174_36 = var_174_30.localEulerAngles

				var_174_36.z = 0
				var_174_36.x = 0
				var_174_30.localEulerAngles = var_174_36
			end

			if arg_171_1.time_ >= var_174_31 + var_174_32 and arg_171_1.time_ < var_174_31 + var_174_32 + arg_174_0 then
				var_174_30.localPosition = Vector3.New(0, 100, 0)

				local var_174_37 = manager.ui.mainCamera.transform.position - var_174_30.position

				var_174_30.forward = Vector3.New(var_174_37.x, var_174_37.y, var_174_37.z)

				local var_174_38 = var_174_30.localEulerAngles

				var_174_38.z = 0
				var_174_38.x = 0
				var_174_30.localEulerAngles = var_174_38
			end

			local var_174_39 = arg_171_1.actors_["1095ui_story"]
			local var_174_40 = 0

			if var_174_40 < arg_171_1.time_ and arg_171_1.time_ <= var_174_40 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story == nil then
				arg_171_1.var_.characterEffect1095ui_story = var_174_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_41 = 0.200000002980232

			if var_174_40 <= arg_171_1.time_ and arg_171_1.time_ < var_174_40 + var_174_41 then
				local var_174_42 = (arg_171_1.time_ - var_174_40) / var_174_41

				if arg_171_1.var_.characterEffect1095ui_story then
					local var_174_43 = Mathf.Lerp(0, 0.5, var_174_42)

					arg_171_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1095ui_story.fillRatio = var_174_43
				end
			end

			if arg_171_1.time_ >= var_174_40 + var_174_41 and arg_171_1.time_ < var_174_40 + var_174_41 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story then
				local var_174_44 = 0.5

				arg_171_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1095ui_story.fillRatio = var_174_44
			end

			local var_174_45 = 0
			local var_174_46 = 0.125

			if var_174_45 < arg_171_1.time_ and arg_171_1.time_ <= var_174_45 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_47 = arg_171_1:FormatText(StoryNameCfg[453].name)

				arg_171_1.leftNameTxt_.text = var_174_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_48 = arg_171_1:GetWordFromCfg(319591041)
				local var_174_49 = arg_171_1:FormatText(var_174_48.content)

				arg_171_1.text_.text = var_174_49

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_50 = 5
				local var_174_51 = utf8.len(var_174_49)
				local var_174_52 = var_174_50 <= 0 and var_174_46 or var_174_46 * (var_174_51 / var_174_50)

				if var_174_52 > 0 and var_174_46 < var_174_52 then
					arg_171_1.talkMaxDuration = var_174_52

					if var_174_52 + var_174_45 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_52 + var_174_45
					end
				end

				arg_171_1.text_.text = var_174_49
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591041", "story_v_out_319591.awb") ~= 0 then
					local var_174_53 = manager.audio:GetVoiceLength("story_v_out_319591", "319591041", "story_v_out_319591.awb") / 1000

					if var_174_53 + var_174_45 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_53 + var_174_45
					end

					if var_174_48.prefab_name ~= "" and arg_171_1.actors_[var_174_48.prefab_name] ~= nil then
						local var_174_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_48.prefab_name].transform, "story_v_out_319591", "319591041", "story_v_out_319591.awb")

						arg_171_1:RecordAudio("319591041", var_174_54)
						arg_171_1:RecordAudio("319591041", var_174_54)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_319591", "319591041", "story_v_out_319591.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_319591", "319591041", "story_v_out_319591.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_55 = math.max(var_174_46, arg_171_1.talkMaxDuration)

			if var_174_45 <= arg_171_1.time_ and arg_171_1.time_ < var_174_45 + var_174_55 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_45) / var_174_55

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_45 + var_174_55 and arg_171_1.time_ < var_174_45 + var_174_55 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play319591042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319591042
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play319591043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["4037ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect4037ui_story == nil then
				arg_175_1.var_.characterEffect4037ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect4037ui_story then
					local var_178_4 = Mathf.Lerp(0, 0.5, var_178_3)

					arg_175_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_175_1.var_.characterEffect4037ui_story.fillRatio = var_178_4
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect4037ui_story then
				local var_178_5 = 0.5

				arg_175_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_175_1.var_.characterEffect4037ui_story.fillRatio = var_178_5
			end

			local var_178_6 = 0
			local var_178_7 = 1.175

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_8 = arg_175_1:GetWordFromCfg(319591042)
				local var_178_9 = arg_175_1:FormatText(var_178_8.content)

				arg_175_1.text_.text = var_178_9

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_10 = 47
				local var_178_11 = utf8.len(var_178_9)
				local var_178_12 = var_178_10 <= 0 and var_178_7 or var_178_7 * (var_178_11 / var_178_10)

				if var_178_12 > 0 and var_178_7 < var_178_12 then
					arg_175_1.talkMaxDuration = var_178_12

					if var_178_12 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_12 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_9
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_13 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_13 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_13

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_13 and arg_175_1.time_ < var_178_6 + var_178_13 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play319591043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319591043
		arg_179_1.duration_ = 1.999999999999

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play319591044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10079ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos10079ui_story = var_182_0.localPosition

				local var_182_2 = "10079ui_story"

				arg_179_1:ShowWeapon(arg_179_1.var_[var_182_2 .. "Animator"].transform, true)
			end

			local var_182_3 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_3 then
				local var_182_4 = (arg_179_1.time_ - var_182_1) / var_182_3
				local var_182_5 = Vector3.New(0, -0.95, -6.05)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10079ui_story, var_182_5, var_182_4)

				local var_182_6 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_6.x, var_182_6.y, var_182_6.z)

				local var_182_7 = var_182_0.localEulerAngles

				var_182_7.z = 0
				var_182_7.x = 0
				var_182_0.localEulerAngles = var_182_7
			end

			if arg_179_1.time_ >= var_182_1 + var_182_3 and arg_179_1.time_ < var_182_1 + var_182_3 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_182_8 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_8.x, var_182_8.y, var_182_8.z)

				local var_182_9 = var_182_0.localEulerAngles

				var_182_9.z = 0
				var_182_9.x = 0
				var_182_0.localEulerAngles = var_182_9
			end

			local var_182_10 = arg_179_1.actors_["10079ui_story"]
			local var_182_11 = 0

			if var_182_11 < arg_179_1.time_ and arg_179_1.time_ <= var_182_11 + arg_182_0 and arg_179_1.var_.characterEffect10079ui_story == nil then
				arg_179_1.var_.characterEffect10079ui_story = var_182_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_12 = 0.200000002980232

			if var_182_11 <= arg_179_1.time_ and arg_179_1.time_ < var_182_11 + var_182_12 then
				local var_182_13 = (arg_179_1.time_ - var_182_11) / var_182_12

				if arg_179_1.var_.characterEffect10079ui_story then
					arg_179_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_11 + var_182_12 and arg_179_1.time_ < var_182_11 + var_182_12 + arg_182_0 and arg_179_1.var_.characterEffect10079ui_story then
				arg_179_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_182_14 = 0

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 then
				arg_179_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_182_15 = 0

			if var_182_15 < arg_179_1.time_ and arg_179_1.time_ <= var_182_15 + arg_182_0 then
				arg_179_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_182_16 = arg_179_1.actors_["4037ui_story"].transform
			local var_182_17 = 0

			if var_182_17 < arg_179_1.time_ and arg_179_1.time_ <= var_182_17 + arg_182_0 then
				arg_179_1.var_.moveOldPos4037ui_story = var_182_16.localPosition
			end

			local var_182_18 = 0.001

			if var_182_17 <= arg_179_1.time_ and arg_179_1.time_ < var_182_17 + var_182_18 then
				local var_182_19 = (arg_179_1.time_ - var_182_17) / var_182_18
				local var_182_20 = Vector3.New(0, 100, 0)

				var_182_16.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos4037ui_story, var_182_20, var_182_19)

				local var_182_21 = manager.ui.mainCamera.transform.position - var_182_16.position

				var_182_16.forward = Vector3.New(var_182_21.x, var_182_21.y, var_182_21.z)

				local var_182_22 = var_182_16.localEulerAngles

				var_182_22.z = 0
				var_182_22.x = 0
				var_182_16.localEulerAngles = var_182_22
			end

			if arg_179_1.time_ >= var_182_17 + var_182_18 and arg_179_1.time_ < var_182_17 + var_182_18 + arg_182_0 then
				var_182_16.localPosition = Vector3.New(0, 100, 0)

				local var_182_23 = manager.ui.mainCamera.transform.position - var_182_16.position

				var_182_16.forward = Vector3.New(var_182_23.x, var_182_23.y, var_182_23.z)

				local var_182_24 = var_182_16.localEulerAngles

				var_182_24.z = 0
				var_182_24.x = 0
				var_182_16.localEulerAngles = var_182_24
			end

			local var_182_25 = arg_179_1.actors_["4037ui_story"]
			local var_182_26 = 0

			if var_182_26 < arg_179_1.time_ and arg_179_1.time_ <= var_182_26 + arg_182_0 and arg_179_1.var_.characterEffect4037ui_story == nil then
				arg_179_1.var_.characterEffect4037ui_story = var_182_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_27 = 0.200000002980232

			if var_182_26 <= arg_179_1.time_ and arg_179_1.time_ < var_182_26 + var_182_27 then
				local var_182_28 = (arg_179_1.time_ - var_182_26) / var_182_27

				if arg_179_1.var_.characterEffect4037ui_story then
					local var_182_29 = Mathf.Lerp(0, 0.5, var_182_28)

					arg_179_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_179_1.var_.characterEffect4037ui_story.fillRatio = var_182_29
				end
			end

			if arg_179_1.time_ >= var_182_26 + var_182_27 and arg_179_1.time_ < var_182_26 + var_182_27 + arg_182_0 and arg_179_1.var_.characterEffect4037ui_story then
				local var_182_30 = 0.5

				arg_179_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_179_1.var_.characterEffect4037ui_story.fillRatio = var_182_30
			end

			local var_182_31 = 0
			local var_182_32 = 0.075

			if var_182_31 < arg_179_1.time_ and arg_179_1.time_ <= var_182_31 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_33 = arg_179_1:FormatText(StoryNameCfg[6].name)

				arg_179_1.leftNameTxt_.text = var_182_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_34 = arg_179_1:GetWordFromCfg(319591043)
				local var_182_35 = arg_179_1:FormatText(var_182_34.content)

				arg_179_1.text_.text = var_182_35

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_36 = 3
				local var_182_37 = utf8.len(var_182_35)
				local var_182_38 = var_182_36 <= 0 and var_182_32 or var_182_32 * (var_182_37 / var_182_36)

				if var_182_38 > 0 and var_182_32 < var_182_38 then
					arg_179_1.talkMaxDuration = var_182_38

					if var_182_38 + var_182_31 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_38 + var_182_31
					end
				end

				arg_179_1.text_.text = var_182_35
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591043", "story_v_out_319591.awb") ~= 0 then
					local var_182_39 = manager.audio:GetVoiceLength("story_v_out_319591", "319591043", "story_v_out_319591.awb") / 1000

					if var_182_39 + var_182_31 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_39 + var_182_31
					end

					if var_182_34.prefab_name ~= "" and arg_179_1.actors_[var_182_34.prefab_name] ~= nil then
						local var_182_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_34.prefab_name].transform, "story_v_out_319591", "319591043", "story_v_out_319591.awb")

						arg_179_1:RecordAudio("319591043", var_182_40)
						arg_179_1:RecordAudio("319591043", var_182_40)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_319591", "319591043", "story_v_out_319591.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_319591", "319591043", "story_v_out_319591.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_41 = math.max(var_182_32, arg_179_1.talkMaxDuration)

			if var_182_31 <= arg_179_1.time_ and arg_179_1.time_ < var_182_31 + var_182_41 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_31) / var_182_41

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_31 + var_182_41 and arg_179_1.time_ < var_182_31 + var_182_41 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319591044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 319591044
		arg_183_1.duration_ = 1.999999999999

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play319591045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1095ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1095ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(0.7, -0.98, -6.1)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1095ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = arg_183_1.actors_["1095ui_story"]
			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 and arg_183_1.var_.characterEffect1095ui_story == nil then
				arg_183_1.var_.characterEffect1095ui_story = var_186_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_11 = 0.200000002980232

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_11 then
				local var_186_12 = (arg_183_1.time_ - var_186_10) / var_186_11

				if arg_183_1.var_.characterEffect1095ui_story then
					arg_183_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_10 + var_186_11 and arg_183_1.time_ < var_186_10 + var_186_11 + arg_186_0 and arg_183_1.var_.characterEffect1095ui_story then
				arg_183_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_186_13 = 0

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				arg_183_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 then
				arg_183_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_186_15 = arg_183_1.actors_["10079ui_story"].transform
			local var_186_16 = 0

			if var_186_16 < arg_183_1.time_ and arg_183_1.time_ <= var_186_16 + arg_186_0 then
				arg_183_1.var_.moveOldPos10079ui_story = var_186_15.localPosition
			end

			local var_186_17 = 0.001

			if var_186_16 <= arg_183_1.time_ and arg_183_1.time_ < var_186_16 + var_186_17 then
				local var_186_18 = (arg_183_1.time_ - var_186_16) / var_186_17
				local var_186_19 = Vector3.New(-0.7, -0.95, -6.05)

				var_186_15.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10079ui_story, var_186_19, var_186_18)

				local var_186_20 = manager.ui.mainCamera.transform.position - var_186_15.position

				var_186_15.forward = Vector3.New(var_186_20.x, var_186_20.y, var_186_20.z)

				local var_186_21 = var_186_15.localEulerAngles

				var_186_21.z = 0
				var_186_21.x = 0
				var_186_15.localEulerAngles = var_186_21
			end

			if arg_183_1.time_ >= var_186_16 + var_186_17 and arg_183_1.time_ < var_186_16 + var_186_17 + arg_186_0 then
				var_186_15.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_186_22 = manager.ui.mainCamera.transform.position - var_186_15.position

				var_186_15.forward = Vector3.New(var_186_22.x, var_186_22.y, var_186_22.z)

				local var_186_23 = var_186_15.localEulerAngles

				var_186_23.z = 0
				var_186_23.x = 0
				var_186_15.localEulerAngles = var_186_23
			end

			local var_186_24 = arg_183_1.actors_["10079ui_story"]
			local var_186_25 = 0

			if var_186_25 < arg_183_1.time_ and arg_183_1.time_ <= var_186_25 + arg_186_0 and arg_183_1.var_.characterEffect10079ui_story == nil then
				arg_183_1.var_.characterEffect10079ui_story = var_186_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_26 = 0.200000002980232

			if var_186_25 <= arg_183_1.time_ and arg_183_1.time_ < var_186_25 + var_186_26 then
				local var_186_27 = (arg_183_1.time_ - var_186_25) / var_186_26

				if arg_183_1.var_.characterEffect10079ui_story then
					local var_186_28 = Mathf.Lerp(0, 0.5, var_186_27)

					arg_183_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_183_1.var_.characterEffect10079ui_story.fillRatio = var_186_28
				end
			end

			if arg_183_1.time_ >= var_186_25 + var_186_26 and arg_183_1.time_ < var_186_25 + var_186_26 + arg_186_0 and arg_183_1.var_.characterEffect10079ui_story then
				local var_186_29 = 0.5

				arg_183_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_183_1.var_.characterEffect10079ui_story.fillRatio = var_186_29
			end

			local var_186_30 = 0
			local var_186_31 = 0.125

			if var_186_30 < arg_183_1.time_ and arg_183_1.time_ <= var_186_30 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_32 = arg_183_1:FormatText(StoryNameCfg[471].name)

				arg_183_1.leftNameTxt_.text = var_186_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_33 = arg_183_1:GetWordFromCfg(319591044)
				local var_186_34 = arg_183_1:FormatText(var_186_33.content)

				arg_183_1.text_.text = var_186_34

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_35 = 5
				local var_186_36 = utf8.len(var_186_34)
				local var_186_37 = var_186_35 <= 0 and var_186_31 or var_186_31 * (var_186_36 / var_186_35)

				if var_186_37 > 0 and var_186_31 < var_186_37 then
					arg_183_1.talkMaxDuration = var_186_37

					if var_186_37 + var_186_30 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_37 + var_186_30
					end
				end

				arg_183_1.text_.text = var_186_34
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591044", "story_v_out_319591.awb") ~= 0 then
					local var_186_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591044", "story_v_out_319591.awb") / 1000

					if var_186_38 + var_186_30 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_38 + var_186_30
					end

					if var_186_33.prefab_name ~= "" and arg_183_1.actors_[var_186_33.prefab_name] ~= nil then
						local var_186_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_33.prefab_name].transform, "story_v_out_319591", "319591044", "story_v_out_319591.awb")

						arg_183_1:RecordAudio("319591044", var_186_39)
						arg_183_1:RecordAudio("319591044", var_186_39)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_319591", "319591044", "story_v_out_319591.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_319591", "319591044", "story_v_out_319591.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_40 = math.max(var_186_31, arg_183_1.talkMaxDuration)

			if var_186_30 <= arg_183_1.time_ and arg_183_1.time_ < var_186_30 + var_186_40 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_30) / var_186_40

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_30 + var_186_40 and arg_183_1.time_ < var_186_30 + var_186_40 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play319591045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 319591045
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play319591046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1095ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1095ui_story == nil then
				arg_187_1.var_.characterEffect1095ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.200000002980232

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1095ui_story then
					local var_190_4 = Mathf.Lerp(0, 0.5, var_190_3)

					arg_187_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1095ui_story.fillRatio = var_190_4
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1095ui_story then
				local var_190_5 = 0.5

				arg_187_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1095ui_story.fillRatio = var_190_5
			end

			local var_190_6 = arg_187_1.actors_["10079ui_story"].transform
			local var_190_7 = 0

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 then
				arg_187_1.var_.moveOldPos10079ui_story = var_190_6.localPosition
			end

			local var_190_8 = 0.001

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_7) / var_190_8
				local var_190_10 = Vector3.New(0, 100, 0)

				var_190_6.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10079ui_story, var_190_10, var_190_9)

				local var_190_11 = manager.ui.mainCamera.transform.position - var_190_6.position

				var_190_6.forward = Vector3.New(var_190_11.x, var_190_11.y, var_190_11.z)

				local var_190_12 = var_190_6.localEulerAngles

				var_190_12.z = 0
				var_190_12.x = 0
				var_190_6.localEulerAngles = var_190_12
			end

			if arg_187_1.time_ >= var_190_7 + var_190_8 and arg_187_1.time_ < var_190_7 + var_190_8 + arg_190_0 then
				var_190_6.localPosition = Vector3.New(0, 100, 0)

				local var_190_13 = manager.ui.mainCamera.transform.position - var_190_6.position

				var_190_6.forward = Vector3.New(var_190_13.x, var_190_13.y, var_190_13.z)

				local var_190_14 = var_190_6.localEulerAngles

				var_190_14.z = 0
				var_190_14.x = 0
				var_190_6.localEulerAngles = var_190_14
			end

			local var_190_15 = arg_187_1.actors_["1095ui_story"].transform
			local var_190_16 = 0

			if var_190_16 < arg_187_1.time_ and arg_187_1.time_ <= var_190_16 + arg_190_0 then
				arg_187_1.var_.moveOldPos1095ui_story = var_190_15.localPosition
			end

			local var_190_17 = 0.001

			if var_190_16 <= arg_187_1.time_ and arg_187_1.time_ < var_190_16 + var_190_17 then
				local var_190_18 = (arg_187_1.time_ - var_190_16) / var_190_17
				local var_190_19 = Vector3.New(0, 100, 0)

				var_190_15.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1095ui_story, var_190_19, var_190_18)

				local var_190_20 = manager.ui.mainCamera.transform.position - var_190_15.position

				var_190_15.forward = Vector3.New(var_190_20.x, var_190_20.y, var_190_20.z)

				local var_190_21 = var_190_15.localEulerAngles

				var_190_21.z = 0
				var_190_21.x = 0
				var_190_15.localEulerAngles = var_190_21
			end

			if arg_187_1.time_ >= var_190_16 + var_190_17 and arg_187_1.time_ < var_190_16 + var_190_17 + arg_190_0 then
				var_190_15.localPosition = Vector3.New(0, 100, 0)

				local var_190_22 = manager.ui.mainCamera.transform.position - var_190_15.position

				var_190_15.forward = Vector3.New(var_190_22.x, var_190_22.y, var_190_22.z)

				local var_190_23 = var_190_15.localEulerAngles

				var_190_23.z = 0
				var_190_23.x = 0
				var_190_15.localEulerAngles = var_190_23
			end

			local var_190_24 = 0
			local var_190_25 = 1.2

			if var_190_24 < arg_187_1.time_ and arg_187_1.time_ <= var_190_24 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_26 = arg_187_1:GetWordFromCfg(319591045)
				local var_190_27 = arg_187_1:FormatText(var_190_26.content)

				arg_187_1.text_.text = var_190_27

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_28 = 48
				local var_190_29 = utf8.len(var_190_27)
				local var_190_30 = var_190_28 <= 0 and var_190_25 or var_190_25 * (var_190_29 / var_190_28)

				if var_190_30 > 0 and var_190_25 < var_190_30 then
					arg_187_1.talkMaxDuration = var_190_30

					if var_190_30 + var_190_24 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_30 + var_190_24
					end
				end

				arg_187_1.text_.text = var_190_27
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_31 = math.max(var_190_25, arg_187_1.talkMaxDuration)

			if var_190_24 <= arg_187_1.time_ and arg_187_1.time_ < var_190_24 + var_190_31 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_24) / var_190_31

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_24 + var_190_31 and arg_187_1.time_ < var_190_24 + var_190_31 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play319591046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 319591046
		arg_191_1.duration_ = 5.833

		local var_191_0 = {
			zh = 4.4,
			ja = 5.833
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
				arg_191_0:Play319591047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["4040ui_story"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos4040ui_story = var_194_0.localPosition
			end

			local var_194_2 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2
				local var_194_4 = Vector3.New(0, -1.55, -5.5)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos4040ui_story, var_194_4, var_194_3)

				local var_194_5 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_5.x, var_194_5.y, var_194_5.z)

				local var_194_6 = var_194_0.localEulerAngles

				var_194_6.z = 0
				var_194_6.x = 0
				var_194_0.localEulerAngles = var_194_6
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_194_7 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_7.x, var_194_7.y, var_194_7.z)

				local var_194_8 = var_194_0.localEulerAngles

				var_194_8.z = 0
				var_194_8.x = 0
				var_194_0.localEulerAngles = var_194_8
			end

			local var_194_9 = arg_191_1.actors_["4040ui_story"]
			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 and arg_191_1.var_.characterEffect4040ui_story == nil then
				arg_191_1.var_.characterEffect4040ui_story = var_194_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_11 = 0.200000002980232

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_11 then
				local var_194_12 = (arg_191_1.time_ - var_194_10) / var_194_11

				if arg_191_1.var_.characterEffect4040ui_story then
					arg_191_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_10 + var_194_11 and arg_191_1.time_ < var_194_10 + var_194_11 + arg_194_0 and arg_191_1.var_.characterEffect4040ui_story then
				arg_191_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_194_13 = 0

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 then
				arg_191_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_194_15 = arg_191_1.actors_["1095ui_story"].transform
			local var_194_16 = 0

			if var_194_16 < arg_191_1.time_ and arg_191_1.time_ <= var_194_16 + arg_194_0 then
				arg_191_1.var_.moveOldPos1095ui_story = var_194_15.localPosition
			end

			local var_194_17 = 0.001

			if var_194_16 <= arg_191_1.time_ and arg_191_1.time_ < var_194_16 + var_194_17 then
				local var_194_18 = (arg_191_1.time_ - var_194_16) / var_194_17
				local var_194_19 = Vector3.New(0, 100, 0)

				var_194_15.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1095ui_story, var_194_19, var_194_18)

				local var_194_20 = manager.ui.mainCamera.transform.position - var_194_15.position

				var_194_15.forward = Vector3.New(var_194_20.x, var_194_20.y, var_194_20.z)

				local var_194_21 = var_194_15.localEulerAngles

				var_194_21.z = 0
				var_194_21.x = 0
				var_194_15.localEulerAngles = var_194_21
			end

			if arg_191_1.time_ >= var_194_16 + var_194_17 and arg_191_1.time_ < var_194_16 + var_194_17 + arg_194_0 then
				var_194_15.localPosition = Vector3.New(0, 100, 0)

				local var_194_22 = manager.ui.mainCamera.transform.position - var_194_15.position

				var_194_15.forward = Vector3.New(var_194_22.x, var_194_22.y, var_194_22.z)

				local var_194_23 = var_194_15.localEulerAngles

				var_194_23.z = 0
				var_194_23.x = 0
				var_194_15.localEulerAngles = var_194_23
			end

			local var_194_24 = arg_191_1.actors_["1095ui_story"]
			local var_194_25 = 0

			if var_194_25 < arg_191_1.time_ and arg_191_1.time_ <= var_194_25 + arg_194_0 and arg_191_1.var_.characterEffect1095ui_story == nil then
				arg_191_1.var_.characterEffect1095ui_story = var_194_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_26 = 0.200000002980232

			if var_194_25 <= arg_191_1.time_ and arg_191_1.time_ < var_194_25 + var_194_26 then
				local var_194_27 = (arg_191_1.time_ - var_194_25) / var_194_26

				if arg_191_1.var_.characterEffect1095ui_story then
					local var_194_28 = Mathf.Lerp(0, 0.5, var_194_27)

					arg_191_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1095ui_story.fillRatio = var_194_28
				end
			end

			if arg_191_1.time_ >= var_194_25 + var_194_26 and arg_191_1.time_ < var_194_25 + var_194_26 + arg_194_0 and arg_191_1.var_.characterEffect1095ui_story then
				local var_194_29 = 0.5

				arg_191_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1095ui_story.fillRatio = var_194_29
			end

			local var_194_30 = arg_191_1.actors_["10079ui_story"].transform
			local var_194_31 = 0

			if var_194_31 < arg_191_1.time_ and arg_191_1.time_ <= var_194_31 + arg_194_0 then
				arg_191_1.var_.moveOldPos10079ui_story = var_194_30.localPosition
			end

			local var_194_32 = 0.001

			if var_194_31 <= arg_191_1.time_ and arg_191_1.time_ < var_194_31 + var_194_32 then
				local var_194_33 = (arg_191_1.time_ - var_194_31) / var_194_32
				local var_194_34 = Vector3.New(0, 100, 0)

				var_194_30.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10079ui_story, var_194_34, var_194_33)

				local var_194_35 = manager.ui.mainCamera.transform.position - var_194_30.position

				var_194_30.forward = Vector3.New(var_194_35.x, var_194_35.y, var_194_35.z)

				local var_194_36 = var_194_30.localEulerAngles

				var_194_36.z = 0
				var_194_36.x = 0
				var_194_30.localEulerAngles = var_194_36
			end

			if arg_191_1.time_ >= var_194_31 + var_194_32 and arg_191_1.time_ < var_194_31 + var_194_32 + arg_194_0 then
				var_194_30.localPosition = Vector3.New(0, 100, 0)

				local var_194_37 = manager.ui.mainCamera.transform.position - var_194_30.position

				var_194_30.forward = Vector3.New(var_194_37.x, var_194_37.y, var_194_37.z)

				local var_194_38 = var_194_30.localEulerAngles

				var_194_38.z = 0
				var_194_38.x = 0
				var_194_30.localEulerAngles = var_194_38
			end

			local var_194_39 = arg_191_1.actors_["10079ui_story"]
			local var_194_40 = 0

			if var_194_40 < arg_191_1.time_ and arg_191_1.time_ <= var_194_40 + arg_194_0 and arg_191_1.var_.characterEffect10079ui_story == nil then
				arg_191_1.var_.characterEffect10079ui_story = var_194_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_41 = 0.200000002980232

			if var_194_40 <= arg_191_1.time_ and arg_191_1.time_ < var_194_40 + var_194_41 then
				local var_194_42 = (arg_191_1.time_ - var_194_40) / var_194_41

				if arg_191_1.var_.characterEffect10079ui_story then
					local var_194_43 = Mathf.Lerp(0, 0.5, var_194_42)

					arg_191_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_191_1.var_.characterEffect10079ui_story.fillRatio = var_194_43
				end
			end

			if arg_191_1.time_ >= var_194_40 + var_194_41 and arg_191_1.time_ < var_194_40 + var_194_41 + arg_194_0 and arg_191_1.var_.characterEffect10079ui_story then
				local var_194_44 = 0.5

				arg_191_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_191_1.var_.characterEffect10079ui_story.fillRatio = var_194_44
			end

			local var_194_45 = 0
			local var_194_46 = 0.35

			if var_194_45 < arg_191_1.time_ and arg_191_1.time_ <= var_194_45 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_47 = arg_191_1:FormatText(StoryNameCfg[668].name)

				arg_191_1.leftNameTxt_.text = var_194_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_48 = arg_191_1:GetWordFromCfg(319591046)
				local var_194_49 = arg_191_1:FormatText(var_194_48.content)

				arg_191_1.text_.text = var_194_49

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_50 = 14
				local var_194_51 = utf8.len(var_194_49)
				local var_194_52 = var_194_50 <= 0 and var_194_46 or var_194_46 * (var_194_51 / var_194_50)

				if var_194_52 > 0 and var_194_46 < var_194_52 then
					arg_191_1.talkMaxDuration = var_194_52

					if var_194_52 + var_194_45 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_52 + var_194_45
					end
				end

				arg_191_1.text_.text = var_194_49
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591046", "story_v_out_319591.awb") ~= 0 then
					local var_194_53 = manager.audio:GetVoiceLength("story_v_out_319591", "319591046", "story_v_out_319591.awb") / 1000

					if var_194_53 + var_194_45 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_53 + var_194_45
					end

					if var_194_48.prefab_name ~= "" and arg_191_1.actors_[var_194_48.prefab_name] ~= nil then
						local var_194_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_48.prefab_name].transform, "story_v_out_319591", "319591046", "story_v_out_319591.awb")

						arg_191_1:RecordAudio("319591046", var_194_54)
						arg_191_1:RecordAudio("319591046", var_194_54)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_319591", "319591046", "story_v_out_319591.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_319591", "319591046", "story_v_out_319591.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_55 = math.max(var_194_46, arg_191_1.talkMaxDuration)

			if var_194_45 <= arg_191_1.time_ and arg_191_1.time_ < var_194_45 + var_194_55 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_45) / var_194_55

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_45 + var_194_55 and arg_191_1.time_ < var_194_45 + var_194_55 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play319591047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 319591047
		arg_195_1.duration_ = 6

		local var_195_0 = {
			zh = 5.066,
			ja = 6
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
				arg_195_0:Play319591048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10079ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos10079ui_story = var_198_0.localPosition

				local var_198_2 = "10079ui_story"

				arg_195_1:ShowWeapon(arg_195_1.var_[var_198_2 .. "Animator"].transform, false)
			end

			local var_198_3 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_3 then
				local var_198_4 = (arg_195_1.time_ - var_198_1) / var_198_3
				local var_198_5 = Vector3.New(0.7, -0.95, -6.05)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10079ui_story, var_198_5, var_198_4)

				local var_198_6 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_6.x, var_198_6.y, var_198_6.z)

				local var_198_7 = var_198_0.localEulerAngles

				var_198_7.z = 0
				var_198_7.x = 0
				var_198_0.localEulerAngles = var_198_7
			end

			if arg_195_1.time_ >= var_198_1 + var_198_3 and arg_195_1.time_ < var_198_1 + var_198_3 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_198_8 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_8.x, var_198_8.y, var_198_8.z)

				local var_198_9 = var_198_0.localEulerAngles

				var_198_9.z = 0
				var_198_9.x = 0
				var_198_0.localEulerAngles = var_198_9
			end

			local var_198_10 = arg_195_1.actors_["10079ui_story"]
			local var_198_11 = 0

			if var_198_11 < arg_195_1.time_ and arg_195_1.time_ <= var_198_11 + arg_198_0 and arg_195_1.var_.characterEffect10079ui_story == nil then
				arg_195_1.var_.characterEffect10079ui_story = var_198_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_12 = 0.200000002980232

			if var_198_11 <= arg_195_1.time_ and arg_195_1.time_ < var_198_11 + var_198_12 then
				local var_198_13 = (arg_195_1.time_ - var_198_11) / var_198_12

				if arg_195_1.var_.characterEffect10079ui_story then
					arg_195_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_11 + var_198_12 and arg_195_1.time_ < var_198_11 + var_198_12 + arg_198_0 and arg_195_1.var_.characterEffect10079ui_story then
				arg_195_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 then
				arg_195_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_198_15 = 0

			if var_198_15 < arg_195_1.time_ and arg_195_1.time_ <= var_198_15 + arg_198_0 then
				arg_195_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_198_16 = arg_195_1.actors_["4040ui_story"].transform
			local var_198_17 = 0

			if var_198_17 < arg_195_1.time_ and arg_195_1.time_ <= var_198_17 + arg_198_0 then
				arg_195_1.var_.moveOldPos4040ui_story = var_198_16.localPosition
			end

			local var_198_18 = 0.001

			if var_198_17 <= arg_195_1.time_ and arg_195_1.time_ < var_198_17 + var_198_18 then
				local var_198_19 = (arg_195_1.time_ - var_198_17) / var_198_18
				local var_198_20 = Vector3.New(-0.7, -1.55, -5.5)

				var_198_16.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos4040ui_story, var_198_20, var_198_19)

				local var_198_21 = manager.ui.mainCamera.transform.position - var_198_16.position

				var_198_16.forward = Vector3.New(var_198_21.x, var_198_21.y, var_198_21.z)

				local var_198_22 = var_198_16.localEulerAngles

				var_198_22.z = 0
				var_198_22.x = 0
				var_198_16.localEulerAngles = var_198_22
			end

			if arg_195_1.time_ >= var_198_17 + var_198_18 and arg_195_1.time_ < var_198_17 + var_198_18 + arg_198_0 then
				var_198_16.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_198_23 = manager.ui.mainCamera.transform.position - var_198_16.position

				var_198_16.forward = Vector3.New(var_198_23.x, var_198_23.y, var_198_23.z)

				local var_198_24 = var_198_16.localEulerAngles

				var_198_24.z = 0
				var_198_24.x = 0
				var_198_16.localEulerAngles = var_198_24
			end

			local var_198_25 = arg_195_1.actors_["4040ui_story"]
			local var_198_26 = 0

			if var_198_26 < arg_195_1.time_ and arg_195_1.time_ <= var_198_26 + arg_198_0 and arg_195_1.var_.characterEffect4040ui_story == nil then
				arg_195_1.var_.characterEffect4040ui_story = var_198_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_27 = 0.200000002980232

			if var_198_26 <= arg_195_1.time_ and arg_195_1.time_ < var_198_26 + var_198_27 then
				local var_198_28 = (arg_195_1.time_ - var_198_26) / var_198_27

				if arg_195_1.var_.characterEffect4040ui_story then
					local var_198_29 = Mathf.Lerp(0, 0.5, var_198_28)

					arg_195_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_195_1.var_.characterEffect4040ui_story.fillRatio = var_198_29
				end
			end

			if arg_195_1.time_ >= var_198_26 + var_198_27 and arg_195_1.time_ < var_198_26 + var_198_27 + arg_198_0 and arg_195_1.var_.characterEffect4040ui_story then
				local var_198_30 = 0.5

				arg_195_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_195_1.var_.characterEffect4040ui_story.fillRatio = var_198_30
			end

			local var_198_31 = 0
			local var_198_32 = 0.675

			if var_198_31 < arg_195_1.time_ and arg_195_1.time_ <= var_198_31 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_33 = arg_195_1:FormatText(StoryNameCfg[6].name)

				arg_195_1.leftNameTxt_.text = var_198_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_34 = arg_195_1:GetWordFromCfg(319591047)
				local var_198_35 = arg_195_1:FormatText(var_198_34.content)

				arg_195_1.text_.text = var_198_35

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_36 = 27
				local var_198_37 = utf8.len(var_198_35)
				local var_198_38 = var_198_36 <= 0 and var_198_32 or var_198_32 * (var_198_37 / var_198_36)

				if var_198_38 > 0 and var_198_32 < var_198_38 then
					arg_195_1.talkMaxDuration = var_198_38

					if var_198_38 + var_198_31 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_38 + var_198_31
					end
				end

				arg_195_1.text_.text = var_198_35
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591047", "story_v_out_319591.awb") ~= 0 then
					local var_198_39 = manager.audio:GetVoiceLength("story_v_out_319591", "319591047", "story_v_out_319591.awb") / 1000

					if var_198_39 + var_198_31 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_39 + var_198_31
					end

					if var_198_34.prefab_name ~= "" and arg_195_1.actors_[var_198_34.prefab_name] ~= nil then
						local var_198_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_34.prefab_name].transform, "story_v_out_319591", "319591047", "story_v_out_319591.awb")

						arg_195_1:RecordAudio("319591047", var_198_40)
						arg_195_1:RecordAudio("319591047", var_198_40)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_319591", "319591047", "story_v_out_319591.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_319591", "319591047", "story_v_out_319591.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_41 = math.max(var_198_32, arg_195_1.talkMaxDuration)

			if var_198_31 <= arg_195_1.time_ and arg_195_1.time_ < var_198_31 + var_198_41 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_31) / var_198_41

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_31 + var_198_41 and arg_195_1.time_ < var_198_31 + var_198_41 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play319591048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319591048
		arg_199_1.duration_ = 10.966

		local var_199_0 = {
			zh = 3.233,
			ja = 10.966
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
				arg_199_0:Play319591049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10079ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect10079ui_story == nil then
				arg_199_1.var_.characterEffect10079ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.200000002980232

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect10079ui_story then
					local var_202_4 = Mathf.Lerp(0, 0.5, var_202_3)

					arg_199_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_199_1.var_.characterEffect10079ui_story.fillRatio = var_202_4
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect10079ui_story then
				local var_202_5 = 0.5

				arg_199_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_199_1.var_.characterEffect10079ui_story.fillRatio = var_202_5
			end

			local var_202_6 = arg_199_1.actors_["4040ui_story"]
			local var_202_7 = 0

			if var_202_7 < arg_199_1.time_ and arg_199_1.time_ <= var_202_7 + arg_202_0 and arg_199_1.var_.characterEffect4040ui_story == nil then
				arg_199_1.var_.characterEffect4040ui_story = var_202_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_8 = 0.200000002980232

			if var_202_7 <= arg_199_1.time_ and arg_199_1.time_ < var_202_7 + var_202_8 then
				local var_202_9 = (arg_199_1.time_ - var_202_7) / var_202_8

				if arg_199_1.var_.characterEffect4040ui_story then
					arg_199_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_7 + var_202_8 and arg_199_1.time_ < var_202_7 + var_202_8 + arg_202_0 and arg_199_1.var_.characterEffect4040ui_story then
				arg_199_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_202_10 = 0
			local var_202_11 = 0.35

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_12 = arg_199_1:FormatText(StoryNameCfg[668].name)

				arg_199_1.leftNameTxt_.text = var_202_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_13 = arg_199_1:GetWordFromCfg(319591048)
				local var_202_14 = arg_199_1:FormatText(var_202_13.content)

				arg_199_1.text_.text = var_202_14

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_15 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591048", "story_v_out_319591.awb") ~= 0 then
					local var_202_18 = manager.audio:GetVoiceLength("story_v_out_319591", "319591048", "story_v_out_319591.awb") / 1000

					if var_202_18 + var_202_10 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_18 + var_202_10
					end

					if var_202_13.prefab_name ~= "" and arg_199_1.actors_[var_202_13.prefab_name] ~= nil then
						local var_202_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_13.prefab_name].transform, "story_v_out_319591", "319591048", "story_v_out_319591.awb")

						arg_199_1:RecordAudio("319591048", var_202_19)
						arg_199_1:RecordAudio("319591048", var_202_19)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_319591", "319591048", "story_v_out_319591.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_319591", "319591048", "story_v_out_319591.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_20 = math.max(var_202_11, arg_199_1.talkMaxDuration)

			if var_202_10 <= arg_199_1.time_ and arg_199_1.time_ < var_202_10 + var_202_20 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_10) / var_202_20

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_10 + var_202_20 and arg_199_1.time_ < var_202_10 + var_202_20 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play319591049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319591049
		arg_203_1.duration_ = 4.633

		local var_203_0 = {
			zh = 3.433,
			ja = 4.633
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
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play319591050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10079ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos10079ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0.7, -0.95, -6.05)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10079ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_206_7 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_7.x, var_206_7.y, var_206_7.z)

				local var_206_8 = var_206_0.localEulerAngles

				var_206_8.z = 0
				var_206_8.x = 0
				var_206_0.localEulerAngles = var_206_8
			end

			local var_206_9 = arg_203_1.actors_["10079ui_story"]
			local var_206_10 = 0

			if var_206_10 < arg_203_1.time_ and arg_203_1.time_ <= var_206_10 + arg_206_0 and arg_203_1.var_.characterEffect10079ui_story == nil then
				arg_203_1.var_.characterEffect10079ui_story = var_206_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_11 = 0.200000002980232

			if var_206_10 <= arg_203_1.time_ and arg_203_1.time_ < var_206_10 + var_206_11 then
				local var_206_12 = (arg_203_1.time_ - var_206_10) / var_206_11

				if arg_203_1.var_.characterEffect10079ui_story then
					arg_203_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_10 + var_206_11 and arg_203_1.time_ < var_206_10 + var_206_11 + arg_206_0 and arg_203_1.var_.characterEffect10079ui_story then
				arg_203_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_206_13 = 0

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				arg_203_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_206_15 = arg_203_1.actors_["4040ui_story"]
			local var_206_16 = 0

			if var_206_16 < arg_203_1.time_ and arg_203_1.time_ <= var_206_16 + arg_206_0 and arg_203_1.var_.characterEffect4040ui_story == nil then
				arg_203_1.var_.characterEffect4040ui_story = var_206_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_17 = 0.200000002980232

			if var_206_16 <= arg_203_1.time_ and arg_203_1.time_ < var_206_16 + var_206_17 then
				local var_206_18 = (arg_203_1.time_ - var_206_16) / var_206_17

				if arg_203_1.var_.characterEffect4040ui_story then
					local var_206_19 = Mathf.Lerp(0, 0.5, var_206_18)

					arg_203_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_203_1.var_.characterEffect4040ui_story.fillRatio = var_206_19
				end
			end

			if arg_203_1.time_ >= var_206_16 + var_206_17 and arg_203_1.time_ < var_206_16 + var_206_17 + arg_206_0 and arg_203_1.var_.characterEffect4040ui_story then
				local var_206_20 = 0.5

				arg_203_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_203_1.var_.characterEffect4040ui_story.fillRatio = var_206_20
			end

			local var_206_21 = 0
			local var_206_22 = 0.425

			if var_206_21 < arg_203_1.time_ and arg_203_1.time_ <= var_206_21 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_23 = arg_203_1:FormatText(StoryNameCfg[6].name)

				arg_203_1.leftNameTxt_.text = var_206_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_24 = arg_203_1:GetWordFromCfg(319591049)
				local var_206_25 = arg_203_1:FormatText(var_206_24.content)

				arg_203_1.text_.text = var_206_25

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_26 = 17
				local var_206_27 = utf8.len(var_206_25)
				local var_206_28 = var_206_26 <= 0 and var_206_22 or var_206_22 * (var_206_27 / var_206_26)

				if var_206_28 > 0 and var_206_22 < var_206_28 then
					arg_203_1.talkMaxDuration = var_206_28

					if var_206_28 + var_206_21 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_28 + var_206_21
					end
				end

				arg_203_1.text_.text = var_206_25
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591049", "story_v_out_319591.awb") ~= 0 then
					local var_206_29 = manager.audio:GetVoiceLength("story_v_out_319591", "319591049", "story_v_out_319591.awb") / 1000

					if var_206_29 + var_206_21 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_29 + var_206_21
					end

					if var_206_24.prefab_name ~= "" and arg_203_1.actors_[var_206_24.prefab_name] ~= nil then
						local var_206_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_24.prefab_name].transform, "story_v_out_319591", "319591049", "story_v_out_319591.awb")

						arg_203_1:RecordAudio("319591049", var_206_30)
						arg_203_1:RecordAudio("319591049", var_206_30)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_319591", "319591049", "story_v_out_319591.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_319591", "319591049", "story_v_out_319591.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_31 = math.max(var_206_22, arg_203_1.talkMaxDuration)

			if var_206_21 <= arg_203_1.time_ and arg_203_1.time_ < var_206_21 + var_206_31 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_21) / var_206_31

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_21 + var_206_31 and arg_203_1.time_ < var_206_21 + var_206_31 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play319591050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 319591050
		arg_207_1.duration_ = 9.933

		local var_207_0 = {
			zh = 7.3,
			ja = 9.933
		}
		local var_207_1 = manager.audio:GetLocalizationFlag()

		if var_207_0[var_207_1] ~= nil then
			arg_207_1.duration_ = var_207_0[var_207_1]
		end

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play319591051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["10079ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect10079ui_story == nil then
				arg_207_1.var_.characterEffect10079ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.200000002980232

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect10079ui_story then
					local var_210_4 = Mathf.Lerp(0, 0.5, var_210_3)

					arg_207_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_207_1.var_.characterEffect10079ui_story.fillRatio = var_210_4
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect10079ui_story then
				local var_210_5 = 0.5

				arg_207_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_207_1.var_.characterEffect10079ui_story.fillRatio = var_210_5
			end

			local var_210_6 = arg_207_1.actors_["4040ui_story"]
			local var_210_7 = 0

			if var_210_7 < arg_207_1.time_ and arg_207_1.time_ <= var_210_7 + arg_210_0 and arg_207_1.var_.characterEffect4040ui_story == nil then
				arg_207_1.var_.characterEffect4040ui_story = var_210_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_8 = 0.200000002980232

			if var_210_7 <= arg_207_1.time_ and arg_207_1.time_ < var_210_7 + var_210_8 then
				local var_210_9 = (arg_207_1.time_ - var_210_7) / var_210_8

				if arg_207_1.var_.characterEffect4040ui_story then
					arg_207_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_7 + var_210_8 and arg_207_1.time_ < var_210_7 + var_210_8 + arg_210_0 and arg_207_1.var_.characterEffect4040ui_story then
				arg_207_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 then
				arg_207_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_210_11 = 0
			local var_210_12 = 0.45

			if var_210_11 < arg_207_1.time_ and arg_207_1.time_ <= var_210_11 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_13 = arg_207_1:FormatText(StoryNameCfg[668].name)

				arg_207_1.leftNameTxt_.text = var_210_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_14 = arg_207_1:GetWordFromCfg(319591050)
				local var_210_15 = arg_207_1:FormatText(var_210_14.content)

				arg_207_1.text_.text = var_210_15

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_16 = 18
				local var_210_17 = utf8.len(var_210_15)
				local var_210_18 = var_210_16 <= 0 and var_210_12 or var_210_12 * (var_210_17 / var_210_16)

				if var_210_18 > 0 and var_210_12 < var_210_18 then
					arg_207_1.talkMaxDuration = var_210_18

					if var_210_18 + var_210_11 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_18 + var_210_11
					end
				end

				arg_207_1.text_.text = var_210_15
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591050", "story_v_out_319591.awb") ~= 0 then
					local var_210_19 = manager.audio:GetVoiceLength("story_v_out_319591", "319591050", "story_v_out_319591.awb") / 1000

					if var_210_19 + var_210_11 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_19 + var_210_11
					end

					if var_210_14.prefab_name ~= "" and arg_207_1.actors_[var_210_14.prefab_name] ~= nil then
						local var_210_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_14.prefab_name].transform, "story_v_out_319591", "319591050", "story_v_out_319591.awb")

						arg_207_1:RecordAudio("319591050", var_210_20)
						arg_207_1:RecordAudio("319591050", var_210_20)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_319591", "319591050", "story_v_out_319591.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_319591", "319591050", "story_v_out_319591.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_21 = math.max(var_210_12, arg_207_1.talkMaxDuration)

			if var_210_11 <= arg_207_1.time_ and arg_207_1.time_ < var_210_11 + var_210_21 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_11) / var_210_21

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_11 + var_210_21 and arg_207_1.time_ < var_210_11 + var_210_21 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play319591051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 319591051
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play319591052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["4040ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect4040ui_story == nil then
				arg_211_1.var_.characterEffect4040ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect4040ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_211_1.var_.characterEffect4040ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect4040ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_211_1.var_.characterEffect4040ui_story.fillRatio = var_214_5
			end

			local var_214_6 = 0
			local var_214_7 = 0.975

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_8 = arg_211_1:GetWordFromCfg(319591051)
				local var_214_9 = arg_211_1:FormatText(var_214_8.content)

				arg_211_1.text_.text = var_214_9

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_10 = 39
				local var_214_11 = utf8.len(var_214_9)
				local var_214_12 = var_214_10 <= 0 and var_214_7 or var_214_7 * (var_214_11 / var_214_10)

				if var_214_12 > 0 and var_214_7 < var_214_12 then
					arg_211_1.talkMaxDuration = var_214_12

					if var_214_12 + var_214_6 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_12 + var_214_6
					end
				end

				arg_211_1.text_.text = var_214_9
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_13 = math.max(var_214_7, arg_211_1.talkMaxDuration)

			if var_214_6 <= arg_211_1.time_ and arg_211_1.time_ < var_214_6 + var_214_13 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_6) / var_214_13

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_6 + var_214_13 and arg_211_1.time_ < var_214_6 + var_214_13 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play319591052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 319591052
		arg_215_1.duration_ = 5.466

		local var_215_0 = {
			zh = 5.466,
			ja = 4.9
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
				arg_215_0:Play319591053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1095ui_story"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1095ui_story = var_218_0.localPosition
			end

			local var_218_2 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2
				local var_218_4 = Vector3.New(0, -0.98, -6.1)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1095ui_story, var_218_4, var_218_3)

				local var_218_5 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_5.x, var_218_5.y, var_218_5.z)

				local var_218_6 = var_218_0.localEulerAngles

				var_218_6.z = 0
				var_218_6.x = 0
				var_218_0.localEulerAngles = var_218_6
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_218_7 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_7.x, var_218_7.y, var_218_7.z)

				local var_218_8 = var_218_0.localEulerAngles

				var_218_8.z = 0
				var_218_8.x = 0
				var_218_0.localEulerAngles = var_218_8
			end

			local var_218_9 = arg_215_1.actors_["1095ui_story"]
			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 and arg_215_1.var_.characterEffect1095ui_story == nil then
				arg_215_1.var_.characterEffect1095ui_story = var_218_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_11 = 0.200000002980232

			if var_218_10 <= arg_215_1.time_ and arg_215_1.time_ < var_218_10 + var_218_11 then
				local var_218_12 = (arg_215_1.time_ - var_218_10) / var_218_11

				if arg_215_1.var_.characterEffect1095ui_story then
					arg_215_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_10 + var_218_11 and arg_215_1.time_ < var_218_10 + var_218_11 + arg_218_0 and arg_215_1.var_.characterEffect1095ui_story then
				arg_215_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_218_13 = 0

			if var_218_13 < arg_215_1.time_ and arg_215_1.time_ <= var_218_13 + arg_218_0 then
				arg_215_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_218_14 = 0

			if var_218_14 < arg_215_1.time_ and arg_215_1.time_ <= var_218_14 + arg_218_0 then
				arg_215_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_218_15 = arg_215_1.actors_["10079ui_story"].transform
			local var_218_16 = 0

			if var_218_16 < arg_215_1.time_ and arg_215_1.time_ <= var_218_16 + arg_218_0 then
				arg_215_1.var_.moveOldPos10079ui_story = var_218_15.localPosition
			end

			local var_218_17 = 0.001

			if var_218_16 <= arg_215_1.time_ and arg_215_1.time_ < var_218_16 + var_218_17 then
				local var_218_18 = (arg_215_1.time_ - var_218_16) / var_218_17
				local var_218_19 = Vector3.New(0, 100, 0)

				var_218_15.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos10079ui_story, var_218_19, var_218_18)

				local var_218_20 = manager.ui.mainCamera.transform.position - var_218_15.position

				var_218_15.forward = Vector3.New(var_218_20.x, var_218_20.y, var_218_20.z)

				local var_218_21 = var_218_15.localEulerAngles

				var_218_21.z = 0
				var_218_21.x = 0
				var_218_15.localEulerAngles = var_218_21
			end

			if arg_215_1.time_ >= var_218_16 + var_218_17 and arg_215_1.time_ < var_218_16 + var_218_17 + arg_218_0 then
				var_218_15.localPosition = Vector3.New(0, 100, 0)

				local var_218_22 = manager.ui.mainCamera.transform.position - var_218_15.position

				var_218_15.forward = Vector3.New(var_218_22.x, var_218_22.y, var_218_22.z)

				local var_218_23 = var_218_15.localEulerAngles

				var_218_23.z = 0
				var_218_23.x = 0
				var_218_15.localEulerAngles = var_218_23
			end

			local var_218_24 = arg_215_1.actors_["10079ui_story"]
			local var_218_25 = 0

			if var_218_25 < arg_215_1.time_ and arg_215_1.time_ <= var_218_25 + arg_218_0 and arg_215_1.var_.characterEffect10079ui_story == nil then
				arg_215_1.var_.characterEffect10079ui_story = var_218_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_26 = 0.200000002980232

			if var_218_25 <= arg_215_1.time_ and arg_215_1.time_ < var_218_25 + var_218_26 then
				local var_218_27 = (arg_215_1.time_ - var_218_25) / var_218_26

				if arg_215_1.var_.characterEffect10079ui_story then
					local var_218_28 = Mathf.Lerp(0, 0.5, var_218_27)

					arg_215_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_215_1.var_.characterEffect10079ui_story.fillRatio = var_218_28
				end
			end

			if arg_215_1.time_ >= var_218_25 + var_218_26 and arg_215_1.time_ < var_218_25 + var_218_26 + arg_218_0 and arg_215_1.var_.characterEffect10079ui_story then
				local var_218_29 = 0.5

				arg_215_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_215_1.var_.characterEffect10079ui_story.fillRatio = var_218_29
			end

			local var_218_30 = arg_215_1.actors_["4040ui_story"].transform
			local var_218_31 = 0

			if var_218_31 < arg_215_1.time_ and arg_215_1.time_ <= var_218_31 + arg_218_0 then
				arg_215_1.var_.moveOldPos4040ui_story = var_218_30.localPosition
			end

			local var_218_32 = 0.001

			if var_218_31 <= arg_215_1.time_ and arg_215_1.time_ < var_218_31 + var_218_32 then
				local var_218_33 = (arg_215_1.time_ - var_218_31) / var_218_32
				local var_218_34 = Vector3.New(0, 100, 0)

				var_218_30.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos4040ui_story, var_218_34, var_218_33)

				local var_218_35 = manager.ui.mainCamera.transform.position - var_218_30.position

				var_218_30.forward = Vector3.New(var_218_35.x, var_218_35.y, var_218_35.z)

				local var_218_36 = var_218_30.localEulerAngles

				var_218_36.z = 0
				var_218_36.x = 0
				var_218_30.localEulerAngles = var_218_36
			end

			if arg_215_1.time_ >= var_218_31 + var_218_32 and arg_215_1.time_ < var_218_31 + var_218_32 + arg_218_0 then
				var_218_30.localPosition = Vector3.New(0, 100, 0)

				local var_218_37 = manager.ui.mainCamera.transform.position - var_218_30.position

				var_218_30.forward = Vector3.New(var_218_37.x, var_218_37.y, var_218_37.z)

				local var_218_38 = var_218_30.localEulerAngles

				var_218_38.z = 0
				var_218_38.x = 0
				var_218_30.localEulerAngles = var_218_38
			end

			local var_218_39 = arg_215_1.actors_["4040ui_story"]
			local var_218_40 = 0

			if var_218_40 < arg_215_1.time_ and arg_215_1.time_ <= var_218_40 + arg_218_0 and arg_215_1.var_.characterEffect4040ui_story == nil then
				arg_215_1.var_.characterEffect4040ui_story = var_218_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_41 = 0.200000002980232

			if var_218_40 <= arg_215_1.time_ and arg_215_1.time_ < var_218_40 + var_218_41 then
				local var_218_42 = (arg_215_1.time_ - var_218_40) / var_218_41

				if arg_215_1.var_.characterEffect4040ui_story then
					local var_218_43 = Mathf.Lerp(0, 0.5, var_218_42)

					arg_215_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_215_1.var_.characterEffect4040ui_story.fillRatio = var_218_43
				end
			end

			if arg_215_1.time_ >= var_218_40 + var_218_41 and arg_215_1.time_ < var_218_40 + var_218_41 + arg_218_0 and arg_215_1.var_.characterEffect4040ui_story then
				local var_218_44 = 0.5

				arg_215_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_215_1.var_.characterEffect4040ui_story.fillRatio = var_218_44
			end

			local var_218_45 = 0
			local var_218_46 = 0.6

			if var_218_45 < arg_215_1.time_ and arg_215_1.time_ <= var_218_45 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_47 = arg_215_1:FormatText(StoryNameCfg[471].name)

				arg_215_1.leftNameTxt_.text = var_218_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_48 = arg_215_1:GetWordFromCfg(319591052)
				local var_218_49 = arg_215_1:FormatText(var_218_48.content)

				arg_215_1.text_.text = var_218_49

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_50 = 24
				local var_218_51 = utf8.len(var_218_49)
				local var_218_52 = var_218_50 <= 0 and var_218_46 or var_218_46 * (var_218_51 / var_218_50)

				if var_218_52 > 0 and var_218_46 < var_218_52 then
					arg_215_1.talkMaxDuration = var_218_52

					if var_218_52 + var_218_45 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_52 + var_218_45
					end
				end

				arg_215_1.text_.text = var_218_49
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591052", "story_v_out_319591.awb") ~= 0 then
					local var_218_53 = manager.audio:GetVoiceLength("story_v_out_319591", "319591052", "story_v_out_319591.awb") / 1000

					if var_218_53 + var_218_45 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_53 + var_218_45
					end

					if var_218_48.prefab_name ~= "" and arg_215_1.actors_[var_218_48.prefab_name] ~= nil then
						local var_218_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_48.prefab_name].transform, "story_v_out_319591", "319591052", "story_v_out_319591.awb")

						arg_215_1:RecordAudio("319591052", var_218_54)
						arg_215_1:RecordAudio("319591052", var_218_54)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_319591", "319591052", "story_v_out_319591.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_319591", "319591052", "story_v_out_319591.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_55 = math.max(var_218_46, arg_215_1.talkMaxDuration)

			if var_218_45 <= arg_215_1.time_ and arg_215_1.time_ < var_218_45 + var_218_55 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_45) / var_218_55

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_45 + var_218_55 and arg_215_1.time_ < var_218_45 + var_218_55 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play319591053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 319591053
		arg_219_1.duration_ = 13.166

		local var_219_0 = {
			zh = 10.3,
			ja = 13.166
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
				arg_219_0:Play319591054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["4037ui_story"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos4037ui_story = var_222_0.localPosition
			end

			local var_222_2 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2
				local var_222_4 = Vector3.New(0, -1.12, -6.2)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos4037ui_story, var_222_4, var_222_3)

				local var_222_5 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_5.x, var_222_5.y, var_222_5.z)

				local var_222_6 = var_222_0.localEulerAngles

				var_222_6.z = 0
				var_222_6.x = 0
				var_222_0.localEulerAngles = var_222_6
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_222_7 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_7.x, var_222_7.y, var_222_7.z)

				local var_222_8 = var_222_0.localEulerAngles

				var_222_8.z = 0
				var_222_8.x = 0
				var_222_0.localEulerAngles = var_222_8
			end

			local var_222_9 = arg_219_1.actors_["4037ui_story"]
			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 and arg_219_1.var_.characterEffect4037ui_story == nil then
				arg_219_1.var_.characterEffect4037ui_story = var_222_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_11 = 0.200000002980232

			if var_222_10 <= arg_219_1.time_ and arg_219_1.time_ < var_222_10 + var_222_11 then
				local var_222_12 = (arg_219_1.time_ - var_222_10) / var_222_11

				if arg_219_1.var_.characterEffect4037ui_story then
					arg_219_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_10 + var_222_11 and arg_219_1.time_ < var_222_10 + var_222_11 + arg_222_0 and arg_219_1.var_.characterEffect4037ui_story then
				arg_219_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_222_13 = 0

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_222_15 = arg_219_1.actors_["1095ui_story"].transform
			local var_222_16 = 0

			if var_222_16 < arg_219_1.time_ and arg_219_1.time_ <= var_222_16 + arg_222_0 then
				arg_219_1.var_.moveOldPos1095ui_story = var_222_15.localPosition
			end

			local var_222_17 = 0.001

			if var_222_16 <= arg_219_1.time_ and arg_219_1.time_ < var_222_16 + var_222_17 then
				local var_222_18 = (arg_219_1.time_ - var_222_16) / var_222_17
				local var_222_19 = Vector3.New(0, 100, 0)

				var_222_15.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1095ui_story, var_222_19, var_222_18)

				local var_222_20 = manager.ui.mainCamera.transform.position - var_222_15.position

				var_222_15.forward = Vector3.New(var_222_20.x, var_222_20.y, var_222_20.z)

				local var_222_21 = var_222_15.localEulerAngles

				var_222_21.z = 0
				var_222_21.x = 0
				var_222_15.localEulerAngles = var_222_21
			end

			if arg_219_1.time_ >= var_222_16 + var_222_17 and arg_219_1.time_ < var_222_16 + var_222_17 + arg_222_0 then
				var_222_15.localPosition = Vector3.New(0, 100, 0)

				local var_222_22 = manager.ui.mainCamera.transform.position - var_222_15.position

				var_222_15.forward = Vector3.New(var_222_22.x, var_222_22.y, var_222_22.z)

				local var_222_23 = var_222_15.localEulerAngles

				var_222_23.z = 0
				var_222_23.x = 0
				var_222_15.localEulerAngles = var_222_23
			end

			local var_222_24 = arg_219_1.actors_["1095ui_story"]
			local var_222_25 = 0

			if var_222_25 < arg_219_1.time_ and arg_219_1.time_ <= var_222_25 + arg_222_0 and arg_219_1.var_.characterEffect1095ui_story == nil then
				arg_219_1.var_.characterEffect1095ui_story = var_222_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_26 = 0.200000002980232

			if var_222_25 <= arg_219_1.time_ and arg_219_1.time_ < var_222_25 + var_222_26 then
				local var_222_27 = (arg_219_1.time_ - var_222_25) / var_222_26

				if arg_219_1.var_.characterEffect1095ui_story then
					local var_222_28 = Mathf.Lerp(0, 0.5, var_222_27)

					arg_219_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1095ui_story.fillRatio = var_222_28
				end
			end

			if arg_219_1.time_ >= var_222_25 + var_222_26 and arg_219_1.time_ < var_222_25 + var_222_26 + arg_222_0 and arg_219_1.var_.characterEffect1095ui_story then
				local var_222_29 = 0.5

				arg_219_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1095ui_story.fillRatio = var_222_29
			end

			local var_222_30 = 0
			local var_222_31 = 0.95

			if var_222_30 < arg_219_1.time_ and arg_219_1.time_ <= var_222_30 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_32 = arg_219_1:FormatText(StoryNameCfg[453].name)

				arg_219_1.leftNameTxt_.text = var_222_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_33 = arg_219_1:GetWordFromCfg(319591053)
				local var_222_34 = arg_219_1:FormatText(var_222_33.content)

				arg_219_1.text_.text = var_222_34

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_35 = 38
				local var_222_36 = utf8.len(var_222_34)
				local var_222_37 = var_222_35 <= 0 and var_222_31 or var_222_31 * (var_222_36 / var_222_35)

				if var_222_37 > 0 and var_222_31 < var_222_37 then
					arg_219_1.talkMaxDuration = var_222_37

					if var_222_37 + var_222_30 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_37 + var_222_30
					end
				end

				arg_219_1.text_.text = var_222_34
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591053", "story_v_out_319591.awb") ~= 0 then
					local var_222_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591053", "story_v_out_319591.awb") / 1000

					if var_222_38 + var_222_30 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_38 + var_222_30
					end

					if var_222_33.prefab_name ~= "" and arg_219_1.actors_[var_222_33.prefab_name] ~= nil then
						local var_222_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_33.prefab_name].transform, "story_v_out_319591", "319591053", "story_v_out_319591.awb")

						arg_219_1:RecordAudio("319591053", var_222_39)
						arg_219_1:RecordAudio("319591053", var_222_39)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_319591", "319591053", "story_v_out_319591.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_319591", "319591053", "story_v_out_319591.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_40 = math.max(var_222_31, arg_219_1.talkMaxDuration)

			if var_222_30 <= arg_219_1.time_ and arg_219_1.time_ < var_222_30 + var_222_40 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_30) / var_222_40

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_30 + var_222_40 and arg_219_1.time_ < var_222_30 + var_222_40 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play319591054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 319591054
		arg_223_1.duration_ = 4.066

		local var_223_0 = {
			zh = 1.8,
			ja = 4.066
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
				arg_223_0:Play319591055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["4037ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect4037ui_story == nil then
				arg_223_1.var_.characterEffect4037ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect4037ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_223_1.var_.characterEffect4037ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect4037ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_223_1.var_.characterEffect4037ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0
			local var_226_7 = 0.15

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[694].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, true)
				arg_223_1.iconController_:SetSelectedState("hero")

				arg_223_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10072")

				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(319591054)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591054", "story_v_out_319591.awb") ~= 0 then
					local var_226_14 = manager.audio:GetVoiceLength("story_v_out_319591", "319591054", "story_v_out_319591.awb") / 1000

					if var_226_14 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_14 + var_226_6
					end

					if var_226_9.prefab_name ~= "" and arg_223_1.actors_[var_226_9.prefab_name] ~= nil then
						local var_226_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_9.prefab_name].transform, "story_v_out_319591", "319591054", "story_v_out_319591.awb")

						arg_223_1:RecordAudio("319591054", var_226_15)
						arg_223_1:RecordAudio("319591054", var_226_15)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_319591", "319591054", "story_v_out_319591.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_319591", "319591054", "story_v_out_319591.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_16 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_16 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_16

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_16 and arg_223_1.time_ < var_226_6 + var_226_16 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play319591055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 319591055
		arg_227_1.duration_ = 4.8

		local var_227_0 = {
			zh = 2.633,
			ja = 4.8
		}
		local var_227_1 = manager.audio:GetLocalizationFlag()

		if var_227_0[var_227_1] ~= nil then
			arg_227_1.duration_ = var_227_0[var_227_1]
		end

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play319591056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1095ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1095ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(0, -0.98, -6.1)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1095ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = arg_227_1.actors_["1095ui_story"]
			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 and arg_227_1.var_.characterEffect1095ui_story == nil then
				arg_227_1.var_.characterEffect1095ui_story = var_230_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_11 = 0.200000002980232

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_11 then
				local var_230_12 = (arg_227_1.time_ - var_230_10) / var_230_11

				if arg_227_1.var_.characterEffect1095ui_story then
					arg_227_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_10 + var_230_11 and arg_227_1.time_ < var_230_10 + var_230_11 + arg_230_0 and arg_227_1.var_.characterEffect1095ui_story then
				arg_227_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_230_13 = 0

			if var_230_13 < arg_227_1.time_ and arg_227_1.time_ <= var_230_13 + arg_230_0 then
				arg_227_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 then
				arg_227_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_230_15 = arg_227_1.actors_["4037ui_story"].transform
			local var_230_16 = 0

			if var_230_16 < arg_227_1.time_ and arg_227_1.time_ <= var_230_16 + arg_230_0 then
				arg_227_1.var_.moveOldPos4037ui_story = var_230_15.localPosition
			end

			local var_230_17 = 0.001

			if var_230_16 <= arg_227_1.time_ and arg_227_1.time_ < var_230_16 + var_230_17 then
				local var_230_18 = (arg_227_1.time_ - var_230_16) / var_230_17
				local var_230_19 = Vector3.New(0, 100, 0)

				var_230_15.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos4037ui_story, var_230_19, var_230_18)

				local var_230_20 = manager.ui.mainCamera.transform.position - var_230_15.position

				var_230_15.forward = Vector3.New(var_230_20.x, var_230_20.y, var_230_20.z)

				local var_230_21 = var_230_15.localEulerAngles

				var_230_21.z = 0
				var_230_21.x = 0
				var_230_15.localEulerAngles = var_230_21
			end

			if arg_227_1.time_ >= var_230_16 + var_230_17 and arg_227_1.time_ < var_230_16 + var_230_17 + arg_230_0 then
				var_230_15.localPosition = Vector3.New(0, 100, 0)

				local var_230_22 = manager.ui.mainCamera.transform.position - var_230_15.position

				var_230_15.forward = Vector3.New(var_230_22.x, var_230_22.y, var_230_22.z)

				local var_230_23 = var_230_15.localEulerAngles

				var_230_23.z = 0
				var_230_23.x = 0
				var_230_15.localEulerAngles = var_230_23
			end

			local var_230_24 = arg_227_1.actors_["4037ui_story"]
			local var_230_25 = 0

			if var_230_25 < arg_227_1.time_ and arg_227_1.time_ <= var_230_25 + arg_230_0 and arg_227_1.var_.characterEffect4037ui_story == nil then
				arg_227_1.var_.characterEffect4037ui_story = var_230_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_26 = 0.200000002980232

			if var_230_25 <= arg_227_1.time_ and arg_227_1.time_ < var_230_25 + var_230_26 then
				local var_230_27 = (arg_227_1.time_ - var_230_25) / var_230_26

				if arg_227_1.var_.characterEffect4037ui_story then
					local var_230_28 = Mathf.Lerp(0, 0.5, var_230_27)

					arg_227_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_227_1.var_.characterEffect4037ui_story.fillRatio = var_230_28
				end
			end

			if arg_227_1.time_ >= var_230_25 + var_230_26 and arg_227_1.time_ < var_230_25 + var_230_26 + arg_230_0 and arg_227_1.var_.characterEffect4037ui_story then
				local var_230_29 = 0.5

				arg_227_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_227_1.var_.characterEffect4037ui_story.fillRatio = var_230_29
			end

			local var_230_30 = 0
			local var_230_31 = 0.375

			if var_230_30 < arg_227_1.time_ and arg_227_1.time_ <= var_230_30 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_32 = arg_227_1:FormatText(StoryNameCfg[471].name)

				arg_227_1.leftNameTxt_.text = var_230_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_33 = arg_227_1:GetWordFromCfg(319591055)
				local var_230_34 = arg_227_1:FormatText(var_230_33.content)

				arg_227_1.text_.text = var_230_34

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_35 = 15
				local var_230_36 = utf8.len(var_230_34)
				local var_230_37 = var_230_35 <= 0 and var_230_31 or var_230_31 * (var_230_36 / var_230_35)

				if var_230_37 > 0 and var_230_31 < var_230_37 then
					arg_227_1.talkMaxDuration = var_230_37

					if var_230_37 + var_230_30 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_37 + var_230_30
					end
				end

				arg_227_1.text_.text = var_230_34
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591055", "story_v_out_319591.awb") ~= 0 then
					local var_230_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591055", "story_v_out_319591.awb") / 1000

					if var_230_38 + var_230_30 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_38 + var_230_30
					end

					if var_230_33.prefab_name ~= "" and arg_227_1.actors_[var_230_33.prefab_name] ~= nil then
						local var_230_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_33.prefab_name].transform, "story_v_out_319591", "319591055", "story_v_out_319591.awb")

						arg_227_1:RecordAudio("319591055", var_230_39)
						arg_227_1:RecordAudio("319591055", var_230_39)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_319591", "319591055", "story_v_out_319591.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_319591", "319591055", "story_v_out_319591.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_40 = math.max(var_230_31, arg_227_1.talkMaxDuration)

			if var_230_30 <= arg_227_1.time_ and arg_227_1.time_ < var_230_30 + var_230_40 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_30) / var_230_40

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_30 + var_230_40 and arg_227_1.time_ < var_230_30 + var_230_40 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play319591056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 319591056
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play319591057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1095ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1095ui_story == nil then
				arg_231_1.var_.characterEffect1095ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1095ui_story then
					local var_234_4 = Mathf.Lerp(0, 0.5, var_234_3)

					arg_231_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1095ui_story.fillRatio = var_234_4
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1095ui_story then
				local var_234_5 = 0.5

				arg_231_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1095ui_story.fillRatio = var_234_5
			end

			local var_234_6 = 0
			local var_234_7 = 1.55

			if var_234_6 < arg_231_1.time_ and arg_231_1.time_ <= var_234_6 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, false)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_8 = arg_231_1:GetWordFromCfg(319591056)
				local var_234_9 = arg_231_1:FormatText(var_234_8.content)

				arg_231_1.text_.text = var_234_9

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_10 = 63
				local var_234_11 = utf8.len(var_234_9)
				local var_234_12 = var_234_10 <= 0 and var_234_7 or var_234_7 * (var_234_11 / var_234_10)

				if var_234_12 > 0 and var_234_7 < var_234_12 then
					arg_231_1.talkMaxDuration = var_234_12

					if var_234_12 + var_234_6 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_12 + var_234_6
					end
				end

				arg_231_1.text_.text = var_234_9
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_13 = math.max(var_234_7, arg_231_1.talkMaxDuration)

			if var_234_6 <= arg_231_1.time_ and arg_231_1.time_ < var_234_6 + var_234_13 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_6) / var_234_13

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_6 + var_234_13 and arg_231_1.time_ < var_234_6 + var_234_13 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play319591057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 319591057
		arg_235_1.duration_ = 10.733

		local var_235_0 = {
			zh = 5.8,
			ja = 10.733
		}
		local var_235_1 = manager.audio:GetLocalizationFlag()

		if var_235_0[var_235_1] ~= nil then
			arg_235_1.duration_ = var_235_0[var_235_1]
		end

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play319591058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["4037ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos4037ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(0, -1.12, -6.2)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos4037ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.actors_["4037ui_story"]
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 and arg_235_1.var_.characterEffect4037ui_story == nil then
				arg_235_1.var_.characterEffect4037ui_story = var_238_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_11 = 0.200000002980232

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11

				if arg_235_1.var_.characterEffect4037ui_story then
					arg_235_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 and arg_235_1.var_.characterEffect4037ui_story then
				arg_235_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_238_13 = 0

			if var_238_13 < arg_235_1.time_ and arg_235_1.time_ <= var_238_13 + arg_238_0 then
				arg_235_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				arg_235_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_238_15 = arg_235_1.actors_["1095ui_story"].transform
			local var_238_16 = 0

			if var_238_16 < arg_235_1.time_ and arg_235_1.time_ <= var_238_16 + arg_238_0 then
				arg_235_1.var_.moveOldPos1095ui_story = var_238_15.localPosition
			end

			local var_238_17 = 0.001

			if var_238_16 <= arg_235_1.time_ and arg_235_1.time_ < var_238_16 + var_238_17 then
				local var_238_18 = (arg_235_1.time_ - var_238_16) / var_238_17
				local var_238_19 = Vector3.New(0, 100, 0)

				var_238_15.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1095ui_story, var_238_19, var_238_18)

				local var_238_20 = manager.ui.mainCamera.transform.position - var_238_15.position

				var_238_15.forward = Vector3.New(var_238_20.x, var_238_20.y, var_238_20.z)

				local var_238_21 = var_238_15.localEulerAngles

				var_238_21.z = 0
				var_238_21.x = 0
				var_238_15.localEulerAngles = var_238_21
			end

			if arg_235_1.time_ >= var_238_16 + var_238_17 and arg_235_1.time_ < var_238_16 + var_238_17 + arg_238_0 then
				var_238_15.localPosition = Vector3.New(0, 100, 0)

				local var_238_22 = manager.ui.mainCamera.transform.position - var_238_15.position

				var_238_15.forward = Vector3.New(var_238_22.x, var_238_22.y, var_238_22.z)

				local var_238_23 = var_238_15.localEulerAngles

				var_238_23.z = 0
				var_238_23.x = 0
				var_238_15.localEulerAngles = var_238_23
			end

			local var_238_24 = arg_235_1.actors_["1095ui_story"]
			local var_238_25 = 0

			if var_238_25 < arg_235_1.time_ and arg_235_1.time_ <= var_238_25 + arg_238_0 and arg_235_1.var_.characterEffect1095ui_story == nil then
				arg_235_1.var_.characterEffect1095ui_story = var_238_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_26 = 0.200000002980232

			if var_238_25 <= arg_235_1.time_ and arg_235_1.time_ < var_238_25 + var_238_26 then
				local var_238_27 = (arg_235_1.time_ - var_238_25) / var_238_26

				if arg_235_1.var_.characterEffect1095ui_story then
					local var_238_28 = Mathf.Lerp(0, 0.5, var_238_27)

					arg_235_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1095ui_story.fillRatio = var_238_28
				end
			end

			if arg_235_1.time_ >= var_238_25 + var_238_26 and arg_235_1.time_ < var_238_25 + var_238_26 + arg_238_0 and arg_235_1.var_.characterEffect1095ui_story then
				local var_238_29 = 0.5

				arg_235_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1095ui_story.fillRatio = var_238_29
			end

			local var_238_30 = 0
			local var_238_31 = 0.65

			if var_238_30 < arg_235_1.time_ and arg_235_1.time_ <= var_238_30 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_32 = arg_235_1:FormatText(StoryNameCfg[453].name)

				arg_235_1.leftNameTxt_.text = var_238_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_33 = arg_235_1:GetWordFromCfg(319591057)
				local var_238_34 = arg_235_1:FormatText(var_238_33.content)

				arg_235_1.text_.text = var_238_34

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_35 = 26
				local var_238_36 = utf8.len(var_238_34)
				local var_238_37 = var_238_35 <= 0 and var_238_31 or var_238_31 * (var_238_36 / var_238_35)

				if var_238_37 > 0 and var_238_31 < var_238_37 then
					arg_235_1.talkMaxDuration = var_238_37

					if var_238_37 + var_238_30 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_37 + var_238_30
					end
				end

				arg_235_1.text_.text = var_238_34
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591057", "story_v_out_319591.awb") ~= 0 then
					local var_238_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591057", "story_v_out_319591.awb") / 1000

					if var_238_38 + var_238_30 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_38 + var_238_30
					end

					if var_238_33.prefab_name ~= "" and arg_235_1.actors_[var_238_33.prefab_name] ~= nil then
						local var_238_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_33.prefab_name].transform, "story_v_out_319591", "319591057", "story_v_out_319591.awb")

						arg_235_1:RecordAudio("319591057", var_238_39)
						arg_235_1:RecordAudio("319591057", var_238_39)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_319591", "319591057", "story_v_out_319591.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_319591", "319591057", "story_v_out_319591.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_40 = math.max(var_238_31, arg_235_1.talkMaxDuration)

			if var_238_30 <= arg_235_1.time_ and arg_235_1.time_ < var_238_30 + var_238_40 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_30) / var_238_40

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_30 + var_238_40 and arg_235_1.time_ < var_238_30 + var_238_40 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play319591058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 319591058
		arg_239_1.duration_ = 7.4

		local var_239_0 = {
			zh = 2.7,
			ja = 7.4
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
				arg_239_0:Play319591059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1095ui_story"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1095ui_story = var_242_0.localPosition
			end

			local var_242_2 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2
				local var_242_4 = Vector3.New(0, -0.98, -6.1)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1095ui_story, var_242_4, var_242_3)

				local var_242_5 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_5.x, var_242_5.y, var_242_5.z)

				local var_242_6 = var_242_0.localEulerAngles

				var_242_6.z = 0
				var_242_6.x = 0
				var_242_0.localEulerAngles = var_242_6
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_242_7 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_7.x, var_242_7.y, var_242_7.z)

				local var_242_8 = var_242_0.localEulerAngles

				var_242_8.z = 0
				var_242_8.x = 0
				var_242_0.localEulerAngles = var_242_8
			end

			local var_242_9 = arg_239_1.actors_["1095ui_story"]
			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 and arg_239_1.var_.characterEffect1095ui_story == nil then
				arg_239_1.var_.characterEffect1095ui_story = var_242_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_11 = 0.200000002980232

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_11 then
				local var_242_12 = (arg_239_1.time_ - var_242_10) / var_242_11

				if arg_239_1.var_.characterEffect1095ui_story then
					arg_239_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_10 + var_242_11 and arg_239_1.time_ < var_242_10 + var_242_11 + arg_242_0 and arg_239_1.var_.characterEffect1095ui_story then
				arg_239_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_242_13 = 0

			if var_242_13 < arg_239_1.time_ and arg_239_1.time_ <= var_242_13 + arg_242_0 then
				arg_239_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				arg_239_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_242_15 = arg_239_1.actors_["4037ui_story"].transform
			local var_242_16 = 0

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 then
				arg_239_1.var_.moveOldPos4037ui_story = var_242_15.localPosition
			end

			local var_242_17 = 0.001

			if var_242_16 <= arg_239_1.time_ and arg_239_1.time_ < var_242_16 + var_242_17 then
				local var_242_18 = (arg_239_1.time_ - var_242_16) / var_242_17
				local var_242_19 = Vector3.New(0, 100, 0)

				var_242_15.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos4037ui_story, var_242_19, var_242_18)

				local var_242_20 = manager.ui.mainCamera.transform.position - var_242_15.position

				var_242_15.forward = Vector3.New(var_242_20.x, var_242_20.y, var_242_20.z)

				local var_242_21 = var_242_15.localEulerAngles

				var_242_21.z = 0
				var_242_21.x = 0
				var_242_15.localEulerAngles = var_242_21
			end

			if arg_239_1.time_ >= var_242_16 + var_242_17 and arg_239_1.time_ < var_242_16 + var_242_17 + arg_242_0 then
				var_242_15.localPosition = Vector3.New(0, 100, 0)

				local var_242_22 = manager.ui.mainCamera.transform.position - var_242_15.position

				var_242_15.forward = Vector3.New(var_242_22.x, var_242_22.y, var_242_22.z)

				local var_242_23 = var_242_15.localEulerAngles

				var_242_23.z = 0
				var_242_23.x = 0
				var_242_15.localEulerAngles = var_242_23
			end

			local var_242_24 = arg_239_1.actors_["4037ui_story"]
			local var_242_25 = 0

			if var_242_25 < arg_239_1.time_ and arg_239_1.time_ <= var_242_25 + arg_242_0 and arg_239_1.var_.characterEffect4037ui_story == nil then
				arg_239_1.var_.characterEffect4037ui_story = var_242_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_26 = 0.200000002980232

			if var_242_25 <= arg_239_1.time_ and arg_239_1.time_ < var_242_25 + var_242_26 then
				local var_242_27 = (arg_239_1.time_ - var_242_25) / var_242_26

				if arg_239_1.var_.characterEffect4037ui_story then
					local var_242_28 = Mathf.Lerp(0, 0.5, var_242_27)

					arg_239_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_239_1.var_.characterEffect4037ui_story.fillRatio = var_242_28
				end
			end

			if arg_239_1.time_ >= var_242_25 + var_242_26 and arg_239_1.time_ < var_242_25 + var_242_26 + arg_242_0 and arg_239_1.var_.characterEffect4037ui_story then
				local var_242_29 = 0.5

				arg_239_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_239_1.var_.characterEffect4037ui_story.fillRatio = var_242_29
			end

			local var_242_30 = 0
			local var_242_31 = 0.425

			if var_242_30 < arg_239_1.time_ and arg_239_1.time_ <= var_242_30 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_32 = arg_239_1:FormatText(StoryNameCfg[471].name)

				arg_239_1.leftNameTxt_.text = var_242_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_33 = arg_239_1:GetWordFromCfg(319591058)
				local var_242_34 = arg_239_1:FormatText(var_242_33.content)

				arg_239_1.text_.text = var_242_34

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_35 = 17
				local var_242_36 = utf8.len(var_242_34)
				local var_242_37 = var_242_35 <= 0 and var_242_31 or var_242_31 * (var_242_36 / var_242_35)

				if var_242_37 > 0 and var_242_31 < var_242_37 then
					arg_239_1.talkMaxDuration = var_242_37

					if var_242_37 + var_242_30 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_37 + var_242_30
					end
				end

				arg_239_1.text_.text = var_242_34
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591058", "story_v_out_319591.awb") ~= 0 then
					local var_242_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591058", "story_v_out_319591.awb") / 1000

					if var_242_38 + var_242_30 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_38 + var_242_30
					end

					if var_242_33.prefab_name ~= "" and arg_239_1.actors_[var_242_33.prefab_name] ~= nil then
						local var_242_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_33.prefab_name].transform, "story_v_out_319591", "319591058", "story_v_out_319591.awb")

						arg_239_1:RecordAudio("319591058", var_242_39)
						arg_239_1:RecordAudio("319591058", var_242_39)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_319591", "319591058", "story_v_out_319591.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_319591", "319591058", "story_v_out_319591.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_40 = math.max(var_242_31, arg_239_1.talkMaxDuration)

			if var_242_30 <= arg_239_1.time_ and arg_239_1.time_ < var_242_30 + var_242_40 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_30) / var_242_40

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_30 + var_242_40 and arg_239_1.time_ < var_242_30 + var_242_40 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play319591059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 319591059
		arg_243_1.duration_ = 3.533

		local var_243_0 = {
			zh = 3.533,
			ja = 2.233
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
				arg_243_0:Play319591060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["4037ui_story"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos4037ui_story = var_246_0.localPosition
			end

			local var_246_2 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2
				local var_246_4 = Vector3.New(0, -1.12, -6.2)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos4037ui_story, var_246_4, var_246_3)

				local var_246_5 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_5.x, var_246_5.y, var_246_5.z)

				local var_246_6 = var_246_0.localEulerAngles

				var_246_6.z = 0
				var_246_6.x = 0
				var_246_0.localEulerAngles = var_246_6
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_246_7 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_7.x, var_246_7.y, var_246_7.z)

				local var_246_8 = var_246_0.localEulerAngles

				var_246_8.z = 0
				var_246_8.x = 0
				var_246_0.localEulerAngles = var_246_8
			end

			local var_246_9 = arg_243_1.actors_["4037ui_story"]
			local var_246_10 = 0

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 and arg_243_1.var_.characterEffect4037ui_story == nil then
				arg_243_1.var_.characterEffect4037ui_story = var_246_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_11 = 0.200000002980232

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_11 then
				local var_246_12 = (arg_243_1.time_ - var_246_10) / var_246_11

				if arg_243_1.var_.characterEffect4037ui_story then
					arg_243_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_10 + var_246_11 and arg_243_1.time_ < var_246_10 + var_246_11 + arg_246_0 and arg_243_1.var_.characterEffect4037ui_story then
				arg_243_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_246_13 = 0

			if var_246_13 < arg_243_1.time_ and arg_243_1.time_ <= var_246_13 + arg_246_0 then
				arg_243_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action2_1")
			end

			local var_246_14 = 0

			if var_246_14 < arg_243_1.time_ and arg_243_1.time_ <= var_246_14 + arg_246_0 then
				arg_243_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_246_15 = arg_243_1.actors_["1095ui_story"].transform
			local var_246_16 = 0

			if var_246_16 < arg_243_1.time_ and arg_243_1.time_ <= var_246_16 + arg_246_0 then
				arg_243_1.var_.moveOldPos1095ui_story = var_246_15.localPosition
			end

			local var_246_17 = 0.001

			if var_246_16 <= arg_243_1.time_ and arg_243_1.time_ < var_246_16 + var_246_17 then
				local var_246_18 = (arg_243_1.time_ - var_246_16) / var_246_17
				local var_246_19 = Vector3.New(0, 100, 0)

				var_246_15.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1095ui_story, var_246_19, var_246_18)

				local var_246_20 = manager.ui.mainCamera.transform.position - var_246_15.position

				var_246_15.forward = Vector3.New(var_246_20.x, var_246_20.y, var_246_20.z)

				local var_246_21 = var_246_15.localEulerAngles

				var_246_21.z = 0
				var_246_21.x = 0
				var_246_15.localEulerAngles = var_246_21
			end

			if arg_243_1.time_ >= var_246_16 + var_246_17 and arg_243_1.time_ < var_246_16 + var_246_17 + arg_246_0 then
				var_246_15.localPosition = Vector3.New(0, 100, 0)

				local var_246_22 = manager.ui.mainCamera.transform.position - var_246_15.position

				var_246_15.forward = Vector3.New(var_246_22.x, var_246_22.y, var_246_22.z)

				local var_246_23 = var_246_15.localEulerAngles

				var_246_23.z = 0
				var_246_23.x = 0
				var_246_15.localEulerAngles = var_246_23
			end

			local var_246_24 = arg_243_1.actors_["1095ui_story"]
			local var_246_25 = 0

			if var_246_25 < arg_243_1.time_ and arg_243_1.time_ <= var_246_25 + arg_246_0 and arg_243_1.var_.characterEffect1095ui_story == nil then
				arg_243_1.var_.characterEffect1095ui_story = var_246_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_26 = 0.200000002980232

			if var_246_25 <= arg_243_1.time_ and arg_243_1.time_ < var_246_25 + var_246_26 then
				local var_246_27 = (arg_243_1.time_ - var_246_25) / var_246_26

				if arg_243_1.var_.characterEffect1095ui_story then
					local var_246_28 = Mathf.Lerp(0, 0.5, var_246_27)

					arg_243_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1095ui_story.fillRatio = var_246_28
				end
			end

			if arg_243_1.time_ >= var_246_25 + var_246_26 and arg_243_1.time_ < var_246_25 + var_246_26 + arg_246_0 and arg_243_1.var_.characterEffect1095ui_story then
				local var_246_29 = 0.5

				arg_243_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1095ui_story.fillRatio = var_246_29
			end

			local var_246_30 = 0
			local var_246_31 = 0.25

			if var_246_30 < arg_243_1.time_ and arg_243_1.time_ <= var_246_30 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_32 = arg_243_1:FormatText(StoryNameCfg[453].name)

				arg_243_1.leftNameTxt_.text = var_246_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_33 = arg_243_1:GetWordFromCfg(319591059)
				local var_246_34 = arg_243_1:FormatText(var_246_33.content)

				arg_243_1.text_.text = var_246_34

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_35 = 10
				local var_246_36 = utf8.len(var_246_34)
				local var_246_37 = var_246_35 <= 0 and var_246_31 or var_246_31 * (var_246_36 / var_246_35)

				if var_246_37 > 0 and var_246_31 < var_246_37 then
					arg_243_1.talkMaxDuration = var_246_37

					if var_246_37 + var_246_30 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_37 + var_246_30
					end
				end

				arg_243_1.text_.text = var_246_34
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591059", "story_v_out_319591.awb") ~= 0 then
					local var_246_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591059", "story_v_out_319591.awb") / 1000

					if var_246_38 + var_246_30 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_38 + var_246_30
					end

					if var_246_33.prefab_name ~= "" and arg_243_1.actors_[var_246_33.prefab_name] ~= nil then
						local var_246_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_33.prefab_name].transform, "story_v_out_319591", "319591059", "story_v_out_319591.awb")

						arg_243_1:RecordAudio("319591059", var_246_39)
						arg_243_1:RecordAudio("319591059", var_246_39)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_319591", "319591059", "story_v_out_319591.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_319591", "319591059", "story_v_out_319591.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_40 = math.max(var_246_31, arg_243_1.talkMaxDuration)

			if var_246_30 <= arg_243_1.time_ and arg_243_1.time_ < var_246_30 + var_246_40 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_30) / var_246_40

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_30 + var_246_40 and arg_243_1.time_ < var_246_30 + var_246_40 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play319591060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 319591060
		arg_247_1.duration_ = 12.133

		local var_247_0 = {
			zh = 8.6,
			ja = 12.133
		}
		local var_247_1 = manager.audio:GetLocalizationFlag()

		if var_247_0[var_247_1] ~= nil then
			arg_247_1.duration_ = var_247_0[var_247_1]
		end

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play319591061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1095ui_story"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1095ui_story = var_250_0.localPosition
			end

			local var_250_2 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2
				local var_250_4 = Vector3.New(0, -0.98, -6.1)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1095ui_story, var_250_4, var_250_3)

				local var_250_5 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_5.x, var_250_5.y, var_250_5.z)

				local var_250_6 = var_250_0.localEulerAngles

				var_250_6.z = 0
				var_250_6.x = 0
				var_250_0.localEulerAngles = var_250_6
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_250_7 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_7.x, var_250_7.y, var_250_7.z)

				local var_250_8 = var_250_0.localEulerAngles

				var_250_8.z = 0
				var_250_8.x = 0
				var_250_0.localEulerAngles = var_250_8
			end

			local var_250_9 = arg_247_1.actors_["1095ui_story"]
			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 and arg_247_1.var_.characterEffect1095ui_story == nil then
				arg_247_1.var_.characterEffect1095ui_story = var_250_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_11 = 0.200000002980232

			if var_250_10 <= arg_247_1.time_ and arg_247_1.time_ < var_250_10 + var_250_11 then
				local var_250_12 = (arg_247_1.time_ - var_250_10) / var_250_11

				if arg_247_1.var_.characterEffect1095ui_story then
					arg_247_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_10 + var_250_11 and arg_247_1.time_ < var_250_10 + var_250_11 + arg_250_0 and arg_247_1.var_.characterEffect1095ui_story then
				arg_247_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_250_13 = 0

			if var_250_13 < arg_247_1.time_ and arg_247_1.time_ <= var_250_13 + arg_250_0 then
				arg_247_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_250_14 = 0

			if var_250_14 < arg_247_1.time_ and arg_247_1.time_ <= var_250_14 + arg_250_0 then
				arg_247_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_250_15 = arg_247_1.actors_["4037ui_story"].transform
			local var_250_16 = 0

			if var_250_16 < arg_247_1.time_ and arg_247_1.time_ <= var_250_16 + arg_250_0 then
				arg_247_1.var_.moveOldPos4037ui_story = var_250_15.localPosition
			end

			local var_250_17 = 0.001

			if var_250_16 <= arg_247_1.time_ and arg_247_1.time_ < var_250_16 + var_250_17 then
				local var_250_18 = (arg_247_1.time_ - var_250_16) / var_250_17
				local var_250_19 = Vector3.New(0, 100, 0)

				var_250_15.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos4037ui_story, var_250_19, var_250_18)

				local var_250_20 = manager.ui.mainCamera.transform.position - var_250_15.position

				var_250_15.forward = Vector3.New(var_250_20.x, var_250_20.y, var_250_20.z)

				local var_250_21 = var_250_15.localEulerAngles

				var_250_21.z = 0
				var_250_21.x = 0
				var_250_15.localEulerAngles = var_250_21
			end

			if arg_247_1.time_ >= var_250_16 + var_250_17 and arg_247_1.time_ < var_250_16 + var_250_17 + arg_250_0 then
				var_250_15.localPosition = Vector3.New(0, 100, 0)

				local var_250_22 = manager.ui.mainCamera.transform.position - var_250_15.position

				var_250_15.forward = Vector3.New(var_250_22.x, var_250_22.y, var_250_22.z)

				local var_250_23 = var_250_15.localEulerAngles

				var_250_23.z = 0
				var_250_23.x = 0
				var_250_15.localEulerAngles = var_250_23
			end

			local var_250_24 = arg_247_1.actors_["4037ui_story"]
			local var_250_25 = 0

			if var_250_25 < arg_247_1.time_ and arg_247_1.time_ <= var_250_25 + arg_250_0 and arg_247_1.var_.characterEffect4037ui_story == nil then
				arg_247_1.var_.characterEffect4037ui_story = var_250_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_26 = 0.200000002980232

			if var_250_25 <= arg_247_1.time_ and arg_247_1.time_ < var_250_25 + var_250_26 then
				local var_250_27 = (arg_247_1.time_ - var_250_25) / var_250_26

				if arg_247_1.var_.characterEffect4037ui_story then
					local var_250_28 = Mathf.Lerp(0, 0.5, var_250_27)

					arg_247_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_247_1.var_.characterEffect4037ui_story.fillRatio = var_250_28
				end
			end

			if arg_247_1.time_ >= var_250_25 + var_250_26 and arg_247_1.time_ < var_250_25 + var_250_26 + arg_250_0 and arg_247_1.var_.characterEffect4037ui_story then
				local var_250_29 = 0.5

				arg_247_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_247_1.var_.characterEffect4037ui_story.fillRatio = var_250_29
			end

			local var_250_30 = 0
			local var_250_31 = 1.05

			if var_250_30 < arg_247_1.time_ and arg_247_1.time_ <= var_250_30 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_32 = arg_247_1:FormatText(StoryNameCfg[471].name)

				arg_247_1.leftNameTxt_.text = var_250_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_33 = arg_247_1:GetWordFromCfg(319591060)
				local var_250_34 = arg_247_1:FormatText(var_250_33.content)

				arg_247_1.text_.text = var_250_34

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_35 = 42
				local var_250_36 = utf8.len(var_250_34)
				local var_250_37 = var_250_35 <= 0 and var_250_31 or var_250_31 * (var_250_36 / var_250_35)

				if var_250_37 > 0 and var_250_31 < var_250_37 then
					arg_247_1.talkMaxDuration = var_250_37

					if var_250_37 + var_250_30 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_37 + var_250_30
					end
				end

				arg_247_1.text_.text = var_250_34
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591060", "story_v_out_319591.awb") ~= 0 then
					local var_250_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591060", "story_v_out_319591.awb") / 1000

					if var_250_38 + var_250_30 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_38 + var_250_30
					end

					if var_250_33.prefab_name ~= "" and arg_247_1.actors_[var_250_33.prefab_name] ~= nil then
						local var_250_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_33.prefab_name].transform, "story_v_out_319591", "319591060", "story_v_out_319591.awb")

						arg_247_1:RecordAudio("319591060", var_250_39)
						arg_247_1:RecordAudio("319591060", var_250_39)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_319591", "319591060", "story_v_out_319591.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_319591", "319591060", "story_v_out_319591.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_40 = math.max(var_250_31, arg_247_1.talkMaxDuration)

			if var_250_30 <= arg_247_1.time_ and arg_247_1.time_ < var_250_30 + var_250_40 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_30) / var_250_40

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_30 + var_250_40 and arg_247_1.time_ < var_250_30 + var_250_40 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play319591061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 319591061
		arg_251_1.duration_ = 9.4

		local var_251_0 = {
			zh = 7.666,
			ja = 9.4
		}
		local var_251_1 = manager.audio:GetLocalizationFlag()

		if var_251_0[var_251_1] ~= nil then
			arg_251_1.duration_ = var_251_0[var_251_1]
		end

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play319591062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["4037ui_story"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos4037ui_story = var_254_0.localPosition
			end

			local var_254_2 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2
				local var_254_4 = Vector3.New(0, -1.12, -6.2)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos4037ui_story, var_254_4, var_254_3)

				local var_254_5 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_5.x, var_254_5.y, var_254_5.z)

				local var_254_6 = var_254_0.localEulerAngles

				var_254_6.z = 0
				var_254_6.x = 0
				var_254_0.localEulerAngles = var_254_6
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_254_7 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_7.x, var_254_7.y, var_254_7.z)

				local var_254_8 = var_254_0.localEulerAngles

				var_254_8.z = 0
				var_254_8.x = 0
				var_254_0.localEulerAngles = var_254_8
			end

			local var_254_9 = arg_251_1.actors_["4037ui_story"]
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 and arg_251_1.var_.characterEffect4037ui_story == nil then
				arg_251_1.var_.characterEffect4037ui_story = var_254_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_11 = 0.200000002980232

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_11 then
				local var_254_12 = (arg_251_1.time_ - var_254_10) / var_254_11

				if arg_251_1.var_.characterEffect4037ui_story then
					arg_251_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_10 + var_254_11 and arg_251_1.time_ < var_254_10 + var_254_11 + arg_254_0 and arg_251_1.var_.characterEffect4037ui_story then
				arg_251_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_254_13 = 0

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				arg_251_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037actionlink/4037action423")
			end

			local var_254_14 = 0

			if var_254_14 < arg_251_1.time_ and arg_251_1.time_ <= var_254_14 + arg_254_0 then
				arg_251_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_254_15 = arg_251_1.actors_["1095ui_story"].transform
			local var_254_16 = 0

			if var_254_16 < arg_251_1.time_ and arg_251_1.time_ <= var_254_16 + arg_254_0 then
				arg_251_1.var_.moveOldPos1095ui_story = var_254_15.localPosition
			end

			local var_254_17 = 0.001

			if var_254_16 <= arg_251_1.time_ and arg_251_1.time_ < var_254_16 + var_254_17 then
				local var_254_18 = (arg_251_1.time_ - var_254_16) / var_254_17
				local var_254_19 = Vector3.New(0, 100, 0)

				var_254_15.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1095ui_story, var_254_19, var_254_18)

				local var_254_20 = manager.ui.mainCamera.transform.position - var_254_15.position

				var_254_15.forward = Vector3.New(var_254_20.x, var_254_20.y, var_254_20.z)

				local var_254_21 = var_254_15.localEulerAngles

				var_254_21.z = 0
				var_254_21.x = 0
				var_254_15.localEulerAngles = var_254_21
			end

			if arg_251_1.time_ >= var_254_16 + var_254_17 and arg_251_1.time_ < var_254_16 + var_254_17 + arg_254_0 then
				var_254_15.localPosition = Vector3.New(0, 100, 0)

				local var_254_22 = manager.ui.mainCamera.transform.position - var_254_15.position

				var_254_15.forward = Vector3.New(var_254_22.x, var_254_22.y, var_254_22.z)

				local var_254_23 = var_254_15.localEulerAngles

				var_254_23.z = 0
				var_254_23.x = 0
				var_254_15.localEulerAngles = var_254_23
			end

			local var_254_24 = arg_251_1.actors_["1095ui_story"]
			local var_254_25 = 0

			if var_254_25 < arg_251_1.time_ and arg_251_1.time_ <= var_254_25 + arg_254_0 and arg_251_1.var_.characterEffect1095ui_story == nil then
				arg_251_1.var_.characterEffect1095ui_story = var_254_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_26 = 0.200000002980232

			if var_254_25 <= arg_251_1.time_ and arg_251_1.time_ < var_254_25 + var_254_26 then
				local var_254_27 = (arg_251_1.time_ - var_254_25) / var_254_26

				if arg_251_1.var_.characterEffect1095ui_story then
					local var_254_28 = Mathf.Lerp(0, 0.5, var_254_27)

					arg_251_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1095ui_story.fillRatio = var_254_28
				end
			end

			if arg_251_1.time_ >= var_254_25 + var_254_26 and arg_251_1.time_ < var_254_25 + var_254_26 + arg_254_0 and arg_251_1.var_.characterEffect1095ui_story then
				local var_254_29 = 0.5

				arg_251_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1095ui_story.fillRatio = var_254_29
			end

			local var_254_30 = 0
			local var_254_31 = 0.825

			if var_254_30 < arg_251_1.time_ and arg_251_1.time_ <= var_254_30 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_32 = arg_251_1:FormatText(StoryNameCfg[453].name)

				arg_251_1.leftNameTxt_.text = var_254_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_33 = arg_251_1:GetWordFromCfg(319591061)
				local var_254_34 = arg_251_1:FormatText(var_254_33.content)

				arg_251_1.text_.text = var_254_34

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_35 = 33
				local var_254_36 = utf8.len(var_254_34)
				local var_254_37 = var_254_35 <= 0 and var_254_31 or var_254_31 * (var_254_36 / var_254_35)

				if var_254_37 > 0 and var_254_31 < var_254_37 then
					arg_251_1.talkMaxDuration = var_254_37

					if var_254_37 + var_254_30 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_37 + var_254_30
					end
				end

				arg_251_1.text_.text = var_254_34
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591061", "story_v_out_319591.awb") ~= 0 then
					local var_254_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591061", "story_v_out_319591.awb") / 1000

					if var_254_38 + var_254_30 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_38 + var_254_30
					end

					if var_254_33.prefab_name ~= "" and arg_251_1.actors_[var_254_33.prefab_name] ~= nil then
						local var_254_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_33.prefab_name].transform, "story_v_out_319591", "319591061", "story_v_out_319591.awb")

						arg_251_1:RecordAudio("319591061", var_254_39)
						arg_251_1:RecordAudio("319591061", var_254_39)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_319591", "319591061", "story_v_out_319591.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_319591", "319591061", "story_v_out_319591.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_40 = math.max(var_254_31, arg_251_1.talkMaxDuration)

			if var_254_30 <= arg_251_1.time_ and arg_251_1.time_ < var_254_30 + var_254_40 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_30) / var_254_40

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_30 + var_254_40 and arg_251_1.time_ < var_254_30 + var_254_40 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play319591062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 319591062
		arg_255_1.duration_ = 11.9

		local var_255_0 = {
			zh = 7.7,
			ja = 11.9
		}
		local var_255_1 = manager.audio:GetLocalizationFlag()

		if var_255_0[var_255_1] ~= nil then
			arg_255_1.duration_ = var_255_0[var_255_1]
		end

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play319591063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.675

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[453].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(319591062)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 27
				local var_258_6 = utf8.len(var_258_4)
				local var_258_7 = var_258_5 <= 0 and var_258_1 or var_258_1 * (var_258_6 / var_258_5)

				if var_258_7 > 0 and var_258_1 < var_258_7 then
					arg_255_1.talkMaxDuration = var_258_7

					if var_258_7 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_7 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_4
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591062", "story_v_out_319591.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_out_319591", "319591062", "story_v_out_319591.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_out_319591", "319591062", "story_v_out_319591.awb")

						arg_255_1:RecordAudio("319591062", var_258_9)
						arg_255_1:RecordAudio("319591062", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_319591", "319591062", "story_v_out_319591.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_319591", "319591062", "story_v_out_319591.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_10 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_10 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_10

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_10 and arg_255_1.time_ < var_258_0 + var_258_10 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play319591063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 319591063
		arg_259_1.duration_ = 15.2

		local var_259_0 = {
			zh = 8.733,
			ja = 15.2
		}
		local var_259_1 = manager.audio:GetLocalizationFlag()

		if var_259_0[var_259_1] ~= nil then
			arg_259_1.duration_ = var_259_0[var_259_1]
		end

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play319591064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1095ui_story"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1095ui_story = var_262_0.localPosition
			end

			local var_262_2 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2
				local var_262_4 = Vector3.New(0, -0.98, -6.1)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1095ui_story, var_262_4, var_262_3)

				local var_262_5 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_5.x, var_262_5.y, var_262_5.z)

				local var_262_6 = var_262_0.localEulerAngles

				var_262_6.z = 0
				var_262_6.x = 0
				var_262_0.localEulerAngles = var_262_6
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_262_7 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_7.x, var_262_7.y, var_262_7.z)

				local var_262_8 = var_262_0.localEulerAngles

				var_262_8.z = 0
				var_262_8.x = 0
				var_262_0.localEulerAngles = var_262_8
			end

			local var_262_9 = arg_259_1.actors_["1095ui_story"]
			local var_262_10 = 0

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 and arg_259_1.var_.characterEffect1095ui_story == nil then
				arg_259_1.var_.characterEffect1095ui_story = var_262_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_11 = 0.200000002980232

			if var_262_10 <= arg_259_1.time_ and arg_259_1.time_ < var_262_10 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_10) / var_262_11

				if arg_259_1.var_.characterEffect1095ui_story then
					arg_259_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_10 + var_262_11 and arg_259_1.time_ < var_262_10 + var_262_11 + arg_262_0 and arg_259_1.var_.characterEffect1095ui_story then
				arg_259_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_262_13 = 0

			if var_262_13 < arg_259_1.time_ and arg_259_1.time_ <= var_262_13 + arg_262_0 then
				arg_259_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_262_14 = 0

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 then
				arg_259_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_262_15 = arg_259_1.actors_["4037ui_story"].transform
			local var_262_16 = 0

			if var_262_16 < arg_259_1.time_ and arg_259_1.time_ <= var_262_16 + arg_262_0 then
				arg_259_1.var_.moveOldPos4037ui_story = var_262_15.localPosition
			end

			local var_262_17 = 0.001

			if var_262_16 <= arg_259_1.time_ and arg_259_1.time_ < var_262_16 + var_262_17 then
				local var_262_18 = (arg_259_1.time_ - var_262_16) / var_262_17
				local var_262_19 = Vector3.New(0, 100, 0)

				var_262_15.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos4037ui_story, var_262_19, var_262_18)

				local var_262_20 = manager.ui.mainCamera.transform.position - var_262_15.position

				var_262_15.forward = Vector3.New(var_262_20.x, var_262_20.y, var_262_20.z)

				local var_262_21 = var_262_15.localEulerAngles

				var_262_21.z = 0
				var_262_21.x = 0
				var_262_15.localEulerAngles = var_262_21
			end

			if arg_259_1.time_ >= var_262_16 + var_262_17 and arg_259_1.time_ < var_262_16 + var_262_17 + arg_262_0 then
				var_262_15.localPosition = Vector3.New(0, 100, 0)

				local var_262_22 = manager.ui.mainCamera.transform.position - var_262_15.position

				var_262_15.forward = Vector3.New(var_262_22.x, var_262_22.y, var_262_22.z)

				local var_262_23 = var_262_15.localEulerAngles

				var_262_23.z = 0
				var_262_23.x = 0
				var_262_15.localEulerAngles = var_262_23
			end

			local var_262_24 = arg_259_1.actors_["4037ui_story"]
			local var_262_25 = 0

			if var_262_25 < arg_259_1.time_ and arg_259_1.time_ <= var_262_25 + arg_262_0 and arg_259_1.var_.characterEffect4037ui_story == nil then
				arg_259_1.var_.characterEffect4037ui_story = var_262_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_26 = 0.200000002980232

			if var_262_25 <= arg_259_1.time_ and arg_259_1.time_ < var_262_25 + var_262_26 then
				local var_262_27 = (arg_259_1.time_ - var_262_25) / var_262_26

				if arg_259_1.var_.characterEffect4037ui_story then
					local var_262_28 = Mathf.Lerp(0, 0.5, var_262_27)

					arg_259_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_259_1.var_.characterEffect4037ui_story.fillRatio = var_262_28
				end
			end

			if arg_259_1.time_ >= var_262_25 + var_262_26 and arg_259_1.time_ < var_262_25 + var_262_26 + arg_262_0 and arg_259_1.var_.characterEffect4037ui_story then
				local var_262_29 = 0.5

				arg_259_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_259_1.var_.characterEffect4037ui_story.fillRatio = var_262_29
			end

			local var_262_30 = 0
			local var_262_31 = 0.875

			if var_262_30 < arg_259_1.time_ and arg_259_1.time_ <= var_262_30 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_32 = arg_259_1:FormatText(StoryNameCfg[471].name)

				arg_259_1.leftNameTxt_.text = var_262_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_33 = arg_259_1:GetWordFromCfg(319591063)
				local var_262_34 = arg_259_1:FormatText(var_262_33.content)

				arg_259_1.text_.text = var_262_34

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_35 = 35
				local var_262_36 = utf8.len(var_262_34)
				local var_262_37 = var_262_35 <= 0 and var_262_31 or var_262_31 * (var_262_36 / var_262_35)

				if var_262_37 > 0 and var_262_31 < var_262_37 then
					arg_259_1.talkMaxDuration = var_262_37

					if var_262_37 + var_262_30 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_37 + var_262_30
					end
				end

				arg_259_1.text_.text = var_262_34
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591063", "story_v_out_319591.awb") ~= 0 then
					local var_262_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591063", "story_v_out_319591.awb") / 1000

					if var_262_38 + var_262_30 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_38 + var_262_30
					end

					if var_262_33.prefab_name ~= "" and arg_259_1.actors_[var_262_33.prefab_name] ~= nil then
						local var_262_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_33.prefab_name].transform, "story_v_out_319591", "319591063", "story_v_out_319591.awb")

						arg_259_1:RecordAudio("319591063", var_262_39)
						arg_259_1:RecordAudio("319591063", var_262_39)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_319591", "319591063", "story_v_out_319591.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_319591", "319591063", "story_v_out_319591.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_40 = math.max(var_262_31, arg_259_1.talkMaxDuration)

			if var_262_30 <= arg_259_1.time_ and arg_259_1.time_ < var_262_30 + var_262_40 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_30) / var_262_40

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_30 + var_262_40 and arg_259_1.time_ < var_262_30 + var_262_40 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play319591064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 319591064
		arg_263_1.duration_ = 3.066

		local var_263_0 = {
			zh = 2.333,
			ja = 3.066
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
				arg_263_0:Play319591065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["4037ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos4037ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(0, -1.12, -6.2)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos4037ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["4037ui_story"]
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 and arg_263_1.var_.characterEffect4037ui_story == nil then
				arg_263_1.var_.characterEffect4037ui_story = var_266_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_11 = 0.200000002980232

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_10) / var_266_11

				if arg_263_1.var_.characterEffect4037ui_story then
					arg_263_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_10 + var_266_11 and arg_263_1.time_ < var_266_10 + var_266_11 + arg_266_0 and arg_263_1.var_.characterEffect4037ui_story then
				arg_263_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_266_13 = 0

			if var_266_13 < arg_263_1.time_ and arg_263_1.time_ <= var_266_13 + arg_266_0 then
				arg_263_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action3_2")
			end

			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_266_15 = arg_263_1.actors_["1095ui_story"].transform
			local var_266_16 = 0

			if var_266_16 < arg_263_1.time_ and arg_263_1.time_ <= var_266_16 + arg_266_0 then
				arg_263_1.var_.moveOldPos1095ui_story = var_266_15.localPosition
			end

			local var_266_17 = 0.001

			if var_266_16 <= arg_263_1.time_ and arg_263_1.time_ < var_266_16 + var_266_17 then
				local var_266_18 = (arg_263_1.time_ - var_266_16) / var_266_17
				local var_266_19 = Vector3.New(0, 100, 0)

				var_266_15.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1095ui_story, var_266_19, var_266_18)

				local var_266_20 = manager.ui.mainCamera.transform.position - var_266_15.position

				var_266_15.forward = Vector3.New(var_266_20.x, var_266_20.y, var_266_20.z)

				local var_266_21 = var_266_15.localEulerAngles

				var_266_21.z = 0
				var_266_21.x = 0
				var_266_15.localEulerAngles = var_266_21
			end

			if arg_263_1.time_ >= var_266_16 + var_266_17 and arg_263_1.time_ < var_266_16 + var_266_17 + arg_266_0 then
				var_266_15.localPosition = Vector3.New(0, 100, 0)

				local var_266_22 = manager.ui.mainCamera.transform.position - var_266_15.position

				var_266_15.forward = Vector3.New(var_266_22.x, var_266_22.y, var_266_22.z)

				local var_266_23 = var_266_15.localEulerAngles

				var_266_23.z = 0
				var_266_23.x = 0
				var_266_15.localEulerAngles = var_266_23
			end

			local var_266_24 = arg_263_1.actors_["1095ui_story"]
			local var_266_25 = 0

			if var_266_25 < arg_263_1.time_ and arg_263_1.time_ <= var_266_25 + arg_266_0 and arg_263_1.var_.characterEffect1095ui_story == nil then
				arg_263_1.var_.characterEffect1095ui_story = var_266_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_26 = 0.200000002980232

			if var_266_25 <= arg_263_1.time_ and arg_263_1.time_ < var_266_25 + var_266_26 then
				local var_266_27 = (arg_263_1.time_ - var_266_25) / var_266_26

				if arg_263_1.var_.characterEffect1095ui_story then
					local var_266_28 = Mathf.Lerp(0, 0.5, var_266_27)

					arg_263_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_263_1.var_.characterEffect1095ui_story.fillRatio = var_266_28
				end
			end

			if arg_263_1.time_ >= var_266_25 + var_266_26 and arg_263_1.time_ < var_266_25 + var_266_26 + arg_266_0 and arg_263_1.var_.characterEffect1095ui_story then
				local var_266_29 = 0.5

				arg_263_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_263_1.var_.characterEffect1095ui_story.fillRatio = var_266_29
			end

			local var_266_30 = 0
			local var_266_31 = 0.25

			if var_266_30 < arg_263_1.time_ and arg_263_1.time_ <= var_266_30 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_32 = arg_263_1:FormatText(StoryNameCfg[453].name)

				arg_263_1.leftNameTxt_.text = var_266_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_33 = arg_263_1:GetWordFromCfg(319591064)
				local var_266_34 = arg_263_1:FormatText(var_266_33.content)

				arg_263_1.text_.text = var_266_34

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_35 = 10
				local var_266_36 = utf8.len(var_266_34)
				local var_266_37 = var_266_35 <= 0 and var_266_31 or var_266_31 * (var_266_36 / var_266_35)

				if var_266_37 > 0 and var_266_31 < var_266_37 then
					arg_263_1.talkMaxDuration = var_266_37

					if var_266_37 + var_266_30 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_37 + var_266_30
					end
				end

				arg_263_1.text_.text = var_266_34
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591064", "story_v_out_319591.awb") ~= 0 then
					local var_266_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591064", "story_v_out_319591.awb") / 1000

					if var_266_38 + var_266_30 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_38 + var_266_30
					end

					if var_266_33.prefab_name ~= "" and arg_263_1.actors_[var_266_33.prefab_name] ~= nil then
						local var_266_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_33.prefab_name].transform, "story_v_out_319591", "319591064", "story_v_out_319591.awb")

						arg_263_1:RecordAudio("319591064", var_266_39)
						arg_263_1:RecordAudio("319591064", var_266_39)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_319591", "319591064", "story_v_out_319591.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_319591", "319591064", "story_v_out_319591.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_40 = math.max(var_266_31, arg_263_1.talkMaxDuration)

			if var_266_30 <= arg_263_1.time_ and arg_263_1.time_ < var_266_30 + var_266_40 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_30) / var_266_40

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_30 + var_266_40 and arg_263_1.time_ < var_266_30 + var_266_40 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play319591065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 319591065
		arg_267_1.duration_ = 6.3

		local var_267_0 = {
			zh = 2.866,
			ja = 6.3
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
				arg_267_0:Play319591066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1095ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1095ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0, -0.98, -6.1)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1095ui_story, var_270_4, var_270_3)

				local var_270_5 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_5.x, var_270_5.y, var_270_5.z)

				local var_270_6 = var_270_0.localEulerAngles

				var_270_6.z = 0
				var_270_6.x = 0
				var_270_0.localEulerAngles = var_270_6
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_270_7 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_7.x, var_270_7.y, var_270_7.z)

				local var_270_8 = var_270_0.localEulerAngles

				var_270_8.z = 0
				var_270_8.x = 0
				var_270_0.localEulerAngles = var_270_8
			end

			local var_270_9 = arg_267_1.actors_["1095ui_story"]
			local var_270_10 = 0

			if var_270_10 < arg_267_1.time_ and arg_267_1.time_ <= var_270_10 + arg_270_0 and arg_267_1.var_.characterEffect1095ui_story == nil then
				arg_267_1.var_.characterEffect1095ui_story = var_270_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_11 = 0.200000002980232

			if var_270_10 <= arg_267_1.time_ and arg_267_1.time_ < var_270_10 + var_270_11 then
				local var_270_12 = (arg_267_1.time_ - var_270_10) / var_270_11

				if arg_267_1.var_.characterEffect1095ui_story then
					arg_267_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_10 + var_270_11 and arg_267_1.time_ < var_270_10 + var_270_11 + arg_270_0 and arg_267_1.var_.characterEffect1095ui_story then
				arg_267_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_270_13 = arg_267_1.actors_["4037ui_story"].transform
			local var_270_14 = 0

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 then
				arg_267_1.var_.moveOldPos4037ui_story = var_270_13.localPosition
			end

			local var_270_15 = 0.001

			if var_270_14 <= arg_267_1.time_ and arg_267_1.time_ < var_270_14 + var_270_15 then
				local var_270_16 = (arg_267_1.time_ - var_270_14) / var_270_15
				local var_270_17 = Vector3.New(0, 100, 0)

				var_270_13.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos4037ui_story, var_270_17, var_270_16)

				local var_270_18 = manager.ui.mainCamera.transform.position - var_270_13.position

				var_270_13.forward = Vector3.New(var_270_18.x, var_270_18.y, var_270_18.z)

				local var_270_19 = var_270_13.localEulerAngles

				var_270_19.z = 0
				var_270_19.x = 0
				var_270_13.localEulerAngles = var_270_19
			end

			if arg_267_1.time_ >= var_270_14 + var_270_15 and arg_267_1.time_ < var_270_14 + var_270_15 + arg_270_0 then
				var_270_13.localPosition = Vector3.New(0, 100, 0)

				local var_270_20 = manager.ui.mainCamera.transform.position - var_270_13.position

				var_270_13.forward = Vector3.New(var_270_20.x, var_270_20.y, var_270_20.z)

				local var_270_21 = var_270_13.localEulerAngles

				var_270_21.z = 0
				var_270_21.x = 0
				var_270_13.localEulerAngles = var_270_21
			end

			local var_270_22 = arg_267_1.actors_["4037ui_story"]
			local var_270_23 = 0

			if var_270_23 < arg_267_1.time_ and arg_267_1.time_ <= var_270_23 + arg_270_0 and arg_267_1.var_.characterEffect4037ui_story == nil then
				arg_267_1.var_.characterEffect4037ui_story = var_270_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_24 = 0.200000002980232

			if var_270_23 <= arg_267_1.time_ and arg_267_1.time_ < var_270_23 + var_270_24 then
				local var_270_25 = (arg_267_1.time_ - var_270_23) / var_270_24

				if arg_267_1.var_.characterEffect4037ui_story then
					local var_270_26 = Mathf.Lerp(0, 0.5, var_270_25)

					arg_267_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_267_1.var_.characterEffect4037ui_story.fillRatio = var_270_26
				end
			end

			if arg_267_1.time_ >= var_270_23 + var_270_24 and arg_267_1.time_ < var_270_23 + var_270_24 + arg_270_0 and arg_267_1.var_.characterEffect4037ui_story then
				local var_270_27 = 0.5

				arg_267_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_267_1.var_.characterEffect4037ui_story.fillRatio = var_270_27
			end

			local var_270_28 = 0
			local var_270_29 = 0.275

			if var_270_28 < arg_267_1.time_ and arg_267_1.time_ <= var_270_28 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_30 = arg_267_1:FormatText(StoryNameCfg[471].name)

				arg_267_1.leftNameTxt_.text = var_270_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_31 = arg_267_1:GetWordFromCfg(319591065)
				local var_270_32 = arg_267_1:FormatText(var_270_31.content)

				arg_267_1.text_.text = var_270_32

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_33 = 11
				local var_270_34 = utf8.len(var_270_32)
				local var_270_35 = var_270_33 <= 0 and var_270_29 or var_270_29 * (var_270_34 / var_270_33)

				if var_270_35 > 0 and var_270_29 < var_270_35 then
					arg_267_1.talkMaxDuration = var_270_35

					if var_270_35 + var_270_28 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_35 + var_270_28
					end
				end

				arg_267_1.text_.text = var_270_32
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591065", "story_v_out_319591.awb") ~= 0 then
					local var_270_36 = manager.audio:GetVoiceLength("story_v_out_319591", "319591065", "story_v_out_319591.awb") / 1000

					if var_270_36 + var_270_28 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_36 + var_270_28
					end

					if var_270_31.prefab_name ~= "" and arg_267_1.actors_[var_270_31.prefab_name] ~= nil then
						local var_270_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_31.prefab_name].transform, "story_v_out_319591", "319591065", "story_v_out_319591.awb")

						arg_267_1:RecordAudio("319591065", var_270_37)
						arg_267_1:RecordAudio("319591065", var_270_37)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_319591", "319591065", "story_v_out_319591.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_319591", "319591065", "story_v_out_319591.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_38 = math.max(var_270_29, arg_267_1.talkMaxDuration)

			if var_270_28 <= arg_267_1.time_ and arg_267_1.time_ < var_270_28 + var_270_38 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_28) / var_270_38

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_28 + var_270_38 and arg_267_1.time_ < var_270_28 + var_270_38 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play319591066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 319591066
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play319591067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["4037ui_story"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos4037ui_story = var_274_0.localPosition
			end

			local var_274_2 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2
				local var_274_4 = Vector3.New(0, 100, 0)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos4037ui_story, var_274_4, var_274_3)

				local var_274_5 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_5.x, var_274_5.y, var_274_5.z)

				local var_274_6 = var_274_0.localEulerAngles

				var_274_6.z = 0
				var_274_6.x = 0
				var_274_0.localEulerAngles = var_274_6
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(0, 100, 0)

				local var_274_7 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_7.x, var_274_7.y, var_274_7.z)

				local var_274_8 = var_274_0.localEulerAngles

				var_274_8.z = 0
				var_274_8.x = 0
				var_274_0.localEulerAngles = var_274_8
			end

			local var_274_9 = arg_271_1.actors_["1095ui_story"]
			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 and arg_271_1.var_.characterEffect1095ui_story == nil then
				arg_271_1.var_.characterEffect1095ui_story = var_274_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_11 = 0.200000002980232

			if var_274_10 <= arg_271_1.time_ and arg_271_1.time_ < var_274_10 + var_274_11 then
				local var_274_12 = (arg_271_1.time_ - var_274_10) / var_274_11

				if arg_271_1.var_.characterEffect1095ui_story then
					local var_274_13 = Mathf.Lerp(0, 0.5, var_274_12)

					arg_271_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1095ui_story.fillRatio = var_274_13
				end
			end

			if arg_271_1.time_ >= var_274_10 + var_274_11 and arg_271_1.time_ < var_274_10 + var_274_11 + arg_274_0 and arg_271_1.var_.characterEffect1095ui_story then
				local var_274_14 = 0.5

				arg_271_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1095ui_story.fillRatio = var_274_14
			end

			local var_274_15 = 0
			local var_274_16 = 0.725

			if var_274_15 < arg_271_1.time_ and arg_271_1.time_ <= var_274_15 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_17 = arg_271_1:GetWordFromCfg(319591066)
				local var_274_18 = arg_271_1:FormatText(var_274_17.content)

				arg_271_1.text_.text = var_274_18

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_19 = 29
				local var_274_20 = utf8.len(var_274_18)
				local var_274_21 = var_274_19 <= 0 and var_274_16 or var_274_16 * (var_274_20 / var_274_19)

				if var_274_21 > 0 and var_274_16 < var_274_21 then
					arg_271_1.talkMaxDuration = var_274_21

					if var_274_21 + var_274_15 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_21 + var_274_15
					end
				end

				arg_271_1.text_.text = var_274_18
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_22 = math.max(var_274_16, arg_271_1.talkMaxDuration)

			if var_274_15 <= arg_271_1.time_ and arg_271_1.time_ < var_274_15 + var_274_22 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_15) / var_274_22

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_15 + var_274_22 and arg_271_1.time_ < var_274_15 + var_274_22 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play319591067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 319591067
		arg_275_1.duration_ = 5

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play319591068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0
			local var_278_1 = 1.15

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, false)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_2 = arg_275_1:GetWordFromCfg(319591067)
				local var_278_3 = arg_275_1:FormatText(var_278_2.content)

				arg_275_1.text_.text = var_278_3

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_4 = 46
				local var_278_5 = utf8.len(var_278_3)
				local var_278_6 = var_278_4 <= 0 and var_278_1 or var_278_1 * (var_278_5 / var_278_4)

				if var_278_6 > 0 and var_278_1 < var_278_6 then
					arg_275_1.talkMaxDuration = var_278_6

					if var_278_6 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_6 + var_278_0
					end
				end

				arg_275_1.text_.text = var_278_3
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_7 = math.max(var_278_1, arg_275_1.talkMaxDuration)

			if var_278_0 <= arg_275_1.time_ and arg_275_1.time_ < var_278_0 + var_278_7 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_0) / var_278_7

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_0 + var_278_7 and arg_275_1.time_ < var_278_0 + var_278_7 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play319591068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 319591068
		arg_279_1.duration_ = 2.533

		local var_279_0 = {
			zh = 1.7,
			ja = 2.533
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
				arg_279_0:Play319591069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1095ui_story"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos1095ui_story = var_282_0.localPosition
			end

			local var_282_2 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2
				local var_282_4 = Vector3.New(0, -0.98, -6.1)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1095ui_story, var_282_4, var_282_3)

				local var_282_5 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_5.x, var_282_5.y, var_282_5.z)

				local var_282_6 = var_282_0.localEulerAngles

				var_282_6.z = 0
				var_282_6.x = 0
				var_282_0.localEulerAngles = var_282_6
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_282_7 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_7.x, var_282_7.y, var_282_7.z)

				local var_282_8 = var_282_0.localEulerAngles

				var_282_8.z = 0
				var_282_8.x = 0
				var_282_0.localEulerAngles = var_282_8
			end

			local var_282_9 = arg_279_1.actors_["1095ui_story"]
			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 and arg_279_1.var_.characterEffect1095ui_story == nil then
				arg_279_1.var_.characterEffect1095ui_story = var_282_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_11 = 0.200000002980232

			if var_282_10 <= arg_279_1.time_ and arg_279_1.time_ < var_282_10 + var_282_11 then
				local var_282_12 = (arg_279_1.time_ - var_282_10) / var_282_11

				if arg_279_1.var_.characterEffect1095ui_story then
					arg_279_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_10 + var_282_11 and arg_279_1.time_ < var_282_10 + var_282_11 + arg_282_0 and arg_279_1.var_.characterEffect1095ui_story then
				arg_279_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_282_13 = 0

			if var_282_13 < arg_279_1.time_ and arg_279_1.time_ <= var_282_13 + arg_282_0 then
				arg_279_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_282_14 = 0

			if var_282_14 < arg_279_1.time_ and arg_279_1.time_ <= var_282_14 + arg_282_0 then
				arg_279_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_282_15 = 0
			local var_282_16 = 0.2

			if var_282_15 < arg_279_1.time_ and arg_279_1.time_ <= var_282_15 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_17 = arg_279_1:FormatText(StoryNameCfg[471].name)

				arg_279_1.leftNameTxt_.text = var_282_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_18 = arg_279_1:GetWordFromCfg(319591068)
				local var_282_19 = arg_279_1:FormatText(var_282_18.content)

				arg_279_1.text_.text = var_282_19

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_20 = 8
				local var_282_21 = utf8.len(var_282_19)
				local var_282_22 = var_282_20 <= 0 and var_282_16 or var_282_16 * (var_282_21 / var_282_20)

				if var_282_22 > 0 and var_282_16 < var_282_22 then
					arg_279_1.talkMaxDuration = var_282_22

					if var_282_22 + var_282_15 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_22 + var_282_15
					end
				end

				arg_279_1.text_.text = var_282_19
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591068", "story_v_out_319591.awb") ~= 0 then
					local var_282_23 = manager.audio:GetVoiceLength("story_v_out_319591", "319591068", "story_v_out_319591.awb") / 1000

					if var_282_23 + var_282_15 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_23 + var_282_15
					end

					if var_282_18.prefab_name ~= "" and arg_279_1.actors_[var_282_18.prefab_name] ~= nil then
						local var_282_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_18.prefab_name].transform, "story_v_out_319591", "319591068", "story_v_out_319591.awb")

						arg_279_1:RecordAudio("319591068", var_282_24)
						arg_279_1:RecordAudio("319591068", var_282_24)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_319591", "319591068", "story_v_out_319591.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_319591", "319591068", "story_v_out_319591.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_25 = math.max(var_282_16, arg_279_1.talkMaxDuration)

			if var_282_15 <= arg_279_1.time_ and arg_279_1.time_ < var_282_15 + var_282_25 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_15) / var_282_25

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_15 + var_282_25 and arg_279_1.time_ < var_282_15 + var_282_25 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play319591069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 319591069
		arg_283_1.duration_ = 4.533

		local var_283_0 = {
			zh = 3.6,
			ja = 4.533
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
				arg_283_0:Play319591070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1095ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect1095ui_story == nil then
				arg_283_1.var_.characterEffect1095ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.200000002980232

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect1095ui_story then
					local var_286_4 = Mathf.Lerp(0, 0.5, var_286_3)

					arg_283_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1095ui_story.fillRatio = var_286_4
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect1095ui_story then
				local var_286_5 = 0.5

				arg_283_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1095ui_story.fillRatio = var_286_5
			end

			local var_286_6 = 0
			local var_286_7 = 0.5

			if var_286_6 < arg_283_1.time_ and arg_283_1.time_ <= var_286_6 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_8 = arg_283_1:FormatText(StoryNameCfg[694].name)

				arg_283_1.leftNameTxt_.text = var_286_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, true)
				arg_283_1.iconController_:SetSelectedState("hero")

				arg_283_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10072")

				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_9 = arg_283_1:GetWordFromCfg(319591069)
				local var_286_10 = arg_283_1:FormatText(var_286_9.content)

				arg_283_1.text_.text = var_286_10

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_11 = 20
				local var_286_12 = utf8.len(var_286_10)
				local var_286_13 = var_286_11 <= 0 and var_286_7 or var_286_7 * (var_286_12 / var_286_11)

				if var_286_13 > 0 and var_286_7 < var_286_13 then
					arg_283_1.talkMaxDuration = var_286_13

					if var_286_13 + var_286_6 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_13 + var_286_6
					end
				end

				arg_283_1.text_.text = var_286_10
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591069", "story_v_out_319591.awb") ~= 0 then
					local var_286_14 = manager.audio:GetVoiceLength("story_v_out_319591", "319591069", "story_v_out_319591.awb") / 1000

					if var_286_14 + var_286_6 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_14 + var_286_6
					end

					if var_286_9.prefab_name ~= "" and arg_283_1.actors_[var_286_9.prefab_name] ~= nil then
						local var_286_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_9.prefab_name].transform, "story_v_out_319591", "319591069", "story_v_out_319591.awb")

						arg_283_1:RecordAudio("319591069", var_286_15)
						arg_283_1:RecordAudio("319591069", var_286_15)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_319591", "319591069", "story_v_out_319591.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_319591", "319591069", "story_v_out_319591.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_16 = math.max(var_286_7, arg_283_1.talkMaxDuration)

			if var_286_6 <= arg_283_1.time_ and arg_283_1.time_ < var_286_6 + var_286_16 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_6) / var_286_16

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_6 + var_286_16 and arg_283_1.time_ < var_286_6 + var_286_16 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play319591070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 319591070
		arg_287_1.duration_ = 1.166

		local var_287_0 = {
			zh = 0.999999999999,
			ja = 1.166
		}
		local var_287_1 = manager.audio:GetLocalizationFlag()

		if var_287_0[var_287_1] ~= nil then
			arg_287_1.duration_ = var_287_0[var_287_1]
		end

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play319591071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1095ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1095ui_story == nil then
				arg_287_1.var_.characterEffect1095ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.200000002980232

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1095ui_story then
					arg_287_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1095ui_story then
				arg_287_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_290_4 = 0
			local var_290_5 = 0.075

			if var_290_4 < arg_287_1.time_ and arg_287_1.time_ <= var_290_4 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_6 = arg_287_1:FormatText(StoryNameCfg[471].name)

				arg_287_1.leftNameTxt_.text = var_290_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_7 = arg_287_1:GetWordFromCfg(319591070)
				local var_290_8 = arg_287_1:FormatText(var_290_7.content)

				arg_287_1.text_.text = var_290_8

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_9 = 3
				local var_290_10 = utf8.len(var_290_8)
				local var_290_11 = var_290_9 <= 0 and var_290_5 or var_290_5 * (var_290_10 / var_290_9)

				if var_290_11 > 0 and var_290_5 < var_290_11 then
					arg_287_1.talkMaxDuration = var_290_11

					if var_290_11 + var_290_4 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_11 + var_290_4
					end
				end

				arg_287_1.text_.text = var_290_8
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591070", "story_v_out_319591.awb") ~= 0 then
					local var_290_12 = manager.audio:GetVoiceLength("story_v_out_319591", "319591070", "story_v_out_319591.awb") / 1000

					if var_290_12 + var_290_4 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_12 + var_290_4
					end

					if var_290_7.prefab_name ~= "" and arg_287_1.actors_[var_290_7.prefab_name] ~= nil then
						local var_290_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_7.prefab_name].transform, "story_v_out_319591", "319591070", "story_v_out_319591.awb")

						arg_287_1:RecordAudio("319591070", var_290_13)
						arg_287_1:RecordAudio("319591070", var_290_13)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_319591", "319591070", "story_v_out_319591.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_319591", "319591070", "story_v_out_319591.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_14 = math.max(var_290_5, arg_287_1.talkMaxDuration)

			if var_290_4 <= arg_287_1.time_ and arg_287_1.time_ < var_290_4 + var_290_14 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_4) / var_290_14

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_4 + var_290_14 and arg_287_1.time_ < var_290_4 + var_290_14 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play319591071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 319591071
		arg_291_1.duration_ = 8.666

		local var_291_0 = {
			zh = 6.3,
			ja = 8.666
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play319591072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["4037ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos4037ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0, -1.12, -6.2)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos4037ui_story, var_294_4, var_294_3)

				local var_294_5 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_5.x, var_294_5.y, var_294_5.z)

				local var_294_6 = var_294_0.localEulerAngles

				var_294_6.z = 0
				var_294_6.x = 0
				var_294_0.localEulerAngles = var_294_6
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_294_7 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_7.x, var_294_7.y, var_294_7.z)

				local var_294_8 = var_294_0.localEulerAngles

				var_294_8.z = 0
				var_294_8.x = 0
				var_294_0.localEulerAngles = var_294_8
			end

			local var_294_9 = arg_291_1.actors_["4037ui_story"]
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 and arg_291_1.var_.characterEffect4037ui_story == nil then
				arg_291_1.var_.characterEffect4037ui_story = var_294_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_11 = 0.200000002980232

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11

				if arg_291_1.var_.characterEffect4037ui_story then
					arg_291_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 and arg_291_1.var_.characterEffect4037ui_story then
				arg_291_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_294_13 = 0

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_294_14 = 0

			if var_294_14 < arg_291_1.time_ and arg_291_1.time_ <= var_294_14 + arg_294_0 then
				arg_291_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_294_15 = arg_291_1.actors_["1095ui_story"].transform
			local var_294_16 = 0

			if var_294_16 < arg_291_1.time_ and arg_291_1.time_ <= var_294_16 + arg_294_0 then
				arg_291_1.var_.moveOldPos1095ui_story = var_294_15.localPosition
			end

			local var_294_17 = 0.001

			if var_294_16 <= arg_291_1.time_ and arg_291_1.time_ < var_294_16 + var_294_17 then
				local var_294_18 = (arg_291_1.time_ - var_294_16) / var_294_17
				local var_294_19 = Vector3.New(0, 100, 0)

				var_294_15.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1095ui_story, var_294_19, var_294_18)

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

			local var_294_24 = arg_291_1.actors_["1095ui_story"]
			local var_294_25 = 0

			if var_294_25 < arg_291_1.time_ and arg_291_1.time_ <= var_294_25 + arg_294_0 and arg_291_1.var_.characterEffect1095ui_story == nil then
				arg_291_1.var_.characterEffect1095ui_story = var_294_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_26 = 0.200000002980232

			if var_294_25 <= arg_291_1.time_ and arg_291_1.time_ < var_294_25 + var_294_26 then
				local var_294_27 = (arg_291_1.time_ - var_294_25) / var_294_26

				if arg_291_1.var_.characterEffect1095ui_story then
					local var_294_28 = Mathf.Lerp(0, 0.5, var_294_27)

					arg_291_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1095ui_story.fillRatio = var_294_28
				end
			end

			if arg_291_1.time_ >= var_294_25 + var_294_26 and arg_291_1.time_ < var_294_25 + var_294_26 + arg_294_0 and arg_291_1.var_.characterEffect1095ui_story then
				local var_294_29 = 0.5

				arg_291_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1095ui_story.fillRatio = var_294_29
			end

			local var_294_30 = 0
			local var_294_31 = 0.525

			if var_294_30 < arg_291_1.time_ and arg_291_1.time_ <= var_294_30 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_32 = arg_291_1:FormatText(StoryNameCfg[453].name)

				arg_291_1.leftNameTxt_.text = var_294_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_33 = arg_291_1:GetWordFromCfg(319591071)
				local var_294_34 = arg_291_1:FormatText(var_294_33.content)

				arg_291_1.text_.text = var_294_34

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_35 = 21
				local var_294_36 = utf8.len(var_294_34)
				local var_294_37 = var_294_35 <= 0 and var_294_31 or var_294_31 * (var_294_36 / var_294_35)

				if var_294_37 > 0 and var_294_31 < var_294_37 then
					arg_291_1.talkMaxDuration = var_294_37

					if var_294_37 + var_294_30 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_37 + var_294_30
					end
				end

				arg_291_1.text_.text = var_294_34
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591071", "story_v_out_319591.awb") ~= 0 then
					local var_294_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591071", "story_v_out_319591.awb") / 1000

					if var_294_38 + var_294_30 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_38 + var_294_30
					end

					if var_294_33.prefab_name ~= "" and arg_291_1.actors_[var_294_33.prefab_name] ~= nil then
						local var_294_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_33.prefab_name].transform, "story_v_out_319591", "319591071", "story_v_out_319591.awb")

						arg_291_1:RecordAudio("319591071", var_294_39)
						arg_291_1:RecordAudio("319591071", var_294_39)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_319591", "319591071", "story_v_out_319591.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_319591", "319591071", "story_v_out_319591.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_40 = math.max(var_294_31, arg_291_1.talkMaxDuration)

			if var_294_30 <= arg_291_1.time_ and arg_291_1.time_ < var_294_30 + var_294_40 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_30) / var_294_40

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_30 + var_294_40 and arg_291_1.time_ < var_294_30 + var_294_40 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play319591072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 319591072
		arg_295_1.duration_ = 7.433

		local var_295_0 = {
			zh = 2.866,
			ja = 7.433
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
				arg_295_0:Play319591073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["4040ui_story"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos4040ui_story = var_298_0.localPosition
			end

			local var_298_2 = 0.001

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2
				local var_298_4 = Vector3.New(0, -1.55, -5.5)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos4040ui_story, var_298_4, var_298_3)

				local var_298_5 = manager.ui.mainCamera.transform.position - var_298_0.position

				var_298_0.forward = Vector3.New(var_298_5.x, var_298_5.y, var_298_5.z)

				local var_298_6 = var_298_0.localEulerAngles

				var_298_6.z = 0
				var_298_6.x = 0
				var_298_0.localEulerAngles = var_298_6
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_298_7 = manager.ui.mainCamera.transform.position - var_298_0.position

				var_298_0.forward = Vector3.New(var_298_7.x, var_298_7.y, var_298_7.z)

				local var_298_8 = var_298_0.localEulerAngles

				var_298_8.z = 0
				var_298_8.x = 0
				var_298_0.localEulerAngles = var_298_8
			end

			local var_298_9 = arg_295_1.actors_["4040ui_story"]
			local var_298_10 = 0

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 and arg_295_1.var_.characterEffect4040ui_story == nil then
				arg_295_1.var_.characterEffect4040ui_story = var_298_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_11 = 0.200000002980232

			if var_298_10 <= arg_295_1.time_ and arg_295_1.time_ < var_298_10 + var_298_11 then
				local var_298_12 = (arg_295_1.time_ - var_298_10) / var_298_11

				if arg_295_1.var_.characterEffect4040ui_story then
					arg_295_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_10 + var_298_11 and arg_295_1.time_ < var_298_10 + var_298_11 + arg_298_0 and arg_295_1.var_.characterEffect4040ui_story then
				arg_295_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_298_13 = 0

			if var_298_13 < arg_295_1.time_ and arg_295_1.time_ <= var_298_13 + arg_298_0 then
				arg_295_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 then
				arg_295_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_298_15 = arg_295_1.actors_["4037ui_story"].transform
			local var_298_16 = 0

			if var_298_16 < arg_295_1.time_ and arg_295_1.time_ <= var_298_16 + arg_298_0 then
				arg_295_1.var_.moveOldPos4037ui_story = var_298_15.localPosition
			end

			local var_298_17 = 0.001

			if var_298_16 <= arg_295_1.time_ and arg_295_1.time_ < var_298_16 + var_298_17 then
				local var_298_18 = (arg_295_1.time_ - var_298_16) / var_298_17
				local var_298_19 = Vector3.New(0, 100, 0)

				var_298_15.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos4037ui_story, var_298_19, var_298_18)

				local var_298_20 = manager.ui.mainCamera.transform.position - var_298_15.position

				var_298_15.forward = Vector3.New(var_298_20.x, var_298_20.y, var_298_20.z)

				local var_298_21 = var_298_15.localEulerAngles

				var_298_21.z = 0
				var_298_21.x = 0
				var_298_15.localEulerAngles = var_298_21
			end

			if arg_295_1.time_ >= var_298_16 + var_298_17 and arg_295_1.time_ < var_298_16 + var_298_17 + arg_298_0 then
				var_298_15.localPosition = Vector3.New(0, 100, 0)

				local var_298_22 = manager.ui.mainCamera.transform.position - var_298_15.position

				var_298_15.forward = Vector3.New(var_298_22.x, var_298_22.y, var_298_22.z)

				local var_298_23 = var_298_15.localEulerAngles

				var_298_23.z = 0
				var_298_23.x = 0
				var_298_15.localEulerAngles = var_298_23
			end

			local var_298_24 = arg_295_1.actors_["4037ui_story"]
			local var_298_25 = 0

			if var_298_25 < arg_295_1.time_ and arg_295_1.time_ <= var_298_25 + arg_298_0 and arg_295_1.var_.characterEffect4037ui_story == nil then
				arg_295_1.var_.characterEffect4037ui_story = var_298_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_26 = 0.200000002980232

			if var_298_25 <= arg_295_1.time_ and arg_295_1.time_ < var_298_25 + var_298_26 then
				local var_298_27 = (arg_295_1.time_ - var_298_25) / var_298_26

				if arg_295_1.var_.characterEffect4037ui_story then
					local var_298_28 = Mathf.Lerp(0, 0.5, var_298_27)

					arg_295_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_295_1.var_.characterEffect4037ui_story.fillRatio = var_298_28
				end
			end

			if arg_295_1.time_ >= var_298_25 + var_298_26 and arg_295_1.time_ < var_298_25 + var_298_26 + arg_298_0 and arg_295_1.var_.characterEffect4037ui_story then
				local var_298_29 = 0.5

				arg_295_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_295_1.var_.characterEffect4037ui_story.fillRatio = var_298_29
			end

			local var_298_30 = 0
			local var_298_31 = 0.2

			if var_298_30 < arg_295_1.time_ and arg_295_1.time_ <= var_298_30 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_32 = arg_295_1:FormatText(StoryNameCfg[668].name)

				arg_295_1.leftNameTxt_.text = var_298_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_33 = arg_295_1:GetWordFromCfg(319591072)
				local var_298_34 = arg_295_1:FormatText(var_298_33.content)

				arg_295_1.text_.text = var_298_34

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_35 = 8
				local var_298_36 = utf8.len(var_298_34)
				local var_298_37 = var_298_35 <= 0 and var_298_31 or var_298_31 * (var_298_36 / var_298_35)

				if var_298_37 > 0 and var_298_31 < var_298_37 then
					arg_295_1.talkMaxDuration = var_298_37

					if var_298_37 + var_298_30 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_37 + var_298_30
					end
				end

				arg_295_1.text_.text = var_298_34
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591072", "story_v_out_319591.awb") ~= 0 then
					local var_298_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591072", "story_v_out_319591.awb") / 1000

					if var_298_38 + var_298_30 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_38 + var_298_30
					end

					if var_298_33.prefab_name ~= "" and arg_295_1.actors_[var_298_33.prefab_name] ~= nil then
						local var_298_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_33.prefab_name].transform, "story_v_out_319591", "319591072", "story_v_out_319591.awb")

						arg_295_1:RecordAudio("319591072", var_298_39)
						arg_295_1:RecordAudio("319591072", var_298_39)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_319591", "319591072", "story_v_out_319591.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_319591", "319591072", "story_v_out_319591.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_40 = math.max(var_298_31, arg_295_1.talkMaxDuration)

			if var_298_30 <= arg_295_1.time_ and arg_295_1.time_ < var_298_30 + var_298_40 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_30) / var_298_40

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_30 + var_298_40 and arg_295_1.time_ < var_298_30 + var_298_40 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play319591073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 319591073
		arg_299_1.duration_ = 6.4

		local var_299_0 = {
			zh = 4.566,
			ja = 6.4
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
				arg_299_0:Play319591074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1095ui_story"].transform
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.var_.moveOldPos1095ui_story = var_302_0.localPosition
			end

			local var_302_2 = 0.001

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2
				local var_302_4 = Vector3.New(0.7, -0.98, -6.1)

				var_302_0.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1095ui_story, var_302_4, var_302_3)

				local var_302_5 = manager.ui.mainCamera.transform.position - var_302_0.position

				var_302_0.forward = Vector3.New(var_302_5.x, var_302_5.y, var_302_5.z)

				local var_302_6 = var_302_0.localEulerAngles

				var_302_6.z = 0
				var_302_6.x = 0
				var_302_0.localEulerAngles = var_302_6
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 then
				var_302_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_302_7 = manager.ui.mainCamera.transform.position - var_302_0.position

				var_302_0.forward = Vector3.New(var_302_7.x, var_302_7.y, var_302_7.z)

				local var_302_8 = var_302_0.localEulerAngles

				var_302_8.z = 0
				var_302_8.x = 0
				var_302_0.localEulerAngles = var_302_8
			end

			local var_302_9 = arg_299_1.actors_["1095ui_story"]
			local var_302_10 = 0

			if var_302_10 < arg_299_1.time_ and arg_299_1.time_ <= var_302_10 + arg_302_0 and arg_299_1.var_.characterEffect1095ui_story == nil then
				arg_299_1.var_.characterEffect1095ui_story = var_302_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_11 = 0.200000002980232

			if var_302_10 <= arg_299_1.time_ and arg_299_1.time_ < var_302_10 + var_302_11 then
				local var_302_12 = (arg_299_1.time_ - var_302_10) / var_302_11

				if arg_299_1.var_.characterEffect1095ui_story then
					arg_299_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_10 + var_302_11 and arg_299_1.time_ < var_302_10 + var_302_11 + arg_302_0 and arg_299_1.var_.characterEffect1095ui_story then
				arg_299_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_302_13 = 0

			if var_302_13 < arg_299_1.time_ and arg_299_1.time_ <= var_302_13 + arg_302_0 then
				arg_299_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_302_14 = 0

			if var_302_14 < arg_299_1.time_ and arg_299_1.time_ <= var_302_14 + arg_302_0 then
				arg_299_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_302_15 = arg_299_1.actors_["4040ui_story"].transform
			local var_302_16 = 0

			if var_302_16 < arg_299_1.time_ and arg_299_1.time_ <= var_302_16 + arg_302_0 then
				arg_299_1.var_.moveOldPos4040ui_story = var_302_15.localPosition
			end

			local var_302_17 = 0.001

			if var_302_16 <= arg_299_1.time_ and arg_299_1.time_ < var_302_16 + var_302_17 then
				local var_302_18 = (arg_299_1.time_ - var_302_16) / var_302_17
				local var_302_19 = Vector3.New(-0.7, -1.55, -5.5)

				var_302_15.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos4040ui_story, var_302_19, var_302_18)

				local var_302_20 = manager.ui.mainCamera.transform.position - var_302_15.position

				var_302_15.forward = Vector3.New(var_302_20.x, var_302_20.y, var_302_20.z)

				local var_302_21 = var_302_15.localEulerAngles

				var_302_21.z = 0
				var_302_21.x = 0
				var_302_15.localEulerAngles = var_302_21
			end

			if arg_299_1.time_ >= var_302_16 + var_302_17 and arg_299_1.time_ < var_302_16 + var_302_17 + arg_302_0 then
				var_302_15.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_302_22 = manager.ui.mainCamera.transform.position - var_302_15.position

				var_302_15.forward = Vector3.New(var_302_22.x, var_302_22.y, var_302_22.z)

				local var_302_23 = var_302_15.localEulerAngles

				var_302_23.z = 0
				var_302_23.x = 0
				var_302_15.localEulerAngles = var_302_23
			end

			local var_302_24 = arg_299_1.actors_["4040ui_story"]
			local var_302_25 = 0

			if var_302_25 < arg_299_1.time_ and arg_299_1.time_ <= var_302_25 + arg_302_0 and arg_299_1.var_.characterEffect4040ui_story == nil then
				arg_299_1.var_.characterEffect4040ui_story = var_302_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_26 = 0.200000002980232

			if var_302_25 <= arg_299_1.time_ and arg_299_1.time_ < var_302_25 + var_302_26 then
				local var_302_27 = (arg_299_1.time_ - var_302_25) / var_302_26

				if arg_299_1.var_.characterEffect4040ui_story then
					local var_302_28 = Mathf.Lerp(0, 0.5, var_302_27)

					arg_299_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_299_1.var_.characterEffect4040ui_story.fillRatio = var_302_28
				end
			end

			if arg_299_1.time_ >= var_302_25 + var_302_26 and arg_299_1.time_ < var_302_25 + var_302_26 + arg_302_0 and arg_299_1.var_.characterEffect4040ui_story then
				local var_302_29 = 0.5

				arg_299_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_299_1.var_.characterEffect4040ui_story.fillRatio = var_302_29
			end

			local var_302_30 = 0
			local var_302_31 = 0.375

			if var_302_30 < arg_299_1.time_ and arg_299_1.time_ <= var_302_30 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_32 = arg_299_1:FormatText(StoryNameCfg[471].name)

				arg_299_1.leftNameTxt_.text = var_302_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_33 = arg_299_1:GetWordFromCfg(319591073)
				local var_302_34 = arg_299_1:FormatText(var_302_33.content)

				arg_299_1.text_.text = var_302_34

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_35 = 15
				local var_302_36 = utf8.len(var_302_34)
				local var_302_37 = var_302_35 <= 0 and var_302_31 or var_302_31 * (var_302_36 / var_302_35)

				if var_302_37 > 0 and var_302_31 < var_302_37 then
					arg_299_1.talkMaxDuration = var_302_37

					if var_302_37 + var_302_30 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_37 + var_302_30
					end
				end

				arg_299_1.text_.text = var_302_34
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591073", "story_v_out_319591.awb") ~= 0 then
					local var_302_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591073", "story_v_out_319591.awb") / 1000

					if var_302_38 + var_302_30 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_38 + var_302_30
					end

					if var_302_33.prefab_name ~= "" and arg_299_1.actors_[var_302_33.prefab_name] ~= nil then
						local var_302_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_33.prefab_name].transform, "story_v_out_319591", "319591073", "story_v_out_319591.awb")

						arg_299_1:RecordAudio("319591073", var_302_39)
						arg_299_1:RecordAudio("319591073", var_302_39)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_319591", "319591073", "story_v_out_319591.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_319591", "319591073", "story_v_out_319591.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_40 = math.max(var_302_31, arg_299_1.talkMaxDuration)

			if var_302_30 <= arg_299_1.time_ and arg_299_1.time_ < var_302_30 + var_302_40 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_30) / var_302_40

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_30 + var_302_40 and arg_299_1.time_ < var_302_30 + var_302_40 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play319591074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 319591074
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play319591075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1095ui_story"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos1095ui_story = var_306_0.localPosition
			end

			local var_306_2 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2
				local var_306_4 = Vector3.New(0, 100, 0)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1095ui_story, var_306_4, var_306_3)

				local var_306_5 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_5.x, var_306_5.y, var_306_5.z)

				local var_306_6 = var_306_0.localEulerAngles

				var_306_6.z = 0
				var_306_6.x = 0
				var_306_0.localEulerAngles = var_306_6
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(0, 100, 0)

				local var_306_7 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_7.x, var_306_7.y, var_306_7.z)

				local var_306_8 = var_306_0.localEulerAngles

				var_306_8.z = 0
				var_306_8.x = 0
				var_306_0.localEulerAngles = var_306_8
			end

			local var_306_9 = arg_303_1.actors_["1095ui_story"]
			local var_306_10 = 0

			if var_306_10 < arg_303_1.time_ and arg_303_1.time_ <= var_306_10 + arg_306_0 and arg_303_1.var_.characterEffect1095ui_story == nil then
				arg_303_1.var_.characterEffect1095ui_story = var_306_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_11 = 0.200000002980232

			if var_306_10 <= arg_303_1.time_ and arg_303_1.time_ < var_306_10 + var_306_11 then
				local var_306_12 = (arg_303_1.time_ - var_306_10) / var_306_11

				if arg_303_1.var_.characterEffect1095ui_story then
					local var_306_13 = Mathf.Lerp(0, 0.5, var_306_12)

					arg_303_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1095ui_story.fillRatio = var_306_13
				end
			end

			if arg_303_1.time_ >= var_306_10 + var_306_11 and arg_303_1.time_ < var_306_10 + var_306_11 + arg_306_0 and arg_303_1.var_.characterEffect1095ui_story then
				local var_306_14 = 0.5

				arg_303_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1095ui_story.fillRatio = var_306_14
			end

			local var_306_15 = arg_303_1.actors_["4040ui_story"].transform
			local var_306_16 = 0

			if var_306_16 < arg_303_1.time_ and arg_303_1.time_ <= var_306_16 + arg_306_0 then
				arg_303_1.var_.moveOldPos4040ui_story = var_306_15.localPosition
			end

			local var_306_17 = 0.001

			if var_306_16 <= arg_303_1.time_ and arg_303_1.time_ < var_306_16 + var_306_17 then
				local var_306_18 = (arg_303_1.time_ - var_306_16) / var_306_17
				local var_306_19 = Vector3.New(0, 100, 0)

				var_306_15.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos4040ui_story, var_306_19, var_306_18)

				local var_306_20 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_20.x, var_306_20.y, var_306_20.z)

				local var_306_21 = var_306_15.localEulerAngles

				var_306_21.z = 0
				var_306_21.x = 0
				var_306_15.localEulerAngles = var_306_21
			end

			if arg_303_1.time_ >= var_306_16 + var_306_17 and arg_303_1.time_ < var_306_16 + var_306_17 + arg_306_0 then
				var_306_15.localPosition = Vector3.New(0, 100, 0)

				local var_306_22 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_22.x, var_306_22.y, var_306_22.z)

				local var_306_23 = var_306_15.localEulerAngles

				var_306_23.z = 0
				var_306_23.x = 0
				var_306_15.localEulerAngles = var_306_23
			end

			local var_306_24 = arg_303_1.actors_["4040ui_story"]
			local var_306_25 = 0

			if var_306_25 < arg_303_1.time_ and arg_303_1.time_ <= var_306_25 + arg_306_0 and arg_303_1.var_.characterEffect4040ui_story == nil then
				arg_303_1.var_.characterEffect4040ui_story = var_306_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_26 = 0.200000002980232

			if var_306_25 <= arg_303_1.time_ and arg_303_1.time_ < var_306_25 + var_306_26 then
				local var_306_27 = (arg_303_1.time_ - var_306_25) / var_306_26

				if arg_303_1.var_.characterEffect4040ui_story then
					local var_306_28 = Mathf.Lerp(0, 0.5, var_306_27)

					arg_303_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_303_1.var_.characterEffect4040ui_story.fillRatio = var_306_28
				end
			end

			if arg_303_1.time_ >= var_306_25 + var_306_26 and arg_303_1.time_ < var_306_25 + var_306_26 + arg_306_0 and arg_303_1.var_.characterEffect4040ui_story then
				local var_306_29 = 0.5

				arg_303_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_303_1.var_.characterEffect4040ui_story.fillRatio = var_306_29
			end

			local var_306_30 = 0
			local var_306_31 = 1.35

			if var_306_30 < arg_303_1.time_ and arg_303_1.time_ <= var_306_30 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_32 = arg_303_1:GetWordFromCfg(319591074)
				local var_306_33 = arg_303_1:FormatText(var_306_32.content)

				arg_303_1.text_.text = var_306_33

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_34 = 54
				local var_306_35 = utf8.len(var_306_33)
				local var_306_36 = var_306_34 <= 0 and var_306_31 or var_306_31 * (var_306_35 / var_306_34)

				if var_306_36 > 0 and var_306_31 < var_306_36 then
					arg_303_1.talkMaxDuration = var_306_36

					if var_306_36 + var_306_30 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_36 + var_306_30
					end
				end

				arg_303_1.text_.text = var_306_33
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_37 = math.max(var_306_31, arg_303_1.talkMaxDuration)

			if var_306_30 <= arg_303_1.time_ and arg_303_1.time_ < var_306_30 + var_306_37 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_30) / var_306_37

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_30 + var_306_37 and arg_303_1.time_ < var_306_30 + var_306_37 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play319591075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 319591075
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play319591076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 1.05

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_2 = arg_307_1:GetWordFromCfg(319591075)
				local var_310_3 = arg_307_1:FormatText(var_310_2.content)

				arg_307_1.text_.text = var_310_3

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_4 = 42
				local var_310_5 = utf8.len(var_310_3)
				local var_310_6 = var_310_4 <= 0 and var_310_1 or var_310_1 * (var_310_5 / var_310_4)

				if var_310_6 > 0 and var_310_1 < var_310_6 then
					arg_307_1.talkMaxDuration = var_310_6

					if var_310_6 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_6 + var_310_0
					end
				end

				arg_307_1.text_.text = var_310_3
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_7 = math.max(var_310_1, arg_307_1.talkMaxDuration)

			if var_310_0 <= arg_307_1.time_ and arg_307_1.time_ < var_310_0 + var_310_7 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_0) / var_310_7

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_0 + var_310_7 and arg_307_1.time_ < var_310_0 + var_310_7 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play319591076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 319591076
		arg_311_1.duration_ = 3.233

		local var_311_0 = {
			zh = 2.5,
			ja = 3.233
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
				arg_311_0:Play319591077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["10079ui_story"].transform
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1.var_.moveOldPos10079ui_story = var_314_0.localPosition

				local var_314_2 = "10079ui_story"

				arg_311_1:ShowWeapon(arg_311_1.var_[var_314_2 .. "Animator"].transform, false)
			end

			local var_314_3 = 0.001

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_3 then
				local var_314_4 = (arg_311_1.time_ - var_314_1) / var_314_3
				local var_314_5 = Vector3.New(0, -0.95, -6.05)

				var_314_0.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos10079ui_story, var_314_5, var_314_4)

				local var_314_6 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_6.x, var_314_6.y, var_314_6.z)

				local var_314_7 = var_314_0.localEulerAngles

				var_314_7.z = 0
				var_314_7.x = 0
				var_314_0.localEulerAngles = var_314_7
			end

			if arg_311_1.time_ >= var_314_1 + var_314_3 and arg_311_1.time_ < var_314_1 + var_314_3 + arg_314_0 then
				var_314_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_314_8 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_8.x, var_314_8.y, var_314_8.z)

				local var_314_9 = var_314_0.localEulerAngles

				var_314_9.z = 0
				var_314_9.x = 0
				var_314_0.localEulerAngles = var_314_9
			end

			local var_314_10 = arg_311_1.actors_["10079ui_story"]
			local var_314_11 = 0

			if var_314_11 < arg_311_1.time_ and arg_311_1.time_ <= var_314_11 + arg_314_0 and arg_311_1.var_.characterEffect10079ui_story == nil then
				arg_311_1.var_.characterEffect10079ui_story = var_314_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_12 = 0.200000002980232

			if var_314_11 <= arg_311_1.time_ and arg_311_1.time_ < var_314_11 + var_314_12 then
				local var_314_13 = (arg_311_1.time_ - var_314_11) / var_314_12

				if arg_311_1.var_.characterEffect10079ui_story then
					arg_311_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_11 + var_314_12 and arg_311_1.time_ < var_314_11 + var_314_12 + arg_314_0 and arg_311_1.var_.characterEffect10079ui_story then
				arg_311_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_314_15 = 0

			if var_314_15 < arg_311_1.time_ and arg_311_1.time_ <= var_314_15 + arg_314_0 then
				arg_311_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_314_16 = 0
			local var_314_17 = 0.3

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_18 = arg_311_1:FormatText(StoryNameCfg[6].name)

				arg_311_1.leftNameTxt_.text = var_314_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_19 = arg_311_1:GetWordFromCfg(319591076)
				local var_314_20 = arg_311_1:FormatText(var_314_19.content)

				arg_311_1.text_.text = var_314_20

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_21 = 12
				local var_314_22 = utf8.len(var_314_20)
				local var_314_23 = var_314_21 <= 0 and var_314_17 or var_314_17 * (var_314_22 / var_314_21)

				if var_314_23 > 0 and var_314_17 < var_314_23 then
					arg_311_1.talkMaxDuration = var_314_23

					if var_314_23 + var_314_16 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_23 + var_314_16
					end
				end

				arg_311_1.text_.text = var_314_20
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591076", "story_v_out_319591.awb") ~= 0 then
					local var_314_24 = manager.audio:GetVoiceLength("story_v_out_319591", "319591076", "story_v_out_319591.awb") / 1000

					if var_314_24 + var_314_16 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_24 + var_314_16
					end

					if var_314_19.prefab_name ~= "" and arg_311_1.actors_[var_314_19.prefab_name] ~= nil then
						local var_314_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_19.prefab_name].transform, "story_v_out_319591", "319591076", "story_v_out_319591.awb")

						arg_311_1:RecordAudio("319591076", var_314_25)
						arg_311_1:RecordAudio("319591076", var_314_25)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_319591", "319591076", "story_v_out_319591.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_319591", "319591076", "story_v_out_319591.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_26 = math.max(var_314_17, arg_311_1.talkMaxDuration)

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_26 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_16) / var_314_26

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_16 + var_314_26 and arg_311_1.time_ < var_314_16 + var_314_26 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play319591077 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 319591077
		arg_315_1.duration_ = 7.833

		local var_315_0 = {
			zh = 5.433,
			ja = 7.833
		}
		local var_315_1 = manager.audio:GetLocalizationFlag()

		if var_315_0[var_315_1] ~= nil then
			arg_315_1.duration_ = var_315_0[var_315_1]
		end

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play319591078(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["10079ui_story"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos10079ui_story = var_318_0.localPosition
			end

			local var_318_2 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2
				local var_318_4 = Vector3.New(0, 100, 0)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos10079ui_story, var_318_4, var_318_3)

				local var_318_5 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_5.x, var_318_5.y, var_318_5.z)

				local var_318_6 = var_318_0.localEulerAngles

				var_318_6.z = 0
				var_318_6.x = 0
				var_318_0.localEulerAngles = var_318_6
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(0, 100, 0)

				local var_318_7 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_7.x, var_318_7.y, var_318_7.z)

				local var_318_8 = var_318_0.localEulerAngles

				var_318_8.z = 0
				var_318_8.x = 0
				var_318_0.localEulerAngles = var_318_8
			end

			local var_318_9 = arg_315_1.actors_["10079ui_story"]
			local var_318_10 = 0

			if var_318_10 < arg_315_1.time_ and arg_315_1.time_ <= var_318_10 + arg_318_0 and arg_315_1.var_.characterEffect10079ui_story == nil then
				arg_315_1.var_.characterEffect10079ui_story = var_318_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_11 = 0.200000002980232

			if var_318_10 <= arg_315_1.time_ and arg_315_1.time_ < var_318_10 + var_318_11 then
				local var_318_12 = (arg_315_1.time_ - var_318_10) / var_318_11

				if arg_315_1.var_.characterEffect10079ui_story then
					local var_318_13 = Mathf.Lerp(0, 0.5, var_318_12)

					arg_315_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_315_1.var_.characterEffect10079ui_story.fillRatio = var_318_13
				end
			end

			if arg_315_1.time_ >= var_318_10 + var_318_11 and arg_315_1.time_ < var_318_10 + var_318_11 + arg_318_0 and arg_315_1.var_.characterEffect10079ui_story then
				local var_318_14 = 0.5

				arg_315_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_315_1.var_.characterEffect10079ui_story.fillRatio = var_318_14
			end

			local var_318_15 = arg_315_1.actors_["4040ui_story"].transform
			local var_318_16 = 0

			if var_318_16 < arg_315_1.time_ and arg_315_1.time_ <= var_318_16 + arg_318_0 then
				arg_315_1.var_.moveOldPos4040ui_story = var_318_15.localPosition
			end

			local var_318_17 = 0.001

			if var_318_16 <= arg_315_1.time_ and arg_315_1.time_ < var_318_16 + var_318_17 then
				local var_318_18 = (arg_315_1.time_ - var_318_16) / var_318_17
				local var_318_19 = Vector3.New(0, -1.55, -5.5)

				var_318_15.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos4040ui_story, var_318_19, var_318_18)

				local var_318_20 = manager.ui.mainCamera.transform.position - var_318_15.position

				var_318_15.forward = Vector3.New(var_318_20.x, var_318_20.y, var_318_20.z)

				local var_318_21 = var_318_15.localEulerAngles

				var_318_21.z = 0
				var_318_21.x = 0
				var_318_15.localEulerAngles = var_318_21
			end

			if arg_315_1.time_ >= var_318_16 + var_318_17 and arg_315_1.time_ < var_318_16 + var_318_17 + arg_318_0 then
				var_318_15.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_318_22 = manager.ui.mainCamera.transform.position - var_318_15.position

				var_318_15.forward = Vector3.New(var_318_22.x, var_318_22.y, var_318_22.z)

				local var_318_23 = var_318_15.localEulerAngles

				var_318_23.z = 0
				var_318_23.x = 0
				var_318_15.localEulerAngles = var_318_23
			end

			local var_318_24 = arg_315_1.actors_["4040ui_story"]
			local var_318_25 = 0

			if var_318_25 < arg_315_1.time_ and arg_315_1.time_ <= var_318_25 + arg_318_0 and arg_315_1.var_.characterEffect4040ui_story == nil then
				arg_315_1.var_.characterEffect4040ui_story = var_318_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_26 = 0.200000002980232

			if var_318_25 <= arg_315_1.time_ and arg_315_1.time_ < var_318_25 + var_318_26 then
				local var_318_27 = (arg_315_1.time_ - var_318_25) / var_318_26

				if arg_315_1.var_.characterEffect4040ui_story then
					arg_315_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_25 + var_318_26 and arg_315_1.time_ < var_318_25 + var_318_26 + arg_318_0 and arg_315_1.var_.characterEffect4040ui_story then
				arg_315_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_318_28 = 0

			if var_318_28 < arg_315_1.time_ and arg_315_1.time_ <= var_318_28 + arg_318_0 then
				arg_315_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_318_29 = 0

			if var_318_29 < arg_315_1.time_ and arg_315_1.time_ <= var_318_29 + arg_318_0 then
				arg_315_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_318_30 = 0
			local var_318_31 = 0.475

			if var_318_30 < arg_315_1.time_ and arg_315_1.time_ <= var_318_30 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_32 = arg_315_1:FormatText(StoryNameCfg[668].name)

				arg_315_1.leftNameTxt_.text = var_318_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_33 = arg_315_1:GetWordFromCfg(319591077)
				local var_318_34 = arg_315_1:FormatText(var_318_33.content)

				arg_315_1.text_.text = var_318_34

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_35 = 19
				local var_318_36 = utf8.len(var_318_34)
				local var_318_37 = var_318_35 <= 0 and var_318_31 or var_318_31 * (var_318_36 / var_318_35)

				if var_318_37 > 0 and var_318_31 < var_318_37 then
					arg_315_1.talkMaxDuration = var_318_37

					if var_318_37 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_37 + var_318_30
					end
				end

				arg_315_1.text_.text = var_318_34
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591077", "story_v_out_319591.awb") ~= 0 then
					local var_318_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591077", "story_v_out_319591.awb") / 1000

					if var_318_38 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_38 + var_318_30
					end

					if var_318_33.prefab_name ~= "" and arg_315_1.actors_[var_318_33.prefab_name] ~= nil then
						local var_318_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_33.prefab_name].transform, "story_v_out_319591", "319591077", "story_v_out_319591.awb")

						arg_315_1:RecordAudio("319591077", var_318_39)
						arg_315_1:RecordAudio("319591077", var_318_39)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_319591", "319591077", "story_v_out_319591.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_319591", "319591077", "story_v_out_319591.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_40 = math.max(var_318_31, arg_315_1.talkMaxDuration)

			if var_318_30 <= arg_315_1.time_ and arg_315_1.time_ < var_318_30 + var_318_40 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_30) / var_318_40

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_30 + var_318_40 and arg_315_1.time_ < var_318_30 + var_318_40 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play319591078 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 319591078
		arg_319_1.duration_ = 6.1

		local var_319_0 = {
			zh = 4.066,
			ja = 6.1
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
				arg_319_0:Play319591079(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1095ui_story"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos1095ui_story = var_322_0.localPosition
			end

			local var_322_2 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2
				local var_322_4 = Vector3.New(0, -0.98, -6.1)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1095ui_story, var_322_4, var_322_3)

				local var_322_5 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_5.x, var_322_5.y, var_322_5.z)

				local var_322_6 = var_322_0.localEulerAngles

				var_322_6.z = 0
				var_322_6.x = 0
				var_322_0.localEulerAngles = var_322_6
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_322_7 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_7.x, var_322_7.y, var_322_7.z)

				local var_322_8 = var_322_0.localEulerAngles

				var_322_8.z = 0
				var_322_8.x = 0
				var_322_0.localEulerAngles = var_322_8
			end

			local var_322_9 = arg_319_1.actors_["1095ui_story"]
			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 and arg_319_1.var_.characterEffect1095ui_story == nil then
				arg_319_1.var_.characterEffect1095ui_story = var_322_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_11 = 0.200000002980232

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_11 then
				local var_322_12 = (arg_319_1.time_ - var_322_10) / var_322_11

				if arg_319_1.var_.characterEffect1095ui_story then
					arg_319_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_10 + var_322_11 and arg_319_1.time_ < var_322_10 + var_322_11 + arg_322_0 and arg_319_1.var_.characterEffect1095ui_story then
				arg_319_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_322_13 = 0

			if var_322_13 < arg_319_1.time_ and arg_319_1.time_ <= var_322_13 + arg_322_0 then
				arg_319_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_322_15 = arg_319_1.actors_["4040ui_story"]
			local var_322_16 = 0

			if var_322_16 < arg_319_1.time_ and arg_319_1.time_ <= var_322_16 + arg_322_0 and arg_319_1.var_.characterEffect4040ui_story == nil then
				arg_319_1.var_.characterEffect4040ui_story = var_322_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_17 = 0.200000002980232

			if var_322_16 <= arg_319_1.time_ and arg_319_1.time_ < var_322_16 + var_322_17 then
				local var_322_18 = (arg_319_1.time_ - var_322_16) / var_322_17

				if arg_319_1.var_.characterEffect4040ui_story then
					local var_322_19 = Mathf.Lerp(0, 0.5, var_322_18)

					arg_319_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_319_1.var_.characterEffect4040ui_story.fillRatio = var_322_19
				end
			end

			if arg_319_1.time_ >= var_322_16 + var_322_17 and arg_319_1.time_ < var_322_16 + var_322_17 + arg_322_0 and arg_319_1.var_.characterEffect4040ui_story then
				local var_322_20 = 0.5

				arg_319_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_319_1.var_.characterEffect4040ui_story.fillRatio = var_322_20
			end

			local var_322_21 = arg_319_1.actors_["4040ui_story"].transform
			local var_322_22 = 0

			if var_322_22 < arg_319_1.time_ and arg_319_1.time_ <= var_322_22 + arg_322_0 then
				arg_319_1.var_.moveOldPos4040ui_story = var_322_21.localPosition
			end

			local var_322_23 = 0.001

			if var_322_22 <= arg_319_1.time_ and arg_319_1.time_ < var_322_22 + var_322_23 then
				local var_322_24 = (arg_319_1.time_ - var_322_22) / var_322_23
				local var_322_25 = Vector3.New(0, 100, 0)

				var_322_21.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos4040ui_story, var_322_25, var_322_24)

				local var_322_26 = manager.ui.mainCamera.transform.position - var_322_21.position

				var_322_21.forward = Vector3.New(var_322_26.x, var_322_26.y, var_322_26.z)

				local var_322_27 = var_322_21.localEulerAngles

				var_322_27.z = 0
				var_322_27.x = 0
				var_322_21.localEulerAngles = var_322_27
			end

			if arg_319_1.time_ >= var_322_22 + var_322_23 and arg_319_1.time_ < var_322_22 + var_322_23 + arg_322_0 then
				var_322_21.localPosition = Vector3.New(0, 100, 0)

				local var_322_28 = manager.ui.mainCamera.transform.position - var_322_21.position

				var_322_21.forward = Vector3.New(var_322_28.x, var_322_28.y, var_322_28.z)

				local var_322_29 = var_322_21.localEulerAngles

				var_322_29.z = 0
				var_322_29.x = 0
				var_322_21.localEulerAngles = var_322_29
			end

			local var_322_30 = 0
			local var_322_31 = 0.4

			if var_322_30 < arg_319_1.time_ and arg_319_1.time_ <= var_322_30 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_32 = arg_319_1:FormatText(StoryNameCfg[471].name)

				arg_319_1.leftNameTxt_.text = var_322_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_33 = arg_319_1:GetWordFromCfg(319591078)
				local var_322_34 = arg_319_1:FormatText(var_322_33.content)

				arg_319_1.text_.text = var_322_34

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_35 = 16
				local var_322_36 = utf8.len(var_322_34)
				local var_322_37 = var_322_35 <= 0 and var_322_31 or var_322_31 * (var_322_36 / var_322_35)

				if var_322_37 > 0 and var_322_31 < var_322_37 then
					arg_319_1.talkMaxDuration = var_322_37

					if var_322_37 + var_322_30 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_37 + var_322_30
					end
				end

				arg_319_1.text_.text = var_322_34
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591078", "story_v_out_319591.awb") ~= 0 then
					local var_322_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591078", "story_v_out_319591.awb") / 1000

					if var_322_38 + var_322_30 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_38 + var_322_30
					end

					if var_322_33.prefab_name ~= "" and arg_319_1.actors_[var_322_33.prefab_name] ~= nil then
						local var_322_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_33.prefab_name].transform, "story_v_out_319591", "319591078", "story_v_out_319591.awb")

						arg_319_1:RecordAudio("319591078", var_322_39)
						arg_319_1:RecordAudio("319591078", var_322_39)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_319591", "319591078", "story_v_out_319591.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_319591", "319591078", "story_v_out_319591.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_40 = math.max(var_322_31, arg_319_1.talkMaxDuration)

			if var_322_30 <= arg_319_1.time_ and arg_319_1.time_ < var_322_30 + var_322_40 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_30) / var_322_40

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_30 + var_322_40 and arg_319_1.time_ < var_322_30 + var_322_40 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play319591079 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 319591079
		arg_323_1.duration_ = 5.633

		local var_323_0 = {
			zh = 5.266,
			ja = 5.633
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
				arg_323_0:Play319591080(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["4040ui_story"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos4040ui_story = var_326_0.localPosition
			end

			local var_326_2 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2
				local var_326_4 = Vector3.New(0, -1.55, -5.5)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos4040ui_story, var_326_4, var_326_3)

				local var_326_5 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_5.x, var_326_5.y, var_326_5.z)

				local var_326_6 = var_326_0.localEulerAngles

				var_326_6.z = 0
				var_326_6.x = 0
				var_326_0.localEulerAngles = var_326_6
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_326_7 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_7.x, var_326_7.y, var_326_7.z)

				local var_326_8 = var_326_0.localEulerAngles

				var_326_8.z = 0
				var_326_8.x = 0
				var_326_0.localEulerAngles = var_326_8
			end

			local var_326_9 = arg_323_1.actors_["4040ui_story"]
			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 and arg_323_1.var_.characterEffect4040ui_story == nil then
				arg_323_1.var_.characterEffect4040ui_story = var_326_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_11 = 0.200000002980232

			if var_326_10 <= arg_323_1.time_ and arg_323_1.time_ < var_326_10 + var_326_11 then
				local var_326_12 = (arg_323_1.time_ - var_326_10) / var_326_11

				if arg_323_1.var_.characterEffect4040ui_story then
					arg_323_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_10 + var_326_11 and arg_323_1.time_ < var_326_10 + var_326_11 + arg_326_0 and arg_323_1.var_.characterEffect4040ui_story then
				arg_323_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_326_13 = 0

			if var_326_13 < arg_323_1.time_ and arg_323_1.time_ <= var_326_13 + arg_326_0 then
				arg_323_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_326_14 = 0

			if var_326_14 < arg_323_1.time_ and arg_323_1.time_ <= var_326_14 + arg_326_0 then
				arg_323_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_326_15 = arg_323_1.actors_["1095ui_story"].transform
			local var_326_16 = 0

			if var_326_16 < arg_323_1.time_ and arg_323_1.time_ <= var_326_16 + arg_326_0 then
				arg_323_1.var_.moveOldPos1095ui_story = var_326_15.localPosition
			end

			local var_326_17 = 0.001

			if var_326_16 <= arg_323_1.time_ and arg_323_1.time_ < var_326_16 + var_326_17 then
				local var_326_18 = (arg_323_1.time_ - var_326_16) / var_326_17
				local var_326_19 = Vector3.New(0, 100, 0)

				var_326_15.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1095ui_story, var_326_19, var_326_18)

				local var_326_20 = manager.ui.mainCamera.transform.position - var_326_15.position

				var_326_15.forward = Vector3.New(var_326_20.x, var_326_20.y, var_326_20.z)

				local var_326_21 = var_326_15.localEulerAngles

				var_326_21.z = 0
				var_326_21.x = 0
				var_326_15.localEulerAngles = var_326_21
			end

			if arg_323_1.time_ >= var_326_16 + var_326_17 and arg_323_1.time_ < var_326_16 + var_326_17 + arg_326_0 then
				var_326_15.localPosition = Vector3.New(0, 100, 0)

				local var_326_22 = manager.ui.mainCamera.transform.position - var_326_15.position

				var_326_15.forward = Vector3.New(var_326_22.x, var_326_22.y, var_326_22.z)

				local var_326_23 = var_326_15.localEulerAngles

				var_326_23.z = 0
				var_326_23.x = 0
				var_326_15.localEulerAngles = var_326_23
			end

			local var_326_24 = arg_323_1.actors_["1095ui_story"]
			local var_326_25 = 0

			if var_326_25 < arg_323_1.time_ and arg_323_1.time_ <= var_326_25 + arg_326_0 and arg_323_1.var_.characterEffect1095ui_story == nil then
				arg_323_1.var_.characterEffect1095ui_story = var_326_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_26 = 0.200000002980232

			if var_326_25 <= arg_323_1.time_ and arg_323_1.time_ < var_326_25 + var_326_26 then
				local var_326_27 = (arg_323_1.time_ - var_326_25) / var_326_26

				if arg_323_1.var_.characterEffect1095ui_story then
					local var_326_28 = Mathf.Lerp(0, 0.5, var_326_27)

					arg_323_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1095ui_story.fillRatio = var_326_28
				end
			end

			if arg_323_1.time_ >= var_326_25 + var_326_26 and arg_323_1.time_ < var_326_25 + var_326_26 + arg_326_0 and arg_323_1.var_.characterEffect1095ui_story then
				local var_326_29 = 0.5

				arg_323_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1095ui_story.fillRatio = var_326_29
			end

			local var_326_30 = 0
			local var_326_31 = 0.3

			if var_326_30 < arg_323_1.time_ and arg_323_1.time_ <= var_326_30 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_32 = arg_323_1:FormatText(StoryNameCfg[668].name)

				arg_323_1.leftNameTxt_.text = var_326_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_33 = arg_323_1:GetWordFromCfg(319591079)
				local var_326_34 = arg_323_1:FormatText(var_326_33.content)

				arg_323_1.text_.text = var_326_34

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_35 = 12
				local var_326_36 = utf8.len(var_326_34)
				local var_326_37 = var_326_35 <= 0 and var_326_31 or var_326_31 * (var_326_36 / var_326_35)

				if var_326_37 > 0 and var_326_31 < var_326_37 then
					arg_323_1.talkMaxDuration = var_326_37

					if var_326_37 + var_326_30 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_37 + var_326_30
					end
				end

				arg_323_1.text_.text = var_326_34
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319591", "319591079", "story_v_out_319591.awb") ~= 0 then
					local var_326_38 = manager.audio:GetVoiceLength("story_v_out_319591", "319591079", "story_v_out_319591.awb") / 1000

					if var_326_38 + var_326_30 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_38 + var_326_30
					end

					if var_326_33.prefab_name ~= "" and arg_323_1.actors_[var_326_33.prefab_name] ~= nil then
						local var_326_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_33.prefab_name].transform, "story_v_out_319591", "319591079", "story_v_out_319591.awb")

						arg_323_1:RecordAudio("319591079", var_326_39)
						arg_323_1:RecordAudio("319591079", var_326_39)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_319591", "319591079", "story_v_out_319591.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_319591", "319591079", "story_v_out_319591.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_40 = math.max(var_326_31, arg_323_1.talkMaxDuration)

			if var_326_30 <= arg_323_1.time_ and arg_323_1.time_ < var_326_30 + var_326_40 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_30) / var_326_40

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_30 + var_326_40 and arg_323_1.time_ < var_326_30 + var_326_40 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play319591080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 319591080
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play319591081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["4040ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect4040ui_story == nil then
				arg_327_1.var_.characterEffect4040ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect4040ui_story then
					local var_330_4 = Mathf.Lerp(0, 0.5, var_330_3)

					arg_327_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_327_1.var_.characterEffect4040ui_story.fillRatio = var_330_4
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect4040ui_story then
				local var_330_5 = 0.5

				arg_327_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_327_1.var_.characterEffect4040ui_story.fillRatio = var_330_5
			end

			local var_330_6 = 0

			if var_330_6 < arg_327_1.time_ and arg_327_1.time_ <= var_330_6 + arg_330_0 then
				arg_327_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_330_7 = 0
			local var_330_8 = 0.775

			if var_330_7 < arg_327_1.time_ and arg_327_1.time_ <= var_330_7 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_9 = arg_327_1:GetWordFromCfg(319591080)
				local var_330_10 = arg_327_1:FormatText(var_330_9.content)

				arg_327_1.text_.text = var_330_10

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_11 = 31
				local var_330_12 = utf8.len(var_330_10)
				local var_330_13 = var_330_11 <= 0 and var_330_8 or var_330_8 * (var_330_12 / var_330_11)

				if var_330_13 > 0 and var_330_8 < var_330_13 then
					arg_327_1.talkMaxDuration = var_330_13

					if var_330_13 + var_330_7 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_13 + var_330_7
					end
				end

				arg_327_1.text_.text = var_330_10
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_14 = math.max(var_330_8, arg_327_1.talkMaxDuration)

			if var_330_7 <= arg_327_1.time_ and arg_327_1.time_ < var_330_7 + var_330_14 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_7) / var_330_14

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_7 + var_330_14 and arg_327_1.time_ < var_330_7 + var_330_14 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play319591081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 319591081
		arg_331_1.duration_ = 5

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play319591082(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["4040ui_story"].transform
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.var_.moveOldPos4040ui_story = var_334_0.localPosition
			end

			local var_334_2 = 0.001

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2
				local var_334_4 = Vector3.New(0, 100, 0)

				var_334_0.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos4040ui_story, var_334_4, var_334_3)

				local var_334_5 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_5.x, var_334_5.y, var_334_5.z)

				local var_334_6 = var_334_0.localEulerAngles

				var_334_6.z = 0
				var_334_6.x = 0
				var_334_0.localEulerAngles = var_334_6
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 then
				var_334_0.localPosition = Vector3.New(0, 100, 0)

				local var_334_7 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_7.x, var_334_7.y, var_334_7.z)

				local var_334_8 = var_334_0.localEulerAngles

				var_334_8.z = 0
				var_334_8.x = 0
				var_334_0.localEulerAngles = var_334_8
			end

			local var_334_9 = manager.ui.mainCamera.transform
			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 then
				arg_331_1.var_.shakeOldPos = var_334_9.localPosition
			end

			local var_334_11 = 0.6

			if var_334_10 <= arg_331_1.time_ and arg_331_1.time_ < var_334_10 + var_334_11 then
				local var_334_12 = (arg_331_1.time_ - var_334_10) / 0.066
				local var_334_13, var_334_14 = math.modf(var_334_12)

				var_334_9.localPosition = Vector3.New(var_334_14 * 0.13, var_334_14 * 0.13, var_334_14 * 0.13) + arg_331_1.var_.shakeOldPos
			end

			if arg_331_1.time_ >= var_334_10 + var_334_11 and arg_331_1.time_ < var_334_10 + var_334_11 + arg_334_0 then
				var_334_9.localPosition = arg_331_1.var_.shakeOldPos
			end

			local var_334_15 = 0

			if var_334_15 < arg_331_1.time_ and arg_331_1.time_ <= var_334_15 + arg_334_0 then
				arg_331_1.allBtn_.enabled = false
			end

			local var_334_16 = 0.6

			if arg_331_1.time_ >= var_334_15 + var_334_16 and arg_331_1.time_ < var_334_15 + var_334_16 + arg_334_0 then
				arg_331_1.allBtn_.enabled = true
			end

			local var_334_17 = 0
			local var_334_18 = 1

			if var_334_17 < arg_331_1.time_ and arg_331_1.time_ <= var_334_17 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, false)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_19 = arg_331_1:GetWordFromCfg(319591081)
				local var_334_20 = arg_331_1:FormatText(var_334_19.content)

				arg_331_1.text_.text = var_334_20

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_21 = 40
				local var_334_22 = utf8.len(var_334_20)
				local var_334_23 = var_334_21 <= 0 and var_334_18 or var_334_18 * (var_334_22 / var_334_21)

				if var_334_23 > 0 and var_334_18 < var_334_23 then
					arg_331_1.talkMaxDuration = var_334_23

					if var_334_23 + var_334_17 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_23 + var_334_17
					end
				end

				arg_331_1.text_.text = var_334_20
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_24 = math.max(var_334_18, arg_331_1.talkMaxDuration)

			if var_334_17 <= arg_331_1.time_ and arg_331_1.time_ < var_334_17 + var_334_24 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_17) / var_334_24

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_17 + var_334_24 and arg_331_1.time_ < var_334_17 + var_334_24 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play319591082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 319591082
		arg_335_1.duration_ = 2.832666666666

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play319591083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = "STblack"

			if arg_335_1.bgs_[var_338_0] == nil then
				local var_338_1 = Object.Instantiate(arg_335_1.paintGo_)

				var_338_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_338_0)
				var_338_1.name = var_338_0
				var_338_1.transform.parent = arg_335_1.stage_.transform
				var_338_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_335_1.bgs_[var_338_0] = var_338_1
			end

			local var_338_2 = 0

			if var_338_2 < arg_335_1.time_ and arg_335_1.time_ <= var_338_2 + arg_338_0 then
				local var_338_3 = manager.ui.mainCamera.transform.localPosition
				local var_338_4 = Vector3.New(0, 0, 10) + Vector3.New(var_338_3.x, var_338_3.y, 0)
				local var_338_5 = arg_335_1.bgs_.STblack

				var_338_5.transform.localPosition = var_338_4
				var_338_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_338_6 = var_338_5:GetComponent("SpriteRenderer")

				if var_338_6 and var_338_6.sprite then
					local var_338_7 = (var_338_5.transform.localPosition - var_338_3).z
					local var_338_8 = manager.ui.mainCameraCom_
					local var_338_9 = 2 * var_338_7 * Mathf.Tan(var_338_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_338_10 = var_338_9 * var_338_8.aspect
					local var_338_11 = var_338_6.sprite.bounds.size.x
					local var_338_12 = var_338_6.sprite.bounds.size.y
					local var_338_13 = var_338_10 / var_338_11
					local var_338_14 = var_338_9 / var_338_12
					local var_338_15 = var_338_14 < var_338_13 and var_338_13 or var_338_14

					var_338_5.transform.localScale = Vector3.New(var_338_15, var_338_15, 0)
				end

				for iter_338_0, iter_338_1 in pairs(arg_335_1.bgs_) do
					if iter_338_0 ~= "STblack" then
						iter_338_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_338_16 = 0

			if var_338_16 < arg_335_1.time_ and arg_335_1.time_ <= var_338_16 + arg_338_0 then
				local var_338_17 = arg_335_1.fswbg_.transform:Find("textbox/adapt/content") or arg_335_1.fswbg_.transform:Find("textbox/content")
				local var_338_18 = var_338_17:GetComponent("Text")
				local var_338_19 = var_338_17:GetComponent("RectTransform")

				var_338_18.alignment = UnityEngine.TextAnchor.LowerCenter
				var_338_19.offsetMin = Vector2.New(0, 0)
				var_338_19.offsetMax = Vector2.New(0, 0)
			end

			local var_338_20 = 0

			if var_338_20 < arg_335_1.time_ and arg_335_1.time_ <= var_338_20 + arg_338_0 then
				arg_335_1.fswbg_:SetActive(true)
				arg_335_1.dialog_:SetActive(false)

				arg_335_1.fswtw_.percent = 0

				local var_338_21 = arg_335_1:GetWordFromCfg(319591082)
				local var_338_22 = arg_335_1:FormatText(var_338_21.content)

				arg_335_1.fswt_.text = var_338_22

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.fswt_)

				arg_335_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_335_1.fswtw_:SetDirty()

				arg_335_1.typewritterCharCountI18N = 0

				SetActive(arg_335_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_335_1:ShowNextGo(false)
			end

			local var_338_23 = 0.366666666666667

			if var_338_23 < arg_335_1.time_ and arg_335_1.time_ <= var_338_23 + arg_338_0 then
				arg_335_1.var_.oldValueTypewriter = arg_335_1.fswtw_.percent

				arg_335_1:ShowNextGo(false)
			end

			local var_338_24 = 12
			local var_338_25 = 0.8
			local var_338_26 = arg_335_1:GetWordFromCfg(319591082)
			local var_338_27 = arg_335_1:FormatText(var_338_26.content)
			local var_338_28, var_338_29 = arg_335_1:GetPercentByPara(var_338_27, 1)

			if var_338_23 < arg_335_1.time_ and arg_335_1.time_ <= var_338_23 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0

				local var_338_30 = var_338_24 <= 0 and var_338_25 or var_338_25 * ((var_338_29 - arg_335_1.typewritterCharCountI18N) / var_338_24)

				if var_338_30 > 0 and var_338_25 < var_338_30 then
					arg_335_1.talkMaxDuration = var_338_30

					if var_338_30 + var_338_23 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_30 + var_338_23
					end
				end
			end

			local var_338_31 = 0.8
			local var_338_32 = math.max(var_338_31, arg_335_1.talkMaxDuration)

			if var_338_23 <= arg_335_1.time_ and arg_335_1.time_ < var_338_23 + var_338_32 then
				local var_338_33 = (arg_335_1.time_ - var_338_23) / var_338_32

				arg_335_1.fswtw_.percent = Mathf.Lerp(arg_335_1.var_.oldValueTypewriter, var_338_28, var_338_33)
				arg_335_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_335_1.fswtw_:SetDirty()
			end

			if arg_335_1.time_ >= var_338_23 + var_338_32 and arg_335_1.time_ < var_338_23 + var_338_32 + arg_338_0 then
				arg_335_1.fswtw_.percent = var_338_28

				arg_335_1.fswtw_:SetDirty()
				arg_335_1:ShowNextGo(true)

				arg_335_1.typewritterCharCountI18N = var_338_29
			end

			local var_338_34 = 0

			if var_338_34 < arg_335_1.time_ and arg_335_1.time_ <= var_338_34 + arg_338_0 then
				arg_335_1.cswbg_:SetActive(true)

				local var_338_35 = arg_335_1.cswt_:GetComponent("RectTransform")

				arg_335_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_338_35.offsetMin = Vector2.New(410, 330)
				var_338_35.offsetMax = Vector2.New(-400, -175)

				local var_338_36 = arg_335_1:GetWordFromCfg(419031)
				local var_338_37 = arg_335_1:FormatText(var_338_36.content)

				arg_335_1.cswt_.text = var_338_37

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.cswt_)

				arg_335_1.cswt_.fontSize = 180
				arg_335_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_335_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_338_38 = arg_335_1.actors_["4040ui_story"].transform
			local var_338_39 = 0

			if var_338_39 < arg_335_1.time_ and arg_335_1.time_ <= var_338_39 + arg_338_0 then
				arg_335_1.var_.moveOldPos4040ui_story = var_338_38.localPosition
			end

			local var_338_40 = 0.001

			if var_338_39 <= arg_335_1.time_ and arg_335_1.time_ < var_338_39 + var_338_40 then
				local var_338_41 = (arg_335_1.time_ - var_338_39) / var_338_40
				local var_338_42 = Vector3.New(0, 100, 0)

				var_338_38.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos4040ui_story, var_338_42, var_338_41)

				local var_338_43 = manager.ui.mainCamera.transform.position - var_338_38.position

				var_338_38.forward = Vector3.New(var_338_43.x, var_338_43.y, var_338_43.z)

				local var_338_44 = var_338_38.localEulerAngles

				var_338_44.z = 0
				var_338_44.x = 0
				var_338_38.localEulerAngles = var_338_44
			end

			if arg_335_1.time_ >= var_338_39 + var_338_40 and arg_335_1.time_ < var_338_39 + var_338_40 + arg_338_0 then
				var_338_38.localPosition = Vector3.New(0, 100, 0)

				local var_338_45 = manager.ui.mainCamera.transform.position - var_338_38.position

				var_338_38.forward = Vector3.New(var_338_45.x, var_338_45.y, var_338_45.z)

				local var_338_46 = var_338_38.localEulerAngles

				var_338_46.z = 0
				var_338_46.x = 0
				var_338_38.localEulerAngles = var_338_46
			end

			local var_338_47 = 0.366666666666667
			local var_338_48 = 2.466
			local var_338_49 = manager.audio:GetVoiceLength("story_v_out_319591", "319591082", "story_v_out_319591.awb") / 1000

			if var_338_49 > 0 and var_338_48 < var_338_49 and var_338_49 + var_338_47 > arg_335_1.duration_ then
				local var_338_50 = var_338_49

				arg_335_1.duration_ = var_338_49 + var_338_47
			end

			if var_338_47 < arg_335_1.time_ and arg_335_1.time_ <= var_338_47 + arg_338_0 then
				local var_338_51 = "play"
				local var_338_52 = "voice"

				arg_335_1:AudioAction(var_338_51, var_338_52, "story_v_out_319591", "319591082", "story_v_out_319591.awb")
			end
		end
	end,
	Play319591083 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 319591083
		arg_339_1.duration_ = 0.999999999999

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
			arg_339_1.auto_ = false
		end

		function arg_339_1.playNext_(arg_341_0)
			arg_339_1.onStoryFinished_()
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1.fswbg_:SetActive(true)
				arg_339_1.dialog_:SetActive(false)

				arg_339_1.fswtw_.percent = 0

				local var_342_1 = arg_339_1:GetWordFromCfg(319591083)
				local var_342_2 = arg_339_1:FormatText(var_342_1.content)

				arg_339_1.fswt_.text = var_342_2

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.fswt_)

				arg_339_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_339_1.fswtw_:SetDirty()

				arg_339_1.typewritterCharCountI18N = 0

				SetActive(arg_339_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_339_1:ShowNextGo(false)
			end

			local var_342_3 = 0.2

			if var_342_3 < arg_339_1.time_ and arg_339_1.time_ <= var_342_3 + arg_342_0 then
				arg_339_1.var_.oldValueTypewriter = arg_339_1.fswtw_.percent

				arg_339_1:ShowNextGo(false)
			end

			local var_342_4 = 10
			local var_342_5 = 0.666666666666667
			local var_342_6 = arg_339_1:GetWordFromCfg(319591083)
			local var_342_7 = arg_339_1:FormatText(var_342_6.content)
			local var_342_8, var_342_9 = arg_339_1:GetPercentByPara(var_342_7, 1)

			if var_342_3 < arg_339_1.time_ and arg_339_1.time_ <= var_342_3 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0

				local var_342_10 = var_342_4 <= 0 and var_342_5 or var_342_5 * ((var_342_9 - arg_339_1.typewritterCharCountI18N) / var_342_4)

				if var_342_10 > 0 and var_342_5 < var_342_10 then
					arg_339_1.talkMaxDuration = var_342_10

					if var_342_10 + var_342_3 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_10 + var_342_3
					end
				end
			end

			local var_342_11 = 0.666666666666667
			local var_342_12 = math.max(var_342_11, arg_339_1.talkMaxDuration)

			if var_342_3 <= arg_339_1.time_ and arg_339_1.time_ < var_342_3 + var_342_12 then
				local var_342_13 = (arg_339_1.time_ - var_342_3) / var_342_12

				arg_339_1.fswtw_.percent = Mathf.Lerp(arg_339_1.var_.oldValueTypewriter, var_342_8, var_342_13)
				arg_339_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_339_1.fswtw_:SetDirty()
			end

			if arg_339_1.time_ >= var_342_3 + var_342_12 and arg_339_1.time_ < var_342_3 + var_342_12 + arg_342_0 then
				arg_339_1.fswtw_.percent = var_342_8

				arg_339_1.fswtw_:SetDirty()
				arg_339_1:ShowNextGo(true)

				arg_339_1.typewritterCharCountI18N = var_342_9
			end

			local var_342_14 = 0.2
			local var_342_15 = 0.266666666666667
			local var_342_16 = manager.audio:GetVoiceLength("story_v_out_319591", "319591083", "story_v_out_319591.awb") / 1000

			if var_342_16 > 0 and var_342_15 < var_342_16 and var_342_16 + var_342_14 > arg_339_1.duration_ then
				local var_342_17 = var_342_16

				arg_339_1.duration_ = var_342_16 + var_342_14
			end

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				local var_342_18 = "play"
				local var_342_19 = "voice"

				arg_339_1:AudioAction(var_342_18, var_342_19, "story_v_out_319591", "319591083", "story_v_out_319591.awb")
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I12h",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A08f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I10f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_319591.awb"
	}
}
