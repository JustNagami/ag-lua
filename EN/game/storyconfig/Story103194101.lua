return {
	Play319411001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319411001
		arg_1_1.duration_ = 6.1

		local var_1_0 = {
			zh = 3.999999999999,
			ja = 6.1
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
				arg_1_0:Play319411002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I11n"

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
				local var_4_5 = arg_1_1.bgs_.I11n

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
					if iter_4_0 ~= "I11n" then
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
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1095ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -0.98, -6.1)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1095ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1095ui_story"]
			local var_4_36 = 2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story == nil then
				arg_1_1.var_.characterEffect1095ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1095ui_story then
					arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story then
				arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_4_39 = 2

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_41 = 0.1
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "bgm_activity_3_0_story_data", "bgm_activity_3_0_story_data", "bgm_activity_3_0_story_data.awb")
			end

			local var_4_45 = 0
			local var_4_46 = 0.0666666666666667

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.125

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_51 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_51:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[471].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(319411001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 5
				local var_4_56 = utf8.len(var_4_54)
				local var_4_57 = var_4_55 <= 0 and var_4_50 or var_4_50 * (var_4_56 / var_4_55)

				if var_4_57 > 0 and var_4_50 < var_4_57 then
					arg_1_1.talkMaxDuration = var_4_57
					var_4_49 = var_4_49 + 0.3

					if var_4_57 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_49
					end
				end

				arg_1_1.text_.text = var_4_54
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411001", "story_v_out_319411.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_319411", "319411001", "story_v_out_319411.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_319411", "319411001", "story_v_out_319411.awb")

						arg_1_1:RecordAudio("319411001", var_4_59)
						arg_1_1:RecordAudio("319411001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319411", "319411001", "story_v_out_319411.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319411", "319411001", "story_v_out_319411.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_60 = var_4_49 + 0.3
			local var_4_61 = math.max(var_4_50, arg_1_1.talkMaxDuration)

			if var_4_60 <= arg_1_1.time_ and arg_1_1.time_ < var_4_60 + var_4_61 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_60) / var_4_61

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_60 + var_4_61 and arg_1_1.time_ < var_4_60 + var_4_61 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319411002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319411002
		arg_7_1.duration_ = 7.366

		local var_7_0 = {
			zh = 2.533,
			ja = 7.366
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
				arg_7_0:Play319411003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10079ui_story"

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

			local var_10_4 = arg_7_1.actors_["10079ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos10079ui_story = var_10_4.localPosition

				local var_10_6 = "10079ui_story"

				arg_7_1:ShowWeapon(arg_7_1.var_[var_10_6 .. "Animator"].transform, false)
			end

			local var_10_7 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_7 then
				local var_10_8 = (arg_7_1.time_ - var_10_5) / var_10_7
				local var_10_9 = Vector3.New(0.7, -0.95, -6.05)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10079ui_story, var_10_9, var_10_8)

				local var_10_10 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_10.x, var_10_10.y, var_10_10.z)

				local var_10_11 = var_10_4.localEulerAngles

				var_10_11.z = 0
				var_10_11.x = 0
				var_10_4.localEulerAngles = var_10_11
			end

			if arg_7_1.time_ >= var_10_5 + var_10_7 and arg_7_1.time_ < var_10_5 + var_10_7 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_10_12 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_12.x, var_10_12.y, var_10_12.z)

				local var_10_13 = var_10_4.localEulerAngles

				var_10_13.z = 0
				var_10_13.x = 0
				var_10_4.localEulerAngles = var_10_13
			end

			local var_10_14 = arg_7_1.actors_["10079ui_story"]
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect10079ui_story == nil then
				arg_7_1.var_.characterEffect10079ui_story = var_10_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_16 = 0.200000002980232

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16

				if arg_7_1.var_.characterEffect10079ui_story then
					arg_7_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 and arg_7_1.var_.characterEffect10079ui_story then
				arg_7_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_10_20 = arg_7_1.actors_["1095ui_story"].transform
			local var_10_21 = 0

			if var_10_21 < arg_7_1.time_ and arg_7_1.time_ <= var_10_21 + arg_10_0 then
				arg_7_1.var_.moveOldPos1095ui_story = var_10_20.localPosition
			end

			local var_10_22 = 0.001

			if var_10_21 <= arg_7_1.time_ and arg_7_1.time_ < var_10_21 + var_10_22 then
				local var_10_23 = (arg_7_1.time_ - var_10_21) / var_10_22
				local var_10_24 = Vector3.New(-0.7, -0.98, -6.1)

				var_10_20.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1095ui_story, var_10_24, var_10_23)

				local var_10_25 = manager.ui.mainCamera.transform.position - var_10_20.position

				var_10_20.forward = Vector3.New(var_10_25.x, var_10_25.y, var_10_25.z)

				local var_10_26 = var_10_20.localEulerAngles

				var_10_26.z = 0
				var_10_26.x = 0
				var_10_20.localEulerAngles = var_10_26
			end

			if arg_7_1.time_ >= var_10_21 + var_10_22 and arg_7_1.time_ < var_10_21 + var_10_22 + arg_10_0 then
				var_10_20.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_10_27 = manager.ui.mainCamera.transform.position - var_10_20.position

				var_10_20.forward = Vector3.New(var_10_27.x, var_10_27.y, var_10_27.z)

				local var_10_28 = var_10_20.localEulerAngles

				var_10_28.z = 0
				var_10_28.x = 0
				var_10_20.localEulerAngles = var_10_28
			end

			local var_10_29 = arg_7_1.actors_["1095ui_story"]
			local var_10_30 = 0

			if var_10_30 < arg_7_1.time_ and arg_7_1.time_ <= var_10_30 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story == nil then
				arg_7_1.var_.characterEffect1095ui_story = var_10_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_31 = 0.200000002980232

			if var_10_30 <= arg_7_1.time_ and arg_7_1.time_ < var_10_30 + var_10_31 then
				local var_10_32 = (arg_7_1.time_ - var_10_30) / var_10_31

				if arg_7_1.var_.characterEffect1095ui_story then
					local var_10_33 = Mathf.Lerp(0, 0.5, var_10_32)

					arg_7_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1095ui_story.fillRatio = var_10_33
				end
			end

			if arg_7_1.time_ >= var_10_30 + var_10_31 and arg_7_1.time_ < var_10_30 + var_10_31 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story then
				local var_10_34 = 0.5

				arg_7_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1095ui_story.fillRatio = var_10_34
			end

			local var_10_35 = 0
			local var_10_36 = 0.3

			if var_10_35 < arg_7_1.time_ and arg_7_1.time_ <= var_10_35 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_37 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_38 = arg_7_1:GetWordFromCfg(319411002)
				local var_10_39 = arg_7_1:FormatText(var_10_38.content)

				arg_7_1.text_.text = var_10_39

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_40 = 12
				local var_10_41 = utf8.len(var_10_39)
				local var_10_42 = var_10_40 <= 0 and var_10_36 or var_10_36 * (var_10_41 / var_10_40)

				if var_10_42 > 0 and var_10_36 < var_10_42 then
					arg_7_1.talkMaxDuration = var_10_42

					if var_10_42 + var_10_35 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_42 + var_10_35
					end
				end

				arg_7_1.text_.text = var_10_39
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411002", "story_v_out_319411.awb") ~= 0 then
					local var_10_43 = manager.audio:GetVoiceLength("story_v_out_319411", "319411002", "story_v_out_319411.awb") / 1000

					if var_10_43 + var_10_35 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_43 + var_10_35
					end

					if var_10_38.prefab_name ~= "" and arg_7_1.actors_[var_10_38.prefab_name] ~= nil then
						local var_10_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_38.prefab_name].transform, "story_v_out_319411", "319411002", "story_v_out_319411.awb")

						arg_7_1:RecordAudio("319411002", var_10_44)
						arg_7_1:RecordAudio("319411002", var_10_44)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319411", "319411002", "story_v_out_319411.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319411", "319411002", "story_v_out_319411.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_45 = math.max(var_10_36, arg_7_1.talkMaxDuration)

			if var_10_35 <= arg_7_1.time_ and arg_7_1.time_ < var_10_35 + var_10_45 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_35) / var_10_45

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_35 + var_10_45 and arg_7_1.time_ < var_10_35 + var_10_45 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319411003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319411003
		arg_11_1.duration_ = 6.4

		local var_11_0 = {
			zh = 3.533,
			ja = 6.4
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
				arg_11_0:Play319411004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10079ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect10079ui_story == nil then
				arg_11_1.var_.characterEffect10079ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect10079ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_11_1.var_.characterEffect10079ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect10079ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_11_1.var_.characterEffect10079ui_story.fillRatio = var_14_5
			end

			local var_14_6 = arg_11_1.actors_["1095ui_story"]
			local var_14_7 = 0

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 and arg_11_1.var_.characterEffect1095ui_story == nil then
				arg_11_1.var_.characterEffect1095ui_story = var_14_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_8 = 0.200000002980232

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_8 then
				local var_14_9 = (arg_11_1.time_ - var_14_7) / var_14_8

				if arg_11_1.var_.characterEffect1095ui_story then
					arg_11_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_7 + var_14_8 and arg_11_1.time_ < var_14_7 + var_14_8 + arg_14_0 and arg_11_1.var_.characterEffect1095ui_story then
				arg_11_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_14_10 = 0
			local var_14_11 = 0.45

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_12 = arg_11_1:FormatText(StoryNameCfg[471].name)

				arg_11_1.leftNameTxt_.text = var_14_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_13 = arg_11_1:GetWordFromCfg(319411003)
				local var_14_14 = arg_11_1:FormatText(var_14_13.content)

				arg_11_1.text_.text = var_14_14

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_15 = 18
				local var_14_16 = utf8.len(var_14_14)
				local var_14_17 = var_14_15 <= 0 and var_14_11 or var_14_11 * (var_14_16 / var_14_15)

				if var_14_17 > 0 and var_14_11 < var_14_17 then
					arg_11_1.talkMaxDuration = var_14_17

					if var_14_17 + var_14_10 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_17 + var_14_10
					end
				end

				arg_11_1.text_.text = var_14_14
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411003", "story_v_out_319411.awb") ~= 0 then
					local var_14_18 = manager.audio:GetVoiceLength("story_v_out_319411", "319411003", "story_v_out_319411.awb") / 1000

					if var_14_18 + var_14_10 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_18 + var_14_10
					end

					if var_14_13.prefab_name ~= "" and arg_11_1.actors_[var_14_13.prefab_name] ~= nil then
						local var_14_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_13.prefab_name].transform, "story_v_out_319411", "319411003", "story_v_out_319411.awb")

						arg_11_1:RecordAudio("319411003", var_14_19)
						arg_11_1:RecordAudio("319411003", var_14_19)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319411", "319411003", "story_v_out_319411.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319411", "319411003", "story_v_out_319411.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_20 = math.max(var_14_11, arg_11_1.talkMaxDuration)

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_20 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_10) / var_14_20

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_10 + var_14_20 and arg_11_1.time_ < var_14_10 + var_14_20 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319411004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319411004
		arg_15_1.duration_ = 10.966

		local var_15_0 = {
			zh = 7.866,
			ja = 10.966
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
				arg_15_0:Play319411005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1095ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1095ui_story == nil then
				arg_15_1.var_.characterEffect1095ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1095ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1095ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1095ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1095ui_story.fillRatio = var_18_5
			end

			local var_18_6 = arg_15_1.actors_["10079ui_story"]
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 and arg_15_1.var_.characterEffect10079ui_story == nil then
				arg_15_1.var_.characterEffect10079ui_story = var_18_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_8 = 0.200000002980232

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8

				if arg_15_1.var_.characterEffect10079ui_story then
					arg_15_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 and arg_15_1.var_.characterEffect10079ui_story then
				arg_15_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_18_11 = 0

			if var_18_11 < arg_15_1.time_ and arg_15_1.time_ <= var_18_11 + arg_18_0 then
				arg_15_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_18_12 = 0
			local var_18_13 = 0.925

			if var_18_12 < arg_15_1.time_ and arg_15_1.time_ <= var_18_12 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_14 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_15 = arg_15_1:GetWordFromCfg(319411004)
				local var_18_16 = arg_15_1:FormatText(var_18_15.content)

				arg_15_1.text_.text = var_18_16

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_17 = 37
				local var_18_18 = utf8.len(var_18_16)
				local var_18_19 = var_18_17 <= 0 and var_18_13 or var_18_13 * (var_18_18 / var_18_17)

				if var_18_19 > 0 and var_18_13 < var_18_19 then
					arg_15_1.talkMaxDuration = var_18_19

					if var_18_19 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_19 + var_18_12
					end
				end

				arg_15_1.text_.text = var_18_16
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411004", "story_v_out_319411.awb") ~= 0 then
					local var_18_20 = manager.audio:GetVoiceLength("story_v_out_319411", "319411004", "story_v_out_319411.awb") / 1000

					if var_18_20 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_20 + var_18_12
					end

					if var_18_15.prefab_name ~= "" and arg_15_1.actors_[var_18_15.prefab_name] ~= nil then
						local var_18_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_15.prefab_name].transform, "story_v_out_319411", "319411004", "story_v_out_319411.awb")

						arg_15_1:RecordAudio("319411004", var_18_21)
						arg_15_1:RecordAudio("319411004", var_18_21)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319411", "319411004", "story_v_out_319411.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319411", "319411004", "story_v_out_319411.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_22 = math.max(var_18_13, arg_15_1.talkMaxDuration)

			if var_18_12 <= arg_15_1.time_ and arg_15_1.time_ < var_18_12 + var_18_22 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_12) / var_18_22

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_12 + var_18_22 and arg_15_1.time_ < var_18_12 + var_18_22 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319411005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319411005
		arg_19_1.duration_ = 8.666

		local var_19_0 = {
			zh = 7.966,
			ja = 8.666
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
				arg_19_0:Play319411006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.95

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(319411005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 38
				local var_22_6 = utf8.len(var_22_4)
				local var_22_7 = var_22_5 <= 0 and var_22_1 or var_22_1 * (var_22_6 / var_22_5)

				if var_22_7 > 0 and var_22_1 < var_22_7 then
					arg_19_1.talkMaxDuration = var_22_7

					if var_22_7 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_7 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_4
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411005", "story_v_out_319411.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_319411", "319411005", "story_v_out_319411.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_319411", "319411005", "story_v_out_319411.awb")

						arg_19_1:RecordAudio("319411005", var_22_9)
						arg_19_1:RecordAudio("319411005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319411", "319411005", "story_v_out_319411.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319411", "319411005", "story_v_out_319411.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_10 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_10 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_10

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_10 and arg_19_1.time_ < var_22_0 + var_22_10 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319411006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319411006
		arg_23_1.duration_ = 3.533

		local var_23_0 = {
			zh = 2.3,
			ja = 3.533
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
				arg_23_0:Play319411007(arg_23_1)
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
					arg_23_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story then
				arg_23_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_26_4 = arg_23_1.actors_["10079ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect10079ui_story == nil then
				arg_23_1.var_.characterEffect10079ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.200000002980232

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect10079ui_story then
					local var_26_8 = Mathf.Lerp(0, 0.5, var_26_7)

					arg_23_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10079ui_story.fillRatio = var_26_8
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect10079ui_story then
				local var_26_9 = 0.5

				arg_23_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10079ui_story.fillRatio = var_26_9
			end

			local var_26_10 = 0
			local var_26_11 = 0.25

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_12 = arg_23_1:FormatText(StoryNameCfg[471].name)

				arg_23_1.leftNameTxt_.text = var_26_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_13 = arg_23_1:GetWordFromCfg(319411006)
				local var_26_14 = arg_23_1:FormatText(var_26_13.content)

				arg_23_1.text_.text = var_26_14

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_15 = 10
				local var_26_16 = utf8.len(var_26_14)
				local var_26_17 = var_26_15 <= 0 and var_26_11 or var_26_11 * (var_26_16 / var_26_15)

				if var_26_17 > 0 and var_26_11 < var_26_17 then
					arg_23_1.talkMaxDuration = var_26_17

					if var_26_17 + var_26_10 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_17 + var_26_10
					end
				end

				arg_23_1.text_.text = var_26_14
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411006", "story_v_out_319411.awb") ~= 0 then
					local var_26_18 = manager.audio:GetVoiceLength("story_v_out_319411", "319411006", "story_v_out_319411.awb") / 1000

					if var_26_18 + var_26_10 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_18 + var_26_10
					end

					if var_26_13.prefab_name ~= "" and arg_23_1.actors_[var_26_13.prefab_name] ~= nil then
						local var_26_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_13.prefab_name].transform, "story_v_out_319411", "319411006", "story_v_out_319411.awb")

						arg_23_1:RecordAudio("319411006", var_26_19)
						arg_23_1:RecordAudio("319411006", var_26_19)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319411", "319411006", "story_v_out_319411.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319411", "319411006", "story_v_out_319411.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_20 = math.max(var_26_11, arg_23_1.talkMaxDuration)

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_20 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_10) / var_26_20

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_10 + var_26_20 and arg_23_1.time_ < var_26_10 + var_26_20 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319411007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319411007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play319411008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10079ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10079ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10079ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, 100, 0)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["10079ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect10079ui_story == nil then
				arg_27_1.var_.characterEffect10079ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect10079ui_story then
					local var_30_13 = Mathf.Lerp(0, 0.5, var_30_12)

					arg_27_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_27_1.var_.characterEffect10079ui_story.fillRatio = var_30_13
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect10079ui_story then
				local var_30_14 = 0.5

				arg_27_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_27_1.var_.characterEffect10079ui_story.fillRatio = var_30_14
			end

			local var_30_15 = arg_27_1.actors_["1095ui_story"].transform
			local var_30_16 = 0

			if var_30_16 < arg_27_1.time_ and arg_27_1.time_ <= var_30_16 + arg_30_0 then
				arg_27_1.var_.moveOldPos1095ui_story = var_30_15.localPosition
			end

			local var_30_17 = 0.001

			if var_30_16 <= arg_27_1.time_ and arg_27_1.time_ < var_30_16 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_16) / var_30_17
				local var_30_19 = Vector3.New(0, 100, 0)

				var_30_15.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1095ui_story, var_30_19, var_30_18)

				local var_30_20 = manager.ui.mainCamera.transform.position - var_30_15.position

				var_30_15.forward = Vector3.New(var_30_20.x, var_30_20.y, var_30_20.z)

				local var_30_21 = var_30_15.localEulerAngles

				var_30_21.z = 0
				var_30_21.x = 0
				var_30_15.localEulerAngles = var_30_21
			end

			if arg_27_1.time_ >= var_30_16 + var_30_17 and arg_27_1.time_ < var_30_16 + var_30_17 + arg_30_0 then
				var_30_15.localPosition = Vector3.New(0, 100, 0)

				local var_30_22 = manager.ui.mainCamera.transform.position - var_30_15.position

				var_30_15.forward = Vector3.New(var_30_22.x, var_30_22.y, var_30_22.z)

				local var_30_23 = var_30_15.localEulerAngles

				var_30_23.z = 0
				var_30_23.x = 0
				var_30_15.localEulerAngles = var_30_23
			end

			local var_30_24 = arg_27_1.actors_["1095ui_story"]
			local var_30_25 = 0

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 and arg_27_1.var_.characterEffect1095ui_story == nil then
				arg_27_1.var_.characterEffect1095ui_story = var_30_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_26 = 0.200000002980232

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_26 then
				local var_30_27 = (arg_27_1.time_ - var_30_25) / var_30_26

				if arg_27_1.var_.characterEffect1095ui_story then
					local var_30_28 = Mathf.Lerp(0, 0.5, var_30_27)

					arg_27_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1095ui_story.fillRatio = var_30_28
				end
			end

			if arg_27_1.time_ >= var_30_25 + var_30_26 and arg_27_1.time_ < var_30_25 + var_30_26 + arg_30_0 and arg_27_1.var_.characterEffect1095ui_story then
				local var_30_29 = 0.5

				arg_27_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1095ui_story.fillRatio = var_30_29
			end

			local var_30_30 = 0
			local var_30_31 = 1.3

			if var_30_30 < arg_27_1.time_ and arg_27_1.time_ <= var_30_30 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_32 = arg_27_1:GetWordFromCfg(319411007)
				local var_30_33 = arg_27_1:FormatText(var_30_32.content)

				arg_27_1.text_.text = var_30_33

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_34 = 52
				local var_30_35 = utf8.len(var_30_33)
				local var_30_36 = var_30_34 <= 0 and var_30_31 or var_30_31 * (var_30_35 / var_30_34)

				if var_30_36 > 0 and var_30_31 < var_30_36 then
					arg_27_1.talkMaxDuration = var_30_36

					if var_30_36 + var_30_30 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_36 + var_30_30
					end
				end

				arg_27_1.text_.text = var_30_33
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_37 = math.max(var_30_31, arg_27_1.talkMaxDuration)

			if var_30_30 <= arg_27_1.time_ and arg_27_1.time_ < var_30_30 + var_30_37 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_30) / var_30_37

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_30 + var_30_37 and arg_27_1.time_ < var_30_30 + var_30_37 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319411008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319411008
		arg_31_1.duration_ = 5.466

		local var_31_0 = {
			zh = 3.7,
			ja = 5.466
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
				arg_31_0:Play319411009(arg_31_1)
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
				arg_31_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_15 = 0
			local var_34_16 = 0.4

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_17 = arg_31_1:FormatText(StoryNameCfg[471].name)

				arg_31_1.leftNameTxt_.text = var_34_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_18 = arg_31_1:GetWordFromCfg(319411008)
				local var_34_19 = arg_31_1:FormatText(var_34_18.content)

				arg_31_1.text_.text = var_34_19

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_20 = 16
				local var_34_21 = utf8.len(var_34_19)
				local var_34_22 = var_34_20 <= 0 and var_34_16 or var_34_16 * (var_34_21 / var_34_20)

				if var_34_22 > 0 and var_34_16 < var_34_22 then
					arg_31_1.talkMaxDuration = var_34_22

					if var_34_22 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_22 + var_34_15
					end
				end

				arg_31_1.text_.text = var_34_19
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411008", "story_v_out_319411.awb") ~= 0 then
					local var_34_23 = manager.audio:GetVoiceLength("story_v_out_319411", "319411008", "story_v_out_319411.awb") / 1000

					if var_34_23 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_23 + var_34_15
					end

					if var_34_18.prefab_name ~= "" and arg_31_1.actors_[var_34_18.prefab_name] ~= nil then
						local var_34_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_18.prefab_name].transform, "story_v_out_319411", "319411008", "story_v_out_319411.awb")

						arg_31_1:RecordAudio("319411008", var_34_24)
						arg_31_1:RecordAudio("319411008", var_34_24)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319411", "319411008", "story_v_out_319411.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319411", "319411008", "story_v_out_319411.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_25 = math.max(var_34_16, arg_31_1.talkMaxDuration)

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_25 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_15) / var_34_25

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_15 + var_34_25 and arg_31_1.time_ < var_34_15 + var_34_25 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319411009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319411009
		arg_35_1.duration_ = 3.833

		local var_35_0 = {
			zh = 1.999999999999,
			ja = 3.833
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
				arg_35_0:Play319411010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "10066ui_story"

			if arg_35_1.actors_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(Asset.Load("Char/" .. var_38_0), arg_35_1.stage_.transform)

				var_38_1.name = var_38_0
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.actors_[var_38_0] = var_38_1

				local var_38_2 = var_38_1:GetComponentInChildren(typeof(CharacterEffect))

				var_38_2.enabled = true

				local var_38_3 = GameObjectTools.GetOrAddComponent(var_38_1, typeof(DynamicBoneHelper))

				if var_38_3 then
					var_38_3:EnableDynamicBone(false)
				end

				arg_35_1:ShowWeapon(var_38_2.transform, false)

				arg_35_1.var_[var_38_0 .. "Animator"] = var_38_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_35_1.var_[var_38_0 .. "Animator"].applyRootMotion = true
				arg_35_1.var_[var_38_0 .. "LipSync"] = var_38_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_38_4 = arg_35_1.actors_["10066ui_story"].transform
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.var_.moveOldPos10066ui_story = var_38_4.localPosition
			end

			local var_38_6 = 0.001

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6
				local var_38_8 = Vector3.New(0.7, -0.99, -5.83)

				var_38_4.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10066ui_story, var_38_8, var_38_7)

				local var_38_9 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_9.x, var_38_9.y, var_38_9.z)

				local var_38_10 = var_38_4.localEulerAngles

				var_38_10.z = 0
				var_38_10.x = 0
				var_38_4.localEulerAngles = var_38_10
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 then
				var_38_4.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_38_11 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_11.x, var_38_11.y, var_38_11.z)

				local var_38_12 = var_38_4.localEulerAngles

				var_38_12.z = 0
				var_38_12.x = 0
				var_38_4.localEulerAngles = var_38_12
			end

			local var_38_13 = arg_35_1.actors_["10066ui_story"]
			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 and arg_35_1.var_.characterEffect10066ui_story == nil then
				arg_35_1.var_.characterEffect10066ui_story = var_38_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_15 = 0.200000002980232

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_15 then
				local var_38_16 = (arg_35_1.time_ - var_38_14) / var_38_15

				if arg_35_1.var_.characterEffect10066ui_story then
					arg_35_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_14 + var_38_15 and arg_35_1.time_ < var_38_14 + var_38_15 + arg_38_0 and arg_35_1.var_.characterEffect10066ui_story then
				arg_35_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_38_17 = 0

			if var_38_17 < arg_35_1.time_ and arg_35_1.time_ <= var_38_17 + arg_38_0 then
				arg_35_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action7_1")
			end

			local var_38_18 = 0

			if var_38_18 < arg_35_1.time_ and arg_35_1.time_ <= var_38_18 + arg_38_0 then
				arg_35_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_38_19 = arg_35_1.actors_["1095ui_story"].transform
			local var_38_20 = 0

			if var_38_20 < arg_35_1.time_ and arg_35_1.time_ <= var_38_20 + arg_38_0 then
				arg_35_1.var_.moveOldPos1095ui_story = var_38_19.localPosition
			end

			local var_38_21 = 0.001

			if var_38_20 <= arg_35_1.time_ and arg_35_1.time_ < var_38_20 + var_38_21 then
				local var_38_22 = (arg_35_1.time_ - var_38_20) / var_38_21
				local var_38_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_38_19.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1095ui_story, var_38_23, var_38_22)

				local var_38_24 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_24.x, var_38_24.y, var_38_24.z)

				local var_38_25 = var_38_19.localEulerAngles

				var_38_25.z = 0
				var_38_25.x = 0
				var_38_19.localEulerAngles = var_38_25
			end

			if arg_35_1.time_ >= var_38_20 + var_38_21 and arg_35_1.time_ < var_38_20 + var_38_21 + arg_38_0 then
				var_38_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_38_26 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_26.x, var_38_26.y, var_38_26.z)

				local var_38_27 = var_38_19.localEulerAngles

				var_38_27.z = 0
				var_38_27.x = 0
				var_38_19.localEulerAngles = var_38_27
			end

			local var_38_28 = arg_35_1.actors_["1095ui_story"]
			local var_38_29 = 0

			if var_38_29 < arg_35_1.time_ and arg_35_1.time_ <= var_38_29 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story == nil then
				arg_35_1.var_.characterEffect1095ui_story = var_38_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_30 = 0.200000002980232

			if var_38_29 <= arg_35_1.time_ and arg_35_1.time_ < var_38_29 + var_38_30 then
				local var_38_31 = (arg_35_1.time_ - var_38_29) / var_38_30

				if arg_35_1.var_.characterEffect1095ui_story then
					local var_38_32 = Mathf.Lerp(0, 0.5, var_38_31)

					arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_32
				end
			end

			if arg_35_1.time_ >= var_38_29 + var_38_30 and arg_35_1.time_ < var_38_29 + var_38_30 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				local var_38_33 = 0.5

				arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_33
			end

			local var_38_34 = 0
			local var_38_35 = 0.175

			if var_38_34 < arg_35_1.time_ and arg_35_1.time_ <= var_38_34 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_36 = arg_35_1:FormatText(StoryNameCfg[640].name)

				arg_35_1.leftNameTxt_.text = var_38_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_37 = arg_35_1:GetWordFromCfg(319411009)
				local var_38_38 = arg_35_1:FormatText(var_38_37.content)

				arg_35_1.text_.text = var_38_38

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_39 = 7
				local var_38_40 = utf8.len(var_38_38)
				local var_38_41 = var_38_39 <= 0 and var_38_35 or var_38_35 * (var_38_40 / var_38_39)

				if var_38_41 > 0 and var_38_35 < var_38_41 then
					arg_35_1.talkMaxDuration = var_38_41

					if var_38_41 + var_38_34 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_41 + var_38_34
					end
				end

				arg_35_1.text_.text = var_38_38
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411009", "story_v_out_319411.awb") ~= 0 then
					local var_38_42 = manager.audio:GetVoiceLength("story_v_out_319411", "319411009", "story_v_out_319411.awb") / 1000

					if var_38_42 + var_38_34 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_42 + var_38_34
					end

					if var_38_37.prefab_name ~= "" and arg_35_1.actors_[var_38_37.prefab_name] ~= nil then
						local var_38_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_37.prefab_name].transform, "story_v_out_319411", "319411009", "story_v_out_319411.awb")

						arg_35_1:RecordAudio("319411009", var_38_43)
						arg_35_1:RecordAudio("319411009", var_38_43)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319411", "319411009", "story_v_out_319411.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319411", "319411009", "story_v_out_319411.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_44 = math.max(var_38_35, arg_35_1.talkMaxDuration)

			if var_38_34 <= arg_35_1.time_ and arg_35_1.time_ < var_38_34 + var_38_44 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_34) / var_38_44

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_34 + var_38_44 and arg_35_1.time_ < var_38_34 + var_38_44 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319411010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319411010
		arg_39_1.duration_ = 5.6

		local var_39_0 = {
			zh = 1.3,
			ja = 5.6
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
				arg_39_0:Play319411011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10066ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10066ui_story == nil then
				arg_39_1.var_.characterEffect10066ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10066ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_39_1.var_.characterEffect10066ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10066ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_39_1.var_.characterEffect10066ui_story.fillRatio = var_42_5
			end

			local var_42_6 = arg_39_1.actors_["1095ui_story"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story == nil then
				arg_39_1.var_.characterEffect1095ui_story = var_42_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_8 = 0.200000002980232

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.characterEffect1095ui_story then
					arg_39_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story then
				arg_39_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_42_10 = 0
			local var_42_11 = 0.125

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_12 = arg_39_1:FormatText(StoryNameCfg[471].name)

				arg_39_1.leftNameTxt_.text = var_42_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_13 = arg_39_1:GetWordFromCfg(319411010)
				local var_42_14 = arg_39_1:FormatText(var_42_13.content)

				arg_39_1.text_.text = var_42_14

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_15 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411010", "story_v_out_319411.awb") ~= 0 then
					local var_42_18 = manager.audio:GetVoiceLength("story_v_out_319411", "319411010", "story_v_out_319411.awb") / 1000

					if var_42_18 + var_42_10 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_18 + var_42_10
					end

					if var_42_13.prefab_name ~= "" and arg_39_1.actors_[var_42_13.prefab_name] ~= nil then
						local var_42_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_13.prefab_name].transform, "story_v_out_319411", "319411010", "story_v_out_319411.awb")

						arg_39_1:RecordAudio("319411010", var_42_19)
						arg_39_1:RecordAudio("319411010", var_42_19)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319411", "319411010", "story_v_out_319411.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319411", "319411010", "story_v_out_319411.awb")
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
	Play319411011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319411011
		arg_43_1.duration_ = 9.533

		local var_43_0 = {
			zh = 1.999999999999,
			ja = 9.533
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
				arg_43_0:Play319411012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10066ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect10066ui_story == nil then
				arg_43_1.var_.characterEffect10066ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect10066ui_story then
					arg_43_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect10066ui_story then
				arg_43_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["1095ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and arg_43_1.var_.characterEffect1095ui_story == nil then
				arg_43_1.var_.characterEffect1095ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.200000002980232

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect1095ui_story then
					local var_46_8 = Mathf.Lerp(0, 0.5, var_46_7)

					arg_43_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1095ui_story.fillRatio = var_46_8
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect1095ui_story then
				local var_46_9 = 0.5

				arg_43_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1095ui_story.fillRatio = var_46_9
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_46_11 = 0
			local var_46_12 = 0.125

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_13 = arg_43_1:FormatText(StoryNameCfg[640].name)

				arg_43_1.leftNameTxt_.text = var_46_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_14 = arg_43_1:GetWordFromCfg(319411011)
				local var_46_15 = arg_43_1:FormatText(var_46_14.content)

				arg_43_1.text_.text = var_46_15

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_16 = 5
				local var_46_17 = utf8.len(var_46_15)
				local var_46_18 = var_46_16 <= 0 and var_46_12 or var_46_12 * (var_46_17 / var_46_16)

				if var_46_18 > 0 and var_46_12 < var_46_18 then
					arg_43_1.talkMaxDuration = var_46_18

					if var_46_18 + var_46_11 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_18 + var_46_11
					end
				end

				arg_43_1.text_.text = var_46_15
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411011", "story_v_out_319411.awb") ~= 0 then
					local var_46_19 = manager.audio:GetVoiceLength("story_v_out_319411", "319411011", "story_v_out_319411.awb") / 1000

					if var_46_19 + var_46_11 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_11
					end

					if var_46_14.prefab_name ~= "" and arg_43_1.actors_[var_46_14.prefab_name] ~= nil then
						local var_46_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_14.prefab_name].transform, "story_v_out_319411", "319411011", "story_v_out_319411.awb")

						arg_43_1:RecordAudio("319411011", var_46_20)
						arg_43_1:RecordAudio("319411011", var_46_20)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319411", "319411011", "story_v_out_319411.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319411", "319411011", "story_v_out_319411.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_21 = math.max(var_46_12, arg_43_1.talkMaxDuration)

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_21 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_11) / var_46_21

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_11 + var_46_21 and arg_43_1.time_ < var_46_11 + var_46_21 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319411012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319411012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play319411013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10066ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect10066ui_story == nil then
				arg_47_1.var_.characterEffect10066ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect10066ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_47_1.var_.characterEffect10066ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect10066ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_47_1.var_.characterEffect10066ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0
			local var_50_7 = 1.25

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_8 = arg_47_1:GetWordFromCfg(319411012)
				local var_50_9 = arg_47_1:FormatText(var_50_8.content)

				arg_47_1.text_.text = var_50_9

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_10 = 50
				local var_50_11 = utf8.len(var_50_9)
				local var_50_12 = var_50_10 <= 0 and var_50_7 or var_50_7 * (var_50_11 / var_50_10)

				if var_50_12 > 0 and var_50_7 < var_50_12 then
					arg_47_1.talkMaxDuration = var_50_12

					if var_50_12 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_12 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_9
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_13 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_13 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_13

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_13 and arg_47_1.time_ < var_50_6 + var_50_13 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319411013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319411013
		arg_51_1.duration_ = 14.933

		local var_51_0 = {
			zh = 8.433,
			ja = 14.933
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
				arg_51_0:Play319411014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10066ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10066ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0.7, -0.99, -5.83)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10066ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["10066ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect10066ui_story == nil then
				arg_51_1.var_.characterEffect10066ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect10066ui_story then
					arg_51_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect10066ui_story then
				arg_51_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action7_2")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_54_15 = 0
			local var_54_16 = 0.9

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_17 = arg_51_1:FormatText(StoryNameCfg[640].name)

				arg_51_1.leftNameTxt_.text = var_54_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_18 = arg_51_1:GetWordFromCfg(319411013)
				local var_54_19 = arg_51_1:FormatText(var_54_18.content)

				arg_51_1.text_.text = var_54_19

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_20 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411013", "story_v_out_319411.awb") ~= 0 then
					local var_54_23 = manager.audio:GetVoiceLength("story_v_out_319411", "319411013", "story_v_out_319411.awb") / 1000

					if var_54_23 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_23 + var_54_15
					end

					if var_54_18.prefab_name ~= "" and arg_51_1.actors_[var_54_18.prefab_name] ~= nil then
						local var_54_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_18.prefab_name].transform, "story_v_out_319411", "319411013", "story_v_out_319411.awb")

						arg_51_1:RecordAudio("319411013", var_54_24)
						arg_51_1:RecordAudio("319411013", var_54_24)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319411", "319411013", "story_v_out_319411.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319411", "319411013", "story_v_out_319411.awb")
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
	Play319411014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319411014
		arg_55_1.duration_ = 10.8

		local var_55_0 = {
			zh = 10.8,
			ja = 10.133
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
				arg_55_0:Play319411015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.2

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[640].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(319411014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 48
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411014", "story_v_out_319411.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_319411", "319411014", "story_v_out_319411.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_319411", "319411014", "story_v_out_319411.awb")

						arg_55_1:RecordAudio("319411014", var_58_9)
						arg_55_1:RecordAudio("319411014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_319411", "319411014", "story_v_out_319411.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_319411", "319411014", "story_v_out_319411.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play319411015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319411015
		arg_59_1.duration_ = 4.7

		local var_59_0 = {
			zh = 4.066,
			ja = 4.7
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
				arg_59_0:Play319411016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1095ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1095ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1095ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = arg_59_1.actors_["1095ui_story"]
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story == nil then
				arg_59_1.var_.characterEffect1095ui_story = var_62_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_11 = 0.200000002980232

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11

				if arg_59_1.var_.characterEffect1095ui_story then
					arg_59_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story then
				arg_59_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_62_13 = 0

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_15 = arg_59_1.actors_["10066ui_story"]
			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 and arg_59_1.var_.characterEffect10066ui_story == nil then
				arg_59_1.var_.characterEffect10066ui_story = var_62_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_17 = 0.200000002980232

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_17 then
				local var_62_18 = (arg_59_1.time_ - var_62_16) / var_62_17

				if arg_59_1.var_.characterEffect10066ui_story then
					local var_62_19 = Mathf.Lerp(0, 0.5, var_62_18)

					arg_59_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_59_1.var_.characterEffect10066ui_story.fillRatio = var_62_19
				end
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 and arg_59_1.var_.characterEffect10066ui_story then
				local var_62_20 = 0.5

				arg_59_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_59_1.var_.characterEffect10066ui_story.fillRatio = var_62_20
			end

			local var_62_21 = 0
			local var_62_22 = 0.45

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_23 = arg_59_1:FormatText(StoryNameCfg[471].name)

				arg_59_1.leftNameTxt_.text = var_62_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_24 = arg_59_1:GetWordFromCfg(319411015)
				local var_62_25 = arg_59_1:FormatText(var_62_24.content)

				arg_59_1.text_.text = var_62_25

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_26 = 18
				local var_62_27 = utf8.len(var_62_25)
				local var_62_28 = var_62_26 <= 0 and var_62_22 or var_62_22 * (var_62_27 / var_62_26)

				if var_62_28 > 0 and var_62_22 < var_62_28 then
					arg_59_1.talkMaxDuration = var_62_28

					if var_62_28 + var_62_21 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_28 + var_62_21
					end
				end

				arg_59_1.text_.text = var_62_25
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411015", "story_v_out_319411.awb") ~= 0 then
					local var_62_29 = manager.audio:GetVoiceLength("story_v_out_319411", "319411015", "story_v_out_319411.awb") / 1000

					if var_62_29 + var_62_21 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_29 + var_62_21
					end

					if var_62_24.prefab_name ~= "" and arg_59_1.actors_[var_62_24.prefab_name] ~= nil then
						local var_62_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_24.prefab_name].transform, "story_v_out_319411", "319411015", "story_v_out_319411.awb")

						arg_59_1:RecordAudio("319411015", var_62_30)
						arg_59_1:RecordAudio("319411015", var_62_30)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_319411", "319411015", "story_v_out_319411.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_319411", "319411015", "story_v_out_319411.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_31 = math.max(var_62_22, arg_59_1.talkMaxDuration)

			if var_62_21 <= arg_59_1.time_ and arg_59_1.time_ < var_62_21 + var_62_31 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_21) / var_62_31

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_21 + var_62_31 and arg_59_1.time_ < var_62_21 + var_62_31 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319411016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319411016
		arg_63_1.duration_ = 10.4

		local var_63_0 = {
			zh = 10.4,
			ja = 6.633
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
				arg_63_0:Play319411017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10066ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos10066ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0.7, -0.99, -5.83)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10066ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["10066ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect10066ui_story == nil then
				arg_63_1.var_.characterEffect10066ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect10066ui_story then
					arg_63_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect10066ui_story then
				arg_63_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action1_1")
			end

			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_15 = arg_63_1.actors_["1095ui_story"]
			local var_66_16 = 0

			if var_66_16 < arg_63_1.time_ and arg_63_1.time_ <= var_66_16 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story == nil then
				arg_63_1.var_.characterEffect1095ui_story = var_66_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_17 = 0.200000002980232

			if var_66_16 <= arg_63_1.time_ and arg_63_1.time_ < var_66_16 + var_66_17 then
				local var_66_18 = (arg_63_1.time_ - var_66_16) / var_66_17

				if arg_63_1.var_.characterEffect1095ui_story then
					local var_66_19 = Mathf.Lerp(0, 0.5, var_66_18)

					arg_63_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1095ui_story.fillRatio = var_66_19
				end
			end

			if arg_63_1.time_ >= var_66_16 + var_66_17 and arg_63_1.time_ < var_66_16 + var_66_17 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story then
				local var_66_20 = 0.5

				arg_63_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1095ui_story.fillRatio = var_66_20
			end

			local var_66_21 = 0
			local var_66_22 = 1

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_23 = arg_63_1:FormatText(StoryNameCfg[640].name)

				arg_63_1.leftNameTxt_.text = var_66_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_24 = arg_63_1:GetWordFromCfg(319411016)
				local var_66_25 = arg_63_1:FormatText(var_66_24.content)

				arg_63_1.text_.text = var_66_25

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_26 = 40
				local var_66_27 = utf8.len(var_66_25)
				local var_66_28 = var_66_26 <= 0 and var_66_22 or var_66_22 * (var_66_27 / var_66_26)

				if var_66_28 > 0 and var_66_22 < var_66_28 then
					arg_63_1.talkMaxDuration = var_66_28

					if var_66_28 + var_66_21 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_28 + var_66_21
					end
				end

				arg_63_1.text_.text = var_66_25
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411016", "story_v_out_319411.awb") ~= 0 then
					local var_66_29 = manager.audio:GetVoiceLength("story_v_out_319411", "319411016", "story_v_out_319411.awb") / 1000

					if var_66_29 + var_66_21 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_29 + var_66_21
					end

					if var_66_24.prefab_name ~= "" and arg_63_1.actors_[var_66_24.prefab_name] ~= nil then
						local var_66_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_24.prefab_name].transform, "story_v_out_319411", "319411016", "story_v_out_319411.awb")

						arg_63_1:RecordAudio("319411016", var_66_30)
						arg_63_1:RecordAudio("319411016", var_66_30)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_319411", "319411016", "story_v_out_319411.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_319411", "319411016", "story_v_out_319411.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_31 = math.max(var_66_22, arg_63_1.talkMaxDuration)

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_31 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_21) / var_66_31

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_21 + var_66_31 and arg_63_1.time_ < var_66_21 + var_66_31 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play319411017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319411017
		arg_67_1.duration_ = 7.1

		local var_67_0 = {
			zh = 7.1,
			ja = 5.533
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
				arg_67_0:Play319411018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10066ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story == nil then
				arg_67_1.var_.characterEffect10066ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect10066ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10066ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10066ui_story.fillRatio = var_70_5
			end

			local var_70_6 = arg_67_1.actors_["1095ui_story"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story == nil then
				arg_67_1.var_.characterEffect1095ui_story = var_70_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_8 = 0.200000002980232

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.characterEffect1095ui_story then
					arg_67_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story then
				arg_67_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_70_10 = 0
			local var_70_11 = 0.8

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_12 = arg_67_1:FormatText(StoryNameCfg[471].name)

				arg_67_1.leftNameTxt_.text = var_70_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_13 = arg_67_1:GetWordFromCfg(319411017)
				local var_70_14 = arg_67_1:FormatText(var_70_13.content)

				arg_67_1.text_.text = var_70_14

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_15 = 32
				local var_70_16 = utf8.len(var_70_14)
				local var_70_17 = var_70_15 <= 0 and var_70_11 or var_70_11 * (var_70_16 / var_70_15)

				if var_70_17 > 0 and var_70_11 < var_70_17 then
					arg_67_1.talkMaxDuration = var_70_17

					if var_70_17 + var_70_10 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_17 + var_70_10
					end
				end

				arg_67_1.text_.text = var_70_14
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411017", "story_v_out_319411.awb") ~= 0 then
					local var_70_18 = manager.audio:GetVoiceLength("story_v_out_319411", "319411017", "story_v_out_319411.awb") / 1000

					if var_70_18 + var_70_10 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_10
					end

					if var_70_13.prefab_name ~= "" and arg_67_1.actors_[var_70_13.prefab_name] ~= nil then
						local var_70_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_13.prefab_name].transform, "story_v_out_319411", "319411017", "story_v_out_319411.awb")

						arg_67_1:RecordAudio("319411017", var_70_19)
						arg_67_1:RecordAudio("319411017", var_70_19)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_319411", "319411017", "story_v_out_319411.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_319411", "319411017", "story_v_out_319411.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_20 = math.max(var_70_11, arg_67_1.talkMaxDuration)

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_20 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_10) / var_70_20

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_10 + var_70_20 and arg_67_1.time_ < var_70_10 + var_70_20 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319411018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319411018
		arg_71_1.duration_ = 4.066

		local var_71_0 = {
			zh = 2.633,
			ja = 4.066
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
				arg_71_0:Play319411019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10066ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect10066ui_story == nil then
				arg_71_1.var_.characterEffect10066ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect10066ui_story then
					arg_71_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect10066ui_story then
				arg_71_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_74_4 = arg_71_1.actors_["1095ui_story"]
			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 and arg_71_1.var_.characterEffect1095ui_story == nil then
				arg_71_1.var_.characterEffect1095ui_story = var_74_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_6 = 0.200000002980232

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_6 then
				local var_74_7 = (arg_71_1.time_ - var_74_5) / var_74_6

				if arg_71_1.var_.characterEffect1095ui_story then
					local var_74_8 = Mathf.Lerp(0, 0.5, var_74_7)

					arg_71_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1095ui_story.fillRatio = var_74_8
				end
			end

			if arg_71_1.time_ >= var_74_5 + var_74_6 and arg_71_1.time_ < var_74_5 + var_74_6 + arg_74_0 and arg_71_1.var_.characterEffect1095ui_story then
				local var_74_9 = 0.5

				arg_71_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1095ui_story.fillRatio = var_74_9
			end

			local var_74_10 = 0
			local var_74_11 = 0.275

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_12 = arg_71_1:FormatText(StoryNameCfg[640].name)

				arg_71_1.leftNameTxt_.text = var_74_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_13 = arg_71_1:GetWordFromCfg(319411018)
				local var_74_14 = arg_71_1:FormatText(var_74_13.content)

				arg_71_1.text_.text = var_74_14

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_15 = 11
				local var_74_16 = utf8.len(var_74_14)
				local var_74_17 = var_74_15 <= 0 and var_74_11 or var_74_11 * (var_74_16 / var_74_15)

				if var_74_17 > 0 and var_74_11 < var_74_17 then
					arg_71_1.talkMaxDuration = var_74_17

					if var_74_17 + var_74_10 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_17 + var_74_10
					end
				end

				arg_71_1.text_.text = var_74_14
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411018", "story_v_out_319411.awb") ~= 0 then
					local var_74_18 = manager.audio:GetVoiceLength("story_v_out_319411", "319411018", "story_v_out_319411.awb") / 1000

					if var_74_18 + var_74_10 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_18 + var_74_10
					end

					if var_74_13.prefab_name ~= "" and arg_71_1.actors_[var_74_13.prefab_name] ~= nil then
						local var_74_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_13.prefab_name].transform, "story_v_out_319411", "319411018", "story_v_out_319411.awb")

						arg_71_1:RecordAudio("319411018", var_74_19)
						arg_71_1:RecordAudio("319411018", var_74_19)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_319411", "319411018", "story_v_out_319411.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_319411", "319411018", "story_v_out_319411.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_20 = math.max(var_74_11, arg_71_1.talkMaxDuration)

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_20 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_10) / var_74_20

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_10 + var_74_20 and arg_71_1.time_ < var_74_10 + var_74_20 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play319411019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319411019
		arg_75_1.duration_ = 14.1

		local var_75_0 = {
			zh = 1.999999999999,
			ja = 14.1
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
				arg_75_0:Play319411020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10066ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect10066ui_story == nil then
				arg_75_1.var_.characterEffect10066ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect10066ui_story then
					local var_78_4 = Mathf.Lerp(0, 0.5, var_78_3)

					arg_75_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_75_1.var_.characterEffect10066ui_story.fillRatio = var_78_4
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect10066ui_story then
				local var_78_5 = 0.5

				arg_75_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_75_1.var_.characterEffect10066ui_story.fillRatio = var_78_5
			end

			local var_78_6 = arg_75_1.actors_["1095ui_story"]
			local var_78_7 = 0

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 and arg_75_1.var_.characterEffect1095ui_story == nil then
				arg_75_1.var_.characterEffect1095ui_story = var_78_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_8 = 0.200000002980232

			if var_78_7 <= arg_75_1.time_ and arg_75_1.time_ < var_78_7 + var_78_8 then
				local var_78_9 = (arg_75_1.time_ - var_78_7) / var_78_8

				if arg_75_1.var_.characterEffect1095ui_story then
					arg_75_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_7 + var_78_8 and arg_75_1.time_ < var_78_7 + var_78_8 + arg_78_0 and arg_75_1.var_.characterEffect1095ui_story then
				arg_75_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_78_11 = 0

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				arg_75_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_12 = 0
			local var_78_13 = 0.225

			if var_78_12 < arg_75_1.time_ and arg_75_1.time_ <= var_78_12 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_14 = arg_75_1:FormatText(StoryNameCfg[471].name)

				arg_75_1.leftNameTxt_.text = var_78_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_15 = arg_75_1:GetWordFromCfg(319411019)
				local var_78_16 = arg_75_1:FormatText(var_78_15.content)

				arg_75_1.text_.text = var_78_16

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_17 = 9
				local var_78_18 = utf8.len(var_78_16)
				local var_78_19 = var_78_17 <= 0 and var_78_13 or var_78_13 * (var_78_18 / var_78_17)

				if var_78_19 > 0 and var_78_13 < var_78_19 then
					arg_75_1.talkMaxDuration = var_78_19

					if var_78_19 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_19 + var_78_12
					end
				end

				arg_75_1.text_.text = var_78_16
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411019", "story_v_out_319411.awb") ~= 0 then
					local var_78_20 = manager.audio:GetVoiceLength("story_v_out_319411", "319411019", "story_v_out_319411.awb") / 1000

					if var_78_20 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_20 + var_78_12
					end

					if var_78_15.prefab_name ~= "" and arg_75_1.actors_[var_78_15.prefab_name] ~= nil then
						local var_78_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_15.prefab_name].transform, "story_v_out_319411", "319411019", "story_v_out_319411.awb")

						arg_75_1:RecordAudio("319411019", var_78_21)
						arg_75_1:RecordAudio("319411019", var_78_21)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319411", "319411019", "story_v_out_319411.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319411", "319411019", "story_v_out_319411.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_22 = math.max(var_78_13, arg_75_1.talkMaxDuration)

			if var_78_12 <= arg_75_1.time_ and arg_75_1.time_ < var_78_12 + var_78_22 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_12) / var_78_22

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_12 + var_78_22 and arg_75_1.time_ < var_78_12 + var_78_22 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play319411020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319411020
		arg_79_1.duration_ = 5.266333333332

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play319411021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = "STblack"

			if arg_79_1.bgs_[var_82_0] == nil then
				local var_82_1 = Object.Instantiate(arg_79_1.paintGo_)

				var_82_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_82_0)
				var_82_1.name = var_82_0
				var_82_1.transform.parent = arg_79_1.stage_.transform
				var_82_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_79_1.bgs_[var_82_0] = var_82_1
			end

			local var_82_2 = 0

			if var_82_2 < arg_79_1.time_ and arg_79_1.time_ <= var_82_2 + arg_82_0 then
				local var_82_3 = manager.ui.mainCamera.transform.localPosition
				local var_82_4 = Vector3.New(0, 0, 10) + Vector3.New(var_82_3.x, var_82_3.y, 0)
				local var_82_5 = arg_79_1.bgs_.STblack

				var_82_5.transform.localPosition = var_82_4
				var_82_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_82_6 = var_82_5:GetComponent("SpriteRenderer")

				if var_82_6 and var_82_6.sprite then
					local var_82_7 = (var_82_5.transform.localPosition - var_82_3).z
					local var_82_8 = manager.ui.mainCameraCom_
					local var_82_9 = 2 * var_82_7 * Mathf.Tan(var_82_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_82_10 = var_82_9 * var_82_8.aspect
					local var_82_11 = var_82_6.sprite.bounds.size.x
					local var_82_12 = var_82_6.sprite.bounds.size.y
					local var_82_13 = var_82_10 / var_82_11
					local var_82_14 = var_82_9 / var_82_12
					local var_82_15 = var_82_14 < var_82_13 and var_82_13 or var_82_14

					var_82_5.transform.localScale = Vector3.New(var_82_15, var_82_15, 0)
				end

				for iter_82_0, iter_82_1 in pairs(arg_79_1.bgs_) do
					if iter_82_0 ~= "STblack" then
						iter_82_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 then
				local var_82_17 = arg_79_1.fswbg_.transform:Find("textbox/adapt/content") or arg_79_1.fswbg_.transform:Find("textbox/content")
				local var_82_18 = var_82_17:GetComponent("Text")
				local var_82_19 = var_82_17:GetComponent("RectTransform")

				var_82_18.alignment = UnityEngine.TextAnchor.LowerCenter
				var_82_19.offsetMin = Vector2.New(0, 0)
				var_82_19.offsetMax = Vector2.New(0, 0)
			end

			local var_82_20 = 0

			if var_82_20 < arg_79_1.time_ and arg_79_1.time_ <= var_82_20 + arg_82_0 then
				arg_79_1.fswbg_:SetActive(true)
				arg_79_1.dialog_:SetActive(false)

				arg_79_1.fswtw_.percent = 0

				local var_82_21 = arg_79_1:GetWordFromCfg(319411020)
				local var_82_22 = arg_79_1:FormatText(var_82_21.content)

				arg_79_1.fswt_.text = var_82_22

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.fswt_)

				arg_79_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_79_1.fswtw_:SetDirty()

				arg_79_1.typewritterCharCountI18N = 0

				SetActive(arg_79_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_79_1:ShowNextGo(false)
			end

			local var_82_23 = 0.333333333333333

			if var_82_23 < arg_79_1.time_ and arg_79_1.time_ <= var_82_23 + arg_82_0 then
				arg_79_1.var_.oldValueTypewriter = arg_79_1.fswtw_.percent

				arg_79_1:ShowNextGo(false)
			end

			local var_82_24 = 16
			local var_82_25 = 1.06666666666667
			local var_82_26 = arg_79_1:GetWordFromCfg(319411020)
			local var_82_27 = arg_79_1:FormatText(var_82_26.content)
			local var_82_28, var_82_29 = arg_79_1:GetPercentByPara(var_82_27, 1)

			if var_82_23 < arg_79_1.time_ and arg_79_1.time_ <= var_82_23 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0

				local var_82_30 = var_82_24 <= 0 and var_82_25 or var_82_25 * ((var_82_29 - arg_79_1.typewritterCharCountI18N) / var_82_24)

				if var_82_30 > 0 and var_82_25 < var_82_30 then
					arg_79_1.talkMaxDuration = var_82_30

					if var_82_30 + var_82_23 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_30 + var_82_23
					end
				end
			end

			local var_82_31 = 1.06666666666667
			local var_82_32 = math.max(var_82_31, arg_79_1.talkMaxDuration)

			if var_82_23 <= arg_79_1.time_ and arg_79_1.time_ < var_82_23 + var_82_32 then
				local var_82_33 = (arg_79_1.time_ - var_82_23) / var_82_32

				arg_79_1.fswtw_.percent = Mathf.Lerp(arg_79_1.var_.oldValueTypewriter, var_82_28, var_82_33)
				arg_79_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_79_1.fswtw_:SetDirty()
			end

			if arg_79_1.time_ >= var_82_23 + var_82_32 and arg_79_1.time_ < var_82_23 + var_82_32 + arg_82_0 then
				arg_79_1.fswtw_.percent = var_82_28

				arg_79_1.fswtw_:SetDirty()
				arg_79_1:ShowNextGo(true)

				arg_79_1.typewritterCharCountI18N = var_82_29
			end

			local var_82_34 = 0

			if var_82_34 < arg_79_1.time_ and arg_79_1.time_ <= var_82_34 + arg_82_0 then
				arg_79_1.cswbg_:SetActive(true)

				local var_82_35 = arg_79_1.cswt_:GetComponent("RectTransform")

				arg_79_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_82_35.offsetMin = Vector2.New(410, 330)
				var_82_35.offsetMax = Vector2.New(-400, -175)

				local var_82_36 = arg_79_1:GetWordFromCfg(419018)
				local var_82_37 = arg_79_1:FormatText(var_82_36.content)

				arg_79_1.cswt_.text = var_82_37

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.cswt_)

				arg_79_1.cswt_.fontSize = 180
				arg_79_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_79_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_82_38 = arg_79_1.actors_["1095ui_story"].transform
			local var_82_39 = 0

			if var_82_39 < arg_79_1.time_ and arg_79_1.time_ <= var_82_39 + arg_82_0 then
				arg_79_1.var_.moveOldPos1095ui_story = var_82_38.localPosition
			end

			local var_82_40 = 0.001

			if var_82_39 <= arg_79_1.time_ and arg_79_1.time_ < var_82_39 + var_82_40 then
				local var_82_41 = (arg_79_1.time_ - var_82_39) / var_82_40
				local var_82_42 = Vector3.New(0, 100, 0)

				var_82_38.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1095ui_story, var_82_42, var_82_41)

				local var_82_43 = manager.ui.mainCamera.transform.position - var_82_38.position

				var_82_38.forward = Vector3.New(var_82_43.x, var_82_43.y, var_82_43.z)

				local var_82_44 = var_82_38.localEulerAngles

				var_82_44.z = 0
				var_82_44.x = 0
				var_82_38.localEulerAngles = var_82_44
			end

			if arg_79_1.time_ >= var_82_39 + var_82_40 and arg_79_1.time_ < var_82_39 + var_82_40 + arg_82_0 then
				var_82_38.localPosition = Vector3.New(0, 100, 0)

				local var_82_45 = manager.ui.mainCamera.transform.position - var_82_38.position

				var_82_38.forward = Vector3.New(var_82_45.x, var_82_45.y, var_82_45.z)

				local var_82_46 = var_82_38.localEulerAngles

				var_82_46.z = 0
				var_82_46.x = 0
				var_82_38.localEulerAngles = var_82_46
			end

			local var_82_47 = arg_79_1.actors_["10066ui_story"].transform
			local var_82_48 = 0

			if var_82_48 < arg_79_1.time_ and arg_79_1.time_ <= var_82_48 + arg_82_0 then
				arg_79_1.var_.moveOldPos10066ui_story = var_82_47.localPosition
			end

			local var_82_49 = 0.001

			if var_82_48 <= arg_79_1.time_ and arg_79_1.time_ < var_82_48 + var_82_49 then
				local var_82_50 = (arg_79_1.time_ - var_82_48) / var_82_49
				local var_82_51 = Vector3.New(0, 100, 0)

				var_82_47.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10066ui_story, var_82_51, var_82_50)

				local var_82_52 = manager.ui.mainCamera.transform.position - var_82_47.position

				var_82_47.forward = Vector3.New(var_82_52.x, var_82_52.y, var_82_52.z)

				local var_82_53 = var_82_47.localEulerAngles

				var_82_53.z = 0
				var_82_53.x = 0
				var_82_47.localEulerAngles = var_82_53
			end

			if arg_79_1.time_ >= var_82_48 + var_82_49 and arg_79_1.time_ < var_82_48 + var_82_49 + arg_82_0 then
				var_82_47.localPosition = Vector3.New(0, 100, 0)

				local var_82_54 = manager.ui.mainCamera.transform.position - var_82_47.position

				var_82_47.forward = Vector3.New(var_82_54.x, var_82_54.y, var_82_54.z)

				local var_82_55 = var_82_47.localEulerAngles

				var_82_55.z = 0
				var_82_55.x = 0
				var_82_47.localEulerAngles = var_82_55
			end

			local var_82_56 = 0.333333333333333
			local var_82_57 = 4.933
			local var_82_58 = manager.audio:GetVoiceLength("story_v_out_319411", "319411020", "story_v_out_319411.awb") / 1000

			if var_82_58 > 0 and var_82_57 < var_82_58 and var_82_58 + var_82_56 > arg_79_1.duration_ then
				local var_82_59 = var_82_58

				arg_79_1.duration_ = var_82_58 + var_82_56
			end

			if var_82_56 < arg_79_1.time_ and arg_79_1.time_ <= var_82_56 + arg_82_0 then
				local var_82_60 = "play"
				local var_82_61 = "voice"

				arg_79_1:AudioAction(var_82_60, var_82_61, "story_v_out_319411", "319411020", "story_v_out_319411.awb")
			end
		end
	end,
	Play319411021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319411021
		arg_83_1.duration_ = 4.033333333332

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play319411022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.fswbg_:SetActive(true)
				arg_83_1.dialog_:SetActive(false)

				arg_83_1.fswtw_.percent = 0

				local var_86_1 = arg_83_1:GetWordFromCfg(319411021)
				local var_86_2 = arg_83_1:FormatText(var_86_1.content)

				arg_83_1.fswt_.text = var_86_2

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.fswt_)

				arg_83_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_83_1.fswtw_:SetDirty()

				arg_83_1.typewritterCharCountI18N = 0

				SetActive(arg_83_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_83_1:ShowNextGo(false)
			end

			local var_86_3 = 0.166666666666667

			if var_86_3 < arg_83_1.time_ and arg_83_1.time_ <= var_86_3 + arg_86_0 then
				arg_83_1.var_.oldValueTypewriter = arg_83_1.fswtw_.percent

				arg_83_1:ShowNextGo(false)
			end

			local var_86_4 = 58
			local var_86_5 = 3.86666666666667
			local var_86_6 = arg_83_1:GetWordFromCfg(319411021)
			local var_86_7 = arg_83_1:FormatText(var_86_6.content)
			local var_86_8, var_86_9 = arg_83_1:GetPercentByPara(var_86_7, 1)

			if var_86_3 < arg_83_1.time_ and arg_83_1.time_ <= var_86_3 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				local var_86_10 = var_86_4 <= 0 and var_86_5 or var_86_5 * ((var_86_9 - arg_83_1.typewritterCharCountI18N) / var_86_4)

				if var_86_10 > 0 and var_86_5 < var_86_10 then
					arg_83_1.talkMaxDuration = var_86_10

					if var_86_10 + var_86_3 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_10 + var_86_3
					end
				end
			end

			local var_86_11 = 3.86666666666667
			local var_86_12 = math.max(var_86_11, arg_83_1.talkMaxDuration)

			if var_86_3 <= arg_83_1.time_ and arg_83_1.time_ < var_86_3 + var_86_12 then
				local var_86_13 = (arg_83_1.time_ - var_86_3) / var_86_12

				arg_83_1.fswtw_.percent = Mathf.Lerp(arg_83_1.var_.oldValueTypewriter, var_86_8, var_86_13)
				arg_83_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_83_1.fswtw_:SetDirty()
			end

			if arg_83_1.time_ >= var_86_3 + var_86_12 and arg_83_1.time_ < var_86_3 + var_86_12 + arg_86_0 then
				arg_83_1.fswtw_.percent = var_86_8

				arg_83_1.fswtw_:SetDirty()
				arg_83_1:ShowNextGo(true)

				arg_83_1.typewritterCharCountI18N = var_86_9
			end

			local var_86_14 = 0.166666666666667
			local var_86_15 = 0.266666666666667
			local var_86_16 = manager.audio:GetVoiceLength("story_v_out_319411", "319411021", "story_v_out_319411.awb") / 1000

			if var_86_16 > 0 and var_86_15 < var_86_16 and var_86_16 + var_86_14 > arg_83_1.duration_ then
				local var_86_17 = var_86_16

				arg_83_1.duration_ = var_86_16 + var_86_14
			end

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				local var_86_18 = "play"
				local var_86_19 = "voice"

				arg_83_1:AudioAction(var_86_18, var_86_19, "story_v_out_319411", "319411021", "story_v_out_319411.awb")
			end
		end
	end,
	Play319411022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319411022
		arg_87_1.duration_ = 0.999999999999

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play319411023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.fswbg_:SetActive(true)
				arg_87_1.dialog_:SetActive(false)

				arg_87_1.fswtw_.percent = 0

				local var_90_1 = arg_87_1:GetWordFromCfg(319411022)
				local var_90_2 = arg_87_1:FormatText(var_90_1.content)

				arg_87_1.fswt_.text = var_90_2

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.fswt_)

				arg_87_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_87_1.fswtw_:SetDirty()

				arg_87_1.typewritterCharCountI18N = 0

				SetActive(arg_87_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_87_1:ShowNextGo(false)
			end

			local var_90_3 = 0.166666666666667

			if var_90_3 < arg_87_1.time_ and arg_87_1.time_ <= var_90_3 + arg_90_0 then
				arg_87_1.var_.oldValueTypewriter = arg_87_1.fswtw_.percent

				arg_87_1:ShowNextGo(false)
			end

			local var_90_4 = 4
			local var_90_5 = 0.266666666666667
			local var_90_6 = arg_87_1:GetWordFromCfg(319411022)
			local var_90_7 = arg_87_1:FormatText(var_90_6.content)
			local var_90_8, var_90_9 = arg_87_1:GetPercentByPara(var_90_7, 1)

			if var_90_3 < arg_87_1.time_ and arg_87_1.time_ <= var_90_3 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0

				local var_90_10 = var_90_4 <= 0 and var_90_5 or var_90_5 * ((var_90_9 - arg_87_1.typewritterCharCountI18N) / var_90_4)

				if var_90_10 > 0 and var_90_5 < var_90_10 then
					arg_87_1.talkMaxDuration = var_90_10

					if var_90_10 + var_90_3 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_10 + var_90_3
					end
				end
			end

			local var_90_11 = 0.266666666666667
			local var_90_12 = math.max(var_90_11, arg_87_1.talkMaxDuration)

			if var_90_3 <= arg_87_1.time_ and arg_87_1.time_ < var_90_3 + var_90_12 then
				local var_90_13 = (arg_87_1.time_ - var_90_3) / var_90_12

				arg_87_1.fswtw_.percent = Mathf.Lerp(arg_87_1.var_.oldValueTypewriter, var_90_8, var_90_13)
				arg_87_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_87_1.fswtw_:SetDirty()
			end

			if arg_87_1.time_ >= var_90_3 + var_90_12 and arg_87_1.time_ < var_90_3 + var_90_12 + arg_90_0 then
				arg_87_1.fswtw_.percent = var_90_8

				arg_87_1.fswtw_:SetDirty()
				arg_87_1:ShowNextGo(true)

				arg_87_1.typewritterCharCountI18N = var_90_9
			end

			local var_90_14 = 0.166666666666667
			local var_90_15 = 0.266666666666667
			local var_90_16 = manager.audio:GetVoiceLength("story_v_out_319411", "319411022", "story_v_out_319411.awb") / 1000

			if var_90_16 > 0 and var_90_15 < var_90_16 and var_90_16 + var_90_14 > arg_87_1.duration_ then
				local var_90_17 = var_90_16

				arg_87_1.duration_ = var_90_16 + var_90_14
			end

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				local var_90_18 = "play"
				local var_90_19 = "voice"

				arg_87_1:AudioAction(var_90_18, var_90_19, "story_v_out_319411", "319411022", "story_v_out_319411.awb")
			end
		end
	end,
	Play319411023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319411023
		arg_91_1.duration_ = 6.733

		local var_91_0 = {
			zh = 3.999999999999,
			ja = 6.733
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
				arg_91_0:Play319411024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				local var_94_1 = manager.ui.mainCamera.transform.localPosition
				local var_94_2 = Vector3.New(0, 0, 10) + Vector3.New(var_94_1.x, var_94_1.y, 0)
				local var_94_3 = arg_91_1.bgs_.I11n

				var_94_3.transform.localPosition = var_94_2
				var_94_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_94_4 = var_94_3:GetComponent("SpriteRenderer")

				if var_94_4 and var_94_4.sprite then
					local var_94_5 = (var_94_3.transform.localPosition - var_94_1).z
					local var_94_6 = manager.ui.mainCameraCom_
					local var_94_7 = 2 * var_94_5 * Mathf.Tan(var_94_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_94_8 = var_94_7 * var_94_6.aspect
					local var_94_9 = var_94_4.sprite.bounds.size.x
					local var_94_10 = var_94_4.sprite.bounds.size.y
					local var_94_11 = var_94_8 / var_94_9
					local var_94_12 = var_94_7 / var_94_10
					local var_94_13 = var_94_12 < var_94_11 and var_94_11 or var_94_12

					var_94_3.transform.localScale = Vector3.New(var_94_13, var_94_13, 0)
				end

				for iter_94_0, iter_94_1 in pairs(arg_91_1.bgs_) do
					if iter_94_0 ~= "I11n" then
						iter_94_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_94_14 = arg_91_1.actors_["10079ui_story"].transform
			local var_94_15 = 2

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 then
				arg_91_1.var_.moveOldPos10079ui_story = var_94_14.localPosition
			end

			local var_94_16 = 0.001

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_16 then
				local var_94_17 = (arg_91_1.time_ - var_94_15) / var_94_16
				local var_94_18 = Vector3.New(0, -0.95, -6.05)

				var_94_14.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10079ui_story, var_94_18, var_94_17)

				local var_94_19 = manager.ui.mainCamera.transform.position - var_94_14.position

				var_94_14.forward = Vector3.New(var_94_19.x, var_94_19.y, var_94_19.z)

				local var_94_20 = var_94_14.localEulerAngles

				var_94_20.z = 0
				var_94_20.x = 0
				var_94_14.localEulerAngles = var_94_20
			end

			if arg_91_1.time_ >= var_94_15 + var_94_16 and arg_91_1.time_ < var_94_15 + var_94_16 + arg_94_0 then
				var_94_14.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_94_21 = manager.ui.mainCamera.transform.position - var_94_14.position

				var_94_14.forward = Vector3.New(var_94_21.x, var_94_21.y, var_94_21.z)

				local var_94_22 = var_94_14.localEulerAngles

				var_94_22.z = 0
				var_94_22.x = 0
				var_94_14.localEulerAngles = var_94_22
			end

			local var_94_23 = arg_91_1.actors_["10079ui_story"]
			local var_94_24 = 2

			if var_94_24 < arg_91_1.time_ and arg_91_1.time_ <= var_94_24 + arg_94_0 and arg_91_1.var_.characterEffect10079ui_story == nil then
				arg_91_1.var_.characterEffect10079ui_story = var_94_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_25 = 0.200000002980232

			if var_94_24 <= arg_91_1.time_ and arg_91_1.time_ < var_94_24 + var_94_25 then
				local var_94_26 = (arg_91_1.time_ - var_94_24) / var_94_25

				if arg_91_1.var_.characterEffect10079ui_story then
					arg_91_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_24 + var_94_25 and arg_91_1.time_ < var_94_24 + var_94_25 + arg_94_0 and arg_91_1.var_.characterEffect10079ui_story then
				arg_91_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_94_27 = 2

			if var_94_27 < arg_91_1.time_ and arg_91_1.time_ <= var_94_27 + arg_94_0 then
				arg_91_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_94_28 = 2

			if var_94_28 < arg_91_1.time_ and arg_91_1.time_ <= var_94_28 + arg_94_0 then
				arg_91_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_94_29 = arg_91_1.actors_["10066ui_story"].transform
			local var_94_30 = 2

			if var_94_30 < arg_91_1.time_ and arg_91_1.time_ <= var_94_30 + arg_94_0 then
				arg_91_1.var_.moveOldPos10066ui_story = var_94_29.localPosition
			end

			local var_94_31 = 0.001

			if var_94_30 <= arg_91_1.time_ and arg_91_1.time_ < var_94_30 + var_94_31 then
				local var_94_32 = (arg_91_1.time_ - var_94_30) / var_94_31
				local var_94_33 = Vector3.New(0, 100, 0)

				var_94_29.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10066ui_story, var_94_33, var_94_32)

				local var_94_34 = manager.ui.mainCamera.transform.position - var_94_29.position

				var_94_29.forward = Vector3.New(var_94_34.x, var_94_34.y, var_94_34.z)

				local var_94_35 = var_94_29.localEulerAngles

				var_94_35.z = 0
				var_94_35.x = 0
				var_94_29.localEulerAngles = var_94_35
			end

			if arg_91_1.time_ >= var_94_30 + var_94_31 and arg_91_1.time_ < var_94_30 + var_94_31 + arg_94_0 then
				var_94_29.localPosition = Vector3.New(0, 100, 0)

				local var_94_36 = manager.ui.mainCamera.transform.position - var_94_29.position

				var_94_29.forward = Vector3.New(var_94_36.x, var_94_36.y, var_94_36.z)

				local var_94_37 = var_94_29.localEulerAngles

				var_94_37.z = 0
				var_94_37.x = 0
				var_94_29.localEulerAngles = var_94_37
			end

			local var_94_38 = arg_91_1.actors_["10066ui_story"]
			local var_94_39 = 2

			if var_94_39 < arg_91_1.time_ and arg_91_1.time_ <= var_94_39 + arg_94_0 and arg_91_1.var_.characterEffect10066ui_story == nil then
				arg_91_1.var_.characterEffect10066ui_story = var_94_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_40 = 0.200000002980232

			if var_94_39 <= arg_91_1.time_ and arg_91_1.time_ < var_94_39 + var_94_40 then
				local var_94_41 = (arg_91_1.time_ - var_94_39) / var_94_40

				if arg_91_1.var_.characterEffect10066ui_story then
					local var_94_42 = Mathf.Lerp(0, 0.5, var_94_41)

					arg_91_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_91_1.var_.characterEffect10066ui_story.fillRatio = var_94_42
				end
			end

			if arg_91_1.time_ >= var_94_39 + var_94_40 and arg_91_1.time_ < var_94_39 + var_94_40 + arg_94_0 and arg_91_1.var_.characterEffect10066ui_story then
				local var_94_43 = 0.5

				arg_91_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_91_1.var_.characterEffect10066ui_story.fillRatio = var_94_43
			end

			local var_94_44 = arg_91_1.actors_["1095ui_story"].transform
			local var_94_45 = 2

			if var_94_45 < arg_91_1.time_ and arg_91_1.time_ <= var_94_45 + arg_94_0 then
				arg_91_1.var_.moveOldPos1095ui_story = var_94_44.localPosition
			end

			local var_94_46 = 0.001

			if var_94_45 <= arg_91_1.time_ and arg_91_1.time_ < var_94_45 + var_94_46 then
				local var_94_47 = (arg_91_1.time_ - var_94_45) / var_94_46
				local var_94_48 = Vector3.New(0, 100, 0)

				var_94_44.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1095ui_story, var_94_48, var_94_47)

				local var_94_49 = manager.ui.mainCamera.transform.position - var_94_44.position

				var_94_44.forward = Vector3.New(var_94_49.x, var_94_49.y, var_94_49.z)

				local var_94_50 = var_94_44.localEulerAngles

				var_94_50.z = 0
				var_94_50.x = 0
				var_94_44.localEulerAngles = var_94_50
			end

			if arg_91_1.time_ >= var_94_45 + var_94_46 and arg_91_1.time_ < var_94_45 + var_94_46 + arg_94_0 then
				var_94_44.localPosition = Vector3.New(0, 100, 0)

				local var_94_51 = manager.ui.mainCamera.transform.position - var_94_44.position

				var_94_44.forward = Vector3.New(var_94_51.x, var_94_51.y, var_94_51.z)

				local var_94_52 = var_94_44.localEulerAngles

				var_94_52.z = 0
				var_94_52.x = 0
				var_94_44.localEulerAngles = var_94_52
			end

			local var_94_53 = 0.0333333333333334

			if var_94_53 < arg_91_1.time_ and arg_91_1.time_ <= var_94_53 + arg_94_0 then
				arg_91_1.fswbg_:SetActive(false)
				arg_91_1.dialog_:SetActive(false)
				arg_91_1:ShowNextGo(false)
			end

			local var_94_54 = 0.2

			if var_94_54 < arg_91_1.time_ and arg_91_1.time_ <= var_94_54 + arg_94_0 then
				arg_91_1.fswbg_:SetActive(false)
				arg_91_1.dialog_:SetActive(false)
				arg_91_1:ShowNextGo(false)
			end

			local var_94_55 = 0.0333333333333334

			if var_94_55 < arg_91_1.time_ and arg_91_1.time_ <= var_94_55 + arg_94_0 then
				arg_91_1.cswbg_:SetActive(false)
			end

			if arg_91_1.frameCnt_ <= 1 then
				arg_91_1.dialog_:SetActive(false)
			end

			local var_94_56 = 2
			local var_94_57 = 0.175

			if var_94_56 < arg_91_1.time_ and arg_91_1.time_ <= var_94_56 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0

				arg_91_1.dialog_:SetActive(true)

				local var_94_58 = LeanTween.value(arg_91_1.dialog_, 0, 1, 0.3)

				var_94_58:setOnUpdate(LuaHelper.FloatAction(function(arg_95_0)
					arg_91_1.dialogCg_.alpha = arg_95_0
				end))
				var_94_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_91_1.dialog_)
					var_94_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_91_1.duration_ = arg_91_1.duration_ + 0.3

				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_59 = arg_91_1:FormatText(StoryNameCfg[6].name)

				arg_91_1.leftNameTxt_.text = var_94_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_60 = arg_91_1:GetWordFromCfg(319411023)
				local var_94_61 = arg_91_1:FormatText(var_94_60.content)

				arg_91_1.text_.text = var_94_61

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_62 = 7
				local var_94_63 = utf8.len(var_94_61)
				local var_94_64 = var_94_62 <= 0 and var_94_57 or var_94_57 * (var_94_63 / var_94_62)

				if var_94_64 > 0 and var_94_57 < var_94_64 then
					arg_91_1.talkMaxDuration = var_94_64
					var_94_56 = var_94_56 + 0.3

					if var_94_64 + var_94_56 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_64 + var_94_56
					end
				end

				arg_91_1.text_.text = var_94_61
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411023", "story_v_out_319411.awb") ~= 0 then
					local var_94_65 = manager.audio:GetVoiceLength("story_v_out_319411", "319411023", "story_v_out_319411.awb") / 1000

					if var_94_65 + var_94_56 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_65 + var_94_56
					end

					if var_94_60.prefab_name ~= "" and arg_91_1.actors_[var_94_60.prefab_name] ~= nil then
						local var_94_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_60.prefab_name].transform, "story_v_out_319411", "319411023", "story_v_out_319411.awb")

						arg_91_1:RecordAudio("319411023", var_94_66)
						arg_91_1:RecordAudio("319411023", var_94_66)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319411", "319411023", "story_v_out_319411.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319411", "319411023", "story_v_out_319411.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_67 = var_94_56 + 0.3
			local var_94_68 = math.max(var_94_57, arg_91_1.talkMaxDuration)

			if var_94_67 <= arg_91_1.time_ and arg_91_1.time_ < var_94_67 + var_94_68 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_67) / var_94_68

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_67 + var_94_68 and arg_91_1.time_ < var_94_67 + var_94_68 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319411024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 319411024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play319411025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10079ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect10079ui_story == nil then
				arg_97_1.var_.characterEffect10079ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect10079ui_story then
					local var_100_4 = Mathf.Lerp(0, 0.5, var_100_3)

					arg_97_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_97_1.var_.characterEffect10079ui_story.fillRatio = var_100_4
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect10079ui_story then
				local var_100_5 = 0.5

				arg_97_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_97_1.var_.characterEffect10079ui_story.fillRatio = var_100_5
			end

			local var_100_6 = 0
			local var_100_7 = 1.5

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_8 = arg_97_1:GetWordFromCfg(319411024)
				local var_100_9 = arg_97_1:FormatText(var_100_8.content)

				arg_97_1.text_.text = var_100_9

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_10 = 60
				local var_100_11 = utf8.len(var_100_9)
				local var_100_12 = var_100_10 <= 0 and var_100_7 or var_100_7 * (var_100_11 / var_100_10)

				if var_100_12 > 0 and var_100_7 < var_100_12 then
					arg_97_1.talkMaxDuration = var_100_12

					if var_100_12 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_12 + var_100_6
					end
				end

				arg_97_1.text_.text = var_100_9
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_13 = math.max(var_100_7, arg_97_1.talkMaxDuration)

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_13 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_6) / var_100_13

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_6 + var_100_13 and arg_97_1.time_ < var_100_6 + var_100_13 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play319411025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 319411025
		arg_101_1.duration_ = 5.2

		local var_101_0 = {
			zh = 5.133,
			ja = 5.2
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
				arg_101_0:Play319411026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1095ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1095ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0, -0.98, -6.1)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1095ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["1095ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect1095ui_story == nil then
				arg_101_1.var_.characterEffect1095ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect1095ui_story then
					arg_101_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect1095ui_story then
				arg_101_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_104_13 = arg_101_1.actors_["10079ui_story"].transform
			local var_104_14 = 0

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1.var_.moveOldPos10079ui_story = var_104_13.localPosition
			end

			local var_104_15 = 0.001

			if var_104_14 <= arg_101_1.time_ and arg_101_1.time_ < var_104_14 + var_104_15 then
				local var_104_16 = (arg_101_1.time_ - var_104_14) / var_104_15
				local var_104_17 = Vector3.New(0, 100, 0)

				var_104_13.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos10079ui_story, var_104_17, var_104_16)

				local var_104_18 = manager.ui.mainCamera.transform.position - var_104_13.position

				var_104_13.forward = Vector3.New(var_104_18.x, var_104_18.y, var_104_18.z)

				local var_104_19 = var_104_13.localEulerAngles

				var_104_19.z = 0
				var_104_19.x = 0
				var_104_13.localEulerAngles = var_104_19
			end

			if arg_101_1.time_ >= var_104_14 + var_104_15 and arg_101_1.time_ < var_104_14 + var_104_15 + arg_104_0 then
				var_104_13.localPosition = Vector3.New(0, 100, 0)

				local var_104_20 = manager.ui.mainCamera.transform.position - var_104_13.position

				var_104_13.forward = Vector3.New(var_104_20.x, var_104_20.y, var_104_20.z)

				local var_104_21 = var_104_13.localEulerAngles

				var_104_21.z = 0
				var_104_21.x = 0
				var_104_13.localEulerAngles = var_104_21
			end

			local var_104_22 = arg_101_1.actors_["10079ui_story"]
			local var_104_23 = 0

			if var_104_23 < arg_101_1.time_ and arg_101_1.time_ <= var_104_23 + arg_104_0 and arg_101_1.var_.characterEffect10079ui_story == nil then
				arg_101_1.var_.characterEffect10079ui_story = var_104_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_24 = 0.200000002980232

			if var_104_23 <= arg_101_1.time_ and arg_101_1.time_ < var_104_23 + var_104_24 then
				local var_104_25 = (arg_101_1.time_ - var_104_23) / var_104_24

				if arg_101_1.var_.characterEffect10079ui_story then
					local var_104_26 = Mathf.Lerp(0, 0.5, var_104_25)

					arg_101_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_101_1.var_.characterEffect10079ui_story.fillRatio = var_104_26
				end
			end

			if arg_101_1.time_ >= var_104_23 + var_104_24 and arg_101_1.time_ < var_104_23 + var_104_24 + arg_104_0 and arg_101_1.var_.characterEffect10079ui_story then
				local var_104_27 = 0.5

				arg_101_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_101_1.var_.characterEffect10079ui_story.fillRatio = var_104_27
			end

			local var_104_28 = 0

			if var_104_28 < arg_101_1.time_ and arg_101_1.time_ <= var_104_28 + arg_104_0 then
				arg_101_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_104_29 = 0
			local var_104_30 = 0.6

			if var_104_29 < arg_101_1.time_ and arg_101_1.time_ <= var_104_29 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_31 = arg_101_1:FormatText(StoryNameCfg[471].name)

				arg_101_1.leftNameTxt_.text = var_104_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_32 = arg_101_1:GetWordFromCfg(319411025)
				local var_104_33 = arg_101_1:FormatText(var_104_32.content)

				arg_101_1.text_.text = var_104_33

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_34 = 24
				local var_104_35 = utf8.len(var_104_33)
				local var_104_36 = var_104_34 <= 0 and var_104_30 or var_104_30 * (var_104_35 / var_104_34)

				if var_104_36 > 0 and var_104_30 < var_104_36 then
					arg_101_1.talkMaxDuration = var_104_36

					if var_104_36 + var_104_29 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_36 + var_104_29
					end
				end

				arg_101_1.text_.text = var_104_33
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411025", "story_v_out_319411.awb") ~= 0 then
					local var_104_37 = manager.audio:GetVoiceLength("story_v_out_319411", "319411025", "story_v_out_319411.awb") / 1000

					if var_104_37 + var_104_29 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_37 + var_104_29
					end

					if var_104_32.prefab_name ~= "" and arg_101_1.actors_[var_104_32.prefab_name] ~= nil then
						local var_104_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_32.prefab_name].transform, "story_v_out_319411", "319411025", "story_v_out_319411.awb")

						arg_101_1:RecordAudio("319411025", var_104_38)
						arg_101_1:RecordAudio("319411025", var_104_38)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_319411", "319411025", "story_v_out_319411.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_319411", "319411025", "story_v_out_319411.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_39 = math.max(var_104_30, arg_101_1.talkMaxDuration)

			if var_104_29 <= arg_101_1.time_ and arg_101_1.time_ < var_104_29 + var_104_39 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_29) / var_104_39

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_29 + var_104_39 and arg_101_1.time_ < var_104_29 + var_104_39 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play319411026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319411026
		arg_105_1.duration_ = 10.2

		local var_105_0 = {
			zh = 3.733,
			ja = 10.2
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
				arg_105_0:Play319411027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10066ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos10066ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0.7, -0.99, -5.83)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10066ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["10066ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect10066ui_story == nil then
				arg_105_1.var_.characterEffect10066ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.200000002980232

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect10066ui_story then
					arg_105_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect10066ui_story then
				arg_105_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action4_1")
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_108_15 = arg_105_1.actors_["1095ui_story"].transform
			local var_108_16 = 0

			if var_108_16 < arg_105_1.time_ and arg_105_1.time_ <= var_108_16 + arg_108_0 then
				arg_105_1.var_.moveOldPos1095ui_story = var_108_15.localPosition
			end

			local var_108_17 = 0.001

			if var_108_16 <= arg_105_1.time_ and arg_105_1.time_ < var_108_16 + var_108_17 then
				local var_108_18 = (arg_105_1.time_ - var_108_16) / var_108_17
				local var_108_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_108_15.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1095ui_story, var_108_19, var_108_18)

				local var_108_20 = manager.ui.mainCamera.transform.position - var_108_15.position

				var_108_15.forward = Vector3.New(var_108_20.x, var_108_20.y, var_108_20.z)

				local var_108_21 = var_108_15.localEulerAngles

				var_108_21.z = 0
				var_108_21.x = 0
				var_108_15.localEulerAngles = var_108_21
			end

			if arg_105_1.time_ >= var_108_16 + var_108_17 and arg_105_1.time_ < var_108_16 + var_108_17 + arg_108_0 then
				var_108_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_108_22 = manager.ui.mainCamera.transform.position - var_108_15.position

				var_108_15.forward = Vector3.New(var_108_22.x, var_108_22.y, var_108_22.z)

				local var_108_23 = var_108_15.localEulerAngles

				var_108_23.z = 0
				var_108_23.x = 0
				var_108_15.localEulerAngles = var_108_23
			end

			local var_108_24 = arg_105_1.actors_["1095ui_story"]
			local var_108_25 = 0

			if var_108_25 < arg_105_1.time_ and arg_105_1.time_ <= var_108_25 + arg_108_0 and arg_105_1.var_.characterEffect1095ui_story == nil then
				arg_105_1.var_.characterEffect1095ui_story = var_108_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_26 = 0.200000002980232

			if var_108_25 <= arg_105_1.time_ and arg_105_1.time_ < var_108_25 + var_108_26 then
				local var_108_27 = (arg_105_1.time_ - var_108_25) / var_108_26

				if arg_105_1.var_.characterEffect1095ui_story then
					local var_108_28 = Mathf.Lerp(0, 0.5, var_108_27)

					arg_105_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1095ui_story.fillRatio = var_108_28
				end
			end

			if arg_105_1.time_ >= var_108_25 + var_108_26 and arg_105_1.time_ < var_108_25 + var_108_26 + arg_108_0 and arg_105_1.var_.characterEffect1095ui_story then
				local var_108_29 = 0.5

				arg_105_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1095ui_story.fillRatio = var_108_29
			end

			local var_108_30 = 0
			local var_108_31 = 0.35

			if var_108_30 < arg_105_1.time_ and arg_105_1.time_ <= var_108_30 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_32 = arg_105_1:FormatText(StoryNameCfg[640].name)

				arg_105_1.leftNameTxt_.text = var_108_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_33 = arg_105_1:GetWordFromCfg(319411026)
				local var_108_34 = arg_105_1:FormatText(var_108_33.content)

				arg_105_1.text_.text = var_108_34

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_35 = 14
				local var_108_36 = utf8.len(var_108_34)
				local var_108_37 = var_108_35 <= 0 and var_108_31 or var_108_31 * (var_108_36 / var_108_35)

				if var_108_37 > 0 and var_108_31 < var_108_37 then
					arg_105_1.talkMaxDuration = var_108_37

					if var_108_37 + var_108_30 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_37 + var_108_30
					end
				end

				arg_105_1.text_.text = var_108_34
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411026", "story_v_out_319411.awb") ~= 0 then
					local var_108_38 = manager.audio:GetVoiceLength("story_v_out_319411", "319411026", "story_v_out_319411.awb") / 1000

					if var_108_38 + var_108_30 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_38 + var_108_30
					end

					if var_108_33.prefab_name ~= "" and arg_105_1.actors_[var_108_33.prefab_name] ~= nil then
						local var_108_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_33.prefab_name].transform, "story_v_out_319411", "319411026", "story_v_out_319411.awb")

						arg_105_1:RecordAudio("319411026", var_108_39)
						arg_105_1:RecordAudio("319411026", var_108_39)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_319411", "319411026", "story_v_out_319411.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_319411", "319411026", "story_v_out_319411.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_40 = math.max(var_108_31, arg_105_1.talkMaxDuration)

			if var_108_30 <= arg_105_1.time_ and arg_105_1.time_ < var_108_30 + var_108_40 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_30) / var_108_40

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_30 + var_108_40 and arg_105_1.time_ < var_108_30 + var_108_40 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play319411027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319411027
		arg_109_1.duration_ = 6.566

		local var_109_0 = {
			zh = 6.566,
			ja = 1.5
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
				arg_109_0:Play319411028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["10066ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect10066ui_story == nil then
				arg_109_1.var_.characterEffect10066ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect10066ui_story then
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_109_1.var_.characterEffect10066ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect10066ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_109_1.var_.characterEffect10066ui_story.fillRatio = var_112_5
			end

			local var_112_6 = arg_109_1.actors_["1095ui_story"]
			local var_112_7 = 0

			if var_112_7 < arg_109_1.time_ and arg_109_1.time_ <= var_112_7 + arg_112_0 and arg_109_1.var_.characterEffect1095ui_story == nil then
				arg_109_1.var_.characterEffect1095ui_story = var_112_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_8 = 0.200000002980232

			if var_112_7 <= arg_109_1.time_ and arg_109_1.time_ < var_112_7 + var_112_8 then
				local var_112_9 = (arg_109_1.time_ - var_112_7) / var_112_8

				if arg_109_1.var_.characterEffect1095ui_story then
					arg_109_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_7 + var_112_8 and arg_109_1.time_ < var_112_7 + var_112_8 + arg_112_0 and arg_109_1.var_.characterEffect1095ui_story then
				arg_109_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_112_10 = 0
			local var_112_11 = 0.45

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_12 = arg_109_1:FormatText(StoryNameCfg[471].name)

				arg_109_1.leftNameTxt_.text = var_112_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_13 = arg_109_1:GetWordFromCfg(319411027)
				local var_112_14 = arg_109_1:FormatText(var_112_13.content)

				arg_109_1.text_.text = var_112_14

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_15 = 18
				local var_112_16 = utf8.len(var_112_14)
				local var_112_17 = var_112_15 <= 0 and var_112_11 or var_112_11 * (var_112_16 / var_112_15)

				if var_112_17 > 0 and var_112_11 < var_112_17 then
					arg_109_1.talkMaxDuration = var_112_17

					if var_112_17 + var_112_10 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_17 + var_112_10
					end
				end

				arg_109_1.text_.text = var_112_14
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411027", "story_v_out_319411.awb") ~= 0 then
					local var_112_18 = manager.audio:GetVoiceLength("story_v_out_319411", "319411027", "story_v_out_319411.awb") / 1000

					if var_112_18 + var_112_10 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_18 + var_112_10
					end

					if var_112_13.prefab_name ~= "" and arg_109_1.actors_[var_112_13.prefab_name] ~= nil then
						local var_112_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_13.prefab_name].transform, "story_v_out_319411", "319411027", "story_v_out_319411.awb")

						arg_109_1:RecordAudio("319411027", var_112_19)
						arg_109_1:RecordAudio("319411027", var_112_19)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_319411", "319411027", "story_v_out_319411.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_319411", "319411027", "story_v_out_319411.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_20 = math.max(var_112_11, arg_109_1.talkMaxDuration)

			if var_112_10 <= arg_109_1.time_ and arg_109_1.time_ < var_112_10 + var_112_20 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_10) / var_112_20

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_10 + var_112_20 and arg_109_1.time_ < var_112_10 + var_112_20 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play319411028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319411028
		arg_113_1.duration_ = 14.4

		local var_113_0 = {
			zh = 10.666,
			ja = 14.4
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
				arg_113_0:Play319411029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.125

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

				local var_116_3 = arg_113_1:GetWordFromCfg(319411028)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411028", "story_v_out_319411.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_319411", "319411028", "story_v_out_319411.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_319411", "319411028", "story_v_out_319411.awb")

						arg_113_1:RecordAudio("319411028", var_116_9)
						arg_113_1:RecordAudio("319411028", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_319411", "319411028", "story_v_out_319411.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_319411", "319411028", "story_v_out_319411.awb")
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
	Play319411029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319411029
		arg_117_1.duration_ = 12.033

		local var_117_0 = {
			zh = 10.766,
			ja = 12.033
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
				arg_117_0:Play319411030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_120_2 = 0
			local var_120_3 = 1.25

			if var_120_2 < arg_117_1.time_ and arg_117_1.time_ <= var_120_2 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_4 = arg_117_1:FormatText(StoryNameCfg[471].name)

				arg_117_1.leftNameTxt_.text = var_120_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_5 = arg_117_1:GetWordFromCfg(319411029)
				local var_120_6 = arg_117_1:FormatText(var_120_5.content)

				arg_117_1.text_.text = var_120_6

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_7 = 50
				local var_120_8 = utf8.len(var_120_6)
				local var_120_9 = var_120_7 <= 0 and var_120_3 or var_120_3 * (var_120_8 / var_120_7)

				if var_120_9 > 0 and var_120_3 < var_120_9 then
					arg_117_1.talkMaxDuration = var_120_9

					if var_120_9 + var_120_2 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_9 + var_120_2
					end
				end

				arg_117_1.text_.text = var_120_6
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411029", "story_v_out_319411.awb") ~= 0 then
					local var_120_10 = manager.audio:GetVoiceLength("story_v_out_319411", "319411029", "story_v_out_319411.awb") / 1000

					if var_120_10 + var_120_2 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_10 + var_120_2
					end

					if var_120_5.prefab_name ~= "" and arg_117_1.actors_[var_120_5.prefab_name] ~= nil then
						local var_120_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_5.prefab_name].transform, "story_v_out_319411", "319411029", "story_v_out_319411.awb")

						arg_117_1:RecordAudio("319411029", var_120_11)
						arg_117_1:RecordAudio("319411029", var_120_11)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_319411", "319411029", "story_v_out_319411.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_319411", "319411029", "story_v_out_319411.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_12 = math.max(var_120_3, arg_117_1.talkMaxDuration)

			if var_120_2 <= arg_117_1.time_ and arg_117_1.time_ < var_120_2 + var_120_12 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_2) / var_120_12

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_2 + var_120_12 and arg_117_1.time_ < var_120_2 + var_120_12 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319411030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319411030
		arg_121_1.duration_ = 9.533

		local var_121_0 = {
			zh = 9.533,
			ja = 8.4
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
				arg_121_0:Play319411031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_124_1 = 0
			local var_124_2 = 1.175

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_3 = arg_121_1:FormatText(StoryNameCfg[471].name)

				arg_121_1.leftNameTxt_.text = var_124_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_4 = arg_121_1:GetWordFromCfg(319411030)
				local var_124_5 = arg_121_1:FormatText(var_124_4.content)

				arg_121_1.text_.text = var_124_5

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_6 = 47
				local var_124_7 = utf8.len(var_124_5)
				local var_124_8 = var_124_6 <= 0 and var_124_2 or var_124_2 * (var_124_7 / var_124_6)

				if var_124_8 > 0 and var_124_2 < var_124_8 then
					arg_121_1.talkMaxDuration = var_124_8

					if var_124_8 + var_124_1 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_1
					end
				end

				arg_121_1.text_.text = var_124_5
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411030", "story_v_out_319411.awb") ~= 0 then
					local var_124_9 = manager.audio:GetVoiceLength("story_v_out_319411", "319411030", "story_v_out_319411.awb") / 1000

					if var_124_9 + var_124_1 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_9 + var_124_1
					end

					if var_124_4.prefab_name ~= "" and arg_121_1.actors_[var_124_4.prefab_name] ~= nil then
						local var_124_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_4.prefab_name].transform, "story_v_out_319411", "319411030", "story_v_out_319411.awb")

						arg_121_1:RecordAudio("319411030", var_124_10)
						arg_121_1:RecordAudio("319411030", var_124_10)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_319411", "319411030", "story_v_out_319411.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_319411", "319411030", "story_v_out_319411.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_11 = math.max(var_124_2, arg_121_1.talkMaxDuration)

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_11 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_1) / var_124_11

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_1 + var_124_11 and arg_121_1.time_ < var_124_1 + var_124_11 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play319411031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319411031
		arg_125_1.duration_ = 2.166

		local var_125_0 = {
			zh = 1.166,
			ja = 2.166
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
				arg_125_0:Play319411032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.075

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_2 = arg_125_1:FormatText(StoryNameCfg[471].name)

				arg_125_1.leftNameTxt_.text = var_128_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_3 = arg_125_1:GetWordFromCfg(319411031)
				local var_128_4 = arg_125_1:FormatText(var_128_3.content)

				arg_125_1.text_.text = var_128_4

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411031", "story_v_out_319411.awb") ~= 0 then
					local var_128_8 = manager.audio:GetVoiceLength("story_v_out_319411", "319411031", "story_v_out_319411.awb") / 1000

					if var_128_8 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_8 + var_128_0
					end

					if var_128_3.prefab_name ~= "" and arg_125_1.actors_[var_128_3.prefab_name] ~= nil then
						local var_128_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_3.prefab_name].transform, "story_v_out_319411", "319411031", "story_v_out_319411.awb")

						arg_125_1:RecordAudio("319411031", var_128_9)
						arg_125_1:RecordAudio("319411031", var_128_9)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319411", "319411031", "story_v_out_319411.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319411", "319411031", "story_v_out_319411.awb")
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
	Play319411032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319411032
		arg_129_1.duration_ = 6.9

		local var_129_0 = {
			zh = 6.9,
			ja = 5.033
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
				arg_129_0:Play319411033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10066ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos10066ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0.7, -0.99, -5.83)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10066ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["10066ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect10066ui_story == nil then
				arg_129_1.var_.characterEffect10066ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect10066ui_story then
					arg_129_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect10066ui_story then
				arg_129_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action447")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_132_15 = arg_129_1.actors_["1095ui_story"]
			local var_132_16 = 0

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story == nil then
				arg_129_1.var_.characterEffect1095ui_story = var_132_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_17 = 0.200000002980232

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_17 then
				local var_132_18 = (arg_129_1.time_ - var_132_16) / var_132_17

				if arg_129_1.var_.characterEffect1095ui_story then
					local var_132_19 = Mathf.Lerp(0, 0.5, var_132_18)

					arg_129_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1095ui_story.fillRatio = var_132_19
				end
			end

			if arg_129_1.time_ >= var_132_16 + var_132_17 and arg_129_1.time_ < var_132_16 + var_132_17 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story then
				local var_132_20 = 0.5

				arg_129_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1095ui_story.fillRatio = var_132_20
			end

			local var_132_21 = 0
			local var_132_22 = 0.575

			if var_132_21 < arg_129_1.time_ and arg_129_1.time_ <= var_132_21 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_23 = arg_129_1:FormatText(StoryNameCfg[640].name)

				arg_129_1.leftNameTxt_.text = var_132_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_24 = arg_129_1:GetWordFromCfg(319411032)
				local var_132_25 = arg_129_1:FormatText(var_132_24.content)

				arg_129_1.text_.text = var_132_25

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_26 = 23
				local var_132_27 = utf8.len(var_132_25)
				local var_132_28 = var_132_26 <= 0 and var_132_22 or var_132_22 * (var_132_27 / var_132_26)

				if var_132_28 > 0 and var_132_22 < var_132_28 then
					arg_129_1.talkMaxDuration = var_132_28

					if var_132_28 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_28 + var_132_21
					end
				end

				arg_129_1.text_.text = var_132_25
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411032", "story_v_out_319411.awb") ~= 0 then
					local var_132_29 = manager.audio:GetVoiceLength("story_v_out_319411", "319411032", "story_v_out_319411.awb") / 1000

					if var_132_29 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_29 + var_132_21
					end

					if var_132_24.prefab_name ~= "" and arg_129_1.actors_[var_132_24.prefab_name] ~= nil then
						local var_132_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_24.prefab_name].transform, "story_v_out_319411", "319411032", "story_v_out_319411.awb")

						arg_129_1:RecordAudio("319411032", var_132_30)
						arg_129_1:RecordAudio("319411032", var_132_30)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319411", "319411032", "story_v_out_319411.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319411", "319411032", "story_v_out_319411.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_31 = math.max(var_132_22, arg_129_1.talkMaxDuration)

			if var_132_21 <= arg_129_1.time_ and arg_129_1.time_ < var_132_21 + var_132_31 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_21) / var_132_31

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_21 + var_132_31 and arg_129_1.time_ < var_132_21 + var_132_31 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319411033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319411033
		arg_133_1.duration_ = 8.833

		local var_133_0 = {
			zh = 8.833,
			ja = 8.3
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
				arg_133_0:Play319411034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10066ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect10066ui_story == nil then
				arg_133_1.var_.characterEffect10066ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect10066ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_133_1.var_.characterEffect10066ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect10066ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_133_1.var_.characterEffect10066ui_story.fillRatio = var_136_5
			end

			local var_136_6 = arg_133_1.actors_["1095ui_story"]
			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 and arg_133_1.var_.characterEffect1095ui_story == nil then
				arg_133_1.var_.characterEffect1095ui_story = var_136_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_8 = 0.200000002980232

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_8 then
				local var_136_9 = (arg_133_1.time_ - var_136_7) / var_136_8

				if arg_133_1.var_.characterEffect1095ui_story then
					arg_133_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_7 + var_136_8 and arg_133_1.time_ < var_136_7 + var_136_8 + arg_136_0 and arg_133_1.var_.characterEffect1095ui_story then
				arg_133_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_136_10 = 0
			local var_136_11 = 1.05

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_12 = arg_133_1:FormatText(StoryNameCfg[471].name)

				arg_133_1.leftNameTxt_.text = var_136_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_13 = arg_133_1:GetWordFromCfg(319411033)
				local var_136_14 = arg_133_1:FormatText(var_136_13.content)

				arg_133_1.text_.text = var_136_14

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_15 = 40
				local var_136_16 = utf8.len(var_136_14)
				local var_136_17 = var_136_15 <= 0 and var_136_11 or var_136_11 * (var_136_16 / var_136_15)

				if var_136_17 > 0 and var_136_11 < var_136_17 then
					arg_133_1.talkMaxDuration = var_136_17

					if var_136_17 + var_136_10 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_17 + var_136_10
					end
				end

				arg_133_1.text_.text = var_136_14
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411033", "story_v_out_319411.awb") ~= 0 then
					local var_136_18 = manager.audio:GetVoiceLength("story_v_out_319411", "319411033", "story_v_out_319411.awb") / 1000

					if var_136_18 + var_136_10 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_18 + var_136_10
					end

					if var_136_13.prefab_name ~= "" and arg_133_1.actors_[var_136_13.prefab_name] ~= nil then
						local var_136_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_13.prefab_name].transform, "story_v_out_319411", "319411033", "story_v_out_319411.awb")

						arg_133_1:RecordAudio("319411033", var_136_19)
						arg_133_1:RecordAudio("319411033", var_136_19)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319411", "319411033", "story_v_out_319411.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319411", "319411033", "story_v_out_319411.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_20 = math.max(var_136_11, arg_133_1.talkMaxDuration)

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_20 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_10) / var_136_20

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_10 + var_136_20 and arg_133_1.time_ < var_136_10 + var_136_20 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319411034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319411034
		arg_137_1.duration_ = 15.9

		local var_137_0 = {
			zh = 12.366,
			ja = 15.9
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
				arg_137_0:Play319411035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 1.45

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

				local var_140_3 = arg_137_1:GetWordFromCfg(319411034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 58
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

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411034", "story_v_out_319411.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_319411", "319411034", "story_v_out_319411.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_319411", "319411034", "story_v_out_319411.awb")

						arg_137_1:RecordAudio("319411034", var_140_9)
						arg_137_1:RecordAudio("319411034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319411", "319411034", "story_v_out_319411.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319411", "319411034", "story_v_out_319411.awb")
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
	Play319411035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319411035
		arg_141_1.duration_ = 13.166

		local var_141_0 = {
			zh = 6.9,
			ja = 13.166
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
				arg_141_0:Play319411036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_144_2 = 0
			local var_144_3 = 1.025

			if var_144_2 < arg_141_1.time_ and arg_141_1.time_ <= var_144_2 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_4 = arg_141_1:FormatText(StoryNameCfg[471].name)

				arg_141_1.leftNameTxt_.text = var_144_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_5 = arg_141_1:GetWordFromCfg(319411035)
				local var_144_6 = arg_141_1:FormatText(var_144_5.content)

				arg_141_1.text_.text = var_144_6

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_7 = 41
				local var_144_8 = utf8.len(var_144_6)
				local var_144_9 = var_144_7 <= 0 and var_144_3 or var_144_3 * (var_144_8 / var_144_7)

				if var_144_9 > 0 and var_144_3 < var_144_9 then
					arg_141_1.talkMaxDuration = var_144_9

					if var_144_9 + var_144_2 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_9 + var_144_2
					end
				end

				arg_141_1.text_.text = var_144_6
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411035", "story_v_out_319411.awb") ~= 0 then
					local var_144_10 = manager.audio:GetVoiceLength("story_v_out_319411", "319411035", "story_v_out_319411.awb") / 1000

					if var_144_10 + var_144_2 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_10 + var_144_2
					end

					if var_144_5.prefab_name ~= "" and arg_141_1.actors_[var_144_5.prefab_name] ~= nil then
						local var_144_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_5.prefab_name].transform, "story_v_out_319411", "319411035", "story_v_out_319411.awb")

						arg_141_1:RecordAudio("319411035", var_144_11)
						arg_141_1:RecordAudio("319411035", var_144_11)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319411", "319411035", "story_v_out_319411.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319411", "319411035", "story_v_out_319411.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_12 = math.max(var_144_3, arg_141_1.talkMaxDuration)

			if var_144_2 <= arg_141_1.time_ and arg_141_1.time_ < var_144_2 + var_144_12 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_2) / var_144_12

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_2 + var_144_12 and arg_141_1.time_ < var_144_2 + var_144_12 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319411036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319411036
		arg_145_1.duration_ = 13.9

		local var_145_0 = {
			zh = 9.2,
			ja = 13.9
		}
		local var_145_1 = manager.audio:GetLocalizationFlag()

		if var_145_0[var_145_1] ~= nil then
			arg_145_1.duration_ = var_145_0[var_145_1]
		end

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play319411037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1095ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1095ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1095ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = arg_145_1.actors_["1095ui_story"]
			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 and arg_145_1.var_.characterEffect1095ui_story == nil then
				arg_145_1.var_.characterEffect1095ui_story = var_148_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_11 = 0.200000002980232

			if var_148_10 <= arg_145_1.time_ and arg_145_1.time_ < var_148_10 + var_148_11 then
				local var_148_12 = (arg_145_1.time_ - var_148_10) / var_148_11

				if arg_145_1.var_.characterEffect1095ui_story then
					arg_145_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_10 + var_148_11 and arg_145_1.time_ < var_148_10 + var_148_11 + arg_148_0 and arg_145_1.var_.characterEffect1095ui_story then
				arg_145_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_148_13 = 0
			local var_148_14 = 0.975

			if var_148_13 < arg_145_1.time_ and arg_145_1.time_ <= var_148_13 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_15 = arg_145_1:FormatText(StoryNameCfg[471].name)

				arg_145_1.leftNameTxt_.text = var_148_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_16 = arg_145_1:GetWordFromCfg(319411036)
				local var_148_17 = arg_145_1:FormatText(var_148_16.content)

				arg_145_1.text_.text = var_148_17

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_18 = 39
				local var_148_19 = utf8.len(var_148_17)
				local var_148_20 = var_148_18 <= 0 and var_148_14 or var_148_14 * (var_148_19 / var_148_18)

				if var_148_20 > 0 and var_148_14 < var_148_20 then
					arg_145_1.talkMaxDuration = var_148_20

					if var_148_20 + var_148_13 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_20 + var_148_13
					end
				end

				arg_145_1.text_.text = var_148_17
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411036", "story_v_out_319411.awb") ~= 0 then
					local var_148_21 = manager.audio:GetVoiceLength("story_v_out_319411", "319411036", "story_v_out_319411.awb") / 1000

					if var_148_21 + var_148_13 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_21 + var_148_13
					end

					if var_148_16.prefab_name ~= "" and arg_145_1.actors_[var_148_16.prefab_name] ~= nil then
						local var_148_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_16.prefab_name].transform, "story_v_out_319411", "319411036", "story_v_out_319411.awb")

						arg_145_1:RecordAudio("319411036", var_148_22)
						arg_145_1:RecordAudio("319411036", var_148_22)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_319411", "319411036", "story_v_out_319411.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_319411", "319411036", "story_v_out_319411.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_23 = math.max(var_148_14, arg_145_1.talkMaxDuration)

			if var_148_13 <= arg_145_1.time_ and arg_145_1.time_ < var_148_13 + var_148_23 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_13) / var_148_23

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_13 + var_148_23 and arg_145_1.time_ < var_148_13 + var_148_23 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play319411037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319411037
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play319411038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1095ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1095ui_story == nil then
				arg_149_1.var_.characterEffect1095ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1095ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1095ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1095ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1095ui_story.fillRatio = var_152_5
			end

			local var_152_6 = 0
			local var_152_7 = 1.725

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_8 = arg_149_1:GetWordFromCfg(319411037)
				local var_152_9 = arg_149_1:FormatText(var_152_8.content)

				arg_149_1.text_.text = var_152_9

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_10 = 69
				local var_152_11 = utf8.len(var_152_9)
				local var_152_12 = var_152_10 <= 0 and var_152_7 or var_152_7 * (var_152_11 / var_152_10)

				if var_152_12 > 0 and var_152_7 < var_152_12 then
					arg_149_1.talkMaxDuration = var_152_12

					if var_152_12 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_12 + var_152_6
					end
				end

				arg_149_1.text_.text = var_152_9
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_13 = math.max(var_152_7, arg_149_1.talkMaxDuration)

			if var_152_6 <= arg_149_1.time_ and arg_149_1.time_ < var_152_6 + var_152_13 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_6) / var_152_13

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_6 + var_152_13 and arg_149_1.time_ < var_152_6 + var_152_13 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play319411038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319411038
		arg_153_1.duration_ = 6.066

		local var_153_0 = {
			zh = 3.6,
			ja = 6.066
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
				arg_153_0:Play319411039(arg_153_1)
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
				local var_156_4 = Vector3.New(0, 100, 0)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1095ui_story, var_156_4, var_156_3)

				local var_156_5 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_5.x, var_156_5.y, var_156_5.z)

				local var_156_6 = var_156_0.localEulerAngles

				var_156_6.z = 0
				var_156_6.x = 0
				var_156_0.localEulerAngles = var_156_6
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(0, 100, 0)

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
					local var_156_13 = Mathf.Lerp(0, 0.5, var_156_12)

					arg_153_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1095ui_story.fillRatio = var_156_13
				end
			end

			if arg_153_1.time_ >= var_156_10 + var_156_11 and arg_153_1.time_ < var_156_10 + var_156_11 + arg_156_0 and arg_153_1.var_.characterEffect1095ui_story then
				local var_156_14 = 0.5

				arg_153_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1095ui_story.fillRatio = var_156_14
			end

			local var_156_15 = arg_153_1.actors_["10066ui_story"].transform
			local var_156_16 = 0

			if var_156_16 < arg_153_1.time_ and arg_153_1.time_ <= var_156_16 + arg_156_0 then
				arg_153_1.var_.moveOldPos10066ui_story = var_156_15.localPosition
			end

			local var_156_17 = 0.001

			if var_156_16 <= arg_153_1.time_ and arg_153_1.time_ < var_156_16 + var_156_17 then
				local var_156_18 = (arg_153_1.time_ - var_156_16) / var_156_17
				local var_156_19 = Vector3.New(0, 100, 0)

				var_156_15.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10066ui_story, var_156_19, var_156_18)

				local var_156_20 = manager.ui.mainCamera.transform.position - var_156_15.position

				var_156_15.forward = Vector3.New(var_156_20.x, var_156_20.y, var_156_20.z)

				local var_156_21 = var_156_15.localEulerAngles

				var_156_21.z = 0
				var_156_21.x = 0
				var_156_15.localEulerAngles = var_156_21
			end

			if arg_153_1.time_ >= var_156_16 + var_156_17 and arg_153_1.time_ < var_156_16 + var_156_17 + arg_156_0 then
				var_156_15.localPosition = Vector3.New(0, 100, 0)

				local var_156_22 = manager.ui.mainCamera.transform.position - var_156_15.position

				var_156_15.forward = Vector3.New(var_156_22.x, var_156_22.y, var_156_22.z)

				local var_156_23 = var_156_15.localEulerAngles

				var_156_23.z = 0
				var_156_23.x = 0
				var_156_15.localEulerAngles = var_156_23
			end

			local var_156_24 = arg_153_1.actors_["10066ui_story"]
			local var_156_25 = 0

			if var_156_25 < arg_153_1.time_ and arg_153_1.time_ <= var_156_25 + arg_156_0 and arg_153_1.var_.characterEffect10066ui_story == nil then
				arg_153_1.var_.characterEffect10066ui_story = var_156_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_26 = 0.200000002980232

			if var_156_25 <= arg_153_1.time_ and arg_153_1.time_ < var_156_25 + var_156_26 then
				local var_156_27 = (arg_153_1.time_ - var_156_25) / var_156_26

				if arg_153_1.var_.characterEffect10066ui_story then
					local var_156_28 = Mathf.Lerp(0, 0.5, var_156_27)

					arg_153_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_153_1.var_.characterEffect10066ui_story.fillRatio = var_156_28
				end
			end

			if arg_153_1.time_ >= var_156_25 + var_156_26 and arg_153_1.time_ < var_156_25 + var_156_26 + arg_156_0 and arg_153_1.var_.characterEffect10066ui_story then
				local var_156_29 = 0.5

				arg_153_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_153_1.var_.characterEffect10066ui_story.fillRatio = var_156_29
			end

			local var_156_30 = arg_153_1.actors_["10079ui_story"].transform
			local var_156_31 = 0

			if var_156_31 < arg_153_1.time_ and arg_153_1.time_ <= var_156_31 + arg_156_0 then
				arg_153_1.var_.moveOldPos10079ui_story = var_156_30.localPosition
			end

			local var_156_32 = 0.001

			if var_156_31 <= arg_153_1.time_ and arg_153_1.time_ < var_156_31 + var_156_32 then
				local var_156_33 = (arg_153_1.time_ - var_156_31) / var_156_32
				local var_156_34 = Vector3.New(0, -0.95, -6.05)

				var_156_30.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10079ui_story, var_156_34, var_156_33)

				local var_156_35 = manager.ui.mainCamera.transform.position - var_156_30.position

				var_156_30.forward = Vector3.New(var_156_35.x, var_156_35.y, var_156_35.z)

				local var_156_36 = var_156_30.localEulerAngles

				var_156_36.z = 0
				var_156_36.x = 0
				var_156_30.localEulerAngles = var_156_36
			end

			if arg_153_1.time_ >= var_156_31 + var_156_32 and arg_153_1.time_ < var_156_31 + var_156_32 + arg_156_0 then
				var_156_30.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_156_37 = manager.ui.mainCamera.transform.position - var_156_30.position

				var_156_30.forward = Vector3.New(var_156_37.x, var_156_37.y, var_156_37.z)

				local var_156_38 = var_156_30.localEulerAngles

				var_156_38.z = 0
				var_156_38.x = 0
				var_156_30.localEulerAngles = var_156_38
			end

			local var_156_39 = arg_153_1.actors_["10079ui_story"]
			local var_156_40 = 0

			if var_156_40 < arg_153_1.time_ and arg_153_1.time_ <= var_156_40 + arg_156_0 and arg_153_1.var_.characterEffect10079ui_story == nil then
				arg_153_1.var_.characterEffect10079ui_story = var_156_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_41 = 0.200000002980232

			if var_156_40 <= arg_153_1.time_ and arg_153_1.time_ < var_156_40 + var_156_41 then
				local var_156_42 = (arg_153_1.time_ - var_156_40) / var_156_41

				if arg_153_1.var_.characterEffect10079ui_story then
					arg_153_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_40 + var_156_41 and arg_153_1.time_ < var_156_40 + var_156_41 + arg_156_0 and arg_153_1.var_.characterEffect10079ui_story then
				arg_153_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_156_43 = 0

			if var_156_43 < arg_153_1.time_ and arg_153_1.time_ <= var_156_43 + arg_156_0 then
				arg_153_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_156_44 = 0

			if var_156_44 < arg_153_1.time_ and arg_153_1.time_ <= var_156_44 + arg_156_0 then
				arg_153_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_156_45 = 0
			local var_156_46 = 0.375

			if var_156_45 < arg_153_1.time_ and arg_153_1.time_ <= var_156_45 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_47 = arg_153_1:FormatText(StoryNameCfg[6].name)

				arg_153_1.leftNameTxt_.text = var_156_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_48 = arg_153_1:GetWordFromCfg(319411038)
				local var_156_49 = arg_153_1:FormatText(var_156_48.content)

				arg_153_1.text_.text = var_156_49

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_50 = 15
				local var_156_51 = utf8.len(var_156_49)
				local var_156_52 = var_156_50 <= 0 and var_156_46 or var_156_46 * (var_156_51 / var_156_50)

				if var_156_52 > 0 and var_156_46 < var_156_52 then
					arg_153_1.talkMaxDuration = var_156_52

					if var_156_52 + var_156_45 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_52 + var_156_45
					end
				end

				arg_153_1.text_.text = var_156_49
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411038", "story_v_out_319411.awb") ~= 0 then
					local var_156_53 = manager.audio:GetVoiceLength("story_v_out_319411", "319411038", "story_v_out_319411.awb") / 1000

					if var_156_53 + var_156_45 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_53 + var_156_45
					end

					if var_156_48.prefab_name ~= "" and arg_153_1.actors_[var_156_48.prefab_name] ~= nil then
						local var_156_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_48.prefab_name].transform, "story_v_out_319411", "319411038", "story_v_out_319411.awb")

						arg_153_1:RecordAudio("319411038", var_156_54)
						arg_153_1:RecordAudio("319411038", var_156_54)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_319411", "319411038", "story_v_out_319411.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_319411", "319411038", "story_v_out_319411.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_55 = math.max(var_156_46, arg_153_1.talkMaxDuration)

			if var_156_45 <= arg_153_1.time_ and arg_153_1.time_ < var_156_45 + var_156_55 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_45) / var_156_55

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_45 + var_156_55 and arg_153_1.time_ < var_156_45 + var_156_55 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319411039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319411039
		arg_157_1.duration_ = 6.2

		local var_157_0 = {
			zh = 1.999999999999,
			ja = 6.2
		}
		local var_157_1 = manager.audio:GetLocalizationFlag()

		if var_157_0[var_157_1] ~= nil then
			arg_157_1.duration_ = var_157_0[var_157_1]
		end

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play319411040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10066ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos10066ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0.7, -0.99, -5.83)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10066ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["10066ui_story"]
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 and arg_157_1.var_.characterEffect10066ui_story == nil then
				arg_157_1.var_.characterEffect10066ui_story = var_160_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_11 = 0.200000002980232

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11

				if arg_157_1.var_.characterEffect10066ui_story then
					arg_157_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 and arg_157_1.var_.characterEffect10066ui_story then
				arg_157_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_160_13 = 0

			if var_160_13 < arg_157_1.time_ and arg_157_1.time_ <= var_160_13 + arg_160_0 then
				arg_157_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action7_2")
			end

			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_160_15 = arg_157_1.actors_["1095ui_story"].transform
			local var_160_16 = 0

			if var_160_16 < arg_157_1.time_ and arg_157_1.time_ <= var_160_16 + arg_160_0 then
				arg_157_1.var_.moveOldPos1095ui_story = var_160_15.localPosition
			end

			local var_160_17 = 0.001

			if var_160_16 <= arg_157_1.time_ and arg_157_1.time_ < var_160_16 + var_160_17 then
				local var_160_18 = (arg_157_1.time_ - var_160_16) / var_160_17
				local var_160_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_160_15.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1095ui_story, var_160_19, var_160_18)

				local var_160_20 = manager.ui.mainCamera.transform.position - var_160_15.position

				var_160_15.forward = Vector3.New(var_160_20.x, var_160_20.y, var_160_20.z)

				local var_160_21 = var_160_15.localEulerAngles

				var_160_21.z = 0
				var_160_21.x = 0
				var_160_15.localEulerAngles = var_160_21
			end

			if arg_157_1.time_ >= var_160_16 + var_160_17 and arg_157_1.time_ < var_160_16 + var_160_17 + arg_160_0 then
				var_160_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_160_22 = manager.ui.mainCamera.transform.position - var_160_15.position

				var_160_15.forward = Vector3.New(var_160_22.x, var_160_22.y, var_160_22.z)

				local var_160_23 = var_160_15.localEulerAngles

				var_160_23.z = 0
				var_160_23.x = 0
				var_160_15.localEulerAngles = var_160_23
			end

			local var_160_24 = arg_157_1.actors_["1095ui_story"]
			local var_160_25 = 0

			if var_160_25 < arg_157_1.time_ and arg_157_1.time_ <= var_160_25 + arg_160_0 and arg_157_1.var_.characterEffect1095ui_story == nil then
				arg_157_1.var_.characterEffect1095ui_story = var_160_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_26 = 0.200000002980232

			if var_160_25 <= arg_157_1.time_ and arg_157_1.time_ < var_160_25 + var_160_26 then
				local var_160_27 = (arg_157_1.time_ - var_160_25) / var_160_26

				if arg_157_1.var_.characterEffect1095ui_story then
					local var_160_28 = Mathf.Lerp(0, 0.5, var_160_27)

					arg_157_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1095ui_story.fillRatio = var_160_28
				end
			end

			if arg_157_1.time_ >= var_160_25 + var_160_26 and arg_157_1.time_ < var_160_25 + var_160_26 + arg_160_0 and arg_157_1.var_.characterEffect1095ui_story then
				local var_160_29 = 0.5

				arg_157_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1095ui_story.fillRatio = var_160_29
			end

			local var_160_30 = arg_157_1.actors_["10079ui_story"].transform
			local var_160_31 = 0

			if var_160_31 < arg_157_1.time_ and arg_157_1.time_ <= var_160_31 + arg_160_0 then
				arg_157_1.var_.moveOldPos10079ui_story = var_160_30.localPosition
			end

			local var_160_32 = 0.001

			if var_160_31 <= arg_157_1.time_ and arg_157_1.time_ < var_160_31 + var_160_32 then
				local var_160_33 = (arg_157_1.time_ - var_160_31) / var_160_32
				local var_160_34 = Vector3.New(0, 100, 0)

				var_160_30.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10079ui_story, var_160_34, var_160_33)

				local var_160_35 = manager.ui.mainCamera.transform.position - var_160_30.position

				var_160_30.forward = Vector3.New(var_160_35.x, var_160_35.y, var_160_35.z)

				local var_160_36 = var_160_30.localEulerAngles

				var_160_36.z = 0
				var_160_36.x = 0
				var_160_30.localEulerAngles = var_160_36
			end

			if arg_157_1.time_ >= var_160_31 + var_160_32 and arg_157_1.time_ < var_160_31 + var_160_32 + arg_160_0 then
				var_160_30.localPosition = Vector3.New(0, 100, 0)

				local var_160_37 = manager.ui.mainCamera.transform.position - var_160_30.position

				var_160_30.forward = Vector3.New(var_160_37.x, var_160_37.y, var_160_37.z)

				local var_160_38 = var_160_30.localEulerAngles

				var_160_38.z = 0
				var_160_38.x = 0
				var_160_30.localEulerAngles = var_160_38
			end

			local var_160_39 = arg_157_1.actors_["10079ui_story"]
			local var_160_40 = 0

			if var_160_40 < arg_157_1.time_ and arg_157_1.time_ <= var_160_40 + arg_160_0 and arg_157_1.var_.characterEffect10079ui_story == nil then
				arg_157_1.var_.characterEffect10079ui_story = var_160_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_41 = 0.200000002980232

			if var_160_40 <= arg_157_1.time_ and arg_157_1.time_ < var_160_40 + var_160_41 then
				local var_160_42 = (arg_157_1.time_ - var_160_40) / var_160_41

				if arg_157_1.var_.characterEffect10079ui_story then
					local var_160_43 = Mathf.Lerp(0, 0.5, var_160_42)

					arg_157_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_157_1.var_.characterEffect10079ui_story.fillRatio = var_160_43
				end
			end

			if arg_157_1.time_ >= var_160_40 + var_160_41 and arg_157_1.time_ < var_160_40 + var_160_41 + arg_160_0 and arg_157_1.var_.characterEffect10079ui_story then
				local var_160_44 = 0.5

				arg_157_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_157_1.var_.characterEffect10079ui_story.fillRatio = var_160_44
			end

			local var_160_45 = 0
			local var_160_46 = 0.1

			if var_160_45 < arg_157_1.time_ and arg_157_1.time_ <= var_160_45 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_47 = arg_157_1:FormatText(StoryNameCfg[640].name)

				arg_157_1.leftNameTxt_.text = var_160_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_48 = arg_157_1:GetWordFromCfg(319411039)
				local var_160_49 = arg_157_1:FormatText(var_160_48.content)

				arg_157_1.text_.text = var_160_49

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_50 = 4
				local var_160_51 = utf8.len(var_160_49)
				local var_160_52 = var_160_50 <= 0 and var_160_46 or var_160_46 * (var_160_51 / var_160_50)

				if var_160_52 > 0 and var_160_46 < var_160_52 then
					arg_157_1.talkMaxDuration = var_160_52

					if var_160_52 + var_160_45 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_52 + var_160_45
					end
				end

				arg_157_1.text_.text = var_160_49
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411039", "story_v_out_319411.awb") ~= 0 then
					local var_160_53 = manager.audio:GetVoiceLength("story_v_out_319411", "319411039", "story_v_out_319411.awb") / 1000

					if var_160_53 + var_160_45 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_53 + var_160_45
					end

					if var_160_48.prefab_name ~= "" and arg_157_1.actors_[var_160_48.prefab_name] ~= nil then
						local var_160_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_48.prefab_name].transform, "story_v_out_319411", "319411039", "story_v_out_319411.awb")

						arg_157_1:RecordAudio("319411039", var_160_54)
						arg_157_1:RecordAudio("319411039", var_160_54)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_319411", "319411039", "story_v_out_319411.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_319411", "319411039", "story_v_out_319411.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_55 = math.max(var_160_46, arg_157_1.talkMaxDuration)

			if var_160_45 <= arg_157_1.time_ and arg_157_1.time_ < var_160_45 + var_160_55 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_45) / var_160_55

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_45 + var_160_55 and arg_157_1.time_ < var_160_45 + var_160_55 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319411040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319411040
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play319411041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10066ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect10066ui_story == nil then
				arg_161_1.var_.characterEffect10066ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect10066ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_161_1.var_.characterEffect10066ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect10066ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_161_1.var_.characterEffect10066ui_story.fillRatio = var_164_5
			end

			local var_164_6 = 0
			local var_164_7 = 1.3

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_8 = arg_161_1:GetWordFromCfg(319411040)
				local var_164_9 = arg_161_1:FormatText(var_164_8.content)

				arg_161_1.text_.text = var_164_9

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_10 = 52
				local var_164_11 = utf8.len(var_164_9)
				local var_164_12 = var_164_10 <= 0 and var_164_7 or var_164_7 * (var_164_11 / var_164_10)

				if var_164_12 > 0 and var_164_7 < var_164_12 then
					arg_161_1.talkMaxDuration = var_164_12

					if var_164_12 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_12 + var_164_6
					end
				end

				arg_161_1.text_.text = var_164_9
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_13 = math.max(var_164_7, arg_161_1.talkMaxDuration)

			if var_164_6 <= arg_161_1.time_ and arg_161_1.time_ < var_164_6 + var_164_13 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_6) / var_164_13

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_6 + var_164_13 and arg_161_1.time_ < var_164_6 + var_164_13 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319411041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 319411041
		arg_165_1.duration_ = 5.233

		local var_165_0 = {
			zh = 5,
			ja = 5.233
		}
		local var_165_1 = manager.audio:GetLocalizationFlag()

		if var_165_0[var_165_1] ~= nil then
			arg_165_1.duration_ = var_165_0[var_165_1]
		end

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play319411042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10066ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect10066ui_story == nil then
				arg_165_1.var_.characterEffect10066ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.200000002980232

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect10066ui_story then
					arg_165_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect10066ui_story then
				arg_165_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_168_4 = 0

			if var_168_4 < arg_165_1.time_ and arg_165_1.time_ <= var_168_4 + arg_168_0 then
				arg_165_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_168_5 = 0
			local var_168_6 = 0.55

			if var_168_5 < arg_165_1.time_ and arg_165_1.time_ <= var_168_5 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_7 = arg_165_1:FormatText(StoryNameCfg[640].name)

				arg_165_1.leftNameTxt_.text = var_168_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_8 = arg_165_1:GetWordFromCfg(319411041)
				local var_168_9 = arg_165_1:FormatText(var_168_8.content)

				arg_165_1.text_.text = var_168_9

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_10 = 22
				local var_168_11 = utf8.len(var_168_9)
				local var_168_12 = var_168_10 <= 0 and var_168_6 or var_168_6 * (var_168_11 / var_168_10)

				if var_168_12 > 0 and var_168_6 < var_168_12 then
					arg_165_1.talkMaxDuration = var_168_12

					if var_168_12 + var_168_5 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_12 + var_168_5
					end
				end

				arg_165_1.text_.text = var_168_9
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411041", "story_v_out_319411.awb") ~= 0 then
					local var_168_13 = manager.audio:GetVoiceLength("story_v_out_319411", "319411041", "story_v_out_319411.awb") / 1000

					if var_168_13 + var_168_5 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_13 + var_168_5
					end

					if var_168_8.prefab_name ~= "" and arg_165_1.actors_[var_168_8.prefab_name] ~= nil then
						local var_168_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_8.prefab_name].transform, "story_v_out_319411", "319411041", "story_v_out_319411.awb")

						arg_165_1:RecordAudio("319411041", var_168_14)
						arg_165_1:RecordAudio("319411041", var_168_14)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_319411", "319411041", "story_v_out_319411.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_319411", "319411041", "story_v_out_319411.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_15 = math.max(var_168_6, arg_165_1.talkMaxDuration)

			if var_168_5 <= arg_165_1.time_ and arg_165_1.time_ < var_168_5 + var_168_15 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_5) / var_168_15

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_5 + var_168_15 and arg_165_1.time_ < var_168_5 + var_168_15 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play319411042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 319411042
		arg_169_1.duration_ = 8.6

		local var_169_0 = {
			zh = 6.633,
			ja = 8.6
		}
		local var_169_1 = manager.audio:GetLocalizationFlag()

		if var_169_0[var_169_1] ~= nil then
			arg_169_1.duration_ = var_169_0[var_169_1]
		end

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play319411043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.6

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_2 = arg_169_1:FormatText(StoryNameCfg[640].name)

				arg_169_1.leftNameTxt_.text = var_172_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_3 = arg_169_1:GetWordFromCfg(319411042)
				local var_172_4 = arg_169_1:FormatText(var_172_3.content)

				arg_169_1.text_.text = var_172_4

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_5 = 24
				local var_172_6 = utf8.len(var_172_4)
				local var_172_7 = var_172_5 <= 0 and var_172_1 or var_172_1 * (var_172_6 / var_172_5)

				if var_172_7 > 0 and var_172_1 < var_172_7 then
					arg_169_1.talkMaxDuration = var_172_7

					if var_172_7 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_7 + var_172_0
					end
				end

				arg_169_1.text_.text = var_172_4
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411042", "story_v_out_319411.awb") ~= 0 then
					local var_172_8 = manager.audio:GetVoiceLength("story_v_out_319411", "319411042", "story_v_out_319411.awb") / 1000

					if var_172_8 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_8 + var_172_0
					end

					if var_172_3.prefab_name ~= "" and arg_169_1.actors_[var_172_3.prefab_name] ~= nil then
						local var_172_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_3.prefab_name].transform, "story_v_out_319411", "319411042", "story_v_out_319411.awb")

						arg_169_1:RecordAudio("319411042", var_172_9)
						arg_169_1:RecordAudio("319411042", var_172_9)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_319411", "319411042", "story_v_out_319411.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_319411", "319411042", "story_v_out_319411.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_10 = math.max(var_172_1, arg_169_1.talkMaxDuration)

			if var_172_0 <= arg_169_1.time_ and arg_169_1.time_ < var_172_0 + var_172_10 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_0) / var_172_10

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_0 + var_172_10 and arg_169_1.time_ < var_172_0 + var_172_10 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play319411043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319411043
		arg_173_1.duration_ = 7

		local var_173_0 = {
			zh = 1.999999999999,
			ja = 7
		}
		local var_173_1 = manager.audio:GetLocalizationFlag()

		if var_173_0[var_173_1] ~= nil then
			arg_173_1.duration_ = var_173_0[var_173_1]
		end

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play319411044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1095ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1095ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1095ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = arg_173_1.actors_["1095ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1095ui_story == nil then
				arg_173_1.var_.characterEffect1095ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.200000002980232

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1095ui_story then
					arg_173_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1095ui_story then
				arg_173_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_176_13 = arg_173_1.actors_["10066ui_story"]
			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 and arg_173_1.var_.characterEffect10066ui_story == nil then
				arg_173_1.var_.characterEffect10066ui_story = var_176_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_15 = 0.200000002980232

			if var_176_14 <= arg_173_1.time_ and arg_173_1.time_ < var_176_14 + var_176_15 then
				local var_176_16 = (arg_173_1.time_ - var_176_14) / var_176_15

				if arg_173_1.var_.characterEffect10066ui_story then
					local var_176_17 = Mathf.Lerp(0, 0.5, var_176_16)

					arg_173_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_173_1.var_.characterEffect10066ui_story.fillRatio = var_176_17
				end
			end

			if arg_173_1.time_ >= var_176_14 + var_176_15 and arg_173_1.time_ < var_176_14 + var_176_15 + arg_176_0 and arg_173_1.var_.characterEffect10066ui_story then
				local var_176_18 = 0.5

				arg_173_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_173_1.var_.characterEffect10066ui_story.fillRatio = var_176_18
			end

			local var_176_19 = 0

			if var_176_19 < arg_173_1.time_ and arg_173_1.time_ <= var_176_19 + arg_176_0 then
				arg_173_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_176_20 = 0

			if var_176_20 < arg_173_1.time_ and arg_173_1.time_ <= var_176_20 + arg_176_0 then
				arg_173_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_176_21 = 0
			local var_176_22 = 0.125

			if var_176_21 < arg_173_1.time_ and arg_173_1.time_ <= var_176_21 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_23 = arg_173_1:FormatText(StoryNameCfg[471].name)

				arg_173_1.leftNameTxt_.text = var_176_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_24 = arg_173_1:GetWordFromCfg(319411043)
				local var_176_25 = arg_173_1:FormatText(var_176_24.content)

				arg_173_1.text_.text = var_176_25

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_26 = 5
				local var_176_27 = utf8.len(var_176_25)
				local var_176_28 = var_176_26 <= 0 and var_176_22 or var_176_22 * (var_176_27 / var_176_26)

				if var_176_28 > 0 and var_176_22 < var_176_28 then
					arg_173_1.talkMaxDuration = var_176_28

					if var_176_28 + var_176_21 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_28 + var_176_21
					end
				end

				arg_173_1.text_.text = var_176_25
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411043", "story_v_out_319411.awb") ~= 0 then
					local var_176_29 = manager.audio:GetVoiceLength("story_v_out_319411", "319411043", "story_v_out_319411.awb") / 1000

					if var_176_29 + var_176_21 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_29 + var_176_21
					end

					if var_176_24.prefab_name ~= "" and arg_173_1.actors_[var_176_24.prefab_name] ~= nil then
						local var_176_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_24.prefab_name].transform, "story_v_out_319411", "319411043", "story_v_out_319411.awb")

						arg_173_1:RecordAudio("319411043", var_176_30)
						arg_173_1:RecordAudio("319411043", var_176_30)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_319411", "319411043", "story_v_out_319411.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_319411", "319411043", "story_v_out_319411.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_31 = math.max(var_176_22, arg_173_1.talkMaxDuration)

			if var_176_21 <= arg_173_1.time_ and arg_173_1.time_ < var_176_21 + var_176_31 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_21) / var_176_31

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_21 + var_176_31 and arg_173_1.time_ < var_176_21 + var_176_31 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play319411044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 319411044
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play319411045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1095ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1095ui_story == nil then
				arg_177_1.var_.characterEffect1095ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.200000002980232

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1095ui_story then
					local var_180_4 = Mathf.Lerp(0, 0.5, var_180_3)

					arg_177_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1095ui_story.fillRatio = var_180_4
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1095ui_story then
				local var_180_5 = 0.5

				arg_177_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1095ui_story.fillRatio = var_180_5
			end

			local var_180_6 = 0
			local var_180_7 = 0.775

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_8 = arg_177_1:GetWordFromCfg(319411044)
				local var_180_9 = arg_177_1:FormatText(var_180_8.content)

				arg_177_1.text_.text = var_180_9

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_10 = 31
				local var_180_11 = utf8.len(var_180_9)
				local var_180_12 = var_180_10 <= 0 and var_180_7 or var_180_7 * (var_180_11 / var_180_10)

				if var_180_12 > 0 and var_180_7 < var_180_12 then
					arg_177_1.talkMaxDuration = var_180_12

					if var_180_12 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_12 + var_180_6
					end
				end

				arg_177_1.text_.text = var_180_9
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_13 = math.max(var_180_7, arg_177_1.talkMaxDuration)

			if var_180_6 <= arg_177_1.time_ and arg_177_1.time_ < var_180_6 + var_180_13 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_6) / var_180_13

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_6 + var_180_13 and arg_177_1.time_ < var_180_6 + var_180_13 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play319411045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 319411045
		arg_181_1.duration_ = 7

		local var_181_0 = {
			zh = 4.833,
			ja = 7
		}
		local var_181_1 = manager.audio:GetLocalizationFlag()

		if var_181_0[var_181_1] ~= nil then
			arg_181_1.duration_ = var_181_0[var_181_1]
		end

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play319411046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1095ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1095ui_story == nil then
				arg_181_1.var_.characterEffect1095ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1095ui_story then
					arg_181_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1095ui_story then
				arg_181_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_184_4 = 0
			local var_184_5 = 0.65

			if var_184_4 < arg_181_1.time_ and arg_181_1.time_ <= var_184_4 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_6 = arg_181_1:FormatText(StoryNameCfg[471].name)

				arg_181_1.leftNameTxt_.text = var_184_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_7 = arg_181_1:GetWordFromCfg(319411045)
				local var_184_8 = arg_181_1:FormatText(var_184_7.content)

				arg_181_1.text_.text = var_184_8

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_9 = 26
				local var_184_10 = utf8.len(var_184_8)
				local var_184_11 = var_184_9 <= 0 and var_184_5 or var_184_5 * (var_184_10 / var_184_9)

				if var_184_11 > 0 and var_184_5 < var_184_11 then
					arg_181_1.talkMaxDuration = var_184_11

					if var_184_11 + var_184_4 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_11 + var_184_4
					end
				end

				arg_181_1.text_.text = var_184_8
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411045", "story_v_out_319411.awb") ~= 0 then
					local var_184_12 = manager.audio:GetVoiceLength("story_v_out_319411", "319411045", "story_v_out_319411.awb") / 1000

					if var_184_12 + var_184_4 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_12 + var_184_4
					end

					if var_184_7.prefab_name ~= "" and arg_181_1.actors_[var_184_7.prefab_name] ~= nil then
						local var_184_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_7.prefab_name].transform, "story_v_out_319411", "319411045", "story_v_out_319411.awb")

						arg_181_1:RecordAudio("319411045", var_184_13)
						arg_181_1:RecordAudio("319411045", var_184_13)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_319411", "319411045", "story_v_out_319411.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_319411", "319411045", "story_v_out_319411.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_14 = math.max(var_184_5, arg_181_1.talkMaxDuration)

			if var_184_4 <= arg_181_1.time_ and arg_181_1.time_ < var_184_4 + var_184_14 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_4) / var_184_14

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_4 + var_184_14 and arg_181_1.time_ < var_184_4 + var_184_14 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play319411046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319411046
		arg_185_1.duration_ = 11.3

		local var_185_0 = {
			zh = 11.3,
			ja = 7.1
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
				arg_185_0:Play319411047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_188_2 = 0
			local var_188_3 = 1.375

			if var_188_2 < arg_185_1.time_ and arg_185_1.time_ <= var_188_2 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_4 = arg_185_1:FormatText(StoryNameCfg[471].name)

				arg_185_1.leftNameTxt_.text = var_188_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_5 = arg_185_1:GetWordFromCfg(319411046)
				local var_188_6 = arg_185_1:FormatText(var_188_5.content)

				arg_185_1.text_.text = var_188_6

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_7 = 55
				local var_188_8 = utf8.len(var_188_6)
				local var_188_9 = var_188_7 <= 0 and var_188_3 or var_188_3 * (var_188_8 / var_188_7)

				if var_188_9 > 0 and var_188_3 < var_188_9 then
					arg_185_1.talkMaxDuration = var_188_9

					if var_188_9 + var_188_2 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_9 + var_188_2
					end
				end

				arg_185_1.text_.text = var_188_6
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411046", "story_v_out_319411.awb") ~= 0 then
					local var_188_10 = manager.audio:GetVoiceLength("story_v_out_319411", "319411046", "story_v_out_319411.awb") / 1000

					if var_188_10 + var_188_2 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_10 + var_188_2
					end

					if var_188_5.prefab_name ~= "" and arg_185_1.actors_[var_188_5.prefab_name] ~= nil then
						local var_188_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_5.prefab_name].transform, "story_v_out_319411", "319411046", "story_v_out_319411.awb")

						arg_185_1:RecordAudio("319411046", var_188_11)
						arg_185_1:RecordAudio("319411046", var_188_11)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319411", "319411046", "story_v_out_319411.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319411", "319411046", "story_v_out_319411.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_12 = math.max(var_188_3, arg_185_1.talkMaxDuration)

			if var_188_2 <= arg_185_1.time_ and arg_185_1.time_ < var_188_2 + var_188_12 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_2) / var_188_12

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_2 + var_188_12 and arg_185_1.time_ < var_188_2 + var_188_12 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319411047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319411047
		arg_189_1.duration_ = 13.133

		local var_189_0 = {
			zh = 13.133,
			ja = 11.7
		}
		local var_189_1 = manager.audio:GetLocalizationFlag()

		if var_189_0[var_189_1] ~= nil then
			arg_189_1.duration_ = var_189_0[var_189_1]
		end

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play319411048(arg_189_1)
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
				local var_192_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1095ui_story, var_192_4, var_192_3)

				local var_192_5 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_5.x, var_192_5.y, var_192_5.z)

				local var_192_6 = var_192_0.localEulerAngles

				var_192_6.z = 0
				var_192_6.x = 0
				var_192_0.localEulerAngles = var_192_6
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

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
					arg_189_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_10 + var_192_11 and arg_189_1.time_ < var_192_10 + var_192_11 + arg_192_0 and arg_189_1.var_.characterEffect1095ui_story then
				arg_189_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_192_13 = 0
			local var_192_14 = 1.5

			if var_192_13 < arg_189_1.time_ and arg_189_1.time_ <= var_192_13 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_15 = arg_189_1:FormatText(StoryNameCfg[471].name)

				arg_189_1.leftNameTxt_.text = var_192_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_16 = arg_189_1:GetWordFromCfg(319411047)
				local var_192_17 = arg_189_1:FormatText(var_192_16.content)

				arg_189_1.text_.text = var_192_17

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_18 = 60
				local var_192_19 = utf8.len(var_192_17)
				local var_192_20 = var_192_18 <= 0 and var_192_14 or var_192_14 * (var_192_19 / var_192_18)

				if var_192_20 > 0 and var_192_14 < var_192_20 then
					arg_189_1.talkMaxDuration = var_192_20

					if var_192_20 + var_192_13 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_20 + var_192_13
					end
				end

				arg_189_1.text_.text = var_192_17
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411047", "story_v_out_319411.awb") ~= 0 then
					local var_192_21 = manager.audio:GetVoiceLength("story_v_out_319411", "319411047", "story_v_out_319411.awb") / 1000

					if var_192_21 + var_192_13 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_21 + var_192_13
					end

					if var_192_16.prefab_name ~= "" and arg_189_1.actors_[var_192_16.prefab_name] ~= nil then
						local var_192_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_16.prefab_name].transform, "story_v_out_319411", "319411047", "story_v_out_319411.awb")

						arg_189_1:RecordAudio("319411047", var_192_22)
						arg_189_1:RecordAudio("319411047", var_192_22)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_319411", "319411047", "story_v_out_319411.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_319411", "319411047", "story_v_out_319411.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_23 = math.max(var_192_14, arg_189_1.talkMaxDuration)

			if var_192_13 <= arg_189_1.time_ and arg_189_1.time_ < var_192_13 + var_192_23 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_13) / var_192_23

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_13 + var_192_23 and arg_189_1.time_ < var_192_13 + var_192_23 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play319411048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319411048
		arg_193_1.duration_ = 4.5

		local var_193_0 = {
			zh = 2.7,
			ja = 4.5
		}
		local var_193_1 = manager.audio:GetLocalizationFlag()

		if var_193_0[var_193_1] ~= nil then
			arg_193_1.duration_ = var_193_0[var_193_1]
		end

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play319411049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10066ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos10066ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(0.7, -0.99, -5.83)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos10066ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["10066ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and arg_193_1.var_.characterEffect10066ui_story == nil then
				arg_193_1.var_.characterEffect10066ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.200000002980232

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect10066ui_story then
					arg_193_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and arg_193_1.var_.characterEffect10066ui_story then
				arg_193_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_196_13 = 0

			if var_196_13 < arg_193_1.time_ and arg_193_1.time_ <= var_196_13 + arg_196_0 then
				arg_193_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_1")
			end

			local var_196_14 = 0

			if var_196_14 < arg_193_1.time_ and arg_193_1.time_ <= var_196_14 + arg_196_0 then
				arg_193_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_196_15 = arg_193_1.actors_["1095ui_story"]
			local var_196_16 = 0

			if var_196_16 < arg_193_1.time_ and arg_193_1.time_ <= var_196_16 + arg_196_0 and arg_193_1.var_.characterEffect1095ui_story == nil then
				arg_193_1.var_.characterEffect1095ui_story = var_196_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_17 = 0.200000002980232

			if var_196_16 <= arg_193_1.time_ and arg_193_1.time_ < var_196_16 + var_196_17 then
				local var_196_18 = (arg_193_1.time_ - var_196_16) / var_196_17

				if arg_193_1.var_.characterEffect1095ui_story then
					local var_196_19 = Mathf.Lerp(0, 0.5, var_196_18)

					arg_193_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1095ui_story.fillRatio = var_196_19
				end
			end

			if arg_193_1.time_ >= var_196_16 + var_196_17 and arg_193_1.time_ < var_196_16 + var_196_17 + arg_196_0 and arg_193_1.var_.characterEffect1095ui_story then
				local var_196_20 = 0.5

				arg_193_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1095ui_story.fillRatio = var_196_20
			end

			local var_196_21 = 0
			local var_196_22 = 0.275

			if var_196_21 < arg_193_1.time_ and arg_193_1.time_ <= var_196_21 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_23 = arg_193_1:FormatText(StoryNameCfg[640].name)

				arg_193_1.leftNameTxt_.text = var_196_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_24 = arg_193_1:GetWordFromCfg(319411048)
				local var_196_25 = arg_193_1:FormatText(var_196_24.content)

				arg_193_1.text_.text = var_196_25

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_26 = 11
				local var_196_27 = utf8.len(var_196_25)
				local var_196_28 = var_196_26 <= 0 and var_196_22 or var_196_22 * (var_196_27 / var_196_26)

				if var_196_28 > 0 and var_196_22 < var_196_28 then
					arg_193_1.talkMaxDuration = var_196_28

					if var_196_28 + var_196_21 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_28 + var_196_21
					end
				end

				arg_193_1.text_.text = var_196_25
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411048", "story_v_out_319411.awb") ~= 0 then
					local var_196_29 = manager.audio:GetVoiceLength("story_v_out_319411", "319411048", "story_v_out_319411.awb") / 1000

					if var_196_29 + var_196_21 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_29 + var_196_21
					end

					if var_196_24.prefab_name ~= "" and arg_193_1.actors_[var_196_24.prefab_name] ~= nil then
						local var_196_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_24.prefab_name].transform, "story_v_out_319411", "319411048", "story_v_out_319411.awb")

						arg_193_1:RecordAudio("319411048", var_196_30)
						arg_193_1:RecordAudio("319411048", var_196_30)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_319411", "319411048", "story_v_out_319411.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_319411", "319411048", "story_v_out_319411.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_31 = math.max(var_196_22, arg_193_1.talkMaxDuration)

			if var_196_21 <= arg_193_1.time_ and arg_193_1.time_ < var_196_21 + var_196_31 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_21) / var_196_31

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_21 + var_196_31 and arg_193_1.time_ < var_196_21 + var_196_31 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play319411049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 319411049
		arg_197_1.duration_ = 10

		local var_197_0 = {
			zh = 8,
			ja = 10
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
				arg_197_0:Play319411050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["10066ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect10066ui_story == nil then
				arg_197_1.var_.characterEffect10066ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect10066ui_story then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_197_1.var_.characterEffect10066ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect10066ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_197_1.var_.characterEffect10066ui_story.fillRatio = var_200_5
			end

			local var_200_6 = arg_197_1.actors_["1095ui_story"]
			local var_200_7 = 0

			if var_200_7 < arg_197_1.time_ and arg_197_1.time_ <= var_200_7 + arg_200_0 and arg_197_1.var_.characterEffect1095ui_story == nil then
				arg_197_1.var_.characterEffect1095ui_story = var_200_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_8 = 0.200000002980232

			if var_200_7 <= arg_197_1.time_ and arg_197_1.time_ < var_200_7 + var_200_8 then
				local var_200_9 = (arg_197_1.time_ - var_200_7) / var_200_8

				if arg_197_1.var_.characterEffect1095ui_story then
					arg_197_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_7 + var_200_8 and arg_197_1.time_ < var_200_7 + var_200_8 + arg_200_0 and arg_197_1.var_.characterEffect1095ui_story then
				arg_197_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_200_10 = 0
			local var_200_11 = 0.85

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_12 = arg_197_1:FormatText(StoryNameCfg[471].name)

				arg_197_1.leftNameTxt_.text = var_200_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_13 = arg_197_1:GetWordFromCfg(319411049)
				local var_200_14 = arg_197_1:FormatText(var_200_13.content)

				arg_197_1.text_.text = var_200_14

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_15 = 34
				local var_200_16 = utf8.len(var_200_14)
				local var_200_17 = var_200_15 <= 0 and var_200_11 or var_200_11 * (var_200_16 / var_200_15)

				if var_200_17 > 0 and var_200_11 < var_200_17 then
					arg_197_1.talkMaxDuration = var_200_17

					if var_200_17 + var_200_10 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_17 + var_200_10
					end
				end

				arg_197_1.text_.text = var_200_14
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411049", "story_v_out_319411.awb") ~= 0 then
					local var_200_18 = manager.audio:GetVoiceLength("story_v_out_319411", "319411049", "story_v_out_319411.awb") / 1000

					if var_200_18 + var_200_10 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_18 + var_200_10
					end

					if var_200_13.prefab_name ~= "" and arg_197_1.actors_[var_200_13.prefab_name] ~= nil then
						local var_200_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_13.prefab_name].transform, "story_v_out_319411", "319411049", "story_v_out_319411.awb")

						arg_197_1:RecordAudio("319411049", var_200_19)
						arg_197_1:RecordAudio("319411049", var_200_19)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_319411", "319411049", "story_v_out_319411.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_319411", "319411049", "story_v_out_319411.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_20 = math.max(var_200_11, arg_197_1.talkMaxDuration)

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_20 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_10) / var_200_20

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_10 + var_200_20 and arg_197_1.time_ < var_200_10 + var_200_20 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play319411050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 319411050
		arg_201_1.duration_ = 10.066

		local var_201_0 = {
			zh = 10.066,
			ja = 9.3
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play319411051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 1.2

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_2 = arg_201_1:FormatText(StoryNameCfg[471].name)

				arg_201_1.leftNameTxt_.text = var_204_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_3 = arg_201_1:GetWordFromCfg(319411050)
				local var_204_4 = arg_201_1:FormatText(var_204_3.content)

				arg_201_1.text_.text = var_204_4

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_5 = 48
				local var_204_6 = utf8.len(var_204_4)
				local var_204_7 = var_204_5 <= 0 and var_204_1 or var_204_1 * (var_204_6 / var_204_5)

				if var_204_7 > 0 and var_204_1 < var_204_7 then
					arg_201_1.talkMaxDuration = var_204_7

					if var_204_7 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_7 + var_204_0
					end
				end

				arg_201_1.text_.text = var_204_4
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411050", "story_v_out_319411.awb") ~= 0 then
					local var_204_8 = manager.audio:GetVoiceLength("story_v_out_319411", "319411050", "story_v_out_319411.awb") / 1000

					if var_204_8 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_8 + var_204_0
					end

					if var_204_3.prefab_name ~= "" and arg_201_1.actors_[var_204_3.prefab_name] ~= nil then
						local var_204_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_3.prefab_name].transform, "story_v_out_319411", "319411050", "story_v_out_319411.awb")

						arg_201_1:RecordAudio("319411050", var_204_9)
						arg_201_1:RecordAudio("319411050", var_204_9)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_319411", "319411050", "story_v_out_319411.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_319411", "319411050", "story_v_out_319411.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_10 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_10 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_10

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_10 and arg_201_1.time_ < var_204_0 + var_204_10 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play319411051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 319411051
		arg_205_1.duration_ = 13

		local var_205_0 = {
			zh = 9.7,
			ja = 13
		}
		local var_205_1 = manager.audio:GetLocalizationFlag()

		if var_205_0[var_205_1] ~= nil then
			arg_205_1.duration_ = var_205_0[var_205_1]
		end

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play319411052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_208_2 = 0
			local var_208_3 = 1.175

			if var_208_2 < arg_205_1.time_ and arg_205_1.time_ <= var_208_2 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_4 = arg_205_1:FormatText(StoryNameCfg[471].name)

				arg_205_1.leftNameTxt_.text = var_208_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_5 = arg_205_1:GetWordFromCfg(319411051)
				local var_208_6 = arg_205_1:FormatText(var_208_5.content)

				arg_205_1.text_.text = var_208_6

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_7 = 47
				local var_208_8 = utf8.len(var_208_6)
				local var_208_9 = var_208_7 <= 0 and var_208_3 or var_208_3 * (var_208_8 / var_208_7)

				if var_208_9 > 0 and var_208_3 < var_208_9 then
					arg_205_1.talkMaxDuration = var_208_9

					if var_208_9 + var_208_2 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_9 + var_208_2
					end
				end

				arg_205_1.text_.text = var_208_6
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411051", "story_v_out_319411.awb") ~= 0 then
					local var_208_10 = manager.audio:GetVoiceLength("story_v_out_319411", "319411051", "story_v_out_319411.awb") / 1000

					if var_208_10 + var_208_2 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_10 + var_208_2
					end

					if var_208_5.prefab_name ~= "" and arg_205_1.actors_[var_208_5.prefab_name] ~= nil then
						local var_208_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_5.prefab_name].transform, "story_v_out_319411", "319411051", "story_v_out_319411.awb")

						arg_205_1:RecordAudio("319411051", var_208_11)
						arg_205_1:RecordAudio("319411051", var_208_11)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_319411", "319411051", "story_v_out_319411.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_319411", "319411051", "story_v_out_319411.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_12 = math.max(var_208_3, arg_205_1.talkMaxDuration)

			if var_208_2 <= arg_205_1.time_ and arg_205_1.time_ < var_208_2 + var_208_12 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_2) / var_208_12

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_2 + var_208_12 and arg_205_1.time_ < var_208_2 + var_208_12 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play319411052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 319411052
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play319411053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1095ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect1095ui_story == nil then
				arg_209_1.var_.characterEffect1095ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.200000002980232

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1095ui_story then
					local var_212_4 = Mathf.Lerp(0, 0.5, var_212_3)

					arg_209_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1095ui_story.fillRatio = var_212_4
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1095ui_story then
				local var_212_5 = 0.5

				arg_209_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1095ui_story.fillRatio = var_212_5
			end

			local var_212_6 = 0
			local var_212_7 = 1.65

			if var_212_6 < arg_209_1.time_ and arg_209_1.time_ <= var_212_6 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_8 = arg_209_1:GetWordFromCfg(319411052)
				local var_212_9 = arg_209_1:FormatText(var_212_8.content)

				arg_209_1.text_.text = var_212_9

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_10 = 66
				local var_212_11 = utf8.len(var_212_9)
				local var_212_12 = var_212_10 <= 0 and var_212_7 or var_212_7 * (var_212_11 / var_212_10)

				if var_212_12 > 0 and var_212_7 < var_212_12 then
					arg_209_1.talkMaxDuration = var_212_12

					if var_212_12 + var_212_6 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_12 + var_212_6
					end
				end

				arg_209_1.text_.text = var_212_9
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_13 = math.max(var_212_7, arg_209_1.talkMaxDuration)

			if var_212_6 <= arg_209_1.time_ and arg_209_1.time_ < var_212_6 + var_212_13 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_6) / var_212_13

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_6 + var_212_13 and arg_209_1.time_ < var_212_6 + var_212_13 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play319411053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 319411053
		arg_213_1.duration_ = 8

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play319411054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 1.73333333333333

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				local var_216_1 = manager.ui.mainCamera.transform.localPosition
				local var_216_2 = Vector3.New(0, 0, 10) + Vector3.New(var_216_1.x, var_216_1.y, 0)
				local var_216_3 = arg_213_1.bgs_.I11n

				var_216_3.transform.localPosition = var_216_2
				var_216_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_216_4 = var_216_3:GetComponent("SpriteRenderer")

				if var_216_4 and var_216_4.sprite then
					local var_216_5 = (var_216_3.transform.localPosition - var_216_1).z
					local var_216_6 = manager.ui.mainCameraCom_
					local var_216_7 = 2 * var_216_5 * Mathf.Tan(var_216_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_216_8 = var_216_7 * var_216_6.aspect
					local var_216_9 = var_216_4.sprite.bounds.size.x
					local var_216_10 = var_216_4.sprite.bounds.size.y
					local var_216_11 = var_216_8 / var_216_9
					local var_216_12 = var_216_7 / var_216_10
					local var_216_13 = var_216_12 < var_216_11 and var_216_11 or var_216_12

					var_216_3.transform.localScale = Vector3.New(var_216_13, var_216_13, 0)
				end

				for iter_216_0, iter_216_1 in pairs(arg_213_1.bgs_) do
					if iter_216_0 ~= "I11n" then
						iter_216_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_216_14 = 0

			if var_216_14 < arg_213_1.time_ and arg_213_1.time_ <= var_216_14 + arg_216_0 then
				arg_213_1.mask_.enabled = true
				arg_213_1.mask_.raycastTarget = true

				arg_213_1:SetGaussion(false)
			end

			local var_216_15 = 1.73333333333333

			if var_216_14 <= arg_213_1.time_ and arg_213_1.time_ < var_216_14 + var_216_15 then
				local var_216_16 = (arg_213_1.time_ - var_216_14) / var_216_15
				local var_216_17 = Color.New(0, 0, 0)

				var_216_17.a = Mathf.Lerp(0, 1, var_216_16)
				arg_213_1.mask_.color = var_216_17
			end

			if arg_213_1.time_ >= var_216_14 + var_216_15 and arg_213_1.time_ < var_216_14 + var_216_15 + arg_216_0 then
				local var_216_18 = Color.New(0, 0, 0)

				var_216_18.a = 1
				arg_213_1.mask_.color = var_216_18
			end

			local var_216_19 = 1.73333333333333

			if var_216_19 < arg_213_1.time_ and arg_213_1.time_ <= var_216_19 + arg_216_0 then
				arg_213_1.mask_.enabled = true
				arg_213_1.mask_.raycastTarget = true

				arg_213_1:SetGaussion(false)
			end

			local var_216_20 = 2

			if var_216_19 <= arg_213_1.time_ and arg_213_1.time_ < var_216_19 + var_216_20 then
				local var_216_21 = (arg_213_1.time_ - var_216_19) / var_216_20
				local var_216_22 = Color.New(0, 0, 0)

				var_216_22.a = Mathf.Lerp(1, 0, var_216_21)
				arg_213_1.mask_.color = var_216_22
			end

			if arg_213_1.time_ >= var_216_19 + var_216_20 and arg_213_1.time_ < var_216_19 + var_216_20 + arg_216_0 then
				local var_216_23 = Color.New(0, 0, 0)
				local var_216_24 = 0

				arg_213_1.mask_.enabled = false
				var_216_23.a = var_216_24
				arg_213_1.mask_.color = var_216_23
			end

			local var_216_25 = arg_213_1.actors_["1095ui_story"].transform
			local var_216_26 = 1.73333333333333

			if var_216_26 < arg_213_1.time_ and arg_213_1.time_ <= var_216_26 + arg_216_0 then
				arg_213_1.var_.moveOldPos1095ui_story = var_216_25.localPosition
			end

			local var_216_27 = 0.001

			if var_216_26 <= arg_213_1.time_ and arg_213_1.time_ < var_216_26 + var_216_27 then
				local var_216_28 = (arg_213_1.time_ - var_216_26) / var_216_27
				local var_216_29 = Vector3.New(0, 100, 0)

				var_216_25.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1095ui_story, var_216_29, var_216_28)

				local var_216_30 = manager.ui.mainCamera.transform.position - var_216_25.position

				var_216_25.forward = Vector3.New(var_216_30.x, var_216_30.y, var_216_30.z)

				local var_216_31 = var_216_25.localEulerAngles

				var_216_31.z = 0
				var_216_31.x = 0
				var_216_25.localEulerAngles = var_216_31
			end

			if arg_213_1.time_ >= var_216_26 + var_216_27 and arg_213_1.time_ < var_216_26 + var_216_27 + arg_216_0 then
				var_216_25.localPosition = Vector3.New(0, 100, 0)

				local var_216_32 = manager.ui.mainCamera.transform.position - var_216_25.position

				var_216_25.forward = Vector3.New(var_216_32.x, var_216_32.y, var_216_32.z)

				local var_216_33 = var_216_25.localEulerAngles

				var_216_33.z = 0
				var_216_33.x = 0
				var_216_25.localEulerAngles = var_216_33
			end

			local var_216_34 = arg_213_1.actors_["10066ui_story"].transform
			local var_216_35 = 1.73333333333333

			if var_216_35 < arg_213_1.time_ and arg_213_1.time_ <= var_216_35 + arg_216_0 then
				arg_213_1.var_.moveOldPos10066ui_story = var_216_34.localPosition
			end

			local var_216_36 = 0.001

			if var_216_35 <= arg_213_1.time_ and arg_213_1.time_ < var_216_35 + var_216_36 then
				local var_216_37 = (arg_213_1.time_ - var_216_35) / var_216_36
				local var_216_38 = Vector3.New(0, 100, 0)

				var_216_34.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos10066ui_story, var_216_38, var_216_37)

				local var_216_39 = manager.ui.mainCamera.transform.position - var_216_34.position

				var_216_34.forward = Vector3.New(var_216_39.x, var_216_39.y, var_216_39.z)

				local var_216_40 = var_216_34.localEulerAngles

				var_216_40.z = 0
				var_216_40.x = 0
				var_216_34.localEulerAngles = var_216_40
			end

			if arg_213_1.time_ >= var_216_35 + var_216_36 and arg_213_1.time_ < var_216_35 + var_216_36 + arg_216_0 then
				var_216_34.localPosition = Vector3.New(0, 100, 0)

				local var_216_41 = manager.ui.mainCamera.transform.position - var_216_34.position

				var_216_34.forward = Vector3.New(var_216_41.x, var_216_41.y, var_216_41.z)

				local var_216_42 = var_216_34.localEulerAngles

				var_216_42.z = 0
				var_216_42.x = 0
				var_216_34.localEulerAngles = var_216_42
			end

			if arg_213_1.frameCnt_ <= 1 then
				arg_213_1.dialog_:SetActive(false)
			end

			local var_216_43 = 3
			local var_216_44 = 1.7

			if var_216_43 < arg_213_1.time_ and arg_213_1.time_ <= var_216_43 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0

				arg_213_1.dialog_:SetActive(true)

				local var_216_45 = LeanTween.value(arg_213_1.dialog_, 0, 1, 0.3)

				var_216_45:setOnUpdate(LuaHelper.FloatAction(function(arg_217_0)
					arg_213_1.dialogCg_.alpha = arg_217_0
				end))
				var_216_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_213_1.dialog_)
					var_216_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_213_1.duration_ = arg_213_1.duration_ + 0.3

				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_46 = arg_213_1:GetWordFromCfg(319411053)
				local var_216_47 = arg_213_1:FormatText(var_216_46.content)

				arg_213_1.text_.text = var_216_47

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_48 = 68
				local var_216_49 = utf8.len(var_216_47)
				local var_216_50 = var_216_48 <= 0 and var_216_44 or var_216_44 * (var_216_49 / var_216_48)

				if var_216_50 > 0 and var_216_44 < var_216_50 then
					arg_213_1.talkMaxDuration = var_216_50
					var_216_43 = var_216_43 + 0.3

					if var_216_50 + var_216_43 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_50 + var_216_43
					end
				end

				arg_213_1.text_.text = var_216_47
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_51 = var_216_43 + 0.3
			local var_216_52 = math.max(var_216_44, arg_213_1.talkMaxDuration)

			if var_216_51 <= arg_213_1.time_ and arg_213_1.time_ < var_216_51 + var_216_52 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_51) / var_216_52

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_51 + var_216_52 and arg_213_1.time_ < var_216_51 + var_216_52 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play319411054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 319411054
		arg_219_1.duration_ = 7.833

		local var_219_0 = {
			zh = 4.033,
			ja = 7.833
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
				arg_219_0:Play319411055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10066ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect10066ui_story == nil then
				arg_219_1.var_.characterEffect10066ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.200000002980232

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect10066ui_story then
					arg_219_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect10066ui_story then
				arg_219_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_222_4 = arg_219_1.actors_["10066ui_story"].transform
			local var_222_5 = 0

			if var_222_5 < arg_219_1.time_ and arg_219_1.time_ <= var_222_5 + arg_222_0 then
				arg_219_1.var_.moveOldPos10066ui_story = var_222_4.localPosition
			end

			local var_222_6 = 0.001

			if var_222_5 <= arg_219_1.time_ and arg_219_1.time_ < var_222_5 + var_222_6 then
				local var_222_7 = (arg_219_1.time_ - var_222_5) / var_222_6
				local var_222_8 = Vector3.New(0, -0.99, -5.83)

				var_222_4.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10066ui_story, var_222_8, var_222_7)

				local var_222_9 = manager.ui.mainCamera.transform.position - var_222_4.position

				var_222_4.forward = Vector3.New(var_222_9.x, var_222_9.y, var_222_9.z)

				local var_222_10 = var_222_4.localEulerAngles

				var_222_10.z = 0
				var_222_10.x = 0
				var_222_4.localEulerAngles = var_222_10
			end

			if arg_219_1.time_ >= var_222_5 + var_222_6 and arg_219_1.time_ < var_222_5 + var_222_6 + arg_222_0 then
				var_222_4.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_222_11 = manager.ui.mainCamera.transform.position - var_222_4.position

				var_222_4.forward = Vector3.New(var_222_11.x, var_222_11.y, var_222_11.z)

				local var_222_12 = var_222_4.localEulerAngles

				var_222_12.z = 0
				var_222_12.x = 0
				var_222_4.localEulerAngles = var_222_12
			end

			local var_222_13 = arg_219_1.actors_["10066ui_story"]
			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 and arg_219_1.var_.characterEffect10066ui_story == nil then
				arg_219_1.var_.characterEffect10066ui_story = var_222_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_15 = 0.200000002980232

			if var_222_14 <= arg_219_1.time_ and arg_219_1.time_ < var_222_14 + var_222_15 then
				local var_222_16 = (arg_219_1.time_ - var_222_14) / var_222_15

				if arg_219_1.var_.characterEffect10066ui_story then
					arg_219_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_14 + var_222_15 and arg_219_1.time_ < var_222_14 + var_222_15 + arg_222_0 and arg_219_1.var_.characterEffect10066ui_story then
				arg_219_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_222_17 = 0

			if var_222_17 < arg_219_1.time_ and arg_219_1.time_ <= var_222_17 + arg_222_0 then
				arg_219_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_222_18 = 0

			if var_222_18 < arg_219_1.time_ and arg_219_1.time_ <= var_222_18 + arg_222_0 then
				arg_219_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_2")
			end

			local var_222_19 = 0
			local var_222_20 = 0.35

			if var_222_19 < arg_219_1.time_ and arg_219_1.time_ <= var_222_19 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_21 = arg_219_1:FormatText(StoryNameCfg[640].name)

				arg_219_1.leftNameTxt_.text = var_222_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_22 = arg_219_1:GetWordFromCfg(319411054)
				local var_222_23 = arg_219_1:FormatText(var_222_22.content)

				arg_219_1.text_.text = var_222_23

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_24 = 14
				local var_222_25 = utf8.len(var_222_23)
				local var_222_26 = var_222_24 <= 0 and var_222_20 or var_222_20 * (var_222_25 / var_222_24)

				if var_222_26 > 0 and var_222_20 < var_222_26 then
					arg_219_1.talkMaxDuration = var_222_26

					if var_222_26 + var_222_19 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_26 + var_222_19
					end
				end

				arg_219_1.text_.text = var_222_23
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411054", "story_v_out_319411.awb") ~= 0 then
					local var_222_27 = manager.audio:GetVoiceLength("story_v_out_319411", "319411054", "story_v_out_319411.awb") / 1000

					if var_222_27 + var_222_19 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_27 + var_222_19
					end

					if var_222_22.prefab_name ~= "" and arg_219_1.actors_[var_222_22.prefab_name] ~= nil then
						local var_222_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_22.prefab_name].transform, "story_v_out_319411", "319411054", "story_v_out_319411.awb")

						arg_219_1:RecordAudio("319411054", var_222_28)
						arg_219_1:RecordAudio("319411054", var_222_28)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_319411", "319411054", "story_v_out_319411.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_319411", "319411054", "story_v_out_319411.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_29 = math.max(var_222_20, arg_219_1.talkMaxDuration)

			if var_222_19 <= arg_219_1.time_ and arg_219_1.time_ < var_222_19 + var_222_29 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_19) / var_222_29

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_19 + var_222_29 and arg_219_1.time_ < var_222_19 + var_222_29 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play319411055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 319411055
		arg_223_1.duration_ = 6.333

		local var_223_0 = {
			zh = 6.333,
			ja = 3.966
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
				arg_223_0:Play319411056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10066ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect10066ui_story == nil then
				arg_223_1.var_.characterEffect10066ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect10066ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_223_1.var_.characterEffect10066ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect10066ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_223_1.var_.characterEffect10066ui_story.fillRatio = var_226_5
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

			local var_226_10 = arg_223_1.actors_["10066ui_story"].transform
			local var_226_11 = 0

			if var_226_11 < arg_223_1.time_ and arg_223_1.time_ <= var_226_11 + arg_226_0 then
				arg_223_1.var_.moveOldPos10066ui_story = var_226_10.localPosition
			end

			local var_226_12 = 0.001

			if var_226_11 <= arg_223_1.time_ and arg_223_1.time_ < var_226_11 + var_226_12 then
				local var_226_13 = (arg_223_1.time_ - var_226_11) / var_226_12
				local var_226_14 = Vector3.New(0.7, -0.99, -5.83)

				var_226_10.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10066ui_story, var_226_14, var_226_13)

				local var_226_15 = manager.ui.mainCamera.transform.position - var_226_10.position

				var_226_10.forward = Vector3.New(var_226_15.x, var_226_15.y, var_226_15.z)

				local var_226_16 = var_226_10.localEulerAngles

				var_226_16.z = 0
				var_226_16.x = 0
				var_226_10.localEulerAngles = var_226_16
			end

			if arg_223_1.time_ >= var_226_11 + var_226_12 and arg_223_1.time_ < var_226_11 + var_226_12 + arg_226_0 then
				var_226_10.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_226_17 = manager.ui.mainCamera.transform.position - var_226_10.position

				var_226_10.forward = Vector3.New(var_226_17.x, var_226_17.y, var_226_17.z)

				local var_226_18 = var_226_10.localEulerAngles

				var_226_18.z = 0
				var_226_18.x = 0
				var_226_10.localEulerAngles = var_226_18
			end

			local var_226_19 = arg_223_1.actors_["1095ui_story"].transform
			local var_226_20 = 0

			if var_226_20 < arg_223_1.time_ and arg_223_1.time_ <= var_226_20 + arg_226_0 then
				arg_223_1.var_.moveOldPos1095ui_story = var_226_19.localPosition
			end

			local var_226_21 = 0.001

			if var_226_20 <= arg_223_1.time_ and arg_223_1.time_ < var_226_20 + var_226_21 then
				local var_226_22 = (arg_223_1.time_ - var_226_20) / var_226_21
				local var_226_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_226_19.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1095ui_story, var_226_23, var_226_22)

				local var_226_24 = manager.ui.mainCamera.transform.position - var_226_19.position

				var_226_19.forward = Vector3.New(var_226_24.x, var_226_24.y, var_226_24.z)

				local var_226_25 = var_226_19.localEulerAngles

				var_226_25.z = 0
				var_226_25.x = 0
				var_226_19.localEulerAngles = var_226_25
			end

			if arg_223_1.time_ >= var_226_20 + var_226_21 and arg_223_1.time_ < var_226_20 + var_226_21 + arg_226_0 then
				var_226_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_226_26 = manager.ui.mainCamera.transform.position - var_226_19.position

				var_226_19.forward = Vector3.New(var_226_26.x, var_226_26.y, var_226_26.z)

				local var_226_27 = var_226_19.localEulerAngles

				var_226_27.z = 0
				var_226_27.x = 0
				var_226_19.localEulerAngles = var_226_27
			end

			local var_226_28 = 0
			local var_226_29 = 0.85

			if var_226_28 < arg_223_1.time_ and arg_223_1.time_ <= var_226_28 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_30 = arg_223_1:FormatText(StoryNameCfg[471].name)

				arg_223_1.leftNameTxt_.text = var_226_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_31 = arg_223_1:GetWordFromCfg(319411055)
				local var_226_32 = arg_223_1:FormatText(var_226_31.content)

				arg_223_1.text_.text = var_226_32

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_33 = 34
				local var_226_34 = utf8.len(var_226_32)
				local var_226_35 = var_226_33 <= 0 and var_226_29 or var_226_29 * (var_226_34 / var_226_33)

				if var_226_35 > 0 and var_226_29 < var_226_35 then
					arg_223_1.talkMaxDuration = var_226_35

					if var_226_35 + var_226_28 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_35 + var_226_28
					end
				end

				arg_223_1.text_.text = var_226_32
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411055", "story_v_out_319411.awb") ~= 0 then
					local var_226_36 = manager.audio:GetVoiceLength("story_v_out_319411", "319411055", "story_v_out_319411.awb") / 1000

					if var_226_36 + var_226_28 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_36 + var_226_28
					end

					if var_226_31.prefab_name ~= "" and arg_223_1.actors_[var_226_31.prefab_name] ~= nil then
						local var_226_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_31.prefab_name].transform, "story_v_out_319411", "319411055", "story_v_out_319411.awb")

						arg_223_1:RecordAudio("319411055", var_226_37)
						arg_223_1:RecordAudio("319411055", var_226_37)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_319411", "319411055", "story_v_out_319411.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_319411", "319411055", "story_v_out_319411.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_38 = math.max(var_226_29, arg_223_1.talkMaxDuration)

			if var_226_28 <= arg_223_1.time_ and arg_223_1.time_ < var_226_28 + var_226_38 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_28) / var_226_38

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_28 + var_226_38 and arg_223_1.time_ < var_226_28 + var_226_38 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play319411056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 319411056
		arg_227_1.duration_ = 8.266

		local var_227_0 = {
			zh = 6.633,
			ja = 8.266
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
				arg_227_0:Play319411057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.85

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[471].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(319411056)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 34
				local var_230_6 = utf8.len(var_230_4)
				local var_230_7 = var_230_5 <= 0 and var_230_1 or var_230_1 * (var_230_6 / var_230_5)

				if var_230_7 > 0 and var_230_1 < var_230_7 then
					arg_227_1.talkMaxDuration = var_230_7

					if var_230_7 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_7 + var_230_0
					end
				end

				arg_227_1.text_.text = var_230_4
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411056", "story_v_out_319411.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_319411", "319411056", "story_v_out_319411.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_319411", "319411056", "story_v_out_319411.awb")

						arg_227_1:RecordAudio("319411056", var_230_9)
						arg_227_1:RecordAudio("319411056", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_319411", "319411056", "story_v_out_319411.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_319411", "319411056", "story_v_out_319411.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_10 = math.max(var_230_1, arg_227_1.talkMaxDuration)

			if var_230_0 <= arg_227_1.time_ and arg_227_1.time_ < var_230_0 + var_230_10 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_0) / var_230_10

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_0 + var_230_10 and arg_227_1.time_ < var_230_0 + var_230_10 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play319411057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 319411057
		arg_231_1.duration_ = 11.166

		local var_231_0 = {
			zh = 11.166,
			ja = 10.933
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
				arg_231_0:Play319411058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 1.3

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[471].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_3 = arg_231_1:GetWordFromCfg(319411057)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 52
				local var_234_6 = utf8.len(var_234_4)
				local var_234_7 = var_234_5 <= 0 and var_234_1 or var_234_1 * (var_234_6 / var_234_5)

				if var_234_7 > 0 and var_234_1 < var_234_7 then
					arg_231_1.talkMaxDuration = var_234_7

					if var_234_7 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_7 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_4
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411057", "story_v_out_319411.awb") ~= 0 then
					local var_234_8 = manager.audio:GetVoiceLength("story_v_out_319411", "319411057", "story_v_out_319411.awb") / 1000

					if var_234_8 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_0
					end

					if var_234_3.prefab_name ~= "" and arg_231_1.actors_[var_234_3.prefab_name] ~= nil then
						local var_234_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_3.prefab_name].transform, "story_v_out_319411", "319411057", "story_v_out_319411.awb")

						arg_231_1:RecordAudio("319411057", var_234_9)
						arg_231_1:RecordAudio("319411057", var_234_9)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_319411", "319411057", "story_v_out_319411.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_319411", "319411057", "story_v_out_319411.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_10 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_10 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_10

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_10 and arg_231_1.time_ < var_234_0 + var_234_10 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play319411058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 319411058
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play319411059(arg_235_1)
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
			local var_238_7 = 0.975

			if var_238_6 < arg_235_1.time_ and arg_235_1.time_ <= var_238_6 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_8 = arg_235_1:GetWordFromCfg(319411058)
				local var_238_9 = arg_235_1:FormatText(var_238_8.content)

				arg_235_1.text_.text = var_238_9

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_10 = 39
				local var_238_11 = utf8.len(var_238_9)
				local var_238_12 = var_238_10 <= 0 and var_238_7 or var_238_7 * (var_238_11 / var_238_10)

				if var_238_12 > 0 and var_238_7 < var_238_12 then
					arg_235_1.talkMaxDuration = var_238_12

					if var_238_12 + var_238_6 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_12 + var_238_6
					end
				end

				arg_235_1.text_.text = var_238_9
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_13 = math.max(var_238_7, arg_235_1.talkMaxDuration)

			if var_238_6 <= arg_235_1.time_ and arg_235_1.time_ < var_238_6 + var_238_13 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_6) / var_238_13

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_6 + var_238_13 and arg_235_1.time_ < var_238_6 + var_238_13 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play319411059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 319411059
		arg_239_1.duration_ = 4.266

		local var_239_0 = {
			zh = 3.366,
			ja = 4.266
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
			arg_239_1.auto_ = false
		end

		function arg_239_1.playNext_(arg_241_0)
			arg_239_1.onStoryFinished_()
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
				local var_242_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1095ui_story, var_242_4, var_242_3)

				local var_242_5 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_5.x, var_242_5.y, var_242_5.z)

				local var_242_6 = var_242_0.localEulerAngles

				var_242_6.z = 0
				var_242_6.x = 0
				var_242_0.localEulerAngles = var_242_6
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

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
				arg_239_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action4_1")
			end

			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				arg_239_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_242_15 = 0
			local var_242_16 = 0.275

			if var_242_15 < arg_239_1.time_ and arg_239_1.time_ <= var_242_15 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_17 = arg_239_1:FormatText(StoryNameCfg[471].name)

				arg_239_1.leftNameTxt_.text = var_242_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_18 = arg_239_1:GetWordFromCfg(319411059)
				local var_242_19 = arg_239_1:FormatText(var_242_18.content)

				arg_239_1.text_.text = var_242_19

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_20 = 11
				local var_242_21 = utf8.len(var_242_19)
				local var_242_22 = var_242_20 <= 0 and var_242_16 or var_242_16 * (var_242_21 / var_242_20)

				if var_242_22 > 0 and var_242_16 < var_242_22 then
					arg_239_1.talkMaxDuration = var_242_22

					if var_242_22 + var_242_15 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_22 + var_242_15
					end
				end

				arg_239_1.text_.text = var_242_19
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319411", "319411059", "story_v_out_319411.awb") ~= 0 then
					local var_242_23 = manager.audio:GetVoiceLength("story_v_out_319411", "319411059", "story_v_out_319411.awb") / 1000

					if var_242_23 + var_242_15 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_23 + var_242_15
					end

					if var_242_18.prefab_name ~= "" and arg_239_1.actors_[var_242_18.prefab_name] ~= nil then
						local var_242_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_18.prefab_name].transform, "story_v_out_319411", "319411059", "story_v_out_319411.awb")

						arg_239_1:RecordAudio("319411059", var_242_24)
						arg_239_1:RecordAudio("319411059", var_242_24)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_319411", "319411059", "story_v_out_319411.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_319411", "319411059", "story_v_out_319411.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_25 = math.max(var_242_16, arg_239_1.talkMaxDuration)

			if var_242_15 <= arg_239_1.time_ and arg_239_1.time_ < var_242_15 + var_242_25 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_15) / var_242_25

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_15 + var_242_25 and arg_239_1.time_ < var_242_15 + var_242_25 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11n",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_319411.awb"
	}
}
