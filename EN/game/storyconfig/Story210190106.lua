﻿return {
	Play1101906001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1101906001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play1101906002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST03"

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
				local var_4_5 = arg_1_1.bgs_.ST03

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
					if iter_4_0 ~= "ST03" then
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

			local var_4_26 = 0.3
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_side_daily05", "bgm_side_daily05", "bgm_side_daily05.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.425

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

				local var_4_33 = arg_1_1:GetWordFromCfg(1101906001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 17
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
	Play1101906002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 1101906002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play1101906003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.8

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

				local var_10_3 = arg_7_1:GetWordFromCfg(1101906002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 32
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
	Play1101906003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 1101906003
		arg_11_1.duration_ = 9.233

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play1101906004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1019ui_story"

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

			local var_14_4 = arg_11_1.actors_["1019ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1019ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, -1.08, -5.9)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1019ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1019ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1019ui_story == nil then
				arg_11_1.var_.characterEffect1019ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1019ui_story then
					arg_11_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1019ui_story then
				arg_11_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_14_19 = 0
			local var_14_20 = 1.075

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_21 = arg_11_1:FormatText(StoryNameCfg[13].name)

				arg_11_1.leftNameTxt_.text = var_14_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(1101906003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 43
				local var_14_25 = utf8.len(var_14_23)
				local var_14_26 = var_14_24 <= 0 and var_14_20 or var_14_20 * (var_14_25 / var_14_24)

				if var_14_26 > 0 and var_14_20 < var_14_26 then
					arg_11_1.talkMaxDuration = var_14_26

					if var_14_26 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_26 + var_14_19
					end
				end

				arg_11_1.text_.text = var_14_23
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906003", "story_v_side_new_1101906.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906003", "story_v_side_new_1101906.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_side_new_1101906", "1101906003", "story_v_side_new_1101906.awb")

						arg_11_1:RecordAudio("1101906003", var_14_28)
						arg_11_1:RecordAudio("1101906003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906003", "story_v_side_new_1101906.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906003", "story_v_side_new_1101906.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_29 = math.max(var_14_20, arg_11_1.talkMaxDuration)

			if var_14_19 <= arg_11_1.time_ and arg_11_1.time_ < var_14_19 + var_14_29 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_19) / var_14_29

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_19 + var_14_29 and arg_11_1.time_ < var_14_19 + var_14_29 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 1101906004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play1101906005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1019ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1019ui_story == nil then
				arg_15_1.var_.characterEffect1019ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1019ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1019ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1019ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1019ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.85

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[7].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(1101906004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 34
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
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_14 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_14 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_14

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_14 and arg_15_1.time_ < var_18_6 + var_18_14 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 1101906005
		arg_19_1.duration_ = 4.333

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play1101906006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1019ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story == nil then
				arg_19_1.var_.characterEffect1019ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1019ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1019ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1019ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0
			local var_22_7 = 0.525

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[13].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(1101906005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 21
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906005", "story_v_side_new_1101906.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906005", "story_v_side_new_1101906.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_side_new_1101906", "1101906005", "story_v_side_new_1101906.awb")

						arg_19_1:RecordAudio("1101906005", var_22_15)
						arg_19_1:RecordAudio("1101906005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906005", "story_v_side_new_1101906.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906005", "story_v_side_new_1101906.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_16 and arg_19_1.time_ < var_22_6 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 1101906006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play1101906007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.925

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[7].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(1101906006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 37
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
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_8 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_8 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_8

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_8 and arg_23_1.time_ < var_26_0 + var_26_8 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 1101906007
		arg_27_1.duration_ = 2.633

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play1101906008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1019ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story == nil then
				arg_27_1.var_.characterEffect1019ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1019ui_story then
					arg_27_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story then
				arg_27_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_30_4 = 0
			local var_30_5 = 0.25

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_6 = arg_27_1:FormatText(StoryNameCfg[13].name)

				arg_27_1.leftNameTxt_.text = var_30_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_7 = arg_27_1:GetWordFromCfg(1101906007)
				local var_30_8 = arg_27_1:FormatText(var_30_7.content)

				arg_27_1.text_.text = var_30_8

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_9 = 10
				local var_30_10 = utf8.len(var_30_8)
				local var_30_11 = var_30_9 <= 0 and var_30_5 or var_30_5 * (var_30_10 / var_30_9)

				if var_30_11 > 0 and var_30_5 < var_30_11 then
					arg_27_1.talkMaxDuration = var_30_11

					if var_30_11 + var_30_4 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_11 + var_30_4
					end
				end

				arg_27_1.text_.text = var_30_8
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906007", "story_v_side_new_1101906.awb") ~= 0 then
					local var_30_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906007", "story_v_side_new_1101906.awb") / 1000

					if var_30_12 + var_30_4 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_4
					end

					if var_30_7.prefab_name ~= "" and arg_27_1.actors_[var_30_7.prefab_name] ~= nil then
						local var_30_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_7.prefab_name].transform, "story_v_side_new_1101906", "1101906007", "story_v_side_new_1101906.awb")

						arg_27_1:RecordAudio("1101906007", var_30_13)
						arg_27_1:RecordAudio("1101906007", var_30_13)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906007", "story_v_side_new_1101906.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906007", "story_v_side_new_1101906.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_14 = math.max(var_30_5, arg_27_1.talkMaxDuration)

			if var_30_4 <= arg_27_1.time_ and arg_27_1.time_ < var_30_4 + var_30_14 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_4) / var_30_14

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_4 + var_30_14 and arg_27_1.time_ < var_30_4 + var_30_14 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 1101906008
		arg_31_1.duration_ = 9.966

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play1101906009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "ST02"

			if arg_31_1.bgs_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(arg_31_1.paintGo_)

				var_34_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_34_0)
				var_34_1.name = var_34_0
				var_34_1.transform.parent = arg_31_1.stage_.transform
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.bgs_[var_34_0] = var_34_1
			end

			local var_34_2 = 2

			if var_34_2 < arg_31_1.time_ and arg_31_1.time_ <= var_34_2 + arg_34_0 then
				local var_34_3 = manager.ui.mainCamera.transform.localPosition
				local var_34_4 = Vector3.New(0, 0, 10) + Vector3.New(var_34_3.x, var_34_3.y, 0)
				local var_34_5 = arg_31_1.bgs_.ST02

				var_34_5.transform.localPosition = var_34_4
				var_34_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_6 = var_34_5:GetComponent("SpriteRenderer")

				if var_34_6 and var_34_6.sprite then
					local var_34_7 = (var_34_5.transform.localPosition - var_34_3).z
					local var_34_8 = manager.ui.mainCameraCom_
					local var_34_9 = 2 * var_34_7 * Mathf.Tan(var_34_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_10 = var_34_9 * var_34_8.aspect
					local var_34_11 = var_34_6.sprite.bounds.size.x
					local var_34_12 = var_34_6.sprite.bounds.size.y
					local var_34_13 = var_34_10 / var_34_11
					local var_34_14 = var_34_9 / var_34_12
					local var_34_15 = var_34_14 < var_34_13 and var_34_13 or var_34_14

					var_34_5.transform.localScale = Vector3.New(var_34_15, var_34_15, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "ST02" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_17 = 2

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17
				local var_34_19 = Color.New(0, 0, 0)

				var_34_19.a = Mathf.Lerp(0, 1, var_34_18)
				arg_31_1.mask_.color = var_34_19
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 then
				local var_34_20 = Color.New(0, 0, 0)

				var_34_20.a = 1
				arg_31_1.mask_.color = var_34_20
			end

			local var_34_21 = 2

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_22 = 2

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_22 then
				local var_34_23 = (arg_31_1.time_ - var_34_21) / var_34_22
				local var_34_24 = Color.New(0, 0, 0)

				var_34_24.a = Mathf.Lerp(1, 0, var_34_23)
				arg_31_1.mask_.color = var_34_24
			end

			if arg_31_1.time_ >= var_34_21 + var_34_22 and arg_31_1.time_ < var_34_21 + var_34_22 + arg_34_0 then
				local var_34_25 = Color.New(0, 0, 0)
				local var_34_26 = 0

				arg_31_1.mask_.enabled = false
				var_34_25.a = var_34_26
				arg_31_1.mask_.color = var_34_25
			end

			local var_34_27 = "1029ui_story"

			if arg_31_1.actors_[var_34_27] == nil then
				local var_34_28 = Object.Instantiate(Asset.Load("Char/" .. var_34_27), arg_31_1.stage_.transform)

				var_34_28.name = var_34_27
				var_34_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.actors_[var_34_27] = var_34_28

				local var_34_29 = var_34_28:GetComponentInChildren(typeof(CharacterEffect))

				var_34_29.enabled = true

				local var_34_30 = GameObjectTools.GetOrAddComponent(var_34_28, typeof(DynamicBoneHelper))

				if var_34_30 then
					var_34_30:EnableDynamicBone(false)
				end

				arg_31_1:ShowWeapon(var_34_29.transform, false)

				arg_31_1.var_[var_34_27 .. "Animator"] = var_34_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_31_1.var_[var_34_27 .. "Animator"].applyRootMotion = true
				arg_31_1.var_[var_34_27 .. "LipSync"] = var_34_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_34_31 = arg_31_1.actors_["1029ui_story"].transform
			local var_34_32 = 3.8

			if var_34_32 < arg_31_1.time_ and arg_31_1.time_ <= var_34_32 + arg_34_0 then
				arg_31_1.var_.moveOldPos1029ui_story = var_34_31.localPosition
			end

			local var_34_33 = 0.001

			if var_34_32 <= arg_31_1.time_ and arg_31_1.time_ < var_34_32 + var_34_33 then
				local var_34_34 = (arg_31_1.time_ - var_34_32) / var_34_33
				local var_34_35 = Vector3.New(0.7, -1.09, -6.2)

				var_34_31.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1029ui_story, var_34_35, var_34_34)

				local var_34_36 = manager.ui.mainCamera.transform.position - var_34_31.position

				var_34_31.forward = Vector3.New(var_34_36.x, var_34_36.y, var_34_36.z)

				local var_34_37 = var_34_31.localEulerAngles

				var_34_37.z = 0
				var_34_37.x = 0
				var_34_31.localEulerAngles = var_34_37
			end

			if arg_31_1.time_ >= var_34_32 + var_34_33 and arg_31_1.time_ < var_34_32 + var_34_33 + arg_34_0 then
				var_34_31.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_34_38 = manager.ui.mainCamera.transform.position - var_34_31.position

				var_34_31.forward = Vector3.New(var_34_38.x, var_34_38.y, var_34_38.z)

				local var_34_39 = var_34_31.localEulerAngles

				var_34_39.z = 0
				var_34_39.x = 0
				var_34_31.localEulerAngles = var_34_39
			end

			local var_34_40 = arg_31_1.actors_["1029ui_story"]
			local var_34_41 = 3.8

			if var_34_41 < arg_31_1.time_ and arg_31_1.time_ <= var_34_41 + arg_34_0 and arg_31_1.var_.characterEffect1029ui_story == nil then
				arg_31_1.var_.characterEffect1029ui_story = var_34_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_42 = 0.200000002980232

			if var_34_41 <= arg_31_1.time_ and arg_31_1.time_ < var_34_41 + var_34_42 then
				local var_34_43 = (arg_31_1.time_ - var_34_41) / var_34_42

				if arg_31_1.var_.characterEffect1029ui_story then
					arg_31_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_41 + var_34_42 and arg_31_1.time_ < var_34_41 + var_34_42 + arg_34_0 and arg_31_1.var_.characterEffect1029ui_story then
				arg_31_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_34_44 = 3.8

			if var_34_44 < arg_31_1.time_ and arg_31_1.time_ <= var_34_44 + arg_34_0 then
				arg_31_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_34_45 = 3.8

			if var_34_45 < arg_31_1.time_ and arg_31_1.time_ <= var_34_45 + arg_34_0 then
				arg_31_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_46 = arg_31_1.actors_["1019ui_story"].transform
			local var_34_47 = 3.8

			if var_34_47 < arg_31_1.time_ and arg_31_1.time_ <= var_34_47 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019ui_story = var_34_46.localPosition
			end

			local var_34_48 = 0.001

			if var_34_47 <= arg_31_1.time_ and arg_31_1.time_ < var_34_47 + var_34_48 then
				local var_34_49 = (arg_31_1.time_ - var_34_47) / var_34_48
				local var_34_50 = Vector3.New(-0.7, -1.08, -5.9)

				var_34_46.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019ui_story, var_34_50, var_34_49)

				local var_34_51 = manager.ui.mainCamera.transform.position - var_34_46.position

				var_34_46.forward = Vector3.New(var_34_51.x, var_34_51.y, var_34_51.z)

				local var_34_52 = var_34_46.localEulerAngles

				var_34_52.z = 0
				var_34_52.x = 0
				var_34_46.localEulerAngles = var_34_52
			end

			if arg_31_1.time_ >= var_34_47 + var_34_48 and arg_31_1.time_ < var_34_47 + var_34_48 + arg_34_0 then
				var_34_46.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_34_53 = manager.ui.mainCamera.transform.position - var_34_46.position

				var_34_46.forward = Vector3.New(var_34_53.x, var_34_53.y, var_34_53.z)

				local var_34_54 = var_34_46.localEulerAngles

				var_34_54.z = 0
				var_34_54.x = 0
				var_34_46.localEulerAngles = var_34_54
			end

			local var_34_55 = arg_31_1.actors_["1019ui_story"]
			local var_34_56 = 3.8

			if var_34_56 < arg_31_1.time_ and arg_31_1.time_ <= var_34_56 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story == nil then
				arg_31_1.var_.characterEffect1019ui_story = var_34_55:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_57 = 0.200000002980232

			if var_34_56 <= arg_31_1.time_ and arg_31_1.time_ < var_34_56 + var_34_57 then
				local var_34_58 = (arg_31_1.time_ - var_34_56) / var_34_57

				if arg_31_1.var_.characterEffect1019ui_story then
					local var_34_59 = Mathf.Lerp(0, 0.5, var_34_58)

					arg_31_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1019ui_story.fillRatio = var_34_59
				end
			end

			if arg_31_1.time_ >= var_34_56 + var_34_57 and arg_31_1.time_ < var_34_56 + var_34_57 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story then
				local var_34_60 = 0.5

				arg_31_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1019ui_story.fillRatio = var_34_60
			end

			local var_34_61 = 2.00000000298023

			if var_34_61 < arg_31_1.time_ and arg_31_1.time_ <= var_34_61 + arg_34_0 then
				arg_31_1.screenFilterGo_:SetActive(true)

				arg_31_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_34_62 = 0.1

			if var_34_61 <= arg_31_1.time_ and arg_31_1.time_ < var_34_61 + var_34_62 then
				local var_34_63 = (arg_31_1.time_ - var_34_61) / var_34_62

				arg_31_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_34_63)
			end

			if arg_31_1.time_ >= var_34_61 + var_34_62 and arg_31_1.time_ < var_34_61 + var_34_62 + arg_34_0 then
				arg_31_1.screenFilterEffect_.weight = 1
			end

			local var_34_64 = 3.8

			if var_34_64 < arg_31_1.time_ and arg_31_1.time_ <= var_34_64 + arg_34_0 then
				arg_31_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_34_65 = arg_31_1.actors_["1019ui_story"].transform
			local var_34_66 = 1.96599999815226

			if var_34_66 < arg_31_1.time_ and arg_31_1.time_ <= var_34_66 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019ui_story = var_34_65.localPosition
			end

			local var_34_67 = 0.001

			if var_34_66 <= arg_31_1.time_ and arg_31_1.time_ < var_34_66 + var_34_67 then
				local var_34_68 = (arg_31_1.time_ - var_34_66) / var_34_67
				local var_34_69 = Vector3.New(0, 100, 0)

				var_34_65.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019ui_story, var_34_69, var_34_68)

				local var_34_70 = manager.ui.mainCamera.transform.position - var_34_65.position

				var_34_65.forward = Vector3.New(var_34_70.x, var_34_70.y, var_34_70.z)

				local var_34_71 = var_34_65.localEulerAngles

				var_34_71.z = 0
				var_34_71.x = 0
				var_34_65.localEulerAngles = var_34_71
			end

			if arg_31_1.time_ >= var_34_66 + var_34_67 and arg_31_1.time_ < var_34_66 + var_34_67 + arg_34_0 then
				var_34_65.localPosition = Vector3.New(0, 100, 0)

				local var_34_72 = manager.ui.mainCamera.transform.position - var_34_65.position

				var_34_65.forward = Vector3.New(var_34_72.x, var_34_72.y, var_34_72.z)

				local var_34_73 = var_34_65.localEulerAngles

				var_34_73.z = 0
				var_34_73.x = 0
				var_34_65.localEulerAngles = var_34_73
			end

			if arg_31_1.frameCnt_ <= 1 then
				arg_31_1.dialog_:SetActive(false)
			end

			local var_34_74 = 4
			local var_34_75 = 0.525

			if var_34_74 < arg_31_1.time_ and arg_31_1.time_ <= var_34_74 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_76 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_76:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_76:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_76:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_77 = arg_31_1:FormatText(StoryNameCfg[319].name)

				arg_31_1.leftNameTxt_.text = var_34_77

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_78 = arg_31_1:GetWordFromCfg(1101906008)
				local var_34_79 = arg_31_1:FormatText(var_34_78.content)

				arg_31_1.text_.text = var_34_79

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_80 = 21
				local var_34_81 = utf8.len(var_34_79)
				local var_34_82 = var_34_80 <= 0 and var_34_75 or var_34_75 * (var_34_81 / var_34_80)

				if var_34_82 > 0 and var_34_75 < var_34_82 then
					arg_31_1.talkMaxDuration = var_34_82
					var_34_74 = var_34_74 + 0.3

					if var_34_82 + var_34_74 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_82 + var_34_74
					end
				end

				arg_31_1.text_.text = var_34_79
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906008", "story_v_side_new_1101906.awb") ~= 0 then
					local var_34_83 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906008", "story_v_side_new_1101906.awb") / 1000

					if var_34_83 + var_34_74 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_83 + var_34_74
					end

					if var_34_78.prefab_name ~= "" and arg_31_1.actors_[var_34_78.prefab_name] ~= nil then
						local var_34_84 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_78.prefab_name].transform, "story_v_side_new_1101906", "1101906008", "story_v_side_new_1101906.awb")

						arg_31_1:RecordAudio("1101906008", var_34_84)
						arg_31_1:RecordAudio("1101906008", var_34_84)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906008", "story_v_side_new_1101906.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906008", "story_v_side_new_1101906.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_85 = var_34_74 + 0.3
			local var_34_86 = math.max(var_34_75, arg_31_1.talkMaxDuration)

			if var_34_85 <= arg_31_1.time_ and arg_31_1.time_ < var_34_85 + var_34_86 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_85) / var_34_86

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_85 + var_34_86 and arg_31_1.time_ < var_34_85 + var_34_86 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 1101906009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play1101906010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1019ui_story"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos1019ui_story = var_40_0.localPosition
			end

			local var_40_2 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2
				local var_40_4 = Vector3.New(0, -1.08, -5.9)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1019ui_story, var_40_4, var_40_3)

				local var_40_5 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_5.x, var_40_5.y, var_40_5.z)

				local var_40_6 = var_40_0.localEulerAngles

				var_40_6.z = 0
				var_40_6.x = 0
				var_40_0.localEulerAngles = var_40_6
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_40_7 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_7.x, var_40_7.y, var_40_7.z)

				local var_40_8 = var_40_0.localEulerAngles

				var_40_8.z = 0
				var_40_8.x = 0
				var_40_0.localEulerAngles = var_40_8
			end

			local var_40_9 = arg_37_1.actors_["1019ui_story"]
			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 and arg_37_1.var_.characterEffect1019ui_story == nil then
				arg_37_1.var_.characterEffect1019ui_story = var_40_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_11 = 0.200000002980232

			if var_40_10 <= arg_37_1.time_ and arg_37_1.time_ < var_40_10 + var_40_11 then
				local var_40_12 = (arg_37_1.time_ - var_40_10) / var_40_11

				if arg_37_1.var_.characterEffect1019ui_story then
					local var_40_13 = Mathf.Lerp(0, 0.5, var_40_12)

					arg_37_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1019ui_story.fillRatio = var_40_13
				end
			end

			if arg_37_1.time_ >= var_40_10 + var_40_11 and arg_37_1.time_ < var_40_10 + var_40_11 + arg_40_0 and arg_37_1.var_.characterEffect1019ui_story then
				local var_40_14 = 0.5

				arg_37_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1019ui_story.fillRatio = var_40_14
			end

			local var_40_15 = arg_37_1.actors_["1029ui_story"].transform
			local var_40_16 = 0

			if var_40_16 < arg_37_1.time_ and arg_37_1.time_ <= var_40_16 + arg_40_0 then
				arg_37_1.var_.moveOldPos1029ui_story = var_40_15.localPosition
			end

			local var_40_17 = 0.001

			if var_40_16 <= arg_37_1.time_ and arg_37_1.time_ < var_40_16 + var_40_17 then
				local var_40_18 = (arg_37_1.time_ - var_40_16) / var_40_17
				local var_40_19 = Vector3.New(0, 100, 0)

				var_40_15.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1029ui_story, var_40_19, var_40_18)

				local var_40_20 = manager.ui.mainCamera.transform.position - var_40_15.position

				var_40_15.forward = Vector3.New(var_40_20.x, var_40_20.y, var_40_20.z)

				local var_40_21 = var_40_15.localEulerAngles

				var_40_21.z = 0
				var_40_21.x = 0
				var_40_15.localEulerAngles = var_40_21
			end

			if arg_37_1.time_ >= var_40_16 + var_40_17 and arg_37_1.time_ < var_40_16 + var_40_17 + arg_40_0 then
				var_40_15.localPosition = Vector3.New(0, 100, 0)

				local var_40_22 = manager.ui.mainCamera.transform.position - var_40_15.position

				var_40_15.forward = Vector3.New(var_40_22.x, var_40_22.y, var_40_22.z)

				local var_40_23 = var_40_15.localEulerAngles

				var_40_23.z = 0
				var_40_23.x = 0
				var_40_15.localEulerAngles = var_40_23
			end

			local var_40_24 = arg_37_1.actors_["1029ui_story"]
			local var_40_25 = 0

			if var_40_25 < arg_37_1.time_ and arg_37_1.time_ <= var_40_25 + arg_40_0 and arg_37_1.var_.characterEffect1029ui_story == nil then
				arg_37_1.var_.characterEffect1029ui_story = var_40_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_26 = 0.200000002980232

			if var_40_25 <= arg_37_1.time_ and arg_37_1.time_ < var_40_25 + var_40_26 then
				local var_40_27 = (arg_37_1.time_ - var_40_25) / var_40_26

				if arg_37_1.var_.characterEffect1029ui_story then
					local var_40_28 = Mathf.Lerp(0, 0.5, var_40_27)

					arg_37_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1029ui_story.fillRatio = var_40_28
				end
			end

			if arg_37_1.time_ >= var_40_25 + var_40_26 and arg_37_1.time_ < var_40_25 + var_40_26 + arg_40_0 and arg_37_1.var_.characterEffect1029ui_story then
				local var_40_29 = 0.5

				arg_37_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1029ui_story.fillRatio = var_40_29
			end

			local var_40_30 = 0

			if var_40_30 < arg_37_1.time_ and arg_37_1.time_ <= var_40_30 + arg_40_0 then
				arg_37_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_40_31 = 0
			local var_40_32 = 0.25

			if var_40_31 < arg_37_1.time_ and arg_37_1.time_ <= var_40_31 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_33 = arg_37_1:FormatText(StoryNameCfg[7].name)

				arg_37_1.leftNameTxt_.text = var_40_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_34 = arg_37_1:GetWordFromCfg(1101906009)
				local var_40_35 = arg_37_1:FormatText(var_40_34.content)

				arg_37_1.text_.text = var_40_35

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_36 = 10
				local var_40_37 = utf8.len(var_40_35)
				local var_40_38 = var_40_36 <= 0 and var_40_32 or var_40_32 * (var_40_37 / var_40_36)

				if var_40_38 > 0 and var_40_32 < var_40_38 then
					arg_37_1.talkMaxDuration = var_40_38

					if var_40_38 + var_40_31 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_38 + var_40_31
					end
				end

				arg_37_1.text_.text = var_40_35
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_39 = math.max(var_40_32, arg_37_1.talkMaxDuration)

			if var_40_31 <= arg_37_1.time_ and arg_37_1.time_ < var_40_31 + var_40_39 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_31) / var_40_39

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_31 + var_40_39 and arg_37_1.time_ < var_40_31 + var_40_39 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 1101906010
		arg_41_1.duration_ = 0.999999999999

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play1101906011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1019ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect1019ui_story == nil then
				arg_41_1.var_.characterEffect1019ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.200000002980232

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect1019ui_story then
					arg_41_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect1019ui_story then
				arg_41_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_44_4 = 0
			local var_44_5 = 0.125

			if var_44_4 < arg_41_1.time_ and arg_41_1.time_ <= var_44_4 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_6 = arg_41_1:FormatText(StoryNameCfg[13].name)

				arg_41_1.leftNameTxt_.text = var_44_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_7 = arg_41_1:GetWordFromCfg(1101906010)
				local var_44_8 = arg_41_1:FormatText(var_44_7.content)

				arg_41_1.text_.text = var_44_8

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_9 = 5
				local var_44_10 = utf8.len(var_44_8)
				local var_44_11 = var_44_9 <= 0 and var_44_5 or var_44_5 * (var_44_10 / var_44_9)

				if var_44_11 > 0 and var_44_5 < var_44_11 then
					arg_41_1.talkMaxDuration = var_44_11

					if var_44_11 + var_44_4 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_11 + var_44_4
					end
				end

				arg_41_1.text_.text = var_44_8
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906010", "story_v_side_new_1101906.awb") ~= 0 then
					local var_44_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906010", "story_v_side_new_1101906.awb") / 1000

					if var_44_12 + var_44_4 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_12 + var_44_4
					end

					if var_44_7.prefab_name ~= "" and arg_41_1.actors_[var_44_7.prefab_name] ~= nil then
						local var_44_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_7.prefab_name].transform, "story_v_side_new_1101906", "1101906010", "story_v_side_new_1101906.awb")

						arg_41_1:RecordAudio("1101906010", var_44_13)
						arg_41_1:RecordAudio("1101906010", var_44_13)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906010", "story_v_side_new_1101906.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906010", "story_v_side_new_1101906.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_14 = math.max(var_44_5, arg_41_1.talkMaxDuration)

			if var_44_4 <= arg_41_1.time_ and arg_41_1.time_ < var_44_4 + var_44_14 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_4) / var_44_14

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_4 + var_44_14 and arg_41_1.time_ < var_44_4 + var_44_14 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 1101906011
		arg_45_1.duration_ = 9

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play1101906012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 2

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				local var_48_1 = manager.ui.mainCamera.transform.localPosition
				local var_48_2 = Vector3.New(0, 0, 10) + Vector3.New(var_48_1.x, var_48_1.y, 0)
				local var_48_3 = arg_45_1.bgs_.ST03

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
					if iter_48_0 ~= "ST03" then
						iter_48_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_15 = 2

			if var_48_14 <= arg_45_1.time_ and arg_45_1.time_ < var_48_14 + var_48_15 then
				local var_48_16 = (arg_45_1.time_ - var_48_14) / var_48_15
				local var_48_17 = Color.New(0, 0, 0)

				var_48_17.a = Mathf.Lerp(0, 1, var_48_16)
				arg_45_1.mask_.color = var_48_17
			end

			if arg_45_1.time_ >= var_48_14 + var_48_15 and arg_45_1.time_ < var_48_14 + var_48_15 + arg_48_0 then
				local var_48_18 = Color.New(0, 0, 0)

				var_48_18.a = 1
				arg_45_1.mask_.color = var_48_18
			end

			local var_48_19 = 2

			if var_48_19 < arg_45_1.time_ and arg_45_1.time_ <= var_48_19 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_20 = 2

			if var_48_19 <= arg_45_1.time_ and arg_45_1.time_ < var_48_19 + var_48_20 then
				local var_48_21 = (arg_45_1.time_ - var_48_19) / var_48_20
				local var_48_22 = Color.New(0, 0, 0)

				var_48_22.a = Mathf.Lerp(1, 0, var_48_21)
				arg_45_1.mask_.color = var_48_22
			end

			if arg_45_1.time_ >= var_48_19 + var_48_20 and arg_45_1.time_ < var_48_19 + var_48_20 + arg_48_0 then
				local var_48_23 = Color.New(0, 0, 0)
				local var_48_24 = 0

				arg_45_1.mask_.enabled = false
				var_48_23.a = var_48_24
				arg_45_1.mask_.color = var_48_23
			end

			local var_48_25 = arg_45_1.actors_["1019ui_story"]
			local var_48_26 = 2

			if var_48_26 < arg_45_1.time_ and arg_45_1.time_ <= var_48_26 + arg_48_0 and arg_45_1.var_.characterEffect1019ui_story == nil then
				arg_45_1.var_.characterEffect1019ui_story = var_48_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_27 = 0.200000002980232

			if var_48_26 <= arg_45_1.time_ and arg_45_1.time_ < var_48_26 + var_48_27 then
				local var_48_28 = (arg_45_1.time_ - var_48_26) / var_48_27

				if arg_45_1.var_.characterEffect1019ui_story then
					local var_48_29 = Mathf.Lerp(0, 0.5, var_48_28)

					arg_45_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1019ui_story.fillRatio = var_48_29
				end
			end

			if arg_45_1.time_ >= var_48_26 + var_48_27 and arg_45_1.time_ < var_48_26 + var_48_27 + arg_48_0 and arg_45_1.var_.characterEffect1019ui_story then
				local var_48_30 = 0.5

				arg_45_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1019ui_story.fillRatio = var_48_30
			end

			local var_48_31 = 2

			if var_48_31 < arg_45_1.time_ and arg_45_1.time_ <= var_48_31 + arg_48_0 then
				arg_45_1.screenFilterGo_:SetActive(false)
			end

			local var_48_32 = 0.1

			if var_48_31 <= arg_45_1.time_ and arg_45_1.time_ < var_48_31 + var_48_32 then
				local var_48_33 = (arg_45_1.time_ - var_48_31) / var_48_32

				arg_45_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_48_33)
			end

			if arg_45_1.time_ >= var_48_31 + var_48_32 and arg_45_1.time_ < var_48_31 + var_48_32 + arg_48_0 then
				arg_45_1.screenFilterEffect_.weight = 0
			end

			local var_48_34 = arg_45_1.actors_["1019ui_story"].transform
			local var_48_35 = 1.966

			if var_48_35 < arg_45_1.time_ and arg_45_1.time_ <= var_48_35 + arg_48_0 then
				arg_45_1.var_.moveOldPos1019ui_story = var_48_34.localPosition
			end

			local var_48_36 = 0.001

			if var_48_35 <= arg_45_1.time_ and arg_45_1.time_ < var_48_35 + var_48_36 then
				local var_48_37 = (arg_45_1.time_ - var_48_35) / var_48_36
				local var_48_38 = Vector3.New(0, 100, 0)

				var_48_34.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1019ui_story, var_48_38, var_48_37)

				local var_48_39 = manager.ui.mainCamera.transform.position - var_48_34.position

				var_48_34.forward = Vector3.New(var_48_39.x, var_48_39.y, var_48_39.z)

				local var_48_40 = var_48_34.localEulerAngles

				var_48_40.z = 0
				var_48_40.x = 0
				var_48_34.localEulerAngles = var_48_40
			end

			if arg_45_1.time_ >= var_48_35 + var_48_36 and arg_45_1.time_ < var_48_35 + var_48_36 + arg_48_0 then
				var_48_34.localPosition = Vector3.New(0, 100, 0)

				local var_48_41 = manager.ui.mainCamera.transform.position - var_48_34.position

				var_48_34.forward = Vector3.New(var_48_41.x, var_48_41.y, var_48_41.z)

				local var_48_42 = var_48_34.localEulerAngles

				var_48_42.z = 0
				var_48_42.x = 0
				var_48_34.localEulerAngles = var_48_42
			end

			local var_48_43 = arg_45_1.actors_["1019ui_story"].transform
			local var_48_44 = 3.8

			if var_48_44 < arg_45_1.time_ and arg_45_1.time_ <= var_48_44 + arg_48_0 then
				arg_45_1.var_.moveOldPos1019ui_story = var_48_43.localPosition
			end

			local var_48_45 = 0.001

			if var_48_44 <= arg_45_1.time_ and arg_45_1.time_ < var_48_44 + var_48_45 then
				local var_48_46 = (arg_45_1.time_ - var_48_44) / var_48_45
				local var_48_47 = Vector3.New(0, -1.08, -5.9)

				var_48_43.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1019ui_story, var_48_47, var_48_46)

				local var_48_48 = manager.ui.mainCamera.transform.position - var_48_43.position

				var_48_43.forward = Vector3.New(var_48_48.x, var_48_48.y, var_48_48.z)

				local var_48_49 = var_48_43.localEulerAngles

				var_48_49.z = 0
				var_48_49.x = 0
				var_48_43.localEulerAngles = var_48_49
			end

			if arg_45_1.time_ >= var_48_44 + var_48_45 and arg_45_1.time_ < var_48_44 + var_48_45 + arg_48_0 then
				var_48_43.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_48_50 = manager.ui.mainCamera.transform.position - var_48_43.position

				var_48_43.forward = Vector3.New(var_48_50.x, var_48_50.y, var_48_50.z)

				local var_48_51 = var_48_43.localEulerAngles

				var_48_51.z = 0
				var_48_51.x = 0
				var_48_43.localEulerAngles = var_48_51
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_52 = 4
			local var_48_53 = 0.725

			if var_48_52 < arg_45_1.time_ and arg_45_1.time_ <= var_48_52 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_54 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_54:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_55 = arg_45_1:FormatText(StoryNameCfg[7].name)

				arg_45_1.leftNameTxt_.text = var_48_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_56 = arg_45_1:GetWordFromCfg(1101906011)
				local var_48_57 = arg_45_1:FormatText(var_48_56.content)

				arg_45_1.text_.text = var_48_57

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_58 = 29
				local var_48_59 = utf8.len(var_48_57)
				local var_48_60 = var_48_58 <= 0 and var_48_53 or var_48_53 * (var_48_59 / var_48_58)

				if var_48_60 > 0 and var_48_53 < var_48_60 then
					arg_45_1.talkMaxDuration = var_48_60
					var_48_52 = var_48_52 + 0.3

					if var_48_60 + var_48_52 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_60 + var_48_52
					end
				end

				arg_45_1.text_.text = var_48_57
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_61 = var_48_52 + 0.3
			local var_48_62 = math.max(var_48_53, arg_45_1.talkMaxDuration)

			if var_48_61 <= arg_45_1.time_ and arg_45_1.time_ < var_48_61 + var_48_62 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_61) / var_48_62

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_61 + var_48_62 and arg_45_1.time_ < var_48_61 + var_48_62 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 1101906012
		arg_51_1.duration_ = 1.999999999999

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play1101906013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1019ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1019ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, -1.08, -5.9)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1019ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["1019ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect1019ui_story == nil then
				arg_51_1.var_.characterEffect1019ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect1019ui_story then
					arg_51_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect1019ui_story then
				arg_51_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_54_15 = 0
			local var_54_16 = 0.175

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_17 = arg_51_1:FormatText(StoryNameCfg[13].name)

				arg_51_1.leftNameTxt_.text = var_54_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_18 = arg_51_1:GetWordFromCfg(1101906012)
				local var_54_19 = arg_51_1:FormatText(var_54_18.content)

				arg_51_1.text_.text = var_54_19

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_20 = 7
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906012", "story_v_side_new_1101906.awb") ~= 0 then
					local var_54_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906012", "story_v_side_new_1101906.awb") / 1000

					if var_54_23 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_23 + var_54_15
					end

					if var_54_18.prefab_name ~= "" and arg_51_1.actors_[var_54_18.prefab_name] ~= nil then
						local var_54_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_18.prefab_name].transform, "story_v_side_new_1101906", "1101906012", "story_v_side_new_1101906.awb")

						arg_51_1:RecordAudio("1101906012", var_54_24)
						arg_51_1:RecordAudio("1101906012", var_54_24)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906012", "story_v_side_new_1101906.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906012", "story_v_side_new_1101906.awb")
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
	Play1101906013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 1101906013
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play1101906014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1019ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1019ui_story == nil then
				arg_55_1.var_.characterEffect1019ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1019ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1019ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1019ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1019ui_story.fillRatio = var_58_5
			end

			local var_58_6 = 0
			local var_58_7 = 0.2

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[7].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(1101906013)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 8
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
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_14 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_14 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_14

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_14 and arg_55_1.time_ < var_58_6 + var_58_14 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 1101906014
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play1101906015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_62_1 = 0
			local var_62_2 = 1.2

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(1101906014)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 48
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_2 or var_62_2 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_2 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_1 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_1
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_8 = math.max(var_62_2, arg_59_1.talkMaxDuration)

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_8 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_1) / var_62_8

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_1 + var_62_8 and arg_59_1.time_ < var_62_1 + var_62_8 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 1101906015
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play1101906016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.925

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[7].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(1101906015)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 37
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
	Play1101906016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 1101906016
		arg_67_1.duration_ = 1.5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play1101906017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1019ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1019ui_story == nil then
				arg_67_1.var_.characterEffect1019ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1019ui_story then
					arg_67_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1019ui_story then
				arg_67_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_70_4 = 0
			local var_70_5 = 0.15

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_6 = arg_67_1:FormatText(StoryNameCfg[13].name)

				arg_67_1.leftNameTxt_.text = var_70_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_7 = arg_67_1:GetWordFromCfg(1101906016)
				local var_70_8 = arg_67_1:FormatText(var_70_7.content)

				arg_67_1.text_.text = var_70_8

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_9 = 6
				local var_70_10 = utf8.len(var_70_8)
				local var_70_11 = var_70_9 <= 0 and var_70_5 or var_70_5 * (var_70_10 / var_70_9)

				if var_70_11 > 0 and var_70_5 < var_70_11 then
					arg_67_1.talkMaxDuration = var_70_11

					if var_70_11 + var_70_4 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_11 + var_70_4
					end
				end

				arg_67_1.text_.text = var_70_8
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906016", "story_v_side_new_1101906.awb") ~= 0 then
					local var_70_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906016", "story_v_side_new_1101906.awb") / 1000

					if var_70_12 + var_70_4 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_12 + var_70_4
					end

					if var_70_7.prefab_name ~= "" and arg_67_1.actors_[var_70_7.prefab_name] ~= nil then
						local var_70_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_7.prefab_name].transform, "story_v_side_new_1101906", "1101906016", "story_v_side_new_1101906.awb")

						arg_67_1:RecordAudio("1101906016", var_70_13)
						arg_67_1:RecordAudio("1101906016", var_70_13)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906016", "story_v_side_new_1101906.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906016", "story_v_side_new_1101906.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_14 = math.max(var_70_5, arg_67_1.talkMaxDuration)

			if var_70_4 <= arg_67_1.time_ and arg_67_1.time_ < var_70_4 + var_70_14 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_4) / var_70_14

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_4 + var_70_14 and arg_67_1.time_ < var_70_4 + var_70_14 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 1101906017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play1101906018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1019ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1019ui_story == nil then
				arg_71_1.var_.characterEffect1019ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1019ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1019ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1019ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1019ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 0.7

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_8 = arg_71_1:GetWordFromCfg(1101906017)
				local var_74_9 = arg_71_1:FormatText(var_74_8.content)

				arg_71_1.text_.text = var_74_9

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_10 = 28
				local var_74_11 = utf8.len(var_74_9)
				local var_74_12 = var_74_10 <= 0 and var_74_7 or var_74_7 * (var_74_11 / var_74_10)

				if var_74_12 > 0 and var_74_7 < var_74_12 then
					arg_71_1.talkMaxDuration = var_74_12

					if var_74_12 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_9
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_13 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_13 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_13

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_13 and arg_71_1.time_ < var_74_6 + var_74_13 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 1101906018
		arg_75_1.duration_ = 9

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play1101906019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = "B02f"

			if arg_75_1.bgs_[var_78_0] == nil then
				local var_78_1 = Object.Instantiate(arg_75_1.paintGo_)

				var_78_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_78_0)
				var_78_1.name = var_78_0
				var_78_1.transform.parent = arg_75_1.stage_.transform
				var_78_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_75_1.bgs_[var_78_0] = var_78_1
			end

			local var_78_2 = 2

			if var_78_2 < arg_75_1.time_ and arg_75_1.time_ <= var_78_2 + arg_78_0 then
				local var_78_3 = manager.ui.mainCamera.transform.localPosition
				local var_78_4 = Vector3.New(0, 0, 10) + Vector3.New(var_78_3.x, var_78_3.y, 0)
				local var_78_5 = arg_75_1.bgs_.B02f

				var_78_5.transform.localPosition = var_78_4
				var_78_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_78_6 = var_78_5:GetComponent("SpriteRenderer")

				if var_78_6 and var_78_6.sprite then
					local var_78_7 = (var_78_5.transform.localPosition - var_78_3).z
					local var_78_8 = manager.ui.mainCameraCom_
					local var_78_9 = 2 * var_78_7 * Mathf.Tan(var_78_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_78_10 = var_78_9 * var_78_8.aspect
					local var_78_11 = var_78_6.sprite.bounds.size.x
					local var_78_12 = var_78_6.sprite.bounds.size.y
					local var_78_13 = var_78_10 / var_78_11
					local var_78_14 = var_78_9 / var_78_12
					local var_78_15 = var_78_14 < var_78_13 and var_78_13 or var_78_14

					var_78_5.transform.localScale = Vector3.New(var_78_15, var_78_15, 0)
				end

				for iter_78_0, iter_78_1 in pairs(arg_75_1.bgs_) do
					if iter_78_0 ~= "B02f" then
						iter_78_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_17 = 2

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17
				local var_78_19 = Color.New(0, 0, 0)

				var_78_19.a = Mathf.Lerp(0, 1, var_78_18)
				arg_75_1.mask_.color = var_78_19
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 then
				local var_78_20 = Color.New(0, 0, 0)

				var_78_20.a = 1
				arg_75_1.mask_.color = var_78_20
			end

			local var_78_21 = 2

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_22 = 2

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_22 then
				local var_78_23 = (arg_75_1.time_ - var_78_21) / var_78_22
				local var_78_24 = Color.New(0, 0, 0)

				var_78_24.a = Mathf.Lerp(1, 0, var_78_23)
				arg_75_1.mask_.color = var_78_24
			end

			if arg_75_1.time_ >= var_78_21 + var_78_22 and arg_75_1.time_ < var_78_21 + var_78_22 + arg_78_0 then
				local var_78_25 = Color.New(0, 0, 0)
				local var_78_26 = 0

				arg_75_1.mask_.enabled = false
				var_78_25.a = var_78_26
				arg_75_1.mask_.color = var_78_25
			end

			if arg_75_1.frameCnt_ <= 1 then
				arg_75_1.dialog_:SetActive(false)
			end

			local var_78_27 = 4
			local var_78_28 = 0.4

			if var_78_27 < arg_75_1.time_ and arg_75_1.time_ <= var_78_27 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0

				arg_75_1.dialog_:SetActive(true)

				local var_78_29 = LeanTween.value(arg_75_1.dialog_, 0, 1, 0.3)

				var_78_29:setOnUpdate(LuaHelper.FloatAction(function(arg_79_0)
					arg_75_1.dialogCg_.alpha = arg_79_0
				end))
				var_78_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_75_1.dialog_)
					var_78_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_75_1.duration_ = arg_75_1.duration_ + 0.3

				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_30 = arg_75_1:GetWordFromCfg(1101906018)
				local var_78_31 = arg_75_1:FormatText(var_78_30.content)

				arg_75_1.text_.text = var_78_31

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_32 = 16
				local var_78_33 = utf8.len(var_78_31)
				local var_78_34 = var_78_32 <= 0 and var_78_28 or var_78_28 * (var_78_33 / var_78_32)

				if var_78_34 > 0 and var_78_28 < var_78_34 then
					arg_75_1.talkMaxDuration = var_78_34
					var_78_27 = var_78_27 + 0.3

					if var_78_34 + var_78_27 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_34 + var_78_27
					end
				end

				arg_75_1.text_.text = var_78_31
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_35 = var_78_27 + 0.3
			local var_78_36 = math.max(var_78_28, arg_75_1.talkMaxDuration)

			if var_78_35 <= arg_75_1.time_ and arg_75_1.time_ < var_78_35 + var_78_36 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_35) / var_78_36

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_35 + var_78_36 and arg_75_1.time_ < var_78_35 + var_78_36 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 1101906019
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play1101906020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_84_2 = 0
			local var_84_3 = 1.3

			if var_84_2 < arg_81_1.time_ and arg_81_1.time_ <= var_84_2 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_4 = arg_81_1:GetWordFromCfg(1101906019)
				local var_84_5 = arg_81_1:FormatText(var_84_4.content)

				arg_81_1.text_.text = var_84_5

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_6 = 52
				local var_84_7 = utf8.len(var_84_5)
				local var_84_8 = var_84_6 <= 0 and var_84_3 or var_84_3 * (var_84_7 / var_84_6)

				if var_84_8 > 0 and var_84_3 < var_84_8 then
					arg_81_1.talkMaxDuration = var_84_8

					if var_84_8 + var_84_2 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_2
					end
				end

				arg_81_1.text_.text = var_84_5
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_9 = math.max(var_84_3, arg_81_1.talkMaxDuration)

			if var_84_2 <= arg_81_1.time_ and arg_81_1.time_ < var_84_2 + var_84_9 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_2) / var_84_9

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_2 + var_84_9 and arg_81_1.time_ < var_84_2 + var_84_9 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 1101906020
		arg_85_1.duration_ = 2.766

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play1101906021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.35

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[705].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, true)
				arg_85_1.iconController_:SetSelectedState("hero")

				arg_85_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_newcomerwa")

				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(1101906020)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906020", "story_v_side_new_1101906.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906020", "story_v_side_new_1101906.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_side_new_1101906", "1101906020", "story_v_side_new_1101906.awb")

						arg_85_1:RecordAudio("1101906020", var_88_9)
						arg_85_1:RecordAudio("1101906020", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906020", "story_v_side_new_1101906.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906020", "story_v_side_new_1101906.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_10 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_10 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_10

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_10 and arg_85_1.time_ < var_88_0 + var_88_10 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 1101906021
		arg_89_1.duration_ = 2.833

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play1101906022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.25

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[706].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, true)
				arg_89_1.iconController_:SetSelectedState("hero")

				arg_89_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_newcomerwb")

				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(1101906021)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906021", "story_v_side_new_1101906.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906021", "story_v_side_new_1101906.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_side_new_1101906", "1101906021", "story_v_side_new_1101906.awb")

						arg_89_1:RecordAudio("1101906021", var_92_9)
						arg_89_1:RecordAudio("1101906021", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906021", "story_v_side_new_1101906.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906021", "story_v_side_new_1101906.awb")
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
	Play1101906022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 1101906022
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play1101906023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.85

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

				local var_96_2 = arg_93_1:GetWordFromCfg(1101906022)
				local var_96_3 = arg_93_1:FormatText(var_96_2.content)

				arg_93_1.text_.text = var_96_3

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_4 = 34
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
	Play1101906023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 1101906023
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play1101906024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 1.325

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_2 = arg_97_1:GetWordFromCfg(1101906023)
				local var_100_3 = arg_97_1:FormatText(var_100_2.content)

				arg_97_1.text_.text = var_100_3

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_4 = 53
				local var_100_5 = utf8.len(var_100_3)
				local var_100_6 = var_100_4 <= 0 and var_100_1 or var_100_1 * (var_100_5 / var_100_4)

				if var_100_6 > 0 and var_100_1 < var_100_6 then
					arg_97_1.talkMaxDuration = var_100_6

					if var_100_6 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_6 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_3
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_7 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_7 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_7

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_7 and arg_97_1.time_ < var_100_0 + var_100_7 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 1101906024
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play1101906025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_2")
			end

			local var_104_2 = 0
			local var_104_3 = 0.325

			if var_104_2 < arg_101_1.time_ and arg_101_1.time_ <= var_104_2 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_4 = arg_101_1:GetWordFromCfg(1101906024)
				local var_104_5 = arg_101_1:FormatText(var_104_4.content)

				arg_101_1.text_.text = var_104_5

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_6 = 13
				local var_104_7 = utf8.len(var_104_5)
				local var_104_8 = var_104_6 <= 0 and var_104_3 or var_104_3 * (var_104_7 / var_104_6)

				if var_104_8 > 0 and var_104_3 < var_104_8 then
					arg_101_1.talkMaxDuration = var_104_8

					if var_104_8 + var_104_2 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_2
					end
				end

				arg_101_1.text_.text = var_104_5
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_9 = math.max(var_104_3, arg_101_1.talkMaxDuration)

			if var_104_2 <= arg_101_1.time_ and arg_101_1.time_ < var_104_2 + var_104_9 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_2) / var_104_9

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_2 + var_104_9 and arg_101_1.time_ < var_104_2 + var_104_9 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 1101906025
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play1101906026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.475

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

				local var_108_3 = arg_105_1:GetWordFromCfg(1101906025)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 19
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
	Play1101906026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 1101906026
		arg_109_1.duration_ = 3.366

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play1101906027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.1

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[708].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(1101906026)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906026", "story_v_side_new_1101906.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906026", "story_v_side_new_1101906.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_side_new_1101906", "1101906026", "story_v_side_new_1101906.awb")

						arg_109_1:RecordAudio("1101906026", var_112_9)
						arg_109_1:RecordAudio("1101906026", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906026", "story_v_side_new_1101906.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906026", "story_v_side_new_1101906.awb")
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
	Play1101906027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 1101906027
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play1101906028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.225

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_2 = arg_113_1:GetWordFromCfg(1101906027)
				local var_116_3 = arg_113_1:FormatText(var_116_2.content)

				arg_113_1.text_.text = var_116_3

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_4 = 49
				local var_116_5 = utf8.len(var_116_3)
				local var_116_6 = var_116_4 <= 0 and var_116_1 or var_116_1 * (var_116_5 / var_116_4)

				if var_116_6 > 0 and var_116_1 < var_116_6 then
					arg_113_1.talkMaxDuration = var_116_6

					if var_116_6 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_6 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_3
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_7 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_7 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_7

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_7 and arg_113_1.time_ < var_116_0 + var_116_7 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 1101906028
		arg_117_1.duration_ = 3.6

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play1101906029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 0.45

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[705].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, true)
				arg_117_1.iconController_:SetSelectedState("hero")

				arg_117_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_newcomerwa")

				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(1101906028)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906028", "story_v_side_new_1101906.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906028", "story_v_side_new_1101906.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_side_new_1101906", "1101906028", "story_v_side_new_1101906.awb")

						arg_117_1:RecordAudio("1101906028", var_120_9)
						arg_117_1:RecordAudio("1101906028", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906028", "story_v_side_new_1101906.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906028", "story_v_side_new_1101906.awb")
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
	Play1101906029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 1101906029
		arg_121_1.duration_ = 4.133

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play1101906030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.55

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[706].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_newcomerwb")

				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(1101906029)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906029", "story_v_side_new_1101906.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906029", "story_v_side_new_1101906.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_side_new_1101906", "1101906029", "story_v_side_new_1101906.awb")

						arg_121_1:RecordAudio("1101906029", var_124_9)
						arg_121_1:RecordAudio("1101906029", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906029", "story_v_side_new_1101906.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906029", "story_v_side_new_1101906.awb")
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
	Play1101906030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 1101906030
		arg_125_1.duration_ = 3.133

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play1101906031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.45

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_2 = arg_125_1:FormatText(StoryNameCfg[707].name)

				arg_125_1.leftNameTxt_.text = var_128_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, true)
				arg_125_1.iconController_:SetSelectedState("hero")

				arg_125_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_newcomerwc")

				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_3 = arg_125_1:GetWordFromCfg(1101906030)
				local var_128_4 = arg_125_1:FormatText(var_128_3.content)

				arg_125_1.text_.text = var_128_4

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_5 = 18
				local var_128_6 = utf8.len(var_128_4)
				local var_128_7 = var_128_5 <= 0 and var_128_1 or var_128_1 * (var_128_6 / var_128_5)

				if var_128_7 > 0 and var_128_1 < var_128_7 then
					arg_125_1.talkMaxDuration = var_128_7

					if var_128_7 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_7 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_4
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906030", "story_v_side_new_1101906.awb") ~= 0 then
					local var_128_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906030", "story_v_side_new_1101906.awb") / 1000

					if var_128_8 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_8 + var_128_0
					end

					if var_128_3.prefab_name ~= "" and arg_125_1.actors_[var_128_3.prefab_name] ~= nil then
						local var_128_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_3.prefab_name].transform, "story_v_side_new_1101906", "1101906030", "story_v_side_new_1101906.awb")

						arg_125_1:RecordAudio("1101906030", var_128_9)
						arg_125_1:RecordAudio("1101906030", var_128_9)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906030", "story_v_side_new_1101906.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906030", "story_v_side_new_1101906.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_10 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_10 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_10

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_10 and arg_125_1.time_ < var_128_0 + var_128_10 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 1101906031
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play1101906032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.55

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[7].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(1101906031)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 22
				local var_132_6 = utf8.len(var_132_4)
				local var_132_7 = var_132_5 <= 0 and var_132_1 or var_132_1 * (var_132_6 / var_132_5)

				if var_132_7 > 0 and var_132_1 < var_132_7 then
					arg_129_1.talkMaxDuration = var_132_7

					if var_132_7 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_7 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_4
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_8 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_8 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_8

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_8 and arg_129_1.time_ < var_132_0 + var_132_8 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 1101906032
		arg_133_1.duration_ = 7.133

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play1101906033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1019ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1019ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, -1.08, -5.9)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1019ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["1019ui_story"]
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect1019ui_story == nil then
				arg_133_1.var_.characterEffect1019ui_story = var_136_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_11 = 0.200000002980232

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11

				if arg_133_1.var_.characterEffect1019ui_story then
					arg_133_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 and arg_133_1.var_.characterEffect1019ui_story then
				arg_133_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_136_13 = 0

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_136_14 = 0

			if var_136_14 < arg_133_1.time_ and arg_133_1.time_ <= var_136_14 + arg_136_0 then
				arg_133_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_136_15 = 0
			local var_136_16 = 0.75

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_17 = arg_133_1:FormatText(StoryNameCfg[13].name)

				arg_133_1.leftNameTxt_.text = var_136_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_18 = arg_133_1:GetWordFromCfg(1101906032)
				local var_136_19 = arg_133_1:FormatText(var_136_18.content)

				arg_133_1.text_.text = var_136_19

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_20 = 30
				local var_136_21 = utf8.len(var_136_19)
				local var_136_22 = var_136_20 <= 0 and var_136_16 or var_136_16 * (var_136_21 / var_136_20)

				if var_136_22 > 0 and var_136_16 < var_136_22 then
					arg_133_1.talkMaxDuration = var_136_22

					if var_136_22 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_22 + var_136_15
					end
				end

				arg_133_1.text_.text = var_136_19
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906032", "story_v_side_new_1101906.awb") ~= 0 then
					local var_136_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906032", "story_v_side_new_1101906.awb") / 1000

					if var_136_23 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_23 + var_136_15
					end

					if var_136_18.prefab_name ~= "" and arg_133_1.actors_[var_136_18.prefab_name] ~= nil then
						local var_136_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_18.prefab_name].transform, "story_v_side_new_1101906", "1101906032", "story_v_side_new_1101906.awb")

						arg_133_1:RecordAudio("1101906032", var_136_24)
						arg_133_1:RecordAudio("1101906032", var_136_24)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906032", "story_v_side_new_1101906.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906032", "story_v_side_new_1101906.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_25 = math.max(var_136_16, arg_133_1.talkMaxDuration)

			if var_136_15 <= arg_133_1.time_ and arg_133_1.time_ < var_136_15 + var_136_25 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_15) / var_136_25

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_15 + var_136_25 and arg_133_1.time_ < var_136_15 + var_136_25 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 1101906033
		arg_137_1.duration_ = 7.1

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play1101906034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1019ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1019ui_story == nil then
				arg_137_1.var_.characterEffect1019ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1019ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1019ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1019ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1019ui_story.fillRatio = var_140_5
			end

			local var_140_6 = 0
			local var_140_7 = 0.95

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_8 = arg_137_1:FormatText(StoryNameCfg[705].name)

				arg_137_1.leftNameTxt_.text = var_140_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_newcomerwa")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_9 = arg_137_1:GetWordFromCfg(1101906033)
				local var_140_10 = arg_137_1:FormatText(var_140_9.content)

				arg_137_1.text_.text = var_140_10

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_11 = 38
				local var_140_12 = utf8.len(var_140_10)
				local var_140_13 = var_140_11 <= 0 and var_140_7 or var_140_7 * (var_140_12 / var_140_11)

				if var_140_13 > 0 and var_140_7 < var_140_13 then
					arg_137_1.talkMaxDuration = var_140_13

					if var_140_13 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_13 + var_140_6
					end
				end

				arg_137_1.text_.text = var_140_10
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906033", "story_v_side_new_1101906.awb") ~= 0 then
					local var_140_14 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906033", "story_v_side_new_1101906.awb") / 1000

					if var_140_14 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_14 + var_140_6
					end

					if var_140_9.prefab_name ~= "" and arg_137_1.actors_[var_140_9.prefab_name] ~= nil then
						local var_140_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_9.prefab_name].transform, "story_v_side_new_1101906", "1101906033", "story_v_side_new_1101906.awb")

						arg_137_1:RecordAudio("1101906033", var_140_15)
						arg_137_1:RecordAudio("1101906033", var_140_15)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906033", "story_v_side_new_1101906.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906033", "story_v_side_new_1101906.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_16 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_16 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_16

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_16 and arg_137_1.time_ < var_140_6 + var_140_16 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 1101906034
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play1101906035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.55

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[7].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(1101906034)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 22
				local var_144_6 = utf8.len(var_144_4)
				local var_144_7 = var_144_5 <= 0 and var_144_1 or var_144_1 * (var_144_6 / var_144_5)

				if var_144_7 > 0 and var_144_1 < var_144_7 then
					arg_141_1.talkMaxDuration = var_144_7

					if var_144_7 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_7 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_4
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_8 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_8 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_8

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_8 and arg_141_1.time_ < var_144_0 + var_144_8 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 1101906035
		arg_145_1.duration_ = 7.4

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play1101906036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1019ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1019ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(0, -1.08, -5.9)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1019ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = arg_145_1.actors_["1019ui_story"]
			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 and arg_145_1.var_.characterEffect1019ui_story == nil then
				arg_145_1.var_.characterEffect1019ui_story = var_148_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_11 = 0.200000002980232

			if var_148_10 <= arg_145_1.time_ and arg_145_1.time_ < var_148_10 + var_148_11 then
				local var_148_12 = (arg_145_1.time_ - var_148_10) / var_148_11

				if arg_145_1.var_.characterEffect1019ui_story then
					arg_145_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_10 + var_148_11 and arg_145_1.time_ < var_148_10 + var_148_11 + arg_148_0 and arg_145_1.var_.characterEffect1019ui_story then
				arg_145_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_148_13 = 0

			if var_148_13 < arg_145_1.time_ and arg_145_1.time_ <= var_148_13 + arg_148_0 then
				arg_145_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_2")
			end

			local var_148_14 = 0

			if var_148_14 < arg_145_1.time_ and arg_145_1.time_ <= var_148_14 + arg_148_0 then
				arg_145_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_148_15 = 0
			local var_148_16 = 0.85

			if var_148_15 < arg_145_1.time_ and arg_145_1.time_ <= var_148_15 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_17 = arg_145_1:FormatText(StoryNameCfg[13].name)

				arg_145_1.leftNameTxt_.text = var_148_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_18 = arg_145_1:GetWordFromCfg(1101906035)
				local var_148_19 = arg_145_1:FormatText(var_148_18.content)

				arg_145_1.text_.text = var_148_19

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_20 = 34
				local var_148_21 = utf8.len(var_148_19)
				local var_148_22 = var_148_20 <= 0 and var_148_16 or var_148_16 * (var_148_21 / var_148_20)

				if var_148_22 > 0 and var_148_16 < var_148_22 then
					arg_145_1.talkMaxDuration = var_148_22

					if var_148_22 + var_148_15 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_22 + var_148_15
					end
				end

				arg_145_1.text_.text = var_148_19
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906035", "story_v_side_new_1101906.awb") ~= 0 then
					local var_148_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906035", "story_v_side_new_1101906.awb") / 1000

					if var_148_23 + var_148_15 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_23 + var_148_15
					end

					if var_148_18.prefab_name ~= "" and arg_145_1.actors_[var_148_18.prefab_name] ~= nil then
						local var_148_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_18.prefab_name].transform, "story_v_side_new_1101906", "1101906035", "story_v_side_new_1101906.awb")

						arg_145_1:RecordAudio("1101906035", var_148_24)
						arg_145_1:RecordAudio("1101906035", var_148_24)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906035", "story_v_side_new_1101906.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906035", "story_v_side_new_1101906.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_25 = math.max(var_148_16, arg_145_1.talkMaxDuration)

			if var_148_15 <= arg_145_1.time_ and arg_145_1.time_ < var_148_15 + var_148_25 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_15) / var_148_25

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_15 + var_148_25 and arg_145_1.time_ < var_148_15 + var_148_25 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 1101906036
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play1101906037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1019ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1019ui_story == nil then
				arg_149_1.var_.characterEffect1019ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1019ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1019ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1019ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1019ui_story.fillRatio = var_152_5
			end

			local var_152_6 = 0

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 then
				arg_149_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_152_7 = 0
			local var_152_8 = 0.4

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_9 = arg_149_1:GetWordFromCfg(1101906036)
				local var_152_10 = arg_149_1:FormatText(var_152_9.content)

				arg_149_1.text_.text = var_152_10

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_11 = 16
				local var_152_12 = utf8.len(var_152_10)
				local var_152_13 = var_152_11 <= 0 and var_152_8 or var_152_8 * (var_152_12 / var_152_11)

				if var_152_13 > 0 and var_152_8 < var_152_13 then
					arg_149_1.talkMaxDuration = var_152_13

					if var_152_13 + var_152_7 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_13 + var_152_7
					end
				end

				arg_149_1.text_.text = var_152_10
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_14 = math.max(var_152_8, arg_149_1.talkMaxDuration)

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_14 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_7) / var_152_14

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_7 + var_152_14 and arg_149_1.time_ < var_152_7 + var_152_14 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 1101906037
		arg_153_1.duration_ = 5.7

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play1101906038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1019ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1019ui_story == nil then
				arg_153_1.var_.characterEffect1019ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1019ui_story then
					arg_153_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1019ui_story then
				arg_153_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_156_4 = 0
			local var_156_5 = 0.575

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_6 = arg_153_1:FormatText(StoryNameCfg[13].name)

				arg_153_1.leftNameTxt_.text = var_156_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_7 = arg_153_1:GetWordFromCfg(1101906037)
				local var_156_8 = arg_153_1:FormatText(var_156_7.content)

				arg_153_1.text_.text = var_156_8

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_9 = 23
				local var_156_10 = utf8.len(var_156_8)
				local var_156_11 = var_156_9 <= 0 and var_156_5 or var_156_5 * (var_156_10 / var_156_9)

				if var_156_11 > 0 and var_156_5 < var_156_11 then
					arg_153_1.talkMaxDuration = var_156_11

					if var_156_11 + var_156_4 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_11 + var_156_4
					end
				end

				arg_153_1.text_.text = var_156_8
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906037", "story_v_side_new_1101906.awb") ~= 0 then
					local var_156_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906037", "story_v_side_new_1101906.awb") / 1000

					if var_156_12 + var_156_4 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_12 + var_156_4
					end

					if var_156_7.prefab_name ~= "" and arg_153_1.actors_[var_156_7.prefab_name] ~= nil then
						local var_156_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_7.prefab_name].transform, "story_v_side_new_1101906", "1101906037", "story_v_side_new_1101906.awb")

						arg_153_1:RecordAudio("1101906037", var_156_13)
						arg_153_1:RecordAudio("1101906037", var_156_13)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906037", "story_v_side_new_1101906.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906037", "story_v_side_new_1101906.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_14 = math.max(var_156_5, arg_153_1.talkMaxDuration)

			if var_156_4 <= arg_153_1.time_ and arg_153_1.time_ < var_156_4 + var_156_14 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_4) / var_156_14

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_4 + var_156_14 and arg_153_1.time_ < var_156_4 + var_156_14 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 1101906038
		arg_157_1.duration_ = 7.2

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play1101906039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = "A00"

			if arg_157_1.bgs_[var_160_0] == nil then
				local var_160_1 = Object.Instantiate(arg_157_1.paintGo_)

				var_160_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_160_0)
				var_160_1.name = var_160_0
				var_160_1.transform.parent = arg_157_1.stage_.transform
				var_160_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_157_1.bgs_[var_160_0] = var_160_1
			end

			local var_160_2 = 2

			if var_160_2 < arg_157_1.time_ and arg_157_1.time_ <= var_160_2 + arg_160_0 then
				local var_160_3 = manager.ui.mainCamera.transform.localPosition
				local var_160_4 = Vector3.New(0, 0, 10) + Vector3.New(var_160_3.x, var_160_3.y, 0)
				local var_160_5 = arg_157_1.bgs_.A00

				var_160_5.transform.localPosition = var_160_4
				var_160_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_160_6 = var_160_5:GetComponent("SpriteRenderer")

				if var_160_6 and var_160_6.sprite then
					local var_160_7 = (var_160_5.transform.localPosition - var_160_3).z
					local var_160_8 = manager.ui.mainCameraCom_
					local var_160_9 = 2 * var_160_7 * Mathf.Tan(var_160_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_160_10 = var_160_9 * var_160_8.aspect
					local var_160_11 = var_160_6.sprite.bounds.size.x
					local var_160_12 = var_160_6.sprite.bounds.size.y
					local var_160_13 = var_160_10 / var_160_11
					local var_160_14 = var_160_9 / var_160_12
					local var_160_15 = var_160_14 < var_160_13 and var_160_13 or var_160_14

					var_160_5.transform.localScale = Vector3.New(var_160_15, var_160_15, 0)
				end

				for iter_160_0, iter_160_1 in pairs(arg_157_1.bgs_) do
					if iter_160_0 ~= "A00" then
						iter_160_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_160_16 = 0

			if var_160_16 < arg_157_1.time_ and arg_157_1.time_ <= var_160_16 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = true

				arg_157_1:SetGaussion(false)
			end

			local var_160_17 = 2

			if var_160_16 <= arg_157_1.time_ and arg_157_1.time_ < var_160_16 + var_160_17 then
				local var_160_18 = (arg_157_1.time_ - var_160_16) / var_160_17
				local var_160_19 = Color.New(0, 0, 0)

				var_160_19.a = Mathf.Lerp(0, 1, var_160_18)
				arg_157_1.mask_.color = var_160_19
			end

			if arg_157_1.time_ >= var_160_16 + var_160_17 and arg_157_1.time_ < var_160_16 + var_160_17 + arg_160_0 then
				local var_160_20 = Color.New(0, 0, 0)

				var_160_20.a = 1
				arg_157_1.mask_.color = var_160_20
			end

			local var_160_21 = 2

			if var_160_21 < arg_157_1.time_ and arg_157_1.time_ <= var_160_21 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = true

				arg_157_1:SetGaussion(false)
			end

			local var_160_22 = 2

			if var_160_21 <= arg_157_1.time_ and arg_157_1.time_ < var_160_21 + var_160_22 then
				local var_160_23 = (arg_157_1.time_ - var_160_21) / var_160_22
				local var_160_24 = Color.New(0, 0, 0)

				var_160_24.a = Mathf.Lerp(1, 0, var_160_23)
				arg_157_1.mask_.color = var_160_24
			end

			if arg_157_1.time_ >= var_160_21 + var_160_22 and arg_157_1.time_ < var_160_21 + var_160_22 + arg_160_0 then
				local var_160_25 = Color.New(0, 0, 0)
				local var_160_26 = 0

				arg_157_1.mask_.enabled = false
				var_160_25.a = var_160_26
				arg_157_1.mask_.color = var_160_25
			end

			local var_160_27 = 0
			local var_160_28 = 0.166666666666667

			if var_160_27 < arg_157_1.time_ and arg_157_1.time_ <= var_160_27 + arg_160_0 then
				local var_160_29 = "play"
				local var_160_30 = "music"

				arg_157_1:AudioAction(var_160_29, var_160_30, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_160_31 = 0.3
			local var_160_32 = 1

			if var_160_31 < arg_157_1.time_ and arg_157_1.time_ <= var_160_31 + arg_160_0 then
				local var_160_33 = "play"
				local var_160_34 = "music"

				arg_157_1:AudioAction(var_160_33, var_160_34, "bgm_activity_3_0_story_daily_leisure", "bgm_activity_3_0_story_daily_leisure", "bgm_activity_3_0_story_daily_leisure.awb")
			end

			local var_160_35 = 2

			if var_160_35 < arg_157_1.time_ and arg_157_1.time_ <= var_160_35 + arg_160_0 then
				arg_157_1.screenFilterGo_:SetActive(true)

				arg_157_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_160_36 = 0.1

			if var_160_35 <= arg_157_1.time_ and arg_157_1.time_ < var_160_35 + var_160_36 then
				local var_160_37 = (arg_157_1.time_ - var_160_35) / var_160_36

				arg_157_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_160_37)
			end

			if arg_157_1.time_ >= var_160_35 + var_160_36 and arg_157_1.time_ < var_160_35 + var_160_36 + arg_160_0 then
				arg_157_1.screenFilterEffect_.weight = 1
			end

			if arg_157_1.frameCnt_ <= 1 then
				arg_157_1.dialog_:SetActive(false)
			end

			local var_160_38 = 4
			local var_160_39 = 0.575

			if var_160_38 < arg_157_1.time_ and arg_157_1.time_ <= var_160_38 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0

				arg_157_1.dialog_:SetActive(true)

				local var_160_40 = LeanTween.value(arg_157_1.dialog_, 0, 1, 0.3)

				var_160_40:setOnUpdate(LuaHelper.FloatAction(function(arg_161_0)
					arg_157_1.dialogCg_.alpha = arg_161_0
				end))
				var_160_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_157_1.dialog_)
					var_160_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_157_1.duration_ = arg_157_1.duration_ + 0.3

				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_41 = arg_157_1:FormatText(StoryNameCfg[13].name)

				arg_157_1.leftNameTxt_.text = var_160_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_42 = arg_157_1:GetWordFromCfg(1101906038)
				local var_160_43 = arg_157_1:FormatText(var_160_42.content)

				arg_157_1.text_.text = var_160_43

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_44 = 23
				local var_160_45 = utf8.len(var_160_43)
				local var_160_46 = var_160_44 <= 0 and var_160_39 or var_160_39 * (var_160_45 / var_160_44)

				if var_160_46 > 0 and var_160_39 < var_160_46 then
					arg_157_1.talkMaxDuration = var_160_46
					var_160_38 = var_160_38 + 0.3

					if var_160_46 + var_160_38 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_46 + var_160_38
					end
				end

				arg_157_1.text_.text = var_160_43
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906038", "story_v_side_new_1101906.awb") ~= 0 then
					local var_160_47 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906038", "story_v_side_new_1101906.awb") / 1000

					if var_160_47 + var_160_38 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_47 + var_160_38
					end

					if var_160_42.prefab_name ~= "" and arg_157_1.actors_[var_160_42.prefab_name] ~= nil then
						local var_160_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_42.prefab_name].transform, "story_v_side_new_1101906", "1101906038", "story_v_side_new_1101906.awb")

						arg_157_1:RecordAudio("1101906038", var_160_48)
						arg_157_1:RecordAudio("1101906038", var_160_48)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906038", "story_v_side_new_1101906.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906038", "story_v_side_new_1101906.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_49 = var_160_38 + 0.3
			local var_160_50 = math.max(var_160_39, arg_157_1.talkMaxDuration)

			if var_160_49 <= arg_157_1.time_ and arg_157_1.time_ < var_160_49 + var_160_50 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_49) / var_160_50

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_49 + var_160_50 and arg_157_1.time_ < var_160_49 + var_160_50 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 1101906039
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play1101906040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1019ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1019ui_story == nil then
				arg_163_1.var_.characterEffect1019ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.200000002980232

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1019ui_story then
					local var_166_4 = Mathf.Lerp(0, 0.5, var_166_3)

					arg_163_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1019ui_story.fillRatio = var_166_4
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1019ui_story then
				local var_166_5 = 0.5

				arg_163_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1019ui_story.fillRatio = var_166_5
			end

			local var_166_6 = 0
			local var_166_7 = 0.125

			if var_166_6 < arg_163_1.time_ and arg_163_1.time_ <= var_166_6 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_8 = arg_163_1:FormatText(StoryNameCfg[7].name)

				arg_163_1.leftNameTxt_.text = var_166_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_9 = arg_163_1:GetWordFromCfg(1101906039)
				local var_166_10 = arg_163_1:FormatText(var_166_9.content)

				arg_163_1.text_.text = var_166_10

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_11 = 5
				local var_166_12 = utf8.len(var_166_10)
				local var_166_13 = var_166_11 <= 0 and var_166_7 or var_166_7 * (var_166_12 / var_166_11)

				if var_166_13 > 0 and var_166_7 < var_166_13 then
					arg_163_1.talkMaxDuration = var_166_13

					if var_166_13 + var_166_6 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_13 + var_166_6
					end
				end

				arg_163_1.text_.text = var_166_10
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_14 = math.max(var_166_7, arg_163_1.talkMaxDuration)

			if var_166_6 <= arg_163_1.time_ and arg_163_1.time_ < var_166_6 + var_166_14 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_6) / var_166_14

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_6 + var_166_14 and arg_163_1.time_ < var_166_6 + var_166_14 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 1101906040
		arg_167_1.duration_ = 4.5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play1101906041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1019ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1019ui_story == nil then
				arg_167_1.var_.characterEffect1019ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1019ui_story then
					arg_167_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1019ui_story then
				arg_167_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_170_4 = 0
			local var_170_5 = 0.475

			if var_170_4 < arg_167_1.time_ and arg_167_1.time_ <= var_170_4 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_6 = arg_167_1:FormatText(StoryNameCfg[13].name)

				arg_167_1.leftNameTxt_.text = var_170_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_7 = arg_167_1:GetWordFromCfg(1101906040)
				local var_170_8 = arg_167_1:FormatText(var_170_7.content)

				arg_167_1.text_.text = var_170_8

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_9 = 19
				local var_170_10 = utf8.len(var_170_8)
				local var_170_11 = var_170_9 <= 0 and var_170_5 or var_170_5 * (var_170_10 / var_170_9)

				if var_170_11 > 0 and var_170_5 < var_170_11 then
					arg_167_1.talkMaxDuration = var_170_11

					if var_170_11 + var_170_4 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_11 + var_170_4
					end
				end

				arg_167_1.text_.text = var_170_8
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906040", "story_v_side_new_1101906.awb") ~= 0 then
					local var_170_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906040", "story_v_side_new_1101906.awb") / 1000

					if var_170_12 + var_170_4 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_12 + var_170_4
					end

					if var_170_7.prefab_name ~= "" and arg_167_1.actors_[var_170_7.prefab_name] ~= nil then
						local var_170_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_7.prefab_name].transform, "story_v_side_new_1101906", "1101906040", "story_v_side_new_1101906.awb")

						arg_167_1:RecordAudio("1101906040", var_170_13)
						arg_167_1:RecordAudio("1101906040", var_170_13)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906040", "story_v_side_new_1101906.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906040", "story_v_side_new_1101906.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_14 = math.max(var_170_5, arg_167_1.talkMaxDuration)

			if var_170_4 <= arg_167_1.time_ and arg_167_1.time_ < var_170_4 + var_170_14 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_4) / var_170_14

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_4 + var_170_14 and arg_167_1.time_ < var_170_4 + var_170_14 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 1101906041
		arg_171_1.duration_ = 3.166

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play1101906042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = "STblack"

			if arg_171_1.bgs_[var_174_0] == nil then
				local var_174_1 = Object.Instantiate(arg_171_1.paintGo_)

				var_174_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_174_0)
				var_174_1.name = var_174_0
				var_174_1.transform.parent = arg_171_1.stage_.transform
				var_174_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_171_1.bgs_[var_174_0] = var_174_1
			end

			local var_174_2 = 0

			if var_174_2 < arg_171_1.time_ and arg_171_1.time_ <= var_174_2 + arg_174_0 then
				local var_174_3 = manager.ui.mainCamera.transform.localPosition
				local var_174_4 = Vector3.New(0, 0, 10) + Vector3.New(var_174_3.x, var_174_3.y, 0)
				local var_174_5 = arg_171_1.bgs_.STblack

				var_174_5.transform.localPosition = var_174_4
				var_174_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_174_6 = var_174_5:GetComponent("SpriteRenderer")

				if var_174_6 and var_174_6.sprite then
					local var_174_7 = (var_174_5.transform.localPosition - var_174_3).z
					local var_174_8 = manager.ui.mainCameraCom_
					local var_174_9 = 2 * var_174_7 * Mathf.Tan(var_174_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_174_10 = var_174_9 * var_174_8.aspect
					local var_174_11 = var_174_6.sprite.bounds.size.x
					local var_174_12 = var_174_6.sprite.bounds.size.y
					local var_174_13 = var_174_10 / var_174_11
					local var_174_14 = var_174_9 / var_174_12
					local var_174_15 = var_174_14 < var_174_13 and var_174_13 or var_174_14

					var_174_5.transform.localScale = Vector3.New(var_174_15, var_174_15, 0)
				end

				for iter_174_0, iter_174_1 in pairs(arg_171_1.bgs_) do
					if iter_174_0 ~= "STblack" then
						iter_174_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_174_16 = 0

			if var_174_16 < arg_171_1.time_ and arg_171_1.time_ <= var_174_16 + arg_174_0 then
				arg_171_1.mask_.enabled = true
				arg_171_1.mask_.raycastTarget = true

				arg_171_1:SetGaussion(false)
			end

			local var_174_17 = 2

			if var_174_16 <= arg_171_1.time_ and arg_171_1.time_ < var_174_16 + var_174_17 then
				local var_174_18 = (arg_171_1.time_ - var_174_16) / var_174_17
				local var_174_19 = Color.New(1, 1, 1)

				var_174_19.a = Mathf.Lerp(1, 0, var_174_18)
				arg_171_1.mask_.color = var_174_19
			end

			if arg_171_1.time_ >= var_174_16 + var_174_17 and arg_171_1.time_ < var_174_16 + var_174_17 + arg_174_0 then
				local var_174_20 = Color.New(1, 1, 1)
				local var_174_21 = 0

				arg_171_1.mask_.enabled = false
				var_174_20.a = var_174_21
				arg_171_1.mask_.color = var_174_20
			end

			local var_174_22 = arg_171_1.actors_["1019ui_story"].transform
			local var_174_23 = 0

			if var_174_23 < arg_171_1.time_ and arg_171_1.time_ <= var_174_23 + arg_174_0 then
				arg_171_1.var_.moveOldPos1019ui_story = var_174_22.localPosition
			end

			local var_174_24 = 0.001

			if var_174_23 <= arg_171_1.time_ and arg_171_1.time_ < var_174_23 + var_174_24 then
				local var_174_25 = (arg_171_1.time_ - var_174_23) / var_174_24
				local var_174_26 = Vector3.New(0, 100, 0)

				var_174_22.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1019ui_story, var_174_26, var_174_25)

				local var_174_27 = manager.ui.mainCamera.transform.position - var_174_22.position

				var_174_22.forward = Vector3.New(var_174_27.x, var_174_27.y, var_174_27.z)

				local var_174_28 = var_174_22.localEulerAngles

				var_174_28.z = 0
				var_174_28.x = 0
				var_174_22.localEulerAngles = var_174_28
			end

			if arg_171_1.time_ >= var_174_23 + var_174_24 and arg_171_1.time_ < var_174_23 + var_174_24 + arg_174_0 then
				var_174_22.localPosition = Vector3.New(0, 100, 0)

				local var_174_29 = manager.ui.mainCamera.transform.position - var_174_22.position

				var_174_22.forward = Vector3.New(var_174_29.x, var_174_29.y, var_174_29.z)

				local var_174_30 = var_174_22.localEulerAngles

				var_174_30.z = 0
				var_174_30.x = 0
				var_174_22.localEulerAngles = var_174_30
			end

			local var_174_31 = arg_171_1.actors_["1019ui_story"]
			local var_174_32 = 0

			if var_174_32 < arg_171_1.time_ and arg_171_1.time_ <= var_174_32 + arg_174_0 and arg_171_1.var_.characterEffect1019ui_story == nil then
				arg_171_1.var_.characterEffect1019ui_story = var_174_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_33 = 0.0166666666666667

			if var_174_32 <= arg_171_1.time_ and arg_171_1.time_ < var_174_32 + var_174_33 then
				local var_174_34 = (arg_171_1.time_ - var_174_32) / var_174_33

				if arg_171_1.var_.characterEffect1019ui_story then
					local var_174_35 = Mathf.Lerp(0, 0.5, var_174_34)

					arg_171_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1019ui_story.fillRatio = var_174_35
				end
			end

			if arg_171_1.time_ >= var_174_32 + var_174_33 and arg_171_1.time_ < var_174_32 + var_174_33 + arg_174_0 and arg_171_1.var_.characterEffect1019ui_story then
				local var_174_36 = 0.5

				arg_171_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1019ui_story.fillRatio = var_174_36
			end

			local var_174_37 = 0

			if var_174_37 < arg_171_1.time_ and arg_171_1.time_ <= var_174_37 + arg_174_0 then
				arg_171_1.screenFilterGo_:SetActive(false)
			end

			local var_174_38 = 0.0166666666666667

			if var_174_37 <= arg_171_1.time_ and arg_171_1.time_ < var_174_37 + var_174_38 then
				local var_174_39 = (arg_171_1.time_ - var_174_37) / var_174_38

				arg_171_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_174_39)
			end

			if arg_171_1.time_ >= var_174_37 + var_174_38 and arg_171_1.time_ < var_174_37 + var_174_38 + arg_174_0 then
				arg_171_1.screenFilterEffect_.weight = 0
			end

			if arg_171_1.frameCnt_ <= 1 then
				arg_171_1.dialog_:SetActive(false)
			end

			local var_174_40 = 2
			local var_174_41 = 0.1

			if var_174_40 < arg_171_1.time_ and arg_171_1.time_ <= var_174_40 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0

				arg_171_1.dialog_:SetActive(true)

				local var_174_42 = LeanTween.value(arg_171_1.dialog_, 0, 1, 0.3)

				var_174_42:setOnUpdate(LuaHelper.FloatAction(function(arg_175_0)
					arg_171_1.dialogCg_.alpha = arg_175_0
				end))
				var_174_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_171_1.dialog_)
					var_174_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_171_1.duration_ = arg_171_1.duration_ + 0.3

				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_43 = arg_171_1:FormatText(StoryNameCfg[36].name)

				arg_171_1.leftNameTxt_.text = var_174_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, true)
				arg_171_1.iconController_:SetSelectedState("hero")

				arg_171_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_44 = arg_171_1:GetWordFromCfg(1101906041)
				local var_174_45 = arg_171_1:FormatText(var_174_44.content)

				arg_171_1.text_.text = var_174_45

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_46 = 4
				local var_174_47 = utf8.len(var_174_45)
				local var_174_48 = var_174_46 <= 0 and var_174_41 or var_174_41 * (var_174_47 / var_174_46)

				if var_174_48 > 0 and var_174_41 < var_174_48 then
					arg_171_1.talkMaxDuration = var_174_48
					var_174_40 = var_174_40 + 0.3

					if var_174_48 + var_174_40 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_48 + var_174_40
					end
				end

				arg_171_1.text_.text = var_174_45
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906041", "story_v_side_new_1101906.awb") ~= 0 then
					local var_174_49 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906041", "story_v_side_new_1101906.awb") / 1000

					if var_174_49 + var_174_40 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_49 + var_174_40
					end

					if var_174_44.prefab_name ~= "" and arg_171_1.actors_[var_174_44.prefab_name] ~= nil then
						local var_174_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_44.prefab_name].transform, "story_v_side_new_1101906", "1101906041", "story_v_side_new_1101906.awb")

						arg_171_1:RecordAudio("1101906041", var_174_50)
						arg_171_1:RecordAudio("1101906041", var_174_50)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906041", "story_v_side_new_1101906.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906041", "story_v_side_new_1101906.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_51 = var_174_40 + 0.3
			local var_174_52 = math.max(var_174_41, arg_171_1.talkMaxDuration)

			if var_174_51 <= arg_171_1.time_ and arg_171_1.time_ < var_174_51 + var_174_52 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_51) / var_174_52

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_51 + var_174_52 and arg_171_1.time_ < var_174_51 + var_174_52 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906042 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 1101906042
		arg_177_1.duration_ = 5.266

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play1101906043(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 2

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				local var_180_1 = manager.ui.mainCamera.transform.localPosition
				local var_180_2 = Vector3.New(0, 0, 10) + Vector3.New(var_180_1.x, var_180_1.y, 0)
				local var_180_3 = arg_177_1.bgs_.B02f

				var_180_3.transform.localPosition = var_180_2
				var_180_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_180_4 = var_180_3:GetComponent("SpriteRenderer")

				if var_180_4 and var_180_4.sprite then
					local var_180_5 = (var_180_3.transform.localPosition - var_180_1).z
					local var_180_6 = manager.ui.mainCameraCom_
					local var_180_7 = 2 * var_180_5 * Mathf.Tan(var_180_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_180_8 = var_180_7 * var_180_6.aspect
					local var_180_9 = var_180_4.sprite.bounds.size.x
					local var_180_10 = var_180_4.sprite.bounds.size.y
					local var_180_11 = var_180_8 / var_180_9
					local var_180_12 = var_180_7 / var_180_10
					local var_180_13 = var_180_12 < var_180_11 and var_180_11 or var_180_12

					var_180_3.transform.localScale = Vector3.New(var_180_13, var_180_13, 0)
				end

				for iter_180_0, iter_180_1 in pairs(arg_177_1.bgs_) do
					if iter_180_0 ~= "B02f" then
						iter_180_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_180_14 = 0

			if var_180_14 < arg_177_1.time_ and arg_177_1.time_ <= var_180_14 + arg_180_0 then
				arg_177_1.mask_.enabled = true
				arg_177_1.mask_.raycastTarget = true

				arg_177_1:SetGaussion(false)
			end

			local var_180_15 = 2

			if var_180_14 <= arg_177_1.time_ and arg_177_1.time_ < var_180_14 + var_180_15 then
				local var_180_16 = (arg_177_1.time_ - var_180_14) / var_180_15
				local var_180_17 = Color.New(0, 0, 0)

				var_180_17.a = Mathf.Lerp(0, 1, var_180_16)
				arg_177_1.mask_.color = var_180_17
			end

			if arg_177_1.time_ >= var_180_14 + var_180_15 and arg_177_1.time_ < var_180_14 + var_180_15 + arg_180_0 then
				local var_180_18 = Color.New(0, 0, 0)

				var_180_18.a = 1
				arg_177_1.mask_.color = var_180_18
			end

			local var_180_19 = 2

			if var_180_19 < arg_177_1.time_ and arg_177_1.time_ <= var_180_19 + arg_180_0 then
				arg_177_1.mask_.enabled = true
				arg_177_1.mask_.raycastTarget = true

				arg_177_1:SetGaussion(false)
			end

			local var_180_20 = 2

			if var_180_19 <= arg_177_1.time_ and arg_177_1.time_ < var_180_19 + var_180_20 then
				local var_180_21 = (arg_177_1.time_ - var_180_19) / var_180_20
				local var_180_22 = Color.New(0, 0, 0)

				var_180_22.a = Mathf.Lerp(1, 0, var_180_21)
				arg_177_1.mask_.color = var_180_22
			end

			if arg_177_1.time_ >= var_180_19 + var_180_20 and arg_177_1.time_ < var_180_19 + var_180_20 + arg_180_0 then
				local var_180_23 = Color.New(0, 0, 0)
				local var_180_24 = 0

				arg_177_1.mask_.enabled = false
				var_180_23.a = var_180_24
				arg_177_1.mask_.color = var_180_23
			end

			local var_180_25 = arg_177_1.actors_["1019ui_story"].transform
			local var_180_26 = 2

			if var_180_26 < arg_177_1.time_ and arg_177_1.time_ <= var_180_26 + arg_180_0 then
				arg_177_1.var_.moveOldPos1019ui_story = var_180_25.localPosition
			end

			local var_180_27 = 0.001

			if var_180_26 <= arg_177_1.time_ and arg_177_1.time_ < var_180_26 + var_180_27 then
				local var_180_28 = (arg_177_1.time_ - var_180_26) / var_180_27
				local var_180_29 = Vector3.New(0, -1.08, -5.9)

				var_180_25.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1019ui_story, var_180_29, var_180_28)

				local var_180_30 = manager.ui.mainCamera.transform.position - var_180_25.position

				var_180_25.forward = Vector3.New(var_180_30.x, var_180_30.y, var_180_30.z)

				local var_180_31 = var_180_25.localEulerAngles

				var_180_31.z = 0
				var_180_31.x = 0
				var_180_25.localEulerAngles = var_180_31
			end

			if arg_177_1.time_ >= var_180_26 + var_180_27 and arg_177_1.time_ < var_180_26 + var_180_27 + arg_180_0 then
				var_180_25.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_180_32 = manager.ui.mainCamera.transform.position - var_180_25.position

				var_180_25.forward = Vector3.New(var_180_32.x, var_180_32.y, var_180_32.z)

				local var_180_33 = var_180_25.localEulerAngles

				var_180_33.z = 0
				var_180_33.x = 0
				var_180_25.localEulerAngles = var_180_33
			end

			local var_180_34 = arg_177_1.actors_["1019ui_story"]
			local var_180_35 = 2

			if var_180_35 < arg_177_1.time_ and arg_177_1.time_ <= var_180_35 + arg_180_0 and arg_177_1.var_.characterEffect1019ui_story == nil then
				arg_177_1.var_.characterEffect1019ui_story = var_180_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_36 = 0.200000002980232

			if var_180_35 <= arg_177_1.time_ and arg_177_1.time_ < var_180_35 + var_180_36 then
				local var_180_37 = (arg_177_1.time_ - var_180_35) / var_180_36

				if arg_177_1.var_.characterEffect1019ui_story then
					arg_177_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_35 + var_180_36 and arg_177_1.time_ < var_180_35 + var_180_36 + arg_180_0 and arg_177_1.var_.characterEffect1019ui_story then
				arg_177_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_180_38 = 2

			if var_180_38 < arg_177_1.time_ and arg_177_1.time_ <= var_180_38 + arg_180_0 then
				arg_177_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_180_39 = 2

			if var_180_39 < arg_177_1.time_ and arg_177_1.time_ <= var_180_39 + arg_180_0 then
				arg_177_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			if arg_177_1.frameCnt_ <= 1 then
				arg_177_1.dialog_:SetActive(false)
			end

			local var_180_40 = 4
			local var_180_41 = 0.1

			if var_180_40 < arg_177_1.time_ and arg_177_1.time_ <= var_180_40 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0

				arg_177_1.dialog_:SetActive(true)

				local var_180_42 = LeanTween.value(arg_177_1.dialog_, 0, 1, 0.3)

				var_180_42:setOnUpdate(LuaHelper.FloatAction(function(arg_181_0)
					arg_177_1.dialogCg_.alpha = arg_181_0
				end))
				var_180_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_177_1.dialog_)
					var_180_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_177_1.duration_ = arg_177_1.duration_ + 0.3

				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_43 = arg_177_1:FormatText(StoryNameCfg[13].name)

				arg_177_1.leftNameTxt_.text = var_180_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_44 = arg_177_1:GetWordFromCfg(1101906042)
				local var_180_45 = arg_177_1:FormatText(var_180_44.content)

				arg_177_1.text_.text = var_180_45

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_46 = 4
				local var_180_47 = utf8.len(var_180_45)
				local var_180_48 = var_180_46 <= 0 and var_180_41 or var_180_41 * (var_180_47 / var_180_46)

				if var_180_48 > 0 and var_180_41 < var_180_48 then
					arg_177_1.talkMaxDuration = var_180_48
					var_180_40 = var_180_40 + 0.3

					if var_180_48 + var_180_40 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_48 + var_180_40
					end
				end

				arg_177_1.text_.text = var_180_45
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906042", "story_v_side_new_1101906.awb") ~= 0 then
					local var_180_49 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906042", "story_v_side_new_1101906.awb") / 1000

					if var_180_49 + var_180_40 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_49 + var_180_40
					end

					if var_180_44.prefab_name ~= "" and arg_177_1.actors_[var_180_44.prefab_name] ~= nil then
						local var_180_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_44.prefab_name].transform, "story_v_side_new_1101906", "1101906042", "story_v_side_new_1101906.awb")

						arg_177_1:RecordAudio("1101906042", var_180_50)
						arg_177_1:RecordAudio("1101906042", var_180_50)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906042", "story_v_side_new_1101906.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906042", "story_v_side_new_1101906.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_51 = var_180_40 + 0.3
			local var_180_52 = math.max(var_180_41, arg_177_1.talkMaxDuration)

			if var_180_51 <= arg_177_1.time_ and arg_177_1.time_ < var_180_51 + var_180_52 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_51) / var_180_52

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_51 + var_180_52 and arg_177_1.time_ < var_180_51 + var_180_52 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906043 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 1101906043
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play1101906044(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1019ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1019ui_story == nil then
				arg_183_1.var_.characterEffect1019ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1019ui_story then
					local var_186_4 = Mathf.Lerp(0, 0.5, var_186_3)

					arg_183_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1019ui_story.fillRatio = var_186_4
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1019ui_story then
				local var_186_5 = 0.5

				arg_183_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1019ui_story.fillRatio = var_186_5
			end

			local var_186_6 = 0

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_186_7 = 0
			local var_186_8 = 0.15

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_9 = arg_183_1:FormatText(StoryNameCfg[7].name)

				arg_183_1.leftNameTxt_.text = var_186_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_10 = arg_183_1:GetWordFromCfg(1101906043)
				local var_186_11 = arg_183_1:FormatText(var_186_10.content)

				arg_183_1.text_.text = var_186_11

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_12 = 6
				local var_186_13 = utf8.len(var_186_11)
				local var_186_14 = var_186_12 <= 0 and var_186_8 or var_186_8 * (var_186_13 / var_186_12)

				if var_186_14 > 0 and var_186_8 < var_186_14 then
					arg_183_1.talkMaxDuration = var_186_14

					if var_186_14 + var_186_7 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_14 + var_186_7
					end
				end

				arg_183_1.text_.text = var_186_11
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_15 = math.max(var_186_8, arg_183_1.talkMaxDuration)

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_15 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_7) / var_186_15

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_7 + var_186_15 and arg_183_1.time_ < var_186_7 + var_186_15 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906044 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 1101906044
		arg_187_1.duration_ = 1.3

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play1101906045(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1019ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1019ui_story == nil then
				arg_187_1.var_.characterEffect1019ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.200000002980232

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1019ui_story then
					arg_187_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1019ui_story then
				arg_187_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_190_4 = 0
			local var_190_5 = 0.125

			if var_190_4 < arg_187_1.time_ and arg_187_1.time_ <= var_190_4 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_6 = arg_187_1:FormatText(StoryNameCfg[13].name)

				arg_187_1.leftNameTxt_.text = var_190_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_7 = arg_187_1:GetWordFromCfg(1101906044)
				local var_190_8 = arg_187_1:FormatText(var_190_7.content)

				arg_187_1.text_.text = var_190_8

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_9 = 5
				local var_190_10 = utf8.len(var_190_8)
				local var_190_11 = var_190_9 <= 0 and var_190_5 or var_190_5 * (var_190_10 / var_190_9)

				if var_190_11 > 0 and var_190_5 < var_190_11 then
					arg_187_1.talkMaxDuration = var_190_11

					if var_190_11 + var_190_4 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_11 + var_190_4
					end
				end

				arg_187_1.text_.text = var_190_8
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906044", "story_v_side_new_1101906.awb") ~= 0 then
					local var_190_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906044", "story_v_side_new_1101906.awb") / 1000

					if var_190_12 + var_190_4 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_12 + var_190_4
					end

					if var_190_7.prefab_name ~= "" and arg_187_1.actors_[var_190_7.prefab_name] ~= nil then
						local var_190_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_7.prefab_name].transform, "story_v_side_new_1101906", "1101906044", "story_v_side_new_1101906.awb")

						arg_187_1:RecordAudio("1101906044", var_190_13)
						arg_187_1:RecordAudio("1101906044", var_190_13)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906044", "story_v_side_new_1101906.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906044", "story_v_side_new_1101906.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_14 = math.max(var_190_5, arg_187_1.talkMaxDuration)

			if var_190_4 <= arg_187_1.time_ and arg_187_1.time_ < var_190_4 + var_190_14 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_4) / var_190_14

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_4 + var_190_14 and arg_187_1.time_ < var_190_4 + var_190_14 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906045 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 1101906045
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play1101906046(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1019ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1019ui_story == nil then
				arg_191_1.var_.characterEffect1019ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1019ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1019ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1019ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1019ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.3

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_8 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_9 = arg_191_1:GetWordFromCfg(1101906045)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 12
				local var_194_12 = utf8.len(var_194_10)
				local var_194_13 = var_194_11 <= 0 and var_194_7 or var_194_7 * (var_194_12 / var_194_11)

				if var_194_13 > 0 and var_194_7 < var_194_13 then
					arg_191_1.talkMaxDuration = var_194_13

					if var_194_13 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_13 + var_194_6
					end
				end

				arg_191_1.text_.text = var_194_10
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_14 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_14 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_14

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_14 and arg_191_1.time_ < var_194_6 + var_194_14 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906046 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 1101906046
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play1101906047(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.425

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[7].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(1101906046)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 17
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
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_8 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_8 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_8

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_8 and arg_195_1.time_ < var_198_0 + var_198_8 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906047 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 1101906047
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play1101906048(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.675

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_2 = arg_199_1:GetWordFromCfg(1101906047)
				local var_202_3 = arg_199_1:FormatText(var_202_2.content)

				arg_199_1.text_.text = var_202_3

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_4 = 27
				local var_202_5 = utf8.len(var_202_3)
				local var_202_6 = var_202_4 <= 0 and var_202_1 or var_202_1 * (var_202_5 / var_202_4)

				if var_202_6 > 0 and var_202_1 < var_202_6 then
					arg_199_1.talkMaxDuration = var_202_6

					if var_202_6 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_6 + var_202_0
					end
				end

				arg_199_1.text_.text = var_202_3
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_7 = math.max(var_202_1, arg_199_1.talkMaxDuration)

			if var_202_0 <= arg_199_1.time_ and arg_199_1.time_ < var_202_0 + var_202_7 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_0) / var_202_7

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_0 + var_202_7 and arg_199_1.time_ < var_202_0 + var_202_7 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906048 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 1101906048
		arg_203_1.duration_ = 9

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play1101906049(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 2

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				local var_206_1 = manager.ui.mainCamera.transform.localPosition
				local var_206_2 = Vector3.New(0, 0, 10) + Vector3.New(var_206_1.x, var_206_1.y, 0)
				local var_206_3 = arg_203_1.bgs_.B02f

				var_206_3.transform.localPosition = var_206_2
				var_206_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_206_4 = var_206_3:GetComponent("SpriteRenderer")

				if var_206_4 and var_206_4.sprite then
					local var_206_5 = (var_206_3.transform.localPosition - var_206_1).z
					local var_206_6 = manager.ui.mainCameraCom_
					local var_206_7 = 2 * var_206_5 * Mathf.Tan(var_206_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_206_8 = var_206_7 * var_206_6.aspect
					local var_206_9 = var_206_4.sprite.bounds.size.x
					local var_206_10 = var_206_4.sprite.bounds.size.y
					local var_206_11 = var_206_8 / var_206_9
					local var_206_12 = var_206_7 / var_206_10
					local var_206_13 = var_206_12 < var_206_11 and var_206_11 or var_206_12

					var_206_3.transform.localScale = Vector3.New(var_206_13, var_206_13, 0)
				end

				for iter_206_0, iter_206_1 in pairs(arg_203_1.bgs_) do
					if iter_206_0 ~= "B02f" then
						iter_206_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				arg_203_1.mask_.enabled = true
				arg_203_1.mask_.raycastTarget = true

				arg_203_1:SetGaussion(false)
			end

			local var_206_15 = 2

			if var_206_14 <= arg_203_1.time_ and arg_203_1.time_ < var_206_14 + var_206_15 then
				local var_206_16 = (arg_203_1.time_ - var_206_14) / var_206_15
				local var_206_17 = Color.New(0, 0, 0)

				var_206_17.a = Mathf.Lerp(0, 1, var_206_16)
				arg_203_1.mask_.color = var_206_17
			end

			if arg_203_1.time_ >= var_206_14 + var_206_15 and arg_203_1.time_ < var_206_14 + var_206_15 + arg_206_0 then
				local var_206_18 = Color.New(0, 0, 0)

				var_206_18.a = 1
				arg_203_1.mask_.color = var_206_18
			end

			local var_206_19 = 2

			if var_206_19 < arg_203_1.time_ and arg_203_1.time_ <= var_206_19 + arg_206_0 then
				arg_203_1.mask_.enabled = true
				arg_203_1.mask_.raycastTarget = true

				arg_203_1:SetGaussion(false)
			end

			local var_206_20 = 2

			if var_206_19 <= arg_203_1.time_ and arg_203_1.time_ < var_206_19 + var_206_20 then
				local var_206_21 = (arg_203_1.time_ - var_206_19) / var_206_20
				local var_206_22 = Color.New(0, 0, 0)

				var_206_22.a = Mathf.Lerp(1, 0, var_206_21)
				arg_203_1.mask_.color = var_206_22
			end

			if arg_203_1.time_ >= var_206_19 + var_206_20 and arg_203_1.time_ < var_206_19 + var_206_20 + arg_206_0 then
				local var_206_23 = Color.New(0, 0, 0)
				local var_206_24 = 0

				arg_203_1.mask_.enabled = false
				var_206_23.a = var_206_24
				arg_203_1.mask_.color = var_206_23
			end

			local var_206_25 = arg_203_1.actors_["1019ui_story"].transform
			local var_206_26 = 1.966

			if var_206_26 < arg_203_1.time_ and arg_203_1.time_ <= var_206_26 + arg_206_0 then
				arg_203_1.var_.moveOldPos1019ui_story = var_206_25.localPosition
			end

			local var_206_27 = 0.001

			if var_206_26 <= arg_203_1.time_ and arg_203_1.time_ < var_206_26 + var_206_27 then
				local var_206_28 = (arg_203_1.time_ - var_206_26) / var_206_27
				local var_206_29 = Vector3.New(0, 100, 0)

				var_206_25.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1019ui_story, var_206_29, var_206_28)

				local var_206_30 = manager.ui.mainCamera.transform.position - var_206_25.position

				var_206_25.forward = Vector3.New(var_206_30.x, var_206_30.y, var_206_30.z)

				local var_206_31 = var_206_25.localEulerAngles

				var_206_31.z = 0
				var_206_31.x = 0
				var_206_25.localEulerAngles = var_206_31
			end

			if arg_203_1.time_ >= var_206_26 + var_206_27 and arg_203_1.time_ < var_206_26 + var_206_27 + arg_206_0 then
				var_206_25.localPosition = Vector3.New(0, 100, 0)

				local var_206_32 = manager.ui.mainCamera.transform.position - var_206_25.position

				var_206_25.forward = Vector3.New(var_206_32.x, var_206_32.y, var_206_32.z)

				local var_206_33 = var_206_25.localEulerAngles

				var_206_33.z = 0
				var_206_33.x = 0
				var_206_25.localEulerAngles = var_206_33
			end

			if arg_203_1.frameCnt_ <= 1 then
				arg_203_1.dialog_:SetActive(false)
			end

			local var_206_34 = 4
			local var_206_35 = 0.825

			if var_206_34 < arg_203_1.time_ and arg_203_1.time_ <= var_206_34 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0

				arg_203_1.dialog_:SetActive(true)

				local var_206_36 = LeanTween.value(arg_203_1.dialog_, 0, 1, 0.3)

				var_206_36:setOnUpdate(LuaHelper.FloatAction(function(arg_207_0)
					arg_203_1.dialogCg_.alpha = arg_207_0
				end))
				var_206_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_203_1.dialog_)
					var_206_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_203_1.duration_ = arg_203_1.duration_ + 0.3

				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_37 = arg_203_1:GetWordFromCfg(1101906048)
				local var_206_38 = arg_203_1:FormatText(var_206_37.content)

				arg_203_1.text_.text = var_206_38

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_39 = 33
				local var_206_40 = utf8.len(var_206_38)
				local var_206_41 = var_206_39 <= 0 and var_206_35 or var_206_35 * (var_206_40 / var_206_39)

				if var_206_41 > 0 and var_206_35 < var_206_41 then
					arg_203_1.talkMaxDuration = var_206_41
					var_206_34 = var_206_34 + 0.3

					if var_206_41 + var_206_34 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_41 + var_206_34
					end
				end

				arg_203_1.text_.text = var_206_38
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_42 = var_206_34 + 0.3
			local var_206_43 = math.max(var_206_35, arg_203_1.talkMaxDuration)

			if var_206_42 <= arg_203_1.time_ and arg_203_1.time_ < var_206_42 + var_206_43 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_42) / var_206_43

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_42 + var_206_43 and arg_203_1.time_ < var_206_42 + var_206_43 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906049 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 1101906049
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play1101906050(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 1.025

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_2 = arg_209_1:GetWordFromCfg(1101906049)
				local var_212_3 = arg_209_1:FormatText(var_212_2.content)

				arg_209_1.text_.text = var_212_3

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_4 = 41
				local var_212_5 = utf8.len(var_212_3)
				local var_212_6 = var_212_4 <= 0 and var_212_1 or var_212_1 * (var_212_5 / var_212_4)

				if var_212_6 > 0 and var_212_1 < var_212_6 then
					arg_209_1.talkMaxDuration = var_212_6

					if var_212_6 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_6 + var_212_0
					end
				end

				arg_209_1.text_.text = var_212_3
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_7 = math.max(var_212_1, arg_209_1.talkMaxDuration)

			if var_212_0 <= arg_209_1.time_ and arg_209_1.time_ < var_212_0 + var_212_7 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_0) / var_212_7

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_0 + var_212_7 and arg_209_1.time_ < var_212_0 + var_212_7 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906050 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 1101906050
		arg_213_1.duration_ = 4.6

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play1101906051(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1019ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1019ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, -1.08, -5.9)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1019ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["1019ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect1019ui_story == nil then
				arg_213_1.var_.characterEffect1019ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect1019ui_story then
					arg_213_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect1019ui_story then
				arg_213_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_216_13 = 0

			if var_216_13 < arg_213_1.time_ and arg_213_1.time_ <= var_216_13 + arg_216_0 then
				arg_213_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_216_14 = 0

			if var_216_14 < arg_213_1.time_ and arg_213_1.time_ <= var_216_14 + arg_216_0 then
				arg_213_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_216_15 = 0
			local var_216_16 = 0.625

			if var_216_15 < arg_213_1.time_ and arg_213_1.time_ <= var_216_15 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_17 = arg_213_1:FormatText(StoryNameCfg[13].name)

				arg_213_1.leftNameTxt_.text = var_216_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_18 = arg_213_1:GetWordFromCfg(1101906050)
				local var_216_19 = arg_213_1:FormatText(var_216_18.content)

				arg_213_1.text_.text = var_216_19

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_20 = 25
				local var_216_21 = utf8.len(var_216_19)
				local var_216_22 = var_216_20 <= 0 and var_216_16 or var_216_16 * (var_216_21 / var_216_20)

				if var_216_22 > 0 and var_216_16 < var_216_22 then
					arg_213_1.talkMaxDuration = var_216_22

					if var_216_22 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_22 + var_216_15
					end
				end

				arg_213_1.text_.text = var_216_19
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906050", "story_v_side_new_1101906.awb") ~= 0 then
					local var_216_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906050", "story_v_side_new_1101906.awb") / 1000

					if var_216_23 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_23 + var_216_15
					end

					if var_216_18.prefab_name ~= "" and arg_213_1.actors_[var_216_18.prefab_name] ~= nil then
						local var_216_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_18.prefab_name].transform, "story_v_side_new_1101906", "1101906050", "story_v_side_new_1101906.awb")

						arg_213_1:RecordAudio("1101906050", var_216_24)
						arg_213_1:RecordAudio("1101906050", var_216_24)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906050", "story_v_side_new_1101906.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906050", "story_v_side_new_1101906.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_25 = math.max(var_216_16, arg_213_1.talkMaxDuration)

			if var_216_15 <= arg_213_1.time_ and arg_213_1.time_ < var_216_15 + var_216_25 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_15) / var_216_25

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_15 + var_216_25 and arg_213_1.time_ < var_216_15 + var_216_25 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906051 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 1101906051
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play1101906052(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1019ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and arg_217_1.var_.characterEffect1019ui_story == nil then
				arg_217_1.var_.characterEffect1019ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.200000002980232

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect1019ui_story then
					local var_220_4 = Mathf.Lerp(0, 0.5, var_220_3)

					arg_217_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1019ui_story.fillRatio = var_220_4
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect1019ui_story then
				local var_220_5 = 0.5

				arg_217_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1019ui_story.fillRatio = var_220_5
			end

			local var_220_6 = 0
			local var_220_7 = 0.675

			if var_220_6 < arg_217_1.time_ and arg_217_1.time_ <= var_220_6 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_8 = arg_217_1:FormatText(StoryNameCfg[7].name)

				arg_217_1.leftNameTxt_.text = var_220_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_9 = arg_217_1:GetWordFromCfg(1101906051)
				local var_220_10 = arg_217_1:FormatText(var_220_9.content)

				arg_217_1.text_.text = var_220_10

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_11 = 27
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
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_14 = math.max(var_220_7, arg_217_1.talkMaxDuration)

			if var_220_6 <= arg_217_1.time_ and arg_217_1.time_ < var_220_6 + var_220_14 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_6) / var_220_14

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_6 + var_220_14 and arg_217_1.time_ < var_220_6 + var_220_14 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906052 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 1101906052
		arg_221_1.duration_ = 9.766

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play1101906053(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1019ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1019ui_story == nil then
				arg_221_1.var_.characterEffect1019ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.200000002980232

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1019ui_story then
					arg_221_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1019ui_story then
				arg_221_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_224_4 = 0
			local var_224_5 = 1.125

			if var_224_4 < arg_221_1.time_ and arg_221_1.time_ <= var_224_4 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_6 = arg_221_1:FormatText(StoryNameCfg[13].name)

				arg_221_1.leftNameTxt_.text = var_224_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_7 = arg_221_1:GetWordFromCfg(1101906052)
				local var_224_8 = arg_221_1:FormatText(var_224_7.content)

				arg_221_1.text_.text = var_224_8

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_9 = 45
				local var_224_10 = utf8.len(var_224_8)
				local var_224_11 = var_224_9 <= 0 and var_224_5 or var_224_5 * (var_224_10 / var_224_9)

				if var_224_11 > 0 and var_224_5 < var_224_11 then
					arg_221_1.talkMaxDuration = var_224_11

					if var_224_11 + var_224_4 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_11 + var_224_4
					end
				end

				arg_221_1.text_.text = var_224_8
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906052", "story_v_side_new_1101906.awb") ~= 0 then
					local var_224_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906052", "story_v_side_new_1101906.awb") / 1000

					if var_224_12 + var_224_4 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_12 + var_224_4
					end

					if var_224_7.prefab_name ~= "" and arg_221_1.actors_[var_224_7.prefab_name] ~= nil then
						local var_224_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_7.prefab_name].transform, "story_v_side_new_1101906", "1101906052", "story_v_side_new_1101906.awb")

						arg_221_1:RecordAudio("1101906052", var_224_13)
						arg_221_1:RecordAudio("1101906052", var_224_13)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906052", "story_v_side_new_1101906.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906052", "story_v_side_new_1101906.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_14 = math.max(var_224_5, arg_221_1.talkMaxDuration)

			if var_224_4 <= arg_221_1.time_ and arg_221_1.time_ < var_224_4 + var_224_14 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_4) / var_224_14

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_4 + var_224_14 and arg_221_1.time_ < var_224_4 + var_224_14 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906053 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 1101906053
		arg_225_1.duration_ = 7.066

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play1101906054(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.9

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[13].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(1101906053)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906053", "story_v_side_new_1101906.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906053", "story_v_side_new_1101906.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_side_new_1101906", "1101906053", "story_v_side_new_1101906.awb")

						arg_225_1:RecordAudio("1101906053", var_228_9)
						arg_225_1:RecordAudio("1101906053", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906053", "story_v_side_new_1101906.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906053", "story_v_side_new_1101906.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_10 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_10 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_10

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_10 and arg_225_1.time_ < var_228_0 + var_228_10 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906054 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 1101906054
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play1101906055(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1019ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.characterEffect1019ui_story == nil then
				arg_229_1.var_.characterEffect1019ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.200000002980232

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1019ui_story then
					local var_232_4 = Mathf.Lerp(0, 0.5, var_232_3)

					arg_229_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1019ui_story.fillRatio = var_232_4
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1019ui_story then
				local var_232_5 = 0.5

				arg_229_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1019ui_story.fillRatio = var_232_5
			end

			local var_232_6 = 0
			local var_232_7 = 0.175

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_8 = arg_229_1:FormatText(StoryNameCfg[7].name)

				arg_229_1.leftNameTxt_.text = var_232_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_9 = arg_229_1:GetWordFromCfg(1101906054)
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
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_14 = math.max(var_232_7, arg_229_1.talkMaxDuration)

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_14 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_6) / var_232_14

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_6 + var_232_14 and arg_229_1.time_ < var_232_6 + var_232_14 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906055 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 1101906055
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play1101906056(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 0.8

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_2 = arg_233_1:FormatText(StoryNameCfg[7].name)

				arg_233_1.leftNameTxt_.text = var_236_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_3 = arg_233_1:GetWordFromCfg(1101906055)
				local var_236_4 = arg_233_1:FormatText(var_236_3.content)

				arg_233_1.text_.text = var_236_4

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_5 = 32
				local var_236_6 = utf8.len(var_236_4)
				local var_236_7 = var_236_5 <= 0 and var_236_1 or var_236_1 * (var_236_6 / var_236_5)

				if var_236_7 > 0 and var_236_1 < var_236_7 then
					arg_233_1.talkMaxDuration = var_236_7

					if var_236_7 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_7 + var_236_0
					end
				end

				arg_233_1.text_.text = var_236_4
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_8 = math.max(var_236_1, arg_233_1.talkMaxDuration)

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_8 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_0) / var_236_8

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_0 + var_236_8 and arg_233_1.time_ < var_236_0 + var_236_8 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906056 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 1101906056
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play1101906057(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.8

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[7].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(1101906056)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 32
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
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_8 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_8 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_8

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_8 and arg_237_1.time_ < var_240_0 + var_240_8 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906057 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 1101906057
		arg_241_1.duration_ = 4.066

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play1101906058(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1019ui_story"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1019ui_story = var_244_0.localPosition
			end

			local var_244_2 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2
				local var_244_4 = Vector3.New(0, -1.08, -5.9)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1019ui_story, var_244_4, var_244_3)

				local var_244_5 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_5.x, var_244_5.y, var_244_5.z)

				local var_244_6 = var_244_0.localEulerAngles

				var_244_6.z = 0
				var_244_6.x = 0
				var_244_0.localEulerAngles = var_244_6
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_244_7 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_7.x, var_244_7.y, var_244_7.z)

				local var_244_8 = var_244_0.localEulerAngles

				var_244_8.z = 0
				var_244_8.x = 0
				var_244_0.localEulerAngles = var_244_8
			end

			local var_244_9 = arg_241_1.actors_["1019ui_story"]
			local var_244_10 = 0

			if var_244_10 < arg_241_1.time_ and arg_241_1.time_ <= var_244_10 + arg_244_0 and arg_241_1.var_.characterEffect1019ui_story == nil then
				arg_241_1.var_.characterEffect1019ui_story = var_244_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_11 = 0.200000002980232

			if var_244_10 <= arg_241_1.time_ and arg_241_1.time_ < var_244_10 + var_244_11 then
				local var_244_12 = (arg_241_1.time_ - var_244_10) / var_244_11

				if arg_241_1.var_.characterEffect1019ui_story then
					arg_241_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_10 + var_244_11 and arg_241_1.time_ < var_244_10 + var_244_11 + arg_244_0 and arg_241_1.var_.characterEffect1019ui_story then
				arg_241_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_244_13 = 0

			if var_244_13 < arg_241_1.time_ and arg_241_1.time_ <= var_244_13 + arg_244_0 then
				arg_241_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action427")
			end

			local var_244_14 = 0

			if var_244_14 < arg_241_1.time_ and arg_241_1.time_ <= var_244_14 + arg_244_0 then
				arg_241_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_244_15 = 0
			local var_244_16 = 0.475

			if var_244_15 < arg_241_1.time_ and arg_241_1.time_ <= var_244_15 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_17 = arg_241_1:FormatText(StoryNameCfg[13].name)

				arg_241_1.leftNameTxt_.text = var_244_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_18 = arg_241_1:GetWordFromCfg(1101906057)
				local var_244_19 = arg_241_1:FormatText(var_244_18.content)

				arg_241_1.text_.text = var_244_19

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_20 = 19
				local var_244_21 = utf8.len(var_244_19)
				local var_244_22 = var_244_20 <= 0 and var_244_16 or var_244_16 * (var_244_21 / var_244_20)

				if var_244_22 > 0 and var_244_16 < var_244_22 then
					arg_241_1.talkMaxDuration = var_244_22

					if var_244_22 + var_244_15 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_22 + var_244_15
					end
				end

				arg_241_1.text_.text = var_244_19
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906057", "story_v_side_new_1101906.awb") ~= 0 then
					local var_244_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906057", "story_v_side_new_1101906.awb") / 1000

					if var_244_23 + var_244_15 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_23 + var_244_15
					end

					if var_244_18.prefab_name ~= "" and arg_241_1.actors_[var_244_18.prefab_name] ~= nil then
						local var_244_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_18.prefab_name].transform, "story_v_side_new_1101906", "1101906057", "story_v_side_new_1101906.awb")

						arg_241_1:RecordAudio("1101906057", var_244_24)
						arg_241_1:RecordAudio("1101906057", var_244_24)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906057", "story_v_side_new_1101906.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906057", "story_v_side_new_1101906.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_25 = math.max(var_244_16, arg_241_1.talkMaxDuration)

			if var_244_15 <= arg_241_1.time_ and arg_241_1.time_ < var_244_15 + var_244_25 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_15) / var_244_25

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_15 + var_244_25 and arg_241_1.time_ < var_244_15 + var_244_25 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906058 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 1101906058
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play1101906059(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1019ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1019ui_story == nil then
				arg_245_1.var_.characterEffect1019ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1019ui_story then
					local var_248_4 = Mathf.Lerp(0, 0.5, var_248_3)

					arg_245_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1019ui_story.fillRatio = var_248_4
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1019ui_story then
				local var_248_5 = 0.5

				arg_245_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1019ui_story.fillRatio = var_248_5
			end

			local var_248_6 = 0
			local var_248_7 = 0.375

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

				local var_248_9 = arg_245_1:GetWordFromCfg(1101906058)
				local var_248_10 = arg_245_1:FormatText(var_248_9.content)

				arg_245_1.text_.text = var_248_10

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_11 = 15
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
	Play1101906059 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 1101906059
		arg_249_1.duration_ = 1.999999999999

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play1101906060(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1019ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect1019ui_story == nil then
				arg_249_1.var_.characterEffect1019ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.200000002980232

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect1019ui_story then
					arg_249_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1019ui_story then
				arg_249_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_252_4 = 0

			if var_252_4 < arg_249_1.time_ and arg_249_1.time_ <= var_252_4 + arg_252_0 then
				arg_249_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action7_2")
			end

			local var_252_5 = 0

			if var_252_5 < arg_249_1.time_ and arg_249_1.time_ <= var_252_5 + arg_252_0 then
				arg_249_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_252_6 = 0
			local var_252_7 = 0.2

			if var_252_6 < arg_249_1.time_ and arg_249_1.time_ <= var_252_6 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_8 = arg_249_1:FormatText(StoryNameCfg[13].name)

				arg_249_1.leftNameTxt_.text = var_252_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_9 = arg_249_1:GetWordFromCfg(1101906059)
				local var_252_10 = arg_249_1:FormatText(var_252_9.content)

				arg_249_1.text_.text = var_252_10

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_11 = 8
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906059", "story_v_side_new_1101906.awb") ~= 0 then
					local var_252_14 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906059", "story_v_side_new_1101906.awb") / 1000

					if var_252_14 + var_252_6 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_14 + var_252_6
					end

					if var_252_9.prefab_name ~= "" and arg_249_1.actors_[var_252_9.prefab_name] ~= nil then
						local var_252_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_9.prefab_name].transform, "story_v_side_new_1101906", "1101906059", "story_v_side_new_1101906.awb")

						arg_249_1:RecordAudio("1101906059", var_252_15)
						arg_249_1:RecordAudio("1101906059", var_252_15)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906059", "story_v_side_new_1101906.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906059", "story_v_side_new_1101906.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_16 = math.max(var_252_7, arg_249_1.talkMaxDuration)

			if var_252_6 <= arg_249_1.time_ and arg_249_1.time_ < var_252_6 + var_252_16 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_6) / var_252_16

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_6 + var_252_16 and arg_249_1.time_ < var_252_6 + var_252_16 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906060 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 1101906060
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play1101906061(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1019ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1019ui_story == nil then
				arg_253_1.var_.characterEffect1019ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.200000002980232

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1019ui_story then
					local var_256_4 = Mathf.Lerp(0, 0.5, var_256_3)

					arg_253_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1019ui_story.fillRatio = var_256_4
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1019ui_story then
				local var_256_5 = 0.5

				arg_253_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1019ui_story.fillRatio = var_256_5
			end

			local var_256_6 = 0
			local var_256_7 = 0.075

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

				local var_256_9 = arg_253_1:GetWordFromCfg(1101906060)
				local var_256_10 = arg_253_1:FormatText(var_256_9.content)

				arg_253_1.text_.text = var_256_10

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_11 = 3
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
	Play1101906061 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 1101906061
		arg_257_1.duration_ = 3.733

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play1101906062(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1019ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect1019ui_story == nil then
				arg_257_1.var_.characterEffect1019ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.200000002980232

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect1019ui_story then
					arg_257_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect1019ui_story then
				arg_257_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_260_4 = 0
			local var_260_5 = 0.425

			if var_260_4 < arg_257_1.time_ and arg_257_1.time_ <= var_260_4 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_6 = arg_257_1:FormatText(StoryNameCfg[13].name)

				arg_257_1.leftNameTxt_.text = var_260_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_7 = arg_257_1:GetWordFromCfg(1101906061)
				local var_260_8 = arg_257_1:FormatText(var_260_7.content)

				arg_257_1.text_.text = var_260_8

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_9 = 17
				local var_260_10 = utf8.len(var_260_8)
				local var_260_11 = var_260_9 <= 0 and var_260_5 or var_260_5 * (var_260_10 / var_260_9)

				if var_260_11 > 0 and var_260_5 < var_260_11 then
					arg_257_1.talkMaxDuration = var_260_11

					if var_260_11 + var_260_4 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_11 + var_260_4
					end
				end

				arg_257_1.text_.text = var_260_8
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906061", "story_v_side_new_1101906.awb") ~= 0 then
					local var_260_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906061", "story_v_side_new_1101906.awb") / 1000

					if var_260_12 + var_260_4 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_12 + var_260_4
					end

					if var_260_7.prefab_name ~= "" and arg_257_1.actors_[var_260_7.prefab_name] ~= nil then
						local var_260_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_7.prefab_name].transform, "story_v_side_new_1101906", "1101906061", "story_v_side_new_1101906.awb")

						arg_257_1:RecordAudio("1101906061", var_260_13)
						arg_257_1:RecordAudio("1101906061", var_260_13)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906061", "story_v_side_new_1101906.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906061", "story_v_side_new_1101906.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_14 = math.max(var_260_5, arg_257_1.talkMaxDuration)

			if var_260_4 <= arg_257_1.time_ and arg_257_1.time_ < var_260_4 + var_260_14 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_4) / var_260_14

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_4 + var_260_14 and arg_257_1.time_ < var_260_4 + var_260_14 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906062 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 1101906062
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play1101906063(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1019ui_story"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 and arg_261_1.var_.characterEffect1019ui_story == nil then
				arg_261_1.var_.characterEffect1019ui_story = var_264_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_2 = 0.200000002980232

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

			local var_264_6 = 0
			local var_264_7 = 1.35

			if var_264_6 < arg_261_1.time_ and arg_261_1.time_ <= var_264_6 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_8 = arg_261_1:FormatText(StoryNameCfg[7].name)

				arg_261_1.leftNameTxt_.text = var_264_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_9 = arg_261_1:GetWordFromCfg(1101906062)
				local var_264_10 = arg_261_1:FormatText(var_264_9.content)

				arg_261_1.text_.text = var_264_10

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_11 = 54
				local var_264_12 = utf8.len(var_264_10)
				local var_264_13 = var_264_11 <= 0 and var_264_7 or var_264_7 * (var_264_12 / var_264_11)

				if var_264_13 > 0 and var_264_7 < var_264_13 then
					arg_261_1.talkMaxDuration = var_264_13

					if var_264_13 + var_264_6 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_13 + var_264_6
					end
				end

				arg_261_1.text_.text = var_264_10
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_14 = math.max(var_264_7, arg_261_1.talkMaxDuration)

			if var_264_6 <= arg_261_1.time_ and arg_261_1.time_ < var_264_6 + var_264_14 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_6) / var_264_14

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_6 + var_264_14 and arg_261_1.time_ < var_264_6 + var_264_14 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906063 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 1101906063
		arg_265_1.duration_ = 7.566

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play1101906064(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1019ui_story"]
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 and arg_265_1.var_.characterEffect1019ui_story == nil then
				arg_265_1.var_.characterEffect1019ui_story = var_268_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_2 = 0.200000002980232

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2

				if arg_265_1.var_.characterEffect1019ui_story then
					arg_265_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 and arg_265_1.var_.characterEffect1019ui_story then
				arg_265_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_268_4 = 0
			local var_268_5 = 0.775

			if var_268_4 < arg_265_1.time_ and arg_265_1.time_ <= var_268_4 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_6 = arg_265_1:FormatText(StoryNameCfg[13].name)

				arg_265_1.leftNameTxt_.text = var_268_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_7 = arg_265_1:GetWordFromCfg(1101906063)
				local var_268_8 = arg_265_1:FormatText(var_268_7.content)

				arg_265_1.text_.text = var_268_8

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_9 = 31
				local var_268_10 = utf8.len(var_268_8)
				local var_268_11 = var_268_9 <= 0 and var_268_5 or var_268_5 * (var_268_10 / var_268_9)

				if var_268_11 > 0 and var_268_5 < var_268_11 then
					arg_265_1.talkMaxDuration = var_268_11

					if var_268_11 + var_268_4 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_11 + var_268_4
					end
				end

				arg_265_1.text_.text = var_268_8
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906063", "story_v_side_new_1101906.awb") ~= 0 then
					local var_268_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906063", "story_v_side_new_1101906.awb") / 1000

					if var_268_12 + var_268_4 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_12 + var_268_4
					end

					if var_268_7.prefab_name ~= "" and arg_265_1.actors_[var_268_7.prefab_name] ~= nil then
						local var_268_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_7.prefab_name].transform, "story_v_side_new_1101906", "1101906063", "story_v_side_new_1101906.awb")

						arg_265_1:RecordAudio("1101906063", var_268_13)
						arg_265_1:RecordAudio("1101906063", var_268_13)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906063", "story_v_side_new_1101906.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906063", "story_v_side_new_1101906.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_14 = math.max(var_268_5, arg_265_1.talkMaxDuration)

			if var_268_4 <= arg_265_1.time_ and arg_265_1.time_ < var_268_4 + var_268_14 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_4) / var_268_14

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_4 + var_268_14 and arg_265_1.time_ < var_268_4 + var_268_14 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906064 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 1101906064
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play1101906065(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1019ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect1019ui_story == nil then
				arg_269_1.var_.characterEffect1019ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.200000002980232

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1019ui_story then
					local var_272_4 = Mathf.Lerp(0, 0.5, var_272_3)

					arg_269_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1019ui_story.fillRatio = var_272_4
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1019ui_story then
				local var_272_5 = 0.5

				arg_269_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1019ui_story.fillRatio = var_272_5
			end

			local var_272_6 = 0
			local var_272_7 = 0.225

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_8 = arg_269_1:FormatText(StoryNameCfg[7].name)

				arg_269_1.leftNameTxt_.text = var_272_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_9 = arg_269_1:GetWordFromCfg(1101906064)
				local var_272_10 = arg_269_1:FormatText(var_272_9.content)

				arg_269_1.text_.text = var_272_10

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_11 = 9
				local var_272_12 = utf8.len(var_272_10)
				local var_272_13 = var_272_11 <= 0 and var_272_7 or var_272_7 * (var_272_12 / var_272_11)

				if var_272_13 > 0 and var_272_7 < var_272_13 then
					arg_269_1.talkMaxDuration = var_272_13

					if var_272_13 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_13 + var_272_6
					end
				end

				arg_269_1.text_.text = var_272_10
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_14 = math.max(var_272_7, arg_269_1.talkMaxDuration)

			if var_272_6 <= arg_269_1.time_ and arg_269_1.time_ < var_272_6 + var_272_14 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_6) / var_272_14

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_6 + var_272_14 and arg_269_1.time_ < var_272_6 + var_272_14 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906065 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 1101906065
		arg_273_1.duration_ = 3.666

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play1101906066(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1019ui_story"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos1019ui_story = var_276_0.localPosition
			end

			local var_276_2 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2
				local var_276_4 = Vector3.New(0, -1.08, -5.9)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1019ui_story, var_276_4, var_276_3)

				local var_276_5 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_5.x, var_276_5.y, var_276_5.z)

				local var_276_6 = var_276_0.localEulerAngles

				var_276_6.z = 0
				var_276_6.x = 0
				var_276_0.localEulerAngles = var_276_6
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 then
				var_276_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_276_7 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_7.x, var_276_7.y, var_276_7.z)

				local var_276_8 = var_276_0.localEulerAngles

				var_276_8.z = 0
				var_276_8.x = 0
				var_276_0.localEulerAngles = var_276_8
			end

			local var_276_9 = arg_273_1.actors_["1019ui_story"]
			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 and arg_273_1.var_.characterEffect1019ui_story == nil then
				arg_273_1.var_.characterEffect1019ui_story = var_276_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_11 = 0.200000002980232

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_11 then
				local var_276_12 = (arg_273_1.time_ - var_276_10) / var_276_11

				if arg_273_1.var_.characterEffect1019ui_story then
					arg_273_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_10 + var_276_11 and arg_273_1.time_ < var_276_10 + var_276_11 + arg_276_0 and arg_273_1.var_.characterEffect1019ui_story then
				arg_273_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_276_13 = 0

			if var_276_13 < arg_273_1.time_ and arg_273_1.time_ <= var_276_13 + arg_276_0 then
				arg_273_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_276_14 = 0

			if var_276_14 < arg_273_1.time_ and arg_273_1.time_ <= var_276_14 + arg_276_0 then
				arg_273_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_276_15 = 0
			local var_276_16 = 0.4

			if var_276_15 < arg_273_1.time_ and arg_273_1.time_ <= var_276_15 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_17 = arg_273_1:FormatText(StoryNameCfg[13].name)

				arg_273_1.leftNameTxt_.text = var_276_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_18 = arg_273_1:GetWordFromCfg(1101906065)
				local var_276_19 = arg_273_1:FormatText(var_276_18.content)

				arg_273_1.text_.text = var_276_19

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_20 = 16
				local var_276_21 = utf8.len(var_276_19)
				local var_276_22 = var_276_20 <= 0 and var_276_16 or var_276_16 * (var_276_21 / var_276_20)

				if var_276_22 > 0 and var_276_16 < var_276_22 then
					arg_273_1.talkMaxDuration = var_276_22

					if var_276_22 + var_276_15 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_22 + var_276_15
					end
				end

				arg_273_1.text_.text = var_276_19
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906065", "story_v_side_new_1101906.awb") ~= 0 then
					local var_276_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906065", "story_v_side_new_1101906.awb") / 1000

					if var_276_23 + var_276_15 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_23 + var_276_15
					end

					if var_276_18.prefab_name ~= "" and arg_273_1.actors_[var_276_18.prefab_name] ~= nil then
						local var_276_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_18.prefab_name].transform, "story_v_side_new_1101906", "1101906065", "story_v_side_new_1101906.awb")

						arg_273_1:RecordAudio("1101906065", var_276_24)
						arg_273_1:RecordAudio("1101906065", var_276_24)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906065", "story_v_side_new_1101906.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906065", "story_v_side_new_1101906.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_25 = math.max(var_276_16, arg_273_1.talkMaxDuration)

			if var_276_15 <= arg_273_1.time_ and arg_273_1.time_ < var_276_15 + var_276_25 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_15) / var_276_25

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_15 + var_276_25 and arg_273_1.time_ < var_276_15 + var_276_25 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906066 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 1101906066
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play1101906067(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1019ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect1019ui_story == nil then
				arg_277_1.var_.characterEffect1019ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.200000002980232

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect1019ui_story then
					local var_280_4 = Mathf.Lerp(0, 0.5, var_280_3)

					arg_277_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_277_1.var_.characterEffect1019ui_story.fillRatio = var_280_4
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect1019ui_story then
				local var_280_5 = 0.5

				arg_277_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_277_1.var_.characterEffect1019ui_story.fillRatio = var_280_5
			end

			local var_280_6 = 0
			local var_280_7 = 0.1

			if var_280_6 < arg_277_1.time_ and arg_277_1.time_ <= var_280_6 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_8 = arg_277_1:FormatText(StoryNameCfg[7].name)

				arg_277_1.leftNameTxt_.text = var_280_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_9 = arg_277_1:GetWordFromCfg(1101906066)
				local var_280_10 = arg_277_1:FormatText(var_280_9.content)

				arg_277_1.text_.text = var_280_10

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_11 = 4
				local var_280_12 = utf8.len(var_280_10)
				local var_280_13 = var_280_11 <= 0 and var_280_7 or var_280_7 * (var_280_12 / var_280_11)

				if var_280_13 > 0 and var_280_7 < var_280_13 then
					arg_277_1.talkMaxDuration = var_280_13

					if var_280_13 + var_280_6 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_13 + var_280_6
					end
				end

				arg_277_1.text_.text = var_280_10
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_14 = math.max(var_280_7, arg_277_1.talkMaxDuration)

			if var_280_6 <= arg_277_1.time_ and arg_277_1.time_ < var_280_6 + var_280_14 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_6) / var_280_14

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_6 + var_280_14 and arg_277_1.time_ < var_280_6 + var_280_14 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906067 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 1101906067
		arg_281_1.duration_ = 3.766

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play1101906068(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1019ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect1019ui_story == nil then
				arg_281_1.var_.characterEffect1019ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.200000002980232

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect1019ui_story then
					arg_281_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1019ui_story then
				arg_281_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_284_4 = 0
			local var_284_5 = 0.375

			if var_284_4 < arg_281_1.time_ and arg_281_1.time_ <= var_284_4 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_6 = arg_281_1:FormatText(StoryNameCfg[13].name)

				arg_281_1.leftNameTxt_.text = var_284_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_7 = arg_281_1:GetWordFromCfg(1101906067)
				local var_284_8 = arg_281_1:FormatText(var_284_7.content)

				arg_281_1.text_.text = var_284_8

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_9 = 15
				local var_284_10 = utf8.len(var_284_8)
				local var_284_11 = var_284_9 <= 0 and var_284_5 or var_284_5 * (var_284_10 / var_284_9)

				if var_284_11 > 0 and var_284_5 < var_284_11 then
					arg_281_1.talkMaxDuration = var_284_11

					if var_284_11 + var_284_4 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_11 + var_284_4
					end
				end

				arg_281_1.text_.text = var_284_8
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906067", "story_v_side_new_1101906.awb") ~= 0 then
					local var_284_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906067", "story_v_side_new_1101906.awb") / 1000

					if var_284_12 + var_284_4 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_12 + var_284_4
					end

					if var_284_7.prefab_name ~= "" and arg_281_1.actors_[var_284_7.prefab_name] ~= nil then
						local var_284_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_7.prefab_name].transform, "story_v_side_new_1101906", "1101906067", "story_v_side_new_1101906.awb")

						arg_281_1:RecordAudio("1101906067", var_284_13)
						arg_281_1:RecordAudio("1101906067", var_284_13)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906067", "story_v_side_new_1101906.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906067", "story_v_side_new_1101906.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_14 = math.max(var_284_5, arg_281_1.talkMaxDuration)

			if var_284_4 <= arg_281_1.time_ and arg_281_1.time_ < var_284_4 + var_284_14 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_4) / var_284_14

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_4 + var_284_14 and arg_281_1.time_ < var_284_4 + var_284_14 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906068 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 1101906068
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play1101906069(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1019ui_story"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and arg_285_1.var_.characterEffect1019ui_story == nil then
				arg_285_1.var_.characterEffect1019ui_story = var_288_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_2 = 0.200000002980232

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.characterEffect1019ui_story then
					local var_288_4 = Mathf.Lerp(0, 0.5, var_288_3)

					arg_285_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_285_1.var_.characterEffect1019ui_story.fillRatio = var_288_4
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and arg_285_1.var_.characterEffect1019ui_story then
				local var_288_5 = 0.5

				arg_285_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_285_1.var_.characterEffect1019ui_story.fillRatio = var_288_5
			end

			local var_288_6 = 0
			local var_288_7 = 0.125

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

				local var_288_9 = arg_285_1:GetWordFromCfg(1101906068)
				local var_288_10 = arg_285_1:FormatText(var_288_9.content)

				arg_285_1.text_.text = var_288_10

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_11 = 5
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
	Play1101906069 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 1101906069
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play1101906070(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.65

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_2 = arg_289_1:GetWordFromCfg(1101906069)
				local var_292_3 = arg_289_1:FormatText(var_292_2.content)

				arg_289_1.text_.text = var_292_3

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_4 = 26
				local var_292_5 = utf8.len(var_292_3)
				local var_292_6 = var_292_4 <= 0 and var_292_1 or var_292_1 * (var_292_5 / var_292_4)

				if var_292_6 > 0 and var_292_1 < var_292_6 then
					arg_289_1.talkMaxDuration = var_292_6

					if var_292_6 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_6 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_3
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_7 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_7 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_7

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_7 and arg_289_1.time_ < var_292_0 + var_292_7 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906070 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 1101906070
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play1101906071(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 0.375

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

				local var_296_3 = arg_293_1:GetWordFromCfg(1101906070)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 15
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
	Play1101906071 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 1101906071
		arg_297_1.duration_ = 4.266

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play1101906072(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1019ui_story"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.characterEffect1019ui_story == nil then
				arg_297_1.var_.characterEffect1019ui_story = var_300_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_2 = 0.200000002980232

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.characterEffect1019ui_story then
					arg_297_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.characterEffect1019ui_story then
				arg_297_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_300_4 = 0
			local var_300_5 = 0.4

			if var_300_4 < arg_297_1.time_ and arg_297_1.time_ <= var_300_4 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_6 = arg_297_1:FormatText(StoryNameCfg[13].name)

				arg_297_1.leftNameTxt_.text = var_300_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_7 = arg_297_1:GetWordFromCfg(1101906071)
				local var_300_8 = arg_297_1:FormatText(var_300_7.content)

				arg_297_1.text_.text = var_300_8

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_9 = 16
				local var_300_10 = utf8.len(var_300_8)
				local var_300_11 = var_300_9 <= 0 and var_300_5 or var_300_5 * (var_300_10 / var_300_9)

				if var_300_11 > 0 and var_300_5 < var_300_11 then
					arg_297_1.talkMaxDuration = var_300_11

					if var_300_11 + var_300_4 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_11 + var_300_4
					end
				end

				arg_297_1.text_.text = var_300_8
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906071", "story_v_side_new_1101906.awb") ~= 0 then
					local var_300_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906071", "story_v_side_new_1101906.awb") / 1000

					if var_300_12 + var_300_4 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_12 + var_300_4
					end

					if var_300_7.prefab_name ~= "" and arg_297_1.actors_[var_300_7.prefab_name] ~= nil then
						local var_300_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_7.prefab_name].transform, "story_v_side_new_1101906", "1101906071", "story_v_side_new_1101906.awb")

						arg_297_1:RecordAudio("1101906071", var_300_13)
						arg_297_1:RecordAudio("1101906071", var_300_13)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906071", "story_v_side_new_1101906.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906071", "story_v_side_new_1101906.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_14 = math.max(var_300_5, arg_297_1.talkMaxDuration)

			if var_300_4 <= arg_297_1.time_ and arg_297_1.time_ < var_300_4 + var_300_14 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_4) / var_300_14

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_4 + var_300_14 and arg_297_1.time_ < var_300_4 + var_300_14 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906072 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 1101906072
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play1101906073(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1019ui_story"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and arg_301_1.var_.characterEffect1019ui_story == nil then
				arg_301_1.var_.characterEffect1019ui_story = var_304_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_2 = 0.200000002980232

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.characterEffect1019ui_story then
					local var_304_4 = Mathf.Lerp(0, 0.5, var_304_3)

					arg_301_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_301_1.var_.characterEffect1019ui_story.fillRatio = var_304_4
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and arg_301_1.var_.characterEffect1019ui_story then
				local var_304_5 = 0.5

				arg_301_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_301_1.var_.characterEffect1019ui_story.fillRatio = var_304_5
			end

			local var_304_6 = 0
			local var_304_7 = 0.525

			if var_304_6 < arg_301_1.time_ and arg_301_1.time_ <= var_304_6 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_8 = arg_301_1:FormatText(StoryNameCfg[7].name)

				arg_301_1.leftNameTxt_.text = var_304_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_9 = arg_301_1:GetWordFromCfg(1101906072)
				local var_304_10 = arg_301_1:FormatText(var_304_9.content)

				arg_301_1.text_.text = var_304_10

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_11 = 21
				local var_304_12 = utf8.len(var_304_10)
				local var_304_13 = var_304_11 <= 0 and var_304_7 or var_304_7 * (var_304_12 / var_304_11)

				if var_304_13 > 0 and var_304_7 < var_304_13 then
					arg_301_1.talkMaxDuration = var_304_13

					if var_304_13 + var_304_6 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_13 + var_304_6
					end
				end

				arg_301_1.text_.text = var_304_10
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_14 = math.max(var_304_7, arg_301_1.talkMaxDuration)

			if var_304_6 <= arg_301_1.time_ and arg_301_1.time_ < var_304_6 + var_304_14 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_6) / var_304_14

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_6 + var_304_14 and arg_301_1.time_ < var_304_6 + var_304_14 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906073 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 1101906073
		arg_305_1.duration_ = 5.1

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play1101906074(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1019ui_story"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos1019ui_story = var_308_0.localPosition
			end

			local var_308_2 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2
				local var_308_4 = Vector3.New(0, -1.08, -5.9)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1019ui_story, var_308_4, var_308_3)

				local var_308_5 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_5.x, var_308_5.y, var_308_5.z)

				local var_308_6 = var_308_0.localEulerAngles

				var_308_6.z = 0
				var_308_6.x = 0
				var_308_0.localEulerAngles = var_308_6
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_308_7 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_7.x, var_308_7.y, var_308_7.z)

				local var_308_8 = var_308_0.localEulerAngles

				var_308_8.z = 0
				var_308_8.x = 0
				var_308_0.localEulerAngles = var_308_8
			end

			local var_308_9 = arg_305_1.actors_["1019ui_story"]
			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 and arg_305_1.var_.characterEffect1019ui_story == nil then
				arg_305_1.var_.characterEffect1019ui_story = var_308_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_11 = 0.200000002980232

			if var_308_10 <= arg_305_1.time_ and arg_305_1.time_ < var_308_10 + var_308_11 then
				local var_308_12 = (arg_305_1.time_ - var_308_10) / var_308_11

				if arg_305_1.var_.characterEffect1019ui_story then
					arg_305_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_10 + var_308_11 and arg_305_1.time_ < var_308_10 + var_308_11 + arg_308_0 and arg_305_1.var_.characterEffect1019ui_story then
				arg_305_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_308_13 = 0

			if var_308_13 < arg_305_1.time_ and arg_305_1.time_ <= var_308_13 + arg_308_0 then
				arg_305_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_2")
			end

			local var_308_14 = 0
			local var_308_15 = 0.5

			if var_308_14 < arg_305_1.time_ and arg_305_1.time_ <= var_308_14 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_16 = arg_305_1:FormatText(StoryNameCfg[13].name)

				arg_305_1.leftNameTxt_.text = var_308_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_17 = arg_305_1:GetWordFromCfg(1101906073)
				local var_308_18 = arg_305_1:FormatText(var_308_17.content)

				arg_305_1.text_.text = var_308_18

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_19 = 20
				local var_308_20 = utf8.len(var_308_18)
				local var_308_21 = var_308_19 <= 0 and var_308_15 or var_308_15 * (var_308_20 / var_308_19)

				if var_308_21 > 0 and var_308_15 < var_308_21 then
					arg_305_1.talkMaxDuration = var_308_21

					if var_308_21 + var_308_14 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_21 + var_308_14
					end
				end

				arg_305_1.text_.text = var_308_18
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906073", "story_v_side_new_1101906.awb") ~= 0 then
					local var_308_22 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906073", "story_v_side_new_1101906.awb") / 1000

					if var_308_22 + var_308_14 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_22 + var_308_14
					end

					if var_308_17.prefab_name ~= "" and arg_305_1.actors_[var_308_17.prefab_name] ~= nil then
						local var_308_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_17.prefab_name].transform, "story_v_side_new_1101906", "1101906073", "story_v_side_new_1101906.awb")

						arg_305_1:RecordAudio("1101906073", var_308_23)
						arg_305_1:RecordAudio("1101906073", var_308_23)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906073", "story_v_side_new_1101906.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906073", "story_v_side_new_1101906.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_24 = math.max(var_308_15, arg_305_1.talkMaxDuration)

			if var_308_14 <= arg_305_1.time_ and arg_305_1.time_ < var_308_14 + var_308_24 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_14) / var_308_24

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_14 + var_308_24 and arg_305_1.time_ < var_308_14 + var_308_24 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906074 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 1101906074
		arg_309_1.duration_ = 13.9

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play1101906075(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = "R1902"

			if arg_309_1.bgs_[var_312_0] == nil then
				local var_312_1 = Object.Instantiate(arg_309_1.paintGo_)

				var_312_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_312_0)
				var_312_1.name = var_312_0
				var_312_1.transform.parent = arg_309_1.stage_.transform
				var_312_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_309_1.bgs_[var_312_0] = var_312_1
			end

			local var_312_2 = 2

			if var_312_2 < arg_309_1.time_ and arg_309_1.time_ <= var_312_2 + arg_312_0 then
				local var_312_3 = manager.ui.mainCamera.transform.localPosition
				local var_312_4 = Vector3.New(0, 0, 10) + Vector3.New(var_312_3.x, var_312_3.y, 0)
				local var_312_5 = arg_309_1.bgs_.R1902

				var_312_5.transform.localPosition = var_312_4
				var_312_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_312_6 = var_312_5:GetComponent("SpriteRenderer")

				if var_312_6 and var_312_6.sprite then
					local var_312_7 = (var_312_5.transform.localPosition - var_312_3).z
					local var_312_8 = manager.ui.mainCameraCom_
					local var_312_9 = 2 * var_312_7 * Mathf.Tan(var_312_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_312_10 = var_312_9 * var_312_8.aspect
					local var_312_11 = var_312_6.sprite.bounds.size.x
					local var_312_12 = var_312_6.sprite.bounds.size.y
					local var_312_13 = var_312_10 / var_312_11
					local var_312_14 = var_312_9 / var_312_12
					local var_312_15 = var_312_14 < var_312_13 and var_312_13 or var_312_14

					var_312_5.transform.localScale = Vector3.New(var_312_15, var_312_15, 0)
				end

				for iter_312_0, iter_312_1 in pairs(arg_309_1.bgs_) do
					if iter_312_0 ~= "R1902" then
						iter_312_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_312_16 = 0

			if var_312_16 < arg_309_1.time_ and arg_309_1.time_ <= var_312_16 + arg_312_0 then
				arg_309_1.mask_.enabled = true
				arg_309_1.mask_.raycastTarget = true

				arg_309_1:SetGaussion(false)
			end

			local var_312_17 = 2

			if var_312_16 <= arg_309_1.time_ and arg_309_1.time_ < var_312_16 + var_312_17 then
				local var_312_18 = (arg_309_1.time_ - var_312_16) / var_312_17
				local var_312_19 = Color.New(0, 0, 0)

				var_312_19.a = Mathf.Lerp(0, 1, var_312_18)
				arg_309_1.mask_.color = var_312_19
			end

			if arg_309_1.time_ >= var_312_16 + var_312_17 and arg_309_1.time_ < var_312_16 + var_312_17 + arg_312_0 then
				local var_312_20 = Color.New(0, 0, 0)

				var_312_20.a = 1
				arg_309_1.mask_.color = var_312_20
			end

			local var_312_21 = 2

			if var_312_21 < arg_309_1.time_ and arg_309_1.time_ <= var_312_21 + arg_312_0 then
				arg_309_1.mask_.enabled = true
				arg_309_1.mask_.raycastTarget = true

				arg_309_1:SetGaussion(false)
			end

			local var_312_22 = 6.9

			if var_312_21 <= arg_309_1.time_ and arg_309_1.time_ < var_312_21 + var_312_22 then
				local var_312_23 = (arg_309_1.time_ - var_312_21) / var_312_22
				local var_312_24 = Color.New(0, 0, 0)

				var_312_24.a = Mathf.Lerp(1, 0, var_312_23)
				arg_309_1.mask_.color = var_312_24
			end

			if arg_309_1.time_ >= var_312_21 + var_312_22 and arg_309_1.time_ < var_312_21 + var_312_22 + arg_312_0 then
				local var_312_25 = Color.New(0, 0, 0)
				local var_312_26 = 0

				arg_309_1.mask_.enabled = false
				var_312_25.a = var_312_26
				arg_309_1.mask_.color = var_312_25
			end

			local var_312_27 = arg_309_1.actors_["1019ui_story"].transform
			local var_312_28 = 2

			if var_312_28 < arg_309_1.time_ and arg_309_1.time_ <= var_312_28 + arg_312_0 then
				arg_309_1.var_.moveOldPos1019ui_story = var_312_27.localPosition
			end

			local var_312_29 = 0.001

			if var_312_28 <= arg_309_1.time_ and arg_309_1.time_ < var_312_28 + var_312_29 then
				local var_312_30 = (arg_309_1.time_ - var_312_28) / var_312_29
				local var_312_31 = Vector3.New(0, 100, 0)

				var_312_27.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1019ui_story, var_312_31, var_312_30)

				local var_312_32 = manager.ui.mainCamera.transform.position - var_312_27.position

				var_312_27.forward = Vector3.New(var_312_32.x, var_312_32.y, var_312_32.z)

				local var_312_33 = var_312_27.localEulerAngles

				var_312_33.z = 0
				var_312_33.x = 0
				var_312_27.localEulerAngles = var_312_33
			end

			if arg_309_1.time_ >= var_312_28 + var_312_29 and arg_309_1.time_ < var_312_28 + var_312_29 + arg_312_0 then
				var_312_27.localPosition = Vector3.New(0, 100, 0)

				local var_312_34 = manager.ui.mainCamera.transform.position - var_312_27.position

				var_312_27.forward = Vector3.New(var_312_34.x, var_312_34.y, var_312_34.z)

				local var_312_35 = var_312_27.localEulerAngles

				var_312_35.z = 0
				var_312_35.x = 0
				var_312_27.localEulerAngles = var_312_35
			end

			local var_312_36 = arg_309_1.actors_["1019ui_story"]
			local var_312_37 = 2

			if var_312_37 < arg_309_1.time_ and arg_309_1.time_ <= var_312_37 + arg_312_0 and arg_309_1.var_.characterEffect1019ui_story == nil then
				arg_309_1.var_.characterEffect1019ui_story = var_312_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_38 = 0.200000002980232

			if var_312_37 <= arg_309_1.time_ and arg_309_1.time_ < var_312_37 + var_312_38 then
				local var_312_39 = (arg_309_1.time_ - var_312_37) / var_312_38

				if arg_309_1.var_.characterEffect1019ui_story then
					local var_312_40 = Mathf.Lerp(0, 0.5, var_312_39)

					arg_309_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_309_1.var_.characterEffect1019ui_story.fillRatio = var_312_40
				end
			end

			if arg_309_1.time_ >= var_312_37 + var_312_38 and arg_309_1.time_ < var_312_37 + var_312_38 + arg_312_0 and arg_309_1.var_.characterEffect1019ui_story then
				local var_312_41 = 0.5

				arg_309_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_309_1.var_.characterEffect1019ui_story.fillRatio = var_312_41
			end

			local var_312_42 = arg_309_1.bgs_.R1902.transform
			local var_312_43 = 2

			if var_312_43 < arg_309_1.time_ and arg_309_1.time_ <= var_312_43 + arg_312_0 then
				arg_309_1.var_.moveOldPosR1902 = var_312_42.localPosition
			end

			local var_312_44 = 0.001

			if var_312_43 <= arg_309_1.time_ and arg_309_1.time_ < var_312_43 + var_312_44 then
				local var_312_45 = (arg_309_1.time_ - var_312_43) / var_312_44
				local var_312_46 = Vector3.New(0, 1, 8.5)

				var_312_42.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPosR1902, var_312_46, var_312_45)
			end

			if arg_309_1.time_ >= var_312_43 + var_312_44 and arg_309_1.time_ < var_312_43 + var_312_44 + arg_312_0 then
				var_312_42.localPosition = Vector3.New(0, 1, 8.5)
			end

			local var_312_47 = arg_309_1.bgs_.R1902.transform
			local var_312_48 = 2.01666666666667

			if var_312_48 < arg_309_1.time_ and arg_309_1.time_ <= var_312_48 + arg_312_0 then
				arg_309_1.var_.moveOldPosR1902 = var_312_47.localPosition
			end

			local var_312_49 = 3

			if var_312_48 <= arg_309_1.time_ and arg_309_1.time_ < var_312_48 + var_312_49 then
				local var_312_50 = (arg_309_1.time_ - var_312_48) / var_312_49
				local var_312_51 = Vector3.New(0, 0.9, 9.5)

				var_312_47.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPosR1902, var_312_51, var_312_50)
			end

			if arg_309_1.time_ >= var_312_48 + var_312_49 and arg_309_1.time_ < var_312_48 + var_312_49 + arg_312_0 then
				var_312_47.localPosition = Vector3.New(0, 0.9, 9.5)
			end

			if arg_309_1.frameCnt_ <= 1 then
				arg_309_1.dialog_:SetActive(false)
			end

			local var_312_52 = 8.9
			local var_312_53 = 0.125

			if var_312_52 < arg_309_1.time_ and arg_309_1.time_ <= var_312_52 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0

				arg_309_1.dialog_:SetActive(true)

				local var_312_54 = LeanTween.value(arg_309_1.dialog_, 0, 1, 0.3)

				var_312_54:setOnUpdate(LuaHelper.FloatAction(function(arg_313_0)
					arg_309_1.dialogCg_.alpha = arg_313_0
				end))
				var_312_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_309_1.dialog_)
					var_312_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_309_1.duration_ = arg_309_1.duration_ + 0.3

				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_55 = arg_309_1:FormatText(StoryNameCfg[7].name)

				arg_309_1.leftNameTxt_.text = var_312_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_56 = arg_309_1:GetWordFromCfg(1101906074)
				local var_312_57 = arg_309_1:FormatText(var_312_56.content)

				arg_309_1.text_.text = var_312_57

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_58 = 5
				local var_312_59 = utf8.len(var_312_57)
				local var_312_60 = var_312_58 <= 0 and var_312_53 or var_312_53 * (var_312_59 / var_312_58)

				if var_312_60 > 0 and var_312_53 < var_312_60 then
					arg_309_1.talkMaxDuration = var_312_60
					var_312_52 = var_312_52 + 0.3

					if var_312_60 + var_312_52 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_60 + var_312_52
					end
				end

				arg_309_1.text_.text = var_312_57
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_61 = var_312_52 + 0.3
			local var_312_62 = math.max(var_312_53, arg_309_1.talkMaxDuration)

			if var_312_61 <= arg_309_1.time_ and arg_309_1.time_ < var_312_61 + var_312_62 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_61) / var_312_62

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_61 + var_312_62 and arg_309_1.time_ < var_312_61 + var_312_62 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906075 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 1101906075
		arg_315_1.duration_ = 5.133

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play1101906076(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0
			local var_318_1 = 0.6

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_2 = arg_315_1:FormatText(StoryNameCfg[13].name)

				arg_315_1.leftNameTxt_.text = var_318_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_3 = arg_315_1:GetWordFromCfg(1101906075)
				local var_318_4 = arg_315_1:FormatText(var_318_3.content)

				arg_315_1.text_.text = var_318_4

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_5 = 24
				local var_318_6 = utf8.len(var_318_4)
				local var_318_7 = var_318_5 <= 0 and var_318_1 or var_318_1 * (var_318_6 / var_318_5)

				if var_318_7 > 0 and var_318_1 < var_318_7 then
					arg_315_1.talkMaxDuration = var_318_7

					if var_318_7 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_7 + var_318_0
					end
				end

				arg_315_1.text_.text = var_318_4
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906075", "story_v_side_new_1101906.awb") ~= 0 then
					local var_318_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906075", "story_v_side_new_1101906.awb") / 1000

					if var_318_8 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_8 + var_318_0
					end

					if var_318_3.prefab_name ~= "" and arg_315_1.actors_[var_318_3.prefab_name] ~= nil then
						local var_318_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_3.prefab_name].transform, "story_v_side_new_1101906", "1101906075", "story_v_side_new_1101906.awb")

						arg_315_1:RecordAudio("1101906075", var_318_9)
						arg_315_1:RecordAudio("1101906075", var_318_9)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906075", "story_v_side_new_1101906.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906075", "story_v_side_new_1101906.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_10 = math.max(var_318_1, arg_315_1.talkMaxDuration)

			if var_318_0 <= arg_315_1.time_ and arg_315_1.time_ < var_318_0 + var_318_10 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_0) / var_318_10

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_0 + var_318_10 and arg_315_1.time_ < var_318_0 + var_318_10 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906076 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 1101906076
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play1101906077(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0
			local var_322_1 = 0.725

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_2 = arg_319_1:FormatText(StoryNameCfg[7].name)

				arg_319_1.leftNameTxt_.text = var_322_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_3 = arg_319_1:GetWordFromCfg(1101906076)
				local var_322_4 = arg_319_1:FormatText(var_322_3.content)

				arg_319_1.text_.text = var_322_4

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_5 = 29
				local var_322_6 = utf8.len(var_322_4)
				local var_322_7 = var_322_5 <= 0 and var_322_1 or var_322_1 * (var_322_6 / var_322_5)

				if var_322_7 > 0 and var_322_1 < var_322_7 then
					arg_319_1.talkMaxDuration = var_322_7

					if var_322_7 + var_322_0 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_7 + var_322_0
					end
				end

				arg_319_1.text_.text = var_322_4
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_8 = math.max(var_322_1, arg_319_1.talkMaxDuration)

			if var_322_0 <= arg_319_1.time_ and arg_319_1.time_ < var_322_0 + var_322_8 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_0) / var_322_8

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_0 + var_322_8 and arg_319_1.time_ < var_322_0 + var_322_8 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906077 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 1101906077
		arg_323_1.duration_ = 7.533

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play1101906078(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0
			local var_326_1 = 0.9

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_2 = arg_323_1:FormatText(StoryNameCfg[13].name)

				arg_323_1.leftNameTxt_.text = var_326_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_3 = arg_323_1:GetWordFromCfg(1101906077)
				local var_326_4 = arg_323_1:FormatText(var_326_3.content)

				arg_323_1.text_.text = var_326_4

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_5 = 36
				local var_326_6 = utf8.len(var_326_4)
				local var_326_7 = var_326_5 <= 0 and var_326_1 or var_326_1 * (var_326_6 / var_326_5)

				if var_326_7 > 0 and var_326_1 < var_326_7 then
					arg_323_1.talkMaxDuration = var_326_7

					if var_326_7 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_7 + var_326_0
					end
				end

				arg_323_1.text_.text = var_326_4
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906077", "story_v_side_new_1101906.awb") ~= 0 then
					local var_326_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906077", "story_v_side_new_1101906.awb") / 1000

					if var_326_8 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_8 + var_326_0
					end

					if var_326_3.prefab_name ~= "" and arg_323_1.actors_[var_326_3.prefab_name] ~= nil then
						local var_326_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_3.prefab_name].transform, "story_v_side_new_1101906", "1101906077", "story_v_side_new_1101906.awb")

						arg_323_1:RecordAudio("1101906077", var_326_9)
						arg_323_1:RecordAudio("1101906077", var_326_9)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906077", "story_v_side_new_1101906.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906077", "story_v_side_new_1101906.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_10 = math.max(var_326_1, arg_323_1.talkMaxDuration)

			if var_326_0 <= arg_323_1.time_ and arg_323_1.time_ < var_326_0 + var_326_10 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_0) / var_326_10

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_0 + var_326_10 and arg_323_1.time_ < var_326_0 + var_326_10 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906078 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 1101906078
		arg_327_1.duration_ = 8.6

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play1101906079(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 0.975

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_2 = arg_327_1:FormatText(StoryNameCfg[13].name)

				arg_327_1.leftNameTxt_.text = var_330_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_3 = arg_327_1:GetWordFromCfg(1101906078)
				local var_330_4 = arg_327_1:FormatText(var_330_3.content)

				arg_327_1.text_.text = var_330_4

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_5 = 39
				local var_330_6 = utf8.len(var_330_4)
				local var_330_7 = var_330_5 <= 0 and var_330_1 or var_330_1 * (var_330_6 / var_330_5)

				if var_330_7 > 0 and var_330_1 < var_330_7 then
					arg_327_1.talkMaxDuration = var_330_7

					if var_330_7 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_7 + var_330_0
					end
				end

				arg_327_1.text_.text = var_330_4
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906078", "story_v_side_new_1101906.awb") ~= 0 then
					local var_330_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906078", "story_v_side_new_1101906.awb") / 1000

					if var_330_8 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_8 + var_330_0
					end

					if var_330_3.prefab_name ~= "" and arg_327_1.actors_[var_330_3.prefab_name] ~= nil then
						local var_330_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_3.prefab_name].transform, "story_v_side_new_1101906", "1101906078", "story_v_side_new_1101906.awb")

						arg_327_1:RecordAudio("1101906078", var_330_9)
						arg_327_1:RecordAudio("1101906078", var_330_9)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906078", "story_v_side_new_1101906.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906078", "story_v_side_new_1101906.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_10 = math.max(var_330_1, arg_327_1.talkMaxDuration)

			if var_330_0 <= arg_327_1.time_ and arg_327_1.time_ < var_330_0 + var_330_10 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_0) / var_330_10

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_0 + var_330_10 and arg_327_1.time_ < var_330_0 + var_330_10 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906079 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 1101906079
		arg_331_1.duration_ = 5

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play1101906080(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0
			local var_334_1 = 0.2

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_2 = arg_331_1:FormatText(StoryNameCfg[7].name)

				arg_331_1.leftNameTxt_.text = var_334_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_3 = arg_331_1:GetWordFromCfg(1101906079)
				local var_334_4 = arg_331_1:FormatText(var_334_3.content)

				arg_331_1.text_.text = var_334_4

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_5 = 8
				local var_334_6 = utf8.len(var_334_4)
				local var_334_7 = var_334_5 <= 0 and var_334_1 or var_334_1 * (var_334_6 / var_334_5)

				if var_334_7 > 0 and var_334_1 < var_334_7 then
					arg_331_1.talkMaxDuration = var_334_7

					if var_334_7 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_7 + var_334_0
					end
				end

				arg_331_1.text_.text = var_334_4
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_8 = math.max(var_334_1, arg_331_1.talkMaxDuration)

			if var_334_0 <= arg_331_1.time_ and arg_331_1.time_ < var_334_0 + var_334_8 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_0) / var_334_8

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_0 + var_334_8 and arg_331_1.time_ < var_334_0 + var_334_8 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906080 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 1101906080
		arg_335_1.duration_ = 8.533

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play1101906081(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 1.05

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[13].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(1101906080)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 42
				local var_338_6 = utf8.len(var_338_4)
				local var_338_7 = var_338_5 <= 0 and var_338_1 or var_338_1 * (var_338_6 / var_338_5)

				if var_338_7 > 0 and var_338_1 < var_338_7 then
					arg_335_1.talkMaxDuration = var_338_7

					if var_338_7 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_7 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_4
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906080", "story_v_side_new_1101906.awb") ~= 0 then
					local var_338_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906080", "story_v_side_new_1101906.awb") / 1000

					if var_338_8 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_0
					end

					if var_338_3.prefab_name ~= "" and arg_335_1.actors_[var_338_3.prefab_name] ~= nil then
						local var_338_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_3.prefab_name].transform, "story_v_side_new_1101906", "1101906080", "story_v_side_new_1101906.awb")

						arg_335_1:RecordAudio("1101906080", var_338_9)
						arg_335_1:RecordAudio("1101906080", var_338_9)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906080", "story_v_side_new_1101906.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906080", "story_v_side_new_1101906.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_10 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_10 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_10

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_10 and arg_335_1.time_ < var_338_0 + var_338_10 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906081 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 1101906081
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play1101906082(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0
			local var_342_1 = 0.55

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, false)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_2 = arg_339_1:GetWordFromCfg(1101906081)
				local var_342_3 = arg_339_1:FormatText(var_342_2.content)

				arg_339_1.text_.text = var_342_3

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_4 = 22
				local var_342_5 = utf8.len(var_342_3)
				local var_342_6 = var_342_4 <= 0 and var_342_1 or var_342_1 * (var_342_5 / var_342_4)

				if var_342_6 > 0 and var_342_1 < var_342_6 then
					arg_339_1.talkMaxDuration = var_342_6

					if var_342_6 + var_342_0 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_6 + var_342_0
					end
				end

				arg_339_1.text_.text = var_342_3
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_7 = math.max(var_342_1, arg_339_1.talkMaxDuration)

			if var_342_0 <= arg_339_1.time_ and arg_339_1.time_ < var_342_0 + var_342_7 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_0) / var_342_7

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_0 + var_342_7 and arg_339_1.time_ < var_342_0 + var_342_7 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906082 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 1101906082
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play1101906083(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0
			local var_346_1 = 0.75

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_2 = arg_343_1:GetWordFromCfg(1101906082)
				local var_346_3 = arg_343_1:FormatText(var_346_2.content)

				arg_343_1.text_.text = var_346_3

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_4 = 30
				local var_346_5 = utf8.len(var_346_3)
				local var_346_6 = var_346_4 <= 0 and var_346_1 or var_346_1 * (var_346_5 / var_346_4)

				if var_346_6 > 0 and var_346_1 < var_346_6 then
					arg_343_1.talkMaxDuration = var_346_6

					if var_346_6 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_6 + var_346_0
					end
				end

				arg_343_1.text_.text = var_346_3
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_7 = math.max(var_346_1, arg_343_1.talkMaxDuration)

			if var_346_0 <= arg_343_1.time_ and arg_343_1.time_ < var_346_0 + var_346_7 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_0) / var_346_7

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_0 + var_346_7 and arg_343_1.time_ < var_346_0 + var_346_7 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906083 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 1101906083
		arg_347_1.duration_ = 1.133

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play1101906084(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0
			local var_350_1 = 0.1

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_2 = arg_347_1:FormatText(StoryNameCfg[13].name)

				arg_347_1.leftNameTxt_.text = var_350_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_3 = arg_347_1:GetWordFromCfg(1101906083)
				local var_350_4 = arg_347_1:FormatText(var_350_3.content)

				arg_347_1.text_.text = var_350_4

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_5 = 4
				local var_350_6 = utf8.len(var_350_4)
				local var_350_7 = var_350_5 <= 0 and var_350_1 or var_350_1 * (var_350_6 / var_350_5)

				if var_350_7 > 0 and var_350_1 < var_350_7 then
					arg_347_1.talkMaxDuration = var_350_7

					if var_350_7 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_7 + var_350_0
					end
				end

				arg_347_1.text_.text = var_350_4
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906083", "story_v_side_new_1101906.awb") ~= 0 then
					local var_350_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906083", "story_v_side_new_1101906.awb") / 1000

					if var_350_8 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_8 + var_350_0
					end

					if var_350_3.prefab_name ~= "" and arg_347_1.actors_[var_350_3.prefab_name] ~= nil then
						local var_350_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_3.prefab_name].transform, "story_v_side_new_1101906", "1101906083", "story_v_side_new_1101906.awb")

						arg_347_1:RecordAudio("1101906083", var_350_9)
						arg_347_1:RecordAudio("1101906083", var_350_9)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906083", "story_v_side_new_1101906.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906083", "story_v_side_new_1101906.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_10 = math.max(var_350_1, arg_347_1.talkMaxDuration)

			if var_350_0 <= arg_347_1.time_ and arg_347_1.time_ < var_350_0 + var_350_10 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_0) / var_350_10

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_0 + var_350_10 and arg_347_1.time_ < var_350_0 + var_350_10 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906084 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 1101906084
		arg_351_1.duration_ = 5

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play1101906085(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.bgs_.R1902.transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPosR1902 = var_354_0.localPosition
			end

			local var_354_2 = 2.43333333333333

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2
				local var_354_4 = Vector3.New(0, 1, 10)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPosR1902, var_354_4, var_354_3)
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(0, 1, 10)
			end

			local var_354_5 = 0

			if var_354_5 < arg_351_1.time_ and arg_351_1.time_ <= var_354_5 + arg_354_0 then
				arg_351_1.allBtn_.enabled = false
			end

			local var_354_6 = 2.43333333333333

			if arg_351_1.time_ >= var_354_5 + var_354_6 and arg_351_1.time_ < var_354_5 + var_354_6 + arg_354_0 then
				arg_351_1.allBtn_.enabled = true
			end

			local var_354_7 = 0
			local var_354_8 = 1.05

			if var_354_7 < arg_351_1.time_ and arg_351_1.time_ <= var_354_7 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, false)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_9 = arg_351_1:GetWordFromCfg(1101906084)
				local var_354_10 = arg_351_1:FormatText(var_354_9.content)

				arg_351_1.text_.text = var_354_10

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_11 = 42
				local var_354_12 = utf8.len(var_354_10)
				local var_354_13 = var_354_11 <= 0 and var_354_8 or var_354_8 * (var_354_12 / var_354_11)

				if var_354_13 > 0 and var_354_8 < var_354_13 then
					arg_351_1.talkMaxDuration = var_354_13

					if var_354_13 + var_354_7 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_13 + var_354_7
					end
				end

				arg_351_1.text_.text = var_354_10
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_14 = math.max(var_354_8, arg_351_1.talkMaxDuration)

			if var_354_7 <= arg_351_1.time_ and arg_351_1.time_ < var_354_7 + var_354_14 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_7) / var_354_14

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_7 + var_354_14 and arg_351_1.time_ < var_354_7 + var_354_14 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906085 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 1101906085
		arg_355_1.duration_ = 6.4

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play1101906086(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.bgs_.R1902.transform
			local var_358_1 = 1

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 then
				arg_355_1.var_.moveOldPosR1902 = var_358_0.localPosition
			end

			local var_358_2 = 0.001

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2
				local var_358_4 = Vector3.New(-0.2, 1, 9)

				var_358_0.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPosR1902, var_358_4, var_358_3)
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 then
				var_358_0.localPosition = Vector3.New(-0.2, 1, 9)
			end

			local var_358_5 = arg_355_1.bgs_.R1902.transform
			local var_358_6 = 1.01666666666667

			if var_358_6 < arg_355_1.time_ and arg_355_1.time_ <= var_358_6 + arg_358_0 then
				arg_355_1.var_.moveOldPosR1902 = var_358_5.localPosition
			end

			local var_358_7 = 3.5

			if var_358_6 <= arg_355_1.time_ and arg_355_1.time_ < var_358_6 + var_358_7 then
				local var_358_8 = (arg_355_1.time_ - var_358_6) / var_358_7
				local var_358_9 = Vector3.New(-0.4, 1, 9)

				var_358_5.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPosR1902, var_358_9, var_358_8)
			end

			if arg_355_1.time_ >= var_358_6 + var_358_7 and arg_355_1.time_ < var_358_6 + var_358_7 + arg_358_0 then
				var_358_5.localPosition = Vector3.New(-0.4, 1, 9)
			end

			local var_358_10 = 0

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 then
				arg_355_1.mask_.enabled = true
				arg_355_1.mask_.raycastTarget = true

				arg_355_1:SetGaussion(false)
			end

			local var_358_11 = 1

			if var_358_10 <= arg_355_1.time_ and arg_355_1.time_ < var_358_10 + var_358_11 then
				local var_358_12 = (arg_355_1.time_ - var_358_10) / var_358_11
				local var_358_13 = Color.New(0, 0, 0)

				var_358_13.a = Mathf.Lerp(0, 1, var_358_12)
				arg_355_1.mask_.color = var_358_13
			end

			if arg_355_1.time_ >= var_358_10 + var_358_11 and arg_355_1.time_ < var_358_10 + var_358_11 + arg_358_0 then
				local var_358_14 = Color.New(0, 0, 0)

				var_358_14.a = 1
				arg_355_1.mask_.color = var_358_14
			end

			local var_358_15 = 1

			if var_358_15 < arg_355_1.time_ and arg_355_1.time_ <= var_358_15 + arg_358_0 then
				arg_355_1.mask_.enabled = true
				arg_355_1.mask_.raycastTarget = true

				arg_355_1:SetGaussion(false)
			end

			local var_358_16 = 1

			if var_358_15 <= arg_355_1.time_ and arg_355_1.time_ < var_358_15 + var_358_16 then
				local var_358_17 = (arg_355_1.time_ - var_358_15) / var_358_16
				local var_358_18 = Color.New(0, 0, 0)

				var_358_18.a = Mathf.Lerp(1, 0, var_358_17)
				arg_355_1.mask_.color = var_358_18
			end

			if arg_355_1.time_ >= var_358_15 + var_358_16 and arg_355_1.time_ < var_358_15 + var_358_16 + arg_358_0 then
				local var_358_19 = Color.New(0, 0, 0)
				local var_358_20 = 0

				arg_355_1.mask_.enabled = false
				var_358_19.a = var_358_20
				arg_355_1.mask_.color = var_358_19
			end

			local var_358_21 = 2

			if var_358_21 < arg_355_1.time_ and arg_355_1.time_ <= var_358_21 + arg_358_0 then
				arg_355_1.allBtn_.enabled = false
			end

			local var_358_22 = 2.51666666666667

			if arg_355_1.time_ >= var_358_21 + var_358_22 and arg_355_1.time_ < var_358_21 + var_358_22 + arg_358_0 then
				arg_355_1.allBtn_.enabled = true
			end

			if arg_355_1.frameCnt_ <= 1 then
				arg_355_1.dialog_:SetActive(false)
			end

			local var_358_23 = 1.4
			local var_358_24 = 0.6

			if var_358_23 < arg_355_1.time_ and arg_355_1.time_ <= var_358_23 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0

				arg_355_1.dialog_:SetActive(true)

				local var_358_25 = LeanTween.value(arg_355_1.dialog_, 0, 1, 0.3)

				var_358_25:setOnUpdate(LuaHelper.FloatAction(function(arg_359_0)
					arg_355_1.dialogCg_.alpha = arg_359_0
				end))
				var_358_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_355_1.dialog_)
					var_358_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_355_1.duration_ = arg_355_1.duration_ + 0.3

				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_26 = arg_355_1:GetWordFromCfg(1101906085)
				local var_358_27 = arg_355_1:FormatText(var_358_26.content)

				arg_355_1.text_.text = var_358_27

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_28 = 24
				local var_358_29 = utf8.len(var_358_27)
				local var_358_30 = var_358_28 <= 0 and var_358_24 or var_358_24 * (var_358_29 / var_358_28)

				if var_358_30 > 0 and var_358_24 < var_358_30 then
					arg_355_1.talkMaxDuration = var_358_30
					var_358_23 = var_358_23 + 0.3

					if var_358_30 + var_358_23 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_30 + var_358_23
					end
				end

				arg_355_1.text_.text = var_358_27
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_31 = var_358_23 + 0.3
			local var_358_32 = math.max(var_358_24, arg_355_1.talkMaxDuration)

			if var_358_31 <= arg_355_1.time_ and arg_355_1.time_ < var_358_31 + var_358_32 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_31) / var_358_32

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_31 + var_358_32 and arg_355_1.time_ < var_358_31 + var_358_32 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906086 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 1101906086
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play1101906087(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.1

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_2 = arg_361_1:FormatText(StoryNameCfg[7].name)

				arg_361_1.leftNameTxt_.text = var_364_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_3 = arg_361_1:GetWordFromCfg(1101906086)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 4
				local var_364_6 = utf8.len(var_364_4)
				local var_364_7 = var_364_5 <= 0 and var_364_1 or var_364_1 * (var_364_6 / var_364_5)

				if var_364_7 > 0 and var_364_1 < var_364_7 then
					arg_361_1.talkMaxDuration = var_364_7

					if var_364_7 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_7 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_4
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_8 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_8 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_8

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_8 and arg_361_1.time_ < var_364_0 + var_364_8 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906087 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 1101906087
		arg_365_1.duration_ = 3.032999999999

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play1101906088(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.fswbg_:SetActive(true)
				arg_365_1.dialog_:SetActive(false)

				arg_365_1.fswtw_.percent = 0

				local var_368_1 = arg_365_1:GetWordFromCfg(1101906087)
				local var_368_2 = arg_365_1:FormatText(var_368_1.content)

				arg_365_1.fswt_.text = var_368_2

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.fswt_)

				arg_365_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_365_1.fswtw_:SetDirty()

				arg_365_1.typewritterCharCountI18N = 0

				SetActive(arg_365_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_365_1:ShowNextGo(false)
			end

			local var_368_3 = 0.033

			if var_368_3 < arg_365_1.time_ and arg_365_1.time_ <= var_368_3 + arg_368_0 then
				arg_365_1.var_.oldValueTypewriter = arg_365_1.fswtw_.percent

				arg_365_1:ShowNextGo(false)
			end

			local var_368_4 = 28
			local var_368_5 = 3
			local var_368_6 = arg_365_1:GetWordFromCfg(1101906087)
			local var_368_7 = arg_365_1:FormatText(var_368_6.content)
			local var_368_8, var_368_9 = arg_365_1:GetPercentByPara(var_368_7, 1)

			if var_368_3 < arg_365_1.time_ and arg_365_1.time_ <= var_368_3 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0

				local var_368_10 = var_368_4 <= 0 and var_368_5 or var_368_5 * ((var_368_9 - arg_365_1.typewritterCharCountI18N) / var_368_4)

				if var_368_10 > 0 and var_368_5 < var_368_10 then
					arg_365_1.talkMaxDuration = var_368_10

					if var_368_10 + var_368_3 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_10 + var_368_3
					end
				end
			end

			local var_368_11 = 3
			local var_368_12 = math.max(var_368_11, arg_365_1.talkMaxDuration)

			if var_368_3 <= arg_365_1.time_ and arg_365_1.time_ < var_368_3 + var_368_12 then
				local var_368_13 = (arg_365_1.time_ - var_368_3) / var_368_12

				arg_365_1.fswtw_.percent = Mathf.Lerp(arg_365_1.var_.oldValueTypewriter, var_368_8, var_368_13)
				arg_365_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_365_1.fswtw_:SetDirty()
			end

			if arg_365_1.time_ >= var_368_3 + var_368_12 and arg_365_1.time_ < var_368_3 + var_368_12 + arg_368_0 then
				arg_365_1.fswtw_.percent = var_368_8

				arg_365_1.fswtw_:SetDirty()
				arg_365_1:ShowNextGo(true)

				arg_365_1.typewritterCharCountI18N = var_368_9
			end

			local var_368_14 = 0

			if var_368_14 < arg_365_1.time_ and arg_365_1.time_ <= var_368_14 + arg_368_0 then
				local var_368_15 = arg_365_1.fswbg_.transform:Find("textbox/adapt/content") or arg_365_1.fswbg_.transform:Find("textbox/content")
				local var_368_16 = var_368_15:GetComponent("Text")
				local var_368_17 = var_368_15:GetComponent("RectTransform")

				var_368_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_368_17.offsetMin = Vector2.New(0, 0)
				var_368_17.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play1101906088 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 1101906088
		arg_369_1.duration_ = 1.533333333332

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play1101906089(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.var_.oldValueTypewriter = arg_369_1.fswtw_.percent

				arg_369_1:ShowNextGo(false)
			end

			local var_372_1 = 23
			local var_372_2 = 1.53333333333333
			local var_372_3 = arg_369_1:GetWordFromCfg(1101906087)
			local var_372_4 = arg_369_1:FormatText(var_372_3.content)
			local var_372_5, var_372_6 = arg_369_1:GetPercentByPara(var_372_4, 2)

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0

				local var_372_7 = var_372_1 <= 0 and var_372_2 or var_372_2 * ((var_372_6 - arg_369_1.typewritterCharCountI18N) / var_372_1)

				if var_372_7 > 0 and var_372_2 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end
			end

			local var_372_8 = 1.53333333333333
			local var_372_9 = math.max(var_372_8, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_9 then
				local var_372_10 = (arg_369_1.time_ - var_372_0) / var_372_9

				arg_369_1.fswtw_.percent = Mathf.Lerp(arg_369_1.var_.oldValueTypewriter, var_372_5, var_372_10)
				arg_369_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_369_1.fswtw_:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_9 and arg_369_1.time_ < var_372_0 + var_372_9 + arg_372_0 then
				arg_369_1.fswtw_.percent = var_372_5

				arg_369_1.fswtw_:SetDirty()
				arg_369_1:ShowNextGo(true)

				arg_369_1.typewritterCharCountI18N = var_372_6
			end
		end
	end,
	Play1101906089 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 1101906089
		arg_373_1.duration_ = 2.999999999999

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play1101906090(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.var_.oldValueTypewriter = arg_373_1.fswtw_.percent

				arg_373_1:ShowNextGo(false)
			end

			local var_376_1 = 22
			local var_376_2 = 3
			local var_376_3 = arg_373_1:GetWordFromCfg(1101906087)
			local var_376_4 = arg_373_1:FormatText(var_376_3.content)
			local var_376_5, var_376_6 = arg_373_1:GetPercentByPara(var_376_4, 3)

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0

				local var_376_7 = var_376_1 <= 0 and var_376_2 or var_376_2 * ((var_376_6 - arg_373_1.typewritterCharCountI18N) / var_376_1)

				if var_376_7 > 0 and var_376_2 < var_376_7 then
					arg_373_1.talkMaxDuration = var_376_7

					if var_376_7 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_7 + var_376_0
					end
				end
			end

			local var_376_8 = 3
			local var_376_9 = math.max(var_376_8, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_9 then
				local var_376_10 = (arg_373_1.time_ - var_376_0) / var_376_9

				arg_373_1.fswtw_.percent = Mathf.Lerp(arg_373_1.var_.oldValueTypewriter, var_376_5, var_376_10)
				arg_373_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_373_1.fswtw_:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_9 and arg_373_1.time_ < var_376_0 + var_376_9 + arg_376_0 then
				arg_373_1.fswtw_.percent = var_376_5

				arg_373_1.fswtw_:SetDirty()
				arg_373_1:ShowNextGo(true)

				arg_373_1.typewritterCharCountI18N = var_376_6
			end
		end
	end,
	Play1101906090 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 1101906090
		arg_377_1.duration_ = 2.999999999999

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play1101906091(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.var_.oldValueTypewriter = arg_377_1.fswtw_.percent

				arg_377_1:ShowNextGo(false)
			end

			local var_380_1 = 31
			local var_380_2 = 3
			local var_380_3 = arg_377_1:GetWordFromCfg(1101906087)
			local var_380_4 = arg_377_1:FormatText(var_380_3.content)
			local var_380_5, var_380_6 = arg_377_1:GetPercentByPara(var_380_4, 4)

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0

				local var_380_7 = var_380_1 <= 0 and var_380_2 or var_380_2 * ((var_380_6 - arg_377_1.typewritterCharCountI18N) / var_380_1)

				if var_380_7 > 0 and var_380_2 < var_380_7 then
					arg_377_1.talkMaxDuration = var_380_7

					if var_380_7 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_7 + var_380_0
					end
				end
			end

			local var_380_8 = 3
			local var_380_9 = math.max(var_380_8, arg_377_1.talkMaxDuration)

			if var_380_0 <= arg_377_1.time_ and arg_377_1.time_ < var_380_0 + var_380_9 then
				local var_380_10 = (arg_377_1.time_ - var_380_0) / var_380_9

				arg_377_1.fswtw_.percent = Mathf.Lerp(arg_377_1.var_.oldValueTypewriter, var_380_5, var_380_10)
				arg_377_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_377_1.fswtw_:SetDirty()
			end

			if arg_377_1.time_ >= var_380_0 + var_380_9 and arg_377_1.time_ < var_380_0 + var_380_9 + arg_380_0 then
				arg_377_1.fswtw_.percent = var_380_5

				arg_377_1.fswtw_:SetDirty()
				arg_377_1:ShowNextGo(true)

				arg_377_1.typewritterCharCountI18N = var_380_6
			end
		end
	end,
	Play1101906091 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 1101906091
		arg_381_1.duration_ = 2.999999999999

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play1101906092(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.var_.oldValueTypewriter = arg_381_1.fswtw_.percent

				arg_381_1:ShowNextGo(false)
			end

			local var_384_1 = 30
			local var_384_2 = 3
			local var_384_3 = arg_381_1:GetWordFromCfg(1101906087)
			local var_384_4 = arg_381_1:FormatText(var_384_3.content)
			local var_384_5, var_384_6 = arg_381_1:GetPercentByPara(var_384_4, 5)

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0

				local var_384_7 = var_384_1 <= 0 and var_384_2 or var_384_2 * ((var_384_6 - arg_381_1.typewritterCharCountI18N) / var_384_1)

				if var_384_7 > 0 and var_384_2 < var_384_7 then
					arg_381_1.talkMaxDuration = var_384_7

					if var_384_7 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_7 + var_384_0
					end
				end
			end

			local var_384_8 = 3
			local var_384_9 = math.max(var_384_8, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_9 then
				local var_384_10 = (arg_381_1.time_ - var_384_0) / var_384_9

				arg_381_1.fswtw_.percent = Mathf.Lerp(arg_381_1.var_.oldValueTypewriter, var_384_5, var_384_10)
				arg_381_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_381_1.fswtw_:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_9 and arg_381_1.time_ < var_384_0 + var_384_9 + arg_384_0 then
				arg_381_1.fswtw_.percent = var_384_5

				arg_381_1.fswtw_:SetDirty()
				arg_381_1:ShowNextGo(true)

				arg_381_1.typewritterCharCountI18N = var_384_6
			end

			local var_384_11 = 0
			local var_384_12 = 1
			local var_384_13 = manager.audio:GetVoiceLength("story_v_out_110190", "1101906091", "story_v_out_110190.awb") / 1000

			if var_384_13 > 0 and var_384_12 < var_384_13 and var_384_13 + var_384_11 > arg_381_1.duration_ then
				local var_384_14 = var_384_13

				arg_381_1.duration_ = var_384_13 + var_384_11
			end

			if var_384_11 < arg_381_1.time_ and arg_381_1.time_ <= var_384_11 + arg_384_0 then
				local var_384_15 = "play"
				local var_384_16 = "voice"

				arg_381_1:AudioAction(var_384_15, var_384_16, "story_v_out_110190", "1101906091", "story_v_out_110190.awb")
			end

			local var_384_17 = 0

			if var_384_17 < arg_381_1.time_ and arg_381_1.time_ <= var_384_17 + arg_384_0 then
				arg_381_1.allBtn_.enabled = false
			end

			local var_384_18 = 2

			if arg_381_1.time_ >= var_384_17 + var_384_18 and arg_381_1.time_ < var_384_17 + var_384_18 + arg_384_0 then
				arg_381_1.allBtn_.enabled = true
			end
		end
	end,
	Play1101906092 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 1101906092
		arg_385_1.duration_ = 3.032999999999

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play1101906093(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.fswbg_:SetActive(true)
				arg_385_1.dialog_:SetActive(false)

				arg_385_1.fswtw_.percent = 0

				local var_388_1 = arg_385_1:GetWordFromCfg(1101906092)
				local var_388_2 = arg_385_1:FormatText(var_388_1.content)

				arg_385_1.fswt_.text = var_388_2

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.fswt_)

				arg_385_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_385_1.fswtw_:SetDirty()

				arg_385_1.typewritterCharCountI18N = 0

				SetActive(arg_385_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_385_1:ShowNextGo(false)
			end

			local var_388_3 = 0.033

			if var_388_3 < arg_385_1.time_ and arg_385_1.time_ <= var_388_3 + arg_388_0 then
				arg_385_1.var_.oldValueTypewriter = arg_385_1.fswtw_.percent

				arg_385_1:ShowNextGo(false)
			end

			local var_388_4 = 20
			local var_388_5 = 3
			local var_388_6 = arg_385_1:GetWordFromCfg(1101906092)
			local var_388_7 = arg_385_1:FormatText(var_388_6.content)
			local var_388_8, var_388_9 = arg_385_1:GetPercentByPara(var_388_7, 1)

			if var_388_3 < arg_385_1.time_ and arg_385_1.time_ <= var_388_3 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0

				local var_388_10 = var_388_4 <= 0 and var_388_5 or var_388_5 * ((var_388_9 - arg_385_1.typewritterCharCountI18N) / var_388_4)

				if var_388_10 > 0 and var_388_5 < var_388_10 then
					arg_385_1.talkMaxDuration = var_388_10

					if var_388_10 + var_388_3 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_10 + var_388_3
					end
				end
			end

			local var_388_11 = 3
			local var_388_12 = math.max(var_388_11, arg_385_1.talkMaxDuration)

			if var_388_3 <= arg_385_1.time_ and arg_385_1.time_ < var_388_3 + var_388_12 then
				local var_388_13 = (arg_385_1.time_ - var_388_3) / var_388_12

				arg_385_1.fswtw_.percent = Mathf.Lerp(arg_385_1.var_.oldValueTypewriter, var_388_8, var_388_13)
				arg_385_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_385_1.fswtw_:SetDirty()
			end

			if arg_385_1.time_ >= var_388_3 + var_388_12 and arg_385_1.time_ < var_388_3 + var_388_12 + arg_388_0 then
				arg_385_1.fswtw_.percent = var_388_8

				arg_385_1.fswtw_:SetDirty()
				arg_385_1:ShowNextGo(true)

				arg_385_1.typewritterCharCountI18N = var_388_9
			end
		end
	end,
	Play1101906093 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 1101906093
		arg_389_1.duration_ = 2.999999999999

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play1101906094(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.var_.oldValueTypewriter = arg_389_1.fswtw_.percent

				arg_389_1:ShowNextGo(false)
			end

			local var_392_1 = 26
			local var_392_2 = 3
			local var_392_3 = arg_389_1:GetWordFromCfg(1101906092)
			local var_392_4 = arg_389_1:FormatText(var_392_3.content)
			local var_392_5, var_392_6 = arg_389_1:GetPercentByPara(var_392_4, 2)

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0

				local var_392_7 = var_392_1 <= 0 and var_392_2 or var_392_2 * ((var_392_6 - arg_389_1.typewritterCharCountI18N) / var_392_1)

				if var_392_7 > 0 and var_392_2 < var_392_7 then
					arg_389_1.talkMaxDuration = var_392_7

					if var_392_7 + var_392_0 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_7 + var_392_0
					end
				end
			end

			local var_392_8 = 3
			local var_392_9 = math.max(var_392_8, arg_389_1.talkMaxDuration)

			if var_392_0 <= arg_389_1.time_ and arg_389_1.time_ < var_392_0 + var_392_9 then
				local var_392_10 = (arg_389_1.time_ - var_392_0) / var_392_9

				arg_389_1.fswtw_.percent = Mathf.Lerp(arg_389_1.var_.oldValueTypewriter, var_392_5, var_392_10)
				arg_389_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_389_1.fswtw_:SetDirty()
			end

			if arg_389_1.time_ >= var_392_0 + var_392_9 and arg_389_1.time_ < var_392_0 + var_392_9 + arg_392_0 then
				arg_389_1.fswtw_.percent = var_392_5

				arg_389_1.fswtw_:SetDirty()
				arg_389_1:ShowNextGo(true)

				arg_389_1.typewritterCharCountI18N = var_392_6
			end

			local var_392_11 = 0
			local var_392_12 = 1
			local var_392_13 = manager.audio:GetVoiceLength("story_v_out_110190", "1101906093", "story_v_out_110190.awb") / 1000

			if var_392_13 > 0 and var_392_12 < var_392_13 and var_392_13 + var_392_11 > arg_389_1.duration_ then
				local var_392_14 = var_392_13

				arg_389_1.duration_ = var_392_13 + var_392_11
			end

			if var_392_11 < arg_389_1.time_ and arg_389_1.time_ <= var_392_11 + arg_392_0 then
				local var_392_15 = "play"
				local var_392_16 = "voice"

				arg_389_1:AudioAction(var_392_15, var_392_16, "story_v_out_110190", "1101906093", "story_v_out_110190.awb")
			end
		end
	end,
	Play1101906094 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 1101906094
		arg_393_1.duration_ = 2.999999999999

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play1101906095(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.var_.oldValueTypewriter = arg_393_1.fswtw_.percent

				arg_393_1:ShowNextGo(false)
			end

			local var_396_1 = 26
			local var_396_2 = 3
			local var_396_3 = arg_393_1:GetWordFromCfg(1101906092)
			local var_396_4 = arg_393_1:FormatText(var_396_3.content)
			local var_396_5, var_396_6 = arg_393_1:GetPercentByPara(var_396_4, 3)

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0

				local var_396_7 = var_396_1 <= 0 and var_396_2 or var_396_2 * ((var_396_6 - arg_393_1.typewritterCharCountI18N) / var_396_1)

				if var_396_7 > 0 and var_396_2 < var_396_7 then
					arg_393_1.talkMaxDuration = var_396_7

					if var_396_7 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_7 + var_396_0
					end
				end
			end

			local var_396_8 = 3
			local var_396_9 = math.max(var_396_8, arg_393_1.talkMaxDuration)

			if var_396_0 <= arg_393_1.time_ and arg_393_1.time_ < var_396_0 + var_396_9 then
				local var_396_10 = (arg_393_1.time_ - var_396_0) / var_396_9

				arg_393_1.fswtw_.percent = Mathf.Lerp(arg_393_1.var_.oldValueTypewriter, var_396_5, var_396_10)
				arg_393_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_393_1.fswtw_:SetDirty()
			end

			if arg_393_1.time_ >= var_396_0 + var_396_9 and arg_393_1.time_ < var_396_0 + var_396_9 + arg_396_0 then
				arg_393_1.fswtw_.percent = var_396_5

				arg_393_1.fswtw_:SetDirty()
				arg_393_1:ShowNextGo(true)

				arg_393_1.typewritterCharCountI18N = var_396_6
			end

			local var_396_11 = 0
			local var_396_12 = 1
			local var_396_13 = manager.audio:GetVoiceLength("story_v_out_110190", "1101906094", "story_v_out_110190.awb") / 1000

			if var_396_13 > 0 and var_396_12 < var_396_13 and var_396_13 + var_396_11 > arg_393_1.duration_ then
				local var_396_14 = var_396_13

				arg_393_1.duration_ = var_396_13 + var_396_11
			end

			if var_396_11 < arg_393_1.time_ and arg_393_1.time_ <= var_396_11 + arg_396_0 then
				local var_396_15 = "play"
				local var_396_16 = "voice"

				arg_393_1:AudioAction(var_396_15, var_396_16, "story_v_out_110190", "1101906094", "story_v_out_110190.awb")
			end
		end
	end,
	Play1101906095 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 1101906095
		arg_397_1.duration_ = 3.016666666666

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play1101906096(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.var_.oldValueTypewriter = arg_397_1.fswtw_.percent

				arg_397_1:ShowNextGo(false)
			end

			local var_400_1 = 23
			local var_400_2 = 3.01666666666667
			local var_400_3 = arg_397_1:GetWordFromCfg(1101906092)
			local var_400_4 = arg_397_1:FormatText(var_400_3.content)
			local var_400_5, var_400_6 = arg_397_1:GetPercentByPara(var_400_4, 4)

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0

				local var_400_7 = var_400_1 <= 0 and var_400_2 or var_400_2 * ((var_400_6 - arg_397_1.typewritterCharCountI18N) / var_400_1)

				if var_400_7 > 0 and var_400_2 < var_400_7 then
					arg_397_1.talkMaxDuration = var_400_7

					if var_400_7 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_7 + var_400_0
					end
				end
			end

			local var_400_8 = 3.01666666666667
			local var_400_9 = math.max(var_400_8, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_9 then
				local var_400_10 = (arg_397_1.time_ - var_400_0) / var_400_9

				arg_397_1.fswtw_.percent = Mathf.Lerp(arg_397_1.var_.oldValueTypewriter, var_400_5, var_400_10)
				arg_397_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_397_1.fswtw_:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_9 and arg_397_1.time_ < var_400_0 + var_400_9 + arg_400_0 then
				arg_397_1.fswtw_.percent = var_400_5

				arg_397_1.fswtw_:SetDirty()
				arg_397_1:ShowNextGo(true)

				arg_397_1.typewritterCharCountI18N = var_400_6
			end

			local var_400_11 = 0
			local var_400_12 = 1
			local var_400_13 = manager.audio:GetVoiceLength("story_v_out_110190", "1101906095", "story_v_out_110190.awb") / 1000

			if var_400_13 > 0 and var_400_12 < var_400_13 and var_400_13 + var_400_11 > arg_397_1.duration_ then
				local var_400_14 = var_400_13

				arg_397_1.duration_ = var_400_13 + var_400_11
			end

			if var_400_11 < arg_397_1.time_ and arg_397_1.time_ <= var_400_11 + arg_400_0 then
				local var_400_15 = "play"
				local var_400_16 = "voice"

				arg_397_1:AudioAction(var_400_15, var_400_16, "story_v_out_110190", "1101906095", "story_v_out_110190.awb")
			end

			local var_400_17 = 0

			if var_400_17 < arg_397_1.time_ and arg_397_1.time_ <= var_400_17 + arg_400_0 then
				arg_397_1.allBtn_.enabled = false
			end

			local var_400_18 = 2

			if arg_397_1.time_ >= var_400_17 + var_400_18 and arg_397_1.time_ < var_400_17 + var_400_18 + arg_400_0 then
				arg_397_1.allBtn_.enabled = true
			end
		end
	end,
	Play1101906096 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 1101906096
		arg_401_1.duration_ = 6.999999999999

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play1101906097(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 1

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.fswbg_:SetActive(false)
				arg_401_1.dialog_:SetActive(true)
				arg_401_1:ShowNextGo(false)
			end

			local var_404_1 = 1
			local var_404_2 = 1

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				local var_404_3 = "play"
				local var_404_4 = "effect"

				arg_401_1:AudioAction(var_404_3, var_404_4, "se_story_122_01", "se_story_122_01_beep", "")
			end

			local var_404_5 = 0

			if var_404_5 < arg_401_1.time_ and arg_401_1.time_ <= var_404_5 + arg_404_0 then
				arg_401_1.mask_.enabled = true
				arg_401_1.mask_.raycastTarget = true

				arg_401_1:SetGaussion(false)
			end

			local var_404_6 = 1

			if var_404_5 <= arg_401_1.time_ and arg_401_1.time_ < var_404_5 + var_404_6 then
				local var_404_7 = (arg_401_1.time_ - var_404_5) / var_404_6
				local var_404_8 = Color.New(0, 0, 0)

				var_404_8.a = Mathf.Lerp(0, 1, var_404_7)
				arg_401_1.mask_.color = var_404_8
			end

			if arg_401_1.time_ >= var_404_5 + var_404_6 and arg_401_1.time_ < var_404_5 + var_404_6 + arg_404_0 then
				local var_404_9 = Color.New(0, 0, 0)

				var_404_9.a = 1
				arg_401_1.mask_.color = var_404_9
			end

			local var_404_10 = 1

			if var_404_10 < arg_401_1.time_ and arg_401_1.time_ <= var_404_10 + arg_404_0 then
				arg_401_1.mask_.enabled = true
				arg_401_1.mask_.raycastTarget = true

				arg_401_1:SetGaussion(false)
			end

			local var_404_11 = 1

			if var_404_10 <= arg_401_1.time_ and arg_401_1.time_ < var_404_10 + var_404_11 then
				local var_404_12 = (arg_401_1.time_ - var_404_10) / var_404_11
				local var_404_13 = Color.New(0, 0, 0)

				var_404_13.a = Mathf.Lerp(1, 0, var_404_12)
				arg_401_1.mask_.color = var_404_13
			end

			if arg_401_1.time_ >= var_404_10 + var_404_11 and arg_401_1.time_ < var_404_10 + var_404_11 + arg_404_0 then
				local var_404_14 = Color.New(0, 0, 0)
				local var_404_15 = 0

				arg_401_1.mask_.enabled = false
				var_404_14.a = var_404_15
				arg_401_1.mask_.color = var_404_14
			end

			if arg_401_1.frameCnt_ <= 1 then
				arg_401_1.dialog_:SetActive(false)
			end

			local var_404_16 = 1.999999999999
			local var_404_17 = 0.625

			if var_404_16 < arg_401_1.time_ and arg_401_1.time_ <= var_404_16 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0

				arg_401_1.dialog_:SetActive(true)

				local var_404_18 = LeanTween.value(arg_401_1.dialog_, 0, 1, 0.3)

				var_404_18:setOnUpdate(LuaHelper.FloatAction(function(arg_405_0)
					arg_401_1.dialogCg_.alpha = arg_405_0
				end))
				var_404_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_401_1.dialog_)
					var_404_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_401_1.duration_ = arg_401_1.duration_ + 0.3

				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_19 = arg_401_1:GetWordFromCfg(1101906096)
				local var_404_20 = arg_401_1:FormatText(var_404_19.content)

				arg_401_1.text_.text = var_404_20

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_21 = 25
				local var_404_22 = utf8.len(var_404_20)
				local var_404_23 = var_404_21 <= 0 and var_404_17 or var_404_17 * (var_404_22 / var_404_21)

				if var_404_23 > 0 and var_404_17 < var_404_23 then
					arg_401_1.talkMaxDuration = var_404_23
					var_404_16 = var_404_16 + 0.3

					if var_404_23 + var_404_16 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_23 + var_404_16
					end
				end

				arg_401_1.text_.text = var_404_20
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_24 = var_404_16 + 0.3
			local var_404_25 = math.max(var_404_17, arg_401_1.talkMaxDuration)

			if var_404_24 <= arg_401_1.time_ and arg_401_1.time_ < var_404_24 + var_404_25 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_24) / var_404_25

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_24 + var_404_25 and arg_401_1.time_ < var_404_24 + var_404_25 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906097 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 1101906097
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play1101906098(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = 0
			local var_410_1 = 0.175

			if var_410_0 < arg_407_1.time_ and arg_407_1.time_ <= var_410_0 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_2 = arg_407_1:FormatText(StoryNameCfg[7].name)

				arg_407_1.leftNameTxt_.text = var_410_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_3 = arg_407_1:GetWordFromCfg(1101906097)
				local var_410_4 = arg_407_1:FormatText(var_410_3.content)

				arg_407_1.text_.text = var_410_4

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_5 = 7
				local var_410_6 = utf8.len(var_410_4)
				local var_410_7 = var_410_5 <= 0 and var_410_1 or var_410_1 * (var_410_6 / var_410_5)

				if var_410_7 > 0 and var_410_1 < var_410_7 then
					arg_407_1.talkMaxDuration = var_410_7

					if var_410_7 + var_410_0 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_7 + var_410_0
					end
				end

				arg_407_1.text_.text = var_410_4
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)
				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_8 = math.max(var_410_1, arg_407_1.talkMaxDuration)

			if var_410_0 <= arg_407_1.time_ and arg_407_1.time_ < var_410_0 + var_410_8 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_0) / var_410_8

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_0 + var_410_8 and arg_407_1.time_ < var_410_0 + var_410_8 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906098 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 1101906098
		arg_411_1.duration_ = 2

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play1101906099(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 0.225

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_2 = arg_411_1:FormatText(StoryNameCfg[13].name)

				arg_411_1.leftNameTxt_.text = var_414_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_3 = arg_411_1:GetWordFromCfg(1101906098)
				local var_414_4 = arg_411_1:FormatText(var_414_3.content)

				arg_411_1.text_.text = var_414_4

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_5 = 9
				local var_414_6 = utf8.len(var_414_4)
				local var_414_7 = var_414_5 <= 0 and var_414_1 or var_414_1 * (var_414_6 / var_414_5)

				if var_414_7 > 0 and var_414_1 < var_414_7 then
					arg_411_1.talkMaxDuration = var_414_7

					if var_414_7 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_7 + var_414_0
					end
				end

				arg_411_1.text_.text = var_414_4
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906098", "story_v_side_new_1101906.awb") ~= 0 then
					local var_414_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906098", "story_v_side_new_1101906.awb") / 1000

					if var_414_8 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_8 + var_414_0
					end

					if var_414_3.prefab_name ~= "" and arg_411_1.actors_[var_414_3.prefab_name] ~= nil then
						local var_414_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_3.prefab_name].transform, "story_v_side_new_1101906", "1101906098", "story_v_side_new_1101906.awb")

						arg_411_1:RecordAudio("1101906098", var_414_9)
						arg_411_1:RecordAudio("1101906098", var_414_9)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906098", "story_v_side_new_1101906.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906098", "story_v_side_new_1101906.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_10 = math.max(var_414_1, arg_411_1.talkMaxDuration)

			if var_414_0 <= arg_411_1.time_ and arg_411_1.time_ < var_414_0 + var_414_10 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_0) / var_414_10

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_0 + var_414_10 and arg_411_1.time_ < var_414_0 + var_414_10 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906099 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 1101906099
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play1101906100(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.bgs_.R1902.transform
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 then
				arg_415_1.var_.moveOldPosR1902 = var_418_0.localPosition
			end

			local var_418_2 = 3.8

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2
				local var_418_4 = Vector3.New(0, 1, 5.5)

				var_418_0.localPosition = Vector3.Lerp(arg_415_1.var_.moveOldPosR1902, var_418_4, var_418_3)
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 then
				var_418_0.localPosition = Vector3.New(0, 1, 5.5)
			end

			local var_418_5 = 0

			if var_418_5 < arg_415_1.time_ and arg_415_1.time_ <= var_418_5 + arg_418_0 then
				arg_415_1.allBtn_.enabled = false
			end

			local var_418_6 = 3.8

			if arg_415_1.time_ >= var_418_5 + var_418_6 and arg_415_1.time_ < var_418_5 + var_418_6 + arg_418_0 then
				arg_415_1.allBtn_.enabled = true
			end

			local var_418_7 = 0
			local var_418_8 = 1.1

			if var_418_7 < arg_415_1.time_ and arg_415_1.time_ <= var_418_7 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, false)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_9 = arg_415_1:GetWordFromCfg(1101906099)
				local var_418_10 = arg_415_1:FormatText(var_418_9.content)

				arg_415_1.text_.text = var_418_10

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_11 = 44
				local var_418_12 = utf8.len(var_418_10)
				local var_418_13 = var_418_11 <= 0 and var_418_8 or var_418_8 * (var_418_12 / var_418_11)

				if var_418_13 > 0 and var_418_8 < var_418_13 then
					arg_415_1.talkMaxDuration = var_418_13

					if var_418_13 + var_418_7 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_13 + var_418_7
					end
				end

				arg_415_1.text_.text = var_418_10
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_14 = math.max(var_418_8, arg_415_1.talkMaxDuration)

			if var_418_7 <= arg_415_1.time_ and arg_415_1.time_ < var_418_7 + var_418_14 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_7) / var_418_14

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_7 + var_418_14 and arg_415_1.time_ < var_418_7 + var_418_14 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906100 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 1101906100
		arg_419_1.duration_ = 3.1

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play1101906101(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = 0
			local var_422_1 = 0.275

			if var_422_0 < arg_419_1.time_ and arg_419_1.time_ <= var_422_0 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_2 = arg_419_1:FormatText(StoryNameCfg[13].name)

				arg_419_1.leftNameTxt_.text = var_422_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_3 = arg_419_1:GetWordFromCfg(1101906100)
				local var_422_4 = arg_419_1:FormatText(var_422_3.content)

				arg_419_1.text_.text = var_422_4

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_5 = 11
				local var_422_6 = utf8.len(var_422_4)
				local var_422_7 = var_422_5 <= 0 and var_422_1 or var_422_1 * (var_422_6 / var_422_5)

				if var_422_7 > 0 and var_422_1 < var_422_7 then
					arg_419_1.talkMaxDuration = var_422_7

					if var_422_7 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_7 + var_422_0
					end
				end

				arg_419_1.text_.text = var_422_4
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906100", "story_v_side_new_1101906.awb") ~= 0 then
					local var_422_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906100", "story_v_side_new_1101906.awb") / 1000

					if var_422_8 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_8 + var_422_0
					end

					if var_422_3.prefab_name ~= "" and arg_419_1.actors_[var_422_3.prefab_name] ~= nil then
						local var_422_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_3.prefab_name].transform, "story_v_side_new_1101906", "1101906100", "story_v_side_new_1101906.awb")

						arg_419_1:RecordAudio("1101906100", var_422_9)
						arg_419_1:RecordAudio("1101906100", var_422_9)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906100", "story_v_side_new_1101906.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906100", "story_v_side_new_1101906.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_10 = math.max(var_422_1, arg_419_1.talkMaxDuration)

			if var_422_0 <= arg_419_1.time_ and arg_419_1.time_ < var_422_0 + var_422_10 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_0) / var_422_10

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_0 + var_422_10 and arg_419_1.time_ < var_422_0 + var_422_10 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906101 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 1101906101
		arg_423_1.duration_ = 5

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play1101906102(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0
			local var_426_1 = 0.55

			if var_426_0 < arg_423_1.time_ and arg_423_1.time_ <= var_426_0 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, false)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_2 = arg_423_1:GetWordFromCfg(1101906101)
				local var_426_3 = arg_423_1:FormatText(var_426_2.content)

				arg_423_1.text_.text = var_426_3

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_4 = 22
				local var_426_5 = utf8.len(var_426_3)
				local var_426_6 = var_426_4 <= 0 and var_426_1 or var_426_1 * (var_426_5 / var_426_4)

				if var_426_6 > 0 and var_426_1 < var_426_6 then
					arg_423_1.talkMaxDuration = var_426_6

					if var_426_6 + var_426_0 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_6 + var_426_0
					end
				end

				arg_423_1.text_.text = var_426_3
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)
				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_7 = math.max(var_426_1, arg_423_1.talkMaxDuration)

			if var_426_0 <= arg_423_1.time_ and arg_423_1.time_ < var_426_0 + var_426_7 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_0) / var_426_7

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_0 + var_426_7 and arg_423_1.time_ < var_426_0 + var_426_7 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906102 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 1101906102
		arg_427_1.duration_ = 5

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play1101906103(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 1.275

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, false)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_2 = arg_427_1:GetWordFromCfg(1101906102)
				local var_430_3 = arg_427_1:FormatText(var_430_2.content)

				arg_427_1.text_.text = var_430_3

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_4 = 51
				local var_430_5 = utf8.len(var_430_3)
				local var_430_6 = var_430_4 <= 0 and var_430_1 or var_430_1 * (var_430_5 / var_430_4)

				if var_430_6 > 0 and var_430_1 < var_430_6 then
					arg_427_1.talkMaxDuration = var_430_6

					if var_430_6 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_6 + var_430_0
					end
				end

				arg_427_1.text_.text = var_430_3
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)
				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_7 = math.max(var_430_1, arg_427_1.talkMaxDuration)

			if var_430_0 <= arg_427_1.time_ and arg_427_1.time_ < var_430_0 + var_430_7 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_0) / var_430_7

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_0 + var_430_7 and arg_427_1.time_ < var_430_0 + var_430_7 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906103 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 1101906103
		arg_431_1.duration_ = 9

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play1101906104(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = 2

			if var_434_0 < arg_431_1.time_ and arg_431_1.time_ <= var_434_0 + arg_434_0 then
				local var_434_1 = manager.ui.mainCamera.transform.localPosition
				local var_434_2 = Vector3.New(0, 0, 10) + Vector3.New(var_434_1.x, var_434_1.y, 0)
				local var_434_3 = arg_431_1.bgs_.B02f

				var_434_3.transform.localPosition = var_434_2
				var_434_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_434_4 = var_434_3:GetComponent("SpriteRenderer")

				if var_434_4 and var_434_4.sprite then
					local var_434_5 = (var_434_3.transform.localPosition - var_434_1).z
					local var_434_6 = manager.ui.mainCameraCom_
					local var_434_7 = 2 * var_434_5 * Mathf.Tan(var_434_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_434_8 = var_434_7 * var_434_6.aspect
					local var_434_9 = var_434_4.sprite.bounds.size.x
					local var_434_10 = var_434_4.sprite.bounds.size.y
					local var_434_11 = var_434_8 / var_434_9
					local var_434_12 = var_434_7 / var_434_10
					local var_434_13 = var_434_12 < var_434_11 and var_434_11 or var_434_12

					var_434_3.transform.localScale = Vector3.New(var_434_13, var_434_13, 0)
				end

				for iter_434_0, iter_434_1 in pairs(arg_431_1.bgs_) do
					if iter_434_0 ~= "B02f" then
						iter_434_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_434_14 = 0

			if var_434_14 < arg_431_1.time_ and arg_431_1.time_ <= var_434_14 + arg_434_0 then
				arg_431_1.mask_.enabled = true
				arg_431_1.mask_.raycastTarget = true

				arg_431_1:SetGaussion(false)
			end

			local var_434_15 = 2

			if var_434_14 <= arg_431_1.time_ and arg_431_1.time_ < var_434_14 + var_434_15 then
				local var_434_16 = (arg_431_1.time_ - var_434_14) / var_434_15
				local var_434_17 = Color.New(0, 0, 0)

				var_434_17.a = Mathf.Lerp(0, 1, var_434_16)
				arg_431_1.mask_.color = var_434_17
			end

			if arg_431_1.time_ >= var_434_14 + var_434_15 and arg_431_1.time_ < var_434_14 + var_434_15 + arg_434_0 then
				local var_434_18 = Color.New(0, 0, 0)

				var_434_18.a = 1
				arg_431_1.mask_.color = var_434_18
			end

			local var_434_19 = 2

			if var_434_19 < arg_431_1.time_ and arg_431_1.time_ <= var_434_19 + arg_434_0 then
				arg_431_1.mask_.enabled = true
				arg_431_1.mask_.raycastTarget = true

				arg_431_1:SetGaussion(false)
			end

			local var_434_20 = 2

			if var_434_19 <= arg_431_1.time_ and arg_431_1.time_ < var_434_19 + var_434_20 then
				local var_434_21 = (arg_431_1.time_ - var_434_19) / var_434_20
				local var_434_22 = Color.New(0, 0, 0)

				var_434_22.a = Mathf.Lerp(1, 0, var_434_21)
				arg_431_1.mask_.color = var_434_22
			end

			if arg_431_1.time_ >= var_434_19 + var_434_20 and arg_431_1.time_ < var_434_19 + var_434_20 + arg_434_0 then
				local var_434_23 = Color.New(0, 0, 0)
				local var_434_24 = 0

				arg_431_1.mask_.enabled = false
				var_434_23.a = var_434_24
				arg_431_1.mask_.color = var_434_23
			end

			local var_434_25 = 0
			local var_434_26 = 0.166666666666667

			if var_434_25 < arg_431_1.time_ and arg_431_1.time_ <= var_434_25 + arg_434_0 then
				local var_434_27 = "play"
				local var_434_28 = "music"

				arg_431_1:AudioAction(var_434_27, var_434_28, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_434_29 = 0.3
			local var_434_30 = 1

			if var_434_29 < arg_431_1.time_ and arg_431_1.time_ <= var_434_29 + arg_434_0 then
				local var_434_31 = "play"
				local var_434_32 = "music"

				arg_431_1:AudioAction(var_434_31, var_434_32, "bgm_activity_3_0_story_quiet", "bgm_activity_3_0_story_quiet", "bgm_activity_3_0_story_quiet.awb")
			end

			if arg_431_1.frameCnt_ <= 1 then
				arg_431_1.dialog_:SetActive(false)
			end

			local var_434_33 = 4
			local var_434_34 = 1.2

			if var_434_33 < arg_431_1.time_ and arg_431_1.time_ <= var_434_33 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0

				arg_431_1.dialog_:SetActive(true)

				local var_434_35 = LeanTween.value(arg_431_1.dialog_, 0, 1, 0.3)

				var_434_35:setOnUpdate(LuaHelper.FloatAction(function(arg_435_0)
					arg_431_1.dialogCg_.alpha = arg_435_0
				end))
				var_434_35:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_431_1.dialog_)
					var_434_35:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_431_1.duration_ = arg_431_1.duration_ + 0.3

				SetActive(arg_431_1.leftNameGo_, false)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_36 = arg_431_1:GetWordFromCfg(1101906103)
				local var_434_37 = arg_431_1:FormatText(var_434_36.content)

				arg_431_1.text_.text = var_434_37

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_38 = 48
				local var_434_39 = utf8.len(var_434_37)
				local var_434_40 = var_434_38 <= 0 and var_434_34 or var_434_34 * (var_434_39 / var_434_38)

				if var_434_40 > 0 and var_434_34 < var_434_40 then
					arg_431_1.talkMaxDuration = var_434_40
					var_434_33 = var_434_33 + 0.3

					if var_434_40 + var_434_33 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_40 + var_434_33
					end
				end

				arg_431_1.text_.text = var_434_37
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_41 = var_434_33 + 0.3
			local var_434_42 = math.max(var_434_34, arg_431_1.talkMaxDuration)

			if var_434_41 <= arg_431_1.time_ and arg_431_1.time_ < var_434_41 + var_434_42 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_41) / var_434_42

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_41 + var_434_42 and arg_431_1.time_ < var_434_41 + var_434_42 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906104 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 1101906104
		arg_437_1.duration_ = 3

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play1101906105(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1019ui_story"].transform
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 then
				arg_437_1.var_.moveOldPos1019ui_story = var_440_0.localPosition
			end

			local var_440_2 = 0.001

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2
				local var_440_4 = Vector3.New(0, -1.08, -5.9)

				var_440_0.localPosition = Vector3.Lerp(arg_437_1.var_.moveOldPos1019ui_story, var_440_4, var_440_3)

				local var_440_5 = manager.ui.mainCamera.transform.position - var_440_0.position

				var_440_0.forward = Vector3.New(var_440_5.x, var_440_5.y, var_440_5.z)

				local var_440_6 = var_440_0.localEulerAngles

				var_440_6.z = 0
				var_440_6.x = 0
				var_440_0.localEulerAngles = var_440_6
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 then
				var_440_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_440_7 = manager.ui.mainCamera.transform.position - var_440_0.position

				var_440_0.forward = Vector3.New(var_440_7.x, var_440_7.y, var_440_7.z)

				local var_440_8 = var_440_0.localEulerAngles

				var_440_8.z = 0
				var_440_8.x = 0
				var_440_0.localEulerAngles = var_440_8
			end

			local var_440_9 = arg_437_1.actors_["1019ui_story"]
			local var_440_10 = 0

			if var_440_10 < arg_437_1.time_ and arg_437_1.time_ <= var_440_10 + arg_440_0 and arg_437_1.var_.characterEffect1019ui_story == nil then
				arg_437_1.var_.characterEffect1019ui_story = var_440_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_11 = 0.200000002980232

			if var_440_10 <= arg_437_1.time_ and arg_437_1.time_ < var_440_10 + var_440_11 then
				local var_440_12 = (arg_437_1.time_ - var_440_10) / var_440_11

				if arg_437_1.var_.characterEffect1019ui_story then
					arg_437_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_437_1.time_ >= var_440_10 + var_440_11 and arg_437_1.time_ < var_440_10 + var_440_11 + arg_440_0 and arg_437_1.var_.characterEffect1019ui_story then
				arg_437_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_440_13 = 0

			if var_440_13 < arg_437_1.time_ and arg_437_1.time_ <= var_440_13 + arg_440_0 then
				arg_437_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_440_14 = 0

			if var_440_14 < arg_437_1.time_ and arg_437_1.time_ <= var_440_14 + arg_440_0 then
				arg_437_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_440_15 = 0
			local var_440_16 = 0.325

			if var_440_15 < arg_437_1.time_ and arg_437_1.time_ <= var_440_15 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_17 = arg_437_1:FormatText(StoryNameCfg[13].name)

				arg_437_1.leftNameTxt_.text = var_440_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_18 = arg_437_1:GetWordFromCfg(1101906104)
				local var_440_19 = arg_437_1:FormatText(var_440_18.content)

				arg_437_1.text_.text = var_440_19

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_20 = 13
				local var_440_21 = utf8.len(var_440_19)
				local var_440_22 = var_440_20 <= 0 and var_440_16 or var_440_16 * (var_440_21 / var_440_20)

				if var_440_22 > 0 and var_440_16 < var_440_22 then
					arg_437_1.talkMaxDuration = var_440_22

					if var_440_22 + var_440_15 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_22 + var_440_15
					end
				end

				arg_437_1.text_.text = var_440_19
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906104", "story_v_side_new_1101906.awb") ~= 0 then
					local var_440_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906104", "story_v_side_new_1101906.awb") / 1000

					if var_440_23 + var_440_15 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_23 + var_440_15
					end

					if var_440_18.prefab_name ~= "" and arg_437_1.actors_[var_440_18.prefab_name] ~= nil then
						local var_440_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_18.prefab_name].transform, "story_v_side_new_1101906", "1101906104", "story_v_side_new_1101906.awb")

						arg_437_1:RecordAudio("1101906104", var_440_24)
						arg_437_1:RecordAudio("1101906104", var_440_24)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906104", "story_v_side_new_1101906.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906104", "story_v_side_new_1101906.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_25 = math.max(var_440_16, arg_437_1.talkMaxDuration)

			if var_440_15 <= arg_437_1.time_ and arg_437_1.time_ < var_440_15 + var_440_25 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_15) / var_440_25

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_15 + var_440_25 and arg_437_1.time_ < var_440_15 + var_440_25 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906105 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 1101906105
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play1101906106(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["1019ui_story"]
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 and arg_441_1.var_.characterEffect1019ui_story == nil then
				arg_441_1.var_.characterEffect1019ui_story = var_444_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_2 = 0.200000002980232

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2

				if arg_441_1.var_.characterEffect1019ui_story then
					local var_444_4 = Mathf.Lerp(0, 0.5, var_444_3)

					arg_441_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_441_1.var_.characterEffect1019ui_story.fillRatio = var_444_4
				end
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 and arg_441_1.var_.characterEffect1019ui_story then
				local var_444_5 = 0.5

				arg_441_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_441_1.var_.characterEffect1019ui_story.fillRatio = var_444_5
			end

			local var_444_6 = 0
			local var_444_7 = 0.65

			if var_444_6 < arg_441_1.time_ and arg_441_1.time_ <= var_444_6 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_8 = arg_441_1:FormatText(StoryNameCfg[7].name)

				arg_441_1.leftNameTxt_.text = var_444_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_9 = arg_441_1:GetWordFromCfg(1101906105)
				local var_444_10 = arg_441_1:FormatText(var_444_9.content)

				arg_441_1.text_.text = var_444_10

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_11 = 26
				local var_444_12 = utf8.len(var_444_10)
				local var_444_13 = var_444_11 <= 0 and var_444_7 or var_444_7 * (var_444_12 / var_444_11)

				if var_444_13 > 0 and var_444_7 < var_444_13 then
					arg_441_1.talkMaxDuration = var_444_13

					if var_444_13 + var_444_6 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_13 + var_444_6
					end
				end

				arg_441_1.text_.text = var_444_10
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)
				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_14 = math.max(var_444_7, arg_441_1.talkMaxDuration)

			if var_444_6 <= arg_441_1.time_ and arg_441_1.time_ < var_444_6 + var_444_14 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_6) / var_444_14

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_6 + var_444_14 and arg_441_1.time_ < var_444_6 + var_444_14 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906106 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 1101906106
		arg_445_1.duration_ = 5

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play1101906107(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = 0
			local var_448_1 = 0.675

			if var_448_0 < arg_445_1.time_ and arg_445_1.time_ <= var_448_0 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_2 = arg_445_1:FormatText(StoryNameCfg[7].name)

				arg_445_1.leftNameTxt_.text = var_448_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_3 = arg_445_1:GetWordFromCfg(1101906106)
				local var_448_4 = arg_445_1:FormatText(var_448_3.content)

				arg_445_1.text_.text = var_448_4

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_5 = 27
				local var_448_6 = utf8.len(var_448_4)
				local var_448_7 = var_448_5 <= 0 and var_448_1 or var_448_1 * (var_448_6 / var_448_5)

				if var_448_7 > 0 and var_448_1 < var_448_7 then
					arg_445_1.talkMaxDuration = var_448_7

					if var_448_7 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_7 + var_448_0
					end
				end

				arg_445_1.text_.text = var_448_4
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)
				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_8 = math.max(var_448_1, arg_445_1.talkMaxDuration)

			if var_448_0 <= arg_445_1.time_ and arg_445_1.time_ < var_448_0 + var_448_8 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_0) / var_448_8

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_0 + var_448_8 and arg_445_1.time_ < var_448_0 + var_448_8 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906107 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 1101906107
		arg_449_1.duration_ = 8.3

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play1101906108(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["1019ui_story"]
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 and arg_449_1.var_.characterEffect1019ui_story == nil then
				arg_449_1.var_.characterEffect1019ui_story = var_452_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_2 = 0.200000002980232

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_2 then
				local var_452_3 = (arg_449_1.time_ - var_452_1) / var_452_2

				if arg_449_1.var_.characterEffect1019ui_story then
					arg_449_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 and arg_449_1.var_.characterEffect1019ui_story then
				arg_449_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_452_4 = 0
			local var_452_5 = 0.7

			if var_452_4 < arg_449_1.time_ and arg_449_1.time_ <= var_452_4 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_6 = arg_449_1:FormatText(StoryNameCfg[13].name)

				arg_449_1.leftNameTxt_.text = var_452_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_7 = arg_449_1:GetWordFromCfg(1101906107)
				local var_452_8 = arg_449_1:FormatText(var_452_7.content)

				arg_449_1.text_.text = var_452_8

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_9 = 28
				local var_452_10 = utf8.len(var_452_8)
				local var_452_11 = var_452_9 <= 0 and var_452_5 or var_452_5 * (var_452_10 / var_452_9)

				if var_452_11 > 0 and var_452_5 < var_452_11 then
					arg_449_1.talkMaxDuration = var_452_11

					if var_452_11 + var_452_4 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_11 + var_452_4
					end
				end

				arg_449_1.text_.text = var_452_8
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906107", "story_v_side_new_1101906.awb") ~= 0 then
					local var_452_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906107", "story_v_side_new_1101906.awb") / 1000

					if var_452_12 + var_452_4 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_12 + var_452_4
					end

					if var_452_7.prefab_name ~= "" and arg_449_1.actors_[var_452_7.prefab_name] ~= nil then
						local var_452_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_7.prefab_name].transform, "story_v_side_new_1101906", "1101906107", "story_v_side_new_1101906.awb")

						arg_449_1:RecordAudio("1101906107", var_452_13)
						arg_449_1:RecordAudio("1101906107", var_452_13)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906107", "story_v_side_new_1101906.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906107", "story_v_side_new_1101906.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_14 = math.max(var_452_5, arg_449_1.talkMaxDuration)

			if var_452_4 <= arg_449_1.time_ and arg_449_1.time_ < var_452_4 + var_452_14 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_4) / var_452_14

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_4 + var_452_14 and arg_449_1.time_ < var_452_4 + var_452_14 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906108 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 1101906108
		arg_453_1.duration_ = 5

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play1101906109(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["1019ui_story"]
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 and arg_453_1.var_.characterEffect1019ui_story == nil then
				arg_453_1.var_.characterEffect1019ui_story = var_456_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_2 = 0.200000002980232

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2

				if arg_453_1.var_.characterEffect1019ui_story then
					local var_456_4 = Mathf.Lerp(0, 0.5, var_456_3)

					arg_453_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_453_1.var_.characterEffect1019ui_story.fillRatio = var_456_4
				end
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 and arg_453_1.var_.characterEffect1019ui_story then
				local var_456_5 = 0.5

				arg_453_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_453_1.var_.characterEffect1019ui_story.fillRatio = var_456_5
			end

			local var_456_6 = 0
			local var_456_7 = 0.925

			if var_456_6 < arg_453_1.time_ and arg_453_1.time_ <= var_456_6 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_8 = arg_453_1:FormatText(StoryNameCfg[7].name)

				arg_453_1.leftNameTxt_.text = var_456_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_9 = arg_453_1:GetWordFromCfg(1101906108)
				local var_456_10 = arg_453_1:FormatText(var_456_9.content)

				arg_453_1.text_.text = var_456_10

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_11 = 37
				local var_456_12 = utf8.len(var_456_10)
				local var_456_13 = var_456_11 <= 0 and var_456_7 or var_456_7 * (var_456_12 / var_456_11)

				if var_456_13 > 0 and var_456_7 < var_456_13 then
					arg_453_1.talkMaxDuration = var_456_13

					if var_456_13 + var_456_6 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_13 + var_456_6
					end
				end

				arg_453_1.text_.text = var_456_10
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)
				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_14 = math.max(var_456_7, arg_453_1.talkMaxDuration)

			if var_456_6 <= arg_453_1.time_ and arg_453_1.time_ < var_456_6 + var_456_14 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_6) / var_456_14

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_6 + var_456_14 and arg_453_1.time_ < var_456_6 + var_456_14 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906109 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 1101906109
		arg_457_1.duration_ = 6.466

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play1101906110(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1019ui_story"].transform
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 then
				arg_457_1.var_.moveOldPos1019ui_story = var_460_0.localPosition
			end

			local var_460_2 = 0.001

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2
				local var_460_4 = Vector3.New(0, -1.08, -5.9)

				var_460_0.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos1019ui_story, var_460_4, var_460_3)

				local var_460_5 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_5.x, var_460_5.y, var_460_5.z)

				local var_460_6 = var_460_0.localEulerAngles

				var_460_6.z = 0
				var_460_6.x = 0
				var_460_0.localEulerAngles = var_460_6
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 then
				var_460_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_460_7 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_7.x, var_460_7.y, var_460_7.z)

				local var_460_8 = var_460_0.localEulerAngles

				var_460_8.z = 0
				var_460_8.x = 0
				var_460_0.localEulerAngles = var_460_8
			end

			local var_460_9 = arg_457_1.actors_["1019ui_story"]
			local var_460_10 = 0

			if var_460_10 < arg_457_1.time_ and arg_457_1.time_ <= var_460_10 + arg_460_0 and arg_457_1.var_.characterEffect1019ui_story == nil then
				arg_457_1.var_.characterEffect1019ui_story = var_460_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_11 = 0.200000002980232

			if var_460_10 <= arg_457_1.time_ and arg_457_1.time_ < var_460_10 + var_460_11 then
				local var_460_12 = (arg_457_1.time_ - var_460_10) / var_460_11

				if arg_457_1.var_.characterEffect1019ui_story then
					arg_457_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_457_1.time_ >= var_460_10 + var_460_11 and arg_457_1.time_ < var_460_10 + var_460_11 + arg_460_0 and arg_457_1.var_.characterEffect1019ui_story then
				arg_457_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_460_13 = 0

			if var_460_13 < arg_457_1.time_ and arg_457_1.time_ <= var_460_13 + arg_460_0 then
				arg_457_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_460_14 = 0

			if var_460_14 < arg_457_1.time_ and arg_457_1.time_ <= var_460_14 + arg_460_0 then
				arg_457_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_460_15 = 0
			local var_460_16 = 0.6

			if var_460_15 < arg_457_1.time_ and arg_457_1.time_ <= var_460_15 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_17 = arg_457_1:FormatText(StoryNameCfg[13].name)

				arg_457_1.leftNameTxt_.text = var_460_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_18 = arg_457_1:GetWordFromCfg(1101906109)
				local var_460_19 = arg_457_1:FormatText(var_460_18.content)

				arg_457_1.text_.text = var_460_19

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_20 = 24
				local var_460_21 = utf8.len(var_460_19)
				local var_460_22 = var_460_20 <= 0 and var_460_16 or var_460_16 * (var_460_21 / var_460_20)

				if var_460_22 > 0 and var_460_16 < var_460_22 then
					arg_457_1.talkMaxDuration = var_460_22

					if var_460_22 + var_460_15 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_22 + var_460_15
					end
				end

				arg_457_1.text_.text = var_460_19
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906109", "story_v_side_new_1101906.awb") ~= 0 then
					local var_460_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906109", "story_v_side_new_1101906.awb") / 1000

					if var_460_23 + var_460_15 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_23 + var_460_15
					end

					if var_460_18.prefab_name ~= "" and arg_457_1.actors_[var_460_18.prefab_name] ~= nil then
						local var_460_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_18.prefab_name].transform, "story_v_side_new_1101906", "1101906109", "story_v_side_new_1101906.awb")

						arg_457_1:RecordAudio("1101906109", var_460_24)
						arg_457_1:RecordAudio("1101906109", var_460_24)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906109", "story_v_side_new_1101906.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906109", "story_v_side_new_1101906.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_25 = math.max(var_460_16, arg_457_1.talkMaxDuration)

			if var_460_15 <= arg_457_1.time_ and arg_457_1.time_ < var_460_15 + var_460_25 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_15) / var_460_25

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_15 + var_460_25 and arg_457_1.time_ < var_460_15 + var_460_25 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906110 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 1101906110
		arg_461_1.duration_ = 4.033

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play1101906111(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = 0
			local var_464_1 = 0.45

			if var_464_0 < arg_461_1.time_ and arg_461_1.time_ <= var_464_0 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_2 = arg_461_1:FormatText(StoryNameCfg[13].name)

				arg_461_1.leftNameTxt_.text = var_464_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_3 = arg_461_1:GetWordFromCfg(1101906110)
				local var_464_4 = arg_461_1:FormatText(var_464_3.content)

				arg_461_1.text_.text = var_464_4

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_5 = 18
				local var_464_6 = utf8.len(var_464_4)
				local var_464_7 = var_464_5 <= 0 and var_464_1 or var_464_1 * (var_464_6 / var_464_5)

				if var_464_7 > 0 and var_464_1 < var_464_7 then
					arg_461_1.talkMaxDuration = var_464_7

					if var_464_7 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_7 + var_464_0
					end
				end

				arg_461_1.text_.text = var_464_4
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906110", "story_v_side_new_1101906.awb") ~= 0 then
					local var_464_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906110", "story_v_side_new_1101906.awb") / 1000

					if var_464_8 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_8 + var_464_0
					end

					if var_464_3.prefab_name ~= "" and arg_461_1.actors_[var_464_3.prefab_name] ~= nil then
						local var_464_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_3.prefab_name].transform, "story_v_side_new_1101906", "1101906110", "story_v_side_new_1101906.awb")

						arg_461_1:RecordAudio("1101906110", var_464_9)
						arg_461_1:RecordAudio("1101906110", var_464_9)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906110", "story_v_side_new_1101906.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906110", "story_v_side_new_1101906.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_10 = math.max(var_464_1, arg_461_1.talkMaxDuration)

			if var_464_0 <= arg_461_1.time_ and arg_461_1.time_ < var_464_0 + var_464_10 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_0) / var_464_10

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_0 + var_464_10 and arg_461_1.time_ < var_464_0 + var_464_10 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906111 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 1101906111
		arg_465_1.duration_ = 5

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play1101906112(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["1019ui_story"]
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 and arg_465_1.var_.characterEffect1019ui_story == nil then
				arg_465_1.var_.characterEffect1019ui_story = var_468_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_2 = 0.200000002980232

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2

				if arg_465_1.var_.characterEffect1019ui_story then
					local var_468_4 = Mathf.Lerp(0, 0.5, var_468_3)

					arg_465_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_465_1.var_.characterEffect1019ui_story.fillRatio = var_468_4
				end
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 and arg_465_1.var_.characterEffect1019ui_story then
				local var_468_5 = 0.5

				arg_465_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_465_1.var_.characterEffect1019ui_story.fillRatio = var_468_5
			end

			local var_468_6 = 0
			local var_468_7 = 0.45

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

				local var_468_9 = arg_465_1:GetWordFromCfg(1101906111)
				local var_468_10 = arg_465_1:FormatText(var_468_9.content)

				arg_465_1.text_.text = var_468_10

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_11 = 18
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
	Play1101906112 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 1101906112
		arg_469_1.duration_ = 1.166

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play1101906113(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1019ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect1019ui_story == nil then
				arg_469_1.var_.characterEffect1019ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.200000002980232

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect1019ui_story then
					arg_469_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect1019ui_story then
				arg_469_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_472_4 = 0
			local var_472_5 = 0.125

			if var_472_4 < arg_469_1.time_ and arg_469_1.time_ <= var_472_4 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_6 = arg_469_1:FormatText(StoryNameCfg[13].name)

				arg_469_1.leftNameTxt_.text = var_472_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_7 = arg_469_1:GetWordFromCfg(1101906112)
				local var_472_8 = arg_469_1:FormatText(var_472_7.content)

				arg_469_1.text_.text = var_472_8

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_9 = 5
				local var_472_10 = utf8.len(var_472_8)
				local var_472_11 = var_472_9 <= 0 and var_472_5 or var_472_5 * (var_472_10 / var_472_9)

				if var_472_11 > 0 and var_472_5 < var_472_11 then
					arg_469_1.talkMaxDuration = var_472_11

					if var_472_11 + var_472_4 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_11 + var_472_4
					end
				end

				arg_469_1.text_.text = var_472_8
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906112", "story_v_side_new_1101906.awb") ~= 0 then
					local var_472_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906112", "story_v_side_new_1101906.awb") / 1000

					if var_472_12 + var_472_4 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_12 + var_472_4
					end

					if var_472_7.prefab_name ~= "" and arg_469_1.actors_[var_472_7.prefab_name] ~= nil then
						local var_472_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_7.prefab_name].transform, "story_v_side_new_1101906", "1101906112", "story_v_side_new_1101906.awb")

						arg_469_1:RecordAudio("1101906112", var_472_13)
						arg_469_1:RecordAudio("1101906112", var_472_13)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906112", "story_v_side_new_1101906.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906112", "story_v_side_new_1101906.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_14 = math.max(var_472_5, arg_469_1.talkMaxDuration)

			if var_472_4 <= arg_469_1.time_ and arg_469_1.time_ < var_472_4 + var_472_14 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_4) / var_472_14

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_4 + var_472_14 and arg_469_1.time_ < var_472_4 + var_472_14 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906113 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 1101906113
		arg_473_1.duration_ = 5

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play1101906114(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = 0

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_2")
			end

			local var_476_1 = 0
			local var_476_2 = 0.875

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, false)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_3 = arg_473_1:GetWordFromCfg(1101906113)
				local var_476_4 = arg_473_1:FormatText(var_476_3.content)

				arg_473_1.text_.text = var_476_4

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_5 = 35
				local var_476_6 = utf8.len(var_476_4)
				local var_476_7 = var_476_5 <= 0 and var_476_2 or var_476_2 * (var_476_6 / var_476_5)

				if var_476_7 > 0 and var_476_2 < var_476_7 then
					arg_473_1.talkMaxDuration = var_476_7

					if var_476_7 + var_476_1 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_7 + var_476_1
					end
				end

				arg_473_1.text_.text = var_476_4
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)
				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_8 = math.max(var_476_2, arg_473_1.talkMaxDuration)

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_8 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_1) / var_476_8

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_1 + var_476_8 and arg_473_1.time_ < var_476_1 + var_476_8 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906114 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 1101906114
		arg_477_1.duration_ = 9

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play1101906115(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = "ST01a"

			if arg_477_1.bgs_[var_480_0] == nil then
				local var_480_1 = Object.Instantiate(arg_477_1.paintGo_)

				var_480_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_480_0)
				var_480_1.name = var_480_0
				var_480_1.transform.parent = arg_477_1.stage_.transform
				var_480_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_477_1.bgs_[var_480_0] = var_480_1
			end

			local var_480_2 = 2

			if var_480_2 < arg_477_1.time_ and arg_477_1.time_ <= var_480_2 + arg_480_0 then
				local var_480_3 = manager.ui.mainCamera.transform.localPosition
				local var_480_4 = Vector3.New(0, 0, 10) + Vector3.New(var_480_3.x, var_480_3.y, 0)
				local var_480_5 = arg_477_1.bgs_.ST01a

				var_480_5.transform.localPosition = var_480_4
				var_480_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_480_6 = var_480_5:GetComponent("SpriteRenderer")

				if var_480_6 and var_480_6.sprite then
					local var_480_7 = (var_480_5.transform.localPosition - var_480_3).z
					local var_480_8 = manager.ui.mainCameraCom_
					local var_480_9 = 2 * var_480_7 * Mathf.Tan(var_480_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_480_10 = var_480_9 * var_480_8.aspect
					local var_480_11 = var_480_6.sprite.bounds.size.x
					local var_480_12 = var_480_6.sprite.bounds.size.y
					local var_480_13 = var_480_10 / var_480_11
					local var_480_14 = var_480_9 / var_480_12
					local var_480_15 = var_480_14 < var_480_13 and var_480_13 or var_480_14

					var_480_5.transform.localScale = Vector3.New(var_480_15, var_480_15, 0)
				end

				for iter_480_0, iter_480_1 in pairs(arg_477_1.bgs_) do
					if iter_480_0 ~= "ST01a" then
						iter_480_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_480_16 = 0

			if var_480_16 < arg_477_1.time_ and arg_477_1.time_ <= var_480_16 + arg_480_0 then
				arg_477_1.mask_.enabled = true
				arg_477_1.mask_.raycastTarget = true

				arg_477_1:SetGaussion(false)
			end

			local var_480_17 = 2

			if var_480_16 <= arg_477_1.time_ and arg_477_1.time_ < var_480_16 + var_480_17 then
				local var_480_18 = (arg_477_1.time_ - var_480_16) / var_480_17
				local var_480_19 = Color.New(0, 0, 0)

				var_480_19.a = Mathf.Lerp(0, 1, var_480_18)
				arg_477_1.mask_.color = var_480_19
			end

			if arg_477_1.time_ >= var_480_16 + var_480_17 and arg_477_1.time_ < var_480_16 + var_480_17 + arg_480_0 then
				local var_480_20 = Color.New(0, 0, 0)

				var_480_20.a = 1
				arg_477_1.mask_.color = var_480_20
			end

			local var_480_21 = 2

			if var_480_21 < arg_477_1.time_ and arg_477_1.time_ <= var_480_21 + arg_480_0 then
				arg_477_1.mask_.enabled = true
				arg_477_1.mask_.raycastTarget = true

				arg_477_1:SetGaussion(false)
			end

			local var_480_22 = 2

			if var_480_21 <= arg_477_1.time_ and arg_477_1.time_ < var_480_21 + var_480_22 then
				local var_480_23 = (arg_477_1.time_ - var_480_21) / var_480_22
				local var_480_24 = Color.New(0, 0, 0)

				var_480_24.a = Mathf.Lerp(1, 0, var_480_23)
				arg_477_1.mask_.color = var_480_24
			end

			if arg_477_1.time_ >= var_480_21 + var_480_22 and arg_477_1.time_ < var_480_21 + var_480_22 + arg_480_0 then
				local var_480_25 = Color.New(0, 0, 0)
				local var_480_26 = 0

				arg_477_1.mask_.enabled = false
				var_480_25.a = var_480_26
				arg_477_1.mask_.color = var_480_25
			end

			local var_480_27 = arg_477_1.actors_["1019ui_story"].transform
			local var_480_28 = 1.966

			if var_480_28 < arg_477_1.time_ and arg_477_1.time_ <= var_480_28 + arg_480_0 then
				arg_477_1.var_.moveOldPos1019ui_story = var_480_27.localPosition
			end

			local var_480_29 = 0.001

			if var_480_28 <= arg_477_1.time_ and arg_477_1.time_ < var_480_28 + var_480_29 then
				local var_480_30 = (arg_477_1.time_ - var_480_28) / var_480_29
				local var_480_31 = Vector3.New(0, 100, 0)

				var_480_27.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1019ui_story, var_480_31, var_480_30)

				local var_480_32 = manager.ui.mainCamera.transform.position - var_480_27.position

				var_480_27.forward = Vector3.New(var_480_32.x, var_480_32.y, var_480_32.z)

				local var_480_33 = var_480_27.localEulerAngles

				var_480_33.z = 0
				var_480_33.x = 0
				var_480_27.localEulerAngles = var_480_33
			end

			if arg_477_1.time_ >= var_480_28 + var_480_29 and arg_477_1.time_ < var_480_28 + var_480_29 + arg_480_0 then
				var_480_27.localPosition = Vector3.New(0, 100, 0)

				local var_480_34 = manager.ui.mainCamera.transform.position - var_480_27.position

				var_480_27.forward = Vector3.New(var_480_34.x, var_480_34.y, var_480_34.z)

				local var_480_35 = var_480_27.localEulerAngles

				var_480_35.z = 0
				var_480_35.x = 0
				var_480_27.localEulerAngles = var_480_35
			end

			if arg_477_1.frameCnt_ <= 1 then
				arg_477_1.dialog_:SetActive(false)
			end

			local var_480_36 = 4
			local var_480_37 = 0.2

			if var_480_36 < arg_477_1.time_ and arg_477_1.time_ <= var_480_36 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0

				arg_477_1.dialog_:SetActive(true)

				local var_480_38 = LeanTween.value(arg_477_1.dialog_, 0, 1, 0.3)

				var_480_38:setOnUpdate(LuaHelper.FloatAction(function(arg_481_0)
					arg_477_1.dialogCg_.alpha = arg_481_0
				end))
				var_480_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_477_1.dialog_)
					var_480_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_477_1.duration_ = arg_477_1.duration_ + 0.3

				SetActive(arg_477_1.leftNameGo_, false)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_39 = arg_477_1:GetWordFromCfg(1101906114)
				local var_480_40 = arg_477_1:FormatText(var_480_39.content)

				arg_477_1.text_.text = var_480_40

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_41 = 8
				local var_480_42 = utf8.len(var_480_40)
				local var_480_43 = var_480_41 <= 0 and var_480_37 or var_480_37 * (var_480_42 / var_480_41)

				if var_480_43 > 0 and var_480_37 < var_480_43 then
					arg_477_1.talkMaxDuration = var_480_43
					var_480_36 = var_480_36 + 0.3

					if var_480_43 + var_480_36 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_43 + var_480_36
					end
				end

				arg_477_1.text_.text = var_480_40
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)
				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_44 = var_480_36 + 0.3
			local var_480_45 = math.max(var_480_37, arg_477_1.talkMaxDuration)

			if var_480_44 <= arg_477_1.time_ and arg_477_1.time_ < var_480_44 + var_480_45 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_44) / var_480_45

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_44 + var_480_45 and arg_477_1.time_ < var_480_44 + var_480_45 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906115 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 1101906115
		arg_483_1.duration_ = 1.8

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play1101906116(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1019ui_story"].transform
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 then
				arg_483_1.var_.moveOldPos1019ui_story = var_486_0.localPosition
			end

			local var_486_2 = 0.001

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2
				local var_486_4 = Vector3.New(0, -1.08, -5.9)

				var_486_0.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos1019ui_story, var_486_4, var_486_3)

				local var_486_5 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_5.x, var_486_5.y, var_486_5.z)

				local var_486_6 = var_486_0.localEulerAngles

				var_486_6.z = 0
				var_486_6.x = 0
				var_486_0.localEulerAngles = var_486_6
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 then
				var_486_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_486_7 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_7.x, var_486_7.y, var_486_7.z)

				local var_486_8 = var_486_0.localEulerAngles

				var_486_8.z = 0
				var_486_8.x = 0
				var_486_0.localEulerAngles = var_486_8
			end

			local var_486_9 = arg_483_1.actors_["1019ui_story"]
			local var_486_10 = 0

			if var_486_10 < arg_483_1.time_ and arg_483_1.time_ <= var_486_10 + arg_486_0 and arg_483_1.var_.characterEffect1019ui_story == nil then
				arg_483_1.var_.characterEffect1019ui_story = var_486_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_11 = 0.200000002980232

			if var_486_10 <= arg_483_1.time_ and arg_483_1.time_ < var_486_10 + var_486_11 then
				local var_486_12 = (arg_483_1.time_ - var_486_10) / var_486_11

				if arg_483_1.var_.characterEffect1019ui_story then
					arg_483_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_483_1.time_ >= var_486_10 + var_486_11 and arg_483_1.time_ < var_486_10 + var_486_11 + arg_486_0 and arg_483_1.var_.characterEffect1019ui_story then
				arg_483_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_486_13 = 0

			if var_486_13 < arg_483_1.time_ and arg_483_1.time_ <= var_486_13 + arg_486_0 then
				arg_483_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_486_14 = 0

			if var_486_14 < arg_483_1.time_ and arg_483_1.time_ <= var_486_14 + arg_486_0 then
				arg_483_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_486_15 = 0
			local var_486_16 = 0.225

			if var_486_15 < arg_483_1.time_ and arg_483_1.time_ <= var_486_15 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_17 = arg_483_1:FormatText(StoryNameCfg[13].name)

				arg_483_1.leftNameTxt_.text = var_486_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_18 = arg_483_1:GetWordFromCfg(1101906115)
				local var_486_19 = arg_483_1:FormatText(var_486_18.content)

				arg_483_1.text_.text = var_486_19

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_20 = 9
				local var_486_21 = utf8.len(var_486_19)
				local var_486_22 = var_486_20 <= 0 and var_486_16 or var_486_16 * (var_486_21 / var_486_20)

				if var_486_22 > 0 and var_486_16 < var_486_22 then
					arg_483_1.talkMaxDuration = var_486_22

					if var_486_22 + var_486_15 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_22 + var_486_15
					end
				end

				arg_483_1.text_.text = var_486_19
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906115", "story_v_side_new_1101906.awb") ~= 0 then
					local var_486_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906115", "story_v_side_new_1101906.awb") / 1000

					if var_486_23 + var_486_15 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_23 + var_486_15
					end

					if var_486_18.prefab_name ~= "" and arg_483_1.actors_[var_486_18.prefab_name] ~= nil then
						local var_486_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_483_1.actors_[var_486_18.prefab_name].transform, "story_v_side_new_1101906", "1101906115", "story_v_side_new_1101906.awb")

						arg_483_1:RecordAudio("1101906115", var_486_24)
						arg_483_1:RecordAudio("1101906115", var_486_24)
					else
						arg_483_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906115", "story_v_side_new_1101906.awb")
					end

					arg_483_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906115", "story_v_side_new_1101906.awb")
				end

				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_25 = math.max(var_486_16, arg_483_1.talkMaxDuration)

			if var_486_15 <= arg_483_1.time_ and arg_483_1.time_ < var_486_15 + var_486_25 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_15) / var_486_25

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_15 + var_486_25 and arg_483_1.time_ < var_486_15 + var_486_25 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906116 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 1101906116
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play1101906117(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["1019ui_story"]
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 and arg_487_1.var_.characterEffect1019ui_story == nil then
				arg_487_1.var_.characterEffect1019ui_story = var_490_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_2 = 0.200000002980232

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2

				if arg_487_1.var_.characterEffect1019ui_story then
					local var_490_4 = Mathf.Lerp(0, 0.5, var_490_3)

					arg_487_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_487_1.var_.characterEffect1019ui_story.fillRatio = var_490_4
				end
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 and arg_487_1.var_.characterEffect1019ui_story then
				local var_490_5 = 0.5

				arg_487_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_487_1.var_.characterEffect1019ui_story.fillRatio = var_490_5
			end

			local var_490_6 = 0
			local var_490_7 = 0.4

			if var_490_6 < arg_487_1.time_ and arg_487_1.time_ <= var_490_6 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_8 = arg_487_1:FormatText(StoryNameCfg[7].name)

				arg_487_1.leftNameTxt_.text = var_490_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_9 = arg_487_1:GetWordFromCfg(1101906116)
				local var_490_10 = arg_487_1:FormatText(var_490_9.content)

				arg_487_1.text_.text = var_490_10

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_11 = 16
				local var_490_12 = utf8.len(var_490_10)
				local var_490_13 = var_490_11 <= 0 and var_490_7 or var_490_7 * (var_490_12 / var_490_11)

				if var_490_13 > 0 and var_490_7 < var_490_13 then
					arg_487_1.talkMaxDuration = var_490_13

					if var_490_13 + var_490_6 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_13 + var_490_6
					end
				end

				arg_487_1.text_.text = var_490_10
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_14 = math.max(var_490_7, arg_487_1.talkMaxDuration)

			if var_490_6 <= arg_487_1.time_ and arg_487_1.time_ < var_490_6 + var_490_14 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_6) / var_490_14

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_6 + var_490_14 and arg_487_1.time_ < var_490_6 + var_490_14 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906117 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 1101906117
		arg_491_1.duration_ = 1.566

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play1101906118(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1019ui_story"]
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 and arg_491_1.var_.characterEffect1019ui_story == nil then
				arg_491_1.var_.characterEffect1019ui_story = var_494_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_2 = 0.200000002980232

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2

				if arg_491_1.var_.characterEffect1019ui_story then
					arg_491_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 and arg_491_1.var_.characterEffect1019ui_story then
				arg_491_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_494_4 = 0
			local var_494_5 = 0.175

			if var_494_4 < arg_491_1.time_ and arg_491_1.time_ <= var_494_4 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_6 = arg_491_1:FormatText(StoryNameCfg[13].name)

				arg_491_1.leftNameTxt_.text = var_494_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_7 = arg_491_1:GetWordFromCfg(1101906117)
				local var_494_8 = arg_491_1:FormatText(var_494_7.content)

				arg_491_1.text_.text = var_494_8

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_9 = 7
				local var_494_10 = utf8.len(var_494_8)
				local var_494_11 = var_494_9 <= 0 and var_494_5 or var_494_5 * (var_494_10 / var_494_9)

				if var_494_11 > 0 and var_494_5 < var_494_11 then
					arg_491_1.talkMaxDuration = var_494_11

					if var_494_11 + var_494_4 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_11 + var_494_4
					end
				end

				arg_491_1.text_.text = var_494_8
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906117", "story_v_side_new_1101906.awb") ~= 0 then
					local var_494_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906117", "story_v_side_new_1101906.awb") / 1000

					if var_494_12 + var_494_4 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_12 + var_494_4
					end

					if var_494_7.prefab_name ~= "" and arg_491_1.actors_[var_494_7.prefab_name] ~= nil then
						local var_494_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_7.prefab_name].transform, "story_v_side_new_1101906", "1101906117", "story_v_side_new_1101906.awb")

						arg_491_1:RecordAudio("1101906117", var_494_13)
						arg_491_1:RecordAudio("1101906117", var_494_13)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906117", "story_v_side_new_1101906.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906117", "story_v_side_new_1101906.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_14 = math.max(var_494_5, arg_491_1.talkMaxDuration)

			if var_494_4 <= arg_491_1.time_ and arg_491_1.time_ < var_494_4 + var_494_14 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_4) / var_494_14

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_4 + var_494_14 and arg_491_1.time_ < var_494_4 + var_494_14 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906118 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 1101906118
		arg_495_1.duration_ = 5

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play1101906119(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1019ui_story"]
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 and arg_495_1.var_.characterEffect1019ui_story == nil then
				arg_495_1.var_.characterEffect1019ui_story = var_498_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_2 = 0.200000002980232

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2

				if arg_495_1.var_.characterEffect1019ui_story then
					local var_498_4 = Mathf.Lerp(0, 0.5, var_498_3)

					arg_495_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_495_1.var_.characterEffect1019ui_story.fillRatio = var_498_4
				end
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1019ui_story then
				local var_498_5 = 0.5

				arg_495_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_495_1.var_.characterEffect1019ui_story.fillRatio = var_498_5
			end

			local var_498_6 = 0
			local var_498_7 = 0.3

			if var_498_6 < arg_495_1.time_ and arg_495_1.time_ <= var_498_6 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_8 = arg_495_1:FormatText(StoryNameCfg[7].name)

				arg_495_1.leftNameTxt_.text = var_498_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_9 = arg_495_1:GetWordFromCfg(1101906118)
				local var_498_10 = arg_495_1:FormatText(var_498_9.content)

				arg_495_1.text_.text = var_498_10

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_11 = 12
				local var_498_12 = utf8.len(var_498_10)
				local var_498_13 = var_498_11 <= 0 and var_498_7 or var_498_7 * (var_498_12 / var_498_11)

				if var_498_13 > 0 and var_498_7 < var_498_13 then
					arg_495_1.talkMaxDuration = var_498_13

					if var_498_13 + var_498_6 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_13 + var_498_6
					end
				end

				arg_495_1.text_.text = var_498_10
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)
				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_14 = math.max(var_498_7, arg_495_1.talkMaxDuration)

			if var_498_6 <= arg_495_1.time_ and arg_495_1.time_ < var_498_6 + var_498_14 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_6) / var_498_14

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_6 + var_498_14 and arg_495_1.time_ < var_498_6 + var_498_14 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906119 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 1101906119
		arg_499_1.duration_ = 2.166

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play1101906120(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1019ui_story"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 and arg_499_1.var_.characterEffect1019ui_story == nil then
				arg_499_1.var_.characterEffect1019ui_story = var_502_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_2 = 0.200000002980232

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2

				if arg_499_1.var_.characterEffect1019ui_story then
					arg_499_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 and arg_499_1.var_.characterEffect1019ui_story then
				arg_499_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_502_4 = 0

			if var_502_4 < arg_499_1.time_ and arg_499_1.time_ <= var_502_4 + arg_502_0 then
				arg_499_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_502_5 = 0
			local var_502_6 = 0.25

			if var_502_5 < arg_499_1.time_ and arg_499_1.time_ <= var_502_5 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_7 = arg_499_1:FormatText(StoryNameCfg[13].name)

				arg_499_1.leftNameTxt_.text = var_502_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_8 = arg_499_1:GetWordFromCfg(1101906119)
				local var_502_9 = arg_499_1:FormatText(var_502_8.content)

				arg_499_1.text_.text = var_502_9

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_10 = 10
				local var_502_11 = utf8.len(var_502_9)
				local var_502_12 = var_502_10 <= 0 and var_502_6 or var_502_6 * (var_502_11 / var_502_10)

				if var_502_12 > 0 and var_502_6 < var_502_12 then
					arg_499_1.talkMaxDuration = var_502_12

					if var_502_12 + var_502_5 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_12 + var_502_5
					end
				end

				arg_499_1.text_.text = var_502_9
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906119", "story_v_side_new_1101906.awb") ~= 0 then
					local var_502_13 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906119", "story_v_side_new_1101906.awb") / 1000

					if var_502_13 + var_502_5 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_13 + var_502_5
					end

					if var_502_8.prefab_name ~= "" and arg_499_1.actors_[var_502_8.prefab_name] ~= nil then
						local var_502_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_8.prefab_name].transform, "story_v_side_new_1101906", "1101906119", "story_v_side_new_1101906.awb")

						arg_499_1:RecordAudio("1101906119", var_502_14)
						arg_499_1:RecordAudio("1101906119", var_502_14)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906119", "story_v_side_new_1101906.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906119", "story_v_side_new_1101906.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_15 = math.max(var_502_6, arg_499_1.talkMaxDuration)

			if var_502_5 <= arg_499_1.time_ and arg_499_1.time_ < var_502_5 + var_502_15 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_5) / var_502_15

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_5 + var_502_15 and arg_499_1.time_ < var_502_5 + var_502_15 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906120 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 1101906120
		arg_503_1.duration_ = 5

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play1101906121(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["1019ui_story"]
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 and arg_503_1.var_.characterEffect1019ui_story == nil then
				arg_503_1.var_.characterEffect1019ui_story = var_506_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_2 = 0.200000002980232

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2

				if arg_503_1.var_.characterEffect1019ui_story then
					local var_506_4 = Mathf.Lerp(0, 0.5, var_506_3)

					arg_503_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_503_1.var_.characterEffect1019ui_story.fillRatio = var_506_4
				end
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 and arg_503_1.var_.characterEffect1019ui_story then
				local var_506_5 = 0.5

				arg_503_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_503_1.var_.characterEffect1019ui_story.fillRatio = var_506_5
			end

			local var_506_6 = 0
			local var_506_7 = 0.075

			if var_506_6 < arg_503_1.time_ and arg_503_1.time_ <= var_506_6 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_8 = arg_503_1:FormatText(StoryNameCfg[7].name)

				arg_503_1.leftNameTxt_.text = var_506_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_9 = arg_503_1:GetWordFromCfg(1101906120)
				local var_506_10 = arg_503_1:FormatText(var_506_9.content)

				arg_503_1.text_.text = var_506_10

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_11 = 3
				local var_506_12 = utf8.len(var_506_10)
				local var_506_13 = var_506_11 <= 0 and var_506_7 or var_506_7 * (var_506_12 / var_506_11)

				if var_506_13 > 0 and var_506_7 < var_506_13 then
					arg_503_1.talkMaxDuration = var_506_13

					if var_506_13 + var_506_6 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_13 + var_506_6
					end
				end

				arg_503_1.text_.text = var_506_10
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)
				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_14 = math.max(var_506_7, arg_503_1.talkMaxDuration)

			if var_506_6 <= arg_503_1.time_ and arg_503_1.time_ < var_506_6 + var_506_14 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_6) / var_506_14

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_6 + var_506_14 and arg_503_1.time_ < var_506_6 + var_506_14 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906121 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 1101906121
		arg_507_1.duration_ = 5

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play1101906122(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1019ui_story"].transform
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 then
				arg_507_1.var_.moveOldPos1019ui_story = var_510_0.localPosition
			end

			local var_510_2 = 0.001

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2
				local var_510_4 = Vector3.New(0, 100, 0)

				var_510_0.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos1019ui_story, var_510_4, var_510_3)

				local var_510_5 = manager.ui.mainCamera.transform.position - var_510_0.position

				var_510_0.forward = Vector3.New(var_510_5.x, var_510_5.y, var_510_5.z)

				local var_510_6 = var_510_0.localEulerAngles

				var_510_6.z = 0
				var_510_6.x = 0
				var_510_0.localEulerAngles = var_510_6
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 then
				var_510_0.localPosition = Vector3.New(0, 100, 0)

				local var_510_7 = manager.ui.mainCamera.transform.position - var_510_0.position

				var_510_0.forward = Vector3.New(var_510_7.x, var_510_7.y, var_510_7.z)

				local var_510_8 = var_510_0.localEulerAngles

				var_510_8.z = 0
				var_510_8.x = 0
				var_510_0.localEulerAngles = var_510_8
			end

			local var_510_9 = arg_507_1.actors_["1019ui_story"]
			local var_510_10 = 0

			if var_510_10 < arg_507_1.time_ and arg_507_1.time_ <= var_510_10 + arg_510_0 and arg_507_1.var_.characterEffect1019ui_story == nil then
				arg_507_1.var_.characterEffect1019ui_story = var_510_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_11 = 0.200000002980232

			if var_510_10 <= arg_507_1.time_ and arg_507_1.time_ < var_510_10 + var_510_11 then
				local var_510_12 = (arg_507_1.time_ - var_510_10) / var_510_11

				if arg_507_1.var_.characterEffect1019ui_story then
					local var_510_13 = Mathf.Lerp(0, 0.5, var_510_12)

					arg_507_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_507_1.var_.characterEffect1019ui_story.fillRatio = var_510_13
				end
			end

			if arg_507_1.time_ >= var_510_10 + var_510_11 and arg_507_1.time_ < var_510_10 + var_510_11 + arg_510_0 and arg_507_1.var_.characterEffect1019ui_story then
				local var_510_14 = 0.5

				arg_507_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_507_1.var_.characterEffect1019ui_story.fillRatio = var_510_14
			end

			local var_510_15 = 0
			local var_510_16 = 1.325

			if var_510_15 < arg_507_1.time_ and arg_507_1.time_ <= var_510_15 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, false)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_17 = arg_507_1:GetWordFromCfg(1101906121)
				local var_510_18 = arg_507_1:FormatText(var_510_17.content)

				arg_507_1.text_.text = var_510_18

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_19 = 53
				local var_510_20 = utf8.len(var_510_18)
				local var_510_21 = var_510_19 <= 0 and var_510_16 or var_510_16 * (var_510_20 / var_510_19)

				if var_510_21 > 0 and var_510_16 < var_510_21 then
					arg_507_1.talkMaxDuration = var_510_21

					if var_510_21 + var_510_15 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_21 + var_510_15
					end
				end

				arg_507_1.text_.text = var_510_18
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)
				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_22 = math.max(var_510_16, arg_507_1.talkMaxDuration)

			if var_510_15 <= arg_507_1.time_ and arg_507_1.time_ < var_510_15 + var_510_22 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_15) / var_510_22

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_15 + var_510_22 and arg_507_1.time_ < var_510_15 + var_510_22 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906122 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 1101906122
		arg_511_1.duration_ = 5

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play1101906123(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = 0
			local var_514_1 = 0.65

			if var_514_0 < arg_511_1.time_ and arg_511_1.time_ <= var_514_0 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, false)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_2 = arg_511_1:GetWordFromCfg(1101906122)
				local var_514_3 = arg_511_1:FormatText(var_514_2.content)

				arg_511_1.text_.text = var_514_3

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_4 = 26
				local var_514_5 = utf8.len(var_514_3)
				local var_514_6 = var_514_4 <= 0 and var_514_1 or var_514_1 * (var_514_5 / var_514_4)

				if var_514_6 > 0 and var_514_1 < var_514_6 then
					arg_511_1.talkMaxDuration = var_514_6

					if var_514_6 + var_514_0 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_6 + var_514_0
					end
				end

				arg_511_1.text_.text = var_514_3
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)
				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_7 = math.max(var_514_1, arg_511_1.talkMaxDuration)

			if var_514_0 <= arg_511_1.time_ and arg_511_1.time_ < var_514_0 + var_514_7 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_0) / var_514_7

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_0 + var_514_7 and arg_511_1.time_ < var_514_0 + var_514_7 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906123 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 1101906123
		arg_515_1.duration_ = 9

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play1101906124(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = "D999"

			if arg_515_1.bgs_[var_518_0] == nil then
				local var_518_1 = Object.Instantiate(arg_515_1.paintGo_)

				var_518_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_518_0)
				var_518_1.name = var_518_0
				var_518_1.transform.parent = arg_515_1.stage_.transform
				var_518_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_515_1.bgs_[var_518_0] = var_518_1
			end

			local var_518_2 = 2

			if var_518_2 < arg_515_1.time_ and arg_515_1.time_ <= var_518_2 + arg_518_0 then
				local var_518_3 = manager.ui.mainCamera.transform.localPosition
				local var_518_4 = Vector3.New(0, 0, 10) + Vector3.New(var_518_3.x, var_518_3.y, 0)
				local var_518_5 = arg_515_1.bgs_.D999

				var_518_5.transform.localPosition = var_518_4
				var_518_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_518_6 = var_518_5:GetComponent("SpriteRenderer")

				if var_518_6 and var_518_6.sprite then
					local var_518_7 = (var_518_5.transform.localPosition - var_518_3).z
					local var_518_8 = manager.ui.mainCameraCom_
					local var_518_9 = 2 * var_518_7 * Mathf.Tan(var_518_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_518_10 = var_518_9 * var_518_8.aspect
					local var_518_11 = var_518_6.sprite.bounds.size.x
					local var_518_12 = var_518_6.sprite.bounds.size.y
					local var_518_13 = var_518_10 / var_518_11
					local var_518_14 = var_518_9 / var_518_12
					local var_518_15 = var_518_14 < var_518_13 and var_518_13 or var_518_14

					var_518_5.transform.localScale = Vector3.New(var_518_15, var_518_15, 0)
				end

				for iter_518_0, iter_518_1 in pairs(arg_515_1.bgs_) do
					if iter_518_0 ~= "D999" then
						iter_518_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_518_16 = 0

			if var_518_16 < arg_515_1.time_ and arg_515_1.time_ <= var_518_16 + arg_518_0 then
				arg_515_1.mask_.enabled = true
				arg_515_1.mask_.raycastTarget = true

				arg_515_1:SetGaussion(false)
			end

			local var_518_17 = 2

			if var_518_16 <= arg_515_1.time_ and arg_515_1.time_ < var_518_16 + var_518_17 then
				local var_518_18 = (arg_515_1.time_ - var_518_16) / var_518_17
				local var_518_19 = Color.New(0, 0, 0)

				var_518_19.a = Mathf.Lerp(0, 1, var_518_18)
				arg_515_1.mask_.color = var_518_19
			end

			if arg_515_1.time_ >= var_518_16 + var_518_17 and arg_515_1.time_ < var_518_16 + var_518_17 + arg_518_0 then
				local var_518_20 = Color.New(0, 0, 0)

				var_518_20.a = 1
				arg_515_1.mask_.color = var_518_20
			end

			local var_518_21 = 2

			if var_518_21 < arg_515_1.time_ and arg_515_1.time_ <= var_518_21 + arg_518_0 then
				arg_515_1.mask_.enabled = true
				arg_515_1.mask_.raycastTarget = true

				arg_515_1:SetGaussion(false)
			end

			local var_518_22 = 2

			if var_518_21 <= arg_515_1.time_ and arg_515_1.time_ < var_518_21 + var_518_22 then
				local var_518_23 = (arg_515_1.time_ - var_518_21) / var_518_22
				local var_518_24 = Color.New(0, 0, 0)

				var_518_24.a = Mathf.Lerp(1, 0, var_518_23)
				arg_515_1.mask_.color = var_518_24
			end

			if arg_515_1.time_ >= var_518_21 + var_518_22 and arg_515_1.time_ < var_518_21 + var_518_22 + arg_518_0 then
				local var_518_25 = Color.New(0, 0, 0)
				local var_518_26 = 0

				arg_515_1.mask_.enabled = false
				var_518_25.a = var_518_26
				arg_515_1.mask_.color = var_518_25
			end

			if arg_515_1.frameCnt_ <= 1 then
				arg_515_1.dialog_:SetActive(false)
			end

			local var_518_27 = 4
			local var_518_28 = 0.825

			if var_518_27 < arg_515_1.time_ and arg_515_1.time_ <= var_518_27 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0

				arg_515_1.dialog_:SetActive(true)

				local var_518_29 = LeanTween.value(arg_515_1.dialog_, 0, 1, 0.3)

				var_518_29:setOnUpdate(LuaHelper.FloatAction(function(arg_519_0)
					arg_515_1.dialogCg_.alpha = arg_519_0
				end))
				var_518_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_515_1.dialog_)
					var_518_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_515_1.duration_ = arg_515_1.duration_ + 0.3

				SetActive(arg_515_1.leftNameGo_, false)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_30 = arg_515_1:GetWordFromCfg(1101906123)
				local var_518_31 = arg_515_1:FormatText(var_518_30.content)

				arg_515_1.text_.text = var_518_31

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_32 = 33
				local var_518_33 = utf8.len(var_518_31)
				local var_518_34 = var_518_32 <= 0 and var_518_28 or var_518_28 * (var_518_33 / var_518_32)

				if var_518_34 > 0 and var_518_28 < var_518_34 then
					arg_515_1.talkMaxDuration = var_518_34
					var_518_27 = var_518_27 + 0.3

					if var_518_34 + var_518_27 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_34 + var_518_27
					end
				end

				arg_515_1.text_.text = var_518_31
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)
				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_35 = var_518_27 + 0.3
			local var_518_36 = math.max(var_518_28, arg_515_1.talkMaxDuration)

			if var_518_35 <= arg_515_1.time_ and arg_515_1.time_ < var_518_35 + var_518_36 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_35) / var_518_36

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_35 + var_518_36 and arg_515_1.time_ < var_518_35 + var_518_36 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906124 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 1101906124
		arg_521_1.duration_ = 5

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play1101906125(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = 0
			local var_524_1 = 0.05

			if var_524_0 < arg_521_1.time_ and arg_521_1.time_ <= var_524_0 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_2 = arg_521_1:FormatText(StoryNameCfg[7].name)

				arg_521_1.leftNameTxt_.text = var_524_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_3 = arg_521_1:GetWordFromCfg(1101906124)
				local var_524_4 = arg_521_1:FormatText(var_524_3.content)

				arg_521_1.text_.text = var_524_4

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_5 = 2
				local var_524_6 = utf8.len(var_524_4)
				local var_524_7 = var_524_5 <= 0 and var_524_1 or var_524_1 * (var_524_6 / var_524_5)

				if var_524_7 > 0 and var_524_1 < var_524_7 then
					arg_521_1.talkMaxDuration = var_524_7

					if var_524_7 + var_524_0 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_7 + var_524_0
					end
				end

				arg_521_1.text_.text = var_524_4
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)
				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_8 = math.max(var_524_1, arg_521_1.talkMaxDuration)

			if var_524_0 <= arg_521_1.time_ and arg_521_1.time_ < var_524_0 + var_524_8 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_0) / var_524_8

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_0 + var_524_8 and arg_521_1.time_ < var_524_0 + var_524_8 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906125 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 1101906125
		arg_525_1.duration_ = 5

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play1101906126(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = 0
			local var_528_1 = 0.35

			if var_528_0 < arg_525_1.time_ and arg_525_1.time_ <= var_528_0 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, false)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_2 = arg_525_1:GetWordFromCfg(1101906125)
				local var_528_3 = arg_525_1:FormatText(var_528_2.content)

				arg_525_1.text_.text = var_528_3

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_4 = 14
				local var_528_5 = utf8.len(var_528_3)
				local var_528_6 = var_528_4 <= 0 and var_528_1 or var_528_1 * (var_528_5 / var_528_4)

				if var_528_6 > 0 and var_528_1 < var_528_6 then
					arg_525_1.talkMaxDuration = var_528_6

					if var_528_6 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_6 + var_528_0
					end
				end

				arg_525_1.text_.text = var_528_3
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)
				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_7 = math.max(var_528_1, arg_525_1.talkMaxDuration)

			if var_528_0 <= arg_525_1.time_ and arg_525_1.time_ < var_528_0 + var_528_7 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_0) / var_528_7

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_0 + var_528_7 and arg_525_1.time_ < var_528_0 + var_528_7 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906126 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 1101906126
		arg_529_1.duration_ = 5

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play1101906127(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = 0
			local var_532_1 = 0.85

			if var_532_0 < arg_529_1.time_ and arg_529_1.time_ <= var_532_0 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, false)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_2 = arg_529_1:GetWordFromCfg(1101906126)
				local var_532_3 = arg_529_1:FormatText(var_532_2.content)

				arg_529_1.text_.text = var_532_3

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_4 = 34
				local var_532_5 = utf8.len(var_532_3)
				local var_532_6 = var_532_4 <= 0 and var_532_1 or var_532_1 * (var_532_5 / var_532_4)

				if var_532_6 > 0 and var_532_1 < var_532_6 then
					arg_529_1.talkMaxDuration = var_532_6

					if var_532_6 + var_532_0 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_6 + var_532_0
					end
				end

				arg_529_1.text_.text = var_532_3
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_7 = math.max(var_532_1, arg_529_1.talkMaxDuration)

			if var_532_0 <= arg_529_1.time_ and arg_529_1.time_ < var_532_0 + var_532_7 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_0) / var_532_7

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_0 + var_532_7 and arg_529_1.time_ < var_532_0 + var_532_7 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906127 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 1101906127
		arg_533_1.duration_ = 9

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play1101906128(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = "ST28"

			if arg_533_1.bgs_[var_536_0] == nil then
				local var_536_1 = Object.Instantiate(arg_533_1.paintGo_)

				var_536_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_536_0)
				var_536_1.name = var_536_0
				var_536_1.transform.parent = arg_533_1.stage_.transform
				var_536_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_533_1.bgs_[var_536_0] = var_536_1
			end

			local var_536_2 = 2

			if var_536_2 < arg_533_1.time_ and arg_533_1.time_ <= var_536_2 + arg_536_0 then
				local var_536_3 = manager.ui.mainCamera.transform.localPosition
				local var_536_4 = Vector3.New(0, 0, 10) + Vector3.New(var_536_3.x, var_536_3.y, 0)
				local var_536_5 = arg_533_1.bgs_.ST28

				var_536_5.transform.localPosition = var_536_4
				var_536_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_536_6 = var_536_5:GetComponent("SpriteRenderer")

				if var_536_6 and var_536_6.sprite then
					local var_536_7 = (var_536_5.transform.localPosition - var_536_3).z
					local var_536_8 = manager.ui.mainCameraCom_
					local var_536_9 = 2 * var_536_7 * Mathf.Tan(var_536_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_536_10 = var_536_9 * var_536_8.aspect
					local var_536_11 = var_536_6.sprite.bounds.size.x
					local var_536_12 = var_536_6.sprite.bounds.size.y
					local var_536_13 = var_536_10 / var_536_11
					local var_536_14 = var_536_9 / var_536_12
					local var_536_15 = var_536_14 < var_536_13 and var_536_13 or var_536_14

					var_536_5.transform.localScale = Vector3.New(var_536_15, var_536_15, 0)
				end

				for iter_536_0, iter_536_1 in pairs(arg_533_1.bgs_) do
					if iter_536_0 ~= "ST28" then
						iter_536_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_536_16 = 0

			if var_536_16 < arg_533_1.time_ and arg_533_1.time_ <= var_536_16 + arg_536_0 then
				arg_533_1.mask_.enabled = true
				arg_533_1.mask_.raycastTarget = true

				arg_533_1:SetGaussion(false)
			end

			local var_536_17 = 2

			if var_536_16 <= arg_533_1.time_ and arg_533_1.time_ < var_536_16 + var_536_17 then
				local var_536_18 = (arg_533_1.time_ - var_536_16) / var_536_17
				local var_536_19 = Color.New(0, 0, 0)

				var_536_19.a = Mathf.Lerp(0, 1, var_536_18)
				arg_533_1.mask_.color = var_536_19
			end

			if arg_533_1.time_ >= var_536_16 + var_536_17 and arg_533_1.time_ < var_536_16 + var_536_17 + arg_536_0 then
				local var_536_20 = Color.New(0, 0, 0)

				var_536_20.a = 1
				arg_533_1.mask_.color = var_536_20
			end

			local var_536_21 = 2

			if var_536_21 < arg_533_1.time_ and arg_533_1.time_ <= var_536_21 + arg_536_0 then
				arg_533_1.mask_.enabled = true
				arg_533_1.mask_.raycastTarget = true

				arg_533_1:SetGaussion(false)
			end

			local var_536_22 = 2

			if var_536_21 <= arg_533_1.time_ and arg_533_1.time_ < var_536_21 + var_536_22 then
				local var_536_23 = (arg_533_1.time_ - var_536_21) / var_536_22
				local var_536_24 = Color.New(0, 0, 0)

				var_536_24.a = Mathf.Lerp(1, 0, var_536_23)
				arg_533_1.mask_.color = var_536_24
			end

			if arg_533_1.time_ >= var_536_21 + var_536_22 and arg_533_1.time_ < var_536_21 + var_536_22 + arg_536_0 then
				local var_536_25 = Color.New(0, 0, 0)
				local var_536_26 = 0

				arg_533_1.mask_.enabled = false
				var_536_25.a = var_536_26
				arg_533_1.mask_.color = var_536_25
			end

			local var_536_27 = "ST28_blur"

			if arg_533_1.bgs_[var_536_27] == nil then
				local var_536_28 = Object.Instantiate(arg_533_1.blurPaintGo_)
				local var_536_29 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_536_27)

				var_536_28:GetComponent("SpriteRenderer").sprite = var_536_29
				var_536_28.name = var_536_27
				var_536_28.transform.parent = arg_533_1.stage_.transform
				var_536_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_533_1.bgs_[var_536_27] = var_536_28
			end

			local var_536_30 = 2
			local var_536_31 = arg_533_1.bgs_[var_536_27]

			if var_536_30 < arg_533_1.time_ and arg_533_1.time_ <= var_536_30 + arg_536_0 then
				local var_536_32 = manager.ui.mainCamera.transform.localPosition
				local var_536_33 = Vector3.New(0, 0, 10) + Vector3.New(var_536_32.x, var_536_32.y, 0)

				var_536_31.transform.localPosition = var_536_33
				var_536_31.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_536_34 = var_536_31:GetComponent("SpriteRenderer")

				if var_536_34 and var_536_34.sprite then
					local var_536_35 = (var_536_31.transform.localPosition - var_536_32).z
					local var_536_36 = manager.ui.mainCameraCom_
					local var_536_37 = 2 * var_536_35 * Mathf.Tan(var_536_36.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_536_38 = var_536_37 * var_536_36.aspect
					local var_536_39 = var_536_34.sprite.bounds.size.x
					local var_536_40 = var_536_34.sprite.bounds.size.y
					local var_536_41 = var_536_38 / var_536_39
					local var_536_42 = var_536_37 / var_536_40
					local var_536_43 = var_536_42 < var_536_41 and var_536_41 or var_536_42

					var_536_31.transform.localScale = Vector3.New(var_536_43, var_536_43, 0)
				end
			end

			local var_536_44 = 2

			if var_536_30 <= arg_533_1.time_ and arg_533_1.time_ < var_536_30 + var_536_44 then
				local var_536_45 = (arg_533_1.time_ - var_536_30) / var_536_44
				local var_536_46 = Color.New(1, 1, 1)

				var_536_46.a = Mathf.Lerp(0, 1, var_536_45)

				var_536_31:GetComponent("SpriteRenderer").material:SetColor("_Color", var_536_46)
			end

			if arg_533_1.frameCnt_ <= 1 then
				arg_533_1.dialog_:SetActive(false)
			end

			local var_536_47 = 4
			local var_536_48 = 0.925

			if var_536_47 < arg_533_1.time_ and arg_533_1.time_ <= var_536_47 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0

				arg_533_1.dialog_:SetActive(true)

				local var_536_49 = LeanTween.value(arg_533_1.dialog_, 0, 1, 0.3)

				var_536_49:setOnUpdate(LuaHelper.FloatAction(function(arg_537_0)
					arg_533_1.dialogCg_.alpha = arg_537_0
				end))
				var_536_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_533_1.dialog_)
					var_536_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_533_1.duration_ = arg_533_1.duration_ + 0.3

				SetActive(arg_533_1.leftNameGo_, false)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_50 = arg_533_1:GetWordFromCfg(1101906127)
				local var_536_51 = arg_533_1:FormatText(var_536_50.content)

				arg_533_1.text_.text = var_536_51

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_52 = 37
				local var_536_53 = utf8.len(var_536_51)
				local var_536_54 = var_536_52 <= 0 and var_536_48 or var_536_48 * (var_536_53 / var_536_52)

				if var_536_54 > 0 and var_536_48 < var_536_54 then
					arg_533_1.talkMaxDuration = var_536_54
					var_536_47 = var_536_47 + 0.3

					if var_536_54 + var_536_47 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_54 + var_536_47
					end
				end

				arg_533_1.text_.text = var_536_51
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)
				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_55 = var_536_47 + 0.3
			local var_536_56 = math.max(var_536_48, arg_533_1.talkMaxDuration)

			if var_536_55 <= arg_533_1.time_ and arg_533_1.time_ < var_536_55 + var_536_56 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_55) / var_536_56

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_55 + var_536_56 and arg_533_1.time_ < var_536_55 + var_536_56 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906128 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 1101906128
		arg_539_1.duration_ = 1.999999999999

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play1101906129(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["1019ui_story"].transform
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 then
				arg_539_1.var_.moveOldPos1019ui_story = var_542_0.localPosition
			end

			local var_542_2 = 0.001

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2
				local var_542_4 = Vector3.New(0, -1.08, -5.9)

				var_542_0.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos1019ui_story, var_542_4, var_542_3)

				local var_542_5 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_5.x, var_542_5.y, var_542_5.z)

				local var_542_6 = var_542_0.localEulerAngles

				var_542_6.z = 0
				var_542_6.x = 0
				var_542_0.localEulerAngles = var_542_6
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 then
				var_542_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_542_7 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_7.x, var_542_7.y, var_542_7.z)

				local var_542_8 = var_542_0.localEulerAngles

				var_542_8.z = 0
				var_542_8.x = 0
				var_542_0.localEulerAngles = var_542_8
			end

			local var_542_9 = arg_539_1.actors_["1019ui_story"]
			local var_542_10 = 0

			if var_542_10 < arg_539_1.time_ and arg_539_1.time_ <= var_542_10 + arg_542_0 and arg_539_1.var_.characterEffect1019ui_story == nil then
				arg_539_1.var_.characterEffect1019ui_story = var_542_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_11 = 0.200000002980232

			if var_542_10 <= arg_539_1.time_ and arg_539_1.time_ < var_542_10 + var_542_11 then
				local var_542_12 = (arg_539_1.time_ - var_542_10) / var_542_11

				if arg_539_1.var_.characterEffect1019ui_story then
					arg_539_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_539_1.time_ >= var_542_10 + var_542_11 and arg_539_1.time_ < var_542_10 + var_542_11 + arg_542_0 and arg_539_1.var_.characterEffect1019ui_story then
				arg_539_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_542_13 = 0

			if var_542_13 < arg_539_1.time_ and arg_539_1.time_ <= var_542_13 + arg_542_0 then
				arg_539_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_542_14 = 0

			if var_542_14 < arg_539_1.time_ and arg_539_1.time_ <= var_542_14 + arg_542_0 then
				arg_539_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_542_15 = 0
			local var_542_16 = 0.1

			if var_542_15 < arg_539_1.time_ and arg_539_1.time_ <= var_542_15 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_17 = arg_539_1:FormatText(StoryNameCfg[13].name)

				arg_539_1.leftNameTxt_.text = var_542_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_18 = arg_539_1:GetWordFromCfg(1101906128)
				local var_542_19 = arg_539_1:FormatText(var_542_18.content)

				arg_539_1.text_.text = var_542_19

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_20 = 4
				local var_542_21 = utf8.len(var_542_19)
				local var_542_22 = var_542_20 <= 0 and var_542_16 or var_542_16 * (var_542_21 / var_542_20)

				if var_542_22 > 0 and var_542_16 < var_542_22 then
					arg_539_1.talkMaxDuration = var_542_22

					if var_542_22 + var_542_15 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_22 + var_542_15
					end
				end

				arg_539_1.text_.text = var_542_19
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906128", "story_v_side_new_1101906.awb") ~= 0 then
					local var_542_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906128", "story_v_side_new_1101906.awb") / 1000

					if var_542_23 + var_542_15 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_23 + var_542_15
					end

					if var_542_18.prefab_name ~= "" and arg_539_1.actors_[var_542_18.prefab_name] ~= nil then
						local var_542_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_18.prefab_name].transform, "story_v_side_new_1101906", "1101906128", "story_v_side_new_1101906.awb")

						arg_539_1:RecordAudio("1101906128", var_542_24)
						arg_539_1:RecordAudio("1101906128", var_542_24)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906128", "story_v_side_new_1101906.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906128", "story_v_side_new_1101906.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_25 = math.max(var_542_16, arg_539_1.talkMaxDuration)

			if var_542_15 <= arg_539_1.time_ and arg_539_1.time_ < var_542_15 + var_542_25 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_15) / var_542_25

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_15 + var_542_25 and arg_539_1.time_ < var_542_15 + var_542_25 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906129 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 1101906129
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play1101906130(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["1019ui_story"]
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 and arg_543_1.var_.characterEffect1019ui_story == nil then
				arg_543_1.var_.characterEffect1019ui_story = var_546_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_546_2 = 0.200000002980232

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_2 then
				local var_546_3 = (arg_543_1.time_ - var_546_1) / var_546_2

				if arg_543_1.var_.characterEffect1019ui_story then
					local var_546_4 = Mathf.Lerp(0, 0.5, var_546_3)

					arg_543_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_543_1.var_.characterEffect1019ui_story.fillRatio = var_546_4
				end
			end

			if arg_543_1.time_ >= var_546_1 + var_546_2 and arg_543_1.time_ < var_546_1 + var_546_2 + arg_546_0 and arg_543_1.var_.characterEffect1019ui_story then
				local var_546_5 = 0.5

				arg_543_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_543_1.var_.characterEffect1019ui_story.fillRatio = var_546_5
			end

			local var_546_6 = 0
			local var_546_7 = 0.575

			if var_546_6 < arg_543_1.time_ and arg_543_1.time_ <= var_546_6 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, false)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_8 = arg_543_1:GetWordFromCfg(1101906129)
				local var_546_9 = arg_543_1:FormatText(var_546_8.content)

				arg_543_1.text_.text = var_546_9

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_10 = 23
				local var_546_11 = utf8.len(var_546_9)
				local var_546_12 = var_546_10 <= 0 and var_546_7 or var_546_7 * (var_546_11 / var_546_10)

				if var_546_12 > 0 and var_546_7 < var_546_12 then
					arg_543_1.talkMaxDuration = var_546_12

					if var_546_12 + var_546_6 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_12 + var_546_6
					end
				end

				arg_543_1.text_.text = var_546_9
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_13 = math.max(var_546_7, arg_543_1.talkMaxDuration)

			if var_546_6 <= arg_543_1.time_ and arg_543_1.time_ < var_546_6 + var_546_13 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_6) / var_546_13

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_6 + var_546_13 and arg_543_1.time_ < var_546_6 + var_546_13 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906130 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 1101906130
		arg_547_1.duration_ = 5

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play1101906131(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = arg_547_1.actors_["1019ui_story"]
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 and arg_547_1.var_.characterEffect1019ui_story == nil then
				arg_547_1.var_.characterEffect1019ui_story = var_550_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_550_2 = 0.200000002980232

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_2 then
				local var_550_3 = (arg_547_1.time_ - var_550_1) / var_550_2

				if arg_547_1.var_.characterEffect1019ui_story then
					local var_550_4 = Mathf.Lerp(0, 0.5, var_550_3)

					arg_547_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_547_1.var_.characterEffect1019ui_story.fillRatio = var_550_4
				end
			end

			if arg_547_1.time_ >= var_550_1 + var_550_2 and arg_547_1.time_ < var_550_1 + var_550_2 + arg_550_0 and arg_547_1.var_.characterEffect1019ui_story then
				local var_550_5 = 0.5

				arg_547_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_547_1.var_.characterEffect1019ui_story.fillRatio = var_550_5
			end

			local var_550_6 = 0
			local var_550_7 = 0.075

			if var_550_6 < arg_547_1.time_ and arg_547_1.time_ <= var_550_6 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_8 = arg_547_1:FormatText(StoryNameCfg[7].name)

				arg_547_1.leftNameTxt_.text = var_550_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_9 = arg_547_1:GetWordFromCfg(1101906130)
				local var_550_10 = arg_547_1:FormatText(var_550_9.content)

				arg_547_1.text_.text = var_550_10

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_11 = 3
				local var_550_12 = utf8.len(var_550_10)
				local var_550_13 = var_550_11 <= 0 and var_550_7 or var_550_7 * (var_550_12 / var_550_11)

				if var_550_13 > 0 and var_550_7 < var_550_13 then
					arg_547_1.talkMaxDuration = var_550_13

					if var_550_13 + var_550_6 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_13 + var_550_6
					end
				end

				arg_547_1.text_.text = var_550_10
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)
				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_14 = math.max(var_550_7, arg_547_1.talkMaxDuration)

			if var_550_6 <= arg_547_1.time_ and arg_547_1.time_ < var_550_6 + var_550_14 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_6) / var_550_14

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_6 + var_550_14 and arg_547_1.time_ < var_550_6 + var_550_14 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906131 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 1101906131
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play1101906132(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0
			local var_554_1 = 1.05

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, false)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_2 = arg_551_1:GetWordFromCfg(1101906131)
				local var_554_3 = arg_551_1:FormatText(var_554_2.content)

				arg_551_1.text_.text = var_554_3

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_4 = 42
				local var_554_5 = utf8.len(var_554_3)
				local var_554_6 = var_554_4 <= 0 and var_554_1 or var_554_1 * (var_554_5 / var_554_4)

				if var_554_6 > 0 and var_554_1 < var_554_6 then
					arg_551_1.talkMaxDuration = var_554_6

					if var_554_6 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_6 + var_554_0
					end
				end

				arg_551_1.text_.text = var_554_3
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_7 = math.max(var_554_1, arg_551_1.talkMaxDuration)

			if var_554_0 <= arg_551_1.time_ and arg_551_1.time_ < var_554_0 + var_554_7 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_0) / var_554_7

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_0 + var_554_7 and arg_551_1.time_ < var_554_0 + var_554_7 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906132 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 1101906132
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play1101906133(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0
			local var_558_1 = 0.375

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, false)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_2 = arg_555_1:GetWordFromCfg(1101906132)
				local var_558_3 = arg_555_1:FormatText(var_558_2.content)

				arg_555_1.text_.text = var_558_3

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_4 = 15
				local var_558_5 = utf8.len(var_558_3)
				local var_558_6 = var_558_4 <= 0 and var_558_1 or var_558_1 * (var_558_5 / var_558_4)

				if var_558_6 > 0 and var_558_1 < var_558_6 then
					arg_555_1.talkMaxDuration = var_558_6

					if var_558_6 + var_558_0 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_6 + var_558_0
					end
				end

				arg_555_1.text_.text = var_558_3
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_7 = math.max(var_558_1, arg_555_1.talkMaxDuration)

			if var_558_0 <= arg_555_1.time_ and arg_555_1.time_ < var_558_0 + var_558_7 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_0) / var_558_7

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_0 + var_558_7 and arg_555_1.time_ < var_558_0 + var_558_7 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906133 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 1101906133
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play1101906134(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 0.375

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, false)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_2 = arg_559_1:GetWordFromCfg(1101906133)
				local var_562_3 = arg_559_1:FormatText(var_562_2.content)

				arg_559_1.text_.text = var_562_3

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_4 = 15
				local var_562_5 = utf8.len(var_562_3)
				local var_562_6 = var_562_4 <= 0 and var_562_1 or var_562_1 * (var_562_5 / var_562_4)

				if var_562_6 > 0 and var_562_1 < var_562_6 then
					arg_559_1.talkMaxDuration = var_562_6

					if var_562_6 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_6 + var_562_0
					end
				end

				arg_559_1.text_.text = var_562_3
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_7 = math.max(var_562_1, arg_559_1.talkMaxDuration)

			if var_562_0 <= arg_559_1.time_ and arg_559_1.time_ < var_562_0 + var_562_7 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_0) / var_562_7

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_0 + var_562_7 and arg_559_1.time_ < var_562_0 + var_562_7 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906134 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 1101906134
		arg_563_1.duration_ = 3.3

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play1101906135(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = arg_563_1.actors_["1019ui_story"]
			local var_566_1 = 0

			if var_566_1 < arg_563_1.time_ and arg_563_1.time_ <= var_566_1 + arg_566_0 and arg_563_1.var_.characterEffect1019ui_story == nil then
				arg_563_1.var_.characterEffect1019ui_story = var_566_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_566_2 = 0.200000002980232

			if var_566_1 <= arg_563_1.time_ and arg_563_1.time_ < var_566_1 + var_566_2 then
				local var_566_3 = (arg_563_1.time_ - var_566_1) / var_566_2

				if arg_563_1.var_.characterEffect1019ui_story then
					arg_563_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_563_1.time_ >= var_566_1 + var_566_2 and arg_563_1.time_ < var_566_1 + var_566_2 + arg_566_0 and arg_563_1.var_.characterEffect1019ui_story then
				arg_563_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_566_4 = 0

			if var_566_4 < arg_563_1.time_ and arg_563_1.time_ <= var_566_4 + arg_566_0 then
				arg_563_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_566_5 = 0
			local var_566_6 = 0.3

			if var_566_5 < arg_563_1.time_ and arg_563_1.time_ <= var_566_5 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_7 = arg_563_1:FormatText(StoryNameCfg[13].name)

				arg_563_1.leftNameTxt_.text = var_566_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_8 = arg_563_1:GetWordFromCfg(1101906134)
				local var_566_9 = arg_563_1:FormatText(var_566_8.content)

				arg_563_1.text_.text = var_566_9

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_10 = 12
				local var_566_11 = utf8.len(var_566_9)
				local var_566_12 = var_566_10 <= 0 and var_566_6 or var_566_6 * (var_566_11 / var_566_10)

				if var_566_12 > 0 and var_566_6 < var_566_12 then
					arg_563_1.talkMaxDuration = var_566_12

					if var_566_12 + var_566_5 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_12 + var_566_5
					end
				end

				arg_563_1.text_.text = var_566_9
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906134", "story_v_side_new_1101906.awb") ~= 0 then
					local var_566_13 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906134", "story_v_side_new_1101906.awb") / 1000

					if var_566_13 + var_566_5 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_13 + var_566_5
					end

					if var_566_8.prefab_name ~= "" and arg_563_1.actors_[var_566_8.prefab_name] ~= nil then
						local var_566_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_563_1.actors_[var_566_8.prefab_name].transform, "story_v_side_new_1101906", "1101906134", "story_v_side_new_1101906.awb")

						arg_563_1:RecordAudio("1101906134", var_566_14)
						arg_563_1:RecordAudio("1101906134", var_566_14)
					else
						arg_563_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906134", "story_v_side_new_1101906.awb")
					end

					arg_563_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906134", "story_v_side_new_1101906.awb")
				end

				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_15 = math.max(var_566_6, arg_563_1.talkMaxDuration)

			if var_566_5 <= arg_563_1.time_ and arg_563_1.time_ < var_566_5 + var_566_15 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_5) / var_566_15

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_5 + var_566_15 and arg_563_1.time_ < var_566_5 + var_566_15 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906135 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 1101906135
		arg_567_1.duration_ = 5

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play1101906136(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0
			local var_570_1 = 0.95

			if var_570_0 < arg_567_1.time_ and arg_567_1.time_ <= var_570_0 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, false)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_2 = arg_567_1:GetWordFromCfg(1101906135)
				local var_570_3 = arg_567_1:FormatText(var_570_2.content)

				arg_567_1.text_.text = var_570_3

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_4 = 38
				local var_570_5 = utf8.len(var_570_3)
				local var_570_6 = var_570_4 <= 0 and var_570_1 or var_570_1 * (var_570_5 / var_570_4)

				if var_570_6 > 0 and var_570_1 < var_570_6 then
					arg_567_1.talkMaxDuration = var_570_6

					if var_570_6 + var_570_0 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_6 + var_570_0
					end
				end

				arg_567_1.text_.text = var_570_3
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)
				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_7 = math.max(var_570_1, arg_567_1.talkMaxDuration)

			if var_570_0 <= arg_567_1.time_ and arg_567_1.time_ < var_570_0 + var_570_7 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_0) / var_570_7

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_0 + var_570_7 and arg_567_1.time_ < var_570_0 + var_570_7 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906136 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 1101906136
		arg_571_1.duration_ = 9

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play1101906137(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = "ST01"

			if arg_571_1.bgs_[var_574_0] == nil then
				local var_574_1 = Object.Instantiate(arg_571_1.paintGo_)

				var_574_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_574_0)
				var_574_1.name = var_574_0
				var_574_1.transform.parent = arg_571_1.stage_.transform
				var_574_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_571_1.bgs_[var_574_0] = var_574_1
			end

			local var_574_2 = 2

			if var_574_2 < arg_571_1.time_ and arg_571_1.time_ <= var_574_2 + arg_574_0 then
				local var_574_3 = manager.ui.mainCamera.transform.localPosition
				local var_574_4 = Vector3.New(0, 0, 10) + Vector3.New(var_574_3.x, var_574_3.y, 0)
				local var_574_5 = arg_571_1.bgs_.ST01

				var_574_5.transform.localPosition = var_574_4
				var_574_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_574_6 = var_574_5:GetComponent("SpriteRenderer")

				if var_574_6 and var_574_6.sprite then
					local var_574_7 = (var_574_5.transform.localPosition - var_574_3).z
					local var_574_8 = manager.ui.mainCameraCom_
					local var_574_9 = 2 * var_574_7 * Mathf.Tan(var_574_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_574_10 = var_574_9 * var_574_8.aspect
					local var_574_11 = var_574_6.sprite.bounds.size.x
					local var_574_12 = var_574_6.sprite.bounds.size.y
					local var_574_13 = var_574_10 / var_574_11
					local var_574_14 = var_574_9 / var_574_12
					local var_574_15 = var_574_14 < var_574_13 and var_574_13 or var_574_14

					var_574_5.transform.localScale = Vector3.New(var_574_15, var_574_15, 0)
				end

				for iter_574_0, iter_574_1 in pairs(arg_571_1.bgs_) do
					if iter_574_0 ~= "ST01" then
						iter_574_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_574_16 = 0

			if var_574_16 < arg_571_1.time_ and arg_571_1.time_ <= var_574_16 + arg_574_0 then
				arg_571_1.mask_.enabled = true
				arg_571_1.mask_.raycastTarget = true

				arg_571_1:SetGaussion(false)
			end

			local var_574_17 = 2

			if var_574_16 <= arg_571_1.time_ and arg_571_1.time_ < var_574_16 + var_574_17 then
				local var_574_18 = (arg_571_1.time_ - var_574_16) / var_574_17
				local var_574_19 = Color.New(0, 0, 0)

				var_574_19.a = Mathf.Lerp(0, 1, var_574_18)
				arg_571_1.mask_.color = var_574_19
			end

			if arg_571_1.time_ >= var_574_16 + var_574_17 and arg_571_1.time_ < var_574_16 + var_574_17 + arg_574_0 then
				local var_574_20 = Color.New(0, 0, 0)

				var_574_20.a = 1
				arg_571_1.mask_.color = var_574_20
			end

			local var_574_21 = 2

			if var_574_21 < arg_571_1.time_ and arg_571_1.time_ <= var_574_21 + arg_574_0 then
				arg_571_1.mask_.enabled = true
				arg_571_1.mask_.raycastTarget = true

				arg_571_1:SetGaussion(false)
			end

			local var_574_22 = 2

			if var_574_21 <= arg_571_1.time_ and arg_571_1.time_ < var_574_21 + var_574_22 then
				local var_574_23 = (arg_571_1.time_ - var_574_21) / var_574_22
				local var_574_24 = Color.New(0, 0, 0)

				var_574_24.a = Mathf.Lerp(1, 0, var_574_23)
				arg_571_1.mask_.color = var_574_24
			end

			if arg_571_1.time_ >= var_574_21 + var_574_22 and arg_571_1.time_ < var_574_21 + var_574_22 + arg_574_0 then
				local var_574_25 = Color.New(0, 0, 0)
				local var_574_26 = 0

				arg_571_1.mask_.enabled = false
				var_574_25.a = var_574_26
				arg_571_1.mask_.color = var_574_25
			end

			local var_574_27 = arg_571_1.actors_["1019ui_story"].transform
			local var_574_28 = 2

			if var_574_28 < arg_571_1.time_ and arg_571_1.time_ <= var_574_28 + arg_574_0 then
				arg_571_1.var_.moveOldPos1019ui_story = var_574_27.localPosition
			end

			local var_574_29 = 0.001

			if var_574_28 <= arg_571_1.time_ and arg_571_1.time_ < var_574_28 + var_574_29 then
				local var_574_30 = (arg_571_1.time_ - var_574_28) / var_574_29
				local var_574_31 = Vector3.New(0, 100, 0)

				var_574_27.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1019ui_story, var_574_31, var_574_30)

				local var_574_32 = manager.ui.mainCamera.transform.position - var_574_27.position

				var_574_27.forward = Vector3.New(var_574_32.x, var_574_32.y, var_574_32.z)

				local var_574_33 = var_574_27.localEulerAngles

				var_574_33.z = 0
				var_574_33.x = 0
				var_574_27.localEulerAngles = var_574_33
			end

			if arg_571_1.time_ >= var_574_28 + var_574_29 and arg_571_1.time_ < var_574_28 + var_574_29 + arg_574_0 then
				var_574_27.localPosition = Vector3.New(0, 100, 0)

				local var_574_34 = manager.ui.mainCamera.transform.position - var_574_27.position

				var_574_27.forward = Vector3.New(var_574_34.x, var_574_34.y, var_574_34.z)

				local var_574_35 = var_574_27.localEulerAngles

				var_574_35.z = 0
				var_574_35.x = 0
				var_574_27.localEulerAngles = var_574_35
			end

			local var_574_36 = arg_571_1.actors_["1019ui_story"]
			local var_574_37 = 2

			if var_574_37 < arg_571_1.time_ and arg_571_1.time_ <= var_574_37 + arg_574_0 and arg_571_1.var_.characterEffect1019ui_story == nil then
				arg_571_1.var_.characterEffect1019ui_story = var_574_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_38 = 0.200000002980232

			if var_574_37 <= arg_571_1.time_ and arg_571_1.time_ < var_574_37 + var_574_38 then
				local var_574_39 = (arg_571_1.time_ - var_574_37) / var_574_38

				if arg_571_1.var_.characterEffect1019ui_story then
					local var_574_40 = Mathf.Lerp(0, 0.5, var_574_39)

					arg_571_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_571_1.var_.characterEffect1019ui_story.fillRatio = var_574_40
				end
			end

			if arg_571_1.time_ >= var_574_37 + var_574_38 and arg_571_1.time_ < var_574_37 + var_574_38 + arg_574_0 and arg_571_1.var_.characterEffect1019ui_story then
				local var_574_41 = 0.5

				arg_571_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_571_1.var_.characterEffect1019ui_story.fillRatio = var_574_41
			end

			local var_574_42 = arg_571_1.actors_.ST01
			local var_574_43 = 2

			if var_574_43 < arg_571_1.time_ and arg_571_1.time_ <= var_574_43 + arg_574_0 then
				local var_574_44 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_574_44 then
					var_574_44.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_574_44.radialBlurScale = 0
					var_574_44.radialBlurGradient = 1
					var_574_44.radialBlurIntensity = 1

					if var_574_42 then
						var_574_44.radialBlurTarget = var_574_42.transform
					end
				end
			end

			local var_574_45 = 1.96599999815226

			if var_574_43 <= arg_571_1.time_ and arg_571_1.time_ < var_574_43 + var_574_45 then
				local var_574_46 = (arg_571_1.time_ - var_574_43) / var_574_45
				local var_574_47 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_574_47 then
					var_574_47.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_574_47.radialBlurScale = Mathf.Lerp(0, 0, var_574_46)
					var_574_47.radialBlurGradient = Mathf.Lerp(1, 0, var_574_46)
					var_574_47.radialBlurIntensity = Mathf.Lerp(1, 0, var_574_46)
				end
			end

			if arg_571_1.time_ >= var_574_43 + var_574_45 and arg_571_1.time_ < var_574_43 + var_574_45 + arg_574_0 then
				local var_574_48 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_574_48 then
					var_574_48.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_574_48.radialBlurScale = 0
					var_574_48.radialBlurGradient = 0
					var_574_48.radialBlurIntensity = 0
				end
			end

			if arg_571_1.frameCnt_ <= 1 then
				arg_571_1.dialog_:SetActive(false)
			end

			local var_574_49 = 4
			local var_574_50 = 1.05

			if var_574_49 < arg_571_1.time_ and arg_571_1.time_ <= var_574_49 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0

				arg_571_1.dialog_:SetActive(true)

				local var_574_51 = LeanTween.value(arg_571_1.dialog_, 0, 1, 0.3)

				var_574_51:setOnUpdate(LuaHelper.FloatAction(function(arg_575_0)
					arg_571_1.dialogCg_.alpha = arg_575_0
				end))
				var_574_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_571_1.dialog_)
					var_574_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_571_1.duration_ = arg_571_1.duration_ + 0.3

				SetActive(arg_571_1.leftNameGo_, false)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_52 = arg_571_1:GetWordFromCfg(1101906136)
				local var_574_53 = arg_571_1:FormatText(var_574_52.content)

				arg_571_1.text_.text = var_574_53

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_54 = 42
				local var_574_55 = utf8.len(var_574_53)
				local var_574_56 = var_574_54 <= 0 and var_574_50 or var_574_50 * (var_574_55 / var_574_54)

				if var_574_56 > 0 and var_574_50 < var_574_56 then
					arg_571_1.talkMaxDuration = var_574_56
					var_574_49 = var_574_49 + 0.3

					if var_574_56 + var_574_49 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_56 + var_574_49
					end
				end

				arg_571_1.text_.text = var_574_53
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_57 = var_574_49 + 0.3
			local var_574_58 = math.max(var_574_50, arg_571_1.talkMaxDuration)

			if var_574_57 <= arg_571_1.time_ and arg_571_1.time_ < var_574_57 + var_574_58 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_57) / var_574_58

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_57 + var_574_58 and arg_571_1.time_ < var_574_57 + var_574_58 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906137 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 1101906137
		arg_577_1.duration_ = 5

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play1101906138(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = 0
			local var_580_1 = 1.525

			if var_580_0 < arg_577_1.time_ and arg_577_1.time_ <= var_580_0 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, false)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_2 = arg_577_1:GetWordFromCfg(1101906137)
				local var_580_3 = arg_577_1:FormatText(var_580_2.content)

				arg_577_1.text_.text = var_580_3

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_4 = 61
				local var_580_5 = utf8.len(var_580_3)
				local var_580_6 = var_580_4 <= 0 and var_580_1 or var_580_1 * (var_580_5 / var_580_4)

				if var_580_6 > 0 and var_580_1 < var_580_6 then
					arg_577_1.talkMaxDuration = var_580_6

					if var_580_6 + var_580_0 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_6 + var_580_0
					end
				end

				arg_577_1.text_.text = var_580_3
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)
				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_7 = math.max(var_580_1, arg_577_1.talkMaxDuration)

			if var_580_0 <= arg_577_1.time_ and arg_577_1.time_ < var_580_0 + var_580_7 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_0) / var_580_7

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_0 + var_580_7 and arg_577_1.time_ < var_580_0 + var_580_7 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906138 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 1101906138
		arg_581_1.duration_ = 5

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play1101906139(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = 0
			local var_584_1 = 0.4

			if var_584_0 < arg_581_1.time_ and arg_581_1.time_ <= var_584_0 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, true)

				local var_584_2 = arg_581_1:FormatText(StoryNameCfg[7].name)

				arg_581_1.leftNameTxt_.text = var_584_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_581_1.leftNameTxt_.transform)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1.leftNameTxt_.text)
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_3 = arg_581_1:GetWordFromCfg(1101906138)
				local var_584_4 = arg_581_1:FormatText(var_584_3.content)

				arg_581_1.text_.text = var_584_4

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_5 = 16
				local var_584_6 = utf8.len(var_584_4)
				local var_584_7 = var_584_5 <= 0 and var_584_1 or var_584_1 * (var_584_6 / var_584_5)

				if var_584_7 > 0 and var_584_1 < var_584_7 then
					arg_581_1.talkMaxDuration = var_584_7

					if var_584_7 + var_584_0 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_7 + var_584_0
					end
				end

				arg_581_1.text_.text = var_584_4
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)
				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_8 = math.max(var_584_1, arg_581_1.talkMaxDuration)

			if var_584_0 <= arg_581_1.time_ and arg_581_1.time_ < var_584_0 + var_584_8 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_0) / var_584_8

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_0 + var_584_8 and arg_581_1.time_ < var_584_0 + var_584_8 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906139 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 1101906139
		arg_585_1.duration_ = 9

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play1101906140(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = "ST12"

			if arg_585_1.bgs_[var_588_0] == nil then
				local var_588_1 = Object.Instantiate(arg_585_1.paintGo_)

				var_588_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_588_0)
				var_588_1.name = var_588_0
				var_588_1.transform.parent = arg_585_1.stage_.transform
				var_588_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_585_1.bgs_[var_588_0] = var_588_1
			end

			local var_588_2 = 2

			if var_588_2 < arg_585_1.time_ and arg_585_1.time_ <= var_588_2 + arg_588_0 then
				local var_588_3 = manager.ui.mainCamera.transform.localPosition
				local var_588_4 = Vector3.New(0, 0, 10) + Vector3.New(var_588_3.x, var_588_3.y, 0)
				local var_588_5 = arg_585_1.bgs_.ST12

				var_588_5.transform.localPosition = var_588_4
				var_588_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_588_6 = var_588_5:GetComponent("SpriteRenderer")

				if var_588_6 and var_588_6.sprite then
					local var_588_7 = (var_588_5.transform.localPosition - var_588_3).z
					local var_588_8 = manager.ui.mainCameraCom_
					local var_588_9 = 2 * var_588_7 * Mathf.Tan(var_588_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_588_10 = var_588_9 * var_588_8.aspect
					local var_588_11 = var_588_6.sprite.bounds.size.x
					local var_588_12 = var_588_6.sprite.bounds.size.y
					local var_588_13 = var_588_10 / var_588_11
					local var_588_14 = var_588_9 / var_588_12
					local var_588_15 = var_588_14 < var_588_13 and var_588_13 or var_588_14

					var_588_5.transform.localScale = Vector3.New(var_588_15, var_588_15, 0)
				end

				for iter_588_0, iter_588_1 in pairs(arg_585_1.bgs_) do
					if iter_588_0 ~= "ST12" then
						iter_588_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_588_16 = 0

			if var_588_16 < arg_585_1.time_ and arg_585_1.time_ <= var_588_16 + arg_588_0 then
				arg_585_1.mask_.enabled = true
				arg_585_1.mask_.raycastTarget = true

				arg_585_1:SetGaussion(false)
			end

			local var_588_17 = 2

			if var_588_16 <= arg_585_1.time_ and arg_585_1.time_ < var_588_16 + var_588_17 then
				local var_588_18 = (arg_585_1.time_ - var_588_16) / var_588_17
				local var_588_19 = Color.New(0, 0, 0)

				var_588_19.a = Mathf.Lerp(0, 1, var_588_18)
				arg_585_1.mask_.color = var_588_19
			end

			if arg_585_1.time_ >= var_588_16 + var_588_17 and arg_585_1.time_ < var_588_16 + var_588_17 + arg_588_0 then
				local var_588_20 = Color.New(0, 0, 0)

				var_588_20.a = 1
				arg_585_1.mask_.color = var_588_20
			end

			local var_588_21 = 2

			if var_588_21 < arg_585_1.time_ and arg_585_1.time_ <= var_588_21 + arg_588_0 then
				arg_585_1.mask_.enabled = true
				arg_585_1.mask_.raycastTarget = true

				arg_585_1:SetGaussion(false)
			end

			local var_588_22 = 2

			if var_588_21 <= arg_585_1.time_ and arg_585_1.time_ < var_588_21 + var_588_22 then
				local var_588_23 = (arg_585_1.time_ - var_588_21) / var_588_22
				local var_588_24 = Color.New(0, 0, 0)

				var_588_24.a = Mathf.Lerp(1, 0, var_588_23)
				arg_585_1.mask_.color = var_588_24
			end

			if arg_585_1.time_ >= var_588_21 + var_588_22 and arg_585_1.time_ < var_588_21 + var_588_22 + arg_588_0 then
				local var_588_25 = Color.New(0, 0, 0)
				local var_588_26 = 0

				arg_585_1.mask_.enabled = false
				var_588_25.a = var_588_26
				arg_585_1.mask_.color = var_588_25
			end

			if arg_585_1.frameCnt_ <= 1 then
				arg_585_1.dialog_:SetActive(false)
			end

			local var_588_27 = 4
			local var_588_28 = 1.05

			if var_588_27 < arg_585_1.time_ and arg_585_1.time_ <= var_588_27 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0

				arg_585_1.dialog_:SetActive(true)

				local var_588_29 = LeanTween.value(arg_585_1.dialog_, 0, 1, 0.3)

				var_588_29:setOnUpdate(LuaHelper.FloatAction(function(arg_589_0)
					arg_585_1.dialogCg_.alpha = arg_589_0
				end))
				var_588_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_585_1.dialog_)
					var_588_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_585_1.duration_ = arg_585_1.duration_ + 0.3

				SetActive(arg_585_1.leftNameGo_, false)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_30 = arg_585_1:GetWordFromCfg(1101906139)
				local var_588_31 = arg_585_1:FormatText(var_588_30.content)

				arg_585_1.text_.text = var_588_31

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_32 = 42
				local var_588_33 = utf8.len(var_588_31)
				local var_588_34 = var_588_32 <= 0 and var_588_28 or var_588_28 * (var_588_33 / var_588_32)

				if var_588_34 > 0 and var_588_28 < var_588_34 then
					arg_585_1.talkMaxDuration = var_588_34
					var_588_27 = var_588_27 + 0.3

					if var_588_34 + var_588_27 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_34 + var_588_27
					end
				end

				arg_585_1.text_.text = var_588_31
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)
				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_35 = var_588_27 + 0.3
			local var_588_36 = math.max(var_588_28, arg_585_1.talkMaxDuration)

			if var_588_35 <= arg_585_1.time_ and arg_585_1.time_ < var_588_35 + var_588_36 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_35) / var_588_36

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_35 + var_588_36 and arg_585_1.time_ < var_588_35 + var_588_36 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906140 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 1101906140
		arg_591_1.duration_ = 5

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play1101906141(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = 0
			local var_594_1 = 0.5

			if var_594_0 < arg_591_1.time_ and arg_591_1.time_ <= var_594_0 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_2 = arg_591_1:FormatText(StoryNameCfg[7].name)

				arg_591_1.leftNameTxt_.text = var_594_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_3 = arg_591_1:GetWordFromCfg(1101906140)
				local var_594_4 = arg_591_1:FormatText(var_594_3.content)

				arg_591_1.text_.text = var_594_4

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_5 = 20
				local var_594_6 = utf8.len(var_594_4)
				local var_594_7 = var_594_5 <= 0 and var_594_1 or var_594_1 * (var_594_6 / var_594_5)

				if var_594_7 > 0 and var_594_1 < var_594_7 then
					arg_591_1.talkMaxDuration = var_594_7

					if var_594_7 + var_594_0 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_7 + var_594_0
					end
				end

				arg_591_1.text_.text = var_594_4
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)
				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_8 = math.max(var_594_1, arg_591_1.talkMaxDuration)

			if var_594_0 <= arg_591_1.time_ and arg_591_1.time_ < var_594_0 + var_594_8 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_0) / var_594_8

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_0 + var_594_8 and arg_591_1.time_ < var_594_0 + var_594_8 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906141 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 1101906141
		arg_595_1.duration_ = 5

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play1101906142(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = 0
			local var_598_1 = 1.175

			if var_598_0 < arg_595_1.time_ and arg_595_1.time_ <= var_598_0 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, false)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_2 = arg_595_1:GetWordFromCfg(1101906141)
				local var_598_3 = arg_595_1:FormatText(var_598_2.content)

				arg_595_1.text_.text = var_598_3

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_4 = 47
				local var_598_5 = utf8.len(var_598_3)
				local var_598_6 = var_598_4 <= 0 and var_598_1 or var_598_1 * (var_598_5 / var_598_4)

				if var_598_6 > 0 and var_598_1 < var_598_6 then
					arg_595_1.talkMaxDuration = var_598_6

					if var_598_6 + var_598_0 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_6 + var_598_0
					end
				end

				arg_595_1.text_.text = var_598_3
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)
				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_7 = math.max(var_598_1, arg_595_1.talkMaxDuration)

			if var_598_0 <= arg_595_1.time_ and arg_595_1.time_ < var_598_0 + var_598_7 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_0) / var_598_7

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_0 + var_598_7 and arg_595_1.time_ < var_598_0 + var_598_7 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906142 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 1101906142
		arg_599_1.duration_ = 5

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play1101906143(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = 0
			local var_602_1 = 0.3

			if var_602_0 < arg_599_1.time_ and arg_599_1.time_ <= var_602_0 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_2 = arg_599_1:FormatText(StoryNameCfg[7].name)

				arg_599_1.leftNameTxt_.text = var_602_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_3 = arg_599_1:GetWordFromCfg(1101906142)
				local var_602_4 = arg_599_1:FormatText(var_602_3.content)

				arg_599_1.text_.text = var_602_4

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_5 = 12
				local var_602_6 = utf8.len(var_602_4)
				local var_602_7 = var_602_5 <= 0 and var_602_1 or var_602_1 * (var_602_6 / var_602_5)

				if var_602_7 > 0 and var_602_1 < var_602_7 then
					arg_599_1.talkMaxDuration = var_602_7

					if var_602_7 + var_602_0 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_7 + var_602_0
					end
				end

				arg_599_1.text_.text = var_602_4
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)
				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_8 = math.max(var_602_1, arg_599_1.talkMaxDuration)

			if var_602_0 <= arg_599_1.time_ and arg_599_1.time_ < var_602_0 + var_602_8 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_0) / var_602_8

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_0 + var_602_8 and arg_599_1.time_ < var_602_0 + var_602_8 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906143 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 1101906143
		arg_603_1.duration_ = 3.4

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play1101906144(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 0.1

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_2 = arg_603_1:FormatText(StoryNameCfg[36].name)

				arg_603_1.leftNameTxt_.text = var_606_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, true)
				arg_603_1.iconController_:SetSelectedState("hero")

				arg_603_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_3 = arg_603_1:GetWordFromCfg(1101906143)
				local var_606_4 = arg_603_1:FormatText(var_606_3.content)

				arg_603_1.text_.text = var_606_4

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_5 = 4
				local var_606_6 = utf8.len(var_606_4)
				local var_606_7 = var_606_5 <= 0 and var_606_1 or var_606_1 * (var_606_6 / var_606_5)

				if var_606_7 > 0 and var_606_1 < var_606_7 then
					arg_603_1.talkMaxDuration = var_606_7

					if var_606_7 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_7 + var_606_0
					end
				end

				arg_603_1.text_.text = var_606_4
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906143", "story_v_side_new_1101906.awb") ~= 0 then
					local var_606_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906143", "story_v_side_new_1101906.awb") / 1000

					if var_606_8 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_8 + var_606_0
					end

					if var_606_3.prefab_name ~= "" and arg_603_1.actors_[var_606_3.prefab_name] ~= nil then
						local var_606_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_603_1.actors_[var_606_3.prefab_name].transform, "story_v_side_new_1101906", "1101906143", "story_v_side_new_1101906.awb")

						arg_603_1:RecordAudio("1101906143", var_606_9)
						arg_603_1:RecordAudio("1101906143", var_606_9)
					else
						arg_603_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906143", "story_v_side_new_1101906.awb")
					end

					arg_603_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906143", "story_v_side_new_1101906.awb")
				end

				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_10 = math.max(var_606_1, arg_603_1.talkMaxDuration)

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_10 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_0) / var_606_10

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_0 + var_606_10 and arg_603_1.time_ < var_606_0 + var_606_10 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906144 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 1101906144
		arg_607_1.duration_ = 5

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play1101906145(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = 0
			local var_610_1 = 0.125

			if var_610_0 < arg_607_1.time_ and arg_607_1.time_ <= var_610_0 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_2 = arg_607_1:FormatText(StoryNameCfg[7].name)

				arg_607_1.leftNameTxt_.text = var_610_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_3 = arg_607_1:GetWordFromCfg(1101906144)
				local var_610_4 = arg_607_1:FormatText(var_610_3.content)

				arg_607_1.text_.text = var_610_4

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_5 = 5
				local var_610_6 = utf8.len(var_610_4)
				local var_610_7 = var_610_5 <= 0 and var_610_1 or var_610_1 * (var_610_6 / var_610_5)

				if var_610_7 > 0 and var_610_1 < var_610_7 then
					arg_607_1.talkMaxDuration = var_610_7

					if var_610_7 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_7 + var_610_0
					end
				end

				arg_607_1.text_.text = var_610_4
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)
				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_8 = math.max(var_610_1, arg_607_1.talkMaxDuration)

			if var_610_0 <= arg_607_1.time_ and arg_607_1.time_ < var_610_0 + var_610_8 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_0) / var_610_8

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_0 + var_610_8 and arg_607_1.time_ < var_610_0 + var_610_8 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906145 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 1101906145
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play1101906146(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = 0
			local var_614_1 = 1.075

			if var_614_0 < arg_611_1.time_ and arg_611_1.time_ <= var_614_0 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, false)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_2 = arg_611_1:GetWordFromCfg(1101906145)
				local var_614_3 = arg_611_1:FormatText(var_614_2.content)

				arg_611_1.text_.text = var_614_3

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_4 = 43
				local var_614_5 = utf8.len(var_614_3)
				local var_614_6 = var_614_4 <= 0 and var_614_1 or var_614_1 * (var_614_5 / var_614_4)

				if var_614_6 > 0 and var_614_1 < var_614_6 then
					arg_611_1.talkMaxDuration = var_614_6

					if var_614_6 + var_614_0 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_6 + var_614_0
					end
				end

				arg_611_1.text_.text = var_614_3
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_7 = math.max(var_614_1, arg_611_1.talkMaxDuration)

			if var_614_0 <= arg_611_1.time_ and arg_611_1.time_ < var_614_0 + var_614_7 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_0) / var_614_7

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_0 + var_614_7 and arg_611_1.time_ < var_614_0 + var_614_7 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906146 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 1101906146
		arg_615_1.duration_ = 5

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play1101906147(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0
			local var_618_1 = 0.875

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, false)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_2 = arg_615_1:GetWordFromCfg(1101906146)
				local var_618_3 = arg_615_1:FormatText(var_618_2.content)

				arg_615_1.text_.text = var_618_3

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_4 = 35
				local var_618_5 = utf8.len(var_618_3)
				local var_618_6 = var_618_4 <= 0 and var_618_1 or var_618_1 * (var_618_5 / var_618_4)

				if var_618_6 > 0 and var_618_1 < var_618_6 then
					arg_615_1.talkMaxDuration = var_618_6

					if var_618_6 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_6 + var_618_0
					end
				end

				arg_615_1.text_.text = var_618_3
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)
				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_7 = math.max(var_618_1, arg_615_1.talkMaxDuration)

			if var_618_0 <= arg_615_1.time_ and arg_615_1.time_ < var_618_0 + var_618_7 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_0) / var_618_7

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_0 + var_618_7 and arg_615_1.time_ < var_618_0 + var_618_7 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906147 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 1101906147
		arg_619_1.duration_ = 5

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play1101906148(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 1.5

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, false)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_2 = arg_619_1:GetWordFromCfg(1101906147)
				local var_622_3 = arg_619_1:FormatText(var_622_2.content)

				arg_619_1.text_.text = var_622_3

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_4 = 60
				local var_622_5 = utf8.len(var_622_3)
				local var_622_6 = var_622_4 <= 0 and var_622_1 or var_622_1 * (var_622_5 / var_622_4)

				if var_622_6 > 0 and var_622_1 < var_622_6 then
					arg_619_1.talkMaxDuration = var_622_6

					if var_622_6 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_6 + var_622_0
					end
				end

				arg_619_1.text_.text = var_622_3
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)
				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_7 = math.max(var_622_1, arg_619_1.talkMaxDuration)

			if var_622_0 <= arg_619_1.time_ and arg_619_1.time_ < var_622_0 + var_622_7 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_0) / var_622_7

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_0 + var_622_7 and arg_619_1.time_ < var_622_0 + var_622_7 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906148 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 1101906148
		arg_623_1.duration_ = 5

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play1101906149(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = 0
			local var_626_1 = 0.675

			if var_626_0 < arg_623_1.time_ and arg_623_1.time_ <= var_626_0 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, false)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_2 = arg_623_1:GetWordFromCfg(1101906148)
				local var_626_3 = arg_623_1:FormatText(var_626_2.content)

				arg_623_1.text_.text = var_626_3

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_4 = 27
				local var_626_5 = utf8.len(var_626_3)
				local var_626_6 = var_626_4 <= 0 and var_626_1 or var_626_1 * (var_626_5 / var_626_4)

				if var_626_6 > 0 and var_626_1 < var_626_6 then
					arg_623_1.talkMaxDuration = var_626_6

					if var_626_6 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_6 + var_626_0
					end
				end

				arg_623_1.text_.text = var_626_3
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)
				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_7 = math.max(var_626_1, arg_623_1.talkMaxDuration)

			if var_626_0 <= arg_623_1.time_ and arg_623_1.time_ < var_626_0 + var_626_7 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_0) / var_626_7

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_0 + var_626_7 and arg_623_1.time_ < var_626_0 + var_626_7 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906149 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 1101906149
		arg_627_1.duration_ = 8.966

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play1101906150(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["1019ui_story"].transform
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 then
				arg_627_1.var_.moveOldPos1019ui_story = var_630_0.localPosition
			end

			local var_630_2 = 0.001

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2
				local var_630_4 = Vector3.New(0, -1.08, -5.9)

				var_630_0.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos1019ui_story, var_630_4, var_630_3)

				local var_630_5 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_5.x, var_630_5.y, var_630_5.z)

				local var_630_6 = var_630_0.localEulerAngles

				var_630_6.z = 0
				var_630_6.x = 0
				var_630_0.localEulerAngles = var_630_6
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 then
				var_630_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_630_7 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_7.x, var_630_7.y, var_630_7.z)

				local var_630_8 = var_630_0.localEulerAngles

				var_630_8.z = 0
				var_630_8.x = 0
				var_630_0.localEulerAngles = var_630_8
			end

			local var_630_9 = arg_627_1.actors_["1019ui_story"]
			local var_630_10 = 0

			if var_630_10 < arg_627_1.time_ and arg_627_1.time_ <= var_630_10 + arg_630_0 and arg_627_1.var_.characterEffect1019ui_story == nil then
				arg_627_1.var_.characterEffect1019ui_story = var_630_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_11 = 0.200000002980232

			if var_630_10 <= arg_627_1.time_ and arg_627_1.time_ < var_630_10 + var_630_11 then
				local var_630_12 = (arg_627_1.time_ - var_630_10) / var_630_11

				if arg_627_1.var_.characterEffect1019ui_story then
					arg_627_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_627_1.time_ >= var_630_10 + var_630_11 and arg_627_1.time_ < var_630_10 + var_630_11 + arg_630_0 and arg_627_1.var_.characterEffect1019ui_story then
				arg_627_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_630_13 = 0

			if var_630_13 < arg_627_1.time_ and arg_627_1.time_ <= var_630_13 + arg_630_0 then
				arg_627_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_630_14 = 0

			if var_630_14 < arg_627_1.time_ and arg_627_1.time_ <= var_630_14 + arg_630_0 then
				arg_627_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_630_15 = 0
			local var_630_16 = 0.35

			if var_630_15 < arg_627_1.time_ and arg_627_1.time_ <= var_630_15 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_17 = arg_627_1:FormatText(StoryNameCfg[13].name)

				arg_627_1.leftNameTxt_.text = var_630_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_18 = arg_627_1:GetWordFromCfg(1101906149)
				local var_630_19 = arg_627_1:FormatText(var_630_18.content)

				arg_627_1.text_.text = var_630_19

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_20 = 14
				local var_630_21 = utf8.len(var_630_19)
				local var_630_22 = var_630_20 <= 0 and var_630_16 or var_630_16 * (var_630_21 / var_630_20)

				if var_630_22 > 0 and var_630_16 < var_630_22 then
					arg_627_1.talkMaxDuration = var_630_22

					if var_630_22 + var_630_15 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_22 + var_630_15
					end
				end

				arg_627_1.text_.text = var_630_19
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906149", "story_v_side_new_1101906.awb") ~= 0 then
					local var_630_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906149", "story_v_side_new_1101906.awb") / 1000

					if var_630_23 + var_630_15 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_23 + var_630_15
					end

					if var_630_18.prefab_name ~= "" and arg_627_1.actors_[var_630_18.prefab_name] ~= nil then
						local var_630_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_18.prefab_name].transform, "story_v_side_new_1101906", "1101906149", "story_v_side_new_1101906.awb")

						arg_627_1:RecordAudio("1101906149", var_630_24)
						arg_627_1:RecordAudio("1101906149", var_630_24)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906149", "story_v_side_new_1101906.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906149", "story_v_side_new_1101906.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_25 = math.max(var_630_16, arg_627_1.talkMaxDuration)

			if var_630_15 <= arg_627_1.time_ and arg_627_1.time_ < var_630_15 + var_630_25 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_15) / var_630_25

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_15 + var_630_25 and arg_627_1.time_ < var_630_15 + var_630_25 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906150 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 1101906150
		arg_631_1.duration_ = 5

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play1101906151(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1019ui_story"]
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 and arg_631_1.var_.characterEffect1019ui_story == nil then
				arg_631_1.var_.characterEffect1019ui_story = var_634_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_2 = 0.200000002980232

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2

				if arg_631_1.var_.characterEffect1019ui_story then
					local var_634_4 = Mathf.Lerp(0, 0.5, var_634_3)

					arg_631_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_631_1.var_.characterEffect1019ui_story.fillRatio = var_634_4
				end
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 and arg_631_1.var_.characterEffect1019ui_story then
				local var_634_5 = 0.5

				arg_631_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_631_1.var_.characterEffect1019ui_story.fillRatio = var_634_5
			end

			local var_634_6 = 0
			local var_634_7 = 0.2

			if var_634_6 < arg_631_1.time_ and arg_631_1.time_ <= var_634_6 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_8 = arg_631_1:FormatText(StoryNameCfg[7].name)

				arg_631_1.leftNameTxt_.text = var_634_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_9 = arg_631_1:GetWordFromCfg(1101906150)
				local var_634_10 = arg_631_1:FormatText(var_634_9.content)

				arg_631_1.text_.text = var_634_10

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_11 = 8
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
	Play1101906151 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 1101906151
		arg_635_1.duration_ = 2.666

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play1101906152(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1019ui_story"]
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 and arg_635_1.var_.characterEffect1019ui_story == nil then
				arg_635_1.var_.characterEffect1019ui_story = var_638_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_2 = 0.200000002980232

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2

				if arg_635_1.var_.characterEffect1019ui_story then
					arg_635_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 and arg_635_1.var_.characterEffect1019ui_story then
				arg_635_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_638_4 = 0

			if var_638_4 < arg_635_1.time_ and arg_635_1.time_ <= var_638_4 + arg_638_0 then
				arg_635_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_638_5 = 0
			local var_638_6 = 0.1

			if var_638_5 < arg_635_1.time_ and arg_635_1.time_ <= var_638_5 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_7 = arg_635_1:FormatText(StoryNameCfg[13].name)

				arg_635_1.leftNameTxt_.text = var_638_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_8 = arg_635_1:GetWordFromCfg(1101906151)
				local var_638_9 = arg_635_1:FormatText(var_638_8.content)

				arg_635_1.text_.text = var_638_9

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_10 = 4
				local var_638_11 = utf8.len(var_638_9)
				local var_638_12 = var_638_10 <= 0 and var_638_6 or var_638_6 * (var_638_11 / var_638_10)

				if var_638_12 > 0 and var_638_6 < var_638_12 then
					arg_635_1.talkMaxDuration = var_638_12

					if var_638_12 + var_638_5 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_12 + var_638_5
					end
				end

				arg_635_1.text_.text = var_638_9
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906151", "story_v_side_new_1101906.awb") ~= 0 then
					local var_638_13 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906151", "story_v_side_new_1101906.awb") / 1000

					if var_638_13 + var_638_5 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_13 + var_638_5
					end

					if var_638_8.prefab_name ~= "" and arg_635_1.actors_[var_638_8.prefab_name] ~= nil then
						local var_638_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_635_1.actors_[var_638_8.prefab_name].transform, "story_v_side_new_1101906", "1101906151", "story_v_side_new_1101906.awb")

						arg_635_1:RecordAudio("1101906151", var_638_14)
						arg_635_1:RecordAudio("1101906151", var_638_14)
					else
						arg_635_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906151", "story_v_side_new_1101906.awb")
					end

					arg_635_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906151", "story_v_side_new_1101906.awb")
				end

				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_15 = math.max(var_638_6, arg_635_1.talkMaxDuration)

			if var_638_5 <= arg_635_1.time_ and arg_635_1.time_ < var_638_5 + var_638_15 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_5) / var_638_15

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_5 + var_638_15 and arg_635_1.time_ < var_638_5 + var_638_15 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906152 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 1101906152
		arg_639_1.duration_ = 5

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play1101906153(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = arg_639_1.actors_["1019ui_story"]
			local var_642_1 = 0

			if var_642_1 < arg_639_1.time_ and arg_639_1.time_ <= var_642_1 + arg_642_0 and arg_639_1.var_.characterEffect1019ui_story == nil then
				arg_639_1.var_.characterEffect1019ui_story = var_642_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_2 = 0.200000002980232

			if var_642_1 <= arg_639_1.time_ and arg_639_1.time_ < var_642_1 + var_642_2 then
				local var_642_3 = (arg_639_1.time_ - var_642_1) / var_642_2

				if arg_639_1.var_.characterEffect1019ui_story then
					local var_642_4 = Mathf.Lerp(0, 0.5, var_642_3)

					arg_639_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_639_1.var_.characterEffect1019ui_story.fillRatio = var_642_4
				end
			end

			if arg_639_1.time_ >= var_642_1 + var_642_2 and arg_639_1.time_ < var_642_1 + var_642_2 + arg_642_0 and arg_639_1.var_.characterEffect1019ui_story then
				local var_642_5 = 0.5

				arg_639_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_639_1.var_.characterEffect1019ui_story.fillRatio = var_642_5
			end

			local var_642_6 = 0
			local var_642_7 = 0.35

			if var_642_6 < arg_639_1.time_ and arg_639_1.time_ <= var_642_6 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_8 = arg_639_1:FormatText(StoryNameCfg[7].name)

				arg_639_1.leftNameTxt_.text = var_642_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_9 = arg_639_1:GetWordFromCfg(1101906152)
				local var_642_10 = arg_639_1:FormatText(var_642_9.content)

				arg_639_1.text_.text = var_642_10

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_11 = 14
				local var_642_12 = utf8.len(var_642_10)
				local var_642_13 = var_642_11 <= 0 and var_642_7 or var_642_7 * (var_642_12 / var_642_11)

				if var_642_13 > 0 and var_642_7 < var_642_13 then
					arg_639_1.talkMaxDuration = var_642_13

					if var_642_13 + var_642_6 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_13 + var_642_6
					end
				end

				arg_639_1.text_.text = var_642_10
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)
				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_14 = math.max(var_642_7, arg_639_1.talkMaxDuration)

			if var_642_6 <= arg_639_1.time_ and arg_639_1.time_ < var_642_6 + var_642_14 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_6) / var_642_14

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_6 + var_642_14 and arg_639_1.time_ < var_642_6 + var_642_14 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906153 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 1101906153
		arg_643_1.duration_ = 7.966

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play1101906154(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["1019ui_story"]
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 and arg_643_1.var_.characterEffect1019ui_story == nil then
				arg_643_1.var_.characterEffect1019ui_story = var_646_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_2 = 0.200000002980232

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2

				if arg_643_1.var_.characterEffect1019ui_story then
					local var_646_4 = Mathf.Lerp(0, 0.5, var_646_3)

					arg_643_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_643_1.var_.characterEffect1019ui_story.fillRatio = var_646_4
				end
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 and arg_643_1.var_.characterEffect1019ui_story then
				local var_646_5 = 0.5

				arg_643_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_643_1.var_.characterEffect1019ui_story.fillRatio = var_646_5
			end

			local var_646_6 = 0

			if var_646_6 < arg_643_1.time_ and arg_643_1.time_ <= var_646_6 + arg_646_0 then
				arg_643_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_646_7 = 0
			local var_646_8 = 0.775

			if var_646_7 < arg_643_1.time_ and arg_643_1.time_ <= var_646_7 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_9 = arg_643_1:FormatText(StoryNameCfg[13].name)

				arg_643_1.leftNameTxt_.text = var_646_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_10 = arg_643_1:GetWordFromCfg(1101906153)
				local var_646_11 = arg_643_1:FormatText(var_646_10.content)

				arg_643_1.text_.text = var_646_11

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_12 = 31
				local var_646_13 = utf8.len(var_646_11)
				local var_646_14 = var_646_12 <= 0 and var_646_8 or var_646_8 * (var_646_13 / var_646_12)

				if var_646_14 > 0 and var_646_8 < var_646_14 then
					arg_643_1.talkMaxDuration = var_646_14

					if var_646_14 + var_646_7 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_14 + var_646_7
					end
				end

				arg_643_1.text_.text = var_646_11
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906153", "story_v_side_new_1101906.awb") ~= 0 then
					local var_646_15 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906153", "story_v_side_new_1101906.awb") / 1000

					if var_646_15 + var_646_7 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_15 + var_646_7
					end

					if var_646_10.prefab_name ~= "" and arg_643_1.actors_[var_646_10.prefab_name] ~= nil then
						local var_646_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_10.prefab_name].transform, "story_v_side_new_1101906", "1101906153", "story_v_side_new_1101906.awb")

						arg_643_1:RecordAudio("1101906153", var_646_16)
						arg_643_1:RecordAudio("1101906153", var_646_16)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906153", "story_v_side_new_1101906.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906153", "story_v_side_new_1101906.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_17 = math.max(var_646_8, arg_643_1.talkMaxDuration)

			if var_646_7 <= arg_643_1.time_ and arg_643_1.time_ < var_646_7 + var_646_17 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_7) / var_646_17

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_7 + var_646_17 and arg_643_1.time_ < var_646_7 + var_646_17 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906154 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 1101906154
		arg_647_1.duration_ = 12.333

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play1101906155(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = 0
			local var_650_1 = 1.275

			if var_650_0 < arg_647_1.time_ and arg_647_1.time_ <= var_650_0 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_2 = arg_647_1:FormatText(StoryNameCfg[13].name)

				arg_647_1.leftNameTxt_.text = var_650_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_3 = arg_647_1:GetWordFromCfg(1101906154)
				local var_650_4 = arg_647_1:FormatText(var_650_3.content)

				arg_647_1.text_.text = var_650_4

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_5 = 54
				local var_650_6 = utf8.len(var_650_4)
				local var_650_7 = var_650_5 <= 0 and var_650_1 or var_650_1 * (var_650_6 / var_650_5)

				if var_650_7 > 0 and var_650_1 < var_650_7 then
					arg_647_1.talkMaxDuration = var_650_7

					if var_650_7 + var_650_0 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_7 + var_650_0
					end
				end

				arg_647_1.text_.text = var_650_4
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906154", "story_v_side_new_1101906.awb") ~= 0 then
					local var_650_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906154", "story_v_side_new_1101906.awb") / 1000

					if var_650_8 + var_650_0 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_8 + var_650_0
					end

					if var_650_3.prefab_name ~= "" and arg_647_1.actors_[var_650_3.prefab_name] ~= nil then
						local var_650_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_3.prefab_name].transform, "story_v_side_new_1101906", "1101906154", "story_v_side_new_1101906.awb")

						arg_647_1:RecordAudio("1101906154", var_650_9)
						arg_647_1:RecordAudio("1101906154", var_650_9)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906154", "story_v_side_new_1101906.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906154", "story_v_side_new_1101906.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_10 = math.max(var_650_1, arg_647_1.talkMaxDuration)

			if var_650_0 <= arg_647_1.time_ and arg_647_1.time_ < var_650_0 + var_650_10 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_0) / var_650_10

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_0 + var_650_10 and arg_647_1.time_ < var_650_0 + var_650_10 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906155 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 1101906155
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play1101906156(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = arg_651_1.actors_["1019ui_story"]
			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 and arg_651_1.var_.characterEffect1019ui_story == nil then
				arg_651_1.var_.characterEffect1019ui_story = var_654_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_654_2 = 0.200000002980232

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_2 then
				local var_654_3 = (arg_651_1.time_ - var_654_1) / var_654_2

				if arg_651_1.var_.characterEffect1019ui_story then
					local var_654_4 = Mathf.Lerp(0, 0.5, var_654_3)

					arg_651_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_651_1.var_.characterEffect1019ui_story.fillRatio = var_654_4
				end
			end

			if arg_651_1.time_ >= var_654_1 + var_654_2 and arg_651_1.time_ < var_654_1 + var_654_2 + arg_654_0 and arg_651_1.var_.characterEffect1019ui_story then
				local var_654_5 = 0.5

				arg_651_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_651_1.var_.characterEffect1019ui_story.fillRatio = var_654_5
			end

			local var_654_6 = 0
			local var_654_7 = 0.275

			if var_654_6 < arg_651_1.time_ and arg_651_1.time_ <= var_654_6 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, true)

				local var_654_8 = arg_651_1:FormatText(StoryNameCfg[7].name)

				arg_651_1.leftNameTxt_.text = var_654_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_651_1.leftNameTxt_.transform)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1.leftNameTxt_.text)
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_9 = arg_651_1:GetWordFromCfg(1101906155)
				local var_654_10 = arg_651_1:FormatText(var_654_9.content)

				arg_651_1.text_.text = var_654_10

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_11 = 11
				local var_654_12 = utf8.len(var_654_10)
				local var_654_13 = var_654_11 <= 0 and var_654_7 or var_654_7 * (var_654_12 / var_654_11)

				if var_654_13 > 0 and var_654_7 < var_654_13 then
					arg_651_1.talkMaxDuration = var_654_13

					if var_654_13 + var_654_6 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_13 + var_654_6
					end
				end

				arg_651_1.text_.text = var_654_10
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_14 = math.max(var_654_7, arg_651_1.talkMaxDuration)

			if var_654_6 <= arg_651_1.time_ and arg_651_1.time_ < var_654_6 + var_654_14 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_6) / var_654_14

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_6 + var_654_14 and arg_651_1.time_ < var_654_6 + var_654_14 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906156 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 1101906156
		arg_655_1.duration_ = 5

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play1101906157(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = 0
			local var_658_1 = 0.525

			if var_658_0 < arg_655_1.time_ and arg_655_1.time_ <= var_658_0 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_2 = arg_655_1:FormatText(StoryNameCfg[7].name)

				arg_655_1.leftNameTxt_.text = var_658_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_3 = arg_655_1:GetWordFromCfg(1101906156)
				local var_658_4 = arg_655_1:FormatText(var_658_3.content)

				arg_655_1.text_.text = var_658_4

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_5 = 21
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
	Play1101906157 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 1101906157
		arg_659_1.duration_ = 3.866

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play1101906158(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["1019ui_story"].transform
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 then
				arg_659_1.var_.moveOldPos1019ui_story = var_662_0.localPosition
			end

			local var_662_2 = 0.001

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2
				local var_662_4 = Vector3.New(0, -1.08, -5.9)

				var_662_0.localPosition = Vector3.Lerp(arg_659_1.var_.moveOldPos1019ui_story, var_662_4, var_662_3)

				local var_662_5 = manager.ui.mainCamera.transform.position - var_662_0.position

				var_662_0.forward = Vector3.New(var_662_5.x, var_662_5.y, var_662_5.z)

				local var_662_6 = var_662_0.localEulerAngles

				var_662_6.z = 0
				var_662_6.x = 0
				var_662_0.localEulerAngles = var_662_6
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 then
				var_662_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_662_7 = manager.ui.mainCamera.transform.position - var_662_0.position

				var_662_0.forward = Vector3.New(var_662_7.x, var_662_7.y, var_662_7.z)

				local var_662_8 = var_662_0.localEulerAngles

				var_662_8.z = 0
				var_662_8.x = 0
				var_662_0.localEulerAngles = var_662_8
			end

			local var_662_9 = arg_659_1.actors_["1019ui_story"]
			local var_662_10 = 0

			if var_662_10 < arg_659_1.time_ and arg_659_1.time_ <= var_662_10 + arg_662_0 and arg_659_1.var_.characterEffect1019ui_story == nil then
				arg_659_1.var_.characterEffect1019ui_story = var_662_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_11 = 0.200000002980232

			if var_662_10 <= arg_659_1.time_ and arg_659_1.time_ < var_662_10 + var_662_11 then
				local var_662_12 = (arg_659_1.time_ - var_662_10) / var_662_11

				if arg_659_1.var_.characterEffect1019ui_story then
					arg_659_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_659_1.time_ >= var_662_10 + var_662_11 and arg_659_1.time_ < var_662_10 + var_662_11 + arg_662_0 and arg_659_1.var_.characterEffect1019ui_story then
				arg_659_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_662_13 = 0

			if var_662_13 < arg_659_1.time_ and arg_659_1.time_ <= var_662_13 + arg_662_0 then
				arg_659_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_662_14 = 0

			if var_662_14 < arg_659_1.time_ and arg_659_1.time_ <= var_662_14 + arg_662_0 then
				arg_659_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_662_15 = 0
			local var_662_16 = 0.35

			if var_662_15 < arg_659_1.time_ and arg_659_1.time_ <= var_662_15 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_17 = arg_659_1:FormatText(StoryNameCfg[13].name)

				arg_659_1.leftNameTxt_.text = var_662_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_18 = arg_659_1:GetWordFromCfg(1101906157)
				local var_662_19 = arg_659_1:FormatText(var_662_18.content)

				arg_659_1.text_.text = var_662_19

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_20 = 14
				local var_662_21 = utf8.len(var_662_19)
				local var_662_22 = var_662_20 <= 0 and var_662_16 or var_662_16 * (var_662_21 / var_662_20)

				if var_662_22 > 0 and var_662_16 < var_662_22 then
					arg_659_1.talkMaxDuration = var_662_22

					if var_662_22 + var_662_15 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_22 + var_662_15
					end
				end

				arg_659_1.text_.text = var_662_19
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906157", "story_v_side_new_1101906.awb") ~= 0 then
					local var_662_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906157", "story_v_side_new_1101906.awb") / 1000

					if var_662_23 + var_662_15 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_23 + var_662_15
					end

					if var_662_18.prefab_name ~= "" and arg_659_1.actors_[var_662_18.prefab_name] ~= nil then
						local var_662_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_18.prefab_name].transform, "story_v_side_new_1101906", "1101906157", "story_v_side_new_1101906.awb")

						arg_659_1:RecordAudio("1101906157", var_662_24)
						arg_659_1:RecordAudio("1101906157", var_662_24)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906157", "story_v_side_new_1101906.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906157", "story_v_side_new_1101906.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_25 = math.max(var_662_16, arg_659_1.talkMaxDuration)

			if var_662_15 <= arg_659_1.time_ and arg_659_1.time_ < var_662_15 + var_662_25 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_15) / var_662_25

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_15 + var_662_25 and arg_659_1.time_ < var_662_15 + var_662_25 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906158 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 1101906158
		arg_663_1.duration_ = 5

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play1101906159(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = arg_663_1.actors_["1019ui_story"]
			local var_666_1 = 0

			if var_666_1 < arg_663_1.time_ and arg_663_1.time_ <= var_666_1 + arg_666_0 and arg_663_1.var_.characterEffect1019ui_story == nil then
				arg_663_1.var_.characterEffect1019ui_story = var_666_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_2 = 0.200000002980232

			if var_666_1 <= arg_663_1.time_ and arg_663_1.time_ < var_666_1 + var_666_2 then
				local var_666_3 = (arg_663_1.time_ - var_666_1) / var_666_2

				if arg_663_1.var_.characterEffect1019ui_story then
					local var_666_4 = Mathf.Lerp(0, 0.5, var_666_3)

					arg_663_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_663_1.var_.characterEffect1019ui_story.fillRatio = var_666_4
				end
			end

			if arg_663_1.time_ >= var_666_1 + var_666_2 and arg_663_1.time_ < var_666_1 + var_666_2 + arg_666_0 and arg_663_1.var_.characterEffect1019ui_story then
				local var_666_5 = 0.5

				arg_663_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_663_1.var_.characterEffect1019ui_story.fillRatio = var_666_5
			end

			local var_666_6 = 0
			local var_666_7 = 0.425

			if var_666_6 < arg_663_1.time_ and arg_663_1.time_ <= var_666_6 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, false)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_8 = arg_663_1:GetWordFromCfg(1101906158)
				local var_666_9 = arg_663_1:FormatText(var_666_8.content)

				arg_663_1.text_.text = var_666_9

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_10 = 17
				local var_666_11 = utf8.len(var_666_9)
				local var_666_12 = var_666_10 <= 0 and var_666_7 or var_666_7 * (var_666_11 / var_666_10)

				if var_666_12 > 0 and var_666_7 < var_666_12 then
					arg_663_1.talkMaxDuration = var_666_12

					if var_666_12 + var_666_6 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_12 + var_666_6
					end
				end

				arg_663_1.text_.text = var_666_9
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)
				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_13 = math.max(var_666_7, arg_663_1.talkMaxDuration)

			if var_666_6 <= arg_663_1.time_ and arg_663_1.time_ < var_666_6 + var_666_13 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_6) / var_666_13

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_6 + var_666_13 and arg_663_1.time_ < var_666_6 + var_666_13 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906159 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 1101906159
		arg_667_1.duration_ = 7.866

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play1101906160(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = arg_667_1.actors_["1019ui_story"]
			local var_670_1 = 0

			if var_670_1 < arg_667_1.time_ and arg_667_1.time_ <= var_670_1 + arg_670_0 and arg_667_1.var_.characterEffect1019ui_story == nil then
				arg_667_1.var_.characterEffect1019ui_story = var_670_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_670_2 = 0.200000002980232

			if var_670_1 <= arg_667_1.time_ and arg_667_1.time_ < var_670_1 + var_670_2 then
				local var_670_3 = (arg_667_1.time_ - var_670_1) / var_670_2

				if arg_667_1.var_.characterEffect1019ui_story then
					arg_667_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_667_1.time_ >= var_670_1 + var_670_2 and arg_667_1.time_ < var_670_1 + var_670_2 + arg_670_0 and arg_667_1.var_.characterEffect1019ui_story then
				arg_667_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_670_4 = 0
			local var_670_5 = 1

			if var_670_4 < arg_667_1.time_ and arg_667_1.time_ <= var_670_4 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_6 = arg_667_1:FormatText(StoryNameCfg[13].name)

				arg_667_1.leftNameTxt_.text = var_670_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_7 = arg_667_1:GetWordFromCfg(1101906159)
				local var_670_8 = arg_667_1:FormatText(var_670_7.content)

				arg_667_1.text_.text = var_670_8

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_9 = 40
				local var_670_10 = utf8.len(var_670_8)
				local var_670_11 = var_670_9 <= 0 and var_670_5 or var_670_5 * (var_670_10 / var_670_9)

				if var_670_11 > 0 and var_670_5 < var_670_11 then
					arg_667_1.talkMaxDuration = var_670_11

					if var_670_11 + var_670_4 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_11 + var_670_4
					end
				end

				arg_667_1.text_.text = var_670_8
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906159", "story_v_side_new_1101906.awb") ~= 0 then
					local var_670_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906159", "story_v_side_new_1101906.awb") / 1000

					if var_670_12 + var_670_4 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_12 + var_670_4
					end

					if var_670_7.prefab_name ~= "" and arg_667_1.actors_[var_670_7.prefab_name] ~= nil then
						local var_670_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_667_1.actors_[var_670_7.prefab_name].transform, "story_v_side_new_1101906", "1101906159", "story_v_side_new_1101906.awb")

						arg_667_1:RecordAudio("1101906159", var_670_13)
						arg_667_1:RecordAudio("1101906159", var_670_13)
					else
						arg_667_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906159", "story_v_side_new_1101906.awb")
					end

					arg_667_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906159", "story_v_side_new_1101906.awb")
				end

				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_14 = math.max(var_670_5, arg_667_1.talkMaxDuration)

			if var_670_4 <= arg_667_1.time_ and arg_667_1.time_ < var_670_4 + var_670_14 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_4) / var_670_14

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_4 + var_670_14 and arg_667_1.time_ < var_670_4 + var_670_14 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906160 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 1101906160
		arg_671_1.duration_ = 10.366

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play1101906161(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = arg_671_1.actors_["1019ui_story"]
			local var_674_1 = 0

			if var_674_1 < arg_671_1.time_ and arg_671_1.time_ <= var_674_1 + arg_674_0 and arg_671_1.var_.characterEffect1019ui_story == nil then
				arg_671_1.var_.characterEffect1019ui_story = var_674_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_674_2 = 0.200000002980232

			if var_674_1 <= arg_671_1.time_ and arg_671_1.time_ < var_674_1 + var_674_2 then
				local var_674_3 = (arg_671_1.time_ - var_674_1) / var_674_2

				if arg_671_1.var_.characterEffect1019ui_story then
					arg_671_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_671_1.time_ >= var_674_1 + var_674_2 and arg_671_1.time_ < var_674_1 + var_674_2 + arg_674_0 and arg_671_1.var_.characterEffect1019ui_story then
				arg_671_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_674_4 = 0
			local var_674_5 = 1.05

			if var_674_4 < arg_671_1.time_ and arg_671_1.time_ <= var_674_4 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_6 = arg_671_1:FormatText(StoryNameCfg[13].name)

				arg_671_1.leftNameTxt_.text = var_674_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_7 = arg_671_1:GetWordFromCfg(1101906160)
				local var_674_8 = arg_671_1:FormatText(var_674_7.content)

				arg_671_1.text_.text = var_674_8

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_9 = 42
				local var_674_10 = utf8.len(var_674_8)
				local var_674_11 = var_674_9 <= 0 and var_674_5 or var_674_5 * (var_674_10 / var_674_9)

				if var_674_11 > 0 and var_674_5 < var_674_11 then
					arg_671_1.talkMaxDuration = var_674_11

					if var_674_11 + var_674_4 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_11 + var_674_4
					end
				end

				arg_671_1.text_.text = var_674_8
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906160", "story_v_side_new_1101906.awb") ~= 0 then
					local var_674_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906160", "story_v_side_new_1101906.awb") / 1000

					if var_674_12 + var_674_4 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_12 + var_674_4
					end

					if var_674_7.prefab_name ~= "" and arg_671_1.actors_[var_674_7.prefab_name] ~= nil then
						local var_674_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_671_1.actors_[var_674_7.prefab_name].transform, "story_v_side_new_1101906", "1101906160", "story_v_side_new_1101906.awb")

						arg_671_1:RecordAudio("1101906160", var_674_13)
						arg_671_1:RecordAudio("1101906160", var_674_13)
					else
						arg_671_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906160", "story_v_side_new_1101906.awb")
					end

					arg_671_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906160", "story_v_side_new_1101906.awb")
				end

				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_14 = math.max(var_674_5, arg_671_1.talkMaxDuration)

			if var_674_4 <= arg_671_1.time_ and arg_671_1.time_ < var_674_4 + var_674_14 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_4) / var_674_14

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_4 + var_674_14 and arg_671_1.time_ < var_674_4 + var_674_14 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906161 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 1101906161
		arg_675_1.duration_ = 5

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play1101906162(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = arg_675_1.actors_["1019ui_story"]
			local var_678_1 = 0

			if var_678_1 < arg_675_1.time_ and arg_675_1.time_ <= var_678_1 + arg_678_0 and arg_675_1.var_.characterEffect1019ui_story == nil then
				arg_675_1.var_.characterEffect1019ui_story = var_678_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_2 = 0.200000002980232

			if var_678_1 <= arg_675_1.time_ and arg_675_1.time_ < var_678_1 + var_678_2 then
				local var_678_3 = (arg_675_1.time_ - var_678_1) / var_678_2

				if arg_675_1.var_.characterEffect1019ui_story then
					local var_678_4 = Mathf.Lerp(0, 0.5, var_678_3)

					arg_675_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_675_1.var_.characterEffect1019ui_story.fillRatio = var_678_4
				end
			end

			if arg_675_1.time_ >= var_678_1 + var_678_2 and arg_675_1.time_ < var_678_1 + var_678_2 + arg_678_0 and arg_675_1.var_.characterEffect1019ui_story then
				local var_678_5 = 0.5

				arg_675_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_675_1.var_.characterEffect1019ui_story.fillRatio = var_678_5
			end

			local var_678_6 = 0
			local var_678_7 = 0.675

			if var_678_6 < arg_675_1.time_ and arg_675_1.time_ <= var_678_6 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_8 = arg_675_1:FormatText(StoryNameCfg[7].name)

				arg_675_1.leftNameTxt_.text = var_678_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_9 = arg_675_1:GetWordFromCfg(1101906161)
				local var_678_10 = arg_675_1:FormatText(var_678_9.content)

				arg_675_1.text_.text = var_678_10

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_11 = 27
				local var_678_12 = utf8.len(var_678_10)
				local var_678_13 = var_678_11 <= 0 and var_678_7 or var_678_7 * (var_678_12 / var_678_11)

				if var_678_13 > 0 and var_678_7 < var_678_13 then
					arg_675_1.talkMaxDuration = var_678_13

					if var_678_13 + var_678_6 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_13 + var_678_6
					end
				end

				arg_675_1.text_.text = var_678_10
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)
				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_14 = math.max(var_678_7, arg_675_1.talkMaxDuration)

			if var_678_6 <= arg_675_1.time_ and arg_675_1.time_ < var_678_6 + var_678_14 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_6) / var_678_14

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_6 + var_678_14 and arg_675_1.time_ < var_678_6 + var_678_14 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906162 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 1101906162
		arg_679_1.duration_ = 12.733

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play1101906163(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = arg_679_1.actors_["1019ui_story"].transform
			local var_682_1 = 0

			if var_682_1 < arg_679_1.time_ and arg_679_1.time_ <= var_682_1 + arg_682_0 then
				arg_679_1.var_.moveOldPos1019ui_story = var_682_0.localPosition
			end

			local var_682_2 = 0.001

			if var_682_1 <= arg_679_1.time_ and arg_679_1.time_ < var_682_1 + var_682_2 then
				local var_682_3 = (arg_679_1.time_ - var_682_1) / var_682_2
				local var_682_4 = Vector3.New(0, -1.08, -5.9)

				var_682_0.localPosition = Vector3.Lerp(arg_679_1.var_.moveOldPos1019ui_story, var_682_4, var_682_3)

				local var_682_5 = manager.ui.mainCamera.transform.position - var_682_0.position

				var_682_0.forward = Vector3.New(var_682_5.x, var_682_5.y, var_682_5.z)

				local var_682_6 = var_682_0.localEulerAngles

				var_682_6.z = 0
				var_682_6.x = 0
				var_682_0.localEulerAngles = var_682_6
			end

			if arg_679_1.time_ >= var_682_1 + var_682_2 and arg_679_1.time_ < var_682_1 + var_682_2 + arg_682_0 then
				var_682_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_682_7 = manager.ui.mainCamera.transform.position - var_682_0.position

				var_682_0.forward = Vector3.New(var_682_7.x, var_682_7.y, var_682_7.z)

				local var_682_8 = var_682_0.localEulerAngles

				var_682_8.z = 0
				var_682_8.x = 0
				var_682_0.localEulerAngles = var_682_8
			end

			local var_682_9 = arg_679_1.actors_["1019ui_story"]
			local var_682_10 = 0

			if var_682_10 < arg_679_1.time_ and arg_679_1.time_ <= var_682_10 + arg_682_0 and arg_679_1.var_.characterEffect1019ui_story == nil then
				arg_679_1.var_.characterEffect1019ui_story = var_682_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_682_11 = 0.200000002980232

			if var_682_10 <= arg_679_1.time_ and arg_679_1.time_ < var_682_10 + var_682_11 then
				local var_682_12 = (arg_679_1.time_ - var_682_10) / var_682_11

				if arg_679_1.var_.characterEffect1019ui_story then
					arg_679_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_679_1.time_ >= var_682_10 + var_682_11 and arg_679_1.time_ < var_682_10 + var_682_11 + arg_682_0 and arg_679_1.var_.characterEffect1019ui_story then
				arg_679_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_682_13 = 0

			if var_682_13 < arg_679_1.time_ and arg_679_1.time_ <= var_682_13 + arg_682_0 then
				arg_679_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_682_14 = 0

			if var_682_14 < arg_679_1.time_ and arg_679_1.time_ <= var_682_14 + arg_682_0 then
				arg_679_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_682_15 = 0
			local var_682_16 = 1.475

			if var_682_15 < arg_679_1.time_ and arg_679_1.time_ <= var_682_15 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_17 = arg_679_1:FormatText(StoryNameCfg[13].name)

				arg_679_1.leftNameTxt_.text = var_682_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_18 = arg_679_1:GetWordFromCfg(1101906162)
				local var_682_19 = arg_679_1:FormatText(var_682_18.content)

				arg_679_1.text_.text = var_682_19

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_20 = 59
				local var_682_21 = utf8.len(var_682_19)
				local var_682_22 = var_682_20 <= 0 and var_682_16 or var_682_16 * (var_682_21 / var_682_20)

				if var_682_22 > 0 and var_682_16 < var_682_22 then
					arg_679_1.talkMaxDuration = var_682_22

					if var_682_22 + var_682_15 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_22 + var_682_15
					end
				end

				arg_679_1.text_.text = var_682_19
				arg_679_1.typewritter.percent = 0

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906162", "story_v_side_new_1101906.awb") ~= 0 then
					local var_682_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906162", "story_v_side_new_1101906.awb") / 1000

					if var_682_23 + var_682_15 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_23 + var_682_15
					end

					if var_682_18.prefab_name ~= "" and arg_679_1.actors_[var_682_18.prefab_name] ~= nil then
						local var_682_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_679_1.actors_[var_682_18.prefab_name].transform, "story_v_side_new_1101906", "1101906162", "story_v_side_new_1101906.awb")

						arg_679_1:RecordAudio("1101906162", var_682_24)
						arg_679_1:RecordAudio("1101906162", var_682_24)
					else
						arg_679_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906162", "story_v_side_new_1101906.awb")
					end

					arg_679_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906162", "story_v_side_new_1101906.awb")
				end

				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_25 = math.max(var_682_16, arg_679_1.talkMaxDuration)

			if var_682_15 <= arg_679_1.time_ and arg_679_1.time_ < var_682_15 + var_682_25 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_15) / var_682_25

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_15 + var_682_25 and arg_679_1.time_ < var_682_15 + var_682_25 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906163 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 1101906163
		arg_683_1.duration_ = 5

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
		end

		function arg_683_1.playNext_(arg_685_0)
			if arg_685_0 == 1 then
				arg_683_0:Play1101906164(arg_683_1)
			end
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = arg_683_1.actors_["1019ui_story"]
			local var_686_1 = 0

			if var_686_1 < arg_683_1.time_ and arg_683_1.time_ <= var_686_1 + arg_686_0 and arg_683_1.var_.characterEffect1019ui_story == nil then
				arg_683_1.var_.characterEffect1019ui_story = var_686_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_686_2 = 0.200000002980232

			if var_686_1 <= arg_683_1.time_ and arg_683_1.time_ < var_686_1 + var_686_2 then
				local var_686_3 = (arg_683_1.time_ - var_686_1) / var_686_2

				if arg_683_1.var_.characterEffect1019ui_story then
					local var_686_4 = Mathf.Lerp(0, 0.5, var_686_3)

					arg_683_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_683_1.var_.characterEffect1019ui_story.fillRatio = var_686_4
				end
			end

			if arg_683_1.time_ >= var_686_1 + var_686_2 and arg_683_1.time_ < var_686_1 + var_686_2 + arg_686_0 and arg_683_1.var_.characterEffect1019ui_story then
				local var_686_5 = 0.5

				arg_683_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_683_1.var_.characterEffect1019ui_story.fillRatio = var_686_5
			end

			local var_686_6 = 0
			local var_686_7 = 0.175

			if var_686_6 < arg_683_1.time_ and arg_683_1.time_ <= var_686_6 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0
				arg_683_1.dialogCg_.alpha = 1

				arg_683_1.dialog_:SetActive(true)
				SetActive(arg_683_1.leftNameGo_, true)

				local var_686_8 = arg_683_1:FormatText(StoryNameCfg[7].name)

				arg_683_1.leftNameTxt_.text = var_686_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_683_1.leftNameTxt_.transform)

				arg_683_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_683_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_683_1:RecordName(arg_683_1.leftNameTxt_.text)
				SetActive(arg_683_1.iconTrs_.gameObject, false)
				arg_683_1.callingController_:SetSelectedState("normal")

				local var_686_9 = arg_683_1:GetWordFromCfg(1101906163)
				local var_686_10 = arg_683_1:FormatText(var_686_9.content)

				arg_683_1.text_.text = var_686_10

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.text_)

				local var_686_11 = 7
				local var_686_12 = utf8.len(var_686_10)
				local var_686_13 = var_686_11 <= 0 and var_686_7 or var_686_7 * (var_686_12 / var_686_11)

				if var_686_13 > 0 and var_686_7 < var_686_13 then
					arg_683_1.talkMaxDuration = var_686_13

					if var_686_13 + var_686_6 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_13 + var_686_6
					end
				end

				arg_683_1.text_.text = var_686_10
				arg_683_1.typewritter.percent = 0

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(false)
				arg_683_1:RecordContent(arg_683_1.text_.text)
			end

			local var_686_14 = math.max(var_686_7, arg_683_1.talkMaxDuration)

			if var_686_6 <= arg_683_1.time_ and arg_683_1.time_ < var_686_6 + var_686_14 then
				arg_683_1.typewritter.percent = (arg_683_1.time_ - var_686_6) / var_686_14

				arg_683_1.typewritter:SetDirty()
			end

			if arg_683_1.time_ >= var_686_6 + var_686_14 and arg_683_1.time_ < var_686_6 + var_686_14 + arg_686_0 then
				arg_683_1.typewritter.percent = 1

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906164 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 1101906164
		arg_687_1.duration_ = 5.3

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play1101906165(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = arg_687_1.actors_["1019ui_story"]
			local var_690_1 = 0

			if var_690_1 < arg_687_1.time_ and arg_687_1.time_ <= var_690_1 + arg_690_0 and arg_687_1.var_.characterEffect1019ui_story == nil then
				arg_687_1.var_.characterEffect1019ui_story = var_690_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_690_2 = 0.200000002980232

			if var_690_1 <= arg_687_1.time_ and arg_687_1.time_ < var_690_1 + var_690_2 then
				local var_690_3 = (arg_687_1.time_ - var_690_1) / var_690_2

				if arg_687_1.var_.characterEffect1019ui_story then
					arg_687_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_687_1.time_ >= var_690_1 + var_690_2 and arg_687_1.time_ < var_690_1 + var_690_2 + arg_690_0 and arg_687_1.var_.characterEffect1019ui_story then
				arg_687_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_690_4 = 0

			if var_690_4 < arg_687_1.time_ and arg_687_1.time_ <= var_690_4 + arg_690_0 then
				arg_687_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_690_5 = 0
			local var_690_6 = 0.525

			if var_690_5 < arg_687_1.time_ and arg_687_1.time_ <= var_690_5 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0
				arg_687_1.dialogCg_.alpha = 1

				arg_687_1.dialog_:SetActive(true)
				SetActive(arg_687_1.leftNameGo_, true)

				local var_690_7 = arg_687_1:FormatText(StoryNameCfg[13].name)

				arg_687_1.leftNameTxt_.text = var_690_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_687_1.leftNameTxt_.transform)

				arg_687_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_687_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_687_1:RecordName(arg_687_1.leftNameTxt_.text)
				SetActive(arg_687_1.iconTrs_.gameObject, false)
				arg_687_1.callingController_:SetSelectedState("normal")

				local var_690_8 = arg_687_1:GetWordFromCfg(1101906164)
				local var_690_9 = arg_687_1:FormatText(var_690_8.content)

				arg_687_1.text_.text = var_690_9

				LuaForUtil.ClearLinePrefixSymbol(arg_687_1.text_)

				local var_690_10 = 21
				local var_690_11 = utf8.len(var_690_9)
				local var_690_12 = var_690_10 <= 0 and var_690_6 or var_690_6 * (var_690_11 / var_690_10)

				if var_690_12 > 0 and var_690_6 < var_690_12 then
					arg_687_1.talkMaxDuration = var_690_12

					if var_690_12 + var_690_5 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_12 + var_690_5
					end
				end

				arg_687_1.text_.text = var_690_9
				arg_687_1.typewritter.percent = 0

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906164", "story_v_side_new_1101906.awb") ~= 0 then
					local var_690_13 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906164", "story_v_side_new_1101906.awb") / 1000

					if var_690_13 + var_690_5 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_13 + var_690_5
					end

					if var_690_8.prefab_name ~= "" and arg_687_1.actors_[var_690_8.prefab_name] ~= nil then
						local var_690_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_687_1.actors_[var_690_8.prefab_name].transform, "story_v_side_new_1101906", "1101906164", "story_v_side_new_1101906.awb")

						arg_687_1:RecordAudio("1101906164", var_690_14)
						arg_687_1:RecordAudio("1101906164", var_690_14)
					else
						arg_687_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906164", "story_v_side_new_1101906.awb")
					end

					arg_687_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906164", "story_v_side_new_1101906.awb")
				end

				arg_687_1:RecordContent(arg_687_1.text_.text)
			end

			local var_690_15 = math.max(var_690_6, arg_687_1.talkMaxDuration)

			if var_690_5 <= arg_687_1.time_ and arg_687_1.time_ < var_690_5 + var_690_15 then
				arg_687_1.typewritter.percent = (arg_687_1.time_ - var_690_5) / var_690_15

				arg_687_1.typewritter:SetDirty()
			end

			if arg_687_1.time_ >= var_690_5 + var_690_15 and arg_687_1.time_ < var_690_5 + var_690_15 + arg_690_0 then
				arg_687_1.typewritter.percent = 1

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906165 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 1101906165
		arg_691_1.duration_ = 5

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
		end

		function arg_691_1.playNext_(arg_693_0)
			if arg_693_0 == 1 then
				arg_691_0:Play1101906166(arg_691_1)
			end
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = 0
			local var_694_1 = 0.975

			if var_694_0 < arg_691_1.time_ and arg_691_1.time_ <= var_694_0 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0
				arg_691_1.dialogCg_.alpha = 1

				arg_691_1.dialog_:SetActive(true)
				SetActive(arg_691_1.leftNameGo_, false)

				arg_691_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_691_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_691_1:RecordName(arg_691_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_691_1.iconTrs_.gameObject, false)
				arg_691_1.callingController_:SetSelectedState("normal")

				local var_694_2 = arg_691_1:GetWordFromCfg(1101906165)
				local var_694_3 = arg_691_1:FormatText(var_694_2.content)

				arg_691_1.text_.text = var_694_3

				LuaForUtil.ClearLinePrefixSymbol(arg_691_1.text_)

				local var_694_4 = 39
				local var_694_5 = utf8.len(var_694_3)
				local var_694_6 = var_694_4 <= 0 and var_694_1 or var_694_1 * (var_694_5 / var_694_4)

				if var_694_6 > 0 and var_694_1 < var_694_6 then
					arg_691_1.talkMaxDuration = var_694_6

					if var_694_6 + var_694_0 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_6 + var_694_0
					end
				end

				arg_691_1.text_.text = var_694_3
				arg_691_1.typewritter.percent = 0

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(false)
				arg_691_1:RecordContent(arg_691_1.text_.text)
			end

			local var_694_7 = math.max(var_694_1, arg_691_1.talkMaxDuration)

			if var_694_0 <= arg_691_1.time_ and arg_691_1.time_ < var_694_0 + var_694_7 then
				arg_691_1.typewritter.percent = (arg_691_1.time_ - var_694_0) / var_694_7

				arg_691_1.typewritter:SetDirty()
			end

			if arg_691_1.time_ >= var_694_0 + var_694_7 and arg_691_1.time_ < var_694_0 + var_694_7 + arg_694_0 then
				arg_691_1.typewritter.percent = 1

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906166 = function(arg_695_0, arg_695_1)
		arg_695_1.time_ = 0
		arg_695_1.frameCnt_ = 0
		arg_695_1.state_ = "playing"
		arg_695_1.curTalkId_ = 1101906166
		arg_695_1.duration_ = 1.999999999999

		SetActive(arg_695_1.tipsGo_, false)

		function arg_695_1.onSingleLineFinish_()
			arg_695_1.onSingleLineUpdate_ = nil
			arg_695_1.onSingleLineFinish_ = nil
			arg_695_1.state_ = "waiting"
		end

		function arg_695_1.playNext_(arg_697_0)
			if arg_697_0 == 1 then
				arg_695_0:Play1101906167(arg_695_1)
			end
		end

		function arg_695_1.onSingleLineUpdate_(arg_698_0)
			local var_698_0 = 0

			if var_698_0 < arg_695_1.time_ and arg_695_1.time_ <= var_698_0 + arg_698_0 then
				arg_695_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_698_1 = arg_695_1.actors_["1019ui_story"]
			local var_698_2 = 0

			if var_698_2 < arg_695_1.time_ and arg_695_1.time_ <= var_698_2 + arg_698_0 and arg_695_1.var_.characterEffect1019ui_story == nil then
				arg_695_1.var_.characterEffect1019ui_story = var_698_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_698_3 = 0.200000002980232

			if var_698_2 <= arg_695_1.time_ and arg_695_1.time_ < var_698_2 + var_698_3 then
				local var_698_4 = (arg_695_1.time_ - var_698_2) / var_698_3

				if arg_695_1.var_.characterEffect1019ui_story then
					arg_695_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_695_1.time_ >= var_698_2 + var_698_3 and arg_695_1.time_ < var_698_2 + var_698_3 + arg_698_0 and arg_695_1.var_.characterEffect1019ui_story then
				arg_695_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_698_5 = 0
			local var_698_6 = 0.2

			if var_698_5 < arg_695_1.time_ and arg_695_1.time_ <= var_698_5 + arg_698_0 then
				arg_695_1.talkMaxDuration = 0
				arg_695_1.dialogCg_.alpha = 1

				arg_695_1.dialog_:SetActive(true)
				SetActive(arg_695_1.leftNameGo_, true)

				local var_698_7 = arg_695_1:FormatText(StoryNameCfg[13].name)

				arg_695_1.leftNameTxt_.text = var_698_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_695_1.leftNameTxt_.transform)

				arg_695_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_695_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_695_1:RecordName(arg_695_1.leftNameTxt_.text)
				SetActive(arg_695_1.iconTrs_.gameObject, false)
				arg_695_1.callingController_:SetSelectedState("normal")

				local var_698_8 = arg_695_1:GetWordFromCfg(1101906166)
				local var_698_9 = arg_695_1:FormatText(var_698_8.content)

				arg_695_1.text_.text = var_698_9

				LuaForUtil.ClearLinePrefixSymbol(arg_695_1.text_)

				local var_698_10 = 8
				local var_698_11 = utf8.len(var_698_9)
				local var_698_12 = var_698_10 <= 0 and var_698_6 or var_698_6 * (var_698_11 / var_698_10)

				if var_698_12 > 0 and var_698_6 < var_698_12 then
					arg_695_1.talkMaxDuration = var_698_12

					if var_698_12 + var_698_5 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_12 + var_698_5
					end
				end

				arg_695_1.text_.text = var_698_9
				arg_695_1.typewritter.percent = 0

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906166", "story_v_side_new_1101906.awb") ~= 0 then
					local var_698_13 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906166", "story_v_side_new_1101906.awb") / 1000

					if var_698_13 + var_698_5 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_13 + var_698_5
					end

					if var_698_8.prefab_name ~= "" and arg_695_1.actors_[var_698_8.prefab_name] ~= nil then
						local var_698_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_695_1.actors_[var_698_8.prefab_name].transform, "story_v_side_new_1101906", "1101906166", "story_v_side_new_1101906.awb")

						arg_695_1:RecordAudio("1101906166", var_698_14)
						arg_695_1:RecordAudio("1101906166", var_698_14)
					else
						arg_695_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906166", "story_v_side_new_1101906.awb")
					end

					arg_695_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906166", "story_v_side_new_1101906.awb")
				end

				arg_695_1:RecordContent(arg_695_1.text_.text)
			end

			local var_698_15 = math.max(var_698_6, arg_695_1.talkMaxDuration)

			if var_698_5 <= arg_695_1.time_ and arg_695_1.time_ < var_698_5 + var_698_15 then
				arg_695_1.typewritter.percent = (arg_695_1.time_ - var_698_5) / var_698_15

				arg_695_1.typewritter:SetDirty()
			end

			if arg_695_1.time_ >= var_698_5 + var_698_15 and arg_695_1.time_ < var_698_5 + var_698_15 + arg_698_0 then
				arg_695_1.typewritter.percent = 1

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906167 = function(arg_699_0, arg_699_1)
		arg_699_1.time_ = 0
		arg_699_1.frameCnt_ = 0
		arg_699_1.state_ = "playing"
		arg_699_1.curTalkId_ = 1101906167
		arg_699_1.duration_ = 5

		SetActive(arg_699_1.tipsGo_, false)

		function arg_699_1.onSingleLineFinish_()
			arg_699_1.onSingleLineUpdate_ = nil
			arg_699_1.onSingleLineFinish_ = nil
			arg_699_1.state_ = "waiting"
		end

		function arg_699_1.playNext_(arg_701_0)
			if arg_701_0 == 1 then
				arg_699_0:Play1101906168(arg_699_1)
			end
		end

		function arg_699_1.onSingleLineUpdate_(arg_702_0)
			local var_702_0 = arg_699_1.actors_["1019ui_story"]
			local var_702_1 = 0

			if var_702_1 < arg_699_1.time_ and arg_699_1.time_ <= var_702_1 + arg_702_0 and arg_699_1.var_.characterEffect1019ui_story == nil then
				arg_699_1.var_.characterEffect1019ui_story = var_702_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_702_2 = 0.200000002980232

			if var_702_1 <= arg_699_1.time_ and arg_699_1.time_ < var_702_1 + var_702_2 then
				local var_702_3 = (arg_699_1.time_ - var_702_1) / var_702_2

				if arg_699_1.var_.characterEffect1019ui_story then
					local var_702_4 = Mathf.Lerp(0, 0.5, var_702_3)

					arg_699_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_699_1.var_.characterEffect1019ui_story.fillRatio = var_702_4
				end
			end

			if arg_699_1.time_ >= var_702_1 + var_702_2 and arg_699_1.time_ < var_702_1 + var_702_2 + arg_702_0 and arg_699_1.var_.characterEffect1019ui_story then
				local var_702_5 = 0.5

				arg_699_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_699_1.var_.characterEffect1019ui_story.fillRatio = var_702_5
			end

			local var_702_6 = 0
			local var_702_7 = 0.6

			if var_702_6 < arg_699_1.time_ and arg_699_1.time_ <= var_702_6 + arg_702_0 then
				arg_699_1.talkMaxDuration = 0
				arg_699_1.dialogCg_.alpha = 1

				arg_699_1.dialog_:SetActive(true)
				SetActive(arg_699_1.leftNameGo_, true)

				local var_702_8 = arg_699_1:FormatText(StoryNameCfg[7].name)

				arg_699_1.leftNameTxt_.text = var_702_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_699_1.leftNameTxt_.transform)

				arg_699_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_699_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_699_1:RecordName(arg_699_1.leftNameTxt_.text)
				SetActive(arg_699_1.iconTrs_.gameObject, false)
				arg_699_1.callingController_:SetSelectedState("normal")

				local var_702_9 = arg_699_1:GetWordFromCfg(1101906167)
				local var_702_10 = arg_699_1:FormatText(var_702_9.content)

				arg_699_1.text_.text = var_702_10

				LuaForUtil.ClearLinePrefixSymbol(arg_699_1.text_)

				local var_702_11 = 24
				local var_702_12 = utf8.len(var_702_10)
				local var_702_13 = var_702_11 <= 0 and var_702_7 or var_702_7 * (var_702_12 / var_702_11)

				if var_702_13 > 0 and var_702_7 < var_702_13 then
					arg_699_1.talkMaxDuration = var_702_13

					if var_702_13 + var_702_6 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_13 + var_702_6
					end
				end

				arg_699_1.text_.text = var_702_10
				arg_699_1.typewritter.percent = 0

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(false)
				arg_699_1:RecordContent(arg_699_1.text_.text)
			end

			local var_702_14 = math.max(var_702_7, arg_699_1.talkMaxDuration)

			if var_702_6 <= arg_699_1.time_ and arg_699_1.time_ < var_702_6 + var_702_14 then
				arg_699_1.typewritter.percent = (arg_699_1.time_ - var_702_6) / var_702_14

				arg_699_1.typewritter:SetDirty()
			end

			if arg_699_1.time_ >= var_702_6 + var_702_14 and arg_699_1.time_ < var_702_6 + var_702_14 + arg_702_0 then
				arg_699_1.typewritter.percent = 1

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906168 = function(arg_703_0, arg_703_1)
		arg_703_1.time_ = 0
		arg_703_1.frameCnt_ = 0
		arg_703_1.state_ = "playing"
		arg_703_1.curTalkId_ = 1101906168
		arg_703_1.duration_ = 4.7

		SetActive(arg_703_1.tipsGo_, false)

		function arg_703_1.onSingleLineFinish_()
			arg_703_1.onSingleLineUpdate_ = nil
			arg_703_1.onSingleLineFinish_ = nil
			arg_703_1.state_ = "waiting"
		end

		function arg_703_1.playNext_(arg_705_0)
			if arg_705_0 == 1 then
				arg_703_0:Play1101906169(arg_703_1)
			end
		end

		function arg_703_1.onSingleLineUpdate_(arg_706_0)
			local var_706_0 = arg_703_1.actors_["1019ui_story"].transform
			local var_706_1 = 0

			if var_706_1 < arg_703_1.time_ and arg_703_1.time_ <= var_706_1 + arg_706_0 then
				arg_703_1.var_.moveOldPos1019ui_story = var_706_0.localPosition
			end

			local var_706_2 = 0.001

			if var_706_1 <= arg_703_1.time_ and arg_703_1.time_ < var_706_1 + var_706_2 then
				local var_706_3 = (arg_703_1.time_ - var_706_1) / var_706_2
				local var_706_4 = Vector3.New(0, -1.08, -5.9)

				var_706_0.localPosition = Vector3.Lerp(arg_703_1.var_.moveOldPos1019ui_story, var_706_4, var_706_3)

				local var_706_5 = manager.ui.mainCamera.transform.position - var_706_0.position

				var_706_0.forward = Vector3.New(var_706_5.x, var_706_5.y, var_706_5.z)

				local var_706_6 = var_706_0.localEulerAngles

				var_706_6.z = 0
				var_706_6.x = 0
				var_706_0.localEulerAngles = var_706_6
			end

			if arg_703_1.time_ >= var_706_1 + var_706_2 and arg_703_1.time_ < var_706_1 + var_706_2 + arg_706_0 then
				var_706_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_706_7 = manager.ui.mainCamera.transform.position - var_706_0.position

				var_706_0.forward = Vector3.New(var_706_7.x, var_706_7.y, var_706_7.z)

				local var_706_8 = var_706_0.localEulerAngles

				var_706_8.z = 0
				var_706_8.x = 0
				var_706_0.localEulerAngles = var_706_8
			end

			local var_706_9 = arg_703_1.actors_["1019ui_story"]
			local var_706_10 = 0

			if var_706_10 < arg_703_1.time_ and arg_703_1.time_ <= var_706_10 + arg_706_0 and arg_703_1.var_.characterEffect1019ui_story == nil then
				arg_703_1.var_.characterEffect1019ui_story = var_706_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_706_11 = 0.200000002980232

			if var_706_10 <= arg_703_1.time_ and arg_703_1.time_ < var_706_10 + var_706_11 then
				local var_706_12 = (arg_703_1.time_ - var_706_10) / var_706_11

				if arg_703_1.var_.characterEffect1019ui_story then
					arg_703_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_703_1.time_ >= var_706_10 + var_706_11 and arg_703_1.time_ < var_706_10 + var_706_11 + arg_706_0 and arg_703_1.var_.characterEffect1019ui_story then
				arg_703_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_706_13 = 0

			if var_706_13 < arg_703_1.time_ and arg_703_1.time_ <= var_706_13 + arg_706_0 then
				arg_703_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_706_14 = 0

			if var_706_14 < arg_703_1.time_ and arg_703_1.time_ <= var_706_14 + arg_706_0 then
				arg_703_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_706_15 = 0
			local var_706_16 = 0.375

			if var_706_15 < arg_703_1.time_ and arg_703_1.time_ <= var_706_15 + arg_706_0 then
				arg_703_1.talkMaxDuration = 0
				arg_703_1.dialogCg_.alpha = 1

				arg_703_1.dialog_:SetActive(true)
				SetActive(arg_703_1.leftNameGo_, true)

				local var_706_17 = arg_703_1:FormatText(StoryNameCfg[13].name)

				arg_703_1.leftNameTxt_.text = var_706_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_703_1.leftNameTxt_.transform)

				arg_703_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_703_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_703_1:RecordName(arg_703_1.leftNameTxt_.text)
				SetActive(arg_703_1.iconTrs_.gameObject, false)
				arg_703_1.callingController_:SetSelectedState("normal")

				local var_706_18 = arg_703_1:GetWordFromCfg(1101906168)
				local var_706_19 = arg_703_1:FormatText(var_706_18.content)

				arg_703_1.text_.text = var_706_19

				LuaForUtil.ClearLinePrefixSymbol(arg_703_1.text_)

				local var_706_20 = 15
				local var_706_21 = utf8.len(var_706_19)
				local var_706_22 = var_706_20 <= 0 and var_706_16 or var_706_16 * (var_706_21 / var_706_20)

				if var_706_22 > 0 and var_706_16 < var_706_22 then
					arg_703_1.talkMaxDuration = var_706_22

					if var_706_22 + var_706_15 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_22 + var_706_15
					end
				end

				arg_703_1.text_.text = var_706_19
				arg_703_1.typewritter.percent = 0

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906168", "story_v_side_new_1101906.awb") ~= 0 then
					local var_706_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906168", "story_v_side_new_1101906.awb") / 1000

					if var_706_23 + var_706_15 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_23 + var_706_15
					end

					if var_706_18.prefab_name ~= "" and arg_703_1.actors_[var_706_18.prefab_name] ~= nil then
						local var_706_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_703_1.actors_[var_706_18.prefab_name].transform, "story_v_side_new_1101906", "1101906168", "story_v_side_new_1101906.awb")

						arg_703_1:RecordAudio("1101906168", var_706_24)
						arg_703_1:RecordAudio("1101906168", var_706_24)
					else
						arg_703_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906168", "story_v_side_new_1101906.awb")
					end

					arg_703_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906168", "story_v_side_new_1101906.awb")
				end

				arg_703_1:RecordContent(arg_703_1.text_.text)
			end

			local var_706_25 = math.max(var_706_16, arg_703_1.talkMaxDuration)

			if var_706_15 <= arg_703_1.time_ and arg_703_1.time_ < var_706_15 + var_706_25 then
				arg_703_1.typewritter.percent = (arg_703_1.time_ - var_706_15) / var_706_25

				arg_703_1.typewritter:SetDirty()
			end

			if arg_703_1.time_ >= var_706_15 + var_706_25 and arg_703_1.time_ < var_706_15 + var_706_25 + arg_706_0 then
				arg_703_1.typewritter.percent = 1

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906169 = function(arg_707_0, arg_707_1)
		arg_707_1.time_ = 0
		arg_707_1.frameCnt_ = 0
		arg_707_1.state_ = "playing"
		arg_707_1.curTalkId_ = 1101906169
		arg_707_1.duration_ = 5

		SetActive(arg_707_1.tipsGo_, false)

		function arg_707_1.onSingleLineFinish_()
			arg_707_1.onSingleLineUpdate_ = nil
			arg_707_1.onSingleLineFinish_ = nil
			arg_707_1.state_ = "waiting"
		end

		function arg_707_1.playNext_(arg_709_0)
			if arg_709_0 == 1 then
				arg_707_0:Play1101906170(arg_707_1)
			end
		end

		function arg_707_1.onSingleLineUpdate_(arg_710_0)
			local var_710_0 = arg_707_1.actors_["1019ui_story"]
			local var_710_1 = 0

			if var_710_1 < arg_707_1.time_ and arg_707_1.time_ <= var_710_1 + arg_710_0 and arg_707_1.var_.characterEffect1019ui_story == nil then
				arg_707_1.var_.characterEffect1019ui_story = var_710_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_710_2 = 0.200000002980232

			if var_710_1 <= arg_707_1.time_ and arg_707_1.time_ < var_710_1 + var_710_2 then
				local var_710_3 = (arg_707_1.time_ - var_710_1) / var_710_2

				if arg_707_1.var_.characterEffect1019ui_story then
					local var_710_4 = Mathf.Lerp(0, 0.5, var_710_3)

					arg_707_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_707_1.var_.characterEffect1019ui_story.fillRatio = var_710_4
				end
			end

			if arg_707_1.time_ >= var_710_1 + var_710_2 and arg_707_1.time_ < var_710_1 + var_710_2 + arg_710_0 and arg_707_1.var_.characterEffect1019ui_story then
				local var_710_5 = 0.5

				arg_707_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_707_1.var_.characterEffect1019ui_story.fillRatio = var_710_5
			end

			local var_710_6 = 0
			local var_710_7 = 0.95

			if var_710_6 < arg_707_1.time_ and arg_707_1.time_ <= var_710_6 + arg_710_0 then
				arg_707_1.talkMaxDuration = 0
				arg_707_1.dialogCg_.alpha = 1

				arg_707_1.dialog_:SetActive(true)
				SetActive(arg_707_1.leftNameGo_, true)

				local var_710_8 = arg_707_1:FormatText(StoryNameCfg[7].name)

				arg_707_1.leftNameTxt_.text = var_710_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_707_1.leftNameTxt_.transform)

				arg_707_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_707_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_707_1:RecordName(arg_707_1.leftNameTxt_.text)
				SetActive(arg_707_1.iconTrs_.gameObject, false)
				arg_707_1.callingController_:SetSelectedState("normal")

				local var_710_9 = arg_707_1:GetWordFromCfg(1101906169)
				local var_710_10 = arg_707_1:FormatText(var_710_9.content)

				arg_707_1.text_.text = var_710_10

				LuaForUtil.ClearLinePrefixSymbol(arg_707_1.text_)

				local var_710_11 = 38
				local var_710_12 = utf8.len(var_710_10)
				local var_710_13 = var_710_11 <= 0 and var_710_7 or var_710_7 * (var_710_12 / var_710_11)

				if var_710_13 > 0 and var_710_7 < var_710_13 then
					arg_707_1.talkMaxDuration = var_710_13

					if var_710_13 + var_710_6 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_13 + var_710_6
					end
				end

				arg_707_1.text_.text = var_710_10
				arg_707_1.typewritter.percent = 0

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(false)
				arg_707_1:RecordContent(arg_707_1.text_.text)
			end

			local var_710_14 = math.max(var_710_7, arg_707_1.talkMaxDuration)

			if var_710_6 <= arg_707_1.time_ and arg_707_1.time_ < var_710_6 + var_710_14 then
				arg_707_1.typewritter.percent = (arg_707_1.time_ - var_710_6) / var_710_14

				arg_707_1.typewritter:SetDirty()
			end

			if arg_707_1.time_ >= var_710_6 + var_710_14 and arg_707_1.time_ < var_710_6 + var_710_14 + arg_710_0 then
				arg_707_1.typewritter.percent = 1

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906170 = function(arg_711_0, arg_711_1)
		arg_711_1.time_ = 0
		arg_711_1.frameCnt_ = 0
		arg_711_1.state_ = "playing"
		arg_711_1.curTalkId_ = 1101906170
		arg_711_1.duration_ = 5

		SetActive(arg_711_1.tipsGo_, false)

		function arg_711_1.onSingleLineFinish_()
			arg_711_1.onSingleLineUpdate_ = nil
			arg_711_1.onSingleLineFinish_ = nil
			arg_711_1.state_ = "waiting"
		end

		function arg_711_1.playNext_(arg_713_0)
			if arg_713_0 == 1 then
				arg_711_0:Play1101906171(arg_711_1)
			end
		end

		function arg_711_1.onSingleLineUpdate_(arg_714_0)
			local var_714_0 = 0
			local var_714_1 = 0.5

			if var_714_0 < arg_711_1.time_ and arg_711_1.time_ <= var_714_0 + arg_714_0 then
				arg_711_1.talkMaxDuration = 0
				arg_711_1.dialogCg_.alpha = 1

				arg_711_1.dialog_:SetActive(true)
				SetActive(arg_711_1.leftNameGo_, true)

				local var_714_2 = arg_711_1:FormatText(StoryNameCfg[7].name)

				arg_711_1.leftNameTxt_.text = var_714_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_711_1.leftNameTxt_.transform)

				arg_711_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_711_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_711_1:RecordName(arg_711_1.leftNameTxt_.text)
				SetActive(arg_711_1.iconTrs_.gameObject, false)
				arg_711_1.callingController_:SetSelectedState("normal")

				local var_714_3 = arg_711_1:GetWordFromCfg(1101906170)
				local var_714_4 = arg_711_1:FormatText(var_714_3.content)

				arg_711_1.text_.text = var_714_4

				LuaForUtil.ClearLinePrefixSymbol(arg_711_1.text_)

				local var_714_5 = 20
				local var_714_6 = utf8.len(var_714_4)
				local var_714_7 = var_714_5 <= 0 and var_714_1 or var_714_1 * (var_714_6 / var_714_5)

				if var_714_7 > 0 and var_714_1 < var_714_7 then
					arg_711_1.talkMaxDuration = var_714_7

					if var_714_7 + var_714_0 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_7 + var_714_0
					end
				end

				arg_711_1.text_.text = var_714_4
				arg_711_1.typewritter.percent = 0

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(false)
				arg_711_1:RecordContent(arg_711_1.text_.text)
			end

			local var_714_8 = math.max(var_714_1, arg_711_1.talkMaxDuration)

			if var_714_0 <= arg_711_1.time_ and arg_711_1.time_ < var_714_0 + var_714_8 then
				arg_711_1.typewritter.percent = (arg_711_1.time_ - var_714_0) / var_714_8

				arg_711_1.typewritter:SetDirty()
			end

			if arg_711_1.time_ >= var_714_0 + var_714_8 and arg_711_1.time_ < var_714_0 + var_714_8 + arg_714_0 then
				arg_711_1.typewritter.percent = 1

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906171 = function(arg_715_0, arg_715_1)
		arg_715_1.time_ = 0
		arg_715_1.frameCnt_ = 0
		arg_715_1.state_ = "playing"
		arg_715_1.curTalkId_ = 1101906171
		arg_715_1.duration_ = 2.2

		SetActive(arg_715_1.tipsGo_, false)

		function arg_715_1.onSingleLineFinish_()
			arg_715_1.onSingleLineUpdate_ = nil
			arg_715_1.onSingleLineFinish_ = nil
			arg_715_1.state_ = "waiting"
		end

		function arg_715_1.playNext_(arg_717_0)
			if arg_717_0 == 1 then
				arg_715_0:Play1101906172(arg_715_1)
			end
		end

		function arg_715_1.onSingleLineUpdate_(arg_718_0)
			local var_718_0 = arg_715_1.actors_["1019ui_story"]
			local var_718_1 = 0

			if var_718_1 < arg_715_1.time_ and arg_715_1.time_ <= var_718_1 + arg_718_0 and arg_715_1.var_.characterEffect1019ui_story == nil then
				arg_715_1.var_.characterEffect1019ui_story = var_718_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_718_2 = 0.200000002980232

			if var_718_1 <= arg_715_1.time_ and arg_715_1.time_ < var_718_1 + var_718_2 then
				local var_718_3 = (arg_715_1.time_ - var_718_1) / var_718_2

				if arg_715_1.var_.characterEffect1019ui_story then
					arg_715_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_715_1.time_ >= var_718_1 + var_718_2 and arg_715_1.time_ < var_718_1 + var_718_2 + arg_718_0 and arg_715_1.var_.characterEffect1019ui_story then
				arg_715_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_718_4 = 0
			local var_718_5 = 0.2

			if var_718_4 < arg_715_1.time_ and arg_715_1.time_ <= var_718_4 + arg_718_0 then
				arg_715_1.talkMaxDuration = 0
				arg_715_1.dialogCg_.alpha = 1

				arg_715_1.dialog_:SetActive(true)
				SetActive(arg_715_1.leftNameGo_, true)

				local var_718_6 = arg_715_1:FormatText(StoryNameCfg[13].name)

				arg_715_1.leftNameTxt_.text = var_718_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_715_1.leftNameTxt_.transform)

				arg_715_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_715_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_715_1:RecordName(arg_715_1.leftNameTxt_.text)
				SetActive(arg_715_1.iconTrs_.gameObject, false)
				arg_715_1.callingController_:SetSelectedState("normal")

				local var_718_7 = arg_715_1:GetWordFromCfg(1101906171)
				local var_718_8 = arg_715_1:FormatText(var_718_7.content)

				arg_715_1.text_.text = var_718_8

				LuaForUtil.ClearLinePrefixSymbol(arg_715_1.text_)

				local var_718_9 = 8
				local var_718_10 = utf8.len(var_718_8)
				local var_718_11 = var_718_9 <= 0 and var_718_5 or var_718_5 * (var_718_10 / var_718_9)

				if var_718_11 > 0 and var_718_5 < var_718_11 then
					arg_715_1.talkMaxDuration = var_718_11

					if var_718_11 + var_718_4 > arg_715_1.duration_ then
						arg_715_1.duration_ = var_718_11 + var_718_4
					end
				end

				arg_715_1.text_.text = var_718_8
				arg_715_1.typewritter.percent = 0

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906171", "story_v_side_new_1101906.awb") ~= 0 then
					local var_718_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906171", "story_v_side_new_1101906.awb") / 1000

					if var_718_12 + var_718_4 > arg_715_1.duration_ then
						arg_715_1.duration_ = var_718_12 + var_718_4
					end

					if var_718_7.prefab_name ~= "" and arg_715_1.actors_[var_718_7.prefab_name] ~= nil then
						local var_718_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_715_1.actors_[var_718_7.prefab_name].transform, "story_v_side_new_1101906", "1101906171", "story_v_side_new_1101906.awb")

						arg_715_1:RecordAudio("1101906171", var_718_13)
						arg_715_1:RecordAudio("1101906171", var_718_13)
					else
						arg_715_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906171", "story_v_side_new_1101906.awb")
					end

					arg_715_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906171", "story_v_side_new_1101906.awb")
				end

				arg_715_1:RecordContent(arg_715_1.text_.text)
			end

			local var_718_14 = math.max(var_718_5, arg_715_1.talkMaxDuration)

			if var_718_4 <= arg_715_1.time_ and arg_715_1.time_ < var_718_4 + var_718_14 then
				arg_715_1.typewritter.percent = (arg_715_1.time_ - var_718_4) / var_718_14

				arg_715_1.typewritter:SetDirty()
			end

			if arg_715_1.time_ >= var_718_4 + var_718_14 and arg_715_1.time_ < var_718_4 + var_718_14 + arg_718_0 then
				arg_715_1.typewritter.percent = 1

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906172 = function(arg_719_0, arg_719_1)
		arg_719_1.time_ = 0
		arg_719_1.frameCnt_ = 0
		arg_719_1.state_ = "playing"
		arg_719_1.curTalkId_ = 1101906172
		arg_719_1.duration_ = 5

		SetActive(arg_719_1.tipsGo_, false)

		function arg_719_1.onSingleLineFinish_()
			arg_719_1.onSingleLineUpdate_ = nil
			arg_719_1.onSingleLineFinish_ = nil
			arg_719_1.state_ = "waiting"
		end

		function arg_719_1.playNext_(arg_721_0)
			if arg_721_0 == 1 then
				arg_719_0:Play1101906173(arg_719_1)
			end
		end

		function arg_719_1.onSingleLineUpdate_(arg_722_0)
			local var_722_0 = 0
			local var_722_1 = 0.95

			if var_722_0 < arg_719_1.time_ and arg_719_1.time_ <= var_722_0 + arg_722_0 then
				arg_719_1.talkMaxDuration = 0
				arg_719_1.dialogCg_.alpha = 1

				arg_719_1.dialog_:SetActive(true)
				SetActive(arg_719_1.leftNameGo_, true)

				local var_722_2 = arg_719_1:FormatText(StoryNameCfg[7].name)

				arg_719_1.leftNameTxt_.text = var_722_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_719_1.leftNameTxt_.transform)

				arg_719_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_719_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_719_1:RecordName(arg_719_1.leftNameTxt_.text)
				SetActive(arg_719_1.iconTrs_.gameObject, false)
				arg_719_1.callingController_:SetSelectedState("normal")

				local var_722_3 = arg_719_1:GetWordFromCfg(1101906172)
				local var_722_4 = arg_719_1:FormatText(var_722_3.content)

				arg_719_1.text_.text = var_722_4

				LuaForUtil.ClearLinePrefixSymbol(arg_719_1.text_)

				local var_722_5 = 38
				local var_722_6 = utf8.len(var_722_4)
				local var_722_7 = var_722_5 <= 0 and var_722_1 or var_722_1 * (var_722_6 / var_722_5)

				if var_722_7 > 0 and var_722_1 < var_722_7 then
					arg_719_1.talkMaxDuration = var_722_7

					if var_722_7 + var_722_0 > arg_719_1.duration_ then
						arg_719_1.duration_ = var_722_7 + var_722_0
					end
				end

				arg_719_1.text_.text = var_722_4
				arg_719_1.typewritter.percent = 0

				arg_719_1.typewritter:SetDirty()
				arg_719_1:ShowNextGo(false)
				arg_719_1:RecordContent(arg_719_1.text_.text)
			end

			local var_722_8 = math.max(var_722_1, arg_719_1.talkMaxDuration)

			if var_722_0 <= arg_719_1.time_ and arg_719_1.time_ < var_722_0 + var_722_8 then
				arg_719_1.typewritter.percent = (arg_719_1.time_ - var_722_0) / var_722_8

				arg_719_1.typewritter:SetDirty()
			end

			if arg_719_1.time_ >= var_722_0 + var_722_8 and arg_719_1.time_ < var_722_0 + var_722_8 + arg_722_0 then
				arg_719_1.typewritter.percent = 1

				arg_719_1.typewritter:SetDirty()
				arg_719_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906173 = function(arg_723_0, arg_723_1)
		arg_723_1.time_ = 0
		arg_723_1.frameCnt_ = 0
		arg_723_1.state_ = "playing"
		arg_723_1.curTalkId_ = 1101906173
		arg_723_1.duration_ = 5

		SetActive(arg_723_1.tipsGo_, false)

		function arg_723_1.onSingleLineFinish_()
			arg_723_1.onSingleLineUpdate_ = nil
			arg_723_1.onSingleLineFinish_ = nil
			arg_723_1.state_ = "waiting"
		end

		function arg_723_1.playNext_(arg_725_0)
			if arg_725_0 == 1 then
				arg_723_0:Play1101906174(arg_723_1)
			end
		end

		function arg_723_1.onSingleLineUpdate_(arg_726_0)
			local var_726_0 = 0
			local var_726_1 = 0.75

			if var_726_0 < arg_723_1.time_ and arg_723_1.time_ <= var_726_0 + arg_726_0 then
				arg_723_1.talkMaxDuration = 0
				arg_723_1.dialogCg_.alpha = 1

				arg_723_1.dialog_:SetActive(true)
				SetActive(arg_723_1.leftNameGo_, true)

				local var_726_2 = arg_723_1:FormatText(StoryNameCfg[7].name)

				arg_723_1.leftNameTxt_.text = var_726_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_723_1.leftNameTxt_.transform)

				arg_723_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_723_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_723_1:RecordName(arg_723_1.leftNameTxt_.text)
				SetActive(arg_723_1.iconTrs_.gameObject, false)
				arg_723_1.callingController_:SetSelectedState("normal")

				local var_726_3 = arg_723_1:GetWordFromCfg(1101906173)
				local var_726_4 = arg_723_1:FormatText(var_726_3.content)

				arg_723_1.text_.text = var_726_4

				LuaForUtil.ClearLinePrefixSymbol(arg_723_1.text_)

				local var_726_5 = 30
				local var_726_6 = utf8.len(var_726_4)
				local var_726_7 = var_726_5 <= 0 and var_726_1 or var_726_1 * (var_726_6 / var_726_5)

				if var_726_7 > 0 and var_726_1 < var_726_7 then
					arg_723_1.talkMaxDuration = var_726_7

					if var_726_7 + var_726_0 > arg_723_1.duration_ then
						arg_723_1.duration_ = var_726_7 + var_726_0
					end
				end

				arg_723_1.text_.text = var_726_4
				arg_723_1.typewritter.percent = 0

				arg_723_1.typewritter:SetDirty()
				arg_723_1:ShowNextGo(false)
				arg_723_1:RecordContent(arg_723_1.text_.text)
			end

			local var_726_8 = math.max(var_726_1, arg_723_1.talkMaxDuration)

			if var_726_0 <= arg_723_1.time_ and arg_723_1.time_ < var_726_0 + var_726_8 then
				arg_723_1.typewritter.percent = (arg_723_1.time_ - var_726_0) / var_726_8

				arg_723_1.typewritter:SetDirty()
			end

			if arg_723_1.time_ >= var_726_0 + var_726_8 and arg_723_1.time_ < var_726_0 + var_726_8 + arg_726_0 then
				arg_723_1.typewritter.percent = 1

				arg_723_1.typewritter:SetDirty()
				arg_723_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906174 = function(arg_727_0, arg_727_1)
		arg_727_1.time_ = 0
		arg_727_1.frameCnt_ = 0
		arg_727_1.state_ = "playing"
		arg_727_1.curTalkId_ = 1101906174
		arg_727_1.duration_ = 5.166

		SetActive(arg_727_1.tipsGo_, false)

		function arg_727_1.onSingleLineFinish_()
			arg_727_1.onSingleLineUpdate_ = nil
			arg_727_1.onSingleLineFinish_ = nil
			arg_727_1.state_ = "waiting"
		end

		function arg_727_1.playNext_(arg_729_0)
			if arg_729_0 == 1 then
				arg_727_0:Play1101906175(arg_727_1)
			end
		end

		function arg_727_1.onSingleLineUpdate_(arg_730_0)
			local var_730_0 = arg_727_1.actors_["1019ui_story"]
			local var_730_1 = 0

			if var_730_1 < arg_727_1.time_ and arg_727_1.time_ <= var_730_1 + arg_730_0 and arg_727_1.var_.characterEffect1019ui_story == nil then
				arg_727_1.var_.characterEffect1019ui_story = var_730_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_730_2 = 0.200000002980232

			if var_730_1 <= arg_727_1.time_ and arg_727_1.time_ < var_730_1 + var_730_2 then
				local var_730_3 = (arg_727_1.time_ - var_730_1) / var_730_2

				if arg_727_1.var_.characterEffect1019ui_story then
					arg_727_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_727_1.time_ >= var_730_1 + var_730_2 and arg_727_1.time_ < var_730_1 + var_730_2 + arg_730_0 and arg_727_1.var_.characterEffect1019ui_story then
				arg_727_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_730_4 = 0
			local var_730_5 = 0.65

			if var_730_4 < arg_727_1.time_ and arg_727_1.time_ <= var_730_4 + arg_730_0 then
				arg_727_1.talkMaxDuration = 0
				arg_727_1.dialogCg_.alpha = 1

				arg_727_1.dialog_:SetActive(true)
				SetActive(arg_727_1.leftNameGo_, true)

				local var_730_6 = arg_727_1:FormatText(StoryNameCfg[13].name)

				arg_727_1.leftNameTxt_.text = var_730_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_727_1.leftNameTxt_.transform)

				arg_727_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_727_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_727_1:RecordName(arg_727_1.leftNameTxt_.text)
				SetActive(arg_727_1.iconTrs_.gameObject, false)
				arg_727_1.callingController_:SetSelectedState("normal")

				local var_730_7 = arg_727_1:GetWordFromCfg(1101906174)
				local var_730_8 = arg_727_1:FormatText(var_730_7.content)

				arg_727_1.text_.text = var_730_8

				LuaForUtil.ClearLinePrefixSymbol(arg_727_1.text_)

				local var_730_9 = 26
				local var_730_10 = utf8.len(var_730_8)
				local var_730_11 = var_730_9 <= 0 and var_730_5 or var_730_5 * (var_730_10 / var_730_9)

				if var_730_11 > 0 and var_730_5 < var_730_11 then
					arg_727_1.talkMaxDuration = var_730_11

					if var_730_11 + var_730_4 > arg_727_1.duration_ then
						arg_727_1.duration_ = var_730_11 + var_730_4
					end
				end

				arg_727_1.text_.text = var_730_8
				arg_727_1.typewritter.percent = 0

				arg_727_1.typewritter:SetDirty()
				arg_727_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906174", "story_v_side_new_1101906.awb") ~= 0 then
					local var_730_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906174", "story_v_side_new_1101906.awb") / 1000

					if var_730_12 + var_730_4 > arg_727_1.duration_ then
						arg_727_1.duration_ = var_730_12 + var_730_4
					end

					if var_730_7.prefab_name ~= "" and arg_727_1.actors_[var_730_7.prefab_name] ~= nil then
						local var_730_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_727_1.actors_[var_730_7.prefab_name].transform, "story_v_side_new_1101906", "1101906174", "story_v_side_new_1101906.awb")

						arg_727_1:RecordAudio("1101906174", var_730_13)
						arg_727_1:RecordAudio("1101906174", var_730_13)
					else
						arg_727_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906174", "story_v_side_new_1101906.awb")
					end

					arg_727_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906174", "story_v_side_new_1101906.awb")
				end

				arg_727_1:RecordContent(arg_727_1.text_.text)
			end

			local var_730_14 = math.max(var_730_5, arg_727_1.talkMaxDuration)

			if var_730_4 <= arg_727_1.time_ and arg_727_1.time_ < var_730_4 + var_730_14 then
				arg_727_1.typewritter.percent = (arg_727_1.time_ - var_730_4) / var_730_14

				arg_727_1.typewritter:SetDirty()
			end

			if arg_727_1.time_ >= var_730_4 + var_730_14 and arg_727_1.time_ < var_730_4 + var_730_14 + arg_730_0 then
				arg_727_1.typewritter.percent = 1

				arg_727_1.typewritter:SetDirty()
				arg_727_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906175 = function(arg_731_0, arg_731_1)
		arg_731_1.time_ = 0
		arg_731_1.frameCnt_ = 0
		arg_731_1.state_ = "playing"
		arg_731_1.curTalkId_ = 1101906175
		arg_731_1.duration_ = 5

		SetActive(arg_731_1.tipsGo_, false)

		function arg_731_1.onSingleLineFinish_()
			arg_731_1.onSingleLineUpdate_ = nil
			arg_731_1.onSingleLineFinish_ = nil
			arg_731_1.state_ = "waiting"
		end

		function arg_731_1.playNext_(arg_733_0)
			if arg_733_0 == 1 then
				arg_731_0:Play1101906176(arg_731_1)
			end
		end

		function arg_731_1.onSingleLineUpdate_(arg_734_0)
			local var_734_0 = arg_731_1.actors_["1019ui_story"]
			local var_734_1 = 0

			if var_734_1 < arg_731_1.time_ and arg_731_1.time_ <= var_734_1 + arg_734_0 and arg_731_1.var_.characterEffect1019ui_story == nil then
				arg_731_1.var_.characterEffect1019ui_story = var_734_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_734_2 = 0.200000002980232

			if var_734_1 <= arg_731_1.time_ and arg_731_1.time_ < var_734_1 + var_734_2 then
				local var_734_3 = (arg_731_1.time_ - var_734_1) / var_734_2

				if arg_731_1.var_.characterEffect1019ui_story then
					local var_734_4 = Mathf.Lerp(0, 0.5, var_734_3)

					arg_731_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_731_1.var_.characterEffect1019ui_story.fillRatio = var_734_4
				end
			end

			if arg_731_1.time_ >= var_734_1 + var_734_2 and arg_731_1.time_ < var_734_1 + var_734_2 + arg_734_0 and arg_731_1.var_.characterEffect1019ui_story then
				local var_734_5 = 0.5

				arg_731_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_731_1.var_.characterEffect1019ui_story.fillRatio = var_734_5
			end

			local var_734_6 = 0
			local var_734_7 = 0.9

			if var_734_6 < arg_731_1.time_ and arg_731_1.time_ <= var_734_6 + arg_734_0 then
				arg_731_1.talkMaxDuration = 0
				arg_731_1.dialogCg_.alpha = 1

				arg_731_1.dialog_:SetActive(true)
				SetActive(arg_731_1.leftNameGo_, true)

				local var_734_8 = arg_731_1:FormatText(StoryNameCfg[7].name)

				arg_731_1.leftNameTxt_.text = var_734_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_731_1.leftNameTxt_.transform)

				arg_731_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_731_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_731_1:RecordName(arg_731_1.leftNameTxt_.text)
				SetActive(arg_731_1.iconTrs_.gameObject, false)
				arg_731_1.callingController_:SetSelectedState("normal")

				local var_734_9 = arg_731_1:GetWordFromCfg(1101906175)
				local var_734_10 = arg_731_1:FormatText(var_734_9.content)

				arg_731_1.text_.text = var_734_10

				LuaForUtil.ClearLinePrefixSymbol(arg_731_1.text_)

				local var_734_11 = 36
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
	Play1101906176 = function(arg_735_0, arg_735_1)
		arg_735_1.time_ = 0
		arg_735_1.frameCnt_ = 0
		arg_735_1.state_ = "playing"
		arg_735_1.curTalkId_ = 1101906176
		arg_735_1.duration_ = 10.1

		SetActive(arg_735_1.tipsGo_, false)

		function arg_735_1.onSingleLineFinish_()
			arg_735_1.onSingleLineUpdate_ = nil
			arg_735_1.onSingleLineFinish_ = nil
			arg_735_1.state_ = "waiting"
		end

		function arg_735_1.playNext_(arg_737_0)
			if arg_737_0 == 1 then
				arg_735_0:Play1101906177(arg_735_1)
			end
		end

		function arg_735_1.onSingleLineUpdate_(arg_738_0)
			local var_738_0 = arg_735_1.actors_["1019ui_story"]
			local var_738_1 = 0

			if var_738_1 < arg_735_1.time_ and arg_735_1.time_ <= var_738_1 + arg_738_0 and arg_735_1.var_.characterEffect1019ui_story == nil then
				arg_735_1.var_.characterEffect1019ui_story = var_738_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_738_2 = 0.200000002980232

			if var_738_1 <= arg_735_1.time_ and arg_735_1.time_ < var_738_1 + var_738_2 then
				local var_738_3 = (arg_735_1.time_ - var_738_1) / var_738_2

				if arg_735_1.var_.characterEffect1019ui_story then
					arg_735_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_735_1.time_ >= var_738_1 + var_738_2 and arg_735_1.time_ < var_738_1 + var_738_2 + arg_738_0 and arg_735_1.var_.characterEffect1019ui_story then
				arg_735_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_738_4 = 0
			local var_738_5 = 1.225

			if var_738_4 < arg_735_1.time_ and arg_735_1.time_ <= var_738_4 + arg_738_0 then
				arg_735_1.talkMaxDuration = 0
				arg_735_1.dialogCg_.alpha = 1

				arg_735_1.dialog_:SetActive(true)
				SetActive(arg_735_1.leftNameGo_, true)

				local var_738_6 = arg_735_1:FormatText(StoryNameCfg[13].name)

				arg_735_1.leftNameTxt_.text = var_738_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_735_1.leftNameTxt_.transform)

				arg_735_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_735_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_735_1:RecordName(arg_735_1.leftNameTxt_.text)
				SetActive(arg_735_1.iconTrs_.gameObject, false)
				arg_735_1.callingController_:SetSelectedState("normal")

				local var_738_7 = arg_735_1:GetWordFromCfg(1101906176)
				local var_738_8 = arg_735_1:FormatText(var_738_7.content)

				arg_735_1.text_.text = var_738_8

				LuaForUtil.ClearLinePrefixSymbol(arg_735_1.text_)

				local var_738_9 = 49
				local var_738_10 = utf8.len(var_738_8)
				local var_738_11 = var_738_9 <= 0 and var_738_5 or var_738_5 * (var_738_10 / var_738_9)

				if var_738_11 > 0 and var_738_5 < var_738_11 then
					arg_735_1.talkMaxDuration = var_738_11

					if var_738_11 + var_738_4 > arg_735_1.duration_ then
						arg_735_1.duration_ = var_738_11 + var_738_4
					end
				end

				arg_735_1.text_.text = var_738_8
				arg_735_1.typewritter.percent = 0

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906176", "story_v_side_new_1101906.awb") ~= 0 then
					local var_738_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906176", "story_v_side_new_1101906.awb") / 1000

					if var_738_12 + var_738_4 > arg_735_1.duration_ then
						arg_735_1.duration_ = var_738_12 + var_738_4
					end

					if var_738_7.prefab_name ~= "" and arg_735_1.actors_[var_738_7.prefab_name] ~= nil then
						local var_738_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_735_1.actors_[var_738_7.prefab_name].transform, "story_v_side_new_1101906", "1101906176", "story_v_side_new_1101906.awb")

						arg_735_1:RecordAudio("1101906176", var_738_13)
						arg_735_1:RecordAudio("1101906176", var_738_13)
					else
						arg_735_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906176", "story_v_side_new_1101906.awb")
					end

					arg_735_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906176", "story_v_side_new_1101906.awb")
				end

				arg_735_1:RecordContent(arg_735_1.text_.text)
			end

			local var_738_14 = math.max(var_738_5, arg_735_1.talkMaxDuration)

			if var_738_4 <= arg_735_1.time_ and arg_735_1.time_ < var_738_4 + var_738_14 then
				arg_735_1.typewritter.percent = (arg_735_1.time_ - var_738_4) / var_738_14

				arg_735_1.typewritter:SetDirty()
			end

			if arg_735_1.time_ >= var_738_4 + var_738_14 and arg_735_1.time_ < var_738_4 + var_738_14 + arg_738_0 then
				arg_735_1.typewritter.percent = 1

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906177 = function(arg_739_0, arg_739_1)
		arg_739_1.time_ = 0
		arg_739_1.frameCnt_ = 0
		arg_739_1.state_ = "playing"
		arg_739_1.curTalkId_ = 1101906177
		arg_739_1.duration_ = 3.666

		SetActive(arg_739_1.tipsGo_, false)

		function arg_739_1.onSingleLineFinish_()
			arg_739_1.onSingleLineUpdate_ = nil
			arg_739_1.onSingleLineFinish_ = nil
			arg_739_1.state_ = "waiting"
		end

		function arg_739_1.playNext_(arg_741_0)
			if arg_741_0 == 1 then
				arg_739_0:Play1101906178(arg_739_1)
			end
		end

		function arg_739_1.onSingleLineUpdate_(arg_742_0)
			local var_742_0 = arg_739_1.actors_["1019ui_story"].transform
			local var_742_1 = 0

			if var_742_1 < arg_739_1.time_ and arg_739_1.time_ <= var_742_1 + arg_742_0 then
				arg_739_1.var_.moveOldPos1019ui_story = var_742_0.localPosition
			end

			local var_742_2 = 0.001

			if var_742_1 <= arg_739_1.time_ and arg_739_1.time_ < var_742_1 + var_742_2 then
				local var_742_3 = (arg_739_1.time_ - var_742_1) / var_742_2
				local var_742_4 = Vector3.New(0, -1.08, -5.9)

				var_742_0.localPosition = Vector3.Lerp(arg_739_1.var_.moveOldPos1019ui_story, var_742_4, var_742_3)

				local var_742_5 = manager.ui.mainCamera.transform.position - var_742_0.position

				var_742_0.forward = Vector3.New(var_742_5.x, var_742_5.y, var_742_5.z)

				local var_742_6 = var_742_0.localEulerAngles

				var_742_6.z = 0
				var_742_6.x = 0
				var_742_0.localEulerAngles = var_742_6
			end

			if arg_739_1.time_ >= var_742_1 + var_742_2 and arg_739_1.time_ < var_742_1 + var_742_2 + arg_742_0 then
				var_742_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_742_7 = manager.ui.mainCamera.transform.position - var_742_0.position

				var_742_0.forward = Vector3.New(var_742_7.x, var_742_7.y, var_742_7.z)

				local var_742_8 = var_742_0.localEulerAngles

				var_742_8.z = 0
				var_742_8.x = 0
				var_742_0.localEulerAngles = var_742_8
			end

			local var_742_9 = arg_739_1.actors_["1019ui_story"]
			local var_742_10 = 0

			if var_742_10 < arg_739_1.time_ and arg_739_1.time_ <= var_742_10 + arg_742_0 and arg_739_1.var_.characterEffect1019ui_story == nil then
				arg_739_1.var_.characterEffect1019ui_story = var_742_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_742_11 = 0.200000002980232

			if var_742_10 <= arg_739_1.time_ and arg_739_1.time_ < var_742_10 + var_742_11 then
				local var_742_12 = (arg_739_1.time_ - var_742_10) / var_742_11

				if arg_739_1.var_.characterEffect1019ui_story then
					arg_739_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_739_1.time_ >= var_742_10 + var_742_11 and arg_739_1.time_ < var_742_10 + var_742_11 + arg_742_0 and arg_739_1.var_.characterEffect1019ui_story then
				arg_739_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_742_13 = 0

			if var_742_13 < arg_739_1.time_ and arg_739_1.time_ <= var_742_13 + arg_742_0 then
				arg_739_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_2")
			end

			local var_742_14 = 0

			if var_742_14 < arg_739_1.time_ and arg_739_1.time_ <= var_742_14 + arg_742_0 then
				arg_739_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_742_15 = 0
			local var_742_16 = 0.375

			if var_742_15 < arg_739_1.time_ and arg_739_1.time_ <= var_742_15 + arg_742_0 then
				arg_739_1.talkMaxDuration = 0
				arg_739_1.dialogCg_.alpha = 1

				arg_739_1.dialog_:SetActive(true)
				SetActive(arg_739_1.leftNameGo_, true)

				local var_742_17 = arg_739_1:FormatText(StoryNameCfg[13].name)

				arg_739_1.leftNameTxt_.text = var_742_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_739_1.leftNameTxt_.transform)

				arg_739_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_739_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_739_1:RecordName(arg_739_1.leftNameTxt_.text)
				SetActive(arg_739_1.iconTrs_.gameObject, false)
				arg_739_1.callingController_:SetSelectedState("normal")

				local var_742_18 = arg_739_1:GetWordFromCfg(1101906177)
				local var_742_19 = arg_739_1:FormatText(var_742_18.content)

				arg_739_1.text_.text = var_742_19

				LuaForUtil.ClearLinePrefixSymbol(arg_739_1.text_)

				local var_742_20 = 15
				local var_742_21 = utf8.len(var_742_19)
				local var_742_22 = var_742_20 <= 0 and var_742_16 or var_742_16 * (var_742_21 / var_742_20)

				if var_742_22 > 0 and var_742_16 < var_742_22 then
					arg_739_1.talkMaxDuration = var_742_22

					if var_742_22 + var_742_15 > arg_739_1.duration_ then
						arg_739_1.duration_ = var_742_22 + var_742_15
					end
				end

				arg_739_1.text_.text = var_742_19
				arg_739_1.typewritter.percent = 0

				arg_739_1.typewritter:SetDirty()
				arg_739_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906177", "story_v_side_new_1101906.awb") ~= 0 then
					local var_742_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906177", "story_v_side_new_1101906.awb") / 1000

					if var_742_23 + var_742_15 > arg_739_1.duration_ then
						arg_739_1.duration_ = var_742_23 + var_742_15
					end

					if var_742_18.prefab_name ~= "" and arg_739_1.actors_[var_742_18.prefab_name] ~= nil then
						local var_742_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_739_1.actors_[var_742_18.prefab_name].transform, "story_v_side_new_1101906", "1101906177", "story_v_side_new_1101906.awb")

						arg_739_1:RecordAudio("1101906177", var_742_24)
						arg_739_1:RecordAudio("1101906177", var_742_24)
					else
						arg_739_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906177", "story_v_side_new_1101906.awb")
					end

					arg_739_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906177", "story_v_side_new_1101906.awb")
				end

				arg_739_1:RecordContent(arg_739_1.text_.text)
			end

			local var_742_25 = math.max(var_742_16, arg_739_1.talkMaxDuration)

			if var_742_15 <= arg_739_1.time_ and arg_739_1.time_ < var_742_15 + var_742_25 then
				arg_739_1.typewritter.percent = (arg_739_1.time_ - var_742_15) / var_742_25

				arg_739_1.typewritter:SetDirty()
			end

			if arg_739_1.time_ >= var_742_15 + var_742_25 and arg_739_1.time_ < var_742_15 + var_742_25 + arg_742_0 then
				arg_739_1.typewritter.percent = 1

				arg_739_1.typewritter:SetDirty()
				arg_739_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906178 = function(arg_743_0, arg_743_1)
		arg_743_1.time_ = 0
		arg_743_1.frameCnt_ = 0
		arg_743_1.state_ = "playing"
		arg_743_1.curTalkId_ = 1101906178
		arg_743_1.duration_ = 5

		SetActive(arg_743_1.tipsGo_, false)

		function arg_743_1.onSingleLineFinish_()
			arg_743_1.onSingleLineUpdate_ = nil
			arg_743_1.onSingleLineFinish_ = nil
			arg_743_1.state_ = "waiting"
		end

		function arg_743_1.playNext_(arg_745_0)
			if arg_745_0 == 1 then
				arg_743_0:Play1101906179(arg_743_1)
			end
		end

		function arg_743_1.onSingleLineUpdate_(arg_746_0)
			local var_746_0 = arg_743_1.actors_["1019ui_story"]
			local var_746_1 = 0

			if var_746_1 < arg_743_1.time_ and arg_743_1.time_ <= var_746_1 + arg_746_0 and arg_743_1.var_.characterEffect1019ui_story == nil then
				arg_743_1.var_.characterEffect1019ui_story = var_746_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_746_2 = 0.200000002980232

			if var_746_1 <= arg_743_1.time_ and arg_743_1.time_ < var_746_1 + var_746_2 then
				local var_746_3 = (arg_743_1.time_ - var_746_1) / var_746_2

				if arg_743_1.var_.characterEffect1019ui_story then
					local var_746_4 = Mathf.Lerp(0, 0.5, var_746_3)

					arg_743_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_743_1.var_.characterEffect1019ui_story.fillRatio = var_746_4
				end
			end

			if arg_743_1.time_ >= var_746_1 + var_746_2 and arg_743_1.time_ < var_746_1 + var_746_2 + arg_746_0 and arg_743_1.var_.characterEffect1019ui_story then
				local var_746_5 = 0.5

				arg_743_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_743_1.var_.characterEffect1019ui_story.fillRatio = var_746_5
			end

			local var_746_6 = 0
			local var_746_7 = 0.6

			if var_746_6 < arg_743_1.time_ and arg_743_1.time_ <= var_746_6 + arg_746_0 then
				arg_743_1.talkMaxDuration = 0
				arg_743_1.dialogCg_.alpha = 1

				arg_743_1.dialog_:SetActive(true)
				SetActive(arg_743_1.leftNameGo_, true)

				local var_746_8 = arg_743_1:FormatText(StoryNameCfg[7].name)

				arg_743_1.leftNameTxt_.text = var_746_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_743_1.leftNameTxt_.transform)

				arg_743_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_743_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_743_1:RecordName(arg_743_1.leftNameTxt_.text)
				SetActive(arg_743_1.iconTrs_.gameObject, false)
				arg_743_1.callingController_:SetSelectedState("normal")

				local var_746_9 = arg_743_1:GetWordFromCfg(1101906178)
				local var_746_10 = arg_743_1:FormatText(var_746_9.content)

				arg_743_1.text_.text = var_746_10

				LuaForUtil.ClearLinePrefixSymbol(arg_743_1.text_)

				local var_746_11 = 24
				local var_746_12 = utf8.len(var_746_10)
				local var_746_13 = var_746_11 <= 0 and var_746_7 or var_746_7 * (var_746_12 / var_746_11)

				if var_746_13 > 0 and var_746_7 < var_746_13 then
					arg_743_1.talkMaxDuration = var_746_13

					if var_746_13 + var_746_6 > arg_743_1.duration_ then
						arg_743_1.duration_ = var_746_13 + var_746_6
					end
				end

				arg_743_1.text_.text = var_746_10
				arg_743_1.typewritter.percent = 0

				arg_743_1.typewritter:SetDirty()
				arg_743_1:ShowNextGo(false)
				arg_743_1:RecordContent(arg_743_1.text_.text)
			end

			local var_746_14 = math.max(var_746_7, arg_743_1.talkMaxDuration)

			if var_746_6 <= arg_743_1.time_ and arg_743_1.time_ < var_746_6 + var_746_14 then
				arg_743_1.typewritter.percent = (arg_743_1.time_ - var_746_6) / var_746_14

				arg_743_1.typewritter:SetDirty()
			end

			if arg_743_1.time_ >= var_746_6 + var_746_14 and arg_743_1.time_ < var_746_6 + var_746_14 + arg_746_0 then
				arg_743_1.typewritter.percent = 1

				arg_743_1.typewritter:SetDirty()
				arg_743_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906179 = function(arg_747_0, arg_747_1)
		arg_747_1.time_ = 0
		arg_747_1.frameCnt_ = 0
		arg_747_1.state_ = "playing"
		arg_747_1.curTalkId_ = 1101906179
		arg_747_1.duration_ = 5

		SetActive(arg_747_1.tipsGo_, false)

		function arg_747_1.onSingleLineFinish_()
			arg_747_1.onSingleLineUpdate_ = nil
			arg_747_1.onSingleLineFinish_ = nil
			arg_747_1.state_ = "waiting"
		end

		function arg_747_1.playNext_(arg_749_0)
			if arg_749_0 == 1 then
				arg_747_0:Play1101906180(arg_747_1)
			end
		end

		function arg_747_1.onSingleLineUpdate_(arg_750_0)
			local var_750_0 = 0
			local var_750_1 = 0.5

			if var_750_0 < arg_747_1.time_ and arg_747_1.time_ <= var_750_0 + arg_750_0 then
				arg_747_1.talkMaxDuration = 0
				arg_747_1.dialogCg_.alpha = 1

				arg_747_1.dialog_:SetActive(true)
				SetActive(arg_747_1.leftNameGo_, true)

				local var_750_2 = arg_747_1:FormatText(StoryNameCfg[7].name)

				arg_747_1.leftNameTxt_.text = var_750_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_747_1.leftNameTxt_.transform)

				arg_747_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_747_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_747_1:RecordName(arg_747_1.leftNameTxt_.text)
				SetActive(arg_747_1.iconTrs_.gameObject, false)
				arg_747_1.callingController_:SetSelectedState("normal")

				local var_750_3 = arg_747_1:GetWordFromCfg(1101906179)
				local var_750_4 = arg_747_1:FormatText(var_750_3.content)

				arg_747_1.text_.text = var_750_4

				LuaForUtil.ClearLinePrefixSymbol(arg_747_1.text_)

				local var_750_5 = 20
				local var_750_6 = utf8.len(var_750_4)
				local var_750_7 = var_750_5 <= 0 and var_750_1 or var_750_1 * (var_750_6 / var_750_5)

				if var_750_7 > 0 and var_750_1 < var_750_7 then
					arg_747_1.talkMaxDuration = var_750_7

					if var_750_7 + var_750_0 > arg_747_1.duration_ then
						arg_747_1.duration_ = var_750_7 + var_750_0
					end
				end

				arg_747_1.text_.text = var_750_4
				arg_747_1.typewritter.percent = 0

				arg_747_1.typewritter:SetDirty()
				arg_747_1:ShowNextGo(false)
				arg_747_1:RecordContent(arg_747_1.text_.text)
			end

			local var_750_8 = math.max(var_750_1, arg_747_1.talkMaxDuration)

			if var_750_0 <= arg_747_1.time_ and arg_747_1.time_ < var_750_0 + var_750_8 then
				arg_747_1.typewritter.percent = (arg_747_1.time_ - var_750_0) / var_750_8

				arg_747_1.typewritter:SetDirty()
			end

			if arg_747_1.time_ >= var_750_0 + var_750_8 and arg_747_1.time_ < var_750_0 + var_750_8 + arg_750_0 then
				arg_747_1.typewritter.percent = 1

				arg_747_1.typewritter:SetDirty()
				arg_747_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906180 = function(arg_751_0, arg_751_1)
		arg_751_1.time_ = 0
		arg_751_1.frameCnt_ = 0
		arg_751_1.state_ = "playing"
		arg_751_1.curTalkId_ = 1101906180
		arg_751_1.duration_ = 8.833

		SetActive(arg_751_1.tipsGo_, false)

		function arg_751_1.onSingleLineFinish_()
			arg_751_1.onSingleLineUpdate_ = nil
			arg_751_1.onSingleLineFinish_ = nil
			arg_751_1.state_ = "waiting"
		end

		function arg_751_1.playNext_(arg_753_0)
			if arg_753_0 == 1 then
				arg_751_0:Play1101906181(arg_751_1)
			end
		end

		function arg_751_1.onSingleLineUpdate_(arg_754_0)
			local var_754_0 = arg_751_1.actors_["1019ui_story"]
			local var_754_1 = 0

			if var_754_1 < arg_751_1.time_ and arg_751_1.time_ <= var_754_1 + arg_754_0 and arg_751_1.var_.characterEffect1019ui_story == nil then
				arg_751_1.var_.characterEffect1019ui_story = var_754_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_754_2 = 0.200000002980232

			if var_754_1 <= arg_751_1.time_ and arg_751_1.time_ < var_754_1 + var_754_2 then
				local var_754_3 = (arg_751_1.time_ - var_754_1) / var_754_2

				if arg_751_1.var_.characterEffect1019ui_story then
					arg_751_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_751_1.time_ >= var_754_1 + var_754_2 and arg_751_1.time_ < var_754_1 + var_754_2 + arg_754_0 and arg_751_1.var_.characterEffect1019ui_story then
				arg_751_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_754_4 = 0
			local var_754_5 = 0.925

			if var_754_4 < arg_751_1.time_ and arg_751_1.time_ <= var_754_4 + arg_754_0 then
				arg_751_1.talkMaxDuration = 0
				arg_751_1.dialogCg_.alpha = 1

				arg_751_1.dialog_:SetActive(true)
				SetActive(arg_751_1.leftNameGo_, true)

				local var_754_6 = arg_751_1:FormatText(StoryNameCfg[13].name)

				arg_751_1.leftNameTxt_.text = var_754_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_751_1.leftNameTxt_.transform)

				arg_751_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_751_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_751_1:RecordName(arg_751_1.leftNameTxt_.text)
				SetActive(arg_751_1.iconTrs_.gameObject, false)
				arg_751_1.callingController_:SetSelectedState("normal")

				local var_754_7 = arg_751_1:GetWordFromCfg(1101906180)
				local var_754_8 = arg_751_1:FormatText(var_754_7.content)

				arg_751_1.text_.text = var_754_8

				LuaForUtil.ClearLinePrefixSymbol(arg_751_1.text_)

				local var_754_9 = 37
				local var_754_10 = utf8.len(var_754_8)
				local var_754_11 = var_754_9 <= 0 and var_754_5 or var_754_5 * (var_754_10 / var_754_9)

				if var_754_11 > 0 and var_754_5 < var_754_11 then
					arg_751_1.talkMaxDuration = var_754_11

					if var_754_11 + var_754_4 > arg_751_1.duration_ then
						arg_751_1.duration_ = var_754_11 + var_754_4
					end
				end

				arg_751_1.text_.text = var_754_8
				arg_751_1.typewritter.percent = 0

				arg_751_1.typewritter:SetDirty()
				arg_751_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906180", "story_v_side_new_1101906.awb") ~= 0 then
					local var_754_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906180", "story_v_side_new_1101906.awb") / 1000

					if var_754_12 + var_754_4 > arg_751_1.duration_ then
						arg_751_1.duration_ = var_754_12 + var_754_4
					end

					if var_754_7.prefab_name ~= "" and arg_751_1.actors_[var_754_7.prefab_name] ~= nil then
						local var_754_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_751_1.actors_[var_754_7.prefab_name].transform, "story_v_side_new_1101906", "1101906180", "story_v_side_new_1101906.awb")

						arg_751_1:RecordAudio("1101906180", var_754_13)
						arg_751_1:RecordAudio("1101906180", var_754_13)
					else
						arg_751_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906180", "story_v_side_new_1101906.awb")
					end

					arg_751_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906180", "story_v_side_new_1101906.awb")
				end

				arg_751_1:RecordContent(arg_751_1.text_.text)
			end

			local var_754_14 = math.max(var_754_5, arg_751_1.talkMaxDuration)

			if var_754_4 <= arg_751_1.time_ and arg_751_1.time_ < var_754_4 + var_754_14 then
				arg_751_1.typewritter.percent = (arg_751_1.time_ - var_754_4) / var_754_14

				arg_751_1.typewritter:SetDirty()
			end

			if arg_751_1.time_ >= var_754_4 + var_754_14 and arg_751_1.time_ < var_754_4 + var_754_14 + arg_754_0 then
				arg_751_1.typewritter.percent = 1

				arg_751_1.typewritter:SetDirty()
				arg_751_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906181 = function(arg_755_0, arg_755_1)
		arg_755_1.time_ = 0
		arg_755_1.frameCnt_ = 0
		arg_755_1.state_ = "playing"
		arg_755_1.curTalkId_ = 1101906181
		arg_755_1.duration_ = 5

		SetActive(arg_755_1.tipsGo_, false)

		function arg_755_1.onSingleLineFinish_()
			arg_755_1.onSingleLineUpdate_ = nil
			arg_755_1.onSingleLineFinish_ = nil
			arg_755_1.state_ = "waiting"
		end

		function arg_755_1.playNext_(arg_757_0)
			if arg_757_0 == 1 then
				arg_755_0:Play1101906182(arg_755_1)
			end
		end

		function arg_755_1.onSingleLineUpdate_(arg_758_0)
			local var_758_0 = arg_755_1.actors_["1019ui_story"]
			local var_758_1 = 0

			if var_758_1 < arg_755_1.time_ and arg_755_1.time_ <= var_758_1 + arg_758_0 and arg_755_1.var_.characterEffect1019ui_story == nil then
				arg_755_1.var_.characterEffect1019ui_story = var_758_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_758_2 = 0.200000002980232

			if var_758_1 <= arg_755_1.time_ and arg_755_1.time_ < var_758_1 + var_758_2 then
				local var_758_3 = (arg_755_1.time_ - var_758_1) / var_758_2

				if arg_755_1.var_.characterEffect1019ui_story then
					local var_758_4 = Mathf.Lerp(0, 0.5, var_758_3)

					arg_755_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_755_1.var_.characterEffect1019ui_story.fillRatio = var_758_4
				end
			end

			if arg_755_1.time_ >= var_758_1 + var_758_2 and arg_755_1.time_ < var_758_1 + var_758_2 + arg_758_0 and arg_755_1.var_.characterEffect1019ui_story then
				local var_758_5 = 0.5

				arg_755_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_755_1.var_.characterEffect1019ui_story.fillRatio = var_758_5
			end

			local var_758_6 = 0
			local var_758_7 = 0.775

			if var_758_6 < arg_755_1.time_ and arg_755_1.time_ <= var_758_6 + arg_758_0 then
				arg_755_1.talkMaxDuration = 0
				arg_755_1.dialogCg_.alpha = 1

				arg_755_1.dialog_:SetActive(true)
				SetActive(arg_755_1.leftNameGo_, false)

				arg_755_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_755_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_755_1:RecordName(arg_755_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_755_1.iconTrs_.gameObject, false)
				arg_755_1.callingController_:SetSelectedState("normal")

				local var_758_8 = arg_755_1:GetWordFromCfg(1101906181)
				local var_758_9 = arg_755_1:FormatText(var_758_8.content)

				arg_755_1.text_.text = var_758_9

				LuaForUtil.ClearLinePrefixSymbol(arg_755_1.text_)

				local var_758_10 = 31
				local var_758_11 = utf8.len(var_758_9)
				local var_758_12 = var_758_10 <= 0 and var_758_7 or var_758_7 * (var_758_11 / var_758_10)

				if var_758_12 > 0 and var_758_7 < var_758_12 then
					arg_755_1.talkMaxDuration = var_758_12

					if var_758_12 + var_758_6 > arg_755_1.duration_ then
						arg_755_1.duration_ = var_758_12 + var_758_6
					end
				end

				arg_755_1.text_.text = var_758_9
				arg_755_1.typewritter.percent = 0

				arg_755_1.typewritter:SetDirty()
				arg_755_1:ShowNextGo(false)
				arg_755_1:RecordContent(arg_755_1.text_.text)
			end

			local var_758_13 = math.max(var_758_7, arg_755_1.talkMaxDuration)

			if var_758_6 <= arg_755_1.time_ and arg_755_1.time_ < var_758_6 + var_758_13 then
				arg_755_1.typewritter.percent = (arg_755_1.time_ - var_758_6) / var_758_13

				arg_755_1.typewritter:SetDirty()
			end

			if arg_755_1.time_ >= var_758_6 + var_758_13 and arg_755_1.time_ < var_758_6 + var_758_13 + arg_758_0 then
				arg_755_1.typewritter.percent = 1

				arg_755_1.typewritter:SetDirty()
				arg_755_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906182 = function(arg_759_0, arg_759_1)
		arg_759_1.time_ = 0
		arg_759_1.frameCnt_ = 0
		arg_759_1.state_ = "playing"
		arg_759_1.curTalkId_ = 1101906182
		arg_759_1.duration_ = 5

		SetActive(arg_759_1.tipsGo_, false)

		function arg_759_1.onSingleLineFinish_()
			arg_759_1.onSingleLineUpdate_ = nil
			arg_759_1.onSingleLineFinish_ = nil
			arg_759_1.state_ = "waiting"
		end

		function arg_759_1.playNext_(arg_761_0)
			if arg_761_0 == 1 then
				arg_759_0:Play1101906183(arg_759_1)
			end
		end

		function arg_759_1.onSingleLineUpdate_(arg_762_0)
			local var_762_0 = 0
			local var_762_1 = 0.425

			if var_762_0 < arg_759_1.time_ and arg_759_1.time_ <= var_762_0 + arg_762_0 then
				arg_759_1.talkMaxDuration = 0
				arg_759_1.dialogCg_.alpha = 1

				arg_759_1.dialog_:SetActive(true)
				SetActive(arg_759_1.leftNameGo_, true)

				local var_762_2 = arg_759_1:FormatText(StoryNameCfg[7].name)

				arg_759_1.leftNameTxt_.text = var_762_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_759_1.leftNameTxt_.transform)

				arg_759_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_759_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_759_1:RecordName(arg_759_1.leftNameTxt_.text)
				SetActive(arg_759_1.iconTrs_.gameObject, false)
				arg_759_1.callingController_:SetSelectedState("normal")

				local var_762_3 = arg_759_1:GetWordFromCfg(1101906182)
				local var_762_4 = arg_759_1:FormatText(var_762_3.content)

				arg_759_1.text_.text = var_762_4

				LuaForUtil.ClearLinePrefixSymbol(arg_759_1.text_)

				local var_762_5 = 17
				local var_762_6 = utf8.len(var_762_4)
				local var_762_7 = var_762_5 <= 0 and var_762_1 or var_762_1 * (var_762_6 / var_762_5)

				if var_762_7 > 0 and var_762_1 < var_762_7 then
					arg_759_1.talkMaxDuration = var_762_7

					if var_762_7 + var_762_0 > arg_759_1.duration_ then
						arg_759_1.duration_ = var_762_7 + var_762_0
					end
				end

				arg_759_1.text_.text = var_762_4
				arg_759_1.typewritter.percent = 0

				arg_759_1.typewritter:SetDirty()
				arg_759_1:ShowNextGo(false)
				arg_759_1:RecordContent(arg_759_1.text_.text)
			end

			local var_762_8 = math.max(var_762_1, arg_759_1.talkMaxDuration)

			if var_762_0 <= arg_759_1.time_ and arg_759_1.time_ < var_762_0 + var_762_8 then
				arg_759_1.typewritter.percent = (arg_759_1.time_ - var_762_0) / var_762_8

				arg_759_1.typewritter:SetDirty()
			end

			if arg_759_1.time_ >= var_762_0 + var_762_8 and arg_759_1.time_ < var_762_0 + var_762_8 + arg_762_0 then
				arg_759_1.typewritter.percent = 1

				arg_759_1.typewritter:SetDirty()
				arg_759_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906183 = function(arg_763_0, arg_763_1)
		arg_763_1.time_ = 0
		arg_763_1.frameCnt_ = 0
		arg_763_1.state_ = "playing"
		arg_763_1.curTalkId_ = 1101906183
		arg_763_1.duration_ = 8.966

		SetActive(arg_763_1.tipsGo_, false)

		function arg_763_1.onSingleLineFinish_()
			arg_763_1.onSingleLineUpdate_ = nil
			arg_763_1.onSingleLineFinish_ = nil
			arg_763_1.state_ = "waiting"
		end

		function arg_763_1.playNext_(arg_765_0)
			if arg_765_0 == 1 then
				arg_763_0:Play1101906184(arg_763_1)
			end
		end

		function arg_763_1.onSingleLineUpdate_(arg_766_0)
			local var_766_0 = arg_763_1.actors_["1019ui_story"].transform
			local var_766_1 = 0

			if var_766_1 < arg_763_1.time_ and arg_763_1.time_ <= var_766_1 + arg_766_0 then
				arg_763_1.var_.moveOldPos1019ui_story = var_766_0.localPosition
			end

			local var_766_2 = 0.001

			if var_766_1 <= arg_763_1.time_ and arg_763_1.time_ < var_766_1 + var_766_2 then
				local var_766_3 = (arg_763_1.time_ - var_766_1) / var_766_2
				local var_766_4 = Vector3.New(0, -1.08, -5.9)

				var_766_0.localPosition = Vector3.Lerp(arg_763_1.var_.moveOldPos1019ui_story, var_766_4, var_766_3)

				local var_766_5 = manager.ui.mainCamera.transform.position - var_766_0.position

				var_766_0.forward = Vector3.New(var_766_5.x, var_766_5.y, var_766_5.z)

				local var_766_6 = var_766_0.localEulerAngles

				var_766_6.z = 0
				var_766_6.x = 0
				var_766_0.localEulerAngles = var_766_6
			end

			if arg_763_1.time_ >= var_766_1 + var_766_2 and arg_763_1.time_ < var_766_1 + var_766_2 + arg_766_0 then
				var_766_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_766_7 = manager.ui.mainCamera.transform.position - var_766_0.position

				var_766_0.forward = Vector3.New(var_766_7.x, var_766_7.y, var_766_7.z)

				local var_766_8 = var_766_0.localEulerAngles

				var_766_8.z = 0
				var_766_8.x = 0
				var_766_0.localEulerAngles = var_766_8
			end

			local var_766_9 = arg_763_1.actors_["1019ui_story"]
			local var_766_10 = 0

			if var_766_10 < arg_763_1.time_ and arg_763_1.time_ <= var_766_10 + arg_766_0 and arg_763_1.var_.characterEffect1019ui_story == nil then
				arg_763_1.var_.characterEffect1019ui_story = var_766_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_766_11 = 0.200000002980232

			if var_766_10 <= arg_763_1.time_ and arg_763_1.time_ < var_766_10 + var_766_11 then
				local var_766_12 = (arg_763_1.time_ - var_766_10) / var_766_11

				if arg_763_1.var_.characterEffect1019ui_story then
					arg_763_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_763_1.time_ >= var_766_10 + var_766_11 and arg_763_1.time_ < var_766_10 + var_766_11 + arg_766_0 and arg_763_1.var_.characterEffect1019ui_story then
				arg_763_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_766_13 = 0

			if var_766_13 < arg_763_1.time_ and arg_763_1.time_ <= var_766_13 + arg_766_0 then
				arg_763_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_766_14 = 0

			if var_766_14 < arg_763_1.time_ and arg_763_1.time_ <= var_766_14 + arg_766_0 then
				arg_763_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_766_15 = 0
			local var_766_16 = 0.975

			if var_766_15 < arg_763_1.time_ and arg_763_1.time_ <= var_766_15 + arg_766_0 then
				arg_763_1.talkMaxDuration = 0
				arg_763_1.dialogCg_.alpha = 1

				arg_763_1.dialog_:SetActive(true)
				SetActive(arg_763_1.leftNameGo_, true)

				local var_766_17 = arg_763_1:FormatText(StoryNameCfg[13].name)

				arg_763_1.leftNameTxt_.text = var_766_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_763_1.leftNameTxt_.transform)

				arg_763_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_763_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_763_1:RecordName(arg_763_1.leftNameTxt_.text)
				SetActive(arg_763_1.iconTrs_.gameObject, false)
				arg_763_1.callingController_:SetSelectedState("normal")

				local var_766_18 = arg_763_1:GetWordFromCfg(1101906183)
				local var_766_19 = arg_763_1:FormatText(var_766_18.content)

				arg_763_1.text_.text = var_766_19

				LuaForUtil.ClearLinePrefixSymbol(arg_763_1.text_)

				local var_766_20 = 39
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906183", "story_v_side_new_1101906.awb") ~= 0 then
					local var_766_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906183", "story_v_side_new_1101906.awb") / 1000

					if var_766_23 + var_766_15 > arg_763_1.duration_ then
						arg_763_1.duration_ = var_766_23 + var_766_15
					end

					if var_766_18.prefab_name ~= "" and arg_763_1.actors_[var_766_18.prefab_name] ~= nil then
						local var_766_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_763_1.actors_[var_766_18.prefab_name].transform, "story_v_side_new_1101906", "1101906183", "story_v_side_new_1101906.awb")

						arg_763_1:RecordAudio("1101906183", var_766_24)
						arg_763_1:RecordAudio("1101906183", var_766_24)
					else
						arg_763_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906183", "story_v_side_new_1101906.awb")
					end

					arg_763_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906183", "story_v_side_new_1101906.awb")
				end

				arg_763_1:RecordContent(arg_763_1.text_.text)
			end

			local var_766_25 = math.max(var_766_16, arg_763_1.talkMaxDuration)

			if var_766_15 <= arg_763_1.time_ and arg_763_1.time_ < var_766_15 + var_766_25 then
				arg_763_1.typewritter.percent = (arg_763_1.time_ - var_766_15) / var_766_25

				arg_763_1.typewritter:SetDirty()
			end

			if arg_763_1.time_ >= var_766_15 + var_766_25 and arg_763_1.time_ < var_766_15 + var_766_25 + arg_766_0 then
				arg_763_1.typewritter.percent = 1

				arg_763_1.typewritter:SetDirty()
				arg_763_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906184 = function(arg_767_0, arg_767_1)
		arg_767_1.time_ = 0
		arg_767_1.frameCnt_ = 0
		arg_767_1.state_ = "playing"
		arg_767_1.curTalkId_ = 1101906184
		arg_767_1.duration_ = 5

		SetActive(arg_767_1.tipsGo_, false)

		function arg_767_1.onSingleLineFinish_()
			arg_767_1.onSingleLineUpdate_ = nil
			arg_767_1.onSingleLineFinish_ = nil
			arg_767_1.state_ = "waiting"
		end

		function arg_767_1.playNext_(arg_769_0)
			if arg_769_0 == 1 then
				arg_767_0:Play1101906185(arg_767_1)
			end
		end

		function arg_767_1.onSingleLineUpdate_(arg_770_0)
			local var_770_0 = arg_767_1.actors_["1019ui_story"]
			local var_770_1 = 0

			if var_770_1 < arg_767_1.time_ and arg_767_1.time_ <= var_770_1 + arg_770_0 and arg_767_1.var_.characterEffect1019ui_story == nil then
				arg_767_1.var_.characterEffect1019ui_story = var_770_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_770_2 = 0.200000002980232

			if var_770_1 <= arg_767_1.time_ and arg_767_1.time_ < var_770_1 + var_770_2 then
				local var_770_3 = (arg_767_1.time_ - var_770_1) / var_770_2

				if arg_767_1.var_.characterEffect1019ui_story then
					local var_770_4 = Mathf.Lerp(0, 0.5, var_770_3)

					arg_767_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_767_1.var_.characterEffect1019ui_story.fillRatio = var_770_4
				end
			end

			if arg_767_1.time_ >= var_770_1 + var_770_2 and arg_767_1.time_ < var_770_1 + var_770_2 + arg_770_0 and arg_767_1.var_.characterEffect1019ui_story then
				local var_770_5 = 0.5

				arg_767_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_767_1.var_.characterEffect1019ui_story.fillRatio = var_770_5
			end

			local var_770_6 = 0
			local var_770_7 = 0.2

			if var_770_6 < arg_767_1.time_ and arg_767_1.time_ <= var_770_6 + arg_770_0 then
				arg_767_1.talkMaxDuration = 0
				arg_767_1.dialogCg_.alpha = 1

				arg_767_1.dialog_:SetActive(true)
				SetActive(arg_767_1.leftNameGo_, true)

				local var_770_8 = arg_767_1:FormatText(StoryNameCfg[7].name)

				arg_767_1.leftNameTxt_.text = var_770_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_767_1.leftNameTxt_.transform)

				arg_767_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_767_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_767_1:RecordName(arg_767_1.leftNameTxt_.text)
				SetActive(arg_767_1.iconTrs_.gameObject, false)
				arg_767_1.callingController_:SetSelectedState("normal")

				local var_770_9 = arg_767_1:GetWordFromCfg(1101906184)
				local var_770_10 = arg_767_1:FormatText(var_770_9.content)

				arg_767_1.text_.text = var_770_10

				LuaForUtil.ClearLinePrefixSymbol(arg_767_1.text_)

				local var_770_11 = 8
				local var_770_12 = utf8.len(var_770_10)
				local var_770_13 = var_770_11 <= 0 and var_770_7 or var_770_7 * (var_770_12 / var_770_11)

				if var_770_13 > 0 and var_770_7 < var_770_13 then
					arg_767_1.talkMaxDuration = var_770_13

					if var_770_13 + var_770_6 > arg_767_1.duration_ then
						arg_767_1.duration_ = var_770_13 + var_770_6
					end
				end

				arg_767_1.text_.text = var_770_10
				arg_767_1.typewritter.percent = 0

				arg_767_1.typewritter:SetDirty()
				arg_767_1:ShowNextGo(false)
				arg_767_1:RecordContent(arg_767_1.text_.text)
			end

			local var_770_14 = math.max(var_770_7, arg_767_1.talkMaxDuration)

			if var_770_6 <= arg_767_1.time_ and arg_767_1.time_ < var_770_6 + var_770_14 then
				arg_767_1.typewritter.percent = (arg_767_1.time_ - var_770_6) / var_770_14

				arg_767_1.typewritter:SetDirty()
			end

			if arg_767_1.time_ >= var_770_6 + var_770_14 and arg_767_1.time_ < var_770_6 + var_770_14 + arg_770_0 then
				arg_767_1.typewritter.percent = 1

				arg_767_1.typewritter:SetDirty()
				arg_767_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906185 = function(arg_771_0, arg_771_1)
		arg_771_1.time_ = 0
		arg_771_1.frameCnt_ = 0
		arg_771_1.state_ = "playing"
		arg_771_1.curTalkId_ = 1101906185
		arg_771_1.duration_ = 1.766

		SetActive(arg_771_1.tipsGo_, false)

		function arg_771_1.onSingleLineFinish_()
			arg_771_1.onSingleLineUpdate_ = nil
			arg_771_1.onSingleLineFinish_ = nil
			arg_771_1.state_ = "waiting"
		end

		function arg_771_1.playNext_(arg_773_0)
			if arg_773_0 == 1 then
				arg_771_0:Play1101906186(arg_771_1)
			end
		end

		function arg_771_1.onSingleLineUpdate_(arg_774_0)
			local var_774_0 = arg_771_1.actors_["1019ui_story"]
			local var_774_1 = 0

			if var_774_1 < arg_771_1.time_ and arg_771_1.time_ <= var_774_1 + arg_774_0 and arg_771_1.var_.characterEffect1019ui_story == nil then
				arg_771_1.var_.characterEffect1019ui_story = var_774_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_774_2 = 0.200000002980232

			if var_774_1 <= arg_771_1.time_ and arg_771_1.time_ < var_774_1 + var_774_2 then
				local var_774_3 = (arg_771_1.time_ - var_774_1) / var_774_2

				if arg_771_1.var_.characterEffect1019ui_story then
					arg_771_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_771_1.time_ >= var_774_1 + var_774_2 and arg_771_1.time_ < var_774_1 + var_774_2 + arg_774_0 and arg_771_1.var_.characterEffect1019ui_story then
				arg_771_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_774_4 = 0
			local var_774_5 = 0.175

			if var_774_4 < arg_771_1.time_ and arg_771_1.time_ <= var_774_4 + arg_774_0 then
				arg_771_1.talkMaxDuration = 0
				arg_771_1.dialogCg_.alpha = 1

				arg_771_1.dialog_:SetActive(true)
				SetActive(arg_771_1.leftNameGo_, true)

				local var_774_6 = arg_771_1:FormatText(StoryNameCfg[13].name)

				arg_771_1.leftNameTxt_.text = var_774_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_771_1.leftNameTxt_.transform)

				arg_771_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_771_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_771_1:RecordName(arg_771_1.leftNameTxt_.text)
				SetActive(arg_771_1.iconTrs_.gameObject, false)
				arg_771_1.callingController_:SetSelectedState("normal")

				local var_774_7 = arg_771_1:GetWordFromCfg(1101906185)
				local var_774_8 = arg_771_1:FormatText(var_774_7.content)

				arg_771_1.text_.text = var_774_8

				LuaForUtil.ClearLinePrefixSymbol(arg_771_1.text_)

				local var_774_9 = 7
				local var_774_10 = utf8.len(var_774_8)
				local var_774_11 = var_774_9 <= 0 and var_774_5 or var_774_5 * (var_774_10 / var_774_9)

				if var_774_11 > 0 and var_774_5 < var_774_11 then
					arg_771_1.talkMaxDuration = var_774_11

					if var_774_11 + var_774_4 > arg_771_1.duration_ then
						arg_771_1.duration_ = var_774_11 + var_774_4
					end
				end

				arg_771_1.text_.text = var_774_8
				arg_771_1.typewritter.percent = 0

				arg_771_1.typewritter:SetDirty()
				arg_771_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906185", "story_v_side_new_1101906.awb") ~= 0 then
					local var_774_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906185", "story_v_side_new_1101906.awb") / 1000

					if var_774_12 + var_774_4 > arg_771_1.duration_ then
						arg_771_1.duration_ = var_774_12 + var_774_4
					end

					if var_774_7.prefab_name ~= "" and arg_771_1.actors_[var_774_7.prefab_name] ~= nil then
						local var_774_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_771_1.actors_[var_774_7.prefab_name].transform, "story_v_side_new_1101906", "1101906185", "story_v_side_new_1101906.awb")

						arg_771_1:RecordAudio("1101906185", var_774_13)
						arg_771_1:RecordAudio("1101906185", var_774_13)
					else
						arg_771_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906185", "story_v_side_new_1101906.awb")
					end

					arg_771_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906185", "story_v_side_new_1101906.awb")
				end

				arg_771_1:RecordContent(arg_771_1.text_.text)
			end

			local var_774_14 = math.max(var_774_5, arg_771_1.talkMaxDuration)

			if var_774_4 <= arg_771_1.time_ and arg_771_1.time_ < var_774_4 + var_774_14 then
				arg_771_1.typewritter.percent = (arg_771_1.time_ - var_774_4) / var_774_14

				arg_771_1.typewritter:SetDirty()
			end

			if arg_771_1.time_ >= var_774_4 + var_774_14 and arg_771_1.time_ < var_774_4 + var_774_14 + arg_774_0 then
				arg_771_1.typewritter.percent = 1

				arg_771_1.typewritter:SetDirty()
				arg_771_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906186 = function(arg_775_0, arg_775_1)
		arg_775_1.time_ = 0
		arg_775_1.frameCnt_ = 0
		arg_775_1.state_ = "playing"
		arg_775_1.curTalkId_ = 1101906186
		arg_775_1.duration_ = 5

		SetActive(arg_775_1.tipsGo_, false)

		function arg_775_1.onSingleLineFinish_()
			arg_775_1.onSingleLineUpdate_ = nil
			arg_775_1.onSingleLineFinish_ = nil
			arg_775_1.state_ = "waiting"
		end

		function arg_775_1.playNext_(arg_777_0)
			if arg_777_0 == 1 then
				arg_775_0:Play1101906187(arg_775_1)
			end
		end

		function arg_775_1.onSingleLineUpdate_(arg_778_0)
			local var_778_0 = arg_775_1.actors_["1019ui_story"]
			local var_778_1 = 0

			if var_778_1 < arg_775_1.time_ and arg_775_1.time_ <= var_778_1 + arg_778_0 and arg_775_1.var_.characterEffect1019ui_story == nil then
				arg_775_1.var_.characterEffect1019ui_story = var_778_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_778_2 = 0.200000002980232

			if var_778_1 <= arg_775_1.time_ and arg_775_1.time_ < var_778_1 + var_778_2 then
				local var_778_3 = (arg_775_1.time_ - var_778_1) / var_778_2

				if arg_775_1.var_.characterEffect1019ui_story then
					local var_778_4 = Mathf.Lerp(0, 0.5, var_778_3)

					arg_775_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_775_1.var_.characterEffect1019ui_story.fillRatio = var_778_4
				end
			end

			if arg_775_1.time_ >= var_778_1 + var_778_2 and arg_775_1.time_ < var_778_1 + var_778_2 + arg_778_0 and arg_775_1.var_.characterEffect1019ui_story then
				local var_778_5 = 0.5

				arg_775_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_775_1.var_.characterEffect1019ui_story.fillRatio = var_778_5
			end

			local var_778_6 = 0
			local var_778_7 = 0.075

			if var_778_6 < arg_775_1.time_ and arg_775_1.time_ <= var_778_6 + arg_778_0 then
				arg_775_1.talkMaxDuration = 0
				arg_775_1.dialogCg_.alpha = 1

				arg_775_1.dialog_:SetActive(true)
				SetActive(arg_775_1.leftNameGo_, true)

				local var_778_8 = arg_775_1:FormatText(StoryNameCfg[7].name)

				arg_775_1.leftNameTxt_.text = var_778_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_775_1.leftNameTxt_.transform)

				arg_775_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_775_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_775_1:RecordName(arg_775_1.leftNameTxt_.text)
				SetActive(arg_775_1.iconTrs_.gameObject, false)
				arg_775_1.callingController_:SetSelectedState("normal")

				local var_778_9 = arg_775_1:GetWordFromCfg(1101906186)
				local var_778_10 = arg_775_1:FormatText(var_778_9.content)

				arg_775_1.text_.text = var_778_10

				LuaForUtil.ClearLinePrefixSymbol(arg_775_1.text_)

				local var_778_11 = 3
				local var_778_12 = utf8.len(var_778_10)
				local var_778_13 = var_778_11 <= 0 and var_778_7 or var_778_7 * (var_778_12 / var_778_11)

				if var_778_13 > 0 and var_778_7 < var_778_13 then
					arg_775_1.talkMaxDuration = var_778_13

					if var_778_13 + var_778_6 > arg_775_1.duration_ then
						arg_775_1.duration_ = var_778_13 + var_778_6
					end
				end

				arg_775_1.text_.text = var_778_10
				arg_775_1.typewritter.percent = 0

				arg_775_1.typewritter:SetDirty()
				arg_775_1:ShowNextGo(false)
				arg_775_1:RecordContent(arg_775_1.text_.text)
			end

			local var_778_14 = math.max(var_778_7, arg_775_1.talkMaxDuration)

			if var_778_6 <= arg_775_1.time_ and arg_775_1.time_ < var_778_6 + var_778_14 then
				arg_775_1.typewritter.percent = (arg_775_1.time_ - var_778_6) / var_778_14

				arg_775_1.typewritter:SetDirty()
			end

			if arg_775_1.time_ >= var_778_6 + var_778_14 and arg_775_1.time_ < var_778_6 + var_778_14 + arg_778_0 then
				arg_775_1.typewritter.percent = 1

				arg_775_1.typewritter:SetDirty()
				arg_775_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906187 = function(arg_779_0, arg_779_1)
		arg_779_1.time_ = 0
		arg_779_1.frameCnt_ = 0
		arg_779_1.state_ = "playing"
		arg_779_1.curTalkId_ = 1101906187
		arg_779_1.duration_ = 11.533

		SetActive(arg_779_1.tipsGo_, false)

		function arg_779_1.onSingleLineFinish_()
			arg_779_1.onSingleLineUpdate_ = nil
			arg_779_1.onSingleLineFinish_ = nil
			arg_779_1.state_ = "waiting"
		end

		function arg_779_1.playNext_(arg_781_0)
			if arg_781_0 == 1 then
				arg_779_0:Play1101906188(arg_779_1)
			end
		end

		function arg_779_1.onSingleLineUpdate_(arg_782_0)
			local var_782_0 = arg_779_1.actors_["1019ui_story"]
			local var_782_1 = 0

			if var_782_1 < arg_779_1.time_ and arg_779_1.time_ <= var_782_1 + arg_782_0 and arg_779_1.var_.characterEffect1019ui_story == nil then
				arg_779_1.var_.characterEffect1019ui_story = var_782_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_782_2 = 0.200000002980232

			if var_782_1 <= arg_779_1.time_ and arg_779_1.time_ < var_782_1 + var_782_2 then
				local var_782_3 = (arg_779_1.time_ - var_782_1) / var_782_2

				if arg_779_1.var_.characterEffect1019ui_story then
					arg_779_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_779_1.time_ >= var_782_1 + var_782_2 and arg_779_1.time_ < var_782_1 + var_782_2 + arg_782_0 and arg_779_1.var_.characterEffect1019ui_story then
				arg_779_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_782_4 = 0
			local var_782_5 = 1.3

			if var_782_4 < arg_779_1.time_ and arg_779_1.time_ <= var_782_4 + arg_782_0 then
				arg_779_1.talkMaxDuration = 0
				arg_779_1.dialogCg_.alpha = 1

				arg_779_1.dialog_:SetActive(true)
				SetActive(arg_779_1.leftNameGo_, true)

				local var_782_6 = arg_779_1:FormatText(StoryNameCfg[13].name)

				arg_779_1.leftNameTxt_.text = var_782_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_779_1.leftNameTxt_.transform)

				arg_779_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_779_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_779_1:RecordName(arg_779_1.leftNameTxt_.text)
				SetActive(arg_779_1.iconTrs_.gameObject, false)
				arg_779_1.callingController_:SetSelectedState("normal")

				local var_782_7 = arg_779_1:GetWordFromCfg(1101906187)
				local var_782_8 = arg_779_1:FormatText(var_782_7.content)

				arg_779_1.text_.text = var_782_8

				LuaForUtil.ClearLinePrefixSymbol(arg_779_1.text_)

				local var_782_9 = 52
				local var_782_10 = utf8.len(var_782_8)
				local var_782_11 = var_782_9 <= 0 and var_782_5 or var_782_5 * (var_782_10 / var_782_9)

				if var_782_11 > 0 and var_782_5 < var_782_11 then
					arg_779_1.talkMaxDuration = var_782_11

					if var_782_11 + var_782_4 > arg_779_1.duration_ then
						arg_779_1.duration_ = var_782_11 + var_782_4
					end
				end

				arg_779_1.text_.text = var_782_8
				arg_779_1.typewritter.percent = 0

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906187", "story_v_side_new_1101906.awb") ~= 0 then
					local var_782_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906187", "story_v_side_new_1101906.awb") / 1000

					if var_782_12 + var_782_4 > arg_779_1.duration_ then
						arg_779_1.duration_ = var_782_12 + var_782_4
					end

					if var_782_7.prefab_name ~= "" and arg_779_1.actors_[var_782_7.prefab_name] ~= nil then
						local var_782_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_779_1.actors_[var_782_7.prefab_name].transform, "story_v_side_new_1101906", "1101906187", "story_v_side_new_1101906.awb")

						arg_779_1:RecordAudio("1101906187", var_782_13)
						arg_779_1:RecordAudio("1101906187", var_782_13)
					else
						arg_779_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906187", "story_v_side_new_1101906.awb")
					end

					arg_779_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906187", "story_v_side_new_1101906.awb")
				end

				arg_779_1:RecordContent(arg_779_1.text_.text)
			end

			local var_782_14 = math.max(var_782_5, arg_779_1.talkMaxDuration)

			if var_782_4 <= arg_779_1.time_ and arg_779_1.time_ < var_782_4 + var_782_14 then
				arg_779_1.typewritter.percent = (arg_779_1.time_ - var_782_4) / var_782_14

				arg_779_1.typewritter:SetDirty()
			end

			if arg_779_1.time_ >= var_782_4 + var_782_14 and arg_779_1.time_ < var_782_4 + var_782_14 + arg_782_0 then
				arg_779_1.typewritter.percent = 1

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906188 = function(arg_783_0, arg_783_1)
		arg_783_1.time_ = 0
		arg_783_1.frameCnt_ = 0
		arg_783_1.state_ = "playing"
		arg_783_1.curTalkId_ = 1101906188
		arg_783_1.duration_ = 6.466

		SetActive(arg_783_1.tipsGo_, false)

		function arg_783_1.onSingleLineFinish_()
			arg_783_1.onSingleLineUpdate_ = nil
			arg_783_1.onSingleLineFinish_ = nil
			arg_783_1.state_ = "waiting"
		end

		function arg_783_1.playNext_(arg_785_0)
			if arg_785_0 == 1 then
				arg_783_0:Play1101906189(arg_783_1)
			end
		end

		function arg_783_1.onSingleLineUpdate_(arg_786_0)
			local var_786_0 = 0
			local var_786_1 = 0.625

			if var_786_0 < arg_783_1.time_ and arg_783_1.time_ <= var_786_0 + arg_786_0 then
				arg_783_1.talkMaxDuration = 0
				arg_783_1.dialogCg_.alpha = 1

				arg_783_1.dialog_:SetActive(true)
				SetActive(arg_783_1.leftNameGo_, true)

				local var_786_2 = arg_783_1:FormatText(StoryNameCfg[13].name)

				arg_783_1.leftNameTxt_.text = var_786_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_783_1.leftNameTxt_.transform)

				arg_783_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_783_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_783_1:RecordName(arg_783_1.leftNameTxt_.text)
				SetActive(arg_783_1.iconTrs_.gameObject, false)
				arg_783_1.callingController_:SetSelectedState("normal")

				local var_786_3 = arg_783_1:GetWordFromCfg(1101906188)
				local var_786_4 = arg_783_1:FormatText(var_786_3.content)

				arg_783_1.text_.text = var_786_4

				LuaForUtil.ClearLinePrefixSymbol(arg_783_1.text_)

				local var_786_5 = 24
				local var_786_6 = utf8.len(var_786_4)
				local var_786_7 = var_786_5 <= 0 and var_786_1 or var_786_1 * (var_786_6 / var_786_5)

				if var_786_7 > 0 and var_786_1 < var_786_7 then
					arg_783_1.talkMaxDuration = var_786_7

					if var_786_7 + var_786_0 > arg_783_1.duration_ then
						arg_783_1.duration_ = var_786_7 + var_786_0
					end
				end

				arg_783_1.text_.text = var_786_4
				arg_783_1.typewritter.percent = 0

				arg_783_1.typewritter:SetDirty()
				arg_783_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906188", "story_v_side_new_1101906.awb") ~= 0 then
					local var_786_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906188", "story_v_side_new_1101906.awb") / 1000

					if var_786_8 + var_786_0 > arg_783_1.duration_ then
						arg_783_1.duration_ = var_786_8 + var_786_0
					end

					if var_786_3.prefab_name ~= "" and arg_783_1.actors_[var_786_3.prefab_name] ~= nil then
						local var_786_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_783_1.actors_[var_786_3.prefab_name].transform, "story_v_side_new_1101906", "1101906188", "story_v_side_new_1101906.awb")

						arg_783_1:RecordAudio("1101906188", var_786_9)
						arg_783_1:RecordAudio("1101906188", var_786_9)
					else
						arg_783_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906188", "story_v_side_new_1101906.awb")
					end

					arg_783_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906188", "story_v_side_new_1101906.awb")
				end

				arg_783_1:RecordContent(arg_783_1.text_.text)
			end

			local var_786_10 = math.max(var_786_1, arg_783_1.talkMaxDuration)

			if var_786_0 <= arg_783_1.time_ and arg_783_1.time_ < var_786_0 + var_786_10 then
				arg_783_1.typewritter.percent = (arg_783_1.time_ - var_786_0) / var_786_10

				arg_783_1.typewritter:SetDirty()
			end

			if arg_783_1.time_ >= var_786_0 + var_786_10 and arg_783_1.time_ < var_786_0 + var_786_10 + arg_786_0 then
				arg_783_1.typewritter.percent = 1

				arg_783_1.typewritter:SetDirty()
				arg_783_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906189 = function(arg_787_0, arg_787_1)
		arg_787_1.time_ = 0
		arg_787_1.frameCnt_ = 0
		arg_787_1.state_ = "playing"
		arg_787_1.curTalkId_ = 1101906189
		arg_787_1.duration_ = 5

		SetActive(arg_787_1.tipsGo_, false)

		function arg_787_1.onSingleLineFinish_()
			arg_787_1.onSingleLineUpdate_ = nil
			arg_787_1.onSingleLineFinish_ = nil
			arg_787_1.state_ = "waiting"
		end

		function arg_787_1.playNext_(arg_789_0)
			if arg_789_0 == 1 then
				arg_787_0:Play1101906190(arg_787_1)
			end
		end

		function arg_787_1.onSingleLineUpdate_(arg_790_0)
			local var_790_0 = arg_787_1.actors_["1019ui_story"]
			local var_790_1 = 0

			if var_790_1 < arg_787_1.time_ and arg_787_1.time_ <= var_790_1 + arg_790_0 and arg_787_1.var_.characterEffect1019ui_story == nil then
				arg_787_1.var_.characterEffect1019ui_story = var_790_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_790_2 = 0.200000002980232

			if var_790_1 <= arg_787_1.time_ and arg_787_1.time_ < var_790_1 + var_790_2 then
				local var_790_3 = (arg_787_1.time_ - var_790_1) / var_790_2

				if arg_787_1.var_.characterEffect1019ui_story then
					local var_790_4 = Mathf.Lerp(0, 0.5, var_790_3)

					arg_787_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_787_1.var_.characterEffect1019ui_story.fillRatio = var_790_4
				end
			end

			if arg_787_1.time_ >= var_790_1 + var_790_2 and arg_787_1.time_ < var_790_1 + var_790_2 + arg_790_0 and arg_787_1.var_.characterEffect1019ui_story then
				local var_790_5 = 0.5

				arg_787_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_787_1.var_.characterEffect1019ui_story.fillRatio = var_790_5
			end

			local var_790_6 = 0
			local var_790_7 = 0.25

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

				local var_790_9 = arg_787_1:GetWordFromCfg(1101906189)
				local var_790_10 = arg_787_1:FormatText(var_790_9.content)

				arg_787_1.text_.text = var_790_10

				LuaForUtil.ClearLinePrefixSymbol(arg_787_1.text_)

				local var_790_11 = 10
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
	Play1101906190 = function(arg_791_0, arg_791_1)
		arg_791_1.time_ = 0
		arg_791_1.frameCnt_ = 0
		arg_791_1.state_ = "playing"
		arg_791_1.curTalkId_ = 1101906190
		arg_791_1.duration_ = 7.433

		SetActive(arg_791_1.tipsGo_, false)

		function arg_791_1.onSingleLineFinish_()
			arg_791_1.onSingleLineUpdate_ = nil
			arg_791_1.onSingleLineFinish_ = nil
			arg_791_1.state_ = "waiting"
		end

		function arg_791_1.playNext_(arg_793_0)
			if arg_793_0 == 1 then
				arg_791_0:Play1101906191(arg_791_1)
			end
		end

		function arg_791_1.onSingleLineUpdate_(arg_794_0)
			local var_794_0 = 2

			if var_794_0 < arg_791_1.time_ and arg_791_1.time_ <= var_794_0 + arg_794_0 then
				local var_794_1 = manager.ui.mainCamera.transform.localPosition
				local var_794_2 = Vector3.New(0, 0, 10) + Vector3.New(var_794_1.x, var_794_1.y, 0)
				local var_794_3 = arg_791_1.bgs_.ST02

				var_794_3.transform.localPosition = var_794_2
				var_794_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_794_4 = var_794_3:GetComponent("SpriteRenderer")

				if var_794_4 and var_794_4.sprite then
					local var_794_5 = (var_794_3.transform.localPosition - var_794_1).z
					local var_794_6 = manager.ui.mainCameraCom_
					local var_794_7 = 2 * var_794_5 * Mathf.Tan(var_794_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_794_8 = var_794_7 * var_794_6.aspect
					local var_794_9 = var_794_4.sprite.bounds.size.x
					local var_794_10 = var_794_4.sprite.bounds.size.y
					local var_794_11 = var_794_8 / var_794_9
					local var_794_12 = var_794_7 / var_794_10
					local var_794_13 = var_794_12 < var_794_11 and var_794_11 or var_794_12

					var_794_3.transform.localScale = Vector3.New(var_794_13, var_794_13, 0)
				end

				for iter_794_0, iter_794_1 in pairs(arg_791_1.bgs_) do
					if iter_794_0 ~= "ST02" then
						iter_794_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_794_14 = 0

			if var_794_14 < arg_791_1.time_ and arg_791_1.time_ <= var_794_14 + arg_794_0 then
				arg_791_1.mask_.enabled = true
				arg_791_1.mask_.raycastTarget = true

				arg_791_1:SetGaussion(false)
			end

			local var_794_15 = 2

			if var_794_14 <= arg_791_1.time_ and arg_791_1.time_ < var_794_14 + var_794_15 then
				local var_794_16 = (arg_791_1.time_ - var_794_14) / var_794_15
				local var_794_17 = Color.New(0, 0, 0)

				var_794_17.a = Mathf.Lerp(0, 1, var_794_16)
				arg_791_1.mask_.color = var_794_17
			end

			if arg_791_1.time_ >= var_794_14 + var_794_15 and arg_791_1.time_ < var_794_14 + var_794_15 + arg_794_0 then
				local var_794_18 = Color.New(0, 0, 0)

				var_794_18.a = 1
				arg_791_1.mask_.color = var_794_18
			end

			local var_794_19 = 2

			if var_794_19 < arg_791_1.time_ and arg_791_1.time_ <= var_794_19 + arg_794_0 then
				arg_791_1.mask_.enabled = true
				arg_791_1.mask_.raycastTarget = true

				arg_791_1:SetGaussion(false)
			end

			local var_794_20 = 2

			if var_794_19 <= arg_791_1.time_ and arg_791_1.time_ < var_794_19 + var_794_20 then
				local var_794_21 = (arg_791_1.time_ - var_794_19) / var_794_20
				local var_794_22 = Color.New(0, 0, 0)

				var_794_22.a = Mathf.Lerp(1, 0, var_794_21)
				arg_791_1.mask_.color = var_794_22
			end

			if arg_791_1.time_ >= var_794_19 + var_794_20 and arg_791_1.time_ < var_794_19 + var_794_20 + arg_794_0 then
				local var_794_23 = Color.New(0, 0, 0)
				local var_794_24 = 0

				arg_791_1.mask_.enabled = false
				var_794_23.a = var_794_24
				arg_791_1.mask_.color = var_794_23
			end

			local var_794_25 = arg_791_1.actors_["1029ui_story"].transform
			local var_794_26 = 2

			if var_794_26 < arg_791_1.time_ and arg_791_1.time_ <= var_794_26 + arg_794_0 then
				arg_791_1.var_.moveOldPos1029ui_story = var_794_25.localPosition
			end

			local var_794_27 = 0.001

			if var_794_26 <= arg_791_1.time_ and arg_791_1.time_ < var_794_26 + var_794_27 then
				local var_794_28 = (arg_791_1.time_ - var_794_26) / var_794_27
				local var_794_29 = Vector3.New(0.7, -1.09, -6.2)

				var_794_25.localPosition = Vector3.Lerp(arg_791_1.var_.moveOldPos1029ui_story, var_794_29, var_794_28)

				local var_794_30 = manager.ui.mainCamera.transform.position - var_794_25.position

				var_794_25.forward = Vector3.New(var_794_30.x, var_794_30.y, var_794_30.z)

				local var_794_31 = var_794_25.localEulerAngles

				var_794_31.z = 0
				var_794_31.x = 0
				var_794_25.localEulerAngles = var_794_31
			end

			if arg_791_1.time_ >= var_794_26 + var_794_27 and arg_791_1.time_ < var_794_26 + var_794_27 + arg_794_0 then
				var_794_25.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_794_32 = manager.ui.mainCamera.transform.position - var_794_25.position

				var_794_25.forward = Vector3.New(var_794_32.x, var_794_32.y, var_794_32.z)

				local var_794_33 = var_794_25.localEulerAngles

				var_794_33.z = 0
				var_794_33.x = 0
				var_794_25.localEulerAngles = var_794_33
			end

			local var_794_34 = arg_791_1.actors_["1029ui_story"]
			local var_794_35 = 2

			if var_794_35 < arg_791_1.time_ and arg_791_1.time_ <= var_794_35 + arg_794_0 and arg_791_1.var_.characterEffect1029ui_story == nil then
				arg_791_1.var_.characterEffect1029ui_story = var_794_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_794_36 = 0.200000002980232

			if var_794_35 <= arg_791_1.time_ and arg_791_1.time_ < var_794_35 + var_794_36 then
				local var_794_37 = (arg_791_1.time_ - var_794_35) / var_794_36

				if arg_791_1.var_.characterEffect1029ui_story then
					arg_791_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_791_1.time_ >= var_794_35 + var_794_36 and arg_791_1.time_ < var_794_35 + var_794_36 + arg_794_0 and arg_791_1.var_.characterEffect1029ui_story then
				arg_791_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_794_38 = 2

			if var_794_38 < arg_791_1.time_ and arg_791_1.time_ <= var_794_38 + arg_794_0 then
				arg_791_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_794_39 = 2

			if var_794_39 < arg_791_1.time_ and arg_791_1.time_ <= var_794_39 + arg_794_0 then
				arg_791_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_794_40 = arg_791_1.actors_["1019ui_story"].transform
			local var_794_41 = 2

			if var_794_41 < arg_791_1.time_ and arg_791_1.time_ <= var_794_41 + arg_794_0 then
				arg_791_1.var_.moveOldPos1019ui_story = var_794_40.localPosition
			end

			local var_794_42 = 0.001

			if var_794_41 <= arg_791_1.time_ and arg_791_1.time_ < var_794_41 + var_794_42 then
				local var_794_43 = (arg_791_1.time_ - var_794_41) / var_794_42
				local var_794_44 = Vector3.New(-0.7, -1.08, -5.9)

				var_794_40.localPosition = Vector3.Lerp(arg_791_1.var_.moveOldPos1019ui_story, var_794_44, var_794_43)

				local var_794_45 = manager.ui.mainCamera.transform.position - var_794_40.position

				var_794_40.forward = Vector3.New(var_794_45.x, var_794_45.y, var_794_45.z)

				local var_794_46 = var_794_40.localEulerAngles

				var_794_46.z = 0
				var_794_46.x = 0
				var_794_40.localEulerAngles = var_794_46
			end

			if arg_791_1.time_ >= var_794_41 + var_794_42 and arg_791_1.time_ < var_794_41 + var_794_42 + arg_794_0 then
				var_794_40.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_794_47 = manager.ui.mainCamera.transform.position - var_794_40.position

				var_794_40.forward = Vector3.New(var_794_47.x, var_794_47.y, var_794_47.z)

				local var_794_48 = var_794_40.localEulerAngles

				var_794_48.z = 0
				var_794_48.x = 0
				var_794_40.localEulerAngles = var_794_48
			end

			local var_794_49 = arg_791_1.actors_["1019ui_story"]
			local var_794_50 = 2

			if var_794_50 < arg_791_1.time_ and arg_791_1.time_ <= var_794_50 + arg_794_0 and arg_791_1.var_.characterEffect1019ui_story == nil then
				arg_791_1.var_.characterEffect1019ui_story = var_794_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_794_51 = 0.200000002980232

			if var_794_50 <= arg_791_1.time_ and arg_791_1.time_ < var_794_50 + var_794_51 then
				local var_794_52 = (arg_791_1.time_ - var_794_50) / var_794_51

				if arg_791_1.var_.characterEffect1019ui_story then
					local var_794_53 = Mathf.Lerp(0, 0.5, var_794_52)

					arg_791_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_791_1.var_.characterEffect1019ui_story.fillRatio = var_794_53
				end
			end

			if arg_791_1.time_ >= var_794_50 + var_794_51 and arg_791_1.time_ < var_794_50 + var_794_51 + arg_794_0 and arg_791_1.var_.characterEffect1019ui_story then
				local var_794_54 = 0.5

				arg_791_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_791_1.var_.characterEffect1019ui_story.fillRatio = var_794_54
			end

			local var_794_55 = 2

			if var_794_55 < arg_791_1.time_ and arg_791_1.time_ <= var_794_55 + arg_794_0 then
				arg_791_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_794_56 = 2

			if var_794_56 < arg_791_1.time_ and arg_791_1.time_ <= var_794_56 + arg_794_0 then
				arg_791_1.screenFilterGo_:SetActive(true)

				arg_791_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_794_57 = 0.034000001847744

			if var_794_56 <= arg_791_1.time_ and arg_791_1.time_ < var_794_56 + var_794_57 then
				local var_794_58 = (arg_791_1.time_ - var_794_56) / var_794_57

				arg_791_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_794_58)
			end

			if arg_791_1.time_ >= var_794_56 + var_794_57 and arg_791_1.time_ < var_794_56 + var_794_57 + arg_794_0 then
				arg_791_1.screenFilterEffect_.weight = 1
			end

			if arg_791_1.frameCnt_ <= 1 then
				arg_791_1.dialog_:SetActive(false)
			end

			local var_794_59 = 4
			local var_794_60 = 0.4

			if var_794_59 < arg_791_1.time_ and arg_791_1.time_ <= var_794_59 + arg_794_0 then
				arg_791_1.talkMaxDuration = 0

				arg_791_1.dialog_:SetActive(true)

				local var_794_61 = LeanTween.value(arg_791_1.dialog_, 0, 1, 0.3)

				var_794_61:setOnUpdate(LuaHelper.FloatAction(function(arg_795_0)
					arg_791_1.dialogCg_.alpha = arg_795_0
				end))
				var_794_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_791_1.dialog_)
					var_794_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_791_1.duration_ = arg_791_1.duration_ + 0.3

				SetActive(arg_791_1.leftNameGo_, true)

				local var_794_62 = arg_791_1:FormatText(StoryNameCfg[319].name)

				arg_791_1.leftNameTxt_.text = var_794_62

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_791_1.leftNameTxt_.transform)

				arg_791_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_791_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_791_1:RecordName(arg_791_1.leftNameTxt_.text)
				SetActive(arg_791_1.iconTrs_.gameObject, false)
				arg_791_1.callingController_:SetSelectedState("normal")

				local var_794_63 = arg_791_1:GetWordFromCfg(1101906190)
				local var_794_64 = arg_791_1:FormatText(var_794_63.content)

				arg_791_1.text_.text = var_794_64

				LuaForUtil.ClearLinePrefixSymbol(arg_791_1.text_)

				local var_794_65 = 16
				local var_794_66 = utf8.len(var_794_64)
				local var_794_67 = var_794_65 <= 0 and var_794_60 or var_794_60 * (var_794_66 / var_794_65)

				if var_794_67 > 0 and var_794_60 < var_794_67 then
					arg_791_1.talkMaxDuration = var_794_67
					var_794_59 = var_794_59 + 0.3

					if var_794_67 + var_794_59 > arg_791_1.duration_ then
						arg_791_1.duration_ = var_794_67 + var_794_59
					end
				end

				arg_791_1.text_.text = var_794_64
				arg_791_1.typewritter.percent = 0

				arg_791_1.typewritter:SetDirty()
				arg_791_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906190", "story_v_side_new_1101906.awb") ~= 0 then
					local var_794_68 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906190", "story_v_side_new_1101906.awb") / 1000

					if var_794_68 + var_794_59 > arg_791_1.duration_ then
						arg_791_1.duration_ = var_794_68 + var_794_59
					end

					if var_794_63.prefab_name ~= "" and arg_791_1.actors_[var_794_63.prefab_name] ~= nil then
						local var_794_69 = LuaForUtil.PlayVoiceWithCriLipsync(arg_791_1.actors_[var_794_63.prefab_name].transform, "story_v_side_new_1101906", "1101906190", "story_v_side_new_1101906.awb")

						arg_791_1:RecordAudio("1101906190", var_794_69)
						arg_791_1:RecordAudio("1101906190", var_794_69)
					else
						arg_791_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906190", "story_v_side_new_1101906.awb")
					end

					arg_791_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906190", "story_v_side_new_1101906.awb")
				end

				arg_791_1:RecordContent(arg_791_1.text_.text)
			end

			local var_794_70 = var_794_59 + 0.3
			local var_794_71 = math.max(var_794_60, arg_791_1.talkMaxDuration)

			if var_794_70 <= arg_791_1.time_ and arg_791_1.time_ < var_794_70 + var_794_71 then
				arg_791_1.typewritter.percent = (arg_791_1.time_ - var_794_70) / var_794_71

				arg_791_1.typewritter:SetDirty()
			end

			if arg_791_1.time_ >= var_794_70 + var_794_71 and arg_791_1.time_ < var_794_70 + var_794_71 + arg_794_0 then
				arg_791_1.typewritter.percent = 1

				arg_791_1.typewritter:SetDirty()
				arg_791_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906191 = function(arg_797_0, arg_797_1)
		arg_797_1.time_ = 0
		arg_797_1.frameCnt_ = 0
		arg_797_1.state_ = "playing"
		arg_797_1.curTalkId_ = 1101906191
		arg_797_1.duration_ = 9

		SetActive(arg_797_1.tipsGo_, false)

		function arg_797_1.onSingleLineFinish_()
			arg_797_1.onSingleLineUpdate_ = nil
			arg_797_1.onSingleLineFinish_ = nil
			arg_797_1.state_ = "waiting"
		end

		function arg_797_1.playNext_(arg_799_0)
			if arg_799_0 == 1 then
				arg_797_0:Play1101906192(arg_797_1)
			end
		end

		function arg_797_1.onSingleLineUpdate_(arg_800_0)
			local var_800_0 = 2

			if var_800_0 < arg_797_1.time_ and arg_797_1.time_ <= var_800_0 + arg_800_0 then
				local var_800_1 = manager.ui.mainCamera.transform.localPosition
				local var_800_2 = Vector3.New(0, 0, 10) + Vector3.New(var_800_1.x, var_800_1.y, 0)
				local var_800_3 = arg_797_1.bgs_.ST12

				var_800_3.transform.localPosition = var_800_2
				var_800_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_800_4 = var_800_3:GetComponent("SpriteRenderer")

				if var_800_4 and var_800_4.sprite then
					local var_800_5 = (var_800_3.transform.localPosition - var_800_1).z
					local var_800_6 = manager.ui.mainCameraCom_
					local var_800_7 = 2 * var_800_5 * Mathf.Tan(var_800_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_800_8 = var_800_7 * var_800_6.aspect
					local var_800_9 = var_800_4.sprite.bounds.size.x
					local var_800_10 = var_800_4.sprite.bounds.size.y
					local var_800_11 = var_800_8 / var_800_9
					local var_800_12 = var_800_7 / var_800_10
					local var_800_13 = var_800_12 < var_800_11 and var_800_11 or var_800_12

					var_800_3.transform.localScale = Vector3.New(var_800_13, var_800_13, 0)
				end

				for iter_800_0, iter_800_1 in pairs(arg_797_1.bgs_) do
					if iter_800_0 ~= "ST12" then
						iter_800_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_800_14 = 0

			if var_800_14 < arg_797_1.time_ and arg_797_1.time_ <= var_800_14 + arg_800_0 then
				arg_797_1.mask_.enabled = true
				arg_797_1.mask_.raycastTarget = true

				arg_797_1:SetGaussion(false)
			end

			local var_800_15 = 2

			if var_800_14 <= arg_797_1.time_ and arg_797_1.time_ < var_800_14 + var_800_15 then
				local var_800_16 = (arg_797_1.time_ - var_800_14) / var_800_15
				local var_800_17 = Color.New(0, 0, 0)

				var_800_17.a = Mathf.Lerp(0, 1, var_800_16)
				arg_797_1.mask_.color = var_800_17
			end

			if arg_797_1.time_ >= var_800_14 + var_800_15 and arg_797_1.time_ < var_800_14 + var_800_15 + arg_800_0 then
				local var_800_18 = Color.New(0, 0, 0)

				var_800_18.a = 1
				arg_797_1.mask_.color = var_800_18
			end

			local var_800_19 = 2

			if var_800_19 < arg_797_1.time_ and arg_797_1.time_ <= var_800_19 + arg_800_0 then
				arg_797_1.mask_.enabled = true
				arg_797_1.mask_.raycastTarget = true

				arg_797_1:SetGaussion(false)
			end

			local var_800_20 = 2

			if var_800_19 <= arg_797_1.time_ and arg_797_1.time_ < var_800_19 + var_800_20 then
				local var_800_21 = (arg_797_1.time_ - var_800_19) / var_800_20
				local var_800_22 = Color.New(0, 0, 0)

				var_800_22.a = Mathf.Lerp(1, 0, var_800_21)
				arg_797_1.mask_.color = var_800_22
			end

			if arg_797_1.time_ >= var_800_19 + var_800_20 and arg_797_1.time_ < var_800_19 + var_800_20 + arg_800_0 then
				local var_800_23 = Color.New(0, 0, 0)
				local var_800_24 = 0

				arg_797_1.mask_.enabled = false
				var_800_23.a = var_800_24
				arg_797_1.mask_.color = var_800_23
			end

			local var_800_25 = arg_797_1.actors_["1019ui_story"].transform
			local var_800_26 = 2

			if var_800_26 < arg_797_1.time_ and arg_797_1.time_ <= var_800_26 + arg_800_0 then
				arg_797_1.var_.moveOldPos1019ui_story = var_800_25.localPosition
			end

			local var_800_27 = 0.001

			if var_800_26 <= arg_797_1.time_ and arg_797_1.time_ < var_800_26 + var_800_27 then
				local var_800_28 = (arg_797_1.time_ - var_800_26) / var_800_27
				local var_800_29 = Vector3.New(0, -1.08, -5.9)

				var_800_25.localPosition = Vector3.Lerp(arg_797_1.var_.moveOldPos1019ui_story, var_800_29, var_800_28)

				local var_800_30 = manager.ui.mainCamera.transform.position - var_800_25.position

				var_800_25.forward = Vector3.New(var_800_30.x, var_800_30.y, var_800_30.z)

				local var_800_31 = var_800_25.localEulerAngles

				var_800_31.z = 0
				var_800_31.x = 0
				var_800_25.localEulerAngles = var_800_31
			end

			if arg_797_1.time_ >= var_800_26 + var_800_27 and arg_797_1.time_ < var_800_26 + var_800_27 + arg_800_0 then
				var_800_25.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_800_32 = manager.ui.mainCamera.transform.position - var_800_25.position

				var_800_25.forward = Vector3.New(var_800_32.x, var_800_32.y, var_800_32.z)

				local var_800_33 = var_800_25.localEulerAngles

				var_800_33.z = 0
				var_800_33.x = 0
				var_800_25.localEulerAngles = var_800_33
			end

			local var_800_34 = arg_797_1.actors_["1019ui_story"]
			local var_800_35 = 2

			if var_800_35 < arg_797_1.time_ and arg_797_1.time_ <= var_800_35 + arg_800_0 and arg_797_1.var_.characterEffect1019ui_story == nil then
				arg_797_1.var_.characterEffect1019ui_story = var_800_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_800_36 = 0.200000002980232

			if var_800_35 <= arg_797_1.time_ and arg_797_1.time_ < var_800_35 + var_800_36 then
				local var_800_37 = (arg_797_1.time_ - var_800_35) / var_800_36

				if arg_797_1.var_.characterEffect1019ui_story then
					local var_800_38 = Mathf.Lerp(0, 0.5, var_800_37)

					arg_797_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_797_1.var_.characterEffect1019ui_story.fillRatio = var_800_38
				end
			end

			if arg_797_1.time_ >= var_800_35 + var_800_36 and arg_797_1.time_ < var_800_35 + var_800_36 + arg_800_0 and arg_797_1.var_.characterEffect1019ui_story then
				local var_800_39 = 0.5

				arg_797_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_797_1.var_.characterEffect1019ui_story.fillRatio = var_800_39
			end

			local var_800_40 = arg_797_1.actors_["1029ui_story"].transform
			local var_800_41 = 2

			if var_800_41 < arg_797_1.time_ and arg_797_1.time_ <= var_800_41 + arg_800_0 then
				arg_797_1.var_.moveOldPos1029ui_story = var_800_40.localPosition
			end

			local var_800_42 = 0.001

			if var_800_41 <= arg_797_1.time_ and arg_797_1.time_ < var_800_41 + var_800_42 then
				local var_800_43 = (arg_797_1.time_ - var_800_41) / var_800_42
				local var_800_44 = Vector3.New(0, 100, 0)

				var_800_40.localPosition = Vector3.Lerp(arg_797_1.var_.moveOldPos1029ui_story, var_800_44, var_800_43)

				local var_800_45 = manager.ui.mainCamera.transform.position - var_800_40.position

				var_800_40.forward = Vector3.New(var_800_45.x, var_800_45.y, var_800_45.z)

				local var_800_46 = var_800_40.localEulerAngles

				var_800_46.z = 0
				var_800_46.x = 0
				var_800_40.localEulerAngles = var_800_46
			end

			if arg_797_1.time_ >= var_800_41 + var_800_42 and arg_797_1.time_ < var_800_41 + var_800_42 + arg_800_0 then
				var_800_40.localPosition = Vector3.New(0, 100, 0)

				local var_800_47 = manager.ui.mainCamera.transform.position - var_800_40.position

				var_800_40.forward = Vector3.New(var_800_47.x, var_800_47.y, var_800_47.z)

				local var_800_48 = var_800_40.localEulerAngles

				var_800_48.z = 0
				var_800_48.x = 0
				var_800_40.localEulerAngles = var_800_48
			end

			local var_800_49 = arg_797_1.actors_["1029ui_story"]
			local var_800_50 = 2

			if var_800_50 < arg_797_1.time_ and arg_797_1.time_ <= var_800_50 + arg_800_0 and arg_797_1.var_.characterEffect1029ui_story == nil then
				arg_797_1.var_.characterEffect1029ui_story = var_800_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_800_51 = 0.200000002980232

			if var_800_50 <= arg_797_1.time_ and arg_797_1.time_ < var_800_50 + var_800_51 then
				local var_800_52 = (arg_797_1.time_ - var_800_50) / var_800_51

				if arg_797_1.var_.characterEffect1029ui_story then
					local var_800_53 = Mathf.Lerp(0, 0.5, var_800_52)

					arg_797_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_797_1.var_.characterEffect1029ui_story.fillRatio = var_800_53
				end
			end

			if arg_797_1.time_ >= var_800_50 + var_800_51 and arg_797_1.time_ < var_800_50 + var_800_51 + arg_800_0 and arg_797_1.var_.characterEffect1029ui_story then
				local var_800_54 = 0.5

				arg_797_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_797_1.var_.characterEffect1029ui_story.fillRatio = var_800_54
			end

			local var_800_55 = 2

			if var_800_55 < arg_797_1.time_ and arg_797_1.time_ <= var_800_55 + arg_800_0 then
				arg_797_1.screenFilterGo_:SetActive(false)
			end

			local var_800_56 = 0.034000001847744

			if var_800_55 <= arg_797_1.time_ and arg_797_1.time_ < var_800_55 + var_800_56 then
				local var_800_57 = (arg_797_1.time_ - var_800_55) / var_800_56

				arg_797_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_800_57)
			end

			if arg_797_1.time_ >= var_800_55 + var_800_56 and arg_797_1.time_ < var_800_55 + var_800_56 + arg_800_0 then
				arg_797_1.screenFilterEffect_.weight = 0
			end

			if arg_797_1.frameCnt_ <= 1 then
				arg_797_1.dialog_:SetActive(false)
			end

			local var_800_58 = 4
			local var_800_59 = 0.475

			if var_800_58 < arg_797_1.time_ and arg_797_1.time_ <= var_800_58 + arg_800_0 then
				arg_797_1.talkMaxDuration = 0

				arg_797_1.dialog_:SetActive(true)

				local var_800_60 = LeanTween.value(arg_797_1.dialog_, 0, 1, 0.3)

				var_800_60:setOnUpdate(LuaHelper.FloatAction(function(arg_801_0)
					arg_797_1.dialogCg_.alpha = arg_801_0
				end))
				var_800_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_797_1.dialog_)
					var_800_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_797_1.duration_ = arg_797_1.duration_ + 0.3

				SetActive(arg_797_1.leftNameGo_, true)

				local var_800_61 = arg_797_1:FormatText(StoryNameCfg[7].name)

				arg_797_1.leftNameTxt_.text = var_800_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_797_1.leftNameTxt_.transform)

				arg_797_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_797_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_797_1:RecordName(arg_797_1.leftNameTxt_.text)
				SetActive(arg_797_1.iconTrs_.gameObject, false)
				arg_797_1.callingController_:SetSelectedState("normal")

				local var_800_62 = arg_797_1:GetWordFromCfg(1101906191)
				local var_800_63 = arg_797_1:FormatText(var_800_62.content)

				arg_797_1.text_.text = var_800_63

				LuaForUtil.ClearLinePrefixSymbol(arg_797_1.text_)

				local var_800_64 = 19
				local var_800_65 = utf8.len(var_800_63)
				local var_800_66 = var_800_64 <= 0 and var_800_59 or var_800_59 * (var_800_65 / var_800_64)

				if var_800_66 > 0 and var_800_59 < var_800_66 then
					arg_797_1.talkMaxDuration = var_800_66
					var_800_58 = var_800_58 + 0.3

					if var_800_66 + var_800_58 > arg_797_1.duration_ then
						arg_797_1.duration_ = var_800_66 + var_800_58
					end
				end

				arg_797_1.text_.text = var_800_63
				arg_797_1.typewritter.percent = 0

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(false)
				arg_797_1:RecordContent(arg_797_1.text_.text)
			end

			local var_800_67 = var_800_58 + 0.3
			local var_800_68 = math.max(var_800_59, arg_797_1.talkMaxDuration)

			if var_800_67 <= arg_797_1.time_ and arg_797_1.time_ < var_800_67 + var_800_68 then
				arg_797_1.typewritter.percent = (arg_797_1.time_ - var_800_67) / var_800_68

				arg_797_1.typewritter:SetDirty()
			end

			if arg_797_1.time_ >= var_800_67 + var_800_68 and arg_797_1.time_ < var_800_67 + var_800_68 + arg_800_0 then
				arg_797_1.typewritter.percent = 1

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906192 = function(arg_803_0, arg_803_1)
		arg_803_1.time_ = 0
		arg_803_1.frameCnt_ = 0
		arg_803_1.state_ = "playing"
		arg_803_1.curTalkId_ = 1101906192
		arg_803_1.duration_ = 1.766

		SetActive(arg_803_1.tipsGo_, false)

		function arg_803_1.onSingleLineFinish_()
			arg_803_1.onSingleLineUpdate_ = nil
			arg_803_1.onSingleLineFinish_ = nil
			arg_803_1.state_ = "waiting"
		end

		function arg_803_1.playNext_(arg_805_0)
			if arg_805_0 == 1 then
				arg_803_0:Play1101906193(arg_803_1)
			end
		end

		function arg_803_1.onSingleLineUpdate_(arg_806_0)
			local var_806_0 = arg_803_1.actors_["1019ui_story"]
			local var_806_1 = 0

			if var_806_1 < arg_803_1.time_ and arg_803_1.time_ <= var_806_1 + arg_806_0 and arg_803_1.var_.characterEffect1019ui_story == nil then
				arg_803_1.var_.characterEffect1019ui_story = var_806_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_806_2 = 0.200000002980232

			if var_806_1 <= arg_803_1.time_ and arg_803_1.time_ < var_806_1 + var_806_2 then
				local var_806_3 = (arg_803_1.time_ - var_806_1) / var_806_2

				if arg_803_1.var_.characterEffect1019ui_story then
					arg_803_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_803_1.time_ >= var_806_1 + var_806_2 and arg_803_1.time_ < var_806_1 + var_806_2 + arg_806_0 and arg_803_1.var_.characterEffect1019ui_story then
				arg_803_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_806_4 = 0
			local var_806_5 = 0.25

			if var_806_4 < arg_803_1.time_ and arg_803_1.time_ <= var_806_4 + arg_806_0 then
				arg_803_1.talkMaxDuration = 0
				arg_803_1.dialogCg_.alpha = 1

				arg_803_1.dialog_:SetActive(true)
				SetActive(arg_803_1.leftNameGo_, true)

				local var_806_6 = arg_803_1:FormatText(StoryNameCfg[13].name)

				arg_803_1.leftNameTxt_.text = var_806_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_803_1.leftNameTxt_.transform)

				arg_803_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_803_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_803_1:RecordName(arg_803_1.leftNameTxt_.text)
				SetActive(arg_803_1.iconTrs_.gameObject, false)
				arg_803_1.callingController_:SetSelectedState("normal")

				local var_806_7 = arg_803_1:GetWordFromCfg(1101906192)
				local var_806_8 = arg_803_1:FormatText(var_806_7.content)

				arg_803_1.text_.text = var_806_8

				LuaForUtil.ClearLinePrefixSymbol(arg_803_1.text_)

				local var_806_9 = 10
				local var_806_10 = utf8.len(var_806_8)
				local var_806_11 = var_806_9 <= 0 and var_806_5 or var_806_5 * (var_806_10 / var_806_9)

				if var_806_11 > 0 and var_806_5 < var_806_11 then
					arg_803_1.talkMaxDuration = var_806_11

					if var_806_11 + var_806_4 > arg_803_1.duration_ then
						arg_803_1.duration_ = var_806_11 + var_806_4
					end
				end

				arg_803_1.text_.text = var_806_8
				arg_803_1.typewritter.percent = 0

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906192", "story_v_side_new_1101906.awb") ~= 0 then
					local var_806_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906192", "story_v_side_new_1101906.awb") / 1000

					if var_806_12 + var_806_4 > arg_803_1.duration_ then
						arg_803_1.duration_ = var_806_12 + var_806_4
					end

					if var_806_7.prefab_name ~= "" and arg_803_1.actors_[var_806_7.prefab_name] ~= nil then
						local var_806_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_803_1.actors_[var_806_7.prefab_name].transform, "story_v_side_new_1101906", "1101906192", "story_v_side_new_1101906.awb")

						arg_803_1:RecordAudio("1101906192", var_806_13)
						arg_803_1:RecordAudio("1101906192", var_806_13)
					else
						arg_803_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906192", "story_v_side_new_1101906.awb")
					end

					arg_803_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906192", "story_v_side_new_1101906.awb")
				end

				arg_803_1:RecordContent(arg_803_1.text_.text)
			end

			local var_806_14 = math.max(var_806_5, arg_803_1.talkMaxDuration)

			if var_806_4 <= arg_803_1.time_ and arg_803_1.time_ < var_806_4 + var_806_14 then
				arg_803_1.typewritter.percent = (arg_803_1.time_ - var_806_4) / var_806_14

				arg_803_1.typewritter:SetDirty()
			end

			if arg_803_1.time_ >= var_806_4 + var_806_14 and arg_803_1.time_ < var_806_4 + var_806_14 + arg_806_0 then
				arg_803_1.typewritter.percent = 1

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906193 = function(arg_807_0, arg_807_1)
		arg_807_1.time_ = 0
		arg_807_1.frameCnt_ = 0
		arg_807_1.state_ = "playing"
		arg_807_1.curTalkId_ = 1101906193
		arg_807_1.duration_ = 5

		SetActive(arg_807_1.tipsGo_, false)

		function arg_807_1.onSingleLineFinish_()
			arg_807_1.onSingleLineUpdate_ = nil
			arg_807_1.onSingleLineFinish_ = nil
			arg_807_1.state_ = "waiting"
		end

		function arg_807_1.playNext_(arg_809_0)
			if arg_809_0 == 1 then
				arg_807_0:Play1101906194(arg_807_1)
			end
		end

		function arg_807_1.onSingleLineUpdate_(arg_810_0)
			local var_810_0 = arg_807_1.actors_["1019ui_story"]
			local var_810_1 = 0

			if var_810_1 < arg_807_1.time_ and arg_807_1.time_ <= var_810_1 + arg_810_0 and arg_807_1.var_.characterEffect1019ui_story == nil then
				arg_807_1.var_.characterEffect1019ui_story = var_810_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_810_2 = 0.200000002980232

			if var_810_1 <= arg_807_1.time_ and arg_807_1.time_ < var_810_1 + var_810_2 then
				local var_810_3 = (arg_807_1.time_ - var_810_1) / var_810_2

				if arg_807_1.var_.characterEffect1019ui_story then
					local var_810_4 = Mathf.Lerp(0, 0.5, var_810_3)

					arg_807_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_807_1.var_.characterEffect1019ui_story.fillRatio = var_810_4
				end
			end

			if arg_807_1.time_ >= var_810_1 + var_810_2 and arg_807_1.time_ < var_810_1 + var_810_2 + arg_810_0 and arg_807_1.var_.characterEffect1019ui_story then
				local var_810_5 = 0.5

				arg_807_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_807_1.var_.characterEffect1019ui_story.fillRatio = var_810_5
			end

			local var_810_6 = 0
			local var_810_7 = 0.225

			if var_810_6 < arg_807_1.time_ and arg_807_1.time_ <= var_810_6 + arg_810_0 then
				arg_807_1.talkMaxDuration = 0
				arg_807_1.dialogCg_.alpha = 1

				arg_807_1.dialog_:SetActive(true)
				SetActive(arg_807_1.leftNameGo_, true)

				local var_810_8 = arg_807_1:FormatText(StoryNameCfg[7].name)

				arg_807_1.leftNameTxt_.text = var_810_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_807_1.leftNameTxt_.transform)

				arg_807_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_807_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_807_1:RecordName(arg_807_1.leftNameTxt_.text)
				SetActive(arg_807_1.iconTrs_.gameObject, false)
				arg_807_1.callingController_:SetSelectedState("normal")

				local var_810_9 = arg_807_1:GetWordFromCfg(1101906193)
				local var_810_10 = arg_807_1:FormatText(var_810_9.content)

				arg_807_1.text_.text = var_810_10

				LuaForUtil.ClearLinePrefixSymbol(arg_807_1.text_)

				local var_810_11 = 9
				local var_810_12 = utf8.len(var_810_10)
				local var_810_13 = var_810_11 <= 0 and var_810_7 or var_810_7 * (var_810_12 / var_810_11)

				if var_810_13 > 0 and var_810_7 < var_810_13 then
					arg_807_1.talkMaxDuration = var_810_13

					if var_810_13 + var_810_6 > arg_807_1.duration_ then
						arg_807_1.duration_ = var_810_13 + var_810_6
					end
				end

				arg_807_1.text_.text = var_810_10
				arg_807_1.typewritter.percent = 0

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(false)
				arg_807_1:RecordContent(arg_807_1.text_.text)
			end

			local var_810_14 = math.max(var_810_7, arg_807_1.talkMaxDuration)

			if var_810_6 <= arg_807_1.time_ and arg_807_1.time_ < var_810_6 + var_810_14 then
				arg_807_1.typewritter.percent = (arg_807_1.time_ - var_810_6) / var_810_14

				arg_807_1.typewritter:SetDirty()
			end

			if arg_807_1.time_ >= var_810_6 + var_810_14 and arg_807_1.time_ < var_810_6 + var_810_14 + arg_810_0 then
				arg_807_1.typewritter.percent = 1

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906194 = function(arg_811_0, arg_811_1)
		arg_811_1.time_ = 0
		arg_811_1.frameCnt_ = 0
		arg_811_1.state_ = "playing"
		arg_811_1.curTalkId_ = 1101906194
		arg_811_1.duration_ = 9.333

		SetActive(arg_811_1.tipsGo_, false)

		function arg_811_1.onSingleLineFinish_()
			arg_811_1.onSingleLineUpdate_ = nil
			arg_811_1.onSingleLineFinish_ = nil
			arg_811_1.state_ = "waiting"
		end

		function arg_811_1.playNext_(arg_813_0)
			if arg_813_0 == 1 then
				arg_811_0:Play1101906195(arg_811_1)
			end
		end

		function arg_811_1.onSingleLineUpdate_(arg_814_0)
			local var_814_0 = arg_811_1.actors_["1019ui_story"]
			local var_814_1 = 0

			if var_814_1 < arg_811_1.time_ and arg_811_1.time_ <= var_814_1 + arg_814_0 and arg_811_1.var_.characterEffect1019ui_story == nil then
				arg_811_1.var_.characterEffect1019ui_story = var_814_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_814_2 = 0.200000002980232

			if var_814_1 <= arg_811_1.time_ and arg_811_1.time_ < var_814_1 + var_814_2 then
				local var_814_3 = (arg_811_1.time_ - var_814_1) / var_814_2

				if arg_811_1.var_.characterEffect1019ui_story then
					local var_814_4 = Mathf.Lerp(0, 0.5, var_814_3)

					arg_811_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_811_1.var_.characterEffect1019ui_story.fillRatio = var_814_4
				end
			end

			if arg_811_1.time_ >= var_814_1 + var_814_2 and arg_811_1.time_ < var_814_1 + var_814_2 + arg_814_0 and arg_811_1.var_.characterEffect1019ui_story then
				local var_814_5 = 0.5

				arg_811_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_811_1.var_.characterEffect1019ui_story.fillRatio = var_814_5
			end

			local var_814_6 = 0
			local var_814_7 = 1.15

			if var_814_6 < arg_811_1.time_ and arg_811_1.time_ <= var_814_6 + arg_814_0 then
				arg_811_1.talkMaxDuration = 0
				arg_811_1.dialogCg_.alpha = 1

				arg_811_1.dialog_:SetActive(true)
				SetActive(arg_811_1.leftNameGo_, true)

				local var_814_8 = arg_811_1:FormatText(StoryNameCfg[13].name)

				arg_811_1.leftNameTxt_.text = var_814_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_811_1.leftNameTxt_.transform)

				arg_811_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_811_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_811_1:RecordName(arg_811_1.leftNameTxt_.text)
				SetActive(arg_811_1.iconTrs_.gameObject, false)
				arg_811_1.callingController_:SetSelectedState("normal")

				local var_814_9 = arg_811_1:GetWordFromCfg(1101906194)
				local var_814_10 = arg_811_1:FormatText(var_814_9.content)

				arg_811_1.text_.text = var_814_10

				LuaForUtil.ClearLinePrefixSymbol(arg_811_1.text_)

				local var_814_11 = 46
				local var_814_12 = utf8.len(var_814_10)
				local var_814_13 = var_814_11 <= 0 and var_814_7 or var_814_7 * (var_814_12 / var_814_11)

				if var_814_13 > 0 and var_814_7 < var_814_13 then
					arg_811_1.talkMaxDuration = var_814_13

					if var_814_13 + var_814_6 > arg_811_1.duration_ then
						arg_811_1.duration_ = var_814_13 + var_814_6
					end
				end

				arg_811_1.text_.text = var_814_10
				arg_811_1.typewritter.percent = 0

				arg_811_1.typewritter:SetDirty()
				arg_811_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906194", "story_v_side_new_1101906.awb") ~= 0 then
					local var_814_14 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906194", "story_v_side_new_1101906.awb") / 1000

					if var_814_14 + var_814_6 > arg_811_1.duration_ then
						arg_811_1.duration_ = var_814_14 + var_814_6
					end

					if var_814_9.prefab_name ~= "" and arg_811_1.actors_[var_814_9.prefab_name] ~= nil then
						local var_814_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_811_1.actors_[var_814_9.prefab_name].transform, "story_v_side_new_1101906", "1101906194", "story_v_side_new_1101906.awb")

						arg_811_1:RecordAudio("1101906194", var_814_15)
						arg_811_1:RecordAudio("1101906194", var_814_15)
					else
						arg_811_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906194", "story_v_side_new_1101906.awb")
					end

					arg_811_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906194", "story_v_side_new_1101906.awb")
				end

				arg_811_1:RecordContent(arg_811_1.text_.text)
			end

			local var_814_16 = math.max(var_814_7, arg_811_1.talkMaxDuration)

			if var_814_6 <= arg_811_1.time_ and arg_811_1.time_ < var_814_6 + var_814_16 then
				arg_811_1.typewritter.percent = (arg_811_1.time_ - var_814_6) / var_814_16

				arg_811_1.typewritter:SetDirty()
			end

			if arg_811_1.time_ >= var_814_6 + var_814_16 and arg_811_1.time_ < var_814_6 + var_814_16 + arg_814_0 then
				arg_811_1.typewritter.percent = 1

				arg_811_1.typewritter:SetDirty()
				arg_811_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906195 = function(arg_815_0, arg_815_1)
		arg_815_1.time_ = 0
		arg_815_1.frameCnt_ = 0
		arg_815_1.state_ = "playing"
		arg_815_1.curTalkId_ = 1101906195
		arg_815_1.duration_ = 5

		SetActive(arg_815_1.tipsGo_, false)

		function arg_815_1.onSingleLineFinish_()
			arg_815_1.onSingleLineUpdate_ = nil
			arg_815_1.onSingleLineFinish_ = nil
			arg_815_1.state_ = "waiting"
		end

		function arg_815_1.playNext_(arg_817_0)
			if arg_817_0 == 1 then
				arg_815_0:Play1101906196(arg_815_1)
			end
		end

		function arg_815_1.onSingleLineUpdate_(arg_818_0)
			local var_818_0 = arg_815_1.actors_["1019ui_story"]
			local var_818_1 = 0

			if var_818_1 < arg_815_1.time_ and arg_815_1.time_ <= var_818_1 + arg_818_0 and arg_815_1.var_.characterEffect1019ui_story == nil then
				arg_815_1.var_.characterEffect1019ui_story = var_818_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_818_2 = 0.200000002980232

			if var_818_1 <= arg_815_1.time_ and arg_815_1.time_ < var_818_1 + var_818_2 then
				local var_818_3 = (arg_815_1.time_ - var_818_1) / var_818_2

				if arg_815_1.var_.characterEffect1019ui_story then
					local var_818_4 = Mathf.Lerp(0, 0.5, var_818_3)

					arg_815_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_815_1.var_.characterEffect1019ui_story.fillRatio = var_818_4
				end
			end

			if arg_815_1.time_ >= var_818_1 + var_818_2 and arg_815_1.time_ < var_818_1 + var_818_2 + arg_818_0 and arg_815_1.var_.characterEffect1019ui_story then
				local var_818_5 = 0.5

				arg_815_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_815_1.var_.characterEffect1019ui_story.fillRatio = var_818_5
			end

			local var_818_6 = 0
			local var_818_7 = 0.55

			if var_818_6 < arg_815_1.time_ and arg_815_1.time_ <= var_818_6 + arg_818_0 then
				arg_815_1.talkMaxDuration = 0
				arg_815_1.dialogCg_.alpha = 1

				arg_815_1.dialog_:SetActive(true)
				SetActive(arg_815_1.leftNameGo_, true)

				local var_818_8 = arg_815_1:FormatText(StoryNameCfg[7].name)

				arg_815_1.leftNameTxt_.text = var_818_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_815_1.leftNameTxt_.transform)

				arg_815_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_815_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_815_1:RecordName(arg_815_1.leftNameTxt_.text)
				SetActive(arg_815_1.iconTrs_.gameObject, false)
				arg_815_1.callingController_:SetSelectedState("normal")

				local var_818_9 = arg_815_1:GetWordFromCfg(1101906195)
				local var_818_10 = arg_815_1:FormatText(var_818_9.content)

				arg_815_1.text_.text = var_818_10

				LuaForUtil.ClearLinePrefixSymbol(arg_815_1.text_)

				local var_818_11 = 22
				local var_818_12 = utf8.len(var_818_10)
				local var_818_13 = var_818_11 <= 0 and var_818_7 or var_818_7 * (var_818_12 / var_818_11)

				if var_818_13 > 0 and var_818_7 < var_818_13 then
					arg_815_1.talkMaxDuration = var_818_13

					if var_818_13 + var_818_6 > arg_815_1.duration_ then
						arg_815_1.duration_ = var_818_13 + var_818_6
					end
				end

				arg_815_1.text_.text = var_818_10
				arg_815_1.typewritter.percent = 0

				arg_815_1.typewritter:SetDirty()
				arg_815_1:ShowNextGo(false)
				arg_815_1:RecordContent(arg_815_1.text_.text)
			end

			local var_818_14 = math.max(var_818_7, arg_815_1.talkMaxDuration)

			if var_818_6 <= arg_815_1.time_ and arg_815_1.time_ < var_818_6 + var_818_14 then
				arg_815_1.typewritter.percent = (arg_815_1.time_ - var_818_6) / var_818_14

				arg_815_1.typewritter:SetDirty()
			end

			if arg_815_1.time_ >= var_818_6 + var_818_14 and arg_815_1.time_ < var_818_6 + var_818_14 + arg_818_0 then
				arg_815_1.typewritter.percent = 1

				arg_815_1.typewritter:SetDirty()
				arg_815_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906196 = function(arg_819_0, arg_819_1)
		arg_819_1.time_ = 0
		arg_819_1.frameCnt_ = 0
		arg_819_1.state_ = "playing"
		arg_819_1.curTalkId_ = 1101906196
		arg_819_1.duration_ = 6.833

		SetActive(arg_819_1.tipsGo_, false)

		function arg_819_1.onSingleLineFinish_()
			arg_819_1.onSingleLineUpdate_ = nil
			arg_819_1.onSingleLineFinish_ = nil
			arg_819_1.state_ = "waiting"
		end

		function arg_819_1.playNext_(arg_821_0)
			if arg_821_0 == 1 then
				arg_819_0:Play1101906197(arg_819_1)
			end
		end

		function arg_819_1.onSingleLineUpdate_(arg_822_0)
			local var_822_0 = arg_819_1.actors_["1019ui_story"]
			local var_822_1 = 0

			if var_822_1 < arg_819_1.time_ and arg_819_1.time_ <= var_822_1 + arg_822_0 and arg_819_1.var_.characterEffect1019ui_story == nil then
				arg_819_1.var_.characterEffect1019ui_story = var_822_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_822_2 = 0.200000002980232

			if var_822_1 <= arg_819_1.time_ and arg_819_1.time_ < var_822_1 + var_822_2 then
				local var_822_3 = (arg_819_1.time_ - var_822_1) / var_822_2

				if arg_819_1.var_.characterEffect1019ui_story then
					arg_819_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_819_1.time_ >= var_822_1 + var_822_2 and arg_819_1.time_ < var_822_1 + var_822_2 + arg_822_0 and arg_819_1.var_.characterEffect1019ui_story then
				arg_819_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_822_4 = 0
			local var_822_5 = 0.725

			if var_822_4 < arg_819_1.time_ and arg_819_1.time_ <= var_822_4 + arg_822_0 then
				arg_819_1.talkMaxDuration = 0
				arg_819_1.dialogCg_.alpha = 1

				arg_819_1.dialog_:SetActive(true)
				SetActive(arg_819_1.leftNameGo_, true)

				local var_822_6 = arg_819_1:FormatText(StoryNameCfg[13].name)

				arg_819_1.leftNameTxt_.text = var_822_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_819_1.leftNameTxt_.transform)

				arg_819_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_819_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_819_1:RecordName(arg_819_1.leftNameTxt_.text)
				SetActive(arg_819_1.iconTrs_.gameObject, false)
				arg_819_1.callingController_:SetSelectedState("normal")

				local var_822_7 = arg_819_1:GetWordFromCfg(1101906196)
				local var_822_8 = arg_819_1:FormatText(var_822_7.content)

				arg_819_1.text_.text = var_822_8

				LuaForUtil.ClearLinePrefixSymbol(arg_819_1.text_)

				local var_822_9 = 29
				local var_822_10 = utf8.len(var_822_8)
				local var_822_11 = var_822_9 <= 0 and var_822_5 or var_822_5 * (var_822_10 / var_822_9)

				if var_822_11 > 0 and var_822_5 < var_822_11 then
					arg_819_1.talkMaxDuration = var_822_11

					if var_822_11 + var_822_4 > arg_819_1.duration_ then
						arg_819_1.duration_ = var_822_11 + var_822_4
					end
				end

				arg_819_1.text_.text = var_822_8
				arg_819_1.typewritter.percent = 0

				arg_819_1.typewritter:SetDirty()
				arg_819_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906196", "story_v_side_new_1101906.awb") ~= 0 then
					local var_822_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906196", "story_v_side_new_1101906.awb") / 1000

					if var_822_12 + var_822_4 > arg_819_1.duration_ then
						arg_819_1.duration_ = var_822_12 + var_822_4
					end

					if var_822_7.prefab_name ~= "" and arg_819_1.actors_[var_822_7.prefab_name] ~= nil then
						local var_822_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_819_1.actors_[var_822_7.prefab_name].transform, "story_v_side_new_1101906", "1101906196", "story_v_side_new_1101906.awb")

						arg_819_1:RecordAudio("1101906196", var_822_13)
						arg_819_1:RecordAudio("1101906196", var_822_13)
					else
						arg_819_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906196", "story_v_side_new_1101906.awb")
					end

					arg_819_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906196", "story_v_side_new_1101906.awb")
				end

				arg_819_1:RecordContent(arg_819_1.text_.text)
			end

			local var_822_14 = math.max(var_822_5, arg_819_1.talkMaxDuration)

			if var_822_4 <= arg_819_1.time_ and arg_819_1.time_ < var_822_4 + var_822_14 then
				arg_819_1.typewritter.percent = (arg_819_1.time_ - var_822_4) / var_822_14

				arg_819_1.typewritter:SetDirty()
			end

			if arg_819_1.time_ >= var_822_4 + var_822_14 and arg_819_1.time_ < var_822_4 + var_822_14 + arg_822_0 then
				arg_819_1.typewritter.percent = 1

				arg_819_1.typewritter:SetDirty()
				arg_819_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906197 = function(arg_823_0, arg_823_1)
		arg_823_1.time_ = 0
		arg_823_1.frameCnt_ = 0
		arg_823_1.state_ = "playing"
		arg_823_1.curTalkId_ = 1101906197
		arg_823_1.duration_ = 5

		SetActive(arg_823_1.tipsGo_, false)

		function arg_823_1.onSingleLineFinish_()
			arg_823_1.onSingleLineUpdate_ = nil
			arg_823_1.onSingleLineFinish_ = nil
			arg_823_1.state_ = "waiting"
		end

		function arg_823_1.playNext_(arg_825_0)
			if arg_825_0 == 1 then
				arg_823_0:Play1101906198(arg_823_1)
			end
		end

		function arg_823_1.onSingleLineUpdate_(arg_826_0)
			local var_826_0 = arg_823_1.actors_["1019ui_story"]
			local var_826_1 = 0

			if var_826_1 < arg_823_1.time_ and arg_823_1.time_ <= var_826_1 + arg_826_0 and arg_823_1.var_.characterEffect1019ui_story == nil then
				arg_823_1.var_.characterEffect1019ui_story = var_826_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_826_2 = 0.200000002980232

			if var_826_1 <= arg_823_1.time_ and arg_823_1.time_ < var_826_1 + var_826_2 then
				local var_826_3 = (arg_823_1.time_ - var_826_1) / var_826_2

				if arg_823_1.var_.characterEffect1019ui_story then
					local var_826_4 = Mathf.Lerp(0, 0.5, var_826_3)

					arg_823_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_823_1.var_.characterEffect1019ui_story.fillRatio = var_826_4
				end
			end

			if arg_823_1.time_ >= var_826_1 + var_826_2 and arg_823_1.time_ < var_826_1 + var_826_2 + arg_826_0 and arg_823_1.var_.characterEffect1019ui_story then
				local var_826_5 = 0.5

				arg_823_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_823_1.var_.characterEffect1019ui_story.fillRatio = var_826_5
			end

			local var_826_6 = 0
			local var_826_7 = 0.325

			if var_826_6 < arg_823_1.time_ and arg_823_1.time_ <= var_826_6 + arg_826_0 then
				arg_823_1.talkMaxDuration = 0
				arg_823_1.dialogCg_.alpha = 1

				arg_823_1.dialog_:SetActive(true)
				SetActive(arg_823_1.leftNameGo_, true)

				local var_826_8 = arg_823_1:FormatText(StoryNameCfg[7].name)

				arg_823_1.leftNameTxt_.text = var_826_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_823_1.leftNameTxt_.transform)

				arg_823_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_823_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_823_1:RecordName(arg_823_1.leftNameTxt_.text)
				SetActive(arg_823_1.iconTrs_.gameObject, false)
				arg_823_1.callingController_:SetSelectedState("normal")

				local var_826_9 = arg_823_1:GetWordFromCfg(1101906197)
				local var_826_10 = arg_823_1:FormatText(var_826_9.content)

				arg_823_1.text_.text = var_826_10

				LuaForUtil.ClearLinePrefixSymbol(arg_823_1.text_)

				local var_826_11 = 13
				local var_826_12 = utf8.len(var_826_10)
				local var_826_13 = var_826_11 <= 0 and var_826_7 or var_826_7 * (var_826_12 / var_826_11)

				if var_826_13 > 0 and var_826_7 < var_826_13 then
					arg_823_1.talkMaxDuration = var_826_13

					if var_826_13 + var_826_6 > arg_823_1.duration_ then
						arg_823_1.duration_ = var_826_13 + var_826_6
					end
				end

				arg_823_1.text_.text = var_826_10
				arg_823_1.typewritter.percent = 0

				arg_823_1.typewritter:SetDirty()
				arg_823_1:ShowNextGo(false)
				arg_823_1:RecordContent(arg_823_1.text_.text)
			end

			local var_826_14 = math.max(var_826_7, arg_823_1.talkMaxDuration)

			if var_826_6 <= arg_823_1.time_ and arg_823_1.time_ < var_826_6 + var_826_14 then
				arg_823_1.typewritter.percent = (arg_823_1.time_ - var_826_6) / var_826_14

				arg_823_1.typewritter:SetDirty()
			end

			if arg_823_1.time_ >= var_826_6 + var_826_14 and arg_823_1.time_ < var_826_6 + var_826_14 + arg_826_0 then
				arg_823_1.typewritter.percent = 1

				arg_823_1.typewritter:SetDirty()
				arg_823_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906198 = function(arg_827_0, arg_827_1)
		arg_827_1.time_ = 0
		arg_827_1.frameCnt_ = 0
		arg_827_1.state_ = "playing"
		arg_827_1.curTalkId_ = 1101906198
		arg_827_1.duration_ = 12.466

		SetActive(arg_827_1.tipsGo_, false)

		function arg_827_1.onSingleLineFinish_()
			arg_827_1.onSingleLineUpdate_ = nil
			arg_827_1.onSingleLineFinish_ = nil
			arg_827_1.state_ = "waiting"
		end

		function arg_827_1.playNext_(arg_829_0)
			if arg_829_0 == 1 then
				arg_827_0:Play1101906199(arg_827_1)
			end
		end

		function arg_827_1.onSingleLineUpdate_(arg_830_0)
			local var_830_0 = arg_827_1.actors_["1019ui_story"]
			local var_830_1 = 0

			if var_830_1 < arg_827_1.time_ and arg_827_1.time_ <= var_830_1 + arg_830_0 and arg_827_1.var_.characterEffect1019ui_story == nil then
				arg_827_1.var_.characterEffect1019ui_story = var_830_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_830_2 = 0.200000002980232

			if var_830_1 <= arg_827_1.time_ and arg_827_1.time_ < var_830_1 + var_830_2 then
				local var_830_3 = (arg_827_1.time_ - var_830_1) / var_830_2

				if arg_827_1.var_.characterEffect1019ui_story then
					arg_827_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_827_1.time_ >= var_830_1 + var_830_2 and arg_827_1.time_ < var_830_1 + var_830_2 + arg_830_0 and arg_827_1.var_.characterEffect1019ui_story then
				arg_827_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_830_4 = 0

			if var_830_4 < arg_827_1.time_ and arg_827_1.time_ <= var_830_4 + arg_830_0 then
				arg_827_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_830_5 = 0

			if var_830_5 < arg_827_1.time_ and arg_827_1.time_ <= var_830_5 + arg_830_0 then
				arg_827_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_830_6 = 0
			local var_830_7 = 1.5

			if var_830_6 < arg_827_1.time_ and arg_827_1.time_ <= var_830_6 + arg_830_0 then
				arg_827_1.talkMaxDuration = 0
				arg_827_1.dialogCg_.alpha = 1

				arg_827_1.dialog_:SetActive(true)
				SetActive(arg_827_1.leftNameGo_, true)

				local var_830_8 = arg_827_1:FormatText(StoryNameCfg[13].name)

				arg_827_1.leftNameTxt_.text = var_830_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_827_1.leftNameTxt_.transform)

				arg_827_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_827_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_827_1:RecordName(arg_827_1.leftNameTxt_.text)
				SetActive(arg_827_1.iconTrs_.gameObject, false)
				arg_827_1.callingController_:SetSelectedState("normal")

				local var_830_9 = arg_827_1:GetWordFromCfg(1101906198)
				local var_830_10 = arg_827_1:FormatText(var_830_9.content)

				arg_827_1.text_.text = var_830_10

				LuaForUtil.ClearLinePrefixSymbol(arg_827_1.text_)

				local var_830_11 = 60
				local var_830_12 = utf8.len(var_830_10)
				local var_830_13 = var_830_11 <= 0 and var_830_7 or var_830_7 * (var_830_12 / var_830_11)

				if var_830_13 > 0 and var_830_7 < var_830_13 then
					arg_827_1.talkMaxDuration = var_830_13

					if var_830_13 + var_830_6 > arg_827_1.duration_ then
						arg_827_1.duration_ = var_830_13 + var_830_6
					end
				end

				arg_827_1.text_.text = var_830_10
				arg_827_1.typewritter.percent = 0

				arg_827_1.typewritter:SetDirty()
				arg_827_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906198", "story_v_side_new_1101906.awb") ~= 0 then
					local var_830_14 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906198", "story_v_side_new_1101906.awb") / 1000

					if var_830_14 + var_830_6 > arg_827_1.duration_ then
						arg_827_1.duration_ = var_830_14 + var_830_6
					end

					if var_830_9.prefab_name ~= "" and arg_827_1.actors_[var_830_9.prefab_name] ~= nil then
						local var_830_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_827_1.actors_[var_830_9.prefab_name].transform, "story_v_side_new_1101906", "1101906198", "story_v_side_new_1101906.awb")

						arg_827_1:RecordAudio("1101906198", var_830_15)
						arg_827_1:RecordAudio("1101906198", var_830_15)
					else
						arg_827_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906198", "story_v_side_new_1101906.awb")
					end

					arg_827_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906198", "story_v_side_new_1101906.awb")
				end

				arg_827_1:RecordContent(arg_827_1.text_.text)
			end

			local var_830_16 = math.max(var_830_7, arg_827_1.talkMaxDuration)

			if var_830_6 <= arg_827_1.time_ and arg_827_1.time_ < var_830_6 + var_830_16 then
				arg_827_1.typewritter.percent = (arg_827_1.time_ - var_830_6) / var_830_16

				arg_827_1.typewritter:SetDirty()
			end

			if arg_827_1.time_ >= var_830_6 + var_830_16 and arg_827_1.time_ < var_830_6 + var_830_16 + arg_830_0 then
				arg_827_1.typewritter.percent = 1

				arg_827_1.typewritter:SetDirty()
				arg_827_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906199 = function(arg_831_0, arg_831_1)
		arg_831_1.time_ = 0
		arg_831_1.frameCnt_ = 0
		arg_831_1.state_ = "playing"
		arg_831_1.curTalkId_ = 1101906199
		arg_831_1.duration_ = 4.966

		SetActive(arg_831_1.tipsGo_, false)

		function arg_831_1.onSingleLineFinish_()
			arg_831_1.onSingleLineUpdate_ = nil
			arg_831_1.onSingleLineFinish_ = nil
			arg_831_1.state_ = "waiting"
		end

		function arg_831_1.playNext_(arg_833_0)
			if arg_833_0 == 1 then
				arg_831_0:Play1101906200(arg_831_1)
			end
		end

		function arg_831_1.onSingleLineUpdate_(arg_834_0)
			local var_834_0 = 0
			local var_834_1 = 0.65

			if var_834_0 < arg_831_1.time_ and arg_831_1.time_ <= var_834_0 + arg_834_0 then
				arg_831_1.talkMaxDuration = 0
				arg_831_1.dialogCg_.alpha = 1

				arg_831_1.dialog_:SetActive(true)
				SetActive(arg_831_1.leftNameGo_, true)

				local var_834_2 = arg_831_1:FormatText(StoryNameCfg[13].name)

				arg_831_1.leftNameTxt_.text = var_834_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_831_1.leftNameTxt_.transform)

				arg_831_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_831_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_831_1:RecordName(arg_831_1.leftNameTxt_.text)
				SetActive(arg_831_1.iconTrs_.gameObject, false)
				arg_831_1.callingController_:SetSelectedState("normal")

				local var_834_3 = arg_831_1:GetWordFromCfg(1101906199)
				local var_834_4 = arg_831_1:FormatText(var_834_3.content)

				arg_831_1.text_.text = var_834_4

				LuaForUtil.ClearLinePrefixSymbol(arg_831_1.text_)

				local var_834_5 = 26
				local var_834_6 = utf8.len(var_834_4)
				local var_834_7 = var_834_5 <= 0 and var_834_1 or var_834_1 * (var_834_6 / var_834_5)

				if var_834_7 > 0 and var_834_1 < var_834_7 then
					arg_831_1.talkMaxDuration = var_834_7

					if var_834_7 + var_834_0 > arg_831_1.duration_ then
						arg_831_1.duration_ = var_834_7 + var_834_0
					end
				end

				arg_831_1.text_.text = var_834_4
				arg_831_1.typewritter.percent = 0

				arg_831_1.typewritter:SetDirty()
				arg_831_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906199", "story_v_side_new_1101906.awb") ~= 0 then
					local var_834_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906199", "story_v_side_new_1101906.awb") / 1000

					if var_834_8 + var_834_0 > arg_831_1.duration_ then
						arg_831_1.duration_ = var_834_8 + var_834_0
					end

					if var_834_3.prefab_name ~= "" and arg_831_1.actors_[var_834_3.prefab_name] ~= nil then
						local var_834_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_831_1.actors_[var_834_3.prefab_name].transform, "story_v_side_new_1101906", "1101906199", "story_v_side_new_1101906.awb")

						arg_831_1:RecordAudio("1101906199", var_834_9)
						arg_831_1:RecordAudio("1101906199", var_834_9)
					else
						arg_831_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906199", "story_v_side_new_1101906.awb")
					end

					arg_831_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906199", "story_v_side_new_1101906.awb")
				end

				arg_831_1:RecordContent(arg_831_1.text_.text)
			end

			local var_834_10 = math.max(var_834_1, arg_831_1.talkMaxDuration)

			if var_834_0 <= arg_831_1.time_ and arg_831_1.time_ < var_834_0 + var_834_10 then
				arg_831_1.typewritter.percent = (arg_831_1.time_ - var_834_0) / var_834_10

				arg_831_1.typewritter:SetDirty()
			end

			if arg_831_1.time_ >= var_834_0 + var_834_10 and arg_831_1.time_ < var_834_0 + var_834_10 + arg_834_0 then
				arg_831_1.typewritter.percent = 1

				arg_831_1.typewritter:SetDirty()
				arg_831_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906200 = function(arg_835_0, arg_835_1)
		arg_835_1.time_ = 0
		arg_835_1.frameCnt_ = 0
		arg_835_1.state_ = "playing"
		arg_835_1.curTalkId_ = 1101906200
		arg_835_1.duration_ = 11.533

		SetActive(arg_835_1.tipsGo_, false)

		function arg_835_1.onSingleLineFinish_()
			arg_835_1.onSingleLineUpdate_ = nil
			arg_835_1.onSingleLineFinish_ = nil
			arg_835_1.state_ = "waiting"
		end

		function arg_835_1.playNext_(arg_837_0)
			if arg_837_0 == 1 then
				arg_835_0:Play1101906201(arg_835_1)
			end
		end

		function arg_835_1.onSingleLineUpdate_(arg_838_0)
			local var_838_0 = 0
			local var_838_1 = 1.2

			if var_838_0 < arg_835_1.time_ and arg_835_1.time_ <= var_838_0 + arg_838_0 then
				arg_835_1.talkMaxDuration = 0
				arg_835_1.dialogCg_.alpha = 1

				arg_835_1.dialog_:SetActive(true)
				SetActive(arg_835_1.leftNameGo_, true)

				local var_838_2 = arg_835_1:FormatText(StoryNameCfg[13].name)

				arg_835_1.leftNameTxt_.text = var_838_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_835_1.leftNameTxt_.transform)

				arg_835_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_835_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_835_1:RecordName(arg_835_1.leftNameTxt_.text)
				SetActive(arg_835_1.iconTrs_.gameObject, false)
				arg_835_1.callingController_:SetSelectedState("normal")

				local var_838_3 = arg_835_1:GetWordFromCfg(1101906200)
				local var_838_4 = arg_835_1:FormatText(var_838_3.content)

				arg_835_1.text_.text = var_838_4

				LuaForUtil.ClearLinePrefixSymbol(arg_835_1.text_)

				local var_838_5 = 48
				local var_838_6 = utf8.len(var_838_4)
				local var_838_7 = var_838_5 <= 0 and var_838_1 or var_838_1 * (var_838_6 / var_838_5)

				if var_838_7 > 0 and var_838_1 < var_838_7 then
					arg_835_1.talkMaxDuration = var_838_7

					if var_838_7 + var_838_0 > arg_835_1.duration_ then
						arg_835_1.duration_ = var_838_7 + var_838_0
					end
				end

				arg_835_1.text_.text = var_838_4
				arg_835_1.typewritter.percent = 0

				arg_835_1.typewritter:SetDirty()
				arg_835_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906200", "story_v_side_new_1101906.awb") ~= 0 then
					local var_838_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906200", "story_v_side_new_1101906.awb") / 1000

					if var_838_8 + var_838_0 > arg_835_1.duration_ then
						arg_835_1.duration_ = var_838_8 + var_838_0
					end

					if var_838_3.prefab_name ~= "" and arg_835_1.actors_[var_838_3.prefab_name] ~= nil then
						local var_838_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_835_1.actors_[var_838_3.prefab_name].transform, "story_v_side_new_1101906", "1101906200", "story_v_side_new_1101906.awb")

						arg_835_1:RecordAudio("1101906200", var_838_9)
						arg_835_1:RecordAudio("1101906200", var_838_9)
					else
						arg_835_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906200", "story_v_side_new_1101906.awb")
					end

					arg_835_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906200", "story_v_side_new_1101906.awb")
				end

				arg_835_1:RecordContent(arg_835_1.text_.text)
			end

			local var_838_10 = math.max(var_838_1, arg_835_1.talkMaxDuration)

			if var_838_0 <= arg_835_1.time_ and arg_835_1.time_ < var_838_0 + var_838_10 then
				arg_835_1.typewritter.percent = (arg_835_1.time_ - var_838_0) / var_838_10

				arg_835_1.typewritter:SetDirty()
			end

			if arg_835_1.time_ >= var_838_0 + var_838_10 and arg_835_1.time_ < var_838_0 + var_838_10 + arg_838_0 then
				arg_835_1.typewritter.percent = 1

				arg_835_1.typewritter:SetDirty()
				arg_835_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906201 = function(arg_839_0, arg_839_1)
		arg_839_1.time_ = 0
		arg_839_1.frameCnt_ = 0
		arg_839_1.state_ = "playing"
		arg_839_1.curTalkId_ = 1101906201
		arg_839_1.duration_ = 6.666

		SetActive(arg_839_1.tipsGo_, false)

		function arg_839_1.onSingleLineFinish_()
			arg_839_1.onSingleLineUpdate_ = nil
			arg_839_1.onSingleLineFinish_ = nil
			arg_839_1.state_ = "waiting"
		end

		function arg_839_1.playNext_(arg_841_0)
			if arg_841_0 == 1 then
				arg_839_0:Play1101906202(arg_839_1)
			end
		end

		function arg_839_1.onSingleLineUpdate_(arg_842_0)
			local var_842_0 = 0
			local var_842_1 = 0.7

			if var_842_0 < arg_839_1.time_ and arg_839_1.time_ <= var_842_0 + arg_842_0 then
				arg_839_1.talkMaxDuration = 0
				arg_839_1.dialogCg_.alpha = 1

				arg_839_1.dialog_:SetActive(true)
				SetActive(arg_839_1.leftNameGo_, true)

				local var_842_2 = arg_839_1:FormatText(StoryNameCfg[13].name)

				arg_839_1.leftNameTxt_.text = var_842_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_839_1.leftNameTxt_.transform)

				arg_839_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_839_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_839_1:RecordName(arg_839_1.leftNameTxt_.text)
				SetActive(arg_839_1.iconTrs_.gameObject, false)
				arg_839_1.callingController_:SetSelectedState("normal")

				local var_842_3 = arg_839_1:GetWordFromCfg(1101906201)
				local var_842_4 = arg_839_1:FormatText(var_842_3.content)

				arg_839_1.text_.text = var_842_4

				LuaForUtil.ClearLinePrefixSymbol(arg_839_1.text_)

				local var_842_5 = 28
				local var_842_6 = utf8.len(var_842_4)
				local var_842_7 = var_842_5 <= 0 and var_842_1 or var_842_1 * (var_842_6 / var_842_5)

				if var_842_7 > 0 and var_842_1 < var_842_7 then
					arg_839_1.talkMaxDuration = var_842_7

					if var_842_7 + var_842_0 > arg_839_1.duration_ then
						arg_839_1.duration_ = var_842_7 + var_842_0
					end
				end

				arg_839_1.text_.text = var_842_4
				arg_839_1.typewritter.percent = 0

				arg_839_1.typewritter:SetDirty()
				arg_839_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906201", "story_v_side_new_1101906.awb") ~= 0 then
					local var_842_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906201", "story_v_side_new_1101906.awb") / 1000

					if var_842_8 + var_842_0 > arg_839_1.duration_ then
						arg_839_1.duration_ = var_842_8 + var_842_0
					end

					if var_842_3.prefab_name ~= "" and arg_839_1.actors_[var_842_3.prefab_name] ~= nil then
						local var_842_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_839_1.actors_[var_842_3.prefab_name].transform, "story_v_side_new_1101906", "1101906201", "story_v_side_new_1101906.awb")

						arg_839_1:RecordAudio("1101906201", var_842_9)
						arg_839_1:RecordAudio("1101906201", var_842_9)
					else
						arg_839_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906201", "story_v_side_new_1101906.awb")
					end

					arg_839_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906201", "story_v_side_new_1101906.awb")
				end

				arg_839_1:RecordContent(arg_839_1.text_.text)
			end

			local var_842_10 = math.max(var_842_1, arg_839_1.talkMaxDuration)

			if var_842_0 <= arg_839_1.time_ and arg_839_1.time_ < var_842_0 + var_842_10 then
				arg_839_1.typewritter.percent = (arg_839_1.time_ - var_842_0) / var_842_10

				arg_839_1.typewritter:SetDirty()
			end

			if arg_839_1.time_ >= var_842_0 + var_842_10 and arg_839_1.time_ < var_842_0 + var_842_10 + arg_842_0 then
				arg_839_1.typewritter.percent = 1

				arg_839_1.typewritter:SetDirty()
				arg_839_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906202 = function(arg_843_0, arg_843_1)
		arg_843_1.time_ = 0
		arg_843_1.frameCnt_ = 0
		arg_843_1.state_ = "playing"
		arg_843_1.curTalkId_ = 1101906202
		arg_843_1.duration_ = 8.1

		SetActive(arg_843_1.tipsGo_, false)

		function arg_843_1.onSingleLineFinish_()
			arg_843_1.onSingleLineUpdate_ = nil
			arg_843_1.onSingleLineFinish_ = nil
			arg_843_1.state_ = "waiting"
		end

		function arg_843_1.playNext_(arg_845_0)
			if arg_845_0 == 1 then
				arg_843_0:Play1101906203(arg_843_1)
			end
		end

		function arg_843_1.onSingleLineUpdate_(arg_846_0)
			local var_846_0 = 2

			if var_846_0 < arg_843_1.time_ and arg_843_1.time_ <= var_846_0 + arg_846_0 then
				local var_846_1 = manager.ui.mainCamera.transform.localPosition
				local var_846_2 = Vector3.New(0, 0, 10) + Vector3.New(var_846_1.x, var_846_1.y, 0)
				local var_846_3 = arg_843_1.bgs_.ST02

				var_846_3.transform.localPosition = var_846_2
				var_846_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_846_4 = var_846_3:GetComponent("SpriteRenderer")

				if var_846_4 and var_846_4.sprite then
					local var_846_5 = (var_846_3.transform.localPosition - var_846_1).z
					local var_846_6 = manager.ui.mainCameraCom_
					local var_846_7 = 2 * var_846_5 * Mathf.Tan(var_846_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_846_8 = var_846_7 * var_846_6.aspect
					local var_846_9 = var_846_4.sprite.bounds.size.x
					local var_846_10 = var_846_4.sprite.bounds.size.y
					local var_846_11 = var_846_8 / var_846_9
					local var_846_12 = var_846_7 / var_846_10
					local var_846_13 = var_846_12 < var_846_11 and var_846_11 or var_846_12

					var_846_3.transform.localScale = Vector3.New(var_846_13, var_846_13, 0)
				end

				for iter_846_0, iter_846_1 in pairs(arg_843_1.bgs_) do
					if iter_846_0 ~= "ST02" then
						iter_846_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_846_14 = 0

			if var_846_14 < arg_843_1.time_ and arg_843_1.time_ <= var_846_14 + arg_846_0 then
				arg_843_1.mask_.enabled = true
				arg_843_1.mask_.raycastTarget = true

				arg_843_1:SetGaussion(false)
			end

			local var_846_15 = 2

			if var_846_14 <= arg_843_1.time_ and arg_843_1.time_ < var_846_14 + var_846_15 then
				local var_846_16 = (arg_843_1.time_ - var_846_14) / var_846_15
				local var_846_17 = Color.New(0, 0, 0)

				var_846_17.a = Mathf.Lerp(0, 1, var_846_16)
				arg_843_1.mask_.color = var_846_17
			end

			if arg_843_1.time_ >= var_846_14 + var_846_15 and arg_843_1.time_ < var_846_14 + var_846_15 + arg_846_0 then
				local var_846_18 = Color.New(0, 0, 0)

				var_846_18.a = 1
				arg_843_1.mask_.color = var_846_18
			end

			local var_846_19 = 2

			if var_846_19 < arg_843_1.time_ and arg_843_1.time_ <= var_846_19 + arg_846_0 then
				arg_843_1.mask_.enabled = true
				arg_843_1.mask_.raycastTarget = true

				arg_843_1:SetGaussion(false)
			end

			local var_846_20 = 2

			if var_846_19 <= arg_843_1.time_ and arg_843_1.time_ < var_846_19 + var_846_20 then
				local var_846_21 = (arg_843_1.time_ - var_846_19) / var_846_20
				local var_846_22 = Color.New(0, 0, 0)

				var_846_22.a = Mathf.Lerp(1, 0, var_846_21)
				arg_843_1.mask_.color = var_846_22
			end

			if arg_843_1.time_ >= var_846_19 + var_846_20 and arg_843_1.time_ < var_846_19 + var_846_20 + arg_846_0 then
				local var_846_23 = Color.New(0, 0, 0)
				local var_846_24 = 0

				arg_843_1.mask_.enabled = false
				var_846_23.a = var_846_24
				arg_843_1.mask_.color = var_846_23
			end

			local var_846_25 = arg_843_1.actors_["1029ui_story"].transform
			local var_846_26 = 2

			if var_846_26 < arg_843_1.time_ and arg_843_1.time_ <= var_846_26 + arg_846_0 then
				arg_843_1.var_.moveOldPos1029ui_story = var_846_25.localPosition
			end

			local var_846_27 = 0.001

			if var_846_26 <= arg_843_1.time_ and arg_843_1.time_ < var_846_26 + var_846_27 then
				local var_846_28 = (arg_843_1.time_ - var_846_26) / var_846_27
				local var_846_29 = Vector3.New(0.7, -1.09, -6.2)

				var_846_25.localPosition = Vector3.Lerp(arg_843_1.var_.moveOldPos1029ui_story, var_846_29, var_846_28)

				local var_846_30 = manager.ui.mainCamera.transform.position - var_846_25.position

				var_846_25.forward = Vector3.New(var_846_30.x, var_846_30.y, var_846_30.z)

				local var_846_31 = var_846_25.localEulerAngles

				var_846_31.z = 0
				var_846_31.x = 0
				var_846_25.localEulerAngles = var_846_31
			end

			if arg_843_1.time_ >= var_846_26 + var_846_27 and arg_843_1.time_ < var_846_26 + var_846_27 + arg_846_0 then
				var_846_25.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_846_32 = manager.ui.mainCamera.transform.position - var_846_25.position

				var_846_25.forward = Vector3.New(var_846_32.x, var_846_32.y, var_846_32.z)

				local var_846_33 = var_846_25.localEulerAngles

				var_846_33.z = 0
				var_846_33.x = 0
				var_846_25.localEulerAngles = var_846_33
			end

			local var_846_34 = arg_843_1.actors_["1029ui_story"]
			local var_846_35 = 2

			if var_846_35 < arg_843_1.time_ and arg_843_1.time_ <= var_846_35 + arg_846_0 and arg_843_1.var_.characterEffect1029ui_story == nil then
				arg_843_1.var_.characterEffect1029ui_story = var_846_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_846_36 = 0.200000002980232

			if var_846_35 <= arg_843_1.time_ and arg_843_1.time_ < var_846_35 + var_846_36 then
				local var_846_37 = (arg_843_1.time_ - var_846_35) / var_846_36

				if arg_843_1.var_.characterEffect1029ui_story then
					local var_846_38 = Mathf.Lerp(0, 0.5, var_846_37)

					arg_843_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_843_1.var_.characterEffect1029ui_story.fillRatio = var_846_38
				end
			end

			if arg_843_1.time_ >= var_846_35 + var_846_36 and arg_843_1.time_ < var_846_35 + var_846_36 + arg_846_0 and arg_843_1.var_.characterEffect1029ui_story then
				local var_846_39 = 0.5

				arg_843_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_843_1.var_.characterEffect1029ui_story.fillRatio = var_846_39
			end

			local var_846_40 = arg_843_1.actors_["1019ui_story"].transform
			local var_846_41 = 2

			if var_846_41 < arg_843_1.time_ and arg_843_1.time_ <= var_846_41 + arg_846_0 then
				arg_843_1.var_.moveOldPos1019ui_story = var_846_40.localPosition
			end

			local var_846_42 = 0.001

			if var_846_41 <= arg_843_1.time_ and arg_843_1.time_ < var_846_41 + var_846_42 then
				local var_846_43 = (arg_843_1.time_ - var_846_41) / var_846_42
				local var_846_44 = Vector3.New(-0.7, -1.08, -5.9)

				var_846_40.localPosition = Vector3.Lerp(arg_843_1.var_.moveOldPos1019ui_story, var_846_44, var_846_43)

				local var_846_45 = manager.ui.mainCamera.transform.position - var_846_40.position

				var_846_40.forward = Vector3.New(var_846_45.x, var_846_45.y, var_846_45.z)

				local var_846_46 = var_846_40.localEulerAngles

				var_846_46.z = 0
				var_846_46.x = 0
				var_846_40.localEulerAngles = var_846_46
			end

			if arg_843_1.time_ >= var_846_41 + var_846_42 and arg_843_1.time_ < var_846_41 + var_846_42 + arg_846_0 then
				var_846_40.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_846_47 = manager.ui.mainCamera.transform.position - var_846_40.position

				var_846_40.forward = Vector3.New(var_846_47.x, var_846_47.y, var_846_47.z)

				local var_846_48 = var_846_40.localEulerAngles

				var_846_48.z = 0
				var_846_48.x = 0
				var_846_40.localEulerAngles = var_846_48
			end

			local var_846_49 = arg_843_1.actors_["1019ui_story"]
			local var_846_50 = 2

			if var_846_50 < arg_843_1.time_ and arg_843_1.time_ <= var_846_50 + arg_846_0 and arg_843_1.var_.characterEffect1019ui_story == nil then
				arg_843_1.var_.characterEffect1019ui_story = var_846_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_846_51 = 0.200000002980232

			if var_846_50 <= arg_843_1.time_ and arg_843_1.time_ < var_846_50 + var_846_51 then
				local var_846_52 = (arg_843_1.time_ - var_846_50) / var_846_51

				if arg_843_1.var_.characterEffect1019ui_story then
					arg_843_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_843_1.time_ >= var_846_50 + var_846_51 and arg_843_1.time_ < var_846_50 + var_846_51 + arg_846_0 and arg_843_1.var_.characterEffect1019ui_story then
				arg_843_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_846_53 = 2

			if var_846_53 < arg_843_1.time_ and arg_843_1.time_ <= var_846_53 + arg_846_0 then
				arg_843_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_846_54 = 2

			if var_846_54 < arg_843_1.time_ and arg_843_1.time_ <= var_846_54 + arg_846_0 then
				arg_843_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_846_55 = 2

			if var_846_55 < arg_843_1.time_ and arg_843_1.time_ <= var_846_55 + arg_846_0 then
				arg_843_1.screenFilterGo_:SetActive(true)

				arg_843_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_846_56 = 0.0166666666666667

			if var_846_55 <= arg_843_1.time_ and arg_843_1.time_ < var_846_55 + var_846_56 then
				local var_846_57 = (arg_843_1.time_ - var_846_55) / var_846_56

				arg_843_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_846_57)
			end

			if arg_843_1.time_ >= var_846_55 + var_846_56 and arg_843_1.time_ < var_846_55 + var_846_56 + arg_846_0 then
				arg_843_1.screenFilterEffect_.weight = 1
			end

			if arg_843_1.frameCnt_ <= 1 then
				arg_843_1.dialog_:SetActive(false)
			end

			local var_846_58 = 4
			local var_846_59 = 0.125

			if var_846_58 < arg_843_1.time_ and arg_843_1.time_ <= var_846_58 + arg_846_0 then
				arg_843_1.talkMaxDuration = 0

				arg_843_1.dialog_:SetActive(true)

				local var_846_60 = LeanTween.value(arg_843_1.dialog_, 0, 1, 0.3)

				var_846_60:setOnUpdate(LuaHelper.FloatAction(function(arg_847_0)
					arg_843_1.dialogCg_.alpha = arg_847_0
				end))
				var_846_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_843_1.dialog_)
					var_846_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_843_1.duration_ = arg_843_1.duration_ + 0.3

				SetActive(arg_843_1.leftNameGo_, true)

				local var_846_61 = arg_843_1:FormatText(StoryNameCfg[13].name)

				arg_843_1.leftNameTxt_.text = var_846_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_843_1.leftNameTxt_.transform)

				arg_843_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_843_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_843_1:RecordName(arg_843_1.leftNameTxt_.text)
				SetActive(arg_843_1.iconTrs_.gameObject, false)
				arg_843_1.callingController_:SetSelectedState("normal")

				local var_846_62 = arg_843_1:GetWordFromCfg(1101906202)
				local var_846_63 = arg_843_1:FormatText(var_846_62.content)

				arg_843_1.text_.text = var_846_63

				LuaForUtil.ClearLinePrefixSymbol(arg_843_1.text_)

				local var_846_64 = 5
				local var_846_65 = utf8.len(var_846_63)
				local var_846_66 = var_846_64 <= 0 and var_846_59 or var_846_59 * (var_846_65 / var_846_64)

				if var_846_66 > 0 and var_846_59 < var_846_66 then
					arg_843_1.talkMaxDuration = var_846_66
					var_846_58 = var_846_58 + 0.3

					if var_846_66 + var_846_58 > arg_843_1.duration_ then
						arg_843_1.duration_ = var_846_66 + var_846_58
					end
				end

				arg_843_1.text_.text = var_846_63
				arg_843_1.typewritter.percent = 0

				arg_843_1.typewritter:SetDirty()
				arg_843_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906202", "story_v_side_new_1101906.awb") ~= 0 then
					local var_846_67 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906202", "story_v_side_new_1101906.awb") / 1000

					if var_846_67 + var_846_58 > arg_843_1.duration_ then
						arg_843_1.duration_ = var_846_67 + var_846_58
					end

					if var_846_62.prefab_name ~= "" and arg_843_1.actors_[var_846_62.prefab_name] ~= nil then
						local var_846_68 = LuaForUtil.PlayVoiceWithCriLipsync(arg_843_1.actors_[var_846_62.prefab_name].transform, "story_v_side_new_1101906", "1101906202", "story_v_side_new_1101906.awb")

						arg_843_1:RecordAudio("1101906202", var_846_68)
						arg_843_1:RecordAudio("1101906202", var_846_68)
					else
						arg_843_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906202", "story_v_side_new_1101906.awb")
					end

					arg_843_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906202", "story_v_side_new_1101906.awb")
				end

				arg_843_1:RecordContent(arg_843_1.text_.text)
			end

			local var_846_69 = var_846_58 + 0.3
			local var_846_70 = math.max(var_846_59, arg_843_1.talkMaxDuration)

			if var_846_69 <= arg_843_1.time_ and arg_843_1.time_ < var_846_69 + var_846_70 then
				arg_843_1.typewritter.percent = (arg_843_1.time_ - var_846_69) / var_846_70

				arg_843_1.typewritter:SetDirty()
			end

			if arg_843_1.time_ >= var_846_69 + var_846_70 and arg_843_1.time_ < var_846_69 + var_846_70 + arg_846_0 then
				arg_843_1.typewritter.percent = 1

				arg_843_1.typewritter:SetDirty()
				arg_843_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906203 = function(arg_849_0, arg_849_1)
		arg_849_1.time_ = 0
		arg_849_1.frameCnt_ = 0
		arg_849_1.state_ = "playing"
		arg_849_1.curTalkId_ = 1101906203
		arg_849_1.duration_ = 9

		SetActive(arg_849_1.tipsGo_, false)

		function arg_849_1.onSingleLineFinish_()
			arg_849_1.onSingleLineUpdate_ = nil
			arg_849_1.onSingleLineFinish_ = nil
			arg_849_1.state_ = "waiting"
		end

		function arg_849_1.playNext_(arg_851_0)
			if arg_851_0 == 1 then
				arg_849_0:Play1101906204(arg_849_1)
			end
		end

		function arg_849_1.onSingleLineUpdate_(arg_852_0)
			local var_852_0 = 2

			if var_852_0 < arg_849_1.time_ and arg_849_1.time_ <= var_852_0 + arg_852_0 then
				local var_852_1 = manager.ui.mainCamera.transform.localPosition
				local var_852_2 = Vector3.New(0, 0, 10) + Vector3.New(var_852_1.x, var_852_1.y, 0)
				local var_852_3 = arg_849_1.bgs_.ST12

				var_852_3.transform.localPosition = var_852_2
				var_852_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_852_4 = var_852_3:GetComponent("SpriteRenderer")

				if var_852_4 and var_852_4.sprite then
					local var_852_5 = (var_852_3.transform.localPosition - var_852_1).z
					local var_852_6 = manager.ui.mainCameraCom_
					local var_852_7 = 2 * var_852_5 * Mathf.Tan(var_852_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_852_8 = var_852_7 * var_852_6.aspect
					local var_852_9 = var_852_4.sprite.bounds.size.x
					local var_852_10 = var_852_4.sprite.bounds.size.y
					local var_852_11 = var_852_8 / var_852_9
					local var_852_12 = var_852_7 / var_852_10
					local var_852_13 = var_852_12 < var_852_11 and var_852_11 or var_852_12

					var_852_3.transform.localScale = Vector3.New(var_852_13, var_852_13, 0)
				end

				for iter_852_0, iter_852_1 in pairs(arg_849_1.bgs_) do
					if iter_852_0 ~= "ST12" then
						iter_852_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_852_14 = 0

			if var_852_14 < arg_849_1.time_ and arg_849_1.time_ <= var_852_14 + arg_852_0 then
				arg_849_1.mask_.enabled = true
				arg_849_1.mask_.raycastTarget = true

				arg_849_1:SetGaussion(false)
			end

			local var_852_15 = 2

			if var_852_14 <= arg_849_1.time_ and arg_849_1.time_ < var_852_14 + var_852_15 then
				local var_852_16 = (arg_849_1.time_ - var_852_14) / var_852_15
				local var_852_17 = Color.New(0, 0, 0)

				var_852_17.a = Mathf.Lerp(0, 1, var_852_16)
				arg_849_1.mask_.color = var_852_17
			end

			if arg_849_1.time_ >= var_852_14 + var_852_15 and arg_849_1.time_ < var_852_14 + var_852_15 + arg_852_0 then
				local var_852_18 = Color.New(0, 0, 0)

				var_852_18.a = 1
				arg_849_1.mask_.color = var_852_18
			end

			local var_852_19 = 2

			if var_852_19 < arg_849_1.time_ and arg_849_1.time_ <= var_852_19 + arg_852_0 then
				arg_849_1.mask_.enabled = true
				arg_849_1.mask_.raycastTarget = true

				arg_849_1:SetGaussion(false)
			end

			local var_852_20 = 2

			if var_852_19 <= arg_849_1.time_ and arg_849_1.time_ < var_852_19 + var_852_20 then
				local var_852_21 = (arg_849_1.time_ - var_852_19) / var_852_20
				local var_852_22 = Color.New(0, 0, 0)

				var_852_22.a = Mathf.Lerp(1, 0, var_852_21)
				arg_849_1.mask_.color = var_852_22
			end

			if arg_849_1.time_ >= var_852_19 + var_852_20 and arg_849_1.time_ < var_852_19 + var_852_20 + arg_852_0 then
				local var_852_23 = Color.New(0, 0, 0)
				local var_852_24 = 0

				arg_849_1.mask_.enabled = false
				var_852_23.a = var_852_24
				arg_849_1.mask_.color = var_852_23
			end

			local var_852_25 = arg_849_1.actors_["1019ui_story"].transform
			local var_852_26 = 2

			if var_852_26 < arg_849_1.time_ and arg_849_1.time_ <= var_852_26 + arg_852_0 then
				arg_849_1.var_.moveOldPos1019ui_story = var_852_25.localPosition
			end

			local var_852_27 = 0.001

			if var_852_26 <= arg_849_1.time_ and arg_849_1.time_ < var_852_26 + var_852_27 then
				local var_852_28 = (arg_849_1.time_ - var_852_26) / var_852_27
				local var_852_29 = Vector3.New(0, -1.08, -5.9)

				var_852_25.localPosition = Vector3.Lerp(arg_849_1.var_.moveOldPos1019ui_story, var_852_29, var_852_28)

				local var_852_30 = manager.ui.mainCamera.transform.position - var_852_25.position

				var_852_25.forward = Vector3.New(var_852_30.x, var_852_30.y, var_852_30.z)

				local var_852_31 = var_852_25.localEulerAngles

				var_852_31.z = 0
				var_852_31.x = 0
				var_852_25.localEulerAngles = var_852_31
			end

			if arg_849_1.time_ >= var_852_26 + var_852_27 and arg_849_1.time_ < var_852_26 + var_852_27 + arg_852_0 then
				var_852_25.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_852_32 = manager.ui.mainCamera.transform.position - var_852_25.position

				var_852_25.forward = Vector3.New(var_852_32.x, var_852_32.y, var_852_32.z)

				local var_852_33 = var_852_25.localEulerAngles

				var_852_33.z = 0
				var_852_33.x = 0
				var_852_25.localEulerAngles = var_852_33
			end

			local var_852_34 = arg_849_1.actors_["1019ui_story"]
			local var_852_35 = 2

			if var_852_35 < arg_849_1.time_ and arg_849_1.time_ <= var_852_35 + arg_852_0 and arg_849_1.var_.characterEffect1019ui_story == nil then
				arg_849_1.var_.characterEffect1019ui_story = var_852_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_852_36 = 0.200000002980232

			if var_852_35 <= arg_849_1.time_ and arg_849_1.time_ < var_852_35 + var_852_36 then
				local var_852_37 = (arg_849_1.time_ - var_852_35) / var_852_36

				if arg_849_1.var_.characterEffect1019ui_story then
					local var_852_38 = Mathf.Lerp(0, 0.5, var_852_37)

					arg_849_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_849_1.var_.characterEffect1019ui_story.fillRatio = var_852_38
				end
			end

			if arg_849_1.time_ >= var_852_35 + var_852_36 and arg_849_1.time_ < var_852_35 + var_852_36 + arg_852_0 and arg_849_1.var_.characterEffect1019ui_story then
				local var_852_39 = 0.5

				arg_849_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_849_1.var_.characterEffect1019ui_story.fillRatio = var_852_39
			end

			local var_852_40 = arg_849_1.actors_["1029ui_story"].transform
			local var_852_41 = 2

			if var_852_41 < arg_849_1.time_ and arg_849_1.time_ <= var_852_41 + arg_852_0 then
				arg_849_1.var_.moveOldPos1029ui_story = var_852_40.localPosition
			end

			local var_852_42 = 0.001

			if var_852_41 <= arg_849_1.time_ and arg_849_1.time_ < var_852_41 + var_852_42 then
				local var_852_43 = (arg_849_1.time_ - var_852_41) / var_852_42
				local var_852_44 = Vector3.New(0, 100, 0)

				var_852_40.localPosition = Vector3.Lerp(arg_849_1.var_.moveOldPos1029ui_story, var_852_44, var_852_43)

				local var_852_45 = manager.ui.mainCamera.transform.position - var_852_40.position

				var_852_40.forward = Vector3.New(var_852_45.x, var_852_45.y, var_852_45.z)

				local var_852_46 = var_852_40.localEulerAngles

				var_852_46.z = 0
				var_852_46.x = 0
				var_852_40.localEulerAngles = var_852_46
			end

			if arg_849_1.time_ >= var_852_41 + var_852_42 and arg_849_1.time_ < var_852_41 + var_852_42 + arg_852_0 then
				var_852_40.localPosition = Vector3.New(0, 100, 0)

				local var_852_47 = manager.ui.mainCamera.transform.position - var_852_40.position

				var_852_40.forward = Vector3.New(var_852_47.x, var_852_47.y, var_852_47.z)

				local var_852_48 = var_852_40.localEulerAngles

				var_852_48.z = 0
				var_852_48.x = 0
				var_852_40.localEulerAngles = var_852_48
			end

			local var_852_49 = arg_849_1.actors_["1029ui_story"]
			local var_852_50 = 2

			if var_852_50 < arg_849_1.time_ and arg_849_1.time_ <= var_852_50 + arg_852_0 and arg_849_1.var_.characterEffect1029ui_story == nil then
				arg_849_1.var_.characterEffect1029ui_story = var_852_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_852_51 = 0.200000002980232

			if var_852_50 <= arg_849_1.time_ and arg_849_1.time_ < var_852_50 + var_852_51 then
				local var_852_52 = (arg_849_1.time_ - var_852_50) / var_852_51

				if arg_849_1.var_.characterEffect1029ui_story then
					local var_852_53 = Mathf.Lerp(0, 0.5, var_852_52)

					arg_849_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_849_1.var_.characterEffect1029ui_story.fillRatio = var_852_53
				end
			end

			if arg_849_1.time_ >= var_852_50 + var_852_51 and arg_849_1.time_ < var_852_50 + var_852_51 + arg_852_0 and arg_849_1.var_.characterEffect1029ui_story then
				local var_852_54 = 0.5

				arg_849_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_849_1.var_.characterEffect1029ui_story.fillRatio = var_852_54
			end

			local var_852_55 = 2

			if var_852_55 < arg_849_1.time_ and arg_849_1.time_ <= var_852_55 + arg_852_0 then
				arg_849_1.screenFilterGo_:SetActive(false)
			end

			local var_852_56 = 0.0166666666666667

			if var_852_55 <= arg_849_1.time_ and arg_849_1.time_ < var_852_55 + var_852_56 then
				local var_852_57 = (arg_849_1.time_ - var_852_55) / var_852_56

				arg_849_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_852_57)
			end

			if arg_849_1.time_ >= var_852_55 + var_852_56 and arg_849_1.time_ < var_852_55 + var_852_56 + arg_852_0 then
				arg_849_1.screenFilterEffect_.weight = 0
			end

			if arg_849_1.frameCnt_ <= 1 then
				arg_849_1.dialog_:SetActive(false)
			end

			local var_852_58 = 4
			local var_852_59 = 0.7

			if var_852_58 < arg_849_1.time_ and arg_849_1.time_ <= var_852_58 + arg_852_0 then
				arg_849_1.talkMaxDuration = 0

				arg_849_1.dialog_:SetActive(true)

				local var_852_60 = LeanTween.value(arg_849_1.dialog_, 0, 1, 0.3)

				var_852_60:setOnUpdate(LuaHelper.FloatAction(function(arg_853_0)
					arg_849_1.dialogCg_.alpha = arg_853_0
				end))
				var_852_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_849_1.dialog_)
					var_852_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_849_1.duration_ = arg_849_1.duration_ + 0.3

				SetActive(arg_849_1.leftNameGo_, true)

				local var_852_61 = arg_849_1:FormatText(StoryNameCfg[7].name)

				arg_849_1.leftNameTxt_.text = var_852_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_849_1.leftNameTxt_.transform)

				arg_849_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_849_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_849_1:RecordName(arg_849_1.leftNameTxt_.text)
				SetActive(arg_849_1.iconTrs_.gameObject, false)
				arg_849_1.callingController_:SetSelectedState("normal")

				local var_852_62 = arg_849_1:GetWordFromCfg(1101906203)
				local var_852_63 = arg_849_1:FormatText(var_852_62.content)

				arg_849_1.text_.text = var_852_63

				LuaForUtil.ClearLinePrefixSymbol(arg_849_1.text_)

				local var_852_64 = 28
				local var_852_65 = utf8.len(var_852_63)
				local var_852_66 = var_852_64 <= 0 and var_852_59 or var_852_59 * (var_852_65 / var_852_64)

				if var_852_66 > 0 and var_852_59 < var_852_66 then
					arg_849_1.talkMaxDuration = var_852_66
					var_852_58 = var_852_58 + 0.3

					if var_852_66 + var_852_58 > arg_849_1.duration_ then
						arg_849_1.duration_ = var_852_66 + var_852_58
					end
				end

				arg_849_1.text_.text = var_852_63
				arg_849_1.typewritter.percent = 0

				arg_849_1.typewritter:SetDirty()
				arg_849_1:ShowNextGo(false)
				arg_849_1:RecordContent(arg_849_1.text_.text)
			end

			local var_852_67 = var_852_58 + 0.3
			local var_852_68 = math.max(var_852_59, arg_849_1.talkMaxDuration)

			if var_852_67 <= arg_849_1.time_ and arg_849_1.time_ < var_852_67 + var_852_68 then
				arg_849_1.typewritter.percent = (arg_849_1.time_ - var_852_67) / var_852_68

				arg_849_1.typewritter:SetDirty()
			end

			if arg_849_1.time_ >= var_852_67 + var_852_68 and arg_849_1.time_ < var_852_67 + var_852_68 + arg_852_0 then
				arg_849_1.typewritter.percent = 1

				arg_849_1.typewritter:SetDirty()
				arg_849_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906204 = function(arg_855_0, arg_855_1)
		arg_855_1.time_ = 0
		arg_855_1.frameCnt_ = 0
		arg_855_1.state_ = "playing"
		arg_855_1.curTalkId_ = 1101906204
		arg_855_1.duration_ = 9.266

		SetActive(arg_855_1.tipsGo_, false)

		function arg_855_1.onSingleLineFinish_()
			arg_855_1.onSingleLineUpdate_ = nil
			arg_855_1.onSingleLineFinish_ = nil
			arg_855_1.state_ = "waiting"
		end

		function arg_855_1.playNext_(arg_857_0)
			if arg_857_0 == 1 then
				arg_855_0:Play1101906205(arg_855_1)
			end
		end

		function arg_855_1.onSingleLineUpdate_(arg_858_0)
			local var_858_0 = arg_855_1.actors_["1019ui_story"]
			local var_858_1 = 0

			if var_858_1 < arg_855_1.time_ and arg_855_1.time_ <= var_858_1 + arg_858_0 and arg_855_1.var_.characterEffect1019ui_story == nil then
				arg_855_1.var_.characterEffect1019ui_story = var_858_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_858_2 = 0.200000002980232

			if var_858_1 <= arg_855_1.time_ and arg_855_1.time_ < var_858_1 + var_858_2 then
				local var_858_3 = (arg_855_1.time_ - var_858_1) / var_858_2

				if arg_855_1.var_.characterEffect1019ui_story then
					arg_855_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_855_1.time_ >= var_858_1 + var_858_2 and arg_855_1.time_ < var_858_1 + var_858_2 + arg_858_0 and arg_855_1.var_.characterEffect1019ui_story then
				arg_855_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_858_4 = 0
			local var_858_5 = 1.025

			if var_858_4 < arg_855_1.time_ and arg_855_1.time_ <= var_858_4 + arg_858_0 then
				arg_855_1.talkMaxDuration = 0
				arg_855_1.dialogCg_.alpha = 1

				arg_855_1.dialog_:SetActive(true)
				SetActive(arg_855_1.leftNameGo_, true)

				local var_858_6 = arg_855_1:FormatText(StoryNameCfg[13].name)

				arg_855_1.leftNameTxt_.text = var_858_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_855_1.leftNameTxt_.transform)

				arg_855_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_855_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_855_1:RecordName(arg_855_1.leftNameTxt_.text)
				SetActive(arg_855_1.iconTrs_.gameObject, false)
				arg_855_1.callingController_:SetSelectedState("normal")

				local var_858_7 = arg_855_1:GetWordFromCfg(1101906204)
				local var_858_8 = arg_855_1:FormatText(var_858_7.content)

				arg_855_1.text_.text = var_858_8

				LuaForUtil.ClearLinePrefixSymbol(arg_855_1.text_)

				local var_858_9 = 41
				local var_858_10 = utf8.len(var_858_8)
				local var_858_11 = var_858_9 <= 0 and var_858_5 or var_858_5 * (var_858_10 / var_858_9)

				if var_858_11 > 0 and var_858_5 < var_858_11 then
					arg_855_1.talkMaxDuration = var_858_11

					if var_858_11 + var_858_4 > arg_855_1.duration_ then
						arg_855_1.duration_ = var_858_11 + var_858_4
					end
				end

				arg_855_1.text_.text = var_858_8
				arg_855_1.typewritter.percent = 0

				arg_855_1.typewritter:SetDirty()
				arg_855_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906204", "story_v_side_new_1101906.awb") ~= 0 then
					local var_858_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906204", "story_v_side_new_1101906.awb") / 1000

					if var_858_12 + var_858_4 > arg_855_1.duration_ then
						arg_855_1.duration_ = var_858_12 + var_858_4
					end

					if var_858_7.prefab_name ~= "" and arg_855_1.actors_[var_858_7.prefab_name] ~= nil then
						local var_858_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_855_1.actors_[var_858_7.prefab_name].transform, "story_v_side_new_1101906", "1101906204", "story_v_side_new_1101906.awb")

						arg_855_1:RecordAudio("1101906204", var_858_13)
						arg_855_1:RecordAudio("1101906204", var_858_13)
					else
						arg_855_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906204", "story_v_side_new_1101906.awb")
					end

					arg_855_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906204", "story_v_side_new_1101906.awb")
				end

				arg_855_1:RecordContent(arg_855_1.text_.text)
			end

			local var_858_14 = math.max(var_858_5, arg_855_1.talkMaxDuration)

			if var_858_4 <= arg_855_1.time_ and arg_855_1.time_ < var_858_4 + var_858_14 then
				arg_855_1.typewritter.percent = (arg_855_1.time_ - var_858_4) / var_858_14

				arg_855_1.typewritter:SetDirty()
			end

			if arg_855_1.time_ >= var_858_4 + var_858_14 and arg_855_1.time_ < var_858_4 + var_858_14 + arg_858_0 then
				arg_855_1.typewritter.percent = 1

				arg_855_1.typewritter:SetDirty()
				arg_855_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906205 = function(arg_859_0, arg_859_1)
		arg_859_1.time_ = 0
		arg_859_1.frameCnt_ = 0
		arg_859_1.state_ = "playing"
		arg_859_1.curTalkId_ = 1101906205
		arg_859_1.duration_ = 4.933

		SetActive(arg_859_1.tipsGo_, false)

		function arg_859_1.onSingleLineFinish_()
			arg_859_1.onSingleLineUpdate_ = nil
			arg_859_1.onSingleLineFinish_ = nil
			arg_859_1.state_ = "waiting"
		end

		function arg_859_1.playNext_(arg_861_0)
			if arg_861_0 == 1 then
				arg_859_0:Play1101906206(arg_859_1)
			end
		end

		function arg_859_1.onSingleLineUpdate_(arg_862_0)
			local var_862_0 = 0
			local var_862_1 = 0.55

			if var_862_0 < arg_859_1.time_ and arg_859_1.time_ <= var_862_0 + arg_862_0 then
				arg_859_1.talkMaxDuration = 0
				arg_859_1.dialogCg_.alpha = 1

				arg_859_1.dialog_:SetActive(true)
				SetActive(arg_859_1.leftNameGo_, true)

				local var_862_2 = arg_859_1:FormatText(StoryNameCfg[13].name)

				arg_859_1.leftNameTxt_.text = var_862_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_859_1.leftNameTxt_.transform)

				arg_859_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_859_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_859_1:RecordName(arg_859_1.leftNameTxt_.text)
				SetActive(arg_859_1.iconTrs_.gameObject, false)
				arg_859_1.callingController_:SetSelectedState("normal")

				local var_862_3 = arg_859_1:GetWordFromCfg(1101906205)
				local var_862_4 = arg_859_1:FormatText(var_862_3.content)

				arg_859_1.text_.text = var_862_4

				LuaForUtil.ClearLinePrefixSymbol(arg_859_1.text_)

				local var_862_5 = 22
				local var_862_6 = utf8.len(var_862_4)
				local var_862_7 = var_862_5 <= 0 and var_862_1 or var_862_1 * (var_862_6 / var_862_5)

				if var_862_7 > 0 and var_862_1 < var_862_7 then
					arg_859_1.talkMaxDuration = var_862_7

					if var_862_7 + var_862_0 > arg_859_1.duration_ then
						arg_859_1.duration_ = var_862_7 + var_862_0
					end
				end

				arg_859_1.text_.text = var_862_4
				arg_859_1.typewritter.percent = 0

				arg_859_1.typewritter:SetDirty()
				arg_859_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906205", "story_v_side_new_1101906.awb") ~= 0 then
					local var_862_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906205", "story_v_side_new_1101906.awb") / 1000

					if var_862_8 + var_862_0 > arg_859_1.duration_ then
						arg_859_1.duration_ = var_862_8 + var_862_0
					end

					if var_862_3.prefab_name ~= "" and arg_859_1.actors_[var_862_3.prefab_name] ~= nil then
						local var_862_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_859_1.actors_[var_862_3.prefab_name].transform, "story_v_side_new_1101906", "1101906205", "story_v_side_new_1101906.awb")

						arg_859_1:RecordAudio("1101906205", var_862_9)
						arg_859_1:RecordAudio("1101906205", var_862_9)
					else
						arg_859_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906205", "story_v_side_new_1101906.awb")
					end

					arg_859_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906205", "story_v_side_new_1101906.awb")
				end

				arg_859_1:RecordContent(arg_859_1.text_.text)
			end

			local var_862_10 = math.max(var_862_1, arg_859_1.talkMaxDuration)

			if var_862_0 <= arg_859_1.time_ and arg_859_1.time_ < var_862_0 + var_862_10 then
				arg_859_1.typewritter.percent = (arg_859_1.time_ - var_862_0) / var_862_10

				arg_859_1.typewritter:SetDirty()
			end

			if arg_859_1.time_ >= var_862_0 + var_862_10 and arg_859_1.time_ < var_862_0 + var_862_10 + arg_862_0 then
				arg_859_1.typewritter.percent = 1

				arg_859_1.typewritter:SetDirty()
				arg_859_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906206 = function(arg_863_0, arg_863_1)
		arg_863_1.time_ = 0
		arg_863_1.frameCnt_ = 0
		arg_863_1.state_ = "playing"
		arg_863_1.curTalkId_ = 1101906206
		arg_863_1.duration_ = 5

		SetActive(arg_863_1.tipsGo_, false)

		function arg_863_1.onSingleLineFinish_()
			arg_863_1.onSingleLineUpdate_ = nil
			arg_863_1.onSingleLineFinish_ = nil
			arg_863_1.state_ = "waiting"
		end

		function arg_863_1.playNext_(arg_865_0)
			if arg_865_0 == 1 then
				arg_863_0:Play1101906207(arg_863_1)
			end
		end

		function arg_863_1.onSingleLineUpdate_(arg_866_0)
			local var_866_0 = arg_863_1.actors_["1019ui_story"]
			local var_866_1 = 0

			if var_866_1 < arg_863_1.time_ and arg_863_1.time_ <= var_866_1 + arg_866_0 and arg_863_1.var_.characterEffect1019ui_story == nil then
				arg_863_1.var_.characterEffect1019ui_story = var_866_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_866_2 = 0.200000002980232

			if var_866_1 <= arg_863_1.time_ and arg_863_1.time_ < var_866_1 + var_866_2 then
				local var_866_3 = (arg_863_1.time_ - var_866_1) / var_866_2

				if arg_863_1.var_.characterEffect1019ui_story then
					local var_866_4 = Mathf.Lerp(0, 0.5, var_866_3)

					arg_863_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_863_1.var_.characterEffect1019ui_story.fillRatio = var_866_4
				end
			end

			if arg_863_1.time_ >= var_866_1 + var_866_2 and arg_863_1.time_ < var_866_1 + var_866_2 + arg_866_0 and arg_863_1.var_.characterEffect1019ui_story then
				local var_866_5 = 0.5

				arg_863_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_863_1.var_.characterEffect1019ui_story.fillRatio = var_866_5
			end

			local var_866_6 = 0
			local var_866_7 = 0.4

			if var_866_6 < arg_863_1.time_ and arg_863_1.time_ <= var_866_6 + arg_866_0 then
				arg_863_1.talkMaxDuration = 0
				arg_863_1.dialogCg_.alpha = 1

				arg_863_1.dialog_:SetActive(true)
				SetActive(arg_863_1.leftNameGo_, false)

				arg_863_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_863_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_863_1:RecordName(arg_863_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_863_1.iconTrs_.gameObject, false)
				arg_863_1.callingController_:SetSelectedState("normal")

				local var_866_8 = arg_863_1:GetWordFromCfg(1101906206)
				local var_866_9 = arg_863_1:FormatText(var_866_8.content)

				arg_863_1.text_.text = var_866_9

				LuaForUtil.ClearLinePrefixSymbol(arg_863_1.text_)

				local var_866_10 = 16
				local var_866_11 = utf8.len(var_866_9)
				local var_866_12 = var_866_10 <= 0 and var_866_7 or var_866_7 * (var_866_11 / var_866_10)

				if var_866_12 > 0 and var_866_7 < var_866_12 then
					arg_863_1.talkMaxDuration = var_866_12

					if var_866_12 + var_866_6 > arg_863_1.duration_ then
						arg_863_1.duration_ = var_866_12 + var_866_6
					end
				end

				arg_863_1.text_.text = var_866_9
				arg_863_1.typewritter.percent = 0

				arg_863_1.typewritter:SetDirty()
				arg_863_1:ShowNextGo(false)
				arg_863_1:RecordContent(arg_863_1.text_.text)
			end

			local var_866_13 = math.max(var_866_7, arg_863_1.talkMaxDuration)

			if var_866_6 <= arg_863_1.time_ and arg_863_1.time_ < var_866_6 + var_866_13 then
				arg_863_1.typewritter.percent = (arg_863_1.time_ - var_866_6) / var_866_13

				arg_863_1.typewritter:SetDirty()
			end

			if arg_863_1.time_ >= var_866_6 + var_866_13 and arg_863_1.time_ < var_866_6 + var_866_13 + arg_866_0 then
				arg_863_1.typewritter.percent = 1

				arg_863_1.typewritter:SetDirty()
				arg_863_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906207 = function(arg_867_0, arg_867_1)
		arg_867_1.time_ = 0
		arg_867_1.frameCnt_ = 0
		arg_867_1.state_ = "playing"
		arg_867_1.curTalkId_ = 1101906207
		arg_867_1.duration_ = 1.999999999999

		SetActive(arg_867_1.tipsGo_, false)

		function arg_867_1.onSingleLineFinish_()
			arg_867_1.onSingleLineUpdate_ = nil
			arg_867_1.onSingleLineFinish_ = nil
			arg_867_1.state_ = "waiting"
		end

		function arg_867_1.playNext_(arg_869_0)
			if arg_869_0 == 1 then
				arg_867_0:Play1101906208(arg_867_1)
			end
		end

		function arg_867_1.onSingleLineUpdate_(arg_870_0)
			local var_870_0 = arg_867_1.actors_["1019ui_story"].transform
			local var_870_1 = 0

			if var_870_1 < arg_867_1.time_ and arg_867_1.time_ <= var_870_1 + arg_870_0 then
				arg_867_1.var_.moveOldPos1019ui_story = var_870_0.localPosition
			end

			local var_870_2 = 0.001

			if var_870_1 <= arg_867_1.time_ and arg_867_1.time_ < var_870_1 + var_870_2 then
				local var_870_3 = (arg_867_1.time_ - var_870_1) / var_870_2
				local var_870_4 = Vector3.New(0, -1.08, -5.9)

				var_870_0.localPosition = Vector3.Lerp(arg_867_1.var_.moveOldPos1019ui_story, var_870_4, var_870_3)

				local var_870_5 = manager.ui.mainCamera.transform.position - var_870_0.position

				var_870_0.forward = Vector3.New(var_870_5.x, var_870_5.y, var_870_5.z)

				local var_870_6 = var_870_0.localEulerAngles

				var_870_6.z = 0
				var_870_6.x = 0
				var_870_0.localEulerAngles = var_870_6
			end

			if arg_867_1.time_ >= var_870_1 + var_870_2 and arg_867_1.time_ < var_870_1 + var_870_2 + arg_870_0 then
				var_870_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_870_7 = manager.ui.mainCamera.transform.position - var_870_0.position

				var_870_0.forward = Vector3.New(var_870_7.x, var_870_7.y, var_870_7.z)

				local var_870_8 = var_870_0.localEulerAngles

				var_870_8.z = 0
				var_870_8.x = 0
				var_870_0.localEulerAngles = var_870_8
			end

			local var_870_9 = arg_867_1.actors_["1019ui_story"]
			local var_870_10 = 0

			if var_870_10 < arg_867_1.time_ and arg_867_1.time_ <= var_870_10 + arg_870_0 and arg_867_1.var_.characterEffect1019ui_story == nil then
				arg_867_1.var_.characterEffect1019ui_story = var_870_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_870_11 = 0.200000002980232

			if var_870_10 <= arg_867_1.time_ and arg_867_1.time_ < var_870_10 + var_870_11 then
				local var_870_12 = (arg_867_1.time_ - var_870_10) / var_870_11

				if arg_867_1.var_.characterEffect1019ui_story then
					arg_867_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_867_1.time_ >= var_870_10 + var_870_11 and arg_867_1.time_ < var_870_10 + var_870_11 + arg_870_0 and arg_867_1.var_.characterEffect1019ui_story then
				arg_867_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_870_13 = 0

			if var_870_13 < arg_867_1.time_ and arg_867_1.time_ <= var_870_13 + arg_870_0 then
				arg_867_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_870_14 = 0

			if var_870_14 < arg_867_1.time_ and arg_867_1.time_ <= var_870_14 + arg_870_0 then
				arg_867_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_870_15 = 0
			local var_870_16 = 0.166666666666667

			if var_870_15 < arg_867_1.time_ and arg_867_1.time_ <= var_870_15 + arg_870_0 then
				local var_870_17 = "play"
				local var_870_18 = "music"

				arg_867_1:AudioAction(var_870_17, var_870_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_870_19 = 0
			local var_870_20 = 0.125

			if var_870_19 < arg_867_1.time_ and arg_867_1.time_ <= var_870_19 + arg_870_0 then
				arg_867_1.talkMaxDuration = 0
				arg_867_1.dialogCg_.alpha = 1

				arg_867_1.dialog_:SetActive(true)
				SetActive(arg_867_1.leftNameGo_, true)

				local var_870_21 = arg_867_1:FormatText(StoryNameCfg[13].name)

				arg_867_1.leftNameTxt_.text = var_870_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_867_1.leftNameTxt_.transform)

				arg_867_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_867_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_867_1:RecordName(arg_867_1.leftNameTxt_.text)
				SetActive(arg_867_1.iconTrs_.gameObject, false)
				arg_867_1.callingController_:SetSelectedState("normal")

				local var_870_22 = arg_867_1:GetWordFromCfg(1101906207)
				local var_870_23 = arg_867_1:FormatText(var_870_22.content)

				arg_867_1.text_.text = var_870_23

				LuaForUtil.ClearLinePrefixSymbol(arg_867_1.text_)

				local var_870_24 = 5
				local var_870_25 = utf8.len(var_870_23)
				local var_870_26 = var_870_24 <= 0 and var_870_20 or var_870_20 * (var_870_25 / var_870_24)

				if var_870_26 > 0 and var_870_20 < var_870_26 then
					arg_867_1.talkMaxDuration = var_870_26

					if var_870_26 + var_870_19 > arg_867_1.duration_ then
						arg_867_1.duration_ = var_870_26 + var_870_19
					end
				end

				arg_867_1.text_.text = var_870_23
				arg_867_1.typewritter.percent = 0

				arg_867_1.typewritter:SetDirty()
				arg_867_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906207", "story_v_side_new_1101906.awb") ~= 0 then
					local var_870_27 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906207", "story_v_side_new_1101906.awb") / 1000

					if var_870_27 + var_870_19 > arg_867_1.duration_ then
						arg_867_1.duration_ = var_870_27 + var_870_19
					end

					if var_870_22.prefab_name ~= "" and arg_867_1.actors_[var_870_22.prefab_name] ~= nil then
						local var_870_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_867_1.actors_[var_870_22.prefab_name].transform, "story_v_side_new_1101906", "1101906207", "story_v_side_new_1101906.awb")

						arg_867_1:RecordAudio("1101906207", var_870_28)
						arg_867_1:RecordAudio("1101906207", var_870_28)
					else
						arg_867_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906207", "story_v_side_new_1101906.awb")
					end

					arg_867_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906207", "story_v_side_new_1101906.awb")
				end

				arg_867_1:RecordContent(arg_867_1.text_.text)
			end

			local var_870_29 = math.max(var_870_20, arg_867_1.talkMaxDuration)

			if var_870_19 <= arg_867_1.time_ and arg_867_1.time_ < var_870_19 + var_870_29 then
				arg_867_1.typewritter.percent = (arg_867_1.time_ - var_870_19) / var_870_29

				arg_867_1.typewritter:SetDirty()
			end

			if arg_867_1.time_ >= var_870_19 + var_870_29 and arg_867_1.time_ < var_870_19 + var_870_29 + arg_870_0 then
				arg_867_1.typewritter.percent = 1

				arg_867_1.typewritter:SetDirty()
				arg_867_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906208 = function(arg_871_0, arg_871_1)
		arg_871_1.time_ = 0
		arg_871_1.frameCnt_ = 0
		arg_871_1.state_ = "playing"
		arg_871_1.curTalkId_ = 1101906208
		arg_871_1.duration_ = 8.5

		SetActive(arg_871_1.tipsGo_, false)

		function arg_871_1.onSingleLineFinish_()
			arg_871_1.onSingleLineUpdate_ = nil
			arg_871_1.onSingleLineFinish_ = nil
			arg_871_1.state_ = "waiting"
		end

		function arg_871_1.playNext_(arg_873_0)
			if arg_873_0 == 1 then
				arg_871_0:Play1101906209(arg_871_1)
			end
		end

		function arg_871_1.onSingleLineUpdate_(arg_874_0)
			local var_874_0 = 2

			if var_874_0 < arg_871_1.time_ and arg_871_1.time_ <= var_874_0 + arg_874_0 then
				local var_874_1 = manager.ui.mainCamera.transform.localPosition
				local var_874_2 = Vector3.New(0, 0, 10) + Vector3.New(var_874_1.x, var_874_1.y, 0)
				local var_874_3 = arg_871_1.bgs_.A00

				var_874_3.transform.localPosition = var_874_2
				var_874_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_874_4 = var_874_3:GetComponent("SpriteRenderer")

				if var_874_4 and var_874_4.sprite then
					local var_874_5 = (var_874_3.transform.localPosition - var_874_1).z
					local var_874_6 = manager.ui.mainCameraCom_
					local var_874_7 = 2 * var_874_5 * Mathf.Tan(var_874_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_874_8 = var_874_7 * var_874_6.aspect
					local var_874_9 = var_874_4.sprite.bounds.size.x
					local var_874_10 = var_874_4.sprite.bounds.size.y
					local var_874_11 = var_874_8 / var_874_9
					local var_874_12 = var_874_7 / var_874_10
					local var_874_13 = var_874_12 < var_874_11 and var_874_11 or var_874_12

					var_874_3.transform.localScale = Vector3.New(var_874_13, var_874_13, 0)
				end

				for iter_874_0, iter_874_1 in pairs(arg_871_1.bgs_) do
					if iter_874_0 ~= "A00" then
						iter_874_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_874_14 = 0

			if var_874_14 < arg_871_1.time_ and arg_871_1.time_ <= var_874_14 + arg_874_0 then
				arg_871_1.mask_.enabled = true
				arg_871_1.mask_.raycastTarget = true

				arg_871_1:SetGaussion(false)
			end

			local var_874_15 = 2

			if var_874_14 <= arg_871_1.time_ and arg_871_1.time_ < var_874_14 + var_874_15 then
				local var_874_16 = (arg_871_1.time_ - var_874_14) / var_874_15
				local var_874_17 = Color.New(0, 0, 0)

				var_874_17.a = Mathf.Lerp(0, 1, var_874_16)
				arg_871_1.mask_.color = var_874_17
			end

			if arg_871_1.time_ >= var_874_14 + var_874_15 and arg_871_1.time_ < var_874_14 + var_874_15 + arg_874_0 then
				local var_874_18 = Color.New(0, 0, 0)

				var_874_18.a = 1
				arg_871_1.mask_.color = var_874_18
			end

			local var_874_19 = 2

			if var_874_19 < arg_871_1.time_ and arg_871_1.time_ <= var_874_19 + arg_874_0 then
				arg_871_1.mask_.enabled = true
				arg_871_1.mask_.raycastTarget = true

				arg_871_1:SetGaussion(false)
			end

			local var_874_20 = 2

			if var_874_19 <= arg_871_1.time_ and arg_871_1.time_ < var_874_19 + var_874_20 then
				local var_874_21 = (arg_871_1.time_ - var_874_19) / var_874_20
				local var_874_22 = Color.New(0, 0, 0)

				var_874_22.a = Mathf.Lerp(1, 0, var_874_21)
				arg_871_1.mask_.color = var_874_22
			end

			if arg_871_1.time_ >= var_874_19 + var_874_20 and arg_871_1.time_ < var_874_19 + var_874_20 + arg_874_0 then
				local var_874_23 = Color.New(0, 0, 0)
				local var_874_24 = 0

				arg_871_1.mask_.enabled = false
				var_874_23.a = var_874_24
				arg_871_1.mask_.color = var_874_23
			end

			local var_874_25 = 0
			local var_874_26 = 0.166666666666667

			if var_874_25 < arg_871_1.time_ and arg_871_1.time_ <= var_874_25 + arg_874_0 then
				local var_874_27 = "play"
				local var_874_28 = "music"

				arg_871_1:AudioAction(var_874_27, var_874_28, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_874_29 = 0.3
			local var_874_30 = 1

			if var_874_29 < arg_871_1.time_ and arg_871_1.time_ <= var_874_29 + arg_874_0 then
				local var_874_31 = "play"
				local var_874_32 = "music"

				arg_871_1:AudioAction(var_874_31, var_874_32, "bgm_side_daily07", "bgm_side_daily07", "bgm_side_daily07.awb")
			end

			local var_874_33 = 2

			if var_874_33 < arg_871_1.time_ and arg_871_1.time_ <= var_874_33 + arg_874_0 then
				arg_871_1.screenFilterGo_:SetActive(true)

				arg_871_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_874_34 = 0.0166666666666667

			if var_874_33 <= arg_871_1.time_ and arg_871_1.time_ < var_874_33 + var_874_34 then
				local var_874_35 = (arg_871_1.time_ - var_874_33) / var_874_34

				arg_871_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_874_35)
			end

			if arg_871_1.time_ >= var_874_33 + var_874_34 and arg_871_1.time_ < var_874_33 + var_874_34 + arg_874_0 then
				arg_871_1.screenFilterEffect_.weight = 1
			end

			if arg_871_1.frameCnt_ <= 1 then
				arg_871_1.dialog_:SetActive(false)
			end

			local var_874_36 = 4
			local var_874_37 = 0.475

			if var_874_36 < arg_871_1.time_ and arg_871_1.time_ <= var_874_36 + arg_874_0 then
				arg_871_1.talkMaxDuration = 0

				arg_871_1.dialog_:SetActive(true)

				local var_874_38 = LeanTween.value(arg_871_1.dialog_, 0, 1, 0.3)

				var_874_38:setOnUpdate(LuaHelper.FloatAction(function(arg_875_0)
					arg_871_1.dialogCg_.alpha = arg_875_0
				end))
				var_874_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_871_1.dialog_)
					var_874_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_871_1.duration_ = arg_871_1.duration_ + 0.3

				SetActive(arg_871_1.leftNameGo_, true)

				local var_874_39 = arg_871_1:FormatText(StoryNameCfg[13].name)

				arg_871_1.leftNameTxt_.text = var_874_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_871_1.leftNameTxt_.transform)

				arg_871_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_871_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_871_1:RecordName(arg_871_1.leftNameTxt_.text)
				SetActive(arg_871_1.iconTrs_.gameObject, false)
				arg_871_1.callingController_:SetSelectedState("normal")

				local var_874_40 = arg_871_1:GetWordFromCfg(1101906208)
				local var_874_41 = arg_871_1:FormatText(var_874_40.content)

				arg_871_1.text_.text = var_874_41

				LuaForUtil.ClearLinePrefixSymbol(arg_871_1.text_)

				local var_874_42 = 19
				local var_874_43 = utf8.len(var_874_41)
				local var_874_44 = var_874_42 <= 0 and var_874_37 or var_874_37 * (var_874_43 / var_874_42)

				if var_874_44 > 0 and var_874_37 < var_874_44 then
					arg_871_1.talkMaxDuration = var_874_44
					var_874_36 = var_874_36 + 0.3

					if var_874_44 + var_874_36 > arg_871_1.duration_ then
						arg_871_1.duration_ = var_874_44 + var_874_36
					end
				end

				arg_871_1.text_.text = var_874_41
				arg_871_1.typewritter.percent = 0

				arg_871_1.typewritter:SetDirty()
				arg_871_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906208", "story_v_side_new_1101906.awb") ~= 0 then
					local var_874_45 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906208", "story_v_side_new_1101906.awb") / 1000

					if var_874_45 + var_874_36 > arg_871_1.duration_ then
						arg_871_1.duration_ = var_874_45 + var_874_36
					end

					if var_874_40.prefab_name ~= "" and arg_871_1.actors_[var_874_40.prefab_name] ~= nil then
						local var_874_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_871_1.actors_[var_874_40.prefab_name].transform, "story_v_side_new_1101906", "1101906208", "story_v_side_new_1101906.awb")

						arg_871_1:RecordAudio("1101906208", var_874_46)
						arg_871_1:RecordAudio("1101906208", var_874_46)
					else
						arg_871_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906208", "story_v_side_new_1101906.awb")
					end

					arg_871_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906208", "story_v_side_new_1101906.awb")
				end

				arg_871_1:RecordContent(arg_871_1.text_.text)
			end

			local var_874_47 = var_874_36 + 0.3
			local var_874_48 = math.max(var_874_37, arg_871_1.talkMaxDuration)

			if var_874_47 <= arg_871_1.time_ and arg_871_1.time_ < var_874_47 + var_874_48 then
				arg_871_1.typewritter.percent = (arg_871_1.time_ - var_874_47) / var_874_48

				arg_871_1.typewritter:SetDirty()
			end

			if arg_871_1.time_ >= var_874_47 + var_874_48 and arg_871_1.time_ < var_874_47 + var_874_48 + arg_874_0 then
				arg_871_1.typewritter.percent = 1

				arg_871_1.typewritter:SetDirty()
				arg_871_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906209 = function(arg_877_0, arg_877_1)
		arg_877_1.time_ = 0
		arg_877_1.frameCnt_ = 0
		arg_877_1.state_ = "playing"
		arg_877_1.curTalkId_ = 1101906209
		arg_877_1.duration_ = 8.333

		SetActive(arg_877_1.tipsGo_, false)

		function arg_877_1.onSingleLineFinish_()
			arg_877_1.onSingleLineUpdate_ = nil
			arg_877_1.onSingleLineFinish_ = nil
			arg_877_1.state_ = "waiting"
		end

		function arg_877_1.playNext_(arg_879_0)
			if arg_879_0 == 1 then
				arg_877_0:Play1101906210(arg_877_1)
			end
		end

		function arg_877_1.onSingleLineUpdate_(arg_880_0)
			local var_880_0 = 0
			local var_880_1 = 0.8

			if var_880_0 < arg_877_1.time_ and arg_877_1.time_ <= var_880_0 + arg_880_0 then
				arg_877_1.talkMaxDuration = 0
				arg_877_1.dialogCg_.alpha = 1

				arg_877_1.dialog_:SetActive(true)
				SetActive(arg_877_1.leftNameGo_, true)

				local var_880_2 = arg_877_1:FormatText(StoryNameCfg[13].name)

				arg_877_1.leftNameTxt_.text = var_880_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_877_1.leftNameTxt_.transform)

				arg_877_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_877_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_877_1:RecordName(arg_877_1.leftNameTxt_.text)
				SetActive(arg_877_1.iconTrs_.gameObject, false)
				arg_877_1.callingController_:SetSelectedState("normal")

				local var_880_3 = arg_877_1:GetWordFromCfg(1101906209)
				local var_880_4 = arg_877_1:FormatText(var_880_3.content)

				arg_877_1.text_.text = var_880_4

				LuaForUtil.ClearLinePrefixSymbol(arg_877_1.text_)

				local var_880_5 = 32
				local var_880_6 = utf8.len(var_880_4)
				local var_880_7 = var_880_5 <= 0 and var_880_1 or var_880_1 * (var_880_6 / var_880_5)

				if var_880_7 > 0 and var_880_1 < var_880_7 then
					arg_877_1.talkMaxDuration = var_880_7

					if var_880_7 + var_880_0 > arg_877_1.duration_ then
						arg_877_1.duration_ = var_880_7 + var_880_0
					end
				end

				arg_877_1.text_.text = var_880_4
				arg_877_1.typewritter.percent = 0

				arg_877_1.typewritter:SetDirty()
				arg_877_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906209", "story_v_side_new_1101906.awb") ~= 0 then
					local var_880_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906209", "story_v_side_new_1101906.awb") / 1000

					if var_880_8 + var_880_0 > arg_877_1.duration_ then
						arg_877_1.duration_ = var_880_8 + var_880_0
					end

					if var_880_3.prefab_name ~= "" and arg_877_1.actors_[var_880_3.prefab_name] ~= nil then
						local var_880_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_877_1.actors_[var_880_3.prefab_name].transform, "story_v_side_new_1101906", "1101906209", "story_v_side_new_1101906.awb")

						arg_877_1:RecordAudio("1101906209", var_880_9)
						arg_877_1:RecordAudio("1101906209", var_880_9)
					else
						arg_877_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906209", "story_v_side_new_1101906.awb")
					end

					arg_877_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906209", "story_v_side_new_1101906.awb")
				end

				arg_877_1:RecordContent(arg_877_1.text_.text)
			end

			local var_880_10 = math.max(var_880_1, arg_877_1.talkMaxDuration)

			if var_880_0 <= arg_877_1.time_ and arg_877_1.time_ < var_880_0 + var_880_10 then
				arg_877_1.typewritter.percent = (arg_877_1.time_ - var_880_0) / var_880_10

				arg_877_1.typewritter:SetDirty()
			end

			if arg_877_1.time_ >= var_880_0 + var_880_10 and arg_877_1.time_ < var_880_0 + var_880_10 + arg_880_0 then
				arg_877_1.typewritter.percent = 1

				arg_877_1.typewritter:SetDirty()
				arg_877_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906210 = function(arg_881_0, arg_881_1)
		arg_881_1.time_ = 0
		arg_881_1.frameCnt_ = 0
		arg_881_1.state_ = "playing"
		arg_881_1.curTalkId_ = 1101906210
		arg_881_1.duration_ = 8.066

		SetActive(arg_881_1.tipsGo_, false)

		function arg_881_1.onSingleLineFinish_()
			arg_881_1.onSingleLineUpdate_ = nil
			arg_881_1.onSingleLineFinish_ = nil
			arg_881_1.state_ = "waiting"
		end

		function arg_881_1.playNext_(arg_883_0)
			if arg_883_0 == 1 then
				arg_881_0:Play1101906211(arg_881_1)
			end
		end

		function arg_881_1.onSingleLineUpdate_(arg_884_0)
			local var_884_0 = 0
			local var_884_1 = 0.875

			if var_884_0 < arg_881_1.time_ and arg_881_1.time_ <= var_884_0 + arg_884_0 then
				arg_881_1.talkMaxDuration = 0
				arg_881_1.dialogCg_.alpha = 1

				arg_881_1.dialog_:SetActive(true)
				SetActive(arg_881_1.leftNameGo_, true)

				local var_884_2 = arg_881_1:FormatText(StoryNameCfg[13].name)

				arg_881_1.leftNameTxt_.text = var_884_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_881_1.leftNameTxt_.transform)

				arg_881_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_881_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_881_1:RecordName(arg_881_1.leftNameTxt_.text)
				SetActive(arg_881_1.iconTrs_.gameObject, false)
				arg_881_1.callingController_:SetSelectedState("normal")

				local var_884_3 = arg_881_1:GetWordFromCfg(1101906210)
				local var_884_4 = arg_881_1:FormatText(var_884_3.content)

				arg_881_1.text_.text = var_884_4

				LuaForUtil.ClearLinePrefixSymbol(arg_881_1.text_)

				local var_884_5 = 35
				local var_884_6 = utf8.len(var_884_4)
				local var_884_7 = var_884_5 <= 0 and var_884_1 or var_884_1 * (var_884_6 / var_884_5)

				if var_884_7 > 0 and var_884_1 < var_884_7 then
					arg_881_1.talkMaxDuration = var_884_7

					if var_884_7 + var_884_0 > arg_881_1.duration_ then
						arg_881_1.duration_ = var_884_7 + var_884_0
					end
				end

				arg_881_1.text_.text = var_884_4
				arg_881_1.typewritter.percent = 0

				arg_881_1.typewritter:SetDirty()
				arg_881_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906210", "story_v_side_new_1101906.awb") ~= 0 then
					local var_884_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906210", "story_v_side_new_1101906.awb") / 1000

					if var_884_8 + var_884_0 > arg_881_1.duration_ then
						arg_881_1.duration_ = var_884_8 + var_884_0
					end

					if var_884_3.prefab_name ~= "" and arg_881_1.actors_[var_884_3.prefab_name] ~= nil then
						local var_884_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_881_1.actors_[var_884_3.prefab_name].transform, "story_v_side_new_1101906", "1101906210", "story_v_side_new_1101906.awb")

						arg_881_1:RecordAudio("1101906210", var_884_9)
						arg_881_1:RecordAudio("1101906210", var_884_9)
					else
						arg_881_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906210", "story_v_side_new_1101906.awb")
					end

					arg_881_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906210", "story_v_side_new_1101906.awb")
				end

				arg_881_1:RecordContent(arg_881_1.text_.text)
			end

			local var_884_10 = math.max(var_884_1, arg_881_1.talkMaxDuration)

			if var_884_0 <= arg_881_1.time_ and arg_881_1.time_ < var_884_0 + var_884_10 then
				arg_881_1.typewritter.percent = (arg_881_1.time_ - var_884_0) / var_884_10

				arg_881_1.typewritter:SetDirty()
			end

			if arg_881_1.time_ >= var_884_0 + var_884_10 and arg_881_1.time_ < var_884_0 + var_884_10 + arg_884_0 then
				arg_881_1.typewritter.percent = 1

				arg_881_1.typewritter:SetDirty()
				arg_881_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906211 = function(arg_885_0, arg_885_1)
		arg_885_1.time_ = 0
		arg_885_1.frameCnt_ = 0
		arg_885_1.state_ = "playing"
		arg_885_1.curTalkId_ = 1101906211
		arg_885_1.duration_ = 5.3

		SetActive(arg_885_1.tipsGo_, false)

		function arg_885_1.onSingleLineFinish_()
			arg_885_1.onSingleLineUpdate_ = nil
			arg_885_1.onSingleLineFinish_ = nil
			arg_885_1.state_ = "waiting"
		end

		function arg_885_1.playNext_(arg_887_0)
			if arg_887_0 == 1 then
				arg_885_0:Play1101906212(arg_885_1)
			end
		end

		function arg_885_1.onSingleLineUpdate_(arg_888_0)
			local var_888_0 = 0
			local var_888_1 = 0.575

			if var_888_0 < arg_885_1.time_ and arg_885_1.time_ <= var_888_0 + arg_888_0 then
				arg_885_1.talkMaxDuration = 0
				arg_885_1.dialogCg_.alpha = 1

				arg_885_1.dialog_:SetActive(true)
				SetActive(arg_885_1.leftNameGo_, true)

				local var_888_2 = arg_885_1:FormatText(StoryNameCfg[13].name)

				arg_885_1.leftNameTxt_.text = var_888_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_885_1.leftNameTxt_.transform)

				arg_885_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_885_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_885_1:RecordName(arg_885_1.leftNameTxt_.text)
				SetActive(arg_885_1.iconTrs_.gameObject, false)
				arg_885_1.callingController_:SetSelectedState("normal")

				local var_888_3 = arg_885_1:GetWordFromCfg(1101906211)
				local var_888_4 = arg_885_1:FormatText(var_888_3.content)

				arg_885_1.text_.text = var_888_4

				LuaForUtil.ClearLinePrefixSymbol(arg_885_1.text_)

				local var_888_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906211", "story_v_side_new_1101906.awb") ~= 0 then
					local var_888_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906211", "story_v_side_new_1101906.awb") / 1000

					if var_888_8 + var_888_0 > arg_885_1.duration_ then
						arg_885_1.duration_ = var_888_8 + var_888_0
					end

					if var_888_3.prefab_name ~= "" and arg_885_1.actors_[var_888_3.prefab_name] ~= nil then
						local var_888_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_885_1.actors_[var_888_3.prefab_name].transform, "story_v_side_new_1101906", "1101906211", "story_v_side_new_1101906.awb")

						arg_885_1:RecordAudio("1101906211", var_888_9)
						arg_885_1:RecordAudio("1101906211", var_888_9)
					else
						arg_885_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906211", "story_v_side_new_1101906.awb")
					end

					arg_885_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906211", "story_v_side_new_1101906.awb")
				end

				arg_885_1:RecordContent(arg_885_1.text_.text)
			end

			local var_888_10 = math.max(var_888_1, arg_885_1.talkMaxDuration)

			if var_888_0 <= arg_885_1.time_ and arg_885_1.time_ < var_888_0 + var_888_10 then
				arg_885_1.typewritter.percent = (arg_885_1.time_ - var_888_0) / var_888_10

				arg_885_1.typewritter:SetDirty()
			end

			if arg_885_1.time_ >= var_888_0 + var_888_10 and arg_885_1.time_ < var_888_0 + var_888_10 + arg_888_0 then
				arg_885_1.typewritter.percent = 1

				arg_885_1.typewritter:SetDirty()
				arg_885_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906212 = function(arg_889_0, arg_889_1)
		arg_889_1.time_ = 0
		arg_889_1.frameCnt_ = 0
		arg_889_1.state_ = "playing"
		arg_889_1.curTalkId_ = 1101906212
		arg_889_1.duration_ = 7.066

		SetActive(arg_889_1.tipsGo_, false)

		function arg_889_1.onSingleLineFinish_()
			arg_889_1.onSingleLineUpdate_ = nil
			arg_889_1.onSingleLineFinish_ = nil
			arg_889_1.state_ = "waiting"
		end

		function arg_889_1.playNext_(arg_891_0)
			if arg_891_0 == 1 then
				arg_889_0:Play1101906213(arg_889_1)
			end
		end

		function arg_889_1.onSingleLineUpdate_(arg_892_0)
			local var_892_0 = 0
			local var_892_1 = 0.7

			if var_892_0 < arg_889_1.time_ and arg_889_1.time_ <= var_892_0 + arg_892_0 then
				arg_889_1.talkMaxDuration = 0
				arg_889_1.dialogCg_.alpha = 1

				arg_889_1.dialog_:SetActive(true)
				SetActive(arg_889_1.leftNameGo_, true)

				local var_892_2 = arg_889_1:FormatText(StoryNameCfg[13].name)

				arg_889_1.leftNameTxt_.text = var_892_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_889_1.leftNameTxt_.transform)

				arg_889_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_889_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_889_1:RecordName(arg_889_1.leftNameTxt_.text)
				SetActive(arg_889_1.iconTrs_.gameObject, false)
				arg_889_1.callingController_:SetSelectedState("normal")

				local var_892_3 = arg_889_1:GetWordFromCfg(1101906212)
				local var_892_4 = arg_889_1:FormatText(var_892_3.content)

				arg_889_1.text_.text = var_892_4

				LuaForUtil.ClearLinePrefixSymbol(arg_889_1.text_)

				local var_892_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906212", "story_v_side_new_1101906.awb") ~= 0 then
					local var_892_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906212", "story_v_side_new_1101906.awb") / 1000

					if var_892_8 + var_892_0 > arg_889_1.duration_ then
						arg_889_1.duration_ = var_892_8 + var_892_0
					end

					if var_892_3.prefab_name ~= "" and arg_889_1.actors_[var_892_3.prefab_name] ~= nil then
						local var_892_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_889_1.actors_[var_892_3.prefab_name].transform, "story_v_side_new_1101906", "1101906212", "story_v_side_new_1101906.awb")

						arg_889_1:RecordAudio("1101906212", var_892_9)
						arg_889_1:RecordAudio("1101906212", var_892_9)
					else
						arg_889_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906212", "story_v_side_new_1101906.awb")
					end

					arg_889_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906212", "story_v_side_new_1101906.awb")
				end

				arg_889_1:RecordContent(arg_889_1.text_.text)
			end

			local var_892_10 = math.max(var_892_1, arg_889_1.talkMaxDuration)

			if var_892_0 <= arg_889_1.time_ and arg_889_1.time_ < var_892_0 + var_892_10 then
				arg_889_1.typewritter.percent = (arg_889_1.time_ - var_892_0) / var_892_10

				arg_889_1.typewritter:SetDirty()
			end

			if arg_889_1.time_ >= var_892_0 + var_892_10 and arg_889_1.time_ < var_892_0 + var_892_10 + arg_892_0 then
				arg_889_1.typewritter.percent = 1

				arg_889_1.typewritter:SetDirty()
				arg_889_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906213 = function(arg_893_0, arg_893_1)
		arg_893_1.time_ = 0
		arg_893_1.frameCnt_ = 0
		arg_893_1.state_ = "playing"
		arg_893_1.curTalkId_ = 1101906213
		arg_893_1.duration_ = 9

		SetActive(arg_893_1.tipsGo_, false)

		function arg_893_1.onSingleLineFinish_()
			arg_893_1.onSingleLineUpdate_ = nil
			arg_893_1.onSingleLineFinish_ = nil
			arg_893_1.state_ = "waiting"
		end

		function arg_893_1.playNext_(arg_895_0)
			if arg_895_0 == 1 then
				arg_893_0:Play1101906214(arg_893_1)
			end
		end

		function arg_893_1.onSingleLineUpdate_(arg_896_0)
			local var_896_0 = 2

			if var_896_0 < arg_893_1.time_ and arg_893_1.time_ <= var_896_0 + arg_896_0 then
				local var_896_1 = manager.ui.mainCamera.transform.localPosition
				local var_896_2 = Vector3.New(0, 0, 10) + Vector3.New(var_896_1.x, var_896_1.y, 0)
				local var_896_3 = arg_893_1.bgs_.ST12

				var_896_3.transform.localPosition = var_896_2
				var_896_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_896_4 = var_896_3:GetComponent("SpriteRenderer")

				if var_896_4 and var_896_4.sprite then
					local var_896_5 = (var_896_3.transform.localPosition - var_896_1).z
					local var_896_6 = manager.ui.mainCameraCom_
					local var_896_7 = 2 * var_896_5 * Mathf.Tan(var_896_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_896_8 = var_896_7 * var_896_6.aspect
					local var_896_9 = var_896_4.sprite.bounds.size.x
					local var_896_10 = var_896_4.sprite.bounds.size.y
					local var_896_11 = var_896_8 / var_896_9
					local var_896_12 = var_896_7 / var_896_10
					local var_896_13 = var_896_12 < var_896_11 and var_896_11 or var_896_12

					var_896_3.transform.localScale = Vector3.New(var_896_13, var_896_13, 0)
				end

				for iter_896_0, iter_896_1 in pairs(arg_893_1.bgs_) do
					if iter_896_0 ~= "ST12" then
						iter_896_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_896_14 = 0

			if var_896_14 < arg_893_1.time_ and arg_893_1.time_ <= var_896_14 + arg_896_0 then
				arg_893_1.mask_.enabled = true
				arg_893_1.mask_.raycastTarget = true

				arg_893_1:SetGaussion(false)
			end

			local var_896_15 = 2

			if var_896_14 <= arg_893_1.time_ and arg_893_1.time_ < var_896_14 + var_896_15 then
				local var_896_16 = (arg_893_1.time_ - var_896_14) / var_896_15
				local var_896_17 = Color.New(0, 0, 0)

				var_896_17.a = Mathf.Lerp(0, 1, var_896_16)
				arg_893_1.mask_.color = var_896_17
			end

			if arg_893_1.time_ >= var_896_14 + var_896_15 and arg_893_1.time_ < var_896_14 + var_896_15 + arg_896_0 then
				local var_896_18 = Color.New(0, 0, 0)

				var_896_18.a = 1
				arg_893_1.mask_.color = var_896_18
			end

			local var_896_19 = 2

			if var_896_19 < arg_893_1.time_ and arg_893_1.time_ <= var_896_19 + arg_896_0 then
				arg_893_1.mask_.enabled = true
				arg_893_1.mask_.raycastTarget = true

				arg_893_1:SetGaussion(false)
			end

			local var_896_20 = 2

			if var_896_19 <= arg_893_1.time_ and arg_893_1.time_ < var_896_19 + var_896_20 then
				local var_896_21 = (arg_893_1.time_ - var_896_19) / var_896_20
				local var_896_22 = Color.New(0, 0, 0)

				var_896_22.a = Mathf.Lerp(1, 0, var_896_21)
				arg_893_1.mask_.color = var_896_22
			end

			if arg_893_1.time_ >= var_896_19 + var_896_20 and arg_893_1.time_ < var_896_19 + var_896_20 + arg_896_0 then
				local var_896_23 = Color.New(0, 0, 0)
				local var_896_24 = 0

				arg_893_1.mask_.enabled = false
				var_896_23.a = var_896_24
				arg_893_1.mask_.color = var_896_23
			end

			local var_896_25 = 2

			if var_896_25 < arg_893_1.time_ and arg_893_1.time_ <= var_896_25 + arg_896_0 then
				arg_893_1.screenFilterGo_:SetActive(false)
			end

			local var_896_26 = 0.0166666666666667

			if var_896_25 <= arg_893_1.time_ and arg_893_1.time_ < var_896_25 + var_896_26 then
				local var_896_27 = (arg_893_1.time_ - var_896_25) / var_896_26

				arg_893_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_896_27)
			end

			if arg_893_1.time_ >= var_896_25 + var_896_26 and arg_893_1.time_ < var_896_25 + var_896_26 + arg_896_0 then
				arg_893_1.screenFilterEffect_.weight = 0
			end

			if arg_893_1.frameCnt_ <= 1 then
				arg_893_1.dialog_:SetActive(false)
			end

			local var_896_28 = 4
			local var_896_29 = 0.725

			if var_896_28 < arg_893_1.time_ and arg_893_1.time_ <= var_896_28 + arg_896_0 then
				arg_893_1.talkMaxDuration = 0

				arg_893_1.dialog_:SetActive(true)

				local var_896_30 = LeanTween.value(arg_893_1.dialog_, 0, 1, 0.3)

				var_896_30:setOnUpdate(LuaHelper.FloatAction(function(arg_897_0)
					arg_893_1.dialogCg_.alpha = arg_897_0
				end))
				var_896_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_893_1.dialog_)
					var_896_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_893_1.duration_ = arg_893_1.duration_ + 0.3

				SetActive(arg_893_1.leftNameGo_, false)

				arg_893_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_893_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_893_1:RecordName(arg_893_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_893_1.iconTrs_.gameObject, false)
				arg_893_1.callingController_:SetSelectedState("normal")

				local var_896_31 = arg_893_1:GetWordFromCfg(1101906213)
				local var_896_32 = arg_893_1:FormatText(var_896_31.content)

				arg_893_1.text_.text = var_896_32

				LuaForUtil.ClearLinePrefixSymbol(arg_893_1.text_)

				local var_896_33 = 29
				local var_896_34 = utf8.len(var_896_32)
				local var_896_35 = var_896_33 <= 0 and var_896_29 or var_896_29 * (var_896_34 / var_896_33)

				if var_896_35 > 0 and var_896_29 < var_896_35 then
					arg_893_1.talkMaxDuration = var_896_35
					var_896_28 = var_896_28 + 0.3

					if var_896_35 + var_896_28 > arg_893_1.duration_ then
						arg_893_1.duration_ = var_896_35 + var_896_28
					end
				end

				arg_893_1.text_.text = var_896_32
				arg_893_1.typewritter.percent = 0

				arg_893_1.typewritter:SetDirty()
				arg_893_1:ShowNextGo(false)
				arg_893_1:RecordContent(arg_893_1.text_.text)
			end

			local var_896_36 = var_896_28 + 0.3
			local var_896_37 = math.max(var_896_29, arg_893_1.talkMaxDuration)

			if var_896_36 <= arg_893_1.time_ and arg_893_1.time_ < var_896_36 + var_896_37 then
				arg_893_1.typewritter.percent = (arg_893_1.time_ - var_896_36) / var_896_37

				arg_893_1.typewritter:SetDirty()
			end

			if arg_893_1.time_ >= var_896_36 + var_896_37 and arg_893_1.time_ < var_896_36 + var_896_37 + arg_896_0 then
				arg_893_1.typewritter.percent = 1

				arg_893_1.typewritter:SetDirty()
				arg_893_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906214 = function(arg_899_0, arg_899_1)
		arg_899_1.time_ = 0
		arg_899_1.frameCnt_ = 0
		arg_899_1.state_ = "playing"
		arg_899_1.curTalkId_ = 1101906214
		arg_899_1.duration_ = 5

		SetActive(arg_899_1.tipsGo_, false)

		function arg_899_1.onSingleLineFinish_()
			arg_899_1.onSingleLineUpdate_ = nil
			arg_899_1.onSingleLineFinish_ = nil
			arg_899_1.state_ = "waiting"
		end

		function arg_899_1.playNext_(arg_901_0)
			if arg_901_0 == 1 then
				arg_899_0:Play1101906215(arg_899_1)
			end
		end

		function arg_899_1.onSingleLineUpdate_(arg_902_0)
			local var_902_0 = 0
			local var_902_1 = 0.475

			if var_902_0 < arg_899_1.time_ and arg_899_1.time_ <= var_902_0 + arg_902_0 then
				arg_899_1.talkMaxDuration = 0
				arg_899_1.dialogCg_.alpha = 1

				arg_899_1.dialog_:SetActive(true)
				SetActive(arg_899_1.leftNameGo_, false)

				arg_899_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_899_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_899_1:RecordName(arg_899_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_899_1.iconTrs_.gameObject, false)
				arg_899_1.callingController_:SetSelectedState("normal")

				local var_902_2 = arg_899_1:GetWordFromCfg(1101906214)
				local var_902_3 = arg_899_1:FormatText(var_902_2.content)

				arg_899_1.text_.text = var_902_3

				LuaForUtil.ClearLinePrefixSymbol(arg_899_1.text_)

				local var_902_4 = 19
				local var_902_5 = utf8.len(var_902_3)
				local var_902_6 = var_902_4 <= 0 and var_902_1 or var_902_1 * (var_902_5 / var_902_4)

				if var_902_6 > 0 and var_902_1 < var_902_6 then
					arg_899_1.talkMaxDuration = var_902_6

					if var_902_6 + var_902_0 > arg_899_1.duration_ then
						arg_899_1.duration_ = var_902_6 + var_902_0
					end
				end

				arg_899_1.text_.text = var_902_3
				arg_899_1.typewritter.percent = 0

				arg_899_1.typewritter:SetDirty()
				arg_899_1:ShowNextGo(false)
				arg_899_1:RecordContent(arg_899_1.text_.text)
			end

			local var_902_7 = math.max(var_902_1, arg_899_1.talkMaxDuration)

			if var_902_0 <= arg_899_1.time_ and arg_899_1.time_ < var_902_0 + var_902_7 then
				arg_899_1.typewritter.percent = (arg_899_1.time_ - var_902_0) / var_902_7

				arg_899_1.typewritter:SetDirty()
			end

			if arg_899_1.time_ >= var_902_0 + var_902_7 and arg_899_1.time_ < var_902_0 + var_902_7 + arg_902_0 then
				arg_899_1.typewritter.percent = 1

				arg_899_1.typewritter:SetDirty()
				arg_899_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906215 = function(arg_903_0, arg_903_1)
		arg_903_1.time_ = 0
		arg_903_1.frameCnt_ = 0
		arg_903_1.state_ = "playing"
		arg_903_1.curTalkId_ = 1101906215
		arg_903_1.duration_ = 5

		SetActive(arg_903_1.tipsGo_, false)

		function arg_903_1.onSingleLineFinish_()
			arg_903_1.onSingleLineUpdate_ = nil
			arg_903_1.onSingleLineFinish_ = nil
			arg_903_1.state_ = "waiting"
		end

		function arg_903_1.playNext_(arg_905_0)
			if arg_905_0 == 1 then
				arg_903_0:Play1101906216(arg_903_1)
			end
		end

		function arg_903_1.onSingleLineUpdate_(arg_906_0)
			local var_906_0 = 0
			local var_906_1 = 0.6

			if var_906_0 < arg_903_1.time_ and arg_903_1.time_ <= var_906_0 + arg_906_0 then
				arg_903_1.talkMaxDuration = 0
				arg_903_1.dialogCg_.alpha = 1

				arg_903_1.dialog_:SetActive(true)
				SetActive(arg_903_1.leftNameGo_, true)

				local var_906_2 = arg_903_1:FormatText(StoryNameCfg[7].name)

				arg_903_1.leftNameTxt_.text = var_906_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_903_1.leftNameTxt_.transform)

				arg_903_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_903_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_903_1:RecordName(arg_903_1.leftNameTxt_.text)
				SetActive(arg_903_1.iconTrs_.gameObject, false)
				arg_903_1.callingController_:SetSelectedState("normal")

				local var_906_3 = arg_903_1:GetWordFromCfg(1101906215)
				local var_906_4 = arg_903_1:FormatText(var_906_3.content)

				arg_903_1.text_.text = var_906_4

				LuaForUtil.ClearLinePrefixSymbol(arg_903_1.text_)

				local var_906_5 = 24
				local var_906_6 = utf8.len(var_906_4)
				local var_906_7 = var_906_5 <= 0 and var_906_1 or var_906_1 * (var_906_6 / var_906_5)

				if var_906_7 > 0 and var_906_1 < var_906_7 then
					arg_903_1.talkMaxDuration = var_906_7

					if var_906_7 + var_906_0 > arg_903_1.duration_ then
						arg_903_1.duration_ = var_906_7 + var_906_0
					end
				end

				arg_903_1.text_.text = var_906_4
				arg_903_1.typewritter.percent = 0

				arg_903_1.typewritter:SetDirty()
				arg_903_1:ShowNextGo(false)
				arg_903_1:RecordContent(arg_903_1.text_.text)
			end

			local var_906_8 = math.max(var_906_1, arg_903_1.talkMaxDuration)

			if var_906_0 <= arg_903_1.time_ and arg_903_1.time_ < var_906_0 + var_906_8 then
				arg_903_1.typewritter.percent = (arg_903_1.time_ - var_906_0) / var_906_8

				arg_903_1.typewritter:SetDirty()
			end

			if arg_903_1.time_ >= var_906_0 + var_906_8 and arg_903_1.time_ < var_906_0 + var_906_8 + arg_906_0 then
				arg_903_1.typewritter.percent = 1

				arg_903_1.typewritter:SetDirty()
				arg_903_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906216 = function(arg_907_0, arg_907_1)
		arg_907_1.time_ = 0
		arg_907_1.frameCnt_ = 0
		arg_907_1.state_ = "playing"
		arg_907_1.curTalkId_ = 1101906216
		arg_907_1.duration_ = 4.1

		SetActive(arg_907_1.tipsGo_, false)

		function arg_907_1.onSingleLineFinish_()
			arg_907_1.onSingleLineUpdate_ = nil
			arg_907_1.onSingleLineFinish_ = nil
			arg_907_1.state_ = "waiting"
		end

		function arg_907_1.playNext_(arg_909_0)
			if arg_909_0 == 1 then
				arg_907_0:Play1101906217(arg_907_1)
			end
		end

		function arg_907_1.onSingleLineUpdate_(arg_910_0)
			local var_910_0 = arg_907_1.actors_["1019ui_story"].transform
			local var_910_1 = 0

			if var_910_1 < arg_907_1.time_ and arg_907_1.time_ <= var_910_1 + arg_910_0 then
				arg_907_1.var_.moveOldPos1019ui_story = var_910_0.localPosition
			end

			local var_910_2 = 0.001

			if var_910_1 <= arg_907_1.time_ and arg_907_1.time_ < var_910_1 + var_910_2 then
				local var_910_3 = (arg_907_1.time_ - var_910_1) / var_910_2
				local var_910_4 = Vector3.New(0, -1.08, -5.9)

				var_910_0.localPosition = Vector3.Lerp(arg_907_1.var_.moveOldPos1019ui_story, var_910_4, var_910_3)

				local var_910_5 = manager.ui.mainCamera.transform.position - var_910_0.position

				var_910_0.forward = Vector3.New(var_910_5.x, var_910_5.y, var_910_5.z)

				local var_910_6 = var_910_0.localEulerAngles

				var_910_6.z = 0
				var_910_6.x = 0
				var_910_0.localEulerAngles = var_910_6
			end

			if arg_907_1.time_ >= var_910_1 + var_910_2 and arg_907_1.time_ < var_910_1 + var_910_2 + arg_910_0 then
				var_910_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_910_7 = manager.ui.mainCamera.transform.position - var_910_0.position

				var_910_0.forward = Vector3.New(var_910_7.x, var_910_7.y, var_910_7.z)

				local var_910_8 = var_910_0.localEulerAngles

				var_910_8.z = 0
				var_910_8.x = 0
				var_910_0.localEulerAngles = var_910_8
			end

			local var_910_9 = arg_907_1.actors_["1019ui_story"]
			local var_910_10 = 0

			if var_910_10 < arg_907_1.time_ and arg_907_1.time_ <= var_910_10 + arg_910_0 and arg_907_1.var_.characterEffect1019ui_story == nil then
				arg_907_1.var_.characterEffect1019ui_story = var_910_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_910_11 = 0.200000002980232

			if var_910_10 <= arg_907_1.time_ and arg_907_1.time_ < var_910_10 + var_910_11 then
				local var_910_12 = (arg_907_1.time_ - var_910_10) / var_910_11

				if arg_907_1.var_.characterEffect1019ui_story then
					arg_907_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_907_1.time_ >= var_910_10 + var_910_11 and arg_907_1.time_ < var_910_10 + var_910_11 + arg_910_0 and arg_907_1.var_.characterEffect1019ui_story then
				arg_907_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_910_13 = 0

			if var_910_13 < arg_907_1.time_ and arg_907_1.time_ <= var_910_13 + arg_910_0 then
				arg_907_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_910_14 = 0

			if var_910_14 < arg_907_1.time_ and arg_907_1.time_ <= var_910_14 + arg_910_0 then
				arg_907_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_910_15 = 0
			local var_910_16 = 0.475

			if var_910_15 < arg_907_1.time_ and arg_907_1.time_ <= var_910_15 + arg_910_0 then
				arg_907_1.talkMaxDuration = 0
				arg_907_1.dialogCg_.alpha = 1

				arg_907_1.dialog_:SetActive(true)
				SetActive(arg_907_1.leftNameGo_, true)

				local var_910_17 = arg_907_1:FormatText(StoryNameCfg[13].name)

				arg_907_1.leftNameTxt_.text = var_910_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_907_1.leftNameTxt_.transform)

				arg_907_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_907_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_907_1:RecordName(arg_907_1.leftNameTxt_.text)
				SetActive(arg_907_1.iconTrs_.gameObject, false)
				arg_907_1.callingController_:SetSelectedState("normal")

				local var_910_18 = arg_907_1:GetWordFromCfg(1101906216)
				local var_910_19 = arg_907_1:FormatText(var_910_18.content)

				arg_907_1.text_.text = var_910_19

				LuaForUtil.ClearLinePrefixSymbol(arg_907_1.text_)

				local var_910_20 = 19
				local var_910_21 = utf8.len(var_910_19)
				local var_910_22 = var_910_20 <= 0 and var_910_16 or var_910_16 * (var_910_21 / var_910_20)

				if var_910_22 > 0 and var_910_16 < var_910_22 then
					arg_907_1.talkMaxDuration = var_910_22

					if var_910_22 + var_910_15 > arg_907_1.duration_ then
						arg_907_1.duration_ = var_910_22 + var_910_15
					end
				end

				arg_907_1.text_.text = var_910_19
				arg_907_1.typewritter.percent = 0

				arg_907_1.typewritter:SetDirty()
				arg_907_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906216", "story_v_side_new_1101906.awb") ~= 0 then
					local var_910_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906216", "story_v_side_new_1101906.awb") / 1000

					if var_910_23 + var_910_15 > arg_907_1.duration_ then
						arg_907_1.duration_ = var_910_23 + var_910_15
					end

					if var_910_18.prefab_name ~= "" and arg_907_1.actors_[var_910_18.prefab_name] ~= nil then
						local var_910_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_907_1.actors_[var_910_18.prefab_name].transform, "story_v_side_new_1101906", "1101906216", "story_v_side_new_1101906.awb")

						arg_907_1:RecordAudio("1101906216", var_910_24)
						arg_907_1:RecordAudio("1101906216", var_910_24)
					else
						arg_907_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906216", "story_v_side_new_1101906.awb")
					end

					arg_907_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906216", "story_v_side_new_1101906.awb")
				end

				arg_907_1:RecordContent(arg_907_1.text_.text)
			end

			local var_910_25 = math.max(var_910_16, arg_907_1.talkMaxDuration)

			if var_910_15 <= arg_907_1.time_ and arg_907_1.time_ < var_910_15 + var_910_25 then
				arg_907_1.typewritter.percent = (arg_907_1.time_ - var_910_15) / var_910_25

				arg_907_1.typewritter:SetDirty()
			end

			if arg_907_1.time_ >= var_910_15 + var_910_25 and arg_907_1.time_ < var_910_15 + var_910_25 + arg_910_0 then
				arg_907_1.typewritter.percent = 1

				arg_907_1.typewritter:SetDirty()
				arg_907_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906217 = function(arg_911_0, arg_911_1)
		arg_911_1.time_ = 0
		arg_911_1.frameCnt_ = 0
		arg_911_1.state_ = "playing"
		arg_911_1.curTalkId_ = 1101906217
		arg_911_1.duration_ = 8.1

		SetActive(arg_911_1.tipsGo_, false)

		function arg_911_1.onSingleLineFinish_()
			arg_911_1.onSingleLineUpdate_ = nil
			arg_911_1.onSingleLineFinish_ = nil
			arg_911_1.state_ = "waiting"
		end

		function arg_911_1.playNext_(arg_913_0)
			if arg_913_0 == 1 then
				arg_911_0:Play1101906218(arg_911_1)
			end
		end

		function arg_911_1.onSingleLineUpdate_(arg_914_0)
			local var_914_0 = 0
			local var_914_1 = 0.9

			if var_914_0 < arg_911_1.time_ and arg_911_1.time_ <= var_914_0 + arg_914_0 then
				arg_911_1.talkMaxDuration = 0
				arg_911_1.dialogCg_.alpha = 1

				arg_911_1.dialog_:SetActive(true)
				SetActive(arg_911_1.leftNameGo_, true)

				local var_914_2 = arg_911_1:FormatText(StoryNameCfg[13].name)

				arg_911_1.leftNameTxt_.text = var_914_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_911_1.leftNameTxt_.transform)

				arg_911_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_911_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_911_1:RecordName(arg_911_1.leftNameTxt_.text)
				SetActive(arg_911_1.iconTrs_.gameObject, false)
				arg_911_1.callingController_:SetSelectedState("normal")

				local var_914_3 = arg_911_1:GetWordFromCfg(1101906217)
				local var_914_4 = arg_911_1:FormatText(var_914_3.content)

				arg_911_1.text_.text = var_914_4

				LuaForUtil.ClearLinePrefixSymbol(arg_911_1.text_)

				local var_914_5 = 36
				local var_914_6 = utf8.len(var_914_4)
				local var_914_7 = var_914_5 <= 0 and var_914_1 or var_914_1 * (var_914_6 / var_914_5)

				if var_914_7 > 0 and var_914_1 < var_914_7 then
					arg_911_1.talkMaxDuration = var_914_7

					if var_914_7 + var_914_0 > arg_911_1.duration_ then
						arg_911_1.duration_ = var_914_7 + var_914_0
					end
				end

				arg_911_1.text_.text = var_914_4
				arg_911_1.typewritter.percent = 0

				arg_911_1.typewritter:SetDirty()
				arg_911_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906217", "story_v_side_new_1101906.awb") ~= 0 then
					local var_914_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906217", "story_v_side_new_1101906.awb") / 1000

					if var_914_8 + var_914_0 > arg_911_1.duration_ then
						arg_911_1.duration_ = var_914_8 + var_914_0
					end

					if var_914_3.prefab_name ~= "" and arg_911_1.actors_[var_914_3.prefab_name] ~= nil then
						local var_914_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_911_1.actors_[var_914_3.prefab_name].transform, "story_v_side_new_1101906", "1101906217", "story_v_side_new_1101906.awb")

						arg_911_1:RecordAudio("1101906217", var_914_9)
						arg_911_1:RecordAudio("1101906217", var_914_9)
					else
						arg_911_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906217", "story_v_side_new_1101906.awb")
					end

					arg_911_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906217", "story_v_side_new_1101906.awb")
				end

				arg_911_1:RecordContent(arg_911_1.text_.text)
			end

			local var_914_10 = math.max(var_914_1, arg_911_1.talkMaxDuration)

			if var_914_0 <= arg_911_1.time_ and arg_911_1.time_ < var_914_0 + var_914_10 then
				arg_911_1.typewritter.percent = (arg_911_1.time_ - var_914_0) / var_914_10

				arg_911_1.typewritter:SetDirty()
			end

			if arg_911_1.time_ >= var_914_0 + var_914_10 and arg_911_1.time_ < var_914_0 + var_914_10 + arg_914_0 then
				arg_911_1.typewritter.percent = 1

				arg_911_1.typewritter:SetDirty()
				arg_911_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906218 = function(arg_915_0, arg_915_1)
		arg_915_1.time_ = 0
		arg_915_1.frameCnt_ = 0
		arg_915_1.state_ = "playing"
		arg_915_1.curTalkId_ = 1101906218
		arg_915_1.duration_ = 5

		SetActive(arg_915_1.tipsGo_, false)

		function arg_915_1.onSingleLineFinish_()
			arg_915_1.onSingleLineUpdate_ = nil
			arg_915_1.onSingleLineFinish_ = nil
			arg_915_1.state_ = "waiting"
		end

		function arg_915_1.playNext_(arg_917_0)
			if arg_917_0 == 1 then
				arg_915_0:Play1101906219(arg_915_1)
			end
		end

		function arg_915_1.onSingleLineUpdate_(arg_918_0)
			local var_918_0 = 0

			if var_918_0 < arg_915_1.time_ and arg_915_1.time_ <= var_918_0 + arg_918_0 then
				arg_915_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_918_1 = arg_915_1.actors_["1019ui_story"]
			local var_918_2 = 0

			if var_918_2 < arg_915_1.time_ and arg_915_1.time_ <= var_918_2 + arg_918_0 and arg_915_1.var_.characterEffect1019ui_story == nil then
				arg_915_1.var_.characterEffect1019ui_story = var_918_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_918_3 = 0.200000002980232

			if var_918_2 <= arg_915_1.time_ and arg_915_1.time_ < var_918_2 + var_918_3 then
				local var_918_4 = (arg_915_1.time_ - var_918_2) / var_918_3

				if arg_915_1.var_.characterEffect1019ui_story then
					local var_918_5 = Mathf.Lerp(0, 0.5, var_918_4)

					arg_915_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_915_1.var_.characterEffect1019ui_story.fillRatio = var_918_5
				end
			end

			if arg_915_1.time_ >= var_918_2 + var_918_3 and arg_915_1.time_ < var_918_2 + var_918_3 + arg_918_0 and arg_915_1.var_.characterEffect1019ui_story then
				local var_918_6 = 0.5

				arg_915_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_915_1.var_.characterEffect1019ui_story.fillRatio = var_918_6
			end

			local var_918_7 = 0
			local var_918_8 = 0.975

			if var_918_7 < arg_915_1.time_ and arg_915_1.time_ <= var_918_7 + arg_918_0 then
				arg_915_1.talkMaxDuration = 0
				arg_915_1.dialogCg_.alpha = 1

				arg_915_1.dialog_:SetActive(true)
				SetActive(arg_915_1.leftNameGo_, false)

				arg_915_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_915_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_915_1:RecordName(arg_915_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_915_1.iconTrs_.gameObject, false)
				arg_915_1.callingController_:SetSelectedState("normal")

				local var_918_9 = arg_915_1:GetWordFromCfg(1101906218)
				local var_918_10 = arg_915_1:FormatText(var_918_9.content)

				arg_915_1.text_.text = var_918_10

				LuaForUtil.ClearLinePrefixSymbol(arg_915_1.text_)

				local var_918_11 = 39
				local var_918_12 = utf8.len(var_918_10)
				local var_918_13 = var_918_11 <= 0 and var_918_8 or var_918_8 * (var_918_12 / var_918_11)

				if var_918_13 > 0 and var_918_8 < var_918_13 then
					arg_915_1.talkMaxDuration = var_918_13

					if var_918_13 + var_918_7 > arg_915_1.duration_ then
						arg_915_1.duration_ = var_918_13 + var_918_7
					end
				end

				arg_915_1.text_.text = var_918_10
				arg_915_1.typewritter.percent = 0

				arg_915_1.typewritter:SetDirty()
				arg_915_1:ShowNextGo(false)
				arg_915_1:RecordContent(arg_915_1.text_.text)
			end

			local var_918_14 = math.max(var_918_8, arg_915_1.talkMaxDuration)

			if var_918_7 <= arg_915_1.time_ and arg_915_1.time_ < var_918_7 + var_918_14 then
				arg_915_1.typewritter.percent = (arg_915_1.time_ - var_918_7) / var_918_14

				arg_915_1.typewritter:SetDirty()
			end

			if arg_915_1.time_ >= var_918_7 + var_918_14 and arg_915_1.time_ < var_918_7 + var_918_14 + arg_918_0 then
				arg_915_1.typewritter.percent = 1

				arg_915_1.typewritter:SetDirty()
				arg_915_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906219 = function(arg_919_0, arg_919_1)
		arg_919_1.time_ = 0
		arg_919_1.frameCnt_ = 0
		arg_919_1.state_ = "playing"
		arg_919_1.curTalkId_ = 1101906219
		arg_919_1.duration_ = 5

		SetActive(arg_919_1.tipsGo_, false)

		function arg_919_1.onSingleLineFinish_()
			arg_919_1.onSingleLineUpdate_ = nil
			arg_919_1.onSingleLineFinish_ = nil
			arg_919_1.state_ = "waiting"
		end

		function arg_919_1.playNext_(arg_921_0)
			if arg_921_0 == 1 then
				arg_919_0:Play1101906220(arg_919_1)
			end
		end

		function arg_919_1.onSingleLineUpdate_(arg_922_0)
			local var_922_0 = 0
			local var_922_1 = 0.05

			if var_922_0 < arg_919_1.time_ and arg_919_1.time_ <= var_922_0 + arg_922_0 then
				arg_919_1.talkMaxDuration = 0
				arg_919_1.dialogCg_.alpha = 1

				arg_919_1.dialog_:SetActive(true)
				SetActive(arg_919_1.leftNameGo_, true)

				local var_922_2 = arg_919_1:FormatText(StoryNameCfg[7].name)

				arg_919_1.leftNameTxt_.text = var_922_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_919_1.leftNameTxt_.transform)

				arg_919_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_919_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_919_1:RecordName(arg_919_1.leftNameTxt_.text)
				SetActive(arg_919_1.iconTrs_.gameObject, false)
				arg_919_1.callingController_:SetSelectedState("normal")

				local var_922_3 = arg_919_1:GetWordFromCfg(1101906219)
				local var_922_4 = arg_919_1:FormatText(var_922_3.content)

				arg_919_1.text_.text = var_922_4

				LuaForUtil.ClearLinePrefixSymbol(arg_919_1.text_)

				local var_922_5 = 2
				local var_922_6 = utf8.len(var_922_4)
				local var_922_7 = var_922_5 <= 0 and var_922_1 or var_922_1 * (var_922_6 / var_922_5)

				if var_922_7 > 0 and var_922_1 < var_922_7 then
					arg_919_1.talkMaxDuration = var_922_7

					if var_922_7 + var_922_0 > arg_919_1.duration_ then
						arg_919_1.duration_ = var_922_7 + var_922_0
					end
				end

				arg_919_1.text_.text = var_922_4
				arg_919_1.typewritter.percent = 0

				arg_919_1.typewritter:SetDirty()
				arg_919_1:ShowNextGo(false)
				arg_919_1:RecordContent(arg_919_1.text_.text)
			end

			local var_922_8 = math.max(var_922_1, arg_919_1.talkMaxDuration)

			if var_922_0 <= arg_919_1.time_ and arg_919_1.time_ < var_922_0 + var_922_8 then
				arg_919_1.typewritter.percent = (arg_919_1.time_ - var_922_0) / var_922_8

				arg_919_1.typewritter:SetDirty()
			end

			if arg_919_1.time_ >= var_922_0 + var_922_8 and arg_919_1.time_ < var_922_0 + var_922_8 + arg_922_0 then
				arg_919_1.typewritter.percent = 1

				arg_919_1.typewritter:SetDirty()
				arg_919_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906220 = function(arg_923_0, arg_923_1)
		arg_923_1.time_ = 0
		arg_923_1.frameCnt_ = 0
		arg_923_1.state_ = "playing"
		arg_923_1.curTalkId_ = 1101906220
		arg_923_1.duration_ = 1.999999999999

		SetActive(arg_923_1.tipsGo_, false)

		function arg_923_1.onSingleLineFinish_()
			arg_923_1.onSingleLineUpdate_ = nil
			arg_923_1.onSingleLineFinish_ = nil
			arg_923_1.state_ = "waiting"
		end

		function arg_923_1.playNext_(arg_925_0)
			if arg_925_0 == 1 then
				arg_923_0:Play1101906221(arg_923_1)
			end
		end

		function arg_923_1.onSingleLineUpdate_(arg_926_0)
			local var_926_0 = arg_923_1.actors_["1019ui_story"].transform
			local var_926_1 = 0

			if var_926_1 < arg_923_1.time_ and arg_923_1.time_ <= var_926_1 + arg_926_0 then
				arg_923_1.var_.moveOldPos1019ui_story = var_926_0.localPosition
			end

			local var_926_2 = 0.001

			if var_926_1 <= arg_923_1.time_ and arg_923_1.time_ < var_926_1 + var_926_2 then
				local var_926_3 = (arg_923_1.time_ - var_926_1) / var_926_2
				local var_926_4 = Vector3.New(0, -1.08, -5.9)

				var_926_0.localPosition = Vector3.Lerp(arg_923_1.var_.moveOldPos1019ui_story, var_926_4, var_926_3)

				local var_926_5 = manager.ui.mainCamera.transform.position - var_926_0.position

				var_926_0.forward = Vector3.New(var_926_5.x, var_926_5.y, var_926_5.z)

				local var_926_6 = var_926_0.localEulerAngles

				var_926_6.z = 0
				var_926_6.x = 0
				var_926_0.localEulerAngles = var_926_6
			end

			if arg_923_1.time_ >= var_926_1 + var_926_2 and arg_923_1.time_ < var_926_1 + var_926_2 + arg_926_0 then
				var_926_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_926_7 = manager.ui.mainCamera.transform.position - var_926_0.position

				var_926_0.forward = Vector3.New(var_926_7.x, var_926_7.y, var_926_7.z)

				local var_926_8 = var_926_0.localEulerAngles

				var_926_8.z = 0
				var_926_8.x = 0
				var_926_0.localEulerAngles = var_926_8
			end

			local var_926_9 = arg_923_1.actors_["1019ui_story"]
			local var_926_10 = 0

			if var_926_10 < arg_923_1.time_ and arg_923_1.time_ <= var_926_10 + arg_926_0 and arg_923_1.var_.characterEffect1019ui_story == nil then
				arg_923_1.var_.characterEffect1019ui_story = var_926_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_926_11 = 0.200000002980232

			if var_926_10 <= arg_923_1.time_ and arg_923_1.time_ < var_926_10 + var_926_11 then
				local var_926_12 = (arg_923_1.time_ - var_926_10) / var_926_11

				if arg_923_1.var_.characterEffect1019ui_story then
					arg_923_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_923_1.time_ >= var_926_10 + var_926_11 and arg_923_1.time_ < var_926_10 + var_926_11 + arg_926_0 and arg_923_1.var_.characterEffect1019ui_story then
				arg_923_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_926_13 = 0

			if var_926_13 < arg_923_1.time_ and arg_923_1.time_ <= var_926_13 + arg_926_0 then
				arg_923_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_926_14 = 0

			if var_926_14 < arg_923_1.time_ and arg_923_1.time_ <= var_926_14 + arg_926_0 then
				arg_923_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_926_15 = 0
			local var_926_16 = 0.175

			if var_926_15 < arg_923_1.time_ and arg_923_1.time_ <= var_926_15 + arg_926_0 then
				arg_923_1.talkMaxDuration = 0
				arg_923_1.dialogCg_.alpha = 1

				arg_923_1.dialog_:SetActive(true)
				SetActive(arg_923_1.leftNameGo_, true)

				local var_926_17 = arg_923_1:FormatText(StoryNameCfg[13].name)

				arg_923_1.leftNameTxt_.text = var_926_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_923_1.leftNameTxt_.transform)

				arg_923_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_923_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_923_1:RecordName(arg_923_1.leftNameTxt_.text)
				SetActive(arg_923_1.iconTrs_.gameObject, false)
				arg_923_1.callingController_:SetSelectedState("normal")

				local var_926_18 = arg_923_1:GetWordFromCfg(1101906220)
				local var_926_19 = arg_923_1:FormatText(var_926_18.content)

				arg_923_1.text_.text = var_926_19

				LuaForUtil.ClearLinePrefixSymbol(arg_923_1.text_)

				local var_926_20 = 7
				local var_926_21 = utf8.len(var_926_19)
				local var_926_22 = var_926_20 <= 0 and var_926_16 or var_926_16 * (var_926_21 / var_926_20)

				if var_926_22 > 0 and var_926_16 < var_926_22 then
					arg_923_1.talkMaxDuration = var_926_22

					if var_926_22 + var_926_15 > arg_923_1.duration_ then
						arg_923_1.duration_ = var_926_22 + var_926_15
					end
				end

				arg_923_1.text_.text = var_926_19
				arg_923_1.typewritter.percent = 0

				arg_923_1.typewritter:SetDirty()
				arg_923_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906220", "story_v_side_new_1101906.awb") ~= 0 then
					local var_926_23 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906220", "story_v_side_new_1101906.awb") / 1000

					if var_926_23 + var_926_15 > arg_923_1.duration_ then
						arg_923_1.duration_ = var_926_23 + var_926_15
					end

					if var_926_18.prefab_name ~= "" and arg_923_1.actors_[var_926_18.prefab_name] ~= nil then
						local var_926_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_923_1.actors_[var_926_18.prefab_name].transform, "story_v_side_new_1101906", "1101906220", "story_v_side_new_1101906.awb")

						arg_923_1:RecordAudio("1101906220", var_926_24)
						arg_923_1:RecordAudio("1101906220", var_926_24)
					else
						arg_923_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906220", "story_v_side_new_1101906.awb")
					end

					arg_923_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906220", "story_v_side_new_1101906.awb")
				end

				arg_923_1:RecordContent(arg_923_1.text_.text)
			end

			local var_926_25 = math.max(var_926_16, arg_923_1.talkMaxDuration)

			if var_926_15 <= arg_923_1.time_ and arg_923_1.time_ < var_926_15 + var_926_25 then
				arg_923_1.typewritter.percent = (arg_923_1.time_ - var_926_15) / var_926_25

				arg_923_1.typewritter:SetDirty()
			end

			if arg_923_1.time_ >= var_926_15 + var_926_25 and arg_923_1.time_ < var_926_15 + var_926_25 + arg_926_0 then
				arg_923_1.typewritter.percent = 1

				arg_923_1.typewritter:SetDirty()
				arg_923_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906221 = function(arg_927_0, arg_927_1)
		arg_927_1.time_ = 0
		arg_927_1.frameCnt_ = 0
		arg_927_1.state_ = "playing"
		arg_927_1.curTalkId_ = 1101906221
		arg_927_1.duration_ = 5

		SetActive(arg_927_1.tipsGo_, false)

		function arg_927_1.onSingleLineFinish_()
			arg_927_1.onSingleLineUpdate_ = nil
			arg_927_1.onSingleLineFinish_ = nil
			arg_927_1.state_ = "waiting"
		end

		function arg_927_1.playNext_(arg_929_0)
			if arg_929_0 == 1 then
				arg_927_0:Play1101906222(arg_927_1)
			end
		end

		function arg_927_1.onSingleLineUpdate_(arg_930_0)
			local var_930_0 = arg_927_1.actors_["1019ui_story"]
			local var_930_1 = 0

			if var_930_1 < arg_927_1.time_ and arg_927_1.time_ <= var_930_1 + arg_930_0 and arg_927_1.var_.characterEffect1019ui_story == nil then
				arg_927_1.var_.characterEffect1019ui_story = var_930_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_930_2 = 0.200000002980232

			if var_930_1 <= arg_927_1.time_ and arg_927_1.time_ < var_930_1 + var_930_2 then
				local var_930_3 = (arg_927_1.time_ - var_930_1) / var_930_2

				if arg_927_1.var_.characterEffect1019ui_story then
					local var_930_4 = Mathf.Lerp(0, 0.5, var_930_3)

					arg_927_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_927_1.var_.characterEffect1019ui_story.fillRatio = var_930_4
				end
			end

			if arg_927_1.time_ >= var_930_1 + var_930_2 and arg_927_1.time_ < var_930_1 + var_930_2 + arg_930_0 and arg_927_1.var_.characterEffect1019ui_story then
				local var_930_5 = 0.5

				arg_927_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_927_1.var_.characterEffect1019ui_story.fillRatio = var_930_5
			end

			local var_930_6 = 0
			local var_930_7 = 0.175

			if var_930_6 < arg_927_1.time_ and arg_927_1.time_ <= var_930_6 + arg_930_0 then
				arg_927_1.talkMaxDuration = 0
				arg_927_1.dialogCg_.alpha = 1

				arg_927_1.dialog_:SetActive(true)
				SetActive(arg_927_1.leftNameGo_, true)

				local var_930_8 = arg_927_1:FormatText(StoryNameCfg[7].name)

				arg_927_1.leftNameTxt_.text = var_930_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_927_1.leftNameTxt_.transform)

				arg_927_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_927_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_927_1:RecordName(arg_927_1.leftNameTxt_.text)
				SetActive(arg_927_1.iconTrs_.gameObject, false)
				arg_927_1.callingController_:SetSelectedState("normal")

				local var_930_9 = arg_927_1:GetWordFromCfg(1101906221)
				local var_930_10 = arg_927_1:FormatText(var_930_9.content)

				arg_927_1.text_.text = var_930_10

				LuaForUtil.ClearLinePrefixSymbol(arg_927_1.text_)

				local var_930_11 = 7
				local var_930_12 = utf8.len(var_930_10)
				local var_930_13 = var_930_11 <= 0 and var_930_7 or var_930_7 * (var_930_12 / var_930_11)

				if var_930_13 > 0 and var_930_7 < var_930_13 then
					arg_927_1.talkMaxDuration = var_930_13

					if var_930_13 + var_930_6 > arg_927_1.duration_ then
						arg_927_1.duration_ = var_930_13 + var_930_6
					end
				end

				arg_927_1.text_.text = var_930_10
				arg_927_1.typewritter.percent = 0

				arg_927_1.typewritter:SetDirty()
				arg_927_1:ShowNextGo(false)
				arg_927_1:RecordContent(arg_927_1.text_.text)
			end

			local var_930_14 = math.max(var_930_7, arg_927_1.talkMaxDuration)

			if var_930_6 <= arg_927_1.time_ and arg_927_1.time_ < var_930_6 + var_930_14 then
				arg_927_1.typewritter.percent = (arg_927_1.time_ - var_930_6) / var_930_14

				arg_927_1.typewritter:SetDirty()
			end

			if arg_927_1.time_ >= var_930_6 + var_930_14 and arg_927_1.time_ < var_930_6 + var_930_14 + arg_930_0 then
				arg_927_1.typewritter.percent = 1

				arg_927_1.typewritter:SetDirty()
				arg_927_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906222 = function(arg_931_0, arg_931_1)
		arg_931_1.time_ = 0
		arg_931_1.frameCnt_ = 0
		arg_931_1.state_ = "playing"
		arg_931_1.curTalkId_ = 1101906222
		arg_931_1.duration_ = 5

		SetActive(arg_931_1.tipsGo_, false)

		function arg_931_1.onSingleLineFinish_()
			arg_931_1.onSingleLineUpdate_ = nil
			arg_931_1.onSingleLineFinish_ = nil
			arg_931_1.state_ = "waiting"
		end

		function arg_931_1.playNext_(arg_933_0)
			if arg_933_0 == 1 then
				arg_931_0:Play1101906223(arg_931_1)
			end
		end

		function arg_931_1.onSingleLineUpdate_(arg_934_0)
			local var_934_0 = 0

			if var_934_0 < arg_931_1.time_ and arg_931_1.time_ <= var_934_0 + arg_934_0 then
				arg_931_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_934_1 = 0
			local var_934_2 = 1.125

			if var_934_1 < arg_931_1.time_ and arg_931_1.time_ <= var_934_1 + arg_934_0 then
				arg_931_1.talkMaxDuration = 0
				arg_931_1.dialogCg_.alpha = 1

				arg_931_1.dialog_:SetActive(true)
				SetActive(arg_931_1.leftNameGo_, false)

				arg_931_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_931_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_931_1:RecordName(arg_931_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_931_1.iconTrs_.gameObject, false)
				arg_931_1.callingController_:SetSelectedState("normal")

				local var_934_3 = arg_931_1:GetWordFromCfg(1101906222)
				local var_934_4 = arg_931_1:FormatText(var_934_3.content)

				arg_931_1.text_.text = var_934_4

				LuaForUtil.ClearLinePrefixSymbol(arg_931_1.text_)

				local var_934_5 = 45
				local var_934_6 = utf8.len(var_934_4)
				local var_934_7 = var_934_5 <= 0 and var_934_2 or var_934_2 * (var_934_6 / var_934_5)

				if var_934_7 > 0 and var_934_2 < var_934_7 then
					arg_931_1.talkMaxDuration = var_934_7

					if var_934_7 + var_934_1 > arg_931_1.duration_ then
						arg_931_1.duration_ = var_934_7 + var_934_1
					end
				end

				arg_931_1.text_.text = var_934_4
				arg_931_1.typewritter.percent = 0

				arg_931_1.typewritter:SetDirty()
				arg_931_1:ShowNextGo(false)
				arg_931_1:RecordContent(arg_931_1.text_.text)
			end

			local var_934_8 = math.max(var_934_2, arg_931_1.talkMaxDuration)

			if var_934_1 <= arg_931_1.time_ and arg_931_1.time_ < var_934_1 + var_934_8 then
				arg_931_1.typewritter.percent = (arg_931_1.time_ - var_934_1) / var_934_8

				arg_931_1.typewritter:SetDirty()
			end

			if arg_931_1.time_ >= var_934_1 + var_934_8 and arg_931_1.time_ < var_934_1 + var_934_8 + arg_934_0 then
				arg_931_1.typewritter.percent = 1

				arg_931_1.typewritter:SetDirty()
				arg_931_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906223 = function(arg_935_0, arg_935_1)
		arg_935_1.time_ = 0
		arg_935_1.frameCnt_ = 0
		arg_935_1.state_ = "playing"
		arg_935_1.curTalkId_ = 1101906223
		arg_935_1.duration_ = 11.333

		SetActive(arg_935_1.tipsGo_, false)

		function arg_935_1.onSingleLineFinish_()
			arg_935_1.onSingleLineUpdate_ = nil
			arg_935_1.onSingleLineFinish_ = nil
			arg_935_1.state_ = "waiting"
		end

		function arg_935_1.playNext_(arg_937_0)
			if arg_937_0 == 1 then
				arg_935_0:Play1101906224(arg_935_1)
			end
		end

		function arg_935_1.onSingleLineUpdate_(arg_938_0)
			local var_938_0 = arg_935_1.actors_["1019ui_story"]
			local var_938_1 = 0

			if var_938_1 < arg_935_1.time_ and arg_935_1.time_ <= var_938_1 + arg_938_0 and arg_935_1.var_.characterEffect1019ui_story == nil then
				arg_935_1.var_.characterEffect1019ui_story = var_938_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_938_2 = 0.200000002980232

			if var_938_1 <= arg_935_1.time_ and arg_935_1.time_ < var_938_1 + var_938_2 then
				local var_938_3 = (arg_935_1.time_ - var_938_1) / var_938_2

				if arg_935_1.var_.characterEffect1019ui_story then
					arg_935_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_935_1.time_ >= var_938_1 + var_938_2 and arg_935_1.time_ < var_938_1 + var_938_2 + arg_938_0 and arg_935_1.var_.characterEffect1019ui_story then
				arg_935_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_938_4 = 0
			local var_938_5 = 1.125

			if var_938_4 < arg_935_1.time_ and arg_935_1.time_ <= var_938_4 + arg_938_0 then
				arg_935_1.talkMaxDuration = 0
				arg_935_1.dialogCg_.alpha = 1

				arg_935_1.dialog_:SetActive(true)
				SetActive(arg_935_1.leftNameGo_, true)

				local var_938_6 = arg_935_1:FormatText(StoryNameCfg[13].name)

				arg_935_1.leftNameTxt_.text = var_938_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_935_1.leftNameTxt_.transform)

				arg_935_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_935_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_935_1:RecordName(arg_935_1.leftNameTxt_.text)
				SetActive(arg_935_1.iconTrs_.gameObject, false)
				arg_935_1.callingController_:SetSelectedState("normal")

				local var_938_7 = arg_935_1:GetWordFromCfg(1101906223)
				local var_938_8 = arg_935_1:FormatText(var_938_7.content)

				arg_935_1.text_.text = var_938_8

				LuaForUtil.ClearLinePrefixSymbol(arg_935_1.text_)

				local var_938_9 = 45
				local var_938_10 = utf8.len(var_938_8)
				local var_938_11 = var_938_9 <= 0 and var_938_5 or var_938_5 * (var_938_10 / var_938_9)

				if var_938_11 > 0 and var_938_5 < var_938_11 then
					arg_935_1.talkMaxDuration = var_938_11

					if var_938_11 + var_938_4 > arg_935_1.duration_ then
						arg_935_1.duration_ = var_938_11 + var_938_4
					end
				end

				arg_935_1.text_.text = var_938_8
				arg_935_1.typewritter.percent = 0

				arg_935_1.typewritter:SetDirty()
				arg_935_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906223", "story_v_side_new_1101906.awb") ~= 0 then
					local var_938_12 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906223", "story_v_side_new_1101906.awb") / 1000

					if var_938_12 + var_938_4 > arg_935_1.duration_ then
						arg_935_1.duration_ = var_938_12 + var_938_4
					end

					if var_938_7.prefab_name ~= "" and arg_935_1.actors_[var_938_7.prefab_name] ~= nil then
						local var_938_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_935_1.actors_[var_938_7.prefab_name].transform, "story_v_side_new_1101906", "1101906223", "story_v_side_new_1101906.awb")

						arg_935_1:RecordAudio("1101906223", var_938_13)
						arg_935_1:RecordAudio("1101906223", var_938_13)
					else
						arg_935_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906223", "story_v_side_new_1101906.awb")
					end

					arg_935_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906223", "story_v_side_new_1101906.awb")
				end

				arg_935_1:RecordContent(arg_935_1.text_.text)
			end

			local var_938_14 = math.max(var_938_5, arg_935_1.talkMaxDuration)

			if var_938_4 <= arg_935_1.time_ and arg_935_1.time_ < var_938_4 + var_938_14 then
				arg_935_1.typewritter.percent = (arg_935_1.time_ - var_938_4) / var_938_14

				arg_935_1.typewritter:SetDirty()
			end

			if arg_935_1.time_ >= var_938_4 + var_938_14 and arg_935_1.time_ < var_938_4 + var_938_14 + arg_938_0 then
				arg_935_1.typewritter.percent = 1

				arg_935_1.typewritter:SetDirty()
				arg_935_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906224 = function(arg_939_0, arg_939_1)
		arg_939_1.time_ = 0
		arg_939_1.frameCnt_ = 0
		arg_939_1.state_ = "playing"
		arg_939_1.curTalkId_ = 1101906224
		arg_939_1.duration_ = 6.466

		SetActive(arg_939_1.tipsGo_, false)

		function arg_939_1.onSingleLineFinish_()
			arg_939_1.onSingleLineUpdate_ = nil
			arg_939_1.onSingleLineFinish_ = nil
			arg_939_1.state_ = "waiting"
		end

		function arg_939_1.playNext_(arg_941_0)
			if arg_941_0 == 1 then
				arg_939_0:Play1101906225(arg_939_1)
			end
		end

		function arg_939_1.onSingleLineUpdate_(arg_942_0)
			local var_942_0 = 0
			local var_942_1 = 0.675

			if var_942_0 < arg_939_1.time_ and arg_939_1.time_ <= var_942_0 + arg_942_0 then
				arg_939_1.talkMaxDuration = 0
				arg_939_1.dialogCg_.alpha = 1

				arg_939_1.dialog_:SetActive(true)
				SetActive(arg_939_1.leftNameGo_, true)

				local var_942_2 = arg_939_1:FormatText(StoryNameCfg[13].name)

				arg_939_1.leftNameTxt_.text = var_942_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_939_1.leftNameTxt_.transform)

				arg_939_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_939_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_939_1:RecordName(arg_939_1.leftNameTxt_.text)
				SetActive(arg_939_1.iconTrs_.gameObject, false)
				arg_939_1.callingController_:SetSelectedState("normal")

				local var_942_3 = arg_939_1:GetWordFromCfg(1101906224)
				local var_942_4 = arg_939_1:FormatText(var_942_3.content)

				arg_939_1.text_.text = var_942_4

				LuaForUtil.ClearLinePrefixSymbol(arg_939_1.text_)

				local var_942_5 = 27
				local var_942_6 = utf8.len(var_942_4)
				local var_942_7 = var_942_5 <= 0 and var_942_1 or var_942_1 * (var_942_6 / var_942_5)

				if var_942_7 > 0 and var_942_1 < var_942_7 then
					arg_939_1.talkMaxDuration = var_942_7

					if var_942_7 + var_942_0 > arg_939_1.duration_ then
						arg_939_1.duration_ = var_942_7 + var_942_0
					end
				end

				arg_939_1.text_.text = var_942_4
				arg_939_1.typewritter.percent = 0

				arg_939_1.typewritter:SetDirty()
				arg_939_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906224", "story_v_side_new_1101906.awb") ~= 0 then
					local var_942_8 = manager.audio:GetVoiceLength("story_v_side_new_1101906", "1101906224", "story_v_side_new_1101906.awb") / 1000

					if var_942_8 + var_942_0 > arg_939_1.duration_ then
						arg_939_1.duration_ = var_942_8 + var_942_0
					end

					if var_942_3.prefab_name ~= "" and arg_939_1.actors_[var_942_3.prefab_name] ~= nil then
						local var_942_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_939_1.actors_[var_942_3.prefab_name].transform, "story_v_side_new_1101906", "1101906224", "story_v_side_new_1101906.awb")

						arg_939_1:RecordAudio("1101906224", var_942_9)
						arg_939_1:RecordAudio("1101906224", var_942_9)
					else
						arg_939_1:AudioAction("play", "voice", "story_v_side_new_1101906", "1101906224", "story_v_side_new_1101906.awb")
					end

					arg_939_1:RecordHistoryTalkVoice("story_v_side_new_1101906", "1101906224", "story_v_side_new_1101906.awb")
				end

				arg_939_1:RecordContent(arg_939_1.text_.text)
			end

			local var_942_10 = math.max(var_942_1, arg_939_1.talkMaxDuration)

			if var_942_0 <= arg_939_1.time_ and arg_939_1.time_ < var_942_0 + var_942_10 then
				arg_939_1.typewritter.percent = (arg_939_1.time_ - var_942_0) / var_942_10

				arg_939_1.typewritter:SetDirty()
			end

			if arg_939_1.time_ >= var_942_0 + var_942_10 and arg_939_1.time_ < var_942_0 + var_942_10 + arg_942_0 then
				arg_939_1.typewritter.percent = 1

				arg_939_1.typewritter:SetDirty()
				arg_939_1:ShowNextGo(true)
			end
		end
	end,
	Play1101906225 = function(arg_943_0, arg_943_1)
		arg_943_1.time_ = 0
		arg_943_1.frameCnt_ = 0
		arg_943_1.state_ = "playing"
		arg_943_1.curTalkId_ = 1101906225
		arg_943_1.duration_ = 5

		SetActive(arg_943_1.tipsGo_, false)

		function arg_943_1.onSingleLineFinish_()
			arg_943_1.onSingleLineUpdate_ = nil
			arg_943_1.onSingleLineFinish_ = nil
			arg_943_1.state_ = "waiting"
			arg_943_1.auto_ = false
		end

		function arg_943_1.playNext_(arg_945_0)
			arg_943_1.onStoryFinished_()
		end

		function arg_943_1.onSingleLineUpdate_(arg_946_0)
			local var_946_0 = 0
			local var_946_1 = 0.7

			if var_946_0 < arg_943_1.time_ and arg_943_1.time_ <= var_946_0 + arg_946_0 then
				arg_943_1.talkMaxDuration = 0
				arg_943_1.dialogCg_.alpha = 1

				arg_943_1.dialog_:SetActive(true)
				SetActive(arg_943_1.leftNameGo_, true)

				local var_946_2 = arg_943_1:FormatText(StoryNameCfg[13].name)

				arg_943_1.leftNameTxt_.text = var_946_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_943_1.leftNameTxt_.transform)

				arg_943_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_943_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_943_1:RecordName(arg_943_1.leftNameTxt_.text)
				SetActive(arg_943_1.iconTrs_.gameObject, false)
				arg_943_1.callingController_:SetSelectedState("normal")

				local var_946_3 = arg_943_1:GetWordFromCfg(1101906225)
				local var_946_4 = arg_943_1:FormatText(var_946_3.content)

				arg_943_1.text_.text = var_946_4

				LuaForUtil.ClearLinePrefixSymbol(arg_943_1.text_)

				local var_946_5 = 28
				local var_946_6 = utf8.len(var_946_4)
				local var_946_7 = var_946_5 <= 0 and var_946_1 or var_946_1 * (var_946_6 / var_946_5)

				if var_946_7 > 0 and var_946_1 < var_946_7 then
					arg_943_1.talkMaxDuration = var_946_7

					if var_946_7 + var_946_0 > arg_943_1.duration_ then
						arg_943_1.duration_ = var_946_7 + var_946_0
					end
				end

				arg_943_1.text_.text = var_946_4
				arg_943_1.typewritter.percent = 0

				arg_943_1.typewritter:SetDirty()
				arg_943_1:ShowNextGo(false)
				arg_943_1:RecordContent(arg_943_1.text_.text)
			end

			local var_946_8 = math.max(var_946_1, arg_943_1.talkMaxDuration)

			if var_946_0 <= arg_943_1.time_ and arg_943_1.time_ < var_946_0 + var_946_8 then
				arg_943_1.typewritter.percent = (arg_943_1.time_ - var_946_0) / var_946_8

				arg_943_1.typewritter:SetDirty()
			end

			if arg_943_1.time_ >= var_946_0 + var_946_8 and arg_943_1.time_ < var_946_0 + var_946_8 + arg_946_0 then
				arg_943_1.typewritter.percent = 1

				arg_943_1.typewritter:SetDirty()
				arg_943_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B02f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R1902",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D999",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST28",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12"
	},
	voices = {
		"story_v_side_new_1101906.awb",
		"story_v_out_110190.awb"
	}
}