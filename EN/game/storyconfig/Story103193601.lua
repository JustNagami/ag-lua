return {
	Play319361001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319361001
		arg_1_1.duration_ = 17.5

		local var_1_0 = {
			zh = 12.966,
			ja = 17.5
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
				arg_1_0:Play319361002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I11q"

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
				local var_4_5 = arg_1_1.bgs_.I11q

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
					if iter_4_0 ~= "I11q" then
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

			local var_4_22 = "1095ui_story"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("Char/" .. var_4_22), arg_1_1.stage_.transform)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_22] = var_4_23

				local var_4_24 = var_4_23:GetComponentInChildren(typeof(CharacterEffect))

				var_4_24.enabled = true

				local var_4_25 = GameObjectTools.GetOrAddComponent(var_4_23, typeof(DynamicBoneHelper))

				if var_4_25 then
					var_4_25:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_24.transform, false)

				arg_1_1.var_[var_4_22 .. "Animator"] = var_4_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_22 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_22 .. "LipSync"] = var_4_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_26 = arg_1_1.actors_["1095ui_story"].transform
			local var_4_27 = 1.8

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1095ui_story = var_4_26.localPosition

				local var_4_28 = "1095ui_story"

				arg_1_1:ShowWeapon(arg_1_1.var_[var_4_28 .. "Animator"].transform, false)
			end

			local var_4_29 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_29 then
				local var_4_30 = (arg_1_1.time_ - var_4_27) / var_4_29
				local var_4_31 = Vector3.New(0, -0.98, -6.1)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1095ui_story, var_4_31, var_4_30)

				local var_4_32 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_32.x, var_4_32.y, var_4_32.z)

				local var_4_33 = var_4_26.localEulerAngles

				var_4_33.z = 0
				var_4_33.x = 0
				var_4_26.localEulerAngles = var_4_33
			end

			if arg_1_1.time_ >= var_4_27 + var_4_29 and arg_1_1.time_ < var_4_27 + var_4_29 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_4_34 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_34.x, var_4_34.y, var_4_34.z)

				local var_4_35 = var_4_26.localEulerAngles

				var_4_35.z = 0
				var_4_35.x = 0
				var_4_26.localEulerAngles = var_4_35
			end

			local var_4_36 = arg_1_1.actors_["1095ui_story"]
			local var_4_37 = 1.8

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story == nil then
				arg_1_1.var_.characterEffect1095ui_story = var_4_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_38 = 0.200000002980232

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 then
				local var_4_39 = (arg_1_1.time_ - var_4_37) / var_4_38

				if arg_1_1.var_.characterEffect1095ui_story then
					arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story then
				arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_4_40 = 1.8

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_4_41 = 1.8

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_42 = 0.166666666666667
			local var_4_43 = 0.933333333333333

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				local var_4_44 = "play"
				local var_4_45 = "music"

				arg_1_1:AudioAction(var_4_44, var_4_45, "bgm_activity_3_0_story_data", "bgm_activity_3_0_story_data", "bgm_activity_3_0_story_data.awb")
			end

			local var_4_46 = 0
			local var_4_47 = 0.133333333333333

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				local var_4_48 = "play"
				local var_4_49 = "music"

				arg_1_1:AudioAction(var_4_48, var_4_49, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_50 = 2
			local var_4_51 = 1.4

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_52 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_52:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_53 = arg_1_1:FormatText(StoryNameCfg[471].name)

				arg_1_1.leftNameTxt_.text = var_4_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_54 = arg_1_1:GetWordFromCfg(319361001)
				local var_4_55 = arg_1_1:FormatText(var_4_54.content)

				arg_1_1.text_.text = var_4_55

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_56 = 56
				local var_4_57 = utf8.len(var_4_55)
				local var_4_58 = var_4_56 <= 0 and var_4_51 or var_4_51 * (var_4_57 / var_4_56)

				if var_4_58 > 0 and var_4_51 < var_4_58 then
					arg_1_1.talkMaxDuration = var_4_58
					var_4_50 = var_4_50 + 0.3

					if var_4_58 + var_4_50 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_50
					end
				end

				arg_1_1.text_.text = var_4_55
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361001", "story_v_out_319361.awb") ~= 0 then
					local var_4_59 = manager.audio:GetVoiceLength("story_v_out_319361", "319361001", "story_v_out_319361.awb") / 1000

					if var_4_59 + var_4_50 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_59 + var_4_50
					end

					if var_4_54.prefab_name ~= "" and arg_1_1.actors_[var_4_54.prefab_name] ~= nil then
						local var_4_60 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_54.prefab_name].transform, "story_v_out_319361", "319361001", "story_v_out_319361.awb")

						arg_1_1:RecordAudio("319361001", var_4_60)
						arg_1_1:RecordAudio("319361001", var_4_60)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319361", "319361001", "story_v_out_319361.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319361", "319361001", "story_v_out_319361.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_61 = var_4_50 + 0.3
			local var_4_62 = math.max(var_4_51, arg_1_1.talkMaxDuration)

			if var_4_61 <= arg_1_1.time_ and arg_1_1.time_ < var_4_61 + var_4_62 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_61) / var_4_62

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_61 + var_4_62 and arg_1_1.time_ < var_4_61 + var_4_62 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319361002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319361002
		arg_7_1.duration_ = 12.333

		local var_7_0 = {
			zh = 11.9,
			ja = 12.333
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
				arg_7_0:Play319361003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.4

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[471].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(319361002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361002", "story_v_out_319361.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_319361", "319361002", "story_v_out_319361.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_319361", "319361002", "story_v_out_319361.awb")

						arg_7_1:RecordAudio("319361002", var_10_9)
						arg_7_1:RecordAudio("319361002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319361", "319361002", "story_v_out_319361.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319361", "319361002", "story_v_out_319361.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_10 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_10 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_10

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_10 and arg_7_1.time_ < var_10_0 + var_10_10 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319361003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319361003
		arg_11_1.duration_ = 11.5

		local var_11_0 = {
			zh = 11.5,
			ja = 8.933
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
				arg_11_0:Play319361004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.3

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[471].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(319361003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 52
				local var_14_6 = utf8.len(var_14_4)
				local var_14_7 = var_14_5 <= 0 and var_14_1 or var_14_1 * (var_14_6 / var_14_5)

				if var_14_7 > 0 and var_14_1 < var_14_7 then
					arg_11_1.talkMaxDuration = var_14_7

					if var_14_7 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_7 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_4
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361003", "story_v_out_319361.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_319361", "319361003", "story_v_out_319361.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_319361", "319361003", "story_v_out_319361.awb")

						arg_11_1:RecordAudio("319361003", var_14_9)
						arg_11_1:RecordAudio("319361003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319361", "319361003", "story_v_out_319361.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319361", "319361003", "story_v_out_319361.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_10 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_10 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_10

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_10 and arg_11_1.time_ < var_14_0 + var_14_10 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319361004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319361004
		arg_15_1.duration_ = 10.6

		local var_15_0 = {
			zh = 10.6,
			ja = 9.666
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
				arg_15_0:Play319361005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.2

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[471].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(319361004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 48
				local var_18_6 = utf8.len(var_18_4)
				local var_18_7 = var_18_5 <= 0 and var_18_1 or var_18_1 * (var_18_6 / var_18_5)

				if var_18_7 > 0 and var_18_1 < var_18_7 then
					arg_15_1.talkMaxDuration = var_18_7

					if var_18_7 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_7 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_4
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361004", "story_v_out_319361.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_319361", "319361004", "story_v_out_319361.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_319361", "319361004", "story_v_out_319361.awb")

						arg_15_1:RecordAudio("319361004", var_18_9)
						arg_15_1:RecordAudio("319361004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319361", "319361004", "story_v_out_319361.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319361", "319361004", "story_v_out_319361.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_10 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_10 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_10

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_10 and arg_15_1.time_ < var_18_0 + var_18_10 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319361005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319361005
		arg_19_1.duration_ = 13.666

		local var_19_0 = {
			zh = 13.3,
			ja = 13.666
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
				arg_19_0:Play319361006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_1")
			end

			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_22_2 = 0
			local var_22_3 = 1.4

			if var_22_2 < arg_19_1.time_ and arg_19_1.time_ <= var_22_2 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_4 = arg_19_1:FormatText(StoryNameCfg[471].name)

				arg_19_1.leftNameTxt_.text = var_22_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_5 = arg_19_1:GetWordFromCfg(319361005)
				local var_22_6 = arg_19_1:FormatText(var_22_5.content)

				arg_19_1.text_.text = var_22_6

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_7 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361005", "story_v_out_319361.awb") ~= 0 then
					local var_22_10 = manager.audio:GetVoiceLength("story_v_out_319361", "319361005", "story_v_out_319361.awb") / 1000

					if var_22_10 + var_22_2 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_10 + var_22_2
					end

					if var_22_5.prefab_name ~= "" and arg_19_1.actors_[var_22_5.prefab_name] ~= nil then
						local var_22_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_5.prefab_name].transform, "story_v_out_319361", "319361005", "story_v_out_319361.awb")

						arg_19_1:RecordAudio("319361005", var_22_11)
						arg_19_1:RecordAudio("319361005", var_22_11)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319361", "319361005", "story_v_out_319361.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319361", "319361005", "story_v_out_319361.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_12 = math.max(var_22_3, arg_19_1.talkMaxDuration)

			if var_22_2 <= arg_19_1.time_ and arg_19_1.time_ < var_22_2 + var_22_12 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_2) / var_22_12

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_2 + var_22_12 and arg_19_1.time_ < var_22_2 + var_22_12 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319361006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319361006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play319361007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1095ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story == nil then
				arg_23_1.var_.characterEffect1095ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1095ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 1.15

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(319361006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 46
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_7 or var_26_7 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_7 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_13 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_13 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_13

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_13 and arg_23_1.time_ < var_26_6 + var_26_13 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319361007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319361007
		arg_27_1.duration_ = 3.366

		local var_27_0 = {
			zh = 2.566,
			ja = 3.366
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
				arg_27_0:Play319361008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1095ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1095ui_story == nil then
				arg_27_1.var_.characterEffect1095ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1095ui_story then
					arg_27_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1095ui_story then
				arg_27_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_30_4 = 0

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_2")
			end

			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_30_6 = 0
			local var_30_7 = 0.3

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[471].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(319361007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361007", "story_v_out_319361.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_out_319361", "319361007", "story_v_out_319361.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_out_319361", "319361007", "story_v_out_319361.awb")

						arg_27_1:RecordAudio("319361007", var_30_15)
						arg_27_1:RecordAudio("319361007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_319361", "319361007", "story_v_out_319361.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_319361", "319361007", "story_v_out_319361.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_16 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_16 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_16

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_16 and arg_27_1.time_ < var_30_6 + var_30_16 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319361008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319361008
		arg_31_1.duration_ = 2.833

		local var_31_0 = {
			zh = 2.3,
			ja = 2.833
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
				arg_31_0:Play319361009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "10079ui_story"

			if arg_31_1.actors_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(Asset.Load("Char/" .. var_34_0), arg_31_1.stage_.transform)

				var_34_1.name = var_34_0
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.actors_[var_34_0] = var_34_1

				local var_34_2 = var_34_1:GetComponentInChildren(typeof(CharacterEffect))

				var_34_2.enabled = true

				local var_34_3 = GameObjectTools.GetOrAddComponent(var_34_1, typeof(DynamicBoneHelper))

				if var_34_3 then
					var_34_3:EnableDynamicBone(false)
				end

				arg_31_1:ShowWeapon(var_34_2.transform, false)

				arg_31_1.var_[var_34_0 .. "Animator"] = var_34_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_31_1.var_[var_34_0 .. "Animator"].applyRootMotion = true
				arg_31_1.var_[var_34_0 .. "LipSync"] = var_34_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_34_4 = arg_31_1.actors_["10079ui_story"].transform
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.var_.moveOldPos10079ui_story = var_34_4.localPosition

				local var_34_6 = "10079ui_story"

				arg_31_1:ShowWeapon(arg_31_1.var_[var_34_6 .. "Animator"].transform, false)
			end

			local var_34_7 = 0.001

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_7 then
				local var_34_8 = (arg_31_1.time_ - var_34_5) / var_34_7
				local var_34_9 = Vector3.New(0.7, -0.95, -6.05)

				var_34_4.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10079ui_story, var_34_9, var_34_8)

				local var_34_10 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_10.x, var_34_10.y, var_34_10.z)

				local var_34_11 = var_34_4.localEulerAngles

				var_34_11.z = 0
				var_34_11.x = 0
				var_34_4.localEulerAngles = var_34_11
			end

			if arg_31_1.time_ >= var_34_5 + var_34_7 and arg_31_1.time_ < var_34_5 + var_34_7 + arg_34_0 then
				var_34_4.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_34_12 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_12.x, var_34_12.y, var_34_12.z)

				local var_34_13 = var_34_4.localEulerAngles

				var_34_13.z = 0
				var_34_13.x = 0
				var_34_4.localEulerAngles = var_34_13
			end

			local var_34_14 = arg_31_1.actors_["10079ui_story"]
			local var_34_15 = 0

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 and arg_31_1.var_.characterEffect10079ui_story == nil then
				arg_31_1.var_.characterEffect10079ui_story = var_34_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_16 = 0.200000002980232

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_16 then
				local var_34_17 = (arg_31_1.time_ - var_34_15) / var_34_16

				if arg_31_1.var_.characterEffect10079ui_story then
					arg_31_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_15 + var_34_16 and arg_31_1.time_ < var_34_15 + var_34_16 + arg_34_0 and arg_31_1.var_.characterEffect10079ui_story then
				arg_31_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_34_18 = 0

			if var_34_18 < arg_31_1.time_ and arg_31_1.time_ <= var_34_18 + arg_34_0 then
				arg_31_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_34_19 = 0

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 then
				arg_31_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_20 = arg_31_1.actors_["1095ui_story"].transform
			local var_34_21 = 0

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.var_.moveOldPos1095ui_story = var_34_20.localPosition
			end

			local var_34_22 = 0.001

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_22 then
				local var_34_23 = (arg_31_1.time_ - var_34_21) / var_34_22
				local var_34_24 = Vector3.New(-0.7, -0.98, -6.1)

				var_34_20.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1095ui_story, var_34_24, var_34_23)

				local var_34_25 = manager.ui.mainCamera.transform.position - var_34_20.position

				var_34_20.forward = Vector3.New(var_34_25.x, var_34_25.y, var_34_25.z)

				local var_34_26 = var_34_20.localEulerAngles

				var_34_26.z = 0
				var_34_26.x = 0
				var_34_20.localEulerAngles = var_34_26
			end

			if arg_31_1.time_ >= var_34_21 + var_34_22 and arg_31_1.time_ < var_34_21 + var_34_22 + arg_34_0 then
				var_34_20.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_34_27 = manager.ui.mainCamera.transform.position - var_34_20.position

				var_34_20.forward = Vector3.New(var_34_27.x, var_34_27.y, var_34_27.z)

				local var_34_28 = var_34_20.localEulerAngles

				var_34_28.z = 0
				var_34_28.x = 0
				var_34_20.localEulerAngles = var_34_28
			end

			local var_34_29 = arg_31_1.actors_["1095ui_story"]
			local var_34_30 = 0

			if var_34_30 < arg_31_1.time_ and arg_31_1.time_ <= var_34_30 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story == nil then
				arg_31_1.var_.characterEffect1095ui_story = var_34_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_31 = 0.200000002980232

			if var_34_30 <= arg_31_1.time_ and arg_31_1.time_ < var_34_30 + var_34_31 then
				local var_34_32 = (arg_31_1.time_ - var_34_30) / var_34_31

				if arg_31_1.var_.characterEffect1095ui_story then
					local var_34_33 = Mathf.Lerp(0, 0.5, var_34_32)

					arg_31_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1095ui_story.fillRatio = var_34_33
				end
			end

			if arg_31_1.time_ >= var_34_30 + var_34_31 and arg_31_1.time_ < var_34_30 + var_34_31 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story then
				local var_34_34 = 0.5

				arg_31_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1095ui_story.fillRatio = var_34_34
			end

			local var_34_35 = 0
			local var_34_36 = 0.25

			if var_34_35 < arg_31_1.time_ and arg_31_1.time_ <= var_34_35 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_37 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_38 = arg_31_1:GetWordFromCfg(319361008)
				local var_34_39 = arg_31_1:FormatText(var_34_38.content)

				arg_31_1.text_.text = var_34_39

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_40 = 10
				local var_34_41 = utf8.len(var_34_39)
				local var_34_42 = var_34_40 <= 0 and var_34_36 or var_34_36 * (var_34_41 / var_34_40)

				if var_34_42 > 0 and var_34_36 < var_34_42 then
					arg_31_1.talkMaxDuration = var_34_42

					if var_34_42 + var_34_35 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_42 + var_34_35
					end
				end

				arg_31_1.text_.text = var_34_39
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361008", "story_v_out_319361.awb") ~= 0 then
					local var_34_43 = manager.audio:GetVoiceLength("story_v_out_319361", "319361008", "story_v_out_319361.awb") / 1000

					if var_34_43 + var_34_35 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_43 + var_34_35
					end

					if var_34_38.prefab_name ~= "" and arg_31_1.actors_[var_34_38.prefab_name] ~= nil then
						local var_34_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_38.prefab_name].transform, "story_v_out_319361", "319361008", "story_v_out_319361.awb")

						arg_31_1:RecordAudio("319361008", var_34_44)
						arg_31_1:RecordAudio("319361008", var_34_44)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319361", "319361008", "story_v_out_319361.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319361", "319361008", "story_v_out_319361.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_45 = math.max(var_34_36, arg_31_1.talkMaxDuration)

			if var_34_35 <= arg_31_1.time_ and arg_31_1.time_ < var_34_35 + var_34_45 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_35) / var_34_45

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_35 + var_34_45 and arg_31_1.time_ < var_34_35 + var_34_45 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319361009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319361009
		arg_35_1.duration_ = 5.133

		local var_35_0 = {
			zh = 2.466,
			ja = 5.133
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
				arg_35_0:Play319361010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10079ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect10079ui_story == nil then
				arg_35_1.var_.characterEffect10079ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect10079ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_35_1.var_.characterEffect10079ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect10079ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_35_1.var_.characterEffect10079ui_story.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["1095ui_story"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story == nil then
				arg_35_1.var_.characterEffect1095ui_story = var_38_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_8 = 0.200000002980232

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8

				if arg_35_1.var_.characterEffect1095ui_story then
					arg_35_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				arg_35_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_38_10 = 0
			local var_38_11 = 0.225

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_12 = arg_35_1:FormatText(StoryNameCfg[471].name)

				arg_35_1.leftNameTxt_.text = var_38_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_13 = arg_35_1:GetWordFromCfg(319361009)
				local var_38_14 = arg_35_1:FormatText(var_38_13.content)

				arg_35_1.text_.text = var_38_14

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_15 = 9
				local var_38_16 = utf8.len(var_38_14)
				local var_38_17 = var_38_15 <= 0 and var_38_11 or var_38_11 * (var_38_16 / var_38_15)

				if var_38_17 > 0 and var_38_11 < var_38_17 then
					arg_35_1.talkMaxDuration = var_38_17

					if var_38_17 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_17 + var_38_10
					end
				end

				arg_35_1.text_.text = var_38_14
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361009", "story_v_out_319361.awb") ~= 0 then
					local var_38_18 = manager.audio:GetVoiceLength("story_v_out_319361", "319361009", "story_v_out_319361.awb") / 1000

					if var_38_18 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_10
					end

					if var_38_13.prefab_name ~= "" and arg_35_1.actors_[var_38_13.prefab_name] ~= nil then
						local var_38_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_13.prefab_name].transform, "story_v_out_319361", "319361009", "story_v_out_319361.awb")

						arg_35_1:RecordAudio("319361009", var_38_19)
						arg_35_1:RecordAudio("319361009", var_38_19)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319361", "319361009", "story_v_out_319361.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319361", "319361009", "story_v_out_319361.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_20 = math.max(var_38_11, arg_35_1.talkMaxDuration)

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_20 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_10) / var_38_20

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_10 + var_38_20 and arg_35_1.time_ < var_38_10 + var_38_20 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319361010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319361010
		arg_39_1.duration_ = 7.933

		local var_39_0 = {
			zh = 5.266,
			ja = 7.933
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
				arg_39_0:Play319361011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10079ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10079ui_story == nil then
				arg_39_1.var_.characterEffect10079ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10079ui_story then
					arg_39_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10079ui_story then
				arg_39_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["1095ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story == nil then
				arg_39_1.var_.characterEffect1095ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.200000002980232

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1095ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1095ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1095ui_story.fillRatio = var_42_9
			end

			local var_42_10 = 0
			local var_42_11 = 0.675

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_12 = arg_39_1:FormatText(StoryNameCfg[6].name)

				arg_39_1.leftNameTxt_.text = var_42_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_13 = arg_39_1:GetWordFromCfg(319361010)
				local var_42_14 = arg_39_1:FormatText(var_42_13.content)

				arg_39_1.text_.text = var_42_14

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_15 = 27
				local var_42_16 = utf8.len(var_42_14)
				local var_42_17 = var_42_15 <= 0 and var_42_11 or var_42_11 * (var_42_16 / var_42_15)

				if var_42_17 > 0 and var_42_11 < var_42_17 then
					arg_39_1.talkMaxDuration = var_42_17

					if var_42_17 + var_42_10 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_17 + var_42_10
					end
				end

				arg_39_1.text_.text = var_42_14
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361010", "story_v_out_319361.awb") ~= 0 then
					local var_42_18 = manager.audio:GetVoiceLength("story_v_out_319361", "319361010", "story_v_out_319361.awb") / 1000

					if var_42_18 + var_42_10 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_18 + var_42_10
					end

					if var_42_13.prefab_name ~= "" and arg_39_1.actors_[var_42_13.prefab_name] ~= nil then
						local var_42_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_13.prefab_name].transform, "story_v_out_319361", "319361010", "story_v_out_319361.awb")

						arg_39_1:RecordAudio("319361010", var_42_19)
						arg_39_1:RecordAudio("319361010", var_42_19)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319361", "319361010", "story_v_out_319361.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319361", "319361010", "story_v_out_319361.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_20 = math.max(var_42_11, arg_39_1.talkMaxDuration)

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_20 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_10) / var_42_20

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_10 + var_42_20 and arg_39_1.time_ < var_42_10 + var_42_20 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319361011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319361011
		arg_43_1.duration_ = 6.866

		local var_43_0 = {
			zh = 5.8,
			ja = 6.866
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
				arg_43_0:Play319361012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10079ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect10079ui_story == nil then
				arg_43_1.var_.characterEffect10079ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect10079ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_43_1.var_.characterEffect10079ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect10079ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_43_1.var_.characterEffect10079ui_story.fillRatio = var_46_5
			end

			local var_46_6 = arg_43_1.actors_["1095ui_story"]
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 and arg_43_1.var_.characterEffect1095ui_story == nil then
				arg_43_1.var_.characterEffect1095ui_story = var_46_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_8 = 0.200000002980232

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_8 then
				local var_46_9 = (arg_43_1.time_ - var_46_7) / var_46_8

				if arg_43_1.var_.characterEffect1095ui_story then
					arg_43_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_7 + var_46_8 and arg_43_1.time_ < var_46_7 + var_46_8 + arg_46_0 and arg_43_1.var_.characterEffect1095ui_story then
				arg_43_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_46_11 = 0

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_12 = 0
			local var_46_13 = 0.6

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_14 = arg_43_1:FormatText(StoryNameCfg[471].name)

				arg_43_1.leftNameTxt_.text = var_46_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_15 = arg_43_1:GetWordFromCfg(319361011)
				local var_46_16 = arg_43_1:FormatText(var_46_15.content)

				arg_43_1.text_.text = var_46_16

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_17 = 24
				local var_46_18 = utf8.len(var_46_16)
				local var_46_19 = var_46_17 <= 0 and var_46_13 or var_46_13 * (var_46_18 / var_46_17)

				if var_46_19 > 0 and var_46_13 < var_46_19 then
					arg_43_1.talkMaxDuration = var_46_19

					if var_46_19 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_12
					end
				end

				arg_43_1.text_.text = var_46_16
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361011", "story_v_out_319361.awb") ~= 0 then
					local var_46_20 = manager.audio:GetVoiceLength("story_v_out_319361", "319361011", "story_v_out_319361.awb") / 1000

					if var_46_20 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_20 + var_46_12
					end

					if var_46_15.prefab_name ~= "" and arg_43_1.actors_[var_46_15.prefab_name] ~= nil then
						local var_46_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_15.prefab_name].transform, "story_v_out_319361", "319361011", "story_v_out_319361.awb")

						arg_43_1:RecordAudio("319361011", var_46_21)
						arg_43_1:RecordAudio("319361011", var_46_21)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319361", "319361011", "story_v_out_319361.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319361", "319361011", "story_v_out_319361.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_22 = math.max(var_46_13, arg_43_1.talkMaxDuration)

			if var_46_12 <= arg_43_1.time_ and arg_43_1.time_ < var_46_12 + var_46_22 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_12) / var_46_22

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_12 + var_46_22 and arg_43_1.time_ < var_46_12 + var_46_22 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319361012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319361012
		arg_47_1.duration_ = 10.6

		local var_47_0 = {
			zh = 10.433,
			ja = 10.6
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
				arg_47_0:Play319361013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10079ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect10079ui_story == nil then
				arg_47_1.var_.characterEffect10079ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect10079ui_story then
					arg_47_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect10079ui_story then
				arg_47_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["1095ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story == nil then
				arg_47_1.var_.characterEffect1095ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.200000002980232

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect1095ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_9
			end

			local var_50_10 = 0
			local var_50_11 = 1.175

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_12 = arg_47_1:FormatText(StoryNameCfg[6].name)

				arg_47_1.leftNameTxt_.text = var_50_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_13 = arg_47_1:GetWordFromCfg(319361012)
				local var_50_14 = arg_47_1:FormatText(var_50_13.content)

				arg_47_1.text_.text = var_50_14

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_15 = 47
				local var_50_16 = utf8.len(var_50_14)
				local var_50_17 = var_50_15 <= 0 and var_50_11 or var_50_11 * (var_50_16 / var_50_15)

				if var_50_17 > 0 and var_50_11 < var_50_17 then
					arg_47_1.talkMaxDuration = var_50_17

					if var_50_17 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_17 + var_50_10
					end
				end

				arg_47_1.text_.text = var_50_14
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361012", "story_v_out_319361.awb") ~= 0 then
					local var_50_18 = manager.audio:GetVoiceLength("story_v_out_319361", "319361012", "story_v_out_319361.awb") / 1000

					if var_50_18 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_18 + var_50_10
					end

					if var_50_13.prefab_name ~= "" and arg_47_1.actors_[var_50_13.prefab_name] ~= nil then
						local var_50_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_13.prefab_name].transform, "story_v_out_319361", "319361012", "story_v_out_319361.awb")

						arg_47_1:RecordAudio("319361012", var_50_19)
						arg_47_1:RecordAudio("319361012", var_50_19)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319361", "319361012", "story_v_out_319361.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319361", "319361012", "story_v_out_319361.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_20 = math.max(var_50_11, arg_47_1.talkMaxDuration)

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_20 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_10) / var_50_20

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_10 + var_50_20 and arg_47_1.time_ < var_50_10 + var_50_20 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319361013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319361013
		arg_51_1.duration_ = 6.766

		local var_51_0 = {
			zh = 6.766,
			ja = 4.833
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
				arg_51_0:Play319361014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10079ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect10079ui_story == nil then
				arg_51_1.var_.characterEffect10079ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect10079ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_51_1.var_.characterEffect10079ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect10079ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_51_1.var_.characterEffect10079ui_story.fillRatio = var_54_5
			end

			local var_54_6 = arg_51_1.actors_["1095ui_story"]
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story == nil then
				arg_51_1.var_.characterEffect1095ui_story = var_54_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_8 = 0.200000002980232

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_8 then
				local var_54_9 = (arg_51_1.time_ - var_54_7) / var_54_8

				if arg_51_1.var_.characterEffect1095ui_story then
					arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_7 + var_54_8 and arg_51_1.time_ < var_54_7 + var_54_8 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story then
				arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_54_10 = 0
			local var_54_11 = 0.775

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_12 = arg_51_1:FormatText(StoryNameCfg[471].name)

				arg_51_1.leftNameTxt_.text = var_54_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_13 = arg_51_1:GetWordFromCfg(319361013)
				local var_54_14 = arg_51_1:FormatText(var_54_13.content)

				arg_51_1.text_.text = var_54_14

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_15 = 31
				local var_54_16 = utf8.len(var_54_14)
				local var_54_17 = var_54_15 <= 0 and var_54_11 or var_54_11 * (var_54_16 / var_54_15)

				if var_54_17 > 0 and var_54_11 < var_54_17 then
					arg_51_1.talkMaxDuration = var_54_17

					if var_54_17 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_17 + var_54_10
					end
				end

				arg_51_1.text_.text = var_54_14
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361013", "story_v_out_319361.awb") ~= 0 then
					local var_54_18 = manager.audio:GetVoiceLength("story_v_out_319361", "319361013", "story_v_out_319361.awb") / 1000

					if var_54_18 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_10
					end

					if var_54_13.prefab_name ~= "" and arg_51_1.actors_[var_54_13.prefab_name] ~= nil then
						local var_54_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_13.prefab_name].transform, "story_v_out_319361", "319361013", "story_v_out_319361.awb")

						arg_51_1:RecordAudio("319361013", var_54_19)
						arg_51_1:RecordAudio("319361013", var_54_19)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319361", "319361013", "story_v_out_319361.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319361", "319361013", "story_v_out_319361.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_20 = math.max(var_54_11, arg_51_1.talkMaxDuration)

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_20 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_10) / var_54_20

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_10 + var_54_20 and arg_51_1.time_ < var_54_10 + var_54_20 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319361014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319361014
		arg_55_1.duration_ = 7.133

		local var_55_0 = {
			zh = 7.133,
			ja = 6.566
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
				arg_55_0:Play319361015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1095ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1095ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1095ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1095ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story == nil then
				arg_55_1.var_.characterEffect1095ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1095ui_story then
					arg_55_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story then
				arg_55_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_58_13 = 0
			local var_58_14 = 0.9

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_15 = arg_55_1:FormatText(StoryNameCfg[471].name)

				arg_55_1.leftNameTxt_.text = var_58_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_16 = arg_55_1:GetWordFromCfg(319361014)
				local var_58_17 = arg_55_1:FormatText(var_58_16.content)

				arg_55_1.text_.text = var_58_17

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_18 = 36
				local var_58_19 = utf8.len(var_58_17)
				local var_58_20 = var_58_18 <= 0 and var_58_14 or var_58_14 * (var_58_19 / var_58_18)

				if var_58_20 > 0 and var_58_14 < var_58_20 then
					arg_55_1.talkMaxDuration = var_58_20

					if var_58_20 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_13
					end
				end

				arg_55_1.text_.text = var_58_17
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361014", "story_v_out_319361.awb") ~= 0 then
					local var_58_21 = manager.audio:GetVoiceLength("story_v_out_319361", "319361014", "story_v_out_319361.awb") / 1000

					if var_58_21 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_21 + var_58_13
					end

					if var_58_16.prefab_name ~= "" and arg_55_1.actors_[var_58_16.prefab_name] ~= nil then
						local var_58_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_16.prefab_name].transform, "story_v_out_319361", "319361014", "story_v_out_319361.awb")

						arg_55_1:RecordAudio("319361014", var_58_22)
						arg_55_1:RecordAudio("319361014", var_58_22)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_319361", "319361014", "story_v_out_319361.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_319361", "319361014", "story_v_out_319361.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_23 = math.max(var_58_14, arg_55_1.talkMaxDuration)

			if var_58_13 <= arg_55_1.time_ and arg_55_1.time_ < var_58_13 + var_58_23 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_13) / var_58_23

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_13 + var_58_23 and arg_55_1.time_ < var_58_13 + var_58_23 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play319361015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319361015
		arg_59_1.duration_ = 9.166

		local var_59_0 = {
			zh = 8.3,
			ja = 9.166
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
				arg_59_0:Play319361016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10079ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos10079ui_story = var_62_0.localPosition

				local var_62_2 = "10079ui_story"

				arg_59_1:ShowWeapon(arg_59_1.var_[var_62_2 .. "Animator"].transform, false)
			end

			local var_62_3 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_3 then
				local var_62_4 = (arg_59_1.time_ - var_62_1) / var_62_3
				local var_62_5 = Vector3.New(0.7, -0.95, -6.05)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10079ui_story, var_62_5, var_62_4)

				local var_62_6 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_6.x, var_62_6.y, var_62_6.z)

				local var_62_7 = var_62_0.localEulerAngles

				var_62_7.z = 0
				var_62_7.x = 0
				var_62_0.localEulerAngles = var_62_7
			end

			if arg_59_1.time_ >= var_62_1 + var_62_3 and arg_59_1.time_ < var_62_1 + var_62_3 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_62_8 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_8.x, var_62_8.y, var_62_8.z)

				local var_62_9 = var_62_0.localEulerAngles

				var_62_9.z = 0
				var_62_9.x = 0
				var_62_0.localEulerAngles = var_62_9
			end

			local var_62_10 = arg_59_1.actors_["10079ui_story"]
			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect10079ui_story == nil then
				arg_59_1.var_.characterEffect10079ui_story = var_62_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_12 = 0.200000002980232

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_12 then
				local var_62_13 = (arg_59_1.time_ - var_62_11) / var_62_12

				if arg_59_1.var_.characterEffect10079ui_story then
					arg_59_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_11 + var_62_12 and arg_59_1.time_ < var_62_11 + var_62_12 + arg_62_0 and arg_59_1.var_.characterEffect10079ui_story then
				arg_59_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_62_15 = 0

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 then
				arg_59_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_16 = arg_59_1.actors_["1095ui_story"]
			local var_62_17 = 0

			if var_62_17 < arg_59_1.time_ and arg_59_1.time_ <= var_62_17 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story == nil then
				arg_59_1.var_.characterEffect1095ui_story = var_62_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_18 = 0.200000002980232

			if var_62_17 <= arg_59_1.time_ and arg_59_1.time_ < var_62_17 + var_62_18 then
				local var_62_19 = (arg_59_1.time_ - var_62_17) / var_62_18

				if arg_59_1.var_.characterEffect1095ui_story then
					local var_62_20 = Mathf.Lerp(0, 0.5, var_62_19)

					arg_59_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1095ui_story.fillRatio = var_62_20
				end
			end

			if arg_59_1.time_ >= var_62_17 + var_62_18 and arg_59_1.time_ < var_62_17 + var_62_18 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story then
				local var_62_21 = 0.5

				arg_59_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1095ui_story.fillRatio = var_62_21
			end

			local var_62_22 = 0
			local var_62_23 = 0.85

			if var_62_22 < arg_59_1.time_ and arg_59_1.time_ <= var_62_22 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_24 = arg_59_1:FormatText(StoryNameCfg[6].name)

				arg_59_1.leftNameTxt_.text = var_62_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_25 = arg_59_1:GetWordFromCfg(319361015)
				local var_62_26 = arg_59_1:FormatText(var_62_25.content)

				arg_59_1.text_.text = var_62_26

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_27 = 34
				local var_62_28 = utf8.len(var_62_26)
				local var_62_29 = var_62_27 <= 0 and var_62_23 or var_62_23 * (var_62_28 / var_62_27)

				if var_62_29 > 0 and var_62_23 < var_62_29 then
					arg_59_1.talkMaxDuration = var_62_29

					if var_62_29 + var_62_22 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_29 + var_62_22
					end
				end

				arg_59_1.text_.text = var_62_26
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361015", "story_v_out_319361.awb") ~= 0 then
					local var_62_30 = manager.audio:GetVoiceLength("story_v_out_319361", "319361015", "story_v_out_319361.awb") / 1000

					if var_62_30 + var_62_22 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_30 + var_62_22
					end

					if var_62_25.prefab_name ~= "" and arg_59_1.actors_[var_62_25.prefab_name] ~= nil then
						local var_62_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_25.prefab_name].transform, "story_v_out_319361", "319361015", "story_v_out_319361.awb")

						arg_59_1:RecordAudio("319361015", var_62_31)
						arg_59_1:RecordAudio("319361015", var_62_31)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_319361", "319361015", "story_v_out_319361.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_319361", "319361015", "story_v_out_319361.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_32 = math.max(var_62_23, arg_59_1.talkMaxDuration)

			if var_62_22 <= arg_59_1.time_ and arg_59_1.time_ < var_62_22 + var_62_32 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_22) / var_62_32

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_22 + var_62_32 and arg_59_1.time_ < var_62_22 + var_62_32 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319361016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319361016
		arg_63_1.duration_ = 10.066

		local var_63_0 = {
			zh = 8.5,
			ja = 10.066
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
				arg_63_0:Play319361017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10079ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect10079ui_story == nil then
				arg_63_1.var_.characterEffect10079ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect10079ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_63_1.var_.characterEffect10079ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect10079ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_63_1.var_.characterEffect10079ui_story.fillRatio = var_66_5
			end

			local var_66_6 = arg_63_1.actors_["1095ui_story"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story == nil then
				arg_63_1.var_.characterEffect1095ui_story = var_66_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_8 = 0.200000002980232

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / var_66_8

				if arg_63_1.var_.characterEffect1095ui_story then
					arg_63_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story then
				arg_63_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_12 = 0
			local var_66_13 = 1.075

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_14 = arg_63_1:FormatText(StoryNameCfg[471].name)

				arg_63_1.leftNameTxt_.text = var_66_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_15 = arg_63_1:GetWordFromCfg(319361016)
				local var_66_16 = arg_63_1:FormatText(var_66_15.content)

				arg_63_1.text_.text = var_66_16

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_17 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361016", "story_v_out_319361.awb") ~= 0 then
					local var_66_20 = manager.audio:GetVoiceLength("story_v_out_319361", "319361016", "story_v_out_319361.awb") / 1000

					if var_66_20 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_12
					end

					if var_66_15.prefab_name ~= "" and arg_63_1.actors_[var_66_15.prefab_name] ~= nil then
						local var_66_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_15.prefab_name].transform, "story_v_out_319361", "319361016", "story_v_out_319361.awb")

						arg_63_1:RecordAudio("319361016", var_66_21)
						arg_63_1:RecordAudio("319361016", var_66_21)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_319361", "319361016", "story_v_out_319361.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_319361", "319361016", "story_v_out_319361.awb")
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
	Play319361017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319361017
		arg_67_1.duration_ = 2.566

		local var_67_0 = {
			zh = 1.999999999999,
			ja = 2.566
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
				arg_67_0:Play319361018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10079ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect10079ui_story == nil then
				arg_67_1.var_.characterEffect10079ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect10079ui_story then
					arg_67_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect10079ui_story then
				arg_67_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["1095ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story == nil then
				arg_67_1.var_.characterEffect1095ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.200000002980232

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect1095ui_story then
					local var_70_8 = Mathf.Lerp(0, 0.5, var_70_7)

					arg_67_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1095ui_story.fillRatio = var_70_8
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story then
				local var_70_9 = 0.5

				arg_67_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1095ui_story.fillRatio = var_70_9
			end

			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 then
				arg_67_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_70_11 = 0
			local var_70_12 = 0.1

			if var_70_11 < arg_67_1.time_ and arg_67_1.time_ <= var_70_11 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_13 = arg_67_1:FormatText(StoryNameCfg[6].name)

				arg_67_1.leftNameTxt_.text = var_70_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_14 = arg_67_1:GetWordFromCfg(319361017)
				local var_70_15 = arg_67_1:FormatText(var_70_14.content)

				arg_67_1.text_.text = var_70_15

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_16 = 4
				local var_70_17 = utf8.len(var_70_15)
				local var_70_18 = var_70_16 <= 0 and var_70_12 or var_70_12 * (var_70_17 / var_70_16)

				if var_70_18 > 0 and var_70_12 < var_70_18 then
					arg_67_1.talkMaxDuration = var_70_18

					if var_70_18 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_11
					end
				end

				arg_67_1.text_.text = var_70_15
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361017", "story_v_out_319361.awb") ~= 0 then
					local var_70_19 = manager.audio:GetVoiceLength("story_v_out_319361", "319361017", "story_v_out_319361.awb") / 1000

					if var_70_19 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_11
					end

					if var_70_14.prefab_name ~= "" and arg_67_1.actors_[var_70_14.prefab_name] ~= nil then
						local var_70_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_14.prefab_name].transform, "story_v_out_319361", "319361017", "story_v_out_319361.awb")

						arg_67_1:RecordAudio("319361017", var_70_20)
						arg_67_1:RecordAudio("319361017", var_70_20)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_319361", "319361017", "story_v_out_319361.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_319361", "319361017", "story_v_out_319361.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_21 = math.max(var_70_12, arg_67_1.talkMaxDuration)

			if var_70_11 <= arg_67_1.time_ and arg_67_1.time_ < var_70_11 + var_70_21 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_11) / var_70_21

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_11 + var_70_21 and arg_67_1.time_ < var_70_11 + var_70_21 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319361018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319361018
		arg_71_1.duration_ = 7.86666666666667

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play319361019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10079ui_story"].transform
			local var_74_1 = 1.3

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos10079ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0, 100, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10079ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, 100, 0)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = 1.3

			if var_74_9 < arg_71_1.time_ and arg_71_1.time_ <= var_74_9 + arg_74_0 then
				local var_74_10 = manager.ui.mainCamera.transform.localPosition
				local var_74_11 = Vector3.New(0, 0, 10) + Vector3.New(var_74_10.x, var_74_10.y, 0)
				local var_74_12 = arg_71_1.bgs_.I11q

				var_74_12.transform.localPosition = var_74_11
				var_74_12.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_74_13 = var_74_12:GetComponent("SpriteRenderer")

				if var_74_13 and var_74_13.sprite then
					local var_74_14 = (var_74_12.transform.localPosition - var_74_10).z
					local var_74_15 = manager.ui.mainCameraCom_
					local var_74_16 = 2 * var_74_14 * Mathf.Tan(var_74_15.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_74_17 = var_74_16 * var_74_15.aspect
					local var_74_18 = var_74_13.sprite.bounds.size.x
					local var_74_19 = var_74_13.sprite.bounds.size.y
					local var_74_20 = var_74_17 / var_74_18
					local var_74_21 = var_74_16 / var_74_19
					local var_74_22 = var_74_21 < var_74_20 and var_74_20 or var_74_21

					var_74_12.transform.localScale = Vector3.New(var_74_22, var_74_22, 0)
				end

				for iter_74_0, iter_74_1 in pairs(arg_71_1.bgs_) do
					if iter_74_0 ~= "I11q" then
						iter_74_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_74_23 = 0

			if var_74_23 < arg_71_1.time_ and arg_71_1.time_ <= var_74_23 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_24 = 1.3

			if var_74_23 <= arg_71_1.time_ and arg_71_1.time_ < var_74_23 + var_74_24 then
				local var_74_25 = (arg_71_1.time_ - var_74_23) / var_74_24
				local var_74_26 = Color.New(0, 0, 0)

				var_74_26.a = Mathf.Lerp(0, 1, var_74_25)
				arg_71_1.mask_.color = var_74_26
			end

			if arg_71_1.time_ >= var_74_23 + var_74_24 and arg_71_1.time_ < var_74_23 + var_74_24 + arg_74_0 then
				local var_74_27 = Color.New(0, 0, 0)

				var_74_27.a = 1
				arg_71_1.mask_.color = var_74_27
			end

			local var_74_28 = 1.3

			if var_74_28 < arg_71_1.time_ and arg_71_1.time_ <= var_74_28 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_29 = 2

			if var_74_28 <= arg_71_1.time_ and arg_71_1.time_ < var_74_28 + var_74_29 then
				local var_74_30 = (arg_71_1.time_ - var_74_28) / var_74_29
				local var_74_31 = Color.New(0, 0, 0)

				var_74_31.a = Mathf.Lerp(1, 0, var_74_30)
				arg_71_1.mask_.color = var_74_31
			end

			if arg_71_1.time_ >= var_74_28 + var_74_29 and arg_71_1.time_ < var_74_28 + var_74_29 + arg_74_0 then
				local var_74_32 = Color.New(0, 0, 0)
				local var_74_33 = 0

				arg_71_1.mask_.enabled = false
				var_74_32.a = var_74_33
				arg_71_1.mask_.color = var_74_32
			end

			local var_74_34 = arg_71_1.actors_["1095ui_story"].transform
			local var_74_35 = 1.3

			if var_74_35 < arg_71_1.time_ and arg_71_1.time_ <= var_74_35 + arg_74_0 then
				arg_71_1.var_.moveOldPos1095ui_story = var_74_34.localPosition

				local var_74_36 = "1095ui_story"

				arg_71_1:ShowWeapon(arg_71_1.var_[var_74_36 .. "Animator"].transform, false)
			end

			local var_74_37 = 0.001

			if var_74_35 <= arg_71_1.time_ and arg_71_1.time_ < var_74_35 + var_74_37 then
				local var_74_38 = (arg_71_1.time_ - var_74_35) / var_74_37
				local var_74_39 = Vector3.New(0, 100, 0)

				var_74_34.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1095ui_story, var_74_39, var_74_38)

				local var_74_40 = manager.ui.mainCamera.transform.position - var_74_34.position

				var_74_34.forward = Vector3.New(var_74_40.x, var_74_40.y, var_74_40.z)

				local var_74_41 = var_74_34.localEulerAngles

				var_74_41.z = 0
				var_74_41.x = 0
				var_74_34.localEulerAngles = var_74_41
			end

			if arg_71_1.time_ >= var_74_35 + var_74_37 and arg_71_1.time_ < var_74_35 + var_74_37 + arg_74_0 then
				var_74_34.localPosition = Vector3.New(0, 100, 0)

				local var_74_42 = manager.ui.mainCamera.transform.position - var_74_34.position

				var_74_34.forward = Vector3.New(var_74_42.x, var_74_42.y, var_74_42.z)

				local var_74_43 = var_74_34.localEulerAngles

				var_74_43.z = 0
				var_74_43.x = 0
				var_74_34.localEulerAngles = var_74_43
			end

			if arg_71_1.frameCnt_ <= 1 then
				arg_71_1.dialog_:SetActive(false)
			end

			local var_74_44 = 2.86666666666667
			local var_74_45 = 1.45

			if var_74_44 < arg_71_1.time_ and arg_71_1.time_ <= var_74_44 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				arg_71_1.dialog_:SetActive(true)

				local var_74_46 = LeanTween.value(arg_71_1.dialog_, 0, 1, 0.3)

				var_74_46:setOnUpdate(LuaHelper.FloatAction(function(arg_75_0)
					arg_71_1.dialogCg_.alpha = arg_75_0
				end))
				var_74_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_71_1.dialog_)
					var_74_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_71_1.duration_ = arg_71_1.duration_ + 0.3

				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_47 = arg_71_1:GetWordFromCfg(319361018)
				local var_74_48 = arg_71_1:FormatText(var_74_47.content)

				arg_71_1.text_.text = var_74_48

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_49 = 58
				local var_74_50 = utf8.len(var_74_48)
				local var_74_51 = var_74_49 <= 0 and var_74_45 or var_74_45 * (var_74_50 / var_74_49)

				if var_74_51 > 0 and var_74_45 < var_74_51 then
					arg_71_1.talkMaxDuration = var_74_51
					var_74_44 = var_74_44 + 0.3

					if var_74_51 + var_74_44 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_51 + var_74_44
					end
				end

				arg_71_1.text_.text = var_74_48
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_52 = var_74_44 + 0.3
			local var_74_53 = math.max(var_74_45, arg_71_1.talkMaxDuration)

			if var_74_52 <= arg_71_1.time_ and arg_71_1.time_ < var_74_52 + var_74_53 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_52) / var_74_53

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_52 + var_74_53 and arg_71_1.time_ < var_74_52 + var_74_53 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play319361019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319361019
		arg_77_1.duration_ = 2.1

		local var_77_0 = {
			zh = 1.533,
			ja = 2.1
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
				arg_77_0:Play319361020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10079ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story == nil then
				arg_77_1.var_.characterEffect10079ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.200000002980232

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect10079ui_story then
					local var_80_4 = Mathf.Lerp(0, 0.5, var_80_3)

					arg_77_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_77_1.var_.characterEffect10079ui_story.fillRatio = var_80_4
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story then
				local var_80_5 = 0.5

				arg_77_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_77_1.var_.characterEffect10079ui_story.fillRatio = var_80_5
			end

			local var_80_6 = arg_77_1.actors_["1095ui_story"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story == nil then
				arg_77_1.var_.characterEffect1095ui_story = var_80_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_8 = 0.200000002980232

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.characterEffect1095ui_story then
					arg_77_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story then
				arg_77_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_80_10 = arg_77_1.actors_["1095ui_story"].transform
			local var_80_11 = 0

			if var_80_11 < arg_77_1.time_ and arg_77_1.time_ <= var_80_11 + arg_80_0 then
				arg_77_1.var_.moveOldPos1095ui_story = var_80_10.localPosition

				local var_80_12 = "1095ui_story"

				arg_77_1:ShowWeapon(arg_77_1.var_[var_80_12 .. "Animator"].transform, false)
			end

			local var_80_13 = 0.001

			if var_80_11 <= arg_77_1.time_ and arg_77_1.time_ < var_80_11 + var_80_13 then
				local var_80_14 = (arg_77_1.time_ - var_80_11) / var_80_13
				local var_80_15 = Vector3.New(0, -0.98, -6.1)

				var_80_10.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1095ui_story, var_80_15, var_80_14)

				local var_80_16 = manager.ui.mainCamera.transform.position - var_80_10.position

				var_80_10.forward = Vector3.New(var_80_16.x, var_80_16.y, var_80_16.z)

				local var_80_17 = var_80_10.localEulerAngles

				var_80_17.z = 0
				var_80_17.x = 0
				var_80_10.localEulerAngles = var_80_17
			end

			if arg_77_1.time_ >= var_80_11 + var_80_13 and arg_77_1.time_ < var_80_11 + var_80_13 + arg_80_0 then
				var_80_10.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_80_18 = manager.ui.mainCamera.transform.position - var_80_10.position

				var_80_10.forward = Vector3.New(var_80_18.x, var_80_18.y, var_80_18.z)

				local var_80_19 = var_80_10.localEulerAngles

				var_80_19.z = 0
				var_80_19.x = 0
				var_80_10.localEulerAngles = var_80_19
			end

			local var_80_20 = 0
			local var_80_21 = 0.175

			if var_80_20 < arg_77_1.time_ and arg_77_1.time_ <= var_80_20 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_22 = arg_77_1:FormatText(StoryNameCfg[471].name)

				arg_77_1.leftNameTxt_.text = var_80_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_23 = arg_77_1:GetWordFromCfg(319361019)
				local var_80_24 = arg_77_1:FormatText(var_80_23.content)

				arg_77_1.text_.text = var_80_24

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_25 = 7
				local var_80_26 = utf8.len(var_80_24)
				local var_80_27 = var_80_25 <= 0 and var_80_21 or var_80_21 * (var_80_26 / var_80_25)

				if var_80_27 > 0 and var_80_21 < var_80_27 then
					arg_77_1.talkMaxDuration = var_80_27

					if var_80_27 + var_80_20 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_27 + var_80_20
					end
				end

				arg_77_1.text_.text = var_80_24
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361019", "story_v_out_319361.awb") ~= 0 then
					local var_80_28 = manager.audio:GetVoiceLength("story_v_out_319361", "319361019", "story_v_out_319361.awb") / 1000

					if var_80_28 + var_80_20 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_28 + var_80_20
					end

					if var_80_23.prefab_name ~= "" and arg_77_1.actors_[var_80_23.prefab_name] ~= nil then
						local var_80_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_23.prefab_name].transform, "story_v_out_319361", "319361019", "story_v_out_319361.awb")

						arg_77_1:RecordAudio("319361019", var_80_29)
						arg_77_1:RecordAudio("319361019", var_80_29)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_319361", "319361019", "story_v_out_319361.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_319361", "319361019", "story_v_out_319361.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_30 = math.max(var_80_21, arg_77_1.talkMaxDuration)

			if var_80_20 <= arg_77_1.time_ and arg_77_1.time_ < var_80_20 + var_80_30 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_20) / var_80_30

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_20 + var_80_30 and arg_77_1.time_ < var_80_20 + var_80_30 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319361020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319361020
		arg_81_1.duration_ = 8.2

		local var_81_0 = {
			zh = 5.666,
			ja = 8.2
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
				arg_81_0:Play319361021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10079ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect10079ui_story == nil then
				arg_81_1.var_.characterEffect10079ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.200000002980232

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect10079ui_story then
					arg_81_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect10079ui_story then
				arg_81_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_84_4 = arg_81_1.actors_["1095ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect1095ui_story == nil then
				arg_81_1.var_.characterEffect1095ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.200000002980232

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect1095ui_story then
					local var_84_8 = Mathf.Lerp(0, 0.5, var_84_7)

					arg_81_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1095ui_story.fillRatio = var_84_8
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect1095ui_story then
				local var_84_9 = 0.5

				arg_81_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1095ui_story.fillRatio = var_84_9
			end

			local var_84_10 = arg_81_1.actors_["1095ui_story"].transform
			local var_84_11 = 0

			if var_84_11 < arg_81_1.time_ and arg_81_1.time_ <= var_84_11 + arg_84_0 then
				arg_81_1.var_.moveOldPos1095ui_story = var_84_10.localPosition

				local var_84_12 = "1095ui_story"

				arg_81_1:ShowWeapon(arg_81_1.var_[var_84_12 .. "Animator"].transform, false)
			end

			local var_84_13 = 0.001

			if var_84_11 <= arg_81_1.time_ and arg_81_1.time_ < var_84_11 + var_84_13 then
				local var_84_14 = (arg_81_1.time_ - var_84_11) / var_84_13
				local var_84_15 = Vector3.New(-0.7, -0.98, -6.1)

				var_84_10.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1095ui_story, var_84_15, var_84_14)

				local var_84_16 = manager.ui.mainCamera.transform.position - var_84_10.position

				var_84_10.forward = Vector3.New(var_84_16.x, var_84_16.y, var_84_16.z)

				local var_84_17 = var_84_10.localEulerAngles

				var_84_17.z = 0
				var_84_17.x = 0
				var_84_10.localEulerAngles = var_84_17
			end

			if arg_81_1.time_ >= var_84_11 + var_84_13 and arg_81_1.time_ < var_84_11 + var_84_13 + arg_84_0 then
				var_84_10.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_84_18 = manager.ui.mainCamera.transform.position - var_84_10.position

				var_84_10.forward = Vector3.New(var_84_18.x, var_84_18.y, var_84_18.z)

				local var_84_19 = var_84_10.localEulerAngles

				var_84_19.z = 0
				var_84_19.x = 0
				var_84_10.localEulerAngles = var_84_19
			end

			local var_84_20 = arg_81_1.actors_["10079ui_story"].transform
			local var_84_21 = 0

			if var_84_21 < arg_81_1.time_ and arg_81_1.time_ <= var_84_21 + arg_84_0 then
				arg_81_1.var_.moveOldPos10079ui_story = var_84_20.localPosition
			end

			local var_84_22 = 0.001

			if var_84_21 <= arg_81_1.time_ and arg_81_1.time_ < var_84_21 + var_84_22 then
				local var_84_23 = (arg_81_1.time_ - var_84_21) / var_84_22
				local var_84_24 = Vector3.New(0.7, -0.95, -6.05)

				var_84_20.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos10079ui_story, var_84_24, var_84_23)

				local var_84_25 = manager.ui.mainCamera.transform.position - var_84_20.position

				var_84_20.forward = Vector3.New(var_84_25.x, var_84_25.y, var_84_25.z)

				local var_84_26 = var_84_20.localEulerAngles

				var_84_26.z = 0
				var_84_26.x = 0
				var_84_20.localEulerAngles = var_84_26
			end

			if arg_81_1.time_ >= var_84_21 + var_84_22 and arg_81_1.time_ < var_84_21 + var_84_22 + arg_84_0 then
				var_84_20.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_84_27 = manager.ui.mainCamera.transform.position - var_84_20.position

				var_84_20.forward = Vector3.New(var_84_27.x, var_84_27.y, var_84_27.z)

				local var_84_28 = var_84_20.localEulerAngles

				var_84_28.z = 0
				var_84_28.x = 0
				var_84_20.localEulerAngles = var_84_28
			end

			local var_84_29 = 0

			if var_84_29 < arg_81_1.time_ and arg_81_1.time_ <= var_84_29 + arg_84_0 then
				arg_81_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_84_30 = 0
			local var_84_31 = 0.6

			if var_84_30 < arg_81_1.time_ and arg_81_1.time_ <= var_84_30 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_32 = arg_81_1:FormatText(StoryNameCfg[6].name)

				arg_81_1.leftNameTxt_.text = var_84_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_33 = arg_81_1:GetWordFromCfg(319361020)
				local var_84_34 = arg_81_1:FormatText(var_84_33.content)

				arg_81_1.text_.text = var_84_34

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_35 = 24
				local var_84_36 = utf8.len(var_84_34)
				local var_84_37 = var_84_35 <= 0 and var_84_31 or var_84_31 * (var_84_36 / var_84_35)

				if var_84_37 > 0 and var_84_31 < var_84_37 then
					arg_81_1.talkMaxDuration = var_84_37

					if var_84_37 + var_84_30 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_37 + var_84_30
					end
				end

				arg_81_1.text_.text = var_84_34
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361020", "story_v_out_319361.awb") ~= 0 then
					local var_84_38 = manager.audio:GetVoiceLength("story_v_out_319361", "319361020", "story_v_out_319361.awb") / 1000

					if var_84_38 + var_84_30 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_38 + var_84_30
					end

					if var_84_33.prefab_name ~= "" and arg_81_1.actors_[var_84_33.prefab_name] ~= nil then
						local var_84_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_33.prefab_name].transform, "story_v_out_319361", "319361020", "story_v_out_319361.awb")

						arg_81_1:RecordAudio("319361020", var_84_39)
						arg_81_1:RecordAudio("319361020", var_84_39)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_319361", "319361020", "story_v_out_319361.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_319361", "319361020", "story_v_out_319361.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_40 = math.max(var_84_31, arg_81_1.talkMaxDuration)

			if var_84_30 <= arg_81_1.time_ and arg_81_1.time_ < var_84_30 + var_84_40 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_30) / var_84_40

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_30 + var_84_40 and arg_81_1.time_ < var_84_30 + var_84_40 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play319361021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 319361021
		arg_85_1.duration_ = 6.633

		local var_85_0 = {
			zh = 6.633,
			ja = 6.4
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
				arg_85_0:Play319361022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10079ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect10079ui_story == nil then
				arg_85_1.var_.characterEffect10079ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.200000002980232

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect10079ui_story then
					local var_88_4 = Mathf.Lerp(0, 0.5, var_88_3)

					arg_85_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_85_1.var_.characterEffect10079ui_story.fillRatio = var_88_4
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect10079ui_story then
				local var_88_5 = 0.5

				arg_85_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_85_1.var_.characterEffect10079ui_story.fillRatio = var_88_5
			end

			local var_88_6 = arg_85_1.actors_["1095ui_story"]
			local var_88_7 = 0

			if var_88_7 < arg_85_1.time_ and arg_85_1.time_ <= var_88_7 + arg_88_0 and arg_85_1.var_.characterEffect1095ui_story == nil then
				arg_85_1.var_.characterEffect1095ui_story = var_88_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_8 = 0.200000002980232

			if var_88_7 <= arg_85_1.time_ and arg_85_1.time_ < var_88_7 + var_88_8 then
				local var_88_9 = (arg_85_1.time_ - var_88_7) / var_88_8

				if arg_85_1.var_.characterEffect1095ui_story then
					arg_85_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_7 + var_88_8 and arg_85_1.time_ < var_88_7 + var_88_8 + arg_88_0 and arg_85_1.var_.characterEffect1095ui_story then
				arg_85_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_88_10 = 0

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 then
				arg_85_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_88_11 = 0

			if var_88_11 < arg_85_1.time_ and arg_85_1.time_ <= var_88_11 + arg_88_0 then
				arg_85_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_88_12 = arg_85_1.actors_["10079ui_story"].transform
			local var_88_13 = 0

			if var_88_13 < arg_85_1.time_ and arg_85_1.time_ <= var_88_13 + arg_88_0 then
				arg_85_1.var_.moveOldPos10079ui_story = var_88_12.localPosition
			end

			local var_88_14 = 0.001

			if var_88_13 <= arg_85_1.time_ and arg_85_1.time_ < var_88_13 + var_88_14 then
				local var_88_15 = (arg_85_1.time_ - var_88_13) / var_88_14
				local var_88_16 = Vector3.New(0.7, -0.95, -6.05)

				var_88_12.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10079ui_story, var_88_16, var_88_15)

				local var_88_17 = manager.ui.mainCamera.transform.position - var_88_12.position

				var_88_12.forward = Vector3.New(var_88_17.x, var_88_17.y, var_88_17.z)

				local var_88_18 = var_88_12.localEulerAngles

				var_88_18.z = 0
				var_88_18.x = 0
				var_88_12.localEulerAngles = var_88_18
			end

			if arg_85_1.time_ >= var_88_13 + var_88_14 and arg_85_1.time_ < var_88_13 + var_88_14 + arg_88_0 then
				var_88_12.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_88_19 = manager.ui.mainCamera.transform.position - var_88_12.position

				var_88_12.forward = Vector3.New(var_88_19.x, var_88_19.y, var_88_19.z)

				local var_88_20 = var_88_12.localEulerAngles

				var_88_20.z = 0
				var_88_20.x = 0
				var_88_12.localEulerAngles = var_88_20
			end

			local var_88_21 = 0
			local var_88_22 = 0.55

			if var_88_21 < arg_85_1.time_ and arg_85_1.time_ <= var_88_21 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_23 = arg_85_1:FormatText(StoryNameCfg[471].name)

				arg_85_1.leftNameTxt_.text = var_88_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_24 = arg_85_1:GetWordFromCfg(319361021)
				local var_88_25 = arg_85_1:FormatText(var_88_24.content)

				arg_85_1.text_.text = var_88_25

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_26 = 22
				local var_88_27 = utf8.len(var_88_25)
				local var_88_28 = var_88_26 <= 0 and var_88_22 or var_88_22 * (var_88_27 / var_88_26)

				if var_88_28 > 0 and var_88_22 < var_88_28 then
					arg_85_1.talkMaxDuration = var_88_28

					if var_88_28 + var_88_21 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_28 + var_88_21
					end
				end

				arg_85_1.text_.text = var_88_25
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361021", "story_v_out_319361.awb") ~= 0 then
					local var_88_29 = manager.audio:GetVoiceLength("story_v_out_319361", "319361021", "story_v_out_319361.awb") / 1000

					if var_88_29 + var_88_21 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_29 + var_88_21
					end

					if var_88_24.prefab_name ~= "" and arg_85_1.actors_[var_88_24.prefab_name] ~= nil then
						local var_88_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_24.prefab_name].transform, "story_v_out_319361", "319361021", "story_v_out_319361.awb")

						arg_85_1:RecordAudio("319361021", var_88_30)
						arg_85_1:RecordAudio("319361021", var_88_30)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_319361", "319361021", "story_v_out_319361.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_319361", "319361021", "story_v_out_319361.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_31 = math.max(var_88_22, arg_85_1.talkMaxDuration)

			if var_88_21 <= arg_85_1.time_ and arg_85_1.time_ < var_88_21 + var_88_31 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_21) / var_88_31

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_21 + var_88_31 and arg_85_1.time_ < var_88_21 + var_88_31 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play319361022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 319361022
		arg_89_1.duration_ = 4.999999999999

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play319361023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = "STblack"

			if arg_89_1.bgs_[var_92_0] == nil then
				local var_92_1 = Object.Instantiate(arg_89_1.paintGo_)

				var_92_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_92_0)
				var_92_1.name = var_92_0
				var_92_1.transform.parent = arg_89_1.stage_.transform
				var_92_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_89_1.bgs_[var_92_0] = var_92_1
			end

			local var_92_2 = 0

			if var_92_2 < arg_89_1.time_ and arg_89_1.time_ <= var_92_2 + arg_92_0 then
				local var_92_3 = manager.ui.mainCamera.transform.localPosition
				local var_92_4 = Vector3.New(0, 0, 10) + Vector3.New(var_92_3.x, var_92_3.y, 0)
				local var_92_5 = arg_89_1.bgs_.STblack

				var_92_5.transform.localPosition = var_92_4
				var_92_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_92_6 = var_92_5:GetComponent("SpriteRenderer")

				if var_92_6 and var_92_6.sprite then
					local var_92_7 = (var_92_5.transform.localPosition - var_92_3).z
					local var_92_8 = manager.ui.mainCameraCom_
					local var_92_9 = 2 * var_92_7 * Mathf.Tan(var_92_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_92_10 = var_92_9 * var_92_8.aspect
					local var_92_11 = var_92_6.sprite.bounds.size.x
					local var_92_12 = var_92_6.sprite.bounds.size.y
					local var_92_13 = var_92_10 / var_92_11
					local var_92_14 = var_92_9 / var_92_12
					local var_92_15 = var_92_14 < var_92_13 and var_92_13 or var_92_14

					var_92_5.transform.localScale = Vector3.New(var_92_15, var_92_15, 0)
				end

				for iter_92_0, iter_92_1 in pairs(arg_89_1.bgs_) do
					if iter_92_0 ~= "STblack" then
						iter_92_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_92_16 = 0

			if var_92_16 < arg_89_1.time_ and arg_89_1.time_ <= var_92_16 + arg_92_0 then
				arg_89_1.cswbg_:SetActive(true)

				local var_92_17 = arg_89_1.cswt_:GetComponent("RectTransform")

				arg_89_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_92_17.offsetMin = Vector2.New(410, 330)
				var_92_17.offsetMax = Vector2.New(-400, -175)

				local var_92_18 = arg_89_1:GetWordFromCfg(419014)
				local var_92_19 = arg_89_1:FormatText(var_92_18.content)

				arg_89_1.cswt_.text = var_92_19

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.cswt_)

				arg_89_1.cswt_.fontSize = 180
				arg_89_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_89_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_92_20 = 0

			if var_92_20 < arg_89_1.time_ and arg_89_1.time_ <= var_92_20 + arg_92_0 then
				arg_89_1.fswbg_:SetActive(true)
				arg_89_1.dialog_:SetActive(false)

				arg_89_1.fswtw_.percent = 0

				local var_92_21 = arg_89_1:GetWordFromCfg(319361022)
				local var_92_22 = arg_89_1:FormatText(var_92_21.content)

				arg_89_1.fswt_.text = var_92_22

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.fswt_)

				arg_89_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_89_1.fswtw_:SetDirty()

				arg_89_1.typewritterCharCountI18N = 0

				SetActive(arg_89_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_89_1:ShowNextGo(false)
			end

			local var_92_23 = 0.599999999999999

			if var_92_23 < arg_89_1.time_ and arg_89_1.time_ <= var_92_23 + arg_92_0 then
				arg_89_1.var_.oldValueTypewriter = arg_89_1.fswtw_.percent

				arg_89_1:ShowNextGo(false)
			end

			local var_92_24 = 21
			local var_92_25 = 1.4
			local var_92_26 = arg_89_1:GetWordFromCfg(319361022)
			local var_92_27 = arg_89_1:FormatText(var_92_26.content)
			local var_92_28, var_92_29 = arg_89_1:GetPercentByPara(var_92_27, 1)

			if var_92_23 < arg_89_1.time_ and arg_89_1.time_ <= var_92_23 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0

				local var_92_30 = var_92_24 <= 0 and var_92_25 or var_92_25 * ((var_92_29 - arg_89_1.typewritterCharCountI18N) / var_92_24)

				if var_92_30 > 0 and var_92_25 < var_92_30 then
					arg_89_1.talkMaxDuration = var_92_30

					if var_92_30 + var_92_23 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_30 + var_92_23
					end
				end
			end

			local var_92_31 = 1.4
			local var_92_32 = math.max(var_92_31, arg_89_1.talkMaxDuration)

			if var_92_23 <= arg_89_1.time_ and arg_89_1.time_ < var_92_23 + var_92_32 then
				local var_92_33 = (arg_89_1.time_ - var_92_23) / var_92_32

				arg_89_1.fswtw_.percent = Mathf.Lerp(arg_89_1.var_.oldValueTypewriter, var_92_28, var_92_33)
				arg_89_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_89_1.fswtw_:SetDirty()
			end

			if arg_89_1.time_ >= var_92_23 + var_92_32 and arg_89_1.time_ < var_92_23 + var_92_32 + arg_92_0 then
				arg_89_1.fswtw_.percent = var_92_28

				arg_89_1.fswtw_:SetDirty()
				arg_89_1:ShowNextGo(true)

				arg_89_1.typewritterCharCountI18N = var_92_29
			end

			local var_92_34 = 0

			if var_92_34 < arg_89_1.time_ and arg_89_1.time_ <= var_92_34 + arg_92_0 then
				local var_92_35 = arg_89_1.fswbg_.transform:Find("textbox/adapt/content") or arg_89_1.fswbg_.transform:Find("textbox/content")
				local var_92_36 = var_92_35:GetComponent("Text")
				local var_92_37 = var_92_35:GetComponent("RectTransform")

				var_92_36.alignment = UnityEngine.TextAnchor.LowerCenter
				var_92_37.offsetMin = Vector2.New(0, 0)
				var_92_37.offsetMax = Vector2.New(0, 0)
			end

			local var_92_38 = arg_89_1.actors_["1095ui_story"].transform
			local var_92_39 = 0

			if var_92_39 < arg_89_1.time_ and arg_89_1.time_ <= var_92_39 + arg_92_0 then
				arg_89_1.var_.moveOldPos1095ui_story = var_92_38.localPosition
			end

			local var_92_40 = 0.001

			if var_92_39 <= arg_89_1.time_ and arg_89_1.time_ < var_92_39 + var_92_40 then
				local var_92_41 = (arg_89_1.time_ - var_92_39) / var_92_40
				local var_92_42 = Vector3.New(0, 100, 0)

				var_92_38.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1095ui_story, var_92_42, var_92_41)

				local var_92_43 = manager.ui.mainCamera.transform.position - var_92_38.position

				var_92_38.forward = Vector3.New(var_92_43.x, var_92_43.y, var_92_43.z)

				local var_92_44 = var_92_38.localEulerAngles

				var_92_44.z = 0
				var_92_44.x = 0
				var_92_38.localEulerAngles = var_92_44
			end

			if arg_89_1.time_ >= var_92_39 + var_92_40 and arg_89_1.time_ < var_92_39 + var_92_40 + arg_92_0 then
				var_92_38.localPosition = Vector3.New(0, 100, 0)

				local var_92_45 = manager.ui.mainCamera.transform.position - var_92_38.position

				var_92_38.forward = Vector3.New(var_92_45.x, var_92_45.y, var_92_45.z)

				local var_92_46 = var_92_38.localEulerAngles

				var_92_46.z = 0
				var_92_46.x = 0
				var_92_38.localEulerAngles = var_92_46
			end

			local var_92_47 = arg_89_1.actors_["10079ui_story"].transform
			local var_92_48 = 0

			if var_92_48 < arg_89_1.time_ and arg_89_1.time_ <= var_92_48 + arg_92_0 then
				arg_89_1.var_.moveOldPos10079ui_story = var_92_47.localPosition
			end

			local var_92_49 = 0.001

			if var_92_48 <= arg_89_1.time_ and arg_89_1.time_ < var_92_48 + var_92_49 then
				local var_92_50 = (arg_89_1.time_ - var_92_48) / var_92_49
				local var_92_51 = Vector3.New(0, 100, 0)

				var_92_47.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos10079ui_story, var_92_51, var_92_50)

				local var_92_52 = manager.ui.mainCamera.transform.position - var_92_47.position

				var_92_47.forward = Vector3.New(var_92_52.x, var_92_52.y, var_92_52.z)

				local var_92_53 = var_92_47.localEulerAngles

				var_92_53.z = 0
				var_92_53.x = 0
				var_92_47.localEulerAngles = var_92_53
			end

			if arg_89_1.time_ >= var_92_48 + var_92_49 and arg_89_1.time_ < var_92_48 + var_92_49 + arg_92_0 then
				var_92_47.localPosition = Vector3.New(0, 100, 0)

				local var_92_54 = manager.ui.mainCamera.transform.position - var_92_47.position

				var_92_47.forward = Vector3.New(var_92_54.x, var_92_54.y, var_92_54.z)

				local var_92_55 = var_92_47.localEulerAngles

				var_92_55.z = 0
				var_92_55.x = 0
				var_92_47.localEulerAngles = var_92_55
			end

			local var_92_56 = 0.599999999999999
			local var_92_57 = 4.4
			local var_92_58 = manager.audio:GetVoiceLength("story_v_out_319361", "319361022", "story_v_out_319361.awb") / 1000

			if var_92_58 > 0 and var_92_57 < var_92_58 and var_92_58 + var_92_56 > arg_89_1.duration_ then
				local var_92_59 = var_92_58

				arg_89_1.duration_ = var_92_58 + var_92_56
			end

			if var_92_56 < arg_89_1.time_ and arg_89_1.time_ <= var_92_56 + arg_92_0 then
				local var_92_60 = "play"
				local var_92_61 = "voice"

				arg_89_1:AudioAction(var_92_60, var_92_61, "story_v_out_319361", "319361022", "story_v_out_319361.awb")
			end
		end
	end,
	Play319361023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 319361023
		arg_93_1.duration_ = 8.899999999999

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play319361024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.fswbg_:SetActive(true)
				arg_93_1.dialog_:SetActive(false)

				arg_93_1.fswtw_.percent = 0

				local var_96_1 = arg_93_1:GetWordFromCfg(319361023)
				local var_96_2 = arg_93_1:FormatText(var_96_1.content)

				arg_93_1.fswt_.text = var_96_2

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.fswt_)

				arg_93_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_93_1.fswtw_:SetDirty()

				arg_93_1.typewritterCharCountI18N = 0

				SetActive(arg_93_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_93_1:ShowNextGo(false)
			end

			local var_96_3 = 0.1

			if var_96_3 < arg_93_1.time_ and arg_93_1.time_ <= var_96_3 + arg_96_0 then
				arg_93_1.var_.oldValueTypewriter = arg_93_1.fswtw_.percent

				arg_93_1:ShowNextGo(false)
			end

			local var_96_4 = 41
			local var_96_5 = 2.73333333333333
			local var_96_6 = arg_93_1:GetWordFromCfg(319361023)
			local var_96_7 = arg_93_1:FormatText(var_96_6.content)
			local var_96_8, var_96_9 = arg_93_1:GetPercentByPara(var_96_7, 1)

			if var_96_3 < arg_93_1.time_ and arg_93_1.time_ <= var_96_3 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0

				local var_96_10 = var_96_4 <= 0 and var_96_5 or var_96_5 * ((var_96_9 - arg_93_1.typewritterCharCountI18N) / var_96_4)

				if var_96_10 > 0 and var_96_5 < var_96_10 then
					arg_93_1.talkMaxDuration = var_96_10

					if var_96_10 + var_96_3 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_10 + var_96_3
					end
				end
			end

			local var_96_11 = 2.73333333333333
			local var_96_12 = math.max(var_96_11, arg_93_1.talkMaxDuration)

			if var_96_3 <= arg_93_1.time_ and arg_93_1.time_ < var_96_3 + var_96_12 then
				local var_96_13 = (arg_93_1.time_ - var_96_3) / var_96_12

				arg_93_1.fswtw_.percent = Mathf.Lerp(arg_93_1.var_.oldValueTypewriter, var_96_8, var_96_13)
				arg_93_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_93_1.fswtw_:SetDirty()
			end

			if arg_93_1.time_ >= var_96_3 + var_96_12 and arg_93_1.time_ < var_96_3 + var_96_12 + arg_96_0 then
				arg_93_1.fswtw_.percent = var_96_8

				arg_93_1.fswtw_:SetDirty()
				arg_93_1:ShowNextGo(true)

				arg_93_1.typewritterCharCountI18N = var_96_9
			end

			local var_96_14 = 0.1
			local var_96_15 = 8.8
			local var_96_16 = manager.audio:GetVoiceLength("story_v_out_319361", "319361023", "story_v_out_319361.awb") / 1000

			if var_96_16 > 0 and var_96_15 < var_96_16 and var_96_16 + var_96_14 > arg_93_1.duration_ then
				local var_96_17 = var_96_16

				arg_93_1.duration_ = var_96_16 + var_96_14
			end

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				local var_96_18 = "play"
				local var_96_19 = "voice"

				arg_93_1:AudioAction(var_96_18, var_96_19, "story_v_out_319361", "319361023", "story_v_out_319361.awb")
			end
		end
	end,
	Play319361024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 319361024
		arg_97_1.duration_ = 4.332999999999

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play319361025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.fswbg_:SetActive(true)
				arg_97_1.dialog_:SetActive(false)

				arg_97_1.fswtw_.percent = 0

				local var_100_1 = arg_97_1:GetWordFromCfg(319361024)
				local var_100_2 = arg_97_1:FormatText(var_100_1.content)

				arg_97_1.fswt_.text = var_100_2

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.fswt_)

				arg_97_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_97_1.fswtw_:SetDirty()

				arg_97_1.typewritterCharCountI18N = 0

				SetActive(arg_97_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_97_1:ShowNextGo(false)
			end

			local var_100_3 = 0.1

			if var_100_3 < arg_97_1.time_ and arg_97_1.time_ <= var_100_3 + arg_100_0 then
				arg_97_1.var_.oldValueTypewriter = arg_97_1.fswtw_.percent

				arg_97_1:ShowNextGo(false)
			end

			local var_100_4 = 14
			local var_100_5 = 0.933333333333333
			local var_100_6 = arg_97_1:GetWordFromCfg(319361024)
			local var_100_7 = arg_97_1:FormatText(var_100_6.content)
			local var_100_8, var_100_9 = arg_97_1:GetPercentByPara(var_100_7, 1)

			if var_100_3 < arg_97_1.time_ and arg_97_1.time_ <= var_100_3 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0

				local var_100_10 = var_100_4 <= 0 and var_100_5 or var_100_5 * ((var_100_9 - arg_97_1.typewritterCharCountI18N) / var_100_4)

				if var_100_10 > 0 and var_100_5 < var_100_10 then
					arg_97_1.talkMaxDuration = var_100_10

					if var_100_10 + var_100_3 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_10 + var_100_3
					end
				end
			end

			local var_100_11 = 0.933333333333333
			local var_100_12 = math.max(var_100_11, arg_97_1.talkMaxDuration)

			if var_100_3 <= arg_97_1.time_ and arg_97_1.time_ < var_100_3 + var_100_12 then
				local var_100_13 = (arg_97_1.time_ - var_100_3) / var_100_12

				arg_97_1.fswtw_.percent = Mathf.Lerp(arg_97_1.var_.oldValueTypewriter, var_100_8, var_100_13)
				arg_97_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_97_1.fswtw_:SetDirty()
			end

			if arg_97_1.time_ >= var_100_3 + var_100_12 and arg_97_1.time_ < var_100_3 + var_100_12 + arg_100_0 then
				arg_97_1.fswtw_.percent = var_100_8

				arg_97_1.fswtw_:SetDirty()
				arg_97_1:ShowNextGo(true)

				arg_97_1.typewritterCharCountI18N = var_100_9
			end

			local var_100_14 = 0.1
			local var_100_15 = 4.233
			local var_100_16 = manager.audio:GetVoiceLength("story_v_out_319361", "319361024", "story_v_out_319361.awb") / 1000

			if var_100_16 > 0 and var_100_15 < var_100_16 and var_100_16 + var_100_14 > arg_97_1.duration_ then
				local var_100_17 = var_100_16

				arg_97_1.duration_ = var_100_16 + var_100_14
			end

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				local var_100_18 = "play"
				local var_100_19 = "voice"

				arg_97_1:AudioAction(var_100_18, var_100_19, "story_v_out_319361", "319361024", "story_v_out_319361.awb")
			end
		end
	end,
	Play319361025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 319361025
		arg_101_1.duration_ = 6.36666666666667

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play319361026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				local var_104_1 = manager.ui.mainCamera.transform.localPosition
				local var_104_2 = Vector3.New(0, 0, 10) + Vector3.New(var_104_1.x, var_104_1.y, 0)
				local var_104_3 = arg_101_1.bgs_.I11q

				var_104_3.transform.localPosition = var_104_2
				var_104_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_104_4 = var_104_3:GetComponent("SpriteRenderer")

				if var_104_4 and var_104_4.sprite then
					local var_104_5 = (var_104_3.transform.localPosition - var_104_1).z
					local var_104_6 = manager.ui.mainCameraCom_
					local var_104_7 = 2 * var_104_5 * Mathf.Tan(var_104_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_104_8 = var_104_7 * var_104_6.aspect
					local var_104_9 = var_104_4.sprite.bounds.size.x
					local var_104_10 = var_104_4.sprite.bounds.size.y
					local var_104_11 = var_104_8 / var_104_9
					local var_104_12 = var_104_7 / var_104_10
					local var_104_13 = var_104_12 < var_104_11 and var_104_11 or var_104_12

					var_104_3.transform.localScale = Vector3.New(var_104_13, var_104_13, 0)
				end

				for iter_104_0, iter_104_1 in pairs(arg_101_1.bgs_) do
					if iter_104_0 ~= "I11q" then
						iter_104_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_104_14 = 0

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1.mask_.enabled = true
				arg_101_1.mask_.raycastTarget = true

				arg_101_1:SetGaussion(false)
			end

			local var_104_15 = 2

			if var_104_14 <= arg_101_1.time_ and arg_101_1.time_ < var_104_14 + var_104_15 then
				local var_104_16 = (arg_101_1.time_ - var_104_14) / var_104_15
				local var_104_17 = Color.New(0, 0, 0)

				var_104_17.a = Mathf.Lerp(1, 0, var_104_16)
				arg_101_1.mask_.color = var_104_17
			end

			if arg_101_1.time_ >= var_104_14 + var_104_15 and arg_101_1.time_ < var_104_14 + var_104_15 + arg_104_0 then
				local var_104_18 = Color.New(0, 0, 0)
				local var_104_19 = 0

				arg_101_1.mask_.enabled = false
				var_104_18.a = var_104_19
				arg_101_1.mask_.color = var_104_18
			end

			local var_104_20 = 0

			if var_104_20 < arg_101_1.time_ and arg_101_1.time_ <= var_104_20 + arg_104_0 then
				arg_101_1.fswbg_:SetActive(false)
				arg_101_1.dialog_:SetActive(false)
				arg_101_1:ShowNextGo(false)
			end

			local var_104_21 = 0.533333333333334

			if var_104_21 < arg_101_1.time_ and arg_101_1.time_ <= var_104_21 + arg_104_0 then
				arg_101_1.fswbg_:SetActive(false)
				arg_101_1.dialog_:SetActive(false)
				arg_101_1:ShowNextGo(false)
			end

			local var_104_22 = 0

			if var_104_22 < arg_101_1.time_ and arg_101_1.time_ <= var_104_22 + arg_104_0 then
				arg_101_1.cswbg_:SetActive(false)
			end

			if arg_101_1.frameCnt_ <= 1 then
				arg_101_1.dialog_:SetActive(false)
			end

			local var_104_23 = 1.36666666666667
			local var_104_24 = 1.075

			if var_104_23 < arg_101_1.time_ and arg_101_1.time_ <= var_104_23 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0

				arg_101_1.dialog_:SetActive(true)

				local var_104_25 = LeanTween.value(arg_101_1.dialog_, 0, 1, 0.3)

				var_104_25:setOnUpdate(LuaHelper.FloatAction(function(arg_105_0)
					arg_101_1.dialogCg_.alpha = arg_105_0
				end))
				var_104_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_101_1.dialog_)
					var_104_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_101_1.duration_ = arg_101_1.duration_ + 0.3

				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_26 = arg_101_1:GetWordFromCfg(319361025)
				local var_104_27 = arg_101_1:FormatText(var_104_26.content)

				arg_101_1.text_.text = var_104_27

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_28 = 43
				local var_104_29 = utf8.len(var_104_27)
				local var_104_30 = var_104_28 <= 0 and var_104_24 or var_104_24 * (var_104_29 / var_104_28)

				if var_104_30 > 0 and var_104_24 < var_104_30 then
					arg_101_1.talkMaxDuration = var_104_30
					var_104_23 = var_104_23 + 0.3

					if var_104_30 + var_104_23 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_30 + var_104_23
					end
				end

				arg_101_1.text_.text = var_104_27
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_31 = var_104_23 + 0.3
			local var_104_32 = math.max(var_104_24, arg_101_1.talkMaxDuration)

			if var_104_31 <= arg_101_1.time_ and arg_101_1.time_ < var_104_31 + var_104_32 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_31) / var_104_32

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_31 + var_104_32 and arg_101_1.time_ < var_104_31 + var_104_32 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play319361026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319361026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play319361027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.725

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_2 = arg_107_1:GetWordFromCfg(319361026)
				local var_110_3 = arg_107_1:FormatText(var_110_2.content)

				arg_107_1.text_.text = var_110_3

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_4 = 29
				local var_110_5 = utf8.len(var_110_3)
				local var_110_6 = var_110_4 <= 0 and var_110_1 or var_110_1 * (var_110_5 / var_110_4)

				if var_110_6 > 0 and var_110_1 < var_110_6 then
					arg_107_1.talkMaxDuration = var_110_6

					if var_110_6 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_6 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_3
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_7 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_7 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_7

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_7 and arg_107_1.time_ < var_110_0 + var_110_7 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play319361027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 319361027
		arg_111_1.duration_ = 13.2

		local var_111_0 = {
			zh = 13.2,
			ja = 9.066
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
				arg_111_0:Play319361028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10079ui_story"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos10079ui_story = var_114_0.localPosition

				local var_114_2 = "10079ui_story"

				arg_111_1:ShowWeapon(arg_111_1.var_[var_114_2 .. "Animator"].transform, false)
			end

			local var_114_3 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_3 then
				local var_114_4 = (arg_111_1.time_ - var_114_1) / var_114_3
				local var_114_5 = Vector3.New(0, -0.95, -6.05)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos10079ui_story, var_114_5, var_114_4)

				local var_114_6 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_6.x, var_114_6.y, var_114_6.z)

				local var_114_7 = var_114_0.localEulerAngles

				var_114_7.z = 0
				var_114_7.x = 0
				var_114_0.localEulerAngles = var_114_7
			end

			if arg_111_1.time_ >= var_114_1 + var_114_3 and arg_111_1.time_ < var_114_1 + var_114_3 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_114_8 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_8.x, var_114_8.y, var_114_8.z)

				local var_114_9 = var_114_0.localEulerAngles

				var_114_9.z = 0
				var_114_9.x = 0
				var_114_0.localEulerAngles = var_114_9
			end

			local var_114_10 = arg_111_1.actors_["10079ui_story"]
			local var_114_11 = 0

			if var_114_11 < arg_111_1.time_ and arg_111_1.time_ <= var_114_11 + arg_114_0 and arg_111_1.var_.characterEffect10079ui_story == nil then
				arg_111_1.var_.characterEffect10079ui_story = var_114_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_12 = 0.200000002980232

			if var_114_11 <= arg_111_1.time_ and arg_111_1.time_ < var_114_11 + var_114_12 then
				local var_114_13 = (arg_111_1.time_ - var_114_11) / var_114_12

				if arg_111_1.var_.characterEffect10079ui_story then
					arg_111_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_11 + var_114_12 and arg_111_1.time_ < var_114_11 + var_114_12 + arg_114_0 and arg_111_1.var_.characterEffect10079ui_story then
				arg_111_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 then
				arg_111_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_114_15 = 0

			if var_114_15 < arg_111_1.time_ and arg_111_1.time_ <= var_114_15 + arg_114_0 then
				arg_111_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_114_16 = 0
			local var_114_17 = 1.25

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_18 = arg_111_1:FormatText(StoryNameCfg[6].name)

				arg_111_1.leftNameTxt_.text = var_114_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_19 = arg_111_1:GetWordFromCfg(319361027)
				local var_114_20 = arg_111_1:FormatText(var_114_19.content)

				arg_111_1.text_.text = var_114_20

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_21 = 50
				local var_114_22 = utf8.len(var_114_20)
				local var_114_23 = var_114_21 <= 0 and var_114_17 or var_114_17 * (var_114_22 / var_114_21)

				if var_114_23 > 0 and var_114_17 < var_114_23 then
					arg_111_1.talkMaxDuration = var_114_23

					if var_114_23 + var_114_16 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_23 + var_114_16
					end
				end

				arg_111_1.text_.text = var_114_20
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361027", "story_v_out_319361.awb") ~= 0 then
					local var_114_24 = manager.audio:GetVoiceLength("story_v_out_319361", "319361027", "story_v_out_319361.awb") / 1000

					if var_114_24 + var_114_16 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_24 + var_114_16
					end

					if var_114_19.prefab_name ~= "" and arg_111_1.actors_[var_114_19.prefab_name] ~= nil then
						local var_114_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_19.prefab_name].transform, "story_v_out_319361", "319361027", "story_v_out_319361.awb")

						arg_111_1:RecordAudio("319361027", var_114_25)
						arg_111_1:RecordAudio("319361027", var_114_25)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_319361", "319361027", "story_v_out_319361.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_319361", "319361027", "story_v_out_319361.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_26 = math.max(var_114_17, arg_111_1.talkMaxDuration)

			if var_114_16 <= arg_111_1.time_ and arg_111_1.time_ < var_114_16 + var_114_26 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_16) / var_114_26

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_16 + var_114_26 and arg_111_1.time_ < var_114_16 + var_114_26 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play319361028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 319361028
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play319361029(arg_115_1)
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
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_115_1.var_.characterEffect10079ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect10079ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_115_1.var_.characterEffect10079ui_story.fillRatio = var_118_5
			end

			local var_118_6 = 0

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 then
				arg_115_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_118_7 = 0

			if var_118_7 < arg_115_1.time_ and arg_115_1.time_ <= var_118_7 + arg_118_0 then
				arg_115_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_2")
			end

			local var_118_8 = 0
			local var_118_9 = 1.35

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_10 = arg_115_1:GetWordFromCfg(319361028)
				local var_118_11 = arg_115_1:FormatText(var_118_10.content)

				arg_115_1.text_.text = var_118_11

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_12 = 54
				local var_118_13 = utf8.len(var_118_11)
				local var_118_14 = var_118_12 <= 0 and var_118_9 or var_118_9 * (var_118_13 / var_118_12)

				if var_118_14 > 0 and var_118_9 < var_118_14 then
					arg_115_1.talkMaxDuration = var_118_14

					if var_118_14 + var_118_8 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_14 + var_118_8
					end
				end

				arg_115_1.text_.text = var_118_11
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_15 = math.max(var_118_9, arg_115_1.talkMaxDuration)

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_15 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_8) / var_118_15

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_8 + var_118_15 and arg_115_1.time_ < var_118_8 + var_118_15 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play319361029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319361029
		arg_119_1.duration_ = 3.8

		local var_119_0 = {
			zh = 3.8,
			ja = 3.2
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
				arg_119_0:Play319361030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1095ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1095ui_story == nil then
				arg_119_1.var_.characterEffect1095ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.200000002980232

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1095ui_story then
					arg_119_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1095ui_story then
				arg_119_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_122_4 = arg_119_1.actors_["1095ui_story"].transform
			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 then
				arg_119_1.var_.moveOldPos1095ui_story = var_122_4.localPosition
			end

			local var_122_6 = 0.001

			if var_122_5 <= arg_119_1.time_ and arg_119_1.time_ < var_122_5 + var_122_6 then
				local var_122_7 = (arg_119_1.time_ - var_122_5) / var_122_6
				local var_122_8 = Vector3.New(-0.7, -0.98, -6.1)

				var_122_4.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1095ui_story, var_122_8, var_122_7)

				local var_122_9 = manager.ui.mainCamera.transform.position - var_122_4.position

				var_122_4.forward = Vector3.New(var_122_9.x, var_122_9.y, var_122_9.z)

				local var_122_10 = var_122_4.localEulerAngles

				var_122_10.z = 0
				var_122_10.x = 0
				var_122_4.localEulerAngles = var_122_10
			end

			if arg_119_1.time_ >= var_122_5 + var_122_6 and arg_119_1.time_ < var_122_5 + var_122_6 + arg_122_0 then
				var_122_4.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_122_11 = manager.ui.mainCamera.transform.position - var_122_4.position

				var_122_4.forward = Vector3.New(var_122_11.x, var_122_11.y, var_122_11.z)

				local var_122_12 = var_122_4.localEulerAngles

				var_122_12.z = 0
				var_122_12.x = 0
				var_122_4.localEulerAngles = var_122_12
			end

			local var_122_13 = arg_119_1.actors_["10079ui_story"].transform
			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				arg_119_1.var_.moveOldPos10079ui_story = var_122_13.localPosition

				local var_122_15 = "10079ui_story"

				arg_119_1:ShowWeapon(arg_119_1.var_[var_122_15 .. "Animator"].transform, false)
			end

			local var_122_16 = 0.001

			if var_122_14 <= arg_119_1.time_ and arg_119_1.time_ < var_122_14 + var_122_16 then
				local var_122_17 = (arg_119_1.time_ - var_122_14) / var_122_16
				local var_122_18 = Vector3.New(0.7, -0.95, -6.05)

				var_122_13.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10079ui_story, var_122_18, var_122_17)

				local var_122_19 = manager.ui.mainCamera.transform.position - var_122_13.position

				var_122_13.forward = Vector3.New(var_122_19.x, var_122_19.y, var_122_19.z)

				local var_122_20 = var_122_13.localEulerAngles

				var_122_20.z = 0
				var_122_20.x = 0
				var_122_13.localEulerAngles = var_122_20
			end

			if arg_119_1.time_ >= var_122_14 + var_122_16 and arg_119_1.time_ < var_122_14 + var_122_16 + arg_122_0 then
				var_122_13.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_122_21 = manager.ui.mainCamera.transform.position - var_122_13.position

				var_122_13.forward = Vector3.New(var_122_21.x, var_122_21.y, var_122_21.z)

				local var_122_22 = var_122_13.localEulerAngles

				var_122_22.z = 0
				var_122_22.x = 0
				var_122_13.localEulerAngles = var_122_22
			end

			local var_122_23 = arg_119_1.actors_["10079ui_story"]
			local var_122_24 = 0

			if var_122_24 < arg_119_1.time_ and arg_119_1.time_ <= var_122_24 + arg_122_0 and arg_119_1.var_.characterEffect10079ui_story == nil then
				arg_119_1.var_.characterEffect10079ui_story = var_122_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_25 = 0.200000002980232

			if var_122_24 <= arg_119_1.time_ and arg_119_1.time_ < var_122_24 + var_122_25 then
				local var_122_26 = (arg_119_1.time_ - var_122_24) / var_122_25

				if arg_119_1.var_.characterEffect10079ui_story then
					local var_122_27 = Mathf.Lerp(0, 0.5, var_122_26)

					arg_119_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_119_1.var_.characterEffect10079ui_story.fillRatio = var_122_27
				end
			end

			if arg_119_1.time_ >= var_122_24 + var_122_25 and arg_119_1.time_ < var_122_24 + var_122_25 + arg_122_0 and arg_119_1.var_.characterEffect10079ui_story then
				local var_122_28 = 0.5

				arg_119_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_119_1.var_.characterEffect10079ui_story.fillRatio = var_122_28
			end

			local var_122_29 = 0
			local var_122_30 = 0.5

			if var_122_29 < arg_119_1.time_ and arg_119_1.time_ <= var_122_29 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_31 = arg_119_1:FormatText(StoryNameCfg[471].name)

				arg_119_1.leftNameTxt_.text = var_122_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_32 = arg_119_1:GetWordFromCfg(319361029)
				local var_122_33 = arg_119_1:FormatText(var_122_32.content)

				arg_119_1.text_.text = var_122_33

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_34 = 20
				local var_122_35 = utf8.len(var_122_33)
				local var_122_36 = var_122_34 <= 0 and var_122_30 or var_122_30 * (var_122_35 / var_122_34)

				if var_122_36 > 0 and var_122_30 < var_122_36 then
					arg_119_1.talkMaxDuration = var_122_36

					if var_122_36 + var_122_29 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_36 + var_122_29
					end
				end

				arg_119_1.text_.text = var_122_33
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361029", "story_v_out_319361.awb") ~= 0 then
					local var_122_37 = manager.audio:GetVoiceLength("story_v_out_319361", "319361029", "story_v_out_319361.awb") / 1000

					if var_122_37 + var_122_29 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_37 + var_122_29
					end

					if var_122_32.prefab_name ~= "" and arg_119_1.actors_[var_122_32.prefab_name] ~= nil then
						local var_122_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_32.prefab_name].transform, "story_v_out_319361", "319361029", "story_v_out_319361.awb")

						arg_119_1:RecordAudio("319361029", var_122_38)
						arg_119_1:RecordAudio("319361029", var_122_38)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_319361", "319361029", "story_v_out_319361.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_319361", "319361029", "story_v_out_319361.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_39 = math.max(var_122_30, arg_119_1.talkMaxDuration)

			if var_122_29 <= arg_119_1.time_ and arg_119_1.time_ < var_122_29 + var_122_39 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_29) / var_122_39

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_29 + var_122_39 and arg_119_1.time_ < var_122_29 + var_122_39 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play319361030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319361030
		arg_123_1.duration_ = 4.9

		local var_123_0 = {
			zh = 2.833,
			ja = 4.9
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
				arg_123_0:Play319361031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10079ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect10079ui_story == nil then
				arg_123_1.var_.characterEffect10079ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.200000002980232

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect10079ui_story then
					arg_123_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect10079ui_story then
				arg_123_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_126_4 = arg_123_1.actors_["1095ui_story"]
			local var_126_5 = 0

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 and arg_123_1.var_.characterEffect1095ui_story == nil then
				arg_123_1.var_.characterEffect1095ui_story = var_126_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_6 = 0.200000002980232

			if var_126_5 <= arg_123_1.time_ and arg_123_1.time_ < var_126_5 + var_126_6 then
				local var_126_7 = (arg_123_1.time_ - var_126_5) / var_126_6

				if arg_123_1.var_.characterEffect1095ui_story then
					local var_126_8 = Mathf.Lerp(0, 0.5, var_126_7)

					arg_123_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1095ui_story.fillRatio = var_126_8
				end
			end

			if arg_123_1.time_ >= var_126_5 + var_126_6 and arg_123_1.time_ < var_126_5 + var_126_6 + arg_126_0 and arg_123_1.var_.characterEffect1095ui_story then
				local var_126_9 = 0.5

				arg_123_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1095ui_story.fillRatio = var_126_9
			end

			local var_126_10 = 0
			local var_126_11 = 0.25

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_12 = arg_123_1:FormatText(StoryNameCfg[6].name)

				arg_123_1.leftNameTxt_.text = var_126_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_13 = arg_123_1:GetWordFromCfg(319361030)
				local var_126_14 = arg_123_1:FormatText(var_126_13.content)

				arg_123_1.text_.text = var_126_14

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_15 = 10
				local var_126_16 = utf8.len(var_126_14)
				local var_126_17 = var_126_15 <= 0 and var_126_11 or var_126_11 * (var_126_16 / var_126_15)

				if var_126_17 > 0 and var_126_11 < var_126_17 then
					arg_123_1.talkMaxDuration = var_126_17

					if var_126_17 + var_126_10 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_17 + var_126_10
					end
				end

				arg_123_1.text_.text = var_126_14
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361030", "story_v_out_319361.awb") ~= 0 then
					local var_126_18 = manager.audio:GetVoiceLength("story_v_out_319361", "319361030", "story_v_out_319361.awb") / 1000

					if var_126_18 + var_126_10 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_18 + var_126_10
					end

					if var_126_13.prefab_name ~= "" and arg_123_1.actors_[var_126_13.prefab_name] ~= nil then
						local var_126_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_13.prefab_name].transform, "story_v_out_319361", "319361030", "story_v_out_319361.awb")

						arg_123_1:RecordAudio("319361030", var_126_19)
						arg_123_1:RecordAudio("319361030", var_126_19)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_319361", "319361030", "story_v_out_319361.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_319361", "319361030", "story_v_out_319361.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_20 = math.max(var_126_11, arg_123_1.talkMaxDuration)

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_20 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_10) / var_126_20

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_10 + var_126_20 and arg_123_1.time_ < var_126_10 + var_126_20 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play319361031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 319361031
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play319361032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10079ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect10079ui_story == nil then
				arg_127_1.var_.characterEffect10079ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect10079ui_story then
					local var_130_4 = Mathf.Lerp(0, 0.5, var_130_3)

					arg_127_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_127_1.var_.characterEffect10079ui_story.fillRatio = var_130_4
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect10079ui_story then
				local var_130_5 = 0.5

				arg_127_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_127_1.var_.characterEffect10079ui_story.fillRatio = var_130_5
			end

			local var_130_6 = 0
			local var_130_7 = 0.95

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_8 = arg_127_1:GetWordFromCfg(319361031)
				local var_130_9 = arg_127_1:FormatText(var_130_8.content)

				arg_127_1.text_.text = var_130_9

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_10 = 38
				local var_130_11 = utf8.len(var_130_9)
				local var_130_12 = var_130_10 <= 0 and var_130_7 or var_130_7 * (var_130_11 / var_130_10)

				if var_130_12 > 0 and var_130_7 < var_130_12 then
					arg_127_1.talkMaxDuration = var_130_12

					if var_130_12 + var_130_6 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_12 + var_130_6
					end
				end

				arg_127_1.text_.text = var_130_9
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_13 = math.max(var_130_7, arg_127_1.talkMaxDuration)

			if var_130_6 <= arg_127_1.time_ and arg_127_1.time_ < var_130_6 + var_130_13 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_6) / var_130_13

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_6 + var_130_13 and arg_127_1.time_ < var_130_6 + var_130_13 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play319361032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 319361032
		arg_131_1.duration_ = 9.9

		local var_131_0 = {
			zh = 9.9,
			ja = 9.6
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
				arg_131_0:Play319361033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10079ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10079ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0.7, -0.95, -6.05)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10079ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["10079ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect10079ui_story == nil then
				arg_131_1.var_.characterEffect10079ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.200000002980232

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect10079ui_story then
					arg_131_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect10079ui_story then
				arg_131_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_134_14 = 0
			local var_134_15 = 1.125

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_16 = arg_131_1:FormatText(StoryNameCfg[6].name)

				arg_131_1.leftNameTxt_.text = var_134_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_17 = arg_131_1:GetWordFromCfg(319361032)
				local var_134_18 = arg_131_1:FormatText(var_134_17.content)

				arg_131_1.text_.text = var_134_18

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_19 = 45
				local var_134_20 = utf8.len(var_134_18)
				local var_134_21 = var_134_19 <= 0 and var_134_15 or var_134_15 * (var_134_20 / var_134_19)

				if var_134_21 > 0 and var_134_15 < var_134_21 then
					arg_131_1.talkMaxDuration = var_134_21

					if var_134_21 + var_134_14 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_21 + var_134_14
					end
				end

				arg_131_1.text_.text = var_134_18
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361032", "story_v_out_319361.awb") ~= 0 then
					local var_134_22 = manager.audio:GetVoiceLength("story_v_out_319361", "319361032", "story_v_out_319361.awb") / 1000

					if var_134_22 + var_134_14 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_22 + var_134_14
					end

					if var_134_17.prefab_name ~= "" and arg_131_1.actors_[var_134_17.prefab_name] ~= nil then
						local var_134_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_17.prefab_name].transform, "story_v_out_319361", "319361032", "story_v_out_319361.awb")

						arg_131_1:RecordAudio("319361032", var_134_23)
						arg_131_1:RecordAudio("319361032", var_134_23)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_319361", "319361032", "story_v_out_319361.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_319361", "319361032", "story_v_out_319361.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_24 = math.max(var_134_15, arg_131_1.talkMaxDuration)

			if var_134_14 <= arg_131_1.time_ and arg_131_1.time_ < var_134_14 + var_134_24 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_14) / var_134_24

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_14 + var_134_24 and arg_131_1.time_ < var_134_14 + var_134_24 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play319361033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 319361033
		arg_135_1.duration_ = 8.6

		local var_135_0 = {
			zh = 6.466,
			ja = 8.6
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
				arg_135_0:Play319361034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10079ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect10079ui_story == nil then
				arg_135_1.var_.characterEffect10079ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.200000002980232

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect10079ui_story then
					local var_138_4 = Mathf.Lerp(0, 0.5, var_138_3)

					arg_135_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_135_1.var_.characterEffect10079ui_story.fillRatio = var_138_4
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect10079ui_story then
				local var_138_5 = 0.5

				arg_135_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_135_1.var_.characterEffect10079ui_story.fillRatio = var_138_5
			end

			local var_138_6 = arg_135_1.actors_["1095ui_story"]
			local var_138_7 = 0

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story == nil then
				arg_135_1.var_.characterEffect1095ui_story = var_138_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_8 = 0.200000002980232

			if var_138_7 <= arg_135_1.time_ and arg_135_1.time_ < var_138_7 + var_138_8 then
				local var_138_9 = (arg_135_1.time_ - var_138_7) / var_138_8

				if arg_135_1.var_.characterEffect1095ui_story then
					arg_135_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_7 + var_138_8 and arg_135_1.time_ < var_138_7 + var_138_8 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story then
				arg_135_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 then
				arg_135_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_138_11 = 0

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_138_12 = 0
			local var_138_13 = 0.675

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_14 = arg_135_1:FormatText(StoryNameCfg[471].name)

				arg_135_1.leftNameTxt_.text = var_138_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_15 = arg_135_1:GetWordFromCfg(319361033)
				local var_138_16 = arg_135_1:FormatText(var_138_15.content)

				arg_135_1.text_.text = var_138_16

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_17 = 27
				local var_138_18 = utf8.len(var_138_16)
				local var_138_19 = var_138_17 <= 0 and var_138_13 or var_138_13 * (var_138_18 / var_138_17)

				if var_138_19 > 0 and var_138_13 < var_138_19 then
					arg_135_1.talkMaxDuration = var_138_19

					if var_138_19 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_19 + var_138_12
					end
				end

				arg_135_1.text_.text = var_138_16
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361033", "story_v_out_319361.awb") ~= 0 then
					local var_138_20 = manager.audio:GetVoiceLength("story_v_out_319361", "319361033", "story_v_out_319361.awb") / 1000

					if var_138_20 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_12
					end

					if var_138_15.prefab_name ~= "" and arg_135_1.actors_[var_138_15.prefab_name] ~= nil then
						local var_138_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_15.prefab_name].transform, "story_v_out_319361", "319361033", "story_v_out_319361.awb")

						arg_135_1:RecordAudio("319361033", var_138_21)
						arg_135_1:RecordAudio("319361033", var_138_21)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_319361", "319361033", "story_v_out_319361.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_319361", "319361033", "story_v_out_319361.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_22 = math.max(var_138_13, arg_135_1.talkMaxDuration)

			if var_138_12 <= arg_135_1.time_ and arg_135_1.time_ < var_138_12 + var_138_22 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_12) / var_138_22

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_12 + var_138_22 and arg_135_1.time_ < var_138_12 + var_138_22 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play319361034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 319361034
		arg_139_1.duration_ = 5.1

		local var_139_0 = {
			zh = 4.366,
			ja = 5.1
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
				arg_139_0:Play319361035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10079ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect10079ui_story == nil then
				arg_139_1.var_.characterEffect10079ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.200000002980232

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect10079ui_story then
					arg_139_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect10079ui_story then
				arg_139_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_142_4 = arg_139_1.actors_["1095ui_story"]
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 and arg_139_1.var_.characterEffect1095ui_story == nil then
				arg_139_1.var_.characterEffect1095ui_story = var_142_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_6 = 0.200000002980232

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6

				if arg_139_1.var_.characterEffect1095ui_story then
					local var_142_8 = Mathf.Lerp(0, 0.5, var_142_7)

					arg_139_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1095ui_story.fillRatio = var_142_8
				end
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 and arg_139_1.var_.characterEffect1095ui_story then
				local var_142_9 = 0.5

				arg_139_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1095ui_story.fillRatio = var_142_9
			end

			local var_142_10 = 0
			local var_142_11 = 0.55

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_12 = arg_139_1:FormatText(StoryNameCfg[6].name)

				arg_139_1.leftNameTxt_.text = var_142_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_13 = arg_139_1:GetWordFromCfg(319361034)
				local var_142_14 = arg_139_1:FormatText(var_142_13.content)

				arg_139_1.text_.text = var_142_14

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_15 = 22
				local var_142_16 = utf8.len(var_142_14)
				local var_142_17 = var_142_15 <= 0 and var_142_11 or var_142_11 * (var_142_16 / var_142_15)

				if var_142_17 > 0 and var_142_11 < var_142_17 then
					arg_139_1.talkMaxDuration = var_142_17

					if var_142_17 + var_142_10 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_17 + var_142_10
					end
				end

				arg_139_1.text_.text = var_142_14
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361034", "story_v_out_319361.awb") ~= 0 then
					local var_142_18 = manager.audio:GetVoiceLength("story_v_out_319361", "319361034", "story_v_out_319361.awb") / 1000

					if var_142_18 + var_142_10 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_18 + var_142_10
					end

					if var_142_13.prefab_name ~= "" and arg_139_1.actors_[var_142_13.prefab_name] ~= nil then
						local var_142_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_13.prefab_name].transform, "story_v_out_319361", "319361034", "story_v_out_319361.awb")

						arg_139_1:RecordAudio("319361034", var_142_19)
						arg_139_1:RecordAudio("319361034", var_142_19)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_319361", "319361034", "story_v_out_319361.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_319361", "319361034", "story_v_out_319361.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_20 = math.max(var_142_11, arg_139_1.talkMaxDuration)

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_20 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_10) / var_142_20

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_10 + var_142_20 and arg_139_1.time_ < var_142_10 + var_142_20 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play319361035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 319361035
		arg_143_1.duration_ = 5.1

		local var_143_0 = {
			zh = 3.233,
			ja = 5.1
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
				arg_143_0:Play319361036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10079ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect10079ui_story == nil then
				arg_143_1.var_.characterEffect10079ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect10079ui_story then
					local var_146_4 = Mathf.Lerp(0, 0.5, var_146_3)

					arg_143_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_143_1.var_.characterEffect10079ui_story.fillRatio = var_146_4
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect10079ui_story then
				local var_146_5 = 0.5

				arg_143_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_143_1.var_.characterEffect10079ui_story.fillRatio = var_146_5
			end

			local var_146_6 = arg_143_1.actors_["1095ui_story"]
			local var_146_7 = 0

			if var_146_7 < arg_143_1.time_ and arg_143_1.time_ <= var_146_7 + arg_146_0 and arg_143_1.var_.characterEffect1095ui_story == nil then
				arg_143_1.var_.characterEffect1095ui_story = var_146_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_8 = 0.200000002980232

			if var_146_7 <= arg_143_1.time_ and arg_143_1.time_ < var_146_7 + var_146_8 then
				local var_146_9 = (arg_143_1.time_ - var_146_7) / var_146_8

				if arg_143_1.var_.characterEffect1095ui_story then
					arg_143_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_7 + var_146_8 and arg_143_1.time_ < var_146_7 + var_146_8 + arg_146_0 and arg_143_1.var_.characterEffect1095ui_story then
				arg_143_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_146_11 = 0

			if var_146_11 < arg_143_1.time_ and arg_143_1.time_ <= var_146_11 + arg_146_0 then
				arg_143_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_146_12 = 0
			local var_146_13 = 0.275

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_14 = arg_143_1:FormatText(StoryNameCfg[471].name)

				arg_143_1.leftNameTxt_.text = var_146_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_15 = arg_143_1:GetWordFromCfg(319361035)
				local var_146_16 = arg_143_1:FormatText(var_146_15.content)

				arg_143_1.text_.text = var_146_16

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_17 = 11
				local var_146_18 = utf8.len(var_146_16)
				local var_146_19 = var_146_17 <= 0 and var_146_13 or var_146_13 * (var_146_18 / var_146_17)

				if var_146_19 > 0 and var_146_13 < var_146_19 then
					arg_143_1.talkMaxDuration = var_146_19

					if var_146_19 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_19 + var_146_12
					end
				end

				arg_143_1.text_.text = var_146_16
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361035", "story_v_out_319361.awb") ~= 0 then
					local var_146_20 = manager.audio:GetVoiceLength("story_v_out_319361", "319361035", "story_v_out_319361.awb") / 1000

					if var_146_20 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_12
					end

					if var_146_15.prefab_name ~= "" and arg_143_1.actors_[var_146_15.prefab_name] ~= nil then
						local var_146_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_15.prefab_name].transform, "story_v_out_319361", "319361035", "story_v_out_319361.awb")

						arg_143_1:RecordAudio("319361035", var_146_21)
						arg_143_1:RecordAudio("319361035", var_146_21)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_319361", "319361035", "story_v_out_319361.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_319361", "319361035", "story_v_out_319361.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_22 = math.max(var_146_13, arg_143_1.talkMaxDuration)

			if var_146_12 <= arg_143_1.time_ and arg_143_1.time_ < var_146_12 + var_146_22 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_12) / var_146_22

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_12 + var_146_22 and arg_143_1.time_ < var_146_12 + var_146_22 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play319361036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 319361036
		arg_147_1.duration_ = 9.3

		local var_147_0 = {
			zh = 6,
			ja = 9.3
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
				arg_147_0:Play319361037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10079ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos10079ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(0.7, -0.95, -6.05)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10079ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = arg_147_1.actors_["10079ui_story"]
			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 and arg_147_1.var_.characterEffect10079ui_story == nil then
				arg_147_1.var_.characterEffect10079ui_story = var_150_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_11 = 0.200000002980232

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_11 then
				local var_150_12 = (arg_147_1.time_ - var_150_10) / var_150_11

				if arg_147_1.var_.characterEffect10079ui_story then
					arg_147_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_10 + var_150_11 and arg_147_1.time_ < var_150_10 + var_150_11 + arg_150_0 and arg_147_1.var_.characterEffect10079ui_story then
				arg_147_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_150_13 = 0

			if var_150_13 < arg_147_1.time_ and arg_147_1.time_ <= var_150_13 + arg_150_0 then
				arg_147_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_150_15 = arg_147_1.actors_["1095ui_story"]
			local var_150_16 = 0

			if var_150_16 < arg_147_1.time_ and arg_147_1.time_ <= var_150_16 + arg_150_0 and arg_147_1.var_.characterEffect1095ui_story == nil then
				arg_147_1.var_.characterEffect1095ui_story = var_150_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_17 = 0.200000002980232

			if var_150_16 <= arg_147_1.time_ and arg_147_1.time_ < var_150_16 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_16) / var_150_17

				if arg_147_1.var_.characterEffect1095ui_story then
					local var_150_19 = Mathf.Lerp(0, 0.5, var_150_18)

					arg_147_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1095ui_story.fillRatio = var_150_19
				end
			end

			if arg_147_1.time_ >= var_150_16 + var_150_17 and arg_147_1.time_ < var_150_16 + var_150_17 + arg_150_0 and arg_147_1.var_.characterEffect1095ui_story then
				local var_150_20 = 0.5

				arg_147_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1095ui_story.fillRatio = var_150_20
			end

			local var_150_21 = 0
			local var_150_22 = 0.625

			if var_150_21 < arg_147_1.time_ and arg_147_1.time_ <= var_150_21 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_23 = arg_147_1:FormatText(StoryNameCfg[6].name)

				arg_147_1.leftNameTxt_.text = var_150_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_24 = arg_147_1:GetWordFromCfg(319361036)
				local var_150_25 = arg_147_1:FormatText(var_150_24.content)

				arg_147_1.text_.text = var_150_25

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_26 = 25
				local var_150_27 = utf8.len(var_150_25)
				local var_150_28 = var_150_26 <= 0 and var_150_22 or var_150_22 * (var_150_27 / var_150_26)

				if var_150_28 > 0 and var_150_22 < var_150_28 then
					arg_147_1.talkMaxDuration = var_150_28

					if var_150_28 + var_150_21 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_28 + var_150_21
					end
				end

				arg_147_1.text_.text = var_150_25
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361036", "story_v_out_319361.awb") ~= 0 then
					local var_150_29 = manager.audio:GetVoiceLength("story_v_out_319361", "319361036", "story_v_out_319361.awb") / 1000

					if var_150_29 + var_150_21 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_29 + var_150_21
					end

					if var_150_24.prefab_name ~= "" and arg_147_1.actors_[var_150_24.prefab_name] ~= nil then
						local var_150_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_24.prefab_name].transform, "story_v_out_319361", "319361036", "story_v_out_319361.awb")

						arg_147_1:RecordAudio("319361036", var_150_30)
						arg_147_1:RecordAudio("319361036", var_150_30)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_319361", "319361036", "story_v_out_319361.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_319361", "319361036", "story_v_out_319361.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_31 = math.max(var_150_22, arg_147_1.talkMaxDuration)

			if var_150_21 <= arg_147_1.time_ and arg_147_1.time_ < var_150_21 + var_150_31 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_21) / var_150_31

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_21 + var_150_31 and arg_147_1.time_ < var_150_21 + var_150_31 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play319361037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 319361037
		arg_151_1.duration_ = 16.4

		local var_151_0 = {
			zh = 9.633,
			ja = 16.4
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
				arg_151_0:Play319361038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 1.2

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[6].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(319361037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 48
				local var_154_6 = utf8.len(var_154_4)
				local var_154_7 = var_154_5 <= 0 and var_154_1 or var_154_1 * (var_154_6 / var_154_5)

				if var_154_7 > 0 and var_154_1 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_4
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361037", "story_v_out_319361.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_319361", "319361037", "story_v_out_319361.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_319361", "319361037", "story_v_out_319361.awb")

						arg_151_1:RecordAudio("319361037", var_154_9)
						arg_151_1:RecordAudio("319361037", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_319361", "319361037", "story_v_out_319361.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_319361", "319361037", "story_v_out_319361.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_10 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_10 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_10

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_10 and arg_151_1.time_ < var_154_0 + var_154_10 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play319361038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 319361038
		arg_155_1.duration_ = 17.4

		local var_155_0 = {
			zh = 9.6,
			ja = 17.4
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
				arg_155_0:Play319361039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.3

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[6].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(319361038)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 52
				local var_158_6 = utf8.len(var_158_4)
				local var_158_7 = var_158_5 <= 0 and var_158_1 or var_158_1 * (var_158_6 / var_158_5)

				if var_158_7 > 0 and var_158_1 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_4
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361038", "story_v_out_319361.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_319361", "319361038", "story_v_out_319361.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_319361", "319361038", "story_v_out_319361.awb")

						arg_155_1:RecordAudio("319361038", var_158_9)
						arg_155_1:RecordAudio("319361038", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_319361", "319361038", "story_v_out_319361.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_319361", "319361038", "story_v_out_319361.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_10 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_10 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_10

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_10 and arg_155_1.time_ < var_158_0 + var_158_10 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play319361039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 319361039
		arg_159_1.duration_ = 15.266

		local var_159_0 = {
			zh = 12.633,
			ja = 15.266
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
				arg_159_0:Play319361040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 1.525

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[6].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(319361039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 61
				local var_162_6 = utf8.len(var_162_4)
				local var_162_7 = var_162_5 <= 0 and var_162_1 or var_162_1 * (var_162_6 / var_162_5)

				if var_162_7 > 0 and var_162_1 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_4
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361039", "story_v_out_319361.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_319361", "319361039", "story_v_out_319361.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_319361", "319361039", "story_v_out_319361.awb")

						arg_159_1:RecordAudio("319361039", var_162_9)
						arg_159_1:RecordAudio("319361039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_319361", "319361039", "story_v_out_319361.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_319361", "319361039", "story_v_out_319361.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_10 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_10 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_10

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_10 and arg_159_1.time_ < var_162_0 + var_162_10 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play319361040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 319361040
		arg_163_1.duration_ = 9.933

		local var_163_0 = {
			zh = 3.166,
			ja = 9.933
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
				arg_163_0:Play319361041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_166_1 = 0
			local var_166_2 = 0.45

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_3 = arg_163_1:FormatText(StoryNameCfg[6].name)

				arg_163_1.leftNameTxt_.text = var_166_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_4 = arg_163_1:GetWordFromCfg(319361040)
				local var_166_5 = arg_163_1:FormatText(var_166_4.content)

				arg_163_1.text_.text = var_166_5

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_6 = 18
				local var_166_7 = utf8.len(var_166_5)
				local var_166_8 = var_166_6 <= 0 and var_166_2 or var_166_2 * (var_166_7 / var_166_6)

				if var_166_8 > 0 and var_166_2 < var_166_8 then
					arg_163_1.talkMaxDuration = var_166_8

					if var_166_8 + var_166_1 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_1
					end
				end

				arg_163_1.text_.text = var_166_5
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361040", "story_v_out_319361.awb") ~= 0 then
					local var_166_9 = manager.audio:GetVoiceLength("story_v_out_319361", "319361040", "story_v_out_319361.awb") / 1000

					if var_166_9 + var_166_1 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_9 + var_166_1
					end

					if var_166_4.prefab_name ~= "" and arg_163_1.actors_[var_166_4.prefab_name] ~= nil then
						local var_166_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_4.prefab_name].transform, "story_v_out_319361", "319361040", "story_v_out_319361.awb")

						arg_163_1:RecordAudio("319361040", var_166_10)
						arg_163_1:RecordAudio("319361040", var_166_10)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_319361", "319361040", "story_v_out_319361.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_319361", "319361040", "story_v_out_319361.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_11 = math.max(var_166_2, arg_163_1.talkMaxDuration)

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_11 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_1) / var_166_11

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_1 + var_166_11 and arg_163_1.time_ < var_166_1 + var_166_11 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play319361041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319361041
		arg_167_1.duration_ = 8.4

		local var_167_0 = {
			zh = 5.7,
			ja = 8.4
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
				arg_167_0:Play319361042(arg_167_1)
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

			local var_170_13 = arg_167_1.actors_["10079ui_story"]
			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 and arg_167_1.var_.characterEffect10079ui_story == nil then
				arg_167_1.var_.characterEffect10079ui_story = var_170_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_15 = 0.200000002980232

			if var_170_14 <= arg_167_1.time_ and arg_167_1.time_ < var_170_14 + var_170_15 then
				local var_170_16 = (arg_167_1.time_ - var_170_14) / var_170_15

				if arg_167_1.var_.characterEffect10079ui_story then
					local var_170_17 = Mathf.Lerp(0, 0.5, var_170_16)

					arg_167_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_167_1.var_.characterEffect10079ui_story.fillRatio = var_170_17
				end
			end

			if arg_167_1.time_ >= var_170_14 + var_170_15 and arg_167_1.time_ < var_170_14 + var_170_15 + arg_170_0 and arg_167_1.var_.characterEffect10079ui_story then
				local var_170_18 = 0.5

				arg_167_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_167_1.var_.characterEffect10079ui_story.fillRatio = var_170_18
			end

			local var_170_19 = 0
			local var_170_20 = 0.625

			if var_170_19 < arg_167_1.time_ and arg_167_1.time_ <= var_170_19 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_21 = arg_167_1:FormatText(StoryNameCfg[471].name)

				arg_167_1.leftNameTxt_.text = var_170_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_22 = arg_167_1:GetWordFromCfg(319361041)
				local var_170_23 = arg_167_1:FormatText(var_170_22.content)

				arg_167_1.text_.text = var_170_23

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_24 = 25
				local var_170_25 = utf8.len(var_170_23)
				local var_170_26 = var_170_24 <= 0 and var_170_20 or var_170_20 * (var_170_25 / var_170_24)

				if var_170_26 > 0 and var_170_20 < var_170_26 then
					arg_167_1.talkMaxDuration = var_170_26

					if var_170_26 + var_170_19 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_26 + var_170_19
					end
				end

				arg_167_1.text_.text = var_170_23
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361041", "story_v_out_319361.awb") ~= 0 then
					local var_170_27 = manager.audio:GetVoiceLength("story_v_out_319361", "319361041", "story_v_out_319361.awb") / 1000

					if var_170_27 + var_170_19 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_27 + var_170_19
					end

					if var_170_22.prefab_name ~= "" and arg_167_1.actors_[var_170_22.prefab_name] ~= nil then
						local var_170_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_22.prefab_name].transform, "story_v_out_319361", "319361041", "story_v_out_319361.awb")

						arg_167_1:RecordAudio("319361041", var_170_28)
						arg_167_1:RecordAudio("319361041", var_170_28)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_319361", "319361041", "story_v_out_319361.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_319361", "319361041", "story_v_out_319361.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_29 = math.max(var_170_20, arg_167_1.talkMaxDuration)

			if var_170_19 <= arg_167_1.time_ and arg_167_1.time_ < var_170_19 + var_170_29 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_19) / var_170_29

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_19 + var_170_29 and arg_167_1.time_ < var_170_19 + var_170_29 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319361042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319361042
		arg_171_1.duration_ = 8.566

		local var_171_0 = {
			zh = 6.5,
			ja = 8.566
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
				arg_171_0:Play319361043(arg_171_1)
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
			local var_174_11 = 0.75

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

				local var_174_13 = arg_171_1:GetWordFromCfg(319361042)
				local var_174_14 = arg_171_1:FormatText(var_174_13.content)

				arg_171_1.text_.text = var_174_14

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_15 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361042", "story_v_out_319361.awb") ~= 0 then
					local var_174_18 = manager.audio:GetVoiceLength("story_v_out_319361", "319361042", "story_v_out_319361.awb") / 1000

					if var_174_18 + var_174_10 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_18 + var_174_10
					end

					if var_174_13.prefab_name ~= "" and arg_171_1.actors_[var_174_13.prefab_name] ~= nil then
						local var_174_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_13.prefab_name].transform, "story_v_out_319361", "319361042", "story_v_out_319361.awb")

						arg_171_1:RecordAudio("319361042", var_174_19)
						arg_171_1:RecordAudio("319361042", var_174_19)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_319361", "319361042", "story_v_out_319361.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_319361", "319361042", "story_v_out_319361.awb")
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
	Play319361043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319361043
		arg_175_1.duration_ = 9.1

		local var_175_0 = {
			zh = 5.966,
			ja = 9.1
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
				arg_175_0:Play319361044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_178_2 = 0
			local var_178_3 = 0.75

			if var_178_2 < arg_175_1.time_ and arg_175_1.time_ <= var_178_2 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_4 = arg_175_1:FormatText(StoryNameCfg[6].name)

				arg_175_1.leftNameTxt_.text = var_178_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_5 = arg_175_1:GetWordFromCfg(319361043)
				local var_178_6 = arg_175_1:FormatText(var_178_5.content)

				arg_175_1.text_.text = var_178_6

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_7 = 30
				local var_178_8 = utf8.len(var_178_6)
				local var_178_9 = var_178_7 <= 0 and var_178_3 or var_178_3 * (var_178_8 / var_178_7)

				if var_178_9 > 0 and var_178_3 < var_178_9 then
					arg_175_1.talkMaxDuration = var_178_9

					if var_178_9 + var_178_2 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_9 + var_178_2
					end
				end

				arg_175_1.text_.text = var_178_6
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361043", "story_v_out_319361.awb") ~= 0 then
					local var_178_10 = manager.audio:GetVoiceLength("story_v_out_319361", "319361043", "story_v_out_319361.awb") / 1000

					if var_178_10 + var_178_2 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_10 + var_178_2
					end

					if var_178_5.prefab_name ~= "" and arg_175_1.actors_[var_178_5.prefab_name] ~= nil then
						local var_178_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_5.prefab_name].transform, "story_v_out_319361", "319361043", "story_v_out_319361.awb")

						arg_175_1:RecordAudio("319361043", var_178_11)
						arg_175_1:RecordAudio("319361043", var_178_11)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_319361", "319361043", "story_v_out_319361.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_319361", "319361043", "story_v_out_319361.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_12 = math.max(var_178_3, arg_175_1.talkMaxDuration)

			if var_178_2 <= arg_175_1.time_ and arg_175_1.time_ < var_178_2 + var_178_12 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_2) / var_178_12

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_2 + var_178_12 and arg_175_1.time_ < var_178_2 + var_178_12 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play319361044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319361044
		arg_179_1.duration_ = 10.433

		local var_179_0 = {
			zh = 6.4,
			ja = 10.433
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
				arg_179_0:Play319361045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1095ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1095ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1095ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = arg_179_1.actors_["1095ui_story"]
			local var_182_10 = 0

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

			local var_182_13 = arg_179_1.actors_["10079ui_story"]
			local var_182_14 = 0

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 and arg_179_1.var_.characterEffect10079ui_story == nil then
				arg_179_1.var_.characterEffect10079ui_story = var_182_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_15 = 0.200000002980232

			if var_182_14 <= arg_179_1.time_ and arg_179_1.time_ < var_182_14 + var_182_15 then
				local var_182_16 = (arg_179_1.time_ - var_182_14) / var_182_15

				if arg_179_1.var_.characterEffect10079ui_story then
					local var_182_17 = Mathf.Lerp(0, 0.5, var_182_16)

					arg_179_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_179_1.var_.characterEffect10079ui_story.fillRatio = var_182_17
				end
			end

			if arg_179_1.time_ >= var_182_14 + var_182_15 and arg_179_1.time_ < var_182_14 + var_182_15 + arg_182_0 and arg_179_1.var_.characterEffect10079ui_story then
				local var_182_18 = 0.5

				arg_179_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_179_1.var_.characterEffect10079ui_story.fillRatio = var_182_18
			end

			local var_182_19 = 0

			if var_182_19 < arg_179_1.time_ and arg_179_1.time_ <= var_182_19 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_182_20 = 0

			if var_182_20 < arg_179_1.time_ and arg_179_1.time_ <= var_182_20 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_182_21 = 0
			local var_182_22 = 0.7

			if var_182_21 < arg_179_1.time_ and arg_179_1.time_ <= var_182_21 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_23 = arg_179_1:FormatText(StoryNameCfg[471].name)

				arg_179_1.leftNameTxt_.text = var_182_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_24 = arg_179_1:GetWordFromCfg(319361044)
				local var_182_25 = arg_179_1:FormatText(var_182_24.content)

				arg_179_1.text_.text = var_182_25

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_26 = 28
				local var_182_27 = utf8.len(var_182_25)
				local var_182_28 = var_182_26 <= 0 and var_182_22 or var_182_22 * (var_182_27 / var_182_26)

				if var_182_28 > 0 and var_182_22 < var_182_28 then
					arg_179_1.talkMaxDuration = var_182_28

					if var_182_28 + var_182_21 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_28 + var_182_21
					end
				end

				arg_179_1.text_.text = var_182_25
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361044", "story_v_out_319361.awb") ~= 0 then
					local var_182_29 = manager.audio:GetVoiceLength("story_v_out_319361", "319361044", "story_v_out_319361.awb") / 1000

					if var_182_29 + var_182_21 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_29 + var_182_21
					end

					if var_182_24.prefab_name ~= "" and arg_179_1.actors_[var_182_24.prefab_name] ~= nil then
						local var_182_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_24.prefab_name].transform, "story_v_out_319361", "319361044", "story_v_out_319361.awb")

						arg_179_1:RecordAudio("319361044", var_182_30)
						arg_179_1:RecordAudio("319361044", var_182_30)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_319361", "319361044", "story_v_out_319361.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_319361", "319361044", "story_v_out_319361.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_31 = math.max(var_182_22, arg_179_1.talkMaxDuration)

			if var_182_21 <= arg_179_1.time_ and arg_179_1.time_ < var_182_21 + var_182_31 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_21) / var_182_31

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_21 + var_182_31 and arg_179_1.time_ < var_182_21 + var_182_31 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319361045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 319361045
		arg_183_1.duration_ = 8.966

		local var_183_0 = {
			zh = 7.4,
			ja = 8.966
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
				arg_183_0:Play319361046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.925

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

				local var_186_3 = arg_183_1:GetWordFromCfg(319361045)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361045", "story_v_out_319361.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_319361", "319361045", "story_v_out_319361.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_319361", "319361045", "story_v_out_319361.awb")

						arg_183_1:RecordAudio("319361045", var_186_9)
						arg_183_1:RecordAudio("319361045", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_319361", "319361045", "story_v_out_319361.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_319361", "319361045", "story_v_out_319361.awb")
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
	Play319361046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 319361046
		arg_187_1.duration_ = 7.833

		local var_187_0 = {
			zh = 4.533,
			ja = 7.833
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
				arg_187_0:Play319361047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10079ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect10079ui_story == nil then
				arg_187_1.var_.characterEffect10079ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.200000002980232

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect10079ui_story then
					arg_187_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect10079ui_story then
				arg_187_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_190_4 = arg_187_1.actors_["1095ui_story"]
			local var_190_5 = 0

			if var_190_5 < arg_187_1.time_ and arg_187_1.time_ <= var_190_5 + arg_190_0 and arg_187_1.var_.characterEffect1095ui_story == nil then
				arg_187_1.var_.characterEffect1095ui_story = var_190_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_6 = 0.200000002980232

			if var_190_5 <= arg_187_1.time_ and arg_187_1.time_ < var_190_5 + var_190_6 then
				local var_190_7 = (arg_187_1.time_ - var_190_5) / var_190_6

				if arg_187_1.var_.characterEffect1095ui_story then
					local var_190_8 = Mathf.Lerp(0, 0.5, var_190_7)

					arg_187_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1095ui_story.fillRatio = var_190_8
				end
			end

			if arg_187_1.time_ >= var_190_5 + var_190_6 and arg_187_1.time_ < var_190_5 + var_190_6 + arg_190_0 and arg_187_1.var_.characterEffect1095ui_story then
				local var_190_9 = 0.5

				arg_187_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1095ui_story.fillRatio = var_190_9
			end

			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 then
				arg_187_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_190_11 = 0

			if var_190_11 < arg_187_1.time_ and arg_187_1.time_ <= var_190_11 + arg_190_0 then
				arg_187_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_190_12 = 0
			local var_190_13 = 0.6

			if var_190_12 < arg_187_1.time_ and arg_187_1.time_ <= var_190_12 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_14 = arg_187_1:FormatText(StoryNameCfg[6].name)

				arg_187_1.leftNameTxt_.text = var_190_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_15 = arg_187_1:GetWordFromCfg(319361046)
				local var_190_16 = arg_187_1:FormatText(var_190_15.content)

				arg_187_1.text_.text = var_190_16

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_17 = 24
				local var_190_18 = utf8.len(var_190_16)
				local var_190_19 = var_190_17 <= 0 and var_190_13 or var_190_13 * (var_190_18 / var_190_17)

				if var_190_19 > 0 and var_190_13 < var_190_19 then
					arg_187_1.talkMaxDuration = var_190_19

					if var_190_19 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_19 + var_190_12
					end
				end

				arg_187_1.text_.text = var_190_16
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361046", "story_v_out_319361.awb") ~= 0 then
					local var_190_20 = manager.audio:GetVoiceLength("story_v_out_319361", "319361046", "story_v_out_319361.awb") / 1000

					if var_190_20 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_20 + var_190_12
					end

					if var_190_15.prefab_name ~= "" and arg_187_1.actors_[var_190_15.prefab_name] ~= nil then
						local var_190_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_15.prefab_name].transform, "story_v_out_319361", "319361046", "story_v_out_319361.awb")

						arg_187_1:RecordAudio("319361046", var_190_21)
						arg_187_1:RecordAudio("319361046", var_190_21)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_319361", "319361046", "story_v_out_319361.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_319361", "319361046", "story_v_out_319361.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_22 = math.max(var_190_13, arg_187_1.talkMaxDuration)

			if var_190_12 <= arg_187_1.time_ and arg_187_1.time_ < var_190_12 + var_190_22 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_12) / var_190_22

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_12 + var_190_22 and arg_187_1.time_ < var_190_12 + var_190_22 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play319361047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 319361047
		arg_191_1.duration_ = 1.333

		local var_191_0 = {
			zh = 1.3,
			ja = 1.333
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
				arg_191_0:Play319361048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10079ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect10079ui_story == nil then
				arg_191_1.var_.characterEffect10079ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect10079ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_191_1.var_.characterEffect10079ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect10079ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_191_1.var_.characterEffect10079ui_story.fillRatio = var_194_5
			end

			local var_194_6 = arg_191_1.actors_["1095ui_story"]
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 and arg_191_1.var_.characterEffect1095ui_story == nil then
				arg_191_1.var_.characterEffect1095ui_story = var_194_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_8 = 0.200000002980232

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_8 then
				local var_194_9 = (arg_191_1.time_ - var_194_7) / var_194_8

				if arg_191_1.var_.characterEffect1095ui_story then
					arg_191_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.characterEffect1095ui_story then
				arg_191_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_194_10 = 0
			local var_194_11 = 0.1

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_12 = arg_191_1:FormatText(StoryNameCfg[471].name)

				arg_191_1.leftNameTxt_.text = var_194_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_13 = arg_191_1:GetWordFromCfg(319361047)
				local var_194_14 = arg_191_1:FormatText(var_194_13.content)

				arg_191_1.text_.text = var_194_14

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_15 = 4
				local var_194_16 = utf8.len(var_194_14)
				local var_194_17 = var_194_15 <= 0 and var_194_11 or var_194_11 * (var_194_16 / var_194_15)

				if var_194_17 > 0 and var_194_11 < var_194_17 then
					arg_191_1.talkMaxDuration = var_194_17

					if var_194_17 + var_194_10 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_17 + var_194_10
					end
				end

				arg_191_1.text_.text = var_194_14
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361047", "story_v_out_319361.awb") ~= 0 then
					local var_194_18 = manager.audio:GetVoiceLength("story_v_out_319361", "319361047", "story_v_out_319361.awb") / 1000

					if var_194_18 + var_194_10 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_18 + var_194_10
					end

					if var_194_13.prefab_name ~= "" and arg_191_1.actors_[var_194_13.prefab_name] ~= nil then
						local var_194_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_13.prefab_name].transform, "story_v_out_319361", "319361047", "story_v_out_319361.awb")

						arg_191_1:RecordAudio("319361047", var_194_19)
						arg_191_1:RecordAudio("319361047", var_194_19)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_319361", "319361047", "story_v_out_319361.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_319361", "319361047", "story_v_out_319361.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_20 = math.max(var_194_11, arg_191_1.talkMaxDuration)

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_20 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_10) / var_194_20

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_10 + var_194_20 and arg_191_1.time_ < var_194_10 + var_194_20 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play319361048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 319361048
		arg_195_1.duration_ = 10.066

		local var_195_0 = {
			zh = 8.966,
			ja = 10.066
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
				arg_195_0:Play319361049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10079ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos10079ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(0.7, -0.95, -6.05)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10079ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = arg_195_1.actors_["10079ui_story"]
			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 and arg_195_1.var_.characterEffect10079ui_story == nil then
				arg_195_1.var_.characterEffect10079ui_story = var_198_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_11 = 0.200000002980232

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_10) / var_198_11

				if arg_195_1.var_.characterEffect10079ui_story then
					arg_195_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 and arg_195_1.var_.characterEffect10079ui_story then
				arg_195_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_198_13 = arg_195_1.actors_["1095ui_story"]
			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 and arg_195_1.var_.characterEffect1095ui_story == nil then
				arg_195_1.var_.characterEffect1095ui_story = var_198_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_15 = 0.200000002980232

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_15 then
				local var_198_16 = (arg_195_1.time_ - var_198_14) / var_198_15

				if arg_195_1.var_.characterEffect1095ui_story then
					local var_198_17 = Mathf.Lerp(0, 0.5, var_198_16)

					arg_195_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1095ui_story.fillRatio = var_198_17
				end
			end

			if arg_195_1.time_ >= var_198_14 + var_198_15 and arg_195_1.time_ < var_198_14 + var_198_15 + arg_198_0 and arg_195_1.var_.characterEffect1095ui_story then
				local var_198_18 = 0.5

				arg_195_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1095ui_story.fillRatio = var_198_18
			end

			local var_198_19 = 0

			if var_198_19 < arg_195_1.time_ and arg_195_1.time_ <= var_198_19 + arg_198_0 then
				arg_195_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_198_20 = 0
			local var_198_21 = 1.025

			if var_198_20 < arg_195_1.time_ and arg_195_1.time_ <= var_198_20 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_22 = arg_195_1:FormatText(StoryNameCfg[6].name)

				arg_195_1.leftNameTxt_.text = var_198_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_23 = arg_195_1:GetWordFromCfg(319361048)
				local var_198_24 = arg_195_1:FormatText(var_198_23.content)

				arg_195_1.text_.text = var_198_24

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_25 = 41
				local var_198_26 = utf8.len(var_198_24)
				local var_198_27 = var_198_25 <= 0 and var_198_21 or var_198_21 * (var_198_26 / var_198_25)

				if var_198_27 > 0 and var_198_21 < var_198_27 then
					arg_195_1.talkMaxDuration = var_198_27

					if var_198_27 + var_198_20 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_27 + var_198_20
					end
				end

				arg_195_1.text_.text = var_198_24
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361048", "story_v_out_319361.awb") ~= 0 then
					local var_198_28 = manager.audio:GetVoiceLength("story_v_out_319361", "319361048", "story_v_out_319361.awb") / 1000

					if var_198_28 + var_198_20 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_28 + var_198_20
					end

					if var_198_23.prefab_name ~= "" and arg_195_1.actors_[var_198_23.prefab_name] ~= nil then
						local var_198_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_23.prefab_name].transform, "story_v_out_319361", "319361048", "story_v_out_319361.awb")

						arg_195_1:RecordAudio("319361048", var_198_29)
						arg_195_1:RecordAudio("319361048", var_198_29)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_319361", "319361048", "story_v_out_319361.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_319361", "319361048", "story_v_out_319361.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_30 = math.max(var_198_21, arg_195_1.talkMaxDuration)

			if var_198_20 <= arg_195_1.time_ and arg_195_1.time_ < var_198_20 + var_198_30 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_20) / var_198_30

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_20 + var_198_30 and arg_195_1.time_ < var_198_20 + var_198_30 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play319361049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319361049
		arg_199_1.duration_ = 9.3

		local var_199_0 = {
			zh = 8.566,
			ja = 9.3
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
				arg_199_0:Play319361050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.95

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[6].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(319361049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361049", "story_v_out_319361.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_319361", "319361049", "story_v_out_319361.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_319361", "319361049", "story_v_out_319361.awb")

						arg_199_1:RecordAudio("319361049", var_202_9)
						arg_199_1:RecordAudio("319361049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_319361", "319361049", "story_v_out_319361.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_319361", "319361049", "story_v_out_319361.awb")
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
	Play319361050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319361050
		arg_203_1.duration_ = 2.333

		local var_203_0 = {
			zh = 1.999999999999,
			ja = 2.333
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
				arg_203_0:Play319361051(arg_203_1)
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
				local var_206_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1095ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

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

			local var_206_13 = arg_203_1.actors_["10079ui_story"]
			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 and arg_203_1.var_.characterEffect10079ui_story == nil then
				arg_203_1.var_.characterEffect10079ui_story = var_206_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_15 = 0.200000002980232

			if var_206_14 <= arg_203_1.time_ and arg_203_1.time_ < var_206_14 + var_206_15 then
				local var_206_16 = (arg_203_1.time_ - var_206_14) / var_206_15

				if arg_203_1.var_.characterEffect10079ui_story then
					local var_206_17 = Mathf.Lerp(0, 0.5, var_206_16)

					arg_203_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_203_1.var_.characterEffect10079ui_story.fillRatio = var_206_17
				end
			end

			if arg_203_1.time_ >= var_206_14 + var_206_15 and arg_203_1.time_ < var_206_14 + var_206_15 + arg_206_0 and arg_203_1.var_.characterEffect10079ui_story then
				local var_206_18 = 0.5

				arg_203_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_203_1.var_.characterEffect10079ui_story.fillRatio = var_206_18
			end

			local var_206_19 = 0

			if var_206_19 < arg_203_1.time_ and arg_203_1.time_ <= var_206_19 + arg_206_0 then
				arg_203_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_206_20 = 0
			local var_206_21 = 0.1

			if var_206_20 < arg_203_1.time_ and arg_203_1.time_ <= var_206_20 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_22 = arg_203_1:FormatText(StoryNameCfg[471].name)

				arg_203_1.leftNameTxt_.text = var_206_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_23 = arg_203_1:GetWordFromCfg(319361050)
				local var_206_24 = arg_203_1:FormatText(var_206_23.content)

				arg_203_1.text_.text = var_206_24

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_25 = 4
				local var_206_26 = utf8.len(var_206_24)
				local var_206_27 = var_206_25 <= 0 and var_206_21 or var_206_21 * (var_206_26 / var_206_25)

				if var_206_27 > 0 and var_206_21 < var_206_27 then
					arg_203_1.talkMaxDuration = var_206_27

					if var_206_27 + var_206_20 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_27 + var_206_20
					end
				end

				arg_203_1.text_.text = var_206_24
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361050", "story_v_out_319361.awb") ~= 0 then
					local var_206_28 = manager.audio:GetVoiceLength("story_v_out_319361", "319361050", "story_v_out_319361.awb") / 1000

					if var_206_28 + var_206_20 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_28 + var_206_20
					end

					if var_206_23.prefab_name ~= "" and arg_203_1.actors_[var_206_23.prefab_name] ~= nil then
						local var_206_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_23.prefab_name].transform, "story_v_out_319361", "319361050", "story_v_out_319361.awb")

						arg_203_1:RecordAudio("319361050", var_206_29)
						arg_203_1:RecordAudio("319361050", var_206_29)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_319361", "319361050", "story_v_out_319361.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_319361", "319361050", "story_v_out_319361.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_30 = math.max(var_206_21, arg_203_1.talkMaxDuration)

			if var_206_20 <= arg_203_1.time_ and arg_203_1.time_ < var_206_20 + var_206_30 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_20) / var_206_30

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_20 + var_206_30 and arg_203_1.time_ < var_206_20 + var_206_30 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play319361051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 319361051
		arg_207_1.duration_ = 4.133

		local var_207_0 = {
			zh = 2.366,
			ja = 4.133
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
				arg_207_0:Play319361052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1095ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1095ui_story == nil then
				arg_207_1.var_.characterEffect1095ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.200000002980232

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1095ui_story then
					local var_210_4 = Mathf.Lerp(0, 0.5, var_210_3)

					arg_207_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1095ui_story.fillRatio = var_210_4
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1095ui_story then
				local var_210_5 = 0.5

				arg_207_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1095ui_story.fillRatio = var_210_5
			end

			local var_210_6 = arg_207_1.actors_["10079ui_story"]
			local var_210_7 = 0

			if var_210_7 < arg_207_1.time_ and arg_207_1.time_ <= var_210_7 + arg_210_0 and arg_207_1.var_.characterEffect10079ui_story == nil then
				arg_207_1.var_.characterEffect10079ui_story = var_210_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_8 = 0.200000002980232

			if var_210_7 <= arg_207_1.time_ and arg_207_1.time_ < var_210_7 + var_210_8 then
				local var_210_9 = (arg_207_1.time_ - var_210_7) / var_210_8

				if arg_207_1.var_.characterEffect10079ui_story then
					arg_207_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_7 + var_210_8 and arg_207_1.time_ < var_210_7 + var_210_8 + arg_210_0 and arg_207_1.var_.characterEffect10079ui_story then
				arg_207_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 then
				arg_207_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_210_11 = 0

			if var_210_11 < arg_207_1.time_ and arg_207_1.time_ <= var_210_11 + arg_210_0 then
				arg_207_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_210_12 = 0
			local var_210_13 = 0.225

			if var_210_12 < arg_207_1.time_ and arg_207_1.time_ <= var_210_12 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_14 = arg_207_1:FormatText(StoryNameCfg[6].name)

				arg_207_1.leftNameTxt_.text = var_210_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_15 = arg_207_1:GetWordFromCfg(319361051)
				local var_210_16 = arg_207_1:FormatText(var_210_15.content)

				arg_207_1.text_.text = var_210_16

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_17 = 9
				local var_210_18 = utf8.len(var_210_16)
				local var_210_19 = var_210_17 <= 0 and var_210_13 or var_210_13 * (var_210_18 / var_210_17)

				if var_210_19 > 0 and var_210_13 < var_210_19 then
					arg_207_1.talkMaxDuration = var_210_19

					if var_210_19 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_19 + var_210_12
					end
				end

				arg_207_1.text_.text = var_210_16
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361051", "story_v_out_319361.awb") ~= 0 then
					local var_210_20 = manager.audio:GetVoiceLength("story_v_out_319361", "319361051", "story_v_out_319361.awb") / 1000

					if var_210_20 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_12
					end

					if var_210_15.prefab_name ~= "" and arg_207_1.actors_[var_210_15.prefab_name] ~= nil then
						local var_210_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_15.prefab_name].transform, "story_v_out_319361", "319361051", "story_v_out_319361.awb")

						arg_207_1:RecordAudio("319361051", var_210_21)
						arg_207_1:RecordAudio("319361051", var_210_21)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_319361", "319361051", "story_v_out_319361.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_319361", "319361051", "story_v_out_319361.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_22 = math.max(var_210_13, arg_207_1.talkMaxDuration)

			if var_210_12 <= arg_207_1.time_ and arg_207_1.time_ < var_210_12 + var_210_22 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_12) / var_210_22

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_12 + var_210_22 and arg_207_1.time_ < var_210_12 + var_210_22 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play319361052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 319361052
		arg_211_1.duration_ = 4.2

		local var_211_0 = {
			zh = 4.2,
			ja = 1.333
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
				arg_211_0:Play319361053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10079ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect10079ui_story == nil then
				arg_211_1.var_.characterEffect10079ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect10079ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_211_1.var_.characterEffect10079ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect10079ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_211_1.var_.characterEffect10079ui_story.fillRatio = var_214_5
			end

			local var_214_6 = arg_211_1.actors_["1095ui_story"]
			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 and arg_211_1.var_.characterEffect1095ui_story == nil then
				arg_211_1.var_.characterEffect1095ui_story = var_214_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_8 = 0.200000002980232

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_8 then
				local var_214_9 = (arg_211_1.time_ - var_214_7) / var_214_8

				if arg_211_1.var_.characterEffect1095ui_story then
					arg_211_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_7 + var_214_8 and arg_211_1.time_ < var_214_7 + var_214_8 + arg_214_0 and arg_211_1.var_.characterEffect1095ui_story then
				arg_211_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_214_10 = 0
			local var_214_11 = 0.45

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_12 = arg_211_1:FormatText(StoryNameCfg[471].name)

				arg_211_1.leftNameTxt_.text = var_214_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_13 = arg_211_1:GetWordFromCfg(319361052)
				local var_214_14 = arg_211_1:FormatText(var_214_13.content)

				arg_211_1.text_.text = var_214_14

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_15 = 18
				local var_214_16 = utf8.len(var_214_14)
				local var_214_17 = var_214_15 <= 0 and var_214_11 or var_214_11 * (var_214_16 / var_214_15)

				if var_214_17 > 0 and var_214_11 < var_214_17 then
					arg_211_1.talkMaxDuration = var_214_17

					if var_214_17 + var_214_10 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_17 + var_214_10
					end
				end

				arg_211_1.text_.text = var_214_14
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361052", "story_v_out_319361.awb") ~= 0 then
					local var_214_18 = manager.audio:GetVoiceLength("story_v_out_319361", "319361052", "story_v_out_319361.awb") / 1000

					if var_214_18 + var_214_10 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_18 + var_214_10
					end

					if var_214_13.prefab_name ~= "" and arg_211_1.actors_[var_214_13.prefab_name] ~= nil then
						local var_214_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_13.prefab_name].transform, "story_v_out_319361", "319361052", "story_v_out_319361.awb")

						arg_211_1:RecordAudio("319361052", var_214_19)
						arg_211_1:RecordAudio("319361052", var_214_19)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_319361", "319361052", "story_v_out_319361.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_319361", "319361052", "story_v_out_319361.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_20 = math.max(var_214_11, arg_211_1.talkMaxDuration)

			if var_214_10 <= arg_211_1.time_ and arg_211_1.time_ < var_214_10 + var_214_20 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_10) / var_214_20

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_10 + var_214_20 and arg_211_1.time_ < var_214_10 + var_214_20 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play319361053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 319361053
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play319361054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1095ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1095ui_story == nil then
				arg_215_1.var_.characterEffect1095ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.200000002980232

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1095ui_story then
					local var_218_4 = Mathf.Lerp(0, 0.5, var_218_3)

					arg_215_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1095ui_story.fillRatio = var_218_4
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1095ui_story then
				local var_218_5 = 0.5

				arg_215_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1095ui_story.fillRatio = var_218_5
			end

			local var_218_6 = 0
			local var_218_7 = 1.175

			if var_218_6 < arg_215_1.time_ and arg_215_1.time_ <= var_218_6 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_8 = arg_215_1:GetWordFromCfg(319361053)
				local var_218_9 = arg_215_1:FormatText(var_218_8.content)

				arg_215_1.text_.text = var_218_9

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_10 = 47
				local var_218_11 = utf8.len(var_218_9)
				local var_218_12 = var_218_10 <= 0 and var_218_7 or var_218_7 * (var_218_11 / var_218_10)

				if var_218_12 > 0 and var_218_7 < var_218_12 then
					arg_215_1.talkMaxDuration = var_218_12

					if var_218_12 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_12 + var_218_6
					end
				end

				arg_215_1.text_.text = var_218_9
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_13 = math.max(var_218_7, arg_215_1.talkMaxDuration)

			if var_218_6 <= arg_215_1.time_ and arg_215_1.time_ < var_218_6 + var_218_13 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_6) / var_218_13

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_6 + var_218_13 and arg_215_1.time_ < var_218_6 + var_218_13 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play319361054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 319361054
		arg_219_1.duration_ = 16

		local var_219_0 = {
			zh = 15.5,
			ja = 16
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
				arg_219_0:Play319361055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1095ui_story"]
			local var_222_1 = 3.3

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1095ui_story == nil then
				arg_219_1.var_.characterEffect1095ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.200000002980232

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1095ui_story then
					arg_219_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1095ui_story then
				arg_219_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_222_4 = 3.3

			if var_222_4 < arg_219_1.time_ and arg_219_1.time_ <= var_222_4 + arg_222_0 then
				arg_219_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action5_1")
			end

			local var_222_5 = 3.3

			if var_222_5 < arg_219_1.time_ and arg_219_1.time_ <= var_222_5 + arg_222_0 then
				arg_219_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_222_6 = 2

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 then
				local var_222_7 = manager.ui.mainCamera.transform.localPosition
				local var_222_8 = Vector3.New(0, 0, 10) + Vector3.New(var_222_7.x, var_222_7.y, 0)
				local var_222_9 = arg_219_1.bgs_.I11q

				var_222_9.transform.localPosition = var_222_8
				var_222_9.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_222_10 = var_222_9:GetComponent("SpriteRenderer")

				if var_222_10 and var_222_10.sprite then
					local var_222_11 = (var_222_9.transform.localPosition - var_222_7).z
					local var_222_12 = manager.ui.mainCameraCom_
					local var_222_13 = 2 * var_222_11 * Mathf.Tan(var_222_12.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_222_14 = var_222_13 * var_222_12.aspect
					local var_222_15 = var_222_10.sprite.bounds.size.x
					local var_222_16 = var_222_10.sprite.bounds.size.y
					local var_222_17 = var_222_14 / var_222_15
					local var_222_18 = var_222_13 / var_222_16
					local var_222_19 = var_222_18 < var_222_17 and var_222_17 or var_222_18

					var_222_9.transform.localScale = Vector3.New(var_222_19, var_222_19, 0)
				end

				for iter_222_0, iter_222_1 in pairs(arg_219_1.bgs_) do
					if iter_222_0 ~= "I11q" then
						iter_222_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_222_20 = 0

			if var_222_20 < arg_219_1.time_ and arg_219_1.time_ <= var_222_20 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = true

				arg_219_1:SetGaussion(false)
			end

			local var_222_21 = 2

			if var_222_20 <= arg_219_1.time_ and arg_219_1.time_ < var_222_20 + var_222_21 then
				local var_222_22 = (arg_219_1.time_ - var_222_20) / var_222_21
				local var_222_23 = Color.New(0, 0, 0)

				var_222_23.a = Mathf.Lerp(0, 1, var_222_22)
				arg_219_1.mask_.color = var_222_23
			end

			if arg_219_1.time_ >= var_222_20 + var_222_21 and arg_219_1.time_ < var_222_20 + var_222_21 + arg_222_0 then
				local var_222_24 = Color.New(0, 0, 0)

				var_222_24.a = 1
				arg_219_1.mask_.color = var_222_24
			end

			local var_222_25 = 2

			if var_222_25 < arg_219_1.time_ and arg_219_1.time_ <= var_222_25 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = true

				arg_219_1:SetGaussion(false)
			end

			local var_222_26 = 1.3

			if var_222_25 <= arg_219_1.time_ and arg_219_1.time_ < var_222_25 + var_222_26 then
				local var_222_27 = (arg_219_1.time_ - var_222_25) / var_222_26
				local var_222_28 = Color.New(0, 0, 0)

				var_222_28.a = Mathf.Lerp(1, 0, var_222_27)
				arg_219_1.mask_.color = var_222_28
			end

			if arg_219_1.time_ >= var_222_25 + var_222_26 and arg_219_1.time_ < var_222_25 + var_222_26 + arg_222_0 then
				local var_222_29 = Color.New(0, 0, 0)
				local var_222_30 = 0

				arg_219_1.mask_.enabled = false
				var_222_29.a = var_222_30
				arg_219_1.mask_.color = var_222_29
			end

			local var_222_31 = arg_219_1.actors_["1095ui_story"].transform
			local var_222_32 = 2

			if var_222_32 < arg_219_1.time_ and arg_219_1.time_ <= var_222_32 + arg_222_0 then
				arg_219_1.var_.moveOldPos1095ui_story = var_222_31.localPosition
			end

			local var_222_33 = 0.001

			if var_222_32 <= arg_219_1.time_ and arg_219_1.time_ < var_222_32 + var_222_33 then
				local var_222_34 = (arg_219_1.time_ - var_222_32) / var_222_33
				local var_222_35 = Vector3.New(0, 100, 0)

				var_222_31.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1095ui_story, var_222_35, var_222_34)

				local var_222_36 = manager.ui.mainCamera.transform.position - var_222_31.position

				var_222_31.forward = Vector3.New(var_222_36.x, var_222_36.y, var_222_36.z)

				local var_222_37 = var_222_31.localEulerAngles

				var_222_37.z = 0
				var_222_37.x = 0
				var_222_31.localEulerAngles = var_222_37
			end

			if arg_219_1.time_ >= var_222_32 + var_222_33 and arg_219_1.time_ < var_222_32 + var_222_33 + arg_222_0 then
				var_222_31.localPosition = Vector3.New(0, 100, 0)

				local var_222_38 = manager.ui.mainCamera.transform.position - var_222_31.position

				var_222_31.forward = Vector3.New(var_222_38.x, var_222_38.y, var_222_38.z)

				local var_222_39 = var_222_31.localEulerAngles

				var_222_39.z = 0
				var_222_39.x = 0
				var_222_31.localEulerAngles = var_222_39
			end

			local var_222_40 = arg_219_1.actors_["10079ui_story"].transform
			local var_222_41 = 2

			if var_222_41 < arg_219_1.time_ and arg_219_1.time_ <= var_222_41 + arg_222_0 then
				arg_219_1.var_.moveOldPos10079ui_story = var_222_40.localPosition
			end

			local var_222_42 = 0.001

			if var_222_41 <= arg_219_1.time_ and arg_219_1.time_ < var_222_41 + var_222_42 then
				local var_222_43 = (arg_219_1.time_ - var_222_41) / var_222_42
				local var_222_44 = Vector3.New(0, 100, 0)

				var_222_40.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10079ui_story, var_222_44, var_222_43)

				local var_222_45 = manager.ui.mainCamera.transform.position - var_222_40.position

				var_222_40.forward = Vector3.New(var_222_45.x, var_222_45.y, var_222_45.z)

				local var_222_46 = var_222_40.localEulerAngles

				var_222_46.z = 0
				var_222_46.x = 0
				var_222_40.localEulerAngles = var_222_46
			end

			if arg_219_1.time_ >= var_222_41 + var_222_42 and arg_219_1.time_ < var_222_41 + var_222_42 + arg_222_0 then
				var_222_40.localPosition = Vector3.New(0, 100, 0)

				local var_222_47 = manager.ui.mainCamera.transform.position - var_222_40.position

				var_222_40.forward = Vector3.New(var_222_47.x, var_222_47.y, var_222_47.z)

				local var_222_48 = var_222_40.localEulerAngles

				var_222_48.z = 0
				var_222_48.x = 0
				var_222_40.localEulerAngles = var_222_48
			end

			local var_222_49 = arg_219_1.actors_["1095ui_story"].transform
			local var_222_50 = 3.30000000298023

			if var_222_50 < arg_219_1.time_ and arg_219_1.time_ <= var_222_50 + arg_222_0 then
				arg_219_1.var_.moveOldPos1095ui_story = var_222_49.localPosition
			end

			local var_222_51 = 0.001

			if var_222_50 <= arg_219_1.time_ and arg_219_1.time_ < var_222_50 + var_222_51 then
				local var_222_52 = (arg_219_1.time_ - var_222_50) / var_222_51
				local var_222_53 = Vector3.New(0, -0.98, -6.1)

				var_222_49.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1095ui_story, var_222_53, var_222_52)

				local var_222_54 = manager.ui.mainCamera.transform.position - var_222_49.position

				var_222_49.forward = Vector3.New(var_222_54.x, var_222_54.y, var_222_54.z)

				local var_222_55 = var_222_49.localEulerAngles

				var_222_55.z = 0
				var_222_55.x = 0
				var_222_49.localEulerAngles = var_222_55
			end

			if arg_219_1.time_ >= var_222_50 + var_222_51 and arg_219_1.time_ < var_222_50 + var_222_51 + arg_222_0 then
				var_222_49.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_222_56 = manager.ui.mainCamera.transform.position - var_222_49.position

				var_222_49.forward = Vector3.New(var_222_56.x, var_222_56.y, var_222_56.z)

				local var_222_57 = var_222_49.localEulerAngles

				var_222_57.z = 0
				var_222_57.x = 0
				var_222_49.localEulerAngles = var_222_57
			end

			if arg_219_1.frameCnt_ <= 1 then
				arg_219_1.dialog_:SetActive(false)
			end

			local var_222_58 = 3.3
			local var_222_59 = 1.175

			if var_222_58 < arg_219_1.time_ and arg_219_1.time_ <= var_222_58 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0

				arg_219_1.dialog_:SetActive(true)

				local var_222_60 = LeanTween.value(arg_219_1.dialog_, 0, 1, 0.3)

				var_222_60:setOnUpdate(LuaHelper.FloatAction(function(arg_223_0)
					arg_219_1.dialogCg_.alpha = arg_223_0
				end))
				var_222_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_219_1.dialog_)
					var_222_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_219_1.duration_ = arg_219_1.duration_ + 0.3

				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_61 = arg_219_1:FormatText(StoryNameCfg[471].name)

				arg_219_1.leftNameTxt_.text = var_222_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_62 = arg_219_1:GetWordFromCfg(319361054)
				local var_222_63 = arg_219_1:FormatText(var_222_62.content)

				arg_219_1.text_.text = var_222_63

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_64 = 47
				local var_222_65 = utf8.len(var_222_63)
				local var_222_66 = var_222_64 <= 0 and var_222_59 or var_222_59 * (var_222_65 / var_222_64)

				if var_222_66 > 0 and var_222_59 < var_222_66 then
					arg_219_1.talkMaxDuration = var_222_66
					var_222_58 = var_222_58 + 0.3

					if var_222_66 + var_222_58 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_66 + var_222_58
					end
				end

				arg_219_1.text_.text = var_222_63
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361054", "story_v_out_319361.awb") ~= 0 then
					local var_222_67 = manager.audio:GetVoiceLength("story_v_out_319361", "319361054", "story_v_out_319361.awb") / 1000

					if var_222_67 + var_222_58 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_67 + var_222_58
					end

					if var_222_62.prefab_name ~= "" and arg_219_1.actors_[var_222_62.prefab_name] ~= nil then
						local var_222_68 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_62.prefab_name].transform, "story_v_out_319361", "319361054", "story_v_out_319361.awb")

						arg_219_1:RecordAudio("319361054", var_222_68)
						arg_219_1:RecordAudio("319361054", var_222_68)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_319361", "319361054", "story_v_out_319361.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_319361", "319361054", "story_v_out_319361.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_69 = var_222_58 + 0.3
			local var_222_70 = math.max(var_222_59, arg_219_1.talkMaxDuration)

			if var_222_69 <= arg_219_1.time_ and arg_219_1.time_ < var_222_69 + var_222_70 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_69) / var_222_70

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_69 + var_222_70 and arg_219_1.time_ < var_222_69 + var_222_70 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play319361055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 319361055
		arg_225_1.duration_ = 11.6

		local var_225_0 = {
			zh = 11.6,
			ja = 9.166
		}
		local var_225_1 = manager.audio:GetLocalizationFlag()

		if var_225_0[var_225_1] ~= nil then
			arg_225_1.duration_ = var_225_0[var_225_1]
		end

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play319361056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_228_1 = 0
			local var_228_2 = 1.25

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_3 = arg_225_1:FormatText(StoryNameCfg[471].name)

				arg_225_1.leftNameTxt_.text = var_228_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_4 = arg_225_1:GetWordFromCfg(319361055)
				local var_228_5 = arg_225_1:FormatText(var_228_4.content)

				arg_225_1.text_.text = var_228_5

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_6 = 50
				local var_228_7 = utf8.len(var_228_5)
				local var_228_8 = var_228_6 <= 0 and var_228_2 or var_228_2 * (var_228_7 / var_228_6)

				if var_228_8 > 0 and var_228_2 < var_228_8 then
					arg_225_1.talkMaxDuration = var_228_8

					if var_228_8 + var_228_1 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_1
					end
				end

				arg_225_1.text_.text = var_228_5
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361055", "story_v_out_319361.awb") ~= 0 then
					local var_228_9 = manager.audio:GetVoiceLength("story_v_out_319361", "319361055", "story_v_out_319361.awb") / 1000

					if var_228_9 + var_228_1 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_9 + var_228_1
					end

					if var_228_4.prefab_name ~= "" and arg_225_1.actors_[var_228_4.prefab_name] ~= nil then
						local var_228_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_4.prefab_name].transform, "story_v_out_319361", "319361055", "story_v_out_319361.awb")

						arg_225_1:RecordAudio("319361055", var_228_10)
						arg_225_1:RecordAudio("319361055", var_228_10)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_319361", "319361055", "story_v_out_319361.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_319361", "319361055", "story_v_out_319361.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_11 = math.max(var_228_2, arg_225_1.talkMaxDuration)

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_11 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_1) / var_228_11

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_1 + var_228_11 and arg_225_1.time_ < var_228_1 + var_228_11 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play319361056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 319361056
		arg_229_1.duration_ = 10.5

		local var_229_0 = {
			zh = 3.6,
			ja = 10.5
		}
		local var_229_1 = manager.audio:GetLocalizationFlag()

		if var_229_0[var_229_1] ~= nil then
			arg_229_1.duration_ = var_229_0[var_229_1]
		end

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play319361057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 0.375

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_2 = arg_229_1:FormatText(StoryNameCfg[471].name)

				arg_229_1.leftNameTxt_.text = var_232_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_3 = arg_229_1:GetWordFromCfg(319361056)
				local var_232_4 = arg_229_1:FormatText(var_232_3.content)

				arg_229_1.text_.text = var_232_4

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_5 = 15
				local var_232_6 = utf8.len(var_232_4)
				local var_232_7 = var_232_5 <= 0 and var_232_1 or var_232_1 * (var_232_6 / var_232_5)

				if var_232_7 > 0 and var_232_1 < var_232_7 then
					arg_229_1.talkMaxDuration = var_232_7

					if var_232_7 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_7 + var_232_0
					end
				end

				arg_229_1.text_.text = var_232_4
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361056", "story_v_out_319361.awb") ~= 0 then
					local var_232_8 = manager.audio:GetVoiceLength("story_v_out_319361", "319361056", "story_v_out_319361.awb") / 1000

					if var_232_8 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_8 + var_232_0
					end

					if var_232_3.prefab_name ~= "" and arg_229_1.actors_[var_232_3.prefab_name] ~= nil then
						local var_232_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_3.prefab_name].transform, "story_v_out_319361", "319361056", "story_v_out_319361.awb")

						arg_229_1:RecordAudio("319361056", var_232_9)
						arg_229_1:RecordAudio("319361056", var_232_9)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_319361", "319361056", "story_v_out_319361.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_319361", "319361056", "story_v_out_319361.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_10 = math.max(var_232_1, arg_229_1.talkMaxDuration)

			if var_232_0 <= arg_229_1.time_ and arg_229_1.time_ < var_232_0 + var_232_10 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_0) / var_232_10

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_0 + var_232_10 and arg_229_1.time_ < var_232_0 + var_232_10 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play319361057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 319361057
		arg_233_1.duration_ = 8.233

		local var_233_0 = {
			zh = 1.999999999999,
			ja = 8.233
		}
		local var_233_1 = manager.audio:GetLocalizationFlag()

		if var_233_0[var_233_1] ~= nil then
			arg_233_1.duration_ = var_233_0[var_233_1]
		end

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play319361058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10079ui_story"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos10079ui_story = var_236_0.localPosition
			end

			local var_236_2 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2
				local var_236_4 = Vector3.New(0.7, -0.95, -6.05)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos10079ui_story, var_236_4, var_236_3)

				local var_236_5 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_5.x, var_236_5.y, var_236_5.z)

				local var_236_6 = var_236_0.localEulerAngles

				var_236_6.z = 0
				var_236_6.x = 0
				var_236_0.localEulerAngles = var_236_6
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_236_7 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_7.x, var_236_7.y, var_236_7.z)

				local var_236_8 = var_236_0.localEulerAngles

				var_236_8.z = 0
				var_236_8.x = 0
				var_236_0.localEulerAngles = var_236_8
			end

			local var_236_9 = arg_233_1.actors_["10079ui_story"]
			local var_236_10 = 0

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 and arg_233_1.var_.characterEffect10079ui_story == nil then
				arg_233_1.var_.characterEffect10079ui_story = var_236_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_11 = 0.200000002980232

			if var_236_10 <= arg_233_1.time_ and arg_233_1.time_ < var_236_10 + var_236_11 then
				local var_236_12 = (arg_233_1.time_ - var_236_10) / var_236_11

				if arg_233_1.var_.characterEffect10079ui_story then
					arg_233_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_10 + var_236_11 and arg_233_1.time_ < var_236_10 + var_236_11 + arg_236_0 and arg_233_1.var_.characterEffect10079ui_story then
				arg_233_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_236_13 = 0

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_236_14 = 0

			if var_236_14 < arg_233_1.time_ and arg_233_1.time_ <= var_236_14 + arg_236_0 then
				arg_233_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_236_15 = arg_233_1.actors_["1095ui_story"]
			local var_236_16 = 0

			if var_236_16 < arg_233_1.time_ and arg_233_1.time_ <= var_236_16 + arg_236_0 and arg_233_1.var_.characterEffect1095ui_story == nil then
				arg_233_1.var_.characterEffect1095ui_story = var_236_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_17 = 0.200000002980232

			if var_236_16 <= arg_233_1.time_ and arg_233_1.time_ < var_236_16 + var_236_17 then
				local var_236_18 = (arg_233_1.time_ - var_236_16) / var_236_17

				if arg_233_1.var_.characterEffect1095ui_story then
					local var_236_19 = Mathf.Lerp(0, 0.5, var_236_18)

					arg_233_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1095ui_story.fillRatio = var_236_19
				end
			end

			if arg_233_1.time_ >= var_236_16 + var_236_17 and arg_233_1.time_ < var_236_16 + var_236_17 + arg_236_0 and arg_233_1.var_.characterEffect1095ui_story then
				local var_236_20 = 0.5

				arg_233_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1095ui_story.fillRatio = var_236_20
			end

			local var_236_21 = arg_233_1.actors_["1095ui_story"].transform
			local var_236_22 = 0

			if var_236_22 < arg_233_1.time_ and arg_233_1.time_ <= var_236_22 + arg_236_0 then
				arg_233_1.var_.moveOldPos1095ui_story = var_236_21.localPosition
			end

			local var_236_23 = 0.001

			if var_236_22 <= arg_233_1.time_ and arg_233_1.time_ < var_236_22 + var_236_23 then
				local var_236_24 = (arg_233_1.time_ - var_236_22) / var_236_23
				local var_236_25 = Vector3.New(-0.7, -0.98, -6.1)

				var_236_21.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1095ui_story, var_236_25, var_236_24)

				local var_236_26 = manager.ui.mainCamera.transform.position - var_236_21.position

				var_236_21.forward = Vector3.New(var_236_26.x, var_236_26.y, var_236_26.z)

				local var_236_27 = var_236_21.localEulerAngles

				var_236_27.z = 0
				var_236_27.x = 0
				var_236_21.localEulerAngles = var_236_27
			end

			if arg_233_1.time_ >= var_236_22 + var_236_23 and arg_233_1.time_ < var_236_22 + var_236_23 + arg_236_0 then
				var_236_21.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_236_28 = manager.ui.mainCamera.transform.position - var_236_21.position

				var_236_21.forward = Vector3.New(var_236_28.x, var_236_28.y, var_236_28.z)

				local var_236_29 = var_236_21.localEulerAngles

				var_236_29.z = 0
				var_236_29.x = 0
				var_236_21.localEulerAngles = var_236_29
			end

			local var_236_30 = 0
			local var_236_31 = 0.2

			if var_236_30 < arg_233_1.time_ and arg_233_1.time_ <= var_236_30 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_32 = arg_233_1:FormatText(StoryNameCfg[6].name)

				arg_233_1.leftNameTxt_.text = var_236_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_33 = arg_233_1:GetWordFromCfg(319361057)
				local var_236_34 = arg_233_1:FormatText(var_236_33.content)

				arg_233_1.text_.text = var_236_34

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_35 = 8
				local var_236_36 = utf8.len(var_236_34)
				local var_236_37 = var_236_35 <= 0 and var_236_31 or var_236_31 * (var_236_36 / var_236_35)

				if var_236_37 > 0 and var_236_31 < var_236_37 then
					arg_233_1.talkMaxDuration = var_236_37

					if var_236_37 + var_236_30 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_37 + var_236_30
					end
				end

				arg_233_1.text_.text = var_236_34
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361057", "story_v_out_319361.awb") ~= 0 then
					local var_236_38 = manager.audio:GetVoiceLength("story_v_out_319361", "319361057", "story_v_out_319361.awb") / 1000

					if var_236_38 + var_236_30 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_38 + var_236_30
					end

					if var_236_33.prefab_name ~= "" and arg_233_1.actors_[var_236_33.prefab_name] ~= nil then
						local var_236_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_33.prefab_name].transform, "story_v_out_319361", "319361057", "story_v_out_319361.awb")

						arg_233_1:RecordAudio("319361057", var_236_39)
						arg_233_1:RecordAudio("319361057", var_236_39)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_319361", "319361057", "story_v_out_319361.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_319361", "319361057", "story_v_out_319361.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_40 = math.max(var_236_31, arg_233_1.talkMaxDuration)

			if var_236_30 <= arg_233_1.time_ and arg_233_1.time_ < var_236_30 + var_236_40 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_30) / var_236_40

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_30 + var_236_40 and arg_233_1.time_ < var_236_30 + var_236_40 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play319361058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 319361058
		arg_237_1.duration_ = 7.8

		local var_237_0 = {
			zh = 2.333,
			ja = 7.8
		}
		local var_237_1 = manager.audio:GetLocalizationFlag()

		if var_237_0[var_237_1] ~= nil then
			arg_237_1.duration_ = var_237_0[var_237_1]
		end

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play319361059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10079ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect10079ui_story == nil then
				arg_237_1.var_.characterEffect10079ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect10079ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_237_1.var_.characterEffect10079ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect10079ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_237_1.var_.characterEffect10079ui_story.fillRatio = var_240_5
			end

			local var_240_6 = arg_237_1.actors_["1095ui_story"]
			local var_240_7 = 0

			if var_240_7 < arg_237_1.time_ and arg_237_1.time_ <= var_240_7 + arg_240_0 and arg_237_1.var_.characterEffect1095ui_story == nil then
				arg_237_1.var_.characterEffect1095ui_story = var_240_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_8 = 0.200000002980232

			if var_240_7 <= arg_237_1.time_ and arg_237_1.time_ < var_240_7 + var_240_8 then
				local var_240_9 = (arg_237_1.time_ - var_240_7) / var_240_8

				if arg_237_1.var_.characterEffect1095ui_story then
					arg_237_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_7 + var_240_8 and arg_237_1.time_ < var_240_7 + var_240_8 + arg_240_0 and arg_237_1.var_.characterEffect1095ui_story then
				arg_237_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_240_10 = 0

			if var_240_10 < arg_237_1.time_ and arg_237_1.time_ <= var_240_10 + arg_240_0 then
				arg_237_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action5_2")
			end

			local var_240_11 = 0
			local var_240_12 = 0.3

			if var_240_11 < arg_237_1.time_ and arg_237_1.time_ <= var_240_11 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_13 = arg_237_1:FormatText(StoryNameCfg[471].name)

				arg_237_1.leftNameTxt_.text = var_240_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_14 = arg_237_1:GetWordFromCfg(319361058)
				local var_240_15 = arg_237_1:FormatText(var_240_14.content)

				arg_237_1.text_.text = var_240_15

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_16 = 12
				local var_240_17 = utf8.len(var_240_15)
				local var_240_18 = var_240_16 <= 0 and var_240_12 or var_240_12 * (var_240_17 / var_240_16)

				if var_240_18 > 0 and var_240_12 < var_240_18 then
					arg_237_1.talkMaxDuration = var_240_18

					if var_240_18 + var_240_11 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_18 + var_240_11
					end
				end

				arg_237_1.text_.text = var_240_15
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361058", "story_v_out_319361.awb") ~= 0 then
					local var_240_19 = manager.audio:GetVoiceLength("story_v_out_319361", "319361058", "story_v_out_319361.awb") / 1000

					if var_240_19 + var_240_11 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_19 + var_240_11
					end

					if var_240_14.prefab_name ~= "" and arg_237_1.actors_[var_240_14.prefab_name] ~= nil then
						local var_240_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_14.prefab_name].transform, "story_v_out_319361", "319361058", "story_v_out_319361.awb")

						arg_237_1:RecordAudio("319361058", var_240_20)
						arg_237_1:RecordAudio("319361058", var_240_20)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_319361", "319361058", "story_v_out_319361.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_319361", "319361058", "story_v_out_319361.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_21 = math.max(var_240_12, arg_237_1.talkMaxDuration)

			if var_240_11 <= arg_237_1.time_ and arg_237_1.time_ < var_240_11 + var_240_21 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_11) / var_240_21

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_11 + var_240_21 and arg_237_1.time_ < var_240_11 + var_240_21 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play319361059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 319361059
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play319361060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1095ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect1095ui_story == nil then
				arg_241_1.var_.characterEffect1095ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.200000002980232

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect1095ui_story then
					local var_244_4 = Mathf.Lerp(0, 0.5, var_244_3)

					arg_241_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1095ui_story.fillRatio = var_244_4
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1095ui_story then
				local var_244_5 = 0.5

				arg_241_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1095ui_story.fillRatio = var_244_5
			end

			local var_244_6 = 0
			local var_244_7 = 1.125

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_8 = arg_241_1:GetWordFromCfg(319361059)
				local var_244_9 = arg_241_1:FormatText(var_244_8.content)

				arg_241_1.text_.text = var_244_9

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_10 = 45
				local var_244_11 = utf8.len(var_244_9)
				local var_244_12 = var_244_10 <= 0 and var_244_7 or var_244_7 * (var_244_11 / var_244_10)

				if var_244_12 > 0 and var_244_7 < var_244_12 then
					arg_241_1.talkMaxDuration = var_244_12

					if var_244_12 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_12 + var_244_6
					end
				end

				arg_241_1.text_.text = var_244_9
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_13 = math.max(var_244_7, arg_241_1.talkMaxDuration)

			if var_244_6 <= arg_241_1.time_ and arg_241_1.time_ < var_244_6 + var_244_13 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_6) / var_244_13

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_6 + var_244_13 and arg_241_1.time_ < var_244_6 + var_244_13 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play319361060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 319361060
		arg_245_1.duration_ = 6.5

		local var_245_0 = {
			zh = 6.5,
			ja = 6.466
		}
		local var_245_1 = manager.audio:GetLocalizationFlag()

		if var_245_0[var_245_1] ~= nil then
			arg_245_1.duration_ = var_245_0[var_245_1]
		end

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play319361061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1095ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1095ui_story == nil then
				arg_245_1.var_.characterEffect1095ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1095ui_story then
					arg_245_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1095ui_story then
				arg_245_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_248_4 = 0
			local var_248_5 = 0.7

			if var_248_4 < arg_245_1.time_ and arg_245_1.time_ <= var_248_4 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_6 = arg_245_1:FormatText(StoryNameCfg[471].name)

				arg_245_1.leftNameTxt_.text = var_248_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_7 = arg_245_1:GetWordFromCfg(319361060)
				local var_248_8 = arg_245_1:FormatText(var_248_7.content)

				arg_245_1.text_.text = var_248_8

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_9 = 28
				local var_248_10 = utf8.len(var_248_8)
				local var_248_11 = var_248_9 <= 0 and var_248_5 or var_248_5 * (var_248_10 / var_248_9)

				if var_248_11 > 0 and var_248_5 < var_248_11 then
					arg_245_1.talkMaxDuration = var_248_11

					if var_248_11 + var_248_4 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_11 + var_248_4
					end
				end

				arg_245_1.text_.text = var_248_8
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361060", "story_v_out_319361.awb") ~= 0 then
					local var_248_12 = manager.audio:GetVoiceLength("story_v_out_319361", "319361060", "story_v_out_319361.awb") / 1000

					if var_248_12 + var_248_4 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_12 + var_248_4
					end

					if var_248_7.prefab_name ~= "" and arg_245_1.actors_[var_248_7.prefab_name] ~= nil then
						local var_248_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_7.prefab_name].transform, "story_v_out_319361", "319361060", "story_v_out_319361.awb")

						arg_245_1:RecordAudio("319361060", var_248_13)
						arg_245_1:RecordAudio("319361060", var_248_13)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_319361", "319361060", "story_v_out_319361.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_319361", "319361060", "story_v_out_319361.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_14 = math.max(var_248_5, arg_245_1.talkMaxDuration)

			if var_248_4 <= arg_245_1.time_ and arg_245_1.time_ < var_248_4 + var_248_14 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_4) / var_248_14

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_4 + var_248_14 and arg_245_1.time_ < var_248_4 + var_248_14 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play319361061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 319361061
		arg_249_1.duration_ = 2.733

		local var_249_0 = {
			zh = 1.999999999999,
			ja = 2.733
		}
		local var_249_1 = manager.audio:GetLocalizationFlag()

		if var_249_0[var_249_1] ~= nil then
			arg_249_1.duration_ = var_249_0[var_249_1]
		end

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
			arg_249_1.auto_ = false
		end

		function arg_249_1.playNext_(arg_251_0)
			arg_249_1.onStoryFinished_()
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1095ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1095ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1095ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = arg_249_1.actors_["1095ui_story"]
			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 and arg_249_1.var_.characterEffect1095ui_story == nil then
				arg_249_1.var_.characterEffect1095ui_story = var_252_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_11 = 0.200000002980232

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_11 then
				local var_252_12 = (arg_249_1.time_ - var_252_10) / var_252_11

				if arg_249_1.var_.characterEffect1095ui_story then
					arg_249_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_10 + var_252_11 and arg_249_1.time_ < var_252_10 + var_252_11 + arg_252_0 and arg_249_1.var_.characterEffect1095ui_story then
				arg_249_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_252_13 = 0

			if var_252_13 < arg_249_1.time_ and arg_249_1.time_ <= var_252_13 + arg_252_0 then
				arg_249_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 then
				arg_249_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_252_15 = 0
			local var_252_16 = 0.0666666666666667

			if var_252_15 < arg_249_1.time_ and arg_249_1.time_ <= var_252_15 + arg_252_0 then
				local var_252_17 = "play"
				local var_252_18 = "music"

				arg_249_1:AudioAction(var_252_17, var_252_18, "", "", "")
			end

			local var_252_19 = 0
			local var_252_20 = 0.2

			if var_252_19 < arg_249_1.time_ and arg_249_1.time_ <= var_252_19 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_21 = arg_249_1:FormatText(StoryNameCfg[471].name)

				arg_249_1.leftNameTxt_.text = var_252_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_22 = arg_249_1:GetWordFromCfg(319361061)
				local var_252_23 = arg_249_1:FormatText(var_252_22.content)

				arg_249_1.text_.text = var_252_23

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_24 = 8
				local var_252_25 = utf8.len(var_252_23)
				local var_252_26 = var_252_24 <= 0 and var_252_20 or var_252_20 * (var_252_25 / var_252_24)

				if var_252_26 > 0 and var_252_20 < var_252_26 then
					arg_249_1.talkMaxDuration = var_252_26

					if var_252_26 + var_252_19 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_26 + var_252_19
					end
				end

				arg_249_1.text_.text = var_252_23
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319361", "319361061", "story_v_out_319361.awb") ~= 0 then
					local var_252_27 = manager.audio:GetVoiceLength("story_v_out_319361", "319361061", "story_v_out_319361.awb") / 1000

					if var_252_27 + var_252_19 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_27 + var_252_19
					end

					if var_252_22.prefab_name ~= "" and arg_249_1.actors_[var_252_22.prefab_name] ~= nil then
						local var_252_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_22.prefab_name].transform, "story_v_out_319361", "319361061", "story_v_out_319361.awb")

						arg_249_1:RecordAudio("319361061", var_252_28)
						arg_249_1:RecordAudio("319361061", var_252_28)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_319361", "319361061", "story_v_out_319361.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_319361", "319361061", "story_v_out_319361.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_29 = math.max(var_252_20, arg_249_1.talkMaxDuration)

			if var_252_19 <= arg_249_1.time_ and arg_249_1.time_ < var_252_19 + var_252_29 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_19) / var_252_29

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_19 + var_252_29 and arg_249_1.time_ < var_252_19 + var_252_29 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11q",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_319361.awb"
	}
}
