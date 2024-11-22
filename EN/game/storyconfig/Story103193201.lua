return {
	Play319321001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319321001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319321002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I12f"

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
				local var_4_5 = arg_1_1.bgs_.I12f

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
					if iter_4_0 ~= "I12f" then
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

			local var_4_22 = 0.133333333333333
			local var_4_23 = 0.966666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock.awb")
			end

			local var_4_26 = 0
			local var_4_27 = 0.1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
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

				local var_4_33 = arg_1_1:GetWordFromCfg(319321001)
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
	Play319321002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319321002
		arg_7_1.duration_ = 9.066

		local var_7_0 = {
			zh = 5.033,
			ja = 9.066
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
				arg_7_0:Play319321003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "4040ui_story"

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

			local var_10_4 = arg_7_1.actors_["4040ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos4040ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -1.55, -5.5)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos4040ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["4040ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect4040ui_story == nil then
				arg_7_1.var_.characterEffect4040ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect4040ui_story then
					arg_7_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect4040ui_story then
				arg_7_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.55

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[668].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(319321002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 22
				local var_10_25 = utf8.len(var_10_23)
				local var_10_26 = var_10_24 <= 0 and var_10_20 or var_10_20 * (var_10_25 / var_10_24)

				if var_10_26 > 0 and var_10_20 < var_10_26 then
					arg_7_1.talkMaxDuration = var_10_26

					if var_10_26 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_26 + var_10_19
					end
				end

				arg_7_1.text_.text = var_10_23
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321002", "story_v_out_319321.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_319321", "319321002", "story_v_out_319321.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_319321", "319321002", "story_v_out_319321.awb")

						arg_7_1:RecordAudio("319321002", var_10_28)
						arg_7_1:RecordAudio("319321002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319321", "319321002", "story_v_out_319321.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319321", "319321002", "story_v_out_319321.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_29 = math.max(var_10_20, arg_7_1.talkMaxDuration)

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_29 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_19) / var_10_29

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_19 + var_10_29 and arg_7_1.time_ < var_10_19 + var_10_29 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319321003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319321003
		arg_11_1.duration_ = 1.266

		local var_11_0 = {
			zh = 1.233,
			ja = 1.266
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
				arg_11_0:Play319321004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["4040ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect4040ui_story == nil then
				arg_11_1.var_.characterEffect4040ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect4040ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_11_1.var_.characterEffect4040ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect4040ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_11_1.var_.characterEffect4040ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.05

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[694].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(319321003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321003", "story_v_out_319321.awb") ~= 0 then
					local var_14_14 = manager.audio:GetVoiceLength("story_v_out_319321", "319321003", "story_v_out_319321.awb") / 1000

					if var_14_14 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_6
					end

					if var_14_9.prefab_name ~= "" and arg_11_1.actors_[var_14_9.prefab_name] ~= nil then
						local var_14_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_9.prefab_name].transform, "story_v_out_319321", "319321003", "story_v_out_319321.awb")

						arg_11_1:RecordAudio("319321003", var_14_15)
						arg_11_1:RecordAudio("319321003", var_14_15)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319321", "319321003", "story_v_out_319321.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319321", "319321003", "story_v_out_319321.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_16 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_16 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_16

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_16 and arg_11_1.time_ < var_14_6 + var_14_16 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319321004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319321004
		arg_15_1.duration_ = 6.866

		local var_15_0 = {
			zh = 4.333,
			ja = 6.866
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
				arg_15_0:Play319321005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["4040ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect4040ui_story == nil then
				arg_15_1.var_.characterEffect4040ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect4040ui_story then
					arg_15_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect4040ui_story then
				arg_15_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_18_4 = 0

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_6 = 0
			local var_18_7 = 0.45

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[668].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(319321004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321004", "story_v_out_319321.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_319321", "319321004", "story_v_out_319321.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_319321", "319321004", "story_v_out_319321.awb")

						arg_15_1:RecordAudio("319321004", var_18_15)
						arg_15_1:RecordAudio("319321004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319321", "319321004", "story_v_out_319321.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319321", "319321004", "story_v_out_319321.awb")
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
	Play319321005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319321005
		arg_19_1.duration_ = 8.233

		local var_19_0 = {
			zh = 7.466,
			ja = 8.233
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
				arg_19_0:Play319321006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["4040ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect4040ui_story == nil then
				arg_19_1.var_.characterEffect4040ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect4040ui_story then
					arg_19_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect4040ui_story then
				arg_19_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_22_4 = 0
			local var_22_5 = 0.925

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_6 = arg_19_1:FormatText(StoryNameCfg[668].name)

				arg_19_1.leftNameTxt_.text = var_22_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_7 = arg_19_1:GetWordFromCfg(319321005)
				local var_22_8 = arg_19_1:FormatText(var_22_7.content)

				arg_19_1.text_.text = var_22_8

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_9 = 37
				local var_22_10 = utf8.len(var_22_8)
				local var_22_11 = var_22_9 <= 0 and var_22_5 or var_22_5 * (var_22_10 / var_22_9)

				if var_22_11 > 0 and var_22_5 < var_22_11 then
					arg_19_1.talkMaxDuration = var_22_11

					if var_22_11 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_11 + var_22_4
					end
				end

				arg_19_1.text_.text = var_22_8
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321005", "story_v_out_319321.awb") ~= 0 then
					local var_22_12 = manager.audio:GetVoiceLength("story_v_out_319321", "319321005", "story_v_out_319321.awb") / 1000

					if var_22_12 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_12 + var_22_4
					end

					if var_22_7.prefab_name ~= "" and arg_19_1.actors_[var_22_7.prefab_name] ~= nil then
						local var_22_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_7.prefab_name].transform, "story_v_out_319321", "319321005", "story_v_out_319321.awb")

						arg_19_1:RecordAudio("319321005", var_22_13)
						arg_19_1:RecordAudio("319321005", var_22_13)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319321", "319321005", "story_v_out_319321.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319321", "319321005", "story_v_out_319321.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_5, arg_19_1.talkMaxDuration)

			if var_22_4 <= arg_19_1.time_ and arg_19_1.time_ < var_22_4 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_4) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_4 + var_22_14 and arg_19_1.time_ < var_22_4 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319321006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319321006
		arg_23_1.duration_ = 3.333

		local var_23_0 = {
			zh = 3.333,
			ja = 3.133
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
				arg_23_0:Play319321007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "10079ui_story"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("Char/" .. var_26_0), arg_23_1.stage_.transform)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_0] = var_26_1

				local var_26_2 = var_26_1:GetComponentInChildren(typeof(CharacterEffect))

				var_26_2.enabled = true

				local var_26_3 = GameObjectTools.GetOrAddComponent(var_26_1, typeof(DynamicBoneHelper))

				if var_26_3 then
					var_26_3:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_2.transform, false)

				arg_23_1.var_[var_26_0 .. "Animator"] = var_26_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_0 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_0 .. "LipSync"] = var_26_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_4 = arg_23_1.actors_["10079ui_story"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos10079ui_story = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(0.7, -0.95, -6.05)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10079ui_story, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = arg_23_1.actors_["10079ui_story"]
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 and arg_23_1.var_.characterEffect10079ui_story == nil then
				arg_23_1.var_.characterEffect10079ui_story = var_26_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_15 = 0.200000002980232

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15

				if arg_23_1.var_.characterEffect10079ui_story then
					arg_23_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 and arg_23_1.var_.characterEffect10079ui_story then
				arg_23_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_26_17 = 0

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 then
				arg_23_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_26_18 = 0

			if var_26_18 < arg_23_1.time_ and arg_23_1.time_ <= var_26_18 + arg_26_0 then
				arg_23_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_19 = arg_23_1.actors_["4040ui_story"].transform
			local var_26_20 = 0

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.var_.moveOldPos4040ui_story = var_26_19.localPosition
			end

			local var_26_21 = 0.001

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_21 then
				local var_26_22 = (arg_23_1.time_ - var_26_20) / var_26_21
				local var_26_23 = Vector3.New(-0.7, -1.55, -5.5)

				var_26_19.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos4040ui_story, var_26_23, var_26_22)

				local var_26_24 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_24.x, var_26_24.y, var_26_24.z)

				local var_26_25 = var_26_19.localEulerAngles

				var_26_25.z = 0
				var_26_25.x = 0
				var_26_19.localEulerAngles = var_26_25
			end

			if arg_23_1.time_ >= var_26_20 + var_26_21 and arg_23_1.time_ < var_26_20 + var_26_21 + arg_26_0 then
				var_26_19.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_26_26 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_26.x, var_26_26.y, var_26_26.z)

				local var_26_27 = var_26_19.localEulerAngles

				var_26_27.z = 0
				var_26_27.x = 0
				var_26_19.localEulerAngles = var_26_27
			end

			local var_26_28 = arg_23_1.actors_["4040ui_story"]
			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 and arg_23_1.var_.characterEffect4040ui_story == nil then
				arg_23_1.var_.characterEffect4040ui_story = var_26_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_30 = 0.200000002980232

			if var_26_29 <= arg_23_1.time_ and arg_23_1.time_ < var_26_29 + var_26_30 then
				local var_26_31 = (arg_23_1.time_ - var_26_29) / var_26_30

				if arg_23_1.var_.characterEffect4040ui_story then
					local var_26_32 = Mathf.Lerp(0, 0.5, var_26_31)

					arg_23_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_23_1.var_.characterEffect4040ui_story.fillRatio = var_26_32
				end
			end

			if arg_23_1.time_ >= var_26_29 + var_26_30 and arg_23_1.time_ < var_26_29 + var_26_30 + arg_26_0 and arg_23_1.var_.characterEffect4040ui_story then
				local var_26_33 = 0.5

				arg_23_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_23_1.var_.characterEffect4040ui_story.fillRatio = var_26_33
			end

			local var_26_34 = 0
			local var_26_35 = 0.05

			if var_26_34 < arg_23_1.time_ and arg_23_1.time_ <= var_26_34 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_36 = arg_23_1:FormatText(StoryNameCfg[6].name)

				arg_23_1.leftNameTxt_.text = var_26_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_37 = arg_23_1:GetWordFromCfg(319321006)
				local var_26_38 = arg_23_1:FormatText(var_26_37.content)

				arg_23_1.text_.text = var_26_38

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_39 = 2
				local var_26_40 = utf8.len(var_26_38)
				local var_26_41 = var_26_39 <= 0 and var_26_35 or var_26_35 * (var_26_40 / var_26_39)

				if var_26_41 > 0 and var_26_35 < var_26_41 then
					arg_23_1.talkMaxDuration = var_26_41

					if var_26_41 + var_26_34 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_41 + var_26_34
					end
				end

				arg_23_1.text_.text = var_26_38
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321006", "story_v_out_319321.awb") ~= 0 then
					local var_26_42 = manager.audio:GetVoiceLength("story_v_out_319321", "319321006", "story_v_out_319321.awb") / 1000

					if var_26_42 + var_26_34 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_42 + var_26_34
					end

					if var_26_37.prefab_name ~= "" and arg_23_1.actors_[var_26_37.prefab_name] ~= nil then
						local var_26_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_37.prefab_name].transform, "story_v_out_319321", "319321006", "story_v_out_319321.awb")

						arg_23_1:RecordAudio("319321006", var_26_43)
						arg_23_1:RecordAudio("319321006", var_26_43)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319321", "319321006", "story_v_out_319321.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319321", "319321006", "story_v_out_319321.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_44 = math.max(var_26_35, arg_23_1.talkMaxDuration)

			if var_26_34 <= arg_23_1.time_ and arg_23_1.time_ < var_26_34 + var_26_44 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_34) / var_26_44

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_34 + var_26_44 and arg_23_1.time_ < var_26_34 + var_26_44 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319321007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319321007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play319321008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10079ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect10079ui_story == nil then
				arg_27_1.var_.characterEffect10079ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect10079ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_27_1.var_.characterEffect10079ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect10079ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_27_1.var_.characterEffect10079ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 1

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_8 = arg_27_1:GetWordFromCfg(319321007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 40
				local var_30_11 = utf8.len(var_30_9)
				local var_30_12 = var_30_10 <= 0 and var_30_7 or var_30_7 * (var_30_11 / var_30_10)

				if var_30_12 > 0 and var_30_7 < var_30_12 then
					arg_27_1.talkMaxDuration = var_30_12

					if var_30_12 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_9
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_13 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_13 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_13

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_13 and arg_27_1.time_ < var_30_6 + var_30_13 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319321008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319321008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play319321009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.85

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

				local var_34_2 = arg_31_1:GetWordFromCfg(319321008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 34
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
	Play319321009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319321009
		arg_35_1.duration_ = 4.7

		local var_35_0 = {
			zh = 4.7,
			ja = 2.4
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
				arg_35_0:Play319321010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["4040ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect4040ui_story == nil then
				arg_35_1.var_.characterEffect4040ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect4040ui_story then
					arg_35_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect4040ui_story then
				arg_35_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_38_4 = 0
			local var_38_5 = 0.475

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_6 = arg_35_1:FormatText(StoryNameCfg[668].name)

				arg_35_1.leftNameTxt_.text = var_38_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_7 = arg_35_1:GetWordFromCfg(319321009)
				local var_38_8 = arg_35_1:FormatText(var_38_7.content)

				arg_35_1.text_.text = var_38_8

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_9 = 19
				local var_38_10 = utf8.len(var_38_8)
				local var_38_11 = var_38_9 <= 0 and var_38_5 or var_38_5 * (var_38_10 / var_38_9)

				if var_38_11 > 0 and var_38_5 < var_38_11 then
					arg_35_1.talkMaxDuration = var_38_11

					if var_38_11 + var_38_4 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_11 + var_38_4
					end
				end

				arg_35_1.text_.text = var_38_8
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321009", "story_v_out_319321.awb") ~= 0 then
					local var_38_12 = manager.audio:GetVoiceLength("story_v_out_319321", "319321009", "story_v_out_319321.awb") / 1000

					if var_38_12 + var_38_4 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_12 + var_38_4
					end

					if var_38_7.prefab_name ~= "" and arg_35_1.actors_[var_38_7.prefab_name] ~= nil then
						local var_38_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_7.prefab_name].transform, "story_v_out_319321", "319321009", "story_v_out_319321.awb")

						arg_35_1:RecordAudio("319321009", var_38_13)
						arg_35_1:RecordAudio("319321009", var_38_13)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319321", "319321009", "story_v_out_319321.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319321", "319321009", "story_v_out_319321.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_5, arg_35_1.talkMaxDuration)

			if var_38_4 <= arg_35_1.time_ and arg_35_1.time_ < var_38_4 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_4) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_4 + var_38_14 and arg_35_1.time_ < var_38_4 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319321010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319321010
		arg_39_1.duration_ = 3.499333333332

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play319321011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["4040ui_story"].transform
			local var_42_1 = 4.44089209850063e-16

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos4040ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos4040ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, 100, 0)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = "STblack"

			if arg_39_1.bgs_[var_42_9] == nil then
				local var_42_10 = Object.Instantiate(arg_39_1.paintGo_)

				var_42_10:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_42_9)
				var_42_10.name = var_42_9
				var_42_10.transform.parent = arg_39_1.stage_.transform
				var_42_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_39_1.bgs_[var_42_9] = var_42_10
			end

			local var_42_11 = 4.44089209850063e-16

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				local var_42_12 = manager.ui.mainCamera.transform.localPosition
				local var_42_13 = Vector3.New(0, 0, 10) + Vector3.New(var_42_12.x, var_42_12.y, 0)
				local var_42_14 = arg_39_1.bgs_.STblack

				var_42_14.transform.localPosition = var_42_13
				var_42_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_42_15 = var_42_14:GetComponent("SpriteRenderer")

				if var_42_15 and var_42_15.sprite then
					local var_42_16 = (var_42_14.transform.localPosition - var_42_12).z
					local var_42_17 = manager.ui.mainCameraCom_
					local var_42_18 = 2 * var_42_16 * Mathf.Tan(var_42_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_42_19 = var_42_18 * var_42_17.aspect
					local var_42_20 = var_42_15.sprite.bounds.size.x
					local var_42_21 = var_42_15.sprite.bounds.size.y
					local var_42_22 = var_42_19 / var_42_20
					local var_42_23 = var_42_18 / var_42_21
					local var_42_24 = var_42_23 < var_42_22 and var_42_22 or var_42_23

					var_42_14.transform.localScale = Vector3.New(var_42_24, var_42_24, 0)
				end

				for iter_42_0, iter_42_1 in pairs(arg_39_1.bgs_) do
					if iter_42_0 ~= "STblack" then
						iter_42_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_42_25 = arg_39_1.actors_["10079ui_story"].transform
			local var_42_26 = 4.44089209850063e-16

			if var_42_26 < arg_39_1.time_ and arg_39_1.time_ <= var_42_26 + arg_42_0 then
				arg_39_1.var_.moveOldPos10079ui_story = var_42_25.localPosition
			end

			local var_42_27 = 0.001

			if var_42_26 <= arg_39_1.time_ and arg_39_1.time_ < var_42_26 + var_42_27 then
				local var_42_28 = (arg_39_1.time_ - var_42_26) / var_42_27
				local var_42_29 = Vector3.New(0, 100, 0)

				var_42_25.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10079ui_story, var_42_29, var_42_28)

				local var_42_30 = manager.ui.mainCamera.transform.position - var_42_25.position

				var_42_25.forward = Vector3.New(var_42_30.x, var_42_30.y, var_42_30.z)

				local var_42_31 = var_42_25.localEulerAngles

				var_42_31.z = 0
				var_42_31.x = 0
				var_42_25.localEulerAngles = var_42_31
			end

			if arg_39_1.time_ >= var_42_26 + var_42_27 and arg_39_1.time_ < var_42_26 + var_42_27 + arg_42_0 then
				var_42_25.localPosition = Vector3.New(0, 100, 0)

				local var_42_32 = manager.ui.mainCamera.transform.position - var_42_25.position

				var_42_25.forward = Vector3.New(var_42_32.x, var_42_32.y, var_42_32.z)

				local var_42_33 = var_42_25.localEulerAngles

				var_42_33.z = 0
				var_42_33.x = 0
				var_42_25.localEulerAngles = var_42_33
			end

			local var_42_34 = 4.44089209850063e-16

			if var_42_34 < arg_39_1.time_ and arg_39_1.time_ <= var_42_34 + arg_42_0 then
				arg_39_1.cswbg_:SetActive(true)

				local var_42_35 = arg_39_1.cswt_:GetComponent("RectTransform")

				arg_39_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_42_35.offsetMin = Vector2.New(410, 330)
				var_42_35.offsetMax = Vector2.New(-400, -175)

				local var_42_36 = arg_39_1:GetWordFromCfg(419007)
				local var_42_37 = arg_39_1:FormatText(var_42_36.content)

				arg_39_1.cswt_.text = var_42_37

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.cswt_)

				arg_39_1.cswt_.fontSize = 180
				arg_39_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_39_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_42_38 = 0

			if var_42_38 < arg_39_1.time_ and arg_39_1.time_ <= var_42_38 + arg_42_0 then
				arg_39_1.fswbg_:SetActive(true)
				arg_39_1.dialog_:SetActive(false)

				arg_39_1.fswtw_.percent = 0

				local var_42_39 = arg_39_1:GetWordFromCfg(319321010)
				local var_42_40 = arg_39_1:FormatText(var_42_39.content)

				arg_39_1.fswt_.text = var_42_40

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.fswt_)

				arg_39_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_39_1.fswtw_:SetDirty()

				arg_39_1.typewritterCharCountI18N = 0

				SetActive(arg_39_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_39_1:ShowNextGo(false)
			end

			local var_42_41 = 0.333333333333333

			if var_42_41 < arg_39_1.time_ and arg_39_1.time_ <= var_42_41 + arg_42_0 then
				arg_39_1.var_.oldValueTypewriter = arg_39_1.fswtw_.percent

				arg_39_1:ShowNextGo(false)
			end

			local var_42_42 = 6
			local var_42_43 = 0.4
			local var_42_44 = arg_39_1:GetWordFromCfg(319321010)
			local var_42_45 = arg_39_1:FormatText(var_42_44.content)
			local var_42_46, var_42_47 = arg_39_1:GetPercentByPara(var_42_45, 1)

			if var_42_41 < arg_39_1.time_ and arg_39_1.time_ <= var_42_41 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				local var_42_48 = var_42_42 <= 0 and var_42_43 or var_42_43 * ((var_42_47 - arg_39_1.typewritterCharCountI18N) / var_42_42)

				if var_42_48 > 0 and var_42_43 < var_42_48 then
					arg_39_1.talkMaxDuration = var_42_48

					if var_42_48 + var_42_41 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_48 + var_42_41
					end
				end
			end

			local var_42_49 = 0.4
			local var_42_50 = math.max(var_42_49, arg_39_1.talkMaxDuration)

			if var_42_41 <= arg_39_1.time_ and arg_39_1.time_ < var_42_41 + var_42_50 then
				local var_42_51 = (arg_39_1.time_ - var_42_41) / var_42_50

				arg_39_1.fswtw_.percent = Mathf.Lerp(arg_39_1.var_.oldValueTypewriter, var_42_46, var_42_51)
				arg_39_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_39_1.fswtw_:SetDirty()
			end

			if arg_39_1.time_ >= var_42_41 + var_42_50 and arg_39_1.time_ < var_42_41 + var_42_50 + arg_42_0 then
				arg_39_1.fswtw_.percent = var_42_46

				arg_39_1.fswtw_:SetDirty()
				arg_39_1:ShowNextGo(true)

				arg_39_1.typewritterCharCountI18N = var_42_47
			end

			local var_42_52 = 0

			if var_42_52 < arg_39_1.time_ and arg_39_1.time_ <= var_42_52 + arg_42_0 then
				local var_42_53 = arg_39_1.fswbg_.transform:Find("textbox/adapt/content") or arg_39_1.fswbg_.transform:Find("textbox/content")
				local var_42_54 = var_42_53:GetComponent("Text")
				local var_42_55 = var_42_53:GetComponent("RectTransform")

				var_42_54.alignment = UnityEngine.TextAnchor.LowerCenter
				var_42_55.offsetMin = Vector2.New(0, 0)
				var_42_55.offsetMax = Vector2.New(0, 0)
			end

			local var_42_56 = 0.333333333333333
			local var_42_57 = 3.166
			local var_42_58 = manager.audio:GetVoiceLength("story_v_out_319321", "319321010", "story_v_out_319321.awb") / 1000

			if var_42_58 > 0 and var_42_57 < var_42_58 and var_42_58 + var_42_56 > arg_39_1.duration_ then
				local var_42_59 = var_42_58

				arg_39_1.duration_ = var_42_58 + var_42_56
			end

			if var_42_56 < arg_39_1.time_ and arg_39_1.time_ <= var_42_56 + arg_42_0 then
				local var_42_60 = "play"
				local var_42_61 = "voice"

				arg_39_1:AudioAction(var_42_60, var_42_61, "story_v_out_319321", "319321010", "story_v_out_319321.awb")
			end
		end
	end,
	Play319321011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319321011
		arg_43_1.duration_ = 3.866666666666

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play319321012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.fswbg_:SetActive(true)
				arg_43_1.dialog_:SetActive(false)

				arg_43_1.fswtw_.percent = 0

				local var_46_1 = arg_43_1:GetWordFromCfg(319321011)
				local var_46_2 = arg_43_1:FormatText(var_46_1.content)

				arg_43_1.fswt_.text = var_46_2

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.fswt_)

				arg_43_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_43_1.fswtw_:SetDirty()

				arg_43_1.typewritterCharCountI18N = 0

				SetActive(arg_43_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_43_1:ShowNextGo(false)
			end

			local var_46_3 = 0.166666666666667

			if var_46_3 < arg_43_1.time_ and arg_43_1.time_ <= var_46_3 + arg_46_0 then
				arg_43_1.var_.oldValueTypewriter = arg_43_1.fswtw_.percent

				arg_43_1:ShowNextGo(false)
			end

			local var_46_4 = 18
			local var_46_5 = 1.2
			local var_46_6 = arg_43_1:GetWordFromCfg(319321011)
			local var_46_7 = arg_43_1:FormatText(var_46_6.content)
			local var_46_8, var_46_9 = arg_43_1:GetPercentByPara(var_46_7, 1)

			if var_46_3 < arg_43_1.time_ and arg_43_1.time_ <= var_46_3 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0

				local var_46_10 = var_46_4 <= 0 and var_46_5 or var_46_5 * ((var_46_9 - arg_43_1.typewritterCharCountI18N) / var_46_4)

				if var_46_10 > 0 and var_46_5 < var_46_10 then
					arg_43_1.talkMaxDuration = var_46_10

					if var_46_10 + var_46_3 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_10 + var_46_3
					end
				end
			end

			local var_46_11 = 1.2
			local var_46_12 = math.max(var_46_11, arg_43_1.talkMaxDuration)

			if var_46_3 <= arg_43_1.time_ and arg_43_1.time_ < var_46_3 + var_46_12 then
				local var_46_13 = (arg_43_1.time_ - var_46_3) / var_46_12

				arg_43_1.fswtw_.percent = Mathf.Lerp(arg_43_1.var_.oldValueTypewriter, var_46_8, var_46_13)
				arg_43_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_43_1.fswtw_:SetDirty()
			end

			if arg_43_1.time_ >= var_46_3 + var_46_12 and arg_43_1.time_ < var_46_3 + var_46_12 + arg_46_0 then
				arg_43_1.fswtw_.percent = var_46_8

				arg_43_1.fswtw_:SetDirty()
				arg_43_1:ShowNextGo(true)

				arg_43_1.typewritterCharCountI18N = var_46_9
			end

			local var_46_14 = 0.166666666666667
			local var_46_15 = 3.7
			local var_46_16 = manager.audio:GetVoiceLength("story_v_out_319321", "319321011", "story_v_out_319321.awb") / 1000

			if var_46_16 > 0 and var_46_15 < var_46_16 and var_46_16 + var_46_14 > arg_43_1.duration_ then
				local var_46_17 = var_46_16

				arg_43_1.duration_ = var_46_16 + var_46_14
			end

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				local var_46_18 = "play"
				local var_46_19 = "voice"

				arg_43_1:AudioAction(var_46_18, var_46_19, "story_v_out_319321", "319321011", "story_v_out_319321.awb")
			end
		end
	end,
	Play319321012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319321012
		arg_47_1.duration_ = 7.433

		local var_47_0 = {
			zh = 5.3,
			ja = 7.433
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
				arg_47_0:Play319321013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				local var_50_1 = manager.ui.mainCamera.transform.localPosition
				local var_50_2 = Vector3.New(0, 0, 10) + Vector3.New(var_50_1.x, var_50_1.y, 0)
				local var_50_3 = arg_47_1.bgs_.I12f

				var_50_3.transform.localPosition = var_50_2
				var_50_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_50_4 = var_50_3:GetComponent("SpriteRenderer")

				if var_50_4 and var_50_4.sprite then
					local var_50_5 = (var_50_3.transform.localPosition - var_50_1).z
					local var_50_6 = manager.ui.mainCameraCom_
					local var_50_7 = 2 * var_50_5 * Mathf.Tan(var_50_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_50_8 = var_50_7 * var_50_6.aspect
					local var_50_9 = var_50_4.sprite.bounds.size.x
					local var_50_10 = var_50_4.sprite.bounds.size.y
					local var_50_11 = var_50_8 / var_50_9
					local var_50_12 = var_50_7 / var_50_10
					local var_50_13 = var_50_12 < var_50_11 and var_50_11 or var_50_12

					var_50_3.transform.localScale = Vector3.New(var_50_13, var_50_13, 0)
				end

				for iter_50_0, iter_50_1 in pairs(arg_47_1.bgs_) do
					if iter_50_0 ~= "I12f" then
						iter_50_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_15 = 2

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15
				local var_50_17 = Color.New(0, 0, 0)

				var_50_17.a = Mathf.Lerp(1, 0, var_50_16)
				arg_47_1.mask_.color = var_50_17
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 then
				local var_50_18 = Color.New(0, 0, 0)
				local var_50_19 = 0

				arg_47_1.mask_.enabled = false
				var_50_18.a = var_50_19
				arg_47_1.mask_.color = var_50_18
			end

			local var_50_20 = 0

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.cswbg_:SetActive(false)
			end

			local var_50_21 = 0.0340000018477435

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.fswbg_:SetActive(false)
				arg_47_1.dialog_:SetActive(false)
				arg_47_1:ShowNextGo(false)
			end

			local var_50_22 = 0.200666668514411

			if var_50_22 < arg_47_1.time_ and arg_47_1.time_ <= var_50_22 + arg_50_0 then
				arg_47_1.fswbg_:SetActive(false)
				arg_47_1.dialog_:SetActive(false)
				arg_47_1:ShowNextGo(false)
			end

			local var_50_23 = arg_47_1.actors_["10079ui_story"].transform
			local var_50_24 = 2

			if var_50_24 < arg_47_1.time_ and arg_47_1.time_ <= var_50_24 + arg_50_0 then
				arg_47_1.var_.moveOldPos10079ui_story = var_50_23.localPosition
			end

			local var_50_25 = 0.001

			if var_50_24 <= arg_47_1.time_ and arg_47_1.time_ < var_50_24 + var_50_25 then
				local var_50_26 = (arg_47_1.time_ - var_50_24) / var_50_25
				local var_50_27 = Vector3.New(0, -0.95, -6.05)

				var_50_23.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10079ui_story, var_50_27, var_50_26)

				local var_50_28 = manager.ui.mainCamera.transform.position - var_50_23.position

				var_50_23.forward = Vector3.New(var_50_28.x, var_50_28.y, var_50_28.z)

				local var_50_29 = var_50_23.localEulerAngles

				var_50_29.z = 0
				var_50_29.x = 0
				var_50_23.localEulerAngles = var_50_29
			end

			if arg_47_1.time_ >= var_50_24 + var_50_25 and arg_47_1.time_ < var_50_24 + var_50_25 + arg_50_0 then
				var_50_23.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_50_30 = manager.ui.mainCamera.transform.position - var_50_23.position

				var_50_23.forward = Vector3.New(var_50_30.x, var_50_30.y, var_50_30.z)

				local var_50_31 = var_50_23.localEulerAngles

				var_50_31.z = 0
				var_50_31.x = 0
				var_50_23.localEulerAngles = var_50_31
			end

			local var_50_32 = arg_47_1.actors_["10079ui_story"]
			local var_50_33 = 2

			if var_50_33 < arg_47_1.time_ and arg_47_1.time_ <= var_50_33 + arg_50_0 and arg_47_1.var_.characterEffect10079ui_story == nil then
				arg_47_1.var_.characterEffect10079ui_story = var_50_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_34 = 0.200000002980232

			if var_50_33 <= arg_47_1.time_ and arg_47_1.time_ < var_50_33 + var_50_34 then
				local var_50_35 = (arg_47_1.time_ - var_50_33) / var_50_34

				if arg_47_1.var_.characterEffect10079ui_story then
					arg_47_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_33 + var_50_34 and arg_47_1.time_ < var_50_33 + var_50_34 + arg_50_0 and arg_47_1.var_.characterEffect10079ui_story then
				arg_47_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_50_36 = 2

			if var_50_36 < arg_47_1.time_ and arg_47_1.time_ <= var_50_36 + arg_50_0 then
				arg_47_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_2")
			end

			local var_50_37 = 2

			if var_50_37 < arg_47_1.time_ and arg_47_1.time_ <= var_50_37 + arg_50_0 then
				arg_47_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_47_1.frameCnt_ <= 1 then
				arg_47_1.dialog_:SetActive(false)
			end

			local var_50_38 = 2
			local var_50_39 = 0.15

			if var_50_38 < arg_47_1.time_ and arg_47_1.time_ <= var_50_38 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				arg_47_1.dialog_:SetActive(true)

				local var_50_40 = LeanTween.value(arg_47_1.dialog_, 0, 1, 0.3)

				var_50_40:setOnUpdate(LuaHelper.FloatAction(function(arg_51_0)
					arg_47_1.dialogCg_.alpha = arg_51_0
				end))
				var_50_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_47_1.dialog_)
					var_50_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_47_1.duration_ = arg_47_1.duration_ + 0.3

				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_41 = arg_47_1:FormatText(StoryNameCfg[6].name)

				arg_47_1.leftNameTxt_.text = var_50_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_42 = arg_47_1:GetWordFromCfg(319321012)
				local var_50_43 = arg_47_1:FormatText(var_50_42.content)

				arg_47_1.text_.text = var_50_43

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_44 = 6
				local var_50_45 = utf8.len(var_50_43)
				local var_50_46 = var_50_44 <= 0 and var_50_39 or var_50_39 * (var_50_45 / var_50_44)

				if var_50_46 > 0 and var_50_39 < var_50_46 then
					arg_47_1.talkMaxDuration = var_50_46
					var_50_38 = var_50_38 + 0.3

					if var_50_46 + var_50_38 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_46 + var_50_38
					end
				end

				arg_47_1.text_.text = var_50_43
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321012", "story_v_out_319321.awb") ~= 0 then
					local var_50_47 = manager.audio:GetVoiceLength("story_v_out_319321", "319321012", "story_v_out_319321.awb") / 1000

					if var_50_47 + var_50_38 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_47 + var_50_38
					end

					if var_50_42.prefab_name ~= "" and arg_47_1.actors_[var_50_42.prefab_name] ~= nil then
						local var_50_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_42.prefab_name].transform, "story_v_out_319321", "319321012", "story_v_out_319321.awb")

						arg_47_1:RecordAudio("319321012", var_50_48)
						arg_47_1:RecordAudio("319321012", var_50_48)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319321", "319321012", "story_v_out_319321.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319321", "319321012", "story_v_out_319321.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_49 = var_50_38 + 0.3
			local var_50_50 = math.max(var_50_39, arg_47_1.talkMaxDuration)

			if var_50_49 <= arg_47_1.time_ and arg_47_1.time_ < var_50_49 + var_50_50 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_49) / var_50_50

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_49 + var_50_50 and arg_47_1.time_ < var_50_49 + var_50_50 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319321013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319321013
		arg_53_1.duration_ = 10.1

		local var_53_0 = {
			zh = 3.166,
			ja = 10.1
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
				arg_53_0:Play319321014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["10079ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect10079ui_story == nil then
				arg_53_1.var_.characterEffect10079ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.200000002980232

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect10079ui_story then
					local var_56_4 = Mathf.Lerp(0, 0.5, var_56_3)

					arg_53_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_53_1.var_.characterEffect10079ui_story.fillRatio = var_56_4
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect10079ui_story then
				local var_56_5 = 0.5

				arg_53_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_53_1.var_.characterEffect10079ui_story.fillRatio = var_56_5
			end

			local var_56_6 = arg_53_1.actors_["4040ui_story"]
			local var_56_7 = 0

			if var_56_7 < arg_53_1.time_ and arg_53_1.time_ <= var_56_7 + arg_56_0 and arg_53_1.var_.characterEffect4040ui_story == nil then
				arg_53_1.var_.characterEffect4040ui_story = var_56_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_8 = 0.200000002980232

			if var_56_7 <= arg_53_1.time_ and arg_53_1.time_ < var_56_7 + var_56_8 then
				local var_56_9 = (arg_53_1.time_ - var_56_7) / var_56_8

				if arg_53_1.var_.characterEffect4040ui_story then
					arg_53_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_7 + var_56_8 and arg_53_1.time_ < var_56_7 + var_56_8 + arg_56_0 and arg_53_1.var_.characterEffect4040ui_story then
				arg_53_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_56_10 = arg_53_1.actors_["4040ui_story"].transform
			local var_56_11 = 0

			if var_56_11 < arg_53_1.time_ and arg_53_1.time_ <= var_56_11 + arg_56_0 then
				arg_53_1.var_.moveOldPos4040ui_story = var_56_10.localPosition
			end

			local var_56_12 = 0.001

			if var_56_11 <= arg_53_1.time_ and arg_53_1.time_ < var_56_11 + var_56_12 then
				local var_56_13 = (arg_53_1.time_ - var_56_11) / var_56_12
				local var_56_14 = Vector3.New(-0.7, -1.55, -5.5)

				var_56_10.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos4040ui_story, var_56_14, var_56_13)

				local var_56_15 = manager.ui.mainCamera.transform.position - var_56_10.position

				var_56_10.forward = Vector3.New(var_56_15.x, var_56_15.y, var_56_15.z)

				local var_56_16 = var_56_10.localEulerAngles

				var_56_16.z = 0
				var_56_16.x = 0
				var_56_10.localEulerAngles = var_56_16
			end

			if arg_53_1.time_ >= var_56_11 + var_56_12 and arg_53_1.time_ < var_56_11 + var_56_12 + arg_56_0 then
				var_56_10.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_56_17 = manager.ui.mainCamera.transform.position - var_56_10.position

				var_56_10.forward = Vector3.New(var_56_17.x, var_56_17.y, var_56_17.z)

				local var_56_18 = var_56_10.localEulerAngles

				var_56_18.z = 0
				var_56_18.x = 0
				var_56_10.localEulerAngles = var_56_18
			end

			local var_56_19 = arg_53_1.actors_["10079ui_story"].transform
			local var_56_20 = 0

			if var_56_20 < arg_53_1.time_ and arg_53_1.time_ <= var_56_20 + arg_56_0 then
				arg_53_1.var_.moveOldPos10079ui_story = var_56_19.localPosition
			end

			local var_56_21 = 0.001

			if var_56_20 <= arg_53_1.time_ and arg_53_1.time_ < var_56_20 + var_56_21 then
				local var_56_22 = (arg_53_1.time_ - var_56_20) / var_56_21
				local var_56_23 = Vector3.New(0.7, -0.95, -6.05)

				var_56_19.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos10079ui_story, var_56_23, var_56_22)

				local var_56_24 = manager.ui.mainCamera.transform.position - var_56_19.position

				var_56_19.forward = Vector3.New(var_56_24.x, var_56_24.y, var_56_24.z)

				local var_56_25 = var_56_19.localEulerAngles

				var_56_25.z = 0
				var_56_25.x = 0
				var_56_19.localEulerAngles = var_56_25
			end

			if arg_53_1.time_ >= var_56_20 + var_56_21 and arg_53_1.time_ < var_56_20 + var_56_21 + arg_56_0 then
				var_56_19.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_56_26 = manager.ui.mainCamera.transform.position - var_56_19.position

				var_56_19.forward = Vector3.New(var_56_26.x, var_56_26.y, var_56_26.z)

				local var_56_27 = var_56_19.localEulerAngles

				var_56_27.z = 0
				var_56_27.x = 0
				var_56_19.localEulerAngles = var_56_27
			end

			local var_56_28 = 0
			local var_56_29 = 0.325

			if var_56_28 < arg_53_1.time_ and arg_53_1.time_ <= var_56_28 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_30 = arg_53_1:FormatText(StoryNameCfg[668].name)

				arg_53_1.leftNameTxt_.text = var_56_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_31 = arg_53_1:GetWordFromCfg(319321013)
				local var_56_32 = arg_53_1:FormatText(var_56_31.content)

				arg_53_1.text_.text = var_56_32

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_33 = 13
				local var_56_34 = utf8.len(var_56_32)
				local var_56_35 = var_56_33 <= 0 and var_56_29 or var_56_29 * (var_56_34 / var_56_33)

				if var_56_35 > 0 and var_56_29 < var_56_35 then
					arg_53_1.talkMaxDuration = var_56_35

					if var_56_35 + var_56_28 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_35 + var_56_28
					end
				end

				arg_53_1.text_.text = var_56_32
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321013", "story_v_out_319321.awb") ~= 0 then
					local var_56_36 = manager.audio:GetVoiceLength("story_v_out_319321", "319321013", "story_v_out_319321.awb") / 1000

					if var_56_36 + var_56_28 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_36 + var_56_28
					end

					if var_56_31.prefab_name ~= "" and arg_53_1.actors_[var_56_31.prefab_name] ~= nil then
						local var_56_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_31.prefab_name].transform, "story_v_out_319321", "319321013", "story_v_out_319321.awb")

						arg_53_1:RecordAudio("319321013", var_56_37)
						arg_53_1:RecordAudio("319321013", var_56_37)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_319321", "319321013", "story_v_out_319321.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_319321", "319321013", "story_v_out_319321.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_38 = math.max(var_56_29, arg_53_1.talkMaxDuration)

			if var_56_28 <= arg_53_1.time_ and arg_53_1.time_ < var_56_28 + var_56_38 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_28) / var_56_38

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_28 + var_56_38 and arg_53_1.time_ < var_56_28 + var_56_38 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play319321014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319321014
		arg_57_1.duration_ = 7.933

		local var_57_0 = {
			zh = 5.433,
			ja = 7.933
		}
		local var_57_1 = manager.audio:GetLocalizationFlag()

		if var_57_0[var_57_1] ~= nil then
			arg_57_1.duration_ = var_57_0[var_57_1]
		end

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play319321015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["4040ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos4040ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos4040ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = arg_57_1.actors_["4040ui_story"]
			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 and arg_57_1.var_.characterEffect4040ui_story == nil then
				arg_57_1.var_.characterEffect4040ui_story = var_60_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_11 = 0.200000002980232

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_11 then
				local var_60_12 = (arg_57_1.time_ - var_60_10) / var_60_11

				if arg_57_1.var_.characterEffect4040ui_story then
					arg_57_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_10 + var_60_11 and arg_57_1.time_ < var_60_10 + var_60_11 + arg_60_0 and arg_57_1.var_.characterEffect4040ui_story then
				arg_57_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_60_13 = 0

			if var_60_13 < arg_57_1.time_ and arg_57_1.time_ <= var_60_13 + arg_60_0 then
				arg_57_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_2")
			end

			local var_60_14 = 0

			if var_60_14 < arg_57_1.time_ and arg_57_1.time_ <= var_60_14 + arg_60_0 then
				arg_57_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_60_15 = 0
			local var_60_16 = 0.55

			if var_60_15 < arg_57_1.time_ and arg_57_1.time_ <= var_60_15 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_17 = arg_57_1:FormatText(StoryNameCfg[668].name)

				arg_57_1.leftNameTxt_.text = var_60_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_18 = arg_57_1:GetWordFromCfg(319321014)
				local var_60_19 = arg_57_1:FormatText(var_60_18.content)

				arg_57_1.text_.text = var_60_19

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_20 = 22
				local var_60_21 = utf8.len(var_60_19)
				local var_60_22 = var_60_20 <= 0 and var_60_16 or var_60_16 * (var_60_21 / var_60_20)

				if var_60_22 > 0 and var_60_16 < var_60_22 then
					arg_57_1.talkMaxDuration = var_60_22

					if var_60_22 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_22 + var_60_15
					end
				end

				arg_57_1.text_.text = var_60_19
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321014", "story_v_out_319321.awb") ~= 0 then
					local var_60_23 = manager.audio:GetVoiceLength("story_v_out_319321", "319321014", "story_v_out_319321.awb") / 1000

					if var_60_23 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_23 + var_60_15
					end

					if var_60_18.prefab_name ~= "" and arg_57_1.actors_[var_60_18.prefab_name] ~= nil then
						local var_60_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_18.prefab_name].transform, "story_v_out_319321", "319321014", "story_v_out_319321.awb")

						arg_57_1:RecordAudio("319321014", var_60_24)
						arg_57_1:RecordAudio("319321014", var_60_24)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_319321", "319321014", "story_v_out_319321.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_319321", "319321014", "story_v_out_319321.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_25 = math.max(var_60_16, arg_57_1.talkMaxDuration)

			if var_60_15 <= arg_57_1.time_ and arg_57_1.time_ < var_60_15 + var_60_25 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_15) / var_60_25

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_15 + var_60_25 and arg_57_1.time_ < var_60_15 + var_60_25 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play319321015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319321015
		arg_61_1.duration_ = 1.999999999999

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play319321016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 4.44089209850063e-16

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				local var_64_1 = manager.ui.mainCamera.transform.localPosition
				local var_64_2 = Vector3.New(0, 0, 10) + Vector3.New(var_64_1.x, var_64_1.y, 0)
				local var_64_3 = arg_61_1.bgs_.STblack

				var_64_3.transform.localPosition = var_64_2
				var_64_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_64_4 = var_64_3:GetComponent("SpriteRenderer")

				if var_64_4 and var_64_4.sprite then
					local var_64_5 = (var_64_3.transform.localPosition - var_64_1).z
					local var_64_6 = manager.ui.mainCameraCom_
					local var_64_7 = 2 * var_64_5 * Mathf.Tan(var_64_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_64_8 = var_64_7 * var_64_6.aspect
					local var_64_9 = var_64_4.sprite.bounds.size.x
					local var_64_10 = var_64_4.sprite.bounds.size.y
					local var_64_11 = var_64_8 / var_64_9
					local var_64_12 = var_64_7 / var_64_10
					local var_64_13 = var_64_12 < var_64_11 and var_64_11 or var_64_12

					var_64_3.transform.localScale = Vector3.New(var_64_13, var_64_13, 0)
				end

				for iter_64_0, iter_64_1 in pairs(arg_61_1.bgs_) do
					if iter_64_0 ~= "STblack" then
						iter_64_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_64_14 = arg_61_1.actors_["10079ui_story"].transform
			local var_64_15 = 4.44089209850063e-16

			if var_64_15 < arg_61_1.time_ and arg_61_1.time_ <= var_64_15 + arg_64_0 then
				arg_61_1.var_.moveOldPos10079ui_story = var_64_14.localPosition
			end

			local var_64_16 = 0.001

			if var_64_15 <= arg_61_1.time_ and arg_61_1.time_ < var_64_15 + var_64_16 then
				local var_64_17 = (arg_61_1.time_ - var_64_15) / var_64_16
				local var_64_18 = Vector3.New(0, 100, 0)

				var_64_14.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos10079ui_story, var_64_18, var_64_17)

				local var_64_19 = manager.ui.mainCamera.transform.position - var_64_14.position

				var_64_14.forward = Vector3.New(var_64_19.x, var_64_19.y, var_64_19.z)

				local var_64_20 = var_64_14.localEulerAngles

				var_64_20.z = 0
				var_64_20.x = 0
				var_64_14.localEulerAngles = var_64_20
			end

			if arg_61_1.time_ >= var_64_15 + var_64_16 and arg_61_1.time_ < var_64_15 + var_64_16 + arg_64_0 then
				var_64_14.localPosition = Vector3.New(0, 100, 0)

				local var_64_21 = manager.ui.mainCamera.transform.position - var_64_14.position

				var_64_14.forward = Vector3.New(var_64_21.x, var_64_21.y, var_64_21.z)

				local var_64_22 = var_64_14.localEulerAngles

				var_64_22.z = 0
				var_64_22.x = 0
				var_64_14.localEulerAngles = var_64_22
			end

			local var_64_23 = 4.44089209850063e-16

			if var_64_23 < arg_61_1.time_ and arg_61_1.time_ <= var_64_23 + arg_64_0 then
				arg_61_1.cswbg_:SetActive(true)

				local var_64_24 = arg_61_1.cswt_:GetComponent("RectTransform")

				arg_61_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_64_24.offsetMin = Vector2.New(410, 330)
				var_64_24.offsetMax = Vector2.New(-400, -175)

				local var_64_25 = arg_61_1:GetWordFromCfg(419008)
				local var_64_26 = arg_61_1:FormatText(var_64_25.content)

				arg_61_1.cswt_.text = var_64_26

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.cswt_)

				arg_61_1.cswt_.fontSize = 180
				arg_61_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_61_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_64_27 = 0

			if var_64_27 < arg_61_1.time_ and arg_61_1.time_ <= var_64_27 + arg_64_0 then
				arg_61_1.fswbg_:SetActive(true)
				arg_61_1.dialog_:SetActive(false)

				arg_61_1.fswtw_.percent = 0

				local var_64_28 = arg_61_1:GetWordFromCfg(319321015)
				local var_64_29 = arg_61_1:FormatText(var_64_28.content)

				arg_61_1.fswt_.text = var_64_29

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.fswt_)

				arg_61_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_61_1.fswtw_:SetDirty()

				arg_61_1.typewritterCharCountI18N = 0

				SetActive(arg_61_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_61_1:ShowNextGo(false)
			end

			local var_64_30 = 0.366666666666667

			if var_64_30 < arg_61_1.time_ and arg_61_1.time_ <= var_64_30 + arg_64_0 then
				arg_61_1.var_.oldValueTypewriter = arg_61_1.fswtw_.percent

				arg_61_1:ShowNextGo(false)
			end

			local var_64_31 = 6
			local var_64_32 = 0.4
			local var_64_33 = arg_61_1:GetWordFromCfg(319321015)
			local var_64_34 = arg_61_1:FormatText(var_64_33.content)
			local var_64_35, var_64_36 = arg_61_1:GetPercentByPara(var_64_34, 1)

			if var_64_30 < arg_61_1.time_ and arg_61_1.time_ <= var_64_30 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				local var_64_37 = var_64_31 <= 0 and var_64_32 or var_64_32 * ((var_64_36 - arg_61_1.typewritterCharCountI18N) / var_64_31)

				if var_64_37 > 0 and var_64_32 < var_64_37 then
					arg_61_1.talkMaxDuration = var_64_37

					if var_64_37 + var_64_30 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_37 + var_64_30
					end
				end
			end

			local var_64_38 = 0.4
			local var_64_39 = math.max(var_64_38, arg_61_1.talkMaxDuration)

			if var_64_30 <= arg_61_1.time_ and arg_61_1.time_ < var_64_30 + var_64_39 then
				local var_64_40 = (arg_61_1.time_ - var_64_30) / var_64_39

				arg_61_1.fswtw_.percent = Mathf.Lerp(arg_61_1.var_.oldValueTypewriter, var_64_35, var_64_40)
				arg_61_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_61_1.fswtw_:SetDirty()
			end

			if arg_61_1.time_ >= var_64_30 + var_64_39 and arg_61_1.time_ < var_64_30 + var_64_39 + arg_64_0 then
				arg_61_1.fswtw_.percent = var_64_35

				arg_61_1.fswtw_:SetDirty()
				arg_61_1:ShowNextGo(true)

				arg_61_1.typewritterCharCountI18N = var_64_36
			end

			local var_64_41 = 0

			if var_64_41 < arg_61_1.time_ and arg_61_1.time_ <= var_64_41 + arg_64_0 then
				local var_64_42 = arg_61_1.fswbg_.transform:Find("textbox/adapt/content") or arg_61_1.fswbg_.transform:Find("textbox/content")
				local var_64_43 = var_64_42:GetComponent("Text")
				local var_64_44 = var_64_42:GetComponent("RectTransform")

				var_64_43.alignment = UnityEngine.TextAnchor.LowerCenter
				var_64_44.offsetMin = Vector2.New(0, 0)
				var_64_44.offsetMax = Vector2.New(0, 0)
			end

			local var_64_45 = arg_61_1.actors_["4040ui_story"].transform
			local var_64_46 = 4.44089209850063e-16

			if var_64_46 < arg_61_1.time_ and arg_61_1.time_ <= var_64_46 + arg_64_0 then
				arg_61_1.var_.moveOldPos4040ui_story = var_64_45.localPosition
			end

			local var_64_47 = 0.001

			if var_64_46 <= arg_61_1.time_ and arg_61_1.time_ < var_64_46 + var_64_47 then
				local var_64_48 = (arg_61_1.time_ - var_64_46) / var_64_47
				local var_64_49 = Vector3.New(0, 100, 0)

				var_64_45.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos4040ui_story, var_64_49, var_64_48)

				local var_64_50 = manager.ui.mainCamera.transform.position - var_64_45.position

				var_64_45.forward = Vector3.New(var_64_50.x, var_64_50.y, var_64_50.z)

				local var_64_51 = var_64_45.localEulerAngles

				var_64_51.z = 0
				var_64_51.x = 0
				var_64_45.localEulerAngles = var_64_51
			end

			if arg_61_1.time_ >= var_64_46 + var_64_47 and arg_61_1.time_ < var_64_46 + var_64_47 + arg_64_0 then
				var_64_45.localPosition = Vector3.New(0, 100, 0)

				local var_64_52 = manager.ui.mainCamera.transform.position - var_64_45.position

				var_64_45.forward = Vector3.New(var_64_52.x, var_64_52.y, var_64_52.z)

				local var_64_53 = var_64_45.localEulerAngles

				var_64_53.z = 0
				var_64_53.x = 0
				var_64_45.localEulerAngles = var_64_53
			end

			local var_64_54 = 0.366666666666667
			local var_64_55 = 0.266666666666667
			local var_64_56 = manager.audio:GetVoiceLength("story_v_out_319321", "319321015", "story_v_out_319321.awb") / 1000

			if var_64_56 > 0 and var_64_55 < var_64_56 and var_64_56 + var_64_54 > arg_61_1.duration_ then
				local var_64_57 = var_64_56

				arg_61_1.duration_ = var_64_56 + var_64_54
			end

			if var_64_54 < arg_61_1.time_ and arg_61_1.time_ <= var_64_54 + arg_64_0 then
				local var_64_58 = "play"
				local var_64_59 = "voice"

				arg_61_1:AudioAction(var_64_58, var_64_59, "story_v_out_319321", "319321015", "story_v_out_319321.awb")
			end
		end
	end,
	Play319321016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319321016
		arg_65_1.duration_ = 3.633333333332

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play319321017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.fswbg_:SetActive(true)
				arg_65_1.dialog_:SetActive(false)

				arg_65_1.fswtw_.percent = 0

				local var_68_1 = arg_65_1:GetWordFromCfg(319321016)
				local var_68_2 = arg_65_1:FormatText(var_68_1.content)

				arg_65_1.fswt_.text = var_68_2

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.fswt_)

				arg_65_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_65_1.fswtw_:SetDirty()

				arg_65_1.typewritterCharCountI18N = 0

				SetActive(arg_65_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_65_1:ShowNextGo(false)
			end

			local var_68_3 = 0.166666666666667

			if var_68_3 < arg_65_1.time_ and arg_65_1.time_ <= var_68_3 + arg_68_0 then
				arg_65_1.var_.oldValueTypewriter = arg_65_1.fswtw_.percent

				arg_65_1:ShowNextGo(false)
			end

			local var_68_4 = 52
			local var_68_5 = 3.46666666666667
			local var_68_6 = arg_65_1:GetWordFromCfg(319321016)
			local var_68_7 = arg_65_1:FormatText(var_68_6.content)
			local var_68_8, var_68_9 = arg_65_1:GetPercentByPara(var_68_7, 1)

			if var_68_3 < arg_65_1.time_ and arg_65_1.time_ <= var_68_3 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0

				local var_68_10 = var_68_4 <= 0 and var_68_5 or var_68_5 * ((var_68_9 - arg_65_1.typewritterCharCountI18N) / var_68_4)

				if var_68_10 > 0 and var_68_5 < var_68_10 then
					arg_65_1.talkMaxDuration = var_68_10

					if var_68_10 + var_68_3 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_10 + var_68_3
					end
				end
			end

			local var_68_11 = 3.46666666666667
			local var_68_12 = math.max(var_68_11, arg_65_1.talkMaxDuration)

			if var_68_3 <= arg_65_1.time_ and arg_65_1.time_ < var_68_3 + var_68_12 then
				local var_68_13 = (arg_65_1.time_ - var_68_3) / var_68_12

				arg_65_1.fswtw_.percent = Mathf.Lerp(arg_65_1.var_.oldValueTypewriter, var_68_8, var_68_13)
				arg_65_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_65_1.fswtw_:SetDirty()
			end

			if arg_65_1.time_ >= var_68_3 + var_68_12 and arg_65_1.time_ < var_68_3 + var_68_12 + arg_68_0 then
				arg_65_1.fswtw_.percent = var_68_8

				arg_65_1.fswtw_:SetDirty()
				arg_65_1:ShowNextGo(true)

				arg_65_1.typewritterCharCountI18N = var_68_9
			end
		end
	end,
	Play319321017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319321017
		arg_69_1.duration_ = 5.5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play319321018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				local var_72_1 = manager.ui.mainCamera.transform.localPosition
				local var_72_2 = Vector3.New(0, 0, 10) + Vector3.New(var_72_1.x, var_72_1.y, 0)
				local var_72_3 = arg_69_1.bgs_.I12f

				var_72_3.transform.localPosition = var_72_2
				var_72_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_72_4 = var_72_3:GetComponent("SpriteRenderer")

				if var_72_4 and var_72_4.sprite then
					local var_72_5 = (var_72_3.transform.localPosition - var_72_1).z
					local var_72_6 = manager.ui.mainCameraCom_
					local var_72_7 = 2 * var_72_5 * Mathf.Tan(var_72_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_72_8 = var_72_7 * var_72_6.aspect
					local var_72_9 = var_72_4.sprite.bounds.size.x
					local var_72_10 = var_72_4.sprite.bounds.size.y
					local var_72_11 = var_72_8 / var_72_9
					local var_72_12 = var_72_7 / var_72_10
					local var_72_13 = var_72_12 < var_72_11 and var_72_11 or var_72_12

					var_72_3.transform.localScale = Vector3.New(var_72_13, var_72_13, 0)
				end

				for iter_72_0, iter_72_1 in pairs(arg_69_1.bgs_) do
					if iter_72_0 ~= "I12f" then
						iter_72_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				arg_69_1.cswbg_:SetActive(false)
			end

			local var_72_15 = 0.0340000018477435

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.fswbg_:SetActive(false)
				arg_69_1.dialog_:SetActive(false)
				arg_69_1:ShowNextGo(false)
			end

			local var_72_16 = 0.200666668514411

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 then
				arg_69_1.fswbg_:SetActive(false)
				arg_69_1.dialog_:SetActive(false)
				arg_69_1:ShowNextGo(false)
			end

			if arg_69_1.frameCnt_ <= 1 then
				arg_69_1.dialog_:SetActive(false)
			end

			local var_72_17 = 0.5
			local var_72_18 = 1.5

			if var_72_17 < arg_69_1.time_ and arg_69_1.time_ <= var_72_17 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				arg_69_1.dialog_:SetActive(true)

				local var_72_19 = LeanTween.value(arg_69_1.dialog_, 0, 1, 0.3)

				var_72_19:setOnUpdate(LuaHelper.FloatAction(function(arg_73_0)
					arg_69_1.dialogCg_.alpha = arg_73_0
				end))
				var_72_19:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_69_1.dialog_)
					var_72_19:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_69_1.duration_ = arg_69_1.duration_ + 0.3

				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_20 = arg_69_1:GetWordFromCfg(319321017)
				local var_72_21 = arg_69_1:FormatText(var_72_20.content)

				arg_69_1.text_.text = var_72_21

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_22 = 60
				local var_72_23 = utf8.len(var_72_21)
				local var_72_24 = var_72_22 <= 0 and var_72_18 or var_72_18 * (var_72_23 / var_72_22)

				if var_72_24 > 0 and var_72_18 < var_72_24 then
					arg_69_1.talkMaxDuration = var_72_24
					var_72_17 = var_72_17 + 0.3

					if var_72_24 + var_72_17 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_24 + var_72_17
					end
				end

				arg_69_1.text_.text = var_72_21
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_25 = var_72_17 + 0.3
			local var_72_26 = math.max(var_72_18, arg_69_1.talkMaxDuration)

			if var_72_25 <= arg_69_1.time_ and arg_69_1.time_ < var_72_25 + var_72_26 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_25) / var_72_26

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_25 + var_72_26 and arg_69_1.time_ < var_72_25 + var_72_26 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319321018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319321018
		arg_75_1.duration_ = 5.666

		local var_75_0 = {
			zh = 5.666,
			ja = 4.566
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
				arg_75_0:Play319321019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10079ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10079ui_story = var_78_0.localPosition

				local var_78_2 = "10079ui_story"

				arg_75_1:ShowWeapon(arg_75_1.var_[var_78_2 .. "Animator"].transform, false)
			end

			local var_78_3 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_3 then
				local var_78_4 = (arg_75_1.time_ - var_78_1) / var_78_3
				local var_78_5 = Vector3.New(0, -0.95, -6.05)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10079ui_story, var_78_5, var_78_4)

				local var_78_6 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_6.x, var_78_6.y, var_78_6.z)

				local var_78_7 = var_78_0.localEulerAngles

				var_78_7.z = 0
				var_78_7.x = 0
				var_78_0.localEulerAngles = var_78_7
			end

			if arg_75_1.time_ >= var_78_1 + var_78_3 and arg_75_1.time_ < var_78_1 + var_78_3 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_78_8 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_8.x, var_78_8.y, var_78_8.z)

				local var_78_9 = var_78_0.localEulerAngles

				var_78_9.z = 0
				var_78_9.x = 0
				var_78_0.localEulerAngles = var_78_9
			end

			local var_78_10 = arg_75_1.actors_["10079ui_story"]
			local var_78_11 = 0

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect10079ui_story == nil then
				arg_75_1.var_.characterEffect10079ui_story = var_78_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_12 = 0.200000002980232

			if var_78_11 <= arg_75_1.time_ and arg_75_1.time_ < var_78_11 + var_78_12 then
				local var_78_13 = (arg_75_1.time_ - var_78_11) / var_78_12

				if arg_75_1.var_.characterEffect10079ui_story then
					arg_75_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_11 + var_78_12 and arg_75_1.time_ < var_78_11 + var_78_12 + arg_78_0 and arg_75_1.var_.characterEffect10079ui_story then
				arg_75_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_78_15 = 0

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 then
				arg_75_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_78_16 = 0
			local var_78_17 = 0.675

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_18 = arg_75_1:FormatText(StoryNameCfg[6].name)

				arg_75_1.leftNameTxt_.text = var_78_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_19 = arg_75_1:GetWordFromCfg(319321018)
				local var_78_20 = arg_75_1:FormatText(var_78_19.content)

				arg_75_1.text_.text = var_78_20

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_21 = 27
				local var_78_22 = utf8.len(var_78_20)
				local var_78_23 = var_78_21 <= 0 and var_78_17 or var_78_17 * (var_78_22 / var_78_21)

				if var_78_23 > 0 and var_78_17 < var_78_23 then
					arg_75_1.talkMaxDuration = var_78_23

					if var_78_23 + var_78_16 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_23 + var_78_16
					end
				end

				arg_75_1.text_.text = var_78_20
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321018", "story_v_out_319321.awb") ~= 0 then
					local var_78_24 = manager.audio:GetVoiceLength("story_v_out_319321", "319321018", "story_v_out_319321.awb") / 1000

					if var_78_24 + var_78_16 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_24 + var_78_16
					end

					if var_78_19.prefab_name ~= "" and arg_75_1.actors_[var_78_19.prefab_name] ~= nil then
						local var_78_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_19.prefab_name].transform, "story_v_out_319321", "319321018", "story_v_out_319321.awb")

						arg_75_1:RecordAudio("319321018", var_78_25)
						arg_75_1:RecordAudio("319321018", var_78_25)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319321", "319321018", "story_v_out_319321.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319321", "319321018", "story_v_out_319321.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_26 = math.max(var_78_17, arg_75_1.talkMaxDuration)

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_26 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_16) / var_78_26

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_16 + var_78_26 and arg_75_1.time_ < var_78_16 + var_78_26 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play319321019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319321019
		arg_79_1.duration_ = 7.133

		local var_79_0 = {
			zh = 3.166,
			ja = 7.133
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
				arg_79_0:Play319321020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10079ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect10079ui_story == nil then
				arg_79_1.var_.characterEffect10079ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect10079ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_79_1.var_.characterEffect10079ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect10079ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_79_1.var_.characterEffect10079ui_story.fillRatio = var_82_5
			end

			local var_82_6 = arg_79_1.actors_["4040ui_story"].transform
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 then
				arg_79_1.var_.moveOldPos4040ui_story = var_82_6.localPosition
			end

			local var_82_8 = 0.001

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8
				local var_82_10 = Vector3.New(-0.7, -1.55, -5.5)

				var_82_6.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos4040ui_story, var_82_10, var_82_9)

				local var_82_11 = manager.ui.mainCamera.transform.position - var_82_6.position

				var_82_6.forward = Vector3.New(var_82_11.x, var_82_11.y, var_82_11.z)

				local var_82_12 = var_82_6.localEulerAngles

				var_82_12.z = 0
				var_82_12.x = 0
				var_82_6.localEulerAngles = var_82_12
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 then
				var_82_6.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_82_13 = manager.ui.mainCamera.transform.position - var_82_6.position

				var_82_6.forward = Vector3.New(var_82_13.x, var_82_13.y, var_82_13.z)

				local var_82_14 = var_82_6.localEulerAngles

				var_82_14.z = 0
				var_82_14.x = 0
				var_82_6.localEulerAngles = var_82_14
			end

			local var_82_15 = arg_79_1.actors_["4040ui_story"]
			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 and arg_79_1.var_.characterEffect4040ui_story == nil then
				arg_79_1.var_.characterEffect4040ui_story = var_82_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_17 = 0.200000002980232

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_17 then
				local var_82_18 = (arg_79_1.time_ - var_82_16) / var_82_17

				if arg_79_1.var_.characterEffect4040ui_story then
					arg_79_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_16 + var_82_17 and arg_79_1.time_ < var_82_16 + var_82_17 + arg_82_0 and arg_79_1.var_.characterEffect4040ui_story then
				arg_79_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_82_19 = 0

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_20 = arg_79_1.actors_["10079ui_story"].transform
			local var_82_21 = 0

			if var_82_21 < arg_79_1.time_ and arg_79_1.time_ <= var_82_21 + arg_82_0 then
				arg_79_1.var_.moveOldPos10079ui_story = var_82_20.localPosition

				local var_82_22 = "10079ui_story"

				arg_79_1:ShowWeapon(arg_79_1.var_[var_82_22 .. "Animator"].transform, false)
			end

			local var_82_23 = 0.001

			if var_82_21 <= arg_79_1.time_ and arg_79_1.time_ < var_82_21 + var_82_23 then
				local var_82_24 = (arg_79_1.time_ - var_82_21) / var_82_23
				local var_82_25 = Vector3.New(0.7, -0.95, -6.05)

				var_82_20.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10079ui_story, var_82_25, var_82_24)

				local var_82_26 = manager.ui.mainCamera.transform.position - var_82_20.position

				var_82_20.forward = Vector3.New(var_82_26.x, var_82_26.y, var_82_26.z)

				local var_82_27 = var_82_20.localEulerAngles

				var_82_27.z = 0
				var_82_27.x = 0
				var_82_20.localEulerAngles = var_82_27
			end

			if arg_79_1.time_ >= var_82_21 + var_82_23 and arg_79_1.time_ < var_82_21 + var_82_23 + arg_82_0 then
				var_82_20.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_82_28 = manager.ui.mainCamera.transform.position - var_82_20.position

				var_82_20.forward = Vector3.New(var_82_28.x, var_82_28.y, var_82_28.z)

				local var_82_29 = var_82_20.localEulerAngles

				var_82_29.z = 0
				var_82_29.x = 0
				var_82_20.localEulerAngles = var_82_29
			end

			local var_82_30 = 0

			if var_82_30 < arg_79_1.time_ and arg_79_1.time_ <= var_82_30 + arg_82_0 then
				arg_79_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_82_31 = 0
			local var_82_32 = 0.4

			if var_82_31 < arg_79_1.time_ and arg_79_1.time_ <= var_82_31 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_33 = arg_79_1:FormatText(StoryNameCfg[668].name)

				arg_79_1.leftNameTxt_.text = var_82_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_34 = arg_79_1:GetWordFromCfg(319321019)
				local var_82_35 = arg_79_1:FormatText(var_82_34.content)

				arg_79_1.text_.text = var_82_35

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_36 = 16
				local var_82_37 = utf8.len(var_82_35)
				local var_82_38 = var_82_36 <= 0 and var_82_32 or var_82_32 * (var_82_37 / var_82_36)

				if var_82_38 > 0 and var_82_32 < var_82_38 then
					arg_79_1.talkMaxDuration = var_82_38

					if var_82_38 + var_82_31 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_38 + var_82_31
					end
				end

				arg_79_1.text_.text = var_82_35
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321019", "story_v_out_319321.awb") ~= 0 then
					local var_82_39 = manager.audio:GetVoiceLength("story_v_out_319321", "319321019", "story_v_out_319321.awb") / 1000

					if var_82_39 + var_82_31 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_39 + var_82_31
					end

					if var_82_34.prefab_name ~= "" and arg_79_1.actors_[var_82_34.prefab_name] ~= nil then
						local var_82_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_34.prefab_name].transform, "story_v_out_319321", "319321019", "story_v_out_319321.awb")

						arg_79_1:RecordAudio("319321019", var_82_40)
						arg_79_1:RecordAudio("319321019", var_82_40)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_319321", "319321019", "story_v_out_319321.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_319321", "319321019", "story_v_out_319321.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_41 = math.max(var_82_32, arg_79_1.talkMaxDuration)

			if var_82_31 <= arg_79_1.time_ and arg_79_1.time_ < var_82_31 + var_82_41 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_31) / var_82_41

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_31 + var_82_41 and arg_79_1.time_ < var_82_31 + var_82_41 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play319321020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319321020
		arg_83_1.duration_ = 2.233

		local var_83_0 = {
			zh = 1.999999999999,
			ja = 2.233
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
				arg_83_0:Play319321021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10079ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos10079ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0.7, -0.95, -6.05)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10079ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["10079ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect10079ui_story == nil then
				arg_83_1.var_.characterEffect10079ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect10079ui_story then
					arg_83_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect10079ui_story then
				arg_83_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_86_15 = arg_83_1.actors_["4040ui_story"]
			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 and arg_83_1.var_.characterEffect4040ui_story == nil then
				arg_83_1.var_.characterEffect4040ui_story = var_86_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_17 = 0.200000002980232

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17

				if arg_83_1.var_.characterEffect4040ui_story then
					local var_86_19 = Mathf.Lerp(0, 0.5, var_86_18)

					arg_83_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_83_1.var_.characterEffect4040ui_story.fillRatio = var_86_19
				end
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 and arg_83_1.var_.characterEffect4040ui_story then
				local var_86_20 = 0.5

				arg_83_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_83_1.var_.characterEffect4040ui_story.fillRatio = var_86_20
			end

			local var_86_21 = 0
			local var_86_22 = 0.225

			if var_86_21 < arg_83_1.time_ and arg_83_1.time_ <= var_86_21 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_23 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_24 = arg_83_1:GetWordFromCfg(319321020)
				local var_86_25 = arg_83_1:FormatText(var_86_24.content)

				arg_83_1.text_.text = var_86_25

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_26 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321020", "story_v_out_319321.awb") ~= 0 then
					local var_86_29 = manager.audio:GetVoiceLength("story_v_out_319321", "319321020", "story_v_out_319321.awb") / 1000

					if var_86_29 + var_86_21 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_29 + var_86_21
					end

					if var_86_24.prefab_name ~= "" and arg_83_1.actors_[var_86_24.prefab_name] ~= nil then
						local var_86_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_24.prefab_name].transform, "story_v_out_319321", "319321020", "story_v_out_319321.awb")

						arg_83_1:RecordAudio("319321020", var_86_30)
						arg_83_1:RecordAudio("319321020", var_86_30)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_319321", "319321020", "story_v_out_319321.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_319321", "319321020", "story_v_out_319321.awb")
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
	Play319321021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319321021
		arg_87_1.duration_ = 7.4

		local var_87_0 = {
			zh = 6.833,
			ja = 7.4
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
				arg_87_0:Play319321022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10079ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect10079ui_story == nil then
				arg_87_1.var_.characterEffect10079ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect10079ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_87_1.var_.characterEffect10079ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect10079ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_87_1.var_.characterEffect10079ui_story.fillRatio = var_90_5
			end

			local var_90_6 = arg_87_1.actors_["4040ui_story"]
			local var_90_7 = 0

			if var_90_7 < arg_87_1.time_ and arg_87_1.time_ <= var_90_7 + arg_90_0 and arg_87_1.var_.characterEffect4040ui_story == nil then
				arg_87_1.var_.characterEffect4040ui_story = var_90_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_8 = 0.200000002980232

			if var_90_7 <= arg_87_1.time_ and arg_87_1.time_ < var_90_7 + var_90_8 then
				local var_90_9 = (arg_87_1.time_ - var_90_7) / var_90_8

				if arg_87_1.var_.characterEffect4040ui_story then
					arg_87_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_7 + var_90_8 and arg_87_1.time_ < var_90_7 + var_90_8 + arg_90_0 and arg_87_1.var_.characterEffect4040ui_story then
				arg_87_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_90_10 = 0
			local var_90_11 = 0.8

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_12 = arg_87_1:FormatText(StoryNameCfg[668].name)

				arg_87_1.leftNameTxt_.text = var_90_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_13 = arg_87_1:GetWordFromCfg(319321021)
				local var_90_14 = arg_87_1:FormatText(var_90_13.content)

				arg_87_1.text_.text = var_90_14

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_15 = 32
				local var_90_16 = utf8.len(var_90_14)
				local var_90_17 = var_90_15 <= 0 and var_90_11 or var_90_11 * (var_90_16 / var_90_15)

				if var_90_17 > 0 and var_90_11 < var_90_17 then
					arg_87_1.talkMaxDuration = var_90_17

					if var_90_17 + var_90_10 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_17 + var_90_10
					end
				end

				arg_87_1.text_.text = var_90_14
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321021", "story_v_out_319321.awb") ~= 0 then
					local var_90_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321021", "story_v_out_319321.awb") / 1000

					if var_90_18 + var_90_10 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_18 + var_90_10
					end

					if var_90_13.prefab_name ~= "" and arg_87_1.actors_[var_90_13.prefab_name] ~= nil then
						local var_90_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_13.prefab_name].transform, "story_v_out_319321", "319321021", "story_v_out_319321.awb")

						arg_87_1:RecordAudio("319321021", var_90_19)
						arg_87_1:RecordAudio("319321021", var_90_19)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319321", "319321021", "story_v_out_319321.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319321", "319321021", "story_v_out_319321.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_20 = math.max(var_90_11, arg_87_1.talkMaxDuration)

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_20 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_10) / var_90_20

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_10 + var_90_20 and arg_87_1.time_ < var_90_10 + var_90_20 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319321022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319321022
		arg_91_1.duration_ = 6.2

		local var_91_0 = {
			zh = 6.2,
			ja = 5.2
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
				arg_91_0:Play319321023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.625

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[668].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(319321022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321022", "story_v_out_319321.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_319321", "319321022", "story_v_out_319321.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_319321", "319321022", "story_v_out_319321.awb")

						arg_91_1:RecordAudio("319321022", var_94_9)
						arg_91_1:RecordAudio("319321022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319321", "319321022", "story_v_out_319321.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319321", "319321022", "story_v_out_319321.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319321023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319321023
		arg_95_1.duration_ = 8

		local var_95_0 = {
			zh = 3.4,
			ja = 8
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
				arg_95_0:Play319321024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["4040ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos4040ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos4040ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["4040ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect4040ui_story == nil then
				arg_95_1.var_.characterEffect4040ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect4040ui_story then
					arg_95_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect4040ui_story then
				arg_95_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_2")
			end

			local var_98_15 = 0
			local var_98_16 = 0.35

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_17 = arg_95_1:FormatText(StoryNameCfg[668].name)

				arg_95_1.leftNameTxt_.text = var_98_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_18 = arg_95_1:GetWordFromCfg(319321023)
				local var_98_19 = arg_95_1:FormatText(var_98_18.content)

				arg_95_1.text_.text = var_98_19

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_20 = 14
				local var_98_21 = utf8.len(var_98_19)
				local var_98_22 = var_98_20 <= 0 and var_98_16 or var_98_16 * (var_98_21 / var_98_20)

				if var_98_22 > 0 and var_98_16 < var_98_22 then
					arg_95_1.talkMaxDuration = var_98_22

					if var_98_22 + var_98_15 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_22 + var_98_15
					end
				end

				arg_95_1.text_.text = var_98_19
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321023", "story_v_out_319321.awb") ~= 0 then
					local var_98_23 = manager.audio:GetVoiceLength("story_v_out_319321", "319321023", "story_v_out_319321.awb") / 1000

					if var_98_23 + var_98_15 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_23 + var_98_15
					end

					if var_98_18.prefab_name ~= "" and arg_95_1.actors_[var_98_18.prefab_name] ~= nil then
						local var_98_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_18.prefab_name].transform, "story_v_out_319321", "319321023", "story_v_out_319321.awb")

						arg_95_1:RecordAudio("319321023", var_98_24)
						arg_95_1:RecordAudio("319321023", var_98_24)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_319321", "319321023", "story_v_out_319321.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_319321", "319321023", "story_v_out_319321.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_25 = math.max(var_98_16, arg_95_1.talkMaxDuration)

			if var_98_15 <= arg_95_1.time_ and arg_95_1.time_ < var_98_15 + var_98_25 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_15) / var_98_25

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_15 + var_98_25 and arg_95_1.time_ < var_98_15 + var_98_25 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319321024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319321024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play319321025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["4040ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect4040ui_story == nil then
				arg_99_1.var_.characterEffect4040ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect4040ui_story then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_99_1.var_.characterEffect4040ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect4040ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_99_1.var_.characterEffect4040ui_story.fillRatio = var_102_5
			end

			local var_102_6 = 0
			local var_102_7 = 1.175

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_8 = arg_99_1:GetWordFromCfg(319321024)
				local var_102_9 = arg_99_1:FormatText(var_102_8.content)

				arg_99_1.text_.text = var_102_9

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_10 = 47
				local var_102_11 = utf8.len(var_102_9)
				local var_102_12 = var_102_10 <= 0 and var_102_7 or var_102_7 * (var_102_11 / var_102_10)

				if var_102_12 > 0 and var_102_7 < var_102_12 then
					arg_99_1.talkMaxDuration = var_102_12

					if var_102_12 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_12 + var_102_6
					end
				end

				arg_99_1.text_.text = var_102_9
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_13 = math.max(var_102_7, arg_99_1.talkMaxDuration)

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_13 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_6) / var_102_13

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_6 + var_102_13 and arg_99_1.time_ < var_102_6 + var_102_13 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play319321025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319321025
		arg_103_1.duration_ = 6.3

		local var_103_0 = {
			zh = 5.633,
			ja = 6.3
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
				arg_103_0:Play319321026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["4040ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect4040ui_story == nil then
				arg_103_1.var_.characterEffect4040ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect4040ui_story then
					arg_103_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect4040ui_story then
				arg_103_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_106_4 = 0
			local var_106_5 = 0.55

			if var_106_4 < arg_103_1.time_ and arg_103_1.time_ <= var_106_4 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_6 = arg_103_1:FormatText(StoryNameCfg[668].name)

				arg_103_1.leftNameTxt_.text = var_106_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_7 = arg_103_1:GetWordFromCfg(319321025)
				local var_106_8 = arg_103_1:FormatText(var_106_7.content)

				arg_103_1.text_.text = var_106_8

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_9 = 22
				local var_106_10 = utf8.len(var_106_8)
				local var_106_11 = var_106_9 <= 0 and var_106_5 or var_106_5 * (var_106_10 / var_106_9)

				if var_106_11 > 0 and var_106_5 < var_106_11 then
					arg_103_1.talkMaxDuration = var_106_11

					if var_106_11 + var_106_4 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_11 + var_106_4
					end
				end

				arg_103_1.text_.text = var_106_8
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321025", "story_v_out_319321.awb") ~= 0 then
					local var_106_12 = manager.audio:GetVoiceLength("story_v_out_319321", "319321025", "story_v_out_319321.awb") / 1000

					if var_106_12 + var_106_4 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_12 + var_106_4
					end

					if var_106_7.prefab_name ~= "" and arg_103_1.actors_[var_106_7.prefab_name] ~= nil then
						local var_106_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_7.prefab_name].transform, "story_v_out_319321", "319321025", "story_v_out_319321.awb")

						arg_103_1:RecordAudio("319321025", var_106_13)
						arg_103_1:RecordAudio("319321025", var_106_13)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_319321", "319321025", "story_v_out_319321.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_319321", "319321025", "story_v_out_319321.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_14 = math.max(var_106_5, arg_103_1.talkMaxDuration)

			if var_106_4 <= arg_103_1.time_ and arg_103_1.time_ < var_106_4 + var_106_14 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_4) / var_106_14

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_4 + var_106_14 and arg_103_1.time_ < var_106_4 + var_106_14 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play319321026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319321026
		arg_107_1.duration_ = 6.866

		local var_107_0 = {
			zh = 4.4,
			ja = 6.866
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
				arg_107_0:Play319321027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10079ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos10079ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0.7, -0.95, -6.05)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10079ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["10079ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect10079ui_story == nil then
				arg_107_1.var_.characterEffect10079ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect10079ui_story then
					arg_107_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect10079ui_story then
				arg_107_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_110_13 = 0

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action435")
			end

			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				arg_107_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_110_15 = arg_107_1.actors_["4040ui_story"]
			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 and arg_107_1.var_.characterEffect4040ui_story == nil then
				arg_107_1.var_.characterEffect4040ui_story = var_110_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_17 = 0.200000002980232

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17

				if arg_107_1.var_.characterEffect4040ui_story then
					local var_110_19 = Mathf.Lerp(0, 0.5, var_110_18)

					arg_107_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_107_1.var_.characterEffect4040ui_story.fillRatio = var_110_19
				end
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 and arg_107_1.var_.characterEffect4040ui_story then
				local var_110_20 = 0.5

				arg_107_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_107_1.var_.characterEffect4040ui_story.fillRatio = var_110_20
			end

			local var_110_21 = 0
			local var_110_22 = 0.525

			if var_110_21 < arg_107_1.time_ and arg_107_1.time_ <= var_110_21 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_23 = arg_107_1:FormatText(StoryNameCfg[6].name)

				arg_107_1.leftNameTxt_.text = var_110_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_24 = arg_107_1:GetWordFromCfg(319321026)
				local var_110_25 = arg_107_1:FormatText(var_110_24.content)

				arg_107_1.text_.text = var_110_25

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_26 = 21
				local var_110_27 = utf8.len(var_110_25)
				local var_110_28 = var_110_26 <= 0 and var_110_22 or var_110_22 * (var_110_27 / var_110_26)

				if var_110_28 > 0 and var_110_22 < var_110_28 then
					arg_107_1.talkMaxDuration = var_110_28

					if var_110_28 + var_110_21 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_28 + var_110_21
					end
				end

				arg_107_1.text_.text = var_110_25
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321026", "story_v_out_319321.awb") ~= 0 then
					local var_110_29 = manager.audio:GetVoiceLength("story_v_out_319321", "319321026", "story_v_out_319321.awb") / 1000

					if var_110_29 + var_110_21 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_29 + var_110_21
					end

					if var_110_24.prefab_name ~= "" and arg_107_1.actors_[var_110_24.prefab_name] ~= nil then
						local var_110_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_24.prefab_name].transform, "story_v_out_319321", "319321026", "story_v_out_319321.awb")

						arg_107_1:RecordAudio("319321026", var_110_30)
						arg_107_1:RecordAudio("319321026", var_110_30)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_319321", "319321026", "story_v_out_319321.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_319321", "319321026", "story_v_out_319321.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_31 = math.max(var_110_22, arg_107_1.talkMaxDuration)

			if var_110_21 <= arg_107_1.time_ and arg_107_1.time_ < var_110_21 + var_110_31 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_21) / var_110_31

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_21 + var_110_31 and arg_107_1.time_ < var_110_21 + var_110_31 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play319321027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 319321027
		arg_111_1.duration_ = 6.9

		local var_111_0 = {
			zh = 3.7,
			ja = 6.9
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
				arg_111_0:Play319321028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10079ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect10079ui_story == nil then
				arg_111_1.var_.characterEffect10079ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect10079ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_111_1.var_.characterEffect10079ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect10079ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_111_1.var_.characterEffect10079ui_story.fillRatio = var_114_5
			end

			local var_114_6 = arg_111_1.actors_["4040ui_story"]
			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 and arg_111_1.var_.characterEffect4040ui_story == nil then
				arg_111_1.var_.characterEffect4040ui_story = var_114_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_8 = 0.200000002980232

			if var_114_7 <= arg_111_1.time_ and arg_111_1.time_ < var_114_7 + var_114_8 then
				local var_114_9 = (arg_111_1.time_ - var_114_7) / var_114_8

				if arg_111_1.var_.characterEffect4040ui_story then
					arg_111_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_7 + var_114_8 and arg_111_1.time_ < var_114_7 + var_114_8 + arg_114_0 and arg_111_1.var_.characterEffect4040ui_story then
				arg_111_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_114_10 = 0
			local var_114_11 = 0.35

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_12 = arg_111_1:FormatText(StoryNameCfg[668].name)

				arg_111_1.leftNameTxt_.text = var_114_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_13 = arg_111_1:GetWordFromCfg(319321027)
				local var_114_14 = arg_111_1:FormatText(var_114_13.content)

				arg_111_1.text_.text = var_114_14

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_15 = 14
				local var_114_16 = utf8.len(var_114_14)
				local var_114_17 = var_114_15 <= 0 and var_114_11 or var_114_11 * (var_114_16 / var_114_15)

				if var_114_17 > 0 and var_114_11 < var_114_17 then
					arg_111_1.talkMaxDuration = var_114_17

					if var_114_17 + var_114_10 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_17 + var_114_10
					end
				end

				arg_111_1.text_.text = var_114_14
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321027", "story_v_out_319321.awb") ~= 0 then
					local var_114_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321027", "story_v_out_319321.awb") / 1000

					if var_114_18 + var_114_10 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_18 + var_114_10
					end

					if var_114_13.prefab_name ~= "" and arg_111_1.actors_[var_114_13.prefab_name] ~= nil then
						local var_114_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_13.prefab_name].transform, "story_v_out_319321", "319321027", "story_v_out_319321.awb")

						arg_111_1:RecordAudio("319321027", var_114_19)
						arg_111_1:RecordAudio("319321027", var_114_19)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_319321", "319321027", "story_v_out_319321.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_319321", "319321027", "story_v_out_319321.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_20 = math.max(var_114_11, arg_111_1.talkMaxDuration)

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_20 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_10) / var_114_20

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_10 + var_114_20 and arg_111_1.time_ < var_114_10 + var_114_20 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play319321028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 319321028
		arg_115_1.duration_ = 7.533

		local var_115_0 = {
			zh = 2.1,
			ja = 7.533
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
				arg_115_0:Play319321029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10079ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect10079ui_story == nil then
				arg_115_1.var_.characterEffect10079ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.200000002980232

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect10079ui_story then
					arg_115_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect10079ui_story then
				arg_115_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_118_4 = arg_115_1.actors_["4040ui_story"]
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 and arg_115_1.var_.characterEffect4040ui_story == nil then
				arg_115_1.var_.characterEffect4040ui_story = var_118_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_6 = 0.200000002980232

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_6 then
				local var_118_7 = (arg_115_1.time_ - var_118_5) / var_118_6

				if arg_115_1.var_.characterEffect4040ui_story then
					local var_118_8 = Mathf.Lerp(0, 0.5, var_118_7)

					arg_115_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_115_1.var_.characterEffect4040ui_story.fillRatio = var_118_8
				end
			end

			if arg_115_1.time_ >= var_118_5 + var_118_6 and arg_115_1.time_ < var_118_5 + var_118_6 + arg_118_0 and arg_115_1.var_.characterEffect4040ui_story then
				local var_118_9 = 0.5

				arg_115_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_115_1.var_.characterEffect4040ui_story.fillRatio = var_118_9
			end

			local var_118_10 = 0
			local var_118_11 = 0.225

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_12 = arg_115_1:FormatText(StoryNameCfg[6].name)

				arg_115_1.leftNameTxt_.text = var_118_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_13 = arg_115_1:GetWordFromCfg(319321028)
				local var_118_14 = arg_115_1:FormatText(var_118_13.content)

				arg_115_1.text_.text = var_118_14

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_15 = 9
				local var_118_16 = utf8.len(var_118_14)
				local var_118_17 = var_118_15 <= 0 and var_118_11 or var_118_11 * (var_118_16 / var_118_15)

				if var_118_17 > 0 and var_118_11 < var_118_17 then
					arg_115_1.talkMaxDuration = var_118_17

					if var_118_17 + var_118_10 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_17 + var_118_10
					end
				end

				arg_115_1.text_.text = var_118_14
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321028", "story_v_out_319321.awb") ~= 0 then
					local var_118_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321028", "story_v_out_319321.awb") / 1000

					if var_118_18 + var_118_10 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_18 + var_118_10
					end

					if var_118_13.prefab_name ~= "" and arg_115_1.actors_[var_118_13.prefab_name] ~= nil then
						local var_118_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_13.prefab_name].transform, "story_v_out_319321", "319321028", "story_v_out_319321.awb")

						arg_115_1:RecordAudio("319321028", var_118_19)
						arg_115_1:RecordAudio("319321028", var_118_19)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_319321", "319321028", "story_v_out_319321.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_319321", "319321028", "story_v_out_319321.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_20 = math.max(var_118_11, arg_115_1.talkMaxDuration)

			if var_118_10 <= arg_115_1.time_ and arg_115_1.time_ < var_118_10 + var_118_20 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_10) / var_118_20

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_10 + var_118_20 and arg_115_1.time_ < var_118_10 + var_118_20 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play319321029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319321029
		arg_119_1.duration_ = 5.466

		local var_119_0 = {
			zh = 2.3,
			ja = 5.466
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
				arg_119_0:Play319321030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10079ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect10079ui_story == nil then
				arg_119_1.var_.characterEffect10079ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.200000002980232

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect10079ui_story then
					local var_122_4 = Mathf.Lerp(0, 0.5, var_122_3)

					arg_119_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_119_1.var_.characterEffect10079ui_story.fillRatio = var_122_4
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect10079ui_story then
				local var_122_5 = 0.5

				arg_119_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_119_1.var_.characterEffect10079ui_story.fillRatio = var_122_5
			end

			local var_122_6 = arg_119_1.actors_["4040ui_story"]
			local var_122_7 = 0

			if var_122_7 < arg_119_1.time_ and arg_119_1.time_ <= var_122_7 + arg_122_0 and arg_119_1.var_.characterEffect4040ui_story == nil then
				arg_119_1.var_.characterEffect4040ui_story = var_122_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_8 = 0.200000002980232

			if var_122_7 <= arg_119_1.time_ and arg_119_1.time_ < var_122_7 + var_122_8 then
				local var_122_9 = (arg_119_1.time_ - var_122_7) / var_122_8

				if arg_119_1.var_.characterEffect4040ui_story then
					arg_119_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_7 + var_122_8 and arg_119_1.time_ < var_122_7 + var_122_8 + arg_122_0 and arg_119_1.var_.characterEffect4040ui_story then
				arg_119_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_122_10 = 0
			local var_122_11 = 0.275

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_12 = arg_119_1:FormatText(StoryNameCfg[668].name)

				arg_119_1.leftNameTxt_.text = var_122_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_13 = arg_119_1:GetWordFromCfg(319321029)
				local var_122_14 = arg_119_1:FormatText(var_122_13.content)

				arg_119_1.text_.text = var_122_14

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_15 = 11
				local var_122_16 = utf8.len(var_122_14)
				local var_122_17 = var_122_15 <= 0 and var_122_11 or var_122_11 * (var_122_16 / var_122_15)

				if var_122_17 > 0 and var_122_11 < var_122_17 then
					arg_119_1.talkMaxDuration = var_122_17

					if var_122_17 + var_122_10 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_17 + var_122_10
					end
				end

				arg_119_1.text_.text = var_122_14
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321029", "story_v_out_319321.awb") ~= 0 then
					local var_122_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321029", "story_v_out_319321.awb") / 1000

					if var_122_18 + var_122_10 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_18 + var_122_10
					end

					if var_122_13.prefab_name ~= "" and arg_119_1.actors_[var_122_13.prefab_name] ~= nil then
						local var_122_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_13.prefab_name].transform, "story_v_out_319321", "319321029", "story_v_out_319321.awb")

						arg_119_1:RecordAudio("319321029", var_122_19)
						arg_119_1:RecordAudio("319321029", var_122_19)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_319321", "319321029", "story_v_out_319321.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_319321", "319321029", "story_v_out_319321.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_20 = math.max(var_122_11, arg_119_1.talkMaxDuration)

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_20 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_10) / var_122_20

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_10 + var_122_20 and arg_119_1.time_ < var_122_10 + var_122_20 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play319321030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319321030
		arg_123_1.duration_ = 15.633

		local var_123_0 = {
			zh = 7.466,
			ja = 15.633
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
				arg_123_0:Play319321031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["4040ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos4040ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos4040ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["4040ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect4040ui_story == nil then
				arg_123_1.var_.characterEffect4040ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect4040ui_story then
					arg_123_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect4040ui_story then
				arg_123_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_126_15 = 0
			local var_126_16 = 0.925

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_17 = arg_123_1:FormatText(StoryNameCfg[668].name)

				arg_123_1.leftNameTxt_.text = var_126_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_18 = arg_123_1:GetWordFromCfg(319321030)
				local var_126_19 = arg_123_1:FormatText(var_126_18.content)

				arg_123_1.text_.text = var_126_19

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_20 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321030", "story_v_out_319321.awb") ~= 0 then
					local var_126_23 = manager.audio:GetVoiceLength("story_v_out_319321", "319321030", "story_v_out_319321.awb") / 1000

					if var_126_23 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_23 + var_126_15
					end

					if var_126_18.prefab_name ~= "" and arg_123_1.actors_[var_126_18.prefab_name] ~= nil then
						local var_126_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_18.prefab_name].transform, "story_v_out_319321", "319321030", "story_v_out_319321.awb")

						arg_123_1:RecordAudio("319321030", var_126_24)
						arg_123_1:RecordAudio("319321030", var_126_24)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_319321", "319321030", "story_v_out_319321.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_319321", "319321030", "story_v_out_319321.awb")
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
	Play319321031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 319321031
		arg_127_1.duration_ = 4.366

		local var_127_0 = {
			zh = 1.999999999999,
			ja = 4.366
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
				arg_127_0:Play319321032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10079ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos10079ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(0.7, -0.95, -6.05)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10079ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["10079ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect10079ui_story == nil then
				arg_127_1.var_.characterEffect10079ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect10079ui_story then
					arg_127_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect10079ui_story then
				arg_127_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_2")
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_130_15 = arg_127_1.actors_["4040ui_story"]
			local var_130_16 = 0

			if var_130_16 < arg_127_1.time_ and arg_127_1.time_ <= var_130_16 + arg_130_0 and arg_127_1.var_.characterEffect4040ui_story == nil then
				arg_127_1.var_.characterEffect4040ui_story = var_130_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_17 = 0.200000002980232

			if var_130_16 <= arg_127_1.time_ and arg_127_1.time_ < var_130_16 + var_130_17 then
				local var_130_18 = (arg_127_1.time_ - var_130_16) / var_130_17

				if arg_127_1.var_.characterEffect4040ui_story then
					local var_130_19 = Mathf.Lerp(0, 0.5, var_130_18)

					arg_127_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_127_1.var_.characterEffect4040ui_story.fillRatio = var_130_19
				end
			end

			if arg_127_1.time_ >= var_130_16 + var_130_17 and arg_127_1.time_ < var_130_16 + var_130_17 + arg_130_0 and arg_127_1.var_.characterEffect4040ui_story then
				local var_130_20 = 0.5

				arg_127_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_127_1.var_.characterEffect4040ui_story.fillRatio = var_130_20
			end

			local var_130_21 = 0
			local var_130_22 = 0.175

			if var_130_21 < arg_127_1.time_ and arg_127_1.time_ <= var_130_21 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_23 = arg_127_1:FormatText(StoryNameCfg[6].name)

				arg_127_1.leftNameTxt_.text = var_130_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_24 = arg_127_1:GetWordFromCfg(319321031)
				local var_130_25 = arg_127_1:FormatText(var_130_24.content)

				arg_127_1.text_.text = var_130_25

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_26 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321031", "story_v_out_319321.awb") ~= 0 then
					local var_130_29 = manager.audio:GetVoiceLength("story_v_out_319321", "319321031", "story_v_out_319321.awb") / 1000

					if var_130_29 + var_130_21 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_29 + var_130_21
					end

					if var_130_24.prefab_name ~= "" and arg_127_1.actors_[var_130_24.prefab_name] ~= nil then
						local var_130_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_24.prefab_name].transform, "story_v_out_319321", "319321031", "story_v_out_319321.awb")

						arg_127_1:RecordAudio("319321031", var_130_30)
						arg_127_1:RecordAudio("319321031", var_130_30)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_319321", "319321031", "story_v_out_319321.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_319321", "319321031", "story_v_out_319321.awb")
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
	Play319321032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 319321032
		arg_131_1.duration_ = 3.533

		local var_131_0 = {
			zh = 1.999999999999,
			ja = 3.533
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
				arg_131_0:Play319321033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10079ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect10079ui_story == nil then
				arg_131_1.var_.characterEffect10079ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.200000002980232

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect10079ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_131_1.var_.characterEffect10079ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect10079ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_131_1.var_.characterEffect10079ui_story.fillRatio = var_134_5
			end

			local var_134_6 = arg_131_1.actors_["4040ui_story"]
			local var_134_7 = 0

			if var_134_7 < arg_131_1.time_ and arg_131_1.time_ <= var_134_7 + arg_134_0 and arg_131_1.var_.characterEffect4040ui_story == nil then
				arg_131_1.var_.characterEffect4040ui_story = var_134_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_8 = 0.200000002980232

			if var_134_7 <= arg_131_1.time_ and arg_131_1.time_ < var_134_7 + var_134_8 then
				local var_134_9 = (arg_131_1.time_ - var_134_7) / var_134_8

				if arg_131_1.var_.characterEffect4040ui_story then
					arg_131_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_7 + var_134_8 and arg_131_1.time_ < var_134_7 + var_134_8 + arg_134_0 and arg_131_1.var_.characterEffect4040ui_story then
				arg_131_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 then
				arg_131_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_134_11 = 0

			if var_134_11 < arg_131_1.time_ and arg_131_1.time_ <= var_134_11 + arg_134_0 then
				arg_131_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_134_12 = 0
			local var_134_13 = 0.075

			if var_134_12 < arg_131_1.time_ and arg_131_1.time_ <= var_134_12 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_14 = arg_131_1:FormatText(StoryNameCfg[668].name)

				arg_131_1.leftNameTxt_.text = var_134_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_15 = arg_131_1:GetWordFromCfg(319321032)
				local var_134_16 = arg_131_1:FormatText(var_134_15.content)

				arg_131_1.text_.text = var_134_16

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_17 = 3
				local var_134_18 = utf8.len(var_134_16)
				local var_134_19 = var_134_17 <= 0 and var_134_13 or var_134_13 * (var_134_18 / var_134_17)

				if var_134_19 > 0 and var_134_13 < var_134_19 then
					arg_131_1.talkMaxDuration = var_134_19

					if var_134_19 + var_134_12 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_19 + var_134_12
					end
				end

				arg_131_1.text_.text = var_134_16
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321032", "story_v_out_319321.awb") ~= 0 then
					local var_134_20 = manager.audio:GetVoiceLength("story_v_out_319321", "319321032", "story_v_out_319321.awb") / 1000

					if var_134_20 + var_134_12 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_20 + var_134_12
					end

					if var_134_15.prefab_name ~= "" and arg_131_1.actors_[var_134_15.prefab_name] ~= nil then
						local var_134_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_15.prefab_name].transform, "story_v_out_319321", "319321032", "story_v_out_319321.awb")

						arg_131_1:RecordAudio("319321032", var_134_21)
						arg_131_1:RecordAudio("319321032", var_134_21)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_319321", "319321032", "story_v_out_319321.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_319321", "319321032", "story_v_out_319321.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_22 = math.max(var_134_13, arg_131_1.talkMaxDuration)

			if var_134_12 <= arg_131_1.time_ and arg_131_1.time_ < var_134_12 + var_134_22 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_12) / var_134_22

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_12 + var_134_22 and arg_131_1.time_ < var_134_12 + var_134_22 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play319321033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 319321033
		arg_135_1.duration_ = 3.233

		local var_135_0 = {
			zh = 1.999999999999,
			ja = 3.233
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
				arg_135_0:Play319321034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = "1095ui_story"

			if arg_135_1.actors_[var_138_0] == nil then
				local var_138_1 = Object.Instantiate(Asset.Load("Char/" .. var_138_0), arg_135_1.stage_.transform)

				var_138_1.name = var_138_0
				var_138_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_135_1.actors_[var_138_0] = var_138_1

				local var_138_2 = var_138_1:GetComponentInChildren(typeof(CharacterEffect))

				var_138_2.enabled = true

				local var_138_3 = GameObjectTools.GetOrAddComponent(var_138_1, typeof(DynamicBoneHelper))

				if var_138_3 then
					var_138_3:EnableDynamicBone(false)
				end

				arg_135_1:ShowWeapon(var_138_2.transform, false)

				arg_135_1.var_[var_138_0 .. "Animator"] = var_138_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_135_1.var_[var_138_0 .. "Animator"].applyRootMotion = true
				arg_135_1.var_[var_138_0 .. "LipSync"] = var_138_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_138_4 = arg_135_1.actors_["1095ui_story"].transform
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1.var_.moveOldPos1095ui_story = var_138_4.localPosition
			end

			local var_138_6 = 0.001

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6
				local var_138_8 = Vector3.New(0, -0.98, -6.1)

				var_138_4.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1095ui_story, var_138_8, var_138_7)

				local var_138_9 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_9.x, var_138_9.y, var_138_9.z)

				local var_138_10 = var_138_4.localEulerAngles

				var_138_10.z = 0
				var_138_10.x = 0
				var_138_4.localEulerAngles = var_138_10
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 then
				var_138_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_138_11 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_11.x, var_138_11.y, var_138_11.z)

				local var_138_12 = var_138_4.localEulerAngles

				var_138_12.z = 0
				var_138_12.x = 0
				var_138_4.localEulerAngles = var_138_12
			end

			local var_138_13 = arg_135_1.actors_["1095ui_story"]
			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story == nil then
				arg_135_1.var_.characterEffect1095ui_story = var_138_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_15 = 0.200000002980232

			if var_138_14 <= arg_135_1.time_ and arg_135_1.time_ < var_138_14 + var_138_15 then
				local var_138_16 = (arg_135_1.time_ - var_138_14) / var_138_15

				if arg_135_1.var_.characterEffect1095ui_story then
					arg_135_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_14 + var_138_15 and arg_135_1.time_ < var_138_14 + var_138_15 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story then
				arg_135_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_138_17 = 0

			if var_138_17 < arg_135_1.time_ and arg_135_1.time_ <= var_138_17 + arg_138_0 then
				arg_135_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_138_18 = 0

			if var_138_18 < arg_135_1.time_ and arg_135_1.time_ <= var_138_18 + arg_138_0 then
				arg_135_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_138_19 = arg_135_1.actors_["4040ui_story"].transform
			local var_138_20 = 0

			if var_138_20 < arg_135_1.time_ and arg_135_1.time_ <= var_138_20 + arg_138_0 then
				arg_135_1.var_.moveOldPos4040ui_story = var_138_19.localPosition
			end

			local var_138_21 = 0.001

			if var_138_20 <= arg_135_1.time_ and arg_135_1.time_ < var_138_20 + var_138_21 then
				local var_138_22 = (arg_135_1.time_ - var_138_20) / var_138_21
				local var_138_23 = Vector3.New(0, 100, 0)

				var_138_19.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos4040ui_story, var_138_23, var_138_22)

				local var_138_24 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_24.x, var_138_24.y, var_138_24.z)

				local var_138_25 = var_138_19.localEulerAngles

				var_138_25.z = 0
				var_138_25.x = 0
				var_138_19.localEulerAngles = var_138_25
			end

			if arg_135_1.time_ >= var_138_20 + var_138_21 and arg_135_1.time_ < var_138_20 + var_138_21 + arg_138_0 then
				var_138_19.localPosition = Vector3.New(0, 100, 0)

				local var_138_26 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_26.x, var_138_26.y, var_138_26.z)

				local var_138_27 = var_138_19.localEulerAngles

				var_138_27.z = 0
				var_138_27.x = 0
				var_138_19.localEulerAngles = var_138_27
			end

			local var_138_28 = arg_135_1.actors_["4040ui_story"]
			local var_138_29 = 0

			if var_138_29 < arg_135_1.time_ and arg_135_1.time_ <= var_138_29 + arg_138_0 and arg_135_1.var_.characterEffect4040ui_story == nil then
				arg_135_1.var_.characterEffect4040ui_story = var_138_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_30 = 0.200000002980232

			if var_138_29 <= arg_135_1.time_ and arg_135_1.time_ < var_138_29 + var_138_30 then
				local var_138_31 = (arg_135_1.time_ - var_138_29) / var_138_30

				if arg_135_1.var_.characterEffect4040ui_story then
					local var_138_32 = Mathf.Lerp(0, 0.5, var_138_31)

					arg_135_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_135_1.var_.characterEffect4040ui_story.fillRatio = var_138_32
				end
			end

			if arg_135_1.time_ >= var_138_29 + var_138_30 and arg_135_1.time_ < var_138_29 + var_138_30 + arg_138_0 and arg_135_1.var_.characterEffect4040ui_story then
				local var_138_33 = 0.5

				arg_135_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_135_1.var_.characterEffect4040ui_story.fillRatio = var_138_33
			end

			local var_138_34 = arg_135_1.actors_["10079ui_story"].transform
			local var_138_35 = 0

			if var_138_35 < arg_135_1.time_ and arg_135_1.time_ <= var_138_35 + arg_138_0 then
				arg_135_1.var_.moveOldPos10079ui_story = var_138_34.localPosition
			end

			local var_138_36 = 0.001

			if var_138_35 <= arg_135_1.time_ and arg_135_1.time_ < var_138_35 + var_138_36 then
				local var_138_37 = (arg_135_1.time_ - var_138_35) / var_138_36
				local var_138_38 = Vector3.New(0, 100, 0)

				var_138_34.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10079ui_story, var_138_38, var_138_37)

				local var_138_39 = manager.ui.mainCamera.transform.position - var_138_34.position

				var_138_34.forward = Vector3.New(var_138_39.x, var_138_39.y, var_138_39.z)

				local var_138_40 = var_138_34.localEulerAngles

				var_138_40.z = 0
				var_138_40.x = 0
				var_138_34.localEulerAngles = var_138_40
			end

			if arg_135_1.time_ >= var_138_35 + var_138_36 and arg_135_1.time_ < var_138_35 + var_138_36 + arg_138_0 then
				var_138_34.localPosition = Vector3.New(0, 100, 0)

				local var_138_41 = manager.ui.mainCamera.transform.position - var_138_34.position

				var_138_34.forward = Vector3.New(var_138_41.x, var_138_41.y, var_138_41.z)

				local var_138_42 = var_138_34.localEulerAngles

				var_138_42.z = 0
				var_138_42.x = 0
				var_138_34.localEulerAngles = var_138_42
			end

			local var_138_43 = arg_135_1.actors_["10079ui_story"]
			local var_138_44 = 0

			if var_138_44 < arg_135_1.time_ and arg_135_1.time_ <= var_138_44 + arg_138_0 and arg_135_1.var_.characterEffect10079ui_story == nil then
				arg_135_1.var_.characterEffect10079ui_story = var_138_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_45 = 0.200000002980232

			if var_138_44 <= arg_135_1.time_ and arg_135_1.time_ < var_138_44 + var_138_45 then
				local var_138_46 = (arg_135_1.time_ - var_138_44) / var_138_45

				if arg_135_1.var_.characterEffect10079ui_story then
					local var_138_47 = Mathf.Lerp(0, 0.5, var_138_46)

					arg_135_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_135_1.var_.characterEffect10079ui_story.fillRatio = var_138_47
				end
			end

			if arg_135_1.time_ >= var_138_44 + var_138_45 and arg_135_1.time_ < var_138_44 + var_138_45 + arg_138_0 and arg_135_1.var_.characterEffect10079ui_story then
				local var_138_48 = 0.5

				arg_135_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_135_1.var_.characterEffect10079ui_story.fillRatio = var_138_48
			end

			local var_138_49 = 0
			local var_138_50 = 0.125

			if var_138_49 < arg_135_1.time_ and arg_135_1.time_ <= var_138_49 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_51 = arg_135_1:FormatText(StoryNameCfg[471].name)

				arg_135_1.leftNameTxt_.text = var_138_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_52 = arg_135_1:GetWordFromCfg(319321033)
				local var_138_53 = arg_135_1:FormatText(var_138_52.content)

				arg_135_1.text_.text = var_138_53

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_54 = 5
				local var_138_55 = utf8.len(var_138_53)
				local var_138_56 = var_138_54 <= 0 and var_138_50 or var_138_50 * (var_138_55 / var_138_54)

				if var_138_56 > 0 and var_138_50 < var_138_56 then
					arg_135_1.talkMaxDuration = var_138_56

					if var_138_56 + var_138_49 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_56 + var_138_49
					end
				end

				arg_135_1.text_.text = var_138_53
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321033", "story_v_out_319321.awb") ~= 0 then
					local var_138_57 = manager.audio:GetVoiceLength("story_v_out_319321", "319321033", "story_v_out_319321.awb") / 1000

					if var_138_57 + var_138_49 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_57 + var_138_49
					end

					if var_138_52.prefab_name ~= "" and arg_135_1.actors_[var_138_52.prefab_name] ~= nil then
						local var_138_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_52.prefab_name].transform, "story_v_out_319321", "319321033", "story_v_out_319321.awb")

						arg_135_1:RecordAudio("319321033", var_138_58)
						arg_135_1:RecordAudio("319321033", var_138_58)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_319321", "319321033", "story_v_out_319321.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_319321", "319321033", "story_v_out_319321.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_59 = math.max(var_138_50, arg_135_1.talkMaxDuration)

			if var_138_49 <= arg_135_1.time_ and arg_135_1.time_ < var_138_49 + var_138_59 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_49) / var_138_59

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_49 + var_138_59 and arg_135_1.time_ < var_138_49 + var_138_59 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play319321034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 319321034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play319321035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1095ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1095ui_story == nil then
				arg_139_1.var_.characterEffect1095ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.200000002980232

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1095ui_story then
					local var_142_4 = Mathf.Lerp(0, 0.5, var_142_3)

					arg_139_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1095ui_story.fillRatio = var_142_4
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1095ui_story then
				local var_142_5 = 0.5

				arg_139_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1095ui_story.fillRatio = var_142_5
			end

			local var_142_6 = 0
			local var_142_7 = 1.25

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_8 = arg_139_1:GetWordFromCfg(319321034)
				local var_142_9 = arg_139_1:FormatText(var_142_8.content)

				arg_139_1.text_.text = var_142_9

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_10 = 50
				local var_142_11 = utf8.len(var_142_9)
				local var_142_12 = var_142_10 <= 0 and var_142_7 or var_142_7 * (var_142_11 / var_142_10)

				if var_142_12 > 0 and var_142_7 < var_142_12 then
					arg_139_1.talkMaxDuration = var_142_12

					if var_142_12 + var_142_6 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_12 + var_142_6
					end
				end

				arg_139_1.text_.text = var_142_9
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_13 = math.max(var_142_7, arg_139_1.talkMaxDuration)

			if var_142_6 <= arg_139_1.time_ and arg_139_1.time_ < var_142_6 + var_142_13 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_6) / var_142_13

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_6 + var_142_13 and arg_139_1.time_ < var_142_6 + var_142_13 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play319321035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 319321035
		arg_143_1.duration_ = 5.066

		local var_143_0 = {
			zh = 4.833,
			ja = 5.066
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
				arg_143_0:Play319321036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1095ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1095ui_story == nil then
				arg_143_1.var_.characterEffect1095ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1095ui_story then
					arg_143_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1095ui_story then
				arg_143_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_146_4 = 0
			local var_146_5 = 0.35

			if var_146_4 < arg_143_1.time_ and arg_143_1.time_ <= var_146_4 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_6 = arg_143_1:FormatText(StoryNameCfg[471].name)

				arg_143_1.leftNameTxt_.text = var_146_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_7 = arg_143_1:GetWordFromCfg(319321035)
				local var_146_8 = arg_143_1:FormatText(var_146_7.content)

				arg_143_1.text_.text = var_146_8

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_9 = 14
				local var_146_10 = utf8.len(var_146_8)
				local var_146_11 = var_146_9 <= 0 and var_146_5 or var_146_5 * (var_146_10 / var_146_9)

				if var_146_11 > 0 and var_146_5 < var_146_11 then
					arg_143_1.talkMaxDuration = var_146_11

					if var_146_11 + var_146_4 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_11 + var_146_4
					end
				end

				arg_143_1.text_.text = var_146_8
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321035", "story_v_out_319321.awb") ~= 0 then
					local var_146_12 = manager.audio:GetVoiceLength("story_v_out_319321", "319321035", "story_v_out_319321.awb") / 1000

					if var_146_12 + var_146_4 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_12 + var_146_4
					end

					if var_146_7.prefab_name ~= "" and arg_143_1.actors_[var_146_7.prefab_name] ~= nil then
						local var_146_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_7.prefab_name].transform, "story_v_out_319321", "319321035", "story_v_out_319321.awb")

						arg_143_1:RecordAudio("319321035", var_146_13)
						arg_143_1:RecordAudio("319321035", var_146_13)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_319321", "319321035", "story_v_out_319321.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_319321", "319321035", "story_v_out_319321.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_14 = math.max(var_146_5, arg_143_1.talkMaxDuration)

			if var_146_4 <= arg_143_1.time_ and arg_143_1.time_ < var_146_4 + var_146_14 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_4) / var_146_14

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_4 + var_146_14 and arg_143_1.time_ < var_146_4 + var_146_14 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play319321036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 319321036
		arg_147_1.duration_ = 5.766

		local var_147_0 = {
			zh = 1.999999999999,
			ja = 5.766
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
				arg_147_0:Play319321037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["4040ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos4040ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(0, -1.55, -5.5)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos4040ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = arg_147_1.actors_["4040ui_story"]
			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 and arg_147_1.var_.characterEffect4040ui_story == nil then
				arg_147_1.var_.characterEffect4040ui_story = var_150_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_11 = 0.200000002980232

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_11 then
				local var_150_12 = (arg_147_1.time_ - var_150_10) / var_150_11

				if arg_147_1.var_.characterEffect4040ui_story then
					arg_147_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_10 + var_150_11 and arg_147_1.time_ < var_150_10 + var_150_11 + arg_150_0 and arg_147_1.var_.characterEffect4040ui_story then
				arg_147_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_150_13 = arg_147_1.actors_["1095ui_story"].transform
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1.var_.moveOldPos1095ui_story = var_150_13.localPosition
			end

			local var_150_15 = 0.001

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_15 then
				local var_150_16 = (arg_147_1.time_ - var_150_14) / var_150_15
				local var_150_17 = Vector3.New(0, 100, 0)

				var_150_13.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1095ui_story, var_150_17, var_150_16)

				local var_150_18 = manager.ui.mainCamera.transform.position - var_150_13.position

				var_150_13.forward = Vector3.New(var_150_18.x, var_150_18.y, var_150_18.z)

				local var_150_19 = var_150_13.localEulerAngles

				var_150_19.z = 0
				var_150_19.x = 0
				var_150_13.localEulerAngles = var_150_19
			end

			if arg_147_1.time_ >= var_150_14 + var_150_15 and arg_147_1.time_ < var_150_14 + var_150_15 + arg_150_0 then
				var_150_13.localPosition = Vector3.New(0, 100, 0)

				local var_150_20 = manager.ui.mainCamera.transform.position - var_150_13.position

				var_150_13.forward = Vector3.New(var_150_20.x, var_150_20.y, var_150_20.z)

				local var_150_21 = var_150_13.localEulerAngles

				var_150_21.z = 0
				var_150_21.x = 0
				var_150_13.localEulerAngles = var_150_21
			end

			local var_150_22 = arg_147_1.actors_["1095ui_story"]
			local var_150_23 = 0

			if var_150_23 < arg_147_1.time_ and arg_147_1.time_ <= var_150_23 + arg_150_0 and arg_147_1.var_.characterEffect1095ui_story == nil then
				arg_147_1.var_.characterEffect1095ui_story = var_150_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_24 = 0.200000002980232

			if var_150_23 <= arg_147_1.time_ and arg_147_1.time_ < var_150_23 + var_150_24 then
				local var_150_25 = (arg_147_1.time_ - var_150_23) / var_150_24

				if arg_147_1.var_.characterEffect1095ui_story then
					local var_150_26 = Mathf.Lerp(0, 0.5, var_150_25)

					arg_147_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1095ui_story.fillRatio = var_150_26
				end
			end

			if arg_147_1.time_ >= var_150_23 + var_150_24 and arg_147_1.time_ < var_150_23 + var_150_24 + arg_150_0 and arg_147_1.var_.characterEffect1095ui_story then
				local var_150_27 = 0.5

				arg_147_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1095ui_story.fillRatio = var_150_27
			end

			local var_150_28 = 0

			if var_150_28 < arg_147_1.time_ and arg_147_1.time_ <= var_150_28 + arg_150_0 then
				arg_147_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_2")
			end

			local var_150_29 = 0

			if var_150_29 < arg_147_1.time_ and arg_147_1.time_ <= var_150_29 + arg_150_0 then
				arg_147_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_150_30 = 0
			local var_150_31 = 0.125

			if var_150_30 < arg_147_1.time_ and arg_147_1.time_ <= var_150_30 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_32 = arg_147_1:FormatText(StoryNameCfg[668].name)

				arg_147_1.leftNameTxt_.text = var_150_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_33 = arg_147_1:GetWordFromCfg(319321036)
				local var_150_34 = arg_147_1:FormatText(var_150_33.content)

				arg_147_1.text_.text = var_150_34

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_35 = 5
				local var_150_36 = utf8.len(var_150_34)
				local var_150_37 = var_150_35 <= 0 and var_150_31 or var_150_31 * (var_150_36 / var_150_35)

				if var_150_37 > 0 and var_150_31 < var_150_37 then
					arg_147_1.talkMaxDuration = var_150_37

					if var_150_37 + var_150_30 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_37 + var_150_30
					end
				end

				arg_147_1.text_.text = var_150_34
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321036", "story_v_out_319321.awb") ~= 0 then
					local var_150_38 = manager.audio:GetVoiceLength("story_v_out_319321", "319321036", "story_v_out_319321.awb") / 1000

					if var_150_38 + var_150_30 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_38 + var_150_30
					end

					if var_150_33.prefab_name ~= "" and arg_147_1.actors_[var_150_33.prefab_name] ~= nil then
						local var_150_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_33.prefab_name].transform, "story_v_out_319321", "319321036", "story_v_out_319321.awb")

						arg_147_1:RecordAudio("319321036", var_150_39)
						arg_147_1:RecordAudio("319321036", var_150_39)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_319321", "319321036", "story_v_out_319321.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_319321", "319321036", "story_v_out_319321.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_40 = math.max(var_150_31, arg_147_1.talkMaxDuration)

			if var_150_30 <= arg_147_1.time_ and arg_147_1.time_ < var_150_30 + var_150_40 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_30) / var_150_40

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_30 + var_150_40 and arg_147_1.time_ < var_150_30 + var_150_40 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play319321037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 319321037
		arg_151_1.duration_ = 10.833

		local var_151_0 = {
			zh = 6.966,
			ja = 10.833
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
				arg_151_0:Play319321038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10079ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos10079ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(0, -0.95, -6.05)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos10079ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["10079ui_story"]
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 and arg_151_1.var_.characterEffect10079ui_story == nil then
				arg_151_1.var_.characterEffect10079ui_story = var_154_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_11 = 0.200000002980232

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11

				if arg_151_1.var_.characterEffect10079ui_story then
					arg_151_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 and arg_151_1.var_.characterEffect10079ui_story then
				arg_151_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 then
				arg_151_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_154_15 = arg_151_1.actors_["4040ui_story"].transform
			local var_154_16 = 0

			if var_154_16 < arg_151_1.time_ and arg_151_1.time_ <= var_154_16 + arg_154_0 then
				arg_151_1.var_.moveOldPos4040ui_story = var_154_15.localPosition
			end

			local var_154_17 = 0.001

			if var_154_16 <= arg_151_1.time_ and arg_151_1.time_ < var_154_16 + var_154_17 then
				local var_154_18 = (arg_151_1.time_ - var_154_16) / var_154_17
				local var_154_19 = Vector3.New(0, 100, 0)

				var_154_15.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos4040ui_story, var_154_19, var_154_18)

				local var_154_20 = manager.ui.mainCamera.transform.position - var_154_15.position

				var_154_15.forward = Vector3.New(var_154_20.x, var_154_20.y, var_154_20.z)

				local var_154_21 = var_154_15.localEulerAngles

				var_154_21.z = 0
				var_154_21.x = 0
				var_154_15.localEulerAngles = var_154_21
			end

			if arg_151_1.time_ >= var_154_16 + var_154_17 and arg_151_1.time_ < var_154_16 + var_154_17 + arg_154_0 then
				var_154_15.localPosition = Vector3.New(0, 100, 0)

				local var_154_22 = manager.ui.mainCamera.transform.position - var_154_15.position

				var_154_15.forward = Vector3.New(var_154_22.x, var_154_22.y, var_154_22.z)

				local var_154_23 = var_154_15.localEulerAngles

				var_154_23.z = 0
				var_154_23.x = 0
				var_154_15.localEulerAngles = var_154_23
			end

			local var_154_24 = arg_151_1.actors_["4040ui_story"]
			local var_154_25 = 0

			if var_154_25 < arg_151_1.time_ and arg_151_1.time_ <= var_154_25 + arg_154_0 and arg_151_1.var_.characterEffect4040ui_story == nil then
				arg_151_1.var_.characterEffect4040ui_story = var_154_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_26 = 0.200000002980232

			if var_154_25 <= arg_151_1.time_ and arg_151_1.time_ < var_154_25 + var_154_26 then
				local var_154_27 = (arg_151_1.time_ - var_154_25) / var_154_26

				if arg_151_1.var_.characterEffect4040ui_story then
					local var_154_28 = Mathf.Lerp(0, 0.5, var_154_27)

					arg_151_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_151_1.var_.characterEffect4040ui_story.fillRatio = var_154_28
				end
			end

			if arg_151_1.time_ >= var_154_25 + var_154_26 and arg_151_1.time_ < var_154_25 + var_154_26 + arg_154_0 and arg_151_1.var_.characterEffect4040ui_story then
				local var_154_29 = 0.5

				arg_151_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_151_1.var_.characterEffect4040ui_story.fillRatio = var_154_29
			end

			local var_154_30 = 0
			local var_154_31 = 0.775

			if var_154_30 < arg_151_1.time_ and arg_151_1.time_ <= var_154_30 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_32 = arg_151_1:FormatText(StoryNameCfg[6].name)

				arg_151_1.leftNameTxt_.text = var_154_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_33 = arg_151_1:GetWordFromCfg(319321037)
				local var_154_34 = arg_151_1:FormatText(var_154_33.content)

				arg_151_1.text_.text = var_154_34

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_35 = 31
				local var_154_36 = utf8.len(var_154_34)
				local var_154_37 = var_154_35 <= 0 and var_154_31 or var_154_31 * (var_154_36 / var_154_35)

				if var_154_37 > 0 and var_154_31 < var_154_37 then
					arg_151_1.talkMaxDuration = var_154_37

					if var_154_37 + var_154_30 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_37 + var_154_30
					end
				end

				arg_151_1.text_.text = var_154_34
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321037", "story_v_out_319321.awb") ~= 0 then
					local var_154_38 = manager.audio:GetVoiceLength("story_v_out_319321", "319321037", "story_v_out_319321.awb") / 1000

					if var_154_38 + var_154_30 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_38 + var_154_30
					end

					if var_154_33.prefab_name ~= "" and arg_151_1.actors_[var_154_33.prefab_name] ~= nil then
						local var_154_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_33.prefab_name].transform, "story_v_out_319321", "319321037", "story_v_out_319321.awb")

						arg_151_1:RecordAudio("319321037", var_154_39)
						arg_151_1:RecordAudio("319321037", var_154_39)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_319321", "319321037", "story_v_out_319321.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_319321", "319321037", "story_v_out_319321.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_40 = math.max(var_154_31, arg_151_1.talkMaxDuration)

			if var_154_30 <= arg_151_1.time_ and arg_151_1.time_ < var_154_30 + var_154_40 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_30) / var_154_40

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_30 + var_154_40 and arg_151_1.time_ < var_154_30 + var_154_40 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play319321038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 319321038
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play319321039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10079ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect10079ui_story == nil then
				arg_155_1.var_.characterEffect10079ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.200000002980232

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect10079ui_story then
					local var_158_4 = Mathf.Lerp(0, 0.5, var_158_3)

					arg_155_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_155_1.var_.characterEffect10079ui_story.fillRatio = var_158_4
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect10079ui_story then
				local var_158_5 = 0.5

				arg_155_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_155_1.var_.characterEffect10079ui_story.fillRatio = var_158_5
			end

			local var_158_6 = 0
			local var_158_7 = 1.325

			if var_158_6 < arg_155_1.time_ and arg_155_1.time_ <= var_158_6 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_8 = arg_155_1:GetWordFromCfg(319321038)
				local var_158_9 = arg_155_1:FormatText(var_158_8.content)

				arg_155_1.text_.text = var_158_9

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_10 = 53
				local var_158_11 = utf8.len(var_158_9)
				local var_158_12 = var_158_10 <= 0 and var_158_7 or var_158_7 * (var_158_11 / var_158_10)

				if var_158_12 > 0 and var_158_7 < var_158_12 then
					arg_155_1.talkMaxDuration = var_158_12

					if var_158_12 + var_158_6 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_12 + var_158_6
					end
				end

				arg_155_1.text_.text = var_158_9
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_13 = math.max(var_158_7, arg_155_1.talkMaxDuration)

			if var_158_6 <= arg_155_1.time_ and arg_155_1.time_ < var_158_6 + var_158_13 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_6) / var_158_13

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_6 + var_158_13 and arg_155_1.time_ < var_158_6 + var_158_13 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play319321039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 319321039
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play319321040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.8

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

				local var_162_2 = arg_159_1:GetWordFromCfg(319321039)
				local var_162_3 = arg_159_1:FormatText(var_162_2.content)

				arg_159_1.text_.text = var_162_3

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_4 = 32
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
	Play319321040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 319321040
		arg_163_1.duration_ = 1.8

		local var_163_0 = {
			zh = 1.366,
			ja = 1.8
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
				arg_163_0:Play319321041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1095ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1095ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0.7, -0.98, -6.1)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1095ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["1095ui_story"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.characterEffect1095ui_story == nil then
				arg_163_1.var_.characterEffect1095ui_story = var_166_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_11 = 0.200000002980232

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.characterEffect1095ui_story then
					arg_163_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.characterEffect1095ui_story then
				arg_163_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_166_13 = arg_163_1.actors_["10079ui_story"].transform
			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 then
				arg_163_1.var_.moveOldPos10079ui_story = var_166_13.localPosition
			end

			local var_166_15 = 0.001

			if var_166_14 <= arg_163_1.time_ and arg_163_1.time_ < var_166_14 + var_166_15 then
				local var_166_16 = (arg_163_1.time_ - var_166_14) / var_166_15
				local var_166_17 = Vector3.New(-0.7, -0.95, -6.05)

				var_166_13.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10079ui_story, var_166_17, var_166_16)

				local var_166_18 = manager.ui.mainCamera.transform.position - var_166_13.position

				var_166_13.forward = Vector3.New(var_166_18.x, var_166_18.y, var_166_18.z)

				local var_166_19 = var_166_13.localEulerAngles

				var_166_19.z = 0
				var_166_19.x = 0
				var_166_13.localEulerAngles = var_166_19
			end

			if arg_163_1.time_ >= var_166_14 + var_166_15 and arg_163_1.time_ < var_166_14 + var_166_15 + arg_166_0 then
				var_166_13.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_166_20 = manager.ui.mainCamera.transform.position - var_166_13.position

				var_166_13.forward = Vector3.New(var_166_20.x, var_166_20.y, var_166_20.z)

				local var_166_21 = var_166_13.localEulerAngles

				var_166_21.z = 0
				var_166_21.x = 0
				var_166_13.localEulerAngles = var_166_21
			end

			local var_166_22 = 0
			local var_166_23 = 0.125

			if var_166_22 < arg_163_1.time_ and arg_163_1.time_ <= var_166_22 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_24 = arg_163_1:FormatText(StoryNameCfg[471].name)

				arg_163_1.leftNameTxt_.text = var_166_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_25 = arg_163_1:GetWordFromCfg(319321040)
				local var_166_26 = arg_163_1:FormatText(var_166_25.content)

				arg_163_1.text_.text = var_166_26

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_27 = 5
				local var_166_28 = utf8.len(var_166_26)
				local var_166_29 = var_166_27 <= 0 and var_166_23 or var_166_23 * (var_166_28 / var_166_27)

				if var_166_29 > 0 and var_166_23 < var_166_29 then
					arg_163_1.talkMaxDuration = var_166_29

					if var_166_29 + var_166_22 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_29 + var_166_22
					end
				end

				arg_163_1.text_.text = var_166_26
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321040", "story_v_out_319321.awb") ~= 0 then
					local var_166_30 = manager.audio:GetVoiceLength("story_v_out_319321", "319321040", "story_v_out_319321.awb") / 1000

					if var_166_30 + var_166_22 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_30 + var_166_22
					end

					if var_166_25.prefab_name ~= "" and arg_163_1.actors_[var_166_25.prefab_name] ~= nil then
						local var_166_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_25.prefab_name].transform, "story_v_out_319321", "319321040", "story_v_out_319321.awb")

						arg_163_1:RecordAudio("319321040", var_166_31)
						arg_163_1:RecordAudio("319321040", var_166_31)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_319321", "319321040", "story_v_out_319321.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_319321", "319321040", "story_v_out_319321.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_32 = math.max(var_166_23, arg_163_1.talkMaxDuration)

			if var_166_22 <= arg_163_1.time_ and arg_163_1.time_ < var_166_22 + var_166_32 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_22) / var_166_32

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_22 + var_166_32 and arg_163_1.time_ < var_166_22 + var_166_32 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play319321041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319321041
		arg_167_1.duration_ = 12.266

		local var_167_0 = {
			zh = 9.6,
			ja = 12.266
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
				arg_167_0:Play319321042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_170_2 = 0
			local var_170_3 = 1.175

			if var_170_2 < arg_167_1.time_ and arg_167_1.time_ <= var_170_2 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_4 = arg_167_1:FormatText(StoryNameCfg[471].name)

				arg_167_1.leftNameTxt_.text = var_170_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_5 = arg_167_1:GetWordFromCfg(319321041)
				local var_170_6 = arg_167_1:FormatText(var_170_5.content)

				arg_167_1.text_.text = var_170_6

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_7 = 47
				local var_170_8 = utf8.len(var_170_6)
				local var_170_9 = var_170_7 <= 0 and var_170_3 or var_170_3 * (var_170_8 / var_170_7)

				if var_170_9 > 0 and var_170_3 < var_170_9 then
					arg_167_1.talkMaxDuration = var_170_9

					if var_170_9 + var_170_2 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_9 + var_170_2
					end
				end

				arg_167_1.text_.text = var_170_6
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321041", "story_v_out_319321.awb") ~= 0 then
					local var_170_10 = manager.audio:GetVoiceLength("story_v_out_319321", "319321041", "story_v_out_319321.awb") / 1000

					if var_170_10 + var_170_2 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_10 + var_170_2
					end

					if var_170_5.prefab_name ~= "" and arg_167_1.actors_[var_170_5.prefab_name] ~= nil then
						local var_170_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_5.prefab_name].transform, "story_v_out_319321", "319321041", "story_v_out_319321.awb")

						arg_167_1:RecordAudio("319321041", var_170_11)
						arg_167_1:RecordAudio("319321041", var_170_11)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_319321", "319321041", "story_v_out_319321.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_319321", "319321041", "story_v_out_319321.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_12 = math.max(var_170_3, arg_167_1.talkMaxDuration)

			if var_170_2 <= arg_167_1.time_ and arg_167_1.time_ < var_170_2 + var_170_12 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_2) / var_170_12

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_2 + var_170_12 and arg_167_1.time_ < var_170_2 + var_170_12 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319321042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319321042
		arg_171_1.duration_ = 1.033

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play319321043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1095ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story == nil then
				arg_171_1.var_.characterEffect1095ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.200000002980232

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect1095ui_story then
					local var_174_4 = Mathf.Lerp(0, 0.5, var_174_3)

					arg_171_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1095ui_story.fillRatio = var_174_4
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story then
				local var_174_5 = 0.5

				arg_171_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1095ui_story.fillRatio = var_174_5
			end

			local var_174_6 = arg_171_1.actors_["10079ui_story"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 and arg_171_1.var_.characterEffect10079ui_story == nil then
				arg_171_1.var_.characterEffect10079ui_story = var_174_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_8 = 0.200000002980232

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_8 then
				local var_174_9 = (arg_171_1.time_ - var_174_7) / var_174_8

				if arg_171_1.var_.characterEffect10079ui_story then
					arg_171_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_8 and arg_171_1.time_ < var_174_7 + var_174_8 + arg_174_0 and arg_171_1.var_.characterEffect10079ui_story then
				arg_171_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_174_10 = 0
			local var_174_11 = 0.05

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_12 = arg_171_1:FormatText(StoryNameCfg[6].name)

				arg_171_1.leftNameTxt_.text = var_174_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_13 = arg_171_1:GetWordFromCfg(319321042)
				local var_174_14 = arg_171_1:FormatText(var_174_13.content)

				arg_171_1.text_.text = var_174_14

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_15 = 2
				local var_174_16 = utf8.len(var_174_14)
				local var_174_17 = var_174_15 <= 0 and var_174_11 or var_174_11 * (var_174_16 / var_174_15)

				if var_174_17 > 0 and var_174_11 < var_174_17 then
					arg_171_1.talkMaxDuration = var_174_17

					if var_174_17 + var_174_10 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_17 + var_174_10
					end
				end

				arg_171_1.text_.text = var_174_14
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321042", "story_v_out_319321.awb") ~= 0 then
					local var_174_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321042", "story_v_out_319321.awb") / 1000

					if var_174_18 + var_174_10 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_18 + var_174_10
					end

					if var_174_13.prefab_name ~= "" and arg_171_1.actors_[var_174_13.prefab_name] ~= nil then
						local var_174_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_13.prefab_name].transform, "story_v_out_319321", "319321042", "story_v_out_319321.awb")

						arg_171_1:RecordAudio("319321042", var_174_19)
						arg_171_1:RecordAudio("319321042", var_174_19)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_319321", "319321042", "story_v_out_319321.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_319321", "319321042", "story_v_out_319321.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_20 = math.max(var_174_11, arg_171_1.talkMaxDuration)

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_20 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_10) / var_174_20

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_10 + var_174_20 and arg_171_1.time_ < var_174_10 + var_174_20 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play319321043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319321043
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play319321044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10079ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect10079ui_story == nil then
				arg_175_1.var_.characterEffect10079ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect10079ui_story then
					local var_178_4 = Mathf.Lerp(0, 0.5, var_178_3)

					arg_175_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_175_1.var_.characterEffect10079ui_story.fillRatio = var_178_4
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect10079ui_story then
				local var_178_5 = 0.5

				arg_175_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_175_1.var_.characterEffect10079ui_story.fillRatio = var_178_5
			end

			local var_178_6 = 0
			local var_178_7 = 1.325

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

				local var_178_8 = arg_175_1:GetWordFromCfg(319321043)
				local var_178_9 = arg_175_1:FormatText(var_178_8.content)

				arg_175_1.text_.text = var_178_9

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_10 = 53
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
	Play319321044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319321044
		arg_179_1.duration_ = 4.034000001847

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play319321045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1095ui_story"].transform
			local var_182_1 = 2.03400000184774

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1095ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0, -0.98, -6.1)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1095ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = arg_179_1.actors_["1095ui_story"]
			local var_182_10 = 2.03400000184774

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 and arg_179_1.var_.characterEffect1095ui_story == nil then
				arg_179_1.var_.characterEffect1095ui_story = var_182_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_11 = 0.200000002980232

			if var_182_10 <= arg_179_1.time_ and arg_179_1.time_ < var_182_10 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_10) / var_182_11

				if arg_179_1.var_.characterEffect1095ui_story then
					arg_179_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_10 + var_182_11 and arg_179_1.time_ < var_182_10 + var_182_11 + arg_182_0 and arg_179_1.var_.characterEffect1095ui_story then
				arg_179_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_182_13 = 2.03400000184774

			if var_182_13 < arg_179_1.time_ and arg_179_1.time_ <= var_182_13 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_182_14 = 2.03400000184774

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_182_15 = 0

			if var_182_15 < arg_179_1.time_ and arg_179_1.time_ <= var_182_15 + arg_182_0 then
				local var_182_16 = manager.ui.mainCamera.transform.localPosition
				local var_182_17 = Vector3.New(0, 0, 10) + Vector3.New(var_182_16.x, var_182_16.y, 0)
				local var_182_18 = arg_179_1.bgs_.I12f

				var_182_18.transform.localPosition = var_182_17
				var_182_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_182_19 = var_182_18:GetComponent("SpriteRenderer")

				if var_182_19 and var_182_19.sprite then
					local var_182_20 = (var_182_18.transform.localPosition - var_182_16).z
					local var_182_21 = manager.ui.mainCameraCom_
					local var_182_22 = 2 * var_182_20 * Mathf.Tan(var_182_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_182_23 = var_182_22 * var_182_21.aspect
					local var_182_24 = var_182_19.sprite.bounds.size.x
					local var_182_25 = var_182_19.sprite.bounds.size.y
					local var_182_26 = var_182_23 / var_182_24
					local var_182_27 = var_182_22 / var_182_25
					local var_182_28 = var_182_27 < var_182_26 and var_182_26 or var_182_27

					var_182_18.transform.localScale = Vector3.New(var_182_28, var_182_28, 0)
				end

				for iter_182_0, iter_182_1 in pairs(arg_179_1.bgs_) do
					if iter_182_0 ~= "I12f" then
						iter_182_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_182_29 = 1

			if var_182_29 < arg_179_1.time_ and arg_179_1.time_ <= var_182_29 + arg_182_0 then
				local var_182_30 = manager.ui.mainCamera.transform.localPosition
				local var_182_31 = Vector3.New(0, 0, 10) + Vector3.New(var_182_30.x, var_182_30.y, 0)
				local var_182_32 = arg_179_1.bgs_.I12f

				var_182_32.transform.localPosition = var_182_31
				var_182_32.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_182_33 = var_182_32:GetComponent("SpriteRenderer")

				if var_182_33 and var_182_33.sprite then
					local var_182_34 = (var_182_32.transform.localPosition - var_182_30).z
					local var_182_35 = manager.ui.mainCameraCom_
					local var_182_36 = 2 * var_182_34 * Mathf.Tan(var_182_35.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_182_37 = var_182_36 * var_182_35.aspect
					local var_182_38 = var_182_33.sprite.bounds.size.x
					local var_182_39 = var_182_33.sprite.bounds.size.y
					local var_182_40 = var_182_37 / var_182_38
					local var_182_41 = var_182_36 / var_182_39
					local var_182_42 = var_182_41 < var_182_40 and var_182_40 or var_182_41

					var_182_32.transform.localScale = Vector3.New(var_182_42, var_182_42, 0)
				end

				for iter_182_2, iter_182_3 in pairs(arg_179_1.bgs_) do
					if iter_182_2 ~= "I12f" then
						iter_182_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_182_43 = 0

			if var_182_43 < arg_179_1.time_ and arg_179_1.time_ <= var_182_43 + arg_182_0 then
				arg_179_1.mask_.enabled = true
				arg_179_1.mask_.raycastTarget = true

				arg_179_1:SetGaussion(false)
			end

			local var_182_44 = 1

			if var_182_43 <= arg_179_1.time_ and arg_179_1.time_ < var_182_43 + var_182_44 then
				local var_182_45 = (arg_179_1.time_ - var_182_43) / var_182_44
				local var_182_46 = Color.New(0, 0, 0)

				var_182_46.a = Mathf.Lerp(0, 1, var_182_45)
				arg_179_1.mask_.color = var_182_46
			end

			if arg_179_1.time_ >= var_182_43 + var_182_44 and arg_179_1.time_ < var_182_43 + var_182_44 + arg_182_0 then
				local var_182_47 = Color.New(0, 0, 0)

				var_182_47.a = 1
				arg_179_1.mask_.color = var_182_47
			end

			local var_182_48 = 1

			if var_182_48 < arg_179_1.time_ and arg_179_1.time_ <= var_182_48 + arg_182_0 then
				arg_179_1.mask_.enabled = true
				arg_179_1.mask_.raycastTarget = true

				arg_179_1:SetGaussion(false)
			end

			local var_182_49 = 1.03400000184774

			if var_182_48 <= arg_179_1.time_ and arg_179_1.time_ < var_182_48 + var_182_49 then
				local var_182_50 = (arg_179_1.time_ - var_182_48) / var_182_49
				local var_182_51 = Color.New(0, 0, 0)

				var_182_51.a = Mathf.Lerp(1, 0, var_182_50)
				arg_179_1.mask_.color = var_182_51
			end

			if arg_179_1.time_ >= var_182_48 + var_182_49 and arg_179_1.time_ < var_182_48 + var_182_49 + arg_182_0 then
				local var_182_52 = Color.New(0, 0, 0)
				local var_182_53 = 0

				arg_179_1.mask_.enabled = false
				var_182_52.a = var_182_53
				arg_179_1.mask_.color = var_182_52
			end

			local var_182_54 = arg_179_1.actors_["1095ui_story"].transform
			local var_182_55 = 1

			if var_182_55 < arg_179_1.time_ and arg_179_1.time_ <= var_182_55 + arg_182_0 then
				arg_179_1.var_.moveOldPos1095ui_story = var_182_54.localPosition
			end

			local var_182_56 = 0.001

			if var_182_55 <= arg_179_1.time_ and arg_179_1.time_ < var_182_55 + var_182_56 then
				local var_182_57 = (arg_179_1.time_ - var_182_55) / var_182_56
				local var_182_58 = Vector3.New(0, 100, 0)

				var_182_54.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1095ui_story, var_182_58, var_182_57)

				local var_182_59 = manager.ui.mainCamera.transform.position - var_182_54.position

				var_182_54.forward = Vector3.New(var_182_59.x, var_182_59.y, var_182_59.z)

				local var_182_60 = var_182_54.localEulerAngles

				var_182_60.z = 0
				var_182_60.x = 0
				var_182_54.localEulerAngles = var_182_60
			end

			if arg_179_1.time_ >= var_182_55 + var_182_56 and arg_179_1.time_ < var_182_55 + var_182_56 + arg_182_0 then
				var_182_54.localPosition = Vector3.New(0, 100, 0)

				local var_182_61 = manager.ui.mainCamera.transform.position - var_182_54.position

				var_182_54.forward = Vector3.New(var_182_61.x, var_182_61.y, var_182_61.z)

				local var_182_62 = var_182_54.localEulerAngles

				var_182_62.z = 0
				var_182_62.x = 0
				var_182_54.localEulerAngles = var_182_62
			end

			local var_182_63 = arg_179_1.actors_["10079ui_story"].transform
			local var_182_64 = 1

			if var_182_64 < arg_179_1.time_ and arg_179_1.time_ <= var_182_64 + arg_182_0 then
				arg_179_1.var_.moveOldPos10079ui_story = var_182_63.localPosition
			end

			local var_182_65 = 0.001

			if var_182_64 <= arg_179_1.time_ and arg_179_1.time_ < var_182_64 + var_182_65 then
				local var_182_66 = (arg_179_1.time_ - var_182_64) / var_182_65
				local var_182_67 = Vector3.New(0, 100, 0)

				var_182_63.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10079ui_story, var_182_67, var_182_66)

				local var_182_68 = manager.ui.mainCamera.transform.position - var_182_63.position

				var_182_63.forward = Vector3.New(var_182_68.x, var_182_68.y, var_182_68.z)

				local var_182_69 = var_182_63.localEulerAngles

				var_182_69.z = 0
				var_182_69.x = 0
				var_182_63.localEulerAngles = var_182_69
			end

			if arg_179_1.time_ >= var_182_64 + var_182_65 and arg_179_1.time_ < var_182_64 + var_182_65 + arg_182_0 then
				var_182_63.localPosition = Vector3.New(0, 100, 0)

				local var_182_70 = manager.ui.mainCamera.transform.position - var_182_63.position

				var_182_63.forward = Vector3.New(var_182_70.x, var_182_70.y, var_182_70.z)

				local var_182_71 = var_182_63.localEulerAngles

				var_182_71.z = 0
				var_182_71.x = 0
				var_182_63.localEulerAngles = var_182_71
			end

			if arg_179_1.frameCnt_ <= 1 then
				arg_179_1.dialog_:SetActive(false)
			end

			local var_182_72 = 2.03400000184774
			local var_182_73 = 0.1

			if var_182_72 < arg_179_1.time_ and arg_179_1.time_ <= var_182_72 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0

				arg_179_1.dialog_:SetActive(true)

				local var_182_74 = LeanTween.value(arg_179_1.dialog_, 0, 1, 0.3)

				var_182_74:setOnUpdate(LuaHelper.FloatAction(function(arg_183_0)
					arg_179_1.dialogCg_.alpha = arg_183_0
				end))
				var_182_74:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_179_1.dialog_)
					var_182_74:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_179_1.duration_ = arg_179_1.duration_ + 0.3

				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_75 = arg_179_1:FormatText(StoryNameCfg[471].name)

				arg_179_1.leftNameTxt_.text = var_182_75

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_76 = arg_179_1:GetWordFromCfg(319321044)
				local var_182_77 = arg_179_1:FormatText(var_182_76.content)

				arg_179_1.text_.text = var_182_77

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_78 = 4
				local var_182_79 = utf8.len(var_182_77)
				local var_182_80 = var_182_78 <= 0 and var_182_73 or var_182_73 * (var_182_79 / var_182_78)

				if var_182_80 > 0 and var_182_73 < var_182_80 then
					arg_179_1.talkMaxDuration = var_182_80
					var_182_72 = var_182_72 + 0.3

					if var_182_80 + var_182_72 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_80 + var_182_72
					end
				end

				arg_179_1.text_.text = var_182_77
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321044", "story_v_out_319321.awb") ~= 0 then
					local var_182_81 = manager.audio:GetVoiceLength("story_v_out_319321", "319321044", "story_v_out_319321.awb") / 1000

					if var_182_81 + var_182_72 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_81 + var_182_72
					end

					if var_182_76.prefab_name ~= "" and arg_179_1.actors_[var_182_76.prefab_name] ~= nil then
						local var_182_82 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_76.prefab_name].transform, "story_v_out_319321", "319321044", "story_v_out_319321.awb")

						arg_179_1:RecordAudio("319321044", var_182_82)
						arg_179_1:RecordAudio("319321044", var_182_82)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_319321", "319321044", "story_v_out_319321.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_319321", "319321044", "story_v_out_319321.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_83 = var_182_72 + 0.3
			local var_182_84 = math.max(var_182_73, arg_179_1.talkMaxDuration)

			if var_182_83 <= arg_179_1.time_ and arg_179_1.time_ < var_182_83 + var_182_84 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_83) / var_182_84

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_83 + var_182_84 and arg_179_1.time_ < var_182_83 + var_182_84 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319321045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319321045
		arg_185_1.duration_ = 4.7

		local var_185_0 = {
			zh = 2.3,
			ja = 4.7
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
				arg_185_0:Play319321046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["10079ui_story"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos10079ui_story = var_188_0.localPosition
			end

			local var_188_2 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2
				local var_188_4 = Vector3.New(0, -0.95, -6.05)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos10079ui_story, var_188_4, var_188_3)

				local var_188_5 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_5.x, var_188_5.y, var_188_5.z)

				local var_188_6 = var_188_0.localEulerAngles

				var_188_6.z = 0
				var_188_6.x = 0
				var_188_0.localEulerAngles = var_188_6
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_188_7 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_7.x, var_188_7.y, var_188_7.z)

				local var_188_8 = var_188_0.localEulerAngles

				var_188_8.z = 0
				var_188_8.x = 0
				var_188_0.localEulerAngles = var_188_8
			end

			local var_188_9 = arg_185_1.actors_["10079ui_story"]
			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect10079ui_story == nil then
				arg_185_1.var_.characterEffect10079ui_story = var_188_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_11 = 0.200000002980232

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_10) / var_188_11

				if arg_185_1.var_.characterEffect10079ui_story then
					arg_185_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_10 + var_188_11 and arg_185_1.time_ < var_188_10 + var_188_11 + arg_188_0 and arg_185_1.var_.characterEffect10079ui_story then
				arg_185_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_188_13 = 0

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_188_14 = 0

			if var_188_14 < arg_185_1.time_ and arg_185_1.time_ <= var_188_14 + arg_188_0 then
				arg_185_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_188_15 = arg_185_1.actors_["1095ui_story"]
			local var_188_16 = 0

			if var_188_16 < arg_185_1.time_ and arg_185_1.time_ <= var_188_16 + arg_188_0 and arg_185_1.var_.characterEffect1095ui_story == nil then
				arg_185_1.var_.characterEffect1095ui_story = var_188_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_17 = 0.200000002980232

			if var_188_16 <= arg_185_1.time_ and arg_185_1.time_ < var_188_16 + var_188_17 then
				local var_188_18 = (arg_185_1.time_ - var_188_16) / var_188_17

				if arg_185_1.var_.characterEffect1095ui_story then
					local var_188_19 = Mathf.Lerp(0, 0.5, var_188_18)

					arg_185_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1095ui_story.fillRatio = var_188_19
				end
			end

			if arg_185_1.time_ >= var_188_16 + var_188_17 and arg_185_1.time_ < var_188_16 + var_188_17 + arg_188_0 and arg_185_1.var_.characterEffect1095ui_story then
				local var_188_20 = 0.5

				arg_185_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1095ui_story.fillRatio = var_188_20
			end

			local var_188_21 = arg_185_1.actors_["1095ui_story"].transform
			local var_188_22 = 0

			if var_188_22 < arg_185_1.time_ and arg_185_1.time_ <= var_188_22 + arg_188_0 then
				arg_185_1.var_.moveOldPos1095ui_story = var_188_21.localPosition
			end

			local var_188_23 = 0.001

			if var_188_22 <= arg_185_1.time_ and arg_185_1.time_ < var_188_22 + var_188_23 then
				local var_188_24 = (arg_185_1.time_ - var_188_22) / var_188_23
				local var_188_25 = Vector3.New(0, 100, 0)

				var_188_21.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1095ui_story, var_188_25, var_188_24)

				local var_188_26 = manager.ui.mainCamera.transform.position - var_188_21.position

				var_188_21.forward = Vector3.New(var_188_26.x, var_188_26.y, var_188_26.z)

				local var_188_27 = var_188_21.localEulerAngles

				var_188_27.z = 0
				var_188_27.x = 0
				var_188_21.localEulerAngles = var_188_27
			end

			if arg_185_1.time_ >= var_188_22 + var_188_23 and arg_185_1.time_ < var_188_22 + var_188_23 + arg_188_0 then
				var_188_21.localPosition = Vector3.New(0, 100, 0)

				local var_188_28 = manager.ui.mainCamera.transform.position - var_188_21.position

				var_188_21.forward = Vector3.New(var_188_28.x, var_188_28.y, var_188_28.z)

				local var_188_29 = var_188_21.localEulerAngles

				var_188_29.z = 0
				var_188_29.x = 0
				var_188_21.localEulerAngles = var_188_29
			end

			local var_188_30 = 0
			local var_188_31 = 0.275

			if var_188_30 < arg_185_1.time_ and arg_185_1.time_ <= var_188_30 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_32 = arg_185_1:FormatText(StoryNameCfg[6].name)

				arg_185_1.leftNameTxt_.text = var_188_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_33 = arg_185_1:GetWordFromCfg(319321045)
				local var_188_34 = arg_185_1:FormatText(var_188_33.content)

				arg_185_1.text_.text = var_188_34

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_35 = 11
				local var_188_36 = utf8.len(var_188_34)
				local var_188_37 = var_188_35 <= 0 and var_188_31 or var_188_31 * (var_188_36 / var_188_35)

				if var_188_37 > 0 and var_188_31 < var_188_37 then
					arg_185_1.talkMaxDuration = var_188_37

					if var_188_37 + var_188_30 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_37 + var_188_30
					end
				end

				arg_185_1.text_.text = var_188_34
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321045", "story_v_out_319321.awb") ~= 0 then
					local var_188_38 = manager.audio:GetVoiceLength("story_v_out_319321", "319321045", "story_v_out_319321.awb") / 1000

					if var_188_38 + var_188_30 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_38 + var_188_30
					end

					if var_188_33.prefab_name ~= "" and arg_185_1.actors_[var_188_33.prefab_name] ~= nil then
						local var_188_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_33.prefab_name].transform, "story_v_out_319321", "319321045", "story_v_out_319321.awb")

						arg_185_1:RecordAudio("319321045", var_188_39)
						arg_185_1:RecordAudio("319321045", var_188_39)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319321", "319321045", "story_v_out_319321.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319321", "319321045", "story_v_out_319321.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_40 = math.max(var_188_31, arg_185_1.talkMaxDuration)

			if var_188_30 <= arg_185_1.time_ and arg_185_1.time_ < var_188_30 + var_188_40 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_30) / var_188_40

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_30 + var_188_40 and arg_185_1.time_ < var_188_30 + var_188_40 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319321046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319321046
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play319321047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1095ui_story"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1095ui_story = var_192_0.localPosition
			end

			local var_192_2 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2
				local var_192_4 = Vector3.New(0, 100, 0)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1095ui_story, var_192_4, var_192_3)

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

			local var_192_9 = arg_189_1.actors_["1095ui_story"]
			local var_192_10 = 0

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 and arg_189_1.var_.characterEffect1095ui_story == nil then
				arg_189_1.var_.characterEffect1095ui_story = var_192_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_11 = 0.200000002980232

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_11 then
				local var_192_12 = (arg_189_1.time_ - var_192_10) / var_192_11

				if arg_189_1.var_.characterEffect1095ui_story then
					local var_192_13 = Mathf.Lerp(0, 0.5, var_192_12)

					arg_189_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_189_1.var_.characterEffect1095ui_story.fillRatio = var_192_13
				end
			end

			if arg_189_1.time_ >= var_192_10 + var_192_11 and arg_189_1.time_ < var_192_10 + var_192_11 + arg_192_0 and arg_189_1.var_.characterEffect1095ui_story then
				local var_192_14 = 0.5

				arg_189_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_189_1.var_.characterEffect1095ui_story.fillRatio = var_192_14
			end

			local var_192_15 = arg_189_1.actors_["10079ui_story"].transform
			local var_192_16 = 0

			if var_192_16 < arg_189_1.time_ and arg_189_1.time_ <= var_192_16 + arg_192_0 then
				arg_189_1.var_.moveOldPos10079ui_story = var_192_15.localPosition
			end

			local var_192_17 = 0.001

			if var_192_16 <= arg_189_1.time_ and arg_189_1.time_ < var_192_16 + var_192_17 then
				local var_192_18 = (arg_189_1.time_ - var_192_16) / var_192_17
				local var_192_19 = Vector3.New(0, 100, 0)

				var_192_15.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos10079ui_story, var_192_19, var_192_18)

				local var_192_20 = manager.ui.mainCamera.transform.position - var_192_15.position

				var_192_15.forward = Vector3.New(var_192_20.x, var_192_20.y, var_192_20.z)

				local var_192_21 = var_192_15.localEulerAngles

				var_192_21.z = 0
				var_192_21.x = 0
				var_192_15.localEulerAngles = var_192_21
			end

			if arg_189_1.time_ >= var_192_16 + var_192_17 and arg_189_1.time_ < var_192_16 + var_192_17 + arg_192_0 then
				var_192_15.localPosition = Vector3.New(0, 100, 0)

				local var_192_22 = manager.ui.mainCamera.transform.position - var_192_15.position

				var_192_15.forward = Vector3.New(var_192_22.x, var_192_22.y, var_192_22.z)

				local var_192_23 = var_192_15.localEulerAngles

				var_192_23.z = 0
				var_192_23.x = 0
				var_192_15.localEulerAngles = var_192_23
			end

			local var_192_24 = arg_189_1.actors_["10079ui_story"]
			local var_192_25 = 0

			if var_192_25 < arg_189_1.time_ and arg_189_1.time_ <= var_192_25 + arg_192_0 and arg_189_1.var_.characterEffect10079ui_story == nil then
				arg_189_1.var_.characterEffect10079ui_story = var_192_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_26 = 0.200000002980232

			if var_192_25 <= arg_189_1.time_ and arg_189_1.time_ < var_192_25 + var_192_26 then
				local var_192_27 = (arg_189_1.time_ - var_192_25) / var_192_26

				if arg_189_1.var_.characterEffect10079ui_story then
					local var_192_28 = Mathf.Lerp(0, 0.5, var_192_27)

					arg_189_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_189_1.var_.characterEffect10079ui_story.fillRatio = var_192_28
				end
			end

			if arg_189_1.time_ >= var_192_25 + var_192_26 and arg_189_1.time_ < var_192_25 + var_192_26 + arg_192_0 and arg_189_1.var_.characterEffect10079ui_story then
				local var_192_29 = 0.5

				arg_189_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_189_1.var_.characterEffect10079ui_story.fillRatio = var_192_29
			end

			local var_192_30 = 0
			local var_192_31 = 1.4

			if var_192_30 < arg_189_1.time_ and arg_189_1.time_ <= var_192_30 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_32 = arg_189_1:GetWordFromCfg(319321046)
				local var_192_33 = arg_189_1:FormatText(var_192_32.content)

				arg_189_1.text_.text = var_192_33

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_34 = 56
				local var_192_35 = utf8.len(var_192_33)
				local var_192_36 = var_192_34 <= 0 and var_192_31 or var_192_31 * (var_192_35 / var_192_34)

				if var_192_36 > 0 and var_192_31 < var_192_36 then
					arg_189_1.talkMaxDuration = var_192_36

					if var_192_36 + var_192_30 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_36 + var_192_30
					end
				end

				arg_189_1.text_.text = var_192_33
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_37 = math.max(var_192_31, arg_189_1.talkMaxDuration)

			if var_192_30 <= arg_189_1.time_ and arg_189_1.time_ < var_192_30 + var_192_37 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_30) / var_192_37

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_30 + var_192_37 and arg_189_1.time_ < var_192_30 + var_192_37 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play319321047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319321047
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play319321048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.975

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_2 = arg_193_1:GetWordFromCfg(319321047)
				local var_196_3 = arg_193_1:FormatText(var_196_2.content)

				arg_193_1.text_.text = var_196_3

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_4 = 39
				local var_196_5 = utf8.len(var_196_3)
				local var_196_6 = var_196_4 <= 0 and var_196_1 or var_196_1 * (var_196_5 / var_196_4)

				if var_196_6 > 0 and var_196_1 < var_196_6 then
					arg_193_1.talkMaxDuration = var_196_6

					if var_196_6 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_6 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_3
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_7 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_7 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_7

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_7 and arg_193_1.time_ < var_196_0 + var_196_7 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play319321048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 319321048
		arg_197_1.duration_ = 8

		local var_197_0 = {
			zh = 6.566,
			ja = 8
		}
		local var_197_1 = manager.audio:GetLocalizationFlag()

		if var_197_0[var_197_1] ~= nil then
			arg_197_1.duration_ = var_197_0[var_197_1]
		end

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play319321049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["4040ui_story"].transform
			local var_200_1 = 4

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos4040ui_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(0, -1.55, -5.5)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos4040ui_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["4040ui_story"]
			local var_200_10 = 4

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 and arg_197_1.var_.characterEffect4040ui_story == nil then
				arg_197_1.var_.characterEffect4040ui_story = var_200_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_11 = 0.200000002980232

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11

				if arg_197_1.var_.characterEffect4040ui_story then
					arg_197_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 and arg_197_1.var_.characterEffect4040ui_story then
				arg_197_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_200_13 = 4

			if var_200_13 < arg_197_1.time_ and arg_197_1.time_ <= var_200_13 + arg_200_0 then
				arg_197_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_200_14 = 4

			if var_200_14 < arg_197_1.time_ and arg_197_1.time_ <= var_200_14 + arg_200_0 then
				arg_197_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_200_15 = 0

			if var_200_15 < arg_197_1.time_ and arg_197_1.time_ <= var_200_15 + arg_200_0 then
				local var_200_16 = manager.ui.mainCamera.transform.localPosition
				local var_200_17 = Vector3.New(0, 0, 10) + Vector3.New(var_200_16.x, var_200_16.y, 0)
				local var_200_18 = arg_197_1.bgs_.I12f

				var_200_18.transform.localPosition = var_200_17
				var_200_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_200_19 = var_200_18:GetComponent("SpriteRenderer")

				if var_200_19 and var_200_19.sprite then
					local var_200_20 = (var_200_18.transform.localPosition - var_200_16).z
					local var_200_21 = manager.ui.mainCameraCom_
					local var_200_22 = 2 * var_200_20 * Mathf.Tan(var_200_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_200_23 = var_200_22 * var_200_21.aspect
					local var_200_24 = var_200_19.sprite.bounds.size.x
					local var_200_25 = var_200_19.sprite.bounds.size.y
					local var_200_26 = var_200_23 / var_200_24
					local var_200_27 = var_200_22 / var_200_25
					local var_200_28 = var_200_27 < var_200_26 and var_200_26 or var_200_27

					var_200_18.transform.localScale = Vector3.New(var_200_28, var_200_28, 0)
				end

				for iter_200_0, iter_200_1 in pairs(arg_197_1.bgs_) do
					if iter_200_0 ~= "I12f" then
						iter_200_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_200_29 = 2

			if var_200_29 < arg_197_1.time_ and arg_197_1.time_ <= var_200_29 + arg_200_0 then
				local var_200_30 = manager.ui.mainCamera.transform.localPosition
				local var_200_31 = Vector3.New(0, 0, 10) + Vector3.New(var_200_30.x, var_200_30.y, 0)
				local var_200_32 = arg_197_1.bgs_.I12f

				var_200_32.transform.localPosition = var_200_31
				var_200_32.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_200_33 = var_200_32:GetComponent("SpriteRenderer")

				if var_200_33 and var_200_33.sprite then
					local var_200_34 = (var_200_32.transform.localPosition - var_200_30).z
					local var_200_35 = manager.ui.mainCameraCom_
					local var_200_36 = 2 * var_200_34 * Mathf.Tan(var_200_35.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_200_37 = var_200_36 * var_200_35.aspect
					local var_200_38 = var_200_33.sprite.bounds.size.x
					local var_200_39 = var_200_33.sprite.bounds.size.y
					local var_200_40 = var_200_37 / var_200_38
					local var_200_41 = var_200_36 / var_200_39
					local var_200_42 = var_200_41 < var_200_40 and var_200_40 or var_200_41

					var_200_32.transform.localScale = Vector3.New(var_200_42, var_200_42, 0)
				end

				for iter_200_2, iter_200_3 in pairs(arg_197_1.bgs_) do
					if iter_200_2 ~= "I12f" then
						iter_200_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_200_43 = 0

			if var_200_43 < arg_197_1.time_ and arg_197_1.time_ <= var_200_43 + arg_200_0 then
				arg_197_1.mask_.enabled = true
				arg_197_1.mask_.raycastTarget = true

				arg_197_1:SetGaussion(false)
			end

			local var_200_44 = 2

			if var_200_43 <= arg_197_1.time_ and arg_197_1.time_ < var_200_43 + var_200_44 then
				local var_200_45 = (arg_197_1.time_ - var_200_43) / var_200_44
				local var_200_46 = Color.New(0, 0, 0)

				var_200_46.a = Mathf.Lerp(0, 1, var_200_45)
				arg_197_1.mask_.color = var_200_46
			end

			if arg_197_1.time_ >= var_200_43 + var_200_44 and arg_197_1.time_ < var_200_43 + var_200_44 + arg_200_0 then
				local var_200_47 = Color.New(0, 0, 0)

				var_200_47.a = 1
				arg_197_1.mask_.color = var_200_47
			end

			local var_200_48 = 2

			if var_200_48 < arg_197_1.time_ and arg_197_1.time_ <= var_200_48 + arg_200_0 then
				arg_197_1.mask_.enabled = true
				arg_197_1.mask_.raycastTarget = true

				arg_197_1:SetGaussion(false)
			end

			local var_200_49 = 2

			if var_200_48 <= arg_197_1.time_ and arg_197_1.time_ < var_200_48 + var_200_49 then
				local var_200_50 = (arg_197_1.time_ - var_200_48) / var_200_49
				local var_200_51 = Color.New(0, 0, 0)

				var_200_51.a = Mathf.Lerp(1, 0, var_200_50)
				arg_197_1.mask_.color = var_200_51
			end

			if arg_197_1.time_ >= var_200_48 + var_200_49 and arg_197_1.time_ < var_200_48 + var_200_49 + arg_200_0 then
				local var_200_52 = Color.New(0, 0, 0)
				local var_200_53 = 0

				arg_197_1.mask_.enabled = false
				var_200_52.a = var_200_53
				arg_197_1.mask_.color = var_200_52
			end

			if arg_197_1.frameCnt_ <= 1 then
				arg_197_1.dialog_:SetActive(false)
			end

			local var_200_54 = 4
			local var_200_55 = 0.1

			if var_200_54 < arg_197_1.time_ and arg_197_1.time_ <= var_200_54 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0

				arg_197_1.dialog_:SetActive(true)

				local var_200_56 = LeanTween.value(arg_197_1.dialog_, 0, 1, 0.3)

				var_200_56:setOnUpdate(LuaHelper.FloatAction(function(arg_201_0)
					arg_197_1.dialogCg_.alpha = arg_201_0
				end))
				var_200_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_197_1.dialog_)
					var_200_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_197_1.duration_ = arg_197_1.duration_ + 0.3

				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_57 = arg_197_1:FormatText(StoryNameCfg[668].name)

				arg_197_1.leftNameTxt_.text = var_200_57

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_58 = arg_197_1:GetWordFromCfg(319321048)
				local var_200_59 = arg_197_1:FormatText(var_200_58.content)

				arg_197_1.text_.text = var_200_59

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_60 = 4
				local var_200_61 = utf8.len(var_200_59)
				local var_200_62 = var_200_60 <= 0 and var_200_55 or var_200_55 * (var_200_61 / var_200_60)

				if var_200_62 > 0 and var_200_55 < var_200_62 then
					arg_197_1.talkMaxDuration = var_200_62
					var_200_54 = var_200_54 + 0.3

					if var_200_62 + var_200_54 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_62 + var_200_54
					end
				end

				arg_197_1.text_.text = var_200_59
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321048", "story_v_out_319321.awb") ~= 0 then
					local var_200_63 = manager.audio:GetVoiceLength("story_v_out_319321", "319321048", "story_v_out_319321.awb") / 1000

					if var_200_63 + var_200_54 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_63 + var_200_54
					end

					if var_200_58.prefab_name ~= "" and arg_197_1.actors_[var_200_58.prefab_name] ~= nil then
						local var_200_64 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_58.prefab_name].transform, "story_v_out_319321", "319321048", "story_v_out_319321.awb")

						arg_197_1:RecordAudio("319321048", var_200_64)
						arg_197_1:RecordAudio("319321048", var_200_64)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_319321", "319321048", "story_v_out_319321.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_319321", "319321048", "story_v_out_319321.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_65 = var_200_54 + 0.3
			local var_200_66 = math.max(var_200_55, arg_197_1.talkMaxDuration)

			if var_200_65 <= arg_197_1.time_ and arg_197_1.time_ < var_200_65 + var_200_66 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_65) / var_200_66

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_65 + var_200_66 and arg_197_1.time_ < var_200_65 + var_200_66 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play319321049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319321049
		arg_203_1.duration_ = 5.533

		local var_203_0 = {
			zh = 2.1,
			ja = 5.533
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
				arg_203_0:Play319321050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1095ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1095ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0.7, -0.98, -6.1)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1095ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_206_7 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_7.x, var_206_7.y, var_206_7.z)

				local var_206_8 = var_206_0.localEulerAngles

				var_206_8.z = 0
				var_206_8.x = 0
				var_206_0.localEulerAngles = var_206_8
			end

			local var_206_9 = arg_203_1.actors_["1095ui_story"]
			local var_206_10 = 0

			if var_206_10 < arg_203_1.time_ and arg_203_1.time_ <= var_206_10 + arg_206_0 and arg_203_1.var_.characterEffect1095ui_story == nil then
				arg_203_1.var_.characterEffect1095ui_story = var_206_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_11 = 0.200000002980232

			if var_206_10 <= arg_203_1.time_ and arg_203_1.time_ < var_206_10 + var_206_11 then
				local var_206_12 = (arg_203_1.time_ - var_206_10) / var_206_11

				if arg_203_1.var_.characterEffect1095ui_story then
					arg_203_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_10 + var_206_11 and arg_203_1.time_ < var_206_10 + var_206_11 + arg_206_0 and arg_203_1.var_.characterEffect1095ui_story then
				arg_203_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_206_13 = 0

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				arg_203_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_206_15 = arg_203_1.actors_["4040ui_story"].transform
			local var_206_16 = 0

			if var_206_16 < arg_203_1.time_ and arg_203_1.time_ <= var_206_16 + arg_206_0 then
				arg_203_1.var_.moveOldPos4040ui_story = var_206_15.localPosition
			end

			local var_206_17 = 0.001

			if var_206_16 <= arg_203_1.time_ and arg_203_1.time_ < var_206_16 + var_206_17 then
				local var_206_18 = (arg_203_1.time_ - var_206_16) / var_206_17
				local var_206_19 = Vector3.New(-0.7, -1.55, -5.5)

				var_206_15.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos4040ui_story, var_206_19, var_206_18)

				local var_206_20 = manager.ui.mainCamera.transform.position - var_206_15.position

				var_206_15.forward = Vector3.New(var_206_20.x, var_206_20.y, var_206_20.z)

				local var_206_21 = var_206_15.localEulerAngles

				var_206_21.z = 0
				var_206_21.x = 0
				var_206_15.localEulerAngles = var_206_21
			end

			if arg_203_1.time_ >= var_206_16 + var_206_17 and arg_203_1.time_ < var_206_16 + var_206_17 + arg_206_0 then
				var_206_15.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_206_22 = manager.ui.mainCamera.transform.position - var_206_15.position

				var_206_15.forward = Vector3.New(var_206_22.x, var_206_22.y, var_206_22.z)

				local var_206_23 = var_206_15.localEulerAngles

				var_206_23.z = 0
				var_206_23.x = 0
				var_206_15.localEulerAngles = var_206_23
			end

			local var_206_24 = arg_203_1.actors_["4040ui_story"]
			local var_206_25 = 0

			if var_206_25 < arg_203_1.time_ and arg_203_1.time_ <= var_206_25 + arg_206_0 and arg_203_1.var_.characterEffect4040ui_story == nil then
				arg_203_1.var_.characterEffect4040ui_story = var_206_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_26 = 0.200000002980232

			if var_206_25 <= arg_203_1.time_ and arg_203_1.time_ < var_206_25 + var_206_26 then
				local var_206_27 = (arg_203_1.time_ - var_206_25) / var_206_26

				if arg_203_1.var_.characterEffect4040ui_story then
					local var_206_28 = Mathf.Lerp(0, 0.5, var_206_27)

					arg_203_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_203_1.var_.characterEffect4040ui_story.fillRatio = var_206_28
				end
			end

			if arg_203_1.time_ >= var_206_25 + var_206_26 and arg_203_1.time_ < var_206_25 + var_206_26 + arg_206_0 and arg_203_1.var_.characterEffect4040ui_story then
				local var_206_29 = 0.5

				arg_203_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_203_1.var_.characterEffect4040ui_story.fillRatio = var_206_29
			end

			local var_206_30 = 0
			local var_206_31 = 0.25

			if var_206_30 < arg_203_1.time_ and arg_203_1.time_ <= var_206_30 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_32 = arg_203_1:FormatText(StoryNameCfg[471].name)

				arg_203_1.leftNameTxt_.text = var_206_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_33 = arg_203_1:GetWordFromCfg(319321049)
				local var_206_34 = arg_203_1:FormatText(var_206_33.content)

				arg_203_1.text_.text = var_206_34

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_35 = 10
				local var_206_36 = utf8.len(var_206_34)
				local var_206_37 = var_206_35 <= 0 and var_206_31 or var_206_31 * (var_206_36 / var_206_35)

				if var_206_37 > 0 and var_206_31 < var_206_37 then
					arg_203_1.talkMaxDuration = var_206_37

					if var_206_37 + var_206_30 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_37 + var_206_30
					end
				end

				arg_203_1.text_.text = var_206_34
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321049", "story_v_out_319321.awb") ~= 0 then
					local var_206_38 = manager.audio:GetVoiceLength("story_v_out_319321", "319321049", "story_v_out_319321.awb") / 1000

					if var_206_38 + var_206_30 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_38 + var_206_30
					end

					if var_206_33.prefab_name ~= "" and arg_203_1.actors_[var_206_33.prefab_name] ~= nil then
						local var_206_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_33.prefab_name].transform, "story_v_out_319321", "319321049", "story_v_out_319321.awb")

						arg_203_1:RecordAudio("319321049", var_206_39)
						arg_203_1:RecordAudio("319321049", var_206_39)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_319321", "319321049", "story_v_out_319321.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_319321", "319321049", "story_v_out_319321.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_40 = math.max(var_206_31, arg_203_1.talkMaxDuration)

			if var_206_30 <= arg_203_1.time_ and arg_203_1.time_ < var_206_30 + var_206_40 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_30) / var_206_40

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_30 + var_206_40 and arg_203_1.time_ < var_206_30 + var_206_40 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play319321050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 319321050
		arg_207_1.duration_ = 10.8

		local var_207_0 = {
			zh = 6.2,
			ja = 10.8
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
				arg_207_0:Play319321051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["4040ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos4040ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos4040ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["4040ui_story"]
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 and arg_207_1.var_.characterEffect4040ui_story == nil then
				arg_207_1.var_.characterEffect4040ui_story = var_210_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_11 = 0.200000002980232

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11

				if arg_207_1.var_.characterEffect4040ui_story then
					arg_207_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 and arg_207_1.var_.characterEffect4040ui_story then
				arg_207_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_210_13 = arg_207_1.actors_["1095ui_story"]
			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 and arg_207_1.var_.characterEffect1095ui_story == nil then
				arg_207_1.var_.characterEffect1095ui_story = var_210_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_15 = 0.200000002980232

			if var_210_14 <= arg_207_1.time_ and arg_207_1.time_ < var_210_14 + var_210_15 then
				local var_210_16 = (arg_207_1.time_ - var_210_14) / var_210_15

				if arg_207_1.var_.characterEffect1095ui_story then
					local var_210_17 = Mathf.Lerp(0, 0.5, var_210_16)

					arg_207_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1095ui_story.fillRatio = var_210_17
				end
			end

			if arg_207_1.time_ >= var_210_14 + var_210_15 and arg_207_1.time_ < var_210_14 + var_210_15 + arg_210_0 and arg_207_1.var_.characterEffect1095ui_story then
				local var_210_18 = 0.5

				arg_207_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1095ui_story.fillRatio = var_210_18
			end

			local var_210_19 = 0

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 then
				arg_207_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_210_20 = 0

			if var_210_20 < arg_207_1.time_ and arg_207_1.time_ <= var_210_20 + arg_210_0 then
				arg_207_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_210_21 = 0
			local var_210_22 = 0.875

			if var_210_21 < arg_207_1.time_ and arg_207_1.time_ <= var_210_21 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_23 = arg_207_1:FormatText(StoryNameCfg[668].name)

				arg_207_1.leftNameTxt_.text = var_210_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_24 = arg_207_1:GetWordFromCfg(319321050)
				local var_210_25 = arg_207_1:FormatText(var_210_24.content)

				arg_207_1.text_.text = var_210_25

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_26 = 35
				local var_210_27 = utf8.len(var_210_25)
				local var_210_28 = var_210_26 <= 0 and var_210_22 or var_210_22 * (var_210_27 / var_210_26)

				if var_210_28 > 0 and var_210_22 < var_210_28 then
					arg_207_1.talkMaxDuration = var_210_28

					if var_210_28 + var_210_21 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_28 + var_210_21
					end
				end

				arg_207_1.text_.text = var_210_25
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321050", "story_v_out_319321.awb") ~= 0 then
					local var_210_29 = manager.audio:GetVoiceLength("story_v_out_319321", "319321050", "story_v_out_319321.awb") / 1000

					if var_210_29 + var_210_21 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_29 + var_210_21
					end

					if var_210_24.prefab_name ~= "" and arg_207_1.actors_[var_210_24.prefab_name] ~= nil then
						local var_210_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_24.prefab_name].transform, "story_v_out_319321", "319321050", "story_v_out_319321.awb")

						arg_207_1:RecordAudio("319321050", var_210_30)
						arg_207_1:RecordAudio("319321050", var_210_30)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_319321", "319321050", "story_v_out_319321.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_319321", "319321050", "story_v_out_319321.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_31 = math.max(var_210_22, arg_207_1.talkMaxDuration)

			if var_210_21 <= arg_207_1.time_ and arg_207_1.time_ < var_210_21 + var_210_31 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_21) / var_210_31

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_21 + var_210_31 and arg_207_1.time_ < var_210_21 + var_210_31 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play319321051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 319321051
		arg_211_1.duration_ = 5.566

		local var_211_0 = {
			zh = 2.1,
			ja = 5.566
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
				arg_211_0:Play319321052(arg_211_1)
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

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				arg_211_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 then
				arg_211_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_214_8 = arg_211_1.actors_["1095ui_story"]
			local var_214_9 = 0

			if var_214_9 < arg_211_1.time_ and arg_211_1.time_ <= var_214_9 + arg_214_0 and arg_211_1.var_.characterEffect1095ui_story == nil then
				arg_211_1.var_.characterEffect1095ui_story = var_214_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_10 = 0.200000002980232

			if var_214_9 <= arg_211_1.time_ and arg_211_1.time_ < var_214_9 + var_214_10 then
				local var_214_11 = (arg_211_1.time_ - var_214_9) / var_214_10

				if arg_211_1.var_.characterEffect1095ui_story then
					arg_211_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_9 + var_214_10 and arg_211_1.time_ < var_214_9 + var_214_10 + arg_214_0 and arg_211_1.var_.characterEffect1095ui_story then
				arg_211_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_214_12 = 0
			local var_214_13 = 0.125

			if var_214_12 < arg_211_1.time_ and arg_211_1.time_ <= var_214_12 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_14 = arg_211_1:FormatText(StoryNameCfg[471].name)

				arg_211_1.leftNameTxt_.text = var_214_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_15 = arg_211_1:GetWordFromCfg(319321051)
				local var_214_16 = arg_211_1:FormatText(var_214_15.content)

				arg_211_1.text_.text = var_214_16

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_17 = 5
				local var_214_18 = utf8.len(var_214_16)
				local var_214_19 = var_214_17 <= 0 and var_214_13 or var_214_13 * (var_214_18 / var_214_17)

				if var_214_19 > 0 and var_214_13 < var_214_19 then
					arg_211_1.talkMaxDuration = var_214_19

					if var_214_19 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_12
					end
				end

				arg_211_1.text_.text = var_214_16
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321051", "story_v_out_319321.awb") ~= 0 then
					local var_214_20 = manager.audio:GetVoiceLength("story_v_out_319321", "319321051", "story_v_out_319321.awb") / 1000

					if var_214_20 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_20 + var_214_12
					end

					if var_214_15.prefab_name ~= "" and arg_211_1.actors_[var_214_15.prefab_name] ~= nil then
						local var_214_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_15.prefab_name].transform, "story_v_out_319321", "319321051", "story_v_out_319321.awb")

						arg_211_1:RecordAudio("319321051", var_214_21)
						arg_211_1:RecordAudio("319321051", var_214_21)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_319321", "319321051", "story_v_out_319321.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_319321", "319321051", "story_v_out_319321.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_22 = math.max(var_214_13, arg_211_1.talkMaxDuration)

			if var_214_12 <= arg_211_1.time_ and arg_211_1.time_ < var_214_12 + var_214_22 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_12) / var_214_22

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_12 + var_214_22 and arg_211_1.time_ < var_214_12 + var_214_22 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play319321052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 319321052
		arg_215_1.duration_ = 6.1

		local var_215_0 = {
			zh = 4.933,
			ja = 6.1
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
				arg_215_0:Play319321053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["4040ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect4040ui_story == nil then
				arg_215_1.var_.characterEffect4040ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.200000002980232

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect4040ui_story then
					arg_215_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect4040ui_story then
				arg_215_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_218_4 = arg_215_1.actors_["1095ui_story"]
			local var_218_5 = 0

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 and arg_215_1.var_.characterEffect1095ui_story == nil then
				arg_215_1.var_.characterEffect1095ui_story = var_218_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_6 = 0.200000002980232

			if var_218_5 <= arg_215_1.time_ and arg_215_1.time_ < var_218_5 + var_218_6 then
				local var_218_7 = (arg_215_1.time_ - var_218_5) / var_218_6

				if arg_215_1.var_.characterEffect1095ui_story then
					local var_218_8 = Mathf.Lerp(0, 0.5, var_218_7)

					arg_215_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1095ui_story.fillRatio = var_218_8
				end
			end

			if arg_215_1.time_ >= var_218_5 + var_218_6 and arg_215_1.time_ < var_218_5 + var_218_6 + arg_218_0 and arg_215_1.var_.characterEffect1095ui_story then
				local var_218_9 = 0.5

				arg_215_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1095ui_story.fillRatio = var_218_9
			end

			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 then
				arg_215_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_2")
			end

			local var_218_11 = 0

			if var_218_11 < arg_215_1.time_ and arg_215_1.time_ <= var_218_11 + arg_218_0 then
				arg_215_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_218_12 = 0
			local var_218_13 = 0.475

			if var_218_12 < arg_215_1.time_ and arg_215_1.time_ <= var_218_12 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_14 = arg_215_1:FormatText(StoryNameCfg[668].name)

				arg_215_1.leftNameTxt_.text = var_218_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_15 = arg_215_1:GetWordFromCfg(319321052)
				local var_218_16 = arg_215_1:FormatText(var_218_15.content)

				arg_215_1.text_.text = var_218_16

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_17 = 19
				local var_218_18 = utf8.len(var_218_16)
				local var_218_19 = var_218_17 <= 0 and var_218_13 or var_218_13 * (var_218_18 / var_218_17)

				if var_218_19 > 0 and var_218_13 < var_218_19 then
					arg_215_1.talkMaxDuration = var_218_19

					if var_218_19 + var_218_12 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_19 + var_218_12
					end
				end

				arg_215_1.text_.text = var_218_16
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321052", "story_v_out_319321.awb") ~= 0 then
					local var_218_20 = manager.audio:GetVoiceLength("story_v_out_319321", "319321052", "story_v_out_319321.awb") / 1000

					if var_218_20 + var_218_12 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_20 + var_218_12
					end

					if var_218_15.prefab_name ~= "" and arg_215_1.actors_[var_218_15.prefab_name] ~= nil then
						local var_218_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_15.prefab_name].transform, "story_v_out_319321", "319321052", "story_v_out_319321.awb")

						arg_215_1:RecordAudio("319321052", var_218_21)
						arg_215_1:RecordAudio("319321052", var_218_21)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_319321", "319321052", "story_v_out_319321.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_319321", "319321052", "story_v_out_319321.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_22 = math.max(var_218_13, arg_215_1.talkMaxDuration)

			if var_218_12 <= arg_215_1.time_ and arg_215_1.time_ < var_218_12 + var_218_22 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_12) / var_218_22

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_12 + var_218_22 and arg_215_1.time_ < var_218_12 + var_218_22 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play319321053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 319321053
		arg_219_1.duration_ = 12

		local var_219_0 = {
			zh = 6.866,
			ja = 12
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
				arg_219_0:Play319321054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 0.8

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[668].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(319321053)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 32
				local var_222_6 = utf8.len(var_222_4)
				local var_222_7 = var_222_5 <= 0 and var_222_1 or var_222_1 * (var_222_6 / var_222_5)

				if var_222_7 > 0 and var_222_1 < var_222_7 then
					arg_219_1.talkMaxDuration = var_222_7

					if var_222_7 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_7 + var_222_0
					end
				end

				arg_219_1.text_.text = var_222_4
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321053", "story_v_out_319321.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_319321", "319321053", "story_v_out_319321.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_319321", "319321053", "story_v_out_319321.awb")

						arg_219_1:RecordAudio("319321053", var_222_9)
						arg_219_1:RecordAudio("319321053", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_319321", "319321053", "story_v_out_319321.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_319321", "319321053", "story_v_out_319321.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_10 = math.max(var_222_1, arg_219_1.talkMaxDuration)

			if var_222_0 <= arg_219_1.time_ and arg_219_1.time_ < var_222_0 + var_222_10 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_0) / var_222_10

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_0 + var_222_10 and arg_219_1.time_ < var_222_0 + var_222_10 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play319321054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 319321054
		arg_223_1.duration_ = 8.366

		local var_223_0 = {
			zh = 4.5,
			ja = 8.366
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
				arg_223_0:Play319321055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["4040ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect4040ui_story == nil then
				arg_223_1.var_.characterEffect4040ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect4040ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_223_1.var_.characterEffect4040ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect4040ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_223_1.var_.characterEffect4040ui_story.fillRatio = var_226_5
			end

			local var_226_6 = arg_223_1.actors_["1095ui_story"]
			local var_226_7 = 0

			if var_226_7 < arg_223_1.time_ and arg_223_1.time_ <= var_226_7 + arg_226_0 and arg_223_1.var_.characterEffect1095ui_story == nil then
				arg_223_1.var_.characterEffect1095ui_story = var_226_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_8 = 0.200000002980232

			if var_226_7 <= arg_223_1.time_ and arg_223_1.time_ < var_226_7 + var_226_8 then
				local var_226_9 = (arg_223_1.time_ - var_226_7) / var_226_8

				if arg_223_1.var_.characterEffect1095ui_story then
					arg_223_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_7 + var_226_8 and arg_223_1.time_ < var_226_7 + var_226_8 + arg_226_0 and arg_223_1.var_.characterEffect1095ui_story then
				arg_223_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 then
				arg_223_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_226_11 = 0

			if var_226_11 < arg_223_1.time_ and arg_223_1.time_ <= var_226_11 + arg_226_0 then
				arg_223_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_226_12 = 0
			local var_226_13 = 0.5

			if var_226_12 < arg_223_1.time_ and arg_223_1.time_ <= var_226_12 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_14 = arg_223_1:FormatText(StoryNameCfg[471].name)

				arg_223_1.leftNameTxt_.text = var_226_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_15 = arg_223_1:GetWordFromCfg(319321054)
				local var_226_16 = arg_223_1:FormatText(var_226_15.content)

				arg_223_1.text_.text = var_226_16

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_17 = 20
				local var_226_18 = utf8.len(var_226_16)
				local var_226_19 = var_226_17 <= 0 and var_226_13 or var_226_13 * (var_226_18 / var_226_17)

				if var_226_19 > 0 and var_226_13 < var_226_19 then
					arg_223_1.talkMaxDuration = var_226_19

					if var_226_19 + var_226_12 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_19 + var_226_12
					end
				end

				arg_223_1.text_.text = var_226_16
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321054", "story_v_out_319321.awb") ~= 0 then
					local var_226_20 = manager.audio:GetVoiceLength("story_v_out_319321", "319321054", "story_v_out_319321.awb") / 1000

					if var_226_20 + var_226_12 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_20 + var_226_12
					end

					if var_226_15.prefab_name ~= "" and arg_223_1.actors_[var_226_15.prefab_name] ~= nil then
						local var_226_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_15.prefab_name].transform, "story_v_out_319321", "319321054", "story_v_out_319321.awb")

						arg_223_1:RecordAudio("319321054", var_226_21)
						arg_223_1:RecordAudio("319321054", var_226_21)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_319321", "319321054", "story_v_out_319321.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_319321", "319321054", "story_v_out_319321.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_22 = math.max(var_226_13, arg_223_1.talkMaxDuration)

			if var_226_12 <= arg_223_1.time_ and arg_223_1.time_ < var_226_12 + var_226_22 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_12) / var_226_22

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_12 + var_226_22 and arg_223_1.time_ < var_226_12 + var_226_22 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play319321055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 319321055
		arg_227_1.duration_ = 7.033

		local var_227_0 = {
			zh = 4.066,
			ja = 7.033
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
				arg_227_0:Play319321056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["4040ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect4040ui_story == nil then
				arg_227_1.var_.characterEffect4040ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.200000002980232

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect4040ui_story then
					arg_227_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect4040ui_story then
				arg_227_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_230_4 = arg_227_1.actors_["1095ui_story"]
			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 and arg_227_1.var_.characterEffect1095ui_story == nil then
				arg_227_1.var_.characterEffect1095ui_story = var_230_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_6 = 0.200000002980232

			if var_230_5 <= arg_227_1.time_ and arg_227_1.time_ < var_230_5 + var_230_6 then
				local var_230_7 = (arg_227_1.time_ - var_230_5) / var_230_6

				if arg_227_1.var_.characterEffect1095ui_story then
					local var_230_8 = Mathf.Lerp(0, 0.5, var_230_7)

					arg_227_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1095ui_story.fillRatio = var_230_8
				end
			end

			if arg_227_1.time_ >= var_230_5 + var_230_6 and arg_227_1.time_ < var_230_5 + var_230_6 + arg_230_0 and arg_227_1.var_.characterEffect1095ui_story then
				local var_230_9 = 0.5

				arg_227_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1095ui_story.fillRatio = var_230_9
			end

			local var_230_10 = 0
			local var_230_11 = 0.525

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_12 = arg_227_1:FormatText(StoryNameCfg[668].name)

				arg_227_1.leftNameTxt_.text = var_230_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_13 = arg_227_1:GetWordFromCfg(319321055)
				local var_230_14 = arg_227_1:FormatText(var_230_13.content)

				arg_227_1.text_.text = var_230_14

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_15 = 21
				local var_230_16 = utf8.len(var_230_14)
				local var_230_17 = var_230_15 <= 0 and var_230_11 or var_230_11 * (var_230_16 / var_230_15)

				if var_230_17 > 0 and var_230_11 < var_230_17 then
					arg_227_1.talkMaxDuration = var_230_17

					if var_230_17 + var_230_10 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_17 + var_230_10
					end
				end

				arg_227_1.text_.text = var_230_14
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321055", "story_v_out_319321.awb") ~= 0 then
					local var_230_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321055", "story_v_out_319321.awb") / 1000

					if var_230_18 + var_230_10 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_18 + var_230_10
					end

					if var_230_13.prefab_name ~= "" and arg_227_1.actors_[var_230_13.prefab_name] ~= nil then
						local var_230_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_13.prefab_name].transform, "story_v_out_319321", "319321055", "story_v_out_319321.awb")

						arg_227_1:RecordAudio("319321055", var_230_19)
						arg_227_1:RecordAudio("319321055", var_230_19)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_319321", "319321055", "story_v_out_319321.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_319321", "319321055", "story_v_out_319321.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_20 = math.max(var_230_11, arg_227_1.talkMaxDuration)

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_20 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_10) / var_230_20

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_10 + var_230_20 and arg_227_1.time_ < var_230_10 + var_230_20 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play319321056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 319321056
		arg_231_1.duration_ = 6.566

		local var_231_0 = {
			zh = 4,
			ja = 6.566
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
				arg_231_0:Play319321057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1095ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1095ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0.7, -0.98, -6.1)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1095ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["1095ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect1095ui_story == nil then
				arg_231_1.var_.characterEffect1095ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.200000002980232

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect1095ui_story then
					arg_231_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect1095ui_story then
				arg_231_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_234_13 = arg_231_1.actors_["4040ui_story"]
			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 and arg_231_1.var_.characterEffect4040ui_story == nil then
				arg_231_1.var_.characterEffect4040ui_story = var_234_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_15 = 0.200000002980232

			if var_234_14 <= arg_231_1.time_ and arg_231_1.time_ < var_234_14 + var_234_15 then
				local var_234_16 = (arg_231_1.time_ - var_234_14) / var_234_15

				if arg_231_1.var_.characterEffect4040ui_story then
					local var_234_17 = Mathf.Lerp(0, 0.5, var_234_16)

					arg_231_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_231_1.var_.characterEffect4040ui_story.fillRatio = var_234_17
				end
			end

			if arg_231_1.time_ >= var_234_14 + var_234_15 and arg_231_1.time_ < var_234_14 + var_234_15 + arg_234_0 and arg_231_1.var_.characterEffect4040ui_story then
				local var_234_18 = 0.5

				arg_231_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_231_1.var_.characterEffect4040ui_story.fillRatio = var_234_18
			end

			local var_234_19 = 0
			local var_234_20 = 0.375

			if var_234_19 < arg_231_1.time_ and arg_231_1.time_ <= var_234_19 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_21 = arg_231_1:FormatText(StoryNameCfg[471].name)

				arg_231_1.leftNameTxt_.text = var_234_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_22 = arg_231_1:GetWordFromCfg(319321056)
				local var_234_23 = arg_231_1:FormatText(var_234_22.content)

				arg_231_1.text_.text = var_234_23

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_24 = 15
				local var_234_25 = utf8.len(var_234_23)
				local var_234_26 = var_234_24 <= 0 and var_234_20 or var_234_20 * (var_234_25 / var_234_24)

				if var_234_26 > 0 and var_234_20 < var_234_26 then
					arg_231_1.talkMaxDuration = var_234_26

					if var_234_26 + var_234_19 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_26 + var_234_19
					end
				end

				arg_231_1.text_.text = var_234_23
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321056", "story_v_out_319321.awb") ~= 0 then
					local var_234_27 = manager.audio:GetVoiceLength("story_v_out_319321", "319321056", "story_v_out_319321.awb") / 1000

					if var_234_27 + var_234_19 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_27 + var_234_19
					end

					if var_234_22.prefab_name ~= "" and arg_231_1.actors_[var_234_22.prefab_name] ~= nil then
						local var_234_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_22.prefab_name].transform, "story_v_out_319321", "319321056", "story_v_out_319321.awb")

						arg_231_1:RecordAudio("319321056", var_234_28)
						arg_231_1:RecordAudio("319321056", var_234_28)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_319321", "319321056", "story_v_out_319321.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_319321", "319321056", "story_v_out_319321.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_29 = math.max(var_234_20, arg_231_1.talkMaxDuration)

			if var_234_19 <= arg_231_1.time_ and arg_231_1.time_ < var_234_19 + var_234_29 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_19) / var_234_29

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_19 + var_234_29 and arg_231_1.time_ < var_234_19 + var_234_29 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play319321057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 319321057
		arg_235_1.duration_ = 4.1

		local var_235_0 = {
			zh = 1.433,
			ja = 4.1
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
				arg_235_0:Play319321058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["4040ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos4040ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos4040ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.actors_["4040ui_story"]
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 and arg_235_1.var_.characterEffect4040ui_story == nil then
				arg_235_1.var_.characterEffect4040ui_story = var_238_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_11 = 0.200000002980232

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11

				if arg_235_1.var_.characterEffect4040ui_story then
					arg_235_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 and arg_235_1.var_.characterEffect4040ui_story then
				arg_235_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_238_13 = arg_235_1.actors_["1095ui_story"]
			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 and arg_235_1.var_.characterEffect1095ui_story == nil then
				arg_235_1.var_.characterEffect1095ui_story = var_238_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_15 = 0.200000002980232

			if var_238_14 <= arg_235_1.time_ and arg_235_1.time_ < var_238_14 + var_238_15 then
				local var_238_16 = (arg_235_1.time_ - var_238_14) / var_238_15

				if arg_235_1.var_.characterEffect1095ui_story then
					local var_238_17 = Mathf.Lerp(0, 0.5, var_238_16)

					arg_235_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1095ui_story.fillRatio = var_238_17
				end
			end

			if arg_235_1.time_ >= var_238_14 + var_238_15 and arg_235_1.time_ < var_238_14 + var_238_15 + arg_238_0 and arg_235_1.var_.characterEffect1095ui_story then
				local var_238_18 = 0.5

				arg_235_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1095ui_story.fillRatio = var_238_18
			end

			local var_238_19 = 0
			local var_238_20 = 0.125

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_21 = arg_235_1:FormatText(StoryNameCfg[668].name)

				arg_235_1.leftNameTxt_.text = var_238_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_22 = arg_235_1:GetWordFromCfg(319321057)
				local var_238_23 = arg_235_1:FormatText(var_238_22.content)

				arg_235_1.text_.text = var_238_23

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_24 = 5
				local var_238_25 = utf8.len(var_238_23)
				local var_238_26 = var_238_24 <= 0 and var_238_20 or var_238_20 * (var_238_25 / var_238_24)

				if var_238_26 > 0 and var_238_20 < var_238_26 then
					arg_235_1.talkMaxDuration = var_238_26

					if var_238_26 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_26 + var_238_19
					end
				end

				arg_235_1.text_.text = var_238_23
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321057", "story_v_out_319321.awb") ~= 0 then
					local var_238_27 = manager.audio:GetVoiceLength("story_v_out_319321", "319321057", "story_v_out_319321.awb") / 1000

					if var_238_27 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_27 + var_238_19
					end

					if var_238_22.prefab_name ~= "" and arg_235_1.actors_[var_238_22.prefab_name] ~= nil then
						local var_238_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_22.prefab_name].transform, "story_v_out_319321", "319321057", "story_v_out_319321.awb")

						arg_235_1:RecordAudio("319321057", var_238_28)
						arg_235_1:RecordAudio("319321057", var_238_28)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_319321", "319321057", "story_v_out_319321.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_319321", "319321057", "story_v_out_319321.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_29 = math.max(var_238_20, arg_235_1.talkMaxDuration)

			if var_238_19 <= arg_235_1.time_ and arg_235_1.time_ < var_238_19 + var_238_29 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_19) / var_238_29

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_19 + var_238_29 and arg_235_1.time_ < var_238_19 + var_238_29 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play319321058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 319321058
		arg_239_1.duration_ = 6.8

		local var_239_0 = {
			zh = 2.766,
			ja = 6.8
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
				arg_239_0:Play319321059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["4040ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect4040ui_story == nil then
				arg_239_1.var_.characterEffect4040ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.200000002980232

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect4040ui_story then
					local var_242_4 = Mathf.Lerp(0, 0.5, var_242_3)

					arg_239_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_239_1.var_.characterEffect4040ui_story.fillRatio = var_242_4
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect4040ui_story then
				local var_242_5 = 0.5

				arg_239_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_239_1.var_.characterEffect4040ui_story.fillRatio = var_242_5
			end

			local var_242_6 = arg_239_1.actors_["1095ui_story"]
			local var_242_7 = 0

			if var_242_7 < arg_239_1.time_ and arg_239_1.time_ <= var_242_7 + arg_242_0 and arg_239_1.var_.characterEffect1095ui_story == nil then
				arg_239_1.var_.characterEffect1095ui_story = var_242_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_8 = 0.200000002980232

			if var_242_7 <= arg_239_1.time_ and arg_239_1.time_ < var_242_7 + var_242_8 then
				local var_242_9 = (arg_239_1.time_ - var_242_7) / var_242_8

				if arg_239_1.var_.characterEffect1095ui_story then
					arg_239_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_7 + var_242_8 and arg_239_1.time_ < var_242_7 + var_242_8 + arg_242_0 and arg_239_1.var_.characterEffect1095ui_story then
				arg_239_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_242_10 = 0
			local var_242_11 = 0.35

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_12 = arg_239_1:FormatText(StoryNameCfg[471].name)

				arg_239_1.leftNameTxt_.text = var_242_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_13 = arg_239_1:GetWordFromCfg(319321058)
				local var_242_14 = arg_239_1:FormatText(var_242_13.content)

				arg_239_1.text_.text = var_242_14

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_15 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321058", "story_v_out_319321.awb") ~= 0 then
					local var_242_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321058", "story_v_out_319321.awb") / 1000

					if var_242_18 + var_242_10 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_18 + var_242_10
					end

					if var_242_13.prefab_name ~= "" and arg_239_1.actors_[var_242_13.prefab_name] ~= nil then
						local var_242_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_13.prefab_name].transform, "story_v_out_319321", "319321058", "story_v_out_319321.awb")

						arg_239_1:RecordAudio("319321058", var_242_19)
						arg_239_1:RecordAudio("319321058", var_242_19)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_319321", "319321058", "story_v_out_319321.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_319321", "319321058", "story_v_out_319321.awb")
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
	Play319321059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 319321059
		arg_243_1.duration_ = 9.233

		local var_243_0 = {
			zh = 5.3,
			ja = 9.233
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
				arg_243_0:Play319321060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1095ui_story"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1095ui_story = var_246_0.localPosition
			end

			local var_246_2 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2
				local var_246_4 = Vector3.New(0.7, -0.98, -6.1)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1095ui_story, var_246_4, var_246_3)

				local var_246_5 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_5.x, var_246_5.y, var_246_5.z)

				local var_246_6 = var_246_0.localEulerAngles

				var_246_6.z = 0
				var_246_6.x = 0
				var_246_0.localEulerAngles = var_246_6
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_246_7 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_7.x, var_246_7.y, var_246_7.z)

				local var_246_8 = var_246_0.localEulerAngles

				var_246_8.z = 0
				var_246_8.x = 0
				var_246_0.localEulerAngles = var_246_8
			end

			local var_246_9 = arg_243_1.actors_["1095ui_story"]
			local var_246_10 = 0

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 and arg_243_1.var_.characterEffect1095ui_story == nil then
				arg_243_1.var_.characterEffect1095ui_story = var_246_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_11 = 0.200000002980232

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_11 then
				local var_246_12 = (arg_243_1.time_ - var_246_10) / var_246_11

				if arg_243_1.var_.characterEffect1095ui_story then
					arg_243_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_10 + var_246_11 and arg_243_1.time_ < var_246_10 + var_246_11 + arg_246_0 and arg_243_1.var_.characterEffect1095ui_story then
				arg_243_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_246_13 = 0

			if var_246_13 < arg_243_1.time_ and arg_243_1.time_ <= var_246_13 + arg_246_0 then
				arg_243_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_246_14 = 0

			if var_246_14 < arg_243_1.time_ and arg_243_1.time_ <= var_246_14 + arg_246_0 then
				arg_243_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_246_15 = 0
			local var_246_16 = 0.7

			if var_246_15 < arg_243_1.time_ and arg_243_1.time_ <= var_246_15 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_17 = arg_243_1:FormatText(StoryNameCfg[471].name)

				arg_243_1.leftNameTxt_.text = var_246_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_18 = arg_243_1:GetWordFromCfg(319321059)
				local var_246_19 = arg_243_1:FormatText(var_246_18.content)

				arg_243_1.text_.text = var_246_19

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_20 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321059", "story_v_out_319321.awb") ~= 0 then
					local var_246_23 = manager.audio:GetVoiceLength("story_v_out_319321", "319321059", "story_v_out_319321.awb") / 1000

					if var_246_23 + var_246_15 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_23 + var_246_15
					end

					if var_246_18.prefab_name ~= "" and arg_243_1.actors_[var_246_18.prefab_name] ~= nil then
						local var_246_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_18.prefab_name].transform, "story_v_out_319321", "319321059", "story_v_out_319321.awb")

						arg_243_1:RecordAudio("319321059", var_246_24)
						arg_243_1:RecordAudio("319321059", var_246_24)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_319321", "319321059", "story_v_out_319321.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_319321", "319321059", "story_v_out_319321.awb")
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
	Play319321060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 319321060
		arg_247_1.duration_ = 5.966

		local var_247_0 = {
			zh = 3.266,
			ja = 5.966
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
				arg_247_0:Play319321061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["4040ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect4040ui_story == nil then
				arg_247_1.var_.characterEffect4040ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.200000002980232

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect4040ui_story then
					arg_247_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect4040ui_story then
				arg_247_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_250_4 = arg_247_1.actors_["1095ui_story"]
			local var_250_5 = 0

			if var_250_5 < arg_247_1.time_ and arg_247_1.time_ <= var_250_5 + arg_250_0 and arg_247_1.var_.characterEffect1095ui_story == nil then
				arg_247_1.var_.characterEffect1095ui_story = var_250_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_6 = 0.200000002980232

			if var_250_5 <= arg_247_1.time_ and arg_247_1.time_ < var_250_5 + var_250_6 then
				local var_250_7 = (arg_247_1.time_ - var_250_5) / var_250_6

				if arg_247_1.var_.characterEffect1095ui_story then
					local var_250_8 = Mathf.Lerp(0, 0.5, var_250_7)

					arg_247_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1095ui_story.fillRatio = var_250_8
				end
			end

			if arg_247_1.time_ >= var_250_5 + var_250_6 and arg_247_1.time_ < var_250_5 + var_250_6 + arg_250_0 and arg_247_1.var_.characterEffect1095ui_story then
				local var_250_9 = 0.5

				arg_247_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1095ui_story.fillRatio = var_250_9
			end

			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 then
				arg_247_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_250_11 = 0

			if var_250_11 < arg_247_1.time_ and arg_247_1.time_ <= var_250_11 + arg_250_0 then
				arg_247_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_1")
			end

			local var_250_12 = 0
			local var_250_13 = 0.425

			if var_250_12 < arg_247_1.time_ and arg_247_1.time_ <= var_250_12 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_14 = arg_247_1:FormatText(StoryNameCfg[668].name)

				arg_247_1.leftNameTxt_.text = var_250_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_15 = arg_247_1:GetWordFromCfg(319321060)
				local var_250_16 = arg_247_1:FormatText(var_250_15.content)

				arg_247_1.text_.text = var_250_16

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_17 = 17
				local var_250_18 = utf8.len(var_250_16)
				local var_250_19 = var_250_17 <= 0 and var_250_13 or var_250_13 * (var_250_18 / var_250_17)

				if var_250_19 > 0 and var_250_13 < var_250_19 then
					arg_247_1.talkMaxDuration = var_250_19

					if var_250_19 + var_250_12 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_19 + var_250_12
					end
				end

				arg_247_1.text_.text = var_250_16
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321060", "story_v_out_319321.awb") ~= 0 then
					local var_250_20 = manager.audio:GetVoiceLength("story_v_out_319321", "319321060", "story_v_out_319321.awb") / 1000

					if var_250_20 + var_250_12 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_20 + var_250_12
					end

					if var_250_15.prefab_name ~= "" and arg_247_1.actors_[var_250_15.prefab_name] ~= nil then
						local var_250_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_15.prefab_name].transform, "story_v_out_319321", "319321060", "story_v_out_319321.awb")

						arg_247_1:RecordAudio("319321060", var_250_21)
						arg_247_1:RecordAudio("319321060", var_250_21)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_319321", "319321060", "story_v_out_319321.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_319321", "319321060", "story_v_out_319321.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_22 = math.max(var_250_13, arg_247_1.talkMaxDuration)

			if var_250_12 <= arg_247_1.time_ and arg_247_1.time_ < var_250_12 + var_250_22 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_12) / var_250_22

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_12 + var_250_22 and arg_247_1.time_ < var_250_12 + var_250_22 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play319321061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 319321061
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play319321062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["4040ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect4040ui_story == nil then
				arg_251_1.var_.characterEffect4040ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.200000002980232

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect4040ui_story then
					local var_254_4 = Mathf.Lerp(0, 0.5, var_254_3)

					arg_251_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_251_1.var_.characterEffect4040ui_story.fillRatio = var_254_4
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect4040ui_story then
				local var_254_5 = 0.5

				arg_251_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_251_1.var_.characterEffect4040ui_story.fillRatio = var_254_5
			end

			local var_254_6 = 0
			local var_254_7 = 0.65

			if var_254_6 < arg_251_1.time_ and arg_251_1.time_ <= var_254_6 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_8 = arg_251_1:GetWordFromCfg(319321061)
				local var_254_9 = arg_251_1:FormatText(var_254_8.content)

				arg_251_1.text_.text = var_254_9

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_10 = 26
				local var_254_11 = utf8.len(var_254_9)
				local var_254_12 = var_254_10 <= 0 and var_254_7 or var_254_7 * (var_254_11 / var_254_10)

				if var_254_12 > 0 and var_254_7 < var_254_12 then
					arg_251_1.talkMaxDuration = var_254_12

					if var_254_12 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_12 + var_254_6
					end
				end

				arg_251_1.text_.text = var_254_9
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_13 = math.max(var_254_7, arg_251_1.talkMaxDuration)

			if var_254_6 <= arg_251_1.time_ and arg_251_1.time_ < var_254_6 + var_254_13 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_6) / var_254_13

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_6 + var_254_13 and arg_251_1.time_ < var_254_6 + var_254_13 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play319321062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 319321062
		arg_255_1.duration_ = 9

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play319321063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				local var_258_1 = manager.ui.mainCamera.transform.localPosition
				local var_258_2 = Vector3.New(0, 0, 10) + Vector3.New(var_258_1.x, var_258_1.y, 0)
				local var_258_3 = arg_255_1.bgs_.I12f

				var_258_3.transform.localPosition = var_258_2
				var_258_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_258_4 = var_258_3:GetComponent("SpriteRenderer")

				if var_258_4 and var_258_4.sprite then
					local var_258_5 = (var_258_3.transform.localPosition - var_258_1).z
					local var_258_6 = manager.ui.mainCameraCom_
					local var_258_7 = 2 * var_258_5 * Mathf.Tan(var_258_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_258_8 = var_258_7 * var_258_6.aspect
					local var_258_9 = var_258_4.sprite.bounds.size.x
					local var_258_10 = var_258_4.sprite.bounds.size.y
					local var_258_11 = var_258_8 / var_258_9
					local var_258_12 = var_258_7 / var_258_10
					local var_258_13 = var_258_12 < var_258_11 and var_258_11 or var_258_12

					var_258_3.transform.localScale = Vector3.New(var_258_13, var_258_13, 0)
				end

				for iter_258_0, iter_258_1 in pairs(arg_255_1.bgs_) do
					if iter_258_0 ~= "I12f" then
						iter_258_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_258_14 = 2

			if var_258_14 < arg_255_1.time_ and arg_255_1.time_ <= var_258_14 + arg_258_0 then
				local var_258_15 = manager.ui.mainCamera.transform.localPosition
				local var_258_16 = Vector3.New(0, 0, 10) + Vector3.New(var_258_15.x, var_258_15.y, 0)
				local var_258_17 = arg_255_1.bgs_.I12f

				var_258_17.transform.localPosition = var_258_16
				var_258_17.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_258_18 = var_258_17:GetComponent("SpriteRenderer")

				if var_258_18 and var_258_18.sprite then
					local var_258_19 = (var_258_17.transform.localPosition - var_258_15).z
					local var_258_20 = manager.ui.mainCameraCom_
					local var_258_21 = 2 * var_258_19 * Mathf.Tan(var_258_20.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_258_22 = var_258_21 * var_258_20.aspect
					local var_258_23 = var_258_18.sprite.bounds.size.x
					local var_258_24 = var_258_18.sprite.bounds.size.y
					local var_258_25 = var_258_22 / var_258_23
					local var_258_26 = var_258_21 / var_258_24
					local var_258_27 = var_258_26 < var_258_25 and var_258_25 or var_258_26

					var_258_17.transform.localScale = Vector3.New(var_258_27, var_258_27, 0)
				end

				for iter_258_2, iter_258_3 in pairs(arg_255_1.bgs_) do
					if iter_258_2 ~= "I12f" then
						iter_258_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_258_28 = 0

			if var_258_28 < arg_255_1.time_ and arg_255_1.time_ <= var_258_28 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_29 = 2

			if var_258_28 <= arg_255_1.time_ and arg_255_1.time_ < var_258_28 + var_258_29 then
				local var_258_30 = (arg_255_1.time_ - var_258_28) / var_258_29
				local var_258_31 = Color.New(0, 0, 0)

				var_258_31.a = Mathf.Lerp(0, 1, var_258_30)
				arg_255_1.mask_.color = var_258_31
			end

			if arg_255_1.time_ >= var_258_28 + var_258_29 and arg_255_1.time_ < var_258_28 + var_258_29 + arg_258_0 then
				local var_258_32 = Color.New(0, 0, 0)

				var_258_32.a = 1
				arg_255_1.mask_.color = var_258_32
			end

			local var_258_33 = 2

			if var_258_33 < arg_255_1.time_ and arg_255_1.time_ <= var_258_33 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_34 = 2

			if var_258_33 <= arg_255_1.time_ and arg_255_1.time_ < var_258_33 + var_258_34 then
				local var_258_35 = (arg_255_1.time_ - var_258_33) / var_258_34
				local var_258_36 = Color.New(0, 0, 0)

				var_258_36.a = Mathf.Lerp(1, 0, var_258_35)
				arg_255_1.mask_.color = var_258_36
			end

			if arg_255_1.time_ >= var_258_33 + var_258_34 and arg_255_1.time_ < var_258_33 + var_258_34 + arg_258_0 then
				local var_258_37 = Color.New(0, 0, 0)
				local var_258_38 = 0

				arg_255_1.mask_.enabled = false
				var_258_37.a = var_258_38
				arg_255_1.mask_.color = var_258_37
			end

			local var_258_39 = arg_255_1.actors_["1095ui_story"].transform
			local var_258_40 = 2

			if var_258_40 < arg_255_1.time_ and arg_255_1.time_ <= var_258_40 + arg_258_0 then
				arg_255_1.var_.moveOldPos1095ui_story = var_258_39.localPosition
			end

			local var_258_41 = 0.001

			if var_258_40 <= arg_255_1.time_ and arg_255_1.time_ < var_258_40 + var_258_41 then
				local var_258_42 = (arg_255_1.time_ - var_258_40) / var_258_41
				local var_258_43 = Vector3.New(0, 100, 0)

				var_258_39.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1095ui_story, var_258_43, var_258_42)

				local var_258_44 = manager.ui.mainCamera.transform.position - var_258_39.position

				var_258_39.forward = Vector3.New(var_258_44.x, var_258_44.y, var_258_44.z)

				local var_258_45 = var_258_39.localEulerAngles

				var_258_45.z = 0
				var_258_45.x = 0
				var_258_39.localEulerAngles = var_258_45
			end

			if arg_255_1.time_ >= var_258_40 + var_258_41 and arg_255_1.time_ < var_258_40 + var_258_41 + arg_258_0 then
				var_258_39.localPosition = Vector3.New(0, 100, 0)

				local var_258_46 = manager.ui.mainCamera.transform.position - var_258_39.position

				var_258_39.forward = Vector3.New(var_258_46.x, var_258_46.y, var_258_46.z)

				local var_258_47 = var_258_39.localEulerAngles

				var_258_47.z = 0
				var_258_47.x = 0
				var_258_39.localEulerAngles = var_258_47
			end

			local var_258_48 = arg_255_1.actors_["4040ui_story"].transform
			local var_258_49 = 2

			if var_258_49 < arg_255_1.time_ and arg_255_1.time_ <= var_258_49 + arg_258_0 then
				arg_255_1.var_.moveOldPos4040ui_story = var_258_48.localPosition
			end

			local var_258_50 = 0.001

			if var_258_49 <= arg_255_1.time_ and arg_255_1.time_ < var_258_49 + var_258_50 then
				local var_258_51 = (arg_255_1.time_ - var_258_49) / var_258_50
				local var_258_52 = Vector3.New(0, 100, 0)

				var_258_48.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos4040ui_story, var_258_52, var_258_51)

				local var_258_53 = manager.ui.mainCamera.transform.position - var_258_48.position

				var_258_48.forward = Vector3.New(var_258_53.x, var_258_53.y, var_258_53.z)

				local var_258_54 = var_258_48.localEulerAngles

				var_258_54.z = 0
				var_258_54.x = 0
				var_258_48.localEulerAngles = var_258_54
			end

			if arg_255_1.time_ >= var_258_49 + var_258_50 and arg_255_1.time_ < var_258_49 + var_258_50 + arg_258_0 then
				var_258_48.localPosition = Vector3.New(0, 100, 0)

				local var_258_55 = manager.ui.mainCamera.transform.position - var_258_48.position

				var_258_48.forward = Vector3.New(var_258_55.x, var_258_55.y, var_258_55.z)

				local var_258_56 = var_258_48.localEulerAngles

				var_258_56.z = 0
				var_258_56.x = 0
				var_258_48.localEulerAngles = var_258_56
			end

			if arg_255_1.frameCnt_ <= 1 then
				arg_255_1.dialog_:SetActive(false)
			end

			local var_258_57 = 4
			local var_258_58 = 1.1

			if var_258_57 < arg_255_1.time_ and arg_255_1.time_ <= var_258_57 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0

				arg_255_1.dialog_:SetActive(true)

				local var_258_59 = LeanTween.value(arg_255_1.dialog_, 0, 1, 0.3)

				var_258_59:setOnUpdate(LuaHelper.FloatAction(function(arg_259_0)
					arg_255_1.dialogCg_.alpha = arg_259_0
				end))
				var_258_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_255_1.dialog_)
					var_258_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_255_1.duration_ = arg_255_1.duration_ + 0.3

				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_60 = arg_255_1:GetWordFromCfg(319321062)
				local var_258_61 = arg_255_1:FormatText(var_258_60.content)

				arg_255_1.text_.text = var_258_61

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_62 = 44
				local var_258_63 = utf8.len(var_258_61)
				local var_258_64 = var_258_62 <= 0 and var_258_58 or var_258_58 * (var_258_63 / var_258_62)

				if var_258_64 > 0 and var_258_58 < var_258_64 then
					arg_255_1.talkMaxDuration = var_258_64
					var_258_57 = var_258_57 + 0.3

					if var_258_64 + var_258_57 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_64 + var_258_57
					end
				end

				arg_255_1.text_.text = var_258_61
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_65 = var_258_57 + 0.3
			local var_258_66 = math.max(var_258_58, arg_255_1.talkMaxDuration)

			if var_258_65 <= arg_255_1.time_ and arg_255_1.time_ < var_258_65 + var_258_66 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_65) / var_258_66

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_65 + var_258_66 and arg_255_1.time_ < var_258_65 + var_258_66 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play319321063 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 319321063
		arg_261_1.duration_ = 3.966

		local var_261_0 = {
			zh = 3.833,
			ja = 3.966
		}
		local var_261_1 = manager.audio:GetLocalizationFlag()

		if var_261_0[var_261_1] ~= nil then
			arg_261_1.duration_ = var_261_0[var_261_1]
		end

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play319321064(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1095ui_story"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos1095ui_story = var_264_0.localPosition
			end

			local var_264_2 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2
				local var_264_4 = Vector3.New(0, -0.98, -6.1)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1095ui_story, var_264_4, var_264_3)

				local var_264_5 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_5.x, var_264_5.y, var_264_5.z)

				local var_264_6 = var_264_0.localEulerAngles

				var_264_6.z = 0
				var_264_6.x = 0
				var_264_0.localEulerAngles = var_264_6
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_264_7 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_7.x, var_264_7.y, var_264_7.z)

				local var_264_8 = var_264_0.localEulerAngles

				var_264_8.z = 0
				var_264_8.x = 0
				var_264_0.localEulerAngles = var_264_8
			end

			local var_264_9 = arg_261_1.actors_["1095ui_story"]
			local var_264_10 = 0

			if var_264_10 < arg_261_1.time_ and arg_261_1.time_ <= var_264_10 + arg_264_0 and arg_261_1.var_.characterEffect1095ui_story == nil then
				arg_261_1.var_.characterEffect1095ui_story = var_264_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_11 = 0.200000002980232

			if var_264_10 <= arg_261_1.time_ and arg_261_1.time_ < var_264_10 + var_264_11 then
				local var_264_12 = (arg_261_1.time_ - var_264_10) / var_264_11

				if arg_261_1.var_.characterEffect1095ui_story then
					arg_261_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_10 + var_264_11 and arg_261_1.time_ < var_264_10 + var_264_11 + arg_264_0 and arg_261_1.var_.characterEffect1095ui_story then
				arg_261_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_264_13 = 0

			if var_264_13 < arg_261_1.time_ and arg_261_1.time_ <= var_264_13 + arg_264_0 then
				arg_261_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_264_14 = 0

			if var_264_14 < arg_261_1.time_ and arg_261_1.time_ <= var_264_14 + arg_264_0 then
				arg_261_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_264_15 = 0
			local var_264_16 = 0.4

			if var_264_15 < arg_261_1.time_ and arg_261_1.time_ <= var_264_15 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_17 = arg_261_1:FormatText(StoryNameCfg[471].name)

				arg_261_1.leftNameTxt_.text = var_264_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_18 = arg_261_1:GetWordFromCfg(319321063)
				local var_264_19 = arg_261_1:FormatText(var_264_18.content)

				arg_261_1.text_.text = var_264_19

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_20 = 16
				local var_264_21 = utf8.len(var_264_19)
				local var_264_22 = var_264_20 <= 0 and var_264_16 or var_264_16 * (var_264_21 / var_264_20)

				if var_264_22 > 0 and var_264_16 < var_264_22 then
					arg_261_1.talkMaxDuration = var_264_22

					if var_264_22 + var_264_15 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_22 + var_264_15
					end
				end

				arg_261_1.text_.text = var_264_19
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321063", "story_v_out_319321.awb") ~= 0 then
					local var_264_23 = manager.audio:GetVoiceLength("story_v_out_319321", "319321063", "story_v_out_319321.awb") / 1000

					if var_264_23 + var_264_15 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_23 + var_264_15
					end

					if var_264_18.prefab_name ~= "" and arg_261_1.actors_[var_264_18.prefab_name] ~= nil then
						local var_264_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_18.prefab_name].transform, "story_v_out_319321", "319321063", "story_v_out_319321.awb")

						arg_261_1:RecordAudio("319321063", var_264_24)
						arg_261_1:RecordAudio("319321063", var_264_24)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_319321", "319321063", "story_v_out_319321.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_319321", "319321063", "story_v_out_319321.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_25 = math.max(var_264_16, arg_261_1.talkMaxDuration)

			if var_264_15 <= arg_261_1.time_ and arg_261_1.time_ < var_264_15 + var_264_25 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_15) / var_264_25

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_15 + var_264_25 and arg_261_1.time_ < var_264_15 + var_264_25 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play319321064 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 319321064
		arg_265_1.duration_ = 6.966

		local var_265_0 = {
			zh = 4.166,
			ja = 6.966
		}
		local var_265_1 = manager.audio:GetLocalizationFlag()

		if var_265_0[var_265_1] ~= nil then
			arg_265_1.duration_ = var_265_0[var_265_1]
		end

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play319321065(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["4040ui_story"]
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 and arg_265_1.var_.characterEffect4040ui_story == nil then
				arg_265_1.var_.characterEffect4040ui_story = var_268_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_2 = 0.200000002980232

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2

				if arg_265_1.var_.characterEffect4040ui_story then
					arg_265_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 and arg_265_1.var_.characterEffect4040ui_story then
				arg_265_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_268_4 = arg_265_1.actors_["1095ui_story"]
			local var_268_5 = 0

			if var_268_5 < arg_265_1.time_ and arg_265_1.time_ <= var_268_5 + arg_268_0 and arg_265_1.var_.characterEffect1095ui_story == nil then
				arg_265_1.var_.characterEffect1095ui_story = var_268_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_6 = 0.200000002980232

			if var_268_5 <= arg_265_1.time_ and arg_265_1.time_ < var_268_5 + var_268_6 then
				local var_268_7 = (arg_265_1.time_ - var_268_5) / var_268_6

				if arg_265_1.var_.characterEffect1095ui_story then
					local var_268_8 = Mathf.Lerp(0, 0.5, var_268_7)

					arg_265_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_265_1.var_.characterEffect1095ui_story.fillRatio = var_268_8
				end
			end

			if arg_265_1.time_ >= var_268_5 + var_268_6 and arg_265_1.time_ < var_268_5 + var_268_6 + arg_268_0 and arg_265_1.var_.characterEffect1095ui_story then
				local var_268_9 = 0.5

				arg_265_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_265_1.var_.characterEffect1095ui_story.fillRatio = var_268_9
			end

			local var_268_10 = 0

			if var_268_10 < arg_265_1.time_ and arg_265_1.time_ <= var_268_10 + arg_268_0 then
				arg_265_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_2")
			end

			local var_268_11 = 0

			if var_268_11 < arg_265_1.time_ and arg_265_1.time_ <= var_268_11 + arg_268_0 then
				arg_265_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_268_12 = arg_265_1.actors_["1095ui_story"].transform
			local var_268_13 = 0

			if var_268_13 < arg_265_1.time_ and arg_265_1.time_ <= var_268_13 + arg_268_0 then
				arg_265_1.var_.moveOldPos1095ui_story = var_268_12.localPosition
			end

			local var_268_14 = 0.001

			if var_268_13 <= arg_265_1.time_ and arg_265_1.time_ < var_268_13 + var_268_14 then
				local var_268_15 = (arg_265_1.time_ - var_268_13) / var_268_14
				local var_268_16 = Vector3.New(0.7, -0.98, -6.1)

				var_268_12.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1095ui_story, var_268_16, var_268_15)

				local var_268_17 = manager.ui.mainCamera.transform.position - var_268_12.position

				var_268_12.forward = Vector3.New(var_268_17.x, var_268_17.y, var_268_17.z)

				local var_268_18 = var_268_12.localEulerAngles

				var_268_18.z = 0
				var_268_18.x = 0
				var_268_12.localEulerAngles = var_268_18
			end

			if arg_265_1.time_ >= var_268_13 + var_268_14 and arg_265_1.time_ < var_268_13 + var_268_14 + arg_268_0 then
				var_268_12.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_268_19 = manager.ui.mainCamera.transform.position - var_268_12.position

				var_268_12.forward = Vector3.New(var_268_19.x, var_268_19.y, var_268_19.z)

				local var_268_20 = var_268_12.localEulerAngles

				var_268_20.z = 0
				var_268_20.x = 0
				var_268_12.localEulerAngles = var_268_20
			end

			local var_268_21 = arg_265_1.actors_["4040ui_story"].transform
			local var_268_22 = 0

			if var_268_22 < arg_265_1.time_ and arg_265_1.time_ <= var_268_22 + arg_268_0 then
				arg_265_1.var_.moveOldPos4040ui_story = var_268_21.localPosition
			end

			local var_268_23 = 0.001

			if var_268_22 <= arg_265_1.time_ and arg_265_1.time_ < var_268_22 + var_268_23 then
				local var_268_24 = (arg_265_1.time_ - var_268_22) / var_268_23
				local var_268_25 = Vector3.New(-0.7, -1.55, -5.5)

				var_268_21.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos4040ui_story, var_268_25, var_268_24)

				local var_268_26 = manager.ui.mainCamera.transform.position - var_268_21.position

				var_268_21.forward = Vector3.New(var_268_26.x, var_268_26.y, var_268_26.z)

				local var_268_27 = var_268_21.localEulerAngles

				var_268_27.z = 0
				var_268_27.x = 0
				var_268_21.localEulerAngles = var_268_27
			end

			if arg_265_1.time_ >= var_268_22 + var_268_23 and arg_265_1.time_ < var_268_22 + var_268_23 + arg_268_0 then
				var_268_21.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_268_28 = manager.ui.mainCamera.transform.position - var_268_21.position

				var_268_21.forward = Vector3.New(var_268_28.x, var_268_28.y, var_268_28.z)

				local var_268_29 = var_268_21.localEulerAngles

				var_268_29.z = 0
				var_268_29.x = 0
				var_268_21.localEulerAngles = var_268_29
			end

			local var_268_30 = 0
			local var_268_31 = 0.5

			if var_268_30 < arg_265_1.time_ and arg_265_1.time_ <= var_268_30 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_32 = arg_265_1:FormatText(StoryNameCfg[668].name)

				arg_265_1.leftNameTxt_.text = var_268_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_33 = arg_265_1:GetWordFromCfg(319321064)
				local var_268_34 = arg_265_1:FormatText(var_268_33.content)

				arg_265_1.text_.text = var_268_34

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_35 = 20
				local var_268_36 = utf8.len(var_268_34)
				local var_268_37 = var_268_35 <= 0 and var_268_31 or var_268_31 * (var_268_36 / var_268_35)

				if var_268_37 > 0 and var_268_31 < var_268_37 then
					arg_265_1.talkMaxDuration = var_268_37

					if var_268_37 + var_268_30 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_37 + var_268_30
					end
				end

				arg_265_1.text_.text = var_268_34
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321064", "story_v_out_319321.awb") ~= 0 then
					local var_268_38 = manager.audio:GetVoiceLength("story_v_out_319321", "319321064", "story_v_out_319321.awb") / 1000

					if var_268_38 + var_268_30 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_38 + var_268_30
					end

					if var_268_33.prefab_name ~= "" and arg_265_1.actors_[var_268_33.prefab_name] ~= nil then
						local var_268_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_33.prefab_name].transform, "story_v_out_319321", "319321064", "story_v_out_319321.awb")

						arg_265_1:RecordAudio("319321064", var_268_39)
						arg_265_1:RecordAudio("319321064", var_268_39)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_319321", "319321064", "story_v_out_319321.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_319321", "319321064", "story_v_out_319321.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_40 = math.max(var_268_31, arg_265_1.talkMaxDuration)

			if var_268_30 <= arg_265_1.time_ and arg_265_1.time_ < var_268_30 + var_268_40 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_30) / var_268_40

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_30 + var_268_40 and arg_265_1.time_ < var_268_30 + var_268_40 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play319321065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 319321065
		arg_269_1.duration_ = 6.833

		local var_269_0 = {
			zh = 2.566,
			ja = 6.833
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
				arg_269_0:Play319321066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["4040ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect4040ui_story == nil then
				arg_269_1.var_.characterEffect4040ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.200000002980232

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect4040ui_story then
					local var_272_4 = Mathf.Lerp(0, 0.5, var_272_3)

					arg_269_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_269_1.var_.characterEffect4040ui_story.fillRatio = var_272_4
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect4040ui_story then
				local var_272_5 = 0.5

				arg_269_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_269_1.var_.characterEffect4040ui_story.fillRatio = var_272_5
			end

			local var_272_6 = arg_269_1.actors_["1095ui_story"]
			local var_272_7 = 0

			if var_272_7 < arg_269_1.time_ and arg_269_1.time_ <= var_272_7 + arg_272_0 and arg_269_1.var_.characterEffect1095ui_story == nil then
				arg_269_1.var_.characterEffect1095ui_story = var_272_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_8 = 0.200000002980232

			if var_272_7 <= arg_269_1.time_ and arg_269_1.time_ < var_272_7 + var_272_8 then
				local var_272_9 = (arg_269_1.time_ - var_272_7) / var_272_8

				if arg_269_1.var_.characterEffect1095ui_story then
					arg_269_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_7 + var_272_8 and arg_269_1.time_ < var_272_7 + var_272_8 + arg_272_0 and arg_269_1.var_.characterEffect1095ui_story then
				arg_269_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_272_10 = 0
			local var_272_11 = 0.25

			if var_272_10 < arg_269_1.time_ and arg_269_1.time_ <= var_272_10 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_12 = arg_269_1:FormatText(StoryNameCfg[471].name)

				arg_269_1.leftNameTxt_.text = var_272_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_13 = arg_269_1:GetWordFromCfg(319321065)
				local var_272_14 = arg_269_1:FormatText(var_272_13.content)

				arg_269_1.text_.text = var_272_14

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_15 = 10
				local var_272_16 = utf8.len(var_272_14)
				local var_272_17 = var_272_15 <= 0 and var_272_11 or var_272_11 * (var_272_16 / var_272_15)

				if var_272_17 > 0 and var_272_11 < var_272_17 then
					arg_269_1.talkMaxDuration = var_272_17

					if var_272_17 + var_272_10 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_17 + var_272_10
					end
				end

				arg_269_1.text_.text = var_272_14
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321065", "story_v_out_319321.awb") ~= 0 then
					local var_272_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321065", "story_v_out_319321.awb") / 1000

					if var_272_18 + var_272_10 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_18 + var_272_10
					end

					if var_272_13.prefab_name ~= "" and arg_269_1.actors_[var_272_13.prefab_name] ~= nil then
						local var_272_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_13.prefab_name].transform, "story_v_out_319321", "319321065", "story_v_out_319321.awb")

						arg_269_1:RecordAudio("319321065", var_272_19)
						arg_269_1:RecordAudio("319321065", var_272_19)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_319321", "319321065", "story_v_out_319321.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_319321", "319321065", "story_v_out_319321.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_20 = math.max(var_272_11, arg_269_1.talkMaxDuration)

			if var_272_10 <= arg_269_1.time_ and arg_269_1.time_ < var_272_10 + var_272_20 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_10) / var_272_20

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_10 + var_272_20 and arg_269_1.time_ < var_272_10 + var_272_20 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play319321066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 319321066
		arg_273_1.duration_ = 2.9

		local var_273_0 = {
			zh = 1.433,
			ja = 2.9
		}
		local var_273_1 = manager.audio:GetLocalizationFlag()

		if var_273_0[var_273_1] ~= nil then
			arg_273_1.duration_ = var_273_0[var_273_1]
		end

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play319321067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["4040ui_story"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and arg_273_1.var_.characterEffect4040ui_story == nil then
				arg_273_1.var_.characterEffect4040ui_story = var_276_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_2 = 0.200000002980232

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.characterEffect4040ui_story then
					arg_273_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and arg_273_1.var_.characterEffect4040ui_story then
				arg_273_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_276_4 = arg_273_1.actors_["1095ui_story"]
			local var_276_5 = 0

			if var_276_5 < arg_273_1.time_ and arg_273_1.time_ <= var_276_5 + arg_276_0 and arg_273_1.var_.characterEffect1095ui_story == nil then
				arg_273_1.var_.characterEffect1095ui_story = var_276_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_6 = 0.200000002980232

			if var_276_5 <= arg_273_1.time_ and arg_273_1.time_ < var_276_5 + var_276_6 then
				local var_276_7 = (arg_273_1.time_ - var_276_5) / var_276_6

				if arg_273_1.var_.characterEffect1095ui_story then
					local var_276_8 = Mathf.Lerp(0, 0.5, var_276_7)

					arg_273_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1095ui_story.fillRatio = var_276_8
				end
			end

			if arg_273_1.time_ >= var_276_5 + var_276_6 and arg_273_1.time_ < var_276_5 + var_276_6 + arg_276_0 and arg_273_1.var_.characterEffect1095ui_story then
				local var_276_9 = 0.5

				arg_273_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1095ui_story.fillRatio = var_276_9
			end

			local var_276_10 = 0
			local var_276_11 = 0.075

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_12 = arg_273_1:FormatText(StoryNameCfg[668].name)

				arg_273_1.leftNameTxt_.text = var_276_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_13 = arg_273_1:GetWordFromCfg(319321066)
				local var_276_14 = arg_273_1:FormatText(var_276_13.content)

				arg_273_1.text_.text = var_276_14

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_15 = 3
				local var_276_16 = utf8.len(var_276_14)
				local var_276_17 = var_276_15 <= 0 and var_276_11 or var_276_11 * (var_276_16 / var_276_15)

				if var_276_17 > 0 and var_276_11 < var_276_17 then
					arg_273_1.talkMaxDuration = var_276_17

					if var_276_17 + var_276_10 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_17 + var_276_10
					end
				end

				arg_273_1.text_.text = var_276_14
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321066", "story_v_out_319321.awb") ~= 0 then
					local var_276_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321066", "story_v_out_319321.awb") / 1000

					if var_276_18 + var_276_10 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_18 + var_276_10
					end

					if var_276_13.prefab_name ~= "" and arg_273_1.actors_[var_276_13.prefab_name] ~= nil then
						local var_276_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_13.prefab_name].transform, "story_v_out_319321", "319321066", "story_v_out_319321.awb")

						arg_273_1:RecordAudio("319321066", var_276_19)
						arg_273_1:RecordAudio("319321066", var_276_19)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_319321", "319321066", "story_v_out_319321.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_319321", "319321066", "story_v_out_319321.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_20 = math.max(var_276_11, arg_273_1.talkMaxDuration)

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_20 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_10) / var_276_20

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_10 + var_276_20 and arg_273_1.time_ < var_276_10 + var_276_20 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play319321067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 319321067
		arg_277_1.duration_ = 3.7

		local var_277_0 = {
			zh = 2,
			ja = 3.7
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
				arg_277_0:Play319321068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["4040ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect4040ui_story == nil then
				arg_277_1.var_.characterEffect4040ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.200000002980232

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect4040ui_story then
					local var_280_4 = Mathf.Lerp(0, 0.5, var_280_3)

					arg_277_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_277_1.var_.characterEffect4040ui_story.fillRatio = var_280_4
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect4040ui_story then
				local var_280_5 = 0.5

				arg_277_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_277_1.var_.characterEffect4040ui_story.fillRatio = var_280_5
			end

			local var_280_6 = arg_277_1.actors_["1095ui_story"]
			local var_280_7 = 0

			if var_280_7 < arg_277_1.time_ and arg_277_1.time_ <= var_280_7 + arg_280_0 and arg_277_1.var_.characterEffect1095ui_story == nil then
				arg_277_1.var_.characterEffect1095ui_story = var_280_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_8 = 0.200000002980232

			if var_280_7 <= arg_277_1.time_ and arg_277_1.time_ < var_280_7 + var_280_8 then
				local var_280_9 = (arg_277_1.time_ - var_280_7) / var_280_8

				if arg_277_1.var_.characterEffect1095ui_story then
					arg_277_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_7 + var_280_8 and arg_277_1.time_ < var_280_7 + var_280_8 + arg_280_0 and arg_277_1.var_.characterEffect1095ui_story then
				arg_277_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 then
				arg_277_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_1")
			end

			local var_280_11 = 0
			local var_280_12 = 0.25

			if var_280_11 < arg_277_1.time_ and arg_277_1.time_ <= var_280_11 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_13 = arg_277_1:FormatText(StoryNameCfg[471].name)

				arg_277_1.leftNameTxt_.text = var_280_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_14 = arg_277_1:GetWordFromCfg(319321067)
				local var_280_15 = arg_277_1:FormatText(var_280_14.content)

				arg_277_1.text_.text = var_280_15

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_16 = 10
				local var_280_17 = utf8.len(var_280_15)
				local var_280_18 = var_280_16 <= 0 and var_280_12 or var_280_12 * (var_280_17 / var_280_16)

				if var_280_18 > 0 and var_280_12 < var_280_18 then
					arg_277_1.talkMaxDuration = var_280_18

					if var_280_18 + var_280_11 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_18 + var_280_11
					end
				end

				arg_277_1.text_.text = var_280_15
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321067", "story_v_out_319321.awb") ~= 0 then
					local var_280_19 = manager.audio:GetVoiceLength("story_v_out_319321", "319321067", "story_v_out_319321.awb") / 1000

					if var_280_19 + var_280_11 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_19 + var_280_11
					end

					if var_280_14.prefab_name ~= "" and arg_277_1.actors_[var_280_14.prefab_name] ~= nil then
						local var_280_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_14.prefab_name].transform, "story_v_out_319321", "319321067", "story_v_out_319321.awb")

						arg_277_1:RecordAudio("319321067", var_280_20)
						arg_277_1:RecordAudio("319321067", var_280_20)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_319321", "319321067", "story_v_out_319321.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_319321", "319321067", "story_v_out_319321.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_21 = math.max(var_280_12, arg_277_1.talkMaxDuration)

			if var_280_11 <= arg_277_1.time_ and arg_277_1.time_ < var_280_11 + var_280_21 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_11) / var_280_21

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_11 + var_280_21 and arg_277_1.time_ < var_280_11 + var_280_21 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play319321068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 319321068
		arg_281_1.duration_ = 3.633

		local var_281_0 = {
			zh = 3,
			ja = 3.633
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
				arg_281_0:Play319321069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["4040ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos4040ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos4040ui_story, var_284_4, var_284_3)

				local var_284_5 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_5.x, var_284_5.y, var_284_5.z)

				local var_284_6 = var_284_0.localEulerAngles

				var_284_6.z = 0
				var_284_6.x = 0
				var_284_0.localEulerAngles = var_284_6
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_284_7 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_7.x, var_284_7.y, var_284_7.z)

				local var_284_8 = var_284_0.localEulerAngles

				var_284_8.z = 0
				var_284_8.x = 0
				var_284_0.localEulerAngles = var_284_8
			end

			local var_284_9 = arg_281_1.actors_["4040ui_story"]
			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 and arg_281_1.var_.characterEffect4040ui_story == nil then
				arg_281_1.var_.characterEffect4040ui_story = var_284_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_11 = 0.200000002980232

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_11 then
				local var_284_12 = (arg_281_1.time_ - var_284_10) / var_284_11

				if arg_281_1.var_.characterEffect4040ui_story then
					arg_281_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_10 + var_284_11 and arg_281_1.time_ < var_284_10 + var_284_11 + arg_284_0 and arg_281_1.var_.characterEffect4040ui_story then
				arg_281_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_284_13 = arg_281_1.actors_["1095ui_story"]
			local var_284_14 = 0

			if var_284_14 < arg_281_1.time_ and arg_281_1.time_ <= var_284_14 + arg_284_0 and arg_281_1.var_.characterEffect1095ui_story == nil then
				arg_281_1.var_.characterEffect1095ui_story = var_284_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_15 = 0.200000002980232

			if var_284_14 <= arg_281_1.time_ and arg_281_1.time_ < var_284_14 + var_284_15 then
				local var_284_16 = (arg_281_1.time_ - var_284_14) / var_284_15

				if arg_281_1.var_.characterEffect1095ui_story then
					local var_284_17 = Mathf.Lerp(0, 0.5, var_284_16)

					arg_281_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1095ui_story.fillRatio = var_284_17
				end
			end

			if arg_281_1.time_ >= var_284_14 + var_284_15 and arg_281_1.time_ < var_284_14 + var_284_15 + arg_284_0 and arg_281_1.var_.characterEffect1095ui_story then
				local var_284_18 = 0.5

				arg_281_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1095ui_story.fillRatio = var_284_18
			end

			local var_284_19 = 0

			if var_284_19 < arg_281_1.time_ and arg_281_1.time_ <= var_284_19 + arg_284_0 then
				arg_281_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_284_20 = 0

			if var_284_20 < arg_281_1.time_ and arg_281_1.time_ <= var_284_20 + arg_284_0 then
				arg_281_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_284_21 = 0
			local var_284_22 = 0.25

			if var_284_21 < arg_281_1.time_ and arg_281_1.time_ <= var_284_21 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_23 = arg_281_1:FormatText(StoryNameCfg[668].name)

				arg_281_1.leftNameTxt_.text = var_284_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_24 = arg_281_1:GetWordFromCfg(319321068)
				local var_284_25 = arg_281_1:FormatText(var_284_24.content)

				arg_281_1.text_.text = var_284_25

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_26 = 10
				local var_284_27 = utf8.len(var_284_25)
				local var_284_28 = var_284_26 <= 0 and var_284_22 or var_284_22 * (var_284_27 / var_284_26)

				if var_284_28 > 0 and var_284_22 < var_284_28 then
					arg_281_1.talkMaxDuration = var_284_28

					if var_284_28 + var_284_21 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_28 + var_284_21
					end
				end

				arg_281_1.text_.text = var_284_25
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321068", "story_v_out_319321.awb") ~= 0 then
					local var_284_29 = manager.audio:GetVoiceLength("story_v_out_319321", "319321068", "story_v_out_319321.awb") / 1000

					if var_284_29 + var_284_21 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_29 + var_284_21
					end

					if var_284_24.prefab_name ~= "" and arg_281_1.actors_[var_284_24.prefab_name] ~= nil then
						local var_284_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_24.prefab_name].transform, "story_v_out_319321", "319321068", "story_v_out_319321.awb")

						arg_281_1:RecordAudio("319321068", var_284_30)
						arg_281_1:RecordAudio("319321068", var_284_30)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_319321", "319321068", "story_v_out_319321.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_319321", "319321068", "story_v_out_319321.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_31 = math.max(var_284_22, arg_281_1.talkMaxDuration)

			if var_284_21 <= arg_281_1.time_ and arg_281_1.time_ < var_284_21 + var_284_31 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_21) / var_284_31

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_21 + var_284_31 and arg_281_1.time_ < var_284_21 + var_284_31 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play319321069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 319321069
		arg_285_1.duration_ = 5.833

		local var_285_0 = {
			zh = 4.366,
			ja = 5.833
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
				arg_285_0:Play319321070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.45

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[668].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(319321069)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 18
				local var_288_6 = utf8.len(var_288_4)
				local var_288_7 = var_288_5 <= 0 and var_288_1 or var_288_1 * (var_288_6 / var_288_5)

				if var_288_7 > 0 and var_288_1 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_4
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321069", "story_v_out_319321.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_319321", "319321069", "story_v_out_319321.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_319321", "319321069", "story_v_out_319321.awb")

						arg_285_1:RecordAudio("319321069", var_288_9)
						arg_285_1:RecordAudio("319321069", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_319321", "319321069", "story_v_out_319321.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_319321", "319321069", "story_v_out_319321.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_10 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_10 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_10

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_10 and arg_285_1.time_ < var_288_0 + var_288_10 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play319321070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 319321070
		arg_289_1.duration_ = 3.533

		local var_289_0 = {
			zh = 3.533,
			ja = 3.2
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
				arg_289_0:Play319321071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.225

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[668].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(319321070)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 9
				local var_292_6 = utf8.len(var_292_4)
				local var_292_7 = var_292_5 <= 0 and var_292_1 or var_292_1 * (var_292_6 / var_292_5)

				if var_292_7 > 0 and var_292_1 < var_292_7 then
					arg_289_1.talkMaxDuration = var_292_7

					if var_292_7 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_7 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_4
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321070", "story_v_out_319321.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_319321", "319321070", "story_v_out_319321.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_319321", "319321070", "story_v_out_319321.awb")

						arg_289_1:RecordAudio("319321070", var_292_9)
						arg_289_1:RecordAudio("319321070", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_319321", "319321070", "story_v_out_319321.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_319321", "319321070", "story_v_out_319321.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_10 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_10 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_10

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_10 and arg_289_1.time_ < var_292_0 + var_292_10 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play319321071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 319321071
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play319321072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["4040ui_story"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.characterEffect4040ui_story == nil then
				arg_293_1.var_.characterEffect4040ui_story = var_296_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_2 = 0.200000002980232

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.characterEffect4040ui_story then
					local var_296_4 = Mathf.Lerp(0, 0.5, var_296_3)

					arg_293_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_293_1.var_.characterEffect4040ui_story.fillRatio = var_296_4
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.characterEffect4040ui_story then
				local var_296_5 = 0.5

				arg_293_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_293_1.var_.characterEffect4040ui_story.fillRatio = var_296_5
			end

			local var_296_6 = 0
			local var_296_7 = 1.125

			if var_296_6 < arg_293_1.time_ and arg_293_1.time_ <= var_296_6 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_8 = arg_293_1:GetWordFromCfg(319321071)
				local var_296_9 = arg_293_1:FormatText(var_296_8.content)

				arg_293_1.text_.text = var_296_9

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_10 = 45
				local var_296_11 = utf8.len(var_296_9)
				local var_296_12 = var_296_10 <= 0 and var_296_7 or var_296_7 * (var_296_11 / var_296_10)

				if var_296_12 > 0 and var_296_7 < var_296_12 then
					arg_293_1.talkMaxDuration = var_296_12

					if var_296_12 + var_296_6 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_12 + var_296_6
					end
				end

				arg_293_1.text_.text = var_296_9
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_13 = math.max(var_296_7, arg_293_1.talkMaxDuration)

			if var_296_6 <= arg_293_1.time_ and arg_293_1.time_ < var_296_6 + var_296_13 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_6) / var_296_13

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_6 + var_296_13 and arg_293_1.time_ < var_296_6 + var_296_13 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play319321072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 319321072
		arg_297_1.duration_ = 3.366

		local var_297_0 = {
			zh = 1.999999999999,
			ja = 3.366
		}
		local var_297_1 = manager.audio:GetLocalizationFlag()

		if var_297_0[var_297_1] ~= nil then
			arg_297_1.duration_ = var_297_0[var_297_1]
		end

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play319321073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1095ui_story"].transform
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 then
				arg_297_1.var_.moveOldPos1095ui_story = var_300_0.localPosition
			end

			local var_300_2 = 0.001

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2
				local var_300_4 = Vector3.New(0.7, -0.98, -6.1)

				var_300_0.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1095ui_story, var_300_4, var_300_3)

				local var_300_5 = manager.ui.mainCamera.transform.position - var_300_0.position

				var_300_0.forward = Vector3.New(var_300_5.x, var_300_5.y, var_300_5.z)

				local var_300_6 = var_300_0.localEulerAngles

				var_300_6.z = 0
				var_300_6.x = 0
				var_300_0.localEulerAngles = var_300_6
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 then
				var_300_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_300_7 = manager.ui.mainCamera.transform.position - var_300_0.position

				var_300_0.forward = Vector3.New(var_300_7.x, var_300_7.y, var_300_7.z)

				local var_300_8 = var_300_0.localEulerAngles

				var_300_8.z = 0
				var_300_8.x = 0
				var_300_0.localEulerAngles = var_300_8
			end

			local var_300_9 = arg_297_1.actors_["1095ui_story"]
			local var_300_10 = 0

			if var_300_10 < arg_297_1.time_ and arg_297_1.time_ <= var_300_10 + arg_300_0 and arg_297_1.var_.characterEffect1095ui_story == nil then
				arg_297_1.var_.characterEffect1095ui_story = var_300_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_11 = 0.200000002980232

			if var_300_10 <= arg_297_1.time_ and arg_297_1.time_ < var_300_10 + var_300_11 then
				local var_300_12 = (arg_297_1.time_ - var_300_10) / var_300_11

				if arg_297_1.var_.characterEffect1095ui_story then
					arg_297_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_10 + var_300_11 and arg_297_1.time_ < var_300_10 + var_300_11 + arg_300_0 and arg_297_1.var_.characterEffect1095ui_story then
				arg_297_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_300_13 = 0

			if var_300_13 < arg_297_1.time_ and arg_297_1.time_ <= var_300_13 + arg_300_0 then
				arg_297_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_2")
			end

			local var_300_14 = 0

			if var_300_14 < arg_297_1.time_ and arg_297_1.time_ <= var_300_14 + arg_300_0 then
				arg_297_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_300_15 = 0
			local var_300_16 = 0.225

			if var_300_15 < arg_297_1.time_ and arg_297_1.time_ <= var_300_15 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_17 = arg_297_1:FormatText(StoryNameCfg[471].name)

				arg_297_1.leftNameTxt_.text = var_300_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_18 = arg_297_1:GetWordFromCfg(319321072)
				local var_300_19 = arg_297_1:FormatText(var_300_18.content)

				arg_297_1.text_.text = var_300_19

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_20 = 9
				local var_300_21 = utf8.len(var_300_19)
				local var_300_22 = var_300_20 <= 0 and var_300_16 or var_300_16 * (var_300_21 / var_300_20)

				if var_300_22 > 0 and var_300_16 < var_300_22 then
					arg_297_1.talkMaxDuration = var_300_22

					if var_300_22 + var_300_15 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_22 + var_300_15
					end
				end

				arg_297_1.text_.text = var_300_19
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321072", "story_v_out_319321.awb") ~= 0 then
					local var_300_23 = manager.audio:GetVoiceLength("story_v_out_319321", "319321072", "story_v_out_319321.awb") / 1000

					if var_300_23 + var_300_15 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_23 + var_300_15
					end

					if var_300_18.prefab_name ~= "" and arg_297_1.actors_[var_300_18.prefab_name] ~= nil then
						local var_300_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_18.prefab_name].transform, "story_v_out_319321", "319321072", "story_v_out_319321.awb")

						arg_297_1:RecordAudio("319321072", var_300_24)
						arg_297_1:RecordAudio("319321072", var_300_24)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_319321", "319321072", "story_v_out_319321.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_319321", "319321072", "story_v_out_319321.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_25 = math.max(var_300_16, arg_297_1.talkMaxDuration)

			if var_300_15 <= arg_297_1.time_ and arg_297_1.time_ < var_300_15 + var_300_25 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_15) / var_300_25

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_15 + var_300_25 and arg_297_1.time_ < var_300_15 + var_300_25 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play319321073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 319321073
		arg_301_1.duration_ = 2.166

		local var_301_0 = {
			zh = 1.3,
			ja = 2.166
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
				arg_301_0:Play319321074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1095ui_story"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and arg_301_1.var_.characterEffect1095ui_story == nil then
				arg_301_1.var_.characterEffect1095ui_story = var_304_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_2 = 0.200000002980232

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.characterEffect1095ui_story then
					local var_304_4 = Mathf.Lerp(0, 0.5, var_304_3)

					arg_301_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_301_1.var_.characterEffect1095ui_story.fillRatio = var_304_4
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and arg_301_1.var_.characterEffect1095ui_story then
				local var_304_5 = 0.5

				arg_301_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_301_1.var_.characterEffect1095ui_story.fillRatio = var_304_5
			end

			local var_304_6 = arg_301_1.actors_["4040ui_story"]
			local var_304_7 = 0

			if var_304_7 < arg_301_1.time_ and arg_301_1.time_ <= var_304_7 + arg_304_0 and arg_301_1.var_.characterEffect4040ui_story == nil then
				arg_301_1.var_.characterEffect4040ui_story = var_304_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_8 = 0.200000002980232

			if var_304_7 <= arg_301_1.time_ and arg_301_1.time_ < var_304_7 + var_304_8 then
				local var_304_9 = (arg_301_1.time_ - var_304_7) / var_304_8

				if arg_301_1.var_.characterEffect4040ui_story then
					arg_301_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_7 + var_304_8 and arg_301_1.time_ < var_304_7 + var_304_8 + arg_304_0 and arg_301_1.var_.characterEffect4040ui_story then
				arg_301_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_304_10 = 0
			local var_304_11 = 0.1

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_12 = arg_301_1:FormatText(StoryNameCfg[668].name)

				arg_301_1.leftNameTxt_.text = var_304_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_13 = arg_301_1:GetWordFromCfg(319321073)
				local var_304_14 = arg_301_1:FormatText(var_304_13.content)

				arg_301_1.text_.text = var_304_14

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_15 = 4
				local var_304_16 = utf8.len(var_304_14)
				local var_304_17 = var_304_15 <= 0 and var_304_11 or var_304_11 * (var_304_16 / var_304_15)

				if var_304_17 > 0 and var_304_11 < var_304_17 then
					arg_301_1.talkMaxDuration = var_304_17

					if var_304_17 + var_304_10 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_17 + var_304_10
					end
				end

				arg_301_1.text_.text = var_304_14
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321073", "story_v_out_319321.awb") ~= 0 then
					local var_304_18 = manager.audio:GetVoiceLength("story_v_out_319321", "319321073", "story_v_out_319321.awb") / 1000

					if var_304_18 + var_304_10 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_18 + var_304_10
					end

					if var_304_13.prefab_name ~= "" and arg_301_1.actors_[var_304_13.prefab_name] ~= nil then
						local var_304_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_13.prefab_name].transform, "story_v_out_319321", "319321073", "story_v_out_319321.awb")

						arg_301_1:RecordAudio("319321073", var_304_19)
						arg_301_1:RecordAudio("319321073", var_304_19)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_319321", "319321073", "story_v_out_319321.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_319321", "319321073", "story_v_out_319321.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_20 = math.max(var_304_11, arg_301_1.talkMaxDuration)

			if var_304_10 <= arg_301_1.time_ and arg_301_1.time_ < var_304_10 + var_304_20 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_10) / var_304_20

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_10 + var_304_20 and arg_301_1.time_ < var_304_10 + var_304_20 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play319321074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 319321074
		arg_305_1.duration_ = 1.999999999999

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
			arg_305_1.auto_ = false
		end

		function arg_305_1.playNext_(arg_307_0)
			arg_305_1.onStoryFinished_()
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["4040ui_story"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos4040ui_story = var_308_0.localPosition
			end

			local var_308_2 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2
				local var_308_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos4040ui_story, var_308_4, var_308_3)

				local var_308_5 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_5.x, var_308_5.y, var_308_5.z)

				local var_308_6 = var_308_0.localEulerAngles

				var_308_6.z = 0
				var_308_6.x = 0
				var_308_0.localEulerAngles = var_308_6
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_308_7 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_7.x, var_308_7.y, var_308_7.z)

				local var_308_8 = var_308_0.localEulerAngles

				var_308_8.z = 0
				var_308_8.x = 0
				var_308_0.localEulerAngles = var_308_8
			end

			local var_308_9 = arg_305_1.actors_["4040ui_story"]
			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 and arg_305_1.var_.characterEffect4040ui_story == nil then
				arg_305_1.var_.characterEffect4040ui_story = var_308_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_11 = 0.200000002980232

			if var_308_10 <= arg_305_1.time_ and arg_305_1.time_ < var_308_10 + var_308_11 then
				local var_308_12 = (arg_305_1.time_ - var_308_10) / var_308_11

				if arg_305_1.var_.characterEffect4040ui_story then
					arg_305_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_10 + var_308_11 and arg_305_1.time_ < var_308_10 + var_308_11 + arg_308_0 and arg_305_1.var_.characterEffect4040ui_story then
				arg_305_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_308_13 = 0

			if var_308_13 < arg_305_1.time_ and arg_305_1.time_ <= var_308_13 + arg_308_0 then
				arg_305_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_2")
			end

			local var_308_14 = 0

			if var_308_14 < arg_305_1.time_ and arg_305_1.time_ <= var_308_14 + arg_308_0 then
				arg_305_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_308_15 = 0
			local var_308_16 = 0.15

			if var_308_15 < arg_305_1.time_ and arg_305_1.time_ <= var_308_15 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_17 = arg_305_1:FormatText(StoryNameCfg[668].name)

				arg_305_1.leftNameTxt_.text = var_308_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_18 = arg_305_1:GetWordFromCfg(319321074)
				local var_308_19 = arg_305_1:FormatText(var_308_18.content)

				arg_305_1.text_.text = var_308_19

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_20 = 6
				local var_308_21 = utf8.len(var_308_19)
				local var_308_22 = var_308_20 <= 0 and var_308_16 or var_308_16 * (var_308_21 / var_308_20)

				if var_308_22 > 0 and var_308_16 < var_308_22 then
					arg_305_1.talkMaxDuration = var_308_22

					if var_308_22 + var_308_15 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_22 + var_308_15
					end
				end

				arg_305_1.text_.text = var_308_19
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319321", "319321074", "story_v_out_319321.awb") ~= 0 then
					local var_308_23 = manager.audio:GetVoiceLength("story_v_out_319321", "319321074", "story_v_out_319321.awb") / 1000

					if var_308_23 + var_308_15 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_23 + var_308_15
					end

					if var_308_18.prefab_name ~= "" and arg_305_1.actors_[var_308_18.prefab_name] ~= nil then
						local var_308_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_18.prefab_name].transform, "story_v_out_319321", "319321074", "story_v_out_319321.awb")

						arg_305_1:RecordAudio("319321074", var_308_24)
						arg_305_1:RecordAudio("319321074", var_308_24)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_319321", "319321074", "story_v_out_319321.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_319321", "319321074", "story_v_out_319321.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_25 = math.max(var_308_16, arg_305_1.talkMaxDuration)

			if var_308_15 <= arg_305_1.time_ and arg_305_1.time_ < var_308_15 + var_308_25 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_15) / var_308_25

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_15 + var_308_25 and arg_305_1.time_ < var_308_15 + var_308_25 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I12f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_319321.awb"
	}
}
