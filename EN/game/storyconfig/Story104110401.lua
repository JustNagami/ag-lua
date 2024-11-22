return {
	Play411041001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 411041001
		arg_1_1.duration_ = 5.466

		local var_1_0 = {
			zh = 4.633,
			ja = 5.466
		}
		local var_1_1 = manager.audio:GetLocalizationFlag()

		if var_1_0[var_1_1] ~= nil then
			arg_1_1.duration_ = var_1_0[var_1_1]
		end

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play411041002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I11r"

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
				local var_4_5 = arg_1_1.bgs_.I11r

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
					if iter_4_0 ~= "I11r" then
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
			local var_4_23 = 0.366666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.6
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.35

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

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[648].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(411041001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 14
				local var_4_37 = utf8.len(var_4_35)
				local var_4_38 = var_4_36 <= 0 and var_4_31 or var_4_31 * (var_4_37 / var_4_36)

				if var_4_38 > 0 and var_4_31 < var_4_38 then
					arg_1_1.talkMaxDuration = var_4_38
					var_4_30 = var_4_30 + 0.3

					if var_4_38 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_38 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_35
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041001", "story_v_out_411041.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_411041", "411041001", "story_v_out_411041.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_411041", "411041001", "story_v_out_411041.awb")

						arg_1_1:RecordAudio("411041001", var_4_40)
						arg_1_1:RecordAudio("411041001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_411041", "411041001", "story_v_out_411041.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_411041", "411041001", "story_v_out_411041.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_41 = var_4_30 + 0.3
			local var_4_42 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_41) / var_4_42

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play411041002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 411041002
		arg_7_1.duration_ = 2.566

		local var_7_0 = {
			zh = 2.566,
			ja = 1.999999999999
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
				arg_7_0:Play411041003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1095ui_story"

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

			local var_10_4 = arg_7_1.actors_["1095ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1095ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -0.98, -6.1)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1095ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["1095ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story == nil then
				arg_7_1.var_.characterEffect1095ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect1095ui_story then
					arg_7_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story then
				arg_7_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.2

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[471].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(411041002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041002", "story_v_out_411041.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_411041", "411041002", "story_v_out_411041.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_411041", "411041002", "story_v_out_411041.awb")

						arg_7_1:RecordAudio("411041002", var_10_28)
						arg_7_1:RecordAudio("411041002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_411041", "411041002", "story_v_out_411041.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_411041", "411041002", "story_v_out_411041.awb")
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
	Play411041003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 411041003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play411041004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1095ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1095ui_story == nil then
				arg_11_1.var_.characterEffect1095ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1095ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1095ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1095ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1095ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 1.225

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_8 = arg_11_1:GetWordFromCfg(411041003)
				local var_14_9 = arg_11_1:FormatText(var_14_8.content)

				arg_11_1.text_.text = var_14_9

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_10 = 49
				local var_14_11 = utf8.len(var_14_9)
				local var_14_12 = var_14_10 <= 0 and var_14_7 or var_14_7 * (var_14_11 / var_14_10)

				if var_14_12 > 0 and var_14_7 < var_14_12 then
					arg_11_1.talkMaxDuration = var_14_12

					if var_14_12 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_12 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_9
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_13 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_13 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_13

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_13 and arg_11_1.time_ < var_14_6 + var_14_13 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play411041004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 411041004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play411041005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				local var_18_2 = "play"
				local var_18_3 = "effect"

				arg_15_1:AudioAction(var_18_2, var_18_3, "se_story", "se_story_communication", "")
			end

			local var_18_4 = 0
			local var_18_5 = 1

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_6 = arg_15_1:GetWordFromCfg(411041004)
				local var_18_7 = arg_15_1:FormatText(var_18_6.content)

				arg_15_1.text_.text = var_18_7

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_8 = 40
				local var_18_9 = utf8.len(var_18_7)
				local var_18_10 = var_18_8 <= 0 and var_18_5 or var_18_5 * (var_18_9 / var_18_8)

				if var_18_10 > 0 and var_18_5 < var_18_10 then
					arg_15_1.talkMaxDuration = var_18_10

					if var_18_10 + var_18_4 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_10 + var_18_4
					end
				end

				arg_15_1.text_.text = var_18_7
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_11 = math.max(var_18_5, arg_15_1.talkMaxDuration)

			if var_18_4 <= arg_15_1.time_ and arg_15_1.time_ < var_18_4 + var_18_11 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_4) / var_18_11

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_4 + var_18_11 and arg_15_1.time_ < var_18_4 + var_18_11 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play411041005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 411041005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play411041006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1095ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1095ui_story == nil then
				arg_19_1.var_.characterEffect1095ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1095ui_story then
					arg_19_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1095ui_story then
				arg_19_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1095ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1095ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0, 100, 0)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1095ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0, 100, 0)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = 0
			local var_22_14 = 1.35

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(411041005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 53
				local var_22_18 = utf8.len(var_22_16)
				local var_22_19 = var_22_17 <= 0 and var_22_14 or var_22_14 * (var_22_18 / var_22_17)

				if var_22_19 > 0 and var_22_14 < var_22_19 then
					arg_19_1.talkMaxDuration = var_22_19

					if var_22_19 + var_22_13 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_13
					end
				end

				arg_19_1.text_.text = var_22_16
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_20 = math.max(var_22_14, arg_19_1.talkMaxDuration)

			if var_22_13 <= arg_19_1.time_ and arg_19_1.time_ < var_22_13 + var_22_20 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_13) / var_22_20

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_13 + var_22_20 and arg_19_1.time_ < var_22_13 + var_22_20 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play411041006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 411041006
		arg_23_1.duration_ = 2.6

		local var_23_0 = {
			zh = 2.6,
			ja = 2.166
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
				arg_23_0:Play411041007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "10071ui_story"

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

			local var_26_4 = arg_23_1.actors_["10071ui_story"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos10071ui_story = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(0, -0.9, -6.26)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10071ui_story, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(0, -0.9, -6.26)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = arg_23_1.actors_["10071ui_story"]
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 and arg_23_1.var_.characterEffect10071ui_story == nil then
				arg_23_1.var_.characterEffect10071ui_story = var_26_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_15 = 0.200000002980232

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15

				if arg_23_1.var_.characterEffect10071ui_story then
					arg_23_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 and arg_23_1.var_.characterEffect10071ui_story then
				arg_23_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_26_17 = 0

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 then
				arg_23_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action2_1")
			end

			local var_26_18 = 0

			if var_26_18 < arg_23_1.time_ and arg_23_1.time_ <= var_26_18 + arg_26_0 then
				arg_23_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_26_19 = 0
			local var_26_20 = 0.125

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_21 = arg_23_1:FormatText(StoryNameCfg[670].name)

				arg_23_1.leftNameTxt_.text = var_26_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_22 = arg_23_1:GetWordFromCfg(411041006)
				local var_26_23 = arg_23_1:FormatText(var_26_22.content)

				arg_23_1.text_.text = var_26_23

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_24 = 5
				local var_26_25 = utf8.len(var_26_23)
				local var_26_26 = var_26_24 <= 0 and var_26_20 or var_26_20 * (var_26_25 / var_26_24)

				if var_26_26 > 0 and var_26_20 < var_26_26 then
					arg_23_1.talkMaxDuration = var_26_26

					if var_26_26 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_26 + var_26_19
					end
				end

				arg_23_1.text_.text = var_26_23
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041006", "story_v_out_411041.awb") ~= 0 then
					local var_26_27 = manager.audio:GetVoiceLength("story_v_out_411041", "411041006", "story_v_out_411041.awb") / 1000

					if var_26_27 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_19
					end

					if var_26_22.prefab_name ~= "" and arg_23_1.actors_[var_26_22.prefab_name] ~= nil then
						local var_26_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_22.prefab_name].transform, "story_v_out_411041", "411041006", "story_v_out_411041.awb")

						arg_23_1:RecordAudio("411041006", var_26_28)
						arg_23_1:RecordAudio("411041006", var_26_28)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_411041", "411041006", "story_v_out_411041.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_411041", "411041006", "story_v_out_411041.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_29 = math.max(var_26_20, arg_23_1.talkMaxDuration)

			if var_26_19 <= arg_23_1.time_ and arg_23_1.time_ < var_26_19 + var_26_29 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_19) / var_26_29

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_19 + var_26_29 and arg_23_1.time_ < var_26_19 + var_26_29 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play411041007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 411041007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play411041008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10071ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect10071ui_story == nil then
				arg_27_1.var_.characterEffect10071ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect10071ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_27_1.var_.characterEffect10071ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect10071ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_27_1.var_.characterEffect10071ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 0.766666666666667

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				local var_30_8 = "play"
				local var_30_9 = "effect"

				arg_27_1:AudioAction(var_30_8, var_30_9, "se_story_6", "se_story_6_monster", "")
			end

			local var_30_10 = 0
			local var_30_11 = 0.15

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_12 = arg_27_1:FormatText(StoryNameCfg[217].name)

				arg_27_1.leftNameTxt_.text = var_30_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2118")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_13 = arg_27_1:GetWordFromCfg(411041007)
				local var_30_14 = arg_27_1:FormatText(var_30_13.content)

				arg_27_1.text_.text = var_30_14

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_15 = 6
				local var_30_16 = utf8.len(var_30_14)
				local var_30_17 = var_30_15 <= 0 and var_30_11 or var_30_11 * (var_30_16 / var_30_15)

				if var_30_17 > 0 and var_30_11 < var_30_17 then
					arg_27_1.talkMaxDuration = var_30_17

					if var_30_17 + var_30_10 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_17 + var_30_10
					end
				end

				arg_27_1.text_.text = var_30_14
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_18 = math.max(var_30_11, arg_27_1.talkMaxDuration)

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_18 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_10) / var_30_18

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_10 + var_30_18 and arg_27_1.time_ < var_30_10 + var_30_18 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play411041008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 411041008
		arg_31_1.duration_ = 1.999999999999

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play411041009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1095ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1095ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, -0.98, -6.1)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1095ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1095ui_story"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story == nil then
				arg_31_1.var_.characterEffect1095ui_story = var_34_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_11 = 0.200000002980232

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.characterEffect1095ui_story then
					arg_31_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story then
				arg_31_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_34_15 = arg_31_1.actors_["10071ui_story"].transform
			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 then
				arg_31_1.var_.moveOldPos10071ui_story = var_34_15.localPosition
			end

			local var_34_17 = 0.001

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17
				local var_34_19 = Vector3.New(0, 100, 0)

				var_34_15.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10071ui_story, var_34_19, var_34_18)

				local var_34_20 = manager.ui.mainCamera.transform.position - var_34_15.position

				var_34_15.forward = Vector3.New(var_34_20.x, var_34_20.y, var_34_20.z)

				local var_34_21 = var_34_15.localEulerAngles

				var_34_21.z = 0
				var_34_21.x = 0
				var_34_15.localEulerAngles = var_34_21
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 then
				var_34_15.localPosition = Vector3.New(0, 100, 0)

				local var_34_22 = manager.ui.mainCamera.transform.position - var_34_15.position

				var_34_15.forward = Vector3.New(var_34_22.x, var_34_22.y, var_34_22.z)

				local var_34_23 = var_34_15.localEulerAngles

				var_34_23.z = 0
				var_34_23.x = 0
				var_34_15.localEulerAngles = var_34_23
			end

			local var_34_24 = 0
			local var_34_25 = 0.125

			if var_34_24 < arg_31_1.time_ and arg_31_1.time_ <= var_34_24 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_26 = arg_31_1:FormatText(StoryNameCfg[471].name)

				arg_31_1.leftNameTxt_.text = var_34_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_27 = arg_31_1:GetWordFromCfg(411041008)
				local var_34_28 = arg_31_1:FormatText(var_34_27.content)

				arg_31_1.text_.text = var_34_28

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_29 = 5
				local var_34_30 = utf8.len(var_34_28)
				local var_34_31 = var_34_29 <= 0 and var_34_25 or var_34_25 * (var_34_30 / var_34_29)

				if var_34_31 > 0 and var_34_25 < var_34_31 then
					arg_31_1.talkMaxDuration = var_34_31

					if var_34_31 + var_34_24 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_31 + var_34_24
					end
				end

				arg_31_1.text_.text = var_34_28
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041008", "story_v_out_411041.awb") ~= 0 then
					local var_34_32 = manager.audio:GetVoiceLength("story_v_out_411041", "411041008", "story_v_out_411041.awb") / 1000

					if var_34_32 + var_34_24 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_32 + var_34_24
					end

					if var_34_27.prefab_name ~= "" and arg_31_1.actors_[var_34_27.prefab_name] ~= nil then
						local var_34_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_27.prefab_name].transform, "story_v_out_411041", "411041008", "story_v_out_411041.awb")

						arg_31_1:RecordAudio("411041008", var_34_33)
						arg_31_1:RecordAudio("411041008", var_34_33)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_411041", "411041008", "story_v_out_411041.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_411041", "411041008", "story_v_out_411041.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_34 = math.max(var_34_25, arg_31_1.talkMaxDuration)

			if var_34_24 <= arg_31_1.time_ and arg_31_1.time_ < var_34_24 + var_34_34 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_24) / var_34_34

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_24 + var_34_34 and arg_31_1.time_ < var_34_24 + var_34_34 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play411041009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 411041009
		arg_35_1.duration_ = 6

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play411041010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1095ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story == nil then
				arg_35_1.var_.characterEffect1095ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1095ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["1095ui_story"].transform
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1.var_.moveOldPos1095ui_story = var_38_6.localPosition
			end

			local var_38_8 = 0.001

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8
				local var_38_10 = Vector3.New(0, 100, 0)

				var_38_6.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1095ui_story, var_38_10, var_38_9)

				local var_38_11 = manager.ui.mainCamera.transform.position - var_38_6.position

				var_38_6.forward = Vector3.New(var_38_11.x, var_38_11.y, var_38_11.z)

				local var_38_12 = var_38_6.localEulerAngles

				var_38_12.z = 0
				var_38_12.x = 0
				var_38_6.localEulerAngles = var_38_12
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 then
				var_38_6.localPosition = Vector3.New(0, 100, 0)

				local var_38_13 = manager.ui.mainCamera.transform.position - var_38_6.position

				var_38_6.forward = Vector3.New(var_38_13.x, var_38_13.y, var_38_13.z)

				local var_38_14 = var_38_6.localEulerAngles

				var_38_14.z = 0
				var_38_14.x = 0
				var_38_6.localEulerAngles = var_38_14
			end

			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = false

				arg_35_1:SetGaussion(false)
			end

			local var_38_16 = 1

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_16 then
				local var_38_17 = (arg_35_1.time_ - var_38_15) / var_38_16
				local var_38_18 = Color.New(1, 1, 1)

				var_38_18.a = Mathf.Lerp(1, 0, var_38_17)
				arg_35_1.mask_.color = var_38_18
			end

			if arg_35_1.time_ >= var_38_15 + var_38_16 and arg_35_1.time_ < var_38_15 + var_38_16 + arg_38_0 then
				local var_38_19 = Color.New(1, 1, 1)
				local var_38_20 = 0

				arg_35_1.mask_.enabled = false
				var_38_19.a = var_38_20
				arg_35_1.mask_.color = var_38_19
			end

			local var_38_21 = 1
			local var_38_22 = 0.9

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				local var_38_23 = "play"
				local var_38_24 = "effect"

				arg_35_1:AudioAction(var_38_23, var_38_24, "se_story_131", "se_story_131_1095_skill1", "")
			end

			if arg_35_1.frameCnt_ <= 1 then
				arg_35_1.dialog_:SetActive(false)
			end

			local var_38_25 = 1
			local var_38_26 = 0.9

			if var_38_25 < arg_35_1.time_ and arg_35_1.time_ <= var_38_25 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				arg_35_1.dialog_:SetActive(true)

				local var_38_27 = LeanTween.value(arg_35_1.dialog_, 0, 1, 0.3)

				var_38_27:setOnUpdate(LuaHelper.FloatAction(function(arg_39_0)
					arg_35_1.dialogCg_.alpha = arg_39_0
				end))
				var_38_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_35_1.dialog_)
					var_38_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_35_1.duration_ = arg_35_1.duration_ + 0.3

				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_28 = arg_35_1:GetWordFromCfg(411041009)
				local var_38_29 = arg_35_1:FormatText(var_38_28.content)

				arg_35_1.text_.text = var_38_29

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_30 = 36
				local var_38_31 = utf8.len(var_38_29)
				local var_38_32 = var_38_30 <= 0 and var_38_26 or var_38_26 * (var_38_31 / var_38_30)

				if var_38_32 > 0 and var_38_26 < var_38_32 then
					arg_35_1.talkMaxDuration = var_38_32
					var_38_25 = var_38_25 + 0.3

					if var_38_32 + var_38_25 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_32 + var_38_25
					end
				end

				arg_35_1.text_.text = var_38_29
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_33 = var_38_25 + 0.3
			local var_38_34 = math.max(var_38_26, arg_35_1.talkMaxDuration)

			if var_38_33 <= arg_35_1.time_ and arg_35_1.time_ < var_38_33 + var_38_34 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_33) / var_38_34

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_33 + var_38_34 and arg_35_1.time_ < var_38_33 + var_38_34 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play411041010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 411041010
		arg_41_1.duration_ = 2.666

		local var_41_0 = {
			zh = 2.066,
			ja = 2.666
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
				arg_41_0:Play411041011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1095ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect1095ui_story == nil then
				arg_41_1.var_.characterEffect1095ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.200000002980232

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect1095ui_story then
					arg_41_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect1095ui_story then
				arg_41_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_44_4 = 0

			if var_44_4 < arg_41_1.time_ and arg_41_1.time_ <= var_44_4 + arg_44_0 then
				arg_41_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_44_5 = 0

			if var_44_5 < arg_41_1.time_ and arg_41_1.time_ <= var_44_5 + arg_44_0 then
				arg_41_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_44_6 = arg_41_1.actors_["1095ui_story"].transform
			local var_44_7 = 0

			if var_44_7 < arg_41_1.time_ and arg_41_1.time_ <= var_44_7 + arg_44_0 then
				arg_41_1.var_.moveOldPos1095ui_story = var_44_6.localPosition
			end

			local var_44_8 = 0.001

			if var_44_7 <= arg_41_1.time_ and arg_41_1.time_ < var_44_7 + var_44_8 then
				local var_44_9 = (arg_41_1.time_ - var_44_7) / var_44_8
				local var_44_10 = Vector3.New(0, -0.98, -6.1)

				var_44_6.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1095ui_story, var_44_10, var_44_9)

				local var_44_11 = manager.ui.mainCamera.transform.position - var_44_6.position

				var_44_6.forward = Vector3.New(var_44_11.x, var_44_11.y, var_44_11.z)

				local var_44_12 = var_44_6.localEulerAngles

				var_44_12.z = 0
				var_44_12.x = 0
				var_44_6.localEulerAngles = var_44_12
			end

			if arg_41_1.time_ >= var_44_7 + var_44_8 and arg_41_1.time_ < var_44_7 + var_44_8 + arg_44_0 then
				var_44_6.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_44_13 = manager.ui.mainCamera.transform.position - var_44_6.position

				var_44_6.forward = Vector3.New(var_44_13.x, var_44_13.y, var_44_13.z)

				local var_44_14 = var_44_6.localEulerAngles

				var_44_14.z = 0
				var_44_14.x = 0
				var_44_6.localEulerAngles = var_44_14
			end

			local var_44_15 = 0
			local var_44_16 = 0.25

			if var_44_15 < arg_41_1.time_ and arg_41_1.time_ <= var_44_15 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_17 = arg_41_1:FormatText(StoryNameCfg[471].name)

				arg_41_1.leftNameTxt_.text = var_44_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_18 = arg_41_1:GetWordFromCfg(411041010)
				local var_44_19 = arg_41_1:FormatText(var_44_18.content)

				arg_41_1.text_.text = var_44_19

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_20 = 10
				local var_44_21 = utf8.len(var_44_19)
				local var_44_22 = var_44_20 <= 0 and var_44_16 or var_44_16 * (var_44_21 / var_44_20)

				if var_44_22 > 0 and var_44_16 < var_44_22 then
					arg_41_1.talkMaxDuration = var_44_22

					if var_44_22 + var_44_15 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_22 + var_44_15
					end
				end

				arg_41_1.text_.text = var_44_19
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041010", "story_v_out_411041.awb") ~= 0 then
					local var_44_23 = manager.audio:GetVoiceLength("story_v_out_411041", "411041010", "story_v_out_411041.awb") / 1000

					if var_44_23 + var_44_15 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_23 + var_44_15
					end

					if var_44_18.prefab_name ~= "" and arg_41_1.actors_[var_44_18.prefab_name] ~= nil then
						local var_44_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_18.prefab_name].transform, "story_v_out_411041", "411041010", "story_v_out_411041.awb")

						arg_41_1:RecordAudio("411041010", var_44_24)
						arg_41_1:RecordAudio("411041010", var_44_24)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_411041", "411041010", "story_v_out_411041.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_411041", "411041010", "story_v_out_411041.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_25 = math.max(var_44_16, arg_41_1.talkMaxDuration)

			if var_44_15 <= arg_41_1.time_ and arg_41_1.time_ < var_44_15 + var_44_25 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_15) / var_44_25

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_15 + var_44_25 and arg_41_1.time_ < var_44_15 + var_44_25 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play411041011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 411041011
		arg_45_1.duration_ = 6.6

		local var_45_0 = {
			zh = 6.6,
			ja = 4.533
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
				arg_45_0:Play411041012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1095ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect1095ui_story == nil then
				arg_45_1.var_.characterEffect1095ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.200000002980232

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1095ui_story then
					local var_48_4 = Mathf.Lerp(0, 0.5, var_48_3)

					arg_45_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1095ui_story.fillRatio = var_48_4
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect1095ui_story then
				local var_48_5 = 0.5

				arg_45_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1095ui_story.fillRatio = var_48_5
			end

			local var_48_6 = arg_45_1.actors_["10071ui_story"].transform
			local var_48_7 = 0

			if var_48_7 < arg_45_1.time_ and arg_45_1.time_ <= var_48_7 + arg_48_0 then
				arg_45_1.var_.moveOldPos10071ui_story = var_48_6.localPosition
			end

			local var_48_8 = 0.001

			if var_48_7 <= arg_45_1.time_ and arg_45_1.time_ < var_48_7 + var_48_8 then
				local var_48_9 = (arg_45_1.time_ - var_48_7) / var_48_8
				local var_48_10 = Vector3.New(0.7, -0.9, -6.26)

				var_48_6.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10071ui_story, var_48_10, var_48_9)

				local var_48_11 = manager.ui.mainCamera.transform.position - var_48_6.position

				var_48_6.forward = Vector3.New(var_48_11.x, var_48_11.y, var_48_11.z)

				local var_48_12 = var_48_6.localEulerAngles

				var_48_12.z = 0
				var_48_12.x = 0
				var_48_6.localEulerAngles = var_48_12
			end

			if arg_45_1.time_ >= var_48_7 + var_48_8 and arg_45_1.time_ < var_48_7 + var_48_8 + arg_48_0 then
				var_48_6.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_48_13 = manager.ui.mainCamera.transform.position - var_48_6.position

				var_48_6.forward = Vector3.New(var_48_13.x, var_48_13.y, var_48_13.z)

				local var_48_14 = var_48_6.localEulerAngles

				var_48_14.z = 0
				var_48_14.x = 0
				var_48_6.localEulerAngles = var_48_14
			end

			local var_48_15 = arg_45_1.actors_["10071ui_story"]
			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 and arg_45_1.var_.characterEffect10071ui_story == nil then
				arg_45_1.var_.characterEffect10071ui_story = var_48_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_17 = 0.200000002980232

			if var_48_16 <= arg_45_1.time_ and arg_45_1.time_ < var_48_16 + var_48_17 then
				local var_48_18 = (arg_45_1.time_ - var_48_16) / var_48_17

				if arg_45_1.var_.characterEffect10071ui_story then
					arg_45_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_16 + var_48_17 and arg_45_1.time_ < var_48_16 + var_48_17 + arg_48_0 and arg_45_1.var_.characterEffect10071ui_story then
				arg_45_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_48_19 = 0

			if var_48_19 < arg_45_1.time_ and arg_45_1.time_ <= var_48_19 + arg_48_0 then
				arg_45_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_48_20 = arg_45_1.actors_["1095ui_story"].transform
			local var_48_21 = 0

			if var_48_21 < arg_45_1.time_ and arg_45_1.time_ <= var_48_21 + arg_48_0 then
				arg_45_1.var_.moveOldPos1095ui_story = var_48_20.localPosition
			end

			local var_48_22 = 0.001

			if var_48_21 <= arg_45_1.time_ and arg_45_1.time_ < var_48_21 + var_48_22 then
				local var_48_23 = (arg_45_1.time_ - var_48_21) / var_48_22
				local var_48_24 = Vector3.New(-0.7, -0.98, -6.1)

				var_48_20.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1095ui_story, var_48_24, var_48_23)

				local var_48_25 = manager.ui.mainCamera.transform.position - var_48_20.position

				var_48_20.forward = Vector3.New(var_48_25.x, var_48_25.y, var_48_25.z)

				local var_48_26 = var_48_20.localEulerAngles

				var_48_26.z = 0
				var_48_26.x = 0
				var_48_20.localEulerAngles = var_48_26
			end

			if arg_45_1.time_ >= var_48_21 + var_48_22 and arg_45_1.time_ < var_48_21 + var_48_22 + arg_48_0 then
				var_48_20.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_48_27 = manager.ui.mainCamera.transform.position - var_48_20.position

				var_48_20.forward = Vector3.New(var_48_27.x, var_48_27.y, var_48_27.z)

				local var_48_28 = var_48_20.localEulerAngles

				var_48_28.z = 0
				var_48_28.x = 0
				var_48_20.localEulerAngles = var_48_28
			end

			local var_48_29 = 0
			local var_48_30 = 0.625

			if var_48_29 < arg_45_1.time_ and arg_45_1.time_ <= var_48_29 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_31 = arg_45_1:FormatText(StoryNameCfg[670].name)

				arg_45_1.leftNameTxt_.text = var_48_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_32 = arg_45_1:GetWordFromCfg(411041011)
				local var_48_33 = arg_45_1:FormatText(var_48_32.content)

				arg_45_1.text_.text = var_48_33

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_34 = 25
				local var_48_35 = utf8.len(var_48_33)
				local var_48_36 = var_48_34 <= 0 and var_48_30 or var_48_30 * (var_48_35 / var_48_34)

				if var_48_36 > 0 and var_48_30 < var_48_36 then
					arg_45_1.talkMaxDuration = var_48_36

					if var_48_36 + var_48_29 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_36 + var_48_29
					end
				end

				arg_45_1.text_.text = var_48_33
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041011", "story_v_out_411041.awb") ~= 0 then
					local var_48_37 = manager.audio:GetVoiceLength("story_v_out_411041", "411041011", "story_v_out_411041.awb") / 1000

					if var_48_37 + var_48_29 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_37 + var_48_29
					end

					if var_48_32.prefab_name ~= "" and arg_45_1.actors_[var_48_32.prefab_name] ~= nil then
						local var_48_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_32.prefab_name].transform, "story_v_out_411041", "411041011", "story_v_out_411041.awb")

						arg_45_1:RecordAudio("411041011", var_48_38)
						arg_45_1:RecordAudio("411041011", var_48_38)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_411041", "411041011", "story_v_out_411041.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_411041", "411041011", "story_v_out_411041.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_39 = math.max(var_48_30, arg_45_1.talkMaxDuration)

			if var_48_29 <= arg_45_1.time_ and arg_45_1.time_ < var_48_29 + var_48_39 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_29) / var_48_39

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_29 + var_48_39 and arg_45_1.time_ < var_48_29 + var_48_39 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play411041012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 411041012
		arg_49_1.duration_ = 4.333

		local var_49_0 = {
			zh = 3.4,
			ja = 4.333
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
				arg_49_0:Play411041013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["10071ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect10071ui_story == nil then
				arg_49_1.var_.characterEffect10071ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.200000002980232

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect10071ui_story then
					local var_52_4 = Mathf.Lerp(0, 0.5, var_52_3)

					arg_49_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_49_1.var_.characterEffect10071ui_story.fillRatio = var_52_4
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect10071ui_story then
				local var_52_5 = 0.5

				arg_49_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_49_1.var_.characterEffect10071ui_story.fillRatio = var_52_5
			end

			local var_52_6 = arg_49_1.actors_["1095ui_story"]
			local var_52_7 = 0

			if var_52_7 < arg_49_1.time_ and arg_49_1.time_ <= var_52_7 + arg_52_0 and arg_49_1.var_.characterEffect1095ui_story == nil then
				arg_49_1.var_.characterEffect1095ui_story = var_52_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_8 = 0.200000002980232

			if var_52_7 <= arg_49_1.time_ and arg_49_1.time_ < var_52_7 + var_52_8 then
				local var_52_9 = (arg_49_1.time_ - var_52_7) / var_52_8

				if arg_49_1.var_.characterEffect1095ui_story then
					arg_49_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_7 + var_52_8 and arg_49_1.time_ < var_52_7 + var_52_8 + arg_52_0 and arg_49_1.var_.characterEffect1095ui_story then
				arg_49_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_52_10 = 0
			local var_52_11 = 0.525

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_12 = arg_49_1:FormatText(StoryNameCfg[471].name)

				arg_49_1.leftNameTxt_.text = var_52_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_13 = arg_49_1:GetWordFromCfg(411041012)
				local var_52_14 = arg_49_1:FormatText(var_52_13.content)

				arg_49_1.text_.text = var_52_14

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_15 = 21
				local var_52_16 = utf8.len(var_52_14)
				local var_52_17 = var_52_15 <= 0 and var_52_11 or var_52_11 * (var_52_16 / var_52_15)

				if var_52_17 > 0 and var_52_11 < var_52_17 then
					arg_49_1.talkMaxDuration = var_52_17

					if var_52_17 + var_52_10 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_17 + var_52_10
					end
				end

				arg_49_1.text_.text = var_52_14
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041012", "story_v_out_411041.awb") ~= 0 then
					local var_52_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041012", "story_v_out_411041.awb") / 1000

					if var_52_18 + var_52_10 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_18 + var_52_10
					end

					if var_52_13.prefab_name ~= "" and arg_49_1.actors_[var_52_13.prefab_name] ~= nil then
						local var_52_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_13.prefab_name].transform, "story_v_out_411041", "411041012", "story_v_out_411041.awb")

						arg_49_1:RecordAudio("411041012", var_52_19)
						arg_49_1:RecordAudio("411041012", var_52_19)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_411041", "411041012", "story_v_out_411041.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_411041", "411041012", "story_v_out_411041.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_20 = math.max(var_52_11, arg_49_1.talkMaxDuration)

			if var_52_10 <= arg_49_1.time_ and arg_49_1.time_ < var_52_10 + var_52_20 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_10) / var_52_20

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_10 + var_52_20 and arg_49_1.time_ < var_52_10 + var_52_20 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play411041013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 411041013
		arg_53_1.duration_ = 2.1

		local var_53_0 = {
			zh = 2.1,
			ja = 1.9
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
				arg_53_0:Play411041014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["10071ui_story"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos10071ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(0.7, -0.9, -6.26)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos10071ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = arg_53_1.actors_["10071ui_story"]
			local var_56_10 = 0

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 and arg_53_1.var_.characterEffect10071ui_story == nil then
				arg_53_1.var_.characterEffect10071ui_story = var_56_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_11 = 0.200000002980232

			if var_56_10 <= arg_53_1.time_ and arg_53_1.time_ < var_56_10 + var_56_11 then
				local var_56_12 = (arg_53_1.time_ - var_56_10) / var_56_11

				if arg_53_1.var_.characterEffect10071ui_story then
					arg_53_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_10 + var_56_11 and arg_53_1.time_ < var_56_10 + var_56_11 + arg_56_0 and arg_53_1.var_.characterEffect10071ui_story then
				arg_53_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_56_13 = arg_53_1.actors_["1095ui_story"]
			local var_56_14 = 0

			if var_56_14 < arg_53_1.time_ and arg_53_1.time_ <= var_56_14 + arg_56_0 and arg_53_1.var_.characterEffect1095ui_story == nil then
				arg_53_1.var_.characterEffect1095ui_story = var_56_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_15 = 0.200000002980232

			if var_56_14 <= arg_53_1.time_ and arg_53_1.time_ < var_56_14 + var_56_15 then
				local var_56_16 = (arg_53_1.time_ - var_56_14) / var_56_15

				if arg_53_1.var_.characterEffect1095ui_story then
					local var_56_17 = Mathf.Lerp(0, 0.5, var_56_16)

					arg_53_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1095ui_story.fillRatio = var_56_17
				end
			end

			if arg_53_1.time_ >= var_56_14 + var_56_15 and arg_53_1.time_ < var_56_14 + var_56_15 + arg_56_0 and arg_53_1.var_.characterEffect1095ui_story then
				local var_56_18 = 0.5

				arg_53_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1095ui_story.fillRatio = var_56_18
			end

			local var_56_19 = 0
			local var_56_20 = 0.15

			if var_56_19 < arg_53_1.time_ and arg_53_1.time_ <= var_56_19 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_21 = arg_53_1:FormatText(StoryNameCfg[670].name)

				arg_53_1.leftNameTxt_.text = var_56_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_22 = arg_53_1:GetWordFromCfg(411041013)
				local var_56_23 = arg_53_1:FormatText(var_56_22.content)

				arg_53_1.text_.text = var_56_23

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_24 = 6
				local var_56_25 = utf8.len(var_56_23)
				local var_56_26 = var_56_24 <= 0 and var_56_20 or var_56_20 * (var_56_25 / var_56_24)

				if var_56_26 > 0 and var_56_20 < var_56_26 then
					arg_53_1.talkMaxDuration = var_56_26

					if var_56_26 + var_56_19 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_26 + var_56_19
					end
				end

				arg_53_1.text_.text = var_56_23
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041013", "story_v_out_411041.awb") ~= 0 then
					local var_56_27 = manager.audio:GetVoiceLength("story_v_out_411041", "411041013", "story_v_out_411041.awb") / 1000

					if var_56_27 + var_56_19 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_27 + var_56_19
					end

					if var_56_22.prefab_name ~= "" and arg_53_1.actors_[var_56_22.prefab_name] ~= nil then
						local var_56_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_22.prefab_name].transform, "story_v_out_411041", "411041013", "story_v_out_411041.awb")

						arg_53_1:RecordAudio("411041013", var_56_28)
						arg_53_1:RecordAudio("411041013", var_56_28)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_411041", "411041013", "story_v_out_411041.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_411041", "411041013", "story_v_out_411041.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_29 = math.max(var_56_20, arg_53_1.talkMaxDuration)

			if var_56_19 <= arg_53_1.time_ and arg_53_1.time_ < var_56_19 + var_56_29 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_19) / var_56_29

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_19 + var_56_29 and arg_53_1.time_ < var_56_19 + var_56_29 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play411041014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 411041014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play411041015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10071ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos10071ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(0, 100, 0)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10071ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0, 100, 0)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = arg_57_1.actors_["10071ui_story"]
			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 and arg_57_1.var_.characterEffect10071ui_story == nil then
				arg_57_1.var_.characterEffect10071ui_story = var_60_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_11 = 0.200000002980232

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_11 then
				local var_60_12 = (arg_57_1.time_ - var_60_10) / var_60_11

				if arg_57_1.var_.characterEffect10071ui_story then
					local var_60_13 = Mathf.Lerp(0, 0.5, var_60_12)

					arg_57_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_57_1.var_.characterEffect10071ui_story.fillRatio = var_60_13
				end
			end

			if arg_57_1.time_ >= var_60_10 + var_60_11 and arg_57_1.time_ < var_60_10 + var_60_11 + arg_60_0 and arg_57_1.var_.characterEffect10071ui_story then
				local var_60_14 = 0.5

				arg_57_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_57_1.var_.characterEffect10071ui_story.fillRatio = var_60_14
			end

			local var_60_15 = arg_57_1.actors_["1095ui_story"].transform
			local var_60_16 = 0

			if var_60_16 < arg_57_1.time_ and arg_57_1.time_ <= var_60_16 + arg_60_0 then
				arg_57_1.var_.moveOldPos1095ui_story = var_60_15.localPosition
			end

			local var_60_17 = 0.001

			if var_60_16 <= arg_57_1.time_ and arg_57_1.time_ < var_60_16 + var_60_17 then
				local var_60_18 = (arg_57_1.time_ - var_60_16) / var_60_17
				local var_60_19 = Vector3.New(0, 100, 0)

				var_60_15.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1095ui_story, var_60_19, var_60_18)

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

			local var_60_24 = arg_57_1.actors_["1095ui_story"]
			local var_60_25 = 0

			if var_60_25 < arg_57_1.time_ and arg_57_1.time_ <= var_60_25 + arg_60_0 and arg_57_1.var_.characterEffect1095ui_story == nil then
				arg_57_1.var_.characterEffect1095ui_story = var_60_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_26 = 0.200000002980232

			if var_60_25 <= arg_57_1.time_ and arg_57_1.time_ < var_60_25 + var_60_26 then
				local var_60_27 = (arg_57_1.time_ - var_60_25) / var_60_26

				if arg_57_1.var_.characterEffect1095ui_story then
					local var_60_28 = Mathf.Lerp(0, 0.5, var_60_27)

					arg_57_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1095ui_story.fillRatio = var_60_28
				end
			end

			if arg_57_1.time_ >= var_60_25 + var_60_26 and arg_57_1.time_ < var_60_25 + var_60_26 + arg_60_0 and arg_57_1.var_.characterEffect1095ui_story then
				local var_60_29 = 0.5

				arg_57_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1095ui_story.fillRatio = var_60_29
			end

			local var_60_30 = 0
			local var_60_31 = 1.05

			if var_60_30 < arg_57_1.time_ and arg_57_1.time_ <= var_60_30 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_32 = arg_57_1:GetWordFromCfg(411041014)
				local var_60_33 = arg_57_1:FormatText(var_60_32.content)

				arg_57_1.text_.text = var_60_33

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_34 = 42
				local var_60_35 = utf8.len(var_60_33)
				local var_60_36 = var_60_34 <= 0 and var_60_31 or var_60_31 * (var_60_35 / var_60_34)

				if var_60_36 > 0 and var_60_31 < var_60_36 then
					arg_57_1.talkMaxDuration = var_60_36

					if var_60_36 + var_60_30 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_36 + var_60_30
					end
				end

				arg_57_1.text_.text = var_60_33
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_37 = math.max(var_60_31, arg_57_1.talkMaxDuration)

			if var_60_30 <= arg_57_1.time_ and arg_57_1.time_ < var_60_30 + var_60_37 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_30) / var_60_37

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_30 + var_60_37 and arg_57_1.time_ < var_60_30 + var_60_37 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play411041015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 411041015
		arg_61_1.duration_ = 7

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play411041016(arg_61_1)
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

			local var_64_27 = 2
			local var_64_28 = 1

			if var_64_27 < arg_61_1.time_ and arg_61_1.time_ <= var_64_27 + arg_64_0 then
				local var_64_29 = "play"
				local var_64_30 = "effect"

				arg_61_1:AudioAction(var_64_29, var_64_30, "se_story_131", "se_story_131_break", "")
			end

			if arg_61_1.frameCnt_ <= 1 then
				arg_61_1.dialog_:SetActive(false)
			end

			local var_64_31 = 2
			local var_64_32 = 1.65

			if var_64_31 < arg_61_1.time_ and arg_61_1.time_ <= var_64_31 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				arg_61_1.dialog_:SetActive(true)

				local var_64_33 = LeanTween.value(arg_61_1.dialog_, 0, 1, 0.3)

				var_64_33:setOnUpdate(LuaHelper.FloatAction(function(arg_65_0)
					arg_61_1.dialogCg_.alpha = arg_65_0
				end))
				var_64_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_61_1.dialog_)
					var_64_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_61_1.duration_ = arg_61_1.duration_ + 0.3

				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_34 = arg_61_1:GetWordFromCfg(411041015)
				local var_64_35 = arg_61_1:FormatText(var_64_34.content)

				arg_61_1.text_.text = var_64_35

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_36 = 66
				local var_64_37 = utf8.len(var_64_35)
				local var_64_38 = var_64_36 <= 0 and var_64_32 or var_64_32 * (var_64_37 / var_64_36)

				if var_64_38 > 0 and var_64_32 < var_64_38 then
					arg_61_1.talkMaxDuration = var_64_38
					var_64_31 = var_64_31 + 0.3

					if var_64_38 + var_64_31 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_38 + var_64_31
					end
				end

				arg_61_1.text_.text = var_64_35
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_39 = var_64_31 + 0.3
			local var_64_40 = math.max(var_64_32, arg_61_1.talkMaxDuration)

			if var_64_39 <= arg_61_1.time_ and arg_61_1.time_ < var_64_39 + var_64_40 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_39) / var_64_40

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_39 + var_64_40 and arg_61_1.time_ < var_64_39 + var_64_40 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play411041016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 411041016
		arg_67_1.duration_ = 7

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play411041017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 2

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				local var_70_1 = manager.ui.mainCamera.transform.localPosition
				local var_70_2 = Vector3.New(0, 0, 10) + Vector3.New(var_70_1.x, var_70_1.y, 0)
				local var_70_3 = arg_67_1.bgs_.I11r

				var_70_3.transform.localPosition = var_70_2
				var_70_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_4 = var_70_3:GetComponent("SpriteRenderer")

				if var_70_4 and var_70_4.sprite then
					local var_70_5 = (var_70_3.transform.localPosition - var_70_1).z
					local var_70_6 = manager.ui.mainCameraCom_
					local var_70_7 = 2 * var_70_5 * Mathf.Tan(var_70_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_8 = var_70_7 * var_70_6.aspect
					local var_70_9 = var_70_4.sprite.bounds.size.x
					local var_70_10 = var_70_4.sprite.bounds.size.y
					local var_70_11 = var_70_8 / var_70_9
					local var_70_12 = var_70_7 / var_70_10
					local var_70_13 = var_70_12 < var_70_11 and var_70_11 or var_70_12

					var_70_3.transform.localScale = Vector3.New(var_70_13, var_70_13, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "I11r" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_15 = 2

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15
				local var_70_17 = Color.New(0, 0, 0)

				var_70_17.a = Mathf.Lerp(0, 1, var_70_16)
				arg_67_1.mask_.color = var_70_17
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 then
				local var_70_18 = Color.New(0, 0, 0)

				var_70_18.a = 1
				arg_67_1.mask_.color = var_70_18
			end

			local var_70_19 = 2

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_20 = 2

			if var_70_19 <= arg_67_1.time_ and arg_67_1.time_ < var_70_19 + var_70_20 then
				local var_70_21 = (arg_67_1.time_ - var_70_19) / var_70_20
				local var_70_22 = Color.New(0, 0, 0)

				var_70_22.a = Mathf.Lerp(1, 0, var_70_21)
				arg_67_1.mask_.color = var_70_22
			end

			if arg_67_1.time_ >= var_70_19 + var_70_20 and arg_67_1.time_ < var_70_19 + var_70_20 + arg_70_0 then
				local var_70_23 = Color.New(0, 0, 0)
				local var_70_24 = 0

				arg_67_1.mask_.enabled = false
				var_70_23.a = var_70_24
				arg_67_1.mask_.color = var_70_23
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_25 = 2
			local var_70_26 = 0.825

			if var_70_25 < arg_67_1.time_ and arg_67_1.time_ <= var_70_25 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_27 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_27:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_28 = arg_67_1:GetWordFromCfg(411041016)
				local var_70_29 = arg_67_1:FormatText(var_70_28.content)

				arg_67_1.text_.text = var_70_29

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_30 = 33
				local var_70_31 = utf8.len(var_70_29)
				local var_70_32 = var_70_30 <= 0 and var_70_26 or var_70_26 * (var_70_31 / var_70_30)

				if var_70_32 > 0 and var_70_26 < var_70_32 then
					arg_67_1.talkMaxDuration = var_70_32
					var_70_25 = var_70_25 + 0.3

					if var_70_32 + var_70_25 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_32 + var_70_25
					end
				end

				arg_67_1.text_.text = var_70_29
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_33 = var_70_25 + 0.3
			local var_70_34 = math.max(var_70_26, arg_67_1.talkMaxDuration)

			if var_70_33 <= arg_67_1.time_ and arg_67_1.time_ < var_70_33 + var_70_34 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_33) / var_70_34

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_33 + var_70_34 and arg_67_1.time_ < var_70_33 + var_70_34 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play411041017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 411041017
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play411041018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 1.025

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_2 = arg_73_1:GetWordFromCfg(411041017)
				local var_76_3 = arg_73_1:FormatText(var_76_2.content)

				arg_73_1.text_.text = var_76_3

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_4 = 41
				local var_76_5 = utf8.len(var_76_3)
				local var_76_6 = var_76_4 <= 0 and var_76_1 or var_76_1 * (var_76_5 / var_76_4)

				if var_76_6 > 0 and var_76_1 < var_76_6 then
					arg_73_1.talkMaxDuration = var_76_6

					if var_76_6 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_6 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_3
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_7 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_7 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_7

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_7 and arg_73_1.time_ < var_76_0 + var_76_7 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play411041018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 411041018
		arg_77_1.duration_ = 1.999999999999

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play411041019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1095ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos1095ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1095ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = arg_77_1.actors_["1095ui_story"]
			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story == nil then
				arg_77_1.var_.characterEffect1095ui_story = var_80_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_11 = 0.200000002980232

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_10) / var_80_11

				if arg_77_1.var_.characterEffect1095ui_story then
					arg_77_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_10 + var_80_11 and arg_77_1.time_ < var_80_10 + var_80_11 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story then
				arg_77_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_80_13 = 0

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_80_15 = arg_77_1.actors_["10071ui_story"].transform
			local var_80_16 = 0

			if var_80_16 < arg_77_1.time_ and arg_77_1.time_ <= var_80_16 + arg_80_0 then
				arg_77_1.var_.moveOldPos10071ui_story = var_80_15.localPosition
			end

			local var_80_17 = 0.001

			if var_80_16 <= arg_77_1.time_ and arg_77_1.time_ < var_80_16 + var_80_17 then
				local var_80_18 = (arg_77_1.time_ - var_80_16) / var_80_17
				local var_80_19 = Vector3.New(0.7, -0.9, -6.26)

				var_80_15.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10071ui_story, var_80_19, var_80_18)

				local var_80_20 = manager.ui.mainCamera.transform.position - var_80_15.position

				var_80_15.forward = Vector3.New(var_80_20.x, var_80_20.y, var_80_20.z)

				local var_80_21 = var_80_15.localEulerAngles

				var_80_21.z = 0
				var_80_21.x = 0
				var_80_15.localEulerAngles = var_80_21
			end

			if arg_77_1.time_ >= var_80_16 + var_80_17 and arg_77_1.time_ < var_80_16 + var_80_17 + arg_80_0 then
				var_80_15.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_80_22 = manager.ui.mainCamera.transform.position - var_80_15.position

				var_80_15.forward = Vector3.New(var_80_22.x, var_80_22.y, var_80_22.z)

				local var_80_23 = var_80_15.localEulerAngles

				var_80_23.z = 0
				var_80_23.x = 0
				var_80_15.localEulerAngles = var_80_23
			end

			local var_80_24 = arg_77_1.actors_["10071ui_story"]
			local var_80_25 = 0

			if var_80_25 < arg_77_1.time_ and arg_77_1.time_ <= var_80_25 + arg_80_0 and arg_77_1.var_.characterEffect10071ui_story == nil then
				arg_77_1.var_.characterEffect10071ui_story = var_80_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_26 = 0.200000002980232

			if var_80_25 <= arg_77_1.time_ and arg_77_1.time_ < var_80_25 + var_80_26 then
				local var_80_27 = (arg_77_1.time_ - var_80_25) / var_80_26

				if arg_77_1.var_.characterEffect10071ui_story then
					local var_80_28 = Mathf.Lerp(0, 0.5, var_80_27)

					arg_77_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_77_1.var_.characterEffect10071ui_story.fillRatio = var_80_28
				end
			end

			if arg_77_1.time_ >= var_80_25 + var_80_26 and arg_77_1.time_ < var_80_25 + var_80_26 + arg_80_0 and arg_77_1.var_.characterEffect10071ui_story then
				local var_80_29 = 0.5

				arg_77_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_77_1.var_.characterEffect10071ui_story.fillRatio = var_80_29
			end

			local var_80_30 = 0

			if var_80_30 < arg_77_1.time_ and arg_77_1.time_ <= var_80_30 + arg_80_0 then
				arg_77_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_80_31 = 0

			if var_80_31 < arg_77_1.time_ and arg_77_1.time_ <= var_80_31 + arg_80_0 then
				arg_77_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action1_1")
			end

			local var_80_32 = 0
			local var_80_33 = 0.125

			if var_80_32 < arg_77_1.time_ and arg_77_1.time_ <= var_80_32 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_34 = arg_77_1:FormatText(StoryNameCfg[471].name)

				arg_77_1.leftNameTxt_.text = var_80_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_35 = arg_77_1:GetWordFromCfg(411041018)
				local var_80_36 = arg_77_1:FormatText(var_80_35.content)

				arg_77_1.text_.text = var_80_36

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_37 = 5
				local var_80_38 = utf8.len(var_80_36)
				local var_80_39 = var_80_37 <= 0 and var_80_33 or var_80_33 * (var_80_38 / var_80_37)

				if var_80_39 > 0 and var_80_33 < var_80_39 then
					arg_77_1.talkMaxDuration = var_80_39

					if var_80_39 + var_80_32 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_39 + var_80_32
					end
				end

				arg_77_1.text_.text = var_80_36
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041018", "story_v_out_411041.awb") ~= 0 then
					local var_80_40 = manager.audio:GetVoiceLength("story_v_out_411041", "411041018", "story_v_out_411041.awb") / 1000

					if var_80_40 + var_80_32 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_40 + var_80_32
					end

					if var_80_35.prefab_name ~= "" and arg_77_1.actors_[var_80_35.prefab_name] ~= nil then
						local var_80_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_35.prefab_name].transform, "story_v_out_411041", "411041018", "story_v_out_411041.awb")

						arg_77_1:RecordAudio("411041018", var_80_41)
						arg_77_1:RecordAudio("411041018", var_80_41)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_411041", "411041018", "story_v_out_411041.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_411041", "411041018", "story_v_out_411041.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_42 = math.max(var_80_33, arg_77_1.talkMaxDuration)

			if var_80_32 <= arg_77_1.time_ and arg_77_1.time_ < var_80_32 + var_80_42 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_32) / var_80_42

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_32 + var_80_42 and arg_77_1.time_ < var_80_32 + var_80_42 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play411041019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 411041019
		arg_81_1.duration_ = 11.733

		local var_81_0 = {
			zh = 11.733,
			ja = 8.4
		}
		local var_81_1 = manager.audio:GetLocalizationFlag()

		if var_81_0[var_81_1] ~= nil then
			arg_81_1.duration_ = var_81_0[var_81_1]
		end

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play411041020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10071ui_story"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos10071ui_story = var_84_0.localPosition
			end

			local var_84_2 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2
				local var_84_4 = Vector3.New(0.7, -0.9, -6.26)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos10071ui_story, var_84_4, var_84_3)

				local var_84_5 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_5.x, var_84_5.y, var_84_5.z)

				local var_84_6 = var_84_0.localEulerAngles

				var_84_6.z = 0
				var_84_6.x = 0
				var_84_0.localEulerAngles = var_84_6
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_84_7 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_7.x, var_84_7.y, var_84_7.z)

				local var_84_8 = var_84_0.localEulerAngles

				var_84_8.z = 0
				var_84_8.x = 0
				var_84_0.localEulerAngles = var_84_8
			end

			local var_84_9 = arg_81_1.actors_["10071ui_story"]
			local var_84_10 = 0

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 and arg_81_1.var_.characterEffect10071ui_story == nil then
				arg_81_1.var_.characterEffect10071ui_story = var_84_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_11 = 0.200000002980232

			if var_84_10 <= arg_81_1.time_ and arg_81_1.time_ < var_84_10 + var_84_11 then
				local var_84_12 = (arg_81_1.time_ - var_84_10) / var_84_11

				if arg_81_1.var_.characterEffect10071ui_story then
					arg_81_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_10 + var_84_11 and arg_81_1.time_ < var_84_10 + var_84_11 + arg_84_0 and arg_81_1.var_.characterEffect10071ui_story then
				arg_81_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_84_13 = 0

			if var_84_13 < arg_81_1.time_ and arg_81_1.time_ <= var_84_13 + arg_84_0 then
				arg_81_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_84_14 = arg_81_1.actors_["1095ui_story"]
			local var_84_15 = 0

			if var_84_15 < arg_81_1.time_ and arg_81_1.time_ <= var_84_15 + arg_84_0 and arg_81_1.var_.characterEffect1095ui_story == nil then
				arg_81_1.var_.characterEffect1095ui_story = var_84_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_16 = 0.200000002980232

			if var_84_15 <= arg_81_1.time_ and arg_81_1.time_ < var_84_15 + var_84_16 then
				local var_84_17 = (arg_81_1.time_ - var_84_15) / var_84_16

				if arg_81_1.var_.characterEffect1095ui_story then
					local var_84_18 = Mathf.Lerp(0, 0.5, var_84_17)

					arg_81_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1095ui_story.fillRatio = var_84_18
				end
			end

			if arg_81_1.time_ >= var_84_15 + var_84_16 and arg_81_1.time_ < var_84_15 + var_84_16 + arg_84_0 and arg_81_1.var_.characterEffect1095ui_story then
				local var_84_19 = 0.5

				arg_81_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1095ui_story.fillRatio = var_84_19
			end

			local var_84_20 = 0
			local var_84_21 = 0.975

			if var_84_20 < arg_81_1.time_ and arg_81_1.time_ <= var_84_20 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_22 = arg_81_1:FormatText(StoryNameCfg[670].name)

				arg_81_1.leftNameTxt_.text = var_84_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_23 = arg_81_1:GetWordFromCfg(411041019)
				local var_84_24 = arg_81_1:FormatText(var_84_23.content)

				arg_81_1.text_.text = var_84_24

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_25 = 41
				local var_84_26 = utf8.len(var_84_24)
				local var_84_27 = var_84_25 <= 0 and var_84_21 or var_84_21 * (var_84_26 / var_84_25)

				if var_84_27 > 0 and var_84_21 < var_84_27 then
					arg_81_1.talkMaxDuration = var_84_27

					if var_84_27 + var_84_20 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_27 + var_84_20
					end
				end

				arg_81_1.text_.text = var_84_24
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041019", "story_v_out_411041.awb") ~= 0 then
					local var_84_28 = manager.audio:GetVoiceLength("story_v_out_411041", "411041019", "story_v_out_411041.awb") / 1000

					if var_84_28 + var_84_20 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_28 + var_84_20
					end

					if var_84_23.prefab_name ~= "" and arg_81_1.actors_[var_84_23.prefab_name] ~= nil then
						local var_84_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_23.prefab_name].transform, "story_v_out_411041", "411041019", "story_v_out_411041.awb")

						arg_81_1:RecordAudio("411041019", var_84_29)
						arg_81_1:RecordAudio("411041019", var_84_29)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_411041", "411041019", "story_v_out_411041.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_411041", "411041019", "story_v_out_411041.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_30 = math.max(var_84_21, arg_81_1.talkMaxDuration)

			if var_84_20 <= arg_81_1.time_ and arg_81_1.time_ < var_84_20 + var_84_30 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_20) / var_84_30

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_20 + var_84_30 and arg_81_1.time_ < var_84_20 + var_84_30 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play411041020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 411041020
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play411041021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10071ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect10071ui_story == nil then
				arg_85_1.var_.characterEffect10071ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.200000002980232

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect10071ui_story then
					local var_88_4 = Mathf.Lerp(0, 0.5, var_88_3)

					arg_85_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_85_1.var_.characterEffect10071ui_story.fillRatio = var_88_4
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect10071ui_story then
				local var_88_5 = 0.5

				arg_85_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_85_1.var_.characterEffect10071ui_story.fillRatio = var_88_5
			end

			local var_88_6 = 0
			local var_88_7 = 1.35

			if var_88_6 < arg_85_1.time_ and arg_85_1.time_ <= var_88_6 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_8 = arg_85_1:GetWordFromCfg(411041020)
				local var_88_9 = arg_85_1:FormatText(var_88_8.content)

				arg_85_1.text_.text = var_88_9

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_10 = 54
				local var_88_11 = utf8.len(var_88_9)
				local var_88_12 = var_88_10 <= 0 and var_88_7 or var_88_7 * (var_88_11 / var_88_10)

				if var_88_12 > 0 and var_88_7 < var_88_12 then
					arg_85_1.talkMaxDuration = var_88_12

					if var_88_12 + var_88_6 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_12 + var_88_6
					end
				end

				arg_85_1.text_.text = var_88_9
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_13 = math.max(var_88_7, arg_85_1.talkMaxDuration)

			if var_88_6 <= arg_85_1.time_ and arg_85_1.time_ < var_88_6 + var_88_13 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_6) / var_88_13

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_6 + var_88_13 and arg_85_1.time_ < var_88_6 + var_88_13 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play411041021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 411041021
		arg_89_1.duration_ = 7.9

		local var_89_0 = {
			zh = 3.866,
			ja = 7.9
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
				arg_89_0:Play411041022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10071ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect10071ui_story == nil then
				arg_89_1.var_.characterEffect10071ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect10071ui_story then
					arg_89_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect10071ui_story then
				arg_89_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_92_4 = 0
			local var_92_5 = 0.325

			if var_92_4 < arg_89_1.time_ and arg_89_1.time_ <= var_92_4 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_6 = arg_89_1:FormatText(StoryNameCfg[670].name)

				arg_89_1.leftNameTxt_.text = var_92_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_7 = arg_89_1:GetWordFromCfg(411041021)
				local var_92_8 = arg_89_1:FormatText(var_92_7.content)

				arg_89_1.text_.text = var_92_8

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_9 = 13
				local var_92_10 = utf8.len(var_92_8)
				local var_92_11 = var_92_9 <= 0 and var_92_5 or var_92_5 * (var_92_10 / var_92_9)

				if var_92_11 > 0 and var_92_5 < var_92_11 then
					arg_89_1.talkMaxDuration = var_92_11

					if var_92_11 + var_92_4 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_11 + var_92_4
					end
				end

				arg_89_1.text_.text = var_92_8
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041021", "story_v_out_411041.awb") ~= 0 then
					local var_92_12 = manager.audio:GetVoiceLength("story_v_out_411041", "411041021", "story_v_out_411041.awb") / 1000

					if var_92_12 + var_92_4 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_12 + var_92_4
					end

					if var_92_7.prefab_name ~= "" and arg_89_1.actors_[var_92_7.prefab_name] ~= nil then
						local var_92_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_7.prefab_name].transform, "story_v_out_411041", "411041021", "story_v_out_411041.awb")

						arg_89_1:RecordAudio("411041021", var_92_13)
						arg_89_1:RecordAudio("411041021", var_92_13)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_411041", "411041021", "story_v_out_411041.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_411041", "411041021", "story_v_out_411041.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_14 = math.max(var_92_5, arg_89_1.talkMaxDuration)

			if var_92_4 <= arg_89_1.time_ and arg_89_1.time_ < var_92_4 + var_92_14 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_4) / var_92_14

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_4 + var_92_14 and arg_89_1.time_ < var_92_4 + var_92_14 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play411041022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 411041022
		arg_93_1.duration_ = 4.833

		local var_93_0 = {
			zh = 3.5,
			ja = 4.833
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
				arg_93_0:Play411041023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1095ui_story"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1095ui_story = var_96_0.localPosition
			end

			local var_96_2 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2
				local var_96_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1095ui_story, var_96_4, var_96_3)

				local var_96_5 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_5.x, var_96_5.y, var_96_5.z)

				local var_96_6 = var_96_0.localEulerAngles

				var_96_6.z = 0
				var_96_6.x = 0
				var_96_0.localEulerAngles = var_96_6
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_96_7 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_7.x, var_96_7.y, var_96_7.z)

				local var_96_8 = var_96_0.localEulerAngles

				var_96_8.z = 0
				var_96_8.x = 0
				var_96_0.localEulerAngles = var_96_8
			end

			local var_96_9 = arg_93_1.actors_["1095ui_story"]
			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 and arg_93_1.var_.characterEffect1095ui_story == nil then
				arg_93_1.var_.characterEffect1095ui_story = var_96_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_11 = 0.200000002980232

			if var_96_10 <= arg_93_1.time_ and arg_93_1.time_ < var_96_10 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_10) / var_96_11

				if arg_93_1.var_.characterEffect1095ui_story then
					arg_93_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_10 + var_96_11 and arg_93_1.time_ < var_96_10 + var_96_11 + arg_96_0 and arg_93_1.var_.characterEffect1095ui_story then
				arg_93_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_96_13 = 0

			if var_96_13 < arg_93_1.time_ and arg_93_1.time_ <= var_96_13 + arg_96_0 then
				arg_93_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				arg_93_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_96_15 = arg_93_1.actors_["10071ui_story"]
			local var_96_16 = 0

			if var_96_16 < arg_93_1.time_ and arg_93_1.time_ <= var_96_16 + arg_96_0 and arg_93_1.var_.characterEffect10071ui_story == nil then
				arg_93_1.var_.characterEffect10071ui_story = var_96_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_17 = 0.200000002980232

			if var_96_16 <= arg_93_1.time_ and arg_93_1.time_ < var_96_16 + var_96_17 then
				local var_96_18 = (arg_93_1.time_ - var_96_16) / var_96_17

				if arg_93_1.var_.characterEffect10071ui_story then
					local var_96_19 = Mathf.Lerp(0, 0.5, var_96_18)

					arg_93_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_93_1.var_.characterEffect10071ui_story.fillRatio = var_96_19
				end
			end

			if arg_93_1.time_ >= var_96_16 + var_96_17 and arg_93_1.time_ < var_96_16 + var_96_17 + arg_96_0 and arg_93_1.var_.characterEffect10071ui_story then
				local var_96_20 = 0.5

				arg_93_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_93_1.var_.characterEffect10071ui_story.fillRatio = var_96_20
			end

			local var_96_21 = 0
			local var_96_22 = 0.35

			if var_96_21 < arg_93_1.time_ and arg_93_1.time_ <= var_96_21 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_23 = arg_93_1:FormatText(StoryNameCfg[471].name)

				arg_93_1.leftNameTxt_.text = var_96_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_24 = arg_93_1:GetWordFromCfg(411041022)
				local var_96_25 = arg_93_1:FormatText(var_96_24.content)

				arg_93_1.text_.text = var_96_25

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_26 = 14
				local var_96_27 = utf8.len(var_96_25)
				local var_96_28 = var_96_26 <= 0 and var_96_22 or var_96_22 * (var_96_27 / var_96_26)

				if var_96_28 > 0 and var_96_22 < var_96_28 then
					arg_93_1.talkMaxDuration = var_96_28

					if var_96_28 + var_96_21 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_28 + var_96_21
					end
				end

				arg_93_1.text_.text = var_96_25
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041022", "story_v_out_411041.awb") ~= 0 then
					local var_96_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041022", "story_v_out_411041.awb") / 1000

					if var_96_29 + var_96_21 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_29 + var_96_21
					end

					if var_96_24.prefab_name ~= "" and arg_93_1.actors_[var_96_24.prefab_name] ~= nil then
						local var_96_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_24.prefab_name].transform, "story_v_out_411041", "411041022", "story_v_out_411041.awb")

						arg_93_1:RecordAudio("411041022", var_96_30)
						arg_93_1:RecordAudio("411041022", var_96_30)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_411041", "411041022", "story_v_out_411041.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_411041", "411041022", "story_v_out_411041.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_31 = math.max(var_96_22, arg_93_1.talkMaxDuration)

			if var_96_21 <= arg_93_1.time_ and arg_93_1.time_ < var_96_21 + var_96_31 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_21) / var_96_31

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_21 + var_96_31 and arg_93_1.time_ < var_96_21 + var_96_31 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play411041023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 411041023
		arg_97_1.duration_ = 5.033

		local var_97_0 = {
			zh = 5,
			ja = 5.033
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
				arg_97_0:Play411041024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10071ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect10071ui_story == nil then
				arg_97_1.var_.characterEffect10071ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect10071ui_story then
					arg_97_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect10071ui_story then
				arg_97_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_100_4 = arg_97_1.actors_["1095ui_story"]
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story == nil then
				arg_97_1.var_.characterEffect1095ui_story = var_100_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_6 = 0.200000002980232

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6

				if arg_97_1.var_.characterEffect1095ui_story then
					local var_100_8 = Mathf.Lerp(0, 0.5, var_100_7)

					arg_97_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1095ui_story.fillRatio = var_100_8
				end
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story then
				local var_100_9 = 0.5

				arg_97_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1095ui_story.fillRatio = var_100_9
			end

			local var_100_10 = 0
			local var_100_11 = 0.6

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_12 = arg_97_1:FormatText(StoryNameCfg[670].name)

				arg_97_1.leftNameTxt_.text = var_100_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_13 = arg_97_1:GetWordFromCfg(411041023)
				local var_100_14 = arg_97_1:FormatText(var_100_13.content)

				arg_97_1.text_.text = var_100_14

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_15 = 24
				local var_100_16 = utf8.len(var_100_14)
				local var_100_17 = var_100_15 <= 0 and var_100_11 or var_100_11 * (var_100_16 / var_100_15)

				if var_100_17 > 0 and var_100_11 < var_100_17 then
					arg_97_1.talkMaxDuration = var_100_17

					if var_100_17 + var_100_10 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_17 + var_100_10
					end
				end

				arg_97_1.text_.text = var_100_14
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041023", "story_v_out_411041.awb") ~= 0 then
					local var_100_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041023", "story_v_out_411041.awb") / 1000

					if var_100_18 + var_100_10 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_10
					end

					if var_100_13.prefab_name ~= "" and arg_97_1.actors_[var_100_13.prefab_name] ~= nil then
						local var_100_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_13.prefab_name].transform, "story_v_out_411041", "411041023", "story_v_out_411041.awb")

						arg_97_1:RecordAudio("411041023", var_100_19)
						arg_97_1:RecordAudio("411041023", var_100_19)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_411041", "411041023", "story_v_out_411041.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_411041", "411041023", "story_v_out_411041.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_20 = math.max(var_100_11, arg_97_1.talkMaxDuration)

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_20 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_10) / var_100_20

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_10 + var_100_20 and arg_97_1.time_ < var_100_10 + var_100_20 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play411041024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 411041024
		arg_101_1.duration_ = 9.333

		local var_101_0 = {
			zh = 9.333,
			ja = 6.7
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
				arg_101_0:Play411041025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1095ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1095ui_story == nil then
				arg_101_1.var_.characterEffect1095ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.200000002980232

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1095ui_story then
					arg_101_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1095ui_story then
				arg_101_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_104_4 = 0

			if var_104_4 < arg_101_1.time_ and arg_101_1.time_ <= var_104_4 + arg_104_0 then
				arg_101_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_104_5 = 0

			if var_104_5 < arg_101_1.time_ and arg_101_1.time_ <= var_104_5 + arg_104_0 then
				arg_101_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_104_6 = arg_101_1.actors_["10071ui_story"]
			local var_104_7 = 0

			if var_104_7 < arg_101_1.time_ and arg_101_1.time_ <= var_104_7 + arg_104_0 and arg_101_1.var_.characterEffect10071ui_story == nil then
				arg_101_1.var_.characterEffect10071ui_story = var_104_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_8 = 0.200000002980232

			if var_104_7 <= arg_101_1.time_ and arg_101_1.time_ < var_104_7 + var_104_8 then
				local var_104_9 = (arg_101_1.time_ - var_104_7) / var_104_8

				if arg_101_1.var_.characterEffect10071ui_story then
					local var_104_10 = Mathf.Lerp(0, 0.5, var_104_9)

					arg_101_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_101_1.var_.characterEffect10071ui_story.fillRatio = var_104_10
				end
			end

			if arg_101_1.time_ >= var_104_7 + var_104_8 and arg_101_1.time_ < var_104_7 + var_104_8 + arg_104_0 and arg_101_1.var_.characterEffect10071ui_story then
				local var_104_11 = 0.5

				arg_101_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_101_1.var_.characterEffect10071ui_story.fillRatio = var_104_11
			end

			local var_104_12 = 0
			local var_104_13 = 1.05

			if var_104_12 < arg_101_1.time_ and arg_101_1.time_ <= var_104_12 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_14 = arg_101_1:FormatText(StoryNameCfg[471].name)

				arg_101_1.leftNameTxt_.text = var_104_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_15 = arg_101_1:GetWordFromCfg(411041024)
				local var_104_16 = arg_101_1:FormatText(var_104_15.content)

				arg_101_1.text_.text = var_104_16

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_17 = 42
				local var_104_18 = utf8.len(var_104_16)
				local var_104_19 = var_104_17 <= 0 and var_104_13 or var_104_13 * (var_104_18 / var_104_17)

				if var_104_19 > 0 and var_104_13 < var_104_19 then
					arg_101_1.talkMaxDuration = var_104_19

					if var_104_19 + var_104_12 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_19 + var_104_12
					end
				end

				arg_101_1.text_.text = var_104_16
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041024", "story_v_out_411041.awb") ~= 0 then
					local var_104_20 = manager.audio:GetVoiceLength("story_v_out_411041", "411041024", "story_v_out_411041.awb") / 1000

					if var_104_20 + var_104_12 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_20 + var_104_12
					end

					if var_104_15.prefab_name ~= "" and arg_101_1.actors_[var_104_15.prefab_name] ~= nil then
						local var_104_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_15.prefab_name].transform, "story_v_out_411041", "411041024", "story_v_out_411041.awb")

						arg_101_1:RecordAudio("411041024", var_104_21)
						arg_101_1:RecordAudio("411041024", var_104_21)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_411041", "411041024", "story_v_out_411041.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_411041", "411041024", "story_v_out_411041.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_22 = math.max(var_104_13, arg_101_1.talkMaxDuration)

			if var_104_12 <= arg_101_1.time_ and arg_101_1.time_ < var_104_12 + var_104_22 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_12) / var_104_22

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_12 + var_104_22 and arg_101_1.time_ < var_104_12 + var_104_22 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play411041025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 411041025
		arg_105_1.duration_ = 5.866

		local var_105_0 = {
			zh = 5.866,
			ja = 3.2
		}
		local var_105_1 = manager.audio:GetLocalizationFlag()

		if var_105_0[var_105_1] ~= nil then
			arg_105_1.duration_ = var_105_0[var_105_1]
		end

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play411041026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.725

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[471].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(411041025)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041025", "story_v_out_411041.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041025", "story_v_out_411041.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_411041", "411041025", "story_v_out_411041.awb")

						arg_105_1:RecordAudio("411041025", var_108_9)
						arg_105_1:RecordAudio("411041025", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_411041", "411041025", "story_v_out_411041.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_411041", "411041025", "story_v_out_411041.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_10 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_10 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_10

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_10 and arg_105_1.time_ < var_108_0 + var_108_10 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play411041026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 411041026
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play411041027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1095ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1095ui_story == nil then
				arg_109_1.var_.characterEffect1095ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1095ui_story then
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1095ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1095ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1095ui_story.fillRatio = var_112_5
			end

			local var_112_6 = 0
			local var_112_7 = 1.325

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_8 = arg_109_1:GetWordFromCfg(411041026)
				local var_112_9 = arg_109_1:FormatText(var_112_8.content)

				arg_109_1.text_.text = var_112_9

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_10 = 53
				local var_112_11 = utf8.len(var_112_9)
				local var_112_12 = var_112_10 <= 0 and var_112_7 or var_112_7 * (var_112_11 / var_112_10)

				if var_112_12 > 0 and var_112_7 < var_112_12 then
					arg_109_1.talkMaxDuration = var_112_12

					if var_112_12 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_12 + var_112_6
					end
				end

				arg_109_1.text_.text = var_112_9
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_13 = math.max(var_112_7, arg_109_1.talkMaxDuration)

			if var_112_6 <= arg_109_1.time_ and arg_109_1.time_ < var_112_6 + var_112_13 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_6) / var_112_13

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_6 + var_112_13 and arg_109_1.time_ < var_112_6 + var_112_13 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play411041027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 411041027
		arg_113_1.duration_ = 4.1

		local var_113_0 = {
			zh = 2.433,
			ja = 4.1
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
				arg_113_0:Play411041028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1095ui_story"].transform
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.var_.moveOldPos1095ui_story = var_116_0.localPosition
			end

			local var_116_2 = 0.001

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2
				local var_116_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_116_0.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1095ui_story, var_116_4, var_116_3)

				local var_116_5 = manager.ui.mainCamera.transform.position - var_116_0.position

				var_116_0.forward = Vector3.New(var_116_5.x, var_116_5.y, var_116_5.z)

				local var_116_6 = var_116_0.localEulerAngles

				var_116_6.z = 0
				var_116_6.x = 0
				var_116_0.localEulerAngles = var_116_6
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 then
				var_116_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_116_7 = manager.ui.mainCamera.transform.position - var_116_0.position

				var_116_0.forward = Vector3.New(var_116_7.x, var_116_7.y, var_116_7.z)

				local var_116_8 = var_116_0.localEulerAngles

				var_116_8.z = 0
				var_116_8.x = 0
				var_116_0.localEulerAngles = var_116_8
			end

			local var_116_9 = arg_113_1.actors_["1095ui_story"]
			local var_116_10 = 0

			if var_116_10 < arg_113_1.time_ and arg_113_1.time_ <= var_116_10 + arg_116_0 and arg_113_1.var_.characterEffect1095ui_story == nil then
				arg_113_1.var_.characterEffect1095ui_story = var_116_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_11 = 0.200000002980232

			if var_116_10 <= arg_113_1.time_ and arg_113_1.time_ < var_116_10 + var_116_11 then
				local var_116_12 = (arg_113_1.time_ - var_116_10) / var_116_11

				if arg_113_1.var_.characterEffect1095ui_story then
					arg_113_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_10 + var_116_11 and arg_113_1.time_ < var_116_10 + var_116_11 + arg_116_0 and arg_113_1.var_.characterEffect1095ui_story then
				arg_113_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_116_13 = 0

			if var_116_13 < arg_113_1.time_ and arg_113_1.time_ <= var_116_13 + arg_116_0 then
				arg_113_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_1")
			end

			local var_116_14 = 0
			local var_116_15 = 0.275

			if var_116_14 < arg_113_1.time_ and arg_113_1.time_ <= var_116_14 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_16 = arg_113_1:FormatText(StoryNameCfg[471].name)

				arg_113_1.leftNameTxt_.text = var_116_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_17 = arg_113_1:GetWordFromCfg(411041027)
				local var_116_18 = arg_113_1:FormatText(var_116_17.content)

				arg_113_1.text_.text = var_116_18

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_19 = 11
				local var_116_20 = utf8.len(var_116_18)
				local var_116_21 = var_116_19 <= 0 and var_116_15 or var_116_15 * (var_116_20 / var_116_19)

				if var_116_21 > 0 and var_116_15 < var_116_21 then
					arg_113_1.talkMaxDuration = var_116_21

					if var_116_21 + var_116_14 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_21 + var_116_14
					end
				end

				arg_113_1.text_.text = var_116_18
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041027", "story_v_out_411041.awb") ~= 0 then
					local var_116_22 = manager.audio:GetVoiceLength("story_v_out_411041", "411041027", "story_v_out_411041.awb") / 1000

					if var_116_22 + var_116_14 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_22 + var_116_14
					end

					if var_116_17.prefab_name ~= "" and arg_113_1.actors_[var_116_17.prefab_name] ~= nil then
						local var_116_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_17.prefab_name].transform, "story_v_out_411041", "411041027", "story_v_out_411041.awb")

						arg_113_1:RecordAudio("411041027", var_116_23)
						arg_113_1:RecordAudio("411041027", var_116_23)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_411041", "411041027", "story_v_out_411041.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_411041", "411041027", "story_v_out_411041.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_24 = math.max(var_116_15, arg_113_1.talkMaxDuration)

			if var_116_14 <= arg_113_1.time_ and arg_113_1.time_ < var_116_14 + var_116_24 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_14) / var_116_24

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_14 + var_116_24 and arg_113_1.time_ < var_116_14 + var_116_24 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play411041028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 411041028
		arg_117_1.duration_ = 6.733

		local var_117_0 = {
			zh = 4.5,
			ja = 6.733
		}
		local var_117_1 = manager.audio:GetLocalizationFlag()

		if var_117_0[var_117_1] ~= nil then
			arg_117_1.duration_ = var_117_0[var_117_1]
		end

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play411041029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10071ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos10071ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0.7, -0.9, -6.26)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos10071ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["10071ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and arg_117_1.var_.characterEffect10071ui_story == nil then
				arg_117_1.var_.characterEffect10071ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect10071ui_story then
					arg_117_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and arg_117_1.var_.characterEffect10071ui_story then
				arg_117_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_120_13 = arg_117_1.actors_["1095ui_story"]
			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 and arg_117_1.var_.characterEffect1095ui_story == nil then
				arg_117_1.var_.characterEffect1095ui_story = var_120_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_15 = 0.200000002980232

			if var_120_14 <= arg_117_1.time_ and arg_117_1.time_ < var_120_14 + var_120_15 then
				local var_120_16 = (arg_117_1.time_ - var_120_14) / var_120_15

				if arg_117_1.var_.characterEffect1095ui_story then
					local var_120_17 = Mathf.Lerp(0, 0.5, var_120_16)

					arg_117_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1095ui_story.fillRatio = var_120_17
				end
			end

			if arg_117_1.time_ >= var_120_14 + var_120_15 and arg_117_1.time_ < var_120_14 + var_120_15 + arg_120_0 and arg_117_1.var_.characterEffect1095ui_story then
				local var_120_18 = 0.5

				arg_117_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1095ui_story.fillRatio = var_120_18
			end

			local var_120_19 = 0

			if var_120_19 < arg_117_1.time_ and arg_117_1.time_ <= var_120_19 + arg_120_0 then
				arg_117_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_2")
			end

			local var_120_20 = 0
			local var_120_21 = 0.425

			if var_120_20 < arg_117_1.time_ and arg_117_1.time_ <= var_120_20 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_22 = arg_117_1:FormatText(StoryNameCfg[670].name)

				arg_117_1.leftNameTxt_.text = var_120_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_23 = arg_117_1:GetWordFromCfg(411041028)
				local var_120_24 = arg_117_1:FormatText(var_120_23.content)

				arg_117_1.text_.text = var_120_24

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_25 = 17
				local var_120_26 = utf8.len(var_120_24)
				local var_120_27 = var_120_25 <= 0 and var_120_21 or var_120_21 * (var_120_26 / var_120_25)

				if var_120_27 > 0 and var_120_21 < var_120_27 then
					arg_117_1.talkMaxDuration = var_120_27

					if var_120_27 + var_120_20 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_27 + var_120_20
					end
				end

				arg_117_1.text_.text = var_120_24
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041028", "story_v_out_411041.awb") ~= 0 then
					local var_120_28 = manager.audio:GetVoiceLength("story_v_out_411041", "411041028", "story_v_out_411041.awb") / 1000

					if var_120_28 + var_120_20 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_28 + var_120_20
					end

					if var_120_23.prefab_name ~= "" and arg_117_1.actors_[var_120_23.prefab_name] ~= nil then
						local var_120_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_23.prefab_name].transform, "story_v_out_411041", "411041028", "story_v_out_411041.awb")

						arg_117_1:RecordAudio("411041028", var_120_29)
						arg_117_1:RecordAudio("411041028", var_120_29)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_411041", "411041028", "story_v_out_411041.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_411041", "411041028", "story_v_out_411041.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_30 = math.max(var_120_21, arg_117_1.talkMaxDuration)

			if var_120_20 <= arg_117_1.time_ and arg_117_1.time_ < var_120_20 + var_120_30 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_20) / var_120_30

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_20 + var_120_30 and arg_117_1.time_ < var_120_20 + var_120_30 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play411041029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 411041029
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play411041030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10071ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect10071ui_story == nil then
				arg_121_1.var_.characterEffect10071ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.200000002980232

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect10071ui_story then
					local var_124_4 = Mathf.Lerp(0, 0.5, var_124_3)

					arg_121_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_121_1.var_.characterEffect10071ui_story.fillRatio = var_124_4
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect10071ui_story then
				local var_124_5 = 0.5

				arg_121_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_121_1.var_.characterEffect10071ui_story.fillRatio = var_124_5
			end

			local var_124_6 = 0
			local var_124_7 = 1.55

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_8 = arg_121_1:GetWordFromCfg(411041029)
				local var_124_9 = arg_121_1:FormatText(var_124_8.content)

				arg_121_1.text_.text = var_124_9

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_10 = 62
				local var_124_11 = utf8.len(var_124_9)
				local var_124_12 = var_124_10 <= 0 and var_124_7 or var_124_7 * (var_124_11 / var_124_10)

				if var_124_12 > 0 and var_124_7 < var_124_12 then
					arg_121_1.talkMaxDuration = var_124_12

					if var_124_12 + var_124_6 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_12 + var_124_6
					end
				end

				arg_121_1.text_.text = var_124_9
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_13 = math.max(var_124_7, arg_121_1.talkMaxDuration)

			if var_124_6 <= arg_121_1.time_ and arg_121_1.time_ < var_124_6 + var_124_13 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_6) / var_124_13

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_6 + var_124_13 and arg_121_1.time_ < var_124_6 + var_124_13 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play411041030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 411041030
		arg_125_1.duration_ = 6.466

		local var_125_0 = {
			zh = 6.466,
			ja = 6.366
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
				arg_125_0:Play411041031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_128_1 = arg_125_1.actors_["10071ui_story"]
			local var_128_2 = 0

			if var_128_2 < arg_125_1.time_ and arg_125_1.time_ <= var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect10071ui_story == nil then
				arg_125_1.var_.characterEffect10071ui_story = var_128_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_3 = 0.200000002980232

			if var_128_2 <= arg_125_1.time_ and arg_125_1.time_ < var_128_2 + var_128_3 then
				local var_128_4 = (arg_125_1.time_ - var_128_2) / var_128_3

				if arg_125_1.var_.characterEffect10071ui_story then
					arg_125_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_2 + var_128_3 and arg_125_1.time_ < var_128_2 + var_128_3 + arg_128_0 and arg_125_1.var_.characterEffect10071ui_story then
				arg_125_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_128_5 = 0
			local var_128_6 = 0.55

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_7 = arg_125_1:FormatText(StoryNameCfg[670].name)

				arg_125_1.leftNameTxt_.text = var_128_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_8 = arg_125_1:GetWordFromCfg(411041030)
				local var_128_9 = arg_125_1:FormatText(var_128_8.content)

				arg_125_1.text_.text = var_128_9

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_10 = 22
				local var_128_11 = utf8.len(var_128_9)
				local var_128_12 = var_128_10 <= 0 and var_128_6 or var_128_6 * (var_128_11 / var_128_10)

				if var_128_12 > 0 and var_128_6 < var_128_12 then
					arg_125_1.talkMaxDuration = var_128_12

					if var_128_12 + var_128_5 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_12 + var_128_5
					end
				end

				arg_125_1.text_.text = var_128_9
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041030", "story_v_out_411041.awb") ~= 0 then
					local var_128_13 = manager.audio:GetVoiceLength("story_v_out_411041", "411041030", "story_v_out_411041.awb") / 1000

					if var_128_13 + var_128_5 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_13 + var_128_5
					end

					if var_128_8.prefab_name ~= "" and arg_125_1.actors_[var_128_8.prefab_name] ~= nil then
						local var_128_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_8.prefab_name].transform, "story_v_out_411041", "411041030", "story_v_out_411041.awb")

						arg_125_1:RecordAudio("411041030", var_128_14)
						arg_125_1:RecordAudio("411041030", var_128_14)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_411041", "411041030", "story_v_out_411041.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_411041", "411041030", "story_v_out_411041.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_15 = math.max(var_128_6, arg_125_1.talkMaxDuration)

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_15 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_5) / var_128_15

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_5 + var_128_15 and arg_125_1.time_ < var_128_5 + var_128_15 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play411041031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 411041031
		arg_129_1.duration_ = 9.5

		local var_129_0 = {
			zh = 7,
			ja = 9.5
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
				arg_129_0:Play411041032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = "I07"

			if arg_129_1.bgs_[var_132_0] == nil then
				local var_132_1 = Object.Instantiate(arg_129_1.paintGo_)

				var_132_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_132_0)
				var_132_1.name = var_132_0
				var_132_1.transform.parent = arg_129_1.stage_.transform
				var_132_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_129_1.bgs_[var_132_0] = var_132_1
			end

			local var_132_2 = 2

			if var_132_2 < arg_129_1.time_ and arg_129_1.time_ <= var_132_2 + arg_132_0 then
				local var_132_3 = manager.ui.mainCamera.transform.localPosition
				local var_132_4 = Vector3.New(0, 0, 10) + Vector3.New(var_132_3.x, var_132_3.y, 0)
				local var_132_5 = arg_129_1.bgs_.I07

				var_132_5.transform.localPosition = var_132_4
				var_132_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_132_6 = var_132_5:GetComponent("SpriteRenderer")

				if var_132_6 and var_132_6.sprite then
					local var_132_7 = (var_132_5.transform.localPosition - var_132_3).z
					local var_132_8 = manager.ui.mainCameraCom_
					local var_132_9 = 2 * var_132_7 * Mathf.Tan(var_132_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_132_10 = var_132_9 * var_132_8.aspect
					local var_132_11 = var_132_6.sprite.bounds.size.x
					local var_132_12 = var_132_6.sprite.bounds.size.y
					local var_132_13 = var_132_10 / var_132_11
					local var_132_14 = var_132_9 / var_132_12
					local var_132_15 = var_132_14 < var_132_13 and var_132_13 or var_132_14

					var_132_5.transform.localScale = Vector3.New(var_132_15, var_132_15, 0)
				end

				for iter_132_0, iter_132_1 in pairs(arg_129_1.bgs_) do
					if iter_132_0 ~= "I07" then
						iter_132_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_132_16 = 0

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 then
				arg_129_1.mask_.enabled = true
				arg_129_1.mask_.raycastTarget = true

				arg_129_1:SetGaussion(false)
			end

			local var_132_17 = 2

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_17 then
				local var_132_18 = (arg_129_1.time_ - var_132_16) / var_132_17
				local var_132_19 = Color.New(0, 0, 0)

				var_132_19.a = Mathf.Lerp(0, 1, var_132_18)
				arg_129_1.mask_.color = var_132_19
			end

			if arg_129_1.time_ >= var_132_16 + var_132_17 and arg_129_1.time_ < var_132_16 + var_132_17 + arg_132_0 then
				local var_132_20 = Color.New(0, 0, 0)

				var_132_20.a = 1
				arg_129_1.mask_.color = var_132_20
			end

			local var_132_21 = 2

			if var_132_21 < arg_129_1.time_ and arg_129_1.time_ <= var_132_21 + arg_132_0 then
				arg_129_1.mask_.enabled = true
				arg_129_1.mask_.raycastTarget = true

				arg_129_1:SetGaussion(false)
			end

			local var_132_22 = 2

			if var_132_21 <= arg_129_1.time_ and arg_129_1.time_ < var_132_21 + var_132_22 then
				local var_132_23 = (arg_129_1.time_ - var_132_21) / var_132_22
				local var_132_24 = Color.New(0, 0, 0)

				var_132_24.a = Mathf.Lerp(1, 0, var_132_23)
				arg_129_1.mask_.color = var_132_24
			end

			if arg_129_1.time_ >= var_132_21 + var_132_22 and arg_129_1.time_ < var_132_21 + var_132_22 + arg_132_0 then
				local var_132_25 = Color.New(0, 0, 0)
				local var_132_26 = 0

				arg_129_1.mask_.enabled = false
				var_132_25.a = var_132_26
				arg_129_1.mask_.color = var_132_25
			end

			local var_132_27 = arg_129_1.actors_["10071ui_story"].transform
			local var_132_28 = 2

			if var_132_28 < arg_129_1.time_ and arg_129_1.time_ <= var_132_28 + arg_132_0 then
				arg_129_1.var_.moveOldPos10071ui_story = var_132_27.localPosition
			end

			local var_132_29 = 0.001

			if var_132_28 <= arg_129_1.time_ and arg_129_1.time_ < var_132_28 + var_132_29 then
				local var_132_30 = (arg_129_1.time_ - var_132_28) / var_132_29
				local var_132_31 = Vector3.New(0.7, -0.9, -6.26)

				var_132_27.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10071ui_story, var_132_31, var_132_30)

				local var_132_32 = manager.ui.mainCamera.transform.position - var_132_27.position

				var_132_27.forward = Vector3.New(var_132_32.x, var_132_32.y, var_132_32.z)

				local var_132_33 = var_132_27.localEulerAngles

				var_132_33.z = 0
				var_132_33.x = 0
				var_132_27.localEulerAngles = var_132_33
			end

			if arg_129_1.time_ >= var_132_28 + var_132_29 and arg_129_1.time_ < var_132_28 + var_132_29 + arg_132_0 then
				var_132_27.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_132_34 = manager.ui.mainCamera.transform.position - var_132_27.position

				var_132_27.forward = Vector3.New(var_132_34.x, var_132_34.y, var_132_34.z)

				local var_132_35 = var_132_27.localEulerAngles

				var_132_35.z = 0
				var_132_35.x = 0
				var_132_27.localEulerAngles = var_132_35
			end

			local var_132_36 = arg_129_1.actors_["10071ui_story"]
			local var_132_37 = 2

			if var_132_37 < arg_129_1.time_ and arg_129_1.time_ <= var_132_37 + arg_132_0 and arg_129_1.var_.characterEffect10071ui_story == nil then
				arg_129_1.var_.characterEffect10071ui_story = var_132_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_38 = 0.200000002980232

			if var_132_37 <= arg_129_1.time_ and arg_129_1.time_ < var_132_37 + var_132_38 then
				local var_132_39 = (arg_129_1.time_ - var_132_37) / var_132_38

				if arg_129_1.var_.characterEffect10071ui_story then
					arg_129_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_37 + var_132_38 and arg_129_1.time_ < var_132_37 + var_132_38 + arg_132_0 and arg_129_1.var_.characterEffect10071ui_story then
				arg_129_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_132_40 = 2

			if var_132_40 < arg_129_1.time_ and arg_129_1.time_ <= var_132_40 + arg_132_0 then
				arg_129_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action1_1")
			end

			local var_132_41 = 2

			if var_132_41 < arg_129_1.time_ and arg_129_1.time_ <= var_132_41 + arg_132_0 then
				arg_129_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_132_42 = arg_129_1.actors_["1095ui_story"].transform
			local var_132_43 = 2

			if var_132_43 < arg_129_1.time_ and arg_129_1.time_ <= var_132_43 + arg_132_0 then
				arg_129_1.var_.moveOldPos1095ui_story = var_132_42.localPosition
			end

			local var_132_44 = 0.001

			if var_132_43 <= arg_129_1.time_ and arg_129_1.time_ < var_132_43 + var_132_44 then
				local var_132_45 = (arg_129_1.time_ - var_132_43) / var_132_44
				local var_132_46 = Vector3.New(-0.7, -0.98, -6.1)

				var_132_42.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1095ui_story, var_132_46, var_132_45)

				local var_132_47 = manager.ui.mainCamera.transform.position - var_132_42.position

				var_132_42.forward = Vector3.New(var_132_47.x, var_132_47.y, var_132_47.z)

				local var_132_48 = var_132_42.localEulerAngles

				var_132_48.z = 0
				var_132_48.x = 0
				var_132_42.localEulerAngles = var_132_48
			end

			if arg_129_1.time_ >= var_132_43 + var_132_44 and arg_129_1.time_ < var_132_43 + var_132_44 + arg_132_0 then
				var_132_42.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_132_49 = manager.ui.mainCamera.transform.position - var_132_42.position

				var_132_42.forward = Vector3.New(var_132_49.x, var_132_49.y, var_132_49.z)

				local var_132_50 = var_132_42.localEulerAngles

				var_132_50.z = 0
				var_132_50.x = 0
				var_132_42.localEulerAngles = var_132_50
			end

			local var_132_51 = arg_129_1.actors_["1095ui_story"]
			local var_132_52 = 2

			if var_132_52 < arg_129_1.time_ and arg_129_1.time_ <= var_132_52 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story == nil then
				arg_129_1.var_.characterEffect1095ui_story = var_132_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_53 = 0.200000002980232

			if var_132_52 <= arg_129_1.time_ and arg_129_1.time_ < var_132_52 + var_132_53 then
				local var_132_54 = (arg_129_1.time_ - var_132_52) / var_132_53

				if arg_129_1.var_.characterEffect1095ui_story then
					local var_132_55 = Mathf.Lerp(0, 0.5, var_132_54)

					arg_129_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1095ui_story.fillRatio = var_132_55
				end
			end

			if arg_129_1.time_ >= var_132_52 + var_132_53 and arg_129_1.time_ < var_132_52 + var_132_53 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story then
				local var_132_56 = 0.5

				arg_129_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1095ui_story.fillRatio = var_132_56
			end

			local var_132_57 = 0
			local var_132_58 = 0.366666666666667

			if var_132_57 < arg_129_1.time_ and arg_129_1.time_ <= var_132_57 + arg_132_0 then
				local var_132_59 = "play"
				local var_132_60 = "music"

				arg_129_1:AudioAction(var_132_59, var_132_60, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_132_61 = 0.5
			local var_132_62 = 1

			if var_132_61 < arg_129_1.time_ and arg_129_1.time_ <= var_132_61 + arg_132_0 then
				local var_132_63 = "play"
				local var_132_64 = "music"

				arg_129_1:AudioAction(var_132_63, var_132_64, "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock.awb")
			end

			if arg_129_1.frameCnt_ <= 1 then
				arg_129_1.dialog_:SetActive(false)
			end

			local var_132_65 = 2
			local var_132_66 = 0.425

			if var_132_65 < arg_129_1.time_ and arg_129_1.time_ <= var_132_65 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0

				arg_129_1.dialog_:SetActive(true)

				local var_132_67 = LeanTween.value(arg_129_1.dialog_, 0, 1, 0.3)

				var_132_67:setOnUpdate(LuaHelper.FloatAction(function(arg_133_0)
					arg_129_1.dialogCg_.alpha = arg_133_0
				end))
				var_132_67:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_129_1.dialog_)
					var_132_67:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_129_1.duration_ = arg_129_1.duration_ + 0.3

				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_68 = arg_129_1:FormatText(StoryNameCfg[670].name)

				arg_129_1.leftNameTxt_.text = var_132_68

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_69 = arg_129_1:GetWordFromCfg(411041031)
				local var_132_70 = arg_129_1:FormatText(var_132_69.content)

				arg_129_1.text_.text = var_132_70

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_71 = 17
				local var_132_72 = utf8.len(var_132_70)
				local var_132_73 = var_132_71 <= 0 and var_132_66 or var_132_66 * (var_132_72 / var_132_71)

				if var_132_73 > 0 and var_132_66 < var_132_73 then
					arg_129_1.talkMaxDuration = var_132_73
					var_132_65 = var_132_65 + 0.3

					if var_132_73 + var_132_65 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_73 + var_132_65
					end
				end

				arg_129_1.text_.text = var_132_70
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041031", "story_v_out_411041.awb") ~= 0 then
					local var_132_74 = manager.audio:GetVoiceLength("story_v_out_411041", "411041031", "story_v_out_411041.awb") / 1000

					if var_132_74 + var_132_65 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_74 + var_132_65
					end

					if var_132_69.prefab_name ~= "" and arg_129_1.actors_[var_132_69.prefab_name] ~= nil then
						local var_132_75 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_69.prefab_name].transform, "story_v_out_411041", "411041031", "story_v_out_411041.awb")

						arg_129_1:RecordAudio("411041031", var_132_75)
						arg_129_1:RecordAudio("411041031", var_132_75)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_411041", "411041031", "story_v_out_411041.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_411041", "411041031", "story_v_out_411041.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_76 = var_132_65 + 0.3
			local var_132_77 = math.max(var_132_66, arg_129_1.talkMaxDuration)

			if var_132_76 <= arg_129_1.time_ and arg_129_1.time_ < var_132_76 + var_132_77 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_76) / var_132_77

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_76 + var_132_77 and arg_129_1.time_ < var_132_76 + var_132_77 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play411041032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 411041032
		arg_135_1.duration_ = 6.066

		local var_135_0 = {
			zh = 6.066,
			ja = 3.5
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
				arg_135_0:Play411041033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1095ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1095ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1095ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = arg_135_1.actors_["1095ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story == nil then
				arg_135_1.var_.characterEffect1095ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect1095ui_story then
					arg_135_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story then
				arg_135_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_138_15 = arg_135_1.actors_["10071ui_story"]
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 and arg_135_1.var_.characterEffect10071ui_story == nil then
				arg_135_1.var_.characterEffect10071ui_story = var_138_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_17 = 0.200000002980232

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17

				if arg_135_1.var_.characterEffect10071ui_story then
					local var_138_19 = Mathf.Lerp(0, 0.5, var_138_18)

					arg_135_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_135_1.var_.characterEffect10071ui_story.fillRatio = var_138_19
				end
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 and arg_135_1.var_.characterEffect10071ui_story then
				local var_138_20 = 0.5

				arg_135_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_135_1.var_.characterEffect10071ui_story.fillRatio = var_138_20
			end

			local var_138_21 = 0
			local var_138_22 = 0.75

			if var_138_21 < arg_135_1.time_ and arg_135_1.time_ <= var_138_21 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_23 = arg_135_1:FormatText(StoryNameCfg[471].name)

				arg_135_1.leftNameTxt_.text = var_138_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_24 = arg_135_1:GetWordFromCfg(411041032)
				local var_138_25 = arg_135_1:FormatText(var_138_24.content)

				arg_135_1.text_.text = var_138_25

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_26 = 30
				local var_138_27 = utf8.len(var_138_25)
				local var_138_28 = var_138_26 <= 0 and var_138_22 or var_138_22 * (var_138_27 / var_138_26)

				if var_138_28 > 0 and var_138_22 < var_138_28 then
					arg_135_1.talkMaxDuration = var_138_28

					if var_138_28 + var_138_21 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_28 + var_138_21
					end
				end

				arg_135_1.text_.text = var_138_25
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041032", "story_v_out_411041.awb") ~= 0 then
					local var_138_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041032", "story_v_out_411041.awb") / 1000

					if var_138_29 + var_138_21 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_29 + var_138_21
					end

					if var_138_24.prefab_name ~= "" and arg_135_1.actors_[var_138_24.prefab_name] ~= nil then
						local var_138_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_24.prefab_name].transform, "story_v_out_411041", "411041032", "story_v_out_411041.awb")

						arg_135_1:RecordAudio("411041032", var_138_30)
						arg_135_1:RecordAudio("411041032", var_138_30)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_411041", "411041032", "story_v_out_411041.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_411041", "411041032", "story_v_out_411041.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_31 = math.max(var_138_22, arg_135_1.talkMaxDuration)

			if var_138_21 <= arg_135_1.time_ and arg_135_1.time_ < var_138_21 + var_138_31 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_21) / var_138_31

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_21 + var_138_31 and arg_135_1.time_ < var_138_21 + var_138_31 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play411041033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 411041033
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play411041034(arg_139_1)
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

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 then
				arg_139_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action3_1")
			end

			local var_142_7 = 0
			local var_142_8 = 0.6

			if var_142_7 < arg_139_1.time_ and arg_139_1.time_ <= var_142_7 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_9 = arg_139_1:GetWordFromCfg(411041033)
				local var_142_10 = arg_139_1:FormatText(var_142_9.content)

				arg_139_1.text_.text = var_142_10

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_11 = 24
				local var_142_12 = utf8.len(var_142_10)
				local var_142_13 = var_142_11 <= 0 and var_142_8 or var_142_8 * (var_142_12 / var_142_11)

				if var_142_13 > 0 and var_142_8 < var_142_13 then
					arg_139_1.talkMaxDuration = var_142_13

					if var_142_13 + var_142_7 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_13 + var_142_7
					end
				end

				arg_139_1.text_.text = var_142_10
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_14 = math.max(var_142_8, arg_139_1.talkMaxDuration)

			if var_142_7 <= arg_139_1.time_ and arg_139_1.time_ < var_142_7 + var_142_14 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_7) / var_142_14

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_7 + var_142_14 and arg_139_1.time_ < var_142_7 + var_142_14 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play411041034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 411041034
		arg_143_1.duration_ = 10.7

		local var_143_0 = {
			zh = 10.7,
			ja = 7
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
				arg_143_0:Play411041035(arg_143_1)
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
			local var_146_5 = 1.225

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

				local var_146_7 = arg_143_1:GetWordFromCfg(411041034)
				local var_146_8 = arg_143_1:FormatText(var_146_7.content)

				arg_143_1.text_.text = var_146_8

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_9 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041034", "story_v_out_411041.awb") ~= 0 then
					local var_146_12 = manager.audio:GetVoiceLength("story_v_out_411041", "411041034", "story_v_out_411041.awb") / 1000

					if var_146_12 + var_146_4 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_12 + var_146_4
					end

					if var_146_7.prefab_name ~= "" and arg_143_1.actors_[var_146_7.prefab_name] ~= nil then
						local var_146_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_7.prefab_name].transform, "story_v_out_411041", "411041034", "story_v_out_411041.awb")

						arg_143_1:RecordAudio("411041034", var_146_13)
						arg_143_1:RecordAudio("411041034", var_146_13)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_411041", "411041034", "story_v_out_411041.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_411041", "411041034", "story_v_out_411041.awb")
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
	Play411041035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 411041035
		arg_147_1.duration_ = 11.166

		local var_147_0 = {
			zh = 4.766,
			ja = 11.166
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
				arg_147_0:Play411041036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.675

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[471].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(411041035)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041035", "story_v_out_411041.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041035", "story_v_out_411041.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_411041", "411041035", "story_v_out_411041.awb")

						arg_147_1:RecordAudio("411041035", var_150_9)
						arg_147_1:RecordAudio("411041035", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_411041", "411041035", "story_v_out_411041.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_411041", "411041035", "story_v_out_411041.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_10 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_10 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_10

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_10 and arg_147_1.time_ < var_150_0 + var_150_10 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play411041036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 411041036
		arg_151_1.duration_ = 9.5

		local var_151_0 = {
			zh = 9.5,
			ja = 9.1
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
				arg_151_0:Play411041037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10071ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos10071ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(0.7, -0.9, -6.26)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos10071ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["10071ui_story"]
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 and arg_151_1.var_.characterEffect10071ui_story == nil then
				arg_151_1.var_.characterEffect10071ui_story = var_154_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_11 = 0.200000002980232

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11

				if arg_151_1.var_.characterEffect10071ui_story then
					arg_151_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 and arg_151_1.var_.characterEffect10071ui_story then
				arg_151_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_154_14 = arg_151_1.actors_["1095ui_story"]
			local var_154_15 = 0

			if var_154_15 < arg_151_1.time_ and arg_151_1.time_ <= var_154_15 + arg_154_0 and arg_151_1.var_.characterEffect1095ui_story == nil then
				arg_151_1.var_.characterEffect1095ui_story = var_154_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_16 = 0.200000002980232

			if var_154_15 <= arg_151_1.time_ and arg_151_1.time_ < var_154_15 + var_154_16 then
				local var_154_17 = (arg_151_1.time_ - var_154_15) / var_154_16

				if arg_151_1.var_.characterEffect1095ui_story then
					local var_154_18 = Mathf.Lerp(0, 0.5, var_154_17)

					arg_151_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1095ui_story.fillRatio = var_154_18
				end
			end

			if arg_151_1.time_ >= var_154_15 + var_154_16 and arg_151_1.time_ < var_154_15 + var_154_16 + arg_154_0 and arg_151_1.var_.characterEffect1095ui_story then
				local var_154_19 = 0.5

				arg_151_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1095ui_story.fillRatio = var_154_19
			end

			local var_154_20 = 0

			if var_154_20 < arg_151_1.time_ and arg_151_1.time_ <= var_154_20 + arg_154_0 then
				arg_151_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action3_2")
			end

			local var_154_21 = 0
			local var_154_22 = 1.075

			if var_154_21 < arg_151_1.time_ and arg_151_1.time_ <= var_154_21 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_23 = arg_151_1:FormatText(StoryNameCfg[670].name)

				arg_151_1.leftNameTxt_.text = var_154_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_24 = arg_151_1:GetWordFromCfg(411041036)
				local var_154_25 = arg_151_1:FormatText(var_154_24.content)

				arg_151_1.text_.text = var_154_25

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_26 = 43
				local var_154_27 = utf8.len(var_154_25)
				local var_154_28 = var_154_26 <= 0 and var_154_22 or var_154_22 * (var_154_27 / var_154_26)

				if var_154_28 > 0 and var_154_22 < var_154_28 then
					arg_151_1.talkMaxDuration = var_154_28

					if var_154_28 + var_154_21 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_28 + var_154_21
					end
				end

				arg_151_1.text_.text = var_154_25
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041036", "story_v_out_411041.awb") ~= 0 then
					local var_154_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041036", "story_v_out_411041.awb") / 1000

					if var_154_29 + var_154_21 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_29 + var_154_21
					end

					if var_154_24.prefab_name ~= "" and arg_151_1.actors_[var_154_24.prefab_name] ~= nil then
						local var_154_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_24.prefab_name].transform, "story_v_out_411041", "411041036", "story_v_out_411041.awb")

						arg_151_1:RecordAudio("411041036", var_154_30)
						arg_151_1:RecordAudio("411041036", var_154_30)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_411041", "411041036", "story_v_out_411041.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_411041", "411041036", "story_v_out_411041.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_31 = math.max(var_154_22, arg_151_1.talkMaxDuration)

			if var_154_21 <= arg_151_1.time_ and arg_151_1.time_ < var_154_21 + var_154_31 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_21) / var_154_31

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_21 + var_154_31 and arg_151_1.time_ < var_154_21 + var_154_31 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play411041037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 411041037
		arg_155_1.duration_ = 6.2

		local var_155_0 = {
			zh = 6.2,
			ja = 4.333
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
				arg_155_0:Play411041038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1095ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1095ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1095ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = arg_155_1.actors_["1095ui_story"]
			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 and arg_155_1.var_.characterEffect1095ui_story == nil then
				arg_155_1.var_.characterEffect1095ui_story = var_158_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_11 = 0.200000002980232

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_11 then
				local var_158_12 = (arg_155_1.time_ - var_158_10) / var_158_11

				if arg_155_1.var_.characterEffect1095ui_story then
					arg_155_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_10 + var_158_11 and arg_155_1.time_ < var_158_10 + var_158_11 + arg_158_0 and arg_155_1.var_.characterEffect1095ui_story then
				arg_155_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_158_13 = 0

			if var_158_13 < arg_155_1.time_ and arg_155_1.time_ <= var_158_13 + arg_158_0 then
				arg_155_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				arg_155_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_158_15 = arg_155_1.actors_["10071ui_story"]
			local var_158_16 = 0

			if var_158_16 < arg_155_1.time_ and arg_155_1.time_ <= var_158_16 + arg_158_0 and arg_155_1.var_.characterEffect10071ui_story == nil then
				arg_155_1.var_.characterEffect10071ui_story = var_158_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_17 = 0.200000002980232

			if var_158_16 <= arg_155_1.time_ and arg_155_1.time_ < var_158_16 + var_158_17 then
				local var_158_18 = (arg_155_1.time_ - var_158_16) / var_158_17

				if arg_155_1.var_.characterEffect10071ui_story then
					local var_158_19 = Mathf.Lerp(0, 0.5, var_158_18)

					arg_155_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_155_1.var_.characterEffect10071ui_story.fillRatio = var_158_19
				end
			end

			if arg_155_1.time_ >= var_158_16 + var_158_17 and arg_155_1.time_ < var_158_16 + var_158_17 + arg_158_0 and arg_155_1.var_.characterEffect10071ui_story then
				local var_158_20 = 0.5

				arg_155_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_155_1.var_.characterEffect10071ui_story.fillRatio = var_158_20
			end

			local var_158_21 = 0
			local var_158_22 = 0.75

			if var_158_21 < arg_155_1.time_ and arg_155_1.time_ <= var_158_21 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_23 = arg_155_1:FormatText(StoryNameCfg[471].name)

				arg_155_1.leftNameTxt_.text = var_158_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_24 = arg_155_1:GetWordFromCfg(411041037)
				local var_158_25 = arg_155_1:FormatText(var_158_24.content)

				arg_155_1.text_.text = var_158_25

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_26 = 30
				local var_158_27 = utf8.len(var_158_25)
				local var_158_28 = var_158_26 <= 0 and var_158_22 or var_158_22 * (var_158_27 / var_158_26)

				if var_158_28 > 0 and var_158_22 < var_158_28 then
					arg_155_1.talkMaxDuration = var_158_28

					if var_158_28 + var_158_21 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_28 + var_158_21
					end
				end

				arg_155_1.text_.text = var_158_25
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041037", "story_v_out_411041.awb") ~= 0 then
					local var_158_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041037", "story_v_out_411041.awb") / 1000

					if var_158_29 + var_158_21 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_29 + var_158_21
					end

					if var_158_24.prefab_name ~= "" and arg_155_1.actors_[var_158_24.prefab_name] ~= nil then
						local var_158_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_24.prefab_name].transform, "story_v_out_411041", "411041037", "story_v_out_411041.awb")

						arg_155_1:RecordAudio("411041037", var_158_30)
						arg_155_1:RecordAudio("411041037", var_158_30)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_411041", "411041037", "story_v_out_411041.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_411041", "411041037", "story_v_out_411041.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_31 = math.max(var_158_22, arg_155_1.talkMaxDuration)

			if var_158_21 <= arg_155_1.time_ and arg_155_1.time_ < var_158_21 + var_158_31 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_21) / var_158_31

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_21 + var_158_31 and arg_155_1.time_ < var_158_21 + var_158_31 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play411041038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 411041038
		arg_159_1.duration_ = 9.966

		local var_159_0 = {
			zh = 9.966,
			ja = 8.4
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
				arg_159_0:Play411041039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1095ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1095ui_story == nil then
				arg_159_1.var_.characterEffect1095ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.200000002980232

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1095ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1095ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1095ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1095ui_story.fillRatio = var_162_5
			end

			local var_162_6 = arg_159_1.actors_["10071ui_story"]
			local var_162_7 = 0

			if var_162_7 < arg_159_1.time_ and arg_159_1.time_ <= var_162_7 + arg_162_0 and arg_159_1.var_.characterEffect10071ui_story == nil then
				arg_159_1.var_.characterEffect10071ui_story = var_162_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_8 = 0.200000002980232

			if var_162_7 <= arg_159_1.time_ and arg_159_1.time_ < var_162_7 + var_162_8 then
				local var_162_9 = (arg_159_1.time_ - var_162_7) / var_162_8

				if arg_159_1.var_.characterEffect10071ui_story then
					arg_159_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_7 + var_162_8 and arg_159_1.time_ < var_162_7 + var_162_8 + arg_162_0 and arg_159_1.var_.characterEffect10071ui_story then
				arg_159_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_162_10 = 0
			local var_162_11 = 1.05

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_12 = arg_159_1:FormatText(StoryNameCfg[670].name)

				arg_159_1.leftNameTxt_.text = var_162_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_13 = arg_159_1:GetWordFromCfg(411041038)
				local var_162_14 = arg_159_1:FormatText(var_162_13.content)

				arg_159_1.text_.text = var_162_14

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_15 = 42
				local var_162_16 = utf8.len(var_162_14)
				local var_162_17 = var_162_15 <= 0 and var_162_11 or var_162_11 * (var_162_16 / var_162_15)

				if var_162_17 > 0 and var_162_11 < var_162_17 then
					arg_159_1.talkMaxDuration = var_162_17

					if var_162_17 + var_162_10 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_17 + var_162_10
					end
				end

				arg_159_1.text_.text = var_162_14
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041038", "story_v_out_411041.awb") ~= 0 then
					local var_162_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041038", "story_v_out_411041.awb") / 1000

					if var_162_18 + var_162_10 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_18 + var_162_10
					end

					if var_162_13.prefab_name ~= "" and arg_159_1.actors_[var_162_13.prefab_name] ~= nil then
						local var_162_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_13.prefab_name].transform, "story_v_out_411041", "411041038", "story_v_out_411041.awb")

						arg_159_1:RecordAudio("411041038", var_162_19)
						arg_159_1:RecordAudio("411041038", var_162_19)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_411041", "411041038", "story_v_out_411041.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_411041", "411041038", "story_v_out_411041.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_20 = math.max(var_162_11, arg_159_1.talkMaxDuration)

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_20 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_10) / var_162_20

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_10 + var_162_20 and arg_159_1.time_ < var_162_10 + var_162_20 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play411041039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 411041039
		arg_163_1.duration_ = 10.233

		local var_163_0 = {
			zh = 9.266,
			ja = 10.233
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
				arg_163_0:Play411041040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.95

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[670].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(411041039)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 38
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041039", "story_v_out_411041.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041039", "story_v_out_411041.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_411041", "411041039", "story_v_out_411041.awb")

						arg_163_1:RecordAudio("411041039", var_166_9)
						arg_163_1:RecordAudio("411041039", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_411041", "411041039", "story_v_out_411041.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_411041", "411041039", "story_v_out_411041.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_10 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_10 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_10

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_10 and arg_163_1.time_ < var_166_0 + var_166_10 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play411041040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 411041040
		arg_167_1.duration_ = 10.2

		local var_167_0 = {
			zh = 10.2,
			ja = 9.366
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
				arg_167_0:Play411041041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1095ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1095ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1095ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = arg_167_1.actors_["1095ui_story"]
			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 and arg_167_1.var_.characterEffect1095ui_story == nil then
				arg_167_1.var_.characterEffect1095ui_story = var_170_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_11 = 0.200000002980232

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_10) / var_170_11

				if arg_167_1.var_.characterEffect1095ui_story then
					arg_167_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_10 + var_170_11 and arg_167_1.time_ < var_170_10 + var_170_11 + arg_170_0 and arg_167_1.var_.characterEffect1095ui_story then
				arg_167_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_170_13 = 0

			if var_170_13 < arg_167_1.time_ and arg_167_1.time_ <= var_170_13 + arg_170_0 then
				arg_167_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 then
				arg_167_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_170_15 = arg_167_1.actors_["10071ui_story"]
			local var_170_16 = 0

			if var_170_16 < arg_167_1.time_ and arg_167_1.time_ <= var_170_16 + arg_170_0 and arg_167_1.var_.characterEffect10071ui_story == nil then
				arg_167_1.var_.characterEffect10071ui_story = var_170_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_17 = 0.200000002980232

			if var_170_16 <= arg_167_1.time_ and arg_167_1.time_ < var_170_16 + var_170_17 then
				local var_170_18 = (arg_167_1.time_ - var_170_16) / var_170_17

				if arg_167_1.var_.characterEffect10071ui_story then
					local var_170_19 = Mathf.Lerp(0, 0.5, var_170_18)

					arg_167_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_167_1.var_.characterEffect10071ui_story.fillRatio = var_170_19
				end
			end

			if arg_167_1.time_ >= var_170_16 + var_170_17 and arg_167_1.time_ < var_170_16 + var_170_17 + arg_170_0 and arg_167_1.var_.characterEffect10071ui_story then
				local var_170_20 = 0.5

				arg_167_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_167_1.var_.characterEffect10071ui_story.fillRatio = var_170_20
			end

			local var_170_21 = 0
			local var_170_22 = 1.075

			if var_170_21 < arg_167_1.time_ and arg_167_1.time_ <= var_170_21 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_23 = arg_167_1:FormatText(StoryNameCfg[471].name)

				arg_167_1.leftNameTxt_.text = var_170_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_24 = arg_167_1:GetWordFromCfg(411041040)
				local var_170_25 = arg_167_1:FormatText(var_170_24.content)

				arg_167_1.text_.text = var_170_25

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_26 = 43
				local var_170_27 = utf8.len(var_170_25)
				local var_170_28 = var_170_26 <= 0 and var_170_22 or var_170_22 * (var_170_27 / var_170_26)

				if var_170_28 > 0 and var_170_22 < var_170_28 then
					arg_167_1.talkMaxDuration = var_170_28

					if var_170_28 + var_170_21 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_28 + var_170_21
					end
				end

				arg_167_1.text_.text = var_170_25
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041040", "story_v_out_411041.awb") ~= 0 then
					local var_170_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041040", "story_v_out_411041.awb") / 1000

					if var_170_29 + var_170_21 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_29 + var_170_21
					end

					if var_170_24.prefab_name ~= "" and arg_167_1.actors_[var_170_24.prefab_name] ~= nil then
						local var_170_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_24.prefab_name].transform, "story_v_out_411041", "411041040", "story_v_out_411041.awb")

						arg_167_1:RecordAudio("411041040", var_170_30)
						arg_167_1:RecordAudio("411041040", var_170_30)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_411041", "411041040", "story_v_out_411041.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_411041", "411041040", "story_v_out_411041.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_31 = math.max(var_170_22, arg_167_1.talkMaxDuration)

			if var_170_21 <= arg_167_1.time_ and arg_167_1.time_ < var_170_21 + var_170_31 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_21) / var_170_31

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_21 + var_170_31 and arg_167_1.time_ < var_170_21 + var_170_31 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play411041041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 411041041
		arg_171_1.duration_ = 4.233

		local var_171_0 = {
			zh = 4.233,
			ja = 3.466
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
				arg_171_0:Play411041042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10071ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos10071ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0.7, -0.9, -6.26)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10071ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["10071ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect10071ui_story == nil then
				arg_171_1.var_.characterEffect10071ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.200000002980232

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect10071ui_story then
					arg_171_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect10071ui_story then
				arg_171_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_174_13 = arg_171_1.actors_["1095ui_story"]
			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story == nil then
				arg_171_1.var_.characterEffect1095ui_story = var_174_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_15 = 0.200000002980232

			if var_174_14 <= arg_171_1.time_ and arg_171_1.time_ < var_174_14 + var_174_15 then
				local var_174_16 = (arg_171_1.time_ - var_174_14) / var_174_15

				if arg_171_1.var_.characterEffect1095ui_story then
					local var_174_17 = Mathf.Lerp(0, 0.5, var_174_16)

					arg_171_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1095ui_story.fillRatio = var_174_17
				end
			end

			if arg_171_1.time_ >= var_174_14 + var_174_15 and arg_171_1.time_ < var_174_14 + var_174_15 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story then
				local var_174_18 = 0.5

				arg_171_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1095ui_story.fillRatio = var_174_18
			end

			local var_174_19 = 0
			local var_174_20 = 0.275

			if var_174_19 < arg_171_1.time_ and arg_171_1.time_ <= var_174_19 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_21 = arg_171_1:FormatText(StoryNameCfg[670].name)

				arg_171_1.leftNameTxt_.text = var_174_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_22 = arg_171_1:GetWordFromCfg(411041041)
				local var_174_23 = arg_171_1:FormatText(var_174_22.content)

				arg_171_1.text_.text = var_174_23

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_24 = 11
				local var_174_25 = utf8.len(var_174_23)
				local var_174_26 = var_174_24 <= 0 and var_174_20 or var_174_20 * (var_174_25 / var_174_24)

				if var_174_26 > 0 and var_174_20 < var_174_26 then
					arg_171_1.talkMaxDuration = var_174_26

					if var_174_26 + var_174_19 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_26 + var_174_19
					end
				end

				arg_171_1.text_.text = var_174_23
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041041", "story_v_out_411041.awb") ~= 0 then
					local var_174_27 = manager.audio:GetVoiceLength("story_v_out_411041", "411041041", "story_v_out_411041.awb") / 1000

					if var_174_27 + var_174_19 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_27 + var_174_19
					end

					if var_174_22.prefab_name ~= "" and arg_171_1.actors_[var_174_22.prefab_name] ~= nil then
						local var_174_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_22.prefab_name].transform, "story_v_out_411041", "411041041", "story_v_out_411041.awb")

						arg_171_1:RecordAudio("411041041", var_174_28)
						arg_171_1:RecordAudio("411041041", var_174_28)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_411041", "411041041", "story_v_out_411041.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_411041", "411041041", "story_v_out_411041.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_29 = math.max(var_174_20, arg_171_1.talkMaxDuration)

			if var_174_19 <= arg_171_1.time_ and arg_171_1.time_ < var_174_19 + var_174_29 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_19) / var_174_29

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_19 + var_174_29 and arg_171_1.time_ < var_174_19 + var_174_29 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play411041042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 411041042
		arg_175_1.duration_ = 6.8

		local var_175_0 = {
			zh = 5.2,
			ja = 6.8
		}
		local var_175_1 = manager.audio:GetLocalizationFlag()

		if var_175_0[var_175_1] ~= nil then
			arg_175_1.duration_ = var_175_0[var_175_1]
		end

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play411041043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10071ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect10071ui_story == nil then
				arg_175_1.var_.characterEffect10071ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect10071ui_story then
					local var_178_4 = Mathf.Lerp(0, 0.5, var_178_3)

					arg_175_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_175_1.var_.characterEffect10071ui_story.fillRatio = var_178_4
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect10071ui_story then
				local var_178_5 = 0.5

				arg_175_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_175_1.var_.characterEffect10071ui_story.fillRatio = var_178_5
			end

			local var_178_6 = 0
			local var_178_7 = 0.625

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_8 = arg_175_1:FormatText(StoryNameCfg[673].name)

				arg_175_1.leftNameTxt_.text = var_178_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, true)
				arg_175_1.iconController_:SetSelectedState("hero")

				arg_175_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_9 = arg_175_1:GetWordFromCfg(411041042)
				local var_178_10 = arg_175_1:FormatText(var_178_9.content)

				arg_175_1.text_.text = var_178_10

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_11 = 25
				local var_178_12 = utf8.len(var_178_10)
				local var_178_13 = var_178_11 <= 0 and var_178_7 or var_178_7 * (var_178_12 / var_178_11)

				if var_178_13 > 0 and var_178_7 < var_178_13 then
					arg_175_1.talkMaxDuration = var_178_13

					if var_178_13 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_13 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_10
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041042", "story_v_out_411041.awb") ~= 0 then
					local var_178_14 = manager.audio:GetVoiceLength("story_v_out_411041", "411041042", "story_v_out_411041.awb") / 1000

					if var_178_14 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_14 + var_178_6
					end

					if var_178_9.prefab_name ~= "" and arg_175_1.actors_[var_178_9.prefab_name] ~= nil then
						local var_178_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_9.prefab_name].transform, "story_v_out_411041", "411041042", "story_v_out_411041.awb")

						arg_175_1:RecordAudio("411041042", var_178_15)
						arg_175_1:RecordAudio("411041042", var_178_15)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_411041", "411041042", "story_v_out_411041.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_411041", "411041042", "story_v_out_411041.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_16 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_16 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_16

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_16 and arg_175_1.time_ < var_178_6 + var_178_16 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play411041043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 411041043
		arg_179_1.duration_ = 4.466

		local var_179_0 = {
			zh = 3.5,
			ja = 4.466
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
				arg_179_0:Play411041044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1095ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1095ui_story == nil then
				arg_179_1.var_.characterEffect1095ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1095ui_story then
					arg_179_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1095ui_story then
				arg_179_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_182_4 = 0

			if var_182_4 < arg_179_1.time_ and arg_179_1.time_ <= var_182_4 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_182_6 = arg_179_1.actors_["10071ui_story"]
			local var_182_7 = 0

			if var_182_7 < arg_179_1.time_ and arg_179_1.time_ <= var_182_7 + arg_182_0 and arg_179_1.var_.characterEffect10071ui_story == nil then
				arg_179_1.var_.characterEffect10071ui_story = var_182_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_8 = 0.200000002980232

			if var_182_7 <= arg_179_1.time_ and arg_179_1.time_ < var_182_7 + var_182_8 then
				local var_182_9 = (arg_179_1.time_ - var_182_7) / var_182_8

				if arg_179_1.var_.characterEffect10071ui_story then
					local var_182_10 = Mathf.Lerp(0, 0.5, var_182_9)

					arg_179_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_179_1.var_.characterEffect10071ui_story.fillRatio = var_182_10
				end
			end

			if arg_179_1.time_ >= var_182_7 + var_182_8 and arg_179_1.time_ < var_182_7 + var_182_8 + arg_182_0 and arg_179_1.var_.characterEffect10071ui_story then
				local var_182_11 = 0.5

				arg_179_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_179_1.var_.characterEffect10071ui_story.fillRatio = var_182_11
			end

			local var_182_12 = 0
			local var_182_13 = 0.375

			if var_182_12 < arg_179_1.time_ and arg_179_1.time_ <= var_182_12 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_14 = arg_179_1:FormatText(StoryNameCfg[471].name)

				arg_179_1.leftNameTxt_.text = var_182_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_15 = arg_179_1:GetWordFromCfg(411041043)
				local var_182_16 = arg_179_1:FormatText(var_182_15.content)

				arg_179_1.text_.text = var_182_16

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_17 = 15
				local var_182_18 = utf8.len(var_182_16)
				local var_182_19 = var_182_17 <= 0 and var_182_13 or var_182_13 * (var_182_18 / var_182_17)

				if var_182_19 > 0 and var_182_13 < var_182_19 then
					arg_179_1.talkMaxDuration = var_182_19

					if var_182_19 + var_182_12 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_19 + var_182_12
					end
				end

				arg_179_1.text_.text = var_182_16
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041043", "story_v_out_411041.awb") ~= 0 then
					local var_182_20 = manager.audio:GetVoiceLength("story_v_out_411041", "411041043", "story_v_out_411041.awb") / 1000

					if var_182_20 + var_182_12 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_20 + var_182_12
					end

					if var_182_15.prefab_name ~= "" and arg_179_1.actors_[var_182_15.prefab_name] ~= nil then
						local var_182_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_15.prefab_name].transform, "story_v_out_411041", "411041043", "story_v_out_411041.awb")

						arg_179_1:RecordAudio("411041043", var_182_21)
						arg_179_1:RecordAudio("411041043", var_182_21)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_411041", "411041043", "story_v_out_411041.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_411041", "411041043", "story_v_out_411041.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_22 = math.max(var_182_13, arg_179_1.talkMaxDuration)

			if var_182_12 <= arg_179_1.time_ and arg_179_1.time_ < var_182_12 + var_182_22 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_12) / var_182_22

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_12 + var_182_22 and arg_179_1.time_ < var_182_12 + var_182_22 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play411041044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 411041044
		arg_183_1.duration_ = 9.633

		local var_183_0 = {
			zh = 3.033,
			ja = 9.633
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
				arg_183_0:Play411041045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.35

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[471].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(411041044)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 14
				local var_186_6 = utf8.len(var_186_4)
				local var_186_7 = var_186_5 <= 0 and var_186_1 or var_186_1 * (var_186_6 / var_186_5)

				if var_186_7 > 0 and var_186_1 < var_186_7 then
					arg_183_1.talkMaxDuration = var_186_7

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_4
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041044", "story_v_out_411041.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041044", "story_v_out_411041.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_411041", "411041044", "story_v_out_411041.awb")

						arg_183_1:RecordAudio("411041044", var_186_9)
						arg_183_1:RecordAudio("411041044", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_411041", "411041044", "story_v_out_411041.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_411041", "411041044", "story_v_out_411041.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_10 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_10 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_10

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_10 and arg_183_1.time_ < var_186_0 + var_186_10 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play411041045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 411041045
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play411041046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10071ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10071ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(0, 100, 0)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10071ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0, 100, 0)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = arg_187_1.actors_["1095ui_story"].transform
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 then
				arg_187_1.var_.moveOldPos1095ui_story = var_190_9.localPosition
			end

			local var_190_11 = 0.001

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11
				local var_190_13 = Vector3.New(0, -0.98, -6.1)

				var_190_9.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1095ui_story, var_190_13, var_190_12)

				local var_190_14 = manager.ui.mainCamera.transform.position - var_190_9.position

				var_190_9.forward = Vector3.New(var_190_14.x, var_190_14.y, var_190_14.z)

				local var_190_15 = var_190_9.localEulerAngles

				var_190_15.z = 0
				var_190_15.x = 0
				var_190_9.localEulerAngles = var_190_15
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 then
				var_190_9.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_190_16 = manager.ui.mainCamera.transform.position - var_190_9.position

				var_190_9.forward = Vector3.New(var_190_16.x, var_190_16.y, var_190_16.z)

				local var_190_17 = var_190_9.localEulerAngles

				var_190_17.z = 0
				var_190_17.x = 0
				var_190_9.localEulerAngles = var_190_17
			end

			local var_190_18 = arg_187_1.actors_["1095ui_story"]
			local var_190_19 = 0

			if var_190_19 < arg_187_1.time_ and arg_187_1.time_ <= var_190_19 + arg_190_0 and arg_187_1.var_.characterEffect1095ui_story == nil then
				arg_187_1.var_.characterEffect1095ui_story = var_190_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_20 = 0.200000002980232

			if var_190_19 <= arg_187_1.time_ and arg_187_1.time_ < var_190_19 + var_190_20 then
				local var_190_21 = (arg_187_1.time_ - var_190_19) / var_190_20

				if arg_187_1.var_.characterEffect1095ui_story then
					local var_190_22 = Mathf.Lerp(0, 0.5, var_190_21)

					arg_187_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1095ui_story.fillRatio = var_190_22
				end
			end

			if arg_187_1.time_ >= var_190_19 + var_190_20 and arg_187_1.time_ < var_190_19 + var_190_20 + arg_190_0 and arg_187_1.var_.characterEffect1095ui_story then
				local var_190_23 = 0.5

				arg_187_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1095ui_story.fillRatio = var_190_23
			end

			local var_190_24 = arg_187_1.actors_["10071ui_story"]
			local var_190_25 = 0

			if var_190_25 < arg_187_1.time_ and arg_187_1.time_ <= var_190_25 + arg_190_0 and arg_187_1.var_.characterEffect10071ui_story == nil then
				arg_187_1.var_.characterEffect10071ui_story = var_190_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_26 = 0.200000002980232

			if var_190_25 <= arg_187_1.time_ and arg_187_1.time_ < var_190_25 + var_190_26 then
				local var_190_27 = (arg_187_1.time_ - var_190_25) / var_190_26

				if arg_187_1.var_.characterEffect10071ui_story then
					local var_190_28 = Mathf.Lerp(0, 0.5, var_190_27)

					arg_187_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_187_1.var_.characterEffect10071ui_story.fillRatio = var_190_28
				end
			end

			if arg_187_1.time_ >= var_190_25 + var_190_26 and arg_187_1.time_ < var_190_25 + var_190_26 + arg_190_0 and arg_187_1.var_.characterEffect10071ui_story then
				local var_190_29 = 0.5

				arg_187_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_187_1.var_.characterEffect10071ui_story.fillRatio = var_190_29
			end

			local var_190_30 = 0
			local var_190_31 = 1.025

			if var_190_30 < arg_187_1.time_ and arg_187_1.time_ <= var_190_30 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_32 = arg_187_1:GetWordFromCfg(411041045)
				local var_190_33 = arg_187_1:FormatText(var_190_32.content)

				arg_187_1.text_.text = var_190_33

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_34 = 41
				local var_190_35 = utf8.len(var_190_33)
				local var_190_36 = var_190_34 <= 0 and var_190_31 or var_190_31 * (var_190_35 / var_190_34)

				if var_190_36 > 0 and var_190_31 < var_190_36 then
					arg_187_1.talkMaxDuration = var_190_36

					if var_190_36 + var_190_30 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_36 + var_190_30
					end
				end

				arg_187_1.text_.text = var_190_33
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_37 = math.max(var_190_31, arg_187_1.talkMaxDuration)

			if var_190_30 <= arg_187_1.time_ and arg_187_1.time_ < var_190_30 + var_190_37 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_30) / var_190_37

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_30 + var_190_37 and arg_187_1.time_ < var_190_30 + var_190_37 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play411041046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 411041046
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play411041047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.875

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

				local var_194_2 = arg_191_1:GetWordFromCfg(411041046)
				local var_194_3 = arg_191_1:FormatText(var_194_2.content)

				arg_191_1.text_.text = var_194_3

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_4 = 35
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
	Play411041047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 411041047
		arg_195_1.duration_ = 3.166

		local var_195_0 = {
			zh = 2.6,
			ja = 3.166
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
				arg_195_0:Play411041048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.325

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[673].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, true)
				arg_195_1.iconController_:SetSelectedState("hero")

				arg_195_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(411041047)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041047", "story_v_out_411041.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041047", "story_v_out_411041.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_411041", "411041047", "story_v_out_411041.awb")

						arg_195_1:RecordAudio("411041047", var_198_9)
						arg_195_1:RecordAudio("411041047", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_411041", "411041047", "story_v_out_411041.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_411041", "411041047", "story_v_out_411041.awb")
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
	Play411041048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 411041048
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play411041049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 1.375

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

				local var_202_2 = arg_199_1:GetWordFromCfg(411041048)
				local var_202_3 = arg_199_1:FormatText(var_202_2.content)

				arg_199_1.text_.text = var_202_3

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_4 = 55
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
	Play411041049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 411041049
		arg_203_1.duration_ = 3.766

		local var_203_0 = {
			zh = 2.4,
			ja = 3.766
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
				arg_203_0:Play411041050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.225

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[673].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, true)
				arg_203_1.iconController_:SetSelectedState("hero")

				arg_203_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(411041049)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 9
				local var_206_6 = utf8.len(var_206_4)
				local var_206_7 = var_206_5 <= 0 and var_206_1 or var_206_1 * (var_206_6 / var_206_5)

				if var_206_7 > 0 and var_206_1 < var_206_7 then
					arg_203_1.talkMaxDuration = var_206_7

					if var_206_7 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_7 + var_206_0
					end
				end

				arg_203_1.text_.text = var_206_4
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041049", "story_v_out_411041.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041049", "story_v_out_411041.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_411041", "411041049", "story_v_out_411041.awb")

						arg_203_1:RecordAudio("411041049", var_206_9)
						arg_203_1:RecordAudio("411041049", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_411041", "411041049", "story_v_out_411041.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_411041", "411041049", "story_v_out_411041.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_10 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_10 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_10

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_10 and arg_203_1.time_ < var_206_0 + var_206_10 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play411041050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 411041050
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play411041051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.875

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

				local var_210_2 = arg_207_1:GetWordFromCfg(411041050)
				local var_210_3 = arg_207_1:FormatText(var_210_2.content)

				arg_207_1.text_.text = var_210_3

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_4 = 35
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
	Play411041051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 411041051
		arg_211_1.duration_ = 10.566

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play411041052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1.3

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[673].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, true)
				arg_211_1.iconController_:SetSelectedState("hero")

				arg_211_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(411041051)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 52
				local var_214_6 = utf8.len(var_214_4)
				local var_214_7 = var_214_5 <= 0 and var_214_1 or var_214_1 * (var_214_6 / var_214_5)

				if var_214_7 > 0 and var_214_1 < var_214_7 then
					arg_211_1.talkMaxDuration = var_214_7

					if var_214_7 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_7 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_4
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041051", "story_v_out_411041.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041051", "story_v_out_411041.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_411041", "411041051", "story_v_out_411041.awb")

						arg_211_1:RecordAudio("411041051", var_214_9)
						arg_211_1:RecordAudio("411041051", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_411041", "411041051", "story_v_out_411041.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_411041", "411041051", "story_v_out_411041.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_10 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_10 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_10

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_10 and arg_211_1.time_ < var_214_0 + var_214_10 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play411041052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 411041052
		arg_215_1.duration_ = 9.333

		local var_215_0 = {
			zh = 8.733,
			ja = 9.333
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
				arg_215_0:Play411041053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 1.025

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[673].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, true)
				arg_215_1.iconController_:SetSelectedState("hero")

				arg_215_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(411041052)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 41
				local var_218_6 = utf8.len(var_218_4)
				local var_218_7 = var_218_5 <= 0 and var_218_1 or var_218_1 * (var_218_6 / var_218_5)

				if var_218_7 > 0 and var_218_1 < var_218_7 then
					arg_215_1.talkMaxDuration = var_218_7

					if var_218_7 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_7 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_4
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041052", "story_v_out_411041.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041052", "story_v_out_411041.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_411041", "411041052", "story_v_out_411041.awb")

						arg_215_1:RecordAudio("411041052", var_218_9)
						arg_215_1:RecordAudio("411041052", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_411041", "411041052", "story_v_out_411041.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_411041", "411041052", "story_v_out_411041.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_10 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_10 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_10

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_10 and arg_215_1.time_ < var_218_0 + var_218_10 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play411041053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 411041053
		arg_219_1.duration_ = 13.8

		local var_219_0 = {
			zh = 9.066,
			ja = 13.8
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
				arg_219_0:Play411041054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 1.175

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[673].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(411041053)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041053", "story_v_out_411041.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041053", "story_v_out_411041.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_411041", "411041053", "story_v_out_411041.awb")

						arg_219_1:RecordAudio("411041053", var_222_9)
						arg_219_1:RecordAudio("411041053", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_411041", "411041053", "story_v_out_411041.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_411041", "411041053", "story_v_out_411041.awb")
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
	Play411041054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 411041054
		arg_223_1.duration_ = 5.466

		local var_223_0 = {
			zh = 5.466,
			ja = 5.066
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
				arg_223_0:Play411041055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1095ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1095ui_story == nil then
				arg_223_1.var_.characterEffect1095ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1095ui_story then
					arg_223_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1095ui_story then
				arg_223_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_226_4 = 0

			if var_226_4 < arg_223_1.time_ and arg_223_1.time_ <= var_226_4 + arg_226_0 then
				arg_223_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_226_5 = 0

			if var_226_5 < arg_223_1.time_ and arg_223_1.time_ <= var_226_5 + arg_226_0 then
				arg_223_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_226_6 = 0
			local var_226_7 = 0.475

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[471].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(411041054)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041054", "story_v_out_411041.awb") ~= 0 then
					local var_226_14 = manager.audio:GetVoiceLength("story_v_out_411041", "411041054", "story_v_out_411041.awb") / 1000

					if var_226_14 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_14 + var_226_6
					end

					if var_226_9.prefab_name ~= "" and arg_223_1.actors_[var_226_9.prefab_name] ~= nil then
						local var_226_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_9.prefab_name].transform, "story_v_out_411041", "411041054", "story_v_out_411041.awb")

						arg_223_1:RecordAudio("411041054", var_226_15)
						arg_223_1:RecordAudio("411041054", var_226_15)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_411041", "411041054", "story_v_out_411041.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_411041", "411041054", "story_v_out_411041.awb")
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
	Play411041055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 411041055
		arg_227_1.duration_ = 10.666

		local var_227_0 = {
			zh = 7.233,
			ja = 10.666
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
				arg_227_0:Play411041056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1095ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1095ui_story == nil then
				arg_227_1.var_.characterEffect1095ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.200000002980232

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1095ui_story then
					local var_230_4 = Mathf.Lerp(0, 0.5, var_230_3)

					arg_227_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1095ui_story.fillRatio = var_230_4
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1095ui_story then
				local var_230_5 = 0.5

				arg_227_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1095ui_story.fillRatio = var_230_5
			end

			local var_230_6 = 0
			local var_230_7 = 0.95

			if var_230_6 < arg_227_1.time_ and arg_227_1.time_ <= var_230_6 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_8 = arg_227_1:FormatText(StoryNameCfg[673].name)

				arg_227_1.leftNameTxt_.text = var_230_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, true)
				arg_227_1.iconController_:SetSelectedState("hero")

				arg_227_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_9 = arg_227_1:GetWordFromCfg(411041055)
				local var_230_10 = arg_227_1:FormatText(var_230_9.content)

				arg_227_1.text_.text = var_230_10

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_11 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041055", "story_v_out_411041.awb") ~= 0 then
					local var_230_14 = manager.audio:GetVoiceLength("story_v_out_411041", "411041055", "story_v_out_411041.awb") / 1000

					if var_230_14 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_14 + var_230_6
					end

					if var_230_9.prefab_name ~= "" and arg_227_1.actors_[var_230_9.prefab_name] ~= nil then
						local var_230_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_9.prefab_name].transform, "story_v_out_411041", "411041055", "story_v_out_411041.awb")

						arg_227_1:RecordAudio("411041055", var_230_15)
						arg_227_1:RecordAudio("411041055", var_230_15)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_411041", "411041055", "story_v_out_411041.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_411041", "411041055", "story_v_out_411041.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_16 = math.max(var_230_7, arg_227_1.talkMaxDuration)

			if var_230_6 <= arg_227_1.time_ and arg_227_1.time_ < var_230_6 + var_230_16 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_6) / var_230_16

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_6 + var_230_16 and arg_227_1.time_ < var_230_6 + var_230_16 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play411041056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 411041056
		arg_231_1.duration_ = 5.833

		local var_231_0 = {
			zh = 5.833,
			ja = 5.266
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
				arg_231_0:Play411041057(arg_231_1)
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
					arg_231_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1095ui_story then
				arg_231_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_234_4 = 0
			local var_234_5 = 0.6

			if var_234_4 < arg_231_1.time_ and arg_231_1.time_ <= var_234_4 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_6 = arg_231_1:FormatText(StoryNameCfg[471].name)

				arg_231_1.leftNameTxt_.text = var_234_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_7 = arg_231_1:GetWordFromCfg(411041056)
				local var_234_8 = arg_231_1:FormatText(var_234_7.content)

				arg_231_1.text_.text = var_234_8

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_9 = 24
				local var_234_10 = utf8.len(var_234_8)
				local var_234_11 = var_234_9 <= 0 and var_234_5 or var_234_5 * (var_234_10 / var_234_9)

				if var_234_11 > 0 and var_234_5 < var_234_11 then
					arg_231_1.talkMaxDuration = var_234_11

					if var_234_11 + var_234_4 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_11 + var_234_4
					end
				end

				arg_231_1.text_.text = var_234_8
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041056", "story_v_out_411041.awb") ~= 0 then
					local var_234_12 = manager.audio:GetVoiceLength("story_v_out_411041", "411041056", "story_v_out_411041.awb") / 1000

					if var_234_12 + var_234_4 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_12 + var_234_4
					end

					if var_234_7.prefab_name ~= "" and arg_231_1.actors_[var_234_7.prefab_name] ~= nil then
						local var_234_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_7.prefab_name].transform, "story_v_out_411041", "411041056", "story_v_out_411041.awb")

						arg_231_1:RecordAudio("411041056", var_234_13)
						arg_231_1:RecordAudio("411041056", var_234_13)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_411041", "411041056", "story_v_out_411041.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_411041", "411041056", "story_v_out_411041.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_14 = math.max(var_234_5, arg_231_1.talkMaxDuration)

			if var_234_4 <= arg_231_1.time_ and arg_231_1.time_ < var_234_4 + var_234_14 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_4) / var_234_14

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_4 + var_234_14 and arg_231_1.time_ < var_234_4 + var_234_14 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play411041057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 411041057
		arg_235_1.duration_ = 7.6

		local var_235_0 = {
			zh = 4.6,
			ja = 7.6
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
				arg_235_0:Play411041058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1095ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1095ui_story == nil then
				arg_235_1.var_.characterEffect1095ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.200000002980232

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1095ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1095ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1095ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1095ui_story.fillRatio = var_238_5
			end

			local var_238_6 = 0
			local var_238_7 = 0.575

			if var_238_6 < arg_235_1.time_ and arg_235_1.time_ <= var_238_6 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_8 = arg_235_1:FormatText(StoryNameCfg[673].name)

				arg_235_1.leftNameTxt_.text = var_238_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, true)
				arg_235_1.iconController_:SetSelectedState("hero")

				arg_235_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_9 = arg_235_1:GetWordFromCfg(411041057)
				local var_238_10 = arg_235_1:FormatText(var_238_9.content)

				arg_235_1.text_.text = var_238_10

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_11 = 23
				local var_238_12 = utf8.len(var_238_10)
				local var_238_13 = var_238_11 <= 0 and var_238_7 or var_238_7 * (var_238_12 / var_238_11)

				if var_238_13 > 0 and var_238_7 < var_238_13 then
					arg_235_1.talkMaxDuration = var_238_13

					if var_238_13 + var_238_6 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_13 + var_238_6
					end
				end

				arg_235_1.text_.text = var_238_10
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041057", "story_v_out_411041.awb") ~= 0 then
					local var_238_14 = manager.audio:GetVoiceLength("story_v_out_411041", "411041057", "story_v_out_411041.awb") / 1000

					if var_238_14 + var_238_6 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_14 + var_238_6
					end

					if var_238_9.prefab_name ~= "" and arg_235_1.actors_[var_238_9.prefab_name] ~= nil then
						local var_238_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_9.prefab_name].transform, "story_v_out_411041", "411041057", "story_v_out_411041.awb")

						arg_235_1:RecordAudio("411041057", var_238_15)
						arg_235_1:RecordAudio("411041057", var_238_15)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_411041", "411041057", "story_v_out_411041.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_411041", "411041057", "story_v_out_411041.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_16 = math.max(var_238_7, arg_235_1.talkMaxDuration)

			if var_238_6 <= arg_235_1.time_ and arg_235_1.time_ < var_238_6 + var_238_16 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_6) / var_238_16

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_6 + var_238_16 and arg_235_1.time_ < var_238_6 + var_238_16 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play411041058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 411041058
		arg_239_1.duration_ = 14.866

		local var_239_0 = {
			zh = 9.2,
			ja = 14.866
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
				arg_239_0:Play411041059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 1.25

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[673].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, true)
				arg_239_1.iconController_:SetSelectedState("hero")

				arg_239_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(411041058)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041058", "story_v_out_411041.awb") ~= 0 then
					local var_242_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041058", "story_v_out_411041.awb") / 1000

					if var_242_8 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_0
					end

					if var_242_3.prefab_name ~= "" and arg_239_1.actors_[var_242_3.prefab_name] ~= nil then
						local var_242_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_3.prefab_name].transform, "story_v_out_411041", "411041058", "story_v_out_411041.awb")

						arg_239_1:RecordAudio("411041058", var_242_9)
						arg_239_1:RecordAudio("411041058", var_242_9)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_411041", "411041058", "story_v_out_411041.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_411041", "411041058", "story_v_out_411041.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_10 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_10 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_10

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_10 and arg_239_1.time_ < var_242_0 + var_242_10 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play411041059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 411041059
		arg_243_1.duration_ = 8.8

		local var_243_0 = {
			zh = 4.733,
			ja = 8.8
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
				arg_243_0:Play411041060(arg_243_1)
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
				local var_246_4 = Vector3.New(0, -0.98, -6.1)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1095ui_story, var_246_4, var_246_3)

				local var_246_5 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_5.x, var_246_5.y, var_246_5.z)

				local var_246_6 = var_246_0.localEulerAngles

				var_246_6.z = 0
				var_246_6.x = 0
				var_246_0.localEulerAngles = var_246_6
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(0, -0.98, -6.1)

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
				arg_243_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_246_14 = 0

			if var_246_14 < arg_243_1.time_ and arg_243_1.time_ <= var_246_14 + arg_246_0 then
				arg_243_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_246_15 = 0
			local var_246_16 = 0.475

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

				local var_246_18 = arg_243_1:GetWordFromCfg(411041059)
				local var_246_19 = arg_243_1:FormatText(var_246_18.content)

				arg_243_1.text_.text = var_246_19

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_20 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041059", "story_v_out_411041.awb") ~= 0 then
					local var_246_23 = manager.audio:GetVoiceLength("story_v_out_411041", "411041059", "story_v_out_411041.awb") / 1000

					if var_246_23 + var_246_15 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_23 + var_246_15
					end

					if var_246_18.prefab_name ~= "" and arg_243_1.actors_[var_246_18.prefab_name] ~= nil then
						local var_246_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_18.prefab_name].transform, "story_v_out_411041", "411041059", "story_v_out_411041.awb")

						arg_243_1:RecordAudio("411041059", var_246_24)
						arg_243_1:RecordAudio("411041059", var_246_24)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_411041", "411041059", "story_v_out_411041.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_411041", "411041059", "story_v_out_411041.awb")
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
	Play411041060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 411041060
		arg_247_1.duration_ = 2.1

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play411041061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1095ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1095ui_story == nil then
				arg_247_1.var_.characterEffect1095ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.200000002980232

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1095ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1095ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1095ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1095ui_story.fillRatio = var_250_5
			end

			local var_250_6 = 0
			local var_250_7 = 0.225

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_8 = arg_247_1:FormatText(StoryNameCfg[673].name)

				arg_247_1.leftNameTxt_.text = var_250_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, true)
				arg_247_1.iconController_:SetSelectedState("hero")

				arg_247_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerka")

				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_9 = arg_247_1:GetWordFromCfg(411041060)
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041060", "story_v_out_411041.awb") ~= 0 then
					local var_250_14 = manager.audio:GetVoiceLength("story_v_out_411041", "411041060", "story_v_out_411041.awb") / 1000

					if var_250_14 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_14 + var_250_6
					end

					if var_250_9.prefab_name ~= "" and arg_247_1.actors_[var_250_9.prefab_name] ~= nil then
						local var_250_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_9.prefab_name].transform, "story_v_out_411041", "411041060", "story_v_out_411041.awb")

						arg_247_1:RecordAudio("411041060", var_250_15)
						arg_247_1:RecordAudio("411041060", var_250_15)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_411041", "411041060", "story_v_out_411041.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_411041", "411041060", "story_v_out_411041.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_16 = math.max(var_250_7, arg_247_1.talkMaxDuration)

			if var_250_6 <= arg_247_1.time_ and arg_247_1.time_ < var_250_6 + var_250_16 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_6) / var_250_16

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_6 + var_250_16 and arg_247_1.time_ < var_250_6 + var_250_16 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play411041061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 411041061
		arg_251_1.duration_ = 6

		local var_251_0 = {
			zh = 6,
			ja = 4.4
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
				arg_251_0:Play411041062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1095ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect1095ui_story == nil then
				arg_251_1.var_.characterEffect1095ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.200000002980232

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect1095ui_story then
					arg_251_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect1095ui_story then
				arg_251_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_254_4 = 0
			local var_254_5 = 0.5

			if var_254_4 < arg_251_1.time_ and arg_251_1.time_ <= var_254_4 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_6 = arg_251_1:FormatText(StoryNameCfg[471].name)

				arg_251_1.leftNameTxt_.text = var_254_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_7 = arg_251_1:GetWordFromCfg(411041061)
				local var_254_8 = arg_251_1:FormatText(var_254_7.content)

				arg_251_1.text_.text = var_254_8

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_9 = 20
				local var_254_10 = utf8.len(var_254_8)
				local var_254_11 = var_254_9 <= 0 and var_254_5 or var_254_5 * (var_254_10 / var_254_9)

				if var_254_11 > 0 and var_254_5 < var_254_11 then
					arg_251_1.talkMaxDuration = var_254_11

					if var_254_11 + var_254_4 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_11 + var_254_4
					end
				end

				arg_251_1.text_.text = var_254_8
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041061", "story_v_out_411041.awb") ~= 0 then
					local var_254_12 = manager.audio:GetVoiceLength("story_v_out_411041", "411041061", "story_v_out_411041.awb") / 1000

					if var_254_12 + var_254_4 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_12 + var_254_4
					end

					if var_254_7.prefab_name ~= "" and arg_251_1.actors_[var_254_7.prefab_name] ~= nil then
						local var_254_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_7.prefab_name].transform, "story_v_out_411041", "411041061", "story_v_out_411041.awb")

						arg_251_1:RecordAudio("411041061", var_254_13)
						arg_251_1:RecordAudio("411041061", var_254_13)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_411041", "411041061", "story_v_out_411041.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_411041", "411041061", "story_v_out_411041.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_14 = math.max(var_254_5, arg_251_1.talkMaxDuration)

			if var_254_4 <= arg_251_1.time_ and arg_251_1.time_ < var_254_4 + var_254_14 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_4) / var_254_14

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_4 + var_254_14 and arg_251_1.time_ < var_254_4 + var_254_14 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play411041062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 411041062
		arg_255_1.duration_ = 1.133

		local var_255_0 = {
			zh = 1.133,
			ja = 1.1
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
				arg_255_0:Play411041063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1095ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1095ui_story == nil then
				arg_255_1.var_.characterEffect1095ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.200000002980232

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1095ui_story then
					local var_258_4 = Mathf.Lerp(0, 0.5, var_258_3)

					arg_255_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1095ui_story.fillRatio = var_258_4
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1095ui_story then
				local var_258_5 = 0.5

				arg_255_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1095ui_story.fillRatio = var_258_5
			end

			local var_258_6 = 0
			local var_258_7 = 0.1

			if var_258_6 < arg_255_1.time_ and arg_255_1.time_ <= var_258_6 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_8 = arg_255_1:FormatText(StoryNameCfg[36].name)

				arg_255_1.leftNameTxt_.text = var_258_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_9 = arg_255_1:GetWordFromCfg(411041062)
				local var_258_10 = arg_255_1:FormatText(var_258_9.content)

				arg_255_1.text_.text = var_258_10

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_11 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041062", "story_v_out_411041.awb") ~= 0 then
					local var_258_14 = manager.audio:GetVoiceLength("story_v_out_411041", "411041062", "story_v_out_411041.awb") / 1000

					if var_258_14 + var_258_6 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_14 + var_258_6
					end

					if var_258_9.prefab_name ~= "" and arg_255_1.actors_[var_258_9.prefab_name] ~= nil then
						local var_258_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_9.prefab_name].transform, "story_v_out_411041", "411041062", "story_v_out_411041.awb")

						arg_255_1:RecordAudio("411041062", var_258_15)
						arg_255_1:RecordAudio("411041062", var_258_15)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_411041", "411041062", "story_v_out_411041.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_411041", "411041062", "story_v_out_411041.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_16 = math.max(var_258_7, arg_255_1.talkMaxDuration)

			if var_258_6 <= arg_255_1.time_ and arg_255_1.time_ < var_258_6 + var_258_16 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_6) / var_258_16

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_6 + var_258_16 and arg_255_1.time_ < var_258_6 + var_258_16 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play411041063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 411041063
		arg_259_1.duration_ = 8.56666666666667

		local var_259_0 = {
			zh = 6.26666666666667,
			ja = 8.56666666666667
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
				arg_259_0:Play411041064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 2

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				local var_262_1 = manager.ui.mainCamera.transform.localPosition
				local var_262_2 = Vector3.New(0, 0, 10) + Vector3.New(var_262_1.x, var_262_1.y, 0)
				local var_262_3 = arg_259_1.bgs_.I07

				var_262_3.transform.localPosition = var_262_2
				var_262_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_262_4 = var_262_3:GetComponent("SpriteRenderer")

				if var_262_4 and var_262_4.sprite then
					local var_262_5 = (var_262_3.transform.localPosition - var_262_1).z
					local var_262_6 = manager.ui.mainCameraCom_
					local var_262_7 = 2 * var_262_5 * Mathf.Tan(var_262_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_262_8 = var_262_7 * var_262_6.aspect
					local var_262_9 = var_262_4.sprite.bounds.size.x
					local var_262_10 = var_262_4.sprite.bounds.size.y
					local var_262_11 = var_262_8 / var_262_9
					local var_262_12 = var_262_7 / var_262_10
					local var_262_13 = var_262_12 < var_262_11 and var_262_11 or var_262_12

					var_262_3.transform.localScale = Vector3.New(var_262_13, var_262_13, 0)
				end

				for iter_262_0, iter_262_1 in pairs(arg_259_1.bgs_) do
					if iter_262_0 ~= "I07" then
						iter_262_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_262_14 = 0

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 then
				arg_259_1.mask_.enabled = true
				arg_259_1.mask_.raycastTarget = true

				arg_259_1:SetGaussion(false)
			end

			local var_262_15 = 2

			if var_262_14 <= arg_259_1.time_ and arg_259_1.time_ < var_262_14 + var_262_15 then
				local var_262_16 = (arg_259_1.time_ - var_262_14) / var_262_15
				local var_262_17 = Color.New(0, 0, 0)

				var_262_17.a = Mathf.Lerp(0, 1, var_262_16)
				arg_259_1.mask_.color = var_262_17
			end

			if arg_259_1.time_ >= var_262_14 + var_262_15 and arg_259_1.time_ < var_262_14 + var_262_15 + arg_262_0 then
				local var_262_18 = Color.New(0, 0, 0)

				var_262_18.a = 1
				arg_259_1.mask_.color = var_262_18
			end

			local var_262_19 = 2

			if var_262_19 < arg_259_1.time_ and arg_259_1.time_ <= var_262_19 + arg_262_0 then
				arg_259_1.mask_.enabled = true
				arg_259_1.mask_.raycastTarget = true

				arg_259_1:SetGaussion(false)
			end

			local var_262_20 = 1.36666666666667

			if var_262_19 <= arg_259_1.time_ and arg_259_1.time_ < var_262_19 + var_262_20 then
				local var_262_21 = (arg_259_1.time_ - var_262_19) / var_262_20
				local var_262_22 = Color.New(0, 0, 0)

				var_262_22.a = Mathf.Lerp(1, 0, var_262_21)
				arg_259_1.mask_.color = var_262_22
			end

			if arg_259_1.time_ >= var_262_19 + var_262_20 and arg_259_1.time_ < var_262_19 + var_262_20 + arg_262_0 then
				local var_262_23 = Color.New(0, 0, 0)
				local var_262_24 = 0

				arg_259_1.mask_.enabled = false
				var_262_23.a = var_262_24
				arg_259_1.mask_.color = var_262_23
			end

			local var_262_25 = arg_259_1.actors_["1095ui_story"].transform
			local var_262_26 = 3.36666666666667

			if var_262_26 < arg_259_1.time_ and arg_259_1.time_ <= var_262_26 + arg_262_0 then
				arg_259_1.var_.moveOldPos1095ui_story = var_262_25.localPosition
			end

			local var_262_27 = 0.001

			if var_262_26 <= arg_259_1.time_ and arg_259_1.time_ < var_262_26 + var_262_27 then
				local var_262_28 = (arg_259_1.time_ - var_262_26) / var_262_27
				local var_262_29 = Vector3.New(0, -0.98, -6.1)

				var_262_25.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1095ui_story, var_262_29, var_262_28)

				local var_262_30 = manager.ui.mainCamera.transform.position - var_262_25.position

				var_262_25.forward = Vector3.New(var_262_30.x, var_262_30.y, var_262_30.z)

				local var_262_31 = var_262_25.localEulerAngles

				var_262_31.z = 0
				var_262_31.x = 0
				var_262_25.localEulerAngles = var_262_31
			end

			if arg_259_1.time_ >= var_262_26 + var_262_27 and arg_259_1.time_ < var_262_26 + var_262_27 + arg_262_0 then
				var_262_25.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_262_32 = manager.ui.mainCamera.transform.position - var_262_25.position

				var_262_25.forward = Vector3.New(var_262_32.x, var_262_32.y, var_262_32.z)

				local var_262_33 = var_262_25.localEulerAngles

				var_262_33.z = 0
				var_262_33.x = 0
				var_262_25.localEulerAngles = var_262_33
			end

			local var_262_34 = arg_259_1.actors_["1095ui_story"]
			local var_262_35 = 3.36666666666667

			if var_262_35 < arg_259_1.time_ and arg_259_1.time_ <= var_262_35 + arg_262_0 and arg_259_1.var_.characterEffect1095ui_story == nil then
				arg_259_1.var_.characterEffect1095ui_story = var_262_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_36 = 0.200000002980232

			if var_262_35 <= arg_259_1.time_ and arg_259_1.time_ < var_262_35 + var_262_36 then
				local var_262_37 = (arg_259_1.time_ - var_262_35) / var_262_36

				if arg_259_1.var_.characterEffect1095ui_story then
					arg_259_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_35 + var_262_36 and arg_259_1.time_ < var_262_35 + var_262_36 + arg_262_0 and arg_259_1.var_.characterEffect1095ui_story then
				arg_259_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_262_38 = 3.36666666666667

			if var_262_38 < arg_259_1.time_ and arg_259_1.time_ <= var_262_38 + arg_262_0 then
				arg_259_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_262_39 = 3.36666666666667

			if var_262_39 < arg_259_1.time_ and arg_259_1.time_ <= var_262_39 + arg_262_0 then
				arg_259_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_259_1.frameCnt_ <= 1 then
				arg_259_1.dialog_:SetActive(false)
			end

			local var_262_40 = 3.36666666666667
			local var_262_41 = 0.275

			if var_262_40 < arg_259_1.time_ and arg_259_1.time_ <= var_262_40 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0

				arg_259_1.dialog_:SetActive(true)

				local var_262_42 = LeanTween.value(arg_259_1.dialog_, 0, 1, 0.3)

				var_262_42:setOnUpdate(LuaHelper.FloatAction(function(arg_263_0)
					arg_259_1.dialogCg_.alpha = arg_263_0
				end))
				var_262_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_259_1.dialog_)
					var_262_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_259_1.duration_ = arg_259_1.duration_ + 0.3

				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_43 = arg_259_1:FormatText(StoryNameCfg[471].name)

				arg_259_1.leftNameTxt_.text = var_262_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_44 = arg_259_1:GetWordFromCfg(411041063)
				local var_262_45 = arg_259_1:FormatText(var_262_44.content)

				arg_259_1.text_.text = var_262_45

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_46 = 11
				local var_262_47 = utf8.len(var_262_45)
				local var_262_48 = var_262_46 <= 0 and var_262_41 or var_262_41 * (var_262_47 / var_262_46)

				if var_262_48 > 0 and var_262_41 < var_262_48 then
					arg_259_1.talkMaxDuration = var_262_48
					var_262_40 = var_262_40 + 0.3

					if var_262_48 + var_262_40 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_48 + var_262_40
					end
				end

				arg_259_1.text_.text = var_262_45
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041063", "story_v_out_411041.awb") ~= 0 then
					local var_262_49 = manager.audio:GetVoiceLength("story_v_out_411041", "411041063", "story_v_out_411041.awb") / 1000

					if var_262_49 + var_262_40 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_49 + var_262_40
					end

					if var_262_44.prefab_name ~= "" and arg_259_1.actors_[var_262_44.prefab_name] ~= nil then
						local var_262_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_44.prefab_name].transform, "story_v_out_411041", "411041063", "story_v_out_411041.awb")

						arg_259_1:RecordAudio("411041063", var_262_50)
						arg_259_1:RecordAudio("411041063", var_262_50)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_411041", "411041063", "story_v_out_411041.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_411041", "411041063", "story_v_out_411041.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_51 = var_262_40 + 0.3
			local var_262_52 = math.max(var_262_41, arg_259_1.talkMaxDuration)

			if var_262_51 <= arg_259_1.time_ and arg_259_1.time_ < var_262_51 + var_262_52 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_51) / var_262_52

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_51 + var_262_52 and arg_259_1.time_ < var_262_51 + var_262_52 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play411041064 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 411041064
		arg_265_1.duration_ = 9.433

		local var_265_0 = {
			zh = 8.433,
			ja = 9.433
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
				arg_265_0:Play411041065(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = "10014ui_story"

			if arg_265_1.actors_[var_268_0] == nil then
				local var_268_1 = Object.Instantiate(Asset.Load("Char/" .. var_268_0), arg_265_1.stage_.transform)

				var_268_1.name = var_268_0
				var_268_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_265_1.actors_[var_268_0] = var_268_1

				local var_268_2 = var_268_1:GetComponentInChildren(typeof(CharacterEffect))

				var_268_2.enabled = true

				local var_268_3 = GameObjectTools.GetOrAddComponent(var_268_1, typeof(DynamicBoneHelper))

				if var_268_3 then
					var_268_3:EnableDynamicBone(false)
				end

				arg_265_1:ShowWeapon(var_268_2.transform, false)

				arg_265_1.var_[var_268_0 .. "Animator"] = var_268_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_265_1.var_[var_268_0 .. "Animator"].applyRootMotion = true
				arg_265_1.var_[var_268_0 .. "LipSync"] = var_268_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_268_4 = arg_265_1.actors_["10014ui_story"].transform
			local var_268_5 = 0

			if var_268_5 < arg_265_1.time_ and arg_265_1.time_ <= var_268_5 + arg_268_0 then
				arg_265_1.var_.moveOldPos10014ui_story = var_268_4.localPosition
			end

			local var_268_6 = 0.001

			if var_268_5 <= arg_265_1.time_ and arg_265_1.time_ < var_268_5 + var_268_6 then
				local var_268_7 = (arg_265_1.time_ - var_268_5) / var_268_6
				local var_268_8 = Vector3.New(0.7, -1.06, -6.2)

				var_268_4.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos10014ui_story, var_268_8, var_268_7)

				local var_268_9 = manager.ui.mainCamera.transform.position - var_268_4.position

				var_268_4.forward = Vector3.New(var_268_9.x, var_268_9.y, var_268_9.z)

				local var_268_10 = var_268_4.localEulerAngles

				var_268_10.z = 0
				var_268_10.x = 0
				var_268_4.localEulerAngles = var_268_10
			end

			if arg_265_1.time_ >= var_268_5 + var_268_6 and arg_265_1.time_ < var_268_5 + var_268_6 + arg_268_0 then
				var_268_4.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_268_11 = manager.ui.mainCamera.transform.position - var_268_4.position

				var_268_4.forward = Vector3.New(var_268_11.x, var_268_11.y, var_268_11.z)

				local var_268_12 = var_268_4.localEulerAngles

				var_268_12.z = 0
				var_268_12.x = 0
				var_268_4.localEulerAngles = var_268_12
			end

			local var_268_13 = arg_265_1.actors_["10014ui_story"]
			local var_268_14 = 0

			if var_268_14 < arg_265_1.time_ and arg_265_1.time_ <= var_268_14 + arg_268_0 and arg_265_1.var_.characterEffect10014ui_story == nil then
				arg_265_1.var_.characterEffect10014ui_story = var_268_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_15 = 0.200000002980232

			if var_268_14 <= arg_265_1.time_ and arg_265_1.time_ < var_268_14 + var_268_15 then
				local var_268_16 = (arg_265_1.time_ - var_268_14) / var_268_15

				if arg_265_1.var_.characterEffect10014ui_story then
					arg_265_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_14 + var_268_15 and arg_265_1.time_ < var_268_14 + var_268_15 + arg_268_0 and arg_265_1.var_.characterEffect10014ui_story then
				arg_265_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_268_17 = 0

			if var_268_17 < arg_265_1.time_ and arg_265_1.time_ <= var_268_17 + arg_268_0 then
				arg_265_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_268_18 = 0

			if var_268_18 < arg_265_1.time_ and arg_265_1.time_ <= var_268_18 + arg_268_0 then
				arg_265_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_268_19 = arg_265_1.actors_["1095ui_story"].transform
			local var_268_20 = 0

			if var_268_20 < arg_265_1.time_ and arg_265_1.time_ <= var_268_20 + arg_268_0 then
				arg_265_1.var_.moveOldPos1095ui_story = var_268_19.localPosition
			end

			local var_268_21 = 0.001

			if var_268_20 <= arg_265_1.time_ and arg_265_1.time_ < var_268_20 + var_268_21 then
				local var_268_22 = (arg_265_1.time_ - var_268_20) / var_268_21
				local var_268_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_268_19.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1095ui_story, var_268_23, var_268_22)

				local var_268_24 = manager.ui.mainCamera.transform.position - var_268_19.position

				var_268_19.forward = Vector3.New(var_268_24.x, var_268_24.y, var_268_24.z)

				local var_268_25 = var_268_19.localEulerAngles

				var_268_25.z = 0
				var_268_25.x = 0
				var_268_19.localEulerAngles = var_268_25
			end

			if arg_265_1.time_ >= var_268_20 + var_268_21 and arg_265_1.time_ < var_268_20 + var_268_21 + arg_268_0 then
				var_268_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_268_26 = manager.ui.mainCamera.transform.position - var_268_19.position

				var_268_19.forward = Vector3.New(var_268_26.x, var_268_26.y, var_268_26.z)

				local var_268_27 = var_268_19.localEulerAngles

				var_268_27.z = 0
				var_268_27.x = 0
				var_268_19.localEulerAngles = var_268_27
			end

			local var_268_28 = arg_265_1.actors_["1095ui_story"]
			local var_268_29 = 0

			if var_268_29 < arg_265_1.time_ and arg_265_1.time_ <= var_268_29 + arg_268_0 and arg_265_1.var_.characterEffect1095ui_story == nil then
				arg_265_1.var_.characterEffect1095ui_story = var_268_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_30 = 0.200000002980232

			if var_268_29 <= arg_265_1.time_ and arg_265_1.time_ < var_268_29 + var_268_30 then
				local var_268_31 = (arg_265_1.time_ - var_268_29) / var_268_30

				if arg_265_1.var_.characterEffect1095ui_story then
					local var_268_32 = Mathf.Lerp(0, 0.5, var_268_31)

					arg_265_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_265_1.var_.characterEffect1095ui_story.fillRatio = var_268_32
				end
			end

			if arg_265_1.time_ >= var_268_29 + var_268_30 and arg_265_1.time_ < var_268_29 + var_268_30 + arg_268_0 and arg_265_1.var_.characterEffect1095ui_story then
				local var_268_33 = 0.5

				arg_265_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_265_1.var_.characterEffect1095ui_story.fillRatio = var_268_33
			end

			local var_268_34 = 0
			local var_268_35 = 1.1

			if var_268_34 < arg_265_1.time_ and arg_265_1.time_ <= var_268_34 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_36 = arg_265_1:FormatText(StoryNameCfg[264].name)

				arg_265_1.leftNameTxt_.text = var_268_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_37 = arg_265_1:GetWordFromCfg(411041064)
				local var_268_38 = arg_265_1:FormatText(var_268_37.content)

				arg_265_1.text_.text = var_268_38

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_39 = 44
				local var_268_40 = utf8.len(var_268_38)
				local var_268_41 = var_268_39 <= 0 and var_268_35 or var_268_35 * (var_268_40 / var_268_39)

				if var_268_41 > 0 and var_268_35 < var_268_41 then
					arg_265_1.talkMaxDuration = var_268_41

					if var_268_41 + var_268_34 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_41 + var_268_34
					end
				end

				arg_265_1.text_.text = var_268_38
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041064", "story_v_out_411041.awb") ~= 0 then
					local var_268_42 = manager.audio:GetVoiceLength("story_v_out_411041", "411041064", "story_v_out_411041.awb") / 1000

					if var_268_42 + var_268_34 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_42 + var_268_34
					end

					if var_268_37.prefab_name ~= "" and arg_265_1.actors_[var_268_37.prefab_name] ~= nil then
						local var_268_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_37.prefab_name].transform, "story_v_out_411041", "411041064", "story_v_out_411041.awb")

						arg_265_1:RecordAudio("411041064", var_268_43)
						arg_265_1:RecordAudio("411041064", var_268_43)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_411041", "411041064", "story_v_out_411041.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_411041", "411041064", "story_v_out_411041.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_44 = math.max(var_268_35, arg_265_1.talkMaxDuration)

			if var_268_34 <= arg_265_1.time_ and arg_265_1.time_ < var_268_34 + var_268_44 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_34) / var_268_44

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_34 + var_268_44 and arg_265_1.time_ < var_268_34 + var_268_44 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play411041065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 411041065
		arg_269_1.duration_ = 12.9

		local var_269_0 = {
			zh = 8.533,
			ja = 12.9
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
				arg_269_0:Play411041066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 1.025

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[264].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(411041065)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 41
				local var_272_6 = utf8.len(var_272_4)
				local var_272_7 = var_272_5 <= 0 and var_272_1 or var_272_1 * (var_272_6 / var_272_5)

				if var_272_7 > 0 and var_272_1 < var_272_7 then
					arg_269_1.talkMaxDuration = var_272_7

					if var_272_7 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_7 + var_272_0
					end
				end

				arg_269_1.text_.text = var_272_4
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041065", "story_v_out_411041.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041065", "story_v_out_411041.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_411041", "411041065", "story_v_out_411041.awb")

						arg_269_1:RecordAudio("411041065", var_272_9)
						arg_269_1:RecordAudio("411041065", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_411041", "411041065", "story_v_out_411041.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_411041", "411041065", "story_v_out_411041.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_10 = math.max(var_272_1, arg_269_1.talkMaxDuration)

			if var_272_0 <= arg_269_1.time_ and arg_269_1.time_ < var_272_0 + var_272_10 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_0) / var_272_10

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_0 + var_272_10 and arg_269_1.time_ < var_272_0 + var_272_10 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play411041066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 411041066
		arg_273_1.duration_ = 7.2

		local var_273_0 = {
			zh = 6.833,
			ja = 7.2
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
				arg_273_0:Play411041067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1095ui_story"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos1095ui_story = var_276_0.localPosition
			end

			local var_276_2 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2
				local var_276_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1095ui_story, var_276_4, var_276_3)

				local var_276_5 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_5.x, var_276_5.y, var_276_5.z)

				local var_276_6 = var_276_0.localEulerAngles

				var_276_6.z = 0
				var_276_6.x = 0
				var_276_0.localEulerAngles = var_276_6
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 then
				var_276_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_276_7 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_7.x, var_276_7.y, var_276_7.z)

				local var_276_8 = var_276_0.localEulerAngles

				var_276_8.z = 0
				var_276_8.x = 0
				var_276_0.localEulerAngles = var_276_8
			end

			local var_276_9 = arg_273_1.actors_["1095ui_story"]
			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 and arg_273_1.var_.characterEffect1095ui_story == nil then
				arg_273_1.var_.characterEffect1095ui_story = var_276_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_11 = 0.200000002980232

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_11 then
				local var_276_12 = (arg_273_1.time_ - var_276_10) / var_276_11

				if arg_273_1.var_.characterEffect1095ui_story then
					arg_273_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_10 + var_276_11 and arg_273_1.time_ < var_276_10 + var_276_11 + arg_276_0 and arg_273_1.var_.characterEffect1095ui_story then
				arg_273_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_276_13 = 0

			if var_276_13 < arg_273_1.time_ and arg_273_1.time_ <= var_276_13 + arg_276_0 then
				arg_273_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_276_14 = 0

			if var_276_14 < arg_273_1.time_ and arg_273_1.time_ <= var_276_14 + arg_276_0 then
				arg_273_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_276_15 = arg_273_1.actors_["10014ui_story"]
			local var_276_16 = 0

			if var_276_16 < arg_273_1.time_ and arg_273_1.time_ <= var_276_16 + arg_276_0 and arg_273_1.var_.characterEffect10014ui_story == nil then
				arg_273_1.var_.characterEffect10014ui_story = var_276_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_17 = 0.200000002980232

			if var_276_16 <= arg_273_1.time_ and arg_273_1.time_ < var_276_16 + var_276_17 then
				local var_276_18 = (arg_273_1.time_ - var_276_16) / var_276_17

				if arg_273_1.var_.characterEffect10014ui_story then
					local var_276_19 = Mathf.Lerp(0, 0.5, var_276_18)

					arg_273_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_273_1.var_.characterEffect10014ui_story.fillRatio = var_276_19
				end
			end

			if arg_273_1.time_ >= var_276_16 + var_276_17 and arg_273_1.time_ < var_276_16 + var_276_17 + arg_276_0 and arg_273_1.var_.characterEffect10014ui_story then
				local var_276_20 = 0.5

				arg_273_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_273_1.var_.characterEffect10014ui_story.fillRatio = var_276_20
			end

			local var_276_21 = 0
			local var_276_22 = 0.75

			if var_276_21 < arg_273_1.time_ and arg_273_1.time_ <= var_276_21 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_23 = arg_273_1:FormatText(StoryNameCfg[471].name)

				arg_273_1.leftNameTxt_.text = var_276_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_24 = arg_273_1:GetWordFromCfg(411041066)
				local var_276_25 = arg_273_1:FormatText(var_276_24.content)

				arg_273_1.text_.text = var_276_25

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_26 = 30
				local var_276_27 = utf8.len(var_276_25)
				local var_276_28 = var_276_26 <= 0 and var_276_22 or var_276_22 * (var_276_27 / var_276_26)

				if var_276_28 > 0 and var_276_22 < var_276_28 then
					arg_273_1.talkMaxDuration = var_276_28

					if var_276_28 + var_276_21 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_28 + var_276_21
					end
				end

				arg_273_1.text_.text = var_276_25
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041066", "story_v_out_411041.awb") ~= 0 then
					local var_276_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041066", "story_v_out_411041.awb") / 1000

					if var_276_29 + var_276_21 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_29 + var_276_21
					end

					if var_276_24.prefab_name ~= "" and arg_273_1.actors_[var_276_24.prefab_name] ~= nil then
						local var_276_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_24.prefab_name].transform, "story_v_out_411041", "411041066", "story_v_out_411041.awb")

						arg_273_1:RecordAudio("411041066", var_276_30)
						arg_273_1:RecordAudio("411041066", var_276_30)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_411041", "411041066", "story_v_out_411041.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_411041", "411041066", "story_v_out_411041.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_31 = math.max(var_276_22, arg_273_1.talkMaxDuration)

			if var_276_21 <= arg_273_1.time_ and arg_273_1.time_ < var_276_21 + var_276_31 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_21) / var_276_31

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_21 + var_276_31 and arg_273_1.time_ < var_276_21 + var_276_31 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play411041067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 411041067
		arg_277_1.duration_ = 6

		local var_277_0 = {
			zh = 6,
			ja = 3.6
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
				arg_277_0:Play411041068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1095ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect1095ui_story == nil then
				arg_277_1.var_.characterEffect1095ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.200000002980232

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect1095ui_story then
					local var_280_4 = Mathf.Lerp(0, 0.5, var_280_3)

					arg_277_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_277_1.var_.characterEffect1095ui_story.fillRatio = var_280_4
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect1095ui_story then
				local var_280_5 = 0.5

				arg_277_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_277_1.var_.characterEffect1095ui_story.fillRatio = var_280_5
			end

			local var_280_6 = arg_277_1.actors_["10014ui_story"]
			local var_280_7 = 0

			if var_280_7 < arg_277_1.time_ and arg_277_1.time_ <= var_280_7 + arg_280_0 and arg_277_1.var_.characterEffect10014ui_story == nil then
				arg_277_1.var_.characterEffect10014ui_story = var_280_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_8 = 0.200000002980232

			if var_280_7 <= arg_277_1.time_ and arg_277_1.time_ < var_280_7 + var_280_8 then
				local var_280_9 = (arg_277_1.time_ - var_280_7) / var_280_8

				if arg_277_1.var_.characterEffect10014ui_story then
					arg_277_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_7 + var_280_8 and arg_277_1.time_ < var_280_7 + var_280_8 + arg_280_0 and arg_277_1.var_.characterEffect10014ui_story then
				arg_277_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_280_10 = 0
			local var_280_11 = 0.775

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_12 = arg_277_1:FormatText(StoryNameCfg[264].name)

				arg_277_1.leftNameTxt_.text = var_280_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_13 = arg_277_1:GetWordFromCfg(411041067)
				local var_280_14 = arg_277_1:FormatText(var_280_13.content)

				arg_277_1.text_.text = var_280_14

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_15 = 31
				local var_280_16 = utf8.len(var_280_14)
				local var_280_17 = var_280_15 <= 0 and var_280_11 or var_280_11 * (var_280_16 / var_280_15)

				if var_280_17 > 0 and var_280_11 < var_280_17 then
					arg_277_1.talkMaxDuration = var_280_17

					if var_280_17 + var_280_10 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_17 + var_280_10
					end
				end

				arg_277_1.text_.text = var_280_14
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041067", "story_v_out_411041.awb") ~= 0 then
					local var_280_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041067", "story_v_out_411041.awb") / 1000

					if var_280_18 + var_280_10 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_18 + var_280_10
					end

					if var_280_13.prefab_name ~= "" and arg_277_1.actors_[var_280_13.prefab_name] ~= nil then
						local var_280_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_13.prefab_name].transform, "story_v_out_411041", "411041067", "story_v_out_411041.awb")

						arg_277_1:RecordAudio("411041067", var_280_19)
						arg_277_1:RecordAudio("411041067", var_280_19)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_411041", "411041067", "story_v_out_411041.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_411041", "411041067", "story_v_out_411041.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_20 = math.max(var_280_11, arg_277_1.talkMaxDuration)

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_20 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_10) / var_280_20

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_10 + var_280_20 and arg_277_1.time_ < var_280_10 + var_280_20 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play411041068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 411041068
		arg_281_1.duration_ = 3.133

		local var_281_0 = {
			zh = 2.7,
			ja = 3.133
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
				arg_281_0:Play411041069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1095ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect1095ui_story == nil then
				arg_281_1.var_.characterEffect1095ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.200000002980232

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect1095ui_story then
					arg_281_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1095ui_story then
				arg_281_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_284_4 = arg_281_1.actors_["10014ui_story"]
			local var_284_5 = 0

			if var_284_5 < arg_281_1.time_ and arg_281_1.time_ <= var_284_5 + arg_284_0 and arg_281_1.var_.characterEffect10014ui_story == nil then
				arg_281_1.var_.characterEffect10014ui_story = var_284_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_6 = 0.200000002980232

			if var_284_5 <= arg_281_1.time_ and arg_281_1.time_ < var_284_5 + var_284_6 then
				local var_284_7 = (arg_281_1.time_ - var_284_5) / var_284_6

				if arg_281_1.var_.characterEffect10014ui_story then
					local var_284_8 = Mathf.Lerp(0, 0.5, var_284_7)

					arg_281_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_281_1.var_.characterEffect10014ui_story.fillRatio = var_284_8
				end
			end

			if arg_281_1.time_ >= var_284_5 + var_284_6 and arg_281_1.time_ < var_284_5 + var_284_6 + arg_284_0 and arg_281_1.var_.characterEffect10014ui_story then
				local var_284_9 = 0.5

				arg_281_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_281_1.var_.characterEffect10014ui_story.fillRatio = var_284_9
			end

			local var_284_10 = 0
			local var_284_11 = 0.35

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_12 = arg_281_1:FormatText(StoryNameCfg[471].name)

				arg_281_1.leftNameTxt_.text = var_284_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_13 = arg_281_1:GetWordFromCfg(411041068)
				local var_284_14 = arg_281_1:FormatText(var_284_13.content)

				arg_281_1.text_.text = var_284_14

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_15 = 14
				local var_284_16 = utf8.len(var_284_14)
				local var_284_17 = var_284_15 <= 0 and var_284_11 or var_284_11 * (var_284_16 / var_284_15)

				if var_284_17 > 0 and var_284_11 < var_284_17 then
					arg_281_1.talkMaxDuration = var_284_17

					if var_284_17 + var_284_10 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_17 + var_284_10
					end
				end

				arg_281_1.text_.text = var_284_14
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041068", "story_v_out_411041.awb") ~= 0 then
					local var_284_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041068", "story_v_out_411041.awb") / 1000

					if var_284_18 + var_284_10 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_18 + var_284_10
					end

					if var_284_13.prefab_name ~= "" and arg_281_1.actors_[var_284_13.prefab_name] ~= nil then
						local var_284_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_13.prefab_name].transform, "story_v_out_411041", "411041068", "story_v_out_411041.awb")

						arg_281_1:RecordAudio("411041068", var_284_19)
						arg_281_1:RecordAudio("411041068", var_284_19)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_411041", "411041068", "story_v_out_411041.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_411041", "411041068", "story_v_out_411041.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_20 = math.max(var_284_11, arg_281_1.talkMaxDuration)

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_20 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_10) / var_284_20

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_10 + var_284_20 and arg_281_1.time_ < var_284_10 + var_284_20 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play411041069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 411041069
		arg_285_1.duration_ = 4.866

		local var_285_0 = {
			zh = 4.866,
			ja = 1.999999999999
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
				arg_285_0:Play411041070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["10014ui_story"].transform
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.var_.moveOldPos10014ui_story = var_288_0.localPosition
			end

			local var_288_2 = 0.001

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2
				local var_288_4 = Vector3.New(0.7, -1.06, -6.2)

				var_288_0.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos10014ui_story, var_288_4, var_288_3)

				local var_288_5 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_5.x, var_288_5.y, var_288_5.z)

				local var_288_6 = var_288_0.localEulerAngles

				var_288_6.z = 0
				var_288_6.x = 0
				var_288_0.localEulerAngles = var_288_6
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 then
				var_288_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_288_7 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_7.x, var_288_7.y, var_288_7.z)

				local var_288_8 = var_288_0.localEulerAngles

				var_288_8.z = 0
				var_288_8.x = 0
				var_288_0.localEulerAngles = var_288_8
			end

			local var_288_9 = arg_285_1.actors_["10014ui_story"]
			local var_288_10 = 0

			if var_288_10 < arg_285_1.time_ and arg_285_1.time_ <= var_288_10 + arg_288_0 and arg_285_1.var_.characterEffect10014ui_story == nil then
				arg_285_1.var_.characterEffect10014ui_story = var_288_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_11 = 0.200000002980232

			if var_288_10 <= arg_285_1.time_ and arg_285_1.time_ < var_288_10 + var_288_11 then
				local var_288_12 = (arg_285_1.time_ - var_288_10) / var_288_11

				if arg_285_1.var_.characterEffect10014ui_story then
					arg_285_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_285_1.time_ >= var_288_10 + var_288_11 and arg_285_1.time_ < var_288_10 + var_288_11 + arg_288_0 and arg_285_1.var_.characterEffect10014ui_story then
				arg_285_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_288_13 = 0

			if var_288_13 < arg_285_1.time_ and arg_285_1.time_ <= var_288_13 + arg_288_0 then
				arg_285_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_288_14 = 0

			if var_288_14 < arg_285_1.time_ and arg_285_1.time_ <= var_288_14 + arg_288_0 then
				arg_285_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_288_15 = arg_285_1.actors_["1095ui_story"]
			local var_288_16 = 0

			if var_288_16 < arg_285_1.time_ and arg_285_1.time_ <= var_288_16 + arg_288_0 and arg_285_1.var_.characterEffect1095ui_story == nil then
				arg_285_1.var_.characterEffect1095ui_story = var_288_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_17 = 0.200000002980232

			if var_288_16 <= arg_285_1.time_ and arg_285_1.time_ < var_288_16 + var_288_17 then
				local var_288_18 = (arg_285_1.time_ - var_288_16) / var_288_17

				if arg_285_1.var_.characterEffect1095ui_story then
					local var_288_19 = Mathf.Lerp(0, 0.5, var_288_18)

					arg_285_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_285_1.var_.characterEffect1095ui_story.fillRatio = var_288_19
				end
			end

			if arg_285_1.time_ >= var_288_16 + var_288_17 and arg_285_1.time_ < var_288_16 + var_288_17 + arg_288_0 and arg_285_1.var_.characterEffect1095ui_story then
				local var_288_20 = 0.5

				arg_285_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_285_1.var_.characterEffect1095ui_story.fillRatio = var_288_20
			end

			local var_288_21 = 0
			local var_288_22 = 0.575

			if var_288_21 < arg_285_1.time_ and arg_285_1.time_ <= var_288_21 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_23 = arg_285_1:FormatText(StoryNameCfg[264].name)

				arg_285_1.leftNameTxt_.text = var_288_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_24 = arg_285_1:GetWordFromCfg(411041069)
				local var_288_25 = arg_285_1:FormatText(var_288_24.content)

				arg_285_1.text_.text = var_288_25

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_26 = 23
				local var_288_27 = utf8.len(var_288_25)
				local var_288_28 = var_288_26 <= 0 and var_288_22 or var_288_22 * (var_288_27 / var_288_26)

				if var_288_28 > 0 and var_288_22 < var_288_28 then
					arg_285_1.talkMaxDuration = var_288_28

					if var_288_28 + var_288_21 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_28 + var_288_21
					end
				end

				arg_285_1.text_.text = var_288_25
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041069", "story_v_out_411041.awb") ~= 0 then
					local var_288_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041069", "story_v_out_411041.awb") / 1000

					if var_288_29 + var_288_21 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_29 + var_288_21
					end

					if var_288_24.prefab_name ~= "" and arg_285_1.actors_[var_288_24.prefab_name] ~= nil then
						local var_288_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_24.prefab_name].transform, "story_v_out_411041", "411041069", "story_v_out_411041.awb")

						arg_285_1:RecordAudio("411041069", var_288_30)
						arg_285_1:RecordAudio("411041069", var_288_30)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_411041", "411041069", "story_v_out_411041.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_411041", "411041069", "story_v_out_411041.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_31 = math.max(var_288_22, arg_285_1.talkMaxDuration)

			if var_288_21 <= arg_285_1.time_ and arg_285_1.time_ < var_288_21 + var_288_31 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_21) / var_288_31

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_21 + var_288_31 and arg_285_1.time_ < var_288_21 + var_288_31 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play411041070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 411041070
		arg_289_1.duration_ = 3.833

		local var_289_0 = {
			zh = 3.033,
			ja = 3.833
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
				arg_289_0:Play411041071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["1095ui_story"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos1095ui_story = var_292_0.localPosition
			end

			local var_292_2 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2
				local var_292_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1095ui_story, var_292_4, var_292_3)

				local var_292_5 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_5.x, var_292_5.y, var_292_5.z)

				local var_292_6 = var_292_0.localEulerAngles

				var_292_6.z = 0
				var_292_6.x = 0
				var_292_0.localEulerAngles = var_292_6
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_292_7 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_7.x, var_292_7.y, var_292_7.z)

				local var_292_8 = var_292_0.localEulerAngles

				var_292_8.z = 0
				var_292_8.x = 0
				var_292_0.localEulerAngles = var_292_8
			end

			local var_292_9 = arg_289_1.actors_["1095ui_story"]
			local var_292_10 = 0

			if var_292_10 < arg_289_1.time_ and arg_289_1.time_ <= var_292_10 + arg_292_0 and arg_289_1.var_.characterEffect1095ui_story == nil then
				arg_289_1.var_.characterEffect1095ui_story = var_292_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_11 = 0.200000002980232

			if var_292_10 <= arg_289_1.time_ and arg_289_1.time_ < var_292_10 + var_292_11 then
				local var_292_12 = (arg_289_1.time_ - var_292_10) / var_292_11

				if arg_289_1.var_.characterEffect1095ui_story then
					arg_289_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_289_1.time_ >= var_292_10 + var_292_11 and arg_289_1.time_ < var_292_10 + var_292_11 + arg_292_0 and arg_289_1.var_.characterEffect1095ui_story then
				arg_289_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_292_13 = 0

			if var_292_13 < arg_289_1.time_ and arg_289_1.time_ <= var_292_13 + arg_292_0 then
				arg_289_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_292_14 = 0

			if var_292_14 < arg_289_1.time_ and arg_289_1.time_ <= var_292_14 + arg_292_0 then
				arg_289_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_292_15 = arg_289_1.actors_["10014ui_story"]
			local var_292_16 = 0

			if var_292_16 < arg_289_1.time_ and arg_289_1.time_ <= var_292_16 + arg_292_0 and arg_289_1.var_.characterEffect10014ui_story == nil then
				arg_289_1.var_.characterEffect10014ui_story = var_292_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_17 = 0.200000002980232

			if var_292_16 <= arg_289_1.time_ and arg_289_1.time_ < var_292_16 + var_292_17 then
				local var_292_18 = (arg_289_1.time_ - var_292_16) / var_292_17

				if arg_289_1.var_.characterEffect10014ui_story then
					local var_292_19 = Mathf.Lerp(0, 0.5, var_292_18)

					arg_289_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_289_1.var_.characterEffect10014ui_story.fillRatio = var_292_19
				end
			end

			if arg_289_1.time_ >= var_292_16 + var_292_17 and arg_289_1.time_ < var_292_16 + var_292_17 + arg_292_0 and arg_289_1.var_.characterEffect10014ui_story then
				local var_292_20 = 0.5

				arg_289_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_289_1.var_.characterEffect10014ui_story.fillRatio = var_292_20
			end

			local var_292_21 = 0
			local var_292_22 = 0.4

			if var_292_21 < arg_289_1.time_ and arg_289_1.time_ <= var_292_21 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_23 = arg_289_1:FormatText(StoryNameCfg[471].name)

				arg_289_1.leftNameTxt_.text = var_292_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_24 = arg_289_1:GetWordFromCfg(411041070)
				local var_292_25 = arg_289_1:FormatText(var_292_24.content)

				arg_289_1.text_.text = var_292_25

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_26 = 16
				local var_292_27 = utf8.len(var_292_25)
				local var_292_28 = var_292_26 <= 0 and var_292_22 or var_292_22 * (var_292_27 / var_292_26)

				if var_292_28 > 0 and var_292_22 < var_292_28 then
					arg_289_1.talkMaxDuration = var_292_28

					if var_292_28 + var_292_21 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_28 + var_292_21
					end
				end

				arg_289_1.text_.text = var_292_25
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041070", "story_v_out_411041.awb") ~= 0 then
					local var_292_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041070", "story_v_out_411041.awb") / 1000

					if var_292_29 + var_292_21 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_29 + var_292_21
					end

					if var_292_24.prefab_name ~= "" and arg_289_1.actors_[var_292_24.prefab_name] ~= nil then
						local var_292_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_24.prefab_name].transform, "story_v_out_411041", "411041070", "story_v_out_411041.awb")

						arg_289_1:RecordAudio("411041070", var_292_30)
						arg_289_1:RecordAudio("411041070", var_292_30)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_411041", "411041070", "story_v_out_411041.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_411041", "411041070", "story_v_out_411041.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_31 = math.max(var_292_22, arg_289_1.talkMaxDuration)

			if var_292_21 <= arg_289_1.time_ and arg_289_1.time_ < var_292_21 + var_292_31 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_21) / var_292_31

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_21 + var_292_31 and arg_289_1.time_ < var_292_21 + var_292_31 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play411041071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 411041071
		arg_293_1.duration_ = 7.633

		local var_293_0 = {
			zh = 7.2,
			ja = 7.633
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play411041072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["10014ui_story"].transform
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				arg_293_1.var_.moveOldPos10014ui_story = var_296_0.localPosition
			end

			local var_296_2 = 0.001

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2
				local var_296_4 = Vector3.New(0.7, -1.06, -6.2)

				var_296_0.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos10014ui_story, var_296_4, var_296_3)

				local var_296_5 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_5.x, var_296_5.y, var_296_5.z)

				local var_296_6 = var_296_0.localEulerAngles

				var_296_6.z = 0
				var_296_6.x = 0
				var_296_0.localEulerAngles = var_296_6
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 then
				var_296_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_296_7 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_7.x, var_296_7.y, var_296_7.z)

				local var_296_8 = var_296_0.localEulerAngles

				var_296_8.z = 0
				var_296_8.x = 0
				var_296_0.localEulerAngles = var_296_8
			end

			local var_296_9 = arg_293_1.actors_["10014ui_story"]
			local var_296_10 = 0

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 and arg_293_1.var_.characterEffect10014ui_story == nil then
				arg_293_1.var_.characterEffect10014ui_story = var_296_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_11 = 0.200000002980232

			if var_296_10 <= arg_293_1.time_ and arg_293_1.time_ < var_296_10 + var_296_11 then
				local var_296_12 = (arg_293_1.time_ - var_296_10) / var_296_11

				if arg_293_1.var_.characterEffect10014ui_story then
					arg_293_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_10 + var_296_11 and arg_293_1.time_ < var_296_10 + var_296_11 + arg_296_0 and arg_293_1.var_.characterEffect10014ui_story then
				arg_293_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_296_13 = 0

			if var_296_13 < arg_293_1.time_ and arg_293_1.time_ <= var_296_13 + arg_296_0 then
				arg_293_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_1")
			end

			local var_296_14 = 0

			if var_296_14 < arg_293_1.time_ and arg_293_1.time_ <= var_296_14 + arg_296_0 then
				arg_293_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_296_15 = arg_293_1.actors_["1095ui_story"]
			local var_296_16 = 0

			if var_296_16 < arg_293_1.time_ and arg_293_1.time_ <= var_296_16 + arg_296_0 and arg_293_1.var_.characterEffect1095ui_story == nil then
				arg_293_1.var_.characterEffect1095ui_story = var_296_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_17 = 0.200000002980232

			if var_296_16 <= arg_293_1.time_ and arg_293_1.time_ < var_296_16 + var_296_17 then
				local var_296_18 = (arg_293_1.time_ - var_296_16) / var_296_17

				if arg_293_1.var_.characterEffect1095ui_story then
					local var_296_19 = Mathf.Lerp(0, 0.5, var_296_18)

					arg_293_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_293_1.var_.characterEffect1095ui_story.fillRatio = var_296_19
				end
			end

			if arg_293_1.time_ >= var_296_16 + var_296_17 and arg_293_1.time_ < var_296_16 + var_296_17 + arg_296_0 and arg_293_1.var_.characterEffect1095ui_story then
				local var_296_20 = 0.5

				arg_293_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_293_1.var_.characterEffect1095ui_story.fillRatio = var_296_20
			end

			local var_296_21 = 0
			local var_296_22 = 0.7

			if var_296_21 < arg_293_1.time_ and arg_293_1.time_ <= var_296_21 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_23 = arg_293_1:FormatText(StoryNameCfg[264].name)

				arg_293_1.leftNameTxt_.text = var_296_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_24 = arg_293_1:GetWordFromCfg(411041071)
				local var_296_25 = arg_293_1:FormatText(var_296_24.content)

				arg_293_1.text_.text = var_296_25

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_26 = 28
				local var_296_27 = utf8.len(var_296_25)
				local var_296_28 = var_296_26 <= 0 and var_296_22 or var_296_22 * (var_296_27 / var_296_26)

				if var_296_28 > 0 and var_296_22 < var_296_28 then
					arg_293_1.talkMaxDuration = var_296_28

					if var_296_28 + var_296_21 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_28 + var_296_21
					end
				end

				arg_293_1.text_.text = var_296_25
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041071", "story_v_out_411041.awb") ~= 0 then
					local var_296_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041071", "story_v_out_411041.awb") / 1000

					if var_296_29 + var_296_21 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_29 + var_296_21
					end

					if var_296_24.prefab_name ~= "" and arg_293_1.actors_[var_296_24.prefab_name] ~= nil then
						local var_296_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_24.prefab_name].transform, "story_v_out_411041", "411041071", "story_v_out_411041.awb")

						arg_293_1:RecordAudio("411041071", var_296_30)
						arg_293_1:RecordAudio("411041071", var_296_30)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_411041", "411041071", "story_v_out_411041.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_411041", "411041071", "story_v_out_411041.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_31 = math.max(var_296_22, arg_293_1.talkMaxDuration)

			if var_296_21 <= arg_293_1.time_ and arg_293_1.time_ < var_296_21 + var_296_31 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_21) / var_296_31

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_21 + var_296_31 and arg_293_1.time_ < var_296_21 + var_296_31 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play411041072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 411041072
		arg_297_1.duration_ = 7.6

		local var_297_0 = {
			zh = 7.6,
			ja = 5.366
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
				arg_297_0:Play411041073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.95

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[264].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(411041072)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041072", "story_v_out_411041.awb") ~= 0 then
					local var_300_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041072", "story_v_out_411041.awb") / 1000

					if var_300_8 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_8 + var_300_0
					end

					if var_300_3.prefab_name ~= "" and arg_297_1.actors_[var_300_3.prefab_name] ~= nil then
						local var_300_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_3.prefab_name].transform, "story_v_out_411041", "411041072", "story_v_out_411041.awb")

						arg_297_1:RecordAudio("411041072", var_300_9)
						arg_297_1:RecordAudio("411041072", var_300_9)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_411041", "411041072", "story_v_out_411041.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_411041", "411041072", "story_v_out_411041.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_10 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_10 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_10

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_10 and arg_297_1.time_ < var_300_0 + var_300_10 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play411041073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 411041073
		arg_301_1.duration_ = 7.6

		local var_301_0 = {
			zh = 4.933,
			ja = 7.6
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
				arg_301_0:Play411041074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.6

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[264].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(411041073)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 24
				local var_304_6 = utf8.len(var_304_4)
				local var_304_7 = var_304_5 <= 0 and var_304_1 or var_304_1 * (var_304_6 / var_304_5)

				if var_304_7 > 0 and var_304_1 < var_304_7 then
					arg_301_1.talkMaxDuration = var_304_7

					if var_304_7 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_7 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_4
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041073", "story_v_out_411041.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041073", "story_v_out_411041.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_out_411041", "411041073", "story_v_out_411041.awb")

						arg_301_1:RecordAudio("411041073", var_304_9)
						arg_301_1:RecordAudio("411041073", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_411041", "411041073", "story_v_out_411041.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_411041", "411041073", "story_v_out_411041.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_10 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_10 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_10

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_10 and arg_301_1.time_ < var_304_0 + var_304_10 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play411041074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 411041074
		arg_305_1.duration_ = 7.833

		local var_305_0 = {
			zh = 6.566,
			ja = 7.833
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
				arg_305_0:Play411041075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.875

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[264].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(411041074)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041074", "story_v_out_411041.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041074", "story_v_out_411041.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_411041", "411041074", "story_v_out_411041.awb")

						arg_305_1:RecordAudio("411041074", var_308_9)
						arg_305_1:RecordAudio("411041074", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_411041", "411041074", "story_v_out_411041.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_411041", "411041074", "story_v_out_411041.awb")
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
	Play411041075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 411041075
		arg_309_1.duration_ = 4.033

		local var_309_0 = {
			zh = 2,
			ja = 4.033
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
				arg_309_0:Play411041076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1095ui_story"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.characterEffect1095ui_story == nil then
				arg_309_1.var_.characterEffect1095ui_story = var_312_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_2 = 0.200000002980232

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.characterEffect1095ui_story then
					arg_309_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.characterEffect1095ui_story then
				arg_309_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_312_4 = 0

			if var_312_4 < arg_309_1.time_ and arg_309_1.time_ <= var_312_4 + arg_312_0 then
				arg_309_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action5_1")
			end

			local var_312_5 = 0

			if var_312_5 < arg_309_1.time_ and arg_309_1.time_ <= var_312_5 + arg_312_0 then
				arg_309_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_312_6 = arg_309_1.actors_["10014ui_story"]
			local var_312_7 = 0

			if var_312_7 < arg_309_1.time_ and arg_309_1.time_ <= var_312_7 + arg_312_0 and arg_309_1.var_.characterEffect10014ui_story == nil then
				arg_309_1.var_.characterEffect10014ui_story = var_312_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_8 = 0.200000002980232

			if var_312_7 <= arg_309_1.time_ and arg_309_1.time_ < var_312_7 + var_312_8 then
				local var_312_9 = (arg_309_1.time_ - var_312_7) / var_312_8

				if arg_309_1.var_.characterEffect10014ui_story then
					local var_312_10 = Mathf.Lerp(0, 0.5, var_312_9)

					arg_309_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_309_1.var_.characterEffect10014ui_story.fillRatio = var_312_10
				end
			end

			if arg_309_1.time_ >= var_312_7 + var_312_8 and arg_309_1.time_ < var_312_7 + var_312_8 + arg_312_0 and arg_309_1.var_.characterEffect10014ui_story then
				local var_312_11 = 0.5

				arg_309_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_309_1.var_.characterEffect10014ui_story.fillRatio = var_312_11
			end

			local var_312_12 = 0
			local var_312_13 = 0.25

			if var_312_12 < arg_309_1.time_ and arg_309_1.time_ <= var_312_12 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_14 = arg_309_1:FormatText(StoryNameCfg[471].name)

				arg_309_1.leftNameTxt_.text = var_312_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_15 = arg_309_1:GetWordFromCfg(411041075)
				local var_312_16 = arg_309_1:FormatText(var_312_15.content)

				arg_309_1.text_.text = var_312_16

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_17 = 10
				local var_312_18 = utf8.len(var_312_16)
				local var_312_19 = var_312_17 <= 0 and var_312_13 or var_312_13 * (var_312_18 / var_312_17)

				if var_312_19 > 0 and var_312_13 < var_312_19 then
					arg_309_1.talkMaxDuration = var_312_19

					if var_312_19 + var_312_12 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_19 + var_312_12
					end
				end

				arg_309_1.text_.text = var_312_16
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041075", "story_v_out_411041.awb") ~= 0 then
					local var_312_20 = manager.audio:GetVoiceLength("story_v_out_411041", "411041075", "story_v_out_411041.awb") / 1000

					if var_312_20 + var_312_12 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_20 + var_312_12
					end

					if var_312_15.prefab_name ~= "" and arg_309_1.actors_[var_312_15.prefab_name] ~= nil then
						local var_312_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_15.prefab_name].transform, "story_v_out_411041", "411041075", "story_v_out_411041.awb")

						arg_309_1:RecordAudio("411041075", var_312_21)
						arg_309_1:RecordAudio("411041075", var_312_21)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_411041", "411041075", "story_v_out_411041.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_411041", "411041075", "story_v_out_411041.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_22 = math.max(var_312_13, arg_309_1.talkMaxDuration)

			if var_312_12 <= arg_309_1.time_ and arg_309_1.time_ < var_312_12 + var_312_22 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_12) / var_312_22

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_12 + var_312_22 and arg_309_1.time_ < var_312_12 + var_312_22 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play411041076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 411041076
		arg_313_1.duration_ = 6.066

		local var_313_0 = {
			zh = 2.366,
			ja = 6.066
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play411041077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["10014ui_story"].transform
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 then
				arg_313_1.var_.moveOldPos10014ui_story = var_316_0.localPosition
			end

			local var_316_2 = 0.001

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2
				local var_316_4 = Vector3.New(0.7, -1.06, -6.2)

				var_316_0.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos10014ui_story, var_316_4, var_316_3)

				local var_316_5 = manager.ui.mainCamera.transform.position - var_316_0.position

				var_316_0.forward = Vector3.New(var_316_5.x, var_316_5.y, var_316_5.z)

				local var_316_6 = var_316_0.localEulerAngles

				var_316_6.z = 0
				var_316_6.x = 0
				var_316_0.localEulerAngles = var_316_6
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 then
				var_316_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_316_7 = manager.ui.mainCamera.transform.position - var_316_0.position

				var_316_0.forward = Vector3.New(var_316_7.x, var_316_7.y, var_316_7.z)

				local var_316_8 = var_316_0.localEulerAngles

				var_316_8.z = 0
				var_316_8.x = 0
				var_316_0.localEulerAngles = var_316_8
			end

			local var_316_9 = arg_313_1.actors_["10014ui_story"]
			local var_316_10 = 0

			if var_316_10 < arg_313_1.time_ and arg_313_1.time_ <= var_316_10 + arg_316_0 and arg_313_1.var_.characterEffect10014ui_story == nil then
				arg_313_1.var_.characterEffect10014ui_story = var_316_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_11 = 0.200000002980232

			if var_316_10 <= arg_313_1.time_ and arg_313_1.time_ < var_316_10 + var_316_11 then
				local var_316_12 = (arg_313_1.time_ - var_316_10) / var_316_11

				if arg_313_1.var_.characterEffect10014ui_story then
					arg_313_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_313_1.time_ >= var_316_10 + var_316_11 and arg_313_1.time_ < var_316_10 + var_316_11 + arg_316_0 and arg_313_1.var_.characterEffect10014ui_story then
				arg_313_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_316_13 = 0

			if var_316_13 < arg_313_1.time_ and arg_313_1.time_ <= var_316_13 + arg_316_0 then
				arg_313_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014actionlink/10014action434")
			end

			local var_316_14 = 0

			if var_316_14 < arg_313_1.time_ and arg_313_1.time_ <= var_316_14 + arg_316_0 then
				arg_313_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_316_15 = arg_313_1.actors_["1095ui_story"]
			local var_316_16 = 0

			if var_316_16 < arg_313_1.time_ and arg_313_1.time_ <= var_316_16 + arg_316_0 and arg_313_1.var_.characterEffect1095ui_story == nil then
				arg_313_1.var_.characterEffect1095ui_story = var_316_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_17 = 0.200000002980232

			if var_316_16 <= arg_313_1.time_ and arg_313_1.time_ < var_316_16 + var_316_17 then
				local var_316_18 = (arg_313_1.time_ - var_316_16) / var_316_17

				if arg_313_1.var_.characterEffect1095ui_story then
					local var_316_19 = Mathf.Lerp(0, 0.5, var_316_18)

					arg_313_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1095ui_story.fillRatio = var_316_19
				end
			end

			if arg_313_1.time_ >= var_316_16 + var_316_17 and arg_313_1.time_ < var_316_16 + var_316_17 + arg_316_0 and arg_313_1.var_.characterEffect1095ui_story then
				local var_316_20 = 0.5

				arg_313_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1095ui_story.fillRatio = var_316_20
			end

			local var_316_21 = 0
			local var_316_22 = 0.275

			if var_316_21 < arg_313_1.time_ and arg_313_1.time_ <= var_316_21 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_23 = arg_313_1:FormatText(StoryNameCfg[264].name)

				arg_313_1.leftNameTxt_.text = var_316_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_24 = arg_313_1:GetWordFromCfg(411041076)
				local var_316_25 = arg_313_1:FormatText(var_316_24.content)

				arg_313_1.text_.text = var_316_25

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_26 = 11
				local var_316_27 = utf8.len(var_316_25)
				local var_316_28 = var_316_26 <= 0 and var_316_22 or var_316_22 * (var_316_27 / var_316_26)

				if var_316_28 > 0 and var_316_22 < var_316_28 then
					arg_313_1.talkMaxDuration = var_316_28

					if var_316_28 + var_316_21 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_28 + var_316_21
					end
				end

				arg_313_1.text_.text = var_316_25
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041076", "story_v_out_411041.awb") ~= 0 then
					local var_316_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041076", "story_v_out_411041.awb") / 1000

					if var_316_29 + var_316_21 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_29 + var_316_21
					end

					if var_316_24.prefab_name ~= "" and arg_313_1.actors_[var_316_24.prefab_name] ~= nil then
						local var_316_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_24.prefab_name].transform, "story_v_out_411041", "411041076", "story_v_out_411041.awb")

						arg_313_1:RecordAudio("411041076", var_316_30)
						arg_313_1:RecordAudio("411041076", var_316_30)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_411041", "411041076", "story_v_out_411041.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_411041", "411041076", "story_v_out_411041.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_31 = math.max(var_316_22, arg_313_1.talkMaxDuration)

			if var_316_21 <= arg_313_1.time_ and arg_313_1.time_ < var_316_21 + var_316_31 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_21) / var_316_31

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_21 + var_316_31 and arg_313_1.time_ < var_316_21 + var_316_31 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play411041077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 411041077
		arg_317_1.duration_ = 13.966

		local var_317_0 = {
			zh = 13.966,
			ja = 13.833
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
				arg_317_0:Play411041078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10014ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect10014ui_story == nil then
				arg_317_1.var_.characterEffect10014ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.200000002980232

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect10014ui_story then
					local var_320_4 = Mathf.Lerp(0, 0.5, var_320_3)

					arg_317_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_317_1.var_.characterEffect10014ui_story.fillRatio = var_320_4
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect10014ui_story then
				local var_320_5 = 0.5

				arg_317_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_317_1.var_.characterEffect10014ui_story.fillRatio = var_320_5
			end

			local var_320_6 = arg_317_1.actors_["1095ui_story"]
			local var_320_7 = 0

			if var_320_7 < arg_317_1.time_ and arg_317_1.time_ <= var_320_7 + arg_320_0 and arg_317_1.var_.characterEffect1095ui_story == nil then
				arg_317_1.var_.characterEffect1095ui_story = var_320_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_8 = 0.200000002980232

			if var_320_7 <= arg_317_1.time_ and arg_317_1.time_ < var_320_7 + var_320_8 then
				local var_320_9 = (arg_317_1.time_ - var_320_7) / var_320_8

				if arg_317_1.var_.characterEffect1095ui_story then
					arg_317_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_7 + var_320_8 and arg_317_1.time_ < var_320_7 + var_320_8 + arg_320_0 and arg_317_1.var_.characterEffect1095ui_story then
				arg_317_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_320_10 = 0
			local var_320_11 = 1.45

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_12 = arg_317_1:FormatText(StoryNameCfg[471].name)

				arg_317_1.leftNameTxt_.text = var_320_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_13 = arg_317_1:GetWordFromCfg(411041077)
				local var_320_14 = arg_317_1:FormatText(var_320_13.content)

				arg_317_1.text_.text = var_320_14

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_15 = 58
				local var_320_16 = utf8.len(var_320_14)
				local var_320_17 = var_320_15 <= 0 and var_320_11 or var_320_11 * (var_320_16 / var_320_15)

				if var_320_17 > 0 and var_320_11 < var_320_17 then
					arg_317_1.talkMaxDuration = var_320_17

					if var_320_17 + var_320_10 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_17 + var_320_10
					end
				end

				arg_317_1.text_.text = var_320_14
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041077", "story_v_out_411041.awb") ~= 0 then
					local var_320_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041077", "story_v_out_411041.awb") / 1000

					if var_320_18 + var_320_10 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_18 + var_320_10
					end

					if var_320_13.prefab_name ~= "" and arg_317_1.actors_[var_320_13.prefab_name] ~= nil then
						local var_320_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_13.prefab_name].transform, "story_v_out_411041", "411041077", "story_v_out_411041.awb")

						arg_317_1:RecordAudio("411041077", var_320_19)
						arg_317_1:RecordAudio("411041077", var_320_19)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_411041", "411041077", "story_v_out_411041.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_411041", "411041077", "story_v_out_411041.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_20 = math.max(var_320_11, arg_317_1.talkMaxDuration)

			if var_320_10 <= arg_317_1.time_ and arg_317_1.time_ < var_320_10 + var_320_20 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_10) / var_320_20

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_10 + var_320_20 and arg_317_1.time_ < var_320_10 + var_320_20 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play411041078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 411041078
		arg_321_1.duration_ = 10.7

		local var_321_0 = {
			zh = 10.7,
			ja = 10.033
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play411041079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1095ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect1095ui_story == nil then
				arg_321_1.var_.characterEffect1095ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.200000002980232

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect1095ui_story then
					local var_324_4 = Mathf.Lerp(0, 0.5, var_324_3)

					arg_321_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1095ui_story.fillRatio = var_324_4
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect1095ui_story then
				local var_324_5 = 0.5

				arg_321_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1095ui_story.fillRatio = var_324_5
			end

			local var_324_6 = arg_321_1.actors_["10014ui_story"]
			local var_324_7 = 0

			if var_324_7 < arg_321_1.time_ and arg_321_1.time_ <= var_324_7 + arg_324_0 and arg_321_1.var_.characterEffect10014ui_story == nil then
				arg_321_1.var_.characterEffect10014ui_story = var_324_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_8 = 0.200000002980232

			if var_324_7 <= arg_321_1.time_ and arg_321_1.time_ < var_324_7 + var_324_8 then
				local var_324_9 = (arg_321_1.time_ - var_324_7) / var_324_8

				if arg_321_1.var_.characterEffect10014ui_story then
					arg_321_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_7 + var_324_8 and arg_321_1.time_ < var_324_7 + var_324_8 + arg_324_0 and arg_321_1.var_.characterEffect10014ui_story then
				arg_321_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_324_10 = 0
			local var_324_11 = 1.3

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_12 = arg_321_1:FormatText(StoryNameCfg[264].name)

				arg_321_1.leftNameTxt_.text = var_324_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_13 = arg_321_1:GetWordFromCfg(411041078)
				local var_324_14 = arg_321_1:FormatText(var_324_13.content)

				arg_321_1.text_.text = var_324_14

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_15 = 51
				local var_324_16 = utf8.len(var_324_14)
				local var_324_17 = var_324_15 <= 0 and var_324_11 or var_324_11 * (var_324_16 / var_324_15)

				if var_324_17 > 0 and var_324_11 < var_324_17 then
					arg_321_1.talkMaxDuration = var_324_17

					if var_324_17 + var_324_10 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_17 + var_324_10
					end
				end

				arg_321_1.text_.text = var_324_14
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041078", "story_v_out_411041.awb") ~= 0 then
					local var_324_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041078", "story_v_out_411041.awb") / 1000

					if var_324_18 + var_324_10 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_18 + var_324_10
					end

					if var_324_13.prefab_name ~= "" and arg_321_1.actors_[var_324_13.prefab_name] ~= nil then
						local var_324_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_13.prefab_name].transform, "story_v_out_411041", "411041078", "story_v_out_411041.awb")

						arg_321_1:RecordAudio("411041078", var_324_19)
						arg_321_1:RecordAudio("411041078", var_324_19)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_411041", "411041078", "story_v_out_411041.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_411041", "411041078", "story_v_out_411041.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_20 = math.max(var_324_11, arg_321_1.talkMaxDuration)

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_20 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_10) / var_324_20

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_10 + var_324_20 and arg_321_1.time_ < var_324_10 + var_324_20 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play411041079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 411041079
		arg_325_1.duration_ = 6.3

		local var_325_0 = {
			zh = 6.3,
			ja = 4.566
		}
		local var_325_1 = manager.audio:GetLocalizationFlag()

		if var_325_0[var_325_1] ~= nil then
			arg_325_1.duration_ = var_325_0[var_325_1]
		end

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play411041080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["10014ui_story"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos10014ui_story = var_328_0.localPosition
			end

			local var_328_2 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2
				local var_328_4 = Vector3.New(0.7, -1.06, -6.2)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos10014ui_story, var_328_4, var_328_3)

				local var_328_5 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_5.x, var_328_5.y, var_328_5.z)

				local var_328_6 = var_328_0.localEulerAngles

				var_328_6.z = 0
				var_328_6.x = 0
				var_328_0.localEulerAngles = var_328_6
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_328_7 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_7.x, var_328_7.y, var_328_7.z)

				local var_328_8 = var_328_0.localEulerAngles

				var_328_8.z = 0
				var_328_8.x = 0
				var_328_0.localEulerAngles = var_328_8
			end

			local var_328_9 = 0
			local var_328_10 = 0.625

			if var_328_9 < arg_325_1.time_ and arg_325_1.time_ <= var_328_9 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_11 = arg_325_1:FormatText(StoryNameCfg[264].name)

				arg_325_1.leftNameTxt_.text = var_328_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_12 = arg_325_1:GetWordFromCfg(411041079)
				local var_328_13 = arg_325_1:FormatText(var_328_12.content)

				arg_325_1.text_.text = var_328_13

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_14 = 25
				local var_328_15 = utf8.len(var_328_13)
				local var_328_16 = var_328_14 <= 0 and var_328_10 or var_328_10 * (var_328_15 / var_328_14)

				if var_328_16 > 0 and var_328_10 < var_328_16 then
					arg_325_1.talkMaxDuration = var_328_16

					if var_328_16 + var_328_9 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_16 + var_328_9
					end
				end

				arg_325_1.text_.text = var_328_13
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041079", "story_v_out_411041.awb") ~= 0 then
					local var_328_17 = manager.audio:GetVoiceLength("story_v_out_411041", "411041079", "story_v_out_411041.awb") / 1000

					if var_328_17 + var_328_9 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_17 + var_328_9
					end

					if var_328_12.prefab_name ~= "" and arg_325_1.actors_[var_328_12.prefab_name] ~= nil then
						local var_328_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_12.prefab_name].transform, "story_v_out_411041", "411041079", "story_v_out_411041.awb")

						arg_325_1:RecordAudio("411041079", var_328_18)
						arg_325_1:RecordAudio("411041079", var_328_18)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_411041", "411041079", "story_v_out_411041.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_411041", "411041079", "story_v_out_411041.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_19 = math.max(var_328_10, arg_325_1.talkMaxDuration)

			if var_328_9 <= arg_325_1.time_ and arg_325_1.time_ < var_328_9 + var_328_19 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_9) / var_328_19

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_9 + var_328_19 and arg_325_1.time_ < var_328_9 + var_328_19 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play411041080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 411041080
		arg_329_1.duration_ = 7.03400000184774

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play411041081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = "ST71a"

			if arg_329_1.bgs_[var_332_0] == nil then
				local var_332_1 = Object.Instantiate(arg_329_1.paintGo_)

				var_332_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_332_0)
				var_332_1.name = var_332_0
				var_332_1.transform.parent = arg_329_1.stage_.transform
				var_332_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_329_1.bgs_[var_332_0] = var_332_1
			end

			local var_332_2 = 2

			if var_332_2 < arg_329_1.time_ and arg_329_1.time_ <= var_332_2 + arg_332_0 then
				local var_332_3 = manager.ui.mainCamera.transform.localPosition
				local var_332_4 = Vector3.New(0, 0, 10) + Vector3.New(var_332_3.x, var_332_3.y, 0)
				local var_332_5 = arg_329_1.bgs_.ST71a

				var_332_5.transform.localPosition = var_332_4
				var_332_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_332_6 = var_332_5:GetComponent("SpriteRenderer")

				if var_332_6 and var_332_6.sprite then
					local var_332_7 = (var_332_5.transform.localPosition - var_332_3).z
					local var_332_8 = manager.ui.mainCameraCom_
					local var_332_9 = 2 * var_332_7 * Mathf.Tan(var_332_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_332_10 = var_332_9 * var_332_8.aspect
					local var_332_11 = var_332_6.sprite.bounds.size.x
					local var_332_12 = var_332_6.sprite.bounds.size.y
					local var_332_13 = var_332_10 / var_332_11
					local var_332_14 = var_332_9 / var_332_12
					local var_332_15 = var_332_14 < var_332_13 and var_332_13 or var_332_14

					var_332_5.transform.localScale = Vector3.New(var_332_15, var_332_15, 0)
				end

				for iter_332_0, iter_332_1 in pairs(arg_329_1.bgs_) do
					if iter_332_0 ~= "ST71a" then
						iter_332_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 then
				arg_329_1.mask_.enabled = true
				arg_329_1.mask_.raycastTarget = true

				arg_329_1:SetGaussion(false)
			end

			local var_332_17 = 2

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17
				local var_332_19 = Color.New(0, 0, 0)

				var_332_19.a = Mathf.Lerp(0, 1, var_332_18)
				arg_329_1.mask_.color = var_332_19
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 then
				local var_332_20 = Color.New(0, 0, 0)

				var_332_20.a = 1
				arg_329_1.mask_.color = var_332_20
			end

			local var_332_21 = 2

			if var_332_21 < arg_329_1.time_ and arg_329_1.time_ <= var_332_21 + arg_332_0 then
				arg_329_1.mask_.enabled = true
				arg_329_1.mask_.raycastTarget = true

				arg_329_1:SetGaussion(false)
			end

			local var_332_22 = 2

			if var_332_21 <= arg_329_1.time_ and arg_329_1.time_ < var_332_21 + var_332_22 then
				local var_332_23 = (arg_329_1.time_ - var_332_21) / var_332_22
				local var_332_24 = Color.New(0, 0, 0)

				var_332_24.a = Mathf.Lerp(1, 0, var_332_23)
				arg_329_1.mask_.color = var_332_24
			end

			if arg_329_1.time_ >= var_332_21 + var_332_22 and arg_329_1.time_ < var_332_21 + var_332_22 + arg_332_0 then
				local var_332_25 = Color.New(0, 0, 0)
				local var_332_26 = 0

				arg_329_1.mask_.enabled = false
				var_332_25.a = var_332_26
				arg_329_1.mask_.color = var_332_25
			end

			local var_332_27 = arg_329_1.actors_["1095ui_story"].transform
			local var_332_28 = 2

			if var_332_28 < arg_329_1.time_ and arg_329_1.time_ <= var_332_28 + arg_332_0 then
				arg_329_1.var_.moveOldPos1095ui_story = var_332_27.localPosition
			end

			local var_332_29 = 0.001

			if var_332_28 <= arg_329_1.time_ and arg_329_1.time_ < var_332_28 + var_332_29 then
				local var_332_30 = (arg_329_1.time_ - var_332_28) / var_332_29
				local var_332_31 = Vector3.New(0, 100, 0)

				var_332_27.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1095ui_story, var_332_31, var_332_30)

				local var_332_32 = manager.ui.mainCamera.transform.position - var_332_27.position

				var_332_27.forward = Vector3.New(var_332_32.x, var_332_32.y, var_332_32.z)

				local var_332_33 = var_332_27.localEulerAngles

				var_332_33.z = 0
				var_332_33.x = 0
				var_332_27.localEulerAngles = var_332_33
			end

			if arg_329_1.time_ >= var_332_28 + var_332_29 and arg_329_1.time_ < var_332_28 + var_332_29 + arg_332_0 then
				var_332_27.localPosition = Vector3.New(0, 100, 0)

				local var_332_34 = manager.ui.mainCamera.transform.position - var_332_27.position

				var_332_27.forward = Vector3.New(var_332_34.x, var_332_34.y, var_332_34.z)

				local var_332_35 = var_332_27.localEulerAngles

				var_332_35.z = 0
				var_332_35.x = 0
				var_332_27.localEulerAngles = var_332_35
			end

			local var_332_36 = arg_329_1.actors_["1095ui_story"]
			local var_332_37 = 2

			if var_332_37 < arg_329_1.time_ and arg_329_1.time_ <= var_332_37 + arg_332_0 and arg_329_1.var_.characterEffect1095ui_story == nil then
				arg_329_1.var_.characterEffect1095ui_story = var_332_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_38 = 0.200000002980232

			if var_332_37 <= arg_329_1.time_ and arg_329_1.time_ < var_332_37 + var_332_38 then
				local var_332_39 = (arg_329_1.time_ - var_332_37) / var_332_38

				if arg_329_1.var_.characterEffect1095ui_story then
					local var_332_40 = Mathf.Lerp(0, 0.5, var_332_39)

					arg_329_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_329_1.var_.characterEffect1095ui_story.fillRatio = var_332_40
				end
			end

			if arg_329_1.time_ >= var_332_37 + var_332_38 and arg_329_1.time_ < var_332_37 + var_332_38 + arg_332_0 and arg_329_1.var_.characterEffect1095ui_story then
				local var_332_41 = 0.5

				arg_329_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_329_1.var_.characterEffect1095ui_story.fillRatio = var_332_41
			end

			local var_332_42 = arg_329_1.actors_["10014ui_story"].transform
			local var_332_43 = 2

			if var_332_43 < arg_329_1.time_ and arg_329_1.time_ <= var_332_43 + arg_332_0 then
				arg_329_1.var_.moveOldPos10014ui_story = var_332_42.localPosition
			end

			local var_332_44 = 0.001

			if var_332_43 <= arg_329_1.time_ and arg_329_1.time_ < var_332_43 + var_332_44 then
				local var_332_45 = (arg_329_1.time_ - var_332_43) / var_332_44
				local var_332_46 = Vector3.New(0, 100, 0)

				var_332_42.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos10014ui_story, var_332_46, var_332_45)

				local var_332_47 = manager.ui.mainCamera.transform.position - var_332_42.position

				var_332_42.forward = Vector3.New(var_332_47.x, var_332_47.y, var_332_47.z)

				local var_332_48 = var_332_42.localEulerAngles

				var_332_48.z = 0
				var_332_48.x = 0
				var_332_42.localEulerAngles = var_332_48
			end

			if arg_329_1.time_ >= var_332_43 + var_332_44 and arg_329_1.time_ < var_332_43 + var_332_44 + arg_332_0 then
				var_332_42.localPosition = Vector3.New(0, 100, 0)

				local var_332_49 = manager.ui.mainCamera.transform.position - var_332_42.position

				var_332_42.forward = Vector3.New(var_332_49.x, var_332_49.y, var_332_49.z)

				local var_332_50 = var_332_42.localEulerAngles

				var_332_50.z = 0
				var_332_50.x = 0
				var_332_42.localEulerAngles = var_332_50
			end

			local var_332_51 = arg_329_1.actors_["10014ui_story"]
			local var_332_52 = 2

			if var_332_52 < arg_329_1.time_ and arg_329_1.time_ <= var_332_52 + arg_332_0 and arg_329_1.var_.characterEffect10014ui_story == nil then
				arg_329_1.var_.characterEffect10014ui_story = var_332_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_53 = 0.200000002980232

			if var_332_52 <= arg_329_1.time_ and arg_329_1.time_ < var_332_52 + var_332_53 then
				local var_332_54 = (arg_329_1.time_ - var_332_52) / var_332_53

				if arg_329_1.var_.characterEffect10014ui_story then
					local var_332_55 = Mathf.Lerp(0, 0.5, var_332_54)

					arg_329_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_329_1.var_.characterEffect10014ui_story.fillRatio = var_332_55
				end
			end

			if arg_329_1.time_ >= var_332_52 + var_332_53 and arg_329_1.time_ < var_332_52 + var_332_53 + arg_332_0 and arg_329_1.var_.characterEffect10014ui_story then
				local var_332_56 = 0.5

				arg_329_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_329_1.var_.characterEffect10014ui_story.fillRatio = var_332_56
			end

			if arg_329_1.frameCnt_ <= 1 then
				arg_329_1.dialog_:SetActive(false)
			end

			local var_332_57 = 2.03400000184774
			local var_332_58 = 1.1

			if var_332_57 < arg_329_1.time_ and arg_329_1.time_ <= var_332_57 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0

				arg_329_1.dialog_:SetActive(true)

				local var_332_59 = LeanTween.value(arg_329_1.dialog_, 0, 1, 0.3)

				var_332_59:setOnUpdate(LuaHelper.FloatAction(function(arg_333_0)
					arg_329_1.dialogCg_.alpha = arg_333_0
				end))
				var_332_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_329_1.dialog_)
					var_332_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_329_1.duration_ = arg_329_1.duration_ + 0.3

				SetActive(arg_329_1.leftNameGo_, false)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_60 = arg_329_1:GetWordFromCfg(411041080)
				local var_332_61 = arg_329_1:FormatText(var_332_60.content)

				arg_329_1.text_.text = var_332_61

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_62 = 44
				local var_332_63 = utf8.len(var_332_61)
				local var_332_64 = var_332_62 <= 0 and var_332_58 or var_332_58 * (var_332_63 / var_332_62)

				if var_332_64 > 0 and var_332_58 < var_332_64 then
					arg_329_1.talkMaxDuration = var_332_64
					var_332_57 = var_332_57 + 0.3

					if var_332_64 + var_332_57 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_64 + var_332_57
					end
				end

				arg_329_1.text_.text = var_332_61
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_65 = var_332_57 + 0.3
			local var_332_66 = math.max(var_332_58, arg_329_1.talkMaxDuration)

			if var_332_65 <= arg_329_1.time_ and arg_329_1.time_ < var_332_65 + var_332_66 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_65) / var_332_66

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_65 + var_332_66 and arg_329_1.time_ < var_332_65 + var_332_66 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play411041081 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 411041081
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play411041082(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 0.625

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, false)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_2 = arg_335_1:GetWordFromCfg(411041081)
				local var_338_3 = arg_335_1:FormatText(var_338_2.content)

				arg_335_1.text_.text = var_338_3

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_4 = 25
				local var_338_5 = utf8.len(var_338_3)
				local var_338_6 = var_338_4 <= 0 and var_338_1 or var_338_1 * (var_338_5 / var_338_4)

				if var_338_6 > 0 and var_338_1 < var_338_6 then
					arg_335_1.talkMaxDuration = var_338_6

					if var_338_6 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_6 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_3
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_7 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_7 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_7

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_7 and arg_335_1.time_ < var_338_0 + var_338_7 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play411041082 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 411041082
		arg_339_1.duration_ = 4.8

		local var_339_0 = {
			zh = 4.8,
			ja = 1.999999999999
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
				arg_339_0:Play411041083(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["10071ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos10071ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(0, -0.9, -6.26)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos10071ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0, -0.9, -6.26)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["10071ui_story"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and arg_339_1.var_.characterEffect10071ui_story == nil then
				arg_339_1.var_.characterEffect10071ui_story = var_342_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_11 = 0.200000002980232

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.characterEffect10071ui_story then
					arg_339_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and arg_339_1.var_.characterEffect10071ui_story then
				arg_339_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_342_13 = 0

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action1_1")
			end

			local var_342_14 = 0

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				arg_339_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_342_15 = 0
			local var_342_16 = 0.125

			if var_342_15 < arg_339_1.time_ and arg_339_1.time_ <= var_342_15 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_17 = arg_339_1:FormatText(StoryNameCfg[670].name)

				arg_339_1.leftNameTxt_.text = var_342_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_18 = arg_339_1:GetWordFromCfg(411041082)
				local var_342_19 = arg_339_1:FormatText(var_342_18.content)

				arg_339_1.text_.text = var_342_19

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_20 = 5
				local var_342_21 = utf8.len(var_342_19)
				local var_342_22 = var_342_20 <= 0 and var_342_16 or var_342_16 * (var_342_21 / var_342_20)

				if var_342_22 > 0 and var_342_16 < var_342_22 then
					arg_339_1.talkMaxDuration = var_342_22

					if var_342_22 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_22 + var_342_15
					end
				end

				arg_339_1.text_.text = var_342_19
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041082", "story_v_out_411041.awb") ~= 0 then
					local var_342_23 = manager.audio:GetVoiceLength("story_v_out_411041", "411041082", "story_v_out_411041.awb") / 1000

					if var_342_23 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_23 + var_342_15
					end

					if var_342_18.prefab_name ~= "" and arg_339_1.actors_[var_342_18.prefab_name] ~= nil then
						local var_342_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_18.prefab_name].transform, "story_v_out_411041", "411041082", "story_v_out_411041.awb")

						arg_339_1:RecordAudio("411041082", var_342_24)
						arg_339_1:RecordAudio("411041082", var_342_24)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_411041", "411041082", "story_v_out_411041.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_411041", "411041082", "story_v_out_411041.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_25 = math.max(var_342_16, arg_339_1.talkMaxDuration)

			if var_342_15 <= arg_339_1.time_ and arg_339_1.time_ < var_342_15 + var_342_25 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_15) / var_342_25

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_15 + var_342_25 and arg_339_1.time_ < var_342_15 + var_342_25 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play411041083 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 411041083
		arg_343_1.duration_ = 2.5

		local var_343_0 = {
			zh = 1.999999999999,
			ja = 2.5
		}
		local var_343_1 = manager.audio:GetLocalizationFlag()

		if var_343_0[var_343_1] ~= nil then
			arg_343_1.duration_ = var_343_0[var_343_1]
		end

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play411041084(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1095ui_story"].transform
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1.var_.moveOldPos1095ui_story = var_346_0.localPosition
			end

			local var_346_2 = 0.001

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2
				local var_346_4 = Vector3.New(0.7, -0.98, -6.1)

				var_346_0.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1095ui_story, var_346_4, var_346_3)

				local var_346_5 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_5.x, var_346_5.y, var_346_5.z)

				local var_346_6 = var_346_0.localEulerAngles

				var_346_6.z = 0
				var_346_6.x = 0
				var_346_0.localEulerAngles = var_346_6
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 then
				var_346_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_346_7 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_7.x, var_346_7.y, var_346_7.z)

				local var_346_8 = var_346_0.localEulerAngles

				var_346_8.z = 0
				var_346_8.x = 0
				var_346_0.localEulerAngles = var_346_8
			end

			local var_346_9 = arg_343_1.actors_["1095ui_story"]
			local var_346_10 = 0

			if var_346_10 < arg_343_1.time_ and arg_343_1.time_ <= var_346_10 + arg_346_0 and arg_343_1.var_.characterEffect1095ui_story == nil then
				arg_343_1.var_.characterEffect1095ui_story = var_346_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_11 = 0.200000002980232

			if var_346_10 <= arg_343_1.time_ and arg_343_1.time_ < var_346_10 + var_346_11 then
				local var_346_12 = (arg_343_1.time_ - var_346_10) / var_346_11

				if arg_343_1.var_.characterEffect1095ui_story then
					arg_343_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_10 + var_346_11 and arg_343_1.time_ < var_346_10 + var_346_11 + arg_346_0 and arg_343_1.var_.characterEffect1095ui_story then
				arg_343_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_346_13 = 0

			if var_346_13 < arg_343_1.time_ and arg_343_1.time_ <= var_346_13 + arg_346_0 then
				arg_343_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_346_14 = 0

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 then
				arg_343_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_346_15 = arg_343_1.actors_["10071ui_story"].transform
			local var_346_16 = 0

			if var_346_16 < arg_343_1.time_ and arg_343_1.time_ <= var_346_16 + arg_346_0 then
				arg_343_1.var_.moveOldPos10071ui_story = var_346_15.localPosition
			end

			local var_346_17 = 0.001

			if var_346_16 <= arg_343_1.time_ and arg_343_1.time_ < var_346_16 + var_346_17 then
				local var_346_18 = (arg_343_1.time_ - var_346_16) / var_346_17
				local var_346_19 = Vector3.New(-0.7, -0.9, -6.26)

				var_346_15.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos10071ui_story, var_346_19, var_346_18)

				local var_346_20 = manager.ui.mainCamera.transform.position - var_346_15.position

				var_346_15.forward = Vector3.New(var_346_20.x, var_346_20.y, var_346_20.z)

				local var_346_21 = var_346_15.localEulerAngles

				var_346_21.z = 0
				var_346_21.x = 0
				var_346_15.localEulerAngles = var_346_21
			end

			if arg_343_1.time_ >= var_346_16 + var_346_17 and arg_343_1.time_ < var_346_16 + var_346_17 + arg_346_0 then
				var_346_15.localPosition = Vector3.New(-0.7, -0.9, -6.26)

				local var_346_22 = manager.ui.mainCamera.transform.position - var_346_15.position

				var_346_15.forward = Vector3.New(var_346_22.x, var_346_22.y, var_346_22.z)

				local var_346_23 = var_346_15.localEulerAngles

				var_346_23.z = 0
				var_346_23.x = 0
				var_346_15.localEulerAngles = var_346_23
			end

			local var_346_24 = arg_343_1.actors_["10071ui_story"]
			local var_346_25 = 0

			if var_346_25 < arg_343_1.time_ and arg_343_1.time_ <= var_346_25 + arg_346_0 and arg_343_1.var_.characterEffect10071ui_story == nil then
				arg_343_1.var_.characterEffect10071ui_story = var_346_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_26 = 0.200000002980232

			if var_346_25 <= arg_343_1.time_ and arg_343_1.time_ < var_346_25 + var_346_26 then
				local var_346_27 = (arg_343_1.time_ - var_346_25) / var_346_26

				if arg_343_1.var_.characterEffect10071ui_story then
					local var_346_28 = Mathf.Lerp(0, 0.5, var_346_27)

					arg_343_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_343_1.var_.characterEffect10071ui_story.fillRatio = var_346_28
				end
			end

			if arg_343_1.time_ >= var_346_25 + var_346_26 and arg_343_1.time_ < var_346_25 + var_346_26 + arg_346_0 and arg_343_1.var_.characterEffect10071ui_story then
				local var_346_29 = 0.5

				arg_343_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_343_1.var_.characterEffect10071ui_story.fillRatio = var_346_29
			end

			local var_346_30 = 0
			local var_346_31 = 0.2

			if var_346_30 < arg_343_1.time_ and arg_343_1.time_ <= var_346_30 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_32 = arg_343_1:FormatText(StoryNameCfg[471].name)

				arg_343_1.leftNameTxt_.text = var_346_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_33 = arg_343_1:GetWordFromCfg(411041083)
				local var_346_34 = arg_343_1:FormatText(var_346_33.content)

				arg_343_1.text_.text = var_346_34

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_35 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041083", "story_v_out_411041.awb") ~= 0 then
					local var_346_38 = manager.audio:GetVoiceLength("story_v_out_411041", "411041083", "story_v_out_411041.awb") / 1000

					if var_346_38 + var_346_30 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_38 + var_346_30
					end

					if var_346_33.prefab_name ~= "" and arg_343_1.actors_[var_346_33.prefab_name] ~= nil then
						local var_346_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_33.prefab_name].transform, "story_v_out_411041", "411041083", "story_v_out_411041.awb")

						arg_343_1:RecordAudio("411041083", var_346_39)
						arg_343_1:RecordAudio("411041083", var_346_39)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_411041", "411041083", "story_v_out_411041.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_411041", "411041083", "story_v_out_411041.awb")
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
	Play411041084 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 411041084
		arg_347_1.duration_ = 4.966

		local var_347_0 = {
			zh = 3.666,
			ja = 4.966
		}
		local var_347_1 = manager.audio:GetLocalizationFlag()

		if var_347_0[var_347_1] ~= nil then
			arg_347_1.duration_ = var_347_0[var_347_1]
		end

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play411041085(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["10071ui_story"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos10071ui_story = var_350_0.localPosition
			end

			local var_350_2 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2
				local var_350_4 = Vector3.New(-0.7, -0.9, -6.26)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos10071ui_story, var_350_4, var_350_3)

				local var_350_5 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_5.x, var_350_5.y, var_350_5.z)

				local var_350_6 = var_350_0.localEulerAngles

				var_350_6.z = 0
				var_350_6.x = 0
				var_350_0.localEulerAngles = var_350_6
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 then
				var_350_0.localPosition = Vector3.New(-0.7, -0.9, -6.26)

				local var_350_7 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_7.x, var_350_7.y, var_350_7.z)

				local var_350_8 = var_350_0.localEulerAngles

				var_350_8.z = 0
				var_350_8.x = 0
				var_350_0.localEulerAngles = var_350_8
			end

			local var_350_9 = arg_347_1.actors_["10071ui_story"]
			local var_350_10 = 0

			if var_350_10 < arg_347_1.time_ and arg_347_1.time_ <= var_350_10 + arg_350_0 and arg_347_1.var_.characterEffect10071ui_story == nil then
				arg_347_1.var_.characterEffect10071ui_story = var_350_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_11 = 0.200000002980232

			if var_350_10 <= arg_347_1.time_ and arg_347_1.time_ < var_350_10 + var_350_11 then
				local var_350_12 = (arg_347_1.time_ - var_350_10) / var_350_11

				if arg_347_1.var_.characterEffect10071ui_story then
					arg_347_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_10 + var_350_11 and arg_347_1.time_ < var_350_10 + var_350_11 + arg_350_0 and arg_347_1.var_.characterEffect10071ui_story then
				arg_347_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_350_13 = 0

			if var_350_13 < arg_347_1.time_ and arg_347_1.time_ <= var_350_13 + arg_350_0 then
				arg_347_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_350_14 = arg_347_1.actors_["1095ui_story"]
			local var_350_15 = 0

			if var_350_15 < arg_347_1.time_ and arg_347_1.time_ <= var_350_15 + arg_350_0 and arg_347_1.var_.characterEffect1095ui_story == nil then
				arg_347_1.var_.characterEffect1095ui_story = var_350_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_16 = 0.200000002980232

			if var_350_15 <= arg_347_1.time_ and arg_347_1.time_ < var_350_15 + var_350_16 then
				local var_350_17 = (arg_347_1.time_ - var_350_15) / var_350_16

				if arg_347_1.var_.characterEffect1095ui_story then
					local var_350_18 = Mathf.Lerp(0, 0.5, var_350_17)

					arg_347_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_347_1.var_.characterEffect1095ui_story.fillRatio = var_350_18
				end
			end

			if arg_347_1.time_ >= var_350_15 + var_350_16 and arg_347_1.time_ < var_350_15 + var_350_16 + arg_350_0 and arg_347_1.var_.characterEffect1095ui_story then
				local var_350_19 = 0.5

				arg_347_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_347_1.var_.characterEffect1095ui_story.fillRatio = var_350_19
			end

			local var_350_20 = 0
			local var_350_21 = 0.275

			if var_350_20 < arg_347_1.time_ and arg_347_1.time_ <= var_350_20 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_22 = arg_347_1:FormatText(StoryNameCfg[670].name)

				arg_347_1.leftNameTxt_.text = var_350_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_23 = arg_347_1:GetWordFromCfg(411041084)
				local var_350_24 = arg_347_1:FormatText(var_350_23.content)

				arg_347_1.text_.text = var_350_24

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_25 = 11
				local var_350_26 = utf8.len(var_350_24)
				local var_350_27 = var_350_25 <= 0 and var_350_21 or var_350_21 * (var_350_26 / var_350_25)

				if var_350_27 > 0 and var_350_21 < var_350_27 then
					arg_347_1.talkMaxDuration = var_350_27

					if var_350_27 + var_350_20 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_27 + var_350_20
					end
				end

				arg_347_1.text_.text = var_350_24
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041084", "story_v_out_411041.awb") ~= 0 then
					local var_350_28 = manager.audio:GetVoiceLength("story_v_out_411041", "411041084", "story_v_out_411041.awb") / 1000

					if var_350_28 + var_350_20 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_28 + var_350_20
					end

					if var_350_23.prefab_name ~= "" and arg_347_1.actors_[var_350_23.prefab_name] ~= nil then
						local var_350_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_23.prefab_name].transform, "story_v_out_411041", "411041084", "story_v_out_411041.awb")

						arg_347_1:RecordAudio("411041084", var_350_29)
						arg_347_1:RecordAudio("411041084", var_350_29)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_411041", "411041084", "story_v_out_411041.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_411041", "411041084", "story_v_out_411041.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_30 = math.max(var_350_21, arg_347_1.talkMaxDuration)

			if var_350_20 <= arg_347_1.time_ and arg_347_1.time_ < var_350_20 + var_350_30 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_20) / var_350_30

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_20 + var_350_30 and arg_347_1.time_ < var_350_20 + var_350_30 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play411041085 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 411041085
		arg_351_1.duration_ = 8.1

		local var_351_0 = {
			zh = 5.3,
			ja = 8.1
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
				arg_351_0:Play411041086(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["10071ui_story"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.characterEffect10071ui_story == nil then
				arg_351_1.var_.characterEffect10071ui_story = var_354_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_2 = 0.200000002980232

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.characterEffect10071ui_story then
					local var_354_4 = Mathf.Lerp(0, 0.5, var_354_3)

					arg_351_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_351_1.var_.characterEffect10071ui_story.fillRatio = var_354_4
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.characterEffect10071ui_story then
				local var_354_5 = 0.5

				arg_351_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_351_1.var_.characterEffect10071ui_story.fillRatio = var_354_5
			end

			local var_354_6 = arg_351_1.actors_["1095ui_story"]
			local var_354_7 = 0

			if var_354_7 < arg_351_1.time_ and arg_351_1.time_ <= var_354_7 + arg_354_0 and arg_351_1.var_.characterEffect1095ui_story == nil then
				arg_351_1.var_.characterEffect1095ui_story = var_354_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_8 = 0.200000002980232

			if var_354_7 <= arg_351_1.time_ and arg_351_1.time_ < var_354_7 + var_354_8 then
				local var_354_9 = (arg_351_1.time_ - var_354_7) / var_354_8

				if arg_351_1.var_.characterEffect1095ui_story then
					arg_351_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_7 + var_354_8 and arg_351_1.time_ < var_354_7 + var_354_8 + arg_354_0 and arg_351_1.var_.characterEffect1095ui_story then
				arg_351_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_354_10 = 0
			local var_354_11 = 0.525

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_12 = arg_351_1:FormatText(StoryNameCfg[471].name)

				arg_351_1.leftNameTxt_.text = var_354_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_13 = arg_351_1:GetWordFromCfg(411041085)
				local var_354_14 = arg_351_1:FormatText(var_354_13.content)

				arg_351_1.text_.text = var_354_14

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_15 = 21
				local var_354_16 = utf8.len(var_354_14)
				local var_354_17 = var_354_15 <= 0 and var_354_11 or var_354_11 * (var_354_16 / var_354_15)

				if var_354_17 > 0 and var_354_11 < var_354_17 then
					arg_351_1.talkMaxDuration = var_354_17

					if var_354_17 + var_354_10 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_17 + var_354_10
					end
				end

				arg_351_1.text_.text = var_354_14
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041085", "story_v_out_411041.awb") ~= 0 then
					local var_354_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041085", "story_v_out_411041.awb") / 1000

					if var_354_18 + var_354_10 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_18 + var_354_10
					end

					if var_354_13.prefab_name ~= "" and arg_351_1.actors_[var_354_13.prefab_name] ~= nil then
						local var_354_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_13.prefab_name].transform, "story_v_out_411041", "411041085", "story_v_out_411041.awb")

						arg_351_1:RecordAudio("411041085", var_354_19)
						arg_351_1:RecordAudio("411041085", var_354_19)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_411041", "411041085", "story_v_out_411041.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_411041", "411041085", "story_v_out_411041.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_20 = math.max(var_354_11, arg_351_1.talkMaxDuration)

			if var_354_10 <= arg_351_1.time_ and arg_351_1.time_ < var_354_10 + var_354_20 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_10) / var_354_20

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_10 + var_354_20 and arg_351_1.time_ < var_354_10 + var_354_20 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play411041086 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 411041086
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play411041087(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1095ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect1095ui_story == nil then
				arg_355_1.var_.characterEffect1095ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect1095ui_story then
					local var_358_4 = Mathf.Lerp(0, 0.5, var_358_3)

					arg_355_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1095ui_story.fillRatio = var_358_4
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1095ui_story then
				local var_358_5 = 0.5

				arg_355_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1095ui_story.fillRatio = var_358_5
			end

			local var_358_6 = 0
			local var_358_7 = 0.85

			if var_358_6 < arg_355_1.time_ and arg_355_1.time_ <= var_358_6 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_8 = arg_355_1:GetWordFromCfg(411041086)
				local var_358_9 = arg_355_1:FormatText(var_358_8.content)

				arg_355_1.text_.text = var_358_9

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_10 = 34
				local var_358_11 = utf8.len(var_358_9)
				local var_358_12 = var_358_10 <= 0 and var_358_7 or var_358_7 * (var_358_11 / var_358_10)

				if var_358_12 > 0 and var_358_7 < var_358_12 then
					arg_355_1.talkMaxDuration = var_358_12

					if var_358_12 + var_358_6 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_12 + var_358_6
					end
				end

				arg_355_1.text_.text = var_358_9
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_13 = math.max(var_358_7, arg_355_1.talkMaxDuration)

			if var_358_6 <= arg_355_1.time_ and arg_355_1.time_ < var_358_6 + var_358_13 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_6) / var_358_13

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_6 + var_358_13 and arg_355_1.time_ < var_358_6 + var_358_13 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play411041087 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 411041087
		arg_359_1.duration_ = 1.999999999999

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play411041088(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["10071ui_story"].transform
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 then
				arg_359_1.var_.moveOldPos10071ui_story = var_362_0.localPosition
			end

			local var_362_2 = 0.001

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2
				local var_362_4 = Vector3.New(-0.7, -0.9, -6.26)

				var_362_0.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos10071ui_story, var_362_4, var_362_3)

				local var_362_5 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_5.x, var_362_5.y, var_362_5.z)

				local var_362_6 = var_362_0.localEulerAngles

				var_362_6.z = 0
				var_362_6.x = 0
				var_362_0.localEulerAngles = var_362_6
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 then
				var_362_0.localPosition = Vector3.New(-0.7, -0.9, -6.26)

				local var_362_7 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_7.x, var_362_7.y, var_362_7.z)

				local var_362_8 = var_362_0.localEulerAngles

				var_362_8.z = 0
				var_362_8.x = 0
				var_362_0.localEulerAngles = var_362_8
			end

			local var_362_9 = arg_359_1.actors_["10071ui_story"]
			local var_362_10 = 0

			if var_362_10 < arg_359_1.time_ and arg_359_1.time_ <= var_362_10 + arg_362_0 and arg_359_1.var_.characterEffect10071ui_story == nil then
				arg_359_1.var_.characterEffect10071ui_story = var_362_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_11 = 0.200000002980232

			if var_362_10 <= arg_359_1.time_ and arg_359_1.time_ < var_362_10 + var_362_11 then
				local var_362_12 = (arg_359_1.time_ - var_362_10) / var_362_11

				if arg_359_1.var_.characterEffect10071ui_story then
					arg_359_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_10 + var_362_11 and arg_359_1.time_ < var_362_10 + var_362_11 + arg_362_0 and arg_359_1.var_.characterEffect10071ui_story then
				arg_359_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_362_13 = 0

			if var_362_13 < arg_359_1.time_ and arg_359_1.time_ <= var_362_13 + arg_362_0 then
				arg_359_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_362_14 = 0
			local var_362_15 = 0.1

			if var_362_14 < arg_359_1.time_ and arg_359_1.time_ <= var_362_14 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_16 = arg_359_1:FormatText(StoryNameCfg[670].name)

				arg_359_1.leftNameTxt_.text = var_362_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_17 = arg_359_1:GetWordFromCfg(411041087)
				local var_362_18 = arg_359_1:FormatText(var_362_17.content)

				arg_359_1.text_.text = var_362_18

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_19 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041087", "story_v_out_411041.awb") ~= 0 then
					local var_362_22 = manager.audio:GetVoiceLength("story_v_out_411041", "411041087", "story_v_out_411041.awb") / 1000

					if var_362_22 + var_362_14 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_22 + var_362_14
					end

					if var_362_17.prefab_name ~= "" and arg_359_1.actors_[var_362_17.prefab_name] ~= nil then
						local var_362_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_17.prefab_name].transform, "story_v_out_411041", "411041087", "story_v_out_411041.awb")

						arg_359_1:RecordAudio("411041087", var_362_23)
						arg_359_1:RecordAudio("411041087", var_362_23)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_411041", "411041087", "story_v_out_411041.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_411041", "411041087", "story_v_out_411041.awb")
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
	Play411041088 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 411041088
		arg_363_1.duration_ = 4.433

		local var_363_0 = {
			zh = 4.433,
			ja = 4.166
		}
		local var_363_1 = manager.audio:GetLocalizationFlag()

		if var_363_0[var_363_1] ~= nil then
			arg_363_1.duration_ = var_363_0[var_363_1]
		end

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play411041089(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["10014ui_story"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos10014ui_story = var_366_0.localPosition
			end

			local var_366_2 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2
				local var_366_4 = Vector3.New(0, -1.06, -6.2)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos10014ui_story, var_366_4, var_366_3)

				local var_366_5 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_5.x, var_366_5.y, var_366_5.z)

				local var_366_6 = var_366_0.localEulerAngles

				var_366_6.z = 0
				var_366_6.x = 0
				var_366_0.localEulerAngles = var_366_6
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_366_7 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_7.x, var_366_7.y, var_366_7.z)

				local var_366_8 = var_366_0.localEulerAngles

				var_366_8.z = 0
				var_366_8.x = 0
				var_366_0.localEulerAngles = var_366_8
			end

			local var_366_9 = arg_363_1.actors_["10014ui_story"]
			local var_366_10 = 0

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 and arg_363_1.var_.characterEffect10014ui_story == nil then
				arg_363_1.var_.characterEffect10014ui_story = var_366_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_11 = 0.200000002980232

			if var_366_10 <= arg_363_1.time_ and arg_363_1.time_ < var_366_10 + var_366_11 then
				local var_366_12 = (arg_363_1.time_ - var_366_10) / var_366_11

				if arg_363_1.var_.characterEffect10014ui_story then
					arg_363_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_10 + var_366_11 and arg_363_1.time_ < var_366_10 + var_366_11 + arg_366_0 and arg_363_1.var_.characterEffect10014ui_story then
				arg_363_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_366_13 = 0

			if var_366_13 < arg_363_1.time_ and arg_363_1.time_ <= var_366_13 + arg_366_0 then
				arg_363_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_366_14 = 0

			if var_366_14 < arg_363_1.time_ and arg_363_1.time_ <= var_366_14 + arg_366_0 then
				arg_363_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_366_15 = arg_363_1.actors_["10071ui_story"].transform
			local var_366_16 = 0

			if var_366_16 < arg_363_1.time_ and arg_363_1.time_ <= var_366_16 + arg_366_0 then
				arg_363_1.var_.moveOldPos10071ui_story = var_366_15.localPosition
			end

			local var_366_17 = 0.001

			if var_366_16 <= arg_363_1.time_ and arg_363_1.time_ < var_366_16 + var_366_17 then
				local var_366_18 = (arg_363_1.time_ - var_366_16) / var_366_17
				local var_366_19 = Vector3.New(0, 100, 0)

				var_366_15.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos10071ui_story, var_366_19, var_366_18)

				local var_366_20 = manager.ui.mainCamera.transform.position - var_366_15.position

				var_366_15.forward = Vector3.New(var_366_20.x, var_366_20.y, var_366_20.z)

				local var_366_21 = var_366_15.localEulerAngles

				var_366_21.z = 0
				var_366_21.x = 0
				var_366_15.localEulerAngles = var_366_21
			end

			if arg_363_1.time_ >= var_366_16 + var_366_17 and arg_363_1.time_ < var_366_16 + var_366_17 + arg_366_0 then
				var_366_15.localPosition = Vector3.New(0, 100, 0)

				local var_366_22 = manager.ui.mainCamera.transform.position - var_366_15.position

				var_366_15.forward = Vector3.New(var_366_22.x, var_366_22.y, var_366_22.z)

				local var_366_23 = var_366_15.localEulerAngles

				var_366_23.z = 0
				var_366_23.x = 0
				var_366_15.localEulerAngles = var_366_23
			end

			local var_366_24 = arg_363_1.actors_["10071ui_story"]
			local var_366_25 = 0

			if var_366_25 < arg_363_1.time_ and arg_363_1.time_ <= var_366_25 + arg_366_0 and arg_363_1.var_.characterEffect10071ui_story == nil then
				arg_363_1.var_.characterEffect10071ui_story = var_366_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_26 = 0.200000002980232

			if var_366_25 <= arg_363_1.time_ and arg_363_1.time_ < var_366_25 + var_366_26 then
				local var_366_27 = (arg_363_1.time_ - var_366_25) / var_366_26

				if arg_363_1.var_.characterEffect10071ui_story then
					local var_366_28 = Mathf.Lerp(0, 0.5, var_366_27)

					arg_363_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_363_1.var_.characterEffect10071ui_story.fillRatio = var_366_28
				end
			end

			if arg_363_1.time_ >= var_366_25 + var_366_26 and arg_363_1.time_ < var_366_25 + var_366_26 + arg_366_0 and arg_363_1.var_.characterEffect10071ui_story then
				local var_366_29 = 0.5

				arg_363_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_363_1.var_.characterEffect10071ui_story.fillRatio = var_366_29
			end

			local var_366_30 = arg_363_1.actors_["1095ui_story"].transform
			local var_366_31 = 0

			if var_366_31 < arg_363_1.time_ and arg_363_1.time_ <= var_366_31 + arg_366_0 then
				arg_363_1.var_.moveOldPos1095ui_story = var_366_30.localPosition
			end

			local var_366_32 = 0.001

			if var_366_31 <= arg_363_1.time_ and arg_363_1.time_ < var_366_31 + var_366_32 then
				local var_366_33 = (arg_363_1.time_ - var_366_31) / var_366_32
				local var_366_34 = Vector3.New(0, 100, 0)

				var_366_30.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1095ui_story, var_366_34, var_366_33)

				local var_366_35 = manager.ui.mainCamera.transform.position - var_366_30.position

				var_366_30.forward = Vector3.New(var_366_35.x, var_366_35.y, var_366_35.z)

				local var_366_36 = var_366_30.localEulerAngles

				var_366_36.z = 0
				var_366_36.x = 0
				var_366_30.localEulerAngles = var_366_36
			end

			if arg_363_1.time_ >= var_366_31 + var_366_32 and arg_363_1.time_ < var_366_31 + var_366_32 + arg_366_0 then
				var_366_30.localPosition = Vector3.New(0, 100, 0)

				local var_366_37 = manager.ui.mainCamera.transform.position - var_366_30.position

				var_366_30.forward = Vector3.New(var_366_37.x, var_366_37.y, var_366_37.z)

				local var_366_38 = var_366_30.localEulerAngles

				var_366_38.z = 0
				var_366_38.x = 0
				var_366_30.localEulerAngles = var_366_38
			end

			local var_366_39 = arg_363_1.actors_["1095ui_story"]
			local var_366_40 = 0

			if var_366_40 < arg_363_1.time_ and arg_363_1.time_ <= var_366_40 + arg_366_0 and arg_363_1.var_.characterEffect1095ui_story == nil then
				arg_363_1.var_.characterEffect1095ui_story = var_366_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_41 = 0.200000002980232

			if var_366_40 <= arg_363_1.time_ and arg_363_1.time_ < var_366_40 + var_366_41 then
				local var_366_42 = (arg_363_1.time_ - var_366_40) / var_366_41

				if arg_363_1.var_.characterEffect1095ui_story then
					local var_366_43 = Mathf.Lerp(0, 0.5, var_366_42)

					arg_363_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_363_1.var_.characterEffect1095ui_story.fillRatio = var_366_43
				end
			end

			if arg_363_1.time_ >= var_366_40 + var_366_41 and arg_363_1.time_ < var_366_40 + var_366_41 + arg_366_0 and arg_363_1.var_.characterEffect1095ui_story then
				local var_366_44 = 0.5

				arg_363_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_363_1.var_.characterEffect1095ui_story.fillRatio = var_366_44
			end

			local var_366_45 = 0
			local var_366_46 = 0.45

			if var_366_45 < arg_363_1.time_ and arg_363_1.time_ <= var_366_45 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_47 = arg_363_1:FormatText(StoryNameCfg[264].name)

				arg_363_1.leftNameTxt_.text = var_366_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_48 = arg_363_1:GetWordFromCfg(411041088)
				local var_366_49 = arg_363_1:FormatText(var_366_48.content)

				arg_363_1.text_.text = var_366_49

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_50 = 18
				local var_366_51 = utf8.len(var_366_49)
				local var_366_52 = var_366_50 <= 0 and var_366_46 or var_366_46 * (var_366_51 / var_366_50)

				if var_366_52 > 0 and var_366_46 < var_366_52 then
					arg_363_1.talkMaxDuration = var_366_52

					if var_366_52 + var_366_45 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_52 + var_366_45
					end
				end

				arg_363_1.text_.text = var_366_49
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041088", "story_v_out_411041.awb") ~= 0 then
					local var_366_53 = manager.audio:GetVoiceLength("story_v_out_411041", "411041088", "story_v_out_411041.awb") / 1000

					if var_366_53 + var_366_45 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_53 + var_366_45
					end

					if var_366_48.prefab_name ~= "" and arg_363_1.actors_[var_366_48.prefab_name] ~= nil then
						local var_366_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_48.prefab_name].transform, "story_v_out_411041", "411041088", "story_v_out_411041.awb")

						arg_363_1:RecordAudio("411041088", var_366_54)
						arg_363_1:RecordAudio("411041088", var_366_54)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_411041", "411041088", "story_v_out_411041.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_411041", "411041088", "story_v_out_411041.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_55 = math.max(var_366_46, arg_363_1.talkMaxDuration)

			if var_366_45 <= arg_363_1.time_ and arg_363_1.time_ < var_366_45 + var_366_55 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_45) / var_366_55

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_45 + var_366_55 and arg_363_1.time_ < var_366_45 + var_366_55 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play411041089 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 411041089
		arg_367_1.duration_ = 7

		local var_367_0 = {
			zh = 7,
			ja = 5.266
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
				arg_367_0:Play411041090(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["10071ui_story"].transform
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.var_.moveOldPos10071ui_story = var_370_0.localPosition
			end

			local var_370_2 = 0.001

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2
				local var_370_4 = Vector3.New(0, -0.9, -6.26)

				var_370_0.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos10071ui_story, var_370_4, var_370_3)

				local var_370_5 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_5.x, var_370_5.y, var_370_5.z)

				local var_370_6 = var_370_0.localEulerAngles

				var_370_6.z = 0
				var_370_6.x = 0
				var_370_0.localEulerAngles = var_370_6
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 then
				var_370_0.localPosition = Vector3.New(0, -0.9, -6.26)

				local var_370_7 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_7.x, var_370_7.y, var_370_7.z)

				local var_370_8 = var_370_0.localEulerAngles

				var_370_8.z = 0
				var_370_8.x = 0
				var_370_0.localEulerAngles = var_370_8
			end

			local var_370_9 = arg_367_1.actors_["10071ui_story"]
			local var_370_10 = 0

			if var_370_10 < arg_367_1.time_ and arg_367_1.time_ <= var_370_10 + arg_370_0 and arg_367_1.var_.characterEffect10071ui_story == nil then
				arg_367_1.var_.characterEffect10071ui_story = var_370_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_11 = 0.200000002980232

			if var_370_10 <= arg_367_1.time_ and arg_367_1.time_ < var_370_10 + var_370_11 then
				local var_370_12 = (arg_367_1.time_ - var_370_10) / var_370_11

				if arg_367_1.var_.characterEffect10071ui_story then
					arg_367_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_367_1.time_ >= var_370_10 + var_370_11 and arg_367_1.time_ < var_370_10 + var_370_11 + arg_370_0 and arg_367_1.var_.characterEffect10071ui_story then
				arg_367_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_370_13 = 0

			if var_370_13 < arg_367_1.time_ and arg_367_1.time_ <= var_370_13 + arg_370_0 then
				arg_367_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_370_14 = arg_367_1.actors_["10014ui_story"].transform
			local var_370_15 = 0

			if var_370_15 < arg_367_1.time_ and arg_367_1.time_ <= var_370_15 + arg_370_0 then
				arg_367_1.var_.moveOldPos10014ui_story = var_370_14.localPosition
			end

			local var_370_16 = 0.001

			if var_370_15 <= arg_367_1.time_ and arg_367_1.time_ < var_370_15 + var_370_16 then
				local var_370_17 = (arg_367_1.time_ - var_370_15) / var_370_16
				local var_370_18 = Vector3.New(0, 100, 0)

				var_370_14.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos10014ui_story, var_370_18, var_370_17)

				local var_370_19 = manager.ui.mainCamera.transform.position - var_370_14.position

				var_370_14.forward = Vector3.New(var_370_19.x, var_370_19.y, var_370_19.z)

				local var_370_20 = var_370_14.localEulerAngles

				var_370_20.z = 0
				var_370_20.x = 0
				var_370_14.localEulerAngles = var_370_20
			end

			if arg_367_1.time_ >= var_370_15 + var_370_16 and arg_367_1.time_ < var_370_15 + var_370_16 + arg_370_0 then
				var_370_14.localPosition = Vector3.New(0, 100, 0)

				local var_370_21 = manager.ui.mainCamera.transform.position - var_370_14.position

				var_370_14.forward = Vector3.New(var_370_21.x, var_370_21.y, var_370_21.z)

				local var_370_22 = var_370_14.localEulerAngles

				var_370_22.z = 0
				var_370_22.x = 0
				var_370_14.localEulerAngles = var_370_22
			end

			local var_370_23 = arg_367_1.actors_["10014ui_story"]
			local var_370_24 = 0

			if var_370_24 < arg_367_1.time_ and arg_367_1.time_ <= var_370_24 + arg_370_0 and arg_367_1.var_.characterEffect10014ui_story == nil then
				arg_367_1.var_.characterEffect10014ui_story = var_370_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_25 = 0.200000002980232

			if var_370_24 <= arg_367_1.time_ and arg_367_1.time_ < var_370_24 + var_370_25 then
				local var_370_26 = (arg_367_1.time_ - var_370_24) / var_370_25

				if arg_367_1.var_.characterEffect10014ui_story then
					local var_370_27 = Mathf.Lerp(0, 0.5, var_370_26)

					arg_367_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_367_1.var_.characterEffect10014ui_story.fillRatio = var_370_27
				end
			end

			if arg_367_1.time_ >= var_370_24 + var_370_25 and arg_367_1.time_ < var_370_24 + var_370_25 + arg_370_0 and arg_367_1.var_.characterEffect10014ui_story then
				local var_370_28 = 0.5

				arg_367_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_367_1.var_.characterEffect10014ui_story.fillRatio = var_370_28
			end

			local var_370_29 = 0
			local var_370_30 = 0.6

			if var_370_29 < arg_367_1.time_ and arg_367_1.time_ <= var_370_29 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_31 = arg_367_1:FormatText(StoryNameCfg[670].name)

				arg_367_1.leftNameTxt_.text = var_370_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_32 = arg_367_1:GetWordFromCfg(411041089)
				local var_370_33 = arg_367_1:FormatText(var_370_32.content)

				arg_367_1.text_.text = var_370_33

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_34 = 24
				local var_370_35 = utf8.len(var_370_33)
				local var_370_36 = var_370_34 <= 0 and var_370_30 or var_370_30 * (var_370_35 / var_370_34)

				if var_370_36 > 0 and var_370_30 < var_370_36 then
					arg_367_1.talkMaxDuration = var_370_36

					if var_370_36 + var_370_29 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_36 + var_370_29
					end
				end

				arg_367_1.text_.text = var_370_33
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041089", "story_v_out_411041.awb") ~= 0 then
					local var_370_37 = manager.audio:GetVoiceLength("story_v_out_411041", "411041089", "story_v_out_411041.awb") / 1000

					if var_370_37 + var_370_29 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_37 + var_370_29
					end

					if var_370_32.prefab_name ~= "" and arg_367_1.actors_[var_370_32.prefab_name] ~= nil then
						local var_370_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_32.prefab_name].transform, "story_v_out_411041", "411041089", "story_v_out_411041.awb")

						arg_367_1:RecordAudio("411041089", var_370_38)
						arg_367_1:RecordAudio("411041089", var_370_38)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_411041", "411041089", "story_v_out_411041.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_411041", "411041089", "story_v_out_411041.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_39 = math.max(var_370_30, arg_367_1.talkMaxDuration)

			if var_370_29 <= arg_367_1.time_ and arg_367_1.time_ < var_370_29 + var_370_39 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_29) / var_370_39

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_29 + var_370_39 and arg_367_1.time_ < var_370_29 + var_370_39 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play411041090 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 411041090
		arg_371_1.duration_ = 10.566

		local var_371_0 = {
			zh = 10.566,
			ja = 5.466
		}
		local var_371_1 = manager.audio:GetLocalizationFlag()

		if var_371_0[var_371_1] ~= nil then
			arg_371_1.duration_ = var_371_0[var_371_1]
		end

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play411041091(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1095ui_story"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1095ui_story = var_374_0.localPosition
			end

			local var_374_2 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2
				local var_374_4 = Vector3.New(0.7, -0.98, -6.1)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1095ui_story, var_374_4, var_374_3)

				local var_374_5 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_5.x, var_374_5.y, var_374_5.z)

				local var_374_6 = var_374_0.localEulerAngles

				var_374_6.z = 0
				var_374_6.x = 0
				var_374_0.localEulerAngles = var_374_6
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_374_7 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_7.x, var_374_7.y, var_374_7.z)

				local var_374_8 = var_374_0.localEulerAngles

				var_374_8.z = 0
				var_374_8.x = 0
				var_374_0.localEulerAngles = var_374_8
			end

			local var_374_9 = arg_371_1.actors_["1095ui_story"]
			local var_374_10 = 0

			if var_374_10 < arg_371_1.time_ and arg_371_1.time_ <= var_374_10 + arg_374_0 and arg_371_1.var_.characterEffect1095ui_story == nil then
				arg_371_1.var_.characterEffect1095ui_story = var_374_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_11 = 0.200000002980232

			if var_374_10 <= arg_371_1.time_ and arg_371_1.time_ < var_374_10 + var_374_11 then
				local var_374_12 = (arg_371_1.time_ - var_374_10) / var_374_11

				if arg_371_1.var_.characterEffect1095ui_story then
					arg_371_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_371_1.time_ >= var_374_10 + var_374_11 and arg_371_1.time_ < var_374_10 + var_374_11 + arg_374_0 and arg_371_1.var_.characterEffect1095ui_story then
				arg_371_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_374_13 = 0

			if var_374_13 < arg_371_1.time_ and arg_371_1.time_ <= var_374_13 + arg_374_0 then
				arg_371_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_374_14 = 0

			if var_374_14 < arg_371_1.time_ and arg_371_1.time_ <= var_374_14 + arg_374_0 then
				arg_371_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_374_15 = arg_371_1.actors_["10071ui_story"].transform
			local var_374_16 = 0

			if var_374_16 < arg_371_1.time_ and arg_371_1.time_ <= var_374_16 + arg_374_0 then
				arg_371_1.var_.moveOldPos10071ui_story = var_374_15.localPosition
			end

			local var_374_17 = 0.001

			if var_374_16 <= arg_371_1.time_ and arg_371_1.time_ < var_374_16 + var_374_17 then
				local var_374_18 = (arg_371_1.time_ - var_374_16) / var_374_17
				local var_374_19 = Vector3.New(-0.7, -0.9, -6.26)

				var_374_15.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos10071ui_story, var_374_19, var_374_18)

				local var_374_20 = manager.ui.mainCamera.transform.position - var_374_15.position

				var_374_15.forward = Vector3.New(var_374_20.x, var_374_20.y, var_374_20.z)

				local var_374_21 = var_374_15.localEulerAngles

				var_374_21.z = 0
				var_374_21.x = 0
				var_374_15.localEulerAngles = var_374_21
			end

			if arg_371_1.time_ >= var_374_16 + var_374_17 and arg_371_1.time_ < var_374_16 + var_374_17 + arg_374_0 then
				var_374_15.localPosition = Vector3.New(-0.7, -0.9, -6.26)

				local var_374_22 = manager.ui.mainCamera.transform.position - var_374_15.position

				var_374_15.forward = Vector3.New(var_374_22.x, var_374_22.y, var_374_22.z)

				local var_374_23 = var_374_15.localEulerAngles

				var_374_23.z = 0
				var_374_23.x = 0
				var_374_15.localEulerAngles = var_374_23
			end

			local var_374_24 = arg_371_1.actors_["10071ui_story"]
			local var_374_25 = 0

			if var_374_25 < arg_371_1.time_ and arg_371_1.time_ <= var_374_25 + arg_374_0 and arg_371_1.var_.characterEffect10071ui_story == nil then
				arg_371_1.var_.characterEffect10071ui_story = var_374_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_26 = 0.200000002980232

			if var_374_25 <= arg_371_1.time_ and arg_371_1.time_ < var_374_25 + var_374_26 then
				local var_374_27 = (arg_371_1.time_ - var_374_25) / var_374_26

				if arg_371_1.var_.characterEffect10071ui_story then
					local var_374_28 = Mathf.Lerp(0, 0.5, var_374_27)

					arg_371_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_371_1.var_.characterEffect10071ui_story.fillRatio = var_374_28
				end
			end

			if arg_371_1.time_ >= var_374_25 + var_374_26 and arg_371_1.time_ < var_374_25 + var_374_26 + arg_374_0 and arg_371_1.var_.characterEffect10071ui_story then
				local var_374_29 = 0.5

				arg_371_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_371_1.var_.characterEffect10071ui_story.fillRatio = var_374_29
			end

			local var_374_30 = 0
			local var_374_31 = 0.875

			if var_374_30 < arg_371_1.time_ and arg_371_1.time_ <= var_374_30 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_32 = arg_371_1:FormatText(StoryNameCfg[471].name)

				arg_371_1.leftNameTxt_.text = var_374_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_33 = arg_371_1:GetWordFromCfg(411041090)
				local var_374_34 = arg_371_1:FormatText(var_374_33.content)

				arg_371_1.text_.text = var_374_34

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_35 = 35
				local var_374_36 = utf8.len(var_374_34)
				local var_374_37 = var_374_35 <= 0 and var_374_31 or var_374_31 * (var_374_36 / var_374_35)

				if var_374_37 > 0 and var_374_31 < var_374_37 then
					arg_371_1.talkMaxDuration = var_374_37

					if var_374_37 + var_374_30 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_37 + var_374_30
					end
				end

				arg_371_1.text_.text = var_374_34
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041090", "story_v_out_411041.awb") ~= 0 then
					local var_374_38 = manager.audio:GetVoiceLength("story_v_out_411041", "411041090", "story_v_out_411041.awb") / 1000

					if var_374_38 + var_374_30 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_38 + var_374_30
					end

					if var_374_33.prefab_name ~= "" and arg_371_1.actors_[var_374_33.prefab_name] ~= nil then
						local var_374_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_33.prefab_name].transform, "story_v_out_411041", "411041090", "story_v_out_411041.awb")

						arg_371_1:RecordAudio("411041090", var_374_39)
						arg_371_1:RecordAudio("411041090", var_374_39)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_411041", "411041090", "story_v_out_411041.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_411041", "411041090", "story_v_out_411041.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_40 = math.max(var_374_31, arg_371_1.talkMaxDuration)

			if var_374_30 <= arg_371_1.time_ and arg_371_1.time_ < var_374_30 + var_374_40 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_30) / var_374_40

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_30 + var_374_40 and arg_371_1.time_ < var_374_30 + var_374_40 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play411041091 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 411041091
		arg_375_1.duration_ = 5

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play411041092(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1095ui_story"]
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 and arg_375_1.var_.characterEffect1095ui_story == nil then
				arg_375_1.var_.characterEffect1095ui_story = var_378_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_2 = 0.200000002980232

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2

				if arg_375_1.var_.characterEffect1095ui_story then
					local var_378_4 = Mathf.Lerp(0, 0.5, var_378_3)

					arg_375_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_375_1.var_.characterEffect1095ui_story.fillRatio = var_378_4
				end
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 and arg_375_1.var_.characterEffect1095ui_story then
				local var_378_5 = 0.5

				arg_375_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_375_1.var_.characterEffect1095ui_story.fillRatio = var_378_5
			end

			local var_378_6 = 0
			local var_378_7 = 0.625

			if var_378_6 < arg_375_1.time_ and arg_375_1.time_ <= var_378_6 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, false)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_8 = arg_375_1:GetWordFromCfg(411041091)
				local var_378_9 = arg_375_1:FormatText(var_378_8.content)

				arg_375_1.text_.text = var_378_9

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_10 = 25
				local var_378_11 = utf8.len(var_378_9)
				local var_378_12 = var_378_10 <= 0 and var_378_7 or var_378_7 * (var_378_11 / var_378_10)

				if var_378_12 > 0 and var_378_7 < var_378_12 then
					arg_375_1.talkMaxDuration = var_378_12

					if var_378_12 + var_378_6 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_12 + var_378_6
					end
				end

				arg_375_1.text_.text = var_378_9
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)
				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_13 = math.max(var_378_7, arg_375_1.talkMaxDuration)

			if var_378_6 <= arg_375_1.time_ and arg_375_1.time_ < var_378_6 + var_378_13 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_6) / var_378_13

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_6 + var_378_13 and arg_375_1.time_ < var_378_6 + var_378_13 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play411041092 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 411041092
		arg_379_1.duration_ = 15.733

		local var_379_0 = {
			zh = 15.733,
			ja = 12.066
		}
		local var_379_1 = manager.audio:GetLocalizationFlag()

		if var_379_0[var_379_1] ~= nil then
			arg_379_1.duration_ = var_379_0[var_379_1]
		end

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play411041093(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1095ui_story"]
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 and arg_379_1.var_.characterEffect1095ui_story == nil then
				arg_379_1.var_.characterEffect1095ui_story = var_382_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_2 = 0.200000002980232

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2

				if arg_379_1.var_.characterEffect1095ui_story then
					arg_379_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 and arg_379_1.var_.characterEffect1095ui_story then
				arg_379_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_382_4 = 0
			local var_382_5 = 1.425

			if var_382_4 < arg_379_1.time_ and arg_379_1.time_ <= var_382_4 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_6 = arg_379_1:FormatText(StoryNameCfg[471].name)

				arg_379_1.leftNameTxt_.text = var_382_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_7 = arg_379_1:GetWordFromCfg(411041092)
				local var_382_8 = arg_379_1:FormatText(var_382_7.content)

				arg_379_1.text_.text = var_382_8

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_9 = 57
				local var_382_10 = utf8.len(var_382_8)
				local var_382_11 = var_382_9 <= 0 and var_382_5 or var_382_5 * (var_382_10 / var_382_9)

				if var_382_11 > 0 and var_382_5 < var_382_11 then
					arg_379_1.talkMaxDuration = var_382_11

					if var_382_11 + var_382_4 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_11 + var_382_4
					end
				end

				arg_379_1.text_.text = var_382_8
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041092", "story_v_out_411041.awb") ~= 0 then
					local var_382_12 = manager.audio:GetVoiceLength("story_v_out_411041", "411041092", "story_v_out_411041.awb") / 1000

					if var_382_12 + var_382_4 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_12 + var_382_4
					end

					if var_382_7.prefab_name ~= "" and arg_379_1.actors_[var_382_7.prefab_name] ~= nil then
						local var_382_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_7.prefab_name].transform, "story_v_out_411041", "411041092", "story_v_out_411041.awb")

						arg_379_1:RecordAudio("411041092", var_382_13)
						arg_379_1:RecordAudio("411041092", var_382_13)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_411041", "411041092", "story_v_out_411041.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_411041", "411041092", "story_v_out_411041.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_14 = math.max(var_382_5, arg_379_1.talkMaxDuration)

			if var_382_4 <= arg_379_1.time_ and arg_379_1.time_ < var_382_4 + var_382_14 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_4) / var_382_14

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_4 + var_382_14 and arg_379_1.time_ < var_382_4 + var_382_14 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play411041093 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 411041093
		arg_383_1.duration_ = 6.566

		local var_383_0 = {
			zh = 6.566,
			ja = 5.766
		}
		local var_383_1 = manager.audio:GetLocalizationFlag()

		if var_383_0[var_383_1] ~= nil then
			arg_383_1.duration_ = var_383_0[var_383_1]
		end

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play411041094(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0
			local var_386_1 = 0.9

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_2 = arg_383_1:FormatText(StoryNameCfg[471].name)

				arg_383_1.leftNameTxt_.text = var_386_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_3 = arg_383_1:GetWordFromCfg(411041093)
				local var_386_4 = arg_383_1:FormatText(var_386_3.content)

				arg_383_1.text_.text = var_386_4

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_5 = 36
				local var_386_6 = utf8.len(var_386_4)
				local var_386_7 = var_386_5 <= 0 and var_386_1 or var_386_1 * (var_386_6 / var_386_5)

				if var_386_7 > 0 and var_386_1 < var_386_7 then
					arg_383_1.talkMaxDuration = var_386_7

					if var_386_7 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_7 + var_386_0
					end
				end

				arg_383_1.text_.text = var_386_4
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041093", "story_v_out_411041.awb") ~= 0 then
					local var_386_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041093", "story_v_out_411041.awb") / 1000

					if var_386_8 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_8 + var_386_0
					end

					if var_386_3.prefab_name ~= "" and arg_383_1.actors_[var_386_3.prefab_name] ~= nil then
						local var_386_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_3.prefab_name].transform, "story_v_out_411041", "411041093", "story_v_out_411041.awb")

						arg_383_1:RecordAudio("411041093", var_386_9)
						arg_383_1:RecordAudio("411041093", var_386_9)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_411041", "411041093", "story_v_out_411041.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_411041", "411041093", "story_v_out_411041.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_10 = math.max(var_386_1, arg_383_1.talkMaxDuration)

			if var_386_0 <= arg_383_1.time_ and arg_383_1.time_ < var_386_0 + var_386_10 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_0) / var_386_10

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_0 + var_386_10 and arg_383_1.time_ < var_386_0 + var_386_10 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play411041094 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 411041094
		arg_387_1.duration_ = 5

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play411041095(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["1095ui_story"]
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 and arg_387_1.var_.characterEffect1095ui_story == nil then
				arg_387_1.var_.characterEffect1095ui_story = var_390_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_2 = 0.200000002980232

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_2 then
				local var_390_3 = (arg_387_1.time_ - var_390_1) / var_390_2

				if arg_387_1.var_.characterEffect1095ui_story then
					local var_390_4 = Mathf.Lerp(0, 0.5, var_390_3)

					arg_387_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_387_1.var_.characterEffect1095ui_story.fillRatio = var_390_4
				end
			end

			if arg_387_1.time_ >= var_390_1 + var_390_2 and arg_387_1.time_ < var_390_1 + var_390_2 + arg_390_0 and arg_387_1.var_.characterEffect1095ui_story then
				local var_390_5 = 0.5

				arg_387_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_387_1.var_.characterEffect1095ui_story.fillRatio = var_390_5
			end

			local var_390_6 = 0
			local var_390_7 = 0.6

			if var_390_6 < arg_387_1.time_ and arg_387_1.time_ <= var_390_6 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, false)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_8 = arg_387_1:GetWordFromCfg(411041094)
				local var_390_9 = arg_387_1:FormatText(var_390_8.content)

				arg_387_1.text_.text = var_390_9

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_10 = 24
				local var_390_11 = utf8.len(var_390_9)
				local var_390_12 = var_390_10 <= 0 and var_390_7 or var_390_7 * (var_390_11 / var_390_10)

				if var_390_12 > 0 and var_390_7 < var_390_12 then
					arg_387_1.talkMaxDuration = var_390_12

					if var_390_12 + var_390_6 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_12 + var_390_6
					end
				end

				arg_387_1.text_.text = var_390_9
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)
				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_13 = math.max(var_390_7, arg_387_1.talkMaxDuration)

			if var_390_6 <= arg_387_1.time_ and arg_387_1.time_ < var_390_6 + var_390_13 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_6) / var_390_13

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_6 + var_390_13 and arg_387_1.time_ < var_390_6 + var_390_13 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play411041095 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 411041095
		arg_391_1.duration_ = 8.6

		local var_391_0 = {
			zh = 5.5,
			ja = 8.6
		}
		local var_391_1 = manager.audio:GetLocalizationFlag()

		if var_391_0[var_391_1] ~= nil then
			arg_391_1.duration_ = var_391_0[var_391_1]
		end

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play411041096(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1095ui_story"].transform
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.var_.moveOldPos1095ui_story = var_394_0.localPosition
			end

			local var_394_2 = 0.001

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2
				local var_394_4 = Vector3.New(0.7, -0.98, -6.1)

				var_394_0.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1095ui_story, var_394_4, var_394_3)

				local var_394_5 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_5.x, var_394_5.y, var_394_5.z)

				local var_394_6 = var_394_0.localEulerAngles

				var_394_6.z = 0
				var_394_6.x = 0
				var_394_0.localEulerAngles = var_394_6
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 then
				var_394_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_394_7 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_7.x, var_394_7.y, var_394_7.z)

				local var_394_8 = var_394_0.localEulerAngles

				var_394_8.z = 0
				var_394_8.x = 0
				var_394_0.localEulerAngles = var_394_8
			end

			local var_394_9 = arg_391_1.actors_["1095ui_story"]
			local var_394_10 = 0

			if var_394_10 < arg_391_1.time_ and arg_391_1.time_ <= var_394_10 + arg_394_0 and arg_391_1.var_.characterEffect1095ui_story == nil then
				arg_391_1.var_.characterEffect1095ui_story = var_394_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_11 = 0.200000002980232

			if var_394_10 <= arg_391_1.time_ and arg_391_1.time_ < var_394_10 + var_394_11 then
				local var_394_12 = (arg_391_1.time_ - var_394_10) / var_394_11

				if arg_391_1.var_.characterEffect1095ui_story then
					arg_391_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_391_1.time_ >= var_394_10 + var_394_11 and arg_391_1.time_ < var_394_10 + var_394_11 + arg_394_0 and arg_391_1.var_.characterEffect1095ui_story then
				arg_391_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_394_13 = 0

			if var_394_13 < arg_391_1.time_ and arg_391_1.time_ <= var_394_13 + arg_394_0 then
				arg_391_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_394_14 = 0

			if var_394_14 < arg_391_1.time_ and arg_391_1.time_ <= var_394_14 + arg_394_0 then
				arg_391_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_394_15 = 0
			local var_394_16 = 0.6

			if var_394_15 < arg_391_1.time_ and arg_391_1.time_ <= var_394_15 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_17 = arg_391_1:FormatText(StoryNameCfg[471].name)

				arg_391_1.leftNameTxt_.text = var_394_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_18 = arg_391_1:GetWordFromCfg(411041095)
				local var_394_19 = arg_391_1:FormatText(var_394_18.content)

				arg_391_1.text_.text = var_394_19

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_20 = 24
				local var_394_21 = utf8.len(var_394_19)
				local var_394_22 = var_394_20 <= 0 and var_394_16 or var_394_16 * (var_394_21 / var_394_20)

				if var_394_22 > 0 and var_394_16 < var_394_22 then
					arg_391_1.talkMaxDuration = var_394_22

					if var_394_22 + var_394_15 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_22 + var_394_15
					end
				end

				arg_391_1.text_.text = var_394_19
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041095", "story_v_out_411041.awb") ~= 0 then
					local var_394_23 = manager.audio:GetVoiceLength("story_v_out_411041", "411041095", "story_v_out_411041.awb") / 1000

					if var_394_23 + var_394_15 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_23 + var_394_15
					end

					if var_394_18.prefab_name ~= "" and arg_391_1.actors_[var_394_18.prefab_name] ~= nil then
						local var_394_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_18.prefab_name].transform, "story_v_out_411041", "411041095", "story_v_out_411041.awb")

						arg_391_1:RecordAudio("411041095", var_394_24)
						arg_391_1:RecordAudio("411041095", var_394_24)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_411041", "411041095", "story_v_out_411041.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_411041", "411041095", "story_v_out_411041.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_25 = math.max(var_394_16, arg_391_1.talkMaxDuration)

			if var_394_15 <= arg_391_1.time_ and arg_391_1.time_ < var_394_15 + var_394_25 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_15) / var_394_25

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_15 + var_394_25 and arg_391_1.time_ < var_394_15 + var_394_25 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play411041096 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 411041096
		arg_395_1.duration_ = 7.266

		local var_395_0 = {
			zh = 7.266,
			ja = 5.4
		}
		local var_395_1 = manager.audio:GetLocalizationFlag()

		if var_395_0[var_395_1] ~= nil then
			arg_395_1.duration_ = var_395_0[var_395_1]
		end

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play411041097(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["10071ui_story"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos10071ui_story = var_398_0.localPosition
			end

			local var_398_2 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2
				local var_398_4 = Vector3.New(-0.7, -0.9, -6.26)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos10071ui_story, var_398_4, var_398_3)

				local var_398_5 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_5.x, var_398_5.y, var_398_5.z)

				local var_398_6 = var_398_0.localEulerAngles

				var_398_6.z = 0
				var_398_6.x = 0
				var_398_0.localEulerAngles = var_398_6
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(-0.7, -0.9, -6.26)

				local var_398_7 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_7.x, var_398_7.y, var_398_7.z)

				local var_398_8 = var_398_0.localEulerAngles

				var_398_8.z = 0
				var_398_8.x = 0
				var_398_0.localEulerAngles = var_398_8
			end

			local var_398_9 = arg_395_1.actors_["10071ui_story"]
			local var_398_10 = 0

			if var_398_10 < arg_395_1.time_ and arg_395_1.time_ <= var_398_10 + arg_398_0 and arg_395_1.var_.characterEffect10071ui_story == nil then
				arg_395_1.var_.characterEffect10071ui_story = var_398_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_11 = 0.200000002980232

			if var_398_10 <= arg_395_1.time_ and arg_395_1.time_ < var_398_10 + var_398_11 then
				local var_398_12 = (arg_395_1.time_ - var_398_10) / var_398_11

				if arg_395_1.var_.characterEffect10071ui_story then
					arg_395_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_395_1.time_ >= var_398_10 + var_398_11 and arg_395_1.time_ < var_398_10 + var_398_11 + arg_398_0 and arg_395_1.var_.characterEffect10071ui_story then
				arg_395_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_398_13 = 0

			if var_398_13 < arg_395_1.time_ and arg_395_1.time_ <= var_398_13 + arg_398_0 then
				arg_395_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action3_1")
			end

			local var_398_14 = 0

			if var_398_14 < arg_395_1.time_ and arg_395_1.time_ <= var_398_14 + arg_398_0 then
				arg_395_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_398_15 = arg_395_1.actors_["1095ui_story"]
			local var_398_16 = 0

			if var_398_16 < arg_395_1.time_ and arg_395_1.time_ <= var_398_16 + arg_398_0 and arg_395_1.var_.characterEffect1095ui_story == nil then
				arg_395_1.var_.characterEffect1095ui_story = var_398_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_17 = 0.200000002980232

			if var_398_16 <= arg_395_1.time_ and arg_395_1.time_ < var_398_16 + var_398_17 then
				local var_398_18 = (arg_395_1.time_ - var_398_16) / var_398_17

				if arg_395_1.var_.characterEffect1095ui_story then
					local var_398_19 = Mathf.Lerp(0, 0.5, var_398_18)

					arg_395_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1095ui_story.fillRatio = var_398_19
				end
			end

			if arg_395_1.time_ >= var_398_16 + var_398_17 and arg_395_1.time_ < var_398_16 + var_398_17 + arg_398_0 and arg_395_1.var_.characterEffect1095ui_story then
				local var_398_20 = 0.5

				arg_395_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1095ui_story.fillRatio = var_398_20
			end

			local var_398_21 = 0
			local var_398_22 = 0.525

			if var_398_21 < arg_395_1.time_ and arg_395_1.time_ <= var_398_21 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_23 = arg_395_1:FormatText(StoryNameCfg[670].name)

				arg_395_1.leftNameTxt_.text = var_398_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_24 = arg_395_1:GetWordFromCfg(411041096)
				local var_398_25 = arg_395_1:FormatText(var_398_24.content)

				arg_395_1.text_.text = var_398_25

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_26 = 21
				local var_398_27 = utf8.len(var_398_25)
				local var_398_28 = var_398_26 <= 0 and var_398_22 or var_398_22 * (var_398_27 / var_398_26)

				if var_398_28 > 0 and var_398_22 < var_398_28 then
					arg_395_1.talkMaxDuration = var_398_28

					if var_398_28 + var_398_21 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_28 + var_398_21
					end
				end

				arg_395_1.text_.text = var_398_25
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041096", "story_v_out_411041.awb") ~= 0 then
					local var_398_29 = manager.audio:GetVoiceLength("story_v_out_411041", "411041096", "story_v_out_411041.awb") / 1000

					if var_398_29 + var_398_21 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_29 + var_398_21
					end

					if var_398_24.prefab_name ~= "" and arg_395_1.actors_[var_398_24.prefab_name] ~= nil then
						local var_398_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_24.prefab_name].transform, "story_v_out_411041", "411041096", "story_v_out_411041.awb")

						arg_395_1:RecordAudio("411041096", var_398_30)
						arg_395_1:RecordAudio("411041096", var_398_30)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_411041", "411041096", "story_v_out_411041.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_411041", "411041096", "story_v_out_411041.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_31 = math.max(var_398_22, arg_395_1.talkMaxDuration)

			if var_398_21 <= arg_395_1.time_ and arg_395_1.time_ < var_398_21 + var_398_31 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_21) / var_398_31

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_21 + var_398_31 and arg_395_1.time_ < var_398_21 + var_398_31 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play411041097 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 411041097
		arg_399_1.duration_ = 15.433

		local var_399_0 = {
			zh = 15.433,
			ja = 8.5
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
				arg_399_0:Play411041098(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = 0
			local var_402_1 = 1.225

			if var_402_0 < arg_399_1.time_ and arg_399_1.time_ <= var_402_0 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_2 = arg_399_1:FormatText(StoryNameCfg[670].name)

				arg_399_1.leftNameTxt_.text = var_402_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_3 = arg_399_1:GetWordFromCfg(411041097)
				local var_402_4 = arg_399_1:FormatText(var_402_3.content)

				arg_399_1.text_.text = var_402_4

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_5 = 49
				local var_402_6 = utf8.len(var_402_4)
				local var_402_7 = var_402_5 <= 0 and var_402_1 or var_402_1 * (var_402_6 / var_402_5)

				if var_402_7 > 0 and var_402_1 < var_402_7 then
					arg_399_1.talkMaxDuration = var_402_7

					if var_402_7 + var_402_0 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_7 + var_402_0
					end
				end

				arg_399_1.text_.text = var_402_4
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041097", "story_v_out_411041.awb") ~= 0 then
					local var_402_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041097", "story_v_out_411041.awb") / 1000

					if var_402_8 + var_402_0 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_8 + var_402_0
					end

					if var_402_3.prefab_name ~= "" and arg_399_1.actors_[var_402_3.prefab_name] ~= nil then
						local var_402_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_3.prefab_name].transform, "story_v_out_411041", "411041097", "story_v_out_411041.awb")

						arg_399_1:RecordAudio("411041097", var_402_9)
						arg_399_1:RecordAudio("411041097", var_402_9)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_out_411041", "411041097", "story_v_out_411041.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_out_411041", "411041097", "story_v_out_411041.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_10 = math.max(var_402_1, arg_399_1.talkMaxDuration)

			if var_402_0 <= arg_399_1.time_ and arg_399_1.time_ < var_402_0 + var_402_10 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_0) / var_402_10

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_0 + var_402_10 and arg_399_1.time_ < var_402_0 + var_402_10 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play411041098 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 411041098
		arg_403_1.duration_ = 10.5

		local var_403_0 = {
			zh = 10.5,
			ja = 9.9
		}
		local var_403_1 = manager.audio:GetLocalizationFlag()

		if var_403_0[var_403_1] ~= nil then
			arg_403_1.duration_ = var_403_0[var_403_1]
		end

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play411041099(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = 0
			local var_406_1 = 1.1

			if var_406_0 < arg_403_1.time_ and arg_403_1.time_ <= var_406_0 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_2 = arg_403_1:FormatText(StoryNameCfg[670].name)

				arg_403_1.leftNameTxt_.text = var_406_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_3 = arg_403_1:GetWordFromCfg(411041098)
				local var_406_4 = arg_403_1:FormatText(var_406_3.content)

				arg_403_1.text_.text = var_406_4

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_5 = 44
				local var_406_6 = utf8.len(var_406_4)
				local var_406_7 = var_406_5 <= 0 and var_406_1 or var_406_1 * (var_406_6 / var_406_5)

				if var_406_7 > 0 and var_406_1 < var_406_7 then
					arg_403_1.talkMaxDuration = var_406_7

					if var_406_7 + var_406_0 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_7 + var_406_0
					end
				end

				arg_403_1.text_.text = var_406_4
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041098", "story_v_out_411041.awb") ~= 0 then
					local var_406_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041098", "story_v_out_411041.awb") / 1000

					if var_406_8 + var_406_0 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_8 + var_406_0
					end

					if var_406_3.prefab_name ~= "" and arg_403_1.actors_[var_406_3.prefab_name] ~= nil then
						local var_406_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_3.prefab_name].transform, "story_v_out_411041", "411041098", "story_v_out_411041.awb")

						arg_403_1:RecordAudio("411041098", var_406_9)
						arg_403_1:RecordAudio("411041098", var_406_9)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_411041", "411041098", "story_v_out_411041.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_411041", "411041098", "story_v_out_411041.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_10 = math.max(var_406_1, arg_403_1.talkMaxDuration)

			if var_406_0 <= arg_403_1.time_ and arg_403_1.time_ < var_406_0 + var_406_10 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_0) / var_406_10

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_0 + var_406_10 and arg_403_1.time_ < var_406_0 + var_406_10 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play411041099 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 411041099
		arg_407_1.duration_ = 8.1

		local var_407_0 = {
			zh = 8.1,
			ja = 7
		}
		local var_407_1 = manager.audio:GetLocalizationFlag()

		if var_407_0[var_407_1] ~= nil then
			arg_407_1.duration_ = var_407_0[var_407_1]
		end

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play411041100(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["10014ui_story"].transform
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 then
				arg_407_1.var_.moveOldPos10014ui_story = var_410_0.localPosition
			end

			local var_410_2 = 0.001

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2
				local var_410_4 = Vector3.New(0, -1.06, -6.2)

				var_410_0.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos10014ui_story, var_410_4, var_410_3)

				local var_410_5 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_5.x, var_410_5.y, var_410_5.z)

				local var_410_6 = var_410_0.localEulerAngles

				var_410_6.z = 0
				var_410_6.x = 0
				var_410_0.localEulerAngles = var_410_6
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 then
				var_410_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_410_7 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_7.x, var_410_7.y, var_410_7.z)

				local var_410_8 = var_410_0.localEulerAngles

				var_410_8.z = 0
				var_410_8.x = 0
				var_410_0.localEulerAngles = var_410_8
			end

			local var_410_9 = arg_407_1.actors_["10014ui_story"]
			local var_410_10 = 0

			if var_410_10 < arg_407_1.time_ and arg_407_1.time_ <= var_410_10 + arg_410_0 and arg_407_1.var_.characterEffect10014ui_story == nil then
				arg_407_1.var_.characterEffect10014ui_story = var_410_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_11 = 0.200000002980232

			if var_410_10 <= arg_407_1.time_ and arg_407_1.time_ < var_410_10 + var_410_11 then
				local var_410_12 = (arg_407_1.time_ - var_410_10) / var_410_11

				if arg_407_1.var_.characterEffect10014ui_story then
					arg_407_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_407_1.time_ >= var_410_10 + var_410_11 and arg_407_1.time_ < var_410_10 + var_410_11 + arg_410_0 and arg_407_1.var_.characterEffect10014ui_story then
				arg_407_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_410_13 = 0

			if var_410_13 < arg_407_1.time_ and arg_407_1.time_ <= var_410_13 + arg_410_0 then
				arg_407_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action4_1")
			end

			local var_410_14 = 0

			if var_410_14 < arg_407_1.time_ and arg_407_1.time_ <= var_410_14 + arg_410_0 then
				arg_407_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_410_15 = arg_407_1.actors_["10071ui_story"].transform
			local var_410_16 = 0

			if var_410_16 < arg_407_1.time_ and arg_407_1.time_ <= var_410_16 + arg_410_0 then
				arg_407_1.var_.moveOldPos10071ui_story = var_410_15.localPosition
			end

			local var_410_17 = 0.001

			if var_410_16 <= arg_407_1.time_ and arg_407_1.time_ < var_410_16 + var_410_17 then
				local var_410_18 = (arg_407_1.time_ - var_410_16) / var_410_17
				local var_410_19 = Vector3.New(0, 100, 0)

				var_410_15.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos10071ui_story, var_410_19, var_410_18)

				local var_410_20 = manager.ui.mainCamera.transform.position - var_410_15.position

				var_410_15.forward = Vector3.New(var_410_20.x, var_410_20.y, var_410_20.z)

				local var_410_21 = var_410_15.localEulerAngles

				var_410_21.z = 0
				var_410_21.x = 0
				var_410_15.localEulerAngles = var_410_21
			end

			if arg_407_1.time_ >= var_410_16 + var_410_17 and arg_407_1.time_ < var_410_16 + var_410_17 + arg_410_0 then
				var_410_15.localPosition = Vector3.New(0, 100, 0)

				local var_410_22 = manager.ui.mainCamera.transform.position - var_410_15.position

				var_410_15.forward = Vector3.New(var_410_22.x, var_410_22.y, var_410_22.z)

				local var_410_23 = var_410_15.localEulerAngles

				var_410_23.z = 0
				var_410_23.x = 0
				var_410_15.localEulerAngles = var_410_23
			end

			local var_410_24 = arg_407_1.actors_["10071ui_story"]
			local var_410_25 = 0

			if var_410_25 < arg_407_1.time_ and arg_407_1.time_ <= var_410_25 + arg_410_0 and arg_407_1.var_.characterEffect10071ui_story == nil then
				arg_407_1.var_.characterEffect10071ui_story = var_410_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_26 = 0.200000002980232

			if var_410_25 <= arg_407_1.time_ and arg_407_1.time_ < var_410_25 + var_410_26 then
				local var_410_27 = (arg_407_1.time_ - var_410_25) / var_410_26

				if arg_407_1.var_.characterEffect10071ui_story then
					local var_410_28 = Mathf.Lerp(0, 0.5, var_410_27)

					arg_407_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_407_1.var_.characterEffect10071ui_story.fillRatio = var_410_28
				end
			end

			if arg_407_1.time_ >= var_410_25 + var_410_26 and arg_407_1.time_ < var_410_25 + var_410_26 + arg_410_0 and arg_407_1.var_.characterEffect10071ui_story then
				local var_410_29 = 0.5

				arg_407_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_407_1.var_.characterEffect10071ui_story.fillRatio = var_410_29
			end

			local var_410_30 = arg_407_1.actors_["1095ui_story"].transform
			local var_410_31 = 0

			if var_410_31 < arg_407_1.time_ and arg_407_1.time_ <= var_410_31 + arg_410_0 then
				arg_407_1.var_.moveOldPos1095ui_story = var_410_30.localPosition
			end

			local var_410_32 = 0.001

			if var_410_31 <= arg_407_1.time_ and arg_407_1.time_ < var_410_31 + var_410_32 then
				local var_410_33 = (arg_407_1.time_ - var_410_31) / var_410_32
				local var_410_34 = Vector3.New(0, 100, 0)

				var_410_30.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos1095ui_story, var_410_34, var_410_33)

				local var_410_35 = manager.ui.mainCamera.transform.position - var_410_30.position

				var_410_30.forward = Vector3.New(var_410_35.x, var_410_35.y, var_410_35.z)

				local var_410_36 = var_410_30.localEulerAngles

				var_410_36.z = 0
				var_410_36.x = 0
				var_410_30.localEulerAngles = var_410_36
			end

			if arg_407_1.time_ >= var_410_31 + var_410_32 and arg_407_1.time_ < var_410_31 + var_410_32 + arg_410_0 then
				var_410_30.localPosition = Vector3.New(0, 100, 0)

				local var_410_37 = manager.ui.mainCamera.transform.position - var_410_30.position

				var_410_30.forward = Vector3.New(var_410_37.x, var_410_37.y, var_410_37.z)

				local var_410_38 = var_410_30.localEulerAngles

				var_410_38.z = 0
				var_410_38.x = 0
				var_410_30.localEulerAngles = var_410_38
			end

			local var_410_39 = arg_407_1.actors_["1095ui_story"]
			local var_410_40 = 0

			if var_410_40 < arg_407_1.time_ and arg_407_1.time_ <= var_410_40 + arg_410_0 and arg_407_1.var_.characterEffect1095ui_story == nil then
				arg_407_1.var_.characterEffect1095ui_story = var_410_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_41 = 0.200000002980232

			if var_410_40 <= arg_407_1.time_ and arg_407_1.time_ < var_410_40 + var_410_41 then
				local var_410_42 = (arg_407_1.time_ - var_410_40) / var_410_41

				if arg_407_1.var_.characterEffect1095ui_story then
					local var_410_43 = Mathf.Lerp(0, 0.5, var_410_42)

					arg_407_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_407_1.var_.characterEffect1095ui_story.fillRatio = var_410_43
				end
			end

			if arg_407_1.time_ >= var_410_40 + var_410_41 and arg_407_1.time_ < var_410_40 + var_410_41 + arg_410_0 and arg_407_1.var_.characterEffect1095ui_story then
				local var_410_44 = 0.5

				arg_407_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_407_1.var_.characterEffect1095ui_story.fillRatio = var_410_44
			end

			local var_410_45 = 0
			local var_410_46 = 0.925

			if var_410_45 < arg_407_1.time_ and arg_407_1.time_ <= var_410_45 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_47 = arg_407_1:FormatText(StoryNameCfg[264].name)

				arg_407_1.leftNameTxt_.text = var_410_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_48 = arg_407_1:GetWordFromCfg(411041099)
				local var_410_49 = arg_407_1:FormatText(var_410_48.content)

				arg_407_1.text_.text = var_410_49

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_50 = 37
				local var_410_51 = utf8.len(var_410_49)
				local var_410_52 = var_410_50 <= 0 and var_410_46 or var_410_46 * (var_410_51 / var_410_50)

				if var_410_52 > 0 and var_410_46 < var_410_52 then
					arg_407_1.talkMaxDuration = var_410_52

					if var_410_52 + var_410_45 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_52 + var_410_45
					end
				end

				arg_407_1.text_.text = var_410_49
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041099", "story_v_out_411041.awb") ~= 0 then
					local var_410_53 = manager.audio:GetVoiceLength("story_v_out_411041", "411041099", "story_v_out_411041.awb") / 1000

					if var_410_53 + var_410_45 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_53 + var_410_45
					end

					if var_410_48.prefab_name ~= "" and arg_407_1.actors_[var_410_48.prefab_name] ~= nil then
						local var_410_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_48.prefab_name].transform, "story_v_out_411041", "411041099", "story_v_out_411041.awb")

						arg_407_1:RecordAudio("411041099", var_410_54)
						arg_407_1:RecordAudio("411041099", var_410_54)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_411041", "411041099", "story_v_out_411041.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_411041", "411041099", "story_v_out_411041.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_55 = math.max(var_410_46, arg_407_1.talkMaxDuration)

			if var_410_45 <= arg_407_1.time_ and arg_407_1.time_ < var_410_45 + var_410_55 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_45) / var_410_55

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_45 + var_410_55 and arg_407_1.time_ < var_410_45 + var_410_55 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play411041100 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 411041100
		arg_411_1.duration_ = 1.999999999999

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play411041101(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["10071ui_story"].transform
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 then
				arg_411_1.var_.moveOldPos10071ui_story = var_414_0.localPosition
			end

			local var_414_2 = 0.001

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2
				local var_414_4 = Vector3.New(0.7, -0.9, -6.26)

				var_414_0.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos10071ui_story, var_414_4, var_414_3)

				local var_414_5 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_5.x, var_414_5.y, var_414_5.z)

				local var_414_6 = var_414_0.localEulerAngles

				var_414_6.z = 0
				var_414_6.x = 0
				var_414_0.localEulerAngles = var_414_6
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 then
				var_414_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_414_7 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_7.x, var_414_7.y, var_414_7.z)

				local var_414_8 = var_414_0.localEulerAngles

				var_414_8.z = 0
				var_414_8.x = 0
				var_414_0.localEulerAngles = var_414_8
			end

			local var_414_9 = arg_411_1.actors_["10071ui_story"]
			local var_414_10 = 0

			if var_414_10 < arg_411_1.time_ and arg_411_1.time_ <= var_414_10 + arg_414_0 and arg_411_1.var_.characterEffect10071ui_story == nil then
				arg_411_1.var_.characterEffect10071ui_story = var_414_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_11 = 0.200000002980232

			if var_414_10 <= arg_411_1.time_ and arg_411_1.time_ < var_414_10 + var_414_11 then
				local var_414_12 = (arg_411_1.time_ - var_414_10) / var_414_11

				if arg_411_1.var_.characterEffect10071ui_story then
					arg_411_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_411_1.time_ >= var_414_10 + var_414_11 and arg_411_1.time_ < var_414_10 + var_414_11 + arg_414_0 and arg_411_1.var_.characterEffect10071ui_story then
				arg_411_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_414_13 = 0

			if var_414_13 < arg_411_1.time_ and arg_411_1.time_ <= var_414_13 + arg_414_0 then
				arg_411_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action3_2")
			end

			local var_414_14 = 0

			if var_414_14 < arg_411_1.time_ and arg_411_1.time_ <= var_414_14 + arg_414_0 then
				arg_411_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_414_15 = arg_411_1.actors_["10014ui_story"].transform
			local var_414_16 = 0

			if var_414_16 < arg_411_1.time_ and arg_411_1.time_ <= var_414_16 + arg_414_0 then
				arg_411_1.var_.moveOldPos10014ui_story = var_414_15.localPosition
			end

			local var_414_17 = 0.001

			if var_414_16 <= arg_411_1.time_ and arg_411_1.time_ < var_414_16 + var_414_17 then
				local var_414_18 = (arg_411_1.time_ - var_414_16) / var_414_17
				local var_414_19 = Vector3.New(-0.7, -1.06, -6.2)

				var_414_15.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos10014ui_story, var_414_19, var_414_18)

				local var_414_20 = manager.ui.mainCamera.transform.position - var_414_15.position

				var_414_15.forward = Vector3.New(var_414_20.x, var_414_20.y, var_414_20.z)

				local var_414_21 = var_414_15.localEulerAngles

				var_414_21.z = 0
				var_414_21.x = 0
				var_414_15.localEulerAngles = var_414_21
			end

			if arg_411_1.time_ >= var_414_16 + var_414_17 and arg_411_1.time_ < var_414_16 + var_414_17 + arg_414_0 then
				var_414_15.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_414_22 = manager.ui.mainCamera.transform.position - var_414_15.position

				var_414_15.forward = Vector3.New(var_414_22.x, var_414_22.y, var_414_22.z)

				local var_414_23 = var_414_15.localEulerAngles

				var_414_23.z = 0
				var_414_23.x = 0
				var_414_15.localEulerAngles = var_414_23
			end

			local var_414_24 = arg_411_1.actors_["10014ui_story"]
			local var_414_25 = 0

			if var_414_25 < arg_411_1.time_ and arg_411_1.time_ <= var_414_25 + arg_414_0 and arg_411_1.var_.characterEffect10014ui_story == nil then
				arg_411_1.var_.characterEffect10014ui_story = var_414_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_26 = 0.200000002980232

			if var_414_25 <= arg_411_1.time_ and arg_411_1.time_ < var_414_25 + var_414_26 then
				local var_414_27 = (arg_411_1.time_ - var_414_25) / var_414_26

				if arg_411_1.var_.characterEffect10014ui_story then
					local var_414_28 = Mathf.Lerp(0, 0.5, var_414_27)

					arg_411_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_411_1.var_.characterEffect10014ui_story.fillRatio = var_414_28
				end
			end

			if arg_411_1.time_ >= var_414_25 + var_414_26 and arg_411_1.time_ < var_414_25 + var_414_26 + arg_414_0 and arg_411_1.var_.characterEffect10014ui_story then
				local var_414_29 = 0.5

				arg_411_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_411_1.var_.characterEffect10014ui_story.fillRatio = var_414_29
			end

			local var_414_30 = 0
			local var_414_31 = 0.125

			if var_414_30 < arg_411_1.time_ and arg_411_1.time_ <= var_414_30 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_32 = arg_411_1:FormatText(StoryNameCfg[670].name)

				arg_411_1.leftNameTxt_.text = var_414_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_33 = arg_411_1:GetWordFromCfg(411041100)
				local var_414_34 = arg_411_1:FormatText(var_414_33.content)

				arg_411_1.text_.text = var_414_34

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_35 = 5
				local var_414_36 = utf8.len(var_414_34)
				local var_414_37 = var_414_35 <= 0 and var_414_31 or var_414_31 * (var_414_36 / var_414_35)

				if var_414_37 > 0 and var_414_31 < var_414_37 then
					arg_411_1.talkMaxDuration = var_414_37

					if var_414_37 + var_414_30 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_37 + var_414_30
					end
				end

				arg_411_1.text_.text = var_414_34
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041100", "story_v_out_411041.awb") ~= 0 then
					local var_414_38 = manager.audio:GetVoiceLength("story_v_out_411041", "411041100", "story_v_out_411041.awb") / 1000

					if var_414_38 + var_414_30 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_38 + var_414_30
					end

					if var_414_33.prefab_name ~= "" and arg_411_1.actors_[var_414_33.prefab_name] ~= nil then
						local var_414_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_33.prefab_name].transform, "story_v_out_411041", "411041100", "story_v_out_411041.awb")

						arg_411_1:RecordAudio("411041100", var_414_39)
						arg_411_1:RecordAudio("411041100", var_414_39)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_out_411041", "411041100", "story_v_out_411041.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_out_411041", "411041100", "story_v_out_411041.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_40 = math.max(var_414_31, arg_411_1.talkMaxDuration)

			if var_414_30 <= arg_411_1.time_ and arg_411_1.time_ < var_414_30 + var_414_40 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_30) / var_414_40

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_30 + var_414_40 and arg_411_1.time_ < var_414_30 + var_414_40 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play411041101 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 411041101
		arg_415_1.duration_ = 10.3

		local var_415_0 = {
			zh = 10.2,
			ja = 10.3
		}
		local var_415_1 = manager.audio:GetLocalizationFlag()

		if var_415_0[var_415_1] ~= nil then
			arg_415_1.duration_ = var_415_0[var_415_1]
		end

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play411041102(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["10014ui_story"].transform
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 then
				arg_415_1.var_.moveOldPos10014ui_story = var_418_0.localPosition
			end

			local var_418_2 = 0.001

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2
				local var_418_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_418_0.localPosition = Vector3.Lerp(arg_415_1.var_.moveOldPos10014ui_story, var_418_4, var_418_3)

				local var_418_5 = manager.ui.mainCamera.transform.position - var_418_0.position

				var_418_0.forward = Vector3.New(var_418_5.x, var_418_5.y, var_418_5.z)

				local var_418_6 = var_418_0.localEulerAngles

				var_418_6.z = 0
				var_418_6.x = 0
				var_418_0.localEulerAngles = var_418_6
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 then
				var_418_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_418_7 = manager.ui.mainCamera.transform.position - var_418_0.position

				var_418_0.forward = Vector3.New(var_418_7.x, var_418_7.y, var_418_7.z)

				local var_418_8 = var_418_0.localEulerAngles

				var_418_8.z = 0
				var_418_8.x = 0
				var_418_0.localEulerAngles = var_418_8
			end

			local var_418_9 = arg_415_1.actors_["10014ui_story"]
			local var_418_10 = 0

			if var_418_10 < arg_415_1.time_ and arg_415_1.time_ <= var_418_10 + arg_418_0 and arg_415_1.var_.characterEffect10014ui_story == nil then
				arg_415_1.var_.characterEffect10014ui_story = var_418_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_11 = 0.200000002980232

			if var_418_10 <= arg_415_1.time_ and arg_415_1.time_ < var_418_10 + var_418_11 then
				local var_418_12 = (arg_415_1.time_ - var_418_10) / var_418_11

				if arg_415_1.var_.characterEffect10014ui_story then
					arg_415_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_415_1.time_ >= var_418_10 + var_418_11 and arg_415_1.time_ < var_418_10 + var_418_11 + arg_418_0 and arg_415_1.var_.characterEffect10014ui_story then
				arg_415_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_418_13 = arg_415_1.actors_["10071ui_story"]
			local var_418_14 = 0

			if var_418_14 < arg_415_1.time_ and arg_415_1.time_ <= var_418_14 + arg_418_0 and arg_415_1.var_.characterEffect10071ui_story == nil then
				arg_415_1.var_.characterEffect10071ui_story = var_418_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_15 = 0.200000002980232

			if var_418_14 <= arg_415_1.time_ and arg_415_1.time_ < var_418_14 + var_418_15 then
				local var_418_16 = (arg_415_1.time_ - var_418_14) / var_418_15

				if arg_415_1.var_.characterEffect10071ui_story then
					local var_418_17 = Mathf.Lerp(0, 0.5, var_418_16)

					arg_415_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_415_1.var_.characterEffect10071ui_story.fillRatio = var_418_17
				end
			end

			if arg_415_1.time_ >= var_418_14 + var_418_15 and arg_415_1.time_ < var_418_14 + var_418_15 + arg_418_0 and arg_415_1.var_.characterEffect10071ui_story then
				local var_418_18 = 0.5

				arg_415_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_415_1.var_.characterEffect10071ui_story.fillRatio = var_418_18
			end

			local var_418_19 = 0
			local var_418_20 = 1.3

			if var_418_19 < arg_415_1.time_ and arg_415_1.time_ <= var_418_19 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_21 = arg_415_1:FormatText(StoryNameCfg[264].name)

				arg_415_1.leftNameTxt_.text = var_418_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_22 = arg_415_1:GetWordFromCfg(411041101)
				local var_418_23 = arg_415_1:FormatText(var_418_22.content)

				arg_415_1.text_.text = var_418_23

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_24 = 52
				local var_418_25 = utf8.len(var_418_23)
				local var_418_26 = var_418_24 <= 0 and var_418_20 or var_418_20 * (var_418_25 / var_418_24)

				if var_418_26 > 0 and var_418_20 < var_418_26 then
					arg_415_1.talkMaxDuration = var_418_26

					if var_418_26 + var_418_19 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_26 + var_418_19
					end
				end

				arg_415_1.text_.text = var_418_23
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041101", "story_v_out_411041.awb") ~= 0 then
					local var_418_27 = manager.audio:GetVoiceLength("story_v_out_411041", "411041101", "story_v_out_411041.awb") / 1000

					if var_418_27 + var_418_19 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_27 + var_418_19
					end

					if var_418_22.prefab_name ~= "" and arg_415_1.actors_[var_418_22.prefab_name] ~= nil then
						local var_418_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_415_1.actors_[var_418_22.prefab_name].transform, "story_v_out_411041", "411041101", "story_v_out_411041.awb")

						arg_415_1:RecordAudio("411041101", var_418_28)
						arg_415_1:RecordAudio("411041101", var_418_28)
					else
						arg_415_1:AudioAction("play", "voice", "story_v_out_411041", "411041101", "story_v_out_411041.awb")
					end

					arg_415_1:RecordHistoryTalkVoice("story_v_out_411041", "411041101", "story_v_out_411041.awb")
				end

				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_29 = math.max(var_418_20, arg_415_1.talkMaxDuration)

			if var_418_19 <= arg_415_1.time_ and arg_415_1.time_ < var_418_19 + var_418_29 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_19) / var_418_29

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_19 + var_418_29 and arg_415_1.time_ < var_418_19 + var_418_29 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play411041102 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 411041102
		arg_419_1.duration_ = 8.433

		local var_419_0 = {
			zh = 8.433,
			ja = 5.7
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
				arg_419_0:Play411041103(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["10014ui_story"]
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 and arg_419_1.var_.characterEffect10014ui_story == nil then
				arg_419_1.var_.characterEffect10014ui_story = var_422_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_2 = 0.200000002980232

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2

				if arg_419_1.var_.characterEffect10014ui_story then
					local var_422_4 = Mathf.Lerp(0, 0.5, var_422_3)

					arg_419_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_419_1.var_.characterEffect10014ui_story.fillRatio = var_422_4
				end
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 and arg_419_1.var_.characterEffect10014ui_story then
				local var_422_5 = 0.5

				arg_419_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_419_1.var_.characterEffect10014ui_story.fillRatio = var_422_5
			end

			local var_422_6 = arg_419_1.actors_["10071ui_story"]
			local var_422_7 = 0

			if var_422_7 < arg_419_1.time_ and arg_419_1.time_ <= var_422_7 + arg_422_0 and arg_419_1.var_.characterEffect10071ui_story == nil then
				arg_419_1.var_.characterEffect10071ui_story = var_422_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_8 = 0.200000002980232

			if var_422_7 <= arg_419_1.time_ and arg_419_1.time_ < var_422_7 + var_422_8 then
				local var_422_9 = (arg_419_1.time_ - var_422_7) / var_422_8

				if arg_419_1.var_.characterEffect10071ui_story then
					arg_419_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_419_1.time_ >= var_422_7 + var_422_8 and arg_419_1.time_ < var_422_7 + var_422_8 + arg_422_0 and arg_419_1.var_.characterEffect10071ui_story then
				arg_419_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_422_10 = 0
			local var_422_11 = 0.825

			if var_422_10 < arg_419_1.time_ and arg_419_1.time_ <= var_422_10 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_12 = arg_419_1:FormatText(StoryNameCfg[670].name)

				arg_419_1.leftNameTxt_.text = var_422_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_13 = arg_419_1:GetWordFromCfg(411041102)
				local var_422_14 = arg_419_1:FormatText(var_422_13.content)

				arg_419_1.text_.text = var_422_14

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_15 = 33
				local var_422_16 = utf8.len(var_422_14)
				local var_422_17 = var_422_15 <= 0 and var_422_11 or var_422_11 * (var_422_16 / var_422_15)

				if var_422_17 > 0 and var_422_11 < var_422_17 then
					arg_419_1.talkMaxDuration = var_422_17

					if var_422_17 + var_422_10 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_17 + var_422_10
					end
				end

				arg_419_1.text_.text = var_422_14
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041102", "story_v_out_411041.awb") ~= 0 then
					local var_422_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041102", "story_v_out_411041.awb") / 1000

					if var_422_18 + var_422_10 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_18 + var_422_10
					end

					if var_422_13.prefab_name ~= "" and arg_419_1.actors_[var_422_13.prefab_name] ~= nil then
						local var_422_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_13.prefab_name].transform, "story_v_out_411041", "411041102", "story_v_out_411041.awb")

						arg_419_1:RecordAudio("411041102", var_422_19)
						arg_419_1:RecordAudio("411041102", var_422_19)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_out_411041", "411041102", "story_v_out_411041.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_out_411041", "411041102", "story_v_out_411041.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_20 = math.max(var_422_11, arg_419_1.talkMaxDuration)

			if var_422_10 <= arg_419_1.time_ and arg_419_1.time_ < var_422_10 + var_422_20 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_10) / var_422_20

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_10 + var_422_20 and arg_419_1.time_ < var_422_10 + var_422_20 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play411041103 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 411041103
		arg_423_1.duration_ = 11.4

		local var_423_0 = {
			zh = 11.4,
			ja = 2.6
		}
		local var_423_1 = manager.audio:GetLocalizationFlag()

		if var_423_0[var_423_1] ~= nil then
			arg_423_1.duration_ = var_423_0[var_423_1]
		end

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play411041104(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["10014ui_story"]
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 and arg_423_1.var_.characterEffect10014ui_story == nil then
				arg_423_1.var_.characterEffect10014ui_story = var_426_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_2 = 0.200000002980232

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_2 then
				local var_426_3 = (arg_423_1.time_ - var_426_1) / var_426_2

				if arg_423_1.var_.characterEffect10014ui_story then
					arg_423_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_423_1.time_ >= var_426_1 + var_426_2 and arg_423_1.time_ < var_426_1 + var_426_2 + arg_426_0 and arg_423_1.var_.characterEffect10014ui_story then
				arg_423_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_426_4 = 0
			local var_426_5 = 1.05

			if var_426_4 < arg_423_1.time_ and arg_423_1.time_ <= var_426_4 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_6 = arg_423_1:FormatText(StoryNameCfg[264].name)

				arg_423_1.leftNameTxt_.text = var_426_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_7 = arg_423_1:GetWordFromCfg(411041103)
				local var_426_8 = arg_423_1:FormatText(var_426_7.content)

				arg_423_1.text_.text = var_426_8

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_9 = 42
				local var_426_10 = utf8.len(var_426_8)
				local var_426_11 = var_426_9 <= 0 and var_426_5 or var_426_5 * (var_426_10 / var_426_9)

				if var_426_11 > 0 and var_426_5 < var_426_11 then
					arg_423_1.talkMaxDuration = var_426_11

					if var_426_11 + var_426_4 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_11 + var_426_4
					end
				end

				arg_423_1.text_.text = var_426_8
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041103", "story_v_out_411041.awb") ~= 0 then
					local var_426_12 = manager.audio:GetVoiceLength("story_v_out_411041", "411041103", "story_v_out_411041.awb") / 1000

					if var_426_12 + var_426_4 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_12 + var_426_4
					end

					if var_426_7.prefab_name ~= "" and arg_423_1.actors_[var_426_7.prefab_name] ~= nil then
						local var_426_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_7.prefab_name].transform, "story_v_out_411041", "411041103", "story_v_out_411041.awb")

						arg_423_1:RecordAudio("411041103", var_426_13)
						arg_423_1:RecordAudio("411041103", var_426_13)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_411041", "411041103", "story_v_out_411041.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_411041", "411041103", "story_v_out_411041.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_14 = math.max(var_426_5, arg_423_1.talkMaxDuration)

			if var_426_4 <= arg_423_1.time_ and arg_423_1.time_ < var_426_4 + var_426_14 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_4) / var_426_14

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_4 + var_426_14 and arg_423_1.time_ < var_426_4 + var_426_14 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play411041104 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 411041104
		arg_427_1.duration_ = 5

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play411041105(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["10014ui_story"]
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 and arg_427_1.var_.characterEffect10014ui_story == nil then
				arg_427_1.var_.characterEffect10014ui_story = var_430_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_2 = 0.200000002980232

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2

				if arg_427_1.var_.characterEffect10014ui_story then
					local var_430_4 = Mathf.Lerp(0, 0.5, var_430_3)

					arg_427_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_427_1.var_.characterEffect10014ui_story.fillRatio = var_430_4
				end
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 and arg_427_1.var_.characterEffect10014ui_story then
				local var_430_5 = 0.5

				arg_427_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_427_1.var_.characterEffect10014ui_story.fillRatio = var_430_5
			end

			local var_430_6 = 0
			local var_430_7 = 0.95

			if var_430_6 < arg_427_1.time_ and arg_427_1.time_ <= var_430_6 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, false)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_8 = arg_427_1:GetWordFromCfg(411041104)
				local var_430_9 = arg_427_1:FormatText(var_430_8.content)

				arg_427_1.text_.text = var_430_9

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_10 = 38
				local var_430_11 = utf8.len(var_430_9)
				local var_430_12 = var_430_10 <= 0 and var_430_7 or var_430_7 * (var_430_11 / var_430_10)

				if var_430_12 > 0 and var_430_7 < var_430_12 then
					arg_427_1.talkMaxDuration = var_430_12

					if var_430_12 + var_430_6 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_12 + var_430_6
					end
				end

				arg_427_1.text_.text = var_430_9
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)
				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_13 = math.max(var_430_7, arg_427_1.talkMaxDuration)

			if var_430_6 <= arg_427_1.time_ and arg_427_1.time_ < var_430_6 + var_430_13 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_6) / var_430_13

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_6 + var_430_13 and arg_427_1.time_ < var_430_6 + var_430_13 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play411041105 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 411041105
		arg_431_1.duration_ = 6.133

		local var_431_0 = {
			zh = 4.133,
			ja = 6.133
		}
		local var_431_1 = manager.audio:GetLocalizationFlag()

		if var_431_0[var_431_1] ~= nil then
			arg_431_1.duration_ = var_431_0[var_431_1]
		end

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play411041106(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1095ui_story"].transform
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 then
				arg_431_1.var_.moveOldPos1095ui_story = var_434_0.localPosition
			end

			local var_434_2 = 0.001

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2
				local var_434_4 = Vector3.New(0, -0.98, -6.1)

				var_434_0.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos1095ui_story, var_434_4, var_434_3)

				local var_434_5 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_5.x, var_434_5.y, var_434_5.z)

				local var_434_6 = var_434_0.localEulerAngles

				var_434_6.z = 0
				var_434_6.x = 0
				var_434_0.localEulerAngles = var_434_6
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 then
				var_434_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_434_7 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_7.x, var_434_7.y, var_434_7.z)

				local var_434_8 = var_434_0.localEulerAngles

				var_434_8.z = 0
				var_434_8.x = 0
				var_434_0.localEulerAngles = var_434_8
			end

			local var_434_9 = arg_431_1.actors_["1095ui_story"]
			local var_434_10 = 0

			if var_434_10 < arg_431_1.time_ and arg_431_1.time_ <= var_434_10 + arg_434_0 and arg_431_1.var_.characterEffect1095ui_story == nil then
				arg_431_1.var_.characterEffect1095ui_story = var_434_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_11 = 0.200000002980232

			if var_434_10 <= arg_431_1.time_ and arg_431_1.time_ < var_434_10 + var_434_11 then
				local var_434_12 = (arg_431_1.time_ - var_434_10) / var_434_11

				if arg_431_1.var_.characterEffect1095ui_story then
					arg_431_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_10 + var_434_11 and arg_431_1.time_ < var_434_10 + var_434_11 + arg_434_0 and arg_431_1.var_.characterEffect1095ui_story then
				arg_431_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_434_13 = 0

			if var_434_13 < arg_431_1.time_ and arg_431_1.time_ <= var_434_13 + arg_434_0 then
				arg_431_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action5_1")
			end

			local var_434_14 = 0

			if var_434_14 < arg_431_1.time_ and arg_431_1.time_ <= var_434_14 + arg_434_0 then
				arg_431_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_434_15 = arg_431_1.actors_["10014ui_story"].transform
			local var_434_16 = 0

			if var_434_16 < arg_431_1.time_ and arg_431_1.time_ <= var_434_16 + arg_434_0 then
				arg_431_1.var_.moveOldPos10014ui_story = var_434_15.localPosition
			end

			local var_434_17 = 0.001

			if var_434_16 <= arg_431_1.time_ and arg_431_1.time_ < var_434_16 + var_434_17 then
				local var_434_18 = (arg_431_1.time_ - var_434_16) / var_434_17
				local var_434_19 = Vector3.New(0, 100, 0)

				var_434_15.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos10014ui_story, var_434_19, var_434_18)

				local var_434_20 = manager.ui.mainCamera.transform.position - var_434_15.position

				var_434_15.forward = Vector3.New(var_434_20.x, var_434_20.y, var_434_20.z)

				local var_434_21 = var_434_15.localEulerAngles

				var_434_21.z = 0
				var_434_21.x = 0
				var_434_15.localEulerAngles = var_434_21
			end

			if arg_431_1.time_ >= var_434_16 + var_434_17 and arg_431_1.time_ < var_434_16 + var_434_17 + arg_434_0 then
				var_434_15.localPosition = Vector3.New(0, 100, 0)

				local var_434_22 = manager.ui.mainCamera.transform.position - var_434_15.position

				var_434_15.forward = Vector3.New(var_434_22.x, var_434_22.y, var_434_22.z)

				local var_434_23 = var_434_15.localEulerAngles

				var_434_23.z = 0
				var_434_23.x = 0
				var_434_15.localEulerAngles = var_434_23
			end

			local var_434_24 = arg_431_1.actors_["10014ui_story"]
			local var_434_25 = 0

			if var_434_25 < arg_431_1.time_ and arg_431_1.time_ <= var_434_25 + arg_434_0 and arg_431_1.var_.characterEffect10014ui_story == nil then
				arg_431_1.var_.characterEffect10014ui_story = var_434_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_26 = 0.200000002980232

			if var_434_25 <= arg_431_1.time_ and arg_431_1.time_ < var_434_25 + var_434_26 then
				local var_434_27 = (arg_431_1.time_ - var_434_25) / var_434_26

				if arg_431_1.var_.characterEffect10014ui_story then
					local var_434_28 = Mathf.Lerp(0, 0.5, var_434_27)

					arg_431_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_431_1.var_.characterEffect10014ui_story.fillRatio = var_434_28
				end
			end

			if arg_431_1.time_ >= var_434_25 + var_434_26 and arg_431_1.time_ < var_434_25 + var_434_26 + arg_434_0 and arg_431_1.var_.characterEffect10014ui_story then
				local var_434_29 = 0.5

				arg_431_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_431_1.var_.characterEffect10014ui_story.fillRatio = var_434_29
			end

			local var_434_30 = arg_431_1.actors_["10071ui_story"].transform
			local var_434_31 = 0

			if var_434_31 < arg_431_1.time_ and arg_431_1.time_ <= var_434_31 + arg_434_0 then
				arg_431_1.var_.moveOldPos10071ui_story = var_434_30.localPosition
			end

			local var_434_32 = 0.001

			if var_434_31 <= arg_431_1.time_ and arg_431_1.time_ < var_434_31 + var_434_32 then
				local var_434_33 = (arg_431_1.time_ - var_434_31) / var_434_32
				local var_434_34 = Vector3.New(0, 100, 0)

				var_434_30.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos10071ui_story, var_434_34, var_434_33)

				local var_434_35 = manager.ui.mainCamera.transform.position - var_434_30.position

				var_434_30.forward = Vector3.New(var_434_35.x, var_434_35.y, var_434_35.z)

				local var_434_36 = var_434_30.localEulerAngles

				var_434_36.z = 0
				var_434_36.x = 0
				var_434_30.localEulerAngles = var_434_36
			end

			if arg_431_1.time_ >= var_434_31 + var_434_32 and arg_431_1.time_ < var_434_31 + var_434_32 + arg_434_0 then
				var_434_30.localPosition = Vector3.New(0, 100, 0)

				local var_434_37 = manager.ui.mainCamera.transform.position - var_434_30.position

				var_434_30.forward = Vector3.New(var_434_37.x, var_434_37.y, var_434_37.z)

				local var_434_38 = var_434_30.localEulerAngles

				var_434_38.z = 0
				var_434_38.x = 0
				var_434_30.localEulerAngles = var_434_38
			end

			local var_434_39 = arg_431_1.actors_["10071ui_story"]
			local var_434_40 = 0

			if var_434_40 < arg_431_1.time_ and arg_431_1.time_ <= var_434_40 + arg_434_0 and arg_431_1.var_.characterEffect10071ui_story == nil then
				arg_431_1.var_.characterEffect10071ui_story = var_434_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_41 = 0.200000002980232

			if var_434_40 <= arg_431_1.time_ and arg_431_1.time_ < var_434_40 + var_434_41 then
				local var_434_42 = (arg_431_1.time_ - var_434_40) / var_434_41

				if arg_431_1.var_.characterEffect10071ui_story then
					local var_434_43 = Mathf.Lerp(0, 0.5, var_434_42)

					arg_431_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_431_1.var_.characterEffect10071ui_story.fillRatio = var_434_43
				end
			end

			if arg_431_1.time_ >= var_434_40 + var_434_41 and arg_431_1.time_ < var_434_40 + var_434_41 + arg_434_0 and arg_431_1.var_.characterEffect10071ui_story then
				local var_434_44 = 0.5

				arg_431_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_431_1.var_.characterEffect10071ui_story.fillRatio = var_434_44
			end

			local var_434_45 = 0
			local var_434_46 = 0.5

			if var_434_45 < arg_431_1.time_ and arg_431_1.time_ <= var_434_45 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_47 = arg_431_1:FormatText(StoryNameCfg[471].name)

				arg_431_1.leftNameTxt_.text = var_434_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_48 = arg_431_1:GetWordFromCfg(411041105)
				local var_434_49 = arg_431_1:FormatText(var_434_48.content)

				arg_431_1.text_.text = var_434_49

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_50 = 20
				local var_434_51 = utf8.len(var_434_49)
				local var_434_52 = var_434_50 <= 0 and var_434_46 or var_434_46 * (var_434_51 / var_434_50)

				if var_434_52 > 0 and var_434_46 < var_434_52 then
					arg_431_1.talkMaxDuration = var_434_52

					if var_434_52 + var_434_45 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_52 + var_434_45
					end
				end

				arg_431_1.text_.text = var_434_49
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041105", "story_v_out_411041.awb") ~= 0 then
					local var_434_53 = manager.audio:GetVoiceLength("story_v_out_411041", "411041105", "story_v_out_411041.awb") / 1000

					if var_434_53 + var_434_45 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_53 + var_434_45
					end

					if var_434_48.prefab_name ~= "" and arg_431_1.actors_[var_434_48.prefab_name] ~= nil then
						local var_434_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_48.prefab_name].transform, "story_v_out_411041", "411041105", "story_v_out_411041.awb")

						arg_431_1:RecordAudio("411041105", var_434_54)
						arg_431_1:RecordAudio("411041105", var_434_54)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_411041", "411041105", "story_v_out_411041.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_411041", "411041105", "story_v_out_411041.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_55 = math.max(var_434_46, arg_431_1.talkMaxDuration)

			if var_434_45 <= arg_431_1.time_ and arg_431_1.time_ < var_434_45 + var_434_55 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_45) / var_434_55

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_45 + var_434_55 and arg_431_1.time_ < var_434_45 + var_434_55 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play411041106 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 411041106
		arg_435_1.duration_ = 6.533

		local var_435_0 = {
			zh = 3.933,
			ja = 6.533
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
				arg_435_0:Play411041107(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.55

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_2 = arg_435_1:FormatText(StoryNameCfg[471].name)

				arg_435_1.leftNameTxt_.text = var_438_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_3 = arg_435_1:GetWordFromCfg(411041106)
				local var_438_4 = arg_435_1:FormatText(var_438_3.content)

				arg_435_1.text_.text = var_438_4

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_5 = 22
				local var_438_6 = utf8.len(var_438_4)
				local var_438_7 = var_438_5 <= 0 and var_438_1 or var_438_1 * (var_438_6 / var_438_5)

				if var_438_7 > 0 and var_438_1 < var_438_7 then
					arg_435_1.talkMaxDuration = var_438_7

					if var_438_7 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_7 + var_438_0
					end
				end

				arg_435_1.text_.text = var_438_4
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041106", "story_v_out_411041.awb") ~= 0 then
					local var_438_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041106", "story_v_out_411041.awb") / 1000

					if var_438_8 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_8 + var_438_0
					end

					if var_438_3.prefab_name ~= "" and arg_435_1.actors_[var_438_3.prefab_name] ~= nil then
						local var_438_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_3.prefab_name].transform, "story_v_out_411041", "411041106", "story_v_out_411041.awb")

						arg_435_1:RecordAudio("411041106", var_438_9)
						arg_435_1:RecordAudio("411041106", var_438_9)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_411041", "411041106", "story_v_out_411041.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_411041", "411041106", "story_v_out_411041.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_10 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_10 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_10

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_10 and arg_435_1.time_ < var_438_0 + var_438_10 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play411041107 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 411041107
		arg_439_1.duration_ = 5.833

		local var_439_0 = {
			zh = 5.833,
			ja = 2.1
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
				arg_439_0:Play411041108(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["10014ui_story"].transform
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 then
				arg_439_1.var_.moveOldPos10014ui_story = var_442_0.localPosition
			end

			local var_442_2 = 0.001

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2
				local var_442_4 = Vector3.New(0, -1.06, -6.2)

				var_442_0.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos10014ui_story, var_442_4, var_442_3)

				local var_442_5 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_5.x, var_442_5.y, var_442_5.z)

				local var_442_6 = var_442_0.localEulerAngles

				var_442_6.z = 0
				var_442_6.x = 0
				var_442_0.localEulerAngles = var_442_6
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 then
				var_442_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_442_7 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_7.x, var_442_7.y, var_442_7.z)

				local var_442_8 = var_442_0.localEulerAngles

				var_442_8.z = 0
				var_442_8.x = 0
				var_442_0.localEulerAngles = var_442_8
			end

			local var_442_9 = arg_439_1.actors_["10014ui_story"]
			local var_442_10 = 0

			if var_442_10 < arg_439_1.time_ and arg_439_1.time_ <= var_442_10 + arg_442_0 and arg_439_1.var_.characterEffect10014ui_story == nil then
				arg_439_1.var_.characterEffect10014ui_story = var_442_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_11 = 0.200000002980232

			if var_442_10 <= arg_439_1.time_ and arg_439_1.time_ < var_442_10 + var_442_11 then
				local var_442_12 = (arg_439_1.time_ - var_442_10) / var_442_11

				if arg_439_1.var_.characterEffect10014ui_story then
					arg_439_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_439_1.time_ >= var_442_10 + var_442_11 and arg_439_1.time_ < var_442_10 + var_442_11 + arg_442_0 and arg_439_1.var_.characterEffect10014ui_story then
				arg_439_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_442_13 = 0

			if var_442_13 < arg_439_1.time_ and arg_439_1.time_ <= var_442_13 + arg_442_0 then
				arg_439_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action4_2")
			end

			local var_442_14 = 0

			if var_442_14 < arg_439_1.time_ and arg_439_1.time_ <= var_442_14 + arg_442_0 then
				arg_439_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_442_15 = arg_439_1.actors_["1095ui_story"].transform
			local var_442_16 = 0

			if var_442_16 < arg_439_1.time_ and arg_439_1.time_ <= var_442_16 + arg_442_0 then
				arg_439_1.var_.moveOldPos1095ui_story = var_442_15.localPosition
			end

			local var_442_17 = 0.001

			if var_442_16 <= arg_439_1.time_ and arg_439_1.time_ < var_442_16 + var_442_17 then
				local var_442_18 = (arg_439_1.time_ - var_442_16) / var_442_17
				local var_442_19 = Vector3.New(0, 100, 0)

				var_442_15.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos1095ui_story, var_442_19, var_442_18)

				local var_442_20 = manager.ui.mainCamera.transform.position - var_442_15.position

				var_442_15.forward = Vector3.New(var_442_20.x, var_442_20.y, var_442_20.z)

				local var_442_21 = var_442_15.localEulerAngles

				var_442_21.z = 0
				var_442_21.x = 0
				var_442_15.localEulerAngles = var_442_21
			end

			if arg_439_1.time_ >= var_442_16 + var_442_17 and arg_439_1.time_ < var_442_16 + var_442_17 + arg_442_0 then
				var_442_15.localPosition = Vector3.New(0, 100, 0)

				local var_442_22 = manager.ui.mainCamera.transform.position - var_442_15.position

				var_442_15.forward = Vector3.New(var_442_22.x, var_442_22.y, var_442_22.z)

				local var_442_23 = var_442_15.localEulerAngles

				var_442_23.z = 0
				var_442_23.x = 0
				var_442_15.localEulerAngles = var_442_23
			end

			local var_442_24 = arg_439_1.actors_["1095ui_story"]
			local var_442_25 = 0

			if var_442_25 < arg_439_1.time_ and arg_439_1.time_ <= var_442_25 + arg_442_0 and arg_439_1.var_.characterEffect1095ui_story == nil then
				arg_439_1.var_.characterEffect1095ui_story = var_442_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_26 = 0.200000002980232

			if var_442_25 <= arg_439_1.time_ and arg_439_1.time_ < var_442_25 + var_442_26 then
				local var_442_27 = (arg_439_1.time_ - var_442_25) / var_442_26

				if arg_439_1.var_.characterEffect1095ui_story then
					local var_442_28 = Mathf.Lerp(0, 0.5, var_442_27)

					arg_439_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_439_1.var_.characterEffect1095ui_story.fillRatio = var_442_28
				end
			end

			if arg_439_1.time_ >= var_442_25 + var_442_26 and arg_439_1.time_ < var_442_25 + var_442_26 + arg_442_0 and arg_439_1.var_.characterEffect1095ui_story then
				local var_442_29 = 0.5

				arg_439_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_439_1.var_.characterEffect1095ui_story.fillRatio = var_442_29
			end

			local var_442_30 = 0
			local var_442_31 = 0.55

			if var_442_30 < arg_439_1.time_ and arg_439_1.time_ <= var_442_30 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_32 = arg_439_1:FormatText(StoryNameCfg[264].name)

				arg_439_1.leftNameTxt_.text = var_442_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_33 = arg_439_1:GetWordFromCfg(411041107)
				local var_442_34 = arg_439_1:FormatText(var_442_33.content)

				arg_439_1.text_.text = var_442_34

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_35 = 22
				local var_442_36 = utf8.len(var_442_34)
				local var_442_37 = var_442_35 <= 0 and var_442_31 or var_442_31 * (var_442_36 / var_442_35)

				if var_442_37 > 0 and var_442_31 < var_442_37 then
					arg_439_1.talkMaxDuration = var_442_37

					if var_442_37 + var_442_30 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_37 + var_442_30
					end
				end

				arg_439_1.text_.text = var_442_34
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041107", "story_v_out_411041.awb") ~= 0 then
					local var_442_38 = manager.audio:GetVoiceLength("story_v_out_411041", "411041107", "story_v_out_411041.awb") / 1000

					if var_442_38 + var_442_30 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_38 + var_442_30
					end

					if var_442_33.prefab_name ~= "" and arg_439_1.actors_[var_442_33.prefab_name] ~= nil then
						local var_442_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_33.prefab_name].transform, "story_v_out_411041", "411041107", "story_v_out_411041.awb")

						arg_439_1:RecordAudio("411041107", var_442_39)
						arg_439_1:RecordAudio("411041107", var_442_39)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_411041", "411041107", "story_v_out_411041.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_411041", "411041107", "story_v_out_411041.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_40 = math.max(var_442_31, arg_439_1.talkMaxDuration)

			if var_442_30 <= arg_439_1.time_ and arg_439_1.time_ < var_442_30 + var_442_40 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_30) / var_442_40

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_30 + var_442_40 and arg_439_1.time_ < var_442_30 + var_442_40 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play411041108 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 411041108
		arg_443_1.duration_ = 11.566

		local var_443_0 = {
			zh = 8.9,
			ja = 11.566
		}
		local var_443_1 = manager.audio:GetLocalizationFlag()

		if var_443_0[var_443_1] ~= nil then
			arg_443_1.duration_ = var_443_0[var_443_1]
		end

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play411041109(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0
			local var_446_1 = 0.975

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_2 = arg_443_1:FormatText(StoryNameCfg[264].name)

				arg_443_1.leftNameTxt_.text = var_446_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_3 = arg_443_1:GetWordFromCfg(411041108)
				local var_446_4 = arg_443_1:FormatText(var_446_3.content)

				arg_443_1.text_.text = var_446_4

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_5 = 39
				local var_446_6 = utf8.len(var_446_4)
				local var_446_7 = var_446_5 <= 0 and var_446_1 or var_446_1 * (var_446_6 / var_446_5)

				if var_446_7 > 0 and var_446_1 < var_446_7 then
					arg_443_1.talkMaxDuration = var_446_7

					if var_446_7 + var_446_0 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_7 + var_446_0
					end
				end

				arg_443_1.text_.text = var_446_4
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041108", "story_v_out_411041.awb") ~= 0 then
					local var_446_8 = manager.audio:GetVoiceLength("story_v_out_411041", "411041108", "story_v_out_411041.awb") / 1000

					if var_446_8 + var_446_0 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_8 + var_446_0
					end

					if var_446_3.prefab_name ~= "" and arg_443_1.actors_[var_446_3.prefab_name] ~= nil then
						local var_446_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_3.prefab_name].transform, "story_v_out_411041", "411041108", "story_v_out_411041.awb")

						arg_443_1:RecordAudio("411041108", var_446_9)
						arg_443_1:RecordAudio("411041108", var_446_9)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_411041", "411041108", "story_v_out_411041.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_411041", "411041108", "story_v_out_411041.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_10 = math.max(var_446_1, arg_443_1.talkMaxDuration)

			if var_446_0 <= arg_443_1.time_ and arg_443_1.time_ < var_446_0 + var_446_10 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_0) / var_446_10

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_0 + var_446_10 and arg_443_1.time_ < var_446_0 + var_446_10 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play411041109 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 411041109
		arg_447_1.duration_ = 11.7

		local var_447_0 = {
			zh = 11.7,
			ja = 10.6
		}
		local var_447_1 = manager.audio:GetLocalizationFlag()

		if var_447_0[var_447_1] ~= nil then
			arg_447_1.duration_ = var_447_0[var_447_1]
		end

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play411041110(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["1095ui_story"].transform
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 then
				arg_447_1.var_.moveOldPos1095ui_story = var_450_0.localPosition
			end

			local var_450_2 = 0.001

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2
				local var_450_4 = Vector3.New(0, -0.98, -6.1)

				var_450_0.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPos1095ui_story, var_450_4, var_450_3)

				local var_450_5 = manager.ui.mainCamera.transform.position - var_450_0.position

				var_450_0.forward = Vector3.New(var_450_5.x, var_450_5.y, var_450_5.z)

				local var_450_6 = var_450_0.localEulerAngles

				var_450_6.z = 0
				var_450_6.x = 0
				var_450_0.localEulerAngles = var_450_6
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 then
				var_450_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_450_7 = manager.ui.mainCamera.transform.position - var_450_0.position

				var_450_0.forward = Vector3.New(var_450_7.x, var_450_7.y, var_450_7.z)

				local var_450_8 = var_450_0.localEulerAngles

				var_450_8.z = 0
				var_450_8.x = 0
				var_450_0.localEulerAngles = var_450_8
			end

			local var_450_9 = arg_447_1.actors_["1095ui_story"]
			local var_450_10 = 0

			if var_450_10 < arg_447_1.time_ and arg_447_1.time_ <= var_450_10 + arg_450_0 and arg_447_1.var_.characterEffect1095ui_story == nil then
				arg_447_1.var_.characterEffect1095ui_story = var_450_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_11 = 0.200000002980232

			if var_450_10 <= arg_447_1.time_ and arg_447_1.time_ < var_450_10 + var_450_11 then
				local var_450_12 = (arg_447_1.time_ - var_450_10) / var_450_11

				if arg_447_1.var_.characterEffect1095ui_story then
					arg_447_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_447_1.time_ >= var_450_10 + var_450_11 and arg_447_1.time_ < var_450_10 + var_450_11 + arg_450_0 and arg_447_1.var_.characterEffect1095ui_story then
				arg_447_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_450_13 = 0

			if var_450_13 < arg_447_1.time_ and arg_447_1.time_ <= var_450_13 + arg_450_0 then
				arg_447_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_450_14 = 0

			if var_450_14 < arg_447_1.time_ and arg_447_1.time_ <= var_450_14 + arg_450_0 then
				arg_447_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_450_15 = arg_447_1.actors_["10014ui_story"].transform
			local var_450_16 = 0

			if var_450_16 < arg_447_1.time_ and arg_447_1.time_ <= var_450_16 + arg_450_0 then
				arg_447_1.var_.moveOldPos10014ui_story = var_450_15.localPosition
			end

			local var_450_17 = 0.001

			if var_450_16 <= arg_447_1.time_ and arg_447_1.time_ < var_450_16 + var_450_17 then
				local var_450_18 = (arg_447_1.time_ - var_450_16) / var_450_17
				local var_450_19 = Vector3.New(0, 100, 0)

				var_450_15.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPos10014ui_story, var_450_19, var_450_18)

				local var_450_20 = manager.ui.mainCamera.transform.position - var_450_15.position

				var_450_15.forward = Vector3.New(var_450_20.x, var_450_20.y, var_450_20.z)

				local var_450_21 = var_450_15.localEulerAngles

				var_450_21.z = 0
				var_450_21.x = 0
				var_450_15.localEulerAngles = var_450_21
			end

			if arg_447_1.time_ >= var_450_16 + var_450_17 and arg_447_1.time_ < var_450_16 + var_450_17 + arg_450_0 then
				var_450_15.localPosition = Vector3.New(0, 100, 0)

				local var_450_22 = manager.ui.mainCamera.transform.position - var_450_15.position

				var_450_15.forward = Vector3.New(var_450_22.x, var_450_22.y, var_450_22.z)

				local var_450_23 = var_450_15.localEulerAngles

				var_450_23.z = 0
				var_450_23.x = 0
				var_450_15.localEulerAngles = var_450_23
			end

			local var_450_24 = arg_447_1.actors_["10014ui_story"]
			local var_450_25 = 0

			if var_450_25 < arg_447_1.time_ and arg_447_1.time_ <= var_450_25 + arg_450_0 and arg_447_1.var_.characterEffect10014ui_story == nil then
				arg_447_1.var_.characterEffect10014ui_story = var_450_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_26 = 0.200000002980232

			if var_450_25 <= arg_447_1.time_ and arg_447_1.time_ < var_450_25 + var_450_26 then
				local var_450_27 = (arg_447_1.time_ - var_450_25) / var_450_26

				if arg_447_1.var_.characterEffect10014ui_story then
					local var_450_28 = Mathf.Lerp(0, 0.5, var_450_27)

					arg_447_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_447_1.var_.characterEffect10014ui_story.fillRatio = var_450_28
				end
			end

			if arg_447_1.time_ >= var_450_25 + var_450_26 and arg_447_1.time_ < var_450_25 + var_450_26 + arg_450_0 and arg_447_1.var_.characterEffect10014ui_story then
				local var_450_29 = 0.5

				arg_447_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_447_1.var_.characterEffect10014ui_story.fillRatio = var_450_29
			end

			local var_450_30 = 0
			local var_450_31 = 1.4

			if var_450_30 < arg_447_1.time_ and arg_447_1.time_ <= var_450_30 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_32 = arg_447_1:FormatText(StoryNameCfg[471].name)

				arg_447_1.leftNameTxt_.text = var_450_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_33 = arg_447_1:GetWordFromCfg(411041109)
				local var_450_34 = arg_447_1:FormatText(var_450_33.content)

				arg_447_1.text_.text = var_450_34

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_35 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041109", "story_v_out_411041.awb") ~= 0 then
					local var_450_38 = manager.audio:GetVoiceLength("story_v_out_411041", "411041109", "story_v_out_411041.awb") / 1000

					if var_450_38 + var_450_30 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_38 + var_450_30
					end

					if var_450_33.prefab_name ~= "" and arg_447_1.actors_[var_450_33.prefab_name] ~= nil then
						local var_450_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_33.prefab_name].transform, "story_v_out_411041", "411041109", "story_v_out_411041.awb")

						arg_447_1:RecordAudio("411041109", var_450_39)
						arg_447_1:RecordAudio("411041109", var_450_39)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_411041", "411041109", "story_v_out_411041.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_411041", "411041109", "story_v_out_411041.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_40 = math.max(var_450_31, arg_447_1.talkMaxDuration)

			if var_450_30 <= arg_447_1.time_ and arg_447_1.time_ < var_450_30 + var_450_40 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_30) / var_450_40

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_30 + var_450_40 and arg_447_1.time_ < var_450_30 + var_450_40 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play411041110 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 411041110
		arg_451_1.duration_ = 1.999999999999

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play411041111(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["10071ui_story"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos10071ui_story = var_454_0.localPosition
			end

			local var_454_2 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2
				local var_454_4 = Vector3.New(0.7, -0.9, -6.26)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos10071ui_story, var_454_4, var_454_3)

				local var_454_5 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_5.x, var_454_5.y, var_454_5.z)

				local var_454_6 = var_454_0.localEulerAngles

				var_454_6.z = 0
				var_454_6.x = 0
				var_454_0.localEulerAngles = var_454_6
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_454_7 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_7.x, var_454_7.y, var_454_7.z)

				local var_454_8 = var_454_0.localEulerAngles

				var_454_8.z = 0
				var_454_8.x = 0
				var_454_0.localEulerAngles = var_454_8
			end

			local var_454_9 = arg_451_1.actors_["10071ui_story"]
			local var_454_10 = 0

			if var_454_10 < arg_451_1.time_ and arg_451_1.time_ <= var_454_10 + arg_454_0 and arg_451_1.var_.characterEffect10071ui_story == nil then
				arg_451_1.var_.characterEffect10071ui_story = var_454_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_11 = 0.200000002980232

			if var_454_10 <= arg_451_1.time_ and arg_451_1.time_ < var_454_10 + var_454_11 then
				local var_454_12 = (arg_451_1.time_ - var_454_10) / var_454_11

				if arg_451_1.var_.characterEffect10071ui_story then
					arg_451_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_451_1.time_ >= var_454_10 + var_454_11 and arg_451_1.time_ < var_454_10 + var_454_11 + arg_454_0 and arg_451_1.var_.characterEffect10071ui_story then
				arg_451_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_454_13 = 0

			if var_454_13 < arg_451_1.time_ and arg_451_1.time_ <= var_454_13 + arg_454_0 then
				arg_451_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action3_1")
			end

			local var_454_14 = 0

			if var_454_14 < arg_451_1.time_ and arg_451_1.time_ <= var_454_14 + arg_454_0 then
				arg_451_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_454_15 = arg_451_1.actors_["1095ui_story"].transform
			local var_454_16 = 0

			if var_454_16 < arg_451_1.time_ and arg_451_1.time_ <= var_454_16 + arg_454_0 then
				arg_451_1.var_.moveOldPos1095ui_story = var_454_15.localPosition
			end

			local var_454_17 = 0.001

			if var_454_16 <= arg_451_1.time_ and arg_451_1.time_ < var_454_16 + var_454_17 then
				local var_454_18 = (arg_451_1.time_ - var_454_16) / var_454_17
				local var_454_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_454_15.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos1095ui_story, var_454_19, var_454_18)

				local var_454_20 = manager.ui.mainCamera.transform.position - var_454_15.position

				var_454_15.forward = Vector3.New(var_454_20.x, var_454_20.y, var_454_20.z)

				local var_454_21 = var_454_15.localEulerAngles

				var_454_21.z = 0
				var_454_21.x = 0
				var_454_15.localEulerAngles = var_454_21
			end

			if arg_451_1.time_ >= var_454_16 + var_454_17 and arg_451_1.time_ < var_454_16 + var_454_17 + arg_454_0 then
				var_454_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_454_22 = manager.ui.mainCamera.transform.position - var_454_15.position

				var_454_15.forward = Vector3.New(var_454_22.x, var_454_22.y, var_454_22.z)

				local var_454_23 = var_454_15.localEulerAngles

				var_454_23.z = 0
				var_454_23.x = 0
				var_454_15.localEulerAngles = var_454_23
			end

			local var_454_24 = arg_451_1.actors_["1095ui_story"]
			local var_454_25 = 0

			if var_454_25 < arg_451_1.time_ and arg_451_1.time_ <= var_454_25 + arg_454_0 and arg_451_1.var_.characterEffect1095ui_story == nil then
				arg_451_1.var_.characterEffect1095ui_story = var_454_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_26 = 0.200000002980232

			if var_454_25 <= arg_451_1.time_ and arg_451_1.time_ < var_454_25 + var_454_26 then
				local var_454_27 = (arg_451_1.time_ - var_454_25) / var_454_26

				if arg_451_1.var_.characterEffect1095ui_story then
					local var_454_28 = Mathf.Lerp(0, 0.5, var_454_27)

					arg_451_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_451_1.var_.characterEffect1095ui_story.fillRatio = var_454_28
				end
			end

			if arg_451_1.time_ >= var_454_25 + var_454_26 and arg_451_1.time_ < var_454_25 + var_454_26 + arg_454_0 and arg_451_1.var_.characterEffect1095ui_story then
				local var_454_29 = 0.5

				arg_451_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_451_1.var_.characterEffect1095ui_story.fillRatio = var_454_29
			end

			local var_454_30 = 0
			local var_454_31 = 0.075

			if var_454_30 < arg_451_1.time_ and arg_451_1.time_ <= var_454_30 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_32 = arg_451_1:FormatText(StoryNameCfg[670].name)

				arg_451_1.leftNameTxt_.text = var_454_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_33 = arg_451_1:GetWordFromCfg(411041110)
				local var_454_34 = arg_451_1:FormatText(var_454_33.content)

				arg_451_1.text_.text = var_454_34

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_35 = 3
				local var_454_36 = utf8.len(var_454_34)
				local var_454_37 = var_454_35 <= 0 and var_454_31 or var_454_31 * (var_454_36 / var_454_35)

				if var_454_37 > 0 and var_454_31 < var_454_37 then
					arg_451_1.talkMaxDuration = var_454_37

					if var_454_37 + var_454_30 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_37 + var_454_30
					end
				end

				arg_451_1.text_.text = var_454_34
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041110", "story_v_out_411041.awb") ~= 0 then
					local var_454_38 = manager.audio:GetVoiceLength("story_v_out_411041", "411041110", "story_v_out_411041.awb") / 1000

					if var_454_38 + var_454_30 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_38 + var_454_30
					end

					if var_454_33.prefab_name ~= "" and arg_451_1.actors_[var_454_33.prefab_name] ~= nil then
						local var_454_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_33.prefab_name].transform, "story_v_out_411041", "411041110", "story_v_out_411041.awb")

						arg_451_1:RecordAudio("411041110", var_454_39)
						arg_451_1:RecordAudio("411041110", var_454_39)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_411041", "411041110", "story_v_out_411041.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_411041", "411041110", "story_v_out_411041.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_40 = math.max(var_454_31, arg_451_1.talkMaxDuration)

			if var_454_30 <= arg_451_1.time_ and arg_451_1.time_ < var_454_30 + var_454_40 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_30) / var_454_40

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_30 + var_454_40 and arg_451_1.time_ < var_454_30 + var_454_40 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play411041111 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 411041111
		arg_455_1.duration_ = 15.033

		local var_455_0 = {
			zh = 15.033,
			ja = 5.9
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
				arg_455_0:Play411041112(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["10071ui_story"]
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 and arg_455_1.var_.characterEffect10071ui_story == nil then
				arg_455_1.var_.characterEffect10071ui_story = var_458_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_2 = 0.200000002980232

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_2 then
				local var_458_3 = (arg_455_1.time_ - var_458_1) / var_458_2

				if arg_455_1.var_.characterEffect10071ui_story then
					local var_458_4 = Mathf.Lerp(0, 0.5, var_458_3)

					arg_455_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_455_1.var_.characterEffect10071ui_story.fillRatio = var_458_4
				end
			end

			if arg_455_1.time_ >= var_458_1 + var_458_2 and arg_455_1.time_ < var_458_1 + var_458_2 + arg_458_0 and arg_455_1.var_.characterEffect10071ui_story then
				local var_458_5 = 0.5

				arg_455_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_455_1.var_.characterEffect10071ui_story.fillRatio = var_458_5
			end

			local var_458_6 = arg_455_1.actors_["1095ui_story"]
			local var_458_7 = 0

			if var_458_7 < arg_455_1.time_ and arg_455_1.time_ <= var_458_7 + arg_458_0 and arg_455_1.var_.characterEffect1095ui_story == nil then
				arg_455_1.var_.characterEffect1095ui_story = var_458_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_8 = 0.200000002980232

			if var_458_7 <= arg_455_1.time_ and arg_455_1.time_ < var_458_7 + var_458_8 then
				local var_458_9 = (arg_455_1.time_ - var_458_7) / var_458_8

				if arg_455_1.var_.characterEffect1095ui_story then
					arg_455_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_455_1.time_ >= var_458_7 + var_458_8 and arg_455_1.time_ < var_458_7 + var_458_8 + arg_458_0 and arg_455_1.var_.characterEffect1095ui_story then
				arg_455_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_458_10 = 0
			local var_458_11 = 1.5

			if var_458_10 < arg_455_1.time_ and arg_455_1.time_ <= var_458_10 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_12 = arg_455_1:FormatText(StoryNameCfg[471].name)

				arg_455_1.leftNameTxt_.text = var_458_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_13 = arg_455_1:GetWordFromCfg(411041111)
				local var_458_14 = arg_455_1:FormatText(var_458_13.content)

				arg_455_1.text_.text = var_458_14

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_15 = 60
				local var_458_16 = utf8.len(var_458_14)
				local var_458_17 = var_458_15 <= 0 and var_458_11 or var_458_11 * (var_458_16 / var_458_15)

				if var_458_17 > 0 and var_458_11 < var_458_17 then
					arg_455_1.talkMaxDuration = var_458_17

					if var_458_17 + var_458_10 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_17 + var_458_10
					end
				end

				arg_455_1.text_.text = var_458_14
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041111", "story_v_out_411041.awb") ~= 0 then
					local var_458_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041111", "story_v_out_411041.awb") / 1000

					if var_458_18 + var_458_10 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_18 + var_458_10
					end

					if var_458_13.prefab_name ~= "" and arg_455_1.actors_[var_458_13.prefab_name] ~= nil then
						local var_458_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_13.prefab_name].transform, "story_v_out_411041", "411041111", "story_v_out_411041.awb")

						arg_455_1:RecordAudio("411041111", var_458_19)
						arg_455_1:RecordAudio("411041111", var_458_19)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_out_411041", "411041111", "story_v_out_411041.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_out_411041", "411041111", "story_v_out_411041.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_20 = math.max(var_458_11, arg_455_1.talkMaxDuration)

			if var_458_10 <= arg_455_1.time_ and arg_455_1.time_ < var_458_10 + var_458_20 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_10) / var_458_20

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_10 + var_458_20 and arg_455_1.time_ < var_458_10 + var_458_20 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play411041112 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 411041112
		arg_459_1.duration_ = 8.933

		local var_459_0 = {
			zh = 8.933,
			ja = 6.866
		}
		local var_459_1 = manager.audio:GetLocalizationFlag()

		if var_459_0[var_459_1] ~= nil then
			arg_459_1.duration_ = var_459_0[var_459_1]
		end

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play411041113(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["10071ui_story"]
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 and arg_459_1.var_.characterEffect10071ui_story == nil then
				arg_459_1.var_.characterEffect10071ui_story = var_462_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_2 = 0.200000002980232

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2

				if arg_459_1.var_.characterEffect10071ui_story then
					arg_459_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 and arg_459_1.var_.characterEffect10071ui_story then
				arg_459_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_462_4 = arg_459_1.actors_["1095ui_story"]
			local var_462_5 = 0

			if var_462_5 < arg_459_1.time_ and arg_459_1.time_ <= var_462_5 + arg_462_0 and arg_459_1.var_.characterEffect1095ui_story == nil then
				arg_459_1.var_.characterEffect1095ui_story = var_462_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_6 = 0.200000002980232

			if var_462_5 <= arg_459_1.time_ and arg_459_1.time_ < var_462_5 + var_462_6 then
				local var_462_7 = (arg_459_1.time_ - var_462_5) / var_462_6

				if arg_459_1.var_.characterEffect1095ui_story then
					local var_462_8 = Mathf.Lerp(0, 0.5, var_462_7)

					arg_459_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_459_1.var_.characterEffect1095ui_story.fillRatio = var_462_8
				end
			end

			if arg_459_1.time_ >= var_462_5 + var_462_6 and arg_459_1.time_ < var_462_5 + var_462_6 + arg_462_0 and arg_459_1.var_.characterEffect1095ui_story then
				local var_462_9 = 0.5

				arg_459_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_459_1.var_.characterEffect1095ui_story.fillRatio = var_462_9
			end

			local var_462_10 = 0
			local var_462_11 = 0.65

			if var_462_10 < arg_459_1.time_ and arg_459_1.time_ <= var_462_10 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_12 = arg_459_1:FormatText(StoryNameCfg[670].name)

				arg_459_1.leftNameTxt_.text = var_462_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_13 = arg_459_1:GetWordFromCfg(411041112)
				local var_462_14 = arg_459_1:FormatText(var_462_13.content)

				arg_459_1.text_.text = var_462_14

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_15 = 26
				local var_462_16 = utf8.len(var_462_14)
				local var_462_17 = var_462_15 <= 0 and var_462_11 or var_462_11 * (var_462_16 / var_462_15)

				if var_462_17 > 0 and var_462_11 < var_462_17 then
					arg_459_1.talkMaxDuration = var_462_17

					if var_462_17 + var_462_10 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_17 + var_462_10
					end
				end

				arg_459_1.text_.text = var_462_14
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041112", "story_v_out_411041.awb") ~= 0 then
					local var_462_18 = manager.audio:GetVoiceLength("story_v_out_411041", "411041112", "story_v_out_411041.awb") / 1000

					if var_462_18 + var_462_10 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_18 + var_462_10
					end

					if var_462_13.prefab_name ~= "" and arg_459_1.actors_[var_462_13.prefab_name] ~= nil then
						local var_462_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_13.prefab_name].transform, "story_v_out_411041", "411041112", "story_v_out_411041.awb")

						arg_459_1:RecordAudio("411041112", var_462_19)
						arg_459_1:RecordAudio("411041112", var_462_19)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_411041", "411041112", "story_v_out_411041.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_411041", "411041112", "story_v_out_411041.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_20 = math.max(var_462_11, arg_459_1.talkMaxDuration)

			if var_462_10 <= arg_459_1.time_ and arg_459_1.time_ < var_462_10 + var_462_20 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_10) / var_462_20

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_10 + var_462_20 and arg_459_1.time_ < var_462_10 + var_462_20 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play411041113 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 411041113
		arg_463_1.duration_ = 8.9

		local var_463_0 = {
			zh = 8.9,
			ja = 7.333
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
				arg_463_0:Play411041114(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["10014ui_story"].transform
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				arg_463_1.var_.moveOldPos10014ui_story = var_466_0.localPosition
			end

			local var_466_2 = 0.001

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_2 then
				local var_466_3 = (arg_463_1.time_ - var_466_1) / var_466_2
				local var_466_4 = Vector3.New(0, -1.06, -6.2)

				var_466_0.localPosition = Vector3.Lerp(arg_463_1.var_.moveOldPos10014ui_story, var_466_4, var_466_3)

				local var_466_5 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_5.x, var_466_5.y, var_466_5.z)

				local var_466_6 = var_466_0.localEulerAngles

				var_466_6.z = 0
				var_466_6.x = 0
				var_466_0.localEulerAngles = var_466_6
			end

			if arg_463_1.time_ >= var_466_1 + var_466_2 and arg_463_1.time_ < var_466_1 + var_466_2 + arg_466_0 then
				var_466_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_466_7 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_7.x, var_466_7.y, var_466_7.z)

				local var_466_8 = var_466_0.localEulerAngles

				var_466_8.z = 0
				var_466_8.x = 0
				var_466_0.localEulerAngles = var_466_8
			end

			local var_466_9 = arg_463_1.actors_["10014ui_story"]
			local var_466_10 = 0

			if var_466_10 < arg_463_1.time_ and arg_463_1.time_ <= var_466_10 + arg_466_0 and arg_463_1.var_.characterEffect10014ui_story == nil then
				arg_463_1.var_.characterEffect10014ui_story = var_466_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_466_11 = 0.200000002980232

			if var_466_10 <= arg_463_1.time_ and arg_463_1.time_ < var_466_10 + var_466_11 then
				local var_466_12 = (arg_463_1.time_ - var_466_10) / var_466_11

				if arg_463_1.var_.characterEffect10014ui_story then
					arg_463_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_463_1.time_ >= var_466_10 + var_466_11 and arg_463_1.time_ < var_466_10 + var_466_11 + arg_466_0 and arg_463_1.var_.characterEffect10014ui_story then
				arg_463_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_466_13 = 0

			if var_466_13 < arg_463_1.time_ and arg_463_1.time_ <= var_466_13 + arg_466_0 then
				arg_463_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_466_14 = 0

			if var_466_14 < arg_463_1.time_ and arg_463_1.time_ <= var_466_14 + arg_466_0 then
				arg_463_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_466_15 = arg_463_1.actors_["10071ui_story"].transform
			local var_466_16 = 0

			if var_466_16 < arg_463_1.time_ and arg_463_1.time_ <= var_466_16 + arg_466_0 then
				arg_463_1.var_.moveOldPos10071ui_story = var_466_15.localPosition
			end

			local var_466_17 = 0.001

			if var_466_16 <= arg_463_1.time_ and arg_463_1.time_ < var_466_16 + var_466_17 then
				local var_466_18 = (arg_463_1.time_ - var_466_16) / var_466_17
				local var_466_19 = Vector3.New(0, 100, 0)

				var_466_15.localPosition = Vector3.Lerp(arg_463_1.var_.moveOldPos10071ui_story, var_466_19, var_466_18)

				local var_466_20 = manager.ui.mainCamera.transform.position - var_466_15.position

				var_466_15.forward = Vector3.New(var_466_20.x, var_466_20.y, var_466_20.z)

				local var_466_21 = var_466_15.localEulerAngles

				var_466_21.z = 0
				var_466_21.x = 0
				var_466_15.localEulerAngles = var_466_21
			end

			if arg_463_1.time_ >= var_466_16 + var_466_17 and arg_463_1.time_ < var_466_16 + var_466_17 + arg_466_0 then
				var_466_15.localPosition = Vector3.New(0, 100, 0)

				local var_466_22 = manager.ui.mainCamera.transform.position - var_466_15.position

				var_466_15.forward = Vector3.New(var_466_22.x, var_466_22.y, var_466_22.z)

				local var_466_23 = var_466_15.localEulerAngles

				var_466_23.z = 0
				var_466_23.x = 0
				var_466_15.localEulerAngles = var_466_23
			end

			local var_466_24 = arg_463_1.actors_["10071ui_story"]
			local var_466_25 = 0

			if var_466_25 < arg_463_1.time_ and arg_463_1.time_ <= var_466_25 + arg_466_0 and arg_463_1.var_.characterEffect10071ui_story == nil then
				arg_463_1.var_.characterEffect10071ui_story = var_466_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_466_26 = 0.200000002980232

			if var_466_25 <= arg_463_1.time_ and arg_463_1.time_ < var_466_25 + var_466_26 then
				local var_466_27 = (arg_463_1.time_ - var_466_25) / var_466_26

				if arg_463_1.var_.characterEffect10071ui_story then
					local var_466_28 = Mathf.Lerp(0, 0.5, var_466_27)

					arg_463_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_463_1.var_.characterEffect10071ui_story.fillRatio = var_466_28
				end
			end

			if arg_463_1.time_ >= var_466_25 + var_466_26 and arg_463_1.time_ < var_466_25 + var_466_26 + arg_466_0 and arg_463_1.var_.characterEffect10071ui_story then
				local var_466_29 = 0.5

				arg_463_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_463_1.var_.characterEffect10071ui_story.fillRatio = var_466_29
			end

			local var_466_30 = arg_463_1.actors_["1095ui_story"].transform
			local var_466_31 = 0

			if var_466_31 < arg_463_1.time_ and arg_463_1.time_ <= var_466_31 + arg_466_0 then
				arg_463_1.var_.moveOldPos1095ui_story = var_466_30.localPosition
			end

			local var_466_32 = 0.001

			if var_466_31 <= arg_463_1.time_ and arg_463_1.time_ < var_466_31 + var_466_32 then
				local var_466_33 = (arg_463_1.time_ - var_466_31) / var_466_32
				local var_466_34 = Vector3.New(0, 100, 0)

				var_466_30.localPosition = Vector3.Lerp(arg_463_1.var_.moveOldPos1095ui_story, var_466_34, var_466_33)

				local var_466_35 = manager.ui.mainCamera.transform.position - var_466_30.position

				var_466_30.forward = Vector3.New(var_466_35.x, var_466_35.y, var_466_35.z)

				local var_466_36 = var_466_30.localEulerAngles

				var_466_36.z = 0
				var_466_36.x = 0
				var_466_30.localEulerAngles = var_466_36
			end

			if arg_463_1.time_ >= var_466_31 + var_466_32 and arg_463_1.time_ < var_466_31 + var_466_32 + arg_466_0 then
				var_466_30.localPosition = Vector3.New(0, 100, 0)

				local var_466_37 = manager.ui.mainCamera.transform.position - var_466_30.position

				var_466_30.forward = Vector3.New(var_466_37.x, var_466_37.y, var_466_37.z)

				local var_466_38 = var_466_30.localEulerAngles

				var_466_38.z = 0
				var_466_38.x = 0
				var_466_30.localEulerAngles = var_466_38
			end

			local var_466_39 = arg_463_1.actors_["1095ui_story"]
			local var_466_40 = 0

			if var_466_40 < arg_463_1.time_ and arg_463_1.time_ <= var_466_40 + arg_466_0 and arg_463_1.var_.characterEffect1095ui_story == nil then
				arg_463_1.var_.characterEffect1095ui_story = var_466_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_466_41 = 0.200000002980232

			if var_466_40 <= arg_463_1.time_ and arg_463_1.time_ < var_466_40 + var_466_41 then
				local var_466_42 = (arg_463_1.time_ - var_466_40) / var_466_41

				if arg_463_1.var_.characterEffect1095ui_story then
					local var_466_43 = Mathf.Lerp(0, 0.5, var_466_42)

					arg_463_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_463_1.var_.characterEffect1095ui_story.fillRatio = var_466_43
				end
			end

			if arg_463_1.time_ >= var_466_40 + var_466_41 and arg_463_1.time_ < var_466_40 + var_466_41 + arg_466_0 and arg_463_1.var_.characterEffect1095ui_story then
				local var_466_44 = 0.5

				arg_463_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_463_1.var_.characterEffect1095ui_story.fillRatio = var_466_44
			end

			local var_466_45 = 0
			local var_466_46 = 0.975

			if var_466_45 < arg_463_1.time_ and arg_463_1.time_ <= var_466_45 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_47 = arg_463_1:FormatText(StoryNameCfg[264].name)

				arg_463_1.leftNameTxt_.text = var_466_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_48 = arg_463_1:GetWordFromCfg(411041113)
				local var_466_49 = arg_463_1:FormatText(var_466_48.content)

				arg_463_1.text_.text = var_466_49

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_50 = 39
				local var_466_51 = utf8.len(var_466_49)
				local var_466_52 = var_466_50 <= 0 and var_466_46 or var_466_46 * (var_466_51 / var_466_50)

				if var_466_52 > 0 and var_466_46 < var_466_52 then
					arg_463_1.talkMaxDuration = var_466_52

					if var_466_52 + var_466_45 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_52 + var_466_45
					end
				end

				arg_463_1.text_.text = var_466_49
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041113", "story_v_out_411041.awb") ~= 0 then
					local var_466_53 = manager.audio:GetVoiceLength("story_v_out_411041", "411041113", "story_v_out_411041.awb") / 1000

					if var_466_53 + var_466_45 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_53 + var_466_45
					end

					if var_466_48.prefab_name ~= "" and arg_463_1.actors_[var_466_48.prefab_name] ~= nil then
						local var_466_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_48.prefab_name].transform, "story_v_out_411041", "411041113", "story_v_out_411041.awb")

						arg_463_1:RecordAudio("411041113", var_466_54)
						arg_463_1:RecordAudio("411041113", var_466_54)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_out_411041", "411041113", "story_v_out_411041.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_out_411041", "411041113", "story_v_out_411041.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_55 = math.max(var_466_46, arg_463_1.talkMaxDuration)

			if var_466_45 <= arg_463_1.time_ and arg_463_1.time_ < var_466_45 + var_466_55 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_45) / var_466_55

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_45 + var_466_55 and arg_463_1.time_ < var_466_45 + var_466_55 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play411041114 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 411041114
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play411041115(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["10014ui_story"].transform
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 then
				arg_467_1.var_.moveOldPos10014ui_story = var_470_0.localPosition
			end

			local var_470_2 = 0.001

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_2 then
				local var_470_3 = (arg_467_1.time_ - var_470_1) / var_470_2
				local var_470_4 = Vector3.New(0, 100, 0)

				var_470_0.localPosition = Vector3.Lerp(arg_467_1.var_.moveOldPos10014ui_story, var_470_4, var_470_3)

				local var_470_5 = manager.ui.mainCamera.transform.position - var_470_0.position

				var_470_0.forward = Vector3.New(var_470_5.x, var_470_5.y, var_470_5.z)

				local var_470_6 = var_470_0.localEulerAngles

				var_470_6.z = 0
				var_470_6.x = 0
				var_470_0.localEulerAngles = var_470_6
			end

			if arg_467_1.time_ >= var_470_1 + var_470_2 and arg_467_1.time_ < var_470_1 + var_470_2 + arg_470_0 then
				var_470_0.localPosition = Vector3.New(0, 100, 0)

				local var_470_7 = manager.ui.mainCamera.transform.position - var_470_0.position

				var_470_0.forward = Vector3.New(var_470_7.x, var_470_7.y, var_470_7.z)

				local var_470_8 = var_470_0.localEulerAngles

				var_470_8.z = 0
				var_470_8.x = 0
				var_470_0.localEulerAngles = var_470_8
			end

			local var_470_9 = arg_467_1.actors_["10014ui_story"]
			local var_470_10 = 0

			if var_470_10 < arg_467_1.time_ and arg_467_1.time_ <= var_470_10 + arg_470_0 and arg_467_1.var_.characterEffect10014ui_story == nil then
				arg_467_1.var_.characterEffect10014ui_story = var_470_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_470_11 = 0.200000002980232

			if var_470_10 <= arg_467_1.time_ and arg_467_1.time_ < var_470_10 + var_470_11 then
				local var_470_12 = (arg_467_1.time_ - var_470_10) / var_470_11

				if arg_467_1.var_.characterEffect10014ui_story then
					local var_470_13 = Mathf.Lerp(0, 0.5, var_470_12)

					arg_467_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_467_1.var_.characterEffect10014ui_story.fillRatio = var_470_13
				end
			end

			if arg_467_1.time_ >= var_470_10 + var_470_11 and arg_467_1.time_ < var_470_10 + var_470_11 + arg_470_0 and arg_467_1.var_.characterEffect10014ui_story then
				local var_470_14 = 0.5

				arg_467_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_467_1.var_.characterEffect10014ui_story.fillRatio = var_470_14
			end

			local var_470_15 = 0
			local var_470_16 = 1.325

			if var_470_15 < arg_467_1.time_ and arg_467_1.time_ <= var_470_15 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, false)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_17 = arg_467_1:GetWordFromCfg(411041114)
				local var_470_18 = arg_467_1:FormatText(var_470_17.content)

				arg_467_1.text_.text = var_470_18

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_19 = 53
				local var_470_20 = utf8.len(var_470_18)
				local var_470_21 = var_470_19 <= 0 and var_470_16 or var_470_16 * (var_470_20 / var_470_19)

				if var_470_21 > 0 and var_470_16 < var_470_21 then
					arg_467_1.talkMaxDuration = var_470_21

					if var_470_21 + var_470_15 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_21 + var_470_15
					end
				end

				arg_467_1.text_.text = var_470_18
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_22 = math.max(var_470_16, arg_467_1.talkMaxDuration)

			if var_470_15 <= arg_467_1.time_ and arg_467_1.time_ < var_470_15 + var_470_22 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_15) / var_470_22

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_15 + var_470_22 and arg_467_1.time_ < var_470_15 + var_470_22 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play411041115 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 411041115
		arg_471_1.duration_ = 10.666

		local var_471_0 = {
			zh = 9.5,
			ja = 10.666
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
				arg_471_0:Play411041116(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["1095ui_story"].transform
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1.var_.moveOldPos1095ui_story = var_474_0.localPosition
			end

			local var_474_2 = 0.001

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2
				local var_474_4 = Vector3.New(0, -0.98, -6.1)

				var_474_0.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos1095ui_story, var_474_4, var_474_3)

				local var_474_5 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_5.x, var_474_5.y, var_474_5.z)

				local var_474_6 = var_474_0.localEulerAngles

				var_474_6.z = 0
				var_474_6.x = 0
				var_474_0.localEulerAngles = var_474_6
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 then
				var_474_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_474_7 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_7.x, var_474_7.y, var_474_7.z)

				local var_474_8 = var_474_0.localEulerAngles

				var_474_8.z = 0
				var_474_8.x = 0
				var_474_0.localEulerAngles = var_474_8
			end

			local var_474_9 = arg_471_1.actors_["1095ui_story"]
			local var_474_10 = 0

			if var_474_10 < arg_471_1.time_ and arg_471_1.time_ <= var_474_10 + arg_474_0 and arg_471_1.var_.characterEffect1095ui_story == nil then
				arg_471_1.var_.characterEffect1095ui_story = var_474_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_11 = 0.200000002980232

			if var_474_10 <= arg_471_1.time_ and arg_471_1.time_ < var_474_10 + var_474_11 then
				local var_474_12 = (arg_471_1.time_ - var_474_10) / var_474_11

				if arg_471_1.var_.characterEffect1095ui_story then
					arg_471_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_471_1.time_ >= var_474_10 + var_474_11 and arg_471_1.time_ < var_474_10 + var_474_11 + arg_474_0 and arg_471_1.var_.characterEffect1095ui_story then
				arg_471_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_474_13 = 0

			if var_474_13 < arg_471_1.time_ and arg_471_1.time_ <= var_474_13 + arg_474_0 then
				arg_471_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_474_14 = 0

			if var_474_14 < arg_471_1.time_ and arg_471_1.time_ <= var_474_14 + arg_474_0 then
				arg_471_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_474_15 = 0
			local var_474_16 = 0.65

			if var_474_15 < arg_471_1.time_ and arg_471_1.time_ <= var_474_15 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_17 = arg_471_1:FormatText(StoryNameCfg[471].name)

				arg_471_1.leftNameTxt_.text = var_474_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_18 = arg_471_1:GetWordFromCfg(411041115)
				local var_474_19 = arg_471_1:FormatText(var_474_18.content)

				arg_471_1.text_.text = var_474_19

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_20 = 26
				local var_474_21 = utf8.len(var_474_19)
				local var_474_22 = var_474_20 <= 0 and var_474_16 or var_474_16 * (var_474_21 / var_474_20)

				if var_474_22 > 0 and var_474_16 < var_474_22 then
					arg_471_1.talkMaxDuration = var_474_22

					if var_474_22 + var_474_15 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_22 + var_474_15
					end
				end

				arg_471_1.text_.text = var_474_19
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041115", "story_v_out_411041.awb") ~= 0 then
					local var_474_23 = manager.audio:GetVoiceLength("story_v_out_411041", "411041115", "story_v_out_411041.awb") / 1000

					if var_474_23 + var_474_15 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_23 + var_474_15
					end

					if var_474_18.prefab_name ~= "" and arg_471_1.actors_[var_474_18.prefab_name] ~= nil then
						local var_474_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_18.prefab_name].transform, "story_v_out_411041", "411041115", "story_v_out_411041.awb")

						arg_471_1:RecordAudio("411041115", var_474_24)
						arg_471_1:RecordAudio("411041115", var_474_24)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_411041", "411041115", "story_v_out_411041.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_411041", "411041115", "story_v_out_411041.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_25 = math.max(var_474_16, arg_471_1.talkMaxDuration)

			if var_474_15 <= arg_471_1.time_ and arg_471_1.time_ < var_474_15 + var_474_25 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_15) / var_474_25

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_15 + var_474_25 and arg_471_1.time_ < var_474_15 + var_474_25 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play411041116 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 411041116
		arg_475_1.duration_ = 5

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play411041117(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["1095ui_story"]
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 and arg_475_1.var_.characterEffect1095ui_story == nil then
				arg_475_1.var_.characterEffect1095ui_story = var_478_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_2 = 0.200000002980232

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2

				if arg_475_1.var_.characterEffect1095ui_story then
					local var_478_4 = Mathf.Lerp(0, 0.5, var_478_3)

					arg_475_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_475_1.var_.characterEffect1095ui_story.fillRatio = var_478_4
				end
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 and arg_475_1.var_.characterEffect1095ui_story then
				local var_478_5 = 0.5

				arg_475_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_475_1.var_.characterEffect1095ui_story.fillRatio = var_478_5
			end

			local var_478_6 = 0
			local var_478_7 = 0.8

			if var_478_6 < arg_475_1.time_ and arg_475_1.time_ <= var_478_6 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, false)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_8 = arg_475_1:GetWordFromCfg(411041116)
				local var_478_9 = arg_475_1:FormatText(var_478_8.content)

				arg_475_1.text_.text = var_478_9

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_10 = 32
				local var_478_11 = utf8.len(var_478_9)
				local var_478_12 = var_478_10 <= 0 and var_478_7 or var_478_7 * (var_478_11 / var_478_10)

				if var_478_12 > 0 and var_478_7 < var_478_12 then
					arg_475_1.talkMaxDuration = var_478_12

					if var_478_12 + var_478_6 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_12 + var_478_6
					end
				end

				arg_475_1.text_.text = var_478_9
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)
				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_13 = math.max(var_478_7, arg_475_1.talkMaxDuration)

			if var_478_6 <= arg_475_1.time_ and arg_475_1.time_ < var_478_6 + var_478_13 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_6) / var_478_13

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_6 + var_478_13 and arg_475_1.time_ < var_478_6 + var_478_13 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play411041117 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 411041117
		arg_479_1.duration_ = 5

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play411041118(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = 0
			local var_482_1 = 1.475

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, false)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_2 = arg_479_1:GetWordFromCfg(411041117)
				local var_482_3 = arg_479_1:FormatText(var_482_2.content)

				arg_479_1.text_.text = var_482_3

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_4 = 59
				local var_482_5 = utf8.len(var_482_3)
				local var_482_6 = var_482_4 <= 0 and var_482_1 or var_482_1 * (var_482_5 / var_482_4)

				if var_482_6 > 0 and var_482_1 < var_482_6 then
					arg_479_1.talkMaxDuration = var_482_6

					if var_482_6 + var_482_0 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_6 + var_482_0
					end
				end

				arg_479_1.text_.text = var_482_3
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)
				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_7 = math.max(var_482_1, arg_479_1.talkMaxDuration)

			if var_482_0 <= arg_479_1.time_ and arg_479_1.time_ < var_482_0 + var_482_7 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_0) / var_482_7

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_0 + var_482_7 and arg_479_1.time_ < var_482_0 + var_482_7 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play411041118 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 411041118
		arg_483_1.duration_ = 7.566

		local var_483_0 = {
			zh = 7.566,
			ja = 5.633
		}
		local var_483_1 = manager.audio:GetLocalizationFlag()

		if var_483_0[var_483_1] ~= nil then
			arg_483_1.duration_ = var_483_0[var_483_1]
		end

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play411041119(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["10071ui_story"].transform
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 then
				arg_483_1.var_.moveOldPos10071ui_story = var_486_0.localPosition
			end

			local var_486_2 = 0.001

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2
				local var_486_4 = Vector3.New(0.7, -0.9, -6.26)

				var_486_0.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos10071ui_story, var_486_4, var_486_3)

				local var_486_5 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_5.x, var_486_5.y, var_486_5.z)

				local var_486_6 = var_486_0.localEulerAngles

				var_486_6.z = 0
				var_486_6.x = 0
				var_486_0.localEulerAngles = var_486_6
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 then
				var_486_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_486_7 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_7.x, var_486_7.y, var_486_7.z)

				local var_486_8 = var_486_0.localEulerAngles

				var_486_8.z = 0
				var_486_8.x = 0
				var_486_0.localEulerAngles = var_486_8
			end

			local var_486_9 = arg_483_1.actors_["10071ui_story"]
			local var_486_10 = 0

			if var_486_10 < arg_483_1.time_ and arg_483_1.time_ <= var_486_10 + arg_486_0 and arg_483_1.var_.characterEffect10071ui_story == nil then
				arg_483_1.var_.characterEffect10071ui_story = var_486_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_11 = 0.200000002980232

			if var_486_10 <= arg_483_1.time_ and arg_483_1.time_ < var_486_10 + var_486_11 then
				local var_486_12 = (arg_483_1.time_ - var_486_10) / var_486_11

				if arg_483_1.var_.characterEffect10071ui_story then
					arg_483_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_483_1.time_ >= var_486_10 + var_486_11 and arg_483_1.time_ < var_486_10 + var_486_11 + arg_486_0 and arg_483_1.var_.characterEffect10071ui_story then
				arg_483_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_486_13 = arg_483_1.actors_["1095ui_story"].transform
			local var_486_14 = 0

			if var_486_14 < arg_483_1.time_ and arg_483_1.time_ <= var_486_14 + arg_486_0 then
				arg_483_1.var_.moveOldPos1095ui_story = var_486_13.localPosition
			end

			local var_486_15 = 0.001

			if var_486_14 <= arg_483_1.time_ and arg_483_1.time_ < var_486_14 + var_486_15 then
				local var_486_16 = (arg_483_1.time_ - var_486_14) / var_486_15
				local var_486_17 = Vector3.New(-0.7, -0.98, -6.1)

				var_486_13.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos1095ui_story, var_486_17, var_486_16)

				local var_486_18 = manager.ui.mainCamera.transform.position - var_486_13.position

				var_486_13.forward = Vector3.New(var_486_18.x, var_486_18.y, var_486_18.z)

				local var_486_19 = var_486_13.localEulerAngles

				var_486_19.z = 0
				var_486_19.x = 0
				var_486_13.localEulerAngles = var_486_19
			end

			if arg_483_1.time_ >= var_486_14 + var_486_15 and arg_483_1.time_ < var_486_14 + var_486_15 + arg_486_0 then
				var_486_13.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_486_20 = manager.ui.mainCamera.transform.position - var_486_13.position

				var_486_13.forward = Vector3.New(var_486_20.x, var_486_20.y, var_486_20.z)

				local var_486_21 = var_486_13.localEulerAngles

				var_486_21.z = 0
				var_486_21.x = 0
				var_486_13.localEulerAngles = var_486_21
			end

			local var_486_22 = arg_483_1.actors_["1095ui_story"]
			local var_486_23 = 0

			if var_486_23 < arg_483_1.time_ and arg_483_1.time_ <= var_486_23 + arg_486_0 and arg_483_1.var_.characterEffect1095ui_story == nil then
				arg_483_1.var_.characterEffect1095ui_story = var_486_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_24 = 0.200000002980232

			if var_486_23 <= arg_483_1.time_ and arg_483_1.time_ < var_486_23 + var_486_24 then
				local var_486_25 = (arg_483_1.time_ - var_486_23) / var_486_24

				if arg_483_1.var_.characterEffect1095ui_story then
					local var_486_26 = Mathf.Lerp(0, 0.5, var_486_25)

					arg_483_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_483_1.var_.characterEffect1095ui_story.fillRatio = var_486_26
				end
			end

			if arg_483_1.time_ >= var_486_23 + var_486_24 and arg_483_1.time_ < var_486_23 + var_486_24 + arg_486_0 and arg_483_1.var_.characterEffect1095ui_story then
				local var_486_27 = 0.5

				arg_483_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_483_1.var_.characterEffect1095ui_story.fillRatio = var_486_27
			end

			local var_486_28 = 0

			if var_486_28 < arg_483_1.time_ and arg_483_1.time_ <= var_486_28 + arg_486_0 then
				arg_483_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action1_1")
			end

			local var_486_29 = 0
			local var_486_30 = 0.75

			if var_486_29 < arg_483_1.time_ and arg_483_1.time_ <= var_486_29 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_31 = arg_483_1:FormatText(StoryNameCfg[670].name)

				arg_483_1.leftNameTxt_.text = var_486_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_32 = arg_483_1:GetWordFromCfg(411041118)
				local var_486_33 = arg_483_1:FormatText(var_486_32.content)

				arg_483_1.text_.text = var_486_33

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_34 = 30
				local var_486_35 = utf8.len(var_486_33)
				local var_486_36 = var_486_34 <= 0 and var_486_30 or var_486_30 * (var_486_35 / var_486_34)

				if var_486_36 > 0 and var_486_30 < var_486_36 then
					arg_483_1.talkMaxDuration = var_486_36

					if var_486_36 + var_486_29 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_36 + var_486_29
					end
				end

				arg_483_1.text_.text = var_486_33
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041118", "story_v_out_411041.awb") ~= 0 then
					local var_486_37 = manager.audio:GetVoiceLength("story_v_out_411041", "411041118", "story_v_out_411041.awb") / 1000

					if var_486_37 + var_486_29 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_37 + var_486_29
					end

					if var_486_32.prefab_name ~= "" and arg_483_1.actors_[var_486_32.prefab_name] ~= nil then
						local var_486_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_483_1.actors_[var_486_32.prefab_name].transform, "story_v_out_411041", "411041118", "story_v_out_411041.awb")

						arg_483_1:RecordAudio("411041118", var_486_38)
						arg_483_1:RecordAudio("411041118", var_486_38)
					else
						arg_483_1:AudioAction("play", "voice", "story_v_out_411041", "411041118", "story_v_out_411041.awb")
					end

					arg_483_1:RecordHistoryTalkVoice("story_v_out_411041", "411041118", "story_v_out_411041.awb")
				end

				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_39 = math.max(var_486_30, arg_483_1.talkMaxDuration)

			if var_486_29 <= arg_483_1.time_ and arg_483_1.time_ < var_486_29 + var_486_39 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_29) / var_486_39

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_29 + var_486_39 and arg_483_1.time_ < var_486_29 + var_486_39 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play411041119 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 411041119
		arg_487_1.duration_ = 5.433

		local var_487_0 = {
			zh = 4.766,
			ja = 5.433
		}
		local var_487_1 = manager.audio:GetLocalizationFlag()

		if var_487_0[var_487_1] ~= nil then
			arg_487_1.duration_ = var_487_0[var_487_1]
		end

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play411041120(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["10071ui_story"]
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 and arg_487_1.var_.characterEffect10071ui_story == nil then
				arg_487_1.var_.characterEffect10071ui_story = var_490_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_2 = 0.200000002980232

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2

				if arg_487_1.var_.characterEffect10071ui_story then
					arg_487_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 and arg_487_1.var_.characterEffect10071ui_story then
				arg_487_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_490_4 = 0
			local var_490_5 = 0.475

			if var_490_4 < arg_487_1.time_ and arg_487_1.time_ <= var_490_4 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_6 = arg_487_1:FormatText(StoryNameCfg[670].name)

				arg_487_1.leftNameTxt_.text = var_490_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_7 = arg_487_1:GetWordFromCfg(411041119)
				local var_490_8 = arg_487_1:FormatText(var_490_7.content)

				arg_487_1.text_.text = var_490_8

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_9 = 19
				local var_490_10 = utf8.len(var_490_8)
				local var_490_11 = var_490_9 <= 0 and var_490_5 or var_490_5 * (var_490_10 / var_490_9)

				if var_490_11 > 0 and var_490_5 < var_490_11 then
					arg_487_1.talkMaxDuration = var_490_11

					if var_490_11 + var_490_4 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_11 + var_490_4
					end
				end

				arg_487_1.text_.text = var_490_8
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411041", "411041119", "story_v_out_411041.awb") ~= 0 then
					local var_490_12 = manager.audio:GetVoiceLength("story_v_out_411041", "411041119", "story_v_out_411041.awb") / 1000

					if var_490_12 + var_490_4 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_12 + var_490_4
					end

					if var_490_7.prefab_name ~= "" and arg_487_1.actors_[var_490_7.prefab_name] ~= nil then
						local var_490_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_7.prefab_name].transform, "story_v_out_411041", "411041119", "story_v_out_411041.awb")

						arg_487_1:RecordAudio("411041119", var_490_13)
						arg_487_1:RecordAudio("411041119", var_490_13)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_out_411041", "411041119", "story_v_out_411041.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_out_411041", "411041119", "story_v_out_411041.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_14 = math.max(var_490_5, arg_487_1.talkMaxDuration)

			if var_490_4 <= arg_487_1.time_ and arg_487_1.time_ < var_490_4 + var_490_14 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_4) / var_490_14

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_4 + var_490_14 and arg_487_1.time_ < var_490_4 + var_490_14 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play411041120 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 411041120
		arg_491_1.duration_ = 5

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play411041121(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["10071ui_story"]
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 and arg_491_1.var_.characterEffect10071ui_story == nil then
				arg_491_1.var_.characterEffect10071ui_story = var_494_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_2 = 0.200000002980232

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2

				if arg_491_1.var_.characterEffect10071ui_story then
					local var_494_4 = Mathf.Lerp(0, 0.5, var_494_3)

					arg_491_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_491_1.var_.characterEffect10071ui_story.fillRatio = var_494_4
				end
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 and arg_491_1.var_.characterEffect10071ui_story then
				local var_494_5 = 0.5

				arg_491_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_491_1.var_.characterEffect10071ui_story.fillRatio = var_494_5
			end

			local var_494_6 = 0
			local var_494_7 = 1.3

			if var_494_6 < arg_491_1.time_ and arg_491_1.time_ <= var_494_6 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, false)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_8 = arg_491_1:GetWordFromCfg(411041120)
				local var_494_9 = arg_491_1:FormatText(var_494_8.content)

				arg_491_1.text_.text = var_494_9

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_10 = 52
				local var_494_11 = utf8.len(var_494_9)
				local var_494_12 = var_494_10 <= 0 and var_494_7 or var_494_7 * (var_494_11 / var_494_10)

				if var_494_12 > 0 and var_494_7 < var_494_12 then
					arg_491_1.talkMaxDuration = var_494_12

					if var_494_12 + var_494_6 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_12 + var_494_6
					end
				end

				arg_491_1.text_.text = var_494_9
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)
				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_13 = math.max(var_494_7, arg_491_1.talkMaxDuration)

			if var_494_6 <= arg_491_1.time_ and arg_491_1.time_ < var_494_6 + var_494_13 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_6) / var_494_13

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_6 + var_494_13 and arg_491_1.time_ < var_494_6 + var_494_13 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play411041121 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 411041121
		arg_495_1.duration_ = 5

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play411041122(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = 0
			local var_498_1 = 1.425

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, false)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_2 = arg_495_1:GetWordFromCfg(411041121)
				local var_498_3 = arg_495_1:FormatText(var_498_2.content)

				arg_495_1.text_.text = var_498_3

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_4 = 57
				local var_498_5 = utf8.len(var_498_3)
				local var_498_6 = var_498_4 <= 0 and var_498_1 or var_498_1 * (var_498_5 / var_498_4)

				if var_498_6 > 0 and var_498_1 < var_498_6 then
					arg_495_1.talkMaxDuration = var_498_6

					if var_498_6 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_6 + var_498_0
					end
				end

				arg_495_1.text_.text = var_498_3
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)
				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_7 = math.max(var_498_1, arg_495_1.talkMaxDuration)

			if var_498_0 <= arg_495_1.time_ and arg_495_1.time_ < var_498_0 + var_498_7 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_0) / var_498_7

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_0 + var_498_7 and arg_495_1.time_ < var_498_0 + var_498_7 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play411041122 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 411041122
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
			arg_499_1.auto_ = false
		end

		function arg_499_1.playNext_(arg_501_0)
			arg_499_1.onStoryFinished_()
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = 0
			local var_502_1 = 0.7

			if var_502_0 < arg_499_1.time_ and arg_499_1.time_ <= var_502_0 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, false)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_2 = arg_499_1:GetWordFromCfg(411041122)
				local var_502_3 = arg_499_1:FormatText(var_502_2.content)

				arg_499_1.text_.text = var_502_3

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_4 = 28
				local var_502_5 = utf8.len(var_502_3)
				local var_502_6 = var_502_4 <= 0 and var_502_1 or var_502_1 * (var_502_5 / var_502_4)

				if var_502_6 > 0 and var_502_1 < var_502_6 then
					arg_499_1.talkMaxDuration = var_502_6

					if var_502_6 + var_502_0 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_6 + var_502_0
					end
				end

				arg_499_1.text_.text = var_502_3
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_7 = math.max(var_502_1, arg_499_1.talkMaxDuration)

			if var_502_0 <= arg_499_1.time_ and arg_499_1.time_ < var_502_0 + var_502_7 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_0) / var_502_7

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_0 + var_502_7 and arg_499_1.time_ < var_502_0 + var_502_7 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11r",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I07",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST71a"
	},
	voices = {
		"story_v_out_411041.awb"
	}
}
