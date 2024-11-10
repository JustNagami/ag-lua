return {
	Play112171001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 112171001
		arg_1_1.duration_ = 4.8

		local var_1_0 = {
			ja = 3.799999999999,
			ko = 4.8,
			zh = 3.866,
			en = 4.133
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
				arg_1_0:Play112171002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "H04"

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
				local var_4_5 = arg_1_1.bgs_.H04

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
					if iter_4_0 ~= "H04" then
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

			local var_4_22 = "1084ui_story"

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

			local var_4_26 = arg_1_1.actors_["1084ui_story"].transform
			local var_4_27 = 1.8

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1084ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(-0.7, -0.97, -6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1084ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = 1.8

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_4_36 = 1.8

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_4_37 = arg_1_1.actors_["1084ui_story"]
			local var_4_38 = 1.8

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story == nil then
				arg_1_1.var_.characterEffect1084ui_story = var_4_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_39 = 0.2

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39

				if arg_1_1.var_.characterEffect1084ui_story then
					arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story then
				arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_4_41 = 0
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 2
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_activity_1_2_1_summer2_story_general", "bgm_activity_1_2_1_summer2_story_general", "bgm_activity_1_2_1_summer2_story_general.awb")
			end

			local var_4_49 = 2
			local var_4_50 = 0.25

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0
				arg_1_1.dialogCg_.alpha = 1

				arg_1_1.dialog_:SetActive(true)
				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_51 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_52 = arg_1_1:GetWordFromCfg(112171001)
				local var_4_53 = arg_1_1:FormatText(var_4_52.content)

				arg_1_1.text_.text = var_4_53

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_54 = 10
				local var_4_55 = utf8.len(var_4_53)
				local var_4_56 = var_4_54 <= 0 and var_4_50 or var_4_50 * (var_4_55 / var_4_54)

				if var_4_56 > 0 and var_4_50 < var_4_56 then
					arg_1_1.talkMaxDuration = var_4_56

					if var_4_56 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_56 + var_4_49
					end
				end

				arg_1_1.text_.text = var_4_53
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171001", "story_v_out_112171.awb") ~= 0 then
					local var_4_57 = manager.audio:GetVoiceLength("story_v_out_112171", "112171001", "story_v_out_112171.awb") / 1000

					if var_4_57 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_49
					end

					if var_4_52.prefab_name ~= "" and arg_1_1.actors_[var_4_52.prefab_name] ~= nil then
						local var_4_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_52.prefab_name].transform, "story_v_out_112171", "112171001", "story_v_out_112171.awb")

						arg_1_1:RecordAudio("112171001", var_4_58)
						arg_1_1:RecordAudio("112171001", var_4_58)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_112171", "112171001", "story_v_out_112171.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_112171", "112171001", "story_v_out_112171.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_59 = math.max(var_4_50, arg_1_1.talkMaxDuration)

			if var_4_49 <= arg_1_1.time_ and arg_1_1.time_ < var_4_49 + var_4_59 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_49) / var_4_59

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_49 + var_4_59 and arg_1_1.time_ < var_4_49 + var_4_59 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play112171002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 112171002
		arg_5_1.duration_ = 7.2

		local var_5_0 = {
			ja = 7.2,
			ko = 4.933,
			zh = 3.533,
			en = 5.166
		}
		local var_5_1 = manager.audio:GetLocalizationFlag()

		if var_5_0[var_5_1] ~= nil then
			arg_5_1.duration_ = var_5_0[var_5_1]
		end

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play112171003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = arg_5_1.actors_["1084ui_story"]
			local var_8_1 = 0

			if var_8_1 < arg_5_1.time_ and arg_5_1.time_ <= var_8_1 + arg_8_0 and arg_5_1.var_.characterEffect1084ui_story == nil then
				arg_5_1.var_.characterEffect1084ui_story = var_8_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_2 = 0.2

			if var_8_1 <= arg_5_1.time_ and arg_5_1.time_ < var_8_1 + var_8_2 then
				local var_8_3 = (arg_5_1.time_ - var_8_1) / var_8_2

				if arg_5_1.var_.characterEffect1084ui_story then
					local var_8_4 = Mathf.Lerp(0, 0.5, var_8_3)

					arg_5_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_5_1.var_.characterEffect1084ui_story.fillRatio = var_8_4
				end
			end

			if arg_5_1.time_ >= var_8_1 + var_8_2 and arg_5_1.time_ < var_8_1 + var_8_2 + arg_8_0 and arg_5_1.var_.characterEffect1084ui_story then
				local var_8_5 = 0.5

				arg_5_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_5_1.var_.characterEffect1084ui_story.fillRatio = var_8_5
			end

			local var_8_6 = "1148ui_story"

			if arg_5_1.actors_[var_8_6] == nil then
				local var_8_7 = Object.Instantiate(Asset.Load("Char/" .. var_8_6), arg_5_1.stage_.transform)

				var_8_7.name = var_8_6
				var_8_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_5_1.actors_[var_8_6] = var_8_7

				local var_8_8 = var_8_7:GetComponentInChildren(typeof(CharacterEffect))

				var_8_8.enabled = true

				local var_8_9 = GameObjectTools.GetOrAddComponent(var_8_7, typeof(DynamicBoneHelper))

				if var_8_9 then
					var_8_9:EnableDynamicBone(false)
				end

				arg_5_1:ShowWeapon(var_8_8.transform, false)

				arg_5_1.var_[var_8_6 .. "Animator"] = var_8_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_5_1.var_[var_8_6 .. "Animator"].applyRootMotion = true
				arg_5_1.var_[var_8_6 .. "LipSync"] = var_8_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_8_10 = arg_5_1.actors_["1148ui_story"].transform
			local var_8_11 = 0

			if var_8_11 < arg_5_1.time_ and arg_5_1.time_ <= var_8_11 + arg_8_0 then
				arg_5_1.var_.moveOldPos1148ui_story = var_8_10.localPosition
			end

			local var_8_12 = 0.001

			if var_8_11 <= arg_5_1.time_ and arg_5_1.time_ < var_8_11 + var_8_12 then
				local var_8_13 = (arg_5_1.time_ - var_8_11) / var_8_12
				local var_8_14 = Vector3.New(0.7, -0.8, -6.2)

				var_8_10.localPosition = Vector3.Lerp(arg_5_1.var_.moveOldPos1148ui_story, var_8_14, var_8_13)

				local var_8_15 = manager.ui.mainCamera.transform.position - var_8_10.position

				var_8_10.forward = Vector3.New(var_8_15.x, var_8_15.y, var_8_15.z)

				local var_8_16 = var_8_10.localEulerAngles

				var_8_16.z = 0
				var_8_16.x = 0
				var_8_10.localEulerAngles = var_8_16
			end

			if arg_5_1.time_ >= var_8_11 + var_8_12 and arg_5_1.time_ < var_8_11 + var_8_12 + arg_8_0 then
				var_8_10.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_8_17 = manager.ui.mainCamera.transform.position - var_8_10.position

				var_8_10.forward = Vector3.New(var_8_17.x, var_8_17.y, var_8_17.z)

				local var_8_18 = var_8_10.localEulerAngles

				var_8_18.z = 0
				var_8_18.x = 0
				var_8_10.localEulerAngles = var_8_18
			end

			local var_8_19 = 0

			if var_8_19 < arg_5_1.time_ and arg_5_1.time_ <= var_8_19 + arg_8_0 then
				arg_5_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action9_1")
			end

			local var_8_20 = 0

			if var_8_20 < arg_5_1.time_ and arg_5_1.time_ <= var_8_20 + arg_8_0 then
				arg_5_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_8_21 = arg_5_1.actors_["1148ui_story"]
			local var_8_22 = 0

			if var_8_22 < arg_5_1.time_ and arg_5_1.time_ <= var_8_22 + arg_8_0 and arg_5_1.var_.characterEffect1148ui_story == nil then
				arg_5_1.var_.characterEffect1148ui_story = var_8_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_23 = 0.2

			if var_8_22 <= arg_5_1.time_ and arg_5_1.time_ < var_8_22 + var_8_23 then
				local var_8_24 = (arg_5_1.time_ - var_8_22) / var_8_23

				if arg_5_1.var_.characterEffect1148ui_story then
					arg_5_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_5_1.time_ >= var_8_22 + var_8_23 and arg_5_1.time_ < var_8_22 + var_8_23 + arg_8_0 and arg_5_1.var_.characterEffect1148ui_story then
				arg_5_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_8_25 = 0
			local var_8_26 = 0.525

			if var_8_25 < arg_5_1.time_ and arg_5_1.time_ <= var_8_25 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0
				arg_5_1.dialogCg_.alpha = 1

				arg_5_1.dialog_:SetActive(true)
				SetActive(arg_5_1.leftNameGo_, true)

				local var_8_27 = arg_5_1:FormatText(StoryNameCfg[8].name)

				arg_5_1.leftNameTxt_.text = var_8_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_1.leftNameTxt_.transform)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1.leftNameTxt_.text)
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_28 = arg_5_1:GetWordFromCfg(112171002)
				local var_8_29 = arg_5_1:FormatText(var_8_28.content)

				arg_5_1.text_.text = var_8_29

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_30 = 21
				local var_8_31 = utf8.len(var_8_29)
				local var_8_32 = var_8_30 <= 0 and var_8_26 or var_8_26 * (var_8_31 / var_8_30)

				if var_8_32 > 0 and var_8_26 < var_8_32 then
					arg_5_1.talkMaxDuration = var_8_32

					if var_8_32 + var_8_25 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_32 + var_8_25
					end
				end

				arg_5_1.text_.text = var_8_29
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171002", "story_v_out_112171.awb") ~= 0 then
					local var_8_33 = manager.audio:GetVoiceLength("story_v_out_112171", "112171002", "story_v_out_112171.awb") / 1000

					if var_8_33 + var_8_25 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_33 + var_8_25
					end

					if var_8_28.prefab_name ~= "" and arg_5_1.actors_[var_8_28.prefab_name] ~= nil then
						local var_8_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_5_1.actors_[var_8_28.prefab_name].transform, "story_v_out_112171", "112171002", "story_v_out_112171.awb")

						arg_5_1:RecordAudio("112171002", var_8_34)
						arg_5_1:RecordAudio("112171002", var_8_34)
					else
						arg_5_1:AudioAction("play", "voice", "story_v_out_112171", "112171002", "story_v_out_112171.awb")
					end

					arg_5_1:RecordHistoryTalkVoice("story_v_out_112171", "112171002", "story_v_out_112171.awb")
				end

				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_35 = math.max(var_8_26, arg_5_1.talkMaxDuration)

			if var_8_25 <= arg_5_1.time_ and arg_5_1.time_ < var_8_25 + var_8_35 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_25) / var_8_35

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_25 + var_8_35 and arg_5_1.time_ < var_8_25 + var_8_35 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play112171003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 112171003
		arg_9_1.duration_ = 3.9

		local var_9_0 = {
			ja = 3.9,
			ko = 2.8,
			zh = 2.633,
			en = 3.7
		}
		local var_9_1 = manager.audio:GetLocalizationFlag()

		if var_9_0[var_9_1] ~= nil then
			arg_9_1.duration_ = var_9_0[var_9_1]
		end

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play112171004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = arg_9_1.actors_["1148ui_story"].transform
			local var_12_1 = 0

			if var_12_1 < arg_9_1.time_ and arg_9_1.time_ <= var_12_1 + arg_12_0 then
				arg_9_1.var_.moveOldPos1148ui_story = var_12_0.localPosition
			end

			local var_12_2 = 0.001

			if var_12_1 <= arg_9_1.time_ and arg_9_1.time_ < var_12_1 + var_12_2 then
				local var_12_3 = (arg_9_1.time_ - var_12_1) / var_12_2
				local var_12_4 = Vector3.New(0, 100, 0)

				var_12_0.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos1148ui_story, var_12_4, var_12_3)

				local var_12_5 = manager.ui.mainCamera.transform.position - var_12_0.position

				var_12_0.forward = Vector3.New(var_12_5.x, var_12_5.y, var_12_5.z)

				local var_12_6 = var_12_0.localEulerAngles

				var_12_6.z = 0
				var_12_6.x = 0
				var_12_0.localEulerAngles = var_12_6
			end

			if arg_9_1.time_ >= var_12_1 + var_12_2 and arg_9_1.time_ < var_12_1 + var_12_2 + arg_12_0 then
				var_12_0.localPosition = Vector3.New(0, 100, 0)

				local var_12_7 = manager.ui.mainCamera.transform.position - var_12_0.position

				var_12_0.forward = Vector3.New(var_12_7.x, var_12_7.y, var_12_7.z)

				local var_12_8 = var_12_0.localEulerAngles

				var_12_8.z = 0
				var_12_8.x = 0
				var_12_0.localEulerAngles = var_12_8
			end

			local var_12_9 = arg_9_1.actors_["1084ui_story"].transform
			local var_12_10 = 0

			if var_12_10 < arg_9_1.time_ and arg_9_1.time_ <= var_12_10 + arg_12_0 then
				arg_9_1.var_.moveOldPos1084ui_story = var_12_9.localPosition
			end

			local var_12_11 = 0.001

			if var_12_10 <= arg_9_1.time_ and arg_9_1.time_ < var_12_10 + var_12_11 then
				local var_12_12 = (arg_9_1.time_ - var_12_10) / var_12_11
				local var_12_13 = Vector3.New(0, 100, 0)

				var_12_9.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos1084ui_story, var_12_13, var_12_12)

				local var_12_14 = manager.ui.mainCamera.transform.position - var_12_9.position

				var_12_9.forward = Vector3.New(var_12_14.x, var_12_14.y, var_12_14.z)

				local var_12_15 = var_12_9.localEulerAngles

				var_12_15.z = 0
				var_12_15.x = 0
				var_12_9.localEulerAngles = var_12_15
			end

			if arg_9_1.time_ >= var_12_10 + var_12_11 and arg_9_1.time_ < var_12_10 + var_12_11 + arg_12_0 then
				var_12_9.localPosition = Vector3.New(0, 100, 0)

				local var_12_16 = manager.ui.mainCamera.transform.position - var_12_9.position

				var_12_9.forward = Vector3.New(var_12_16.x, var_12_16.y, var_12_16.z)

				local var_12_17 = var_12_9.localEulerAngles

				var_12_17.z = 0
				var_12_17.x = 0
				var_12_9.localEulerAngles = var_12_17
			end

			local var_12_18 = "1081ui_story"

			if arg_9_1.actors_[var_12_18] == nil then
				local var_12_19 = Object.Instantiate(Asset.Load("Char/" .. var_12_18), arg_9_1.stage_.transform)

				var_12_19.name = var_12_18
				var_12_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_9_1.actors_[var_12_18] = var_12_19

				local var_12_20 = var_12_19:GetComponentInChildren(typeof(CharacterEffect))

				var_12_20.enabled = true

				local var_12_21 = GameObjectTools.GetOrAddComponent(var_12_19, typeof(DynamicBoneHelper))

				if var_12_21 then
					var_12_21:EnableDynamicBone(false)
				end

				arg_9_1:ShowWeapon(var_12_20.transform, false)

				arg_9_1.var_[var_12_18 .. "Animator"] = var_12_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_9_1.var_[var_12_18 .. "Animator"].applyRootMotion = true
				arg_9_1.var_[var_12_18 .. "LipSync"] = var_12_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_12_22 = arg_9_1.actors_["1081ui_story"].transform
			local var_12_23 = 0

			if var_12_23 < arg_9_1.time_ and arg_9_1.time_ <= var_12_23 + arg_12_0 then
				arg_9_1.var_.moveOldPos1081ui_story = var_12_22.localPosition
			end

			local var_12_24 = 0.001

			if var_12_23 <= arg_9_1.time_ and arg_9_1.time_ < var_12_23 + var_12_24 then
				local var_12_25 = (arg_9_1.time_ - var_12_23) / var_12_24
				local var_12_26 = Vector3.New(0, -0.92, -5.8)

				var_12_22.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos1081ui_story, var_12_26, var_12_25)

				local var_12_27 = manager.ui.mainCamera.transform.position - var_12_22.position

				var_12_22.forward = Vector3.New(var_12_27.x, var_12_27.y, var_12_27.z)

				local var_12_28 = var_12_22.localEulerAngles

				var_12_28.z = 0
				var_12_28.x = 0
				var_12_22.localEulerAngles = var_12_28
			end

			if arg_9_1.time_ >= var_12_23 + var_12_24 and arg_9_1.time_ < var_12_23 + var_12_24 + arg_12_0 then
				var_12_22.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_12_29 = manager.ui.mainCamera.transform.position - var_12_22.position

				var_12_22.forward = Vector3.New(var_12_29.x, var_12_29.y, var_12_29.z)

				local var_12_30 = var_12_22.localEulerAngles

				var_12_30.z = 0
				var_12_30.x = 0
				var_12_22.localEulerAngles = var_12_30
			end

			local var_12_31 = 0

			if var_12_31 < arg_9_1.time_ and arg_9_1.time_ <= var_12_31 + arg_12_0 then
				arg_9_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_12_32 = 0

			if var_12_32 < arg_9_1.time_ and arg_9_1.time_ <= var_12_32 + arg_12_0 then
				arg_9_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_12_33 = arg_9_1.actors_["1081ui_story"]
			local var_12_34 = 0

			if var_12_34 < arg_9_1.time_ and arg_9_1.time_ <= var_12_34 + arg_12_0 and arg_9_1.var_.characterEffect1081ui_story == nil then
				arg_9_1.var_.characterEffect1081ui_story = var_12_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_35 = 0.2

			if var_12_34 <= arg_9_1.time_ and arg_9_1.time_ < var_12_34 + var_12_35 then
				local var_12_36 = (arg_9_1.time_ - var_12_34) / var_12_35

				if arg_9_1.var_.characterEffect1081ui_story then
					arg_9_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_9_1.time_ >= var_12_34 + var_12_35 and arg_9_1.time_ < var_12_34 + var_12_35 + arg_12_0 and arg_9_1.var_.characterEffect1081ui_story then
				arg_9_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_12_37 = 0
			local var_12_38 = 0.35

			if var_12_37 < arg_9_1.time_ and arg_9_1.time_ <= var_12_37 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_39 = arg_9_1:FormatText(StoryNameCfg[202].name)

				arg_9_1.leftNameTxt_.text = var_12_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_40 = arg_9_1:GetWordFromCfg(112171003)
				local var_12_41 = arg_9_1:FormatText(var_12_40.content)

				arg_9_1.text_.text = var_12_41

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_42 = 14
				local var_12_43 = utf8.len(var_12_41)
				local var_12_44 = var_12_42 <= 0 and var_12_38 or var_12_38 * (var_12_43 / var_12_42)

				if var_12_44 > 0 and var_12_38 < var_12_44 then
					arg_9_1.talkMaxDuration = var_12_44

					if var_12_44 + var_12_37 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_44 + var_12_37
					end
				end

				arg_9_1.text_.text = var_12_41
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171003", "story_v_out_112171.awb") ~= 0 then
					local var_12_45 = manager.audio:GetVoiceLength("story_v_out_112171", "112171003", "story_v_out_112171.awb") / 1000

					if var_12_45 + var_12_37 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_45 + var_12_37
					end

					if var_12_40.prefab_name ~= "" and arg_9_1.actors_[var_12_40.prefab_name] ~= nil then
						local var_12_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_40.prefab_name].transform, "story_v_out_112171", "112171003", "story_v_out_112171.awb")

						arg_9_1:RecordAudio("112171003", var_12_46)
						arg_9_1:RecordAudio("112171003", var_12_46)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_112171", "112171003", "story_v_out_112171.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_112171", "112171003", "story_v_out_112171.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_47 = math.max(var_12_38, arg_9_1.talkMaxDuration)

			if var_12_37 <= arg_9_1.time_ and arg_9_1.time_ < var_12_37 + var_12_47 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_37) / var_12_47

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_37 + var_12_47 and arg_9_1.time_ < var_12_37 + var_12_47 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play112171004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 112171004
		arg_13_1.duration_ = 5

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play112171005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["1081ui_story"].transform
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 then
				arg_13_1.var_.moveOldPos1081ui_story = var_16_0.localPosition
			end

			local var_16_2 = 0.001

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2
				local var_16_4 = Vector3.New(0, 100, 0)

				var_16_0.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos1081ui_story, var_16_4, var_16_3)

				local var_16_5 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_5.x, var_16_5.y, var_16_5.z)

				local var_16_6 = var_16_0.localEulerAngles

				var_16_6.z = 0
				var_16_6.x = 0
				var_16_0.localEulerAngles = var_16_6
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 then
				var_16_0.localPosition = Vector3.New(0, 100, 0)

				local var_16_7 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_7.x, var_16_7.y, var_16_7.z)

				local var_16_8 = var_16_0.localEulerAngles

				var_16_8.z = 0
				var_16_8.x = 0
				var_16_0.localEulerAngles = var_16_8
			end

			local var_16_9 = 0
			local var_16_10 = 0.8

			if var_16_9 < arg_13_1.time_ and arg_13_1.time_ <= var_16_9 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, false)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_11 = arg_13_1:GetWordFromCfg(112171004)
				local var_16_12 = arg_13_1:FormatText(var_16_11.content)

				arg_13_1.text_.text = var_16_12

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_13 = 32
				local var_16_14 = utf8.len(var_16_12)
				local var_16_15 = var_16_13 <= 0 and var_16_10 or var_16_10 * (var_16_14 / var_16_13)

				if var_16_15 > 0 and var_16_10 < var_16_15 then
					arg_13_1.talkMaxDuration = var_16_15

					if var_16_15 + var_16_9 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_15 + var_16_9
					end
				end

				arg_13_1.text_.text = var_16_12
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_16 = math.max(var_16_10, arg_13_1.talkMaxDuration)

			if var_16_9 <= arg_13_1.time_ and arg_13_1.time_ < var_16_9 + var_16_16 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_9) / var_16_16

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_9 + var_16_16 and arg_13_1.time_ < var_16_9 + var_16_16 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play112171005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 112171005
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play112171006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.65

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_2 = arg_17_1:GetWordFromCfg(112171005)
				local var_20_3 = arg_17_1:FormatText(var_20_2.content)

				arg_17_1.text_.text = var_20_3

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_4 = 26
				local var_20_5 = utf8.len(var_20_3)
				local var_20_6 = var_20_4 <= 0 and var_20_1 or var_20_1 * (var_20_5 / var_20_4)

				if var_20_6 > 0 and var_20_1 < var_20_6 then
					arg_17_1.talkMaxDuration = var_20_6

					if var_20_6 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_6 + var_20_0
					end
				end

				arg_17_1.text_.text = var_20_3
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_7 = math.max(var_20_1, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_7 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_0) / var_20_7

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_7 and arg_17_1.time_ < var_20_0 + var_20_7 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play112171006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 112171006
		arg_21_1.duration_ = 2.6

		local var_21_0 = {
			ja = 2.6,
			ko = 2.266,
			zh = 2.3,
			en = 2.566
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play112171007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.175

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_2 = arg_21_1:FormatText(StoryNameCfg[202].name)

				arg_21_1.leftNameTxt_.text = var_24_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, true)
				arg_21_1.iconController_:SetSelectedState("hero")

				arg_21_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1081")

				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_3 = arg_21_1:GetWordFromCfg(112171006)
				local var_24_4 = arg_21_1:FormatText(var_24_3.content)

				arg_21_1.text_.text = var_24_4

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_5 = 7
				local var_24_6 = utf8.len(var_24_4)
				local var_24_7 = var_24_5 <= 0 and var_24_1 or var_24_1 * (var_24_6 / var_24_5)

				if var_24_7 > 0 and var_24_1 < var_24_7 then
					arg_21_1.talkMaxDuration = var_24_7

					if var_24_7 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_7 + var_24_0
					end
				end

				arg_21_1.text_.text = var_24_4
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171006", "story_v_out_112171.awb") ~= 0 then
					local var_24_8 = manager.audio:GetVoiceLength("story_v_out_112171", "112171006", "story_v_out_112171.awb") / 1000

					if var_24_8 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_8 + var_24_0
					end

					if var_24_3.prefab_name ~= "" and arg_21_1.actors_[var_24_3.prefab_name] ~= nil then
						local var_24_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_3.prefab_name].transform, "story_v_out_112171", "112171006", "story_v_out_112171.awb")

						arg_21_1:RecordAudio("112171006", var_24_9)
						arg_21_1:RecordAudio("112171006", var_24_9)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_112171", "112171006", "story_v_out_112171.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_112171", "112171006", "story_v_out_112171.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_10 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_10 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_10

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_10 and arg_21_1.time_ < var_24_0 + var_24_10 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play112171007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 112171007
		arg_25_1.duration_ = 7.6

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play112171008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = manager.ui.mainCamera.transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.shakeOldPos = var_28_0.localPosition
			end

			local var_28_2 = 1

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / 0.066
				local var_28_4, var_28_5 = math.modf(var_28_3)

				var_28_0.localPosition = Vector3.New(var_28_5 * 0.13, var_28_5 * 0.13, var_28_5 * 0.13) + arg_25_1.var_.shakeOldPos
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 then
				var_28_0.localPosition = arg_25_1.var_.shakeOldPos
			end

			local var_28_6 = arg_25_1.bgs_.H04
			local var_28_7 = 0

			if var_28_7 < arg_25_1.time_ and arg_25_1.time_ <= var_28_7 + arg_28_0 then
				local var_28_8 = var_28_6:GetComponent("SpriteRenderer")

				if var_28_8 then
					var_28_8.material = arg_25_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_28_9 = var_28_8.material
					local var_28_10 = var_28_9:GetColor("_Color")

					arg_25_1.var_.alphaOldValueH04 = var_28_10.a
					arg_25_1.var_.alphaMatValueH04 = var_28_9
				end

				arg_25_1.var_.alphaOldValueH04 = 1
			end

			local var_28_11 = 2

			if var_28_7 <= arg_25_1.time_ and arg_25_1.time_ < var_28_7 + var_28_11 then
				local var_28_12 = (arg_25_1.time_ - var_28_7) / var_28_11
				local var_28_13 = Mathf.Lerp(arg_25_1.var_.alphaOldValueH04, 0, var_28_12)

				if arg_25_1.var_.alphaMatValueH04 then
					local var_28_14 = arg_25_1.var_.alphaMatValueH04
					local var_28_15 = var_28_14:GetColor("_Color")

					var_28_15.a = var_28_13

					var_28_14:SetColor("_Color", var_28_15)
				end
			end

			if arg_25_1.time_ >= var_28_7 + var_28_11 and arg_25_1.time_ < var_28_7 + var_28_11 + arg_28_0 and arg_25_1.var_.alphaMatValueH04 then
				local var_28_16 = arg_25_1.var_.alphaMatValueH04
				local var_28_17 = var_28_16:GetColor("_Color")

				var_28_17.a = 0

				var_28_16:SetColor("_Color", var_28_17)
			end

			local var_28_18 = 0

			if var_28_18 < arg_25_1.time_ and arg_25_1.time_ <= var_28_18 + arg_28_0 then
				arg_25_1.allBtn_.enabled = false
			end

			local var_28_19 = 2.6

			if arg_25_1.time_ >= var_28_18 + var_28_19 and arg_25_1.time_ < var_28_18 + var_28_19 + arg_28_0 then
				arg_25_1.allBtn_.enabled = true
			end

			local var_28_20 = 0
			local var_28_21 = 1.1

			if var_28_20 < arg_25_1.time_ and arg_25_1.time_ <= var_28_20 + arg_28_0 then
				local var_28_22 = "play"
				local var_28_23 = "effect"

				arg_25_1:AudioAction(var_28_22, var_28_23, "se_story_activity_1_2_1", "se_story_activity_1_2_1_huge_waves02", "")
			end

			if arg_25_1.frameCnt_ <= 1 then
				arg_25_1.dialog_:SetActive(false)
			end

			local var_28_24 = 2.6
			local var_28_25 = 0.475

			if var_28_24 < arg_25_1.time_ and arg_25_1.time_ <= var_28_24 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0

				arg_25_1.dialog_:SetActive(true)

				local var_28_26 = LeanTween.value(arg_25_1.dialog_, 0, 1, 0.3)

				var_28_26:setOnUpdate(LuaHelper.FloatAction(function(arg_29_0)
					arg_25_1.dialogCg_.alpha = arg_29_0
				end))
				var_28_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_25_1.dialog_)
					var_28_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_25_1.duration_ = arg_25_1.duration_ + 0.3

				SetActive(arg_25_1.leftNameGo_, false)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_27 = arg_25_1:GetWordFromCfg(112171007)
				local var_28_28 = arg_25_1:FormatText(var_28_27.content)

				arg_25_1.text_.text = var_28_28

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_29 = 19
				local var_28_30 = utf8.len(var_28_28)
				local var_28_31 = var_28_29 <= 0 and var_28_25 or var_28_25 * (var_28_30 / var_28_29)

				if var_28_31 > 0 and var_28_25 < var_28_31 then
					arg_25_1.talkMaxDuration = var_28_31
					var_28_24 = var_28_24 + 0.3

					if var_28_31 + var_28_24 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_31 + var_28_24
					end
				end

				arg_25_1.text_.text = var_28_28
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_32 = var_28_24 + 0.3
			local var_28_33 = math.max(var_28_25, arg_25_1.talkMaxDuration)

			if var_28_32 <= arg_25_1.time_ and arg_25_1.time_ < var_28_32 + var_28_33 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_32) / var_28_33

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_32 + var_28_33 and arg_25_1.time_ < var_28_32 + var_28_33 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play112171008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 112171008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play112171009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				local var_34_2 = "play"
				local var_34_3 = "effect"

				arg_31_1:AudioAction(var_34_2, var_34_3, "se_story_activity_1_2_1", "se_story_activity_1_2_1_whale", "")
			end

			local var_34_4 = 0
			local var_34_5 = 1.125

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_6 = arg_31_1:GetWordFromCfg(112171008)
				local var_34_7 = arg_31_1:FormatText(var_34_6.content)

				arg_31_1.text_.text = var_34_7

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_8 = 45
				local var_34_9 = utf8.len(var_34_7)
				local var_34_10 = var_34_8 <= 0 and var_34_5 or var_34_5 * (var_34_9 / var_34_8)

				if var_34_10 > 0 and var_34_5 < var_34_10 then
					arg_31_1.talkMaxDuration = var_34_10

					if var_34_10 + var_34_4 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_10 + var_34_4
					end
				end

				arg_31_1.text_.text = var_34_7
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_11 = math.max(var_34_5, arg_31_1.talkMaxDuration)

			if var_34_4 <= arg_31_1.time_ and arg_31_1.time_ < var_34_4 + var_34_11 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_4) / var_34_11

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_4 + var_34_11 and arg_31_1.time_ < var_34_4 + var_34_11 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play112171009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 112171009
		arg_35_1.duration_ = 7

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play112171010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "SA0108"

			if arg_35_1.bgs_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(arg_35_1.paintGo_)

				var_38_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_38_0)
				var_38_1.name = var_38_0
				var_38_1.transform.parent = arg_35_1.stage_.transform
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.bgs_[var_38_0] = var_38_1
			end

			local var_38_2 = 0

			if var_38_2 < arg_35_1.time_ and arg_35_1.time_ <= var_38_2 + arg_38_0 then
				local var_38_3 = manager.ui.mainCamera.transform.localPosition
				local var_38_4 = Vector3.New(0, 0, 10) + Vector3.New(var_38_3.x, var_38_3.y, 0)
				local var_38_5 = arg_35_1.bgs_.SA0108

				var_38_5.transform.localPosition = var_38_4
				var_38_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_38_6 = var_38_5:GetComponent("SpriteRenderer")

				if var_38_6 and var_38_6.sprite then
					local var_38_7 = (var_38_5.transform.localPosition - var_38_3).z
					local var_38_8 = manager.ui.mainCameraCom_
					local var_38_9 = 2 * var_38_7 * Mathf.Tan(var_38_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_38_10 = var_38_9 * var_38_8.aspect
					local var_38_11 = var_38_6.sprite.bounds.size.x
					local var_38_12 = var_38_6.sprite.bounds.size.y
					local var_38_13 = var_38_10 / var_38_11
					local var_38_14 = var_38_9 / var_38_12
					local var_38_15 = var_38_14 < var_38_13 and var_38_13 or var_38_14

					var_38_5.transform.localScale = Vector3.New(var_38_15, var_38_15, 0)
				end

				for iter_38_0, iter_38_1 in pairs(arg_35_1.bgs_) do
					if iter_38_0 ~= "SA0108" then
						iter_38_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_17 = 2

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17
				local var_38_19 = Color.New(1, 1, 1)

				var_38_19.a = Mathf.Lerp(1, 0, var_38_18)
				arg_35_1.mask_.color = var_38_19
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 then
				local var_38_20 = Color.New(1, 1, 1)
				local var_38_21 = 0

				arg_35_1.mask_.enabled = false
				var_38_20.a = var_38_21
				arg_35_1.mask_.color = var_38_20
			end

			local var_38_22 = arg_35_1.bgs_.H04
			local var_38_23 = 0

			if var_38_23 < arg_35_1.time_ and arg_35_1.time_ <= var_38_23 + arg_38_0 then
				local var_38_24 = var_38_22:GetComponent("SpriteRenderer")

				if var_38_24 then
					var_38_24.material = arg_35_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_38_25 = var_38_24.material
					local var_38_26 = var_38_25:GetColor("_Color")

					arg_35_1.var_.alphaOldValueH04 = var_38_26.a
					arg_35_1.var_.alphaMatValueH04 = var_38_25
				end

				arg_35_1.var_.alphaOldValueH04 = 0
			end

			local var_38_27 = 0.0166666666666667

			if var_38_23 <= arg_35_1.time_ and arg_35_1.time_ < var_38_23 + var_38_27 then
				local var_38_28 = (arg_35_1.time_ - var_38_23) / var_38_27
				local var_38_29 = Mathf.Lerp(arg_35_1.var_.alphaOldValueH04, 1, var_38_28)

				if arg_35_1.var_.alphaMatValueH04 then
					local var_38_30 = arg_35_1.var_.alphaMatValueH04
					local var_38_31 = var_38_30:GetColor("_Color")

					var_38_31.a = var_38_29

					var_38_30:SetColor("_Color", var_38_31)
				end
			end

			if arg_35_1.time_ >= var_38_23 + var_38_27 and arg_35_1.time_ < var_38_23 + var_38_27 + arg_38_0 and arg_35_1.var_.alphaMatValueH04 then
				local var_38_32 = arg_35_1.var_.alphaMatValueH04
				local var_38_33 = var_38_32:GetColor("_Color")

				var_38_33.a = 1

				var_38_32:SetColor("_Color", var_38_33)
			end

			if arg_35_1.frameCnt_ <= 1 then
				arg_35_1.dialog_:SetActive(false)
			end

			local var_38_34 = 2
			local var_38_35 = 0.625

			if var_38_34 < arg_35_1.time_ and arg_35_1.time_ <= var_38_34 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				arg_35_1.dialog_:SetActive(true)

				local var_38_36 = LeanTween.value(arg_35_1.dialog_, 0, 1, 0.3)

				var_38_36:setOnUpdate(LuaHelper.FloatAction(function(arg_39_0)
					arg_35_1.dialogCg_.alpha = arg_39_0
				end))
				var_38_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_35_1.dialog_)
					var_38_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_35_1.duration_ = arg_35_1.duration_ + 0.3

				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_37 = arg_35_1:GetWordFromCfg(112171009)
				local var_38_38 = arg_35_1:FormatText(var_38_37.content)

				arg_35_1.text_.text = var_38_38

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_39 = 25
				local var_38_40 = utf8.len(var_38_38)
				local var_38_41 = var_38_39 <= 0 and var_38_35 or var_38_35 * (var_38_40 / var_38_39)

				if var_38_41 > 0 and var_38_35 < var_38_41 then
					arg_35_1.talkMaxDuration = var_38_41
					var_38_34 = var_38_34 + 0.3

					if var_38_41 + var_38_34 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_41 + var_38_34
					end
				end

				arg_35_1.text_.text = var_38_38
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_42 = var_38_34 + 0.3
			local var_38_43 = math.max(var_38_35, arg_35_1.talkMaxDuration)

			if var_38_42 <= arg_35_1.time_ and arg_35_1.time_ < var_38_42 + var_38_43 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_42) / var_38_43

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_42 + var_38_43 and arg_35_1.time_ < var_38_42 + var_38_43 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play112171010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 112171010
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play112171011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.925

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_2 = arg_41_1:GetWordFromCfg(112171010)
				local var_44_3 = arg_41_1:FormatText(var_44_2.content)

				arg_41_1.text_.text = var_44_3

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_4 = 37
				local var_44_5 = utf8.len(var_44_3)
				local var_44_6 = var_44_4 <= 0 and var_44_1 or var_44_1 * (var_44_5 / var_44_4)

				if var_44_6 > 0 and var_44_1 < var_44_6 then
					arg_41_1.talkMaxDuration = var_44_6

					if var_44_6 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_6 + var_44_0
					end
				end

				arg_41_1.text_.text = var_44_3
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_7 = math.max(var_44_1, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_7 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_0) / var_44_7

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_7 and arg_41_1.time_ < var_44_0 + var_44_7 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play112171011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 112171011
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play112171012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 0.825

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				local var_48_2 = "play"
				local var_48_3 = "effect"

				arg_45_1:AudioAction(var_48_2, var_48_3, "se_story_activity_1_2_1", "se_story_activity_1_2_1_huge_waves03", "")
			end

			local var_48_4 = 0
			local var_48_5 = 0.825

			if var_48_4 < arg_45_1.time_ and arg_45_1.time_ <= var_48_4 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_6 = arg_45_1:GetWordFromCfg(112171011)
				local var_48_7 = arg_45_1:FormatText(var_48_6.content)

				arg_45_1.text_.text = var_48_7

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_8 = 33
				local var_48_9 = utf8.len(var_48_7)
				local var_48_10 = var_48_8 <= 0 and var_48_5 or var_48_5 * (var_48_9 / var_48_8)

				if var_48_10 > 0 and var_48_5 < var_48_10 then
					arg_45_1.talkMaxDuration = var_48_10

					if var_48_10 + var_48_4 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_10 + var_48_4
					end
				end

				arg_45_1.text_.text = var_48_7
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_11 = math.max(var_48_5, arg_45_1.talkMaxDuration)

			if var_48_4 <= arg_45_1.time_ and arg_45_1.time_ < var_48_4 + var_48_11 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_4) / var_48_11

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_4 + var_48_11 and arg_45_1.time_ < var_48_4 + var_48_11 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play112171012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 112171012
		arg_49_1.duration_ = 3.566

		local var_49_0 = {
			ja = 3.566,
			ko = 3.366,
			zh = 1.933,
			en = 2.8
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
				arg_49_0:Play112171013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0
			local var_52_1 = 0.175

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_2 = arg_49_1:FormatText(StoryNameCfg[56].name)

				arg_49_1.leftNameTxt_.text = var_52_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, true)
				arg_49_1.iconController_:SetSelectedState("hero")

				arg_49_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1127")

				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_3 = arg_49_1:GetWordFromCfg(112171012)
				local var_52_4 = arg_49_1:FormatText(var_52_3.content)

				arg_49_1.text_.text = var_52_4

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_5 = 7
				local var_52_6 = utf8.len(var_52_4)
				local var_52_7 = var_52_5 <= 0 and var_52_1 or var_52_1 * (var_52_6 / var_52_5)

				if var_52_7 > 0 and var_52_1 < var_52_7 then
					arg_49_1.talkMaxDuration = var_52_7

					if var_52_7 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_7 + var_52_0
					end
				end

				arg_49_1.text_.text = var_52_4
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171012", "story_v_out_112171.awb") ~= 0 then
					local var_52_8 = manager.audio:GetVoiceLength("story_v_out_112171", "112171012", "story_v_out_112171.awb") / 1000

					if var_52_8 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_8 + var_52_0
					end

					if var_52_3.prefab_name ~= "" and arg_49_1.actors_[var_52_3.prefab_name] ~= nil then
						local var_52_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_3.prefab_name].transform, "story_v_out_112171", "112171012", "story_v_out_112171.awb")

						arg_49_1:RecordAudio("112171012", var_52_9)
						arg_49_1:RecordAudio("112171012", var_52_9)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_112171", "112171012", "story_v_out_112171.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_112171", "112171012", "story_v_out_112171.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_10 = math.max(var_52_1, arg_49_1.talkMaxDuration)

			if var_52_0 <= arg_49_1.time_ and arg_49_1.time_ < var_52_0 + var_52_10 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_0) / var_52_10

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_0 + var_52_10 and arg_49_1.time_ < var_52_0 + var_52_10 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play112171013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 112171013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play112171014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.175

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[7].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(112171013)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 7
				local var_56_6 = utf8.len(var_56_4)
				local var_56_7 = var_56_5 <= 0 and var_56_1 or var_56_1 * (var_56_6 / var_56_5)

				if var_56_7 > 0 and var_56_1 < var_56_7 then
					arg_53_1.talkMaxDuration = var_56_7

					if var_56_7 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_7 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_4
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_8 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_8 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_8

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_8 and arg_53_1.time_ < var_56_0 + var_56_8 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play112171014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 112171014
		arg_57_1.duration_ = 3.6

		local var_57_0 = {
			ja = 3.033,
			ko = 2.5,
			zh = 2.9,
			en = 3.6
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
				arg_57_0:Play112171015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 0.25

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_2 = arg_57_1:FormatText(StoryNameCfg[6].name)

				arg_57_1.leftNameTxt_.text = var_60_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, true)
				arg_57_1.iconController_:SetSelectedState("hero")

				arg_57_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_3 = arg_57_1:GetWordFromCfg(112171014)
				local var_60_4 = arg_57_1:FormatText(var_60_3.content)

				arg_57_1.text_.text = var_60_4

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_5 = 10
				local var_60_6 = utf8.len(var_60_4)
				local var_60_7 = var_60_5 <= 0 and var_60_1 or var_60_1 * (var_60_6 / var_60_5)

				if var_60_7 > 0 and var_60_1 < var_60_7 then
					arg_57_1.talkMaxDuration = var_60_7

					if var_60_7 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_7 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_4
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171014", "story_v_out_112171.awb") ~= 0 then
					local var_60_8 = manager.audio:GetVoiceLength("story_v_out_112171", "112171014", "story_v_out_112171.awb") / 1000

					if var_60_8 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_0
					end

					if var_60_3.prefab_name ~= "" and arg_57_1.actors_[var_60_3.prefab_name] ~= nil then
						local var_60_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_3.prefab_name].transform, "story_v_out_112171", "112171014", "story_v_out_112171.awb")

						arg_57_1:RecordAudio("112171014", var_60_9)
						arg_57_1:RecordAudio("112171014", var_60_9)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_112171", "112171014", "story_v_out_112171.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_112171", "112171014", "story_v_out_112171.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_10 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_10 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_10

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_10 and arg_57_1.time_ < var_60_0 + var_60_10 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play112171015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 112171015
		arg_61_1.duration_ = 7.166

		local var_61_0 = {
			ja = 5.4,
			ko = 5.866,
			zh = 5.366,
			en = 7.166
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
				arg_61_0:Play112171016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.475

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[8].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(112171015)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 19
				local var_64_6 = utf8.len(var_64_4)
				local var_64_7 = var_64_5 <= 0 and var_64_1 or var_64_1 * (var_64_6 / var_64_5)

				if var_64_7 > 0 and var_64_1 < var_64_7 then
					arg_61_1.talkMaxDuration = var_64_7

					if var_64_7 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_7 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_4
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171015", "story_v_out_112171.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_112171", "112171015", "story_v_out_112171.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_112171", "112171015", "story_v_out_112171.awb")

						arg_61_1:RecordAudio("112171015", var_64_9)
						arg_61_1:RecordAudio("112171015", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_112171", "112171015", "story_v_out_112171.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_112171", "112171015", "story_v_out_112171.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_10 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_10 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_10

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_10 and arg_61_1.time_ < var_64_0 + var_64_10 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play112171016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 112171016
		arg_65_1.duration_ = 8.833

		local var_65_0 = {
			ja = 8.1,
			ko = 8.166,
			zh = 7.3,
			en = 8.833
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
				arg_65_0:Play112171017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 2

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				local var_68_1 = manager.ui.mainCamera.transform.localPosition
				local var_68_2 = Vector3.New(0, 0, 10) + Vector3.New(var_68_1.x, var_68_1.y, 0)
				local var_68_3 = arg_65_1.bgs_.H04

				var_68_3.transform.localPosition = var_68_2
				var_68_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_68_4 = var_68_3:GetComponent("SpriteRenderer")

				if var_68_4 and var_68_4.sprite then
					local var_68_5 = (var_68_3.transform.localPosition - var_68_1).z
					local var_68_6 = manager.ui.mainCameraCom_
					local var_68_7 = 2 * var_68_5 * Mathf.Tan(var_68_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_68_8 = var_68_7 * var_68_6.aspect
					local var_68_9 = var_68_4.sprite.bounds.size.x
					local var_68_10 = var_68_4.sprite.bounds.size.y
					local var_68_11 = var_68_8 / var_68_9
					local var_68_12 = var_68_7 / var_68_10
					local var_68_13 = var_68_12 < var_68_11 and var_68_11 or var_68_12

					var_68_3.transform.localScale = Vector3.New(var_68_13, var_68_13, 0)
				end

				for iter_68_0, iter_68_1 in pairs(arg_65_1.bgs_) do
					if iter_68_0 ~= "H04" then
						iter_68_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_68_14 = 0

			if var_68_14 < arg_65_1.time_ and arg_65_1.time_ <= var_68_14 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_15 = 2

			if var_68_14 <= arg_65_1.time_ and arg_65_1.time_ < var_68_14 + var_68_15 then
				local var_68_16 = (arg_65_1.time_ - var_68_14) / var_68_15
				local var_68_17 = Color.New(0, 0, 0)

				var_68_17.a = Mathf.Lerp(0, 1, var_68_16)
				arg_65_1.mask_.color = var_68_17
			end

			if arg_65_1.time_ >= var_68_14 + var_68_15 and arg_65_1.time_ < var_68_14 + var_68_15 + arg_68_0 then
				local var_68_18 = Color.New(0, 0, 0)

				var_68_18.a = 1
				arg_65_1.mask_.color = var_68_18
			end

			local var_68_19 = 2

			if var_68_19 < arg_65_1.time_ and arg_65_1.time_ <= var_68_19 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_20 = 2

			if var_68_19 <= arg_65_1.time_ and arg_65_1.time_ < var_68_19 + var_68_20 then
				local var_68_21 = (arg_65_1.time_ - var_68_19) / var_68_20
				local var_68_22 = Color.New(0, 0, 0)

				var_68_22.a = Mathf.Lerp(1, 0, var_68_21)
				arg_65_1.mask_.color = var_68_22
			end

			if arg_65_1.time_ >= var_68_19 + var_68_20 and arg_65_1.time_ < var_68_19 + var_68_20 + arg_68_0 then
				local var_68_23 = Color.New(0, 0, 0)
				local var_68_24 = 0

				arg_65_1.mask_.enabled = false
				var_68_23.a = var_68_24
				arg_65_1.mask_.color = var_68_23
			end

			local var_68_25 = "1039ui_story"

			if arg_65_1.actors_[var_68_25] == nil then
				local var_68_26 = Object.Instantiate(Asset.Load("Char/" .. var_68_25), arg_65_1.stage_.transform)

				var_68_26.name = var_68_25
				var_68_26.transform.localPosition = Vector3.New(0, 100, 0)
				arg_65_1.actors_[var_68_25] = var_68_26

				local var_68_27 = var_68_26:GetComponentInChildren(typeof(CharacterEffect))

				var_68_27.enabled = true

				local var_68_28 = GameObjectTools.GetOrAddComponent(var_68_26, typeof(DynamicBoneHelper))

				if var_68_28 then
					var_68_28:EnableDynamicBone(false)
				end

				arg_65_1:ShowWeapon(var_68_27.transform, false)

				arg_65_1.var_[var_68_25 .. "Animator"] = var_68_27.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_65_1.var_[var_68_25 .. "Animator"].applyRootMotion = true
				arg_65_1.var_[var_68_25 .. "LipSync"] = var_68_27.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_68_29 = arg_65_1.actors_["1039ui_story"].transform
			local var_68_30 = 3.8

			if var_68_30 < arg_65_1.time_ and arg_65_1.time_ <= var_68_30 + arg_68_0 then
				arg_65_1.var_.moveOldPos1039ui_story = var_68_29.localPosition
			end

			local var_68_31 = 0.001

			if var_68_30 <= arg_65_1.time_ and arg_65_1.time_ < var_68_30 + var_68_31 then
				local var_68_32 = (arg_65_1.time_ - var_68_30) / var_68_31
				local var_68_33 = Vector3.New(-0.7, -1.01, -5.9)

				var_68_29.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1039ui_story, var_68_33, var_68_32)

				local var_68_34 = manager.ui.mainCamera.transform.position - var_68_29.position

				var_68_29.forward = Vector3.New(var_68_34.x, var_68_34.y, var_68_34.z)

				local var_68_35 = var_68_29.localEulerAngles

				var_68_35.z = 0
				var_68_35.x = 0
				var_68_29.localEulerAngles = var_68_35
			end

			if arg_65_1.time_ >= var_68_30 + var_68_31 and arg_65_1.time_ < var_68_30 + var_68_31 + arg_68_0 then
				var_68_29.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_68_36 = manager.ui.mainCamera.transform.position - var_68_29.position

				var_68_29.forward = Vector3.New(var_68_36.x, var_68_36.y, var_68_36.z)

				local var_68_37 = var_68_29.localEulerAngles

				var_68_37.z = 0
				var_68_37.x = 0
				var_68_29.localEulerAngles = var_68_37
			end

			local var_68_38 = 3.8

			if var_68_38 < arg_65_1.time_ and arg_65_1.time_ <= var_68_38 + arg_68_0 then
				arg_65_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_68_39 = 3.8

			if var_68_39 < arg_65_1.time_ and arg_65_1.time_ <= var_68_39 + arg_68_0 then
				arg_65_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_68_40 = arg_65_1.actors_["1039ui_story"]
			local var_68_41 = 3.8

			if var_68_41 < arg_65_1.time_ and arg_65_1.time_ <= var_68_41 + arg_68_0 and arg_65_1.var_.characterEffect1039ui_story == nil then
				arg_65_1.var_.characterEffect1039ui_story = var_68_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_42 = 0.2

			if var_68_41 <= arg_65_1.time_ and arg_65_1.time_ < var_68_41 + var_68_42 then
				local var_68_43 = (arg_65_1.time_ - var_68_41) / var_68_42

				if arg_65_1.var_.characterEffect1039ui_story then
					arg_65_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_41 + var_68_42 and arg_65_1.time_ < var_68_41 + var_68_42 + arg_68_0 and arg_65_1.var_.characterEffect1039ui_story then
				arg_65_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			if arg_65_1.frameCnt_ <= 1 then
				arg_65_1.dialog_:SetActive(false)
			end

			local var_68_44 = 4
			local var_68_45 = 0.375

			if var_68_44 < arg_65_1.time_ and arg_65_1.time_ <= var_68_44 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0

				arg_65_1.dialog_:SetActive(true)

				local var_68_46 = LeanTween.value(arg_65_1.dialog_, 0, 1, 0.3)

				var_68_46:setOnUpdate(LuaHelper.FloatAction(function(arg_69_0)
					arg_65_1.dialogCg_.alpha = arg_69_0
				end))
				var_68_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_65_1.dialog_)
					var_68_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_65_1.duration_ = arg_65_1.duration_ + 0.3

				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_47 = arg_65_1:FormatText(StoryNameCfg[9].name)

				arg_65_1.leftNameTxt_.text = var_68_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_48 = arg_65_1:GetWordFromCfg(112171016)
				local var_68_49 = arg_65_1:FormatText(var_68_48.content)

				arg_65_1.text_.text = var_68_49

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_50 = 15
				local var_68_51 = utf8.len(var_68_49)
				local var_68_52 = var_68_50 <= 0 and var_68_45 or var_68_45 * (var_68_51 / var_68_50)

				if var_68_52 > 0 and var_68_45 < var_68_52 then
					arg_65_1.talkMaxDuration = var_68_52
					var_68_44 = var_68_44 + 0.3

					if var_68_52 + var_68_44 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_52 + var_68_44
					end
				end

				arg_65_1.text_.text = var_68_49
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171016", "story_v_out_112171.awb") ~= 0 then
					local var_68_53 = manager.audio:GetVoiceLength("story_v_out_112171", "112171016", "story_v_out_112171.awb") / 1000

					if var_68_53 + var_68_44 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_53 + var_68_44
					end

					if var_68_48.prefab_name ~= "" and arg_65_1.actors_[var_68_48.prefab_name] ~= nil then
						local var_68_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_48.prefab_name].transform, "story_v_out_112171", "112171016", "story_v_out_112171.awb")

						arg_65_1:RecordAudio("112171016", var_68_54)
						arg_65_1:RecordAudio("112171016", var_68_54)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_112171", "112171016", "story_v_out_112171.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_112171", "112171016", "story_v_out_112171.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_55 = var_68_44 + 0.3
			local var_68_56 = math.max(var_68_45, arg_65_1.talkMaxDuration)

			if var_68_55 <= arg_65_1.time_ and arg_65_1.time_ < var_68_55 + var_68_56 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_55) / var_68_56

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_55 + var_68_56 and arg_65_1.time_ < var_68_55 + var_68_56 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play112171017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 112171017
		arg_71_1.duration_ = 7.7

		local var_71_0 = {
			ja = 5.033,
			ko = 4.433,
			zh = 6.9,
			en = 7.7
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
				arg_71_0:Play112171018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1039ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1039ui_story == nil then
				arg_71_1.var_.characterEffect1039ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.2

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1039ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1039ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1039ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1039ui_story.fillRatio = var_74_5
			end

			local var_74_6 = "1127ui_story"

			if arg_71_1.actors_[var_74_6] == nil then
				local var_74_7 = Object.Instantiate(Asset.Load("Char/" .. var_74_6), arg_71_1.stage_.transform)

				var_74_7.name = var_74_6
				var_74_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_71_1.actors_[var_74_6] = var_74_7

				local var_74_8 = var_74_7:GetComponentInChildren(typeof(CharacterEffect))

				var_74_8.enabled = true

				local var_74_9 = GameObjectTools.GetOrAddComponent(var_74_7, typeof(DynamicBoneHelper))

				if var_74_9 then
					var_74_9:EnableDynamicBone(false)
				end

				arg_71_1:ShowWeapon(var_74_8.transform, false)

				arg_71_1.var_[var_74_6 .. "Animator"] = var_74_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_71_1.var_[var_74_6 .. "Animator"].applyRootMotion = true
				arg_71_1.var_[var_74_6 .. "LipSync"] = var_74_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_74_10 = arg_71_1.actors_["1127ui_story"].transform
			local var_74_11 = 0

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1.var_.moveOldPos1127ui_story = var_74_10.localPosition
			end

			local var_74_12 = 0.001

			if var_74_11 <= arg_71_1.time_ and arg_71_1.time_ < var_74_11 + var_74_12 then
				local var_74_13 = (arg_71_1.time_ - var_74_11) / var_74_12
				local var_74_14 = Vector3.New(0.7, -0.81, -5.8)

				var_74_10.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1127ui_story, var_74_14, var_74_13)

				local var_74_15 = manager.ui.mainCamera.transform.position - var_74_10.position

				var_74_10.forward = Vector3.New(var_74_15.x, var_74_15.y, var_74_15.z)

				local var_74_16 = var_74_10.localEulerAngles

				var_74_16.z = 0
				var_74_16.x = 0
				var_74_10.localEulerAngles = var_74_16
			end

			if arg_71_1.time_ >= var_74_11 + var_74_12 and arg_71_1.time_ < var_74_11 + var_74_12 + arg_74_0 then
				var_74_10.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_74_17 = manager.ui.mainCamera.transform.position - var_74_10.position

				var_74_10.forward = Vector3.New(var_74_17.x, var_74_17.y, var_74_17.z)

				local var_74_18 = var_74_10.localEulerAngles

				var_74_18.z = 0
				var_74_18.x = 0
				var_74_10.localEulerAngles = var_74_18
			end

			local var_74_19 = 0

			if var_74_19 < arg_71_1.time_ and arg_71_1.time_ <= var_74_19 + arg_74_0 then
				arg_71_1:PlayTimeline("1127ui_story", "StoryTimeline/CharAction/1127/1127action/1127action6_1")
			end

			local var_74_20 = 0

			if var_74_20 < arg_71_1.time_ and arg_71_1.time_ <= var_74_20 + arg_74_0 then
				arg_71_1:PlayTimeline("1127ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_74_21 = arg_71_1.actors_["1127ui_story"]
			local var_74_22 = 0

			if var_74_22 < arg_71_1.time_ and arg_71_1.time_ <= var_74_22 + arg_74_0 and arg_71_1.var_.characterEffect1127ui_story == nil then
				arg_71_1.var_.characterEffect1127ui_story = var_74_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_23 = 0.2

			if var_74_22 <= arg_71_1.time_ and arg_71_1.time_ < var_74_22 + var_74_23 then
				local var_74_24 = (arg_71_1.time_ - var_74_22) / var_74_23

				if arg_71_1.var_.characterEffect1127ui_story then
					arg_71_1.var_.characterEffect1127ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_22 + var_74_23 and arg_71_1.time_ < var_74_22 + var_74_23 + arg_74_0 and arg_71_1.var_.characterEffect1127ui_story then
				arg_71_1.var_.characterEffect1127ui_story.fillFlat = false
			end

			local var_74_25 = 0
			local var_74_26 = 0.525

			if var_74_25 < arg_71_1.time_ and arg_71_1.time_ <= var_74_25 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_27 = arg_71_1:FormatText(StoryNameCfg[56].name)

				arg_71_1.leftNameTxt_.text = var_74_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_28 = arg_71_1:GetWordFromCfg(112171017)
				local var_74_29 = arg_71_1:FormatText(var_74_28.content)

				arg_71_1.text_.text = var_74_29

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_30 = 21
				local var_74_31 = utf8.len(var_74_29)
				local var_74_32 = var_74_30 <= 0 and var_74_26 or var_74_26 * (var_74_31 / var_74_30)

				if var_74_32 > 0 and var_74_26 < var_74_32 then
					arg_71_1.talkMaxDuration = var_74_32

					if var_74_32 + var_74_25 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_32 + var_74_25
					end
				end

				arg_71_1.text_.text = var_74_29
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171017", "story_v_out_112171.awb") ~= 0 then
					local var_74_33 = manager.audio:GetVoiceLength("story_v_out_112171", "112171017", "story_v_out_112171.awb") / 1000

					if var_74_33 + var_74_25 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_33 + var_74_25
					end

					if var_74_28.prefab_name ~= "" and arg_71_1.actors_[var_74_28.prefab_name] ~= nil then
						local var_74_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_28.prefab_name].transform, "story_v_out_112171", "112171017", "story_v_out_112171.awb")

						arg_71_1:RecordAudio("112171017", var_74_34)
						arg_71_1:RecordAudio("112171017", var_74_34)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_112171", "112171017", "story_v_out_112171.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_112171", "112171017", "story_v_out_112171.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_35 = math.max(var_74_26, arg_71_1.talkMaxDuration)

			if var_74_25 <= arg_71_1.time_ and arg_71_1.time_ < var_74_25 + var_74_35 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_25) / var_74_35

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_25 + var_74_35 and arg_71_1.time_ < var_74_25 + var_74_35 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play112171018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 112171018
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play112171019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1039ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1039ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, 100, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1039ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, 100, 0)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1127ui_story"].transform
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.var_.moveOldPos1127ui_story = var_78_9.localPosition
			end

			local var_78_11 = 0.001

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11
				local var_78_13 = Vector3.New(0, 100, 0)

				var_78_9.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1127ui_story, var_78_13, var_78_12)

				local var_78_14 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_14.x, var_78_14.y, var_78_14.z)

				local var_78_15 = var_78_9.localEulerAngles

				var_78_15.z = 0
				var_78_15.x = 0
				var_78_9.localEulerAngles = var_78_15
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 then
				var_78_9.localPosition = Vector3.New(0, 100, 0)

				local var_78_16 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_16.x, var_78_16.y, var_78_16.z)

				local var_78_17 = var_78_9.localEulerAngles

				var_78_17.z = 0
				var_78_17.x = 0
				var_78_9.localEulerAngles = var_78_17
			end

			local var_78_18 = 0
			local var_78_19 = 0.375

			if var_78_18 < arg_75_1.time_ and arg_75_1.time_ <= var_78_18 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_20 = arg_75_1:GetWordFromCfg(112171018)
				local var_78_21 = arg_75_1:FormatText(var_78_20.content)

				arg_75_1.text_.text = var_78_21

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_22 = 15
				local var_78_23 = utf8.len(var_78_21)
				local var_78_24 = var_78_22 <= 0 and var_78_19 or var_78_19 * (var_78_23 / var_78_22)

				if var_78_24 > 0 and var_78_19 < var_78_24 then
					arg_75_1.talkMaxDuration = var_78_24

					if var_78_24 + var_78_18 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_24 + var_78_18
					end
				end

				arg_75_1.text_.text = var_78_21
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_25 = math.max(var_78_19, arg_75_1.talkMaxDuration)

			if var_78_18 <= arg_75_1.time_ and arg_75_1.time_ < var_78_18 + var_78_25 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_18) / var_78_25

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_18 + var_78_25 and arg_75_1.time_ < var_78_18 + var_78_25 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play112171019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 112171019
		arg_79_1.duration_ = 6.5

		local var_79_0 = {
			ja = 6.5,
			ko = 6.5,
			zh = 4.8,
			en = 6.1
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
				arg_79_0:Play112171020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1081ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1081ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(-0.7, -0.92, -5.8)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1081ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(-0.7, -0.92, -5.8)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = 0

			if var_82_9 < arg_79_1.time_ and arg_79_1.time_ <= var_82_9 + arg_82_0 then
				arg_79_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action7_1")
			end

			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_82_11 = arg_79_1.actors_["1081ui_story"]
			local var_82_12 = 0

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 and arg_79_1.var_.characterEffect1081ui_story == nil then
				arg_79_1.var_.characterEffect1081ui_story = var_82_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_13 = 0.2

			if var_82_12 <= arg_79_1.time_ and arg_79_1.time_ < var_82_12 + var_82_13 then
				local var_82_14 = (arg_79_1.time_ - var_82_12) / var_82_13

				if arg_79_1.var_.characterEffect1081ui_story then
					arg_79_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_12 + var_82_13 and arg_79_1.time_ < var_82_12 + var_82_13 + arg_82_0 and arg_79_1.var_.characterEffect1081ui_story then
				arg_79_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_82_15 = 0
			local var_82_16 = 0.575

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_17 = arg_79_1:FormatText(StoryNameCfg[202].name)

				arg_79_1.leftNameTxt_.text = var_82_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_18 = arg_79_1:GetWordFromCfg(112171019)
				local var_82_19 = arg_79_1:FormatText(var_82_18.content)

				arg_79_1.text_.text = var_82_19

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_20 = 23
				local var_82_21 = utf8.len(var_82_19)
				local var_82_22 = var_82_20 <= 0 and var_82_16 or var_82_16 * (var_82_21 / var_82_20)

				if var_82_22 > 0 and var_82_16 < var_82_22 then
					arg_79_1.talkMaxDuration = var_82_22

					if var_82_22 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_22 + var_82_15
					end
				end

				arg_79_1.text_.text = var_82_19
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171019", "story_v_out_112171.awb") ~= 0 then
					local var_82_23 = manager.audio:GetVoiceLength("story_v_out_112171", "112171019", "story_v_out_112171.awb") / 1000

					if var_82_23 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_23 + var_82_15
					end

					if var_82_18.prefab_name ~= "" and arg_79_1.actors_[var_82_18.prefab_name] ~= nil then
						local var_82_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_18.prefab_name].transform, "story_v_out_112171", "112171019", "story_v_out_112171.awb")

						arg_79_1:RecordAudio("112171019", var_82_24)
						arg_79_1:RecordAudio("112171019", var_82_24)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_112171", "112171019", "story_v_out_112171.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_112171", "112171019", "story_v_out_112171.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_25 = math.max(var_82_16, arg_79_1.talkMaxDuration)

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_25 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_15) / var_82_25

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_15 + var_82_25 and arg_79_1.time_ < var_82_15 + var_82_25 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play112171020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 112171020
		arg_83_1.duration_ = 3.933

		local var_83_0 = {
			ja = 3.933,
			ko = 2.1,
			zh = 2.9,
			en = 3.9
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
				arg_83_0:Play112171021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1081ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1081ui_story == nil then
				arg_83_1.var_.characterEffect1081ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.2

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1081ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1081ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1081ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1081ui_story.fillRatio = var_86_5
			end

			local var_86_6 = arg_83_1.actors_["1127ui_story"].transform
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 then
				arg_83_1.var_.moveOldPos1127ui_story = var_86_6.localPosition
			end

			local var_86_8 = 0.001

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8
				local var_86_10 = Vector3.New(0.7, -0.81, -5.8)

				var_86_6.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1127ui_story, var_86_10, var_86_9)

				local var_86_11 = manager.ui.mainCamera.transform.position - var_86_6.position

				var_86_6.forward = Vector3.New(var_86_11.x, var_86_11.y, var_86_11.z)

				local var_86_12 = var_86_6.localEulerAngles

				var_86_12.z = 0
				var_86_12.x = 0
				var_86_6.localEulerAngles = var_86_12
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 then
				var_86_6.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_86_13 = manager.ui.mainCamera.transform.position - var_86_6.position

				var_86_6.forward = Vector3.New(var_86_13.x, var_86_13.y, var_86_13.z)

				local var_86_14 = var_86_6.localEulerAngles

				var_86_14.z = 0
				var_86_14.x = 0
				var_86_6.localEulerAngles = var_86_14
			end

			local var_86_15 = 0

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1:PlayTimeline("1127ui_story", "StoryTimeline/CharAction/1127/1127action/1127action2_1")
			end

			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 then
				arg_83_1:PlayTimeline("1127ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_86_17 = arg_83_1.actors_["1127ui_story"]
			local var_86_18 = 0

			if var_86_18 < arg_83_1.time_ and arg_83_1.time_ <= var_86_18 + arg_86_0 and arg_83_1.var_.characterEffect1127ui_story == nil then
				arg_83_1.var_.characterEffect1127ui_story = var_86_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_19 = 0.2

			if var_86_18 <= arg_83_1.time_ and arg_83_1.time_ < var_86_18 + var_86_19 then
				local var_86_20 = (arg_83_1.time_ - var_86_18) / var_86_19

				if arg_83_1.var_.characterEffect1127ui_story then
					arg_83_1.var_.characterEffect1127ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_18 + var_86_19 and arg_83_1.time_ < var_86_18 + var_86_19 + arg_86_0 and arg_83_1.var_.characterEffect1127ui_story then
				arg_83_1.var_.characterEffect1127ui_story.fillFlat = false
			end

			local var_86_21 = 0
			local var_86_22 = 0.2

			if var_86_21 < arg_83_1.time_ and arg_83_1.time_ <= var_86_21 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_23 = arg_83_1:FormatText(StoryNameCfg[56].name)

				arg_83_1.leftNameTxt_.text = var_86_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_24 = arg_83_1:GetWordFromCfg(112171020)
				local var_86_25 = arg_83_1:FormatText(var_86_24.content)

				arg_83_1.text_.text = var_86_25

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_26 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_112171", "112171020", "story_v_out_112171.awb") ~= 0 then
					local var_86_29 = manager.audio:GetVoiceLength("story_v_out_112171", "112171020", "story_v_out_112171.awb") / 1000

					if var_86_29 + var_86_21 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_29 + var_86_21
					end

					if var_86_24.prefab_name ~= "" and arg_83_1.actors_[var_86_24.prefab_name] ~= nil then
						local var_86_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_24.prefab_name].transform, "story_v_out_112171", "112171020", "story_v_out_112171.awb")

						arg_83_1:RecordAudio("112171020", var_86_30)
						arg_83_1:RecordAudio("112171020", var_86_30)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_112171", "112171020", "story_v_out_112171.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_112171", "112171020", "story_v_out_112171.awb")
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
	Play112171021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 112171021
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
			arg_87_1.auto_ = false
		end

		function arg_87_1.playNext_(arg_89_0)
			arg_87_1.onStoryFinished_()
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1127ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1127ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, 100, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1127ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, 100, 0)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1081ui_story"].transform
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.var_.moveOldPos1081ui_story = var_90_9.localPosition
			end

			local var_90_11 = 0.001

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11
				local var_90_13 = Vector3.New(0, 100, 0)

				var_90_9.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1081ui_story, var_90_13, var_90_12)

				local var_90_14 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_14.x, var_90_14.y, var_90_14.z)

				local var_90_15 = var_90_9.localEulerAngles

				var_90_15.z = 0
				var_90_15.x = 0
				var_90_9.localEulerAngles = var_90_15
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 then
				var_90_9.localPosition = Vector3.New(0, 100, 0)

				local var_90_16 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_16.x, var_90_16.y, var_90_16.z)

				local var_90_17 = var_90_9.localEulerAngles

				var_90_17.z = 0
				var_90_17.x = 0
				var_90_9.localEulerAngles = var_90_17
			end

			local var_90_18 = 0
			local var_90_19 = 1.475

			if var_90_18 < arg_87_1.time_ and arg_87_1.time_ <= var_90_18 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_20 = arg_87_1:GetWordFromCfg(112171021)
				local var_90_21 = arg_87_1:FormatText(var_90_20.content)

				arg_87_1.text_.text = var_90_21

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_22 = 59
				local var_90_23 = utf8.len(var_90_21)
				local var_90_24 = var_90_22 <= 0 and var_90_19 or var_90_19 * (var_90_23 / var_90_22)

				if var_90_24 > 0 and var_90_19 < var_90_24 then
					arg_87_1.talkMaxDuration = var_90_24

					if var_90_24 + var_90_18 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_24 + var_90_18
					end
				end

				arg_87_1.text_.text = var_90_21
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_25 = math.max(var_90_19, arg_87_1.talkMaxDuration)

			if var_90_18 <= arg_87_1.time_ and arg_87_1.time_ < var_90_18 + var_90_25 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_18) / var_90_25

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_18 + var_90_25 and arg_87_1.time_ < var_90_18 + var_90_25 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/H04",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SA0108"
	},
	voices = {
		"story_v_out_112171.awb"
	}
}
