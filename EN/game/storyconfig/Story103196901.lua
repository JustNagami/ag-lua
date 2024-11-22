return {
	Play319691001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319691001
		arg_1_1.duration_ = 3.56666666666667

		local var_1_0 = {
			zh = 3.56666666666667,
			ja = 3.49966666666667
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
				arg_1_0:Play319691002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I12g"

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
				local var_4_5 = arg_1_1.bgs_.I12g

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
					if iter_4_0 ~= "I12g" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_17 = 0.3

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_19 = 2

			if var_4_18 <= arg_1_1.time_ and arg_1_1.time_ < var_4_18 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_18) / var_4_19
				local var_4_21 = Color.New(0, 0, 0)

				var_4_21.a = Mathf.Lerp(1, 0, var_4_20)
				arg_1_1.mask_.color = var_4_21
			end

			if arg_1_1.time_ >= var_4_18 + var_4_19 and arg_1_1.time_ < var_4_18 + var_4_19 + arg_4_0 then
				local var_4_22 = Color.New(0, 0, 0)
				local var_4_23 = 0

				arg_1_1.mask_.enabled = false
				var_4_22.a = var_4_23
				arg_1_1.mask_.color = var_4_22
			end

			local var_4_24 = 0
			local var_4_25 = 0.2

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_26 = "play"
				local var_4_27 = "music"

				arg_1_1:AudioAction(var_4_26, var_4_27, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_28 = 0.233333333333333
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_32 = 1.66666666666667
			local var_4_33 = 0.225

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_34 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_34:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_35 = arg_1_1:FormatText(StoryNameCfg[694].name)

				arg_1_1.leftNameTxt_.text = var_4_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_36 = arg_1_1:GetWordFromCfg(319691001)
				local var_4_37 = arg_1_1:FormatText(var_4_36.content)

				arg_1_1.text_.text = var_4_37

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_38 = 9
				local var_4_39 = utf8.len(var_4_37)
				local var_4_40 = var_4_38 <= 0 and var_4_33 or var_4_33 * (var_4_39 / var_4_38)

				if var_4_40 > 0 and var_4_33 < var_4_40 then
					arg_1_1.talkMaxDuration = var_4_40
					var_4_32 = var_4_32 + 0.3

					if var_4_40 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_40 + var_4_32
					end
				end

				arg_1_1.text_.text = var_4_37
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691001", "story_v_out_319691.awb") ~= 0 then
					local var_4_41 = manager.audio:GetVoiceLength("story_v_out_319691", "319691001", "story_v_out_319691.awb") / 1000

					if var_4_41 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_32
					end

					if var_4_36.prefab_name ~= "" and arg_1_1.actors_[var_4_36.prefab_name] ~= nil then
						local var_4_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_36.prefab_name].transform, "story_v_out_319691", "319691001", "story_v_out_319691.awb")

						arg_1_1:RecordAudio("319691001", var_4_42)
						arg_1_1:RecordAudio("319691001", var_4_42)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319691", "319691001", "story_v_out_319691.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319691", "319691001", "story_v_out_319691.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_43 = var_4_32 + 0.3
			local var_4_44 = math.max(var_4_33, arg_1_1.talkMaxDuration)

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
	Play319691002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319691002
		arg_7_1.duration_ = 7.566

		local var_7_0 = {
			zh = 3.866,
			ja = 7.566
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
				arg_7_0:Play319691003(arg_7_1)
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
				arg_7_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.4

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

				local var_10_22 = arg_7_1:GetWordFromCfg(319691002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691002", "story_v_out_319691.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_319691", "319691002", "story_v_out_319691.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_319691", "319691002", "story_v_out_319691.awb")

						arg_7_1:RecordAudio("319691002", var_10_28)
						arg_7_1:RecordAudio("319691002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319691", "319691002", "story_v_out_319691.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319691", "319691002", "story_v_out_319691.awb")
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
	Play319691003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319691003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play319691004(arg_11_1)
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

			local var_14_6 = arg_11_1.actors_["1095ui_story"].transform
			local var_14_7 = 0

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.var_.moveOldPos1095ui_story = var_14_6.localPosition
			end

			local var_14_8 = 0.001

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_8 then
				local var_14_9 = (arg_11_1.time_ - var_14_7) / var_14_8
				local var_14_10 = Vector3.New(0, 100, 0)

				var_14_6.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1095ui_story, var_14_10, var_14_9)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_6.position

				var_14_6.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_6.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_6.localEulerAngles = var_14_12
			end

			if arg_11_1.time_ >= var_14_7 + var_14_8 and arg_11_1.time_ < var_14_7 + var_14_8 + arg_14_0 then
				var_14_6.localPosition = Vector3.New(0, 100, 0)

				local var_14_13 = manager.ui.mainCamera.transform.position - var_14_6.position

				var_14_6.forward = Vector3.New(var_14_13.x, var_14_13.y, var_14_13.z)

				local var_14_14 = var_14_6.localEulerAngles

				var_14_14.z = 0
				var_14_14.x = 0
				var_14_6.localEulerAngles = var_14_14
			end

			local var_14_15 = 0
			local var_14_16 = 0.85

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_17 = arg_11_1:GetWordFromCfg(319691003)
				local var_14_18 = arg_11_1:FormatText(var_14_17.content)

				arg_11_1.text_.text = var_14_18

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_19 = 34
				local var_14_20 = utf8.len(var_14_18)
				local var_14_21 = var_14_19 <= 0 and var_14_16 or var_14_16 * (var_14_20 / var_14_19)

				if var_14_21 > 0 and var_14_16 < var_14_21 then
					arg_11_1.talkMaxDuration = var_14_21

					if var_14_21 + var_14_15 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_21 + var_14_15
					end
				end

				arg_11_1.text_.text = var_14_18
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_22 = math.max(var_14_16, arg_11_1.talkMaxDuration)

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_22 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_15) / var_14_22

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_15 + var_14_22 and arg_11_1.time_ < var_14_15 + var_14_22 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319691004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319691004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play319691005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.025

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_2 = arg_15_1:GetWordFromCfg(319691004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 41
				local var_18_5 = utf8.len(var_18_3)
				local var_18_6 = var_18_4 <= 0 and var_18_1 or var_18_1 * (var_18_5 / var_18_4)

				if var_18_6 > 0 and var_18_1 < var_18_6 then
					arg_15_1.talkMaxDuration = var_18_6

					if var_18_6 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_6 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_3
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_7 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_7 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_7

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_7 and arg_15_1.time_ < var_18_0 + var_18_7 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319691005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319691005
		arg_19_1.duration_ = 2.9

		local var_19_0 = {
			zh = 1.999999999999,
			ja = 2.9
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
				arg_19_0:Play319691006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "10079ui_story"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(Asset.Load("Char/" .. var_22_0), arg_19_1.stage_.transform)

				var_22_1.name = var_22_0
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_0] = var_22_1

				local var_22_2 = var_22_1:GetComponentInChildren(typeof(CharacterEffect))

				var_22_2.enabled = true

				local var_22_3 = GameObjectTools.GetOrAddComponent(var_22_1, typeof(DynamicBoneHelper))

				if var_22_3 then
					var_22_3:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_2.transform, false)

				arg_19_1.var_[var_22_0 .. "Animator"] = var_22_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_0 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_0 .. "LipSync"] = var_22_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_4 = arg_19_1.actors_["10079ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos10079ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0.7, -0.95, -6.05)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10079ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = arg_19_1.actors_["10079ui_story"]
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 and arg_19_1.var_.characterEffect10079ui_story == nil then
				arg_19_1.var_.characterEffect10079ui_story = var_22_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_15 = 0.200000002980232

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15

				if arg_19_1.var_.characterEffect10079ui_story then
					arg_19_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 and arg_19_1.var_.characterEffect10079ui_story then
				arg_19_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 then
				arg_19_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_19 = arg_19_1.actors_["1095ui_story"].transform
			local var_22_20 = 0

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				arg_19_1.var_.moveOldPos1095ui_story = var_22_19.localPosition
			end

			local var_22_21 = 0.001

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_21 then
				local var_22_22 = (arg_19_1.time_ - var_22_20) / var_22_21
				local var_22_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_22_19.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1095ui_story, var_22_23, var_22_22)

				local var_22_24 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_24.x, var_22_24.y, var_22_24.z)

				local var_22_25 = var_22_19.localEulerAngles

				var_22_25.z = 0
				var_22_25.x = 0
				var_22_19.localEulerAngles = var_22_25
			end

			if arg_19_1.time_ >= var_22_20 + var_22_21 and arg_19_1.time_ < var_22_20 + var_22_21 + arg_22_0 then
				var_22_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_22_26 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_26.x, var_22_26.y, var_22_26.z)

				local var_22_27 = var_22_19.localEulerAngles

				var_22_27.z = 0
				var_22_27.x = 0
				var_22_19.localEulerAngles = var_22_27
			end

			local var_22_28 = 0
			local var_22_29 = 0.175

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_30 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_31 = arg_19_1:GetWordFromCfg(319691005)
				local var_22_32 = arg_19_1:FormatText(var_22_31.content)

				arg_19_1.text_.text = var_22_32

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_33 = 7
				local var_22_34 = utf8.len(var_22_32)
				local var_22_35 = var_22_33 <= 0 and var_22_29 or var_22_29 * (var_22_34 / var_22_33)

				if var_22_35 > 0 and var_22_29 < var_22_35 then
					arg_19_1.talkMaxDuration = var_22_35

					if var_22_35 + var_22_28 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_35 + var_22_28
					end
				end

				arg_19_1.text_.text = var_22_32
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691005", "story_v_out_319691.awb") ~= 0 then
					local var_22_36 = manager.audio:GetVoiceLength("story_v_out_319691", "319691005", "story_v_out_319691.awb") / 1000

					if var_22_36 + var_22_28 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_36 + var_22_28
					end

					if var_22_31.prefab_name ~= "" and arg_19_1.actors_[var_22_31.prefab_name] ~= nil then
						local var_22_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_31.prefab_name].transform, "story_v_out_319691", "319691005", "story_v_out_319691.awb")

						arg_19_1:RecordAudio("319691005", var_22_37)
						arg_19_1:RecordAudio("319691005", var_22_37)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319691", "319691005", "story_v_out_319691.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319691", "319691005", "story_v_out_319691.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_38 = math.max(var_22_29, arg_19_1.talkMaxDuration)

			if var_22_28 <= arg_19_1.time_ and arg_19_1.time_ < var_22_28 + var_22_38 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_28) / var_22_38

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_28 + var_22_38 and arg_19_1.time_ < var_22_28 + var_22_38 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319691006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319691006
		arg_23_1.duration_ = 9.033

		local var_23_0 = {
			zh = 9.033,
			ja = 7.466
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
				arg_23_0:Play319691007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1095ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1095ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1095ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1095ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story == nil then
				arg_23_1.var_.characterEffect1095ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1095ui_story then
					arg_23_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story then
				arg_23_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_15 = arg_23_1.actors_["10079ui_story"]
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 and arg_23_1.var_.characterEffect10079ui_story == nil then
				arg_23_1.var_.characterEffect10079ui_story = var_26_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_17 = 0.200000002980232

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17

				if arg_23_1.var_.characterEffect10079ui_story then
					local var_26_19 = Mathf.Lerp(0, 0.5, var_26_18)

					arg_23_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10079ui_story.fillRatio = var_26_19
				end
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 and arg_23_1.var_.characterEffect10079ui_story then
				local var_26_20 = 0.5

				arg_23_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10079ui_story.fillRatio = var_26_20
			end

			local var_26_21 = 0
			local var_26_22 = 1.15

			if var_26_21 < arg_23_1.time_ and arg_23_1.time_ <= var_26_21 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_23 = arg_23_1:FormatText(StoryNameCfg[471].name)

				arg_23_1.leftNameTxt_.text = var_26_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_24 = arg_23_1:GetWordFromCfg(319691006)
				local var_26_25 = arg_23_1:FormatText(var_26_24.content)

				arg_23_1.text_.text = var_26_25

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_26 = 46
				local var_26_27 = utf8.len(var_26_25)
				local var_26_28 = var_26_26 <= 0 and var_26_22 or var_26_22 * (var_26_27 / var_26_26)

				if var_26_28 > 0 and var_26_22 < var_26_28 then
					arg_23_1.talkMaxDuration = var_26_28

					if var_26_28 + var_26_21 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_28 + var_26_21
					end
				end

				arg_23_1.text_.text = var_26_25
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691006", "story_v_out_319691.awb") ~= 0 then
					local var_26_29 = manager.audio:GetVoiceLength("story_v_out_319691", "319691006", "story_v_out_319691.awb") / 1000

					if var_26_29 + var_26_21 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_29 + var_26_21
					end

					if var_26_24.prefab_name ~= "" and arg_23_1.actors_[var_26_24.prefab_name] ~= nil then
						local var_26_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_24.prefab_name].transform, "story_v_out_319691", "319691006", "story_v_out_319691.awb")

						arg_23_1:RecordAudio("319691006", var_26_30)
						arg_23_1:RecordAudio("319691006", var_26_30)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319691", "319691006", "story_v_out_319691.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319691", "319691006", "story_v_out_319691.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_31 = math.max(var_26_22, arg_23_1.talkMaxDuration)

			if var_26_21 <= arg_23_1.time_ and arg_23_1.time_ < var_26_21 + var_26_31 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_21) / var_26_31

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_21 + var_26_31 and arg_23_1.time_ < var_26_21 + var_26_31 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319691007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319691007
		arg_27_1.duration_ = 12.5

		local var_27_0 = {
			zh = 9.3,
			ja = 12.5
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
				arg_27_0:Play319691008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1.125

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[471].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(319691007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691007", "story_v_out_319691.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_319691", "319691007", "story_v_out_319691.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_319691", "319691007", "story_v_out_319691.awb")

						arg_27_1:RecordAudio("319691007", var_30_9)
						arg_27_1:RecordAudio("319691007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_319691", "319691007", "story_v_out_319691.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_319691", "319691007", "story_v_out_319691.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_10 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_10 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_10

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_10 and arg_27_1.time_ < var_30_0 + var_30_10 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319691008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319691008
		arg_31_1.duration_ = 12.6

		local var_31_0 = {
			zh = 7.9,
			ja = 12.6
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
				arg_31_0:Play319691009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.975

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[471].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(319691008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691008", "story_v_out_319691.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_319691", "319691008", "story_v_out_319691.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_319691", "319691008", "story_v_out_319691.awb")

						arg_31_1:RecordAudio("319691008", var_34_9)
						arg_31_1:RecordAudio("319691008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319691", "319691008", "story_v_out_319691.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319691", "319691008", "story_v_out_319691.awb")
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
	Play319691009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319691009
		arg_35_1.duration_ = 3.5

		local var_35_0 = {
			zh = 2.433,
			ja = 3.5
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
				arg_35_0:Play319691010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10079ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos10079ui_story = var_38_0.localPosition

				local var_38_2 = "10079ui_story"

				arg_35_1:ShowWeapon(arg_35_1.var_[var_38_2 .. "Animator"].transform, false)
			end

			local var_38_3 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_3 then
				local var_38_4 = (arg_35_1.time_ - var_38_1) / var_38_3
				local var_38_5 = Vector3.New(0.7, -0.95, -6.05)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10079ui_story, var_38_5, var_38_4)

				local var_38_6 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_6.x, var_38_6.y, var_38_6.z)

				local var_38_7 = var_38_0.localEulerAngles

				var_38_7.z = 0
				var_38_7.x = 0
				var_38_0.localEulerAngles = var_38_7
			end

			if arg_35_1.time_ >= var_38_1 + var_38_3 and arg_35_1.time_ < var_38_1 + var_38_3 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_38_8 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_8.x, var_38_8.y, var_38_8.z)

				local var_38_9 = var_38_0.localEulerAngles

				var_38_9.z = 0
				var_38_9.x = 0
				var_38_0.localEulerAngles = var_38_9
			end

			local var_38_10 = arg_35_1.actors_["10079ui_story"]
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect10079ui_story == nil then
				arg_35_1.var_.characterEffect10079ui_story = var_38_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_12 = 0.200000002980232

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_12 then
				local var_38_13 = (arg_35_1.time_ - var_38_11) / var_38_12

				if arg_35_1.var_.characterEffect10079ui_story then
					arg_35_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_11 + var_38_12 and arg_35_1.time_ < var_38_11 + var_38_12 + arg_38_0 and arg_35_1.var_.characterEffect10079ui_story then
				arg_35_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_16 = arg_35_1.actors_["1095ui_story"]
			local var_38_17 = 0

			if var_38_17 < arg_35_1.time_ and arg_35_1.time_ <= var_38_17 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story == nil then
				arg_35_1.var_.characterEffect1095ui_story = var_38_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_18 = 0.200000002980232

			if var_38_17 <= arg_35_1.time_ and arg_35_1.time_ < var_38_17 + var_38_18 then
				local var_38_19 = (arg_35_1.time_ - var_38_17) / var_38_18

				if arg_35_1.var_.characterEffect1095ui_story then
					local var_38_20 = Mathf.Lerp(0, 0.5, var_38_19)

					arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_20
				end
			end

			if arg_35_1.time_ >= var_38_17 + var_38_18 and arg_35_1.time_ < var_38_17 + var_38_18 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				local var_38_21 = 0.5

				arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_21
			end

			local var_38_22 = 0
			local var_38_23 = 0.275

			if var_38_22 < arg_35_1.time_ and arg_35_1.time_ <= var_38_22 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_24 = arg_35_1:FormatText(StoryNameCfg[6].name)

				arg_35_1.leftNameTxt_.text = var_38_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_25 = arg_35_1:GetWordFromCfg(319691009)
				local var_38_26 = arg_35_1:FormatText(var_38_25.content)

				arg_35_1.text_.text = var_38_26

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_27 = 11
				local var_38_28 = utf8.len(var_38_26)
				local var_38_29 = var_38_27 <= 0 and var_38_23 or var_38_23 * (var_38_28 / var_38_27)

				if var_38_29 > 0 and var_38_23 < var_38_29 then
					arg_35_1.talkMaxDuration = var_38_29

					if var_38_29 + var_38_22 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_29 + var_38_22
					end
				end

				arg_35_1.text_.text = var_38_26
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691009", "story_v_out_319691.awb") ~= 0 then
					local var_38_30 = manager.audio:GetVoiceLength("story_v_out_319691", "319691009", "story_v_out_319691.awb") / 1000

					if var_38_30 + var_38_22 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_30 + var_38_22
					end

					if var_38_25.prefab_name ~= "" and arg_35_1.actors_[var_38_25.prefab_name] ~= nil then
						local var_38_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_25.prefab_name].transform, "story_v_out_319691", "319691009", "story_v_out_319691.awb")

						arg_35_1:RecordAudio("319691009", var_38_31)
						arg_35_1:RecordAudio("319691009", var_38_31)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319691", "319691009", "story_v_out_319691.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319691", "319691009", "story_v_out_319691.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_32 = math.max(var_38_23, arg_35_1.talkMaxDuration)

			if var_38_22 <= arg_35_1.time_ and arg_35_1.time_ < var_38_22 + var_38_32 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_22) / var_38_32

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_22 + var_38_32 and arg_35_1.time_ < var_38_22 + var_38_32 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319691010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319691010
		arg_39_1.duration_ = 5.4

		local var_39_0 = {
			zh = 3.866,
			ja = 5.4
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
				arg_39_0:Play319691011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1095ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1095ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1095ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1095ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story == nil then
				arg_39_1.var_.characterEffect1095ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1095ui_story then
					arg_39_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story then
				arg_39_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_42_13 = arg_39_1.actors_["10079ui_story"]
			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 and arg_39_1.var_.characterEffect10079ui_story == nil then
				arg_39_1.var_.characterEffect10079ui_story = var_42_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_15 = 0.200000002980232

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_15 then
				local var_42_16 = (arg_39_1.time_ - var_42_14) / var_42_15

				if arg_39_1.var_.characterEffect10079ui_story then
					local var_42_17 = Mathf.Lerp(0, 0.5, var_42_16)

					arg_39_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_39_1.var_.characterEffect10079ui_story.fillRatio = var_42_17
				end
			end

			if arg_39_1.time_ >= var_42_14 + var_42_15 and arg_39_1.time_ < var_42_14 + var_42_15 + arg_42_0 and arg_39_1.var_.characterEffect10079ui_story then
				local var_42_18 = 0.5

				arg_39_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_39_1.var_.characterEffect10079ui_story.fillRatio = var_42_18
			end

			local var_42_19 = 0

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_42_20 = 0

			if var_42_20 < arg_39_1.time_ and arg_39_1.time_ <= var_42_20 + arg_42_0 then
				arg_39_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_21 = 0
			local var_42_22 = 0.5

			if var_42_21 < arg_39_1.time_ and arg_39_1.time_ <= var_42_21 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_23 = arg_39_1:FormatText(StoryNameCfg[471].name)

				arg_39_1.leftNameTxt_.text = var_42_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_24 = arg_39_1:GetWordFromCfg(319691010)
				local var_42_25 = arg_39_1:FormatText(var_42_24.content)

				arg_39_1.text_.text = var_42_25

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_26 = 20
				local var_42_27 = utf8.len(var_42_25)
				local var_42_28 = var_42_26 <= 0 and var_42_22 or var_42_22 * (var_42_27 / var_42_26)

				if var_42_28 > 0 and var_42_22 < var_42_28 then
					arg_39_1.talkMaxDuration = var_42_28

					if var_42_28 + var_42_21 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_28 + var_42_21
					end
				end

				arg_39_1.text_.text = var_42_25
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691010", "story_v_out_319691.awb") ~= 0 then
					local var_42_29 = manager.audio:GetVoiceLength("story_v_out_319691", "319691010", "story_v_out_319691.awb") / 1000

					if var_42_29 + var_42_21 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_29 + var_42_21
					end

					if var_42_24.prefab_name ~= "" and arg_39_1.actors_[var_42_24.prefab_name] ~= nil then
						local var_42_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_24.prefab_name].transform, "story_v_out_319691", "319691010", "story_v_out_319691.awb")

						arg_39_1:RecordAudio("319691010", var_42_30)
						arg_39_1:RecordAudio("319691010", var_42_30)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319691", "319691010", "story_v_out_319691.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319691", "319691010", "story_v_out_319691.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_31 = math.max(var_42_22, arg_39_1.talkMaxDuration)

			if var_42_21 <= arg_39_1.time_ and arg_39_1.time_ < var_42_21 + var_42_31 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_21) / var_42_31

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_21 + var_42_31 and arg_39_1.time_ < var_42_21 + var_42_31 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319691011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319691011
		arg_43_1.duration_ = 6.2

		local var_43_0 = {
			zh = 6.2,
			ja = 5.9
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
				arg_43_0:Play319691012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.425

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[471].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(319691011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 17
				local var_46_6 = utf8.len(var_46_4)
				local var_46_7 = var_46_5 <= 0 and var_46_1 or var_46_1 * (var_46_6 / var_46_5)

				if var_46_7 > 0 and var_46_1 < var_46_7 then
					arg_43_1.talkMaxDuration = var_46_7

					if var_46_7 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_7 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_4
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691011", "story_v_out_319691.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_319691", "319691011", "story_v_out_319691.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_319691", "319691011", "story_v_out_319691.awb")

						arg_43_1:RecordAudio("319691011", var_46_9)
						arg_43_1:RecordAudio("319691011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319691", "319691011", "story_v_out_319691.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319691", "319691011", "story_v_out_319691.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_10 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_10 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_10

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_10 and arg_43_1.time_ < var_46_0 + var_46_10 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319691012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319691012
		arg_47_1.duration_ = 8

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play319691013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "I12h"

			if arg_47_1.bgs_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(arg_47_1.paintGo_)

				var_50_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_50_0)
				var_50_1.name = var_50_0
				var_50_1.transform.parent = arg_47_1.stage_.transform
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.bgs_[var_50_0] = var_50_1
			end

			local var_50_2 = 1.73333333333333

			if var_50_2 < arg_47_1.time_ and arg_47_1.time_ <= var_50_2 + arg_50_0 then
				local var_50_3 = manager.ui.mainCamera.transform.localPosition
				local var_50_4 = Vector3.New(0, 0, 10) + Vector3.New(var_50_3.x, var_50_3.y, 0)
				local var_50_5 = arg_47_1.bgs_.I12h

				var_50_5.transform.localPosition = var_50_4
				var_50_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_50_6 = var_50_5:GetComponent("SpriteRenderer")

				if var_50_6 and var_50_6.sprite then
					local var_50_7 = (var_50_5.transform.localPosition - var_50_3).z
					local var_50_8 = manager.ui.mainCameraCom_
					local var_50_9 = 2 * var_50_7 * Mathf.Tan(var_50_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_50_10 = var_50_9 * var_50_8.aspect
					local var_50_11 = var_50_6.sprite.bounds.size.x
					local var_50_12 = var_50_6.sprite.bounds.size.y
					local var_50_13 = var_50_10 / var_50_11
					local var_50_14 = var_50_9 / var_50_12
					local var_50_15 = var_50_14 < var_50_13 and var_50_13 or var_50_14

					var_50_5.transform.localScale = Vector3.New(var_50_15, var_50_15, 0)
				end

				for iter_50_0, iter_50_1 in pairs(arg_47_1.bgs_) do
					if iter_50_0 ~= "I12h" then
						iter_50_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.allBtn_.enabled = false
			end

			local var_50_17 = 0.3

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 then
				arg_47_1.allBtn_.enabled = true
			end

			local var_50_18 = 0

			if var_50_18 < arg_47_1.time_ and arg_47_1.time_ <= var_50_18 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_19 = 1.73333333333333

			if var_50_18 <= arg_47_1.time_ and arg_47_1.time_ < var_50_18 + var_50_19 then
				local var_50_20 = (arg_47_1.time_ - var_50_18) / var_50_19
				local var_50_21 = Color.New(0, 0, 0)

				var_50_21.a = Mathf.Lerp(0, 1, var_50_20)
				arg_47_1.mask_.color = var_50_21
			end

			if arg_47_1.time_ >= var_50_18 + var_50_19 and arg_47_1.time_ < var_50_18 + var_50_19 + arg_50_0 then
				local var_50_22 = Color.New(0, 0, 0)

				var_50_22.a = 1
				arg_47_1.mask_.color = var_50_22
			end

			local var_50_23 = 1.73333333333333

			if var_50_23 < arg_47_1.time_ and arg_47_1.time_ <= var_50_23 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_24 = 1.26666666666667

			if var_50_23 <= arg_47_1.time_ and arg_47_1.time_ < var_50_23 + var_50_24 then
				local var_50_25 = (arg_47_1.time_ - var_50_23) / var_50_24
				local var_50_26 = Color.New(0, 0, 0)

				var_50_26.a = Mathf.Lerp(1, 0, var_50_25)
				arg_47_1.mask_.color = var_50_26
			end

			if arg_47_1.time_ >= var_50_23 + var_50_24 and arg_47_1.time_ < var_50_23 + var_50_24 + arg_50_0 then
				local var_50_27 = Color.New(0, 0, 0)
				local var_50_28 = 0

				arg_47_1.mask_.enabled = false
				var_50_27.a = var_50_28
				arg_47_1.mask_.color = var_50_27
			end

			local var_50_29 = arg_47_1.actors_["10079ui_story"].transform
			local var_50_30 = 1.73333333333333

			if var_50_30 < arg_47_1.time_ and arg_47_1.time_ <= var_50_30 + arg_50_0 then
				arg_47_1.var_.moveOldPos10079ui_story = var_50_29.localPosition
			end

			local var_50_31 = 0.001

			if var_50_30 <= arg_47_1.time_ and arg_47_1.time_ < var_50_30 + var_50_31 then
				local var_50_32 = (arg_47_1.time_ - var_50_30) / var_50_31
				local var_50_33 = Vector3.New(0, 100, 0)

				var_50_29.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10079ui_story, var_50_33, var_50_32)

				local var_50_34 = manager.ui.mainCamera.transform.position - var_50_29.position

				var_50_29.forward = Vector3.New(var_50_34.x, var_50_34.y, var_50_34.z)

				local var_50_35 = var_50_29.localEulerAngles

				var_50_35.z = 0
				var_50_35.x = 0
				var_50_29.localEulerAngles = var_50_35
			end

			if arg_47_1.time_ >= var_50_30 + var_50_31 and arg_47_1.time_ < var_50_30 + var_50_31 + arg_50_0 then
				var_50_29.localPosition = Vector3.New(0, 100, 0)

				local var_50_36 = manager.ui.mainCamera.transform.position - var_50_29.position

				var_50_29.forward = Vector3.New(var_50_36.x, var_50_36.y, var_50_36.z)

				local var_50_37 = var_50_29.localEulerAngles

				var_50_37.z = 0
				var_50_37.x = 0
				var_50_29.localEulerAngles = var_50_37
			end

			local var_50_38 = arg_47_1.actors_["1095ui_story"].transform
			local var_50_39 = 1.73333333333333

			if var_50_39 < arg_47_1.time_ and arg_47_1.time_ <= var_50_39 + arg_50_0 then
				arg_47_1.var_.moveOldPos1095ui_story = var_50_38.localPosition
			end

			local var_50_40 = 0.001

			if var_50_39 <= arg_47_1.time_ and arg_47_1.time_ < var_50_39 + var_50_40 then
				local var_50_41 = (arg_47_1.time_ - var_50_39) / var_50_40
				local var_50_42 = Vector3.New(0, 100, 0)

				var_50_38.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1095ui_story, var_50_42, var_50_41)

				local var_50_43 = manager.ui.mainCamera.transform.position - var_50_38.position

				var_50_38.forward = Vector3.New(var_50_43.x, var_50_43.y, var_50_43.z)

				local var_50_44 = var_50_38.localEulerAngles

				var_50_44.z = 0
				var_50_44.x = 0
				var_50_38.localEulerAngles = var_50_44
			end

			if arg_47_1.time_ >= var_50_39 + var_50_40 and arg_47_1.time_ < var_50_39 + var_50_40 + arg_50_0 then
				var_50_38.localPosition = Vector3.New(0, 100, 0)

				local var_50_45 = manager.ui.mainCamera.transform.position - var_50_38.position

				var_50_38.forward = Vector3.New(var_50_45.x, var_50_45.y, var_50_45.z)

				local var_50_46 = var_50_38.localEulerAngles

				var_50_46.z = 0
				var_50_46.x = 0
				var_50_38.localEulerAngles = var_50_46
			end

			if arg_47_1.frameCnt_ <= 1 then
				arg_47_1.dialog_:SetActive(false)
			end

			local var_50_47 = 3
			local var_50_48 = 1.025

			if var_50_47 < arg_47_1.time_ and arg_47_1.time_ <= var_50_47 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				arg_47_1.dialog_:SetActive(true)

				local var_50_49 = LeanTween.value(arg_47_1.dialog_, 0, 1, 0.3)

				var_50_49:setOnUpdate(LuaHelper.FloatAction(function(arg_51_0)
					arg_47_1.dialogCg_.alpha = arg_51_0
				end))
				var_50_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_47_1.dialog_)
					var_50_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_47_1.duration_ = arg_47_1.duration_ + 0.3

				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_50 = arg_47_1:GetWordFromCfg(319691012)
				local var_50_51 = arg_47_1:FormatText(var_50_50.content)

				arg_47_1.text_.text = var_50_51

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_52 = 41
				local var_50_53 = utf8.len(var_50_51)
				local var_50_54 = var_50_52 <= 0 and var_50_48 or var_50_48 * (var_50_53 / var_50_52)

				if var_50_54 > 0 and var_50_48 < var_50_54 then
					arg_47_1.talkMaxDuration = var_50_54
					var_50_47 = var_50_47 + 0.3

					if var_50_54 + var_50_47 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_54 + var_50_47
					end
				end

				arg_47_1.text_.text = var_50_51
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_55 = var_50_47 + 0.3
			local var_50_56 = math.max(var_50_48, arg_47_1.talkMaxDuration)

			if var_50_55 <= arg_47_1.time_ and arg_47_1.time_ < var_50_55 + var_50_56 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_55) / var_50_56

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_55 + var_50_56 and arg_47_1.time_ < var_50_55 + var_50_56 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319691013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319691013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play319691014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 1.325

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_2 = arg_53_1:GetWordFromCfg(319691013)
				local var_56_3 = arg_53_1:FormatText(var_56_2.content)

				arg_53_1.text_.text = var_56_3

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_4 = 53
				local var_56_5 = utf8.len(var_56_3)
				local var_56_6 = var_56_4 <= 0 and var_56_1 or var_56_1 * (var_56_5 / var_56_4)

				if var_56_6 > 0 and var_56_1 < var_56_6 then
					arg_53_1.talkMaxDuration = var_56_6

					if var_56_6 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_6 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_3
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_7 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_7 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_7

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_7 and arg_53_1.time_ < var_56_0 + var_56_7 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play319691014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319691014
		arg_57_1.duration_ = 3.8

		local var_57_0 = {
			zh = 3.8,
			ja = 1.999999999999
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
				arg_57_0:Play319691015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10079ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos10079ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(0, -0.95, -6.05)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10079ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = arg_57_1.actors_["10079ui_story"]
			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 and arg_57_1.var_.characterEffect10079ui_story == nil then
				arg_57_1.var_.characterEffect10079ui_story = var_60_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_11 = 0.200000002980232

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_11 then
				local var_60_12 = (arg_57_1.time_ - var_60_10) / var_60_11

				if arg_57_1.var_.characterEffect10079ui_story then
					arg_57_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_10 + var_60_11 and arg_57_1.time_ < var_60_10 + var_60_11 + arg_60_0 and arg_57_1.var_.characterEffect10079ui_story then
				arg_57_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_60_13 = 0

			if var_60_13 < arg_57_1.time_ and arg_57_1.time_ <= var_60_13 + arg_60_0 then
				arg_57_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_60_14 = 0

			if var_60_14 < arg_57_1.time_ and arg_57_1.time_ <= var_60_14 + arg_60_0 then
				arg_57_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_60_15 = 0
			local var_60_16 = 0.475

			if var_60_15 < arg_57_1.time_ and arg_57_1.time_ <= var_60_15 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_17 = arg_57_1:FormatText(StoryNameCfg[6].name)

				arg_57_1.leftNameTxt_.text = var_60_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_18 = arg_57_1:GetWordFromCfg(319691014)
				local var_60_19 = arg_57_1:FormatText(var_60_18.content)

				arg_57_1.text_.text = var_60_19

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_20 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691014", "story_v_out_319691.awb") ~= 0 then
					local var_60_23 = manager.audio:GetVoiceLength("story_v_out_319691", "319691014", "story_v_out_319691.awb") / 1000

					if var_60_23 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_23 + var_60_15
					end

					if var_60_18.prefab_name ~= "" and arg_57_1.actors_[var_60_18.prefab_name] ~= nil then
						local var_60_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_18.prefab_name].transform, "story_v_out_319691", "319691014", "story_v_out_319691.awb")

						arg_57_1:RecordAudio("319691014", var_60_24)
						arg_57_1:RecordAudio("319691014", var_60_24)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_319691", "319691014", "story_v_out_319691.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_319691", "319691014", "story_v_out_319691.awb")
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
	Play319691015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319691015
		arg_61_1.duration_ = 8.633

		local var_61_0 = {
			zh = 8.033,
			ja = 8.633
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
				arg_61_0:Play319691016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["10079ui_story"].transform
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.var_.moveOldPos10079ui_story = var_64_0.localPosition
			end

			local var_64_2 = 0.001

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2
				local var_64_4 = Vector3.New(0.7, -0.95, -6.05)

				var_64_0.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos10079ui_story, var_64_4, var_64_3)

				local var_64_5 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_5.x, var_64_5.y, var_64_5.z)

				local var_64_6 = var_64_0.localEulerAngles

				var_64_6.z = 0
				var_64_6.x = 0
				var_64_0.localEulerAngles = var_64_6
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 then
				var_64_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_64_7 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_7.x, var_64_7.y, var_64_7.z)

				local var_64_8 = var_64_0.localEulerAngles

				var_64_8.z = 0
				var_64_8.x = 0
				var_64_0.localEulerAngles = var_64_8
			end

			local var_64_9 = arg_61_1.actors_["10079ui_story"]
			local var_64_10 = 0

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 and arg_61_1.var_.characterEffect10079ui_story == nil then
				arg_61_1.var_.characterEffect10079ui_story = var_64_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_11 = 0.200000002980232

			if var_64_10 <= arg_61_1.time_ and arg_61_1.time_ < var_64_10 + var_64_11 then
				local var_64_12 = (arg_61_1.time_ - var_64_10) / var_64_11

				if arg_61_1.var_.characterEffect10079ui_story then
					local var_64_13 = Mathf.Lerp(0, 0.5, var_64_12)

					arg_61_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_61_1.var_.characterEffect10079ui_story.fillRatio = var_64_13
				end
			end

			if arg_61_1.time_ >= var_64_10 + var_64_11 and arg_61_1.time_ < var_64_10 + var_64_11 + arg_64_0 and arg_61_1.var_.characterEffect10079ui_story then
				local var_64_14 = 0.5

				arg_61_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_61_1.var_.characterEffect10079ui_story.fillRatio = var_64_14
			end

			local var_64_15 = arg_61_1.actors_["1095ui_story"].transform
			local var_64_16 = 0

			if var_64_16 < arg_61_1.time_ and arg_61_1.time_ <= var_64_16 + arg_64_0 then
				arg_61_1.var_.moveOldPos1095ui_story = var_64_15.localPosition
			end

			local var_64_17 = 0.001

			if var_64_16 <= arg_61_1.time_ and arg_61_1.time_ < var_64_16 + var_64_17 then
				local var_64_18 = (arg_61_1.time_ - var_64_16) / var_64_17
				local var_64_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_64_15.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1095ui_story, var_64_19, var_64_18)

				local var_64_20 = manager.ui.mainCamera.transform.position - var_64_15.position

				var_64_15.forward = Vector3.New(var_64_20.x, var_64_20.y, var_64_20.z)

				local var_64_21 = var_64_15.localEulerAngles

				var_64_21.z = 0
				var_64_21.x = 0
				var_64_15.localEulerAngles = var_64_21
			end

			if arg_61_1.time_ >= var_64_16 + var_64_17 and arg_61_1.time_ < var_64_16 + var_64_17 + arg_64_0 then
				var_64_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_64_22 = manager.ui.mainCamera.transform.position - var_64_15.position

				var_64_15.forward = Vector3.New(var_64_22.x, var_64_22.y, var_64_22.z)

				local var_64_23 = var_64_15.localEulerAngles

				var_64_23.z = 0
				var_64_23.x = 0
				var_64_15.localEulerAngles = var_64_23
			end

			local var_64_24 = arg_61_1.actors_["1095ui_story"]
			local var_64_25 = 0

			if var_64_25 < arg_61_1.time_ and arg_61_1.time_ <= var_64_25 + arg_64_0 and arg_61_1.var_.characterEffect1095ui_story == nil then
				arg_61_1.var_.characterEffect1095ui_story = var_64_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_26 = 0.200000002980232

			if var_64_25 <= arg_61_1.time_ and arg_61_1.time_ < var_64_25 + var_64_26 then
				local var_64_27 = (arg_61_1.time_ - var_64_25) / var_64_26

				if arg_61_1.var_.characterEffect1095ui_story then
					arg_61_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_25 + var_64_26 and arg_61_1.time_ < var_64_25 + var_64_26 + arg_64_0 and arg_61_1.var_.characterEffect1095ui_story then
				arg_61_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_64_28 = 0
			local var_64_29 = 1.025

			if var_64_28 < arg_61_1.time_ and arg_61_1.time_ <= var_64_28 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_30 = arg_61_1:FormatText(StoryNameCfg[471].name)

				arg_61_1.leftNameTxt_.text = var_64_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_31 = arg_61_1:GetWordFromCfg(319691015)
				local var_64_32 = arg_61_1:FormatText(var_64_31.content)

				arg_61_1.text_.text = var_64_32

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_33 = 41
				local var_64_34 = utf8.len(var_64_32)
				local var_64_35 = var_64_33 <= 0 and var_64_29 or var_64_29 * (var_64_34 / var_64_33)

				if var_64_35 > 0 and var_64_29 < var_64_35 then
					arg_61_1.talkMaxDuration = var_64_35

					if var_64_35 + var_64_28 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_35 + var_64_28
					end
				end

				arg_61_1.text_.text = var_64_32
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691015", "story_v_out_319691.awb") ~= 0 then
					local var_64_36 = manager.audio:GetVoiceLength("story_v_out_319691", "319691015", "story_v_out_319691.awb") / 1000

					if var_64_36 + var_64_28 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_36 + var_64_28
					end

					if var_64_31.prefab_name ~= "" and arg_61_1.actors_[var_64_31.prefab_name] ~= nil then
						local var_64_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_31.prefab_name].transform, "story_v_out_319691", "319691015", "story_v_out_319691.awb")

						arg_61_1:RecordAudio("319691015", var_64_37)
						arg_61_1:RecordAudio("319691015", var_64_37)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_319691", "319691015", "story_v_out_319691.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_319691", "319691015", "story_v_out_319691.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_38 = math.max(var_64_29, arg_61_1.talkMaxDuration)

			if var_64_28 <= arg_61_1.time_ and arg_61_1.time_ < var_64_28 + var_64_38 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_28) / var_64_38

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_28 + var_64_38 and arg_61_1.time_ < var_64_28 + var_64_38 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play319691016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319691016
		arg_65_1.duration_ = 11.433

		local var_65_0 = {
			zh = 8.366,
			ja = 11.433
		}
		local var_65_1 = manager.audio:GetLocalizationFlag()

		if var_65_0[var_65_1] ~= nil then
			arg_65_1.duration_ = var_65_0[var_65_1]
		end

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play319691017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_68_2 = 0
			local var_68_3 = 0.85

			if var_68_2 < arg_65_1.time_ and arg_65_1.time_ <= var_68_2 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_4 = arg_65_1:FormatText(StoryNameCfg[471].name)

				arg_65_1.leftNameTxt_.text = var_68_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_5 = arg_65_1:GetWordFromCfg(319691016)
				local var_68_6 = arg_65_1:FormatText(var_68_5.content)

				arg_65_1.text_.text = var_68_6

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_7 = 34
				local var_68_8 = utf8.len(var_68_6)
				local var_68_9 = var_68_7 <= 0 and var_68_3 or var_68_3 * (var_68_8 / var_68_7)

				if var_68_9 > 0 and var_68_3 < var_68_9 then
					arg_65_1.talkMaxDuration = var_68_9

					if var_68_9 + var_68_2 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_9 + var_68_2
					end
				end

				arg_65_1.text_.text = var_68_6
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691016", "story_v_out_319691.awb") ~= 0 then
					local var_68_10 = manager.audio:GetVoiceLength("story_v_out_319691", "319691016", "story_v_out_319691.awb") / 1000

					if var_68_10 + var_68_2 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_10 + var_68_2
					end

					if var_68_5.prefab_name ~= "" and arg_65_1.actors_[var_68_5.prefab_name] ~= nil then
						local var_68_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_5.prefab_name].transform, "story_v_out_319691", "319691016", "story_v_out_319691.awb")

						arg_65_1:RecordAudio("319691016", var_68_11)
						arg_65_1:RecordAudio("319691016", var_68_11)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_319691", "319691016", "story_v_out_319691.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_319691", "319691016", "story_v_out_319691.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_12 = math.max(var_68_3, arg_65_1.talkMaxDuration)

			if var_68_2 <= arg_65_1.time_ and arg_65_1.time_ < var_68_2 + var_68_12 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_2) / var_68_12

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_2 + var_68_12 and arg_65_1.time_ < var_68_2 + var_68_12 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play319691017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319691017
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play319691018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1095ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect1095ui_story == nil then
				arg_69_1.var_.characterEffect1095ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.200000002980232

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1095ui_story then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1095ui_story.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1095ui_story then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1095ui_story.fillRatio = var_72_5
			end

			local var_72_6 = 0
			local var_72_7 = 1.4

			if var_72_6 < arg_69_1.time_ and arg_69_1.time_ <= var_72_6 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_8 = arg_69_1:GetWordFromCfg(319691017)
				local var_72_9 = arg_69_1:FormatText(var_72_8.content)

				arg_69_1.text_.text = var_72_9

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_10 = 56
				local var_72_11 = utf8.len(var_72_9)
				local var_72_12 = var_72_10 <= 0 and var_72_7 or var_72_7 * (var_72_11 / var_72_10)

				if var_72_12 > 0 and var_72_7 < var_72_12 then
					arg_69_1.talkMaxDuration = var_72_12

					if var_72_12 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_12 + var_72_6
					end
				end

				arg_69_1.text_.text = var_72_9
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_13 = math.max(var_72_7, arg_69_1.talkMaxDuration)

			if var_72_6 <= arg_69_1.time_ and arg_69_1.time_ < var_72_6 + var_72_13 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_6) / var_72_13

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_6 + var_72_13 and arg_69_1.time_ < var_72_6 + var_72_13 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319691018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319691018
		arg_73_1.duration_ = 6.2

		local var_73_0 = {
			zh = 4.666,
			ja = 6.2
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
				arg_73_0:Play319691019(arg_73_1)
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
				arg_73_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 then
				arg_73_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_76_15 = 0
			local var_76_16 = 0.55

			if var_76_15 < arg_73_1.time_ and arg_73_1.time_ <= var_76_15 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_17 = arg_73_1:FormatText(StoryNameCfg[6].name)

				arg_73_1.leftNameTxt_.text = var_76_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_18 = arg_73_1:GetWordFromCfg(319691018)
				local var_76_19 = arg_73_1:FormatText(var_76_18.content)

				arg_73_1.text_.text = var_76_19

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_20 = 22
				local var_76_21 = utf8.len(var_76_19)
				local var_76_22 = var_76_20 <= 0 and var_76_16 or var_76_16 * (var_76_21 / var_76_20)

				if var_76_22 > 0 and var_76_16 < var_76_22 then
					arg_73_1.talkMaxDuration = var_76_22

					if var_76_22 + var_76_15 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_22 + var_76_15
					end
				end

				arg_73_1.text_.text = var_76_19
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691018", "story_v_out_319691.awb") ~= 0 then
					local var_76_23 = manager.audio:GetVoiceLength("story_v_out_319691", "319691018", "story_v_out_319691.awb") / 1000

					if var_76_23 + var_76_15 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_23 + var_76_15
					end

					if var_76_18.prefab_name ~= "" and arg_73_1.actors_[var_76_18.prefab_name] ~= nil then
						local var_76_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_18.prefab_name].transform, "story_v_out_319691", "319691018", "story_v_out_319691.awb")

						arg_73_1:RecordAudio("319691018", var_76_24)
						arg_73_1:RecordAudio("319691018", var_76_24)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_319691", "319691018", "story_v_out_319691.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_319691", "319691018", "story_v_out_319691.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_25 = math.max(var_76_16, arg_73_1.talkMaxDuration)

			if var_76_15 <= arg_73_1.time_ and arg_73_1.time_ < var_76_15 + var_76_25 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_15) / var_76_25

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_15 + var_76_25 and arg_73_1.time_ < var_76_15 + var_76_25 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play319691019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319691019
		arg_77_1.duration_ = 2.8

		local var_77_0 = {
			zh = 1.466,
			ja = 2.8
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
				arg_77_0:Play319691020(arg_77_1)
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

			local var_80_13 = arg_77_1.actors_["10079ui_story"]
			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story == nil then
				arg_77_1.var_.characterEffect10079ui_story = var_80_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_15 = 0.200000002980232

			if var_80_14 <= arg_77_1.time_ and arg_77_1.time_ < var_80_14 + var_80_15 then
				local var_80_16 = (arg_77_1.time_ - var_80_14) / var_80_15

				if arg_77_1.var_.characterEffect10079ui_story then
					local var_80_17 = Mathf.Lerp(0, 0.5, var_80_16)

					arg_77_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_77_1.var_.characterEffect10079ui_story.fillRatio = var_80_17
				end
			end

			if arg_77_1.time_ >= var_80_14 + var_80_15 and arg_77_1.time_ < var_80_14 + var_80_15 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story then
				local var_80_18 = 0.5

				arg_77_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_77_1.var_.characterEffect10079ui_story.fillRatio = var_80_18
			end

			local var_80_19 = 0
			local var_80_20 = 0.2

			if var_80_19 < arg_77_1.time_ and arg_77_1.time_ <= var_80_19 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_21 = arg_77_1:FormatText(StoryNameCfg[471].name)

				arg_77_1.leftNameTxt_.text = var_80_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_22 = arg_77_1:GetWordFromCfg(319691019)
				local var_80_23 = arg_77_1:FormatText(var_80_22.content)

				arg_77_1.text_.text = var_80_23

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_24 = 8
				local var_80_25 = utf8.len(var_80_23)
				local var_80_26 = var_80_24 <= 0 and var_80_20 or var_80_20 * (var_80_25 / var_80_24)

				if var_80_26 > 0 and var_80_20 < var_80_26 then
					arg_77_1.talkMaxDuration = var_80_26

					if var_80_26 + var_80_19 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_26 + var_80_19
					end
				end

				arg_77_1.text_.text = var_80_23
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691019", "story_v_out_319691.awb") ~= 0 then
					local var_80_27 = manager.audio:GetVoiceLength("story_v_out_319691", "319691019", "story_v_out_319691.awb") / 1000

					if var_80_27 + var_80_19 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_27 + var_80_19
					end

					if var_80_22.prefab_name ~= "" and arg_77_1.actors_[var_80_22.prefab_name] ~= nil then
						local var_80_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_22.prefab_name].transform, "story_v_out_319691", "319691019", "story_v_out_319691.awb")

						arg_77_1:RecordAudio("319691019", var_80_28)
						arg_77_1:RecordAudio("319691019", var_80_28)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_319691", "319691019", "story_v_out_319691.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_319691", "319691019", "story_v_out_319691.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_29 = math.max(var_80_20, arg_77_1.talkMaxDuration)

			if var_80_19 <= arg_77_1.time_ and arg_77_1.time_ < var_80_19 + var_80_29 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_19) / var_80_29

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_19 + var_80_29 and arg_77_1.time_ < var_80_19 + var_80_29 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319691020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319691020
		arg_81_1.duration_ = 9.5

		local var_81_0 = {
			zh = 7.4,
			ja = 9.5
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
				arg_81_0:Play319691021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1095ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1095ui_story == nil then
				arg_81_1.var_.characterEffect1095ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.200000002980232

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1095ui_story then
					local var_84_4 = Mathf.Lerp(0, 0.5, var_84_3)

					arg_81_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1095ui_story.fillRatio = var_84_4
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1095ui_story then
				local var_84_5 = 0.5

				arg_81_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1095ui_story.fillRatio = var_84_5
			end

			local var_84_6 = arg_81_1.actors_["10079ui_story"]
			local var_84_7 = 0

			if var_84_7 < arg_81_1.time_ and arg_81_1.time_ <= var_84_7 + arg_84_0 and arg_81_1.var_.characterEffect10079ui_story == nil then
				arg_81_1.var_.characterEffect10079ui_story = var_84_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_8 = 0.200000002980232

			if var_84_7 <= arg_81_1.time_ and arg_81_1.time_ < var_84_7 + var_84_8 then
				local var_84_9 = (arg_81_1.time_ - var_84_7) / var_84_8

				if arg_81_1.var_.characterEffect10079ui_story then
					arg_81_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_7 + var_84_8 and arg_81_1.time_ < var_84_7 + var_84_8 + arg_84_0 and arg_81_1.var_.characterEffect10079ui_story then
				arg_81_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_84_10 = 0
			local var_84_11 = 0.85

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_12 = arg_81_1:FormatText(StoryNameCfg[6].name)

				arg_81_1.leftNameTxt_.text = var_84_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_13 = arg_81_1:GetWordFromCfg(319691020)
				local var_84_14 = arg_81_1:FormatText(var_84_13.content)

				arg_81_1.text_.text = var_84_14

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_15 = 34
				local var_84_16 = utf8.len(var_84_14)
				local var_84_17 = var_84_15 <= 0 and var_84_11 or var_84_11 * (var_84_16 / var_84_15)

				if var_84_17 > 0 and var_84_11 < var_84_17 then
					arg_81_1.talkMaxDuration = var_84_17

					if var_84_17 + var_84_10 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_17 + var_84_10
					end
				end

				arg_81_1.text_.text = var_84_14
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691020", "story_v_out_319691.awb") ~= 0 then
					local var_84_18 = manager.audio:GetVoiceLength("story_v_out_319691", "319691020", "story_v_out_319691.awb") / 1000

					if var_84_18 + var_84_10 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_18 + var_84_10
					end

					if var_84_13.prefab_name ~= "" and arg_81_1.actors_[var_84_13.prefab_name] ~= nil then
						local var_84_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_13.prefab_name].transform, "story_v_out_319691", "319691020", "story_v_out_319691.awb")

						arg_81_1:RecordAudio("319691020", var_84_19)
						arg_81_1:RecordAudio("319691020", var_84_19)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_319691", "319691020", "story_v_out_319691.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_319691", "319691020", "story_v_out_319691.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_20 = math.max(var_84_11, arg_81_1.talkMaxDuration)

			if var_84_10 <= arg_81_1.time_ and arg_81_1.time_ < var_84_10 + var_84_20 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_10) / var_84_20

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_10 + var_84_20 and arg_81_1.time_ < var_84_10 + var_84_20 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play319691021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 319691021
		arg_85_1.duration_ = 8.4

		local var_85_0 = {
			zh = 7.5,
			ja = 8.4
		}
		local var_85_1 = manager.audio:GetLocalizationFlag()

		if var_85_0[var_85_1] ~= nil then
			arg_85_1.duration_ = var_85_0[var_85_1]
		end

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play319691022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4137")
			end

			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_88_2 = 0
			local var_88_3 = 0.95

			if var_88_2 < arg_85_1.time_ and arg_85_1.time_ <= var_88_2 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_4 = arg_85_1:FormatText(StoryNameCfg[6].name)

				arg_85_1.leftNameTxt_.text = var_88_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_5 = arg_85_1:GetWordFromCfg(319691021)
				local var_88_6 = arg_85_1:FormatText(var_88_5.content)

				arg_85_1.text_.text = var_88_6

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_7 = 38
				local var_88_8 = utf8.len(var_88_6)
				local var_88_9 = var_88_7 <= 0 and var_88_3 or var_88_3 * (var_88_8 / var_88_7)

				if var_88_9 > 0 and var_88_3 < var_88_9 then
					arg_85_1.talkMaxDuration = var_88_9

					if var_88_9 + var_88_2 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_9 + var_88_2
					end
				end

				arg_85_1.text_.text = var_88_6
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691021", "story_v_out_319691.awb") ~= 0 then
					local var_88_10 = manager.audio:GetVoiceLength("story_v_out_319691", "319691021", "story_v_out_319691.awb") / 1000

					if var_88_10 + var_88_2 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_10 + var_88_2
					end

					if var_88_5.prefab_name ~= "" and arg_85_1.actors_[var_88_5.prefab_name] ~= nil then
						local var_88_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_5.prefab_name].transform, "story_v_out_319691", "319691021", "story_v_out_319691.awb")

						arg_85_1:RecordAudio("319691021", var_88_11)
						arg_85_1:RecordAudio("319691021", var_88_11)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_319691", "319691021", "story_v_out_319691.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_319691", "319691021", "story_v_out_319691.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_12 = math.max(var_88_3, arg_85_1.talkMaxDuration)

			if var_88_2 <= arg_85_1.time_ and arg_85_1.time_ < var_88_2 + var_88_12 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_2) / var_88_12

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_2 + var_88_12 and arg_85_1.time_ < var_88_2 + var_88_12 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play319691022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 319691022
		arg_89_1.duration_ = 3.5

		local var_89_0 = {
			zh = 1.999999999999,
			ja = 3.5
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
				arg_89_0:Play319691023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_92_2 = arg_89_1.actors_["1095ui_story"]
			local var_92_3 = 0

			if var_92_3 < arg_89_1.time_ and arg_89_1.time_ <= var_92_3 + arg_92_0 and arg_89_1.var_.characterEffect1095ui_story == nil then
				arg_89_1.var_.characterEffect1095ui_story = var_92_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_4 = 0.200000002980232

			if var_92_3 <= arg_89_1.time_ and arg_89_1.time_ < var_92_3 + var_92_4 then
				local var_92_5 = (arg_89_1.time_ - var_92_3) / var_92_4

				if arg_89_1.var_.characterEffect1095ui_story then
					arg_89_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_3 + var_92_4 and arg_89_1.time_ < var_92_3 + var_92_4 + arg_92_0 and arg_89_1.var_.characterEffect1095ui_story then
				arg_89_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_92_6 = arg_89_1.actors_["10079ui_story"]
			local var_92_7 = 0

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 and arg_89_1.var_.characterEffect10079ui_story == nil then
				arg_89_1.var_.characterEffect10079ui_story = var_92_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_8 = 0.200000002980232

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_8 then
				local var_92_9 = (arg_89_1.time_ - var_92_7) / var_92_8

				if arg_89_1.var_.characterEffect10079ui_story then
					local var_92_10 = Mathf.Lerp(0, 0.5, var_92_9)

					arg_89_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_89_1.var_.characterEffect10079ui_story.fillRatio = var_92_10
				end
			end

			if arg_89_1.time_ >= var_92_7 + var_92_8 and arg_89_1.time_ < var_92_7 + var_92_8 + arg_92_0 and arg_89_1.var_.characterEffect10079ui_story then
				local var_92_11 = 0.5

				arg_89_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_89_1.var_.characterEffect10079ui_story.fillRatio = var_92_11
			end

			local var_92_12 = 0
			local var_92_13 = 0.25

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_14 = arg_89_1:FormatText(StoryNameCfg[471].name)

				arg_89_1.leftNameTxt_.text = var_92_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_15 = arg_89_1:GetWordFromCfg(319691022)
				local var_92_16 = arg_89_1:FormatText(var_92_15.content)

				arg_89_1.text_.text = var_92_16

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_17 = 10
				local var_92_18 = utf8.len(var_92_16)
				local var_92_19 = var_92_17 <= 0 and var_92_13 or var_92_13 * (var_92_18 / var_92_17)

				if var_92_19 > 0 and var_92_13 < var_92_19 then
					arg_89_1.talkMaxDuration = var_92_19

					if var_92_19 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_19 + var_92_12
					end
				end

				arg_89_1.text_.text = var_92_16
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691022", "story_v_out_319691.awb") ~= 0 then
					local var_92_20 = manager.audio:GetVoiceLength("story_v_out_319691", "319691022", "story_v_out_319691.awb") / 1000

					if var_92_20 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_20 + var_92_12
					end

					if var_92_15.prefab_name ~= "" and arg_89_1.actors_[var_92_15.prefab_name] ~= nil then
						local var_92_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_15.prefab_name].transform, "story_v_out_319691", "319691022", "story_v_out_319691.awb")

						arg_89_1:RecordAudio("319691022", var_92_21)
						arg_89_1:RecordAudio("319691022", var_92_21)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_319691", "319691022", "story_v_out_319691.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_319691", "319691022", "story_v_out_319691.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_22 = math.max(var_92_13, arg_89_1.talkMaxDuration)

			if var_92_12 <= arg_89_1.time_ and arg_89_1.time_ < var_92_12 + var_92_22 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_12) / var_92_22

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_12 + var_92_22 and arg_89_1.time_ < var_92_12 + var_92_22 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play319691023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 319691023
		arg_93_1.duration_ = 2.633

		local var_93_0 = {
			zh = 2.333,
			ja = 2.633
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
				arg_93_0:Play319691024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1095ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1095ui_story == nil then
				arg_93_1.var_.characterEffect1095ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.200000002980232

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1095ui_story then
					local var_96_4 = Mathf.Lerp(0, 0.5, var_96_3)

					arg_93_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1095ui_story.fillRatio = var_96_4
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1095ui_story then
				local var_96_5 = 0.5

				arg_93_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1095ui_story.fillRatio = var_96_5
			end

			local var_96_6 = arg_93_1.actors_["10079ui_story"]
			local var_96_7 = 0

			if var_96_7 < arg_93_1.time_ and arg_93_1.time_ <= var_96_7 + arg_96_0 and arg_93_1.var_.characterEffect10079ui_story == nil then
				arg_93_1.var_.characterEffect10079ui_story = var_96_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_8 = 0.200000002980232

			if var_96_7 <= arg_93_1.time_ and arg_93_1.time_ < var_96_7 + var_96_8 then
				local var_96_9 = (arg_93_1.time_ - var_96_7) / var_96_8

				if arg_93_1.var_.characterEffect10079ui_story then
					arg_93_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_7 + var_96_8 and arg_93_1.time_ < var_96_7 + var_96_8 + arg_96_0 and arg_93_1.var_.characterEffect10079ui_story then
				arg_93_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_96_10 = 0
			local var_96_11 = 0.2

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_12 = arg_93_1:FormatText(StoryNameCfg[6].name)

				arg_93_1.leftNameTxt_.text = var_96_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_13 = arg_93_1:GetWordFromCfg(319691023)
				local var_96_14 = arg_93_1:FormatText(var_96_13.content)

				arg_93_1.text_.text = var_96_14

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_15 = 8
				local var_96_16 = utf8.len(var_96_14)
				local var_96_17 = var_96_15 <= 0 and var_96_11 or var_96_11 * (var_96_16 / var_96_15)

				if var_96_17 > 0 and var_96_11 < var_96_17 then
					arg_93_1.talkMaxDuration = var_96_17

					if var_96_17 + var_96_10 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_17 + var_96_10
					end
				end

				arg_93_1.text_.text = var_96_14
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691023", "story_v_out_319691.awb") ~= 0 then
					local var_96_18 = manager.audio:GetVoiceLength("story_v_out_319691", "319691023", "story_v_out_319691.awb") / 1000

					if var_96_18 + var_96_10 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_18 + var_96_10
					end

					if var_96_13.prefab_name ~= "" and arg_93_1.actors_[var_96_13.prefab_name] ~= nil then
						local var_96_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_13.prefab_name].transform, "story_v_out_319691", "319691023", "story_v_out_319691.awb")

						arg_93_1:RecordAudio("319691023", var_96_19)
						arg_93_1:RecordAudio("319691023", var_96_19)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_319691", "319691023", "story_v_out_319691.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_319691", "319691023", "story_v_out_319691.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_20 = math.max(var_96_11, arg_93_1.talkMaxDuration)

			if var_96_10 <= arg_93_1.time_ and arg_93_1.time_ < var_96_10 + var_96_20 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_10) / var_96_20

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_10 + var_96_20 and arg_93_1.time_ < var_96_10 + var_96_20 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play319691024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 319691024
		arg_97_1.duration_ = 13

		local var_97_0 = {
			zh = 13,
			ja = 12.133
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
				arg_97_0:Play319691025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1095ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story == nil then
				arg_97_1.var_.characterEffect1095ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1095ui_story then
					arg_97_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story then
				arg_97_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_100_4 = arg_97_1.actors_["10079ui_story"]
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 and arg_97_1.var_.characterEffect10079ui_story == nil then
				arg_97_1.var_.characterEffect10079ui_story = var_100_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_6 = 0.200000002980232

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6

				if arg_97_1.var_.characterEffect10079ui_story then
					local var_100_8 = Mathf.Lerp(0, 0.5, var_100_7)

					arg_97_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_97_1.var_.characterEffect10079ui_story.fillRatio = var_100_8
				end
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 and arg_97_1.var_.characterEffect10079ui_story then
				local var_100_9 = 0.5

				arg_97_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_97_1.var_.characterEffect10079ui_story.fillRatio = var_100_9
			end

			local var_100_10 = 0
			local var_100_11 = 1.075

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_12 = arg_97_1:FormatText(StoryNameCfg[471].name)

				arg_97_1.leftNameTxt_.text = var_100_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_13 = arg_97_1:GetWordFromCfg(319691024)
				local var_100_14 = arg_97_1:FormatText(var_100_13.content)

				arg_97_1.text_.text = var_100_14

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_15 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691024", "story_v_out_319691.awb") ~= 0 then
					local var_100_18 = manager.audio:GetVoiceLength("story_v_out_319691", "319691024", "story_v_out_319691.awb") / 1000

					if var_100_18 + var_100_10 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_10
					end

					if var_100_13.prefab_name ~= "" and arg_97_1.actors_[var_100_13.prefab_name] ~= nil then
						local var_100_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_13.prefab_name].transform, "story_v_out_319691", "319691024", "story_v_out_319691.awb")

						arg_97_1:RecordAudio("319691024", var_100_19)
						arg_97_1:RecordAudio("319691024", var_100_19)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_319691", "319691024", "story_v_out_319691.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_319691", "319691024", "story_v_out_319691.awb")
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
	Play319691025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 319691025
		arg_101_1.duration_ = 6.233

		local var_101_0 = {
			zh = 6.233,
			ja = 5.6
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
				arg_101_0:Play319691026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.8

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[471].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(319691025)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691025", "story_v_out_319691.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_319691", "319691025", "story_v_out_319691.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_319691", "319691025", "story_v_out_319691.awb")

						arg_101_1:RecordAudio("319691025", var_104_9)
						arg_101_1:RecordAudio("319691025", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_319691", "319691025", "story_v_out_319691.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_319691", "319691025", "story_v_out_319691.awb")
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
	Play319691026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319691026
		arg_105_1.duration_ = 4.833

		local var_105_0 = {
			zh = 3.766,
			ja = 4.833
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
				arg_105_0:Play319691027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10079ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos10079ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0.7, -0.95, -6.05)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10079ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = 0

			if var_108_9 < arg_105_1.time_ and arg_105_1.time_ <= var_108_9 + arg_108_0 then
				arg_105_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 then
				arg_105_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_108_11 = arg_105_1.actors_["1095ui_story"]
			local var_108_12 = 0

			if var_108_12 < arg_105_1.time_ and arg_105_1.time_ <= var_108_12 + arg_108_0 and arg_105_1.var_.characterEffect1095ui_story == nil then
				arg_105_1.var_.characterEffect1095ui_story = var_108_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_13 = 0.200000002980232

			if var_108_12 <= arg_105_1.time_ and arg_105_1.time_ < var_108_12 + var_108_13 then
				local var_108_14 = (arg_105_1.time_ - var_108_12) / var_108_13

				if arg_105_1.var_.characterEffect1095ui_story then
					local var_108_15 = Mathf.Lerp(0, 0.5, var_108_14)

					arg_105_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1095ui_story.fillRatio = var_108_15
				end
			end

			if arg_105_1.time_ >= var_108_12 + var_108_13 and arg_105_1.time_ < var_108_12 + var_108_13 + arg_108_0 and arg_105_1.var_.characterEffect1095ui_story then
				local var_108_16 = 0.5

				arg_105_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1095ui_story.fillRatio = var_108_16
			end

			local var_108_17 = arg_105_1.actors_["10079ui_story"]
			local var_108_18 = 0

			if var_108_18 < arg_105_1.time_ and arg_105_1.time_ <= var_108_18 + arg_108_0 and arg_105_1.var_.characterEffect10079ui_story == nil then
				arg_105_1.var_.characterEffect10079ui_story = var_108_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_19 = 0.200000002980232

			if var_108_18 <= arg_105_1.time_ and arg_105_1.time_ < var_108_18 + var_108_19 then
				local var_108_20 = (arg_105_1.time_ - var_108_18) / var_108_19

				if arg_105_1.var_.characterEffect10079ui_story then
					arg_105_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_18 + var_108_19 and arg_105_1.time_ < var_108_18 + var_108_19 + arg_108_0 and arg_105_1.var_.characterEffect10079ui_story then
				arg_105_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_108_21 = 0
			local var_108_22 = 0.4

			if var_108_21 < arg_105_1.time_ and arg_105_1.time_ <= var_108_21 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_23 = arg_105_1:FormatText(StoryNameCfg[6].name)

				arg_105_1.leftNameTxt_.text = var_108_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_24 = arg_105_1:GetWordFromCfg(319691026)
				local var_108_25 = arg_105_1:FormatText(var_108_24.content)

				arg_105_1.text_.text = var_108_25

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_26 = 16
				local var_108_27 = utf8.len(var_108_25)
				local var_108_28 = var_108_26 <= 0 and var_108_22 or var_108_22 * (var_108_27 / var_108_26)

				if var_108_28 > 0 and var_108_22 < var_108_28 then
					arg_105_1.talkMaxDuration = var_108_28

					if var_108_28 + var_108_21 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_28 + var_108_21
					end
				end

				arg_105_1.text_.text = var_108_25
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691026", "story_v_out_319691.awb") ~= 0 then
					local var_108_29 = manager.audio:GetVoiceLength("story_v_out_319691", "319691026", "story_v_out_319691.awb") / 1000

					if var_108_29 + var_108_21 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_29 + var_108_21
					end

					if var_108_24.prefab_name ~= "" and arg_105_1.actors_[var_108_24.prefab_name] ~= nil then
						local var_108_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_24.prefab_name].transform, "story_v_out_319691", "319691026", "story_v_out_319691.awb")

						arg_105_1:RecordAudio("319691026", var_108_30)
						arg_105_1:RecordAudio("319691026", var_108_30)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_319691", "319691026", "story_v_out_319691.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_319691", "319691026", "story_v_out_319691.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_31 = math.max(var_108_22, arg_105_1.talkMaxDuration)

			if var_108_21 <= arg_105_1.time_ and arg_105_1.time_ < var_108_21 + var_108_31 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_21) / var_108_31

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_21 + var_108_31 and arg_105_1.time_ < var_108_21 + var_108_31 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play319691027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319691027
		arg_109_1.duration_ = 5.733

		local var_109_0 = {
			zh = 4.966,
			ja = 5.733
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
				arg_109_0:Play319691028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1095ui_story"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1095ui_story = var_112_0.localPosition
			end

			local var_112_2 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2
				local var_112_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1095ui_story, var_112_4, var_112_3)

				local var_112_5 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_5.x, var_112_5.y, var_112_5.z)

				local var_112_6 = var_112_0.localEulerAngles

				var_112_6.z = 0
				var_112_6.x = 0
				var_112_0.localEulerAngles = var_112_6
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_112_7 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_7.x, var_112_7.y, var_112_7.z)

				local var_112_8 = var_112_0.localEulerAngles

				var_112_8.z = 0
				var_112_8.x = 0
				var_112_0.localEulerAngles = var_112_8
			end

			local var_112_9 = arg_109_1.actors_["1095ui_story"]
			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect1095ui_story == nil then
				arg_109_1.var_.characterEffect1095ui_story = var_112_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_11 = 0.200000002980232

			if var_112_10 <= arg_109_1.time_ and arg_109_1.time_ < var_112_10 + var_112_11 then
				local var_112_12 = (arg_109_1.time_ - var_112_10) / var_112_11

				if arg_109_1.var_.characterEffect1095ui_story then
					arg_109_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_10 + var_112_11 and arg_109_1.time_ < var_112_10 + var_112_11 + arg_112_0 and arg_109_1.var_.characterEffect1095ui_story then
				arg_109_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_112_13 = 0

			if var_112_13 < arg_109_1.time_ and arg_109_1.time_ <= var_112_13 + arg_112_0 then
				arg_109_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_1")
			end

			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 then
				arg_109_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_112_15 = arg_109_1.actors_["10079ui_story"]
			local var_112_16 = 0

			if var_112_16 < arg_109_1.time_ and arg_109_1.time_ <= var_112_16 + arg_112_0 and arg_109_1.var_.characterEffect10079ui_story == nil then
				arg_109_1.var_.characterEffect10079ui_story = var_112_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_17 = 0.200000002980232

			if var_112_16 <= arg_109_1.time_ and arg_109_1.time_ < var_112_16 + var_112_17 then
				local var_112_18 = (arg_109_1.time_ - var_112_16) / var_112_17

				if arg_109_1.var_.characterEffect10079ui_story then
					local var_112_19 = Mathf.Lerp(0, 0.5, var_112_18)

					arg_109_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_109_1.var_.characterEffect10079ui_story.fillRatio = var_112_19
				end
			end

			if arg_109_1.time_ >= var_112_16 + var_112_17 and arg_109_1.time_ < var_112_16 + var_112_17 + arg_112_0 and arg_109_1.var_.characterEffect10079ui_story then
				local var_112_20 = 0.5

				arg_109_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_109_1.var_.characterEffect10079ui_story.fillRatio = var_112_20
			end

			local var_112_21 = 0
			local var_112_22 = 0.4

			if var_112_21 < arg_109_1.time_ and arg_109_1.time_ <= var_112_21 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_23 = arg_109_1:FormatText(StoryNameCfg[471].name)

				arg_109_1.leftNameTxt_.text = var_112_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_24 = arg_109_1:GetWordFromCfg(319691027)
				local var_112_25 = arg_109_1:FormatText(var_112_24.content)

				arg_109_1.text_.text = var_112_25

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_26 = 16
				local var_112_27 = utf8.len(var_112_25)
				local var_112_28 = var_112_26 <= 0 and var_112_22 or var_112_22 * (var_112_27 / var_112_26)

				if var_112_28 > 0 and var_112_22 < var_112_28 then
					arg_109_1.talkMaxDuration = var_112_28

					if var_112_28 + var_112_21 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_28 + var_112_21
					end
				end

				arg_109_1.text_.text = var_112_25
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691027", "story_v_out_319691.awb") ~= 0 then
					local var_112_29 = manager.audio:GetVoiceLength("story_v_out_319691", "319691027", "story_v_out_319691.awb") / 1000

					if var_112_29 + var_112_21 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_29 + var_112_21
					end

					if var_112_24.prefab_name ~= "" and arg_109_1.actors_[var_112_24.prefab_name] ~= nil then
						local var_112_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_24.prefab_name].transform, "story_v_out_319691", "319691027", "story_v_out_319691.awb")

						arg_109_1:RecordAudio("319691027", var_112_30)
						arg_109_1:RecordAudio("319691027", var_112_30)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_319691", "319691027", "story_v_out_319691.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_319691", "319691027", "story_v_out_319691.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_31 = math.max(var_112_22, arg_109_1.talkMaxDuration)

			if var_112_21 <= arg_109_1.time_ and arg_109_1.time_ < var_112_21 + var_112_31 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_21) / var_112_31

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_21 + var_112_31 and arg_109_1.time_ < var_112_21 + var_112_31 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play319691028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319691028
		arg_113_1.duration_ = 13.9

		local var_113_0 = {
			zh = 11.966,
			ja = 13.9
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
				arg_113_0:Play319691029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.275

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[471].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(319691028)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 51
				local var_116_6 = utf8.len(var_116_4)
				local var_116_7 = var_116_5 <= 0 and var_116_1 or var_116_1 * (var_116_6 / var_116_5)

				if var_116_7 > 0 and var_116_1 < var_116_7 then
					arg_113_1.talkMaxDuration = var_116_7

					if var_116_7 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_7 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_4
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691028", "story_v_out_319691.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_319691", "319691028", "story_v_out_319691.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_319691", "319691028", "story_v_out_319691.awb")

						arg_113_1:RecordAudio("319691028", var_116_9)
						arg_113_1:RecordAudio("319691028", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_319691", "319691028", "story_v_out_319691.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_319691", "319691028", "story_v_out_319691.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_10 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_10 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_10

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_10 and arg_113_1.time_ < var_116_0 + var_116_10 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319691029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319691029
		arg_117_1.duration_ = 11.833

		local var_117_0 = {
			zh = 11.833,
			ja = 9.466
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
				arg_117_0:Play319691030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 1.275

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[471].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(319691029)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 51
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

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691029", "story_v_out_319691.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_out_319691", "319691029", "story_v_out_319691.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_out_319691", "319691029", "story_v_out_319691.awb")

						arg_117_1:RecordAudio("319691029", var_120_9)
						arg_117_1:RecordAudio("319691029", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_319691", "319691029", "story_v_out_319691.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_319691", "319691029", "story_v_out_319691.awb")
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
	Play319691030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319691030
		arg_121_1.duration_ = 3.266

		local var_121_0 = {
			zh = 3.266,
			ja = 1.999999999999
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
				arg_121_0:Play319691031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10079ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos10079ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0.7, -0.95, -6.05)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos10079ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = 0

			if var_124_9 < arg_121_1.time_ and arg_121_1.time_ <= var_124_9 + arg_124_0 then
				arg_121_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 then
				arg_121_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_124_11 = arg_121_1.actors_["1095ui_story"]
			local var_124_12 = 0

			if var_124_12 < arg_121_1.time_ and arg_121_1.time_ <= var_124_12 + arg_124_0 and arg_121_1.var_.characterEffect1095ui_story == nil then
				arg_121_1.var_.characterEffect1095ui_story = var_124_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_13 = 0.200000002980232

			if var_124_12 <= arg_121_1.time_ and arg_121_1.time_ < var_124_12 + var_124_13 then
				local var_124_14 = (arg_121_1.time_ - var_124_12) / var_124_13

				if arg_121_1.var_.characterEffect1095ui_story then
					local var_124_15 = Mathf.Lerp(0, 0.5, var_124_14)

					arg_121_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1095ui_story.fillRatio = var_124_15
				end
			end

			if arg_121_1.time_ >= var_124_12 + var_124_13 and arg_121_1.time_ < var_124_12 + var_124_13 + arg_124_0 and arg_121_1.var_.characterEffect1095ui_story then
				local var_124_16 = 0.5

				arg_121_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1095ui_story.fillRatio = var_124_16
			end

			local var_124_17 = arg_121_1.actors_["10079ui_story"]
			local var_124_18 = 0

			if var_124_18 < arg_121_1.time_ and arg_121_1.time_ <= var_124_18 + arg_124_0 and arg_121_1.var_.characterEffect10079ui_story == nil then
				arg_121_1.var_.characterEffect10079ui_story = var_124_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_19 = 0.200000002980232

			if var_124_18 <= arg_121_1.time_ and arg_121_1.time_ < var_124_18 + var_124_19 then
				local var_124_20 = (arg_121_1.time_ - var_124_18) / var_124_19

				if arg_121_1.var_.characterEffect10079ui_story then
					arg_121_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_18 + var_124_19 and arg_121_1.time_ < var_124_18 + var_124_19 + arg_124_0 and arg_121_1.var_.characterEffect10079ui_story then
				arg_121_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_124_21 = 0
			local var_124_22 = 0.375

			if var_124_21 < arg_121_1.time_ and arg_121_1.time_ <= var_124_21 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_23 = arg_121_1:FormatText(StoryNameCfg[6].name)

				arg_121_1.leftNameTxt_.text = var_124_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_24 = arg_121_1:GetWordFromCfg(319691030)
				local var_124_25 = arg_121_1:FormatText(var_124_24.content)

				arg_121_1.text_.text = var_124_25

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_26 = 15
				local var_124_27 = utf8.len(var_124_25)
				local var_124_28 = var_124_26 <= 0 and var_124_22 or var_124_22 * (var_124_27 / var_124_26)

				if var_124_28 > 0 and var_124_22 < var_124_28 then
					arg_121_1.talkMaxDuration = var_124_28

					if var_124_28 + var_124_21 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_28 + var_124_21
					end
				end

				arg_121_1.text_.text = var_124_25
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691030", "story_v_out_319691.awb") ~= 0 then
					local var_124_29 = manager.audio:GetVoiceLength("story_v_out_319691", "319691030", "story_v_out_319691.awb") / 1000

					if var_124_29 + var_124_21 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_29 + var_124_21
					end

					if var_124_24.prefab_name ~= "" and arg_121_1.actors_[var_124_24.prefab_name] ~= nil then
						local var_124_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_24.prefab_name].transform, "story_v_out_319691", "319691030", "story_v_out_319691.awb")

						arg_121_1:RecordAudio("319691030", var_124_30)
						arg_121_1:RecordAudio("319691030", var_124_30)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_319691", "319691030", "story_v_out_319691.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_319691", "319691030", "story_v_out_319691.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_31 = math.max(var_124_22, arg_121_1.talkMaxDuration)

			if var_124_21 <= arg_121_1.time_ and arg_121_1.time_ < var_124_21 + var_124_31 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_21) / var_124_31

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_21 + var_124_31 and arg_121_1.time_ < var_124_21 + var_124_31 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play319691031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319691031
		arg_125_1.duration_ = 8.566

		local var_125_0 = {
			zh = 8.566,
			ja = 7.266
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
				arg_125_0:Play319691032(arg_125_1)
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
				arg_125_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_2")
			end

			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 then
				arg_125_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_128_15 = arg_125_1.actors_["10079ui_story"]
			local var_128_16 = 0

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 and arg_125_1.var_.characterEffect10079ui_story == nil then
				arg_125_1.var_.characterEffect10079ui_story = var_128_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_17 = 0.200000002980232

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_16) / var_128_17

				if arg_125_1.var_.characterEffect10079ui_story then
					local var_128_19 = Mathf.Lerp(0, 0.5, var_128_18)

					arg_125_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_125_1.var_.characterEffect10079ui_story.fillRatio = var_128_19
				end
			end

			if arg_125_1.time_ >= var_128_16 + var_128_17 and arg_125_1.time_ < var_128_16 + var_128_17 + arg_128_0 and arg_125_1.var_.characterEffect10079ui_story then
				local var_128_20 = 0.5

				arg_125_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_125_1.var_.characterEffect10079ui_story.fillRatio = var_128_20
			end

			local var_128_21 = 0
			local var_128_22 = 0.85

			if var_128_21 < arg_125_1.time_ and arg_125_1.time_ <= var_128_21 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_23 = arg_125_1:FormatText(StoryNameCfg[471].name)

				arg_125_1.leftNameTxt_.text = var_128_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_24 = arg_125_1:GetWordFromCfg(319691031)
				local var_128_25 = arg_125_1:FormatText(var_128_24.content)

				arg_125_1.text_.text = var_128_25

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_26 = 34
				local var_128_27 = utf8.len(var_128_25)
				local var_128_28 = var_128_26 <= 0 and var_128_22 or var_128_22 * (var_128_27 / var_128_26)

				if var_128_28 > 0 and var_128_22 < var_128_28 then
					arg_125_1.talkMaxDuration = var_128_28

					if var_128_28 + var_128_21 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_28 + var_128_21
					end
				end

				arg_125_1.text_.text = var_128_25
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691031", "story_v_out_319691.awb") ~= 0 then
					local var_128_29 = manager.audio:GetVoiceLength("story_v_out_319691", "319691031", "story_v_out_319691.awb") / 1000

					if var_128_29 + var_128_21 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_29 + var_128_21
					end

					if var_128_24.prefab_name ~= "" and arg_125_1.actors_[var_128_24.prefab_name] ~= nil then
						local var_128_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_24.prefab_name].transform, "story_v_out_319691", "319691031", "story_v_out_319691.awb")

						arg_125_1:RecordAudio("319691031", var_128_30)
						arg_125_1:RecordAudio("319691031", var_128_30)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319691", "319691031", "story_v_out_319691.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319691", "319691031", "story_v_out_319691.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_31 = math.max(var_128_22, arg_125_1.talkMaxDuration)

			if var_128_21 <= arg_125_1.time_ and arg_125_1.time_ < var_128_21 + var_128_31 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_21) / var_128_31

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_21 + var_128_31 and arg_125_1.time_ < var_128_21 + var_128_31 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319691032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319691032
		arg_129_1.duration_ = 8.033

		local var_129_0 = {
			zh = 7.833,
			ja = 8.033
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
				arg_129_0:Play319691033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.925

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[471].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(319691032)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691032", "story_v_out_319691.awb") ~= 0 then
					local var_132_8 = manager.audio:GetVoiceLength("story_v_out_319691", "319691032", "story_v_out_319691.awb") / 1000

					if var_132_8 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_8 + var_132_0
					end

					if var_132_3.prefab_name ~= "" and arg_129_1.actors_[var_132_3.prefab_name] ~= nil then
						local var_132_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_3.prefab_name].transform, "story_v_out_319691", "319691032", "story_v_out_319691.awb")

						arg_129_1:RecordAudio("319691032", var_132_9)
						arg_129_1:RecordAudio("319691032", var_132_9)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319691", "319691032", "story_v_out_319691.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319691", "319691032", "story_v_out_319691.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_10 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_10 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_10

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_10 and arg_129_1.time_ < var_132_0 + var_132_10 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319691033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319691033
		arg_133_1.duration_ = 9.7

		local var_133_0 = {
			zh = 9.7,
			ja = 5.9
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
				arg_133_0:Play319691034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 1

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[471].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(319691033)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 40
				local var_136_6 = utf8.len(var_136_4)
				local var_136_7 = var_136_5 <= 0 and var_136_1 or var_136_1 * (var_136_6 / var_136_5)

				if var_136_7 > 0 and var_136_1 < var_136_7 then
					arg_133_1.talkMaxDuration = var_136_7

					if var_136_7 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_7 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_4
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691033", "story_v_out_319691.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_319691", "319691033", "story_v_out_319691.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_319691", "319691033", "story_v_out_319691.awb")

						arg_133_1:RecordAudio("319691033", var_136_9)
						arg_133_1:RecordAudio("319691033", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319691", "319691033", "story_v_out_319691.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319691", "319691033", "story_v_out_319691.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_10 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_10 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_10

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_10 and arg_133_1.time_ < var_136_0 + var_136_10 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319691034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319691034
		arg_137_1.duration_ = 15.233

		local var_137_0 = {
			zh = 11.8,
			ja = 15.233
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
				arg_137_0:Play319691035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 1.325

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[471].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(319691034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 53
				local var_140_6 = utf8.len(var_140_4)
				local var_140_7 = var_140_5 <= 0 and var_140_1 or var_140_1 * (var_140_6 / var_140_5)

				if var_140_7 > 0 and var_140_1 < var_140_7 then
					arg_137_1.talkMaxDuration = var_140_7

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_4
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691034", "story_v_out_319691.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_319691", "319691034", "story_v_out_319691.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_319691", "319691034", "story_v_out_319691.awb")

						arg_137_1:RecordAudio("319691034", var_140_9)
						arg_137_1:RecordAudio("319691034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319691", "319691034", "story_v_out_319691.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319691", "319691034", "story_v_out_319691.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_10 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_10 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_10

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_10 and arg_137_1.time_ < var_140_0 + var_140_10 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319691035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319691035
		arg_141_1.duration_ = 12.9

		local var_141_0 = {
			zh = 12.9,
			ja = 4.7
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
				arg_141_0:Play319691036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 1

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				local var_144_2 = "play"
				local var_144_3 = "effect"

				arg_141_1:AudioAction(var_144_2, var_144_3, "se_story_130", "se_story_130_didi", "")
			end

			local var_144_4 = 0

			if var_144_4 < arg_141_1.time_ and arg_141_1.time_ <= var_144_4 + arg_144_0 then
				arg_141_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_144_5 = 0
			local var_144_6 = 0.975

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_7 = arg_141_1:FormatText(StoryNameCfg[471].name)

				arg_141_1.leftNameTxt_.text = var_144_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_8 = arg_141_1:GetWordFromCfg(319691035)
				local var_144_9 = arg_141_1:FormatText(var_144_8.content)

				arg_141_1.text_.text = var_144_9

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_10 = 39
				local var_144_11 = utf8.len(var_144_9)
				local var_144_12 = var_144_10 <= 0 and var_144_6 or var_144_6 * (var_144_11 / var_144_10)

				if var_144_12 > 0 and var_144_6 < var_144_12 then
					arg_141_1.talkMaxDuration = var_144_12

					if var_144_12 + var_144_5 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_12 + var_144_5
					end
				end

				arg_141_1.text_.text = var_144_9
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691035", "story_v_out_319691.awb") ~= 0 then
					local var_144_13 = manager.audio:GetVoiceLength("story_v_out_319691", "319691035", "story_v_out_319691.awb") / 1000

					if var_144_13 + var_144_5 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_13 + var_144_5
					end

					if var_144_8.prefab_name ~= "" and arg_141_1.actors_[var_144_8.prefab_name] ~= nil then
						local var_144_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_8.prefab_name].transform, "story_v_out_319691", "319691035", "story_v_out_319691.awb")

						arg_141_1:RecordAudio("319691035", var_144_14)
						arg_141_1:RecordAudio("319691035", var_144_14)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319691", "319691035", "story_v_out_319691.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319691", "319691035", "story_v_out_319691.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_15 = math.max(var_144_6, arg_141_1.talkMaxDuration)

			if var_144_5 <= arg_141_1.time_ and arg_141_1.time_ < var_144_5 + var_144_15 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_5) / var_144_15

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_5 + var_144_15 and arg_141_1.time_ < var_144_5 + var_144_15 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319691036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319691036
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play319691037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1095ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1095ui_story == nil then
				arg_145_1.var_.characterEffect1095ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1095ui_story then
					local var_148_4 = Mathf.Lerp(0, 0.5, var_148_3)

					arg_145_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1095ui_story.fillRatio = var_148_4
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1095ui_story then
				local var_148_5 = 0.5

				arg_145_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1095ui_story.fillRatio = var_148_5
			end

			local var_148_6 = 0
			local var_148_7 = 0.775

			if var_148_6 < arg_145_1.time_ and arg_145_1.time_ <= var_148_6 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_8 = arg_145_1:GetWordFromCfg(319691036)
				local var_148_9 = arg_145_1:FormatText(var_148_8.content)

				arg_145_1.text_.text = var_148_9

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_10 = 31
				local var_148_11 = utf8.len(var_148_9)
				local var_148_12 = var_148_10 <= 0 and var_148_7 or var_148_7 * (var_148_11 / var_148_10)

				if var_148_12 > 0 and var_148_7 < var_148_12 then
					arg_145_1.talkMaxDuration = var_148_12

					if var_148_12 + var_148_6 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_12 + var_148_6
					end
				end

				arg_145_1.text_.text = var_148_9
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_13 = math.max(var_148_7, arg_145_1.talkMaxDuration)

			if var_148_6 <= arg_145_1.time_ and arg_145_1.time_ < var_148_6 + var_148_13 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_6) / var_148_13

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_6 + var_148_13 and arg_145_1.time_ < var_148_6 + var_148_13 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play319691037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319691037
		arg_149_1.duration_ = 5.566

		local var_149_0 = {
			zh = 3.533,
			ja = 5.566
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
			arg_149_1.auto_ = false
		end

		function arg_149_1.playNext_(arg_151_0)
			arg_149_1.onStoryFinished_()
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1095ui_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos1095ui_story = var_152_0.localPosition
			end

			local var_152_2 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2
				local var_152_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1095ui_story, var_152_4, var_152_3)

				local var_152_5 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_5.x, var_152_5.y, var_152_5.z)

				local var_152_6 = var_152_0.localEulerAngles

				var_152_6.z = 0
				var_152_6.x = 0
				var_152_0.localEulerAngles = var_152_6
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_152_7 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_7.x, var_152_7.y, var_152_7.z)

				local var_152_8 = var_152_0.localEulerAngles

				var_152_8.z = 0
				var_152_8.x = 0
				var_152_0.localEulerAngles = var_152_8
			end

			local var_152_9 = arg_149_1.actors_["1095ui_story"]
			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 and arg_149_1.var_.characterEffect1095ui_story == nil then
				arg_149_1.var_.characterEffect1095ui_story = var_152_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_11 = 0.200000002980232

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_10) / var_152_11

				if arg_149_1.var_.characterEffect1095ui_story then
					arg_149_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_10 + var_152_11 and arg_149_1.time_ < var_152_10 + var_152_11 + arg_152_0 and arg_149_1.var_.characterEffect1095ui_story then
				arg_149_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_152_13 = 0

			if var_152_13 < arg_149_1.time_ and arg_149_1.time_ <= var_152_13 + arg_152_0 then
				arg_149_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_152_14 = 0
			local var_152_15 = 0.325

			if var_152_14 < arg_149_1.time_ and arg_149_1.time_ <= var_152_14 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_16 = arg_149_1:FormatText(StoryNameCfg[471].name)

				arg_149_1.leftNameTxt_.text = var_152_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_17 = arg_149_1:GetWordFromCfg(319691037)
				local var_152_18 = arg_149_1:FormatText(var_152_17.content)

				arg_149_1.text_.text = var_152_18

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_19 = 13
				local var_152_20 = utf8.len(var_152_18)
				local var_152_21 = var_152_19 <= 0 and var_152_15 or var_152_15 * (var_152_20 / var_152_19)

				if var_152_21 > 0 and var_152_15 < var_152_21 then
					arg_149_1.talkMaxDuration = var_152_21

					if var_152_21 + var_152_14 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_21 + var_152_14
					end
				end

				arg_149_1.text_.text = var_152_18
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319691", "319691037", "story_v_out_319691.awb") ~= 0 then
					local var_152_22 = manager.audio:GetVoiceLength("story_v_out_319691", "319691037", "story_v_out_319691.awb") / 1000

					if var_152_22 + var_152_14 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_22 + var_152_14
					end

					if var_152_17.prefab_name ~= "" and arg_149_1.actors_[var_152_17.prefab_name] ~= nil then
						local var_152_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_17.prefab_name].transform, "story_v_out_319691", "319691037", "story_v_out_319691.awb")

						arg_149_1:RecordAudio("319691037", var_152_23)
						arg_149_1:RecordAudio("319691037", var_152_23)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_319691", "319691037", "story_v_out_319691.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_319691", "319691037", "story_v_out_319691.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_24 = math.max(var_152_15, arg_149_1.talkMaxDuration)

			if var_152_14 <= arg_149_1.time_ and arg_149_1.time_ < var_152_14 + var_152_24 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_14) / var_152_24

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_14 + var_152_24 and arg_149_1.time_ < var_152_14 + var_152_24 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I12g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I12h"
	},
	voices = {
		"story_v_out_319691.awb"
	}
}
