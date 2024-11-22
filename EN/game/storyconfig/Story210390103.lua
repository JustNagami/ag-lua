return {
	Play103903001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 103903001
		arg_1_1.duration_ = 5

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play103903002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_4 = "ST03"

			if arg_1_1.bgs_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_5:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_4)
				var_4_5.name = var_4_4
				var_4_5.transform.parent = arg_1_1.stage_.transform
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_4] = var_4_5
			end

			local var_4_6 = 0

			if var_4_6 < arg_1_1.time_ and arg_1_1.time_ <= var_4_6 + arg_4_0 then
				local var_4_7 = manager.ui.mainCamera.transform.localPosition
				local var_4_8 = Vector3.New(0, 0, 10) + Vector3.New(var_4_7.x, var_4_7.y, 0)
				local var_4_9 = arg_1_1.bgs_.ST03

				var_4_9.transform.localPosition = var_4_8
				var_4_9.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_10 = var_4_9:GetComponent("SpriteRenderer")

				if var_4_10 and var_4_10.sprite then
					local var_4_11 = (var_4_9.transform.localPosition - var_4_7).z
					local var_4_12 = manager.ui.mainCameraCom_
					local var_4_13 = 2 * var_4_11 * Mathf.Tan(var_4_12.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_14 = var_4_13 * var_4_12.aspect
					local var_4_15 = var_4_10.sprite.bounds.size.x
					local var_4_16 = var_4_10.sprite.bounds.size.y
					local var_4_17 = var_4_14 / var_4_15
					local var_4_18 = var_4_13 / var_4_16
					local var_4_19 = var_4_18 < var_4_17 and var_4_17 or var_4_18

					var_4_9.transform.localScale = Vector3.New(var_4_19, var_4_19, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "ST03" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_20 = 0
			local var_4_21 = 0.9

			if var_4_20 < arg_1_1.time_ and arg_1_1.time_ <= var_4_20 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_22 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_22:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_23 = arg_1_1:GetWordFromCfg(103903001)
				local var_4_24 = arg_1_1:FormatText(var_4_23.content)

				arg_1_1.text_.text = var_4_24

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_25 = 36
				local var_4_26 = utf8.len(var_4_24)
				local var_4_27 = var_4_25 <= 0 and var_4_21 or var_4_21 * (var_4_26 / var_4_25)

				if var_4_27 > 0 and var_4_21 < var_4_27 then
					arg_1_1.talkMaxDuration = var_4_27
					var_4_20 = var_4_20 + 0.3

					if var_4_27 + var_4_20 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_27 + var_4_20
					end
				end

				arg_1_1.text_.text = var_4_24
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_28 = var_4_20 + 0.3
			local var_4_29 = math.max(var_4_21, arg_1_1.talkMaxDuration)

			if var_4_28 <= arg_1_1.time_ and arg_1_1.time_ < var_4_28 + var_4_29 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_28) / var_4_29

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play103903002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 103903002
		arg_7_1.duration_ = 3.7

		local var_7_0 = {
			ja = 3.7,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_7_1 = manager.audio:GetLocalizationFlag()

		if var_7_0[var_7_1] ~= nil then
			arg_7_1.duration_ = var_7_0[var_7_1]
		end

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play103903003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "music"

				arg_7_1:AudioAction(var_10_2, var_10_3, "bgm_story_mood_daily", "bgm_story_mood_daily", "bgm_story_mood_daily")
			end

			local var_10_4 = "1039ui_story"

			if arg_7_1.actors_[var_10_4] == nil then
				local var_10_5 = Object.Instantiate(Asset.Load("Char/" .. var_10_4), arg_7_1.stage_.transform)

				var_10_5.name = var_10_4
				var_10_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_4] = var_10_5

				local var_10_6 = var_10_5:GetComponentInChildren(typeof(CharacterEffect))

				var_10_6.enabled = true

				local var_10_7 = GameObjectTools.GetOrAddComponent(var_10_5, typeof(DynamicBoneHelper))

				if var_10_7 then
					var_10_7:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_6.transform, false)

				arg_7_1.var_[var_10_4 .. "Animator"] = var_10_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_4 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_4 .. "LipSync"] = var_10_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_8 = arg_7_1.actors_["1039ui_story"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect1039ui_story == nil then
				arg_7_1.var_.characterEffect1039ui_story = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect1039ui_story then
					arg_7_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect1039ui_story then
				arg_7_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_10_12 = arg_7_1.actors_["1039ui_story"].transform
			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1.var_.moveOldPos1039ui_story = var_10_12.localPosition
			end

			local var_10_14 = 0.001

			if var_10_13 <= arg_7_1.time_ and arg_7_1.time_ < var_10_13 + var_10_14 then
				local var_10_15 = (arg_7_1.time_ - var_10_13) / var_10_14
				local var_10_16 = Vector3.New(0, -1.06, -5.3)

				var_10_12.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1039ui_story, var_10_16, var_10_15)

				local var_10_17 = manager.ui.mainCamera.transform.position - var_10_12.position

				var_10_12.forward = Vector3.New(var_10_17.x, var_10_17.y, var_10_17.z)

				local var_10_18 = var_10_12.localEulerAngles

				var_10_18.z = 0
				var_10_18.x = 0
				var_10_12.localEulerAngles = var_10_18
			end

			if arg_7_1.time_ >= var_10_13 + var_10_14 and arg_7_1.time_ < var_10_13 + var_10_14 + arg_10_0 then
				var_10_12.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_12.position

				var_10_12.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_12.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_12.localEulerAngles = var_10_20
			end

			local var_10_21 = 0

			if var_10_21 < arg_7_1.time_ and arg_7_1.time_ <= var_10_21 + arg_10_0 then
				arg_7_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_10_22 = 0

			if var_10_22 < arg_7_1.time_ and arg_7_1.time_ <= var_10_22 + arg_10_0 then
				arg_7_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_10_23 = 0
			local var_10_24 = 0.175

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_25 = arg_7_1:FormatText(StoryNameCfg[9].name)

				arg_7_1.leftNameTxt_.text = var_10_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_26 = arg_7_1:GetWordFromCfg(103903002)
				local var_10_27 = arg_7_1:FormatText(var_10_26.content)

				arg_7_1.text_.text = var_10_27

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_28 = 7
				local var_10_29 = utf8.len(var_10_27)
				local var_10_30 = var_10_28 <= 0 and var_10_24 or var_10_24 * (var_10_29 / var_10_28)

				if var_10_30 > 0 and var_10_24 < var_10_30 then
					arg_7_1.talkMaxDuration = var_10_30

					if var_10_30 + var_10_23 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_30 + var_10_23
					end
				end

				arg_7_1.text_.text = var_10_27
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903002", "story_v_side_old_103903.awb") ~= 0 then
					local var_10_31 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903002", "story_v_side_old_103903.awb") / 1000

					if var_10_31 + var_10_23 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_31 + var_10_23
					end

					if var_10_26.prefab_name ~= "" and arg_7_1.actors_[var_10_26.prefab_name] ~= nil then
						local var_10_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_26.prefab_name].transform, "story_v_side_old_103903", "103903002", "story_v_side_old_103903.awb")

						arg_7_1:RecordAudio("103903002", var_10_32)
						arg_7_1:RecordAudio("103903002", var_10_32)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903002", "story_v_side_old_103903.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903002", "story_v_side_old_103903.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_33 = math.max(var_10_24, arg_7_1.talkMaxDuration)

			if var_10_23 <= arg_7_1.time_ and arg_7_1.time_ < var_10_23 + var_10_33 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_23) / var_10_33

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_23 + var_10_33 and arg_7_1.time_ < var_10_23 + var_10_33 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play103903003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 103903003
		arg_11_1.duration_ = 4.6

		local var_11_0 = {
			ja = 4.6,
			ko = 3.366,
			zh = 3.366,
			en = 4.066
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
				arg_11_0:Play103903004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_14_1 = 0
			local var_14_2 = 0.4

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_3 = arg_11_1:FormatText(StoryNameCfg[9].name)

				arg_11_1.leftNameTxt_.text = var_14_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_4 = arg_11_1:GetWordFromCfg(103903003)
				local var_14_5 = arg_11_1:FormatText(var_14_4.content)

				arg_11_1.text_.text = var_14_5

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_6 = 16
				local var_14_7 = utf8.len(var_14_5)
				local var_14_8 = var_14_6 <= 0 and var_14_2 or var_14_2 * (var_14_7 / var_14_6)

				if var_14_8 > 0 and var_14_2 < var_14_8 then
					arg_11_1.talkMaxDuration = var_14_8

					if var_14_8 + var_14_1 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_1
					end
				end

				arg_11_1.text_.text = var_14_5
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903003", "story_v_side_old_103903.awb") ~= 0 then
					local var_14_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903003", "story_v_side_old_103903.awb") / 1000

					if var_14_9 + var_14_1 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_9 + var_14_1
					end

					if var_14_4.prefab_name ~= "" and arg_11_1.actors_[var_14_4.prefab_name] ~= nil then
						local var_14_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_4.prefab_name].transform, "story_v_side_old_103903", "103903003", "story_v_side_old_103903.awb")

						arg_11_1:RecordAudio("103903003", var_14_10)
						arg_11_1:RecordAudio("103903003", var_14_10)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903003", "story_v_side_old_103903.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903003", "story_v_side_old_103903.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_11 = math.max(var_14_2, arg_11_1.talkMaxDuration)

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_11 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_1) / var_14_11

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_1 + var_14_11 and arg_11_1.time_ < var_14_1 + var_14_11 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play103903004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 103903004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play103903005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1039ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1039ui_story == nil then
				arg_15_1.var_.characterEffect1039ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1039ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1039ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1039ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1039ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.95

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_8 = arg_15_1:GetWordFromCfg(103903004)
				local var_18_9 = arg_15_1:FormatText(var_18_8.content)

				arg_15_1.text_.text = var_18_9

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_10 = 38
				local var_18_11 = utf8.len(var_18_9)
				local var_18_12 = var_18_10 <= 0 and var_18_7 or var_18_7 * (var_18_11 / var_18_10)

				if var_18_12 > 0 and var_18_7 < var_18_12 then
					arg_15_1.talkMaxDuration = var_18_12

					if var_18_12 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_12 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_9
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_13 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_13 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_13

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_13 and arg_15_1.time_ < var_18_6 + var_18_13 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play103903005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 103903005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play103903006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.7

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_2 = arg_19_1:GetWordFromCfg(103903005)
				local var_22_3 = arg_19_1:FormatText(var_22_2.content)

				arg_19_1.text_.text = var_22_3

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_4 = 28
				local var_22_5 = utf8.len(var_22_3)
				local var_22_6 = var_22_4 <= 0 and var_22_1 or var_22_1 * (var_22_5 / var_22_4)

				if var_22_6 > 0 and var_22_1 < var_22_6 then
					arg_19_1.talkMaxDuration = var_22_6

					if var_22_6 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_6 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_3
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_7 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_7 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_7

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_7 and arg_19_1.time_ < var_22_0 + var_22_7 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play103903006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 103903006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play103903007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.3

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

				local var_26_2 = arg_23_1:GetWordFromCfg(103903006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 12
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
	Play103903007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 103903007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play103903008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.525

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(103903007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 21
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play103903008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 103903008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play103903009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1.175

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_2 = arg_31_1:GetWordFromCfg(103903008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 47
				local var_34_5 = utf8.len(var_34_3)
				local var_34_6 = var_34_4 <= 0 and var_34_1 or var_34_1 * (var_34_5 / var_34_4)

				if var_34_6 > 0 and var_34_1 < var_34_6 then
					arg_31_1.talkMaxDuration = var_34_6

					if var_34_6 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_6 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_3
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_7 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_7 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_7

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_7 and arg_31_1.time_ < var_34_0 + var_34_7 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play103903009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 103903009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play103903010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.825

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

				local var_38_3 = arg_35_1:GetWordFromCfg(103903009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 32
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
	Play103903010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 103903010
		arg_39_1.duration_ = 7.9

		local var_39_0 = {
			ja = 7.9,
			ko = 7.866,
			zh = 7.866,
			en = 5.666
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
				arg_39_0:Play103903011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1039ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1039ui_story == nil then
				arg_39_1.var_.characterEffect1039ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1039ui_story then
					arg_39_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1039ui_story then
				arg_39_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action424")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_42_6 = 0
			local var_42_7 = 0.725

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[9].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(103903010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 28
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

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903010", "story_v_side_old_103903.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903010", "story_v_side_old_103903.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_side_old_103903", "103903010", "story_v_side_old_103903.awb")

						arg_39_1:RecordAudio("103903010", var_42_15)
						arg_39_1:RecordAudio("103903010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903010", "story_v_side_old_103903.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903010", "story_v_side_old_103903.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_16 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_16 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_16

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_16 and arg_39_1.time_ < var_42_6 + var_42_16 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play103903011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 103903011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play103903012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1039ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1039ui_story == nil then
				arg_43_1.var_.characterEffect1039ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1039ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1039ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1039ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1039ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0
			local var_46_7 = 0.15

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[7].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(103903011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 6
				local var_46_12 = utf8.len(var_46_10)
				local var_46_13 = var_46_11 <= 0 and var_46_7 or var_46_7 * (var_46_12 / var_46_11)

				if var_46_13 > 0 and var_46_7 < var_46_13 then
					arg_43_1.talkMaxDuration = var_46_13

					if var_46_13 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_10
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_14 and arg_43_1.time_ < var_46_6 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play103903012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 103903012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play103903013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1039ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1039ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(10, -1.06, -5.3)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1039ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = 0
			local var_50_10 = 0.7

			if var_50_9 < arg_47_1.time_ and arg_47_1.time_ <= var_50_9 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_11 = arg_47_1:GetWordFromCfg(103903012)
				local var_50_12 = arg_47_1:FormatText(var_50_11.content)

				arg_47_1.text_.text = var_50_12

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_13 = 28
				local var_50_14 = utf8.len(var_50_12)
				local var_50_15 = var_50_13 <= 0 and var_50_10 or var_50_10 * (var_50_14 / var_50_13)

				if var_50_15 > 0 and var_50_10 < var_50_15 then
					arg_47_1.talkMaxDuration = var_50_15

					if var_50_15 + var_50_9 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_15 + var_50_9
					end
				end

				arg_47_1.text_.text = var_50_12
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_16 = math.max(var_50_10, arg_47_1.talkMaxDuration)

			if var_50_9 <= arg_47_1.time_ and arg_47_1.time_ < var_50_9 + var_50_16 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_9) / var_50_16

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_9 + var_50_16 and arg_47_1.time_ < var_50_9 + var_50_16 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play103903013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 103903013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play103903014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.bgs_.ST03.transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPosST03 = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, -100, 10)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosST03, var_54_4, var_54_3)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_54_5 = "ST02"

			if arg_51_1.bgs_[var_54_5] == nil then
				local var_54_6 = Object.Instantiate(arg_51_1.paintGo_)

				var_54_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_54_5)
				var_54_6.name = var_54_5
				var_54_6.transform.parent = arg_51_1.stage_.transform
				var_54_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.bgs_[var_54_5] = var_54_6
			end

			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 then
				local var_54_8 = manager.ui.mainCamera.transform.localPosition
				local var_54_9 = Vector3.New(0, 0, 10) + Vector3.New(var_54_8.x, var_54_8.y, 0)
				local var_54_10 = arg_51_1.bgs_.ST02

				var_54_10.transform.localPosition = var_54_9
				var_54_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_54_11 = var_54_10:GetComponent("SpriteRenderer")

				if var_54_11 and var_54_11.sprite then
					local var_54_12 = (var_54_10.transform.localPosition - var_54_8).z
					local var_54_13 = manager.ui.mainCameraCom_
					local var_54_14 = 2 * var_54_12 * Mathf.Tan(var_54_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_54_15 = var_54_14 * var_54_13.aspect
					local var_54_16 = var_54_11.sprite.bounds.size.x
					local var_54_17 = var_54_11.sprite.bounds.size.y
					local var_54_18 = var_54_15 / var_54_16
					local var_54_19 = var_54_14 / var_54_17
					local var_54_20 = var_54_19 < var_54_18 and var_54_18 or var_54_19

					var_54_10.transform.localScale = Vector3.New(var_54_20, var_54_20, 0)
				end

				for iter_54_0, iter_54_1 in pairs(arg_51_1.bgs_) do
					if iter_54_0 ~= "ST02" then
						iter_54_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_54_21 = 0
			local var_54_22 = 0.175

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_23 = arg_51_1:GetWordFromCfg(103903013)
				local var_54_24 = arg_51_1:FormatText(var_54_23.content)

				arg_51_1.text_.text = var_54_24

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_25 = 7
				local var_54_26 = utf8.len(var_54_24)
				local var_54_27 = var_54_25 <= 0 and var_54_22 or var_54_22 * (var_54_26 / var_54_25)

				if var_54_27 > 0 and var_54_22 < var_54_27 then
					arg_51_1.talkMaxDuration = var_54_27

					if var_54_27 + var_54_21 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_21
					end
				end

				arg_51_1.text_.text = var_54_24
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_28 = math.max(var_54_22, arg_51_1.talkMaxDuration)

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_28 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_21) / var_54_28

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_21 + var_54_28 and arg_51_1.time_ < var_54_21 + var_54_28 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play103903014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 103903014
		arg_55_1.duration_ = 4.933

		local var_55_0 = {
			ja = 4.933,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_55_0:Play103903015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = "1027ui_story"

			if arg_55_1.actors_[var_58_0] == nil then
				local var_58_1 = Object.Instantiate(Asset.Load("Char/" .. var_58_0), arg_55_1.stage_.transform)

				var_58_1.name = var_58_0
				var_58_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.actors_[var_58_0] = var_58_1

				local var_58_2 = var_58_1:GetComponentInChildren(typeof(CharacterEffect))

				var_58_2.enabled = true

				local var_58_3 = GameObjectTools.GetOrAddComponent(var_58_1, typeof(DynamicBoneHelper))

				if var_58_3 then
					var_58_3:EnableDynamicBone(false)
				end

				arg_55_1:ShowWeapon(var_58_2.transform, false)

				arg_55_1.var_[var_58_0 .. "Animator"] = var_58_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_55_1.var_[var_58_0 .. "Animator"].applyRootMotion = true
				arg_55_1.var_[var_58_0 .. "LipSync"] = var_58_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_58_4 = arg_55_1.actors_["1027ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect1027ui_story == nil then
				arg_55_1.var_.characterEffect1027ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1027ui_story then
					arg_55_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect1027ui_story then
				arg_55_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_58_8 = arg_55_1.actors_["1027ui_story"].transform
			local var_58_9 = 0

			if var_58_9 < arg_55_1.time_ and arg_55_1.time_ <= var_58_9 + arg_58_0 then
				arg_55_1.var_.moveOldPos1027ui_story = var_58_8.localPosition
			end

			local var_58_10 = 0.001

			if var_58_9 <= arg_55_1.time_ and arg_55_1.time_ < var_58_9 + var_58_10 then
				local var_58_11 = (arg_55_1.time_ - var_58_9) / var_58_10
				local var_58_12 = Vector3.New(0, -0.922, -5.1)

				var_58_8.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1027ui_story, var_58_12, var_58_11)

				local var_58_13 = manager.ui.mainCamera.transform.position - var_58_8.position

				var_58_8.forward = Vector3.New(var_58_13.x, var_58_13.y, var_58_13.z)

				local var_58_14 = var_58_8.localEulerAngles

				var_58_14.z = 0
				var_58_14.x = 0
				var_58_8.localEulerAngles = var_58_14
			end

			if arg_55_1.time_ >= var_58_9 + var_58_10 and arg_55_1.time_ < var_58_9 + var_58_10 + arg_58_0 then
				var_58_8.localPosition = Vector3.New(0, -0.922, -5.1)

				local var_58_15 = manager.ui.mainCamera.transform.position - var_58_8.position

				var_58_8.forward = Vector3.New(var_58_15.x, var_58_15.y, var_58_15.z)

				local var_58_16 = var_58_8.localEulerAngles

				var_58_16.z = 0
				var_58_16.x = 0
				var_58_8.localEulerAngles = var_58_16
			end

			local var_58_17 = 0

			if var_58_17 < arg_55_1.time_ and arg_55_1.time_ <= var_58_17 + arg_58_0 then
				arg_55_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_58_18 = 0

			if var_58_18 < arg_55_1.time_ and arg_55_1.time_ <= var_58_18 + arg_58_0 then
				arg_55_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_58_19 = 0
			local var_58_20 = 0.2

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_21 = arg_55_1:FormatText(StoryNameCfg[56].name)

				arg_55_1.leftNameTxt_.text = var_58_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_22 = arg_55_1:GetWordFromCfg(103903014)
				local var_58_23 = arg_55_1:FormatText(var_58_22.content)

				arg_55_1.text_.text = var_58_23

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_24 = 8
				local var_58_25 = utf8.len(var_58_23)
				local var_58_26 = var_58_24 <= 0 and var_58_20 or var_58_20 * (var_58_25 / var_58_24)

				if var_58_26 > 0 and var_58_20 < var_58_26 then
					arg_55_1.talkMaxDuration = var_58_26

					if var_58_26 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_26 + var_58_19
					end
				end

				arg_55_1.text_.text = var_58_23
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903014", "story_v_side_old_103903.awb") ~= 0 then
					local var_58_27 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903014", "story_v_side_old_103903.awb") / 1000

					if var_58_27 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_27 + var_58_19
					end

					if var_58_22.prefab_name ~= "" and arg_55_1.actors_[var_58_22.prefab_name] ~= nil then
						local var_58_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_22.prefab_name].transform, "story_v_side_old_103903", "103903014", "story_v_side_old_103903.awb")

						arg_55_1:RecordAudio("103903014", var_58_28)
						arg_55_1:RecordAudio("103903014", var_58_28)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903014", "story_v_side_old_103903.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903014", "story_v_side_old_103903.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_29 = math.max(var_58_20, arg_55_1.talkMaxDuration)

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_29 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_19) / var_58_29

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_19 + var_58_29 and arg_55_1.time_ < var_58_19 + var_58_29 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play103903015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 103903015
		arg_59_1.duration_ = 4.033

		local var_59_0 = {
			ja = 3.466,
			ko = 4.033,
			zh = 4.033,
			en = 3.3
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
				arg_59_0:Play103903016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "1148ui_story"

			if arg_59_1.actors_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(Asset.Load("Char/" .. var_62_0), arg_59_1.stage_.transform)

				var_62_1.name = var_62_0
				var_62_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.actors_[var_62_0] = var_62_1

				local var_62_2 = var_62_1:GetComponentInChildren(typeof(CharacterEffect))

				var_62_2.enabled = true

				local var_62_3 = GameObjectTools.GetOrAddComponent(var_62_1, typeof(DynamicBoneHelper))

				if var_62_3 then
					var_62_3:EnableDynamicBone(false)
				end

				arg_59_1:ShowWeapon(var_62_2.transform, false)

				arg_59_1.var_[var_62_0 .. "Animator"] = var_62_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_59_1.var_[var_62_0 .. "Animator"].applyRootMotion = true
				arg_59_1.var_[var_62_0 .. "LipSync"] = var_62_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_62_4 = arg_59_1.actors_["1148ui_story"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1148ui_story == nil then
				arg_59_1.var_.characterEffect1148ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.1

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect1148ui_story then
					arg_59_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect1148ui_story then
				arg_59_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_62_8 = arg_59_1.actors_["1027ui_story"]
			local var_62_9 = 0

			if var_62_9 < arg_59_1.time_ and arg_59_1.time_ <= var_62_9 + arg_62_0 and arg_59_1.var_.characterEffect1027ui_story == nil then
				arg_59_1.var_.characterEffect1027ui_story = var_62_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_10 = 0.1

			if var_62_9 <= arg_59_1.time_ and arg_59_1.time_ < var_62_9 + var_62_10 then
				local var_62_11 = (arg_59_1.time_ - var_62_9) / var_62_10

				if arg_59_1.var_.characterEffect1027ui_story then
					local var_62_12 = Mathf.Lerp(0, 0.5, var_62_11)

					arg_59_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1027ui_story.fillRatio = var_62_12
				end
			end

			if arg_59_1.time_ >= var_62_9 + var_62_10 and arg_59_1.time_ < var_62_9 + var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect1027ui_story then
				local var_62_13 = 0.5

				arg_59_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1027ui_story.fillRatio = var_62_13
			end

			local var_62_14 = arg_59_1.actors_["1027ui_story"].transform
			local var_62_15 = 0.033

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 then
				arg_59_1.var_.moveOldPos1027ui_story = var_62_14.localPosition
			end

			local var_62_16 = 0.5

			if var_62_15 <= arg_59_1.time_ and arg_59_1.time_ < var_62_15 + var_62_16 then
				local var_62_17 = (arg_59_1.time_ - var_62_15) / var_62_16
				local var_62_18 = Vector3.New(-0.92, -0.922, -5.1)

				var_62_14.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1027ui_story, var_62_18, var_62_17)

				local var_62_19 = manager.ui.mainCamera.transform.position - var_62_14.position

				var_62_14.forward = Vector3.New(var_62_19.x, var_62_19.y, var_62_19.z)

				local var_62_20 = var_62_14.localEulerAngles

				var_62_20.z = 0
				var_62_20.x = 0
				var_62_14.localEulerAngles = var_62_20
			end

			if arg_59_1.time_ >= var_62_15 + var_62_16 and arg_59_1.time_ < var_62_15 + var_62_16 + arg_62_0 then
				var_62_14.localPosition = Vector3.New(-0.92, -0.922, -5.1)

				local var_62_21 = manager.ui.mainCamera.transform.position - var_62_14.position

				var_62_14.forward = Vector3.New(var_62_21.x, var_62_21.y, var_62_21.z)

				local var_62_22 = var_62_14.localEulerAngles

				var_62_22.z = 0
				var_62_22.x = 0
				var_62_14.localEulerAngles = var_62_22
			end

			local var_62_23 = arg_59_1.actors_["1027ui_story"].transform
			local var_62_24 = 0

			if var_62_24 < arg_59_1.time_ and arg_59_1.time_ <= var_62_24 + arg_62_0 then
				arg_59_1.var_.moveOldPos1027ui_story = var_62_23.localPosition
			end

			local var_62_25 = 0.001

			if var_62_24 <= arg_59_1.time_ and arg_59_1.time_ < var_62_24 + var_62_25 then
				local var_62_26 = (arg_59_1.time_ - var_62_24) / var_62_25
				local var_62_27 = Vector3.New(0, -0.922, -5.1)

				var_62_23.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1027ui_story, var_62_27, var_62_26)

				local var_62_28 = manager.ui.mainCamera.transform.position - var_62_23.position

				var_62_23.forward = Vector3.New(var_62_28.x, var_62_28.y, var_62_28.z)

				local var_62_29 = var_62_23.localEulerAngles

				var_62_29.z = 0
				var_62_29.x = 0
				var_62_23.localEulerAngles = var_62_29
			end

			if arg_59_1.time_ >= var_62_24 + var_62_25 and arg_59_1.time_ < var_62_24 + var_62_25 + arg_62_0 then
				var_62_23.localPosition = Vector3.New(0, -0.922, -5.1)

				local var_62_30 = manager.ui.mainCamera.transform.position - var_62_23.position

				var_62_23.forward = Vector3.New(var_62_30.x, var_62_30.y, var_62_30.z)

				local var_62_31 = var_62_23.localEulerAngles

				var_62_31.z = 0
				var_62_31.x = 0
				var_62_23.localEulerAngles = var_62_31
			end

			local var_62_32 = arg_59_1.actors_["1148ui_story"].transform
			local var_62_33 = 0

			if var_62_33 < arg_59_1.time_ and arg_59_1.time_ <= var_62_33 + arg_62_0 then
				arg_59_1.var_.moveOldPos1148ui_story = var_62_32.localPosition
			end

			local var_62_34 = 0.001

			if var_62_33 <= arg_59_1.time_ and arg_59_1.time_ < var_62_33 + var_62_34 then
				local var_62_35 = (arg_59_1.time_ - var_62_33) / var_62_34
				local var_62_36 = Vector3.New(0.83, -0.85, -5.6)

				var_62_32.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1148ui_story, var_62_36, var_62_35)

				local var_62_37 = manager.ui.mainCamera.transform.position - var_62_32.position

				var_62_32.forward = Vector3.New(var_62_37.x, var_62_37.y, var_62_37.z)

				local var_62_38 = var_62_32.localEulerAngles

				var_62_38.z = 0
				var_62_38.x = 0
				var_62_32.localEulerAngles = var_62_38
			end

			if arg_59_1.time_ >= var_62_33 + var_62_34 and arg_59_1.time_ < var_62_33 + var_62_34 + arg_62_0 then
				var_62_32.localPosition = Vector3.New(0.83, -0.85, -5.6)

				local var_62_39 = manager.ui.mainCamera.transform.position - var_62_32.position

				var_62_32.forward = Vector3.New(var_62_39.x, var_62_39.y, var_62_39.z)

				local var_62_40 = var_62_32.localEulerAngles

				var_62_40.z = 0
				var_62_40.x = 0
				var_62_32.localEulerAngles = var_62_40
			end

			local var_62_41 = 0

			if var_62_41 < arg_59_1.time_ and arg_59_1.time_ <= var_62_41 + arg_62_0 then
				arg_59_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action6_1")
			end

			local var_62_42 = 0

			if var_62_42 < arg_59_1.time_ and arg_59_1.time_ <= var_62_42 + arg_62_0 then
				arg_59_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1303cva")
			end

			local var_62_43 = 0
			local var_62_44 = 0.4

			if var_62_43 < arg_59_1.time_ and arg_59_1.time_ <= var_62_43 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_45 = arg_59_1:FormatText(StoryNameCfg[8].name)

				arg_59_1.leftNameTxt_.text = var_62_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_46 = arg_59_1:GetWordFromCfg(103903015)
				local var_62_47 = arg_59_1:FormatText(var_62_46.content)

				arg_59_1.text_.text = var_62_47

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_48 = 16
				local var_62_49 = utf8.len(var_62_47)
				local var_62_50 = var_62_48 <= 0 and var_62_44 or var_62_44 * (var_62_49 / var_62_48)

				if var_62_50 > 0 and var_62_44 < var_62_50 then
					arg_59_1.talkMaxDuration = var_62_50

					if var_62_50 + var_62_43 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_50 + var_62_43
					end
				end

				arg_59_1.text_.text = var_62_47
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903015", "story_v_side_old_103903.awb") ~= 0 then
					local var_62_51 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903015", "story_v_side_old_103903.awb") / 1000

					if var_62_51 + var_62_43 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_51 + var_62_43
					end

					if var_62_46.prefab_name ~= "" and arg_59_1.actors_[var_62_46.prefab_name] ~= nil then
						local var_62_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_46.prefab_name].transform, "story_v_side_old_103903", "103903015", "story_v_side_old_103903.awb")

						arg_59_1:RecordAudio("103903015", var_62_52)
						arg_59_1:RecordAudio("103903015", var_62_52)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903015", "story_v_side_old_103903.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903015", "story_v_side_old_103903.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_53 = math.max(var_62_44, arg_59_1.talkMaxDuration)

			if var_62_43 <= arg_59_1.time_ and arg_59_1.time_ < var_62_43 + var_62_53 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_43) / var_62_53

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_43 + var_62_53 and arg_59_1.time_ < var_62_43 + var_62_53 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play103903016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 103903016
		arg_63_1.duration_ = 4.6

		local var_63_0 = {
			ja = 4.6,
			ko = 3.7,
			zh = 3.7,
			en = 3.533
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
				arg_63_0:Play103903017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1027ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1027ui_story == nil then
				arg_63_1.var_.characterEffect1027ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1027ui_story then
					arg_63_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1027ui_story then
				arg_63_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["1148ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect1148ui_story == nil then
				arg_63_1.var_.characterEffect1148ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.1

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect1148ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1148ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect1148ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1148ui_story.fillRatio = var_66_9
			end

			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action424")
			end

			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_66_12 = 0
			local var_66_13 = 0.275

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_14 = arg_63_1:FormatText(StoryNameCfg[56].name)

				arg_63_1.leftNameTxt_.text = var_66_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_15 = arg_63_1:GetWordFromCfg(103903016)
				local var_66_16 = arg_63_1:FormatText(var_66_15.content)

				arg_63_1.text_.text = var_66_16

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_17 = 11
				local var_66_18 = utf8.len(var_66_16)
				local var_66_19 = var_66_17 <= 0 and var_66_13 or var_66_13 * (var_66_18 / var_66_17)

				if var_66_19 > 0 and var_66_13 < var_66_19 then
					arg_63_1.talkMaxDuration = var_66_19

					if var_66_19 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_12
					end
				end

				arg_63_1.text_.text = var_66_16
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903016", "story_v_side_old_103903.awb") ~= 0 then
					local var_66_20 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903016", "story_v_side_old_103903.awb") / 1000

					if var_66_20 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_12
					end

					if var_66_15.prefab_name ~= "" and arg_63_1.actors_[var_66_15.prefab_name] ~= nil then
						local var_66_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_15.prefab_name].transform, "story_v_side_old_103903", "103903016", "story_v_side_old_103903.awb")

						arg_63_1:RecordAudio("103903016", var_66_21)
						arg_63_1:RecordAudio("103903016", var_66_21)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903016", "story_v_side_old_103903.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903016", "story_v_side_old_103903.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_22 = math.max(var_66_13, arg_63_1.talkMaxDuration)

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_22 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_12) / var_66_22

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_12 + var_66_22 and arg_63_1.time_ < var_66_12 + var_66_22 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play103903017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 103903017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play103903018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1027ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1027ui_story == nil then
				arg_67_1.var_.characterEffect1027ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1027ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1027ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1027ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1027ui_story.fillRatio = var_70_5
			end

			local var_70_6 = 0
			local var_70_7 = 0.075

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[113].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(103903017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 3
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
	Play103903018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 103903018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play103903019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.125

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

				local var_74_2 = arg_71_1:GetWordFromCfg(103903018)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 5
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
	Play103903019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 103903019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play103903020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.6

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_2 = arg_75_1:GetWordFromCfg(103903019)
				local var_78_3 = arg_75_1:FormatText(var_78_2.content)

				arg_75_1.text_.text = var_78_3

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_4 = 24
				local var_78_5 = utf8.len(var_78_3)
				local var_78_6 = var_78_4 <= 0 and var_78_1 or var_78_1 * (var_78_5 / var_78_4)

				if var_78_6 > 0 and var_78_1 < var_78_6 then
					arg_75_1.talkMaxDuration = var_78_6

					if var_78_6 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_6 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_3
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_7 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_7 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_7

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_7 and arg_75_1.time_ < var_78_0 + var_78_7 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play103903020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 103903020
		arg_79_1.duration_ = 8.8

		local var_79_0 = {
			ja = 8.8,
			ko = 6,
			zh = 6,
			en = 7.766
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
				arg_79_0:Play103903021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1039ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1039ui_story == nil then
				arg_79_1.var_.characterEffect1039ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1039ui_story then
					arg_79_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1039ui_story then
				arg_79_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["1027ui_story"].transform
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1.var_.moveOldPos1027ui_story = var_82_4.localPosition
			end

			local var_82_6 = 0.001

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6
				local var_82_8 = Vector3.New(10, -0.922, -5.1)

				var_82_4.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1027ui_story, var_82_8, var_82_7)

				local var_82_9 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_9.x, var_82_9.y, var_82_9.z)

				local var_82_10 = var_82_4.localEulerAngles

				var_82_10.z = 0
				var_82_10.x = 0
				var_82_4.localEulerAngles = var_82_10
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 then
				var_82_4.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_82_11 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_11.x, var_82_11.y, var_82_11.z)

				local var_82_12 = var_82_4.localEulerAngles

				var_82_12.z = 0
				var_82_12.x = 0
				var_82_4.localEulerAngles = var_82_12
			end

			local var_82_13 = arg_79_1.actors_["1148ui_story"].transform
			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1.var_.moveOldPos1148ui_story = var_82_13.localPosition
			end

			local var_82_15 = 0.001

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_15 then
				local var_82_16 = (arg_79_1.time_ - var_82_14) / var_82_15
				local var_82_17 = Vector3.New(10, -0.85, -5.6)

				var_82_13.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1148ui_story, var_82_17, var_82_16)

				local var_82_18 = manager.ui.mainCamera.transform.position - var_82_13.position

				var_82_13.forward = Vector3.New(var_82_18.x, var_82_18.y, var_82_18.z)

				local var_82_19 = var_82_13.localEulerAngles

				var_82_19.z = 0
				var_82_19.x = 0
				var_82_13.localEulerAngles = var_82_19
			end

			if arg_79_1.time_ >= var_82_14 + var_82_15 and arg_79_1.time_ < var_82_14 + var_82_15 + arg_82_0 then
				var_82_13.localPosition = Vector3.New(10, -0.85, -5.6)

				local var_82_20 = manager.ui.mainCamera.transform.position - var_82_13.position

				var_82_13.forward = Vector3.New(var_82_20.x, var_82_20.y, var_82_20.z)

				local var_82_21 = var_82_13.localEulerAngles

				var_82_21.z = 0
				var_82_21.x = 0
				var_82_13.localEulerAngles = var_82_21
			end

			local var_82_22 = arg_79_1.actors_["1039ui_story"].transform
			local var_82_23 = 0

			if var_82_23 < arg_79_1.time_ and arg_79_1.time_ <= var_82_23 + arg_82_0 then
				arg_79_1.var_.moveOldPos1039ui_story = var_82_22.localPosition
			end

			local var_82_24 = 0.001

			if var_82_23 <= arg_79_1.time_ and arg_79_1.time_ < var_82_23 + var_82_24 then
				local var_82_25 = (arg_79_1.time_ - var_82_23) / var_82_24
				local var_82_26 = Vector3.New(0, -1.06, -5.3)

				var_82_22.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1039ui_story, var_82_26, var_82_25)

				local var_82_27 = manager.ui.mainCamera.transform.position - var_82_22.position

				var_82_22.forward = Vector3.New(var_82_27.x, var_82_27.y, var_82_27.z)

				local var_82_28 = var_82_22.localEulerAngles

				var_82_28.z = 0
				var_82_28.x = 0
				var_82_22.localEulerAngles = var_82_28
			end

			if arg_79_1.time_ >= var_82_23 + var_82_24 and arg_79_1.time_ < var_82_23 + var_82_24 + arg_82_0 then
				var_82_22.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_82_29 = manager.ui.mainCamera.transform.position - var_82_22.position

				var_82_22.forward = Vector3.New(var_82_29.x, var_82_29.y, var_82_29.z)

				local var_82_30 = var_82_22.localEulerAngles

				var_82_30.z = 0
				var_82_30.x = 0
				var_82_22.localEulerAngles = var_82_30
			end

			local var_82_31 = 0

			if var_82_31 < arg_79_1.time_ and arg_79_1.time_ <= var_82_31 + arg_82_0 then
				arg_79_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action3_1")
			end

			local var_82_32 = 0

			if var_82_32 < arg_79_1.time_ and arg_79_1.time_ <= var_82_32 + arg_82_0 then
				arg_79_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_82_33 = 0
			local var_82_34 = 0.55

			if var_82_33 < arg_79_1.time_ and arg_79_1.time_ <= var_82_33 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_35 = arg_79_1:FormatText(StoryNameCfg[9].name)

				arg_79_1.leftNameTxt_.text = var_82_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_36 = arg_79_1:GetWordFromCfg(103903020)
				local var_82_37 = arg_79_1:FormatText(var_82_36.content)

				arg_79_1.text_.text = var_82_37

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_38 = 22
				local var_82_39 = utf8.len(var_82_37)
				local var_82_40 = var_82_38 <= 0 and var_82_34 or var_82_34 * (var_82_39 / var_82_38)

				if var_82_40 > 0 and var_82_34 < var_82_40 then
					arg_79_1.talkMaxDuration = var_82_40

					if var_82_40 + var_82_33 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_40 + var_82_33
					end
				end

				arg_79_1.text_.text = var_82_37
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903020", "story_v_side_old_103903.awb") ~= 0 then
					local var_82_41 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903020", "story_v_side_old_103903.awb") / 1000

					if var_82_41 + var_82_33 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_41 + var_82_33
					end

					if var_82_36.prefab_name ~= "" and arg_79_1.actors_[var_82_36.prefab_name] ~= nil then
						local var_82_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_36.prefab_name].transform, "story_v_side_old_103903", "103903020", "story_v_side_old_103903.awb")

						arg_79_1:RecordAudio("103903020", var_82_42)
						arg_79_1:RecordAudio("103903020", var_82_42)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903020", "story_v_side_old_103903.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903020", "story_v_side_old_103903.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_43 = math.max(var_82_34, arg_79_1.talkMaxDuration)

			if var_82_33 <= arg_79_1.time_ and arg_79_1.time_ < var_82_33 + var_82_43 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_33) / var_82_43

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_33 + var_82_43 and arg_79_1.time_ < var_82_33 + var_82_43 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play103903021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 103903021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play103903022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.45

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_2 = arg_83_1:GetWordFromCfg(103903021)
				local var_86_3 = arg_83_1:FormatText(var_86_2.content)

				arg_83_1.text_.text = var_86_3

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_4 = 18
				local var_86_5 = utf8.len(var_86_3)
				local var_86_6 = var_86_4 <= 0 and var_86_1 or var_86_1 * (var_86_5 / var_86_4)

				if var_86_6 > 0 and var_86_1 < var_86_6 then
					arg_83_1.talkMaxDuration = var_86_6

					if var_86_6 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_6 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_3
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_7 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_7 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_7

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_7 and arg_83_1.time_ < var_86_0 + var_86_7 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play103903022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 103903022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play103903023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1039ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1039ui_story == nil then
				arg_87_1.var_.characterEffect1039ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1039ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1039ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1039ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1039ui_story.fillRatio = var_90_5
			end

			local var_90_6 = arg_87_1.actors_["1039ui_story"].transform
			local var_90_7 = 0

			if var_90_7 < arg_87_1.time_ and arg_87_1.time_ <= var_90_7 + arg_90_0 then
				arg_87_1.var_.moveOldPos1039ui_story = var_90_6.localPosition
			end

			local var_90_8 = 0.001

			if var_90_7 <= arg_87_1.time_ and arg_87_1.time_ < var_90_7 + var_90_8 then
				local var_90_9 = (arg_87_1.time_ - var_90_7) / var_90_8
				local var_90_10 = Vector3.New(10, -1.06, -5.3)

				var_90_6.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1039ui_story, var_90_10, var_90_9)

				local var_90_11 = manager.ui.mainCamera.transform.position - var_90_6.position

				var_90_6.forward = Vector3.New(var_90_11.x, var_90_11.y, var_90_11.z)

				local var_90_12 = var_90_6.localEulerAngles

				var_90_12.z = 0
				var_90_12.x = 0
				var_90_6.localEulerAngles = var_90_12
			end

			if arg_87_1.time_ >= var_90_7 + var_90_8 and arg_87_1.time_ < var_90_7 + var_90_8 + arg_90_0 then
				var_90_6.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_90_13 = manager.ui.mainCamera.transform.position - var_90_6.position

				var_90_6.forward = Vector3.New(var_90_13.x, var_90_13.y, var_90_13.z)

				local var_90_14 = var_90_6.localEulerAngles

				var_90_14.z = 0
				var_90_14.x = 0
				var_90_6.localEulerAngles = var_90_14
			end

			local var_90_15 = 0
			local var_90_16 = 0.525

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_17 = arg_87_1:GetWordFromCfg(103903022)
				local var_90_18 = arg_87_1:FormatText(var_90_17.content)

				arg_87_1.text_.text = var_90_18

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_19 = 21
				local var_90_20 = utf8.len(var_90_18)
				local var_90_21 = var_90_19 <= 0 and var_90_16 or var_90_16 * (var_90_20 / var_90_19)

				if var_90_21 > 0 and var_90_16 < var_90_21 then
					arg_87_1.talkMaxDuration = var_90_21

					if var_90_21 + var_90_15 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_21 + var_90_15
					end
				end

				arg_87_1.text_.text = var_90_18
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_22 = math.max(var_90_16, arg_87_1.talkMaxDuration)

			if var_90_15 <= arg_87_1.time_ and arg_87_1.time_ < var_90_15 + var_90_22 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_15) / var_90_22

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_15 + var_90_22 and arg_87_1.time_ < var_90_15 + var_90_22 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play103903023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 103903023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play103903024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.875

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_2 = arg_91_1:GetWordFromCfg(103903023)
				local var_94_3 = arg_91_1:FormatText(var_94_2.content)

				arg_91_1.text_.text = var_94_3

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_4 = 35
				local var_94_5 = utf8.len(var_94_3)
				local var_94_6 = var_94_4 <= 0 and var_94_1 or var_94_1 * (var_94_5 / var_94_4)

				if var_94_6 > 0 and var_94_1 < var_94_6 then
					arg_91_1.talkMaxDuration = var_94_6

					if var_94_6 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_6 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_3
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_7 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_7 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_7

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_7 and arg_91_1.time_ < var_94_0 + var_94_7 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play103903024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 103903024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play103903025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.675

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

				local var_98_3 = arg_95_1:GetWordFromCfg(103903024)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 27
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
	Play103903025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 103903025
		arg_99_1.duration_ = 7.033

		local var_99_0 = {
			ja = 2.333,
			ko = 7.033,
			zh = 7.033,
			en = 5.533
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
				arg_99_0:Play103903026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1027ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1027ui_story == nil then
				arg_99_1.var_.characterEffect1027ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.1

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1027ui_story then
					arg_99_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1027ui_story then
				arg_99_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_102_4 = arg_99_1.actors_["1027ui_story"].transform
			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 then
				arg_99_1.var_.moveOldPos1027ui_story = var_102_4.localPosition
			end

			local var_102_6 = 0.001

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_5) / var_102_6
				local var_102_8 = Vector3.New(0, -0.922, -5.1)

				var_102_4.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1027ui_story, var_102_8, var_102_7)

				local var_102_9 = manager.ui.mainCamera.transform.position - var_102_4.position

				var_102_4.forward = Vector3.New(var_102_9.x, var_102_9.y, var_102_9.z)

				local var_102_10 = var_102_4.localEulerAngles

				var_102_10.z = 0
				var_102_10.x = 0
				var_102_4.localEulerAngles = var_102_10
			end

			if arg_99_1.time_ >= var_102_5 + var_102_6 and arg_99_1.time_ < var_102_5 + var_102_6 + arg_102_0 then
				var_102_4.localPosition = Vector3.New(0, -0.922, -5.1)

				local var_102_11 = manager.ui.mainCamera.transform.position - var_102_4.position

				var_102_4.forward = Vector3.New(var_102_11.x, var_102_11.y, var_102_11.z)

				local var_102_12 = var_102_4.localEulerAngles

				var_102_12.z = 0
				var_102_12.x = 0
				var_102_4.localEulerAngles = var_102_12
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action3_1")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_102_15 = 0
			local var_102_16 = 0.1

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_17 = arg_99_1:FormatText(StoryNameCfg[56].name)

				arg_99_1.leftNameTxt_.text = var_102_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_18 = arg_99_1:GetWordFromCfg(103903025)
				local var_102_19 = arg_99_1:FormatText(var_102_18.content)

				arg_99_1.text_.text = var_102_19

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_20 = 4
				local var_102_21 = utf8.len(var_102_19)
				local var_102_22 = var_102_20 <= 0 and var_102_16 or var_102_16 * (var_102_21 / var_102_20)

				if var_102_22 > 0 and var_102_16 < var_102_22 then
					arg_99_1.talkMaxDuration = var_102_22

					if var_102_22 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_22 + var_102_15
					end
				end

				arg_99_1.text_.text = var_102_19
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903025", "story_v_side_old_103903.awb") ~= 0 then
					local var_102_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903025", "story_v_side_old_103903.awb") / 1000

					if var_102_23 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_23 + var_102_15
					end

					if var_102_18.prefab_name ~= "" and arg_99_1.actors_[var_102_18.prefab_name] ~= nil then
						local var_102_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_18.prefab_name].transform, "story_v_side_old_103903", "103903025", "story_v_side_old_103903.awb")

						arg_99_1:RecordAudio("103903025", var_102_24)
						arg_99_1:RecordAudio("103903025", var_102_24)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903025", "story_v_side_old_103903.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903025", "story_v_side_old_103903.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_25 = math.max(var_102_16, arg_99_1.talkMaxDuration)

			if var_102_15 <= arg_99_1.time_ and arg_99_1.time_ < var_102_15 + var_102_25 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_15) / var_102_25

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_15 + var_102_25 and arg_99_1.time_ < var_102_15 + var_102_25 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play103903026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 103903026
		arg_103_1.duration_ = 2.766

		local var_103_0 = {
			ja = 2.533,
			ko = 2.433,
			zh = 2.433,
			en = 2.766
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
				arg_103_0:Play103903027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1148ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1148ui_story == nil then
				arg_103_1.var_.characterEffect1148ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.1

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1148ui_story then
					arg_103_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1148ui_story then
				arg_103_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_106_4 = arg_103_1.actors_["1027ui_story"]
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 and arg_103_1.var_.characterEffect1027ui_story == nil then
				arg_103_1.var_.characterEffect1027ui_story = var_106_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_6 = 0.1

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6

				if arg_103_1.var_.characterEffect1027ui_story then
					local var_106_8 = Mathf.Lerp(0, 0.5, var_106_7)

					arg_103_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1027ui_story.fillRatio = var_106_8
				end
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 and arg_103_1.var_.characterEffect1027ui_story then
				local var_106_9 = 0.5

				arg_103_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1027ui_story.fillRatio = var_106_9
			end

			local var_106_10 = arg_103_1.actors_["1027ui_story"].transform
			local var_106_11 = 0

			if var_106_11 < arg_103_1.time_ and arg_103_1.time_ <= var_106_11 + arg_106_0 then
				arg_103_1.var_.moveOldPos1027ui_story = var_106_10.localPosition
			end

			local var_106_12 = 0.001

			if var_106_11 <= arg_103_1.time_ and arg_103_1.time_ < var_106_11 + var_106_12 then
				local var_106_13 = (arg_103_1.time_ - var_106_11) / var_106_12
				local var_106_14 = Vector3.New(10, -0.922, -5.1)

				var_106_10.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1027ui_story, var_106_14, var_106_13)

				local var_106_15 = manager.ui.mainCamera.transform.position - var_106_10.position

				var_106_10.forward = Vector3.New(var_106_15.x, var_106_15.y, var_106_15.z)

				local var_106_16 = var_106_10.localEulerAngles

				var_106_16.z = 0
				var_106_16.x = 0
				var_106_10.localEulerAngles = var_106_16
			end

			if arg_103_1.time_ >= var_106_11 + var_106_12 and arg_103_1.time_ < var_106_11 + var_106_12 + arg_106_0 then
				var_106_10.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_106_17 = manager.ui.mainCamera.transform.position - var_106_10.position

				var_106_10.forward = Vector3.New(var_106_17.x, var_106_17.y, var_106_17.z)

				local var_106_18 = var_106_10.localEulerAngles

				var_106_18.z = 0
				var_106_18.x = 0
				var_106_10.localEulerAngles = var_106_18
			end

			local var_106_19 = arg_103_1.actors_["1148ui_story"].transform
			local var_106_20 = 0

			if var_106_20 < arg_103_1.time_ and arg_103_1.time_ <= var_106_20 + arg_106_0 then
				arg_103_1.var_.moveOldPos1148ui_story = var_106_19.localPosition
			end

			local var_106_21 = 0.001

			if var_106_20 <= arg_103_1.time_ and arg_103_1.time_ < var_106_20 + var_106_21 then
				local var_106_22 = (arg_103_1.time_ - var_106_20) / var_106_21
				local var_106_23 = Vector3.New(0, -0.85, -5.6)

				var_106_19.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1148ui_story, var_106_23, var_106_22)

				local var_106_24 = manager.ui.mainCamera.transform.position - var_106_19.position

				var_106_19.forward = Vector3.New(var_106_24.x, var_106_24.y, var_106_24.z)

				local var_106_25 = var_106_19.localEulerAngles

				var_106_25.z = 0
				var_106_25.x = 0
				var_106_19.localEulerAngles = var_106_25
			end

			if arg_103_1.time_ >= var_106_20 + var_106_21 and arg_103_1.time_ < var_106_20 + var_106_21 + arg_106_0 then
				var_106_19.localPosition = Vector3.New(0, -0.85, -5.6)

				local var_106_26 = manager.ui.mainCamera.transform.position - var_106_19.position

				var_106_19.forward = Vector3.New(var_106_26.x, var_106_26.y, var_106_26.z)

				local var_106_27 = var_106_19.localEulerAngles

				var_106_27.z = 0
				var_106_27.x = 0
				var_106_19.localEulerAngles = var_106_27
			end

			local var_106_28 = 0

			if var_106_28 < arg_103_1.time_ and arg_103_1.time_ <= var_106_28 + arg_106_0 then
				arg_103_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
			end

			local var_106_29 = 0

			if var_106_29 < arg_103_1.time_ and arg_103_1.time_ <= var_106_29 + arg_106_0 then
				arg_103_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_106_30 = 0
			local var_106_31 = 0.25

			if var_106_30 < arg_103_1.time_ and arg_103_1.time_ <= var_106_30 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_32 = arg_103_1:FormatText(StoryNameCfg[8].name)

				arg_103_1.leftNameTxt_.text = var_106_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_33 = arg_103_1:GetWordFromCfg(103903026)
				local var_106_34 = arg_103_1:FormatText(var_106_33.content)

				arg_103_1.text_.text = var_106_34

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_35 = 10
				local var_106_36 = utf8.len(var_106_34)
				local var_106_37 = var_106_35 <= 0 and var_106_31 or var_106_31 * (var_106_36 / var_106_35)

				if var_106_37 > 0 and var_106_31 < var_106_37 then
					arg_103_1.talkMaxDuration = var_106_37

					if var_106_37 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_37 + var_106_30
					end
				end

				arg_103_1.text_.text = var_106_34
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903026", "story_v_side_old_103903.awb") ~= 0 then
					local var_106_38 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903026", "story_v_side_old_103903.awb") / 1000

					if var_106_38 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_38 + var_106_30
					end

					if var_106_33.prefab_name ~= "" and arg_103_1.actors_[var_106_33.prefab_name] ~= nil then
						local var_106_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_33.prefab_name].transform, "story_v_side_old_103903", "103903026", "story_v_side_old_103903.awb")

						arg_103_1:RecordAudio("103903026", var_106_39)
						arg_103_1:RecordAudio("103903026", var_106_39)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903026", "story_v_side_old_103903.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903026", "story_v_side_old_103903.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_40 = math.max(var_106_31, arg_103_1.talkMaxDuration)

			if var_106_30 <= arg_103_1.time_ and arg_103_1.time_ < var_106_30 + var_106_40 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_30) / var_106_40

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_30 + var_106_40 and arg_103_1.time_ < var_106_30 + var_106_40 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play103903027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 103903027
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play103903028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1148ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1148ui_story == nil then
				arg_107_1.var_.characterEffect1148ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.1

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1148ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1148ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1148ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1148ui_story.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 0.875

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_8 = arg_107_1:GetWordFromCfg(103903027)
				local var_110_9 = arg_107_1:FormatText(var_110_8.content)

				arg_107_1.text_.text = var_110_9

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_10 = 35
				local var_110_11 = utf8.len(var_110_9)
				local var_110_12 = var_110_10 <= 0 and var_110_7 or var_110_7 * (var_110_11 / var_110_10)

				if var_110_12 > 0 and var_110_7 < var_110_12 then
					arg_107_1.talkMaxDuration = var_110_12

					if var_110_12 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_12 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_9
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_13 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_13 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_13

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_13 and arg_107_1.time_ < var_110_6 + var_110_13 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play103903028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 103903028
		arg_111_1.duration_ = 7.833

		local var_111_0 = {
			ja = 7.833,
			ko = 4.9,
			zh = 4.9,
			en = 4.833
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
				arg_111_0:Play103903029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1039ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1039ui_story == nil then
				arg_111_1.var_.characterEffect1039ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.1

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1039ui_story then
					arg_111_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1039ui_story then
				arg_111_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_114_4 = arg_111_1.actors_["1148ui_story"].transform
			local var_114_5 = 0

			if var_114_5 < arg_111_1.time_ and arg_111_1.time_ <= var_114_5 + arg_114_0 then
				arg_111_1.var_.moveOldPos1148ui_story = var_114_4.localPosition
			end

			local var_114_6 = 0.001

			if var_114_5 <= arg_111_1.time_ and arg_111_1.time_ < var_114_5 + var_114_6 then
				local var_114_7 = (arg_111_1.time_ - var_114_5) / var_114_6
				local var_114_8 = Vector3.New(10, -0.85, -5.6)

				var_114_4.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1148ui_story, var_114_8, var_114_7)

				local var_114_9 = manager.ui.mainCamera.transform.position - var_114_4.position

				var_114_4.forward = Vector3.New(var_114_9.x, var_114_9.y, var_114_9.z)

				local var_114_10 = var_114_4.localEulerAngles

				var_114_10.z = 0
				var_114_10.x = 0
				var_114_4.localEulerAngles = var_114_10
			end

			if arg_111_1.time_ >= var_114_5 + var_114_6 and arg_111_1.time_ < var_114_5 + var_114_6 + arg_114_0 then
				var_114_4.localPosition = Vector3.New(10, -0.85, -5.6)

				local var_114_11 = manager.ui.mainCamera.transform.position - var_114_4.position

				var_114_4.forward = Vector3.New(var_114_11.x, var_114_11.y, var_114_11.z)

				local var_114_12 = var_114_4.localEulerAngles

				var_114_12.z = 0
				var_114_12.x = 0
				var_114_4.localEulerAngles = var_114_12
			end

			local var_114_13 = arg_111_1.actors_["1039ui_story"].transform
			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 then
				arg_111_1.var_.moveOldPos1039ui_story = var_114_13.localPosition
			end

			local var_114_15 = 0.001

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_15 then
				local var_114_16 = (arg_111_1.time_ - var_114_14) / var_114_15
				local var_114_17 = Vector3.New(0, -1.06, -5.3)

				var_114_13.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1039ui_story, var_114_17, var_114_16)

				local var_114_18 = manager.ui.mainCamera.transform.position - var_114_13.position

				var_114_13.forward = Vector3.New(var_114_18.x, var_114_18.y, var_114_18.z)

				local var_114_19 = var_114_13.localEulerAngles

				var_114_19.z = 0
				var_114_19.x = 0
				var_114_13.localEulerAngles = var_114_19
			end

			if arg_111_1.time_ >= var_114_14 + var_114_15 and arg_111_1.time_ < var_114_14 + var_114_15 + arg_114_0 then
				var_114_13.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_114_20 = manager.ui.mainCamera.transform.position - var_114_13.position

				var_114_13.forward = Vector3.New(var_114_20.x, var_114_20.y, var_114_20.z)

				local var_114_21 = var_114_13.localEulerAngles

				var_114_21.z = 0
				var_114_21.x = 0
				var_114_13.localEulerAngles = var_114_21
			end

			local var_114_22 = 0

			if var_114_22 < arg_111_1.time_ and arg_111_1.time_ <= var_114_22 + arg_114_0 then
				arg_111_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action4_1")
			end

			local var_114_23 = 0

			if var_114_23 < arg_111_1.time_ and arg_111_1.time_ <= var_114_23 + arg_114_0 then
				arg_111_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_114_24 = 0
			local var_114_25 = 0.525

			if var_114_24 < arg_111_1.time_ and arg_111_1.time_ <= var_114_24 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_26 = arg_111_1:FormatText(StoryNameCfg[9].name)

				arg_111_1.leftNameTxt_.text = var_114_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_27 = arg_111_1:GetWordFromCfg(103903028)
				local var_114_28 = arg_111_1:FormatText(var_114_27.content)

				arg_111_1.text_.text = var_114_28

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_29 = 21
				local var_114_30 = utf8.len(var_114_28)
				local var_114_31 = var_114_29 <= 0 and var_114_25 or var_114_25 * (var_114_30 / var_114_29)

				if var_114_31 > 0 and var_114_25 < var_114_31 then
					arg_111_1.talkMaxDuration = var_114_31

					if var_114_31 + var_114_24 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_31 + var_114_24
					end
				end

				arg_111_1.text_.text = var_114_28
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903028", "story_v_side_old_103903.awb") ~= 0 then
					local var_114_32 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903028", "story_v_side_old_103903.awb") / 1000

					if var_114_32 + var_114_24 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_32 + var_114_24
					end

					if var_114_27.prefab_name ~= "" and arg_111_1.actors_[var_114_27.prefab_name] ~= nil then
						local var_114_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_27.prefab_name].transform, "story_v_side_old_103903", "103903028", "story_v_side_old_103903.awb")

						arg_111_1:RecordAudio("103903028", var_114_33)
						arg_111_1:RecordAudio("103903028", var_114_33)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903028", "story_v_side_old_103903.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903028", "story_v_side_old_103903.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_34 = math.max(var_114_25, arg_111_1.talkMaxDuration)

			if var_114_24 <= arg_111_1.time_ and arg_111_1.time_ < var_114_24 + var_114_34 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_24) / var_114_34

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_24 + var_114_34 and arg_111_1.time_ < var_114_24 + var_114_34 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play103903029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 103903029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play103903030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1039ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1039ui_story == nil then
				arg_115_1.var_.characterEffect1039ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.1

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1039ui_story then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1039ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1039ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1039ui_story.fillRatio = var_118_5
			end

			local var_118_6 = 0
			local var_118_7 = 0.65

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

				local var_118_8 = arg_115_1:GetWordFromCfg(103903029)
				local var_118_9 = arg_115_1:FormatText(var_118_8.content)

				arg_115_1.text_.text = var_118_9

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_10 = 26
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
	Play103903030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 103903030
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play103903031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1039ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1039ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(10, -1.06, -5.3)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1039ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = 0
			local var_122_10 = 0.425

			if var_122_9 < arg_119_1.time_ and arg_119_1.time_ <= var_122_9 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_11 = arg_119_1:GetWordFromCfg(103903030)
				local var_122_12 = arg_119_1:FormatText(var_122_11.content)

				arg_119_1.text_.text = var_122_12

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_13 = 17
				local var_122_14 = utf8.len(var_122_12)
				local var_122_15 = var_122_13 <= 0 and var_122_10 or var_122_10 * (var_122_14 / var_122_13)

				if var_122_15 > 0 and var_122_10 < var_122_15 then
					arg_119_1.talkMaxDuration = var_122_15

					if var_122_15 + var_122_9 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_15 + var_122_9
					end
				end

				arg_119_1.text_.text = var_122_12
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_16 = math.max(var_122_10, arg_119_1.talkMaxDuration)

			if var_122_9 <= arg_119_1.time_ and arg_119_1.time_ < var_122_9 + var_122_16 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_9) / var_122_16

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_9 + var_122_16 and arg_119_1.time_ < var_122_9 + var_122_16 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play103903031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 103903031
		arg_123_1.duration_ = 5.266

		local var_123_0 = {
			ja = 5.266,
			ko = 4.9,
			zh = 4.9,
			en = 4.733
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
				arg_123_0:Play103903032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1027ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1027ui_story == nil then
				arg_123_1.var_.characterEffect1027ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.1

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1027ui_story then
					arg_123_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1027ui_story then
				arg_123_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_126_4 = arg_123_1.actors_["1027ui_story"].transform
			local var_126_5 = 0

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 then
				arg_123_1.var_.moveOldPos1027ui_story = var_126_4.localPosition
			end

			local var_126_6 = 0.001

			if var_126_5 <= arg_123_1.time_ and arg_123_1.time_ < var_126_5 + var_126_6 then
				local var_126_7 = (arg_123_1.time_ - var_126_5) / var_126_6
				local var_126_8 = Vector3.New(-0.92, -0.922, -5.1)

				var_126_4.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1027ui_story, var_126_8, var_126_7)

				local var_126_9 = manager.ui.mainCamera.transform.position - var_126_4.position

				var_126_4.forward = Vector3.New(var_126_9.x, var_126_9.y, var_126_9.z)

				local var_126_10 = var_126_4.localEulerAngles

				var_126_10.z = 0
				var_126_10.x = 0
				var_126_4.localEulerAngles = var_126_10
			end

			if arg_123_1.time_ >= var_126_5 + var_126_6 and arg_123_1.time_ < var_126_5 + var_126_6 + arg_126_0 then
				var_126_4.localPosition = Vector3.New(-0.92, -0.922, -5.1)

				local var_126_11 = manager.ui.mainCamera.transform.position - var_126_4.position

				var_126_4.forward = Vector3.New(var_126_11.x, var_126_11.y, var_126_11.z)

				local var_126_12 = var_126_4.localEulerAngles

				var_126_12.z = 0
				var_126_12.x = 0
				var_126_4.localEulerAngles = var_126_12
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action4_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_126_15 = 0
			local var_126_16 = 0.5

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_17 = arg_123_1:FormatText(StoryNameCfg[56].name)

				arg_123_1.leftNameTxt_.text = var_126_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_18 = arg_123_1:GetWordFromCfg(103903031)
				local var_126_19 = arg_123_1:FormatText(var_126_18.content)

				arg_123_1.text_.text = var_126_19

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_20 = 20
				local var_126_21 = utf8.len(var_126_19)
				local var_126_22 = var_126_20 <= 0 and var_126_16 or var_126_16 * (var_126_21 / var_126_20)

				if var_126_22 > 0 and var_126_16 < var_126_22 then
					arg_123_1.talkMaxDuration = var_126_22

					if var_126_22 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_22 + var_126_15
					end
				end

				arg_123_1.text_.text = var_126_19
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903031", "story_v_side_old_103903.awb") ~= 0 then
					local var_126_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903031", "story_v_side_old_103903.awb") / 1000

					if var_126_23 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_23 + var_126_15
					end

					if var_126_18.prefab_name ~= "" and arg_123_1.actors_[var_126_18.prefab_name] ~= nil then
						local var_126_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_18.prefab_name].transform, "story_v_side_old_103903", "103903031", "story_v_side_old_103903.awb")

						arg_123_1:RecordAudio("103903031", var_126_24)
						arg_123_1:RecordAudio("103903031", var_126_24)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903031", "story_v_side_old_103903.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903031", "story_v_side_old_103903.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_25 = math.max(var_126_16, arg_123_1.talkMaxDuration)

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_25 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_15) / var_126_25

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_15 + var_126_25 and arg_123_1.time_ < var_126_15 + var_126_25 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play103903032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 103903032
		arg_127_1.duration_ = 9.9

		local var_127_0 = {
			ja = 8.833,
			ko = 8.233,
			zh = 8.233,
			en = 9.9
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
				arg_127_0:Play103903033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1148ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1148ui_story == nil then
				arg_127_1.var_.characterEffect1148ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.1

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1148ui_story then
					arg_127_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1148ui_story then
				arg_127_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_130_4 = arg_127_1.actors_["1027ui_story"]
			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 and arg_127_1.var_.characterEffect1027ui_story == nil then
				arg_127_1.var_.characterEffect1027ui_story = var_130_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_6 = 0.1

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_6 then
				local var_130_7 = (arg_127_1.time_ - var_130_5) / var_130_6

				if arg_127_1.var_.characterEffect1027ui_story then
					local var_130_8 = Mathf.Lerp(0, 0.5, var_130_7)

					arg_127_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1027ui_story.fillRatio = var_130_8
				end
			end

			if arg_127_1.time_ >= var_130_5 + var_130_6 and arg_127_1.time_ < var_130_5 + var_130_6 + arg_130_0 and arg_127_1.var_.characterEffect1027ui_story then
				local var_130_9 = 0.5

				arg_127_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1027ui_story.fillRatio = var_130_9
			end

			local var_130_10 = arg_127_1.actors_["1148ui_story"].transform
			local var_130_11 = 0

			if var_130_11 < arg_127_1.time_ and arg_127_1.time_ <= var_130_11 + arg_130_0 then
				arg_127_1.var_.moveOldPos1148ui_story = var_130_10.localPosition
			end

			local var_130_12 = 0.001

			if var_130_11 <= arg_127_1.time_ and arg_127_1.time_ < var_130_11 + var_130_12 then
				local var_130_13 = (arg_127_1.time_ - var_130_11) / var_130_12
				local var_130_14 = Vector3.New(0.83, -0.85, -5.6)

				var_130_10.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1148ui_story, var_130_14, var_130_13)

				local var_130_15 = manager.ui.mainCamera.transform.position - var_130_10.position

				var_130_10.forward = Vector3.New(var_130_15.x, var_130_15.y, var_130_15.z)

				local var_130_16 = var_130_10.localEulerAngles

				var_130_16.z = 0
				var_130_16.x = 0
				var_130_10.localEulerAngles = var_130_16
			end

			if arg_127_1.time_ >= var_130_11 + var_130_12 and arg_127_1.time_ < var_130_11 + var_130_12 + arg_130_0 then
				var_130_10.localPosition = Vector3.New(0.83, -0.85, -5.6)

				local var_130_17 = manager.ui.mainCamera.transform.position - var_130_10.position

				var_130_10.forward = Vector3.New(var_130_17.x, var_130_17.y, var_130_17.z)

				local var_130_18 = var_130_10.localEulerAngles

				var_130_18.z = 0
				var_130_18.x = 0
				var_130_10.localEulerAngles = var_130_18
			end

			local var_130_19 = 0

			if var_130_19 < arg_127_1.time_ and arg_127_1.time_ <= var_130_19 + arg_130_0 then
				arg_127_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action3_1")
			end

			local var_130_20 = 0

			if var_130_20 < arg_127_1.time_ and arg_127_1.time_ <= var_130_20 + arg_130_0 then
				arg_127_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_130_21 = 0
			local var_130_22 = 1.125

			if var_130_21 < arg_127_1.time_ and arg_127_1.time_ <= var_130_21 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_23 = arg_127_1:FormatText(StoryNameCfg[8].name)

				arg_127_1.leftNameTxt_.text = var_130_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_24 = arg_127_1:GetWordFromCfg(103903032)
				local var_130_25 = arg_127_1:FormatText(var_130_24.content)

				arg_127_1.text_.text = var_130_25

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_26 = 45
				local var_130_27 = utf8.len(var_130_25)
				local var_130_28 = var_130_26 <= 0 and var_130_22 or var_130_22 * (var_130_27 / var_130_26)

				if var_130_28 > 0 and var_130_22 < var_130_28 then
					arg_127_1.talkMaxDuration = var_130_28

					if var_130_28 + var_130_21 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_28 + var_130_21
					end
				end

				arg_127_1.text_.text = var_130_25
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903032", "story_v_side_old_103903.awb") ~= 0 then
					local var_130_29 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903032", "story_v_side_old_103903.awb") / 1000

					if var_130_29 + var_130_21 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_29 + var_130_21
					end

					if var_130_24.prefab_name ~= "" and arg_127_1.actors_[var_130_24.prefab_name] ~= nil then
						local var_130_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_24.prefab_name].transform, "story_v_side_old_103903", "103903032", "story_v_side_old_103903.awb")

						arg_127_1:RecordAudio("103903032", var_130_30)
						arg_127_1:RecordAudio("103903032", var_130_30)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903032", "story_v_side_old_103903.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903032", "story_v_side_old_103903.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_31 = math.max(var_130_22, arg_127_1.talkMaxDuration)

			if var_130_21 <= arg_127_1.time_ and arg_127_1.time_ < var_130_21 + var_130_31 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_21) / var_130_31

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_21 + var_130_31 and arg_127_1.time_ < var_130_21 + var_130_31 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play103903033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 103903033
		arg_131_1.duration_ = 3.6

		local var_131_0 = {
			ja = 3.6,
			ko = 2.2,
			zh = 2.2,
			en = 3.066
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
				arg_131_0:Play103903034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1027ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1027ui_story == nil then
				arg_131_1.var_.characterEffect1027ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.1

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1027ui_story then
					arg_131_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1027ui_story then
				arg_131_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_134_4 = arg_131_1.actors_["1148ui_story"]
			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 and arg_131_1.var_.characterEffect1148ui_story == nil then
				arg_131_1.var_.characterEffect1148ui_story = var_134_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_6 = 0.1

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6

				if arg_131_1.var_.characterEffect1148ui_story then
					local var_134_8 = Mathf.Lerp(0, 0.5, var_134_7)

					arg_131_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1148ui_story.fillRatio = var_134_8
				end
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 and arg_131_1.var_.characterEffect1148ui_story then
				local var_134_9 = 0.5

				arg_131_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1148ui_story.fillRatio = var_134_9
			end

			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 then
				arg_131_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action442")
			end

			local var_134_11 = 0
			local var_134_12 = 0.25

			if var_134_11 < arg_131_1.time_ and arg_131_1.time_ <= var_134_11 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_13 = arg_131_1:FormatText(StoryNameCfg[56].name)

				arg_131_1.leftNameTxt_.text = var_134_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_14 = arg_131_1:GetWordFromCfg(103903033)
				local var_134_15 = arg_131_1:FormatText(var_134_14.content)

				arg_131_1.text_.text = var_134_15

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_16 = 10
				local var_134_17 = utf8.len(var_134_15)
				local var_134_18 = var_134_16 <= 0 and var_134_12 or var_134_12 * (var_134_17 / var_134_16)

				if var_134_18 > 0 and var_134_12 < var_134_18 then
					arg_131_1.talkMaxDuration = var_134_18

					if var_134_18 + var_134_11 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_18 + var_134_11
					end
				end

				arg_131_1.text_.text = var_134_15
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903033", "story_v_side_old_103903.awb") ~= 0 then
					local var_134_19 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903033", "story_v_side_old_103903.awb") / 1000

					if var_134_19 + var_134_11 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_19 + var_134_11
					end

					if var_134_14.prefab_name ~= "" and arg_131_1.actors_[var_134_14.prefab_name] ~= nil then
						local var_134_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_14.prefab_name].transform, "story_v_side_old_103903", "103903033", "story_v_side_old_103903.awb")

						arg_131_1:RecordAudio("103903033", var_134_20)
						arg_131_1:RecordAudio("103903033", var_134_20)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903033", "story_v_side_old_103903.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903033", "story_v_side_old_103903.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_21 = math.max(var_134_12, arg_131_1.talkMaxDuration)

			if var_134_11 <= arg_131_1.time_ and arg_131_1.time_ < var_134_11 + var_134_21 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_11) / var_134_21

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_11 + var_134_21 and arg_131_1.time_ < var_134_11 + var_134_21 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play103903034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 103903034
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play103903035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1148ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1148ui_story == nil then
				arg_135_1.var_.characterEffect1148ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.1

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1148ui_story then
					arg_135_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1148ui_story then
				arg_135_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_138_4 = 0
			local var_138_5 = 0.85

			if var_138_4 < arg_135_1.time_ and arg_135_1.time_ <= var_138_4 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_6 = arg_135_1:GetWordFromCfg(103903034)
				local var_138_7 = arg_135_1:FormatText(var_138_6.content)

				arg_135_1.text_.text = var_138_7

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_8 = 34
				local var_138_9 = utf8.len(var_138_7)
				local var_138_10 = var_138_8 <= 0 and var_138_5 or var_138_5 * (var_138_9 / var_138_8)

				if var_138_10 > 0 and var_138_5 < var_138_10 then
					arg_135_1.talkMaxDuration = var_138_10

					if var_138_10 + var_138_4 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_10 + var_138_4
					end
				end

				arg_135_1.text_.text = var_138_7
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_11 = math.max(var_138_5, arg_135_1.talkMaxDuration)

			if var_138_4 <= arg_135_1.time_ and arg_135_1.time_ < var_138_4 + var_138_11 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_4) / var_138_11

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_4 + var_138_11 and arg_135_1.time_ < var_138_4 + var_138_11 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play103903035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 103903035
		arg_139_1.duration_ = 2.5

		local var_139_0 = {
			ja = 1.999999999999,
			ko = 2.5,
			zh = 2.5,
			en = 1.999999999999
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
				arg_139_0:Play103903036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1039ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1039ui_story == nil then
				arg_139_1.var_.characterEffect1039ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.1

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1039ui_story then
					arg_139_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1039ui_story then
				arg_139_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_142_4 = arg_139_1.actors_["1027ui_story"]
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 and arg_139_1.var_.characterEffect1027ui_story == nil then
				arg_139_1.var_.characterEffect1027ui_story = var_142_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_6 = 0.1

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6

				if arg_139_1.var_.characterEffect1027ui_story then
					local var_142_8 = Mathf.Lerp(0, 0.5, var_142_7)

					arg_139_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1027ui_story.fillRatio = var_142_8
				end
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 and arg_139_1.var_.characterEffect1027ui_story then
				local var_142_9 = 0.5

				arg_139_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1027ui_story.fillRatio = var_142_9
			end

			local var_142_10 = arg_139_1.actors_["1148ui_story"]
			local var_142_11 = 0

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect1148ui_story == nil then
				arg_139_1.var_.characterEffect1148ui_story = var_142_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_12 = 0.1

			if var_142_11 <= arg_139_1.time_ and arg_139_1.time_ < var_142_11 + var_142_12 then
				local var_142_13 = (arg_139_1.time_ - var_142_11) / var_142_12

				if arg_139_1.var_.characterEffect1148ui_story then
					local var_142_14 = Mathf.Lerp(0, 0.5, var_142_13)

					arg_139_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1148ui_story.fillRatio = var_142_14
				end
			end

			if arg_139_1.time_ >= var_142_11 + var_142_12 and arg_139_1.time_ < var_142_11 + var_142_12 + arg_142_0 and arg_139_1.var_.characterEffect1148ui_story then
				local var_142_15 = 0.5

				arg_139_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1148ui_story.fillRatio = var_142_15
			end

			local var_142_16 = arg_139_1.actors_["1027ui_story"].transform
			local var_142_17 = 0

			if var_142_17 < arg_139_1.time_ and arg_139_1.time_ <= var_142_17 + arg_142_0 then
				arg_139_1.var_.moveOldPos1027ui_story = var_142_16.localPosition
			end

			local var_142_18 = 0.001

			if var_142_17 <= arg_139_1.time_ and arg_139_1.time_ < var_142_17 + var_142_18 then
				local var_142_19 = (arg_139_1.time_ - var_142_17) / var_142_18
				local var_142_20 = Vector3.New(10, -0.922, -5.1)

				var_142_16.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1027ui_story, var_142_20, var_142_19)

				local var_142_21 = manager.ui.mainCamera.transform.position - var_142_16.position

				var_142_16.forward = Vector3.New(var_142_21.x, var_142_21.y, var_142_21.z)

				local var_142_22 = var_142_16.localEulerAngles

				var_142_22.z = 0
				var_142_22.x = 0
				var_142_16.localEulerAngles = var_142_22
			end

			if arg_139_1.time_ >= var_142_17 + var_142_18 and arg_139_1.time_ < var_142_17 + var_142_18 + arg_142_0 then
				var_142_16.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_142_23 = manager.ui.mainCamera.transform.position - var_142_16.position

				var_142_16.forward = Vector3.New(var_142_23.x, var_142_23.y, var_142_23.z)

				local var_142_24 = var_142_16.localEulerAngles

				var_142_24.z = 0
				var_142_24.x = 0
				var_142_16.localEulerAngles = var_142_24
			end

			local var_142_25 = arg_139_1.actors_["1148ui_story"].transform
			local var_142_26 = 0

			if var_142_26 < arg_139_1.time_ and arg_139_1.time_ <= var_142_26 + arg_142_0 then
				arg_139_1.var_.moveOldPos1148ui_story = var_142_25.localPosition
			end

			local var_142_27 = 0.001

			if var_142_26 <= arg_139_1.time_ and arg_139_1.time_ < var_142_26 + var_142_27 then
				local var_142_28 = (arg_139_1.time_ - var_142_26) / var_142_27
				local var_142_29 = Vector3.New(10, -0.85, -5.6)

				var_142_25.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1148ui_story, var_142_29, var_142_28)

				local var_142_30 = manager.ui.mainCamera.transform.position - var_142_25.position

				var_142_25.forward = Vector3.New(var_142_30.x, var_142_30.y, var_142_30.z)

				local var_142_31 = var_142_25.localEulerAngles

				var_142_31.z = 0
				var_142_31.x = 0
				var_142_25.localEulerAngles = var_142_31
			end

			if arg_139_1.time_ >= var_142_26 + var_142_27 and arg_139_1.time_ < var_142_26 + var_142_27 + arg_142_0 then
				var_142_25.localPosition = Vector3.New(10, -0.85, -5.6)

				local var_142_32 = manager.ui.mainCamera.transform.position - var_142_25.position

				var_142_25.forward = Vector3.New(var_142_32.x, var_142_32.y, var_142_32.z)

				local var_142_33 = var_142_25.localEulerAngles

				var_142_33.z = 0
				var_142_33.x = 0
				var_142_25.localEulerAngles = var_142_33
			end

			local var_142_34 = arg_139_1.actors_["1039ui_story"].transform
			local var_142_35 = 0

			if var_142_35 < arg_139_1.time_ and arg_139_1.time_ <= var_142_35 + arg_142_0 then
				arg_139_1.var_.moveOldPos1039ui_story = var_142_34.localPosition
			end

			local var_142_36 = 0.001

			if var_142_35 <= arg_139_1.time_ and arg_139_1.time_ < var_142_35 + var_142_36 then
				local var_142_37 = (arg_139_1.time_ - var_142_35) / var_142_36
				local var_142_38 = Vector3.New(0, -1.06, -5.3)

				var_142_34.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1039ui_story, var_142_38, var_142_37)

				local var_142_39 = manager.ui.mainCamera.transform.position - var_142_34.position

				var_142_34.forward = Vector3.New(var_142_39.x, var_142_39.y, var_142_39.z)

				local var_142_40 = var_142_34.localEulerAngles

				var_142_40.z = 0
				var_142_40.x = 0
				var_142_34.localEulerAngles = var_142_40
			end

			if arg_139_1.time_ >= var_142_35 + var_142_36 and arg_139_1.time_ < var_142_35 + var_142_36 + arg_142_0 then
				var_142_34.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_142_41 = manager.ui.mainCamera.transform.position - var_142_34.position

				var_142_34.forward = Vector3.New(var_142_41.x, var_142_41.y, var_142_41.z)

				local var_142_42 = var_142_34.localEulerAngles

				var_142_42.z = 0
				var_142_42.x = 0
				var_142_34.localEulerAngles = var_142_42
			end

			local var_142_43 = 0

			if var_142_43 < arg_139_1.time_ and arg_139_1.time_ <= var_142_43 + arg_142_0 then
				arg_139_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_142_44 = 0

			if var_142_44 < arg_139_1.time_ and arg_139_1.time_ <= var_142_44 + arg_142_0 then
				arg_139_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_142_45 = 0
			local var_142_46 = 0.125

			if var_142_45 < arg_139_1.time_ and arg_139_1.time_ <= var_142_45 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_47 = arg_139_1:FormatText(StoryNameCfg[9].name)

				arg_139_1.leftNameTxt_.text = var_142_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_48 = arg_139_1:GetWordFromCfg(103903035)
				local var_142_49 = arg_139_1:FormatText(var_142_48.content)

				arg_139_1.text_.text = var_142_49

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_50 = 5
				local var_142_51 = utf8.len(var_142_49)
				local var_142_52 = var_142_50 <= 0 and var_142_46 or var_142_46 * (var_142_51 / var_142_50)

				if var_142_52 > 0 and var_142_46 < var_142_52 then
					arg_139_1.talkMaxDuration = var_142_52

					if var_142_52 + var_142_45 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_52 + var_142_45
					end
				end

				arg_139_1.text_.text = var_142_49
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903035", "story_v_side_old_103903.awb") ~= 0 then
					local var_142_53 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903035", "story_v_side_old_103903.awb") / 1000

					if var_142_53 + var_142_45 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_53 + var_142_45
					end

					if var_142_48.prefab_name ~= "" and arg_139_1.actors_[var_142_48.prefab_name] ~= nil then
						local var_142_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_48.prefab_name].transform, "story_v_side_old_103903", "103903035", "story_v_side_old_103903.awb")

						arg_139_1:RecordAudio("103903035", var_142_54)
						arg_139_1:RecordAudio("103903035", var_142_54)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903035", "story_v_side_old_103903.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903035", "story_v_side_old_103903.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_55 = math.max(var_142_46, arg_139_1.talkMaxDuration)

			if var_142_45 <= arg_139_1.time_ and arg_139_1.time_ < var_142_45 + var_142_55 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_45) / var_142_55

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_45 + var_142_55 and arg_139_1.time_ < var_142_45 + var_142_55 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play103903036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 103903036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play103903037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.525

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_2 = arg_143_1:GetWordFromCfg(103903036)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 21
				local var_146_5 = utf8.len(var_146_3)
				local var_146_6 = var_146_4 <= 0 and var_146_1 or var_146_1 * (var_146_5 / var_146_4)

				if var_146_6 > 0 and var_146_1 < var_146_6 then
					arg_143_1.talkMaxDuration = var_146_6

					if var_146_6 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_6 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_3
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_7 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_7 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_7

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_7 and arg_143_1.time_ < var_146_0 + var_146_7 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play103903037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 103903037
		arg_147_1.duration_ = 7.9

		local var_147_0 = {
			ja = 7.9,
			ko = 4.233,
			zh = 4.233,
			en = 4.466
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
				arg_147_0:Play103903038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action424")
			end

			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_150_2 = 0
			local var_150_3 = 0.6

			if var_150_2 < arg_147_1.time_ and arg_147_1.time_ <= var_150_2 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_4 = arg_147_1:FormatText(StoryNameCfg[9].name)

				arg_147_1.leftNameTxt_.text = var_150_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_5 = arg_147_1:GetWordFromCfg(103903037)
				local var_150_6 = arg_147_1:FormatText(var_150_5.content)

				arg_147_1.text_.text = var_150_6

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_7 = 24
				local var_150_8 = utf8.len(var_150_6)
				local var_150_9 = var_150_7 <= 0 and var_150_3 or var_150_3 * (var_150_8 / var_150_7)

				if var_150_9 > 0 and var_150_3 < var_150_9 then
					arg_147_1.talkMaxDuration = var_150_9

					if var_150_9 + var_150_2 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_9 + var_150_2
					end
				end

				arg_147_1.text_.text = var_150_6
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903037", "story_v_side_old_103903.awb") ~= 0 then
					local var_150_10 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903037", "story_v_side_old_103903.awb") / 1000

					if var_150_10 + var_150_2 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_10 + var_150_2
					end

					if var_150_5.prefab_name ~= "" and arg_147_1.actors_[var_150_5.prefab_name] ~= nil then
						local var_150_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_5.prefab_name].transform, "story_v_side_old_103903", "103903037", "story_v_side_old_103903.awb")

						arg_147_1:RecordAudio("103903037", var_150_11)
						arg_147_1:RecordAudio("103903037", var_150_11)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903037", "story_v_side_old_103903.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903037", "story_v_side_old_103903.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_12 = math.max(var_150_3, arg_147_1.talkMaxDuration)

			if var_150_2 <= arg_147_1.time_ and arg_147_1.time_ < var_150_2 + var_150_12 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_2) / var_150_12

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_2 + var_150_12 and arg_147_1.time_ < var_150_2 + var_150_12 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play103903038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 103903038
		arg_151_1.duration_ = 10.466

		local var_151_0 = {
			ja = 10.466,
			ko = 6.6,
			zh = 6.6,
			en = 10.2
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
				arg_151_0:Play103903039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_154_1 = 0
			local var_154_2 = 0.7

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_3 = arg_151_1:FormatText(StoryNameCfg[9].name)

				arg_151_1.leftNameTxt_.text = var_154_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_4 = arg_151_1:GetWordFromCfg(103903038)
				local var_154_5 = arg_151_1:FormatText(var_154_4.content)

				arg_151_1.text_.text = var_154_5

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_6 = 28
				local var_154_7 = utf8.len(var_154_5)
				local var_154_8 = var_154_6 <= 0 and var_154_2 or var_154_2 * (var_154_7 / var_154_6)

				if var_154_8 > 0 and var_154_2 < var_154_8 then
					arg_151_1.talkMaxDuration = var_154_8

					if var_154_8 + var_154_1 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_1
					end
				end

				arg_151_1.text_.text = var_154_5
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903038", "story_v_side_old_103903.awb") ~= 0 then
					local var_154_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903038", "story_v_side_old_103903.awb") / 1000

					if var_154_9 + var_154_1 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_9 + var_154_1
					end

					if var_154_4.prefab_name ~= "" and arg_151_1.actors_[var_154_4.prefab_name] ~= nil then
						local var_154_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_4.prefab_name].transform, "story_v_side_old_103903", "103903038", "story_v_side_old_103903.awb")

						arg_151_1:RecordAudio("103903038", var_154_10)
						arg_151_1:RecordAudio("103903038", var_154_10)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903038", "story_v_side_old_103903.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903038", "story_v_side_old_103903.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_11 = math.max(var_154_2, arg_151_1.talkMaxDuration)

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_11 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_1) / var_154_11

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_1 + var_154_11 and arg_151_1.time_ < var_154_1 + var_154_11 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play103903039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 103903039
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play103903040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1039ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1039ui_story == nil then
				arg_155_1.var_.characterEffect1039ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.1

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1039ui_story then
					local var_158_4 = Mathf.Lerp(0, 0.5, var_158_3)

					arg_155_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1039ui_story.fillRatio = var_158_4
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1039ui_story then
				local var_158_5 = 0.5

				arg_155_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1039ui_story.fillRatio = var_158_5
			end

			local var_158_6 = arg_155_1.actors_["1039ui_story"].transform
			local var_158_7 = 0

			if var_158_7 < arg_155_1.time_ and arg_155_1.time_ <= var_158_7 + arg_158_0 then
				arg_155_1.var_.moveOldPos1039ui_story = var_158_6.localPosition
			end

			local var_158_8 = 0.001

			if var_158_7 <= arg_155_1.time_ and arg_155_1.time_ < var_158_7 + var_158_8 then
				local var_158_9 = (arg_155_1.time_ - var_158_7) / var_158_8
				local var_158_10 = Vector3.New(10, -1.06, -5.3)

				var_158_6.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1039ui_story, var_158_10, var_158_9)

				local var_158_11 = manager.ui.mainCamera.transform.position - var_158_6.position

				var_158_6.forward = Vector3.New(var_158_11.x, var_158_11.y, var_158_11.z)

				local var_158_12 = var_158_6.localEulerAngles

				var_158_12.z = 0
				var_158_12.x = 0
				var_158_6.localEulerAngles = var_158_12
			end

			if arg_155_1.time_ >= var_158_7 + var_158_8 and arg_155_1.time_ < var_158_7 + var_158_8 + arg_158_0 then
				var_158_6.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_158_13 = manager.ui.mainCamera.transform.position - var_158_6.position

				var_158_6.forward = Vector3.New(var_158_13.x, var_158_13.y, var_158_13.z)

				local var_158_14 = var_158_6.localEulerAngles

				var_158_14.z = 0
				var_158_14.x = 0
				var_158_6.localEulerAngles = var_158_14
			end

			local var_158_15 = 0
			local var_158_16 = 0.325

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_17 = arg_155_1:GetWordFromCfg(103903039)
				local var_158_18 = arg_155_1:FormatText(var_158_17.content)

				arg_155_1.text_.text = var_158_18

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_19 = 13
				local var_158_20 = utf8.len(var_158_18)
				local var_158_21 = var_158_19 <= 0 and var_158_16 or var_158_16 * (var_158_20 / var_158_19)

				if var_158_21 > 0 and var_158_16 < var_158_21 then
					arg_155_1.talkMaxDuration = var_158_21

					if var_158_21 + var_158_15 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_21 + var_158_15
					end
				end

				arg_155_1.text_.text = var_158_18
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_22 = math.max(var_158_16, arg_155_1.talkMaxDuration)

			if var_158_15 <= arg_155_1.time_ and arg_155_1.time_ < var_158_15 + var_158_22 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_15) / var_158_22

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_15 + var_158_22 and arg_155_1.time_ < var_158_15 + var_158_22 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play103903040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 103903040
		arg_159_1.duration_ = 4.2

		local var_159_0 = {
			ja = 4.2,
			ko = 2.866,
			zh = 2.866,
			en = 3.833
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
				arg_159_0:Play103903041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1027ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1027ui_story == nil then
				arg_159_1.var_.characterEffect1027ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.1

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1027ui_story then
					arg_159_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1027ui_story then
				arg_159_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_162_4 = arg_159_1.actors_["1027ui_story"].transform
			local var_162_5 = 0

			if var_162_5 < arg_159_1.time_ and arg_159_1.time_ <= var_162_5 + arg_162_0 then
				arg_159_1.var_.moveOldPos1027ui_story = var_162_4.localPosition
			end

			local var_162_6 = 0.001

			if var_162_5 <= arg_159_1.time_ and arg_159_1.time_ < var_162_5 + var_162_6 then
				local var_162_7 = (arg_159_1.time_ - var_162_5) / var_162_6
				local var_162_8 = Vector3.New(0, -0.922, -5.1)

				var_162_4.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1027ui_story, var_162_8, var_162_7)

				local var_162_9 = manager.ui.mainCamera.transform.position - var_162_4.position

				var_162_4.forward = Vector3.New(var_162_9.x, var_162_9.y, var_162_9.z)

				local var_162_10 = var_162_4.localEulerAngles

				var_162_10.z = 0
				var_162_10.x = 0
				var_162_4.localEulerAngles = var_162_10
			end

			if arg_159_1.time_ >= var_162_5 + var_162_6 and arg_159_1.time_ < var_162_5 + var_162_6 + arg_162_0 then
				var_162_4.localPosition = Vector3.New(0, -0.922, -5.1)

				local var_162_11 = manager.ui.mainCamera.transform.position - var_162_4.position

				var_162_4.forward = Vector3.New(var_162_11.x, var_162_11.y, var_162_11.z)

				local var_162_12 = var_162_4.localEulerAngles

				var_162_12.z = 0
				var_162_12.x = 0
				var_162_4.localEulerAngles = var_162_12
			end

			local var_162_13 = 0

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action6_1")
			end

			local var_162_14 = 0

			if var_162_14 < arg_159_1.time_ and arg_159_1.time_ <= var_162_14 + arg_162_0 then
				arg_159_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_162_15 = 0
			local var_162_16 = 0.225

			if var_162_15 < arg_159_1.time_ and arg_159_1.time_ <= var_162_15 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_17 = arg_159_1:FormatText(StoryNameCfg[56].name)

				arg_159_1.leftNameTxt_.text = var_162_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_18 = arg_159_1:GetWordFromCfg(103903040)
				local var_162_19 = arg_159_1:FormatText(var_162_18.content)

				arg_159_1.text_.text = var_162_19

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_20 = 9
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

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903040", "story_v_side_old_103903.awb") ~= 0 then
					local var_162_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903040", "story_v_side_old_103903.awb") / 1000

					if var_162_23 + var_162_15 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_23 + var_162_15
					end

					if var_162_18.prefab_name ~= "" and arg_159_1.actors_[var_162_18.prefab_name] ~= nil then
						local var_162_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_18.prefab_name].transform, "story_v_side_old_103903", "103903040", "story_v_side_old_103903.awb")

						arg_159_1:RecordAudio("103903040", var_162_24)
						arg_159_1:RecordAudio("103903040", var_162_24)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903040", "story_v_side_old_103903.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903040", "story_v_side_old_103903.awb")
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
	Play103903041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 103903041
		arg_163_1.duration_ = 4.3

		local var_163_0 = {
			ja = 4.3,
			ko = 4.233,
			zh = 4.233,
			en = 3.6
		}
		local var_163_1 = manager.audio:GetLocalizationFlag()

		if var_163_0[var_163_1] ~= nil then
			arg_163_1.duration_ = var_163_0[var_163_1]
		end

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play103903042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1148ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1148ui_story == nil then
				arg_163_1.var_.characterEffect1148ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.1

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1148ui_story then
					arg_163_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1148ui_story then
				arg_163_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_166_4 = arg_163_1.actors_["1027ui_story"]
			local var_166_5 = 0

			if var_166_5 < arg_163_1.time_ and arg_163_1.time_ <= var_166_5 + arg_166_0 and arg_163_1.var_.characterEffect1027ui_story == nil then
				arg_163_1.var_.characterEffect1027ui_story = var_166_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_6 = 0.1

			if var_166_5 <= arg_163_1.time_ and arg_163_1.time_ < var_166_5 + var_166_6 then
				local var_166_7 = (arg_163_1.time_ - var_166_5) / var_166_6

				if arg_163_1.var_.characterEffect1027ui_story then
					local var_166_8 = Mathf.Lerp(0, 0.5, var_166_7)

					arg_163_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1027ui_story.fillRatio = var_166_8
				end
			end

			if arg_163_1.time_ >= var_166_5 + var_166_6 and arg_163_1.time_ < var_166_5 + var_166_6 + arg_166_0 and arg_163_1.var_.characterEffect1027ui_story then
				local var_166_9 = 0.5

				arg_163_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1027ui_story.fillRatio = var_166_9
			end

			local var_166_10 = arg_163_1.actors_["1027ui_story"].transform
			local var_166_11 = 0

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				arg_163_1.var_.moveOldPos1027ui_story = var_166_10.localPosition
			end

			local var_166_12 = 0.001

			if var_166_11 <= arg_163_1.time_ and arg_163_1.time_ < var_166_11 + var_166_12 then
				local var_166_13 = (arg_163_1.time_ - var_166_11) / var_166_12
				local var_166_14 = Vector3.New(10, -0.922, -5.1)

				var_166_10.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1027ui_story, var_166_14, var_166_13)

				local var_166_15 = manager.ui.mainCamera.transform.position - var_166_10.position

				var_166_10.forward = Vector3.New(var_166_15.x, var_166_15.y, var_166_15.z)

				local var_166_16 = var_166_10.localEulerAngles

				var_166_16.z = 0
				var_166_16.x = 0
				var_166_10.localEulerAngles = var_166_16
			end

			if arg_163_1.time_ >= var_166_11 + var_166_12 and arg_163_1.time_ < var_166_11 + var_166_12 + arg_166_0 then
				var_166_10.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_166_17 = manager.ui.mainCamera.transform.position - var_166_10.position

				var_166_10.forward = Vector3.New(var_166_17.x, var_166_17.y, var_166_17.z)

				local var_166_18 = var_166_10.localEulerAngles

				var_166_18.z = 0
				var_166_18.x = 0
				var_166_10.localEulerAngles = var_166_18
			end

			local var_166_19 = arg_163_1.actors_["1148ui_story"].transform
			local var_166_20 = 0

			if var_166_20 < arg_163_1.time_ and arg_163_1.time_ <= var_166_20 + arg_166_0 then
				arg_163_1.var_.moveOldPos1148ui_story = var_166_19.localPosition
			end

			local var_166_21 = 0.001

			if var_166_20 <= arg_163_1.time_ and arg_163_1.time_ < var_166_20 + var_166_21 then
				local var_166_22 = (arg_163_1.time_ - var_166_20) / var_166_21
				local var_166_23 = Vector3.New(0, -0.85, -5.6)

				var_166_19.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1148ui_story, var_166_23, var_166_22)

				local var_166_24 = manager.ui.mainCamera.transform.position - var_166_19.position

				var_166_19.forward = Vector3.New(var_166_24.x, var_166_24.y, var_166_24.z)

				local var_166_25 = var_166_19.localEulerAngles

				var_166_25.z = 0
				var_166_25.x = 0
				var_166_19.localEulerAngles = var_166_25
			end

			if arg_163_1.time_ >= var_166_20 + var_166_21 and arg_163_1.time_ < var_166_20 + var_166_21 + arg_166_0 then
				var_166_19.localPosition = Vector3.New(0, -0.85, -5.6)

				local var_166_26 = manager.ui.mainCamera.transform.position - var_166_19.position

				var_166_19.forward = Vector3.New(var_166_26.x, var_166_26.y, var_166_26.z)

				local var_166_27 = var_166_19.localEulerAngles

				var_166_27.z = 0
				var_166_27.x = 0
				var_166_19.localEulerAngles = var_166_27
			end

			local var_166_28 = 0

			if var_166_28 < arg_163_1.time_ and arg_163_1.time_ <= var_166_28 + arg_166_0 then
				arg_163_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
			end

			local var_166_29 = 0

			if var_166_29 < arg_163_1.time_ and arg_163_1.time_ <= var_166_29 + arg_166_0 then
				arg_163_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1303cva")
			end

			local var_166_30 = 0
			local var_166_31 = 0.475

			if var_166_30 < arg_163_1.time_ and arg_163_1.time_ <= var_166_30 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_32 = arg_163_1:FormatText(StoryNameCfg[8].name)

				arg_163_1.leftNameTxt_.text = var_166_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_33 = arg_163_1:GetWordFromCfg(103903041)
				local var_166_34 = arg_163_1:FormatText(var_166_33.content)

				arg_163_1.text_.text = var_166_34

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_35 = 19
				local var_166_36 = utf8.len(var_166_34)
				local var_166_37 = var_166_35 <= 0 and var_166_31 or var_166_31 * (var_166_36 / var_166_35)

				if var_166_37 > 0 and var_166_31 < var_166_37 then
					arg_163_1.talkMaxDuration = var_166_37

					if var_166_37 + var_166_30 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_37 + var_166_30
					end
				end

				arg_163_1.text_.text = var_166_34
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903041", "story_v_side_old_103903.awb") ~= 0 then
					local var_166_38 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903041", "story_v_side_old_103903.awb") / 1000

					if var_166_38 + var_166_30 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_38 + var_166_30
					end

					if var_166_33.prefab_name ~= "" and arg_163_1.actors_[var_166_33.prefab_name] ~= nil then
						local var_166_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_33.prefab_name].transform, "story_v_side_old_103903", "103903041", "story_v_side_old_103903.awb")

						arg_163_1:RecordAudio("103903041", var_166_39)
						arg_163_1:RecordAudio("103903041", var_166_39)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903041", "story_v_side_old_103903.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903041", "story_v_side_old_103903.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_40 = math.max(var_166_31, arg_163_1.talkMaxDuration)

			if var_166_30 <= arg_163_1.time_ and arg_163_1.time_ < var_166_30 + var_166_40 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_30) / var_166_40

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_30 + var_166_40 and arg_163_1.time_ < var_166_30 + var_166_40 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play103903042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 103903042
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play103903043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1148ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1148ui_story == nil then
				arg_167_1.var_.characterEffect1148ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.1

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1148ui_story then
					local var_170_4 = Mathf.Lerp(0, 0.5, var_170_3)

					arg_167_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1148ui_story.fillRatio = var_170_4
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1148ui_story then
				local var_170_5 = 0.5

				arg_167_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1148ui_story.fillRatio = var_170_5
			end

			local var_170_6 = arg_167_1.actors_["1148ui_story"].transform
			local var_170_7 = 0

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 then
				arg_167_1.var_.moveOldPos1148ui_story = var_170_6.localPosition
			end

			local var_170_8 = 0.001

			if var_170_7 <= arg_167_1.time_ and arg_167_1.time_ < var_170_7 + var_170_8 then
				local var_170_9 = (arg_167_1.time_ - var_170_7) / var_170_8
				local var_170_10 = Vector3.New(10, -0.85, -5.6)

				var_170_6.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1148ui_story, var_170_10, var_170_9)

				local var_170_11 = manager.ui.mainCamera.transform.position - var_170_6.position

				var_170_6.forward = Vector3.New(var_170_11.x, var_170_11.y, var_170_11.z)

				local var_170_12 = var_170_6.localEulerAngles

				var_170_12.z = 0
				var_170_12.x = 0
				var_170_6.localEulerAngles = var_170_12
			end

			if arg_167_1.time_ >= var_170_7 + var_170_8 and arg_167_1.time_ < var_170_7 + var_170_8 + arg_170_0 then
				var_170_6.localPosition = Vector3.New(10, -0.85, -5.6)

				local var_170_13 = manager.ui.mainCamera.transform.position - var_170_6.position

				var_170_6.forward = Vector3.New(var_170_13.x, var_170_13.y, var_170_13.z)

				local var_170_14 = var_170_6.localEulerAngles

				var_170_14.z = 0
				var_170_14.x = 0
				var_170_6.localEulerAngles = var_170_14
			end

			local var_170_15 = 0

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 then
				arg_167_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_170_16 = 0
			local var_170_17 = 0.8

			if var_170_16 < arg_167_1.time_ and arg_167_1.time_ <= var_170_16 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_18 = arg_167_1:GetWordFromCfg(103903042)
				local var_170_19 = arg_167_1:FormatText(var_170_18.content)

				arg_167_1.text_.text = var_170_19

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_20 = 32
				local var_170_21 = utf8.len(var_170_19)
				local var_170_22 = var_170_20 <= 0 and var_170_17 or var_170_17 * (var_170_21 / var_170_20)

				if var_170_22 > 0 and var_170_17 < var_170_22 then
					arg_167_1.talkMaxDuration = var_170_22

					if var_170_22 + var_170_16 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_22 + var_170_16
					end
				end

				arg_167_1.text_.text = var_170_19
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_23 = math.max(var_170_17, arg_167_1.talkMaxDuration)

			if var_170_16 <= arg_167_1.time_ and arg_167_1.time_ < var_170_16 + var_170_23 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_16) / var_170_23

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_16 + var_170_23 and arg_167_1.time_ < var_170_16 + var_170_23 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play103903043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 103903043
		arg_171_1.duration_ = 1.999999999999

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play103903044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1027ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect1027ui_story == nil then
				arg_171_1.var_.characterEffect1027ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.1

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect1027ui_story then
					arg_171_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect1027ui_story then
				arg_171_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_174_4 = arg_171_1.actors_["1148ui_story"]
			local var_174_5 = 0

			if var_174_5 < arg_171_1.time_ and arg_171_1.time_ <= var_174_5 + arg_174_0 and arg_171_1.var_.characterEffect1148ui_story == nil then
				arg_171_1.var_.characterEffect1148ui_story = var_174_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_6 = 0.1

			if var_174_5 <= arg_171_1.time_ and arg_171_1.time_ < var_174_5 + var_174_6 then
				local var_174_7 = (arg_171_1.time_ - var_174_5) / var_174_6

				if arg_171_1.var_.characterEffect1148ui_story then
					arg_171_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_5 + var_174_6 and arg_171_1.time_ < var_174_5 + var_174_6 + arg_174_0 and arg_171_1.var_.characterEffect1148ui_story then
				arg_171_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_174_8 = arg_171_1.actors_["1027ui_story"].transform
			local var_174_9 = 0

			if var_174_9 < arg_171_1.time_ and arg_171_1.time_ <= var_174_9 + arg_174_0 then
				arg_171_1.var_.moveOldPos1027ui_story = var_174_8.localPosition
			end

			local var_174_10 = 0.001

			if var_174_9 <= arg_171_1.time_ and arg_171_1.time_ < var_174_9 + var_174_10 then
				local var_174_11 = (arg_171_1.time_ - var_174_9) / var_174_10
				local var_174_12 = Vector3.New(-0.92, -0.922, -5.1)

				var_174_8.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1027ui_story, var_174_12, var_174_11)

				local var_174_13 = manager.ui.mainCamera.transform.position - var_174_8.position

				var_174_8.forward = Vector3.New(var_174_13.x, var_174_13.y, var_174_13.z)

				local var_174_14 = var_174_8.localEulerAngles

				var_174_14.z = 0
				var_174_14.x = 0
				var_174_8.localEulerAngles = var_174_14
			end

			if arg_171_1.time_ >= var_174_9 + var_174_10 and arg_171_1.time_ < var_174_9 + var_174_10 + arg_174_0 then
				var_174_8.localPosition = Vector3.New(-0.92, -0.922, -5.1)

				local var_174_15 = manager.ui.mainCamera.transform.position - var_174_8.position

				var_174_8.forward = Vector3.New(var_174_15.x, var_174_15.y, var_174_15.z)

				local var_174_16 = var_174_8.localEulerAngles

				var_174_16.z = 0
				var_174_16.x = 0
				var_174_8.localEulerAngles = var_174_16
			end

			local var_174_17 = 0

			if var_174_17 < arg_171_1.time_ and arg_171_1.time_ <= var_174_17 + arg_174_0 then
				arg_171_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_174_18 = arg_171_1.actors_["1148ui_story"].transform
			local var_174_19 = 0

			if var_174_19 < arg_171_1.time_ and arg_171_1.time_ <= var_174_19 + arg_174_0 then
				arg_171_1.var_.moveOldPos1148ui_story = var_174_18.localPosition
			end

			local var_174_20 = 0.001

			if var_174_19 <= arg_171_1.time_ and arg_171_1.time_ < var_174_19 + var_174_20 then
				local var_174_21 = (arg_171_1.time_ - var_174_19) / var_174_20
				local var_174_22 = Vector3.New(0.83, -0.85, -5.6)

				var_174_18.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1148ui_story, var_174_22, var_174_21)

				local var_174_23 = manager.ui.mainCamera.transform.position - var_174_18.position

				var_174_18.forward = Vector3.New(var_174_23.x, var_174_23.y, var_174_23.z)

				local var_174_24 = var_174_18.localEulerAngles

				var_174_24.z = 0
				var_174_24.x = 0
				var_174_18.localEulerAngles = var_174_24
			end

			if arg_171_1.time_ >= var_174_19 + var_174_20 and arg_171_1.time_ < var_174_19 + var_174_20 + arg_174_0 then
				var_174_18.localPosition = Vector3.New(0.83, -0.85, -5.6)

				local var_174_25 = manager.ui.mainCamera.transform.position - var_174_18.position

				var_174_18.forward = Vector3.New(var_174_25.x, var_174_25.y, var_174_25.z)

				local var_174_26 = var_174_18.localEulerAngles

				var_174_26.z = 0
				var_174_26.x = 0
				var_174_18.localEulerAngles = var_174_26
			end

			local var_174_27 = 0

			if var_174_27 < arg_171_1.time_ and arg_171_1.time_ <= var_174_27 + arg_174_0 then
				arg_171_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action9_1")
			end

			local var_174_28 = 0

			if var_174_28 < arg_171_1.time_ and arg_171_1.time_ <= var_174_28 + arg_174_0 then
				arg_171_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_174_29 = 0
			local var_174_30 = 0.05

			if var_174_29 < arg_171_1.time_ and arg_171_1.time_ <= var_174_29 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_31 = arg_171_1:FormatText(StoryNameCfg[114].name)

				arg_171_1.leftNameTxt_.text = var_174_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_32 = arg_171_1:GetWordFromCfg(103903043)
				local var_174_33 = arg_171_1:FormatText(var_174_32.content)

				arg_171_1.text_.text = var_174_33

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_34 = 2
				local var_174_35 = utf8.len(var_174_33)
				local var_174_36 = var_174_34 <= 0 and var_174_30 or var_174_30 * (var_174_35 / var_174_34)

				if var_174_36 > 0 and var_174_30 < var_174_36 then
					arg_171_1.talkMaxDuration = var_174_36

					if var_174_36 + var_174_29 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_36 + var_174_29
					end
				end

				arg_171_1.text_.text = var_174_33
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903043", "story_v_side_old_103903.awb") ~= 0 then
					local var_174_37 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903043", "story_v_side_old_103903.awb") / 1000

					if var_174_37 + var_174_29 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_37 + var_174_29
					end

					if var_174_32.prefab_name ~= "" and arg_171_1.actors_[var_174_32.prefab_name] ~= nil then
						local var_174_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_32.prefab_name].transform, "story_v_side_old_103903", "103903043", "story_v_side_old_103903.awb")

						arg_171_1:RecordAudio("103903043", var_174_38)
						arg_171_1:RecordAudio("103903043", var_174_38)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903043", "story_v_side_old_103903.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903043", "story_v_side_old_103903.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_39 = math.max(var_174_30, arg_171_1.talkMaxDuration)

			if var_174_29 <= arg_171_1.time_ and arg_171_1.time_ < var_174_29 + var_174_39 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_29) / var_174_39

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_29 + var_174_39 and arg_171_1.time_ < var_174_29 + var_174_39 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play103903044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 103903044
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play103903045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.75

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_2 = arg_175_1:GetWordFromCfg(103903044)
				local var_178_3 = arg_175_1:FormatText(var_178_2.content)

				arg_175_1.text_.text = var_178_3

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_4 = 30
				local var_178_5 = utf8.len(var_178_3)
				local var_178_6 = var_178_4 <= 0 and var_178_1 or var_178_1 * (var_178_5 / var_178_4)

				if var_178_6 > 0 and var_178_1 < var_178_6 then
					arg_175_1.talkMaxDuration = var_178_6

					if var_178_6 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_6 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_3
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_7 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_7 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_7

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_7 and arg_175_1.time_ < var_178_0 + var_178_7 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play103903045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 103903045
		arg_179_1.duration_ = 4.1

		local var_179_0 = {
			ja = 4.1,
			ko = 3.566,
			zh = 3.566,
			en = 3.3
		}
		local var_179_1 = manager.audio:GetLocalizationFlag()

		if var_179_0[var_179_1] ~= nil then
			arg_179_1.duration_ = var_179_0[var_179_1]
		end

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play103903046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1039ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1039ui_story == nil then
				arg_179_1.var_.characterEffect1039ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.1

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1039ui_story then
					arg_179_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1039ui_story then
				arg_179_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_182_4 = arg_179_1.actors_["1027ui_story"]
			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 and arg_179_1.var_.characterEffect1027ui_story == nil then
				arg_179_1.var_.characterEffect1027ui_story = var_182_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_6 = 0.1

			if var_182_5 <= arg_179_1.time_ and arg_179_1.time_ < var_182_5 + var_182_6 then
				local var_182_7 = (arg_179_1.time_ - var_182_5) / var_182_6

				if arg_179_1.var_.characterEffect1027ui_story then
					local var_182_8 = Mathf.Lerp(0, 0.5, var_182_7)

					arg_179_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1027ui_story.fillRatio = var_182_8
				end
			end

			if arg_179_1.time_ >= var_182_5 + var_182_6 and arg_179_1.time_ < var_182_5 + var_182_6 + arg_182_0 and arg_179_1.var_.characterEffect1027ui_story then
				local var_182_9 = 0.5

				arg_179_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1027ui_story.fillRatio = var_182_9
			end

			local var_182_10 = arg_179_1.actors_["1148ui_story"]
			local var_182_11 = 0

			if var_182_11 < arg_179_1.time_ and arg_179_1.time_ <= var_182_11 + arg_182_0 and arg_179_1.var_.characterEffect1148ui_story == nil then
				arg_179_1.var_.characterEffect1148ui_story = var_182_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_12 = 0.1

			if var_182_11 <= arg_179_1.time_ and arg_179_1.time_ < var_182_11 + var_182_12 then
				local var_182_13 = (arg_179_1.time_ - var_182_11) / var_182_12

				if arg_179_1.var_.characterEffect1148ui_story then
					local var_182_14 = Mathf.Lerp(0, 0.5, var_182_13)

					arg_179_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1148ui_story.fillRatio = var_182_14
				end
			end

			if arg_179_1.time_ >= var_182_11 + var_182_12 and arg_179_1.time_ < var_182_11 + var_182_12 + arg_182_0 and arg_179_1.var_.characterEffect1148ui_story then
				local var_182_15 = 0.5

				arg_179_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1148ui_story.fillRatio = var_182_15
			end

			local var_182_16 = arg_179_1.actors_["1027ui_story"].transform
			local var_182_17 = 0

			if var_182_17 < arg_179_1.time_ and arg_179_1.time_ <= var_182_17 + arg_182_0 then
				arg_179_1.var_.moveOldPos1027ui_story = var_182_16.localPosition
			end

			local var_182_18 = 0.001

			if var_182_17 <= arg_179_1.time_ and arg_179_1.time_ < var_182_17 + var_182_18 then
				local var_182_19 = (arg_179_1.time_ - var_182_17) / var_182_18
				local var_182_20 = Vector3.New(10, -0.922, -5.1)

				var_182_16.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1027ui_story, var_182_20, var_182_19)

				local var_182_21 = manager.ui.mainCamera.transform.position - var_182_16.position

				var_182_16.forward = Vector3.New(var_182_21.x, var_182_21.y, var_182_21.z)

				local var_182_22 = var_182_16.localEulerAngles

				var_182_22.z = 0
				var_182_22.x = 0
				var_182_16.localEulerAngles = var_182_22
			end

			if arg_179_1.time_ >= var_182_17 + var_182_18 and arg_179_1.time_ < var_182_17 + var_182_18 + arg_182_0 then
				var_182_16.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_182_23 = manager.ui.mainCamera.transform.position - var_182_16.position

				var_182_16.forward = Vector3.New(var_182_23.x, var_182_23.y, var_182_23.z)

				local var_182_24 = var_182_16.localEulerAngles

				var_182_24.z = 0
				var_182_24.x = 0
				var_182_16.localEulerAngles = var_182_24
			end

			local var_182_25 = arg_179_1.actors_["1148ui_story"].transform
			local var_182_26 = 0

			if var_182_26 < arg_179_1.time_ and arg_179_1.time_ <= var_182_26 + arg_182_0 then
				arg_179_1.var_.moveOldPos1148ui_story = var_182_25.localPosition
			end

			local var_182_27 = 0.001

			if var_182_26 <= arg_179_1.time_ and arg_179_1.time_ < var_182_26 + var_182_27 then
				local var_182_28 = (arg_179_1.time_ - var_182_26) / var_182_27
				local var_182_29 = Vector3.New(10, -0.85, -5.6)

				var_182_25.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1148ui_story, var_182_29, var_182_28)

				local var_182_30 = manager.ui.mainCamera.transform.position - var_182_25.position

				var_182_25.forward = Vector3.New(var_182_30.x, var_182_30.y, var_182_30.z)

				local var_182_31 = var_182_25.localEulerAngles

				var_182_31.z = 0
				var_182_31.x = 0
				var_182_25.localEulerAngles = var_182_31
			end

			if arg_179_1.time_ >= var_182_26 + var_182_27 and arg_179_1.time_ < var_182_26 + var_182_27 + arg_182_0 then
				var_182_25.localPosition = Vector3.New(10, -0.85, -5.6)

				local var_182_32 = manager.ui.mainCamera.transform.position - var_182_25.position

				var_182_25.forward = Vector3.New(var_182_32.x, var_182_32.y, var_182_32.z)

				local var_182_33 = var_182_25.localEulerAngles

				var_182_33.z = 0
				var_182_33.x = 0
				var_182_25.localEulerAngles = var_182_33
			end

			local var_182_34 = arg_179_1.actors_["1039ui_story"].transform
			local var_182_35 = 0

			if var_182_35 < arg_179_1.time_ and arg_179_1.time_ <= var_182_35 + arg_182_0 then
				arg_179_1.var_.moveOldPos1039ui_story = var_182_34.localPosition
			end

			local var_182_36 = 0.001

			if var_182_35 <= arg_179_1.time_ and arg_179_1.time_ < var_182_35 + var_182_36 then
				local var_182_37 = (arg_179_1.time_ - var_182_35) / var_182_36
				local var_182_38 = Vector3.New(0, -1.06, -5.3)

				var_182_34.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1039ui_story, var_182_38, var_182_37)

				local var_182_39 = manager.ui.mainCamera.transform.position - var_182_34.position

				var_182_34.forward = Vector3.New(var_182_39.x, var_182_39.y, var_182_39.z)

				local var_182_40 = var_182_34.localEulerAngles

				var_182_40.z = 0
				var_182_40.x = 0
				var_182_34.localEulerAngles = var_182_40
			end

			if arg_179_1.time_ >= var_182_35 + var_182_36 and arg_179_1.time_ < var_182_35 + var_182_36 + arg_182_0 then
				var_182_34.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_182_41 = manager.ui.mainCamera.transform.position - var_182_34.position

				var_182_34.forward = Vector3.New(var_182_41.x, var_182_41.y, var_182_41.z)

				local var_182_42 = var_182_34.localEulerAngles

				var_182_42.z = 0
				var_182_42.x = 0
				var_182_34.localEulerAngles = var_182_42
			end

			local var_182_43 = 0

			if var_182_43 < arg_179_1.time_ and arg_179_1.time_ <= var_182_43 + arg_182_0 then
				arg_179_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action4_1")
			end

			local var_182_44 = 0

			if var_182_44 < arg_179_1.time_ and arg_179_1.time_ <= var_182_44 + arg_182_0 then
				arg_179_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_182_45 = 0
			local var_182_46 = 0.35

			if var_182_45 < arg_179_1.time_ and arg_179_1.time_ <= var_182_45 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_47 = arg_179_1:FormatText(StoryNameCfg[9].name)

				arg_179_1.leftNameTxt_.text = var_182_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_48 = arg_179_1:GetWordFromCfg(103903045)
				local var_182_49 = arg_179_1:FormatText(var_182_48.content)

				arg_179_1.text_.text = var_182_49

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_50 = 14
				local var_182_51 = utf8.len(var_182_49)
				local var_182_52 = var_182_50 <= 0 and var_182_46 or var_182_46 * (var_182_51 / var_182_50)

				if var_182_52 > 0 and var_182_46 < var_182_52 then
					arg_179_1.talkMaxDuration = var_182_52

					if var_182_52 + var_182_45 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_52 + var_182_45
					end
				end

				arg_179_1.text_.text = var_182_49
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903045", "story_v_side_old_103903.awb") ~= 0 then
					local var_182_53 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903045", "story_v_side_old_103903.awb") / 1000

					if var_182_53 + var_182_45 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_53 + var_182_45
					end

					if var_182_48.prefab_name ~= "" and arg_179_1.actors_[var_182_48.prefab_name] ~= nil then
						local var_182_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_48.prefab_name].transform, "story_v_side_old_103903", "103903045", "story_v_side_old_103903.awb")

						arg_179_1:RecordAudio("103903045", var_182_54)
						arg_179_1:RecordAudio("103903045", var_182_54)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903045", "story_v_side_old_103903.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903045", "story_v_side_old_103903.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_55 = math.max(var_182_46, arg_179_1.talkMaxDuration)

			if var_182_45 <= arg_179_1.time_ and arg_179_1.time_ < var_182_45 + var_182_55 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_45) / var_182_55

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_45 + var_182_55 and arg_179_1.time_ < var_182_45 + var_182_55 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play103903046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 103903046
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play103903047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1039ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1039ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(10, -1.06, -5.3)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1039ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = 0
			local var_186_10 = 0.65

			if var_186_9 < arg_183_1.time_ and arg_183_1.time_ <= var_186_9 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_11 = arg_183_1:GetWordFromCfg(103903046)
				local var_186_12 = arg_183_1:FormatText(var_186_11.content)

				arg_183_1.text_.text = var_186_12

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_13 = 26
				local var_186_14 = utf8.len(var_186_12)
				local var_186_15 = var_186_13 <= 0 and var_186_10 or var_186_10 * (var_186_14 / var_186_13)

				if var_186_15 > 0 and var_186_10 < var_186_15 then
					arg_183_1.talkMaxDuration = var_186_15

					if var_186_15 + var_186_9 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_15 + var_186_9
					end
				end

				arg_183_1.text_.text = var_186_12
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_16 = math.max(var_186_10, arg_183_1.talkMaxDuration)

			if var_186_9 <= arg_183_1.time_ and arg_183_1.time_ < var_186_9 + var_186_16 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_9) / var_186_16

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_9 + var_186_16 and arg_183_1.time_ < var_186_9 + var_186_16 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play103903047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 103903047
		arg_187_1.duration_ = 3

		local var_187_0 = {
			ja = 2.766,
			ko = 3,
			zh = 3,
			en = 1.999999999999
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
				arg_187_0:Play103903048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1027ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1027ui_story == nil then
				arg_187_1.var_.characterEffect1027ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.1

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1027ui_story then
					arg_187_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1027ui_story then
				arg_187_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_190_4 = arg_187_1.actors_["1148ui_story"]
			local var_190_5 = 0

			if var_190_5 < arg_187_1.time_ and arg_187_1.time_ <= var_190_5 + arg_190_0 and arg_187_1.var_.characterEffect1148ui_story == nil then
				arg_187_1.var_.characterEffect1148ui_story = var_190_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_6 = 0.1

			if var_190_5 <= arg_187_1.time_ and arg_187_1.time_ < var_190_5 + var_190_6 then
				local var_190_7 = (arg_187_1.time_ - var_190_5) / var_190_6

				if arg_187_1.var_.characterEffect1148ui_story then
					arg_187_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_5 + var_190_6 and arg_187_1.time_ < var_190_5 + var_190_6 + arg_190_0 and arg_187_1.var_.characterEffect1148ui_story then
				arg_187_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_190_8 = arg_187_1.actors_["1027ui_story"].transform
			local var_190_9 = 0

			if var_190_9 < arg_187_1.time_ and arg_187_1.time_ <= var_190_9 + arg_190_0 then
				arg_187_1.var_.moveOldPos1027ui_story = var_190_8.localPosition
			end

			local var_190_10 = 0.001

			if var_190_9 <= arg_187_1.time_ and arg_187_1.time_ < var_190_9 + var_190_10 then
				local var_190_11 = (arg_187_1.time_ - var_190_9) / var_190_10
				local var_190_12 = Vector3.New(-0.92, -0.922, -5.1)

				var_190_8.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1027ui_story, var_190_12, var_190_11)

				local var_190_13 = manager.ui.mainCamera.transform.position - var_190_8.position

				var_190_8.forward = Vector3.New(var_190_13.x, var_190_13.y, var_190_13.z)

				local var_190_14 = var_190_8.localEulerAngles

				var_190_14.z = 0
				var_190_14.x = 0
				var_190_8.localEulerAngles = var_190_14
			end

			if arg_187_1.time_ >= var_190_9 + var_190_10 and arg_187_1.time_ < var_190_9 + var_190_10 + arg_190_0 then
				var_190_8.localPosition = Vector3.New(-0.92, -0.922, -5.1)

				local var_190_15 = manager.ui.mainCamera.transform.position - var_190_8.position

				var_190_8.forward = Vector3.New(var_190_15.x, var_190_15.y, var_190_15.z)

				local var_190_16 = var_190_8.localEulerAngles

				var_190_16.z = 0
				var_190_16.x = 0
				var_190_8.localEulerAngles = var_190_16
			end

			local var_190_17 = 0

			if var_190_17 < arg_187_1.time_ and arg_187_1.time_ <= var_190_17 + arg_190_0 then
				arg_187_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_190_18 = arg_187_1.actors_["1148ui_story"].transform
			local var_190_19 = 0

			if var_190_19 < arg_187_1.time_ and arg_187_1.time_ <= var_190_19 + arg_190_0 then
				arg_187_1.var_.moveOldPos1148ui_story = var_190_18.localPosition
			end

			local var_190_20 = 0.001

			if var_190_19 <= arg_187_1.time_ and arg_187_1.time_ < var_190_19 + var_190_20 then
				local var_190_21 = (arg_187_1.time_ - var_190_19) / var_190_20
				local var_190_22 = Vector3.New(0.83, -0.85, -5.6)

				var_190_18.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1148ui_story, var_190_22, var_190_21)

				local var_190_23 = manager.ui.mainCamera.transform.position - var_190_18.position

				var_190_18.forward = Vector3.New(var_190_23.x, var_190_23.y, var_190_23.z)

				local var_190_24 = var_190_18.localEulerAngles

				var_190_24.z = 0
				var_190_24.x = 0
				var_190_18.localEulerAngles = var_190_24
			end

			if arg_187_1.time_ >= var_190_19 + var_190_20 and arg_187_1.time_ < var_190_19 + var_190_20 + arg_190_0 then
				var_190_18.localPosition = Vector3.New(0.83, -0.85, -5.6)

				local var_190_25 = manager.ui.mainCamera.transform.position - var_190_18.position

				var_190_18.forward = Vector3.New(var_190_25.x, var_190_25.y, var_190_25.z)

				local var_190_26 = var_190_18.localEulerAngles

				var_190_26.z = 0
				var_190_26.x = 0
				var_190_18.localEulerAngles = var_190_26
			end

			local var_190_27 = 0

			if var_190_27 < arg_187_1.time_ and arg_187_1.time_ <= var_190_27 + arg_190_0 then
				arg_187_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action3_1")
			end

			local var_190_28 = 0

			if var_190_28 < arg_187_1.time_ and arg_187_1.time_ <= var_190_28 + arg_190_0 then
				arg_187_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_190_29 = 0
			local var_190_30 = 0.075

			if var_190_29 < arg_187_1.time_ and arg_187_1.time_ <= var_190_29 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_31 = arg_187_1:FormatText(StoryNameCfg[114].name)

				arg_187_1.leftNameTxt_.text = var_190_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_32 = arg_187_1:GetWordFromCfg(103903047)
				local var_190_33 = arg_187_1:FormatText(var_190_32.content)

				arg_187_1.text_.text = var_190_33

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_34 = 3
				local var_190_35 = utf8.len(var_190_33)
				local var_190_36 = var_190_34 <= 0 and var_190_30 or var_190_30 * (var_190_35 / var_190_34)

				if var_190_36 > 0 and var_190_30 < var_190_36 then
					arg_187_1.talkMaxDuration = var_190_36

					if var_190_36 + var_190_29 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_36 + var_190_29
					end
				end

				arg_187_1.text_.text = var_190_33
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903047", "story_v_side_old_103903.awb") ~= 0 then
					local var_190_37 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903047", "story_v_side_old_103903.awb") / 1000

					if var_190_37 + var_190_29 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_37 + var_190_29
					end

					if var_190_32.prefab_name ~= "" and arg_187_1.actors_[var_190_32.prefab_name] ~= nil then
						local var_190_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_32.prefab_name].transform, "story_v_side_old_103903", "103903047", "story_v_side_old_103903.awb")

						arg_187_1:RecordAudio("103903047", var_190_38)
						arg_187_1:RecordAudio("103903047", var_190_38)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903047", "story_v_side_old_103903.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903047", "story_v_side_old_103903.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_39 = math.max(var_190_30, arg_187_1.talkMaxDuration)

			if var_190_29 <= arg_187_1.time_ and arg_187_1.time_ < var_190_29 + var_190_39 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_29) / var_190_39

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_29 + var_190_39 and arg_187_1.time_ < var_190_29 + var_190_39 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play103903048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 103903048
		arg_191_1.duration_ = 1.2

		local var_191_0 = {
			ja = 1.133,
			ko = 1.033,
			zh = 1.033,
			en = 1.2
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
				arg_191_0:Play103903049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_194_1 = 0
			local var_194_2 = 0.025

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_3 = arg_191_1:FormatText(StoryNameCfg[114].name)

				arg_191_1.leftNameTxt_.text = var_194_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_4 = arg_191_1:GetWordFromCfg(103903048)
				local var_194_5 = arg_191_1:FormatText(var_194_4.content)

				arg_191_1.text_.text = var_194_5

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_6 = 1
				local var_194_7 = utf8.len(var_194_5)
				local var_194_8 = var_194_6 <= 0 and var_194_2 or var_194_2 * (var_194_7 / var_194_6)

				if var_194_8 > 0 and var_194_2 < var_194_8 then
					arg_191_1.talkMaxDuration = var_194_8

					if var_194_8 + var_194_1 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_8 + var_194_1
					end
				end

				arg_191_1.text_.text = var_194_5
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903048", "story_v_side_old_103903.awb") ~= 0 then
					local var_194_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903048", "story_v_side_old_103903.awb") / 1000

					if var_194_9 + var_194_1 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_9 + var_194_1
					end

					if var_194_4.prefab_name ~= "" and arg_191_1.actors_[var_194_4.prefab_name] ~= nil then
						local var_194_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_4.prefab_name].transform, "story_v_side_old_103903", "103903048", "story_v_side_old_103903.awb")

						arg_191_1:RecordAudio("103903048", var_194_10)
						arg_191_1:RecordAudio("103903048", var_194_10)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903048", "story_v_side_old_103903.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903048", "story_v_side_old_103903.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_11 = math.max(var_194_2, arg_191_1.talkMaxDuration)

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_11 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_1) / var_194_11

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_1 + var_194_11 and arg_191_1.time_ < var_194_1 + var_194_11 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play103903049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 103903049
		arg_195_1.duration_ = 3.866

		local var_195_0 = {
			ja = 3.7,
			ko = 3.166,
			zh = 3.166,
			en = 3.866
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
				arg_195_0:Play103903050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1148ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1148ui_story == nil then
				arg_195_1.var_.characterEffect1148ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.1

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1148ui_story then
					local var_198_4 = Mathf.Lerp(0, 0.5, var_198_3)

					arg_195_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1148ui_story.fillRatio = var_198_4
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1148ui_story then
				local var_198_5 = 0.5

				arg_195_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1148ui_story.fillRatio = var_198_5
			end

			local var_198_6 = 0

			if var_198_6 < arg_195_1.time_ and arg_195_1.time_ <= var_198_6 + arg_198_0 then
				arg_195_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action423")
			end

			local var_198_7 = 0

			if var_198_7 < arg_195_1.time_ and arg_195_1.time_ <= var_198_7 + arg_198_0 then
				arg_195_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_198_8 = 0
			local var_198_9 = 0.225

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_10 = arg_195_1:FormatText(StoryNameCfg[56].name)

				arg_195_1.leftNameTxt_.text = var_198_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_11 = arg_195_1:GetWordFromCfg(103903049)
				local var_198_12 = arg_195_1:FormatText(var_198_11.content)

				arg_195_1.text_.text = var_198_12

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_13 = 9
				local var_198_14 = utf8.len(var_198_12)
				local var_198_15 = var_198_13 <= 0 and var_198_9 or var_198_9 * (var_198_14 / var_198_13)

				if var_198_15 > 0 and var_198_9 < var_198_15 then
					arg_195_1.talkMaxDuration = var_198_15

					if var_198_15 + var_198_8 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_15 + var_198_8
					end
				end

				arg_195_1.text_.text = var_198_12
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903049", "story_v_side_old_103903.awb") ~= 0 then
					local var_198_16 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903049", "story_v_side_old_103903.awb") / 1000

					if var_198_16 + var_198_8 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_16 + var_198_8
					end

					if var_198_11.prefab_name ~= "" and arg_195_1.actors_[var_198_11.prefab_name] ~= nil then
						local var_198_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_11.prefab_name].transform, "story_v_side_old_103903", "103903049", "story_v_side_old_103903.awb")

						arg_195_1:RecordAudio("103903049", var_198_17)
						arg_195_1:RecordAudio("103903049", var_198_17)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903049", "story_v_side_old_103903.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903049", "story_v_side_old_103903.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_18 = math.max(var_198_9, arg_195_1.talkMaxDuration)

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_18 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_8) / var_198_18

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_8 + var_198_18 and arg_195_1.time_ < var_198_8 + var_198_18 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play103903050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 103903050
		arg_199_1.duration_ = 5.966

		local var_199_0 = {
			ja = 5.233,
			ko = 5.4,
			zh = 5.4,
			en = 5.966
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
				arg_199_0:Play103903051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1148ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect1148ui_story == nil then
				arg_199_1.var_.characterEffect1148ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.1

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect1148ui_story then
					arg_199_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect1148ui_story then
				arg_199_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_202_4 = arg_199_1.actors_["1027ui_story"]
			local var_202_5 = 0

			if var_202_5 < arg_199_1.time_ and arg_199_1.time_ <= var_202_5 + arg_202_0 and arg_199_1.var_.characterEffect1027ui_story == nil then
				arg_199_1.var_.characterEffect1027ui_story = var_202_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_6 = 0.1

			if var_202_5 <= arg_199_1.time_ and arg_199_1.time_ < var_202_5 + var_202_6 then
				local var_202_7 = (arg_199_1.time_ - var_202_5) / var_202_6

				if arg_199_1.var_.characterEffect1027ui_story then
					local var_202_8 = Mathf.Lerp(0, 0.5, var_202_7)

					arg_199_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1027ui_story.fillRatio = var_202_8
				end
			end

			if arg_199_1.time_ >= var_202_5 + var_202_6 and arg_199_1.time_ < var_202_5 + var_202_6 + arg_202_0 and arg_199_1.var_.characterEffect1027ui_story then
				local var_202_9 = 0.5

				arg_199_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1027ui_story.fillRatio = var_202_9
			end

			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action437")
			end

			local var_202_11 = 0

			if var_202_11 < arg_199_1.time_ and arg_199_1.time_ <= var_202_11 + arg_202_0 then
				arg_199_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_202_12 = 0
			local var_202_13 = 0.525

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_14 = arg_199_1:FormatText(StoryNameCfg[8].name)

				arg_199_1.leftNameTxt_.text = var_202_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_15 = arg_199_1:GetWordFromCfg(103903050)
				local var_202_16 = arg_199_1:FormatText(var_202_15.content)

				arg_199_1.text_.text = var_202_16

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_17 = 21
				local var_202_18 = utf8.len(var_202_16)
				local var_202_19 = var_202_17 <= 0 and var_202_13 or var_202_13 * (var_202_18 / var_202_17)

				if var_202_19 > 0 and var_202_13 < var_202_19 then
					arg_199_1.talkMaxDuration = var_202_19

					if var_202_19 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_19 + var_202_12
					end
				end

				arg_199_1.text_.text = var_202_16
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903050", "story_v_side_old_103903.awb") ~= 0 then
					local var_202_20 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903050", "story_v_side_old_103903.awb") / 1000

					if var_202_20 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_12
					end

					if var_202_15.prefab_name ~= "" and arg_199_1.actors_[var_202_15.prefab_name] ~= nil then
						local var_202_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_15.prefab_name].transform, "story_v_side_old_103903", "103903050", "story_v_side_old_103903.awb")

						arg_199_1:RecordAudio("103903050", var_202_21)
						arg_199_1:RecordAudio("103903050", var_202_21)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903050", "story_v_side_old_103903.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903050", "story_v_side_old_103903.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_22 = math.max(var_202_13, arg_199_1.talkMaxDuration)

			if var_202_12 <= arg_199_1.time_ and arg_199_1.time_ < var_202_12 + var_202_22 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_12) / var_202_22

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_12 + var_202_22 and arg_199_1.time_ < var_202_12 + var_202_22 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play103903051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 103903051
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play103903052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1027ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1027ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(10, -0.922, -5.1)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1027ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_206_7 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_7.x, var_206_7.y, var_206_7.z)

				local var_206_8 = var_206_0.localEulerAngles

				var_206_8.z = 0
				var_206_8.x = 0
				var_206_0.localEulerAngles = var_206_8
			end

			local var_206_9 = arg_203_1.actors_["1148ui_story"].transform
			local var_206_10 = 0

			if var_206_10 < arg_203_1.time_ and arg_203_1.time_ <= var_206_10 + arg_206_0 then
				arg_203_1.var_.moveOldPos1148ui_story = var_206_9.localPosition
			end

			local var_206_11 = 0.001

			if var_206_10 <= arg_203_1.time_ and arg_203_1.time_ < var_206_10 + var_206_11 then
				local var_206_12 = (arg_203_1.time_ - var_206_10) / var_206_11
				local var_206_13 = Vector3.New(10, -0.85, -5.6)

				var_206_9.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1148ui_story, var_206_13, var_206_12)

				local var_206_14 = manager.ui.mainCamera.transform.position - var_206_9.position

				var_206_9.forward = Vector3.New(var_206_14.x, var_206_14.y, var_206_14.z)

				local var_206_15 = var_206_9.localEulerAngles

				var_206_15.z = 0
				var_206_15.x = 0
				var_206_9.localEulerAngles = var_206_15
			end

			if arg_203_1.time_ >= var_206_10 + var_206_11 and arg_203_1.time_ < var_206_10 + var_206_11 + arg_206_0 then
				var_206_9.localPosition = Vector3.New(10, -0.85, -5.6)

				local var_206_16 = manager.ui.mainCamera.transform.position - var_206_9.position

				var_206_9.forward = Vector3.New(var_206_16.x, var_206_16.y, var_206_16.z)

				local var_206_17 = var_206_9.localEulerAngles

				var_206_17.z = 0
				var_206_17.x = 0
				var_206_9.localEulerAngles = var_206_17
			end

			local var_206_18 = 0
			local var_206_19 = 0.45

			if var_206_18 < arg_203_1.time_ and arg_203_1.time_ <= var_206_18 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_20 = arg_203_1:GetWordFromCfg(103903051)
				local var_206_21 = arg_203_1:FormatText(var_206_20.content)

				arg_203_1.text_.text = var_206_21

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_22 = 18
				local var_206_23 = utf8.len(var_206_21)
				local var_206_24 = var_206_22 <= 0 and var_206_19 or var_206_19 * (var_206_23 / var_206_22)

				if var_206_24 > 0 and var_206_19 < var_206_24 then
					arg_203_1.talkMaxDuration = var_206_24

					if var_206_24 + var_206_18 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_24 + var_206_18
					end
				end

				arg_203_1.text_.text = var_206_21
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_25 = math.max(var_206_19, arg_203_1.talkMaxDuration)

			if var_206_18 <= arg_203_1.time_ and arg_203_1.time_ < var_206_18 + var_206_25 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_18) / var_206_25

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_18 + var_206_25 and arg_203_1.time_ < var_206_18 + var_206_25 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play103903052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 103903052
		arg_207_1.duration_ = 6.166

		local var_207_0 = {
			ja = 6.166,
			ko = 2.1,
			zh = 2.1,
			en = 2.2
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
				arg_207_0:Play103903053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1039ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1039ui_story == nil then
				arg_207_1.var_.characterEffect1039ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.1

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1039ui_story then
					arg_207_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1039ui_story then
				arg_207_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_210_4 = arg_207_1.bgs_.ST02.transform
			local var_210_5 = 0

			if var_210_5 < arg_207_1.time_ and arg_207_1.time_ <= var_210_5 + arg_210_0 then
				arg_207_1.var_.moveOldPosST02 = var_210_4.localPosition
			end

			local var_210_6 = 0.001

			if var_210_5 <= arg_207_1.time_ and arg_207_1.time_ < var_210_5 + var_210_6 then
				local var_210_7 = (arg_207_1.time_ - var_210_5) / var_210_6
				local var_210_8 = Vector3.New(0, -100, 10)

				var_210_4.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPosST02, var_210_8, var_210_7)
			end

			if arg_207_1.time_ >= var_210_5 + var_210_6 and arg_207_1.time_ < var_210_5 + var_210_6 + arg_210_0 then
				var_210_4.localPosition = Vector3.New(0, -100, 10)
			end

			local var_210_9 = 0

			if var_210_9 < arg_207_1.time_ and arg_207_1.time_ <= var_210_9 + arg_210_0 then
				local var_210_10 = manager.ui.mainCamera.transform.localPosition
				local var_210_11 = Vector3.New(0, 0, 10) + Vector3.New(var_210_10.x, var_210_10.y, 0)
				local var_210_12 = arg_207_1.bgs_.ST03

				var_210_12.transform.localPosition = var_210_11
				var_210_12.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_210_13 = var_210_12:GetComponent("SpriteRenderer")

				if var_210_13 and var_210_13.sprite then
					local var_210_14 = (var_210_12.transform.localPosition - var_210_10).z
					local var_210_15 = manager.ui.mainCameraCom_
					local var_210_16 = 2 * var_210_14 * Mathf.Tan(var_210_15.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_210_17 = var_210_16 * var_210_15.aspect
					local var_210_18 = var_210_13.sprite.bounds.size.x
					local var_210_19 = var_210_13.sprite.bounds.size.y
					local var_210_20 = var_210_17 / var_210_18
					local var_210_21 = var_210_16 / var_210_19
					local var_210_22 = var_210_21 < var_210_20 and var_210_20 or var_210_21

					var_210_12.transform.localScale = Vector3.New(var_210_22, var_210_22, 0)
				end

				for iter_210_0, iter_210_1 in pairs(arg_207_1.bgs_) do
					if iter_210_0 ~= "ST03" then
						iter_210_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_210_23 = arg_207_1.actors_["1039ui_story"].transform
			local var_210_24 = 0

			if var_210_24 < arg_207_1.time_ and arg_207_1.time_ <= var_210_24 + arg_210_0 then
				arg_207_1.var_.moveOldPos1039ui_story = var_210_23.localPosition
			end

			local var_210_25 = 0.001

			if var_210_24 <= arg_207_1.time_ and arg_207_1.time_ < var_210_24 + var_210_25 then
				local var_210_26 = (arg_207_1.time_ - var_210_24) / var_210_25
				local var_210_27 = Vector3.New(0, -1.06, -5.3)

				var_210_23.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1039ui_story, var_210_27, var_210_26)

				local var_210_28 = manager.ui.mainCamera.transform.position - var_210_23.position

				var_210_23.forward = Vector3.New(var_210_28.x, var_210_28.y, var_210_28.z)

				local var_210_29 = var_210_23.localEulerAngles

				var_210_29.z = 0
				var_210_29.x = 0
				var_210_23.localEulerAngles = var_210_29
			end

			if arg_207_1.time_ >= var_210_24 + var_210_25 and arg_207_1.time_ < var_210_24 + var_210_25 + arg_210_0 then
				var_210_23.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_210_30 = manager.ui.mainCamera.transform.position - var_210_23.position

				var_210_23.forward = Vector3.New(var_210_30.x, var_210_30.y, var_210_30.z)

				local var_210_31 = var_210_23.localEulerAngles

				var_210_31.z = 0
				var_210_31.x = 0
				var_210_23.localEulerAngles = var_210_31
			end

			local var_210_32 = 0

			if var_210_32 < arg_207_1.time_ and arg_207_1.time_ <= var_210_32 + arg_210_0 then
				arg_207_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_210_33 = 0

			if var_210_33 < arg_207_1.time_ and arg_207_1.time_ <= var_210_33 + arg_210_0 then
				arg_207_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_210_34 = 0
			local var_210_35 = 0.25

			if var_210_34 < arg_207_1.time_ and arg_207_1.time_ <= var_210_34 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_36 = arg_207_1:FormatText(StoryNameCfg[9].name)

				arg_207_1.leftNameTxt_.text = var_210_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_37 = arg_207_1:GetWordFromCfg(103903052)
				local var_210_38 = arg_207_1:FormatText(var_210_37.content)

				arg_207_1.text_.text = var_210_38

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_39 = 10
				local var_210_40 = utf8.len(var_210_38)
				local var_210_41 = var_210_39 <= 0 and var_210_35 or var_210_35 * (var_210_40 / var_210_39)

				if var_210_41 > 0 and var_210_35 < var_210_41 then
					arg_207_1.talkMaxDuration = var_210_41

					if var_210_41 + var_210_34 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_41 + var_210_34
					end
				end

				arg_207_1.text_.text = var_210_38
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903052", "story_v_side_old_103903.awb") ~= 0 then
					local var_210_42 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903052", "story_v_side_old_103903.awb") / 1000

					if var_210_42 + var_210_34 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_42 + var_210_34
					end

					if var_210_37.prefab_name ~= "" and arg_207_1.actors_[var_210_37.prefab_name] ~= nil then
						local var_210_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_37.prefab_name].transform, "story_v_side_old_103903", "103903052", "story_v_side_old_103903.awb")

						arg_207_1:RecordAudio("103903052", var_210_43)
						arg_207_1:RecordAudio("103903052", var_210_43)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903052", "story_v_side_old_103903.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903052", "story_v_side_old_103903.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_44 = math.max(var_210_35, arg_207_1.talkMaxDuration)

			if var_210_34 <= arg_207_1.time_ and arg_207_1.time_ < var_210_34 + var_210_44 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_34) / var_210_44

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_34 + var_210_44 and arg_207_1.time_ < var_210_34 + var_210_44 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play103903053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 103903053
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play103903054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1039ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect1039ui_story == nil then
				arg_211_1.var_.characterEffect1039ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.1

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect1039ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1039ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1039ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1039ui_story.fillRatio = var_214_5
			end

			local var_214_6 = 0
			local var_214_7 = 0.6

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

				local var_214_8 = arg_211_1:GetWordFromCfg(103903053)
				local var_214_9 = arg_211_1:FormatText(var_214_8.content)

				arg_211_1.text_.text = var_214_9

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_10 = 24
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
	Play103903054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 103903054
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play103903055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 1

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				local var_218_2 = "play"
				local var_218_3 = "effect"

				arg_215_1:AudioAction(var_218_2, var_218_3, "se_story_side_1039", "se_story_1039_run", "")
			end

			local var_218_4 = 0
			local var_218_5 = 0.7

			if var_218_4 < arg_215_1.time_ and arg_215_1.time_ <= var_218_4 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_6 = arg_215_1:GetWordFromCfg(103903054)
				local var_218_7 = arg_215_1:FormatText(var_218_6.content)

				arg_215_1.text_.text = var_218_7

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_8 = 28
				local var_218_9 = utf8.len(var_218_7)
				local var_218_10 = var_218_8 <= 0 and var_218_5 or var_218_5 * (var_218_9 / var_218_8)

				if var_218_10 > 0 and var_218_5 < var_218_10 then
					arg_215_1.talkMaxDuration = var_218_10

					if var_218_10 + var_218_4 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_10 + var_218_4
					end
				end

				arg_215_1.text_.text = var_218_7
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_11 = math.max(var_218_5, arg_215_1.talkMaxDuration)

			if var_218_4 <= arg_215_1.time_ and arg_215_1.time_ < var_218_4 + var_218_11 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_4) / var_218_11

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_4 + var_218_11 and arg_215_1.time_ < var_218_4 + var_218_11 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play103903055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 103903055
		arg_219_1.duration_ = 3.7

		local var_219_0 = {
			ja = 3.7,
			ko = 3.666,
			zh = 3.666,
			en = 2.033
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
				arg_219_0:Play103903056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1027ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1027ui_story == nil then
				arg_219_1.var_.characterEffect1027ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.1

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1027ui_story then
					arg_219_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1027ui_story then
				arg_219_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_222_4 = arg_219_1.actors_["1039ui_story"].transform
			local var_222_5 = 0

			if var_222_5 < arg_219_1.time_ and arg_219_1.time_ <= var_222_5 + arg_222_0 then
				arg_219_1.var_.moveOldPos1039ui_story = var_222_4.localPosition
			end

			local var_222_6 = 0.001

			if var_222_5 <= arg_219_1.time_ and arg_219_1.time_ < var_222_5 + var_222_6 then
				local var_222_7 = (arg_219_1.time_ - var_222_5) / var_222_6
				local var_222_8 = Vector3.New(10, -1.06, -5.3)

				var_222_4.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1039ui_story, var_222_8, var_222_7)

				local var_222_9 = manager.ui.mainCamera.transform.position - var_222_4.position

				var_222_4.forward = Vector3.New(var_222_9.x, var_222_9.y, var_222_9.z)

				local var_222_10 = var_222_4.localEulerAngles

				var_222_10.z = 0
				var_222_10.x = 0
				var_222_4.localEulerAngles = var_222_10
			end

			if arg_219_1.time_ >= var_222_5 + var_222_6 and arg_219_1.time_ < var_222_5 + var_222_6 + arg_222_0 then
				var_222_4.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_222_11 = manager.ui.mainCamera.transform.position - var_222_4.position

				var_222_4.forward = Vector3.New(var_222_11.x, var_222_11.y, var_222_11.z)

				local var_222_12 = var_222_4.localEulerAngles

				var_222_12.z = 0
				var_222_12.x = 0
				var_222_4.localEulerAngles = var_222_12
			end

			local var_222_13 = arg_219_1.actors_["1027ui_story"].transform
			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1.var_.moveOldPos1027ui_story = var_222_13.localPosition
			end

			local var_222_15 = 0.001

			if var_222_14 <= arg_219_1.time_ and arg_219_1.time_ < var_222_14 + var_222_15 then
				local var_222_16 = (arg_219_1.time_ - var_222_14) / var_222_15
				local var_222_17 = Vector3.New(0, -0.922, -5.1)

				var_222_13.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1027ui_story, var_222_17, var_222_16)

				local var_222_18 = manager.ui.mainCamera.transform.position - var_222_13.position

				var_222_13.forward = Vector3.New(var_222_18.x, var_222_18.y, var_222_18.z)

				local var_222_19 = var_222_13.localEulerAngles

				var_222_19.z = 0
				var_222_19.x = 0
				var_222_13.localEulerAngles = var_222_19
			end

			if arg_219_1.time_ >= var_222_14 + var_222_15 and arg_219_1.time_ < var_222_14 + var_222_15 + arg_222_0 then
				var_222_13.localPosition = Vector3.New(0, -0.922, -5.1)

				local var_222_20 = manager.ui.mainCamera.transform.position - var_222_13.position

				var_222_13.forward = Vector3.New(var_222_20.x, var_222_20.y, var_222_20.z)

				local var_222_21 = var_222_13.localEulerAngles

				var_222_21.z = 0
				var_222_21.x = 0
				var_222_13.localEulerAngles = var_222_21
			end

			local var_222_22 = 0

			if var_222_22 < arg_219_1.time_ and arg_219_1.time_ <= var_222_22 + arg_222_0 then
				arg_219_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_222_23 = 0

			if var_222_23 < arg_219_1.time_ and arg_219_1.time_ <= var_222_23 + arg_222_0 then
				arg_219_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_222_24 = 0
			local var_222_25 = 0.175

			if var_222_24 < arg_219_1.time_ and arg_219_1.time_ <= var_222_24 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_26 = arg_219_1:FormatText(StoryNameCfg[56].name)

				arg_219_1.leftNameTxt_.text = var_222_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_27 = arg_219_1:GetWordFromCfg(103903055)
				local var_222_28 = arg_219_1:FormatText(var_222_27.content)

				arg_219_1.text_.text = var_222_28

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_29 = 7
				local var_222_30 = utf8.len(var_222_28)
				local var_222_31 = var_222_29 <= 0 and var_222_25 or var_222_25 * (var_222_30 / var_222_29)

				if var_222_31 > 0 and var_222_25 < var_222_31 then
					arg_219_1.talkMaxDuration = var_222_31

					if var_222_31 + var_222_24 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_31 + var_222_24
					end
				end

				arg_219_1.text_.text = var_222_28
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903055", "story_v_side_old_103903.awb") ~= 0 then
					local var_222_32 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903055", "story_v_side_old_103903.awb") / 1000

					if var_222_32 + var_222_24 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_32 + var_222_24
					end

					if var_222_27.prefab_name ~= "" and arg_219_1.actors_[var_222_27.prefab_name] ~= nil then
						local var_222_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_27.prefab_name].transform, "story_v_side_old_103903", "103903055", "story_v_side_old_103903.awb")

						arg_219_1:RecordAudio("103903055", var_222_33)
						arg_219_1:RecordAudio("103903055", var_222_33)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903055", "story_v_side_old_103903.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903055", "story_v_side_old_103903.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_34 = math.max(var_222_25, arg_219_1.talkMaxDuration)

			if var_222_24 <= arg_219_1.time_ and arg_219_1.time_ < var_222_24 + var_222_34 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_24) / var_222_34

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_24 + var_222_34 and arg_219_1.time_ < var_222_24 + var_222_34 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play103903056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 103903056
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play103903057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 0.325

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

				local var_226_2 = arg_223_1:GetWordFromCfg(103903056)
				local var_226_3 = arg_223_1:FormatText(var_226_2.content)

				arg_223_1.text_.text = var_226_3

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_4 = 13
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
	Play103903057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 103903057
		arg_227_1.duration_ = 7.633

		local var_227_0 = {
			ja = 7.633,
			ko = 4.366,
			zh = 4.366,
			en = 3.166
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
				arg_227_0:Play103903058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action426")
			end

			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_230_2 = 0
			local var_230_3 = 0.3

			if var_230_2 < arg_227_1.time_ and arg_227_1.time_ <= var_230_2 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_4 = arg_227_1:FormatText(StoryNameCfg[56].name)

				arg_227_1.leftNameTxt_.text = var_230_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_5 = arg_227_1:GetWordFromCfg(103903057)
				local var_230_6 = arg_227_1:FormatText(var_230_5.content)

				arg_227_1.text_.text = var_230_6

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_7 = 12
				local var_230_8 = utf8.len(var_230_6)
				local var_230_9 = var_230_7 <= 0 and var_230_3 or var_230_3 * (var_230_8 / var_230_7)

				if var_230_9 > 0 and var_230_3 < var_230_9 then
					arg_227_1.talkMaxDuration = var_230_9

					if var_230_9 + var_230_2 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_9 + var_230_2
					end
				end

				arg_227_1.text_.text = var_230_6
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903057", "story_v_side_old_103903.awb") ~= 0 then
					local var_230_10 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903057", "story_v_side_old_103903.awb") / 1000

					if var_230_10 + var_230_2 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_10 + var_230_2
					end

					if var_230_5.prefab_name ~= "" and arg_227_1.actors_[var_230_5.prefab_name] ~= nil then
						local var_230_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_5.prefab_name].transform, "story_v_side_old_103903", "103903057", "story_v_side_old_103903.awb")

						arg_227_1:RecordAudio("103903057", var_230_11)
						arg_227_1:RecordAudio("103903057", var_230_11)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903057", "story_v_side_old_103903.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903057", "story_v_side_old_103903.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_12 = math.max(var_230_3, arg_227_1.talkMaxDuration)

			if var_230_2 <= arg_227_1.time_ and arg_227_1.time_ < var_230_2 + var_230_12 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_2) / var_230_12

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_2 + var_230_12 and arg_227_1.time_ < var_230_2 + var_230_12 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play103903058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 103903058
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play103903059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1027ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1027ui_story == nil then
				arg_231_1.var_.characterEffect1027ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.1

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1027ui_story then
					local var_234_4 = Mathf.Lerp(0, 0.5, var_234_3)

					arg_231_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1027ui_story.fillRatio = var_234_4
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1027ui_story then
				local var_234_5 = 0.5

				arg_231_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1027ui_story.fillRatio = var_234_5
			end

			local var_234_6 = 0
			local var_234_7 = 0.575

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

				local var_234_8 = arg_231_1:GetWordFromCfg(103903058)
				local var_234_9 = arg_231_1:FormatText(var_234_8.content)

				arg_231_1.text_.text = var_234_9

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_10 = 23
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
	Play103903059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 103903059
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play103903060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.7

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_2 = arg_235_1:GetWordFromCfg(103903059)
				local var_238_3 = arg_235_1:FormatText(var_238_2.content)

				arg_235_1.text_.text = var_238_3

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_4 = 28
				local var_238_5 = utf8.len(var_238_3)
				local var_238_6 = var_238_4 <= 0 and var_238_1 or var_238_1 * (var_238_5 / var_238_4)

				if var_238_6 > 0 and var_238_1 < var_238_6 then
					arg_235_1.talkMaxDuration = var_238_6

					if var_238_6 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_6 + var_238_0
					end
				end

				arg_235_1.text_.text = var_238_3
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_7 = math.max(var_238_1, arg_235_1.talkMaxDuration)

			if var_238_0 <= arg_235_1.time_ and arg_235_1.time_ < var_238_0 + var_238_7 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_0) / var_238_7

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_0 + var_238_7 and arg_235_1.time_ < var_238_0 + var_238_7 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play103903060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 103903060
		arg_239_1.duration_ = 5.7

		local var_239_0 = {
			ja = 5.7,
			ko = 5.233,
			zh = 5.233,
			en = 4.266
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
				arg_239_0:Play103903061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 1

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				local var_242_2 = "play"
				local var_242_3 = "music"

				arg_239_1:AudioAction(var_242_2, var_242_3, "ui_battle", "ui_battle_pausebgm", "")
			end

			local var_242_4 = arg_239_1.actors_["1027ui_story"]
			local var_242_5 = 0

			if var_242_5 < arg_239_1.time_ and arg_239_1.time_ <= var_242_5 + arg_242_0 and arg_239_1.var_.characterEffect1027ui_story == nil then
				arg_239_1.var_.characterEffect1027ui_story = var_242_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_6 = 0.1

			if var_242_5 <= arg_239_1.time_ and arg_239_1.time_ < var_242_5 + var_242_6 then
				local var_242_7 = (arg_239_1.time_ - var_242_5) / var_242_6

				if arg_239_1.var_.characterEffect1027ui_story then
					arg_239_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_5 + var_242_6 and arg_239_1.time_ < var_242_5 + var_242_6 + arg_242_0 and arg_239_1.var_.characterEffect1027ui_story then
				arg_239_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_242_8 = 0

			if var_242_8 < arg_239_1.time_ and arg_239_1.time_ <= var_242_8 + arg_242_0 then
				arg_239_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action463")
			end

			local var_242_9 = 0

			if var_242_9 < arg_239_1.time_ and arg_239_1.time_ <= var_242_9 + arg_242_0 then
				arg_239_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_242_10 = 0
			local var_242_11 = 0.175

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_12 = arg_239_1:FormatText(StoryNameCfg[56].name)

				arg_239_1.leftNameTxt_.text = var_242_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_13 = arg_239_1:GetWordFromCfg(103903060)
				local var_242_14 = arg_239_1:FormatText(var_242_13.content)

				arg_239_1.text_.text = var_242_14

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_15 = 7
				local var_242_16 = utf8.len(var_242_14)
				local var_242_17 = var_242_15 <= 0 and var_242_11 or var_242_11 * (var_242_16 / var_242_15)

				if var_242_17 > 0 and var_242_11 < var_242_17 then
					arg_239_1.talkMaxDuration = var_242_17

					if var_242_17 + var_242_10 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_17 + var_242_10
					end
				end

				arg_239_1.text_.text = var_242_14
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903060", "story_v_side_old_103903.awb") ~= 0 then
					local var_242_18 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903060", "story_v_side_old_103903.awb") / 1000

					if var_242_18 + var_242_10 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_18 + var_242_10
					end

					if var_242_13.prefab_name ~= "" and arg_239_1.actors_[var_242_13.prefab_name] ~= nil then
						local var_242_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_13.prefab_name].transform, "story_v_side_old_103903", "103903060", "story_v_side_old_103903.awb")

						arg_239_1:RecordAudio("103903060", var_242_19)
						arg_239_1:RecordAudio("103903060", var_242_19)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903060", "story_v_side_old_103903.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903060", "story_v_side_old_103903.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_20 = math.max(var_242_11, arg_239_1.talkMaxDuration)

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_20 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_10) / var_242_20

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_10 + var_242_20 and arg_239_1.time_ < var_242_10 + var_242_20 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play103903061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 103903061
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play103903062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.425

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_2 = arg_243_1:GetWordFromCfg(103903061)
				local var_246_3 = arg_243_1:FormatText(var_246_2.content)

				arg_243_1.text_.text = var_246_3

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_4 = 17
				local var_246_5 = utf8.len(var_246_3)
				local var_246_6 = var_246_4 <= 0 and var_246_1 or var_246_1 * (var_246_5 / var_246_4)

				if var_246_6 > 0 and var_246_1 < var_246_6 then
					arg_243_1.talkMaxDuration = var_246_6

					if var_246_6 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_6 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_3
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_7 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_7 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_7

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_7 and arg_243_1.time_ < var_246_0 + var_246_7 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play103903062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 103903062
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play103903063(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1027ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1027ui_story == nil then
				arg_247_1.var_.characterEffect1027ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.1

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1027ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1027ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1027ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1027ui_story.fillRatio = var_250_5
			end

			local var_250_6 = 0
			local var_250_7 = 0.225

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

				local var_250_9 = arg_247_1:GetWordFromCfg(103903062)
				local var_250_10 = arg_247_1:FormatText(var_250_9.content)

				arg_247_1.text_.text = var_250_10

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_11 = 9
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
	Play103903063 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 103903063
		arg_251_1.duration_ = 8

		local var_251_0 = {
			ja = 1.8,
			ko = 3.6,
			zh = 3.6,
			en = 8
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
				arg_251_0:Play103903064(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1027ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect1027ui_story == nil then
				arg_251_1.var_.characterEffect1027ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.1

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect1027ui_story then
					arg_251_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect1027ui_story then
				arg_251_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_254_4 = 0

			if var_254_4 < arg_251_1.time_ and arg_251_1.time_ <= var_254_4 + arg_254_0 then
				arg_251_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_254_5 = 0
			local var_254_6 = 0.1

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_7 = arg_251_1:FormatText(StoryNameCfg[56].name)

				arg_251_1.leftNameTxt_.text = var_254_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_8 = arg_251_1:GetWordFromCfg(103903063)
				local var_254_9 = arg_251_1:FormatText(var_254_8.content)

				arg_251_1.text_.text = var_254_9

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_10 = 4
				local var_254_11 = utf8.len(var_254_9)
				local var_254_12 = var_254_10 <= 0 and var_254_6 or var_254_6 * (var_254_11 / var_254_10)

				if var_254_12 > 0 and var_254_6 < var_254_12 then
					arg_251_1.talkMaxDuration = var_254_12

					if var_254_12 + var_254_5 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_12 + var_254_5
					end
				end

				arg_251_1.text_.text = var_254_9
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903063", "story_v_side_old_103903.awb") ~= 0 then
					local var_254_13 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903063", "story_v_side_old_103903.awb") / 1000

					if var_254_13 + var_254_5 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_13 + var_254_5
					end

					if var_254_8.prefab_name ~= "" and arg_251_1.actors_[var_254_8.prefab_name] ~= nil then
						local var_254_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_8.prefab_name].transform, "story_v_side_old_103903", "103903063", "story_v_side_old_103903.awb")

						arg_251_1:RecordAudio("103903063", var_254_14)
						arg_251_1:RecordAudio("103903063", var_254_14)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903063", "story_v_side_old_103903.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903063", "story_v_side_old_103903.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_15 = math.max(var_254_6, arg_251_1.talkMaxDuration)

			if var_254_5 <= arg_251_1.time_ and arg_251_1.time_ < var_254_5 + var_254_15 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_5) / var_254_15

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_5 + var_254_15 and arg_251_1.time_ < var_254_5 + var_254_15 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play103903064 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 103903064
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play103903065(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1027ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1027ui_story == nil then
				arg_255_1.var_.characterEffect1027ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.1

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1027ui_story then
					local var_258_4 = Mathf.Lerp(0, 0.5, var_258_3)

					arg_255_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1027ui_story.fillRatio = var_258_4
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1027ui_story then
				local var_258_5 = 0.5

				arg_255_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1027ui_story.fillRatio = var_258_5
			end

			local var_258_6 = 0
			local var_258_7 = 0.25

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

				local var_258_9 = arg_255_1:GetWordFromCfg(103903064)
				local var_258_10 = arg_255_1:FormatText(var_258_9.content)

				arg_255_1.text_.text = var_258_10

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_11 = 10
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
	Play103903065 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 103903065
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play103903066(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.975

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_2 = arg_259_1:GetWordFromCfg(103903065)
				local var_262_3 = arg_259_1:FormatText(var_262_2.content)

				arg_259_1.text_.text = var_262_3

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_4 = 39
				local var_262_5 = utf8.len(var_262_3)
				local var_262_6 = var_262_4 <= 0 and var_262_1 or var_262_1 * (var_262_5 / var_262_4)

				if var_262_6 > 0 and var_262_1 < var_262_6 then
					arg_259_1.talkMaxDuration = var_262_6

					if var_262_6 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_6 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_3
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_7 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_7 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_7

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_7 and arg_259_1.time_ < var_262_0 + var_262_7 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play103903066 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 103903066
		arg_263_1.duration_ = 3.1

		local var_263_0 = {
			ja = 2.666,
			ko = 2.533,
			zh = 2.533,
			en = 3.1
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
				arg_263_0:Play103903067(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1039ui_story"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.characterEffect1039ui_story == nil then
				arg_263_1.var_.characterEffect1039ui_story = var_266_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_2 = 0.1

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.characterEffect1039ui_story then
					arg_263_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.characterEffect1039ui_story then
				arg_263_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_266_4 = arg_263_1.actors_["1027ui_story"].transform
			local var_266_5 = 0

			if var_266_5 < arg_263_1.time_ and arg_263_1.time_ <= var_266_5 + arg_266_0 then
				arg_263_1.var_.moveOldPos1027ui_story = var_266_4.localPosition
			end

			local var_266_6 = 0.001

			if var_266_5 <= arg_263_1.time_ and arg_263_1.time_ < var_266_5 + var_266_6 then
				local var_266_7 = (arg_263_1.time_ - var_266_5) / var_266_6
				local var_266_8 = Vector3.New(10, -0.922, -5.1)

				var_266_4.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1027ui_story, var_266_8, var_266_7)

				local var_266_9 = manager.ui.mainCamera.transform.position - var_266_4.position

				var_266_4.forward = Vector3.New(var_266_9.x, var_266_9.y, var_266_9.z)

				local var_266_10 = var_266_4.localEulerAngles

				var_266_10.z = 0
				var_266_10.x = 0
				var_266_4.localEulerAngles = var_266_10
			end

			if arg_263_1.time_ >= var_266_5 + var_266_6 and arg_263_1.time_ < var_266_5 + var_266_6 + arg_266_0 then
				var_266_4.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_266_11 = manager.ui.mainCamera.transform.position - var_266_4.position

				var_266_4.forward = Vector3.New(var_266_11.x, var_266_11.y, var_266_11.z)

				local var_266_12 = var_266_4.localEulerAngles

				var_266_12.z = 0
				var_266_12.x = 0
				var_266_4.localEulerAngles = var_266_12
			end

			local var_266_13 = arg_263_1.actors_["1039ui_story"].transform
			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1.var_.moveOldPos1039ui_story = var_266_13.localPosition
			end

			local var_266_15 = 0.001

			if var_266_14 <= arg_263_1.time_ and arg_263_1.time_ < var_266_14 + var_266_15 then
				local var_266_16 = (arg_263_1.time_ - var_266_14) / var_266_15
				local var_266_17 = Vector3.New(0, -1.06, -5.3)

				var_266_13.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1039ui_story, var_266_17, var_266_16)

				local var_266_18 = manager.ui.mainCamera.transform.position - var_266_13.position

				var_266_13.forward = Vector3.New(var_266_18.x, var_266_18.y, var_266_18.z)

				local var_266_19 = var_266_13.localEulerAngles

				var_266_19.z = 0
				var_266_19.x = 0
				var_266_13.localEulerAngles = var_266_19
			end

			if arg_263_1.time_ >= var_266_14 + var_266_15 and arg_263_1.time_ < var_266_14 + var_266_15 + arg_266_0 then
				var_266_13.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_266_20 = manager.ui.mainCamera.transform.position - var_266_13.position

				var_266_13.forward = Vector3.New(var_266_20.x, var_266_20.y, var_266_20.z)

				local var_266_21 = var_266_13.localEulerAngles

				var_266_21.z = 0
				var_266_21.x = 0
				var_266_13.localEulerAngles = var_266_21
			end

			local var_266_22 = 0

			if var_266_22 < arg_263_1.time_ and arg_263_1.time_ <= var_266_22 + arg_266_0 then
				arg_263_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_266_23 = 0

			if var_266_23 < arg_263_1.time_ and arg_263_1.time_ <= var_266_23 + arg_266_0 then
				arg_263_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_266_24 = 0
			local var_266_25 = 0.2

			if var_266_24 < arg_263_1.time_ and arg_263_1.time_ <= var_266_24 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_26 = arg_263_1:FormatText(StoryNameCfg[9].name)

				arg_263_1.leftNameTxt_.text = var_266_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_27 = arg_263_1:GetWordFromCfg(103903066)
				local var_266_28 = arg_263_1:FormatText(var_266_27.content)

				arg_263_1.text_.text = var_266_28

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_29 = 8
				local var_266_30 = utf8.len(var_266_28)
				local var_266_31 = var_266_29 <= 0 and var_266_25 or var_266_25 * (var_266_30 / var_266_29)

				if var_266_31 > 0 and var_266_25 < var_266_31 then
					arg_263_1.talkMaxDuration = var_266_31

					if var_266_31 + var_266_24 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_31 + var_266_24
					end
				end

				arg_263_1.text_.text = var_266_28
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903066", "story_v_side_old_103903.awb") ~= 0 then
					local var_266_32 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903066", "story_v_side_old_103903.awb") / 1000

					if var_266_32 + var_266_24 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_32 + var_266_24
					end

					if var_266_27.prefab_name ~= "" and arg_263_1.actors_[var_266_27.prefab_name] ~= nil then
						local var_266_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_27.prefab_name].transform, "story_v_side_old_103903", "103903066", "story_v_side_old_103903.awb")

						arg_263_1:RecordAudio("103903066", var_266_33)
						arg_263_1:RecordAudio("103903066", var_266_33)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903066", "story_v_side_old_103903.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903066", "story_v_side_old_103903.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_34 = math.max(var_266_25, arg_263_1.talkMaxDuration)

			if var_266_24 <= arg_263_1.time_ and arg_263_1.time_ < var_266_24 + var_266_34 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_24) / var_266_34

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_24 + var_266_34 and arg_263_1.time_ < var_266_24 + var_266_34 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play103903067 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 103903067
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play103903068(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.35

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_2 = arg_267_1:GetWordFromCfg(103903067)
				local var_270_3 = arg_267_1:FormatText(var_270_2.content)

				arg_267_1.text_.text = var_270_3

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_4 = 14
				local var_270_5 = utf8.len(var_270_3)
				local var_270_6 = var_270_4 <= 0 and var_270_1 or var_270_1 * (var_270_5 / var_270_4)

				if var_270_6 > 0 and var_270_1 < var_270_6 then
					arg_267_1.talkMaxDuration = var_270_6

					if var_270_6 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_6 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_3
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_7 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_7 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_7

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_7 and arg_267_1.time_ < var_270_0 + var_270_7 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play103903068 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 103903068
		arg_271_1.duration_ = 6.2

		local var_271_0 = {
			ja = 4.933,
			ko = 6.2,
			zh = 6.2,
			en = 5.966
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
				arg_271_0:Play103903069(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_274_1 = 0
			local var_274_2 = 0.775

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_3 = arg_271_1:FormatText(StoryNameCfg[9].name)

				arg_271_1.leftNameTxt_.text = var_274_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_4 = arg_271_1:GetWordFromCfg(103903068)
				local var_274_5 = arg_271_1:FormatText(var_274_4.content)

				arg_271_1.text_.text = var_274_5

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_6 = 31
				local var_274_7 = utf8.len(var_274_5)
				local var_274_8 = var_274_6 <= 0 and var_274_2 or var_274_2 * (var_274_7 / var_274_6)

				if var_274_8 > 0 and var_274_2 < var_274_8 then
					arg_271_1.talkMaxDuration = var_274_8

					if var_274_8 + var_274_1 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_8 + var_274_1
					end
				end

				arg_271_1.text_.text = var_274_5
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903068", "story_v_side_old_103903.awb") ~= 0 then
					local var_274_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903068", "story_v_side_old_103903.awb") / 1000

					if var_274_9 + var_274_1 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_9 + var_274_1
					end

					if var_274_4.prefab_name ~= "" and arg_271_1.actors_[var_274_4.prefab_name] ~= nil then
						local var_274_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_4.prefab_name].transform, "story_v_side_old_103903", "103903068", "story_v_side_old_103903.awb")

						arg_271_1:RecordAudio("103903068", var_274_10)
						arg_271_1:RecordAudio("103903068", var_274_10)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903068", "story_v_side_old_103903.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903068", "story_v_side_old_103903.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_11 = math.max(var_274_2, arg_271_1.talkMaxDuration)

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_11 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_1) / var_274_11

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_1 + var_274_11 and arg_271_1.time_ < var_274_1 + var_274_11 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play103903069 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 103903069
		arg_275_1.duration_ = 6.266

		local var_275_0 = {
			ja = 6.266,
			ko = 4.7,
			zh = 4.7,
			en = 5.766
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
				arg_275_0:Play103903070(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1027ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect1027ui_story == nil then
				arg_275_1.var_.characterEffect1027ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.1

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect1027ui_story then
					arg_275_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect1027ui_story then
				arg_275_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_278_4 = arg_275_1.actors_["1039ui_story"]
			local var_278_5 = 0

			if var_278_5 < arg_275_1.time_ and arg_275_1.time_ <= var_278_5 + arg_278_0 and arg_275_1.var_.characterEffect1039ui_story == nil then
				arg_275_1.var_.characterEffect1039ui_story = var_278_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_6 = 0.1

			if var_278_5 <= arg_275_1.time_ and arg_275_1.time_ < var_278_5 + var_278_6 then
				local var_278_7 = (arg_275_1.time_ - var_278_5) / var_278_6

				if arg_275_1.var_.characterEffect1039ui_story then
					local var_278_8 = Mathf.Lerp(0, 0.5, var_278_7)

					arg_275_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_275_1.var_.characterEffect1039ui_story.fillRatio = var_278_8
				end
			end

			if arg_275_1.time_ >= var_278_5 + var_278_6 and arg_275_1.time_ < var_278_5 + var_278_6 + arg_278_0 and arg_275_1.var_.characterEffect1039ui_story then
				local var_278_9 = 0.5

				arg_275_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_275_1.var_.characterEffect1039ui_story.fillRatio = var_278_9
			end

			local var_278_10 = arg_275_1.actors_["1039ui_story"].transform
			local var_278_11 = 0.033

			if var_278_11 < arg_275_1.time_ and arg_275_1.time_ <= var_278_11 + arg_278_0 then
				arg_275_1.var_.moveOldPos1039ui_story = var_278_10.localPosition
			end

			local var_278_12 = 0.5

			if var_278_11 <= arg_275_1.time_ and arg_275_1.time_ < var_278_11 + var_278_12 then
				local var_278_13 = (arg_275_1.time_ - var_278_11) / var_278_12
				local var_278_14 = Vector3.New(-0.85, -1.06, -5.3)

				var_278_10.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1039ui_story, var_278_14, var_278_13)

				local var_278_15 = manager.ui.mainCamera.transform.position - var_278_10.position

				var_278_10.forward = Vector3.New(var_278_15.x, var_278_15.y, var_278_15.z)

				local var_278_16 = var_278_10.localEulerAngles

				var_278_16.z = 0
				var_278_16.x = 0
				var_278_10.localEulerAngles = var_278_16
			end

			if arg_275_1.time_ >= var_278_11 + var_278_12 and arg_275_1.time_ < var_278_11 + var_278_12 + arg_278_0 then
				var_278_10.localPosition = Vector3.New(-0.85, -1.06, -5.3)

				local var_278_17 = manager.ui.mainCamera.transform.position - var_278_10.position

				var_278_10.forward = Vector3.New(var_278_17.x, var_278_17.y, var_278_17.z)

				local var_278_18 = var_278_10.localEulerAngles

				var_278_18.z = 0
				var_278_18.x = 0
				var_278_10.localEulerAngles = var_278_18
			end

			local var_278_19 = arg_275_1.actors_["1039ui_story"].transform
			local var_278_20 = 0

			if var_278_20 < arg_275_1.time_ and arg_275_1.time_ <= var_278_20 + arg_278_0 then
				arg_275_1.var_.moveOldPos1039ui_story = var_278_19.localPosition
			end

			local var_278_21 = 0.001

			if var_278_20 <= arg_275_1.time_ and arg_275_1.time_ < var_278_20 + var_278_21 then
				local var_278_22 = (arg_275_1.time_ - var_278_20) / var_278_21
				local var_278_23 = Vector3.New(0, -1.06, -5.3)

				var_278_19.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1039ui_story, var_278_23, var_278_22)

				local var_278_24 = manager.ui.mainCamera.transform.position - var_278_19.position

				var_278_19.forward = Vector3.New(var_278_24.x, var_278_24.y, var_278_24.z)

				local var_278_25 = var_278_19.localEulerAngles

				var_278_25.z = 0
				var_278_25.x = 0
				var_278_19.localEulerAngles = var_278_25
			end

			if arg_275_1.time_ >= var_278_20 + var_278_21 and arg_275_1.time_ < var_278_20 + var_278_21 + arg_278_0 then
				var_278_19.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_278_26 = manager.ui.mainCamera.transform.position - var_278_19.position

				var_278_19.forward = Vector3.New(var_278_26.x, var_278_26.y, var_278_26.z)

				local var_278_27 = var_278_19.localEulerAngles

				var_278_27.z = 0
				var_278_27.x = 0
				var_278_19.localEulerAngles = var_278_27
			end

			local var_278_28 = arg_275_1.actors_["1027ui_story"].transform
			local var_278_29 = 0

			if var_278_29 < arg_275_1.time_ and arg_275_1.time_ <= var_278_29 + arg_278_0 then
				arg_275_1.var_.moveOldPos1027ui_story = var_278_28.localPosition
			end

			local var_278_30 = 0.001

			if var_278_29 <= arg_275_1.time_ and arg_275_1.time_ < var_278_29 + var_278_30 then
				local var_278_31 = (arg_275_1.time_ - var_278_29) / var_278_30
				local var_278_32 = Vector3.New(0.92, -0.922, -5.1)

				var_278_28.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1027ui_story, var_278_32, var_278_31)

				local var_278_33 = manager.ui.mainCamera.transform.position - var_278_28.position

				var_278_28.forward = Vector3.New(var_278_33.x, var_278_33.y, var_278_33.z)

				local var_278_34 = var_278_28.localEulerAngles

				var_278_34.z = 0
				var_278_34.x = 0
				var_278_28.localEulerAngles = var_278_34
			end

			if arg_275_1.time_ >= var_278_29 + var_278_30 and arg_275_1.time_ < var_278_29 + var_278_30 + arg_278_0 then
				var_278_28.localPosition = Vector3.New(0.92, -0.922, -5.1)

				local var_278_35 = manager.ui.mainCamera.transform.position - var_278_28.position

				var_278_28.forward = Vector3.New(var_278_35.x, var_278_35.y, var_278_35.z)

				local var_278_36 = var_278_28.localEulerAngles

				var_278_36.z = 0
				var_278_36.x = 0
				var_278_28.localEulerAngles = var_278_36
			end

			local var_278_37 = 0

			if var_278_37 < arg_275_1.time_ and arg_275_1.time_ <= var_278_37 + arg_278_0 then
				arg_275_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action6_1")
			end

			local var_278_38 = 0

			if var_278_38 < arg_275_1.time_ and arg_275_1.time_ <= var_278_38 + arg_278_0 then
				arg_275_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_278_39 = 0
			local var_278_40 = 0.25

			if var_278_39 < arg_275_1.time_ and arg_275_1.time_ <= var_278_39 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_41 = arg_275_1:FormatText(StoryNameCfg[56].name)

				arg_275_1.leftNameTxt_.text = var_278_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_42 = arg_275_1:GetWordFromCfg(103903069)
				local var_278_43 = arg_275_1:FormatText(var_278_42.content)

				arg_275_1.text_.text = var_278_43

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_44 = 10
				local var_278_45 = utf8.len(var_278_43)
				local var_278_46 = var_278_44 <= 0 and var_278_40 or var_278_40 * (var_278_45 / var_278_44)

				if var_278_46 > 0 and var_278_40 < var_278_46 then
					arg_275_1.talkMaxDuration = var_278_46

					if var_278_46 + var_278_39 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_46 + var_278_39
					end
				end

				arg_275_1.text_.text = var_278_43
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903069", "story_v_side_old_103903.awb") ~= 0 then
					local var_278_47 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903069", "story_v_side_old_103903.awb") / 1000

					if var_278_47 + var_278_39 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_47 + var_278_39
					end

					if var_278_42.prefab_name ~= "" and arg_275_1.actors_[var_278_42.prefab_name] ~= nil then
						local var_278_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_42.prefab_name].transform, "story_v_side_old_103903", "103903069", "story_v_side_old_103903.awb")

						arg_275_1:RecordAudio("103903069", var_278_48)
						arg_275_1:RecordAudio("103903069", var_278_48)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903069", "story_v_side_old_103903.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903069", "story_v_side_old_103903.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_49 = math.max(var_278_40, arg_275_1.talkMaxDuration)

			if var_278_39 <= arg_275_1.time_ and arg_275_1.time_ < var_278_39 + var_278_49 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_39) / var_278_49

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_39 + var_278_49 and arg_275_1.time_ < var_278_39 + var_278_49 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play103903070 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 103903070
		arg_279_1.duration_ = 7.9

		local var_279_0 = {
			ja = 6.066,
			ko = 7.9,
			zh = 7.9,
			en = 4.9
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
				arg_279_0:Play103903071(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1039ui_story"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect1039ui_story == nil then
				arg_279_1.var_.characterEffect1039ui_story = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.1

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect1039ui_story then
					arg_279_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1039ui_story then
				arg_279_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_282_4 = arg_279_1.actors_["1027ui_story"]
			local var_282_5 = 0

			if var_282_5 < arg_279_1.time_ and arg_279_1.time_ <= var_282_5 + arg_282_0 and arg_279_1.var_.characterEffect1027ui_story == nil then
				arg_279_1.var_.characterEffect1027ui_story = var_282_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_6 = 0.1

			if var_282_5 <= arg_279_1.time_ and arg_279_1.time_ < var_282_5 + var_282_6 then
				local var_282_7 = (arg_279_1.time_ - var_282_5) / var_282_6

				if arg_279_1.var_.characterEffect1027ui_story then
					local var_282_8 = Mathf.Lerp(0, 0.5, var_282_7)

					arg_279_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1027ui_story.fillRatio = var_282_8
				end
			end

			if arg_279_1.time_ >= var_282_5 + var_282_6 and arg_279_1.time_ < var_282_5 + var_282_6 + arg_282_0 and arg_279_1.var_.characterEffect1027ui_story then
				local var_282_9 = 0.5

				arg_279_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1027ui_story.fillRatio = var_282_9
			end

			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 then
				arg_279_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action424")
			end

			local var_282_11 = 0

			if var_282_11 < arg_279_1.time_ and arg_279_1.time_ <= var_282_11 + arg_282_0 then
				arg_279_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_282_12 = 0
			local var_282_13 = 0.75

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[9].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(103903070)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 30
				local var_282_18 = utf8.len(var_282_16)
				local var_282_19 = var_282_17 <= 0 and var_282_13 or var_282_13 * (var_282_18 / var_282_17)

				if var_282_19 > 0 and var_282_13 < var_282_19 then
					arg_279_1.talkMaxDuration = var_282_19

					if var_282_19 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_12
					end
				end

				arg_279_1.text_.text = var_282_16
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903070", "story_v_side_old_103903.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903070", "story_v_side_old_103903.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_side_old_103903", "103903070", "story_v_side_old_103903.awb")

						arg_279_1:RecordAudio("103903070", var_282_21)
						arg_279_1:RecordAudio("103903070", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903070", "story_v_side_old_103903.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903070", "story_v_side_old_103903.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_22 = math.max(var_282_13, arg_279_1.talkMaxDuration)

			if var_282_12 <= arg_279_1.time_ and arg_279_1.time_ < var_282_12 + var_282_22 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_12) / var_282_22

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_12 + var_282_22 and arg_279_1.time_ < var_282_12 + var_282_22 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play103903071 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 103903071
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play103903072(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1039ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect1039ui_story == nil then
				arg_283_1.var_.characterEffect1039ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.1

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect1039ui_story then
					local var_286_4 = Mathf.Lerp(0, 0.5, var_286_3)

					arg_283_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1039ui_story.fillRatio = var_286_4
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect1039ui_story then
				local var_286_5 = 0.5

				arg_283_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1039ui_story.fillRatio = var_286_5
			end

			local var_286_6 = 0
			local var_286_7 = 0.5

			if var_286_6 < arg_283_1.time_ and arg_283_1.time_ <= var_286_6 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, false)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_8 = arg_283_1:GetWordFromCfg(103903071)
				local var_286_9 = arg_283_1:FormatText(var_286_8.content)

				arg_283_1.text_.text = var_286_9

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_10 = 20
				local var_286_11 = utf8.len(var_286_9)
				local var_286_12 = var_286_10 <= 0 and var_286_7 or var_286_7 * (var_286_11 / var_286_10)

				if var_286_12 > 0 and var_286_7 < var_286_12 then
					arg_283_1.talkMaxDuration = var_286_12

					if var_286_12 + var_286_6 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_12 + var_286_6
					end
				end

				arg_283_1.text_.text = var_286_9
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_13 = math.max(var_286_7, arg_283_1.talkMaxDuration)

			if var_286_6 <= arg_283_1.time_ and arg_283_1.time_ < var_286_6 + var_286_13 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_6) / var_286_13

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_6 + var_286_13 and arg_283_1.time_ < var_286_6 + var_286_13 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play103903072 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 103903072
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play103903073(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 0.225

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, false)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_2 = arg_287_1:GetWordFromCfg(103903072)
				local var_290_3 = arg_287_1:FormatText(var_290_2.content)

				arg_287_1.text_.text = var_290_3

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_4 = 9
				local var_290_5 = utf8.len(var_290_3)
				local var_290_6 = var_290_4 <= 0 and var_290_1 or var_290_1 * (var_290_5 / var_290_4)

				if var_290_6 > 0 and var_290_1 < var_290_6 then
					arg_287_1.talkMaxDuration = var_290_6

					if var_290_6 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_6 + var_290_0
					end
				end

				arg_287_1.text_.text = var_290_3
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_7 = math.max(var_290_1, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_7 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_0) / var_290_7

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_7 and arg_287_1.time_ < var_290_0 + var_290_7 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play103903073 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 103903073
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play103903074(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.bgs_.ST03.transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPosST03 = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0, -100, 10)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPosST03, var_294_4, var_294_3)
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_294_5 = "D04a"

			if arg_291_1.bgs_[var_294_5] == nil then
				local var_294_6 = Object.Instantiate(arg_291_1.paintGo_)

				var_294_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_294_5)
				var_294_6.name = var_294_5
				var_294_6.transform.parent = arg_291_1.stage_.transform
				var_294_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_291_1.bgs_[var_294_5] = var_294_6
			end

			local var_294_7 = 0

			if var_294_7 < arg_291_1.time_ and arg_291_1.time_ <= var_294_7 + arg_294_0 then
				local var_294_8 = manager.ui.mainCamera.transform.localPosition
				local var_294_9 = Vector3.New(0, 0, 10) + Vector3.New(var_294_8.x, var_294_8.y, 0)
				local var_294_10 = arg_291_1.bgs_.D04a

				var_294_10.transform.localPosition = var_294_9
				var_294_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_294_11 = var_294_10:GetComponent("SpriteRenderer")

				if var_294_11 and var_294_11.sprite then
					local var_294_12 = (var_294_10.transform.localPosition - var_294_8).z
					local var_294_13 = manager.ui.mainCameraCom_
					local var_294_14 = 2 * var_294_12 * Mathf.Tan(var_294_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_294_15 = var_294_14 * var_294_13.aspect
					local var_294_16 = var_294_11.sprite.bounds.size.x
					local var_294_17 = var_294_11.sprite.bounds.size.y
					local var_294_18 = var_294_15 / var_294_16
					local var_294_19 = var_294_14 / var_294_17
					local var_294_20 = var_294_19 < var_294_18 and var_294_18 or var_294_19

					var_294_10.transform.localScale = Vector3.New(var_294_20, var_294_20, 0)
				end

				for iter_294_0, iter_294_1 in pairs(arg_291_1.bgs_) do
					if iter_294_0 ~= "D04a" then
						iter_294_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_294_21 = arg_291_1.actors_["1039ui_story"].transform
			local var_294_22 = 0

			if var_294_22 < arg_291_1.time_ and arg_291_1.time_ <= var_294_22 + arg_294_0 then
				arg_291_1.var_.moveOldPos1039ui_story = var_294_21.localPosition
			end

			local var_294_23 = 0.001

			if var_294_22 <= arg_291_1.time_ and arg_291_1.time_ < var_294_22 + var_294_23 then
				local var_294_24 = (arg_291_1.time_ - var_294_22) / var_294_23
				local var_294_25 = Vector3.New(10, -1.06, -5.3)

				var_294_21.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1039ui_story, var_294_25, var_294_24)

				local var_294_26 = manager.ui.mainCamera.transform.position - var_294_21.position

				var_294_21.forward = Vector3.New(var_294_26.x, var_294_26.y, var_294_26.z)

				local var_294_27 = var_294_21.localEulerAngles

				var_294_27.z = 0
				var_294_27.x = 0
				var_294_21.localEulerAngles = var_294_27
			end

			if arg_291_1.time_ >= var_294_22 + var_294_23 and arg_291_1.time_ < var_294_22 + var_294_23 + arg_294_0 then
				var_294_21.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_294_28 = manager.ui.mainCamera.transform.position - var_294_21.position

				var_294_21.forward = Vector3.New(var_294_28.x, var_294_28.y, var_294_28.z)

				local var_294_29 = var_294_21.localEulerAngles

				var_294_29.z = 0
				var_294_29.x = 0
				var_294_21.localEulerAngles = var_294_29
			end

			local var_294_30 = arg_291_1.actors_["1027ui_story"].transform
			local var_294_31 = 0

			if var_294_31 < arg_291_1.time_ and arg_291_1.time_ <= var_294_31 + arg_294_0 then
				arg_291_1.var_.moveOldPos1027ui_story = var_294_30.localPosition
			end

			local var_294_32 = 0.001

			if var_294_31 <= arg_291_1.time_ and arg_291_1.time_ < var_294_31 + var_294_32 then
				local var_294_33 = (arg_291_1.time_ - var_294_31) / var_294_32
				local var_294_34 = Vector3.New(10, -0.922, -5.1)

				var_294_30.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1027ui_story, var_294_34, var_294_33)

				local var_294_35 = manager.ui.mainCamera.transform.position - var_294_30.position

				var_294_30.forward = Vector3.New(var_294_35.x, var_294_35.y, var_294_35.z)

				local var_294_36 = var_294_30.localEulerAngles

				var_294_36.z = 0
				var_294_36.x = 0
				var_294_30.localEulerAngles = var_294_36
			end

			if arg_291_1.time_ >= var_294_31 + var_294_32 and arg_291_1.time_ < var_294_31 + var_294_32 + arg_294_0 then
				var_294_30.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_294_37 = manager.ui.mainCamera.transform.position - var_294_30.position

				var_294_30.forward = Vector3.New(var_294_37.x, var_294_37.y, var_294_37.z)

				local var_294_38 = var_294_30.localEulerAngles

				var_294_38.z = 0
				var_294_38.x = 0
				var_294_30.localEulerAngles = var_294_38
			end

			local var_294_39 = 0
			local var_294_40 = 0.825

			if var_294_39 < arg_291_1.time_ and arg_291_1.time_ <= var_294_39 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_41 = arg_291_1:GetWordFromCfg(103903073)
				local var_294_42 = arg_291_1:FormatText(var_294_41.content)

				arg_291_1.text_.text = var_294_42

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_43 = 33
				local var_294_44 = utf8.len(var_294_42)
				local var_294_45 = var_294_43 <= 0 and var_294_40 or var_294_40 * (var_294_44 / var_294_43)

				if var_294_45 > 0 and var_294_40 < var_294_45 then
					arg_291_1.talkMaxDuration = var_294_45

					if var_294_45 + var_294_39 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_45 + var_294_39
					end
				end

				arg_291_1.text_.text = var_294_42
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_46 = math.max(var_294_40, arg_291_1.talkMaxDuration)

			if var_294_39 <= arg_291_1.time_ and arg_291_1.time_ < var_294_39 + var_294_46 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_39) / var_294_46

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_39 + var_294_46 and arg_291_1.time_ < var_294_39 + var_294_46 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play103903074 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 103903074
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play103903075(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 0.325

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, false)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_2 = arg_295_1:GetWordFromCfg(103903074)
				local var_298_3 = arg_295_1:FormatText(var_298_2.content)

				arg_295_1.text_.text = var_298_3

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_4 = 13
				local var_298_5 = utf8.len(var_298_3)
				local var_298_6 = var_298_4 <= 0 and var_298_1 or var_298_1 * (var_298_5 / var_298_4)

				if var_298_6 > 0 and var_298_1 < var_298_6 then
					arg_295_1.talkMaxDuration = var_298_6

					if var_298_6 + var_298_0 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_6 + var_298_0
					end
				end

				arg_295_1.text_.text = var_298_3
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_7 = math.max(var_298_1, arg_295_1.talkMaxDuration)

			if var_298_0 <= arg_295_1.time_ and arg_295_1.time_ < var_298_0 + var_298_7 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_0) / var_298_7

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_0 + var_298_7 and arg_295_1.time_ < var_298_0 + var_298_7 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play103903075 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 103903075
		arg_299_1.duration_ = 6.333

		local var_299_0 = {
			ja = 6.233,
			ko = 4.9,
			zh = 4.9,
			en = 6.333
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
				arg_299_0:Play103903076(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1027ui_story"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.characterEffect1027ui_story == nil then
				arg_299_1.var_.characterEffect1027ui_story = var_302_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_2 = 0.1

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.characterEffect1027ui_story then
					arg_299_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect1027ui_story then
				arg_299_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_302_4 = arg_299_1.actors_["1027ui_story"].transform
			local var_302_5 = 0

			if var_302_5 < arg_299_1.time_ and arg_299_1.time_ <= var_302_5 + arg_302_0 then
				arg_299_1.var_.moveOldPos1027ui_story = var_302_4.localPosition
			end

			local var_302_6 = 0.001

			if var_302_5 <= arg_299_1.time_ and arg_299_1.time_ < var_302_5 + var_302_6 then
				local var_302_7 = (arg_299_1.time_ - var_302_5) / var_302_6
				local var_302_8 = Vector3.New(0, -0.922, -5.1)

				var_302_4.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1027ui_story, var_302_8, var_302_7)

				local var_302_9 = manager.ui.mainCamera.transform.position - var_302_4.position

				var_302_4.forward = Vector3.New(var_302_9.x, var_302_9.y, var_302_9.z)

				local var_302_10 = var_302_4.localEulerAngles

				var_302_10.z = 0
				var_302_10.x = 0
				var_302_4.localEulerAngles = var_302_10
			end

			if arg_299_1.time_ >= var_302_5 + var_302_6 and arg_299_1.time_ < var_302_5 + var_302_6 + arg_302_0 then
				var_302_4.localPosition = Vector3.New(0, -0.922, -5.1)

				local var_302_11 = manager.ui.mainCamera.transform.position - var_302_4.position

				var_302_4.forward = Vector3.New(var_302_11.x, var_302_11.y, var_302_11.z)

				local var_302_12 = var_302_4.localEulerAngles

				var_302_12.z = 0
				var_302_12.x = 0
				var_302_4.localEulerAngles = var_302_12
			end

			local var_302_13 = 0

			if var_302_13 < arg_299_1.time_ and arg_299_1.time_ <= var_302_13 + arg_302_0 then
				arg_299_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action3_1")
			end

			local var_302_14 = 0

			if var_302_14 < arg_299_1.time_ and arg_299_1.time_ <= var_302_14 + arg_302_0 then
				arg_299_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_302_15 = 0
			local var_302_16 = 0.475

			if var_302_15 < arg_299_1.time_ and arg_299_1.time_ <= var_302_15 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_17 = arg_299_1:FormatText(StoryNameCfg[56].name)

				arg_299_1.leftNameTxt_.text = var_302_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_18 = arg_299_1:GetWordFromCfg(103903075)
				local var_302_19 = arg_299_1:FormatText(var_302_18.content)

				arg_299_1.text_.text = var_302_19

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_20 = 19
				local var_302_21 = utf8.len(var_302_19)
				local var_302_22 = var_302_20 <= 0 and var_302_16 or var_302_16 * (var_302_21 / var_302_20)

				if var_302_22 > 0 and var_302_16 < var_302_22 then
					arg_299_1.talkMaxDuration = var_302_22

					if var_302_22 + var_302_15 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_22 + var_302_15
					end
				end

				arg_299_1.text_.text = var_302_19
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903075", "story_v_side_old_103903.awb") ~= 0 then
					local var_302_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903075", "story_v_side_old_103903.awb") / 1000

					if var_302_23 + var_302_15 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_23 + var_302_15
					end

					if var_302_18.prefab_name ~= "" and arg_299_1.actors_[var_302_18.prefab_name] ~= nil then
						local var_302_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_18.prefab_name].transform, "story_v_side_old_103903", "103903075", "story_v_side_old_103903.awb")

						arg_299_1:RecordAudio("103903075", var_302_24)
						arg_299_1:RecordAudio("103903075", var_302_24)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903075", "story_v_side_old_103903.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903075", "story_v_side_old_103903.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_25 = math.max(var_302_16, arg_299_1.talkMaxDuration)

			if var_302_15 <= arg_299_1.time_ and arg_299_1.time_ < var_302_15 + var_302_25 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_15) / var_302_25

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_15 + var_302_25 and arg_299_1.time_ < var_302_15 + var_302_25 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play103903076 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 103903076
		arg_303_1.duration_ = 10.266

		local var_303_0 = {
			ja = 10.266,
			ko = 6.666,
			zh = 6.666,
			en = 7.5
		}
		local var_303_1 = manager.audio:GetLocalizationFlag()

		if var_303_0[var_303_1] ~= nil then
			arg_303_1.duration_ = var_303_0[var_303_1]
		end

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play103903077(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_306_1 = 0
			local var_306_2 = 0.7

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_3 = arg_303_1:FormatText(StoryNameCfg[56].name)

				arg_303_1.leftNameTxt_.text = var_306_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_4 = arg_303_1:GetWordFromCfg(103903076)
				local var_306_5 = arg_303_1:FormatText(var_306_4.content)

				arg_303_1.text_.text = var_306_5

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_6 = 28
				local var_306_7 = utf8.len(var_306_5)
				local var_306_8 = var_306_6 <= 0 and var_306_2 or var_306_2 * (var_306_7 / var_306_6)

				if var_306_8 > 0 and var_306_2 < var_306_8 then
					arg_303_1.talkMaxDuration = var_306_8

					if var_306_8 + var_306_1 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_8 + var_306_1
					end
				end

				arg_303_1.text_.text = var_306_5
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903076", "story_v_side_old_103903.awb") ~= 0 then
					local var_306_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903076", "story_v_side_old_103903.awb") / 1000

					if var_306_9 + var_306_1 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_9 + var_306_1
					end

					if var_306_4.prefab_name ~= "" and arg_303_1.actors_[var_306_4.prefab_name] ~= nil then
						local var_306_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_4.prefab_name].transform, "story_v_side_old_103903", "103903076", "story_v_side_old_103903.awb")

						arg_303_1:RecordAudio("103903076", var_306_10)
						arg_303_1:RecordAudio("103903076", var_306_10)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903076", "story_v_side_old_103903.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903076", "story_v_side_old_103903.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_11 = math.max(var_306_2, arg_303_1.talkMaxDuration)

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_11 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_1) / var_306_11

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_1 + var_306_11 and arg_303_1.time_ < var_306_1 + var_306_11 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play103903077 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 103903077
		arg_307_1.duration_ = 7.866

		local var_307_0 = {
			ja = 7.866,
			ko = 6.6,
			zh = 6.6,
			en = 5.633
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
				arg_307_0:Play103903078(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_310_1 = 0
			local var_310_2 = 0.525

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_3 = arg_307_1:FormatText(StoryNameCfg[56].name)

				arg_307_1.leftNameTxt_.text = var_310_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_4 = arg_307_1:GetWordFromCfg(103903077)
				local var_310_5 = arg_307_1:FormatText(var_310_4.content)

				arg_307_1.text_.text = var_310_5

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_6 = 21
				local var_310_7 = utf8.len(var_310_5)
				local var_310_8 = var_310_6 <= 0 and var_310_2 or var_310_2 * (var_310_7 / var_310_6)

				if var_310_8 > 0 and var_310_2 < var_310_8 then
					arg_307_1.talkMaxDuration = var_310_8

					if var_310_8 + var_310_1 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_8 + var_310_1
					end
				end

				arg_307_1.text_.text = var_310_5
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903077", "story_v_side_old_103903.awb") ~= 0 then
					local var_310_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903077", "story_v_side_old_103903.awb") / 1000

					if var_310_9 + var_310_1 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_9 + var_310_1
					end

					if var_310_4.prefab_name ~= "" and arg_307_1.actors_[var_310_4.prefab_name] ~= nil then
						local var_310_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_4.prefab_name].transform, "story_v_side_old_103903", "103903077", "story_v_side_old_103903.awb")

						arg_307_1:RecordAudio("103903077", var_310_10)
						arg_307_1:RecordAudio("103903077", var_310_10)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903077", "story_v_side_old_103903.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903077", "story_v_side_old_103903.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_11 = math.max(var_310_2, arg_307_1.talkMaxDuration)

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_11 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_1) / var_310_11

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_1 + var_310_11 and arg_307_1.time_ < var_310_1 + var_310_11 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play103903078 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 103903078
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play103903079(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.5

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_2 = arg_311_1:GetWordFromCfg(103903078)
				local var_314_3 = arg_311_1:FormatText(var_314_2.content)

				arg_311_1.text_.text = var_314_3

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_4 = 20
				local var_314_5 = utf8.len(var_314_3)
				local var_314_6 = var_314_4 <= 0 and var_314_1 or var_314_1 * (var_314_5 / var_314_4)

				if var_314_6 > 0 and var_314_1 < var_314_6 then
					arg_311_1.talkMaxDuration = var_314_6

					if var_314_6 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_6 + var_314_0
					end
				end

				arg_311_1.text_.text = var_314_3
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_7 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_7 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_7

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_7 and arg_311_1.time_ < var_314_0 + var_314_7 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play103903079 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 103903079
		arg_315_1.duration_ = 6.833

		local var_315_0 = {
			ja = 6.833,
			ko = 5.2,
			zh = 5.2,
			en = 6.1
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
				arg_315_0:Play103903080(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1039ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.characterEffect1039ui_story == nil then
				arg_315_1.var_.characterEffect1039ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.1

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect1039ui_story then
					arg_315_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect1039ui_story then
				arg_315_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_318_4 = arg_315_1.actors_["1027ui_story"]
			local var_318_5 = 0

			if var_318_5 < arg_315_1.time_ and arg_315_1.time_ <= var_318_5 + arg_318_0 and arg_315_1.var_.characterEffect1027ui_story == nil then
				arg_315_1.var_.characterEffect1027ui_story = var_318_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_6 = 0.1

			if var_318_5 <= arg_315_1.time_ and arg_315_1.time_ < var_318_5 + var_318_6 then
				local var_318_7 = (arg_315_1.time_ - var_318_5) / var_318_6

				if arg_315_1.var_.characterEffect1027ui_story then
					local var_318_8 = Mathf.Lerp(0, 0.5, var_318_7)

					arg_315_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1027ui_story.fillRatio = var_318_8
				end
			end

			if arg_315_1.time_ >= var_318_5 + var_318_6 and arg_315_1.time_ < var_318_5 + var_318_6 + arg_318_0 and arg_315_1.var_.characterEffect1027ui_story then
				local var_318_9 = 0.5

				arg_315_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1027ui_story.fillRatio = var_318_9
			end

			local var_318_10 = arg_315_1.actors_["1027ui_story"].transform
			local var_318_11 = 0.033

			if var_318_11 < arg_315_1.time_ and arg_315_1.time_ <= var_318_11 + arg_318_0 then
				arg_315_1.var_.moveOldPos1027ui_story = var_318_10.localPosition
			end

			local var_318_12 = 0.5

			if var_318_11 <= arg_315_1.time_ and arg_315_1.time_ < var_318_11 + var_318_12 then
				local var_318_13 = (arg_315_1.time_ - var_318_11) / var_318_12
				local var_318_14 = Vector3.New(-0.92, -0.922, -5.1)

				var_318_10.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1027ui_story, var_318_14, var_318_13)

				local var_318_15 = manager.ui.mainCamera.transform.position - var_318_10.position

				var_318_10.forward = Vector3.New(var_318_15.x, var_318_15.y, var_318_15.z)

				local var_318_16 = var_318_10.localEulerAngles

				var_318_16.z = 0
				var_318_16.x = 0
				var_318_10.localEulerAngles = var_318_16
			end

			if arg_315_1.time_ >= var_318_11 + var_318_12 and arg_315_1.time_ < var_318_11 + var_318_12 + arg_318_0 then
				var_318_10.localPosition = Vector3.New(-0.92, -0.922, -5.1)

				local var_318_17 = manager.ui.mainCamera.transform.position - var_318_10.position

				var_318_10.forward = Vector3.New(var_318_17.x, var_318_17.y, var_318_17.z)

				local var_318_18 = var_318_10.localEulerAngles

				var_318_18.z = 0
				var_318_18.x = 0
				var_318_10.localEulerAngles = var_318_18
			end

			local var_318_19 = arg_315_1.actors_["1027ui_story"].transform
			local var_318_20 = 0

			if var_318_20 < arg_315_1.time_ and arg_315_1.time_ <= var_318_20 + arg_318_0 then
				arg_315_1.var_.moveOldPos1027ui_story = var_318_19.localPosition
			end

			local var_318_21 = 0.001

			if var_318_20 <= arg_315_1.time_ and arg_315_1.time_ < var_318_20 + var_318_21 then
				local var_318_22 = (arg_315_1.time_ - var_318_20) / var_318_21
				local var_318_23 = Vector3.New(0, -0.922, -5.1)

				var_318_19.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1027ui_story, var_318_23, var_318_22)

				local var_318_24 = manager.ui.mainCamera.transform.position - var_318_19.position

				var_318_19.forward = Vector3.New(var_318_24.x, var_318_24.y, var_318_24.z)

				local var_318_25 = var_318_19.localEulerAngles

				var_318_25.z = 0
				var_318_25.x = 0
				var_318_19.localEulerAngles = var_318_25
			end

			if arg_315_1.time_ >= var_318_20 + var_318_21 and arg_315_1.time_ < var_318_20 + var_318_21 + arg_318_0 then
				var_318_19.localPosition = Vector3.New(0, -0.922, -5.1)

				local var_318_26 = manager.ui.mainCamera.transform.position - var_318_19.position

				var_318_19.forward = Vector3.New(var_318_26.x, var_318_26.y, var_318_26.z)

				local var_318_27 = var_318_19.localEulerAngles

				var_318_27.z = 0
				var_318_27.x = 0
				var_318_19.localEulerAngles = var_318_27
			end

			local var_318_28 = arg_315_1.actors_["1039ui_story"].transform
			local var_318_29 = 0

			if var_318_29 < arg_315_1.time_ and arg_315_1.time_ <= var_318_29 + arg_318_0 then
				arg_315_1.var_.moveOldPos1039ui_story = var_318_28.localPosition
			end

			local var_318_30 = 0.001

			if var_318_29 <= arg_315_1.time_ and arg_315_1.time_ < var_318_29 + var_318_30 then
				local var_318_31 = (arg_315_1.time_ - var_318_29) / var_318_30
				local var_318_32 = Vector3.New(0.85, -1.06, -5.3)

				var_318_28.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1039ui_story, var_318_32, var_318_31)

				local var_318_33 = manager.ui.mainCamera.transform.position - var_318_28.position

				var_318_28.forward = Vector3.New(var_318_33.x, var_318_33.y, var_318_33.z)

				local var_318_34 = var_318_28.localEulerAngles

				var_318_34.z = 0
				var_318_34.x = 0
				var_318_28.localEulerAngles = var_318_34
			end

			if arg_315_1.time_ >= var_318_29 + var_318_30 and arg_315_1.time_ < var_318_29 + var_318_30 + arg_318_0 then
				var_318_28.localPosition = Vector3.New(0.85, -1.06, -5.3)

				local var_318_35 = manager.ui.mainCamera.transform.position - var_318_28.position

				var_318_28.forward = Vector3.New(var_318_35.x, var_318_35.y, var_318_35.z)

				local var_318_36 = var_318_28.localEulerAngles

				var_318_36.z = 0
				var_318_36.x = 0
				var_318_28.localEulerAngles = var_318_36
			end

			local var_318_37 = 0

			if var_318_37 < arg_315_1.time_ and arg_315_1.time_ <= var_318_37 + arg_318_0 then
				arg_315_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_318_38 = 0

			if var_318_38 < arg_315_1.time_ and arg_315_1.time_ <= var_318_38 + arg_318_0 then
				arg_315_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_318_39 = 0
			local var_318_40 = 0.55

			if var_318_39 < arg_315_1.time_ and arg_315_1.time_ <= var_318_39 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_41 = arg_315_1:FormatText(StoryNameCfg[9].name)

				arg_315_1.leftNameTxt_.text = var_318_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_42 = arg_315_1:GetWordFromCfg(103903079)
				local var_318_43 = arg_315_1:FormatText(var_318_42.content)

				arg_315_1.text_.text = var_318_43

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_44 = 22
				local var_318_45 = utf8.len(var_318_43)
				local var_318_46 = var_318_44 <= 0 and var_318_40 or var_318_40 * (var_318_45 / var_318_44)

				if var_318_46 > 0 and var_318_40 < var_318_46 then
					arg_315_1.talkMaxDuration = var_318_46

					if var_318_46 + var_318_39 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_46 + var_318_39
					end
				end

				arg_315_1.text_.text = var_318_43
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903079", "story_v_side_old_103903.awb") ~= 0 then
					local var_318_47 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903079", "story_v_side_old_103903.awb") / 1000

					if var_318_47 + var_318_39 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_47 + var_318_39
					end

					if var_318_42.prefab_name ~= "" and arg_315_1.actors_[var_318_42.prefab_name] ~= nil then
						local var_318_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_42.prefab_name].transform, "story_v_side_old_103903", "103903079", "story_v_side_old_103903.awb")

						arg_315_1:RecordAudio("103903079", var_318_48)
						arg_315_1:RecordAudio("103903079", var_318_48)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903079", "story_v_side_old_103903.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903079", "story_v_side_old_103903.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_49 = math.max(var_318_40, arg_315_1.talkMaxDuration)

			if var_318_39 <= arg_315_1.time_ and arg_315_1.time_ < var_318_39 + var_318_49 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_39) / var_318_49

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_39 + var_318_49 and arg_315_1.time_ < var_318_39 + var_318_49 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play103903080 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 103903080
		arg_319_1.duration_ = 9

		local var_319_0 = {
			ja = 9,
			ko = 7.033,
			zh = 7.033,
			en = 6.833
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
				arg_319_0:Play103903081(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1027ui_story"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.characterEffect1027ui_story == nil then
				arg_319_1.var_.characterEffect1027ui_story = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.1

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect1027ui_story then
					arg_319_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1027ui_story then
				arg_319_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_322_4 = arg_319_1.actors_["1039ui_story"]
			local var_322_5 = 0

			if var_322_5 < arg_319_1.time_ and arg_319_1.time_ <= var_322_5 + arg_322_0 and arg_319_1.var_.characterEffect1039ui_story == nil then
				arg_319_1.var_.characterEffect1039ui_story = var_322_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_6 = 0.1

			if var_322_5 <= arg_319_1.time_ and arg_319_1.time_ < var_322_5 + var_322_6 then
				local var_322_7 = (arg_319_1.time_ - var_322_5) / var_322_6

				if arg_319_1.var_.characterEffect1039ui_story then
					local var_322_8 = Mathf.Lerp(0, 0.5, var_322_7)

					arg_319_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1039ui_story.fillRatio = var_322_8
				end
			end

			if arg_319_1.time_ >= var_322_5 + var_322_6 and arg_319_1.time_ < var_322_5 + var_322_6 + arg_322_0 and arg_319_1.var_.characterEffect1039ui_story then
				local var_322_9 = 0.5

				arg_319_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1039ui_story.fillRatio = var_322_9
			end

			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 then
				arg_319_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action432")
			end

			local var_322_11 = 0

			if var_322_11 < arg_319_1.time_ and arg_319_1.time_ <= var_322_11 + arg_322_0 then
				arg_319_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_322_12 = 0
			local var_322_13 = 0.575

			if var_322_12 < arg_319_1.time_ and arg_319_1.time_ <= var_322_12 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_14 = arg_319_1:FormatText(StoryNameCfg[56].name)

				arg_319_1.leftNameTxt_.text = var_322_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_15 = arg_319_1:GetWordFromCfg(103903080)
				local var_322_16 = arg_319_1:FormatText(var_322_15.content)

				arg_319_1.text_.text = var_322_16

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_17 = 23
				local var_322_18 = utf8.len(var_322_16)
				local var_322_19 = var_322_17 <= 0 and var_322_13 or var_322_13 * (var_322_18 / var_322_17)

				if var_322_19 > 0 and var_322_13 < var_322_19 then
					arg_319_1.talkMaxDuration = var_322_19

					if var_322_19 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_19 + var_322_12
					end
				end

				arg_319_1.text_.text = var_322_16
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903080", "story_v_side_old_103903.awb") ~= 0 then
					local var_322_20 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903080", "story_v_side_old_103903.awb") / 1000

					if var_322_20 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_20 + var_322_12
					end

					if var_322_15.prefab_name ~= "" and arg_319_1.actors_[var_322_15.prefab_name] ~= nil then
						local var_322_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_15.prefab_name].transform, "story_v_side_old_103903", "103903080", "story_v_side_old_103903.awb")

						arg_319_1:RecordAudio("103903080", var_322_21)
						arg_319_1:RecordAudio("103903080", var_322_21)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903080", "story_v_side_old_103903.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903080", "story_v_side_old_103903.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_22 = math.max(var_322_13, arg_319_1.talkMaxDuration)

			if var_322_12 <= arg_319_1.time_ and arg_319_1.time_ < var_322_12 + var_322_22 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_12) / var_322_22

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_12 + var_322_22 and arg_319_1.time_ < var_322_12 + var_322_22 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play103903081 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 103903081
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play103903082(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0
			local var_326_1 = 0.525

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_2 = arg_323_1:GetWordFromCfg(103903081)
				local var_326_3 = arg_323_1:FormatText(var_326_2.content)

				arg_323_1.text_.text = var_326_3

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_4 = 21
				local var_326_5 = utf8.len(var_326_3)
				local var_326_6 = var_326_4 <= 0 and var_326_1 or var_326_1 * (var_326_5 / var_326_4)

				if var_326_6 > 0 and var_326_1 < var_326_6 then
					arg_323_1.talkMaxDuration = var_326_6

					if var_326_6 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_6 + var_326_0
					end
				end

				arg_323_1.text_.text = var_326_3
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_7 = math.max(var_326_1, arg_323_1.talkMaxDuration)

			if var_326_0 <= arg_323_1.time_ and arg_323_1.time_ < var_326_0 + var_326_7 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_0) / var_326_7

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_0 + var_326_7 and arg_323_1.time_ < var_326_0 + var_326_7 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play103903082 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 103903082
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play103903083(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1027ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1027ui_story == nil then
				arg_327_1.var_.characterEffect1027ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.1

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1027ui_story then
					local var_330_4 = Mathf.Lerp(0, 0.5, var_330_3)

					arg_327_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_327_1.var_.characterEffect1027ui_story.fillRatio = var_330_4
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1027ui_story then
				local var_330_5 = 0.5

				arg_327_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_327_1.var_.characterEffect1027ui_story.fillRatio = var_330_5
			end

			local var_330_6 = 0
			local var_330_7 = 0.575

			if var_330_6 < arg_327_1.time_ and arg_327_1.time_ <= var_330_6 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_8 = arg_327_1:GetWordFromCfg(103903082)
				local var_330_9 = arg_327_1:FormatText(var_330_8.content)

				arg_327_1.text_.text = var_330_9

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_10 = 23
				local var_330_11 = utf8.len(var_330_9)
				local var_330_12 = var_330_10 <= 0 and var_330_7 or var_330_7 * (var_330_11 / var_330_10)

				if var_330_12 > 0 and var_330_7 < var_330_12 then
					arg_327_1.talkMaxDuration = var_330_12

					if var_330_12 + var_330_6 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_12 + var_330_6
					end
				end

				arg_327_1.text_.text = var_330_9
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_13 = math.max(var_330_7, arg_327_1.talkMaxDuration)

			if var_330_6 <= arg_327_1.time_ and arg_327_1.time_ < var_330_6 + var_330_13 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_6) / var_330_13

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_6 + var_330_13 and arg_327_1.time_ < var_330_6 + var_330_13 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play103903083 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 103903083
		arg_331_1.duration_ = 7.233333333331

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play103903084(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1039ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1039ui_story == nil then
				arg_331_1.var_.characterEffect1039ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.1

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1039ui_story then
					arg_331_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1039ui_story then
				arg_331_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_334_4 = arg_331_1.actors_["1027ui_story"].transform
			local var_334_5 = 0

			if var_334_5 < arg_331_1.time_ and arg_331_1.time_ <= var_334_5 + arg_334_0 then
				arg_331_1.var_.moveOldPos1027ui_story = var_334_4.localPosition
			end

			local var_334_6 = 0.001

			if var_334_5 <= arg_331_1.time_ and arg_331_1.time_ < var_334_5 + var_334_6 then
				local var_334_7 = (arg_331_1.time_ - var_334_5) / var_334_6
				local var_334_8 = Vector3.New(10, -0.922, -5.1)

				var_334_4.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1027ui_story, var_334_8, var_334_7)

				local var_334_9 = manager.ui.mainCamera.transform.position - var_334_4.position

				var_334_4.forward = Vector3.New(var_334_9.x, var_334_9.y, var_334_9.z)

				local var_334_10 = var_334_4.localEulerAngles

				var_334_10.z = 0
				var_334_10.x = 0
				var_334_4.localEulerAngles = var_334_10
			end

			if arg_331_1.time_ >= var_334_5 + var_334_6 and arg_331_1.time_ < var_334_5 + var_334_6 + arg_334_0 then
				var_334_4.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_334_11 = manager.ui.mainCamera.transform.position - var_334_4.position

				var_334_4.forward = Vector3.New(var_334_11.x, var_334_11.y, var_334_11.z)

				local var_334_12 = var_334_4.localEulerAngles

				var_334_12.z = 0
				var_334_12.x = 0
				var_334_4.localEulerAngles = var_334_12
			end

			local var_334_13 = arg_331_1.actors_["1039ui_story"].transform
			local var_334_14 = 0.033

			if var_334_14 < arg_331_1.time_ and arg_331_1.time_ <= var_334_14 + arg_334_0 then
				arg_331_1.var_.moveOldPos1039ui_story = var_334_13.localPosition
			end

			local var_334_15 = 0.5

			if var_334_14 <= arg_331_1.time_ and arg_331_1.time_ < var_334_14 + var_334_15 then
				local var_334_16 = (arg_331_1.time_ - var_334_14) / var_334_15
				local var_334_17 = Vector3.New(0, -1.06, -5.3)

				var_334_13.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1039ui_story, var_334_17, var_334_16)

				local var_334_18 = manager.ui.mainCamera.transform.position - var_334_13.position

				var_334_13.forward = Vector3.New(var_334_18.x, var_334_18.y, var_334_18.z)

				local var_334_19 = var_334_13.localEulerAngles

				var_334_19.z = 0
				var_334_19.x = 0
				var_334_13.localEulerAngles = var_334_19
			end

			if arg_331_1.time_ >= var_334_14 + var_334_15 and arg_331_1.time_ < var_334_14 + var_334_15 + arg_334_0 then
				var_334_13.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_334_20 = manager.ui.mainCamera.transform.position - var_334_13.position

				var_334_13.forward = Vector3.New(var_334_20.x, var_334_20.y, var_334_20.z)

				local var_334_21 = var_334_13.localEulerAngles

				var_334_21.z = 0
				var_334_21.x = 0
				var_334_13.localEulerAngles = var_334_21
			end

			local var_334_22 = arg_331_1.actors_["1039ui_story"].transform
			local var_334_23 = 0

			if var_334_23 < arg_331_1.time_ and arg_331_1.time_ <= var_334_23 + arg_334_0 then
				arg_331_1.var_.moveOldPos1039ui_story = var_334_22.localPosition
			end

			local var_334_24 = 0.001

			if var_334_23 <= arg_331_1.time_ and arg_331_1.time_ < var_334_23 + var_334_24 then
				local var_334_25 = (arg_331_1.time_ - var_334_23) / var_334_24
				local var_334_26 = Vector3.New(0.85, -1.06, -5.3)

				var_334_22.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1039ui_story, var_334_26, var_334_25)

				local var_334_27 = manager.ui.mainCamera.transform.position - var_334_22.position

				var_334_22.forward = Vector3.New(var_334_27.x, var_334_27.y, var_334_27.z)

				local var_334_28 = var_334_22.localEulerAngles

				var_334_28.z = 0
				var_334_28.x = 0
				var_334_22.localEulerAngles = var_334_28
			end

			if arg_331_1.time_ >= var_334_23 + var_334_24 and arg_331_1.time_ < var_334_23 + var_334_24 + arg_334_0 then
				var_334_22.localPosition = Vector3.New(0.85, -1.06, -5.3)

				local var_334_29 = manager.ui.mainCamera.transform.position - var_334_22.position

				var_334_22.forward = Vector3.New(var_334_29.x, var_334_29.y, var_334_29.z)

				local var_334_30 = var_334_22.localEulerAngles

				var_334_30.z = 0
				var_334_30.x = 0
				var_334_22.localEulerAngles = var_334_30
			end

			local var_334_31 = 0

			if var_334_31 < arg_331_1.time_ and arg_331_1.time_ <= var_334_31 + arg_334_0 then
				arg_331_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action426")
			end

			local var_334_32 = 0
			local var_334_33 = 0.475

			if var_334_32 < arg_331_1.time_ and arg_331_1.time_ <= var_334_32 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, false)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_34 = arg_331_1:GetWordFromCfg(103903083)
				local var_334_35 = arg_331_1:FormatText(var_334_34.content)

				arg_331_1.text_.text = var_334_35

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_36 = 19
				local var_334_37 = utf8.len(var_334_35)
				local var_334_38 = var_334_36 <= 0 and var_334_33 or var_334_33 * (var_334_37 / var_334_36)

				if var_334_38 > 0 and var_334_33 < var_334_38 then
					arg_331_1.talkMaxDuration = var_334_38

					if var_334_38 + var_334_32 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_38 + var_334_32
					end
				end

				arg_331_1.text_.text = var_334_35
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_39 = math.max(var_334_33, arg_331_1.talkMaxDuration)

			if var_334_32 <= arg_331_1.time_ and arg_331_1.time_ < var_334_32 + var_334_39 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_32) / var_334_39

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_32 + var_334_39 and arg_331_1.time_ < var_334_32 + var_334_39 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play103903084 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 103903084
		arg_335_1.duration_ = 7.533

		local var_335_0 = {
			ja = 7.533,
			ko = 4.966,
			zh = 4.966,
			en = 4.133
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
				arg_335_0:Play103903085(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action464")
			end

			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 then
				arg_335_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_338_2 = 0
			local var_338_3 = 0.45

			if var_338_2 < arg_335_1.time_ and arg_335_1.time_ <= var_338_2 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_4 = arg_335_1:FormatText(StoryNameCfg[9].name)

				arg_335_1.leftNameTxt_.text = var_338_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_5 = arg_335_1:GetWordFromCfg(103903084)
				local var_338_6 = arg_335_1:FormatText(var_338_5.content)

				arg_335_1.text_.text = var_338_6

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_7 = 18
				local var_338_8 = utf8.len(var_338_6)
				local var_338_9 = var_338_7 <= 0 and var_338_3 or var_338_3 * (var_338_8 / var_338_7)

				if var_338_9 > 0 and var_338_3 < var_338_9 then
					arg_335_1.talkMaxDuration = var_338_9

					if var_338_9 + var_338_2 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_9 + var_338_2
					end
				end

				arg_335_1.text_.text = var_338_6
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903084", "story_v_side_old_103903.awb") ~= 0 then
					local var_338_10 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903084", "story_v_side_old_103903.awb") / 1000

					if var_338_10 + var_338_2 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_10 + var_338_2
					end

					if var_338_5.prefab_name ~= "" and arg_335_1.actors_[var_338_5.prefab_name] ~= nil then
						local var_338_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_5.prefab_name].transform, "story_v_side_old_103903", "103903084", "story_v_side_old_103903.awb")

						arg_335_1:RecordAudio("103903084", var_338_11)
						arg_335_1:RecordAudio("103903084", var_338_11)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903084", "story_v_side_old_103903.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903084", "story_v_side_old_103903.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_12 = math.max(var_338_3, arg_335_1.talkMaxDuration)

			if var_338_2 <= arg_335_1.time_ and arg_335_1.time_ < var_338_2 + var_338_12 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_2) / var_338_12

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_2 + var_338_12 and arg_335_1.time_ < var_338_2 + var_338_12 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play103903085 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 103903085
		arg_339_1.duration_ = 5.9

		local var_339_0 = {
			ja = 5.4,
			ko = 5.9,
			zh = 5.9,
			en = 3.5
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
				arg_339_0:Play103903086(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_342_1 = 0
			local var_342_2 = 0.65

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_3 = arg_339_1:FormatText(StoryNameCfg[9].name)

				arg_339_1.leftNameTxt_.text = var_342_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_4 = arg_339_1:GetWordFromCfg(103903085)
				local var_342_5 = arg_339_1:FormatText(var_342_4.content)

				arg_339_1.text_.text = var_342_5

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_6 = 26
				local var_342_7 = utf8.len(var_342_5)
				local var_342_8 = var_342_6 <= 0 and var_342_2 or var_342_2 * (var_342_7 / var_342_6)

				if var_342_8 > 0 and var_342_2 < var_342_8 then
					arg_339_1.talkMaxDuration = var_342_8

					if var_342_8 + var_342_1 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_8 + var_342_1
					end
				end

				arg_339_1.text_.text = var_342_5
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903085", "story_v_side_old_103903.awb") ~= 0 then
					local var_342_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903085", "story_v_side_old_103903.awb") / 1000

					if var_342_9 + var_342_1 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_9 + var_342_1
					end

					if var_342_4.prefab_name ~= "" and arg_339_1.actors_[var_342_4.prefab_name] ~= nil then
						local var_342_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_4.prefab_name].transform, "story_v_side_old_103903", "103903085", "story_v_side_old_103903.awb")

						arg_339_1:RecordAudio("103903085", var_342_10)
						arg_339_1:RecordAudio("103903085", var_342_10)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903085", "story_v_side_old_103903.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903085", "story_v_side_old_103903.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_11 = math.max(var_342_2, arg_339_1.talkMaxDuration)

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_11 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_1) / var_342_11

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_1 + var_342_11 and arg_339_1.time_ < var_342_1 + var_342_11 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play103903086 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 103903086
		arg_343_1.duration_ = 1.999999999999

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play103903087(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1027ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.characterEffect1027ui_story == nil then
				arg_343_1.var_.characterEffect1027ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.1

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect1027ui_story then
					arg_343_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.characterEffect1027ui_story then
				arg_343_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_346_4 = arg_343_1.actors_["1039ui_story"]
			local var_346_5 = 0

			if var_346_5 < arg_343_1.time_ and arg_343_1.time_ <= var_346_5 + arg_346_0 and arg_343_1.var_.characterEffect1039ui_story == nil then
				arg_343_1.var_.characterEffect1039ui_story = var_346_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_6 = 0.1

			if var_346_5 <= arg_343_1.time_ and arg_343_1.time_ < var_346_5 + var_346_6 then
				local var_346_7 = (arg_343_1.time_ - var_346_5) / var_346_6

				if arg_343_1.var_.characterEffect1039ui_story then
					local var_346_8 = Mathf.Lerp(0, 0.5, var_346_7)

					arg_343_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1039ui_story.fillRatio = var_346_8
				end
			end

			if arg_343_1.time_ >= var_346_5 + var_346_6 and arg_343_1.time_ < var_346_5 + var_346_6 + arg_346_0 and arg_343_1.var_.characterEffect1039ui_story then
				local var_346_9 = 0.5

				arg_343_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1039ui_story.fillRatio = var_346_9
			end

			local var_346_10 = arg_343_1.actors_["1039ui_story"].transform
			local var_346_11 = 0

			if var_346_11 < arg_343_1.time_ and arg_343_1.time_ <= var_346_11 + arg_346_0 then
				arg_343_1.var_.moveOldPos1039ui_story = var_346_10.localPosition
			end

			local var_346_12 = 0.001

			if var_346_11 <= arg_343_1.time_ and arg_343_1.time_ < var_346_11 + var_346_12 then
				local var_346_13 = (arg_343_1.time_ - var_346_11) / var_346_12
				local var_346_14 = Vector3.New(10, -1.06, -5.3)

				var_346_10.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1039ui_story, var_346_14, var_346_13)

				local var_346_15 = manager.ui.mainCamera.transform.position - var_346_10.position

				var_346_10.forward = Vector3.New(var_346_15.x, var_346_15.y, var_346_15.z)

				local var_346_16 = var_346_10.localEulerAngles

				var_346_16.z = 0
				var_346_16.x = 0
				var_346_10.localEulerAngles = var_346_16
			end

			if arg_343_1.time_ >= var_346_11 + var_346_12 and arg_343_1.time_ < var_346_11 + var_346_12 + arg_346_0 then
				var_346_10.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_346_17 = manager.ui.mainCamera.transform.position - var_346_10.position

				var_346_10.forward = Vector3.New(var_346_17.x, var_346_17.y, var_346_17.z)

				local var_346_18 = var_346_10.localEulerAngles

				var_346_18.z = 0
				var_346_18.x = 0
				var_346_10.localEulerAngles = var_346_18
			end

			local var_346_19 = arg_343_1.actors_["1027ui_story"].transform
			local var_346_20 = 0

			if var_346_20 < arg_343_1.time_ and arg_343_1.time_ <= var_346_20 + arg_346_0 then
				arg_343_1.var_.moveOldPos1027ui_story = var_346_19.localPosition
			end

			local var_346_21 = 0.001

			if var_346_20 <= arg_343_1.time_ and arg_343_1.time_ < var_346_20 + var_346_21 then
				local var_346_22 = (arg_343_1.time_ - var_346_20) / var_346_21
				local var_346_23 = Vector3.New(0, -0.922, -5.1)

				var_346_19.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1027ui_story, var_346_23, var_346_22)

				local var_346_24 = manager.ui.mainCamera.transform.position - var_346_19.position

				var_346_19.forward = Vector3.New(var_346_24.x, var_346_24.y, var_346_24.z)

				local var_346_25 = var_346_19.localEulerAngles

				var_346_25.z = 0
				var_346_25.x = 0
				var_346_19.localEulerAngles = var_346_25
			end

			if arg_343_1.time_ >= var_346_20 + var_346_21 and arg_343_1.time_ < var_346_20 + var_346_21 + arg_346_0 then
				var_346_19.localPosition = Vector3.New(0, -0.922, -5.1)

				local var_346_26 = manager.ui.mainCamera.transform.position - var_346_19.position

				var_346_19.forward = Vector3.New(var_346_26.x, var_346_26.y, var_346_26.z)

				local var_346_27 = var_346_19.localEulerAngles

				var_346_27.z = 0
				var_346_27.x = 0
				var_346_19.localEulerAngles = var_346_27
			end

			local var_346_28 = 0

			if var_346_28 < arg_343_1.time_ and arg_343_1.time_ <= var_346_28 + arg_346_0 then
				arg_343_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_346_29 = 0

			if var_346_29 < arg_343_1.time_ and arg_343_1.time_ <= var_346_29 + arg_346_0 then
				arg_343_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_346_30 = 0
			local var_346_31 = 0.05

			if var_346_30 < arg_343_1.time_ and arg_343_1.time_ <= var_346_30 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_32 = arg_343_1:FormatText(StoryNameCfg[56].name)

				arg_343_1.leftNameTxt_.text = var_346_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_33 = arg_343_1:GetWordFromCfg(103903086)
				local var_346_34 = arg_343_1:FormatText(var_346_33.content)

				arg_343_1.text_.text = var_346_34

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_35 = 2
				local var_346_36 = utf8.len(var_346_34)
				local var_346_37 = var_346_35 <= 0 and var_346_31 or var_346_31 * (var_346_36 / var_346_35)

				if var_346_37 > 0 and var_346_31 < var_346_37 then
					arg_343_1.talkMaxDuration = var_346_37

					if var_346_37 + var_346_30 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_37 + var_346_30
					end
				end

				arg_343_1.text_.text = var_346_34
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903086", "story_v_side_old_103903.awb") ~= 0 then
					local var_346_38 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903086", "story_v_side_old_103903.awb") / 1000

					if var_346_38 + var_346_30 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_38 + var_346_30
					end

					if var_346_33.prefab_name ~= "" and arg_343_1.actors_[var_346_33.prefab_name] ~= nil then
						local var_346_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_33.prefab_name].transform, "story_v_side_old_103903", "103903086", "story_v_side_old_103903.awb")

						arg_343_1:RecordAudio("103903086", var_346_39)
						arg_343_1:RecordAudio("103903086", var_346_39)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903086", "story_v_side_old_103903.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903086", "story_v_side_old_103903.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_40 = math.max(var_346_31, arg_343_1.talkMaxDuration)

			if var_346_30 <= arg_343_1.time_ and arg_343_1.time_ < var_346_30 + var_346_40 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_30) / var_346_40

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_30 + var_346_40 and arg_343_1.time_ < var_346_30 + var_346_40 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play103903087 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 103903087
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play103903088(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1027ui_story"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.characterEffect1027ui_story == nil then
				arg_347_1.var_.characterEffect1027ui_story = var_350_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_2 = 0.1

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.characterEffect1027ui_story then
					local var_350_4 = Mathf.Lerp(0, 0.5, var_350_3)

					arg_347_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_347_1.var_.characterEffect1027ui_story.fillRatio = var_350_4
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.characterEffect1027ui_story then
				local var_350_5 = 0.5

				arg_347_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_347_1.var_.characterEffect1027ui_story.fillRatio = var_350_5
			end

			local var_350_6 = arg_347_1.actors_["1027ui_story"].transform
			local var_350_7 = 0

			if var_350_7 < arg_347_1.time_ and arg_347_1.time_ <= var_350_7 + arg_350_0 then
				arg_347_1.var_.moveOldPos1027ui_story = var_350_6.localPosition
			end

			local var_350_8 = 0.001

			if var_350_7 <= arg_347_1.time_ and arg_347_1.time_ < var_350_7 + var_350_8 then
				local var_350_9 = (arg_347_1.time_ - var_350_7) / var_350_8
				local var_350_10 = Vector3.New(10, -0.922, -5.1)

				var_350_6.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1027ui_story, var_350_10, var_350_9)

				local var_350_11 = manager.ui.mainCamera.transform.position - var_350_6.position

				var_350_6.forward = Vector3.New(var_350_11.x, var_350_11.y, var_350_11.z)

				local var_350_12 = var_350_6.localEulerAngles

				var_350_12.z = 0
				var_350_12.x = 0
				var_350_6.localEulerAngles = var_350_12
			end

			if arg_347_1.time_ >= var_350_7 + var_350_8 and arg_347_1.time_ < var_350_7 + var_350_8 + arg_350_0 then
				var_350_6.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_350_13 = manager.ui.mainCamera.transform.position - var_350_6.position

				var_350_6.forward = Vector3.New(var_350_13.x, var_350_13.y, var_350_13.z)

				local var_350_14 = var_350_6.localEulerAngles

				var_350_14.z = 0
				var_350_14.x = 0
				var_350_6.localEulerAngles = var_350_14
			end

			local var_350_15 = 0
			local var_350_16 = 0.9

			if var_350_15 < arg_347_1.time_ and arg_347_1.time_ <= var_350_15 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, false)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_17 = arg_347_1:GetWordFromCfg(103903087)
				local var_350_18 = arg_347_1:FormatText(var_350_17.content)

				arg_347_1.text_.text = var_350_18

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_19 = 36
				local var_350_20 = utf8.len(var_350_18)
				local var_350_21 = var_350_19 <= 0 and var_350_16 or var_350_16 * (var_350_20 / var_350_19)

				if var_350_21 > 0 and var_350_16 < var_350_21 then
					arg_347_1.talkMaxDuration = var_350_21

					if var_350_21 + var_350_15 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_21 + var_350_15
					end
				end

				arg_347_1.text_.text = var_350_18
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_22 = math.max(var_350_16, arg_347_1.talkMaxDuration)

			if var_350_15 <= arg_347_1.time_ and arg_347_1.time_ < var_350_15 + var_350_22 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_15) / var_350_22

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_15 + var_350_22 and arg_347_1.time_ < var_350_15 + var_350_22 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play103903088 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 103903088
		arg_351_1.duration_ = 5

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play103903089(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0
			local var_354_1 = 1.175

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, false)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_2 = arg_351_1:GetWordFromCfg(103903088)
				local var_354_3 = arg_351_1:FormatText(var_354_2.content)

				arg_351_1.text_.text = var_354_3

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_4 = 47
				local var_354_5 = utf8.len(var_354_3)
				local var_354_6 = var_354_4 <= 0 and var_354_1 or var_354_1 * (var_354_5 / var_354_4)

				if var_354_6 > 0 and var_354_1 < var_354_6 then
					arg_351_1.talkMaxDuration = var_354_6

					if var_354_6 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_6 + var_354_0
					end
				end

				arg_351_1.text_.text = var_354_3
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_7 = math.max(var_354_1, arg_351_1.talkMaxDuration)

			if var_354_0 <= arg_351_1.time_ and arg_351_1.time_ < var_354_0 + var_354_7 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_0) / var_354_7

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_0 + var_354_7 and arg_351_1.time_ < var_354_0 + var_354_7 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play103903089 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 103903089
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play103903090(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0
			local var_358_1 = 0.2

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_2 = arg_355_1:FormatText(StoryNameCfg[7].name)

				arg_355_1.leftNameTxt_.text = var_358_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_3 = arg_355_1:GetWordFromCfg(103903089)
				local var_358_4 = arg_355_1:FormatText(var_358_3.content)

				arg_355_1.text_.text = var_358_4

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_5 = 8
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
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_8 = math.max(var_358_1, arg_355_1.talkMaxDuration)

			if var_358_0 <= arg_355_1.time_ and arg_355_1.time_ < var_358_0 + var_358_8 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_0) / var_358_8

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_0 + var_358_8 and arg_355_1.time_ < var_358_0 + var_358_8 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play103903090 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 103903090
		arg_359_1.duration_ = 4.866

		local var_359_0 = {
			ja = 4.866,
			ko = 3.5,
			zh = 3.5,
			en = 4.1
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
				arg_359_0:Play103903091(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1039ui_story"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 and arg_359_1.var_.characterEffect1039ui_story == nil then
				arg_359_1.var_.characterEffect1039ui_story = var_362_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_2 = 0.1

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2

				if arg_359_1.var_.characterEffect1039ui_story then
					arg_359_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 and arg_359_1.var_.characterEffect1039ui_story then
				arg_359_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_362_4 = arg_359_1.actors_["1039ui_story"].transform
			local var_362_5 = 0

			if var_362_5 < arg_359_1.time_ and arg_359_1.time_ <= var_362_5 + arg_362_0 then
				arg_359_1.var_.moveOldPos1039ui_story = var_362_4.localPosition
			end

			local var_362_6 = 0.001

			if var_362_5 <= arg_359_1.time_ and arg_359_1.time_ < var_362_5 + var_362_6 then
				local var_362_7 = (arg_359_1.time_ - var_362_5) / var_362_6
				local var_362_8 = Vector3.New(0, -1.06, -5.3)

				var_362_4.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1039ui_story, var_362_8, var_362_7)

				local var_362_9 = manager.ui.mainCamera.transform.position - var_362_4.position

				var_362_4.forward = Vector3.New(var_362_9.x, var_362_9.y, var_362_9.z)

				local var_362_10 = var_362_4.localEulerAngles

				var_362_10.z = 0
				var_362_10.x = 0
				var_362_4.localEulerAngles = var_362_10
			end

			if arg_359_1.time_ >= var_362_5 + var_362_6 and arg_359_1.time_ < var_362_5 + var_362_6 + arg_362_0 then
				var_362_4.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_362_11 = manager.ui.mainCamera.transform.position - var_362_4.position

				var_362_4.forward = Vector3.New(var_362_11.x, var_362_11.y, var_362_11.z)

				local var_362_12 = var_362_4.localEulerAngles

				var_362_12.z = 0
				var_362_12.x = 0
				var_362_4.localEulerAngles = var_362_12
			end

			local var_362_13 = 0

			if var_362_13 < arg_359_1.time_ and arg_359_1.time_ <= var_362_13 + arg_362_0 then
				arg_359_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action3_1")
			end

			local var_362_14 = 0

			if var_362_14 < arg_359_1.time_ and arg_359_1.time_ <= var_362_14 + arg_362_0 then
				arg_359_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_362_15 = 0
			local var_362_16 = 0.3

			if var_362_15 < arg_359_1.time_ and arg_359_1.time_ <= var_362_15 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_17 = arg_359_1:FormatText(StoryNameCfg[9].name)

				arg_359_1.leftNameTxt_.text = var_362_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_18 = arg_359_1:GetWordFromCfg(103903090)
				local var_362_19 = arg_359_1:FormatText(var_362_18.content)

				arg_359_1.text_.text = var_362_19

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_20 = 12
				local var_362_21 = utf8.len(var_362_19)
				local var_362_22 = var_362_20 <= 0 and var_362_16 or var_362_16 * (var_362_21 / var_362_20)

				if var_362_22 > 0 and var_362_16 < var_362_22 then
					arg_359_1.talkMaxDuration = var_362_22

					if var_362_22 + var_362_15 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_22 + var_362_15
					end
				end

				arg_359_1.text_.text = var_362_19
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903090", "story_v_side_old_103903.awb") ~= 0 then
					local var_362_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903090", "story_v_side_old_103903.awb") / 1000

					if var_362_23 + var_362_15 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_23 + var_362_15
					end

					if var_362_18.prefab_name ~= "" and arg_359_1.actors_[var_362_18.prefab_name] ~= nil then
						local var_362_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_18.prefab_name].transform, "story_v_side_old_103903", "103903090", "story_v_side_old_103903.awb")

						arg_359_1:RecordAudio("103903090", var_362_24)
						arg_359_1:RecordAudio("103903090", var_362_24)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903090", "story_v_side_old_103903.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903090", "story_v_side_old_103903.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_25 = math.max(var_362_16, arg_359_1.talkMaxDuration)

			if var_362_15 <= arg_359_1.time_ and arg_359_1.time_ < var_362_15 + var_362_25 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_15) / var_362_25

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_15 + var_362_25 and arg_359_1.time_ < var_362_15 + var_362_25 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play103903091 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 103903091
		arg_363_1.duration_ = 5

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play103903092(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 0
			local var_366_1 = 0.675

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, false)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_2 = arg_363_1:GetWordFromCfg(103903091)
				local var_366_3 = arg_363_1:FormatText(var_366_2.content)

				arg_363_1.text_.text = var_366_3

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_4 = 27
				local var_366_5 = utf8.len(var_366_3)
				local var_366_6 = var_366_4 <= 0 and var_366_1 or var_366_1 * (var_366_5 / var_366_4)

				if var_366_6 > 0 and var_366_1 < var_366_6 then
					arg_363_1.talkMaxDuration = var_366_6

					if var_366_6 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_6 + var_366_0
					end
				end

				arg_363_1.text_.text = var_366_3
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)
				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_7 = math.max(var_366_1, arg_363_1.talkMaxDuration)

			if var_366_0 <= arg_363_1.time_ and arg_363_1.time_ < var_366_0 + var_366_7 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_0) / var_366_7

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_0 + var_366_7 and arg_363_1.time_ < var_366_0 + var_366_7 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play103903092 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 103903092
		arg_367_1.duration_ = 2.366

		local var_367_0 = {
			ja = 2.366,
			ko = 2.3,
			zh = 2.3,
			en = 1.999999999999
		}
		local var_367_1 = manager.audio:GetLocalizationFlag()

		if var_367_0[var_367_1] ~= nil then
			arg_367_1.duration_ = var_367_0[var_367_1]
		end

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play103903093(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 0

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				arg_367_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action432")
			end

			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_370_2 = 0
			local var_370_3 = 0.1

			if var_370_2 < arg_367_1.time_ and arg_367_1.time_ <= var_370_2 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_4 = arg_367_1:FormatText(StoryNameCfg[9].name)

				arg_367_1.leftNameTxt_.text = var_370_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_5 = arg_367_1:GetWordFromCfg(103903092)
				local var_370_6 = arg_367_1:FormatText(var_370_5.content)

				arg_367_1.text_.text = var_370_6

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_7 = 4
				local var_370_8 = utf8.len(var_370_6)
				local var_370_9 = var_370_7 <= 0 and var_370_3 or var_370_3 * (var_370_8 / var_370_7)

				if var_370_9 > 0 and var_370_3 < var_370_9 then
					arg_367_1.talkMaxDuration = var_370_9

					if var_370_9 + var_370_2 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_9 + var_370_2
					end
				end

				arg_367_1.text_.text = var_370_6
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903092", "story_v_side_old_103903.awb") ~= 0 then
					local var_370_10 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903092", "story_v_side_old_103903.awb") / 1000

					if var_370_10 + var_370_2 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_10 + var_370_2
					end

					if var_370_5.prefab_name ~= "" and arg_367_1.actors_[var_370_5.prefab_name] ~= nil then
						local var_370_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_5.prefab_name].transform, "story_v_side_old_103903", "103903092", "story_v_side_old_103903.awb")

						arg_367_1:RecordAudio("103903092", var_370_11)
						arg_367_1:RecordAudio("103903092", var_370_11)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903092", "story_v_side_old_103903.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903092", "story_v_side_old_103903.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_12 = math.max(var_370_3, arg_367_1.talkMaxDuration)

			if var_370_2 <= arg_367_1.time_ and arg_367_1.time_ < var_370_2 + var_370_12 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_2) / var_370_12

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_2 + var_370_12 and arg_367_1.time_ < var_370_2 + var_370_12 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play103903093 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 103903093
		arg_371_1.duration_ = 5

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play103903094(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = 0
			local var_374_1 = 0.5

			if var_374_0 < arg_371_1.time_ and arg_371_1.time_ <= var_374_0 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, false)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_2 = arg_371_1:GetWordFromCfg(103903093)
				local var_374_3 = arg_371_1:FormatText(var_374_2.content)

				arg_371_1.text_.text = var_374_3

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_4 = 20
				local var_374_5 = utf8.len(var_374_3)
				local var_374_6 = var_374_4 <= 0 and var_374_1 or var_374_1 * (var_374_5 / var_374_4)

				if var_374_6 > 0 and var_374_1 < var_374_6 then
					arg_371_1.talkMaxDuration = var_374_6

					if var_374_6 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_6 + var_374_0
					end
				end

				arg_371_1.text_.text = var_374_3
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)
				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_7 = math.max(var_374_1, arg_371_1.talkMaxDuration)

			if var_374_0 <= arg_371_1.time_ and arg_371_1.time_ < var_374_0 + var_374_7 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_0) / var_374_7

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_0 + var_374_7 and arg_371_1.time_ < var_374_0 + var_374_7 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play103903094 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 103903094
		arg_375_1.duration_ = 2.8

		local var_375_0 = {
			ja = 2.8,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.466
		}
		local var_375_1 = manager.audio:GetLocalizationFlag()

		if var_375_0[var_375_1] ~= nil then
			arg_375_1.duration_ = var_375_0[var_375_1]
		end

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play103903095(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action425")
			end

			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_378_2 = 0
			local var_378_3 = 0.175

			if var_378_2 < arg_375_1.time_ and arg_375_1.time_ <= var_378_2 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_4 = arg_375_1:FormatText(StoryNameCfg[9].name)

				arg_375_1.leftNameTxt_.text = var_378_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_5 = arg_375_1:GetWordFromCfg(103903094)
				local var_378_6 = arg_375_1:FormatText(var_378_5.content)

				arg_375_1.text_.text = var_378_6

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_7 = 7
				local var_378_8 = utf8.len(var_378_6)
				local var_378_9 = var_378_7 <= 0 and var_378_3 or var_378_3 * (var_378_8 / var_378_7)

				if var_378_9 > 0 and var_378_3 < var_378_9 then
					arg_375_1.talkMaxDuration = var_378_9

					if var_378_9 + var_378_2 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_9 + var_378_2
					end
				end

				arg_375_1.text_.text = var_378_6
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903094", "story_v_side_old_103903.awb") ~= 0 then
					local var_378_10 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903094", "story_v_side_old_103903.awb") / 1000

					if var_378_10 + var_378_2 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_10 + var_378_2
					end

					if var_378_5.prefab_name ~= "" and arg_375_1.actors_[var_378_5.prefab_name] ~= nil then
						local var_378_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_5.prefab_name].transform, "story_v_side_old_103903", "103903094", "story_v_side_old_103903.awb")

						arg_375_1:RecordAudio("103903094", var_378_11)
						arg_375_1:RecordAudio("103903094", var_378_11)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903094", "story_v_side_old_103903.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903094", "story_v_side_old_103903.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_12 = math.max(var_378_3, arg_375_1.talkMaxDuration)

			if var_378_2 <= arg_375_1.time_ and arg_375_1.time_ < var_378_2 + var_378_12 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_2) / var_378_12

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_2 + var_378_12 and arg_375_1.time_ < var_378_2 + var_378_12 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play103903095 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 103903095
		arg_379_1.duration_ = 5

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play103903096(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1039ui_story"]
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 and arg_379_1.var_.characterEffect1039ui_story == nil then
				arg_379_1.var_.characterEffect1039ui_story = var_382_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_2 = 0.1

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2

				if arg_379_1.var_.characterEffect1039ui_story then
					local var_382_4 = Mathf.Lerp(0, 0.5, var_382_3)

					arg_379_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_379_1.var_.characterEffect1039ui_story.fillRatio = var_382_4
				end
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 and arg_379_1.var_.characterEffect1039ui_story then
				local var_382_5 = 0.5

				arg_379_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_379_1.var_.characterEffect1039ui_story.fillRatio = var_382_5
			end

			local var_382_6 = 0
			local var_382_7 = 0.725

			if var_382_6 < arg_379_1.time_ and arg_379_1.time_ <= var_382_6 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, false)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_8 = arg_379_1:GetWordFromCfg(103903095)
				local var_382_9 = arg_379_1:FormatText(var_382_8.content)

				arg_379_1.text_.text = var_382_9

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_10 = 29
				local var_382_11 = utf8.len(var_382_9)
				local var_382_12 = var_382_10 <= 0 and var_382_7 or var_382_7 * (var_382_11 / var_382_10)

				if var_382_12 > 0 and var_382_7 < var_382_12 then
					arg_379_1.talkMaxDuration = var_382_12

					if var_382_12 + var_382_6 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_12 + var_382_6
					end
				end

				arg_379_1.text_.text = var_382_9
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)
				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_13 = math.max(var_382_7, arg_379_1.talkMaxDuration)

			if var_382_6 <= arg_379_1.time_ and arg_379_1.time_ < var_382_6 + var_382_13 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_6) / var_382_13

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_6 + var_382_13 and arg_379_1.time_ < var_382_6 + var_382_13 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play103903096 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 103903096
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play103903097(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0
			local var_386_1 = 0.475

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, false)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_2 = arg_383_1:GetWordFromCfg(103903096)
				local var_386_3 = arg_383_1:FormatText(var_386_2.content)

				arg_383_1.text_.text = var_386_3

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_4 = 19
				local var_386_5 = utf8.len(var_386_3)
				local var_386_6 = var_386_4 <= 0 and var_386_1 or var_386_1 * (var_386_5 / var_386_4)

				if var_386_6 > 0 and var_386_1 < var_386_6 then
					arg_383_1.talkMaxDuration = var_386_6

					if var_386_6 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_6 + var_386_0
					end
				end

				arg_383_1.text_.text = var_386_3
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_7 = math.max(var_386_1, arg_383_1.talkMaxDuration)

			if var_386_0 <= arg_383_1.time_ and arg_383_1.time_ < var_386_0 + var_386_7 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_0) / var_386_7

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_0 + var_386_7 and arg_383_1.time_ < var_386_0 + var_386_7 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play103903097 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 103903097
		arg_387_1.duration_ = 4.6

		local var_387_0 = {
			ja = 4.6,
			ko = 2.5,
			zh = 2.5,
			en = 2.066
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
				arg_387_0:Play103903098(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["1027ui_story"]
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 and arg_387_1.var_.characterEffect1027ui_story == nil then
				arg_387_1.var_.characterEffect1027ui_story = var_390_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_2 = 0.1

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_2 then
				local var_390_3 = (arg_387_1.time_ - var_390_1) / var_390_2

				if arg_387_1.var_.characterEffect1027ui_story then
					arg_387_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_387_1.time_ >= var_390_1 + var_390_2 and arg_387_1.time_ < var_390_1 + var_390_2 + arg_390_0 and arg_387_1.var_.characterEffect1027ui_story then
				arg_387_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_390_4 = arg_387_1.actors_["1039ui_story"].transform
			local var_390_5 = 0

			if var_390_5 < arg_387_1.time_ and arg_387_1.time_ <= var_390_5 + arg_390_0 then
				arg_387_1.var_.moveOldPos1039ui_story = var_390_4.localPosition
			end

			local var_390_6 = 0.001

			if var_390_5 <= arg_387_1.time_ and arg_387_1.time_ < var_390_5 + var_390_6 then
				local var_390_7 = (arg_387_1.time_ - var_390_5) / var_390_6
				local var_390_8 = Vector3.New(10, -1.06, -5.3)

				var_390_4.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos1039ui_story, var_390_8, var_390_7)

				local var_390_9 = manager.ui.mainCamera.transform.position - var_390_4.position

				var_390_4.forward = Vector3.New(var_390_9.x, var_390_9.y, var_390_9.z)

				local var_390_10 = var_390_4.localEulerAngles

				var_390_10.z = 0
				var_390_10.x = 0
				var_390_4.localEulerAngles = var_390_10
			end

			if arg_387_1.time_ >= var_390_5 + var_390_6 and arg_387_1.time_ < var_390_5 + var_390_6 + arg_390_0 then
				var_390_4.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_390_11 = manager.ui.mainCamera.transform.position - var_390_4.position

				var_390_4.forward = Vector3.New(var_390_11.x, var_390_11.y, var_390_11.z)

				local var_390_12 = var_390_4.localEulerAngles

				var_390_12.z = 0
				var_390_12.x = 0
				var_390_4.localEulerAngles = var_390_12
			end

			local var_390_13 = arg_387_1.actors_["1027ui_story"].transform
			local var_390_14 = 0

			if var_390_14 < arg_387_1.time_ and arg_387_1.time_ <= var_390_14 + arg_390_0 then
				arg_387_1.var_.moveOldPos1027ui_story = var_390_13.localPosition
			end

			local var_390_15 = 0.001

			if var_390_14 <= arg_387_1.time_ and arg_387_1.time_ < var_390_14 + var_390_15 then
				local var_390_16 = (arg_387_1.time_ - var_390_14) / var_390_15
				local var_390_17 = Vector3.New(0, -0.922, -5.1)

				var_390_13.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos1027ui_story, var_390_17, var_390_16)

				local var_390_18 = manager.ui.mainCamera.transform.position - var_390_13.position

				var_390_13.forward = Vector3.New(var_390_18.x, var_390_18.y, var_390_18.z)

				local var_390_19 = var_390_13.localEulerAngles

				var_390_19.z = 0
				var_390_19.x = 0
				var_390_13.localEulerAngles = var_390_19
			end

			if arg_387_1.time_ >= var_390_14 + var_390_15 and arg_387_1.time_ < var_390_14 + var_390_15 + arg_390_0 then
				var_390_13.localPosition = Vector3.New(0, -0.922, -5.1)

				local var_390_20 = manager.ui.mainCamera.transform.position - var_390_13.position

				var_390_13.forward = Vector3.New(var_390_20.x, var_390_20.y, var_390_20.z)

				local var_390_21 = var_390_13.localEulerAngles

				var_390_21.z = 0
				var_390_21.x = 0
				var_390_13.localEulerAngles = var_390_21
			end

			local var_390_22 = 0

			if var_390_22 < arg_387_1.time_ and arg_387_1.time_ <= var_390_22 + arg_390_0 then
				arg_387_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_390_23 = 0

			if var_390_23 < arg_387_1.time_ and arg_387_1.time_ <= var_390_23 + arg_390_0 then
				arg_387_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_390_24 = 0
			local var_390_25 = 0.1

			if var_390_24 < arg_387_1.time_ and arg_387_1.time_ <= var_390_24 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_26 = arg_387_1:FormatText(StoryNameCfg[56].name)

				arg_387_1.leftNameTxt_.text = var_390_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_27 = arg_387_1:GetWordFromCfg(103903097)
				local var_390_28 = arg_387_1:FormatText(var_390_27.content)

				arg_387_1.text_.text = var_390_28

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_29 = 4
				local var_390_30 = utf8.len(var_390_28)
				local var_390_31 = var_390_29 <= 0 and var_390_25 or var_390_25 * (var_390_30 / var_390_29)

				if var_390_31 > 0 and var_390_25 < var_390_31 then
					arg_387_1.talkMaxDuration = var_390_31

					if var_390_31 + var_390_24 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_31 + var_390_24
					end
				end

				arg_387_1.text_.text = var_390_28
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903097", "story_v_side_old_103903.awb") ~= 0 then
					local var_390_32 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903097", "story_v_side_old_103903.awb") / 1000

					if var_390_32 + var_390_24 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_32 + var_390_24
					end

					if var_390_27.prefab_name ~= "" and arg_387_1.actors_[var_390_27.prefab_name] ~= nil then
						local var_390_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_27.prefab_name].transform, "story_v_side_old_103903", "103903097", "story_v_side_old_103903.awb")

						arg_387_1:RecordAudio("103903097", var_390_33)
						arg_387_1:RecordAudio("103903097", var_390_33)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903097", "story_v_side_old_103903.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903097", "story_v_side_old_103903.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_34 = math.max(var_390_25, arg_387_1.talkMaxDuration)

			if var_390_24 <= arg_387_1.time_ and arg_387_1.time_ < var_390_24 + var_390_34 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_24) / var_390_34

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_24 + var_390_34 and arg_387_1.time_ < var_390_24 + var_390_34 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play103903098 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 103903098
		arg_391_1.duration_ = 6.916666666665

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play103903099(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = 0
			local var_394_1 = 1

			if var_394_0 < arg_391_1.time_ and arg_391_1.time_ <= var_394_0 + arg_394_0 then
				local var_394_2 = "play"
				local var_394_3 = "music"

				arg_391_1:AudioAction(var_394_2, var_394_3, "ui_battle", "ui_battle_resumebgm", "")
			end

			local var_394_4 = 0

			if var_394_4 < arg_391_1.time_ and arg_391_1.time_ <= var_394_4 + arg_394_0 then
				arg_391_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action427")
			end

			local var_394_5 = 0
			local var_394_6 = 0.975

			if var_394_5 < arg_391_1.time_ and arg_391_1.time_ <= var_394_5 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, false)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_7 = arg_391_1:GetWordFromCfg(103903098)
				local var_394_8 = arg_391_1:FormatText(var_394_7.content)

				arg_391_1.text_.text = var_394_8

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_9 = 39
				local var_394_10 = utf8.len(var_394_8)
				local var_394_11 = var_394_9 <= 0 and var_394_6 or var_394_6 * (var_394_10 / var_394_9)

				if var_394_11 > 0 and var_394_6 < var_394_11 then
					arg_391_1.talkMaxDuration = var_394_11

					if var_394_11 + var_394_5 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_11 + var_394_5
					end
				end

				arg_391_1.text_.text = var_394_8
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_12 = math.max(var_394_6, arg_391_1.talkMaxDuration)

			if var_394_5 <= arg_391_1.time_ and arg_391_1.time_ < var_394_5 + var_394_12 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_5) / var_394_12

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_5 + var_394_12 and arg_391_1.time_ < var_394_5 + var_394_12 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play103903099 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 103903099
		arg_395_1.duration_ = 5

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play103903100(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1027ui_story"]
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 and arg_395_1.var_.characterEffect1027ui_story == nil then
				arg_395_1.var_.characterEffect1027ui_story = var_398_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_2 = 0.1

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2

				if arg_395_1.var_.characterEffect1027ui_story then
					local var_398_4 = Mathf.Lerp(0, 0.5, var_398_3)

					arg_395_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1027ui_story.fillRatio = var_398_4
				end
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 and arg_395_1.var_.characterEffect1027ui_story then
				local var_398_5 = 0.5

				arg_395_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1027ui_story.fillRatio = var_398_5
			end

			local var_398_6 = arg_395_1.actors_["1027ui_story"].transform
			local var_398_7 = 0

			if var_398_7 < arg_395_1.time_ and arg_395_1.time_ <= var_398_7 + arg_398_0 then
				arg_395_1.var_.moveOldPos1027ui_story = var_398_6.localPosition
			end

			local var_398_8 = 0.001

			if var_398_7 <= arg_395_1.time_ and arg_395_1.time_ < var_398_7 + var_398_8 then
				local var_398_9 = (arg_395_1.time_ - var_398_7) / var_398_8
				local var_398_10 = Vector3.New(10, -0.922, -5.1)

				var_398_6.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1027ui_story, var_398_10, var_398_9)

				local var_398_11 = manager.ui.mainCamera.transform.position - var_398_6.position

				var_398_6.forward = Vector3.New(var_398_11.x, var_398_11.y, var_398_11.z)

				local var_398_12 = var_398_6.localEulerAngles

				var_398_12.z = 0
				var_398_12.x = 0
				var_398_6.localEulerAngles = var_398_12
			end

			if arg_395_1.time_ >= var_398_7 + var_398_8 and arg_395_1.time_ < var_398_7 + var_398_8 + arg_398_0 then
				var_398_6.localPosition = Vector3.New(10, -0.922, -5.1)

				local var_398_13 = manager.ui.mainCamera.transform.position - var_398_6.position

				var_398_6.forward = Vector3.New(var_398_13.x, var_398_13.y, var_398_13.z)

				local var_398_14 = var_398_6.localEulerAngles

				var_398_14.z = 0
				var_398_14.x = 0
				var_398_6.localEulerAngles = var_398_14
			end

			local var_398_15 = 0
			local var_398_16 = 0.825

			if var_398_15 < arg_395_1.time_ and arg_395_1.time_ <= var_398_15 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, false)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_17 = arg_395_1:GetWordFromCfg(103903099)
				local var_398_18 = arg_395_1:FormatText(var_398_17.content)

				arg_395_1.text_.text = var_398_18

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_19 = 33
				local var_398_20 = utf8.len(var_398_18)
				local var_398_21 = var_398_19 <= 0 and var_398_16 or var_398_16 * (var_398_20 / var_398_19)

				if var_398_21 > 0 and var_398_16 < var_398_21 then
					arg_395_1.talkMaxDuration = var_398_21

					if var_398_21 + var_398_15 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_21 + var_398_15
					end
				end

				arg_395_1.text_.text = var_398_18
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_22 = math.max(var_398_16, arg_395_1.talkMaxDuration)

			if var_398_15 <= arg_395_1.time_ and arg_395_1.time_ < var_398_15 + var_398_22 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_15) / var_398_22

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_15 + var_398_22 and arg_395_1.time_ < var_398_15 + var_398_22 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play103903100 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 103903100
		arg_399_1.duration_ = 6.233

		local var_399_0 = {
			ja = 6.233,
			ko = 4.6,
			zh = 4.6,
			en = 6
		}
		local var_399_1 = manager.audio:GetLocalizationFlag()

		if var_399_0[var_399_1] ~= nil then
			arg_399_1.duration_ = var_399_0[var_399_1]
		end

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play103903101(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1039ui_story"]
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 and arg_399_1.var_.characterEffect1039ui_story == nil then
				arg_399_1.var_.characterEffect1039ui_story = var_402_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_2 = 0.1

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2

				if arg_399_1.var_.characterEffect1039ui_story then
					arg_399_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 and arg_399_1.var_.characterEffect1039ui_story then
				arg_399_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_402_4 = arg_399_1.actors_["1039ui_story"].transform
			local var_402_5 = 0

			if var_402_5 < arg_399_1.time_ and arg_399_1.time_ <= var_402_5 + arg_402_0 then
				arg_399_1.var_.moveOldPos1039ui_story = var_402_4.localPosition
			end

			local var_402_6 = 0.001

			if var_402_5 <= arg_399_1.time_ and arg_399_1.time_ < var_402_5 + var_402_6 then
				local var_402_7 = (arg_399_1.time_ - var_402_5) / var_402_6
				local var_402_8 = Vector3.New(0, -1.06, -5.3)

				var_402_4.localPosition = Vector3.Lerp(arg_399_1.var_.moveOldPos1039ui_story, var_402_8, var_402_7)

				local var_402_9 = manager.ui.mainCamera.transform.position - var_402_4.position

				var_402_4.forward = Vector3.New(var_402_9.x, var_402_9.y, var_402_9.z)

				local var_402_10 = var_402_4.localEulerAngles

				var_402_10.z = 0
				var_402_10.x = 0
				var_402_4.localEulerAngles = var_402_10
			end

			if arg_399_1.time_ >= var_402_5 + var_402_6 and arg_399_1.time_ < var_402_5 + var_402_6 + arg_402_0 then
				var_402_4.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_402_11 = manager.ui.mainCamera.transform.position - var_402_4.position

				var_402_4.forward = Vector3.New(var_402_11.x, var_402_11.y, var_402_11.z)

				local var_402_12 = var_402_4.localEulerAngles

				var_402_12.z = 0
				var_402_12.x = 0
				var_402_4.localEulerAngles = var_402_12
			end

			local var_402_13 = 0

			if var_402_13 < arg_399_1.time_ and arg_399_1.time_ <= var_402_13 + arg_402_0 then
				arg_399_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_402_14 = 0

			if var_402_14 < arg_399_1.time_ and arg_399_1.time_ <= var_402_14 + arg_402_0 then
				arg_399_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_402_15 = 0
			local var_402_16 = 0.55

			if var_402_15 < arg_399_1.time_ and arg_399_1.time_ <= var_402_15 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_17 = arg_399_1:FormatText(StoryNameCfg[9].name)

				arg_399_1.leftNameTxt_.text = var_402_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_18 = arg_399_1:GetWordFromCfg(103903100)
				local var_402_19 = arg_399_1:FormatText(var_402_18.content)

				arg_399_1.text_.text = var_402_19

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_20 = 22
				local var_402_21 = utf8.len(var_402_19)
				local var_402_22 = var_402_20 <= 0 and var_402_16 or var_402_16 * (var_402_21 / var_402_20)

				if var_402_22 > 0 and var_402_16 < var_402_22 then
					arg_399_1.talkMaxDuration = var_402_22

					if var_402_22 + var_402_15 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_22 + var_402_15
					end
				end

				arg_399_1.text_.text = var_402_19
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903100", "story_v_side_old_103903.awb") ~= 0 then
					local var_402_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903100", "story_v_side_old_103903.awb") / 1000

					if var_402_23 + var_402_15 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_23 + var_402_15
					end

					if var_402_18.prefab_name ~= "" and arg_399_1.actors_[var_402_18.prefab_name] ~= nil then
						local var_402_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_18.prefab_name].transform, "story_v_side_old_103903", "103903100", "story_v_side_old_103903.awb")

						arg_399_1:RecordAudio("103903100", var_402_24)
						arg_399_1:RecordAudio("103903100", var_402_24)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903100", "story_v_side_old_103903.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903100", "story_v_side_old_103903.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_25 = math.max(var_402_16, arg_399_1.talkMaxDuration)

			if var_402_15 <= arg_399_1.time_ and arg_399_1.time_ < var_402_15 + var_402_25 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_15) / var_402_25

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_15 + var_402_25 and arg_399_1.time_ < var_402_15 + var_402_25 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play103903101 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 103903101
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play103903102(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1039ui_story"]
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 and arg_403_1.var_.characterEffect1039ui_story == nil then
				arg_403_1.var_.characterEffect1039ui_story = var_406_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_2 = 0.1

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2

				if arg_403_1.var_.characterEffect1039ui_story then
					local var_406_4 = Mathf.Lerp(0, 0.5, var_406_3)

					arg_403_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1039ui_story.fillRatio = var_406_4
				end
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 and arg_403_1.var_.characterEffect1039ui_story then
				local var_406_5 = 0.5

				arg_403_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1039ui_story.fillRatio = var_406_5
			end

			local var_406_6 = 0
			local var_406_7 = 0.3

			if var_406_6 < arg_403_1.time_ and arg_403_1.time_ <= var_406_6 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_8 = arg_403_1:FormatText(StoryNameCfg[7].name)

				arg_403_1.leftNameTxt_.text = var_406_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_9 = arg_403_1:GetWordFromCfg(103903101)
				local var_406_10 = arg_403_1:FormatText(var_406_9.content)

				arg_403_1.text_.text = var_406_10

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_11 = 12
				local var_406_12 = utf8.len(var_406_10)
				local var_406_13 = var_406_11 <= 0 and var_406_7 or var_406_7 * (var_406_12 / var_406_11)

				if var_406_13 > 0 and var_406_7 < var_406_13 then
					arg_403_1.talkMaxDuration = var_406_13

					if var_406_13 + var_406_6 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_13 + var_406_6
					end
				end

				arg_403_1.text_.text = var_406_10
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_14 = math.max(var_406_7, arg_403_1.talkMaxDuration)

			if var_406_6 <= arg_403_1.time_ and arg_403_1.time_ < var_406_6 + var_406_14 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_6) / var_406_14

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_6 + var_406_14 and arg_403_1.time_ < var_406_6 + var_406_14 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play103903102 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 103903102
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play103903103(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1039ui_story"].transform
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 then
				arg_407_1.var_.moveOldPos1039ui_story = var_410_0.localPosition
			end

			local var_410_2 = 0.001

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2
				local var_410_4 = Vector3.New(10, -1.06, -5.3)

				var_410_0.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos1039ui_story, var_410_4, var_410_3)

				local var_410_5 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_5.x, var_410_5.y, var_410_5.z)

				local var_410_6 = var_410_0.localEulerAngles

				var_410_6.z = 0
				var_410_6.x = 0
				var_410_0.localEulerAngles = var_410_6
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 then
				var_410_0.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_410_7 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_7.x, var_410_7.y, var_410_7.z)

				local var_410_8 = var_410_0.localEulerAngles

				var_410_8.z = 0
				var_410_8.x = 0
				var_410_0.localEulerAngles = var_410_8
			end

			local var_410_9 = 0
			local var_410_10 = 0.425

			if var_410_9 < arg_407_1.time_ and arg_407_1.time_ <= var_410_9 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, false)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_11 = arg_407_1:GetWordFromCfg(103903102)
				local var_410_12 = arg_407_1:FormatText(var_410_11.content)

				arg_407_1.text_.text = var_410_12

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_13 = 17
				local var_410_14 = utf8.len(var_410_12)
				local var_410_15 = var_410_13 <= 0 and var_410_10 or var_410_10 * (var_410_14 / var_410_13)

				if var_410_15 > 0 and var_410_10 < var_410_15 then
					arg_407_1.talkMaxDuration = var_410_15

					if var_410_15 + var_410_9 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_15 + var_410_9
					end
				end

				arg_407_1.text_.text = var_410_12
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)
				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_16 = math.max(var_410_10, arg_407_1.talkMaxDuration)

			if var_410_9 <= arg_407_1.time_ and arg_407_1.time_ < var_410_9 + var_410_16 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_9) / var_410_16

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_9 + var_410_16 and arg_407_1.time_ < var_410_9 + var_410_16 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play103903103 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 103903103
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play103903104(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 0.1

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_2 = arg_411_1:FormatText(StoryNameCfg[7].name)

				arg_411_1.leftNameTxt_.text = var_414_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_3 = arg_411_1:GetWordFromCfg(103903103)
				local var_414_4 = arg_411_1:FormatText(var_414_3.content)

				arg_411_1.text_.text = var_414_4

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_5 = 4
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
				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_8 = math.max(var_414_1, arg_411_1.talkMaxDuration)

			if var_414_0 <= arg_411_1.time_ and arg_411_1.time_ < var_414_0 + var_414_8 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_0) / var_414_8

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_0 + var_414_8 and arg_411_1.time_ < var_414_0 + var_414_8 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play103903104 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 103903104
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play103903105(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = 0
			local var_418_1 = 0.425

			if var_418_0 < arg_415_1.time_ and arg_415_1.time_ <= var_418_0 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, false)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_2 = arg_415_1:GetWordFromCfg(103903104)
				local var_418_3 = arg_415_1:FormatText(var_418_2.content)

				arg_415_1.text_.text = var_418_3

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_4 = 17
				local var_418_5 = utf8.len(var_418_3)
				local var_418_6 = var_418_4 <= 0 and var_418_1 or var_418_1 * (var_418_5 / var_418_4)

				if var_418_6 > 0 and var_418_1 < var_418_6 then
					arg_415_1.talkMaxDuration = var_418_6

					if var_418_6 + var_418_0 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_6 + var_418_0
					end
				end

				arg_415_1.text_.text = var_418_3
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_7 = math.max(var_418_1, arg_415_1.talkMaxDuration)

			if var_418_0 <= arg_415_1.time_ and arg_415_1.time_ < var_418_0 + var_418_7 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_0) / var_418_7

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_0 + var_418_7 and arg_415_1.time_ < var_418_0 + var_418_7 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play103903105 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 103903105
		arg_419_1.duration_ = 2.3

		local var_419_0 = {
			ja = 2.3,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_419_1 = manager.audio:GetLocalizationFlag()

		if var_419_0[var_419_1] ~= nil then
			arg_419_1.duration_ = var_419_0[var_419_1]
		end

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play103903106(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1039ui_story"]
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 and arg_419_1.var_.characterEffect1039ui_story == nil then
				arg_419_1.var_.characterEffect1039ui_story = var_422_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_2 = 0.1

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2

				if arg_419_1.var_.characterEffect1039ui_story then
					arg_419_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 and arg_419_1.var_.characterEffect1039ui_story then
				arg_419_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_422_4 = arg_419_1.actors_["1039ui_story"].transform
			local var_422_5 = 0

			if var_422_5 < arg_419_1.time_ and arg_419_1.time_ <= var_422_5 + arg_422_0 then
				arg_419_1.var_.moveOldPos1039ui_story = var_422_4.localPosition
			end

			local var_422_6 = 0.001

			if var_422_5 <= arg_419_1.time_ and arg_419_1.time_ < var_422_5 + var_422_6 then
				local var_422_7 = (arg_419_1.time_ - var_422_5) / var_422_6
				local var_422_8 = Vector3.New(0, -1.06, -5.3)

				var_422_4.localPosition = Vector3.Lerp(arg_419_1.var_.moveOldPos1039ui_story, var_422_8, var_422_7)

				local var_422_9 = manager.ui.mainCamera.transform.position - var_422_4.position

				var_422_4.forward = Vector3.New(var_422_9.x, var_422_9.y, var_422_9.z)

				local var_422_10 = var_422_4.localEulerAngles

				var_422_10.z = 0
				var_422_10.x = 0
				var_422_4.localEulerAngles = var_422_10
			end

			if arg_419_1.time_ >= var_422_5 + var_422_6 and arg_419_1.time_ < var_422_5 + var_422_6 + arg_422_0 then
				var_422_4.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_422_11 = manager.ui.mainCamera.transform.position - var_422_4.position

				var_422_4.forward = Vector3.New(var_422_11.x, var_422_11.y, var_422_11.z)

				local var_422_12 = var_422_4.localEulerAngles

				var_422_12.z = 0
				var_422_12.x = 0
				var_422_4.localEulerAngles = var_422_12
			end

			local var_422_13 = 0

			if var_422_13 < arg_419_1.time_ and arg_419_1.time_ <= var_422_13 + arg_422_0 then
				arg_419_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_422_14 = 0

			if var_422_14 < arg_419_1.time_ and arg_419_1.time_ <= var_422_14 + arg_422_0 then
				arg_419_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_422_15 = 0
			local var_422_16 = 0.1

			if var_422_15 < arg_419_1.time_ and arg_419_1.time_ <= var_422_15 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_17 = arg_419_1:FormatText(StoryNameCfg[9].name)

				arg_419_1.leftNameTxt_.text = var_422_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_18 = arg_419_1:GetWordFromCfg(103903105)
				local var_422_19 = arg_419_1:FormatText(var_422_18.content)

				arg_419_1.text_.text = var_422_19

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_20 = 4
				local var_422_21 = utf8.len(var_422_19)
				local var_422_22 = var_422_20 <= 0 and var_422_16 or var_422_16 * (var_422_21 / var_422_20)

				if var_422_22 > 0 and var_422_16 < var_422_22 then
					arg_419_1.talkMaxDuration = var_422_22

					if var_422_22 + var_422_15 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_22 + var_422_15
					end
				end

				arg_419_1.text_.text = var_422_19
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903105", "story_v_side_old_103903.awb") ~= 0 then
					local var_422_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903105", "story_v_side_old_103903.awb") / 1000

					if var_422_23 + var_422_15 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_23 + var_422_15
					end

					if var_422_18.prefab_name ~= "" and arg_419_1.actors_[var_422_18.prefab_name] ~= nil then
						local var_422_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_18.prefab_name].transform, "story_v_side_old_103903", "103903105", "story_v_side_old_103903.awb")

						arg_419_1:RecordAudio("103903105", var_422_24)
						arg_419_1:RecordAudio("103903105", var_422_24)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903105", "story_v_side_old_103903.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903105", "story_v_side_old_103903.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_25 = math.max(var_422_16, arg_419_1.talkMaxDuration)

			if var_422_15 <= arg_419_1.time_ and arg_419_1.time_ < var_422_15 + var_422_25 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_15) / var_422_25

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_15 + var_422_25 and arg_419_1.time_ < var_422_15 + var_422_25 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play103903106 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 103903106
		arg_423_1.duration_ = 5

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play103903107(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0
			local var_426_1 = 0.8

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

				local var_426_2 = arg_423_1:GetWordFromCfg(103903106)
				local var_426_3 = arg_423_1:FormatText(var_426_2.content)

				arg_423_1.text_.text = var_426_3

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_4 = 31
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
	Play103903107 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 103903107
		arg_427_1.duration_ = 5

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play103903108(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 0.3

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

				local var_430_2 = arg_427_1:GetWordFromCfg(103903107)
				local var_430_3 = arg_427_1:FormatText(var_430_2.content)

				arg_427_1.text_.text = var_430_3

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_4 = 12
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
	Play103903108 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 103903108
		arg_431_1.duration_ = 5

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play103903109(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1039ui_story"]
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 and arg_431_1.var_.characterEffect1039ui_story == nil then
				arg_431_1.var_.characterEffect1039ui_story = var_434_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_2 = 0.1

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2

				if arg_431_1.var_.characterEffect1039ui_story then
					local var_434_4 = Mathf.Lerp(0, 0.5, var_434_3)

					arg_431_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_431_1.var_.characterEffect1039ui_story.fillRatio = var_434_4
				end
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 and arg_431_1.var_.characterEffect1039ui_story then
				local var_434_5 = 0.5

				arg_431_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_431_1.var_.characterEffect1039ui_story.fillRatio = var_434_5
			end

			local var_434_6 = 0
			local var_434_7 = 0.4

			if var_434_6 < arg_431_1.time_ and arg_431_1.time_ <= var_434_6 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_8 = arg_431_1:FormatText(StoryNameCfg[7].name)

				arg_431_1.leftNameTxt_.text = var_434_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_9 = arg_431_1:GetWordFromCfg(103903108)
				local var_434_10 = arg_431_1:FormatText(var_434_9.content)

				arg_431_1.text_.text = var_434_10

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_11 = 16
				local var_434_12 = utf8.len(var_434_10)
				local var_434_13 = var_434_11 <= 0 and var_434_7 or var_434_7 * (var_434_12 / var_434_11)

				if var_434_13 > 0 and var_434_7 < var_434_13 then
					arg_431_1.talkMaxDuration = var_434_13

					if var_434_13 + var_434_6 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_13 + var_434_6
					end
				end

				arg_431_1.text_.text = var_434_10
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_14 = math.max(var_434_7, arg_431_1.talkMaxDuration)

			if var_434_6 <= arg_431_1.time_ and arg_431_1.time_ < var_434_6 + var_434_14 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_6) / var_434_14

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_6 + var_434_14 and arg_431_1.time_ < var_434_6 + var_434_14 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play103903109 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 103903109
		arg_435_1.duration_ = 1.933

		local var_435_0 = {
			ja = 1.8,
			ko = 1.133,
			zh = 1.133,
			en = 1.933
		}
		local var_435_1 = manager.audio:GetLocalizationFlag()

		if var_435_0[var_435_1] ~= nil then
			arg_435_1.duration_ = var_435_0[var_435_1]
		end

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play103903110(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 1

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				local var_438_2 = "play"
				local var_438_3 = "music"

				arg_435_1:AudioAction(var_438_2, var_438_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_438_4 = arg_435_1.actors_["1039ui_story"]
			local var_438_5 = 0

			if var_438_5 < arg_435_1.time_ and arg_435_1.time_ <= var_438_5 + arg_438_0 and arg_435_1.var_.characterEffect1039ui_story == nil then
				arg_435_1.var_.characterEffect1039ui_story = var_438_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_6 = 0.1

			if var_438_5 <= arg_435_1.time_ and arg_435_1.time_ < var_438_5 + var_438_6 then
				local var_438_7 = (arg_435_1.time_ - var_438_5) / var_438_6

				if arg_435_1.var_.characterEffect1039ui_story then
					arg_435_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_435_1.time_ >= var_438_5 + var_438_6 and arg_435_1.time_ < var_438_5 + var_438_6 + arg_438_0 and arg_435_1.var_.characterEffect1039ui_story then
				arg_435_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_438_8 = 0

			if var_438_8 < arg_435_1.time_ and arg_435_1.time_ <= var_438_8 + arg_438_0 then
				arg_435_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_438_9 = 0
			local var_438_10 = 0.05

			if var_438_9 < arg_435_1.time_ and arg_435_1.time_ <= var_438_9 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_11 = arg_435_1:FormatText(StoryNameCfg[9].name)

				arg_435_1.leftNameTxt_.text = var_438_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_12 = arg_435_1:GetWordFromCfg(103903109)
				local var_438_13 = arg_435_1:FormatText(var_438_12.content)

				arg_435_1.text_.text = var_438_13

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_14 = 2
				local var_438_15 = utf8.len(var_438_13)
				local var_438_16 = var_438_14 <= 0 and var_438_10 or var_438_10 * (var_438_15 / var_438_14)

				if var_438_16 > 0 and var_438_10 < var_438_16 then
					arg_435_1.talkMaxDuration = var_438_16

					if var_438_16 + var_438_9 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_16 + var_438_9
					end
				end

				arg_435_1.text_.text = var_438_13
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903109", "story_v_side_old_103903.awb") ~= 0 then
					local var_438_17 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903109", "story_v_side_old_103903.awb") / 1000

					if var_438_17 + var_438_9 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_17 + var_438_9
					end

					if var_438_12.prefab_name ~= "" and arg_435_1.actors_[var_438_12.prefab_name] ~= nil then
						local var_438_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_12.prefab_name].transform, "story_v_side_old_103903", "103903109", "story_v_side_old_103903.awb")

						arg_435_1:RecordAudio("103903109", var_438_18)
						arg_435_1:RecordAudio("103903109", var_438_18)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903109", "story_v_side_old_103903.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903109", "story_v_side_old_103903.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_19 = math.max(var_438_10, arg_435_1.talkMaxDuration)

			if var_438_9 <= arg_435_1.time_ and arg_435_1.time_ < var_438_9 + var_438_19 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_9) / var_438_19

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_9 + var_438_19 and arg_435_1.time_ < var_438_9 + var_438_19 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play103903110 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 103903110
		arg_439_1.duration_ = 2.633

		local var_439_0 = {
			ja = 2.333,
			ko = 2.633,
			zh = 2.633,
			en = 2.466
		}
		local var_439_1 = manager.audio:GetLocalizationFlag()

		if var_439_0[var_439_1] ~= nil then
			arg_439_1.duration_ = var_439_0[var_439_1]
		end

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play103903111(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 1

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				local var_442_2 = "play"
				local var_442_3 = "music"

				arg_439_1:AudioAction(var_442_2, var_442_3, "bgm_story_mood_warm", "bgm_story_mood_warm", "bgm_story_mood_warm")
			end

			local var_442_4 = 0

			if var_442_4 < arg_439_1.time_ and arg_439_1.time_ <= var_442_4 + arg_442_0 then
				arg_439_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action426")
			end

			local var_442_5 = 0

			if var_442_5 < arg_439_1.time_ and arg_439_1.time_ <= var_442_5 + arg_442_0 then
				arg_439_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_442_6 = 0
			local var_442_7 = 0.2

			if var_442_6 < arg_439_1.time_ and arg_439_1.time_ <= var_442_6 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_8 = arg_439_1:FormatText(StoryNameCfg[9].name)

				arg_439_1.leftNameTxt_.text = var_442_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_9 = arg_439_1:GetWordFromCfg(103903110)
				local var_442_10 = arg_439_1:FormatText(var_442_9.content)

				arg_439_1.text_.text = var_442_10

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_11 = 8
				local var_442_12 = utf8.len(var_442_10)
				local var_442_13 = var_442_11 <= 0 and var_442_7 or var_442_7 * (var_442_12 / var_442_11)

				if var_442_13 > 0 and var_442_7 < var_442_13 then
					arg_439_1.talkMaxDuration = var_442_13

					if var_442_13 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_13 + var_442_6
					end
				end

				arg_439_1.text_.text = var_442_10
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903110", "story_v_side_old_103903.awb") ~= 0 then
					local var_442_14 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903110", "story_v_side_old_103903.awb") / 1000

					if var_442_14 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_14 + var_442_6
					end

					if var_442_9.prefab_name ~= "" and arg_439_1.actors_[var_442_9.prefab_name] ~= nil then
						local var_442_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_9.prefab_name].transform, "story_v_side_old_103903", "103903110", "story_v_side_old_103903.awb")

						arg_439_1:RecordAudio("103903110", var_442_15)
						arg_439_1:RecordAudio("103903110", var_442_15)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903110", "story_v_side_old_103903.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903110", "story_v_side_old_103903.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_16 = math.max(var_442_7, arg_439_1.talkMaxDuration)

			if var_442_6 <= arg_439_1.time_ and arg_439_1.time_ < var_442_6 + var_442_16 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_6) / var_442_16

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_6 + var_442_16 and arg_439_1.time_ < var_442_6 + var_442_16 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play103903111 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 103903111
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play103903112(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1039ui_story"]
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 and arg_443_1.var_.characterEffect1039ui_story == nil then
				arg_443_1.var_.characterEffect1039ui_story = var_446_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_2 = 0.1

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2

				if arg_443_1.var_.characterEffect1039ui_story then
					local var_446_4 = Mathf.Lerp(0, 0.5, var_446_3)

					arg_443_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_443_1.var_.characterEffect1039ui_story.fillRatio = var_446_4
				end
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 and arg_443_1.var_.characterEffect1039ui_story then
				local var_446_5 = 0.5

				arg_443_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_443_1.var_.characterEffect1039ui_story.fillRatio = var_446_5
			end

			local var_446_6 = 0
			local var_446_7 = 0.275

			if var_446_6 < arg_443_1.time_ and arg_443_1.time_ <= var_446_6 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_8 = arg_443_1:FormatText(StoryNameCfg[7].name)

				arg_443_1.leftNameTxt_.text = var_446_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_9 = arg_443_1:GetWordFromCfg(103903111)
				local var_446_10 = arg_443_1:FormatText(var_446_9.content)

				arg_443_1.text_.text = var_446_10

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_11 = 11
				local var_446_12 = utf8.len(var_446_10)
				local var_446_13 = var_446_11 <= 0 and var_446_7 or var_446_7 * (var_446_12 / var_446_11)

				if var_446_13 > 0 and var_446_7 < var_446_13 then
					arg_443_1.talkMaxDuration = var_446_13

					if var_446_13 + var_446_6 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_13 + var_446_6
					end
				end

				arg_443_1.text_.text = var_446_10
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_14 = math.max(var_446_7, arg_443_1.talkMaxDuration)

			if var_446_6 <= arg_443_1.time_ and arg_443_1.time_ < var_446_6 + var_446_14 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_6) / var_446_14

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_6 + var_446_14 and arg_443_1.time_ < var_446_6 + var_446_14 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play103903112 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 103903112
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play103903113(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.bgs_.D04a.transform
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 then
				arg_447_1.var_.moveOldPosD04a = var_450_0.localPosition
			end

			local var_450_2 = 0.001

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2
				local var_450_4 = Vector3.New(0, -100, 10)

				var_450_0.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPosD04a, var_450_4, var_450_3)
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 then
				var_450_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_450_5 = "ST01"

			if arg_447_1.bgs_[var_450_5] == nil then
				local var_450_6 = Object.Instantiate(arg_447_1.paintGo_)

				var_450_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_450_5)
				var_450_6.name = var_450_5
				var_450_6.transform.parent = arg_447_1.stage_.transform
				var_450_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_447_1.bgs_[var_450_5] = var_450_6
			end

			local var_450_7 = 0

			if var_450_7 < arg_447_1.time_ and arg_447_1.time_ <= var_450_7 + arg_450_0 then
				local var_450_8 = manager.ui.mainCamera.transform.localPosition
				local var_450_9 = Vector3.New(0, 0, 10) + Vector3.New(var_450_8.x, var_450_8.y, 0)
				local var_450_10 = arg_447_1.bgs_.ST01

				var_450_10.transform.localPosition = var_450_9
				var_450_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_450_11 = var_450_10:GetComponent("SpriteRenderer")

				if var_450_11 and var_450_11.sprite then
					local var_450_12 = (var_450_10.transform.localPosition - var_450_8).z
					local var_450_13 = manager.ui.mainCameraCom_
					local var_450_14 = 2 * var_450_12 * Mathf.Tan(var_450_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_450_15 = var_450_14 * var_450_13.aspect
					local var_450_16 = var_450_11.sprite.bounds.size.x
					local var_450_17 = var_450_11.sprite.bounds.size.y
					local var_450_18 = var_450_15 / var_450_16
					local var_450_19 = var_450_14 / var_450_17
					local var_450_20 = var_450_19 < var_450_18 and var_450_18 or var_450_19

					var_450_10.transform.localScale = Vector3.New(var_450_20, var_450_20, 0)
				end

				for iter_450_0, iter_450_1 in pairs(arg_447_1.bgs_) do
					if iter_450_0 ~= "ST01" then
						iter_450_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_450_21 = arg_447_1.actors_["1039ui_story"].transform
			local var_450_22 = 0

			if var_450_22 < arg_447_1.time_ and arg_447_1.time_ <= var_450_22 + arg_450_0 then
				arg_447_1.var_.moveOldPos1039ui_story = var_450_21.localPosition
			end

			local var_450_23 = 0.001

			if var_450_22 <= arg_447_1.time_ and arg_447_1.time_ < var_450_22 + var_450_23 then
				local var_450_24 = (arg_447_1.time_ - var_450_22) / var_450_23
				local var_450_25 = Vector3.New(10, -1.06, -5.3)

				var_450_21.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPos1039ui_story, var_450_25, var_450_24)

				local var_450_26 = manager.ui.mainCamera.transform.position - var_450_21.position

				var_450_21.forward = Vector3.New(var_450_26.x, var_450_26.y, var_450_26.z)

				local var_450_27 = var_450_21.localEulerAngles

				var_450_27.z = 0
				var_450_27.x = 0
				var_450_21.localEulerAngles = var_450_27
			end

			if arg_447_1.time_ >= var_450_22 + var_450_23 and arg_447_1.time_ < var_450_22 + var_450_23 + arg_450_0 then
				var_450_21.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_450_28 = manager.ui.mainCamera.transform.position - var_450_21.position

				var_450_21.forward = Vector3.New(var_450_28.x, var_450_28.y, var_450_28.z)

				local var_450_29 = var_450_21.localEulerAngles

				var_450_29.z = 0
				var_450_29.x = 0
				var_450_21.localEulerAngles = var_450_29
			end

			local var_450_30 = 0
			local var_450_31 = 0.125

			if var_450_30 < arg_447_1.time_ and arg_447_1.time_ <= var_450_30 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_32 = arg_447_1:FormatText(StoryNameCfg[7].name)

				arg_447_1.leftNameTxt_.text = var_450_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_33 = arg_447_1:GetWordFromCfg(103903112)
				local var_450_34 = arg_447_1:FormatText(var_450_33.content)

				arg_447_1.text_.text = var_450_34

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_35 = 5
				local var_450_36 = utf8.len(var_450_34)
				local var_450_37 = var_450_35 <= 0 and var_450_31 or var_450_31 * (var_450_36 / var_450_35)

				if var_450_37 > 0 and var_450_31 < var_450_37 then
					arg_447_1.talkMaxDuration = var_450_37

					if var_450_37 + var_450_30 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_37 + var_450_30
					end
				end

				arg_447_1.text_.text = var_450_34
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_38 = math.max(var_450_31, arg_447_1.talkMaxDuration)

			if var_450_30 <= arg_447_1.time_ and arg_447_1.time_ < var_450_30 + var_450_38 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_30) / var_450_38

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_30 + var_450_38 and arg_447_1.time_ < var_450_30 + var_450_38 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play103903113 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 103903113
		arg_451_1.duration_ = 5

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play103903114(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0
			local var_454_1 = 1.25

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, false)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_2 = arg_451_1:GetWordFromCfg(103903113)
				local var_454_3 = arg_451_1:FormatText(var_454_2.content)

				arg_451_1.text_.text = var_454_3

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_4 = 50
				local var_454_5 = utf8.len(var_454_3)
				local var_454_6 = var_454_4 <= 0 and var_454_1 or var_454_1 * (var_454_5 / var_454_4)

				if var_454_6 > 0 and var_454_1 < var_454_6 then
					arg_451_1.talkMaxDuration = var_454_6

					if var_454_6 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_6 + var_454_0
					end
				end

				arg_451_1.text_.text = var_454_3
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_7 = math.max(var_454_1, arg_451_1.talkMaxDuration)

			if var_454_0 <= arg_451_1.time_ and arg_451_1.time_ < var_454_0 + var_454_7 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_0) / var_454_7

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_0 + var_454_7 and arg_451_1.time_ < var_454_0 + var_454_7 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play103903114 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 103903114
		arg_455_1.duration_ = 6.233

		local var_455_0 = {
			ja = 6.233,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.333
		}
		local var_455_1 = manager.audio:GetLocalizationFlag()

		if var_455_0[var_455_1] ~= nil then
			arg_455_1.duration_ = var_455_0[var_455_1]
		end

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play103903115(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["1039ui_story"]
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 and arg_455_1.var_.characterEffect1039ui_story == nil then
				arg_455_1.var_.characterEffect1039ui_story = var_458_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_2 = 0.1

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_2 then
				local var_458_3 = (arg_455_1.time_ - var_458_1) / var_458_2

				if arg_455_1.var_.characterEffect1039ui_story then
					arg_455_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_455_1.time_ >= var_458_1 + var_458_2 and arg_455_1.time_ < var_458_1 + var_458_2 + arg_458_0 and arg_455_1.var_.characterEffect1039ui_story then
				arg_455_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_458_4 = arg_455_1.actors_["1039ui_story"].transform
			local var_458_5 = 0

			if var_458_5 < arg_455_1.time_ and arg_455_1.time_ <= var_458_5 + arg_458_0 then
				arg_455_1.var_.moveOldPos1039ui_story = var_458_4.localPosition
			end

			local var_458_6 = 0.001

			if var_458_5 <= arg_455_1.time_ and arg_455_1.time_ < var_458_5 + var_458_6 then
				local var_458_7 = (arg_455_1.time_ - var_458_5) / var_458_6
				local var_458_8 = Vector3.New(0, -1.06, -5.3)

				var_458_4.localPosition = Vector3.Lerp(arg_455_1.var_.moveOldPos1039ui_story, var_458_8, var_458_7)

				local var_458_9 = manager.ui.mainCamera.transform.position - var_458_4.position

				var_458_4.forward = Vector3.New(var_458_9.x, var_458_9.y, var_458_9.z)

				local var_458_10 = var_458_4.localEulerAngles

				var_458_10.z = 0
				var_458_10.x = 0
				var_458_4.localEulerAngles = var_458_10
			end

			if arg_455_1.time_ >= var_458_5 + var_458_6 and arg_455_1.time_ < var_458_5 + var_458_6 + arg_458_0 then
				var_458_4.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_458_11 = manager.ui.mainCamera.transform.position - var_458_4.position

				var_458_4.forward = Vector3.New(var_458_11.x, var_458_11.y, var_458_11.z)

				local var_458_12 = var_458_4.localEulerAngles

				var_458_12.z = 0
				var_458_12.x = 0
				var_458_4.localEulerAngles = var_458_12
			end

			local var_458_13 = 0

			if var_458_13 < arg_455_1.time_ and arg_455_1.time_ <= var_458_13 + arg_458_0 then
				arg_455_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_458_14 = 0

			if var_458_14 < arg_455_1.time_ and arg_455_1.time_ <= var_458_14 + arg_458_0 then
				arg_455_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_458_15 = 0
			local var_458_16 = 0.175

			if var_458_15 < arg_455_1.time_ and arg_455_1.time_ <= var_458_15 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_17 = arg_455_1:FormatText(StoryNameCfg[9].name)

				arg_455_1.leftNameTxt_.text = var_458_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_18 = arg_455_1:GetWordFromCfg(103903114)
				local var_458_19 = arg_455_1:FormatText(var_458_18.content)

				arg_455_1.text_.text = var_458_19

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_20 = 7
				local var_458_21 = utf8.len(var_458_19)
				local var_458_22 = var_458_20 <= 0 and var_458_16 or var_458_16 * (var_458_21 / var_458_20)

				if var_458_22 > 0 and var_458_16 < var_458_22 then
					arg_455_1.talkMaxDuration = var_458_22

					if var_458_22 + var_458_15 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_22 + var_458_15
					end
				end

				arg_455_1.text_.text = var_458_19
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903114", "story_v_side_old_103903.awb") ~= 0 then
					local var_458_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903114", "story_v_side_old_103903.awb") / 1000

					if var_458_23 + var_458_15 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_23 + var_458_15
					end

					if var_458_18.prefab_name ~= "" and arg_455_1.actors_[var_458_18.prefab_name] ~= nil then
						local var_458_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_18.prefab_name].transform, "story_v_side_old_103903", "103903114", "story_v_side_old_103903.awb")

						arg_455_1:RecordAudio("103903114", var_458_24)
						arg_455_1:RecordAudio("103903114", var_458_24)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903114", "story_v_side_old_103903.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903114", "story_v_side_old_103903.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_25 = math.max(var_458_16, arg_455_1.talkMaxDuration)

			if var_458_15 <= arg_455_1.time_ and arg_455_1.time_ < var_458_15 + var_458_25 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_15) / var_458_25

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_15 + var_458_25 and arg_455_1.time_ < var_458_15 + var_458_25 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play103903115 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 103903115
		arg_459_1.duration_ = 5

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play103903116(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = 0
			local var_462_1 = 0.7

			if var_462_0 < arg_459_1.time_ and arg_459_1.time_ <= var_462_0 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, false)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_2 = arg_459_1:GetWordFromCfg(103903115)
				local var_462_3 = arg_459_1:FormatText(var_462_2.content)

				arg_459_1.text_.text = var_462_3

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_4 = 28
				local var_462_5 = utf8.len(var_462_3)
				local var_462_6 = var_462_4 <= 0 and var_462_1 or var_462_1 * (var_462_5 / var_462_4)

				if var_462_6 > 0 and var_462_1 < var_462_6 then
					arg_459_1.talkMaxDuration = var_462_6

					if var_462_6 + var_462_0 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_6 + var_462_0
					end
				end

				arg_459_1.text_.text = var_462_3
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)
				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_7 = math.max(var_462_1, arg_459_1.talkMaxDuration)

			if var_462_0 <= arg_459_1.time_ and arg_459_1.time_ < var_462_0 + var_462_7 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_0) / var_462_7

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_0 + var_462_7 and arg_459_1.time_ < var_462_0 + var_462_7 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play103903116 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 103903116
		arg_463_1.duration_ = 4.233

		local var_463_0 = {
			ja = 4.033,
			ko = 3.666,
			zh = 3.666,
			en = 4.233
		}
		local var_463_1 = manager.audio:GetLocalizationFlag()

		if var_463_0[var_463_1] ~= nil then
			arg_463_1.duration_ = var_463_0[var_463_1]
		end

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play103903117(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action424")
			end

			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				arg_463_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_466_2 = 0
			local var_466_3 = 0.225

			if var_466_2 < arg_463_1.time_ and arg_463_1.time_ <= var_466_2 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_4 = arg_463_1:FormatText(StoryNameCfg[9].name)

				arg_463_1.leftNameTxt_.text = var_466_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_5 = arg_463_1:GetWordFromCfg(103903116)
				local var_466_6 = arg_463_1:FormatText(var_466_5.content)

				arg_463_1.text_.text = var_466_6

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_7 = 9
				local var_466_8 = utf8.len(var_466_6)
				local var_466_9 = var_466_7 <= 0 and var_466_3 or var_466_3 * (var_466_8 / var_466_7)

				if var_466_9 > 0 and var_466_3 < var_466_9 then
					arg_463_1.talkMaxDuration = var_466_9

					if var_466_9 + var_466_2 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_9 + var_466_2
					end
				end

				arg_463_1.text_.text = var_466_6
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903116", "story_v_side_old_103903.awb") ~= 0 then
					local var_466_10 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903116", "story_v_side_old_103903.awb") / 1000

					if var_466_10 + var_466_2 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_10 + var_466_2
					end

					if var_466_5.prefab_name ~= "" and arg_463_1.actors_[var_466_5.prefab_name] ~= nil then
						local var_466_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_5.prefab_name].transform, "story_v_side_old_103903", "103903116", "story_v_side_old_103903.awb")

						arg_463_1:RecordAudio("103903116", var_466_11)
						arg_463_1:RecordAudio("103903116", var_466_11)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903116", "story_v_side_old_103903.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903116", "story_v_side_old_103903.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_12 = math.max(var_466_3, arg_463_1.talkMaxDuration)

			if var_466_2 <= arg_463_1.time_ and arg_463_1.time_ < var_466_2 + var_466_12 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_2) / var_466_12

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_2 + var_466_12 and arg_463_1.time_ < var_466_2 + var_466_12 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play103903117 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 103903117
		arg_467_1.duration_ = 17

		local var_467_0 = {
			ja = 14,
			ko = 13.8,
			zh = 13.8,
			en = 17
		}
		local var_467_1 = manager.audio:GetLocalizationFlag()

		if var_467_0[var_467_1] ~= nil then
			arg_467_1.duration_ = var_467_0[var_467_1]
		end

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play103903118(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				arg_467_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_470_1 = 0
			local var_470_2 = 1.425

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_3 = arg_467_1:FormatText(StoryNameCfg[9].name)

				arg_467_1.leftNameTxt_.text = var_470_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_4 = arg_467_1:GetWordFromCfg(103903117)
				local var_470_5 = arg_467_1:FormatText(var_470_4.content)

				arg_467_1.text_.text = var_470_5

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_6 = 57
				local var_470_7 = utf8.len(var_470_5)
				local var_470_8 = var_470_6 <= 0 and var_470_2 or var_470_2 * (var_470_7 / var_470_6)

				if var_470_8 > 0 and var_470_2 < var_470_8 then
					arg_467_1.talkMaxDuration = var_470_8

					if var_470_8 + var_470_1 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_8 + var_470_1
					end
				end

				arg_467_1.text_.text = var_470_5
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903117", "story_v_side_old_103903.awb") ~= 0 then
					local var_470_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903117", "story_v_side_old_103903.awb") / 1000

					if var_470_9 + var_470_1 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_9 + var_470_1
					end

					if var_470_4.prefab_name ~= "" and arg_467_1.actors_[var_470_4.prefab_name] ~= nil then
						local var_470_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_4.prefab_name].transform, "story_v_side_old_103903", "103903117", "story_v_side_old_103903.awb")

						arg_467_1:RecordAudio("103903117", var_470_10)
						arg_467_1:RecordAudio("103903117", var_470_10)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903117", "story_v_side_old_103903.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903117", "story_v_side_old_103903.awb")
				end

				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_11 = math.max(var_470_2, arg_467_1.talkMaxDuration)

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_11 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_1) / var_470_11

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_1 + var_470_11 and arg_467_1.time_ < var_470_1 + var_470_11 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play103903118 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 103903118
		arg_471_1.duration_ = 10.9

		local var_471_0 = {
			ja = 10.9,
			ko = 8.8,
			zh = 8.8,
			en = 10.233
		}
		local var_471_1 = manager.audio:GetLocalizationFlag()

		if var_471_0[var_471_1] ~= nil then
			arg_471_1.duration_ = var_471_0[var_471_1]
		end

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play103903119(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				arg_471_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action445")
			end

			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_474_2 = 0
			local var_474_3 = 1.1

			if var_474_2 < arg_471_1.time_ and arg_471_1.time_ <= var_474_2 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_4 = arg_471_1:FormatText(StoryNameCfg[9].name)

				arg_471_1.leftNameTxt_.text = var_474_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_5 = arg_471_1:GetWordFromCfg(103903118)
				local var_474_6 = arg_471_1:FormatText(var_474_5.content)

				arg_471_1.text_.text = var_474_6

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_7 = 43
				local var_474_8 = utf8.len(var_474_6)
				local var_474_9 = var_474_7 <= 0 and var_474_3 or var_474_3 * (var_474_8 / var_474_7)

				if var_474_9 > 0 and var_474_3 < var_474_9 then
					arg_471_1.talkMaxDuration = var_474_9

					if var_474_9 + var_474_2 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_9 + var_474_2
					end
				end

				arg_471_1.text_.text = var_474_6
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903118", "story_v_side_old_103903.awb") ~= 0 then
					local var_474_10 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903118", "story_v_side_old_103903.awb") / 1000

					if var_474_10 + var_474_2 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_10 + var_474_2
					end

					if var_474_5.prefab_name ~= "" and arg_471_1.actors_[var_474_5.prefab_name] ~= nil then
						local var_474_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_5.prefab_name].transform, "story_v_side_old_103903", "103903118", "story_v_side_old_103903.awb")

						arg_471_1:RecordAudio("103903118", var_474_11)
						arg_471_1:RecordAudio("103903118", var_474_11)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903118", "story_v_side_old_103903.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903118", "story_v_side_old_103903.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_12 = math.max(var_474_3, arg_471_1.talkMaxDuration)

			if var_474_2 <= arg_471_1.time_ and arg_471_1.time_ < var_474_2 + var_474_12 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_2) / var_474_12

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_2 + var_474_12 and arg_471_1.time_ < var_474_2 + var_474_12 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play103903119 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 103903119
		arg_475_1.duration_ = 8.166

		local var_475_0 = {
			ja = 8.166,
			ko = 7.8,
			zh = 7.8,
			en = 8.066
		}
		local var_475_1 = manager.audio:GetLocalizationFlag()

		if var_475_0[var_475_1] ~= nil then
			arg_475_1.duration_ = var_475_0[var_475_1]
		end

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play103903120(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_478_1 = 0
			local var_478_2 = 0.825

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_3 = arg_475_1:FormatText(StoryNameCfg[9].name)

				arg_475_1.leftNameTxt_.text = var_478_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_4 = arg_475_1:GetWordFromCfg(103903119)
				local var_478_5 = arg_475_1:FormatText(var_478_4.content)

				arg_475_1.text_.text = var_478_5

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_6 = 33
				local var_478_7 = utf8.len(var_478_5)
				local var_478_8 = var_478_6 <= 0 and var_478_2 or var_478_2 * (var_478_7 / var_478_6)

				if var_478_8 > 0 and var_478_2 < var_478_8 then
					arg_475_1.talkMaxDuration = var_478_8

					if var_478_8 + var_478_1 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_8 + var_478_1
					end
				end

				arg_475_1.text_.text = var_478_5
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903119", "story_v_side_old_103903.awb") ~= 0 then
					local var_478_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903119", "story_v_side_old_103903.awb") / 1000

					if var_478_9 + var_478_1 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_9 + var_478_1
					end

					if var_478_4.prefab_name ~= "" and arg_475_1.actors_[var_478_4.prefab_name] ~= nil then
						local var_478_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_4.prefab_name].transform, "story_v_side_old_103903", "103903119", "story_v_side_old_103903.awb")

						arg_475_1:RecordAudio("103903119", var_478_10)
						arg_475_1:RecordAudio("103903119", var_478_10)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903119", "story_v_side_old_103903.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903119", "story_v_side_old_103903.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_11 = math.max(var_478_2, arg_475_1.talkMaxDuration)

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_11 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_1) / var_478_11

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_1 + var_478_11 and arg_475_1.time_ < var_478_1 + var_478_11 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play103903120 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 103903120
		arg_479_1.duration_ = 8.533

		local var_479_0 = {
			ja = 8.533,
			ko = 4.366,
			zh = 4.366,
			en = 3.866
		}
		local var_479_1 = manager.audio:GetLocalizationFlag()

		if var_479_0[var_479_1] ~= nil then
			arg_479_1.duration_ = var_479_0[var_479_1]
		end

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play103903121(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = 0

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action472")
			end

			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 then
				arg_479_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_482_2 = 0
			local var_482_3 = 0.55

			if var_482_2 < arg_479_1.time_ and arg_479_1.time_ <= var_482_2 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_4 = arg_479_1:FormatText(StoryNameCfg[9].name)

				arg_479_1.leftNameTxt_.text = var_482_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_5 = arg_479_1:GetWordFromCfg(103903120)
				local var_482_6 = arg_479_1:FormatText(var_482_5.content)

				arg_479_1.text_.text = var_482_6

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_7 = 22
				local var_482_8 = utf8.len(var_482_6)
				local var_482_9 = var_482_7 <= 0 and var_482_3 or var_482_3 * (var_482_8 / var_482_7)

				if var_482_9 > 0 and var_482_3 < var_482_9 then
					arg_479_1.talkMaxDuration = var_482_9

					if var_482_9 + var_482_2 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_9 + var_482_2
					end
				end

				arg_479_1.text_.text = var_482_6
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903120", "story_v_side_old_103903.awb") ~= 0 then
					local var_482_10 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903120", "story_v_side_old_103903.awb") / 1000

					if var_482_10 + var_482_2 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_10 + var_482_2
					end

					if var_482_5.prefab_name ~= "" and arg_479_1.actors_[var_482_5.prefab_name] ~= nil then
						local var_482_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_5.prefab_name].transform, "story_v_side_old_103903", "103903120", "story_v_side_old_103903.awb")

						arg_479_1:RecordAudio("103903120", var_482_11)
						arg_479_1:RecordAudio("103903120", var_482_11)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903120", "story_v_side_old_103903.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903120", "story_v_side_old_103903.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_12 = math.max(var_482_3, arg_479_1.talkMaxDuration)

			if var_482_2 <= arg_479_1.time_ and arg_479_1.time_ < var_482_2 + var_482_12 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_2) / var_482_12

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_2 + var_482_12 and arg_479_1.time_ < var_482_2 + var_482_12 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play103903121 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 103903121
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play103903122(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1039ui_story"]
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 and arg_483_1.var_.characterEffect1039ui_story == nil then
				arg_483_1.var_.characterEffect1039ui_story = var_486_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_2 = 0.1

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2

				if arg_483_1.var_.characterEffect1039ui_story then
					local var_486_4 = Mathf.Lerp(0, 0.5, var_486_3)

					arg_483_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_483_1.var_.characterEffect1039ui_story.fillRatio = var_486_4
				end
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 and arg_483_1.var_.characterEffect1039ui_story then
				local var_486_5 = 0.5

				arg_483_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_483_1.var_.characterEffect1039ui_story.fillRatio = var_486_5
			end

			local var_486_6 = arg_483_1.bgs_.ST01.transform
			local var_486_7 = 0

			if var_486_7 < arg_483_1.time_ and arg_483_1.time_ <= var_486_7 + arg_486_0 then
				arg_483_1.var_.moveOldPosST01 = var_486_6.localPosition
			end

			local var_486_8 = 0.001

			if var_486_7 <= arg_483_1.time_ and arg_483_1.time_ < var_486_7 + var_486_8 then
				local var_486_9 = (arg_483_1.time_ - var_486_7) / var_486_8
				local var_486_10 = Vector3.New(0, -100, 10)

				var_486_6.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPosST01, var_486_10, var_486_9)
			end

			if arg_483_1.time_ >= var_486_7 + var_486_8 and arg_483_1.time_ < var_486_7 + var_486_8 + arg_486_0 then
				var_486_6.localPosition = Vector3.New(0, -100, 10)
			end

			local var_486_11 = 0

			if var_486_11 < arg_483_1.time_ and arg_483_1.time_ <= var_486_11 + arg_486_0 then
				local var_486_12 = manager.ui.mainCamera.transform.localPosition
				local var_486_13 = Vector3.New(0, 0, 10) + Vector3.New(var_486_12.x, var_486_12.y, 0)
				local var_486_14 = arg_483_1.bgs_.D04a

				var_486_14.transform.localPosition = var_486_13
				var_486_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_486_15 = var_486_14:GetComponent("SpriteRenderer")

				if var_486_15 and var_486_15.sprite then
					local var_486_16 = (var_486_14.transform.localPosition - var_486_12).z
					local var_486_17 = manager.ui.mainCameraCom_
					local var_486_18 = 2 * var_486_16 * Mathf.Tan(var_486_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_486_19 = var_486_18 * var_486_17.aspect
					local var_486_20 = var_486_15.sprite.bounds.size.x
					local var_486_21 = var_486_15.sprite.bounds.size.y
					local var_486_22 = var_486_19 / var_486_20
					local var_486_23 = var_486_18 / var_486_21
					local var_486_24 = var_486_23 < var_486_22 and var_486_22 or var_486_23

					var_486_14.transform.localScale = Vector3.New(var_486_24, var_486_24, 0)
				end

				for iter_486_0, iter_486_1 in pairs(arg_483_1.bgs_) do
					if iter_486_0 ~= "D04a" then
						iter_486_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_486_25 = arg_483_1.actors_["1039ui_story"].transform
			local var_486_26 = 0

			if var_486_26 < arg_483_1.time_ and arg_483_1.time_ <= var_486_26 + arg_486_0 then
				arg_483_1.var_.moveOldPos1039ui_story = var_486_25.localPosition
			end

			local var_486_27 = 0.001

			if var_486_26 <= arg_483_1.time_ and arg_483_1.time_ < var_486_26 + var_486_27 then
				local var_486_28 = (arg_483_1.time_ - var_486_26) / var_486_27
				local var_486_29 = Vector3.New(10, -1.06, -5.3)

				var_486_25.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos1039ui_story, var_486_29, var_486_28)

				local var_486_30 = manager.ui.mainCamera.transform.position - var_486_25.position

				var_486_25.forward = Vector3.New(var_486_30.x, var_486_30.y, var_486_30.z)

				local var_486_31 = var_486_25.localEulerAngles

				var_486_31.z = 0
				var_486_31.x = 0
				var_486_25.localEulerAngles = var_486_31
			end

			if arg_483_1.time_ >= var_486_26 + var_486_27 and arg_483_1.time_ < var_486_26 + var_486_27 + arg_486_0 then
				var_486_25.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_486_32 = manager.ui.mainCamera.transform.position - var_486_25.position

				var_486_25.forward = Vector3.New(var_486_32.x, var_486_32.y, var_486_32.z)

				local var_486_33 = var_486_25.localEulerAngles

				var_486_33.z = 0
				var_486_33.x = 0
				var_486_25.localEulerAngles = var_486_33
			end

			local var_486_34 = 0
			local var_486_35 = 0.65

			if var_486_34 < arg_483_1.time_ and arg_483_1.time_ <= var_486_34 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_36 = arg_483_1:FormatText(StoryNameCfg[7].name)

				arg_483_1.leftNameTxt_.text = var_486_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_37 = arg_483_1:GetWordFromCfg(103903121)
				local var_486_38 = arg_483_1:FormatText(var_486_37.content)

				arg_483_1.text_.text = var_486_38

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_39 = 26
				local var_486_40 = utf8.len(var_486_38)
				local var_486_41 = var_486_39 <= 0 and var_486_35 or var_486_35 * (var_486_40 / var_486_39)

				if var_486_41 > 0 and var_486_35 < var_486_41 then
					arg_483_1.talkMaxDuration = var_486_41

					if var_486_41 + var_486_34 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_41 + var_486_34
					end
				end

				arg_483_1.text_.text = var_486_38
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_42 = math.max(var_486_35, arg_483_1.talkMaxDuration)

			if var_486_34 <= arg_483_1.time_ and arg_483_1.time_ < var_486_34 + var_486_42 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_34) / var_486_42

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_34 + var_486_42 and arg_483_1.time_ < var_486_34 + var_486_42 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play103903122 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 103903122
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play103903123(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 0
			local var_490_1 = 0.575

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_2 = arg_487_1:FormatText(StoryNameCfg[7].name)

				arg_487_1.leftNameTxt_.text = var_490_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_3 = arg_487_1:GetWordFromCfg(103903122)
				local var_490_4 = arg_487_1:FormatText(var_490_3.content)

				arg_487_1.text_.text = var_490_4

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_5 = 23
				local var_490_6 = utf8.len(var_490_4)
				local var_490_7 = var_490_5 <= 0 and var_490_1 or var_490_1 * (var_490_6 / var_490_5)

				if var_490_7 > 0 and var_490_1 < var_490_7 then
					arg_487_1.talkMaxDuration = var_490_7

					if var_490_7 + var_490_0 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_7 + var_490_0
					end
				end

				arg_487_1.text_.text = var_490_4
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_8 = math.max(var_490_1, arg_487_1.talkMaxDuration)

			if var_490_0 <= arg_487_1.time_ and arg_487_1.time_ < var_490_0 + var_490_8 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_0) / var_490_8

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_0 + var_490_8 and arg_487_1.time_ < var_490_0 + var_490_8 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play103903123 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 103903123
		arg_491_1.duration_ = 5

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play103903124(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = 0
			local var_494_1 = 0.2

			if var_494_0 < arg_491_1.time_ and arg_491_1.time_ <= var_494_0 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, false)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_2 = arg_491_1:GetWordFromCfg(103903123)
				local var_494_3 = arg_491_1:FormatText(var_494_2.content)

				arg_491_1.text_.text = var_494_3

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_4 = 8
				local var_494_5 = utf8.len(var_494_3)
				local var_494_6 = var_494_4 <= 0 and var_494_1 or var_494_1 * (var_494_5 / var_494_4)

				if var_494_6 > 0 and var_494_1 < var_494_6 then
					arg_491_1.talkMaxDuration = var_494_6

					if var_494_6 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_6 + var_494_0
					end
				end

				arg_491_1.text_.text = var_494_3
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)
				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_7 = math.max(var_494_1, arg_491_1.talkMaxDuration)

			if var_494_0 <= arg_491_1.time_ and arg_491_1.time_ < var_494_0 + var_494_7 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_0) / var_494_7

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_0 + var_494_7 and arg_491_1.time_ < var_494_0 + var_494_7 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play103903124 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 103903124
		arg_495_1.duration_ = 5

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play103903125(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1039ui_story"]
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 and arg_495_1.var_.characterEffect1039ui_story == nil then
				arg_495_1.var_.characterEffect1039ui_story = var_498_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_2 = 0.1

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2

				if arg_495_1.var_.characterEffect1039ui_story then
					arg_495_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1039ui_story then
				arg_495_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_498_4 = 0
			local var_498_5 = 0.7

			if var_498_4 < arg_495_1.time_ and arg_495_1.time_ <= var_498_4 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, false)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_6 = arg_495_1:GetWordFromCfg(103903124)
				local var_498_7 = arg_495_1:FormatText(var_498_6.content)

				arg_495_1.text_.text = var_498_7

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_8 = 28
				local var_498_9 = utf8.len(var_498_7)
				local var_498_10 = var_498_8 <= 0 and var_498_5 or var_498_5 * (var_498_9 / var_498_8)

				if var_498_10 > 0 and var_498_5 < var_498_10 then
					arg_495_1.talkMaxDuration = var_498_10

					if var_498_10 + var_498_4 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_10 + var_498_4
					end
				end

				arg_495_1.text_.text = var_498_7
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)
				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_11 = math.max(var_498_5, arg_495_1.talkMaxDuration)

			if var_498_4 <= arg_495_1.time_ and arg_495_1.time_ < var_498_4 + var_498_11 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_4) / var_498_11

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_4 + var_498_11 and arg_495_1.time_ < var_498_4 + var_498_11 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play103903125 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 103903125
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play103903126(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1039ui_story"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 and arg_499_1.var_.characterEffect1039ui_story == nil then
				arg_499_1.var_.characterEffect1039ui_story = var_502_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_2 = 0.1

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2

				if arg_499_1.var_.characterEffect1039ui_story then
					local var_502_4 = Mathf.Lerp(0, 0.5, var_502_3)

					arg_499_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_499_1.var_.characterEffect1039ui_story.fillRatio = var_502_4
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 and arg_499_1.var_.characterEffect1039ui_story then
				local var_502_5 = 0.5

				arg_499_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_499_1.var_.characterEffect1039ui_story.fillRatio = var_502_5
			end

			local var_502_6 = 0
			local var_502_7 = 0.525

			if var_502_6 < arg_499_1.time_ and arg_499_1.time_ <= var_502_6 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, false)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_8 = arg_499_1:GetWordFromCfg(103903125)
				local var_502_9 = arg_499_1:FormatText(var_502_8.content)

				arg_499_1.text_.text = var_502_9

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_10 = 21
				local var_502_11 = utf8.len(var_502_9)
				local var_502_12 = var_502_10 <= 0 and var_502_7 or var_502_7 * (var_502_11 / var_502_10)

				if var_502_12 > 0 and var_502_7 < var_502_12 then
					arg_499_1.talkMaxDuration = var_502_12

					if var_502_12 + var_502_6 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_12 + var_502_6
					end
				end

				arg_499_1.text_.text = var_502_9
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_13 = math.max(var_502_7, arg_499_1.talkMaxDuration)

			if var_502_6 <= arg_499_1.time_ and arg_499_1.time_ < var_502_6 + var_502_13 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_6) / var_502_13

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_6 + var_502_13 and arg_499_1.time_ < var_502_6 + var_502_13 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play103903126 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 103903126
		arg_503_1.duration_ = 5

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play103903127(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0
			local var_506_1 = 1.1

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, false)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_2 = arg_503_1:GetWordFromCfg(103903126)
				local var_506_3 = arg_503_1:FormatText(var_506_2.content)

				arg_503_1.text_.text = var_506_3

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_4 = 39
				local var_506_5 = utf8.len(var_506_3)
				local var_506_6 = var_506_4 <= 0 and var_506_1 or var_506_1 * (var_506_5 / var_506_4)

				if var_506_6 > 0 and var_506_1 < var_506_6 then
					arg_503_1.talkMaxDuration = var_506_6

					if var_506_6 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_6 + var_506_0
					end
				end

				arg_503_1.text_.text = var_506_3
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)
				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_7 = math.max(var_506_1, arg_503_1.talkMaxDuration)

			if var_506_0 <= arg_503_1.time_ and arg_503_1.time_ < var_506_0 + var_506_7 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_0) / var_506_7

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_0 + var_506_7 and arg_503_1.time_ < var_506_0 + var_506_7 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play103903127 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 103903127
		arg_507_1.duration_ = 6.933

		local var_507_0 = {
			ja = 6.933,
			ko = 4.366,
			zh = 4.366,
			en = 4.933
		}
		local var_507_1 = manager.audio:GetLocalizationFlag()

		if var_507_0[var_507_1] ~= nil then
			arg_507_1.duration_ = var_507_0[var_507_1]
		end

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play103903128(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1039ui_story"]
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 and arg_507_1.var_.characterEffect1039ui_story == nil then
				arg_507_1.var_.characterEffect1039ui_story = var_510_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_2 = 0.1

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2

				if arg_507_1.var_.characterEffect1039ui_story then
					arg_507_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 and arg_507_1.var_.characterEffect1039ui_story then
				arg_507_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_510_4 = arg_507_1.actors_["1039ui_story"].transform
			local var_510_5 = 0

			if var_510_5 < arg_507_1.time_ and arg_507_1.time_ <= var_510_5 + arg_510_0 then
				arg_507_1.var_.moveOldPos1039ui_story = var_510_4.localPosition
			end

			local var_510_6 = 0.001

			if var_510_5 <= arg_507_1.time_ and arg_507_1.time_ < var_510_5 + var_510_6 then
				local var_510_7 = (arg_507_1.time_ - var_510_5) / var_510_6
				local var_510_8 = Vector3.New(0, -1.06, -5.3)

				var_510_4.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos1039ui_story, var_510_8, var_510_7)

				local var_510_9 = manager.ui.mainCamera.transform.position - var_510_4.position

				var_510_4.forward = Vector3.New(var_510_9.x, var_510_9.y, var_510_9.z)

				local var_510_10 = var_510_4.localEulerAngles

				var_510_10.z = 0
				var_510_10.x = 0
				var_510_4.localEulerAngles = var_510_10
			end

			if arg_507_1.time_ >= var_510_5 + var_510_6 and arg_507_1.time_ < var_510_5 + var_510_6 + arg_510_0 then
				var_510_4.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_510_11 = manager.ui.mainCamera.transform.position - var_510_4.position

				var_510_4.forward = Vector3.New(var_510_11.x, var_510_11.y, var_510_11.z)

				local var_510_12 = var_510_4.localEulerAngles

				var_510_12.z = 0
				var_510_12.x = 0
				var_510_4.localEulerAngles = var_510_12
			end

			local var_510_13 = 0

			if var_510_13 < arg_507_1.time_ and arg_507_1.time_ <= var_510_13 + arg_510_0 then
				arg_507_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_510_14 = 0

			if var_510_14 < arg_507_1.time_ and arg_507_1.time_ <= var_510_14 + arg_510_0 then
				arg_507_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_510_15 = 0
			local var_510_16 = 0.575

			if var_510_15 < arg_507_1.time_ and arg_507_1.time_ <= var_510_15 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_17 = arg_507_1:FormatText(StoryNameCfg[9].name)

				arg_507_1.leftNameTxt_.text = var_510_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_18 = arg_507_1:GetWordFromCfg(103903127)
				local var_510_19 = arg_507_1:FormatText(var_510_18.content)

				arg_507_1.text_.text = var_510_19

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_20 = 23
				local var_510_21 = utf8.len(var_510_19)
				local var_510_22 = var_510_20 <= 0 and var_510_16 or var_510_16 * (var_510_21 / var_510_20)

				if var_510_22 > 0 and var_510_16 < var_510_22 then
					arg_507_1.talkMaxDuration = var_510_22

					if var_510_22 + var_510_15 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_22 + var_510_15
					end
				end

				arg_507_1.text_.text = var_510_19
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903127", "story_v_side_old_103903.awb") ~= 0 then
					local var_510_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903127", "story_v_side_old_103903.awb") / 1000

					if var_510_23 + var_510_15 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_23 + var_510_15
					end

					if var_510_18.prefab_name ~= "" and arg_507_1.actors_[var_510_18.prefab_name] ~= nil then
						local var_510_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_18.prefab_name].transform, "story_v_side_old_103903", "103903127", "story_v_side_old_103903.awb")

						arg_507_1:RecordAudio("103903127", var_510_24)
						arg_507_1:RecordAudio("103903127", var_510_24)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903127", "story_v_side_old_103903.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903127", "story_v_side_old_103903.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_25 = math.max(var_510_16, arg_507_1.talkMaxDuration)

			if var_510_15 <= arg_507_1.time_ and arg_507_1.time_ < var_510_15 + var_510_25 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_15) / var_510_25

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_15 + var_510_25 and arg_507_1.time_ < var_510_15 + var_510_25 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play103903128 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 103903128
		arg_511_1.duration_ = 9.3

		local var_511_0 = {
			ja = 9.3,
			ko = 7.166,
			zh = 7.166,
			en = 5.333
		}
		local var_511_1 = manager.audio:GetLocalizationFlag()

		if var_511_0[var_511_1] ~= nil then
			arg_511_1.duration_ = var_511_0[var_511_1]
		end

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play103903129(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = 0

			if var_514_0 < arg_511_1.time_ and arg_511_1.time_ <= var_514_0 + arg_514_0 then
				arg_511_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_514_1 = 0
			local var_514_2 = 0.925

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_3 = arg_511_1:FormatText(StoryNameCfg[9].name)

				arg_511_1.leftNameTxt_.text = var_514_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_4 = arg_511_1:GetWordFromCfg(103903128)
				local var_514_5 = arg_511_1:FormatText(var_514_4.content)

				arg_511_1.text_.text = var_514_5

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_6 = 37
				local var_514_7 = utf8.len(var_514_5)
				local var_514_8 = var_514_6 <= 0 and var_514_2 or var_514_2 * (var_514_7 / var_514_6)

				if var_514_8 > 0 and var_514_2 < var_514_8 then
					arg_511_1.talkMaxDuration = var_514_8

					if var_514_8 + var_514_1 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_8 + var_514_1
					end
				end

				arg_511_1.text_.text = var_514_5
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903128", "story_v_side_old_103903.awb") ~= 0 then
					local var_514_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903128", "story_v_side_old_103903.awb") / 1000

					if var_514_9 + var_514_1 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_9 + var_514_1
					end

					if var_514_4.prefab_name ~= "" and arg_511_1.actors_[var_514_4.prefab_name] ~= nil then
						local var_514_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_4.prefab_name].transform, "story_v_side_old_103903", "103903128", "story_v_side_old_103903.awb")

						arg_511_1:RecordAudio("103903128", var_514_10)
						arg_511_1:RecordAudio("103903128", var_514_10)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903128", "story_v_side_old_103903.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903128", "story_v_side_old_103903.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_11 = math.max(var_514_2, arg_511_1.talkMaxDuration)

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_11 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_1) / var_514_11

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_1 + var_514_11 and arg_511_1.time_ < var_514_1 + var_514_11 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play103903129 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 103903129
		arg_515_1.duration_ = 5

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play103903130(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["1039ui_story"]
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 and arg_515_1.var_.characterEffect1039ui_story == nil then
				arg_515_1.var_.characterEffect1039ui_story = var_518_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_2 = 0.1

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2

				if arg_515_1.var_.characterEffect1039ui_story then
					local var_518_4 = Mathf.Lerp(0, 0.5, var_518_3)

					arg_515_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_515_1.var_.characterEffect1039ui_story.fillRatio = var_518_4
				end
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 and arg_515_1.var_.characterEffect1039ui_story then
				local var_518_5 = 0.5

				arg_515_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_515_1.var_.characterEffect1039ui_story.fillRatio = var_518_5
			end

			local var_518_6 = 0
			local var_518_7 = 0.9

			if var_518_6 < arg_515_1.time_ and arg_515_1.time_ <= var_518_6 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_8 = arg_515_1:FormatText(StoryNameCfg[7].name)

				arg_515_1.leftNameTxt_.text = var_518_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_9 = arg_515_1:GetWordFromCfg(103903129)
				local var_518_10 = arg_515_1:FormatText(var_518_9.content)

				arg_515_1.text_.text = var_518_10

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_11 = 36
				local var_518_12 = utf8.len(var_518_10)
				local var_518_13 = var_518_11 <= 0 and var_518_7 or var_518_7 * (var_518_12 / var_518_11)

				if var_518_13 > 0 and var_518_7 < var_518_13 then
					arg_515_1.talkMaxDuration = var_518_13

					if var_518_13 + var_518_6 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_13 + var_518_6
					end
				end

				arg_515_1.text_.text = var_518_10
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)
				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_14 = math.max(var_518_7, arg_515_1.talkMaxDuration)

			if var_518_6 <= arg_515_1.time_ and arg_515_1.time_ < var_518_6 + var_518_14 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_6) / var_518_14

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_6 + var_518_14 and arg_515_1.time_ < var_518_6 + var_518_14 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play103903130 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 103903130
		arg_519_1.duration_ = 7.066

		local var_519_0 = {
			ja = 7.066,
			ko = 4.366,
			zh = 4.366,
			en = 6.166
		}
		local var_519_1 = manager.audio:GetLocalizationFlag()

		if var_519_0[var_519_1] ~= nil then
			arg_519_1.duration_ = var_519_0[var_519_1]
		end

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play103903131(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["1039ui_story"]
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 and arg_519_1.var_.characterEffect1039ui_story == nil then
				arg_519_1.var_.characterEffect1039ui_story = var_522_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_522_2 = 0.1

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_2 then
				local var_522_3 = (arg_519_1.time_ - var_522_1) / var_522_2

				if arg_519_1.var_.characterEffect1039ui_story then
					arg_519_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_519_1.time_ >= var_522_1 + var_522_2 and arg_519_1.time_ < var_522_1 + var_522_2 + arg_522_0 and arg_519_1.var_.characterEffect1039ui_story then
				arg_519_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_522_4 = 0

			if var_522_4 < arg_519_1.time_ and arg_519_1.time_ <= var_522_4 + arg_522_0 then
				arg_519_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action456")
			end

			local var_522_5 = 0

			if var_522_5 < arg_519_1.time_ and arg_519_1.time_ <= var_522_5 + arg_522_0 then
				arg_519_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_522_6 = 0
			local var_522_7 = 0.425

			if var_522_6 < arg_519_1.time_ and arg_519_1.time_ <= var_522_6 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_8 = arg_519_1:FormatText(StoryNameCfg[9].name)

				arg_519_1.leftNameTxt_.text = var_522_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_9 = arg_519_1:GetWordFromCfg(103903130)
				local var_522_10 = arg_519_1:FormatText(var_522_9.content)

				arg_519_1.text_.text = var_522_10

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_11 = 17
				local var_522_12 = utf8.len(var_522_10)
				local var_522_13 = var_522_11 <= 0 and var_522_7 or var_522_7 * (var_522_12 / var_522_11)

				if var_522_13 > 0 and var_522_7 < var_522_13 then
					arg_519_1.talkMaxDuration = var_522_13

					if var_522_13 + var_522_6 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_13 + var_522_6
					end
				end

				arg_519_1.text_.text = var_522_10
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903130", "story_v_side_old_103903.awb") ~= 0 then
					local var_522_14 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903130", "story_v_side_old_103903.awb") / 1000

					if var_522_14 + var_522_6 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_14 + var_522_6
					end

					if var_522_9.prefab_name ~= "" and arg_519_1.actors_[var_522_9.prefab_name] ~= nil then
						local var_522_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_9.prefab_name].transform, "story_v_side_old_103903", "103903130", "story_v_side_old_103903.awb")

						arg_519_1:RecordAudio("103903130", var_522_15)
						arg_519_1:RecordAudio("103903130", var_522_15)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903130", "story_v_side_old_103903.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903130", "story_v_side_old_103903.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_16 = math.max(var_522_7, arg_519_1.talkMaxDuration)

			if var_522_6 <= arg_519_1.time_ and arg_519_1.time_ < var_522_6 + var_522_16 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_6) / var_522_16

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_6 + var_522_16 and arg_519_1.time_ < var_522_6 + var_522_16 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play103903131 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 103903131
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play103903132(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = 0
			local var_526_1 = 0.275

			if var_526_0 < arg_523_1.time_ and arg_523_1.time_ <= var_526_0 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, false)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_2 = arg_523_1:GetWordFromCfg(103903131)
				local var_526_3 = arg_523_1:FormatText(var_526_2.content)

				arg_523_1.text_.text = var_526_3

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_4 = 11
				local var_526_5 = utf8.len(var_526_3)
				local var_526_6 = var_526_4 <= 0 and var_526_1 or var_526_1 * (var_526_5 / var_526_4)

				if var_526_6 > 0 and var_526_1 < var_526_6 then
					arg_523_1.talkMaxDuration = var_526_6

					if var_526_6 + var_526_0 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_6 + var_526_0
					end
				end

				arg_523_1.text_.text = var_526_3
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_7 = math.max(var_526_1, arg_523_1.talkMaxDuration)

			if var_526_0 <= arg_523_1.time_ and arg_523_1.time_ < var_526_0 + var_526_7 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_0) / var_526_7

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_0 + var_526_7 and arg_523_1.time_ < var_526_0 + var_526_7 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play103903132 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 103903132
		arg_527_1.duration_ = 5.366

		local var_527_0 = {
			ja = 5.366,
			ko = 3.4,
			zh = 3.4,
			en = 1.5
		}
		local var_527_1 = manager.audio:GetLocalizationFlag()

		if var_527_0[var_527_1] ~= nil then
			arg_527_1.duration_ = var_527_0[var_527_1]
		end

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play103903133(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0

			if var_530_0 < arg_527_1.time_ and arg_527_1.time_ <= var_530_0 + arg_530_0 then
				arg_527_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_530_1 = 0
			local var_530_2 = 0.275

			if var_530_1 < arg_527_1.time_ and arg_527_1.time_ <= var_530_1 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_3 = arg_527_1:FormatText(StoryNameCfg[9].name)

				arg_527_1.leftNameTxt_.text = var_530_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_4 = arg_527_1:GetWordFromCfg(103903132)
				local var_530_5 = arg_527_1:FormatText(var_530_4.content)

				arg_527_1.text_.text = var_530_5

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_6 = 11
				local var_530_7 = utf8.len(var_530_5)
				local var_530_8 = var_530_6 <= 0 and var_530_2 or var_530_2 * (var_530_7 / var_530_6)

				if var_530_8 > 0 and var_530_2 < var_530_8 then
					arg_527_1.talkMaxDuration = var_530_8

					if var_530_8 + var_530_1 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_8 + var_530_1
					end
				end

				arg_527_1.text_.text = var_530_5
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903132", "story_v_side_old_103903.awb") ~= 0 then
					local var_530_9 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903132", "story_v_side_old_103903.awb") / 1000

					if var_530_9 + var_530_1 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_9 + var_530_1
					end

					if var_530_4.prefab_name ~= "" and arg_527_1.actors_[var_530_4.prefab_name] ~= nil then
						local var_530_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_527_1.actors_[var_530_4.prefab_name].transform, "story_v_side_old_103903", "103903132", "story_v_side_old_103903.awb")

						arg_527_1:RecordAudio("103903132", var_530_10)
						arg_527_1:RecordAudio("103903132", var_530_10)
					else
						arg_527_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903132", "story_v_side_old_103903.awb")
					end

					arg_527_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903132", "story_v_side_old_103903.awb")
				end

				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_11 = math.max(var_530_2, arg_527_1.talkMaxDuration)

			if var_530_1 <= arg_527_1.time_ and arg_527_1.time_ < var_530_1 + var_530_11 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_1) / var_530_11

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_1 + var_530_11 and arg_527_1.time_ < var_530_1 + var_530_11 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play103903133 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 103903133
		arg_531_1.duration_ = 0.100000001489

		SetActive(arg_531_1.tipsGo_, true)

		arg_531_1.tipsText_.text = StoryTipsCfg[103901].name

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"

			SetActive(arg_531_1.choicesGo_, true)

			for iter_532_0, iter_532_1 in ipairs(arg_531_1.choices_) do
				local var_532_0 = iter_532_0 <= 2

				SetActive(iter_532_1.go, var_532_0)
			end

			arg_531_1.choices_[1].txt.text = arg_531_1:FormatText(StoryChoiceCfg[76].name)
			arg_531_1.choices_[2].txt.text = arg_531_1:FormatText(StoryChoiceCfg[77].name)
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				PlayerAction.UseStoryTrigger(1039012, 210390103, 103903133, 1)
				arg_531_0:Play103903134(arg_531_1)
			end

			if arg_533_0 == 2 then
				arg_531_0:Play103903137(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["1039ui_story"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 and arg_531_1.var_.characterEffect1039ui_story == nil then
				arg_531_1.var_.characterEffect1039ui_story = var_534_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_534_2 = 0.1

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2

				if arg_531_1.var_.characterEffect1039ui_story then
					local var_534_4 = Mathf.Lerp(0, 0.5, var_534_3)

					arg_531_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_531_1.var_.characterEffect1039ui_story.fillRatio = var_534_4
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 and arg_531_1.var_.characterEffect1039ui_story then
				local var_534_5 = 0.5

				arg_531_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_531_1.var_.characterEffect1039ui_story.fillRatio = var_534_5
			end
		end
	end,
	Play103903134 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 103903134
		arg_535_1.duration_ = 5

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play103903135(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1039ui_story"].transform
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 then
				arg_535_1.var_.moveOldPos1039ui_story = var_538_0.localPosition
			end

			local var_538_2 = 0.001

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2
				local var_538_4 = Vector3.New(10, -1.06, -5.3)

				var_538_0.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos1039ui_story, var_538_4, var_538_3)

				local var_538_5 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_5.x, var_538_5.y, var_538_5.z)

				local var_538_6 = var_538_0.localEulerAngles

				var_538_6.z = 0
				var_538_6.x = 0
				var_538_0.localEulerAngles = var_538_6
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 then
				var_538_0.localPosition = Vector3.New(10, -1.06, -5.3)

				local var_538_7 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_7.x, var_538_7.y, var_538_7.z)

				local var_538_8 = var_538_0.localEulerAngles

				var_538_8.z = 0
				var_538_8.x = 0
				var_538_0.localEulerAngles = var_538_8
			end

			local var_538_9 = 0
			local var_538_10 = 0.225

			if var_538_9 < arg_535_1.time_ and arg_535_1.time_ <= var_538_9 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, false)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_11 = arg_535_1:GetWordFromCfg(103903134)
				local var_538_12 = arg_535_1:FormatText(var_538_11.content)

				arg_535_1.text_.text = var_538_12

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_13 = 9
				local var_538_14 = utf8.len(var_538_12)
				local var_538_15 = var_538_13 <= 0 and var_538_10 or var_538_10 * (var_538_14 / var_538_13)

				if var_538_15 > 0 and var_538_10 < var_538_15 then
					arg_535_1.talkMaxDuration = var_538_15

					if var_538_15 + var_538_9 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_15 + var_538_9
					end
				end

				arg_535_1.text_.text = var_538_12
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)
				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_16 = math.max(var_538_10, arg_535_1.talkMaxDuration)

			if var_538_9 <= arg_535_1.time_ and arg_535_1.time_ < var_538_9 + var_538_16 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_9) / var_538_16

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_9 + var_538_16 and arg_535_1.time_ < var_538_9 + var_538_16 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play103903135 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 103903135
		arg_539_1.duration_ = 5

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play103903136(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0
			local var_542_1 = 0.825

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, false)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_2 = arg_539_1:GetWordFromCfg(103903135)
				local var_542_3 = arg_539_1:FormatText(var_542_2.content)

				arg_539_1.text_.text = var_542_3

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_4 = 33
				local var_542_5 = utf8.len(var_542_3)
				local var_542_6 = var_542_4 <= 0 and var_542_1 or var_542_1 * (var_542_5 / var_542_4)

				if var_542_6 > 0 and var_542_1 < var_542_6 then
					arg_539_1.talkMaxDuration = var_542_6

					if var_542_6 + var_542_0 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_6 + var_542_0
					end
				end

				arg_539_1.text_.text = var_542_3
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)
				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_7 = math.max(var_542_1, arg_539_1.talkMaxDuration)

			if var_542_0 <= arg_539_1.time_ and arg_539_1.time_ < var_542_0 + var_542_7 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_0) / var_542_7

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_0 + var_542_7 and arg_539_1.time_ < var_542_0 + var_542_7 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play103903136 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 103903136
		arg_543_1.duration_ = 7.149999999998

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play103903142(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action468")
			end

			local var_546_1 = 0
			local var_546_2 = 0.325

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_3 = arg_543_1:FormatText(StoryNameCfg[7].name)

				arg_543_1.leftNameTxt_.text = var_546_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_4 = arg_543_1:GetWordFromCfg(103903136)
				local var_546_5 = arg_543_1:FormatText(var_546_4.content)

				arg_543_1.text_.text = var_546_5

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_6 = 13
				local var_546_7 = utf8.len(var_546_5)
				local var_546_8 = var_546_6 <= 0 and var_546_2 or var_546_2 * (var_546_7 / var_546_6)

				if var_546_8 > 0 and var_546_2 < var_546_8 then
					arg_543_1.talkMaxDuration = var_546_8

					if var_546_8 + var_546_1 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_8 + var_546_1
					end
				end

				arg_543_1.text_.text = var_546_5
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_9 = math.max(var_546_2, arg_543_1.talkMaxDuration)

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_9 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_1) / var_546_9

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_1 + var_546_9 and arg_543_1.time_ < var_546_1 + var_546_9 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play103903142 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 103903142
		arg_547_1.duration_ = 5

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play103903143(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = arg_547_1.actors_["1039ui_story"]
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 and arg_547_1.var_.characterEffect1039ui_story == nil then
				arg_547_1.var_.characterEffect1039ui_story = var_550_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_550_2 = 0.1

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_2 then
				local var_550_3 = (arg_547_1.time_ - var_550_1) / var_550_2

				if arg_547_1.var_.characterEffect1039ui_story then
					local var_550_4 = Mathf.Lerp(0, 0.5, var_550_3)

					arg_547_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_547_1.var_.characterEffect1039ui_story.fillRatio = var_550_4
				end
			end

			if arg_547_1.time_ >= var_550_1 + var_550_2 and arg_547_1.time_ < var_550_1 + var_550_2 + arg_550_0 and arg_547_1.var_.characterEffect1039ui_story then
				local var_550_5 = 0.5

				arg_547_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_547_1.var_.characterEffect1039ui_story.fillRatio = var_550_5
			end

			local var_550_6 = 0
			local var_550_7 = 0.7

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

				local var_550_9 = arg_547_1:GetWordFromCfg(103903142)
				local var_550_10 = arg_547_1:FormatText(var_550_9.content)

				arg_547_1.text_.text = var_550_10

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_11 = 28
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
	Play103903143 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 103903143
		arg_551_1.duration_ = 7.5

		local var_551_0 = {
			ja = 7.5,
			ko = 3.466,
			zh = 3.466,
			en = 4.133
		}
		local var_551_1 = manager.audio:GetLocalizationFlag()

		if var_551_0[var_551_1] ~= nil then
			arg_551_1.duration_ = var_551_0[var_551_1]
		end

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play103903144(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["1039ui_story"]
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 and arg_551_1.var_.characterEffect1039ui_story == nil then
				arg_551_1.var_.characterEffect1039ui_story = var_554_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_2 = 0.1

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2

				if arg_551_1.var_.characterEffect1039ui_story then
					arg_551_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 and arg_551_1.var_.characterEffect1039ui_story then
				arg_551_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_554_4 = arg_551_1.actors_["1039ui_story"].transform
			local var_554_5 = 0

			if var_554_5 < arg_551_1.time_ and arg_551_1.time_ <= var_554_5 + arg_554_0 then
				arg_551_1.var_.moveOldPos1039ui_story = var_554_4.localPosition
			end

			local var_554_6 = 0.001

			if var_554_5 <= arg_551_1.time_ and arg_551_1.time_ < var_554_5 + var_554_6 then
				local var_554_7 = (arg_551_1.time_ - var_554_5) / var_554_6
				local var_554_8 = Vector3.New(0, -1.06, -5.3)

				var_554_4.localPosition = Vector3.Lerp(arg_551_1.var_.moveOldPos1039ui_story, var_554_8, var_554_7)

				local var_554_9 = manager.ui.mainCamera.transform.position - var_554_4.position

				var_554_4.forward = Vector3.New(var_554_9.x, var_554_9.y, var_554_9.z)

				local var_554_10 = var_554_4.localEulerAngles

				var_554_10.z = 0
				var_554_10.x = 0
				var_554_4.localEulerAngles = var_554_10
			end

			if arg_551_1.time_ >= var_554_5 + var_554_6 and arg_551_1.time_ < var_554_5 + var_554_6 + arg_554_0 then
				var_554_4.localPosition = Vector3.New(0, -1.06, -5.3)

				local var_554_11 = manager.ui.mainCamera.transform.position - var_554_4.position

				var_554_4.forward = Vector3.New(var_554_11.x, var_554_11.y, var_554_11.z)

				local var_554_12 = var_554_4.localEulerAngles

				var_554_12.z = 0
				var_554_12.x = 0
				var_554_4.localEulerAngles = var_554_12
			end

			local var_554_13 = 0

			if var_554_13 < arg_551_1.time_ and arg_551_1.time_ <= var_554_13 + arg_554_0 then
				arg_551_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action484")
			end

			local var_554_14 = 0

			if var_554_14 < arg_551_1.time_ and arg_551_1.time_ <= var_554_14 + arg_554_0 then
				arg_551_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_554_15 = 0
			local var_554_16 = 0.45

			if var_554_15 < arg_551_1.time_ and arg_551_1.time_ <= var_554_15 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_17 = arg_551_1:FormatText(StoryNameCfg[9].name)

				arg_551_1.leftNameTxt_.text = var_554_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_18 = arg_551_1:GetWordFromCfg(103903143)
				local var_554_19 = arg_551_1:FormatText(var_554_18.content)

				arg_551_1.text_.text = var_554_19

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_20 = 18
				local var_554_21 = utf8.len(var_554_19)
				local var_554_22 = var_554_20 <= 0 and var_554_16 or var_554_16 * (var_554_21 / var_554_20)

				if var_554_22 > 0 and var_554_16 < var_554_22 then
					arg_551_1.talkMaxDuration = var_554_22

					if var_554_22 + var_554_15 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_22 + var_554_15
					end
				end

				arg_551_1.text_.text = var_554_19
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903143", "story_v_side_old_103903.awb") ~= 0 then
					local var_554_23 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903143", "story_v_side_old_103903.awb") / 1000

					if var_554_23 + var_554_15 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_23 + var_554_15
					end

					if var_554_18.prefab_name ~= "" and arg_551_1.actors_[var_554_18.prefab_name] ~= nil then
						local var_554_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_18.prefab_name].transform, "story_v_side_old_103903", "103903143", "story_v_side_old_103903.awb")

						arg_551_1:RecordAudio("103903143", var_554_24)
						arg_551_1:RecordAudio("103903143", var_554_24)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903143", "story_v_side_old_103903.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903143", "story_v_side_old_103903.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_25 = math.max(var_554_16, arg_551_1.talkMaxDuration)

			if var_554_15 <= arg_551_1.time_ and arg_551_1.time_ < var_554_15 + var_554_25 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_15) / var_554_25

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_15 + var_554_25 and arg_551_1.time_ < var_554_15 + var_554_25 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play103903144 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 103903144
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play103903145(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0
			local var_558_1 = 0.475

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

				local var_558_2 = arg_555_1:GetWordFromCfg(103903144)
				local var_558_3 = arg_555_1:FormatText(var_558_2.content)

				arg_555_1.text_.text = var_558_3

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_4 = 19
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
	Play103903145 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 103903145
		arg_559_1.duration_ = 4.833

		local var_559_0 = {
			ja = 4.833,
			ko = 3.733,
			zh = 3.733,
			en = 4.666
		}
		local var_559_1 = manager.audio:GetLocalizationFlag()

		if var_559_0[var_559_1] ~= nil then
			arg_559_1.duration_ = var_559_0[var_559_1]
		end

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
			arg_559_1.auto_ = false
		end

		function arg_559_1.playNext_(arg_561_0)
			arg_559_1.onStoryFinished_()
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 1

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				local var_562_2 = "play"
				local var_562_3 = "music"

				arg_559_1:AudioAction(var_562_2, var_562_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_562_4 = 0

			if var_562_4 < arg_559_1.time_ and arg_559_1.time_ <= var_562_4 + arg_562_0 then
				arg_559_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action442")
			end

			local var_562_5 = 0

			if var_562_5 < arg_559_1.time_ and arg_559_1.time_ <= var_562_5 + arg_562_0 then
				arg_559_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_562_6 = 0
			local var_562_7 = 0.425

			if var_562_6 < arg_559_1.time_ and arg_559_1.time_ <= var_562_6 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_8 = arg_559_1:FormatText(StoryNameCfg[9].name)

				arg_559_1.leftNameTxt_.text = var_562_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_9 = arg_559_1:GetWordFromCfg(103903145)
				local var_562_10 = arg_559_1:FormatText(var_562_9.content)

				arg_559_1.text_.text = var_562_10

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_11 = 17
				local var_562_12 = utf8.len(var_562_10)
				local var_562_13 = var_562_11 <= 0 and var_562_7 or var_562_7 * (var_562_12 / var_562_11)

				if var_562_13 > 0 and var_562_7 < var_562_13 then
					arg_559_1.talkMaxDuration = var_562_13

					if var_562_13 + var_562_6 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_13 + var_562_6
					end
				end

				arg_559_1.text_.text = var_562_10
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903145", "story_v_side_old_103903.awb") ~= 0 then
					local var_562_14 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903145", "story_v_side_old_103903.awb") / 1000

					if var_562_14 + var_562_6 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_14 + var_562_6
					end

					if var_562_9.prefab_name ~= "" and arg_559_1.actors_[var_562_9.prefab_name] ~= nil then
						local var_562_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_9.prefab_name].transform, "story_v_side_old_103903", "103903145", "story_v_side_old_103903.awb")

						arg_559_1:RecordAudio("103903145", var_562_15)
						arg_559_1:RecordAudio("103903145", var_562_15)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903145", "story_v_side_old_103903.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903145", "story_v_side_old_103903.awb")
				end

				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_16 = math.max(var_562_7, arg_559_1.talkMaxDuration)

			if var_562_6 <= arg_559_1.time_ and arg_559_1.time_ < var_562_6 + var_562_16 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_6) / var_562_16

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_6 + var_562_16 and arg_559_1.time_ < var_562_6 + var_562_16 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play103903137 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 103903137
		arg_563_1.duration_ = 3.6

		local var_563_0 = {
			ja = 2.266,
			ko = 2.533,
			zh = 2.533,
			en = 3.6
		}
		local var_563_1 = manager.audio:GetLocalizationFlag()

		if var_563_0[var_563_1] ~= nil then
			arg_563_1.duration_ = var_563_0[var_563_1]
		end

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play103903138(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = arg_563_1.actors_["1039ui_story"]
			local var_566_1 = 0

			if var_566_1 < arg_563_1.time_ and arg_563_1.time_ <= var_566_1 + arg_566_0 and arg_563_1.var_.characterEffect1039ui_story == nil then
				arg_563_1.var_.characterEffect1039ui_story = var_566_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_566_2 = 0.1

			if var_566_1 <= arg_563_1.time_ and arg_563_1.time_ < var_566_1 + var_566_2 then
				local var_566_3 = (arg_563_1.time_ - var_566_1) / var_566_2

				if arg_563_1.var_.characterEffect1039ui_story then
					arg_563_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_563_1.time_ >= var_566_1 + var_566_2 and arg_563_1.time_ < var_566_1 + var_566_2 + arg_566_0 and arg_563_1.var_.characterEffect1039ui_story then
				arg_563_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_566_4 = 0

			if var_566_4 < arg_563_1.time_ and arg_563_1.time_ <= var_566_4 + arg_566_0 then
				arg_563_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action463")
			end

			local var_566_5 = 0

			if var_566_5 < arg_563_1.time_ and arg_563_1.time_ <= var_566_5 + arg_566_0 then
				arg_563_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_566_6 = 0
			local var_566_7 = 0.2

			if var_566_6 < arg_563_1.time_ and arg_563_1.time_ <= var_566_6 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_8 = arg_563_1:FormatText(StoryNameCfg[9].name)

				arg_563_1.leftNameTxt_.text = var_566_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_9 = arg_563_1:GetWordFromCfg(103903137)
				local var_566_10 = arg_563_1:FormatText(var_566_9.content)

				arg_563_1.text_.text = var_566_10

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_11 = 8
				local var_566_12 = utf8.len(var_566_10)
				local var_566_13 = var_566_11 <= 0 and var_566_7 or var_566_7 * (var_566_12 / var_566_11)

				if var_566_13 > 0 and var_566_7 < var_566_13 then
					arg_563_1.talkMaxDuration = var_566_13

					if var_566_13 + var_566_6 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_13 + var_566_6
					end
				end

				arg_563_1.text_.text = var_566_10
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903137", "story_v_side_old_103903.awb") ~= 0 then
					local var_566_14 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903137", "story_v_side_old_103903.awb") / 1000

					if var_566_14 + var_566_6 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_14 + var_566_6
					end

					if var_566_9.prefab_name ~= "" and arg_563_1.actors_[var_566_9.prefab_name] ~= nil then
						local var_566_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_563_1.actors_[var_566_9.prefab_name].transform, "story_v_side_old_103903", "103903137", "story_v_side_old_103903.awb")

						arg_563_1:RecordAudio("103903137", var_566_15)
						arg_563_1:RecordAudio("103903137", var_566_15)
					else
						arg_563_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903137", "story_v_side_old_103903.awb")
					end

					arg_563_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903137", "story_v_side_old_103903.awb")
				end

				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_16 = math.max(var_566_7, arg_563_1.talkMaxDuration)

			if var_566_6 <= arg_563_1.time_ and arg_563_1.time_ < var_566_6 + var_566_16 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_6) / var_566_16

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_6 + var_566_16 and arg_563_1.time_ < var_566_6 + var_566_16 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play103903138 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 103903138
		arg_567_1.duration_ = 5

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play103903139(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0
			local var_570_1 = 1.025

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

				local var_570_2 = arg_567_1:GetWordFromCfg(103903138)
				local var_570_3 = arg_567_1:FormatText(var_570_2.content)

				arg_567_1.text_.text = var_570_3

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_4 = 41
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
	Play103903139 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 103903139
		arg_571_1.duration_ = 5

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play103903140(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["1039ui_story"]
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 and arg_571_1.var_.characterEffect1039ui_story == nil then
				arg_571_1.var_.characterEffect1039ui_story = var_574_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_2 = 0.1

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2

				if arg_571_1.var_.characterEffect1039ui_story then
					local var_574_4 = Mathf.Lerp(0, 0.5, var_574_3)

					arg_571_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_571_1.var_.characterEffect1039ui_story.fillRatio = var_574_4
				end
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 and arg_571_1.var_.characterEffect1039ui_story then
				local var_574_5 = 0.5

				arg_571_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_571_1.var_.characterEffect1039ui_story.fillRatio = var_574_5
			end

			local var_574_6 = 0
			local var_574_7 = 0.4

			if var_574_6 < arg_571_1.time_ and arg_571_1.time_ <= var_574_6 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_8 = arg_571_1:FormatText(StoryNameCfg[7].name)

				arg_571_1.leftNameTxt_.text = var_574_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_9 = arg_571_1:GetWordFromCfg(103903139)
				local var_574_10 = arg_571_1:FormatText(var_574_9.content)

				arg_571_1.text_.text = var_574_10

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_11 = 16
				local var_574_12 = utf8.len(var_574_10)
				local var_574_13 = var_574_11 <= 0 and var_574_7 or var_574_7 * (var_574_12 / var_574_11)

				if var_574_13 > 0 and var_574_7 < var_574_13 then
					arg_571_1.talkMaxDuration = var_574_13

					if var_574_13 + var_574_6 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_13 + var_574_6
					end
				end

				arg_571_1.text_.text = var_574_10
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_14 = math.max(var_574_7, arg_571_1.talkMaxDuration)

			if var_574_6 <= arg_571_1.time_ and arg_571_1.time_ < var_574_6 + var_574_14 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_6) / var_574_14

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_6 + var_574_14 and arg_571_1.time_ < var_574_6 + var_574_14 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play103903140 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 103903140
		arg_575_1.duration_ = 5

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play103903141(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = 0
			local var_578_1 = 0.275

			if var_578_0 < arg_575_1.time_ and arg_575_1.time_ <= var_578_0 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, false)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_2 = arg_575_1:GetWordFromCfg(103903140)
				local var_578_3 = arg_575_1:FormatText(var_578_2.content)

				arg_575_1.text_.text = var_578_3

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_4 = 11
				local var_578_5 = utf8.len(var_578_3)
				local var_578_6 = var_578_4 <= 0 and var_578_1 or var_578_1 * (var_578_5 / var_578_4)

				if var_578_6 > 0 and var_578_1 < var_578_6 then
					arg_575_1.talkMaxDuration = var_578_6

					if var_578_6 + var_578_0 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_6 + var_578_0
					end
				end

				arg_575_1.text_.text = var_578_3
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)
				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_7 = math.max(var_578_1, arg_575_1.talkMaxDuration)

			if var_578_0 <= arg_575_1.time_ and arg_575_1.time_ < var_578_0 + var_578_7 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_0) / var_578_7

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_0 + var_578_7 and arg_575_1.time_ < var_578_0 + var_578_7 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play103903141 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 103903141
		arg_579_1.duration_ = 5.366

		local var_579_0 = {
			ja = 5.366,
			ko = 3.933,
			zh = 3.933,
			en = 3.433
		}
		local var_579_1 = manager.audio:GetLocalizationFlag()

		if var_579_0[var_579_1] ~= nil then
			arg_579_1.duration_ = var_579_0[var_579_1]
		end

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play103903142(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = arg_579_1.actors_["1039ui_story"]
			local var_582_1 = 0

			if var_582_1 < arg_579_1.time_ and arg_579_1.time_ <= var_582_1 + arg_582_0 and arg_579_1.var_.characterEffect1039ui_story == nil then
				arg_579_1.var_.characterEffect1039ui_story = var_582_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_2 = 0.1

			if var_582_1 <= arg_579_1.time_ and arg_579_1.time_ < var_582_1 + var_582_2 then
				local var_582_3 = (arg_579_1.time_ - var_582_1) / var_582_2

				if arg_579_1.var_.characterEffect1039ui_story then
					arg_579_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_579_1.time_ >= var_582_1 + var_582_2 and arg_579_1.time_ < var_582_1 + var_582_2 + arg_582_0 and arg_579_1.var_.characterEffect1039ui_story then
				arg_579_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_582_4 = 0

			if var_582_4 < arg_579_1.time_ and arg_579_1.time_ <= var_582_4 + arg_582_0 then
				arg_579_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action438")
			end

			local var_582_5 = 0

			if var_582_5 < arg_579_1.time_ and arg_579_1.time_ <= var_582_5 + arg_582_0 then
				arg_579_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_582_6 = 0
			local var_582_7 = 0.275

			if var_582_6 < arg_579_1.time_ and arg_579_1.time_ <= var_582_6 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_8 = arg_579_1:FormatText(StoryNameCfg[9].name)

				arg_579_1.leftNameTxt_.text = var_582_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_9 = arg_579_1:GetWordFromCfg(103903141)
				local var_582_10 = arg_579_1:FormatText(var_582_9.content)

				arg_579_1.text_.text = var_582_10

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_11 = 11
				local var_582_12 = utf8.len(var_582_10)
				local var_582_13 = var_582_11 <= 0 and var_582_7 or var_582_7 * (var_582_12 / var_582_11)

				if var_582_13 > 0 and var_582_7 < var_582_13 then
					arg_579_1.talkMaxDuration = var_582_13

					if var_582_13 + var_582_6 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_13 + var_582_6
					end
				end

				arg_579_1.text_.text = var_582_10
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103903", "103903141", "story_v_side_old_103903.awb") ~= 0 then
					local var_582_14 = manager.audio:GetVoiceLength("story_v_side_old_103903", "103903141", "story_v_side_old_103903.awb") / 1000

					if var_582_14 + var_582_6 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_14 + var_582_6
					end

					if var_582_9.prefab_name ~= "" and arg_579_1.actors_[var_582_9.prefab_name] ~= nil then
						local var_582_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_579_1.actors_[var_582_9.prefab_name].transform, "story_v_side_old_103903", "103903141", "story_v_side_old_103903.awb")

						arg_579_1:RecordAudio("103903141", var_582_15)
						arg_579_1:RecordAudio("103903141", var_582_15)
					else
						arg_579_1:AudioAction("play", "voice", "story_v_side_old_103903", "103903141", "story_v_side_old_103903.awb")
					end

					arg_579_1:RecordHistoryTalkVoice("story_v_side_old_103903", "103903141", "story_v_side_old_103903.awb")
				end

				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_16 = math.max(var_582_7, arg_579_1.talkMaxDuration)

			if var_582_6 <= arg_579_1.time_ and arg_579_1.time_ < var_582_6 + var_582_16 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_6) / var_582_16

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_6 + var_582_16 and arg_579_1.time_ < var_582_6 + var_582_16 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D04a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01"
	},
	voices = {
		"story_v_side_old_103903.awb"
	}
}
