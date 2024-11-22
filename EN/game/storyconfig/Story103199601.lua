return {
	Play319961001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319961001
		arg_1_1.duration_ = 7.366

		local var_1_0 = {
			zh = 6.433,
			ja = 7.366
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
				arg_1_0:Play319961002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "STblack"

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
				local var_4_5 = arg_1_1.bgs_.STblack

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
					if iter_4_0 ~= "STblack" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 2

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

			local var_4_24 = "1095ui_story"

			if arg_1_1.actors_[var_4_24] == nil then
				local var_4_25 = Object.Instantiate(Asset.Load("Char/" .. var_4_24), arg_1_1.stage_.transform)

				var_4_25.name = var_4_24
				var_4_25.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_24] = var_4_25

				local var_4_26 = var_4_25:GetComponentInChildren(typeof(CharacterEffect))

				var_4_26.enabled = true

				local var_4_27 = GameObjectTools.GetOrAddComponent(var_4_25, typeof(DynamicBoneHelper))

				if var_4_27 then
					var_4_27:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_26.transform, false)

				arg_1_1.var_[var_4_24 .. "Animator"] = var_4_26.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_24 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_24 .. "LipSync"] = var_4_26.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_28 = arg_1_1.actors_["1095ui_story"].transform
			local var_4_29 = 1.8

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1.var_.moveOldPos1095ui_story = var_4_28.localPosition
			end

			local var_4_30 = 0.001

			if var_4_29 <= arg_1_1.time_ and arg_1_1.time_ < var_4_29 + var_4_30 then
				local var_4_31 = (arg_1_1.time_ - var_4_29) / var_4_30
				local var_4_32 = Vector3.New(0, -0.98, -6.1)

				var_4_28.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1095ui_story, var_4_32, var_4_31)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_28.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_28.localEulerAngles = var_4_34
			end

			if arg_1_1.time_ >= var_4_29 + var_4_30 and arg_1_1.time_ < var_4_29 + var_4_30 + arg_4_0 then
				var_4_28.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_4_35 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_35.x, var_4_35.y, var_4_35.z)

				local var_4_36 = var_4_28.localEulerAngles

				var_4_36.z = 0
				var_4_36.x = 0
				var_4_28.localEulerAngles = var_4_36
			end

			local var_4_37 = arg_1_1.actors_["1095ui_story"]
			local var_4_38 = 1.8

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story == nil then
				arg_1_1.var_.characterEffect1095ui_story = var_4_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_39 = 0.200000002980232

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39

				if arg_1_1.var_.characterEffect1095ui_story then
					arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story then
				arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_4_41 = 1.8

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_43 = 0
			local var_4_44 = 0.2

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_45 = "play"
				local var_4_46 = "music"

				arg_1_1:AudioAction(var_4_45, var_4_46, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_47 = 0.233333333333333
			local var_4_48 = 1

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "music"

				arg_1_1:AudioAction(var_4_49, var_4_50, "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_51 = 2
			local var_4_52 = 0.525

			if var_4_51 < arg_1_1.time_ and arg_1_1.time_ <= var_4_51 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_53 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_53:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_54 = arg_1_1:FormatText(StoryNameCfg[471].name)

				arg_1_1.leftNameTxt_.text = var_4_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_55 = arg_1_1:GetWordFromCfg(319961001)
				local var_4_56 = arg_1_1:FormatText(var_4_55.content)

				arg_1_1.text_.text = var_4_56

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_57 = 21
				local var_4_58 = utf8.len(var_4_56)
				local var_4_59 = var_4_57 <= 0 and var_4_52 or var_4_52 * (var_4_58 / var_4_57)

				if var_4_59 > 0 and var_4_52 < var_4_59 then
					arg_1_1.talkMaxDuration = var_4_59
					var_4_51 = var_4_51 + 0.3

					if var_4_59 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_59 + var_4_51
					end
				end

				arg_1_1.text_.text = var_4_56
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961001", "story_v_out_319961.awb") ~= 0 then
					local var_4_60 = manager.audio:GetVoiceLength("story_v_out_319961", "319961001", "story_v_out_319961.awb") / 1000

					if var_4_60 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_51
					end

					if var_4_55.prefab_name ~= "" and arg_1_1.actors_[var_4_55.prefab_name] ~= nil then
						local var_4_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_55.prefab_name].transform, "story_v_out_319961", "319961001", "story_v_out_319961.awb")

						arg_1_1:RecordAudio("319961001", var_4_61)
						arg_1_1:RecordAudio("319961001", var_4_61)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319961", "319961001", "story_v_out_319961.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319961", "319961001", "story_v_out_319961.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_62 = var_4_51 + 0.3
			local var_4_63 = math.max(var_4_52, arg_1_1.talkMaxDuration)

			if var_4_62 <= arg_1_1.time_ and arg_1_1.time_ < var_4_62 + var_4_63 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_62) / var_4_63

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_62 + var_4_63 and arg_1_1.time_ < var_4_62 + var_4_63 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319961002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319961002
		arg_7_1.duration_ = 3.1

		local var_7_0 = {
			zh = 3.1,
			ja = 1.566
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
				arg_7_0:Play319961003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10014ui_story"

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

			local var_10_4 = arg_7_1.actors_["10014ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos10014ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0.7, -1.06, -6.2)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10014ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["10014ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect10014ui_story == nil then
				arg_7_1.var_.characterEffect10014ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect10014ui_story then
					arg_7_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect10014ui_story then
				arg_7_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = arg_7_1.actors_["1095ui_story"].transform
			local var_10_20 = 0

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 then
				arg_7_1.var_.moveOldPos1095ui_story = var_10_19.localPosition
			end

			local var_10_21 = 0.001

			if var_10_20 <= arg_7_1.time_ and arg_7_1.time_ < var_10_20 + var_10_21 then
				local var_10_22 = (arg_7_1.time_ - var_10_20) / var_10_21
				local var_10_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_10_19.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1095ui_story, var_10_23, var_10_22)

				local var_10_24 = manager.ui.mainCamera.transform.position - var_10_19.position

				var_10_19.forward = Vector3.New(var_10_24.x, var_10_24.y, var_10_24.z)

				local var_10_25 = var_10_19.localEulerAngles

				var_10_25.z = 0
				var_10_25.x = 0
				var_10_19.localEulerAngles = var_10_25
			end

			if arg_7_1.time_ >= var_10_20 + var_10_21 and arg_7_1.time_ < var_10_20 + var_10_21 + arg_10_0 then
				var_10_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_10_26 = manager.ui.mainCamera.transform.position - var_10_19.position

				var_10_19.forward = Vector3.New(var_10_26.x, var_10_26.y, var_10_26.z)

				local var_10_27 = var_10_19.localEulerAngles

				var_10_27.z = 0
				var_10_27.x = 0
				var_10_19.localEulerAngles = var_10_27
			end

			local var_10_28 = arg_7_1.actors_["1095ui_story"]
			local var_10_29 = 0

			if var_10_29 < arg_7_1.time_ and arg_7_1.time_ <= var_10_29 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story == nil then
				arg_7_1.var_.characterEffect1095ui_story = var_10_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_30 = 0.200000002980232

			if var_10_29 <= arg_7_1.time_ and arg_7_1.time_ < var_10_29 + var_10_30 then
				local var_10_31 = (arg_7_1.time_ - var_10_29) / var_10_30

				if arg_7_1.var_.characterEffect1095ui_story then
					local var_10_32 = Mathf.Lerp(0, 0.5, var_10_31)

					arg_7_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1095ui_story.fillRatio = var_10_32
				end
			end

			if arg_7_1.time_ >= var_10_29 + var_10_30 and arg_7_1.time_ < var_10_29 + var_10_30 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story then
				local var_10_33 = 0.5

				arg_7_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1095ui_story.fillRatio = var_10_33
			end

			local var_10_34 = 0
			local var_10_35 = 0.325

			if var_10_34 < arg_7_1.time_ and arg_7_1.time_ <= var_10_34 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_36 = arg_7_1:FormatText(StoryNameCfg[264].name)

				arg_7_1.leftNameTxt_.text = var_10_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_37 = arg_7_1:GetWordFromCfg(319961002)
				local var_10_38 = arg_7_1:FormatText(var_10_37.content)

				arg_7_1.text_.text = var_10_38

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_39 = 13
				local var_10_40 = utf8.len(var_10_38)
				local var_10_41 = var_10_39 <= 0 and var_10_35 or var_10_35 * (var_10_40 / var_10_39)

				if var_10_41 > 0 and var_10_35 < var_10_41 then
					arg_7_1.talkMaxDuration = var_10_41

					if var_10_41 + var_10_34 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_41 + var_10_34
					end
				end

				arg_7_1.text_.text = var_10_38
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961002", "story_v_out_319961.awb") ~= 0 then
					local var_10_42 = manager.audio:GetVoiceLength("story_v_out_319961", "319961002", "story_v_out_319961.awb") / 1000

					if var_10_42 + var_10_34 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_42 + var_10_34
					end

					if var_10_37.prefab_name ~= "" and arg_7_1.actors_[var_10_37.prefab_name] ~= nil then
						local var_10_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_37.prefab_name].transform, "story_v_out_319961", "319961002", "story_v_out_319961.awb")

						arg_7_1:RecordAudio("319961002", var_10_43)
						arg_7_1:RecordAudio("319961002", var_10_43)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319961", "319961002", "story_v_out_319961.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319961", "319961002", "story_v_out_319961.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_44 = math.max(var_10_35, arg_7_1.talkMaxDuration)

			if var_10_34 <= arg_7_1.time_ and arg_7_1.time_ < var_10_34 + var_10_44 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_34) / var_10_44

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_34 + var_10_44 and arg_7_1.time_ < var_10_34 + var_10_44 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319961003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319961003
		arg_11_1.duration_ = 3.233

		local var_11_0 = {
			zh = 1.866,
			ja = 3.233
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
				arg_11_0:Play319961004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.225

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[264].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(319961003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961003", "story_v_out_319961.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961003", "story_v_out_319961.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_319961", "319961003", "story_v_out_319961.awb")

						arg_11_1:RecordAudio("319961003", var_14_9)
						arg_11_1:RecordAudio("319961003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319961", "319961003", "story_v_out_319961.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319961", "319961003", "story_v_out_319961.awb")
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
	Play319961004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319961004
		arg_15_1.duration_ = 9

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play319961005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "I07"

			if arg_15_1.bgs_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(arg_15_1.paintGo_)

				var_18_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_18_0)
				var_18_1.name = var_18_0
				var_18_1.transform.parent = arg_15_1.stage_.transform
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.bgs_[var_18_0] = var_18_1
			end

			local var_18_2 = 2

			if var_18_2 < arg_15_1.time_ and arg_15_1.time_ <= var_18_2 + arg_18_0 then
				local var_18_3 = manager.ui.mainCamera.transform.localPosition
				local var_18_4 = Vector3.New(0, 0, 10) + Vector3.New(var_18_3.x, var_18_3.y, 0)
				local var_18_5 = arg_15_1.bgs_.I07

				var_18_5.transform.localPosition = var_18_4
				var_18_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_18_6 = var_18_5:GetComponent("SpriteRenderer")

				if var_18_6 and var_18_6.sprite then
					local var_18_7 = (var_18_5.transform.localPosition - var_18_3).z
					local var_18_8 = manager.ui.mainCameraCom_
					local var_18_9 = 2 * var_18_7 * Mathf.Tan(var_18_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_18_10 = var_18_9 * var_18_8.aspect
					local var_18_11 = var_18_6.sprite.bounds.size.x
					local var_18_12 = var_18_6.sprite.bounds.size.y
					local var_18_13 = var_18_10 / var_18_11
					local var_18_14 = var_18_9 / var_18_12
					local var_18_15 = var_18_14 < var_18_13 and var_18_13 or var_18_14

					var_18_5.transform.localScale = Vector3.New(var_18_15, var_18_15, 0)
				end

				for iter_18_0, iter_18_1 in pairs(arg_15_1.bgs_) do
					if iter_18_0 ~= "I07" then
						iter_18_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_18_16 = 3.999999999999

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				arg_15_1.allBtn_.enabled = false
			end

			local var_18_17 = 0.3

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 then
				arg_15_1.allBtn_.enabled = true
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1.mask_.enabled = true
				arg_15_1.mask_.raycastTarget = true

				arg_15_1:SetGaussion(false)
			end

			local var_18_19 = 2

			if var_18_18 <= arg_15_1.time_ and arg_15_1.time_ < var_18_18 + var_18_19 then
				local var_18_20 = (arg_15_1.time_ - var_18_18) / var_18_19
				local var_18_21 = Color.New(0, 0, 0)

				var_18_21.a = Mathf.Lerp(0, 1, var_18_20)
				arg_15_1.mask_.color = var_18_21
			end

			if arg_15_1.time_ >= var_18_18 + var_18_19 and arg_15_1.time_ < var_18_18 + var_18_19 + arg_18_0 then
				local var_18_22 = Color.New(0, 0, 0)

				var_18_22.a = 1
				arg_15_1.mask_.color = var_18_22
			end

			local var_18_23 = 2

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 then
				arg_15_1.mask_.enabled = true
				arg_15_1.mask_.raycastTarget = true

				arg_15_1:SetGaussion(false)
			end

			local var_18_24 = 2

			if var_18_23 <= arg_15_1.time_ and arg_15_1.time_ < var_18_23 + var_18_24 then
				local var_18_25 = (arg_15_1.time_ - var_18_23) / var_18_24
				local var_18_26 = Color.New(0, 0, 0)

				var_18_26.a = Mathf.Lerp(1, 0, var_18_25)
				arg_15_1.mask_.color = var_18_26
			end

			if arg_15_1.time_ >= var_18_23 + var_18_24 and arg_15_1.time_ < var_18_23 + var_18_24 + arg_18_0 then
				local var_18_27 = Color.New(0, 0, 0)
				local var_18_28 = 0

				arg_15_1.mask_.enabled = false
				var_18_27.a = var_18_28
				arg_15_1.mask_.color = var_18_27
			end

			local var_18_29 = arg_15_1.actors_["10014ui_story"].transform
			local var_18_30 = 1.966

			if var_18_30 < arg_15_1.time_ and arg_15_1.time_ <= var_18_30 + arg_18_0 then
				arg_15_1.var_.moveOldPos10014ui_story = var_18_29.localPosition
			end

			local var_18_31 = 0.001

			if var_18_30 <= arg_15_1.time_ and arg_15_1.time_ < var_18_30 + var_18_31 then
				local var_18_32 = (arg_15_1.time_ - var_18_30) / var_18_31
				local var_18_33 = Vector3.New(0, 100, 0)

				var_18_29.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10014ui_story, var_18_33, var_18_32)

				local var_18_34 = manager.ui.mainCamera.transform.position - var_18_29.position

				var_18_29.forward = Vector3.New(var_18_34.x, var_18_34.y, var_18_34.z)

				local var_18_35 = var_18_29.localEulerAngles

				var_18_35.z = 0
				var_18_35.x = 0
				var_18_29.localEulerAngles = var_18_35
			end

			if arg_15_1.time_ >= var_18_30 + var_18_31 and arg_15_1.time_ < var_18_30 + var_18_31 + arg_18_0 then
				var_18_29.localPosition = Vector3.New(0, 100, 0)

				local var_18_36 = manager.ui.mainCamera.transform.position - var_18_29.position

				var_18_29.forward = Vector3.New(var_18_36.x, var_18_36.y, var_18_36.z)

				local var_18_37 = var_18_29.localEulerAngles

				var_18_37.z = 0
				var_18_37.x = 0
				var_18_29.localEulerAngles = var_18_37
			end

			local var_18_38 = arg_15_1.actors_["1095ui_story"].transform
			local var_18_39 = 1.966

			if var_18_39 < arg_15_1.time_ and arg_15_1.time_ <= var_18_39 + arg_18_0 then
				arg_15_1.var_.moveOldPos1095ui_story = var_18_38.localPosition
			end

			local var_18_40 = 0.001

			if var_18_39 <= arg_15_1.time_ and arg_15_1.time_ < var_18_39 + var_18_40 then
				local var_18_41 = (arg_15_1.time_ - var_18_39) / var_18_40
				local var_18_42 = Vector3.New(0, 100, 0)

				var_18_38.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1095ui_story, var_18_42, var_18_41)

				local var_18_43 = manager.ui.mainCamera.transform.position - var_18_38.position

				var_18_38.forward = Vector3.New(var_18_43.x, var_18_43.y, var_18_43.z)

				local var_18_44 = var_18_38.localEulerAngles

				var_18_44.z = 0
				var_18_44.x = 0
				var_18_38.localEulerAngles = var_18_44
			end

			if arg_15_1.time_ >= var_18_39 + var_18_40 and arg_15_1.time_ < var_18_39 + var_18_40 + arg_18_0 then
				var_18_38.localPosition = Vector3.New(0, 100, 0)

				local var_18_45 = manager.ui.mainCamera.transform.position - var_18_38.position

				var_18_38.forward = Vector3.New(var_18_45.x, var_18_45.y, var_18_45.z)

				local var_18_46 = var_18_38.localEulerAngles

				var_18_46.z = 0
				var_18_46.x = 0
				var_18_38.localEulerAngles = var_18_46
			end

			if arg_15_1.frameCnt_ <= 1 then
				arg_15_1.dialog_:SetActive(false)
			end

			local var_18_47 = 4
			local var_18_48 = 1.075

			if var_18_47 < arg_15_1.time_ and arg_15_1.time_ <= var_18_47 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0

				arg_15_1.dialog_:SetActive(true)

				local var_18_49 = LeanTween.value(arg_15_1.dialog_, 0, 1, 0.3)

				var_18_49:setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
					arg_15_1.dialogCg_.alpha = arg_19_0
				end))
				var_18_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_15_1.dialog_)
					var_18_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_15_1.duration_ = arg_15_1.duration_ + 0.3

				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_50 = arg_15_1:GetWordFromCfg(319961004)
				local var_18_51 = arg_15_1:FormatText(var_18_50.content)

				arg_15_1.text_.text = var_18_51

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_52 = 43
				local var_18_53 = utf8.len(var_18_51)
				local var_18_54 = var_18_52 <= 0 and var_18_48 or var_18_48 * (var_18_53 / var_18_52)

				if var_18_54 > 0 and var_18_48 < var_18_54 then
					arg_15_1.talkMaxDuration = var_18_54
					var_18_47 = var_18_47 + 0.3

					if var_18_54 + var_18_47 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_54 + var_18_47
					end
				end

				arg_15_1.text_.text = var_18_51
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_55 = var_18_47 + 0.3
			local var_18_56 = math.max(var_18_48, arg_15_1.talkMaxDuration)

			if var_18_55 <= arg_15_1.time_ and arg_15_1.time_ < var_18_55 + var_18_56 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_55) / var_18_56

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_55 + var_18_56 and arg_15_1.time_ < var_18_55 + var_18_56 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319961005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 319961005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play319961006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 1.55

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

				local var_24_2 = arg_21_1:GetWordFromCfg(319961005)
				local var_24_3 = arg_21_1:FormatText(var_24_2.content)

				arg_21_1.text_.text = var_24_3

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_4 = 62
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
	Play319961006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 319961006
		arg_25_1.duration_ = 8.4

		local var_25_0 = {
			zh = 6.1,
			ja = 8.4
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
				arg_25_0:Play319961007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["10014ui_story"].transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.moveOldPos10014ui_story = var_28_0.localPosition
			end

			local var_28_2 = 0.001

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2
				local var_28_4 = Vector3.New(0.7, -1.06, -6.2)

				var_28_0.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos10014ui_story, var_28_4, var_28_3)

				local var_28_5 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_5.x, var_28_5.y, var_28_5.z)

				local var_28_6 = var_28_0.localEulerAngles

				var_28_6.z = 0
				var_28_6.x = 0
				var_28_0.localEulerAngles = var_28_6
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 then
				var_28_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_28_7 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_7.x, var_28_7.y, var_28_7.z)

				local var_28_8 = var_28_0.localEulerAngles

				var_28_8.z = 0
				var_28_8.x = 0
				var_28_0.localEulerAngles = var_28_8
			end

			local var_28_9 = arg_25_1.actors_["10014ui_story"]
			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 and arg_25_1.var_.characterEffect10014ui_story == nil then
				arg_25_1.var_.characterEffect10014ui_story = var_28_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_11 = 0.200000002980232

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_11 then
				local var_28_12 = (arg_25_1.time_ - var_28_10) / var_28_11

				if arg_25_1.var_.characterEffect10014ui_story then
					arg_25_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_10 + var_28_11 and arg_25_1.time_ < var_28_10 + var_28_11 + arg_28_0 and arg_25_1.var_.characterEffect10014ui_story then
				arg_25_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_28_13 = 0

			if var_28_13 < arg_25_1.time_ and arg_25_1.time_ <= var_28_13 + arg_28_0 then
				arg_25_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_1")
			end

			local var_28_14 = 0

			if var_28_14 < arg_25_1.time_ and arg_25_1.time_ <= var_28_14 + arg_28_0 then
				arg_25_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_28_15 = arg_25_1.actors_["1095ui_story"].transform
			local var_28_16 = 0

			if var_28_16 < arg_25_1.time_ and arg_25_1.time_ <= var_28_16 + arg_28_0 then
				arg_25_1.var_.moveOldPos1095ui_story = var_28_15.localPosition
			end

			local var_28_17 = 0.001

			if var_28_16 <= arg_25_1.time_ and arg_25_1.time_ < var_28_16 + var_28_17 then
				local var_28_18 = (arg_25_1.time_ - var_28_16) / var_28_17
				local var_28_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_28_15.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1095ui_story, var_28_19, var_28_18)

				local var_28_20 = manager.ui.mainCamera.transform.position - var_28_15.position

				var_28_15.forward = Vector3.New(var_28_20.x, var_28_20.y, var_28_20.z)

				local var_28_21 = var_28_15.localEulerAngles

				var_28_21.z = 0
				var_28_21.x = 0
				var_28_15.localEulerAngles = var_28_21
			end

			if arg_25_1.time_ >= var_28_16 + var_28_17 and arg_25_1.time_ < var_28_16 + var_28_17 + arg_28_0 then
				var_28_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_28_22 = manager.ui.mainCamera.transform.position - var_28_15.position

				var_28_15.forward = Vector3.New(var_28_22.x, var_28_22.y, var_28_22.z)

				local var_28_23 = var_28_15.localEulerAngles

				var_28_23.z = 0
				var_28_23.x = 0
				var_28_15.localEulerAngles = var_28_23
			end

			local var_28_24 = 0
			local var_28_25 = 0.725

			if var_28_24 < arg_25_1.time_ and arg_25_1.time_ <= var_28_24 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_26 = arg_25_1:FormatText(StoryNameCfg[264].name)

				arg_25_1.leftNameTxt_.text = var_28_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_27 = arg_25_1:GetWordFromCfg(319961006)
				local var_28_28 = arg_25_1:FormatText(var_28_27.content)

				arg_25_1.text_.text = var_28_28

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_29 = 29
				local var_28_30 = utf8.len(var_28_28)
				local var_28_31 = var_28_29 <= 0 and var_28_25 or var_28_25 * (var_28_30 / var_28_29)

				if var_28_31 > 0 and var_28_25 < var_28_31 then
					arg_25_1.talkMaxDuration = var_28_31

					if var_28_31 + var_28_24 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_31 + var_28_24
					end
				end

				arg_25_1.text_.text = var_28_28
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961006", "story_v_out_319961.awb") ~= 0 then
					local var_28_32 = manager.audio:GetVoiceLength("story_v_out_319961", "319961006", "story_v_out_319961.awb") / 1000

					if var_28_32 + var_28_24 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_32 + var_28_24
					end

					if var_28_27.prefab_name ~= "" and arg_25_1.actors_[var_28_27.prefab_name] ~= nil then
						local var_28_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_27.prefab_name].transform, "story_v_out_319961", "319961006", "story_v_out_319961.awb")

						arg_25_1:RecordAudio("319961006", var_28_33)
						arg_25_1:RecordAudio("319961006", var_28_33)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_319961", "319961006", "story_v_out_319961.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_319961", "319961006", "story_v_out_319961.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_34 = math.max(var_28_25, arg_25_1.talkMaxDuration)

			if var_28_24 <= arg_25_1.time_ and arg_25_1.time_ < var_28_24 + var_28_34 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_24) / var_28_34

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_24 + var_28_34 and arg_25_1.time_ < var_28_24 + var_28_34 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play319961007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 319961007
		arg_29_1.duration_ = 4.566

		local var_29_0 = {
			zh = 2.366,
			ja = 4.566
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
				arg_29_0:Play319961008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["10014ui_story"]
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 and arg_29_1.var_.characterEffect10014ui_story == nil then
				arg_29_1.var_.characterEffect10014ui_story = var_32_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_2 = 0.200000002980232

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2

				if arg_29_1.var_.characterEffect10014ui_story then
					local var_32_4 = Mathf.Lerp(0, 0.5, var_32_3)

					arg_29_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_29_1.var_.characterEffect10014ui_story.fillRatio = var_32_4
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 and arg_29_1.var_.characterEffect10014ui_story then
				local var_32_5 = 0.5

				arg_29_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_29_1.var_.characterEffect10014ui_story.fillRatio = var_32_5
			end

			local var_32_6 = arg_29_1.actors_["1095ui_story"]
			local var_32_7 = 0

			if var_32_7 < arg_29_1.time_ and arg_29_1.time_ <= var_32_7 + arg_32_0 and arg_29_1.var_.characterEffect1095ui_story == nil then
				arg_29_1.var_.characterEffect1095ui_story = var_32_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_8 = 0.200000002980232

			if var_32_7 <= arg_29_1.time_ and arg_29_1.time_ < var_32_7 + var_32_8 then
				local var_32_9 = (arg_29_1.time_ - var_32_7) / var_32_8

				if arg_29_1.var_.characterEffect1095ui_story then
					arg_29_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_7 + var_32_8 and arg_29_1.time_ < var_32_7 + var_32_8 + arg_32_0 and arg_29_1.var_.characterEffect1095ui_story then
				arg_29_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_32_10 = 0
			local var_32_11 = 0.325

			if var_32_10 < arg_29_1.time_ and arg_29_1.time_ <= var_32_10 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_12 = arg_29_1:FormatText(StoryNameCfg[471].name)

				arg_29_1.leftNameTxt_.text = var_32_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_13 = arg_29_1:GetWordFromCfg(319961007)
				local var_32_14 = arg_29_1:FormatText(var_32_13.content)

				arg_29_1.text_.text = var_32_14

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_15 = 13
				local var_32_16 = utf8.len(var_32_14)
				local var_32_17 = var_32_15 <= 0 and var_32_11 or var_32_11 * (var_32_16 / var_32_15)

				if var_32_17 > 0 and var_32_11 < var_32_17 then
					arg_29_1.talkMaxDuration = var_32_17

					if var_32_17 + var_32_10 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_17 + var_32_10
					end
				end

				arg_29_1.text_.text = var_32_14
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961007", "story_v_out_319961.awb") ~= 0 then
					local var_32_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961007", "story_v_out_319961.awb") / 1000

					if var_32_18 + var_32_10 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_18 + var_32_10
					end

					if var_32_13.prefab_name ~= "" and arg_29_1.actors_[var_32_13.prefab_name] ~= nil then
						local var_32_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_13.prefab_name].transform, "story_v_out_319961", "319961007", "story_v_out_319961.awb")

						arg_29_1:RecordAudio("319961007", var_32_19)
						arg_29_1:RecordAudio("319961007", var_32_19)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_319961", "319961007", "story_v_out_319961.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_319961", "319961007", "story_v_out_319961.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_20 = math.max(var_32_11, arg_29_1.talkMaxDuration)

			if var_32_10 <= arg_29_1.time_ and arg_29_1.time_ < var_32_10 + var_32_20 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_10) / var_32_20

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_10 + var_32_20 and arg_29_1.time_ < var_32_10 + var_32_20 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play319961008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 319961008
		arg_33_1.duration_ = 7.366

		local var_33_0 = {
			zh = 2.266,
			ja = 7.366
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
				arg_33_0:Play319961009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1095ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect1095ui_story == nil then
				arg_33_1.var_.characterEffect1095ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.200000002980232

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect1095ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1095ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect1095ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1095ui_story.fillRatio = var_36_5
			end

			local var_36_6 = arg_33_1.actors_["10014ui_story"]
			local var_36_7 = 0

			if var_36_7 < arg_33_1.time_ and arg_33_1.time_ <= var_36_7 + arg_36_0 and arg_33_1.var_.characterEffect10014ui_story == nil then
				arg_33_1.var_.characterEffect10014ui_story = var_36_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_8 = 0.200000002980232

			if var_36_7 <= arg_33_1.time_ and arg_33_1.time_ < var_36_7 + var_36_8 then
				local var_36_9 = (arg_33_1.time_ - var_36_7) / var_36_8

				if arg_33_1.var_.characterEffect10014ui_story then
					arg_33_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_7 + var_36_8 and arg_33_1.time_ < var_36_7 + var_36_8 + arg_36_0 and arg_33_1.var_.characterEffect10014ui_story then
				arg_33_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_36_10 = 0
			local var_36_11 = 0.3

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_12 = arg_33_1:FormatText(StoryNameCfg[264].name)

				arg_33_1.leftNameTxt_.text = var_36_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_13 = arg_33_1:GetWordFromCfg(319961008)
				local var_36_14 = arg_33_1:FormatText(var_36_13.content)

				arg_33_1.text_.text = var_36_14

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_15 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961008", "story_v_out_319961.awb") ~= 0 then
					local var_36_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961008", "story_v_out_319961.awb") / 1000

					if var_36_18 + var_36_10 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_18 + var_36_10
					end

					if var_36_13.prefab_name ~= "" and arg_33_1.actors_[var_36_13.prefab_name] ~= nil then
						local var_36_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_13.prefab_name].transform, "story_v_out_319961", "319961008", "story_v_out_319961.awb")

						arg_33_1:RecordAudio("319961008", var_36_19)
						arg_33_1:RecordAudio("319961008", var_36_19)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_319961", "319961008", "story_v_out_319961.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_319961", "319961008", "story_v_out_319961.awb")
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
	Play319961009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 319961009
		arg_37_1.duration_ = 5.066

		local var_37_0 = {
			zh = 3.066,
			ja = 5.066
		}
		local var_37_1 = manager.audio:GetLocalizationFlag()

		if var_37_0[var_37_1] ~= nil then
			arg_37_1.duration_ = var_37_0[var_37_1]
		end

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play319961010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1095ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect1095ui_story == nil then
				arg_37_1.var_.characterEffect1095ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.200000002980232

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1095ui_story then
					arg_37_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect1095ui_story then
				arg_37_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_40_4 = 0

			if var_40_4 < arg_37_1.time_ and arg_37_1.time_ <= var_40_4 + arg_40_0 then
				arg_37_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_40_5 = 0

			if var_40_5 < arg_37_1.time_ and arg_37_1.time_ <= var_40_5 + arg_40_0 then
				arg_37_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_40_6 = arg_37_1.actors_["10014ui_story"]
			local var_40_7 = 0

			if var_40_7 < arg_37_1.time_ and arg_37_1.time_ <= var_40_7 + arg_40_0 and arg_37_1.var_.characterEffect10014ui_story == nil then
				arg_37_1.var_.characterEffect10014ui_story = var_40_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_8 = 0.200000002980232

			if var_40_7 <= arg_37_1.time_ and arg_37_1.time_ < var_40_7 + var_40_8 then
				local var_40_9 = (arg_37_1.time_ - var_40_7) / var_40_8

				if arg_37_1.var_.characterEffect10014ui_story then
					local var_40_10 = Mathf.Lerp(0, 0.5, var_40_9)

					arg_37_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_37_1.var_.characterEffect10014ui_story.fillRatio = var_40_10
				end
			end

			if arg_37_1.time_ >= var_40_7 + var_40_8 and arg_37_1.time_ < var_40_7 + var_40_8 + arg_40_0 and arg_37_1.var_.characterEffect10014ui_story then
				local var_40_11 = 0.5

				arg_37_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_37_1.var_.characterEffect10014ui_story.fillRatio = var_40_11
			end

			local var_40_12 = 0
			local var_40_13 = 0.4

			if var_40_12 < arg_37_1.time_ and arg_37_1.time_ <= var_40_12 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_14 = arg_37_1:FormatText(StoryNameCfg[471].name)

				arg_37_1.leftNameTxt_.text = var_40_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_15 = arg_37_1:GetWordFromCfg(319961009)
				local var_40_16 = arg_37_1:FormatText(var_40_15.content)

				arg_37_1.text_.text = var_40_16

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_17 = 16
				local var_40_18 = utf8.len(var_40_16)
				local var_40_19 = var_40_17 <= 0 and var_40_13 or var_40_13 * (var_40_18 / var_40_17)

				if var_40_19 > 0 and var_40_13 < var_40_19 then
					arg_37_1.talkMaxDuration = var_40_19

					if var_40_19 + var_40_12 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_19 + var_40_12
					end
				end

				arg_37_1.text_.text = var_40_16
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961009", "story_v_out_319961.awb") ~= 0 then
					local var_40_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961009", "story_v_out_319961.awb") / 1000

					if var_40_20 + var_40_12 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_20 + var_40_12
					end

					if var_40_15.prefab_name ~= "" and arg_37_1.actors_[var_40_15.prefab_name] ~= nil then
						local var_40_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_15.prefab_name].transform, "story_v_out_319961", "319961009", "story_v_out_319961.awb")

						arg_37_1:RecordAudio("319961009", var_40_21)
						arg_37_1:RecordAudio("319961009", var_40_21)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_319961", "319961009", "story_v_out_319961.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_319961", "319961009", "story_v_out_319961.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_22 = math.max(var_40_13, arg_37_1.talkMaxDuration)

			if var_40_12 <= arg_37_1.time_ and arg_37_1.time_ < var_40_12 + var_40_22 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_12) / var_40_22

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_12 + var_40_22 and arg_37_1.time_ < var_40_12 + var_40_22 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play319961010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 319961010
		arg_41_1.duration_ = 5.9

		local var_41_0 = {
			zh = 5.9,
			ja = 5.4
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
				arg_41_0:Play319961011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.7

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_2 = arg_41_1:FormatText(StoryNameCfg[471].name)

				arg_41_1.leftNameTxt_.text = var_44_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_3 = arg_41_1:GetWordFromCfg(319961010)
				local var_44_4 = arg_41_1:FormatText(var_44_3.content)

				arg_41_1.text_.text = var_44_4

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_5 = 28
				local var_44_6 = utf8.len(var_44_4)
				local var_44_7 = var_44_5 <= 0 and var_44_1 or var_44_1 * (var_44_6 / var_44_5)

				if var_44_7 > 0 and var_44_1 < var_44_7 then
					arg_41_1.talkMaxDuration = var_44_7

					if var_44_7 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_7 + var_44_0
					end
				end

				arg_41_1.text_.text = var_44_4
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961010", "story_v_out_319961.awb") ~= 0 then
					local var_44_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961010", "story_v_out_319961.awb") / 1000

					if var_44_8 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_8 + var_44_0
					end

					if var_44_3.prefab_name ~= "" and arg_41_1.actors_[var_44_3.prefab_name] ~= nil then
						local var_44_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_3.prefab_name].transform, "story_v_out_319961", "319961010", "story_v_out_319961.awb")

						arg_41_1:RecordAudio("319961010", var_44_9)
						arg_41_1:RecordAudio("319961010", var_44_9)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_319961", "319961010", "story_v_out_319961.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_319961", "319961010", "story_v_out_319961.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_10 = math.max(var_44_1, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_10 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_0) / var_44_10

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_10 and arg_41_1.time_ < var_44_0 + var_44_10 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play319961011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 319961011
		arg_45_1.duration_ = 7.166

		local var_45_0 = {
			zh = 4.033,
			ja = 7.166
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
				arg_45_0:Play319961012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10014ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect10014ui_story == nil then
				arg_45_1.var_.characterEffect10014ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.200000002980232

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect10014ui_story then
					arg_45_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect10014ui_story then
				arg_45_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_48_4 = 0

			if var_48_4 < arg_45_1.time_ and arg_45_1.time_ <= var_48_4 + arg_48_0 then
				arg_45_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_2")
			end

			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_48_6 = arg_45_1.actors_["1095ui_story"]
			local var_48_7 = 0

			if var_48_7 < arg_45_1.time_ and arg_45_1.time_ <= var_48_7 + arg_48_0 and arg_45_1.var_.characterEffect1095ui_story == nil then
				arg_45_1.var_.characterEffect1095ui_story = var_48_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_8 = 0.200000002980232

			if var_48_7 <= arg_45_1.time_ and arg_45_1.time_ < var_48_7 + var_48_8 then
				local var_48_9 = (arg_45_1.time_ - var_48_7) / var_48_8

				if arg_45_1.var_.characterEffect1095ui_story then
					local var_48_10 = Mathf.Lerp(0, 0.5, var_48_9)

					arg_45_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1095ui_story.fillRatio = var_48_10
				end
			end

			if arg_45_1.time_ >= var_48_7 + var_48_8 and arg_45_1.time_ < var_48_7 + var_48_8 + arg_48_0 and arg_45_1.var_.characterEffect1095ui_story then
				local var_48_11 = 0.5

				arg_45_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1095ui_story.fillRatio = var_48_11
			end

			local var_48_12 = 0
			local var_48_13 = 0.525

			if var_48_12 < arg_45_1.time_ and arg_45_1.time_ <= var_48_12 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_14 = arg_45_1:FormatText(StoryNameCfg[264].name)

				arg_45_1.leftNameTxt_.text = var_48_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_15 = arg_45_1:GetWordFromCfg(319961011)
				local var_48_16 = arg_45_1:FormatText(var_48_15.content)

				arg_45_1.text_.text = var_48_16

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_17 = 21
				local var_48_18 = utf8.len(var_48_16)
				local var_48_19 = var_48_17 <= 0 and var_48_13 or var_48_13 * (var_48_18 / var_48_17)

				if var_48_19 > 0 and var_48_13 < var_48_19 then
					arg_45_1.talkMaxDuration = var_48_19

					if var_48_19 + var_48_12 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_19 + var_48_12
					end
				end

				arg_45_1.text_.text = var_48_16
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961011", "story_v_out_319961.awb") ~= 0 then
					local var_48_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961011", "story_v_out_319961.awb") / 1000

					if var_48_20 + var_48_12 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_20 + var_48_12
					end

					if var_48_15.prefab_name ~= "" and arg_45_1.actors_[var_48_15.prefab_name] ~= nil then
						local var_48_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_15.prefab_name].transform, "story_v_out_319961", "319961011", "story_v_out_319961.awb")

						arg_45_1:RecordAudio("319961011", var_48_21)
						arg_45_1:RecordAudio("319961011", var_48_21)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_319961", "319961011", "story_v_out_319961.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_319961", "319961011", "story_v_out_319961.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_22 = math.max(var_48_13, arg_45_1.talkMaxDuration)

			if var_48_12 <= arg_45_1.time_ and arg_45_1.time_ < var_48_12 + var_48_22 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_12) / var_48_22

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_12 + var_48_22 and arg_45_1.time_ < var_48_12 + var_48_22 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play319961012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 319961012
		arg_49_1.duration_ = 9.5

		local var_49_0 = {
			zh = 9.5,
			ja = 9.333
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
				arg_49_0:Play319961013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1095ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect1095ui_story == nil then
				arg_49_1.var_.characterEffect1095ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.200000002980232

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect1095ui_story then
					arg_49_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect1095ui_story then
				arg_49_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_52_4 = arg_49_1.actors_["10014ui_story"]
			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 and arg_49_1.var_.characterEffect10014ui_story == nil then
				arg_49_1.var_.characterEffect10014ui_story = var_52_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_6 = 0.200000002980232

			if var_52_5 <= arg_49_1.time_ and arg_49_1.time_ < var_52_5 + var_52_6 then
				local var_52_7 = (arg_49_1.time_ - var_52_5) / var_52_6

				if arg_49_1.var_.characterEffect10014ui_story then
					local var_52_8 = Mathf.Lerp(0, 0.5, var_52_7)

					arg_49_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_49_1.var_.characterEffect10014ui_story.fillRatio = var_52_8
				end
			end

			if arg_49_1.time_ >= var_52_5 + var_52_6 and arg_49_1.time_ < var_52_5 + var_52_6 + arg_52_0 and arg_49_1.var_.characterEffect10014ui_story then
				local var_52_9 = 0.5

				arg_49_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_49_1.var_.characterEffect10014ui_story.fillRatio = var_52_9
			end

			local var_52_10 = 0
			local var_52_11 = 1.075

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

				local var_52_13 = arg_49_1:GetWordFromCfg(319961012)
				local var_52_14 = arg_49_1:FormatText(var_52_13.content)

				arg_49_1.text_.text = var_52_14

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_15 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961012", "story_v_out_319961.awb") ~= 0 then
					local var_52_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961012", "story_v_out_319961.awb") / 1000

					if var_52_18 + var_52_10 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_18 + var_52_10
					end

					if var_52_13.prefab_name ~= "" and arg_49_1.actors_[var_52_13.prefab_name] ~= nil then
						local var_52_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_13.prefab_name].transform, "story_v_out_319961", "319961012", "story_v_out_319961.awb")

						arg_49_1:RecordAudio("319961012", var_52_19)
						arg_49_1:RecordAudio("319961012", var_52_19)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_319961", "319961012", "story_v_out_319961.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_319961", "319961012", "story_v_out_319961.awb")
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
	Play319961013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319961013
		arg_53_1.duration_ = 5.333

		local var_53_0 = {
			zh = 4.066,
			ja = 5.333
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
				arg_53_0:Play319961014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_56_2 = 0
			local var_56_3 = 0.525

			if var_56_2 < arg_53_1.time_ and arg_53_1.time_ <= var_56_2 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_4 = arg_53_1:FormatText(StoryNameCfg[471].name)

				arg_53_1.leftNameTxt_.text = var_56_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_5 = arg_53_1:GetWordFromCfg(319961013)
				local var_56_6 = arg_53_1:FormatText(var_56_5.content)

				arg_53_1.text_.text = var_56_6

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_7 = 21
				local var_56_8 = utf8.len(var_56_6)
				local var_56_9 = var_56_7 <= 0 and var_56_3 or var_56_3 * (var_56_8 / var_56_7)

				if var_56_9 > 0 and var_56_3 < var_56_9 then
					arg_53_1.talkMaxDuration = var_56_9

					if var_56_9 + var_56_2 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_9 + var_56_2
					end
				end

				arg_53_1.text_.text = var_56_6
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961013", "story_v_out_319961.awb") ~= 0 then
					local var_56_10 = manager.audio:GetVoiceLength("story_v_out_319961", "319961013", "story_v_out_319961.awb") / 1000

					if var_56_10 + var_56_2 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_10 + var_56_2
					end

					if var_56_5.prefab_name ~= "" and arg_53_1.actors_[var_56_5.prefab_name] ~= nil then
						local var_56_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_5.prefab_name].transform, "story_v_out_319961", "319961013", "story_v_out_319961.awb")

						arg_53_1:RecordAudio("319961013", var_56_11)
						arg_53_1:RecordAudio("319961013", var_56_11)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_319961", "319961013", "story_v_out_319961.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_319961", "319961013", "story_v_out_319961.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_12 = math.max(var_56_3, arg_53_1.talkMaxDuration)

			if var_56_2 <= arg_53_1.time_ and arg_53_1.time_ < var_56_2 + var_56_12 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_2) / var_56_12

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_2 + var_56_12 and arg_53_1.time_ < var_56_2 + var_56_12 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play319961014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319961014
		arg_57_1.duration_ = 6.133

		local var_57_0 = {
			zh = 4.5,
			ja = 6.133
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
				arg_57_0:Play319961015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1095ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect1095ui_story == nil then
				arg_57_1.var_.characterEffect1095ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.200000002980232

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect1095ui_story then
					local var_60_4 = Mathf.Lerp(0, 0.5, var_60_3)

					arg_57_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1095ui_story.fillRatio = var_60_4
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect1095ui_story then
				local var_60_5 = 0.5

				arg_57_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1095ui_story.fillRatio = var_60_5
			end

			local var_60_6 = arg_57_1.actors_["10014ui_story"]
			local var_60_7 = 0

			if var_60_7 < arg_57_1.time_ and arg_57_1.time_ <= var_60_7 + arg_60_0 and arg_57_1.var_.characterEffect10014ui_story == nil then
				arg_57_1.var_.characterEffect10014ui_story = var_60_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_8 = 0.200000002980232

			if var_60_7 <= arg_57_1.time_ and arg_57_1.time_ < var_60_7 + var_60_8 then
				local var_60_9 = (arg_57_1.time_ - var_60_7) / var_60_8

				if arg_57_1.var_.characterEffect10014ui_story then
					arg_57_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_7 + var_60_8 and arg_57_1.time_ < var_60_7 + var_60_8 + arg_60_0 and arg_57_1.var_.characterEffect10014ui_story then
				arg_57_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_60_10 = 0
			local var_60_11 = 0.575

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_12 = arg_57_1:FormatText(StoryNameCfg[264].name)

				arg_57_1.leftNameTxt_.text = var_60_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_13 = arg_57_1:GetWordFromCfg(319961014)
				local var_60_14 = arg_57_1:FormatText(var_60_13.content)

				arg_57_1.text_.text = var_60_14

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_15 = 23
				local var_60_16 = utf8.len(var_60_14)
				local var_60_17 = var_60_15 <= 0 and var_60_11 or var_60_11 * (var_60_16 / var_60_15)

				if var_60_17 > 0 and var_60_11 < var_60_17 then
					arg_57_1.talkMaxDuration = var_60_17

					if var_60_17 + var_60_10 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_17 + var_60_10
					end
				end

				arg_57_1.text_.text = var_60_14
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961014", "story_v_out_319961.awb") ~= 0 then
					local var_60_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961014", "story_v_out_319961.awb") / 1000

					if var_60_18 + var_60_10 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_18 + var_60_10
					end

					if var_60_13.prefab_name ~= "" and arg_57_1.actors_[var_60_13.prefab_name] ~= nil then
						local var_60_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_13.prefab_name].transform, "story_v_out_319961", "319961014", "story_v_out_319961.awb")

						arg_57_1:RecordAudio("319961014", var_60_19)
						arg_57_1:RecordAudio("319961014", var_60_19)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_319961", "319961014", "story_v_out_319961.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_319961", "319961014", "story_v_out_319961.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_20 = math.max(var_60_11, arg_57_1.talkMaxDuration)

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_20 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_10) / var_60_20

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_10 + var_60_20 and arg_57_1.time_ < var_60_10 + var_60_20 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play319961015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319961015
		arg_61_1.duration_ = 5.366

		local var_61_0 = {
			zh = 2.633,
			ja = 5.366
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
				arg_61_0:Play319961016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1095ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect1095ui_story == nil then
				arg_61_1.var_.characterEffect1095ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.200000002980232

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1095ui_story then
					arg_61_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect1095ui_story then
				arg_61_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["10014ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and arg_61_1.var_.characterEffect10014ui_story == nil then
				arg_61_1.var_.characterEffect10014ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.200000002980232

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect10014ui_story then
					local var_64_8 = Mathf.Lerp(0, 0.5, var_64_7)

					arg_61_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_61_1.var_.characterEffect10014ui_story.fillRatio = var_64_8
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and arg_61_1.var_.characterEffect10014ui_story then
				local var_64_9 = 0.5

				arg_61_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_61_1.var_.characterEffect10014ui_story.fillRatio = var_64_9
			end

			local var_64_10 = 0
			local var_64_11 = 0.325

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_12 = arg_61_1:FormatText(StoryNameCfg[471].name)

				arg_61_1.leftNameTxt_.text = var_64_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_13 = arg_61_1:GetWordFromCfg(319961015)
				local var_64_14 = arg_61_1:FormatText(var_64_13.content)

				arg_61_1.text_.text = var_64_14

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_15 = 13
				local var_64_16 = utf8.len(var_64_14)
				local var_64_17 = var_64_15 <= 0 and var_64_11 or var_64_11 * (var_64_16 / var_64_15)

				if var_64_17 > 0 and var_64_11 < var_64_17 then
					arg_61_1.talkMaxDuration = var_64_17

					if var_64_17 + var_64_10 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_17 + var_64_10
					end
				end

				arg_61_1.text_.text = var_64_14
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961015", "story_v_out_319961.awb") ~= 0 then
					local var_64_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961015", "story_v_out_319961.awb") / 1000

					if var_64_18 + var_64_10 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_18 + var_64_10
					end

					if var_64_13.prefab_name ~= "" and arg_61_1.actors_[var_64_13.prefab_name] ~= nil then
						local var_64_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_13.prefab_name].transform, "story_v_out_319961", "319961015", "story_v_out_319961.awb")

						arg_61_1:RecordAudio("319961015", var_64_19)
						arg_61_1:RecordAudio("319961015", var_64_19)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_319961", "319961015", "story_v_out_319961.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_319961", "319961015", "story_v_out_319961.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_20 = math.max(var_64_11, arg_61_1.talkMaxDuration)

			if var_64_10 <= arg_61_1.time_ and arg_61_1.time_ < var_64_10 + var_64_20 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_10) / var_64_20

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_10 + var_64_20 and arg_61_1.time_ < var_64_10 + var_64_20 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play319961016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319961016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play319961017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1095ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect1095ui_story == nil then
				arg_65_1.var_.characterEffect1095ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.200000002980232

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect1095ui_story then
					local var_68_4 = Mathf.Lerp(0, 0.5, var_68_3)

					arg_65_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1095ui_story.fillRatio = var_68_4
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect1095ui_story then
				local var_68_5 = 0.5

				arg_65_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1095ui_story.fillRatio = var_68_5
			end

			local var_68_6 = 0
			local var_68_7 = 0.65

			if var_68_6 < arg_65_1.time_ and arg_65_1.time_ <= var_68_6 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_8 = arg_65_1:GetWordFromCfg(319961016)
				local var_68_9 = arg_65_1:FormatText(var_68_8.content)

				arg_65_1.text_.text = var_68_9

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_10 = 26
				local var_68_11 = utf8.len(var_68_9)
				local var_68_12 = var_68_10 <= 0 and var_68_7 or var_68_7 * (var_68_11 / var_68_10)

				if var_68_12 > 0 and var_68_7 < var_68_12 then
					arg_65_1.talkMaxDuration = var_68_12

					if var_68_12 + var_68_6 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_12 + var_68_6
					end
				end

				arg_65_1.text_.text = var_68_9
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_13 = math.max(var_68_7, arg_65_1.talkMaxDuration)

			if var_68_6 <= arg_65_1.time_ and arg_65_1.time_ < var_68_6 + var_68_13 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_6) / var_68_13

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_6 + var_68_13 and arg_65_1.time_ < var_68_6 + var_68_13 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play319961017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319961017
		arg_69_1.duration_ = 4.9

		local var_69_0 = {
			zh = 2.833,
			ja = 4.9
		}
		local var_69_1 = manager.audio:GetLocalizationFlag()

		if var_69_0[var_69_1] ~= nil then
			arg_69_1.duration_ = var_69_0[var_69_1]
		end

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play319961018(arg_69_1)
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
					arg_69_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1095ui_story then
				arg_69_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_72_4 = 0
			local var_72_5 = 0.3

			if var_72_4 < arg_69_1.time_ and arg_69_1.time_ <= var_72_4 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_6 = arg_69_1:FormatText(StoryNameCfg[471].name)

				arg_69_1.leftNameTxt_.text = var_72_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_7 = arg_69_1:GetWordFromCfg(319961017)
				local var_72_8 = arg_69_1:FormatText(var_72_7.content)

				arg_69_1.text_.text = var_72_8

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_9 = 12
				local var_72_10 = utf8.len(var_72_8)
				local var_72_11 = var_72_9 <= 0 and var_72_5 or var_72_5 * (var_72_10 / var_72_9)

				if var_72_11 > 0 and var_72_5 < var_72_11 then
					arg_69_1.talkMaxDuration = var_72_11

					if var_72_11 + var_72_4 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_11 + var_72_4
					end
				end

				arg_69_1.text_.text = var_72_8
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961017", "story_v_out_319961.awb") ~= 0 then
					local var_72_12 = manager.audio:GetVoiceLength("story_v_out_319961", "319961017", "story_v_out_319961.awb") / 1000

					if var_72_12 + var_72_4 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_12 + var_72_4
					end

					if var_72_7.prefab_name ~= "" and arg_69_1.actors_[var_72_7.prefab_name] ~= nil then
						local var_72_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_7.prefab_name].transform, "story_v_out_319961", "319961017", "story_v_out_319961.awb")

						arg_69_1:RecordAudio("319961017", var_72_13)
						arg_69_1:RecordAudio("319961017", var_72_13)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_319961", "319961017", "story_v_out_319961.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_319961", "319961017", "story_v_out_319961.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_14 = math.max(var_72_5, arg_69_1.talkMaxDuration)

			if var_72_4 <= arg_69_1.time_ and arg_69_1.time_ < var_72_4 + var_72_14 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_4) / var_72_14

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_4 + var_72_14 and arg_69_1.time_ < var_72_4 + var_72_14 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319961018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319961018
		arg_73_1.duration_ = 3

		local var_73_0 = {
			zh = 1.999999999999,
			ja = 3
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
				arg_73_0:Play319961019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10014ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect10014ui_story == nil then
				arg_73_1.var_.characterEffect10014ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.200000002980232

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect10014ui_story then
					arg_73_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect10014ui_story then
				arg_73_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_76_4 = 0

			if var_76_4 < arg_73_1.time_ and arg_73_1.time_ <= var_76_4 + arg_76_0 then
				arg_73_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_76_5 = arg_73_1.actors_["1095ui_story"]
			local var_76_6 = 0

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 and arg_73_1.var_.characterEffect1095ui_story == nil then
				arg_73_1.var_.characterEffect1095ui_story = var_76_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_7 = 0.200000002980232

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_7 then
				local var_76_8 = (arg_73_1.time_ - var_76_6) / var_76_7

				if arg_73_1.var_.characterEffect1095ui_story then
					local var_76_9 = Mathf.Lerp(0, 0.5, var_76_8)

					arg_73_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1095ui_story.fillRatio = var_76_9
				end
			end

			if arg_73_1.time_ >= var_76_6 + var_76_7 and arg_73_1.time_ < var_76_6 + var_76_7 + arg_76_0 and arg_73_1.var_.characterEffect1095ui_story then
				local var_76_10 = 0.5

				arg_73_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1095ui_story.fillRatio = var_76_10
			end

			local var_76_11 = 0
			local var_76_12 = 0.275

			if var_76_11 < arg_73_1.time_ and arg_73_1.time_ <= var_76_11 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_13 = arg_73_1:FormatText(StoryNameCfg[264].name)

				arg_73_1.leftNameTxt_.text = var_76_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_14 = arg_73_1:GetWordFromCfg(319961018)
				local var_76_15 = arg_73_1:FormatText(var_76_14.content)

				arg_73_1.text_.text = var_76_15

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_16 = 11
				local var_76_17 = utf8.len(var_76_15)
				local var_76_18 = var_76_16 <= 0 and var_76_12 or var_76_12 * (var_76_17 / var_76_16)

				if var_76_18 > 0 and var_76_12 < var_76_18 then
					arg_73_1.talkMaxDuration = var_76_18

					if var_76_18 + var_76_11 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_18 + var_76_11
					end
				end

				arg_73_1.text_.text = var_76_15
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961018", "story_v_out_319961.awb") ~= 0 then
					local var_76_19 = manager.audio:GetVoiceLength("story_v_out_319961", "319961018", "story_v_out_319961.awb") / 1000

					if var_76_19 + var_76_11 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_19 + var_76_11
					end

					if var_76_14.prefab_name ~= "" and arg_73_1.actors_[var_76_14.prefab_name] ~= nil then
						local var_76_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_14.prefab_name].transform, "story_v_out_319961", "319961018", "story_v_out_319961.awb")

						arg_73_1:RecordAudio("319961018", var_76_20)
						arg_73_1:RecordAudio("319961018", var_76_20)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_319961", "319961018", "story_v_out_319961.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_319961", "319961018", "story_v_out_319961.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_21 = math.max(var_76_12, arg_73_1.talkMaxDuration)

			if var_76_11 <= arg_73_1.time_ and arg_73_1.time_ < var_76_11 + var_76_21 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_11) / var_76_21

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_11 + var_76_21 and arg_73_1.time_ < var_76_11 + var_76_21 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play319961019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319961019
		arg_77_1.duration_ = 6.066

		local var_77_0 = {
			zh = 1.999999999999,
			ja = 6.066
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
				arg_77_0:Play319961020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1095ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story == nil then
				arg_77_1.var_.characterEffect1095ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.200000002980232

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1095ui_story then
					arg_77_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story then
				arg_77_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_80_4 = 0

			if var_80_4 < arg_77_1.time_ and arg_77_1.time_ <= var_80_4 + arg_80_0 then
				arg_77_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 then
				arg_77_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_80_6 = arg_77_1.actors_["10014ui_story"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.characterEffect10014ui_story == nil then
				arg_77_1.var_.characterEffect10014ui_story = var_80_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_8 = 0.200000002980232

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.characterEffect10014ui_story then
					local var_80_10 = Mathf.Lerp(0, 0.5, var_80_9)

					arg_77_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_77_1.var_.characterEffect10014ui_story.fillRatio = var_80_10
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.characterEffect10014ui_story then
				local var_80_11 = 0.5

				arg_77_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_77_1.var_.characterEffect10014ui_story.fillRatio = var_80_11
			end

			local var_80_12 = 0
			local var_80_13 = 0.2

			if var_80_12 < arg_77_1.time_ and arg_77_1.time_ <= var_80_12 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_14 = arg_77_1:FormatText(StoryNameCfg[471].name)

				arg_77_1.leftNameTxt_.text = var_80_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_15 = arg_77_1:GetWordFromCfg(319961019)
				local var_80_16 = arg_77_1:FormatText(var_80_15.content)

				arg_77_1.text_.text = var_80_16

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_17 = 8
				local var_80_18 = utf8.len(var_80_16)
				local var_80_19 = var_80_17 <= 0 and var_80_13 or var_80_13 * (var_80_18 / var_80_17)

				if var_80_19 > 0 and var_80_13 < var_80_19 then
					arg_77_1.talkMaxDuration = var_80_19

					if var_80_19 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_19 + var_80_12
					end
				end

				arg_77_1.text_.text = var_80_16
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961019", "story_v_out_319961.awb") ~= 0 then
					local var_80_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961019", "story_v_out_319961.awb") / 1000

					if var_80_20 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_20 + var_80_12
					end

					if var_80_15.prefab_name ~= "" and arg_77_1.actors_[var_80_15.prefab_name] ~= nil then
						local var_80_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_15.prefab_name].transform, "story_v_out_319961", "319961019", "story_v_out_319961.awb")

						arg_77_1:RecordAudio("319961019", var_80_21)
						arg_77_1:RecordAudio("319961019", var_80_21)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_319961", "319961019", "story_v_out_319961.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_319961", "319961019", "story_v_out_319961.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_22 = math.max(var_80_13, arg_77_1.talkMaxDuration)

			if var_80_12 <= arg_77_1.time_ and arg_77_1.time_ < var_80_12 + var_80_22 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_12) / var_80_22

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_12 + var_80_22 and arg_77_1.time_ < var_80_12 + var_80_22 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319961020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319961020
		arg_81_1.duration_ = 7.433

		local var_81_0 = {
			zh = 3.666,
			ja = 7.433
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
				arg_81_0:Play319961021(arg_81_1)
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

			local var_84_6 = arg_81_1.actors_["10014ui_story"]
			local var_84_7 = 0

			if var_84_7 < arg_81_1.time_ and arg_81_1.time_ <= var_84_7 + arg_84_0 and arg_81_1.var_.characterEffect10014ui_story == nil then
				arg_81_1.var_.characterEffect10014ui_story = var_84_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_8 = 0.200000002980232

			if var_84_7 <= arg_81_1.time_ and arg_81_1.time_ < var_84_7 + var_84_8 then
				local var_84_9 = (arg_81_1.time_ - var_84_7) / var_84_8

				if arg_81_1.var_.characterEffect10014ui_story then
					arg_81_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_7 + var_84_8 and arg_81_1.time_ < var_84_7 + var_84_8 + arg_84_0 and arg_81_1.var_.characterEffect10014ui_story then
				arg_81_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_84_10 = 0

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_84_11 = 0
			local var_84_12 = 0.375

			if var_84_11 < arg_81_1.time_ and arg_81_1.time_ <= var_84_11 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_13 = arg_81_1:FormatText(StoryNameCfg[264].name)

				arg_81_1.leftNameTxt_.text = var_84_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_14 = arg_81_1:GetWordFromCfg(319961020)
				local var_84_15 = arg_81_1:FormatText(var_84_14.content)

				arg_81_1.text_.text = var_84_15

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_16 = 15
				local var_84_17 = utf8.len(var_84_15)
				local var_84_18 = var_84_16 <= 0 and var_84_12 or var_84_12 * (var_84_17 / var_84_16)

				if var_84_18 > 0 and var_84_12 < var_84_18 then
					arg_81_1.talkMaxDuration = var_84_18

					if var_84_18 + var_84_11 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_18 + var_84_11
					end
				end

				arg_81_1.text_.text = var_84_15
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961020", "story_v_out_319961.awb") ~= 0 then
					local var_84_19 = manager.audio:GetVoiceLength("story_v_out_319961", "319961020", "story_v_out_319961.awb") / 1000

					if var_84_19 + var_84_11 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_19 + var_84_11
					end

					if var_84_14.prefab_name ~= "" and arg_81_1.actors_[var_84_14.prefab_name] ~= nil then
						local var_84_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_14.prefab_name].transform, "story_v_out_319961", "319961020", "story_v_out_319961.awb")

						arg_81_1:RecordAudio("319961020", var_84_20)
						arg_81_1:RecordAudio("319961020", var_84_20)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_319961", "319961020", "story_v_out_319961.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_319961", "319961020", "story_v_out_319961.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_21 = math.max(var_84_12, arg_81_1.talkMaxDuration)

			if var_84_11 <= arg_81_1.time_ and arg_81_1.time_ < var_84_11 + var_84_21 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_11) / var_84_21

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_11 + var_84_21 and arg_81_1.time_ < var_84_11 + var_84_21 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play319961021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 319961021
		arg_85_1.duration_ = 5.133

		local var_85_0 = {
			zh = 1.7,
			ja = 5.133
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
				arg_85_0:Play319961022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1095ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1095ui_story == nil then
				arg_85_1.var_.characterEffect1095ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.200000002980232

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1095ui_story then
					arg_85_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1095ui_story then
				arg_85_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_88_4 = arg_85_1.actors_["10014ui_story"]
			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 and arg_85_1.var_.characterEffect10014ui_story == nil then
				arg_85_1.var_.characterEffect10014ui_story = var_88_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_6 = 0.200000002980232

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6

				if arg_85_1.var_.characterEffect10014ui_story then
					local var_88_8 = Mathf.Lerp(0, 0.5, var_88_7)

					arg_85_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_85_1.var_.characterEffect10014ui_story.fillRatio = var_88_8
				end
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 and arg_85_1.var_.characterEffect10014ui_story then
				local var_88_9 = 0.5

				arg_85_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_85_1.var_.characterEffect10014ui_story.fillRatio = var_88_9
			end

			local var_88_10 = 0
			local var_88_11 = 0.2

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_12 = arg_85_1:FormatText(StoryNameCfg[471].name)

				arg_85_1.leftNameTxt_.text = var_88_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_13 = arg_85_1:GetWordFromCfg(319961021)
				local var_88_14 = arg_85_1:FormatText(var_88_13.content)

				arg_85_1.text_.text = var_88_14

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_15 = 8
				local var_88_16 = utf8.len(var_88_14)
				local var_88_17 = var_88_15 <= 0 and var_88_11 or var_88_11 * (var_88_16 / var_88_15)

				if var_88_17 > 0 and var_88_11 < var_88_17 then
					arg_85_1.talkMaxDuration = var_88_17

					if var_88_17 + var_88_10 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_17 + var_88_10
					end
				end

				arg_85_1.text_.text = var_88_14
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961021", "story_v_out_319961.awb") ~= 0 then
					local var_88_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961021", "story_v_out_319961.awb") / 1000

					if var_88_18 + var_88_10 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_18 + var_88_10
					end

					if var_88_13.prefab_name ~= "" and arg_85_1.actors_[var_88_13.prefab_name] ~= nil then
						local var_88_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_13.prefab_name].transform, "story_v_out_319961", "319961021", "story_v_out_319961.awb")

						arg_85_1:RecordAudio("319961021", var_88_19)
						arg_85_1:RecordAudio("319961021", var_88_19)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_319961", "319961021", "story_v_out_319961.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_319961", "319961021", "story_v_out_319961.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_20 = math.max(var_88_11, arg_85_1.talkMaxDuration)

			if var_88_10 <= arg_85_1.time_ and arg_85_1.time_ < var_88_10 + var_88_20 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_10) / var_88_20

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_10 + var_88_20 and arg_85_1.time_ < var_88_10 + var_88_20 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play319961022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 319961022
		arg_89_1.duration_ = 10.3

		local var_89_0 = {
			zh = 5.9,
			ja = 10.3
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
				arg_89_0:Play319961023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10014ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect10014ui_story == nil then
				arg_89_1.var_.characterEffect10014ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect10014ui_story then
					arg_89_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect10014ui_story then
				arg_89_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_92_4 = arg_89_1.actors_["1095ui_story"]
			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 and arg_89_1.var_.characterEffect1095ui_story == nil then
				arg_89_1.var_.characterEffect1095ui_story = var_92_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_6 = 0.200000002980232

			if var_92_5 <= arg_89_1.time_ and arg_89_1.time_ < var_92_5 + var_92_6 then
				local var_92_7 = (arg_89_1.time_ - var_92_5) / var_92_6

				if arg_89_1.var_.characterEffect1095ui_story then
					local var_92_8 = Mathf.Lerp(0, 0.5, var_92_7)

					arg_89_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1095ui_story.fillRatio = var_92_8
				end
			end

			if arg_89_1.time_ >= var_92_5 + var_92_6 and arg_89_1.time_ < var_92_5 + var_92_6 + arg_92_0 and arg_89_1.var_.characterEffect1095ui_story then
				local var_92_9 = 0.5

				arg_89_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1095ui_story.fillRatio = var_92_9
			end

			local var_92_10 = 0
			local var_92_11 = 0.625

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_12 = arg_89_1:FormatText(StoryNameCfg[264].name)

				arg_89_1.leftNameTxt_.text = var_92_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_13 = arg_89_1:GetWordFromCfg(319961022)
				local var_92_14 = arg_89_1:FormatText(var_92_13.content)

				arg_89_1.text_.text = var_92_14

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_15 = 25
				local var_92_16 = utf8.len(var_92_14)
				local var_92_17 = var_92_15 <= 0 and var_92_11 or var_92_11 * (var_92_16 / var_92_15)

				if var_92_17 > 0 and var_92_11 < var_92_17 then
					arg_89_1.talkMaxDuration = var_92_17

					if var_92_17 + var_92_10 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_17 + var_92_10
					end
				end

				arg_89_1.text_.text = var_92_14
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961022", "story_v_out_319961.awb") ~= 0 then
					local var_92_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961022", "story_v_out_319961.awb") / 1000

					if var_92_18 + var_92_10 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_18 + var_92_10
					end

					if var_92_13.prefab_name ~= "" and arg_89_1.actors_[var_92_13.prefab_name] ~= nil then
						local var_92_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_13.prefab_name].transform, "story_v_out_319961", "319961022", "story_v_out_319961.awb")

						arg_89_1:RecordAudio("319961022", var_92_19)
						arg_89_1:RecordAudio("319961022", var_92_19)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_319961", "319961022", "story_v_out_319961.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_319961", "319961022", "story_v_out_319961.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_20 = math.max(var_92_11, arg_89_1.talkMaxDuration)

			if var_92_10 <= arg_89_1.time_ and arg_89_1.time_ < var_92_10 + var_92_20 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_10) / var_92_20

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_10 + var_92_20 and arg_89_1.time_ < var_92_10 + var_92_20 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play319961023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 319961023
		arg_93_1.duration_ = 2.166

		local var_93_0 = {
			zh = 1.999999999999,
			ja = 2.166
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
				arg_93_0:Play319961024(arg_93_1)
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
					arg_93_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1095ui_story then
				arg_93_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_96_4 = 0

			if var_96_4 < arg_93_1.time_ and arg_93_1.time_ <= var_96_4 + arg_96_0 then
				arg_93_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 then
				arg_93_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_96_6 = arg_93_1.actors_["10014ui_story"]
			local var_96_7 = 0

			if var_96_7 < arg_93_1.time_ and arg_93_1.time_ <= var_96_7 + arg_96_0 and arg_93_1.var_.characterEffect10014ui_story == nil then
				arg_93_1.var_.characterEffect10014ui_story = var_96_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_8 = 0.200000002980232

			if var_96_7 <= arg_93_1.time_ and arg_93_1.time_ < var_96_7 + var_96_8 then
				local var_96_9 = (arg_93_1.time_ - var_96_7) / var_96_8

				if arg_93_1.var_.characterEffect10014ui_story then
					local var_96_10 = Mathf.Lerp(0, 0.5, var_96_9)

					arg_93_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_93_1.var_.characterEffect10014ui_story.fillRatio = var_96_10
				end
			end

			if arg_93_1.time_ >= var_96_7 + var_96_8 and arg_93_1.time_ < var_96_7 + var_96_8 + arg_96_0 and arg_93_1.var_.characterEffect10014ui_story then
				local var_96_11 = 0.5

				arg_93_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_93_1.var_.characterEffect10014ui_story.fillRatio = var_96_11
			end

			local var_96_12 = 0
			local var_96_13 = 0.125

			if var_96_12 < arg_93_1.time_ and arg_93_1.time_ <= var_96_12 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_14 = arg_93_1:FormatText(StoryNameCfg[471].name)

				arg_93_1.leftNameTxt_.text = var_96_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_15 = arg_93_1:GetWordFromCfg(319961023)
				local var_96_16 = arg_93_1:FormatText(var_96_15.content)

				arg_93_1.text_.text = var_96_16

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_17 = 5
				local var_96_18 = utf8.len(var_96_16)
				local var_96_19 = var_96_17 <= 0 and var_96_13 or var_96_13 * (var_96_18 / var_96_17)

				if var_96_19 > 0 and var_96_13 < var_96_19 then
					arg_93_1.talkMaxDuration = var_96_19

					if var_96_19 + var_96_12 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_19 + var_96_12
					end
				end

				arg_93_1.text_.text = var_96_16
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961023", "story_v_out_319961.awb") ~= 0 then
					local var_96_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961023", "story_v_out_319961.awb") / 1000

					if var_96_20 + var_96_12 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_20 + var_96_12
					end

					if var_96_15.prefab_name ~= "" and arg_93_1.actors_[var_96_15.prefab_name] ~= nil then
						local var_96_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_15.prefab_name].transform, "story_v_out_319961", "319961023", "story_v_out_319961.awb")

						arg_93_1:RecordAudio("319961023", var_96_21)
						arg_93_1:RecordAudio("319961023", var_96_21)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_319961", "319961023", "story_v_out_319961.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_319961", "319961023", "story_v_out_319961.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_22 = math.max(var_96_13, arg_93_1.talkMaxDuration)

			if var_96_12 <= arg_93_1.time_ and arg_93_1.time_ < var_96_12 + var_96_22 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_12) / var_96_22

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_12 + var_96_22 and arg_93_1.time_ < var_96_12 + var_96_22 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play319961024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 319961024
		arg_97_1.duration_ = 7.233

		local var_97_0 = {
			zh = 5.3,
			ja = 7.233
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
				arg_97_0:Play319961025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10014ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect10014ui_story == nil then
				arg_97_1.var_.characterEffect10014ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect10014ui_story then
					arg_97_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect10014ui_story then
				arg_97_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_100_4 = 0

			if var_100_4 < arg_97_1.time_ and arg_97_1.time_ <= var_100_4 + arg_100_0 then
				arg_97_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_2")
			end

			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_100_6 = arg_97_1.actors_["1095ui_story"]
			local var_100_7 = 0

			if var_100_7 < arg_97_1.time_ and arg_97_1.time_ <= var_100_7 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story == nil then
				arg_97_1.var_.characterEffect1095ui_story = var_100_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_8 = 0.200000002980232

			if var_100_7 <= arg_97_1.time_ and arg_97_1.time_ < var_100_7 + var_100_8 then
				local var_100_9 = (arg_97_1.time_ - var_100_7) / var_100_8

				if arg_97_1.var_.characterEffect1095ui_story then
					local var_100_10 = Mathf.Lerp(0, 0.5, var_100_9)

					arg_97_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1095ui_story.fillRatio = var_100_10
				end
			end

			if arg_97_1.time_ >= var_100_7 + var_100_8 and arg_97_1.time_ < var_100_7 + var_100_8 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story then
				local var_100_11 = 0.5

				arg_97_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1095ui_story.fillRatio = var_100_11
			end

			local var_100_12 = 0
			local var_100_13 = 0.525

			if var_100_12 < arg_97_1.time_ and arg_97_1.time_ <= var_100_12 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_14 = arg_97_1:FormatText(StoryNameCfg[264].name)

				arg_97_1.leftNameTxt_.text = var_100_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_15 = arg_97_1:GetWordFromCfg(319961024)
				local var_100_16 = arg_97_1:FormatText(var_100_15.content)

				arg_97_1.text_.text = var_100_16

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_17 = 21
				local var_100_18 = utf8.len(var_100_16)
				local var_100_19 = var_100_17 <= 0 and var_100_13 or var_100_13 * (var_100_18 / var_100_17)

				if var_100_19 > 0 and var_100_13 < var_100_19 then
					arg_97_1.talkMaxDuration = var_100_19

					if var_100_19 + var_100_12 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_19 + var_100_12
					end
				end

				arg_97_1.text_.text = var_100_16
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961024", "story_v_out_319961.awb") ~= 0 then
					local var_100_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961024", "story_v_out_319961.awb") / 1000

					if var_100_20 + var_100_12 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_20 + var_100_12
					end

					if var_100_15.prefab_name ~= "" and arg_97_1.actors_[var_100_15.prefab_name] ~= nil then
						local var_100_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_15.prefab_name].transform, "story_v_out_319961", "319961024", "story_v_out_319961.awb")

						arg_97_1:RecordAudio("319961024", var_100_21)
						arg_97_1:RecordAudio("319961024", var_100_21)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_319961", "319961024", "story_v_out_319961.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_319961", "319961024", "story_v_out_319961.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_22 = math.max(var_100_13, arg_97_1.talkMaxDuration)

			if var_100_12 <= arg_97_1.time_ and arg_97_1.time_ < var_100_12 + var_100_22 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_12) / var_100_22

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_12 + var_100_22 and arg_97_1.time_ < var_100_12 + var_100_22 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play319961025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 319961025
		arg_101_1.duration_ = 4.466

		local var_101_0 = {
			zh = 2.766,
			ja = 4.466
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
				arg_101_0:Play319961026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.3

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[264].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(319961025)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961025", "story_v_out_319961.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961025", "story_v_out_319961.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_319961", "319961025", "story_v_out_319961.awb")

						arg_101_1:RecordAudio("319961025", var_104_9)
						arg_101_1:RecordAudio("319961025", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_319961", "319961025", "story_v_out_319961.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_319961", "319961025", "story_v_out_319961.awb")
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
	Play319961026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319961026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play319961027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 1

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				local var_108_2 = "play"
				local var_108_3 = "effect"

				arg_105_1:AudioAction(var_108_2, var_108_3, "se_story_16", "se_story_16_energy02", "")
			end

			local var_108_4 = arg_105_1.actors_["10014ui_story"]
			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 and arg_105_1.var_.characterEffect10014ui_story == nil then
				arg_105_1.var_.characterEffect10014ui_story = var_108_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_6 = 0.200000002980232

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_6 then
				local var_108_7 = (arg_105_1.time_ - var_108_5) / var_108_6

				if arg_105_1.var_.characterEffect10014ui_story then
					local var_108_8 = Mathf.Lerp(0, 0.5, var_108_7)

					arg_105_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_105_1.var_.characterEffect10014ui_story.fillRatio = var_108_8
				end
			end

			if arg_105_1.time_ >= var_108_5 + var_108_6 and arg_105_1.time_ < var_108_5 + var_108_6 + arg_108_0 and arg_105_1.var_.characterEffect10014ui_story then
				local var_108_9 = 0.5

				arg_105_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_105_1.var_.characterEffect10014ui_story.fillRatio = var_108_9
			end

			local var_108_10 = arg_105_1.actors_["10014ui_story"].transform
			local var_108_11 = 0

			if var_108_11 < arg_105_1.time_ and arg_105_1.time_ <= var_108_11 + arg_108_0 then
				arg_105_1.var_.moveOldPos10014ui_story = var_108_10.localPosition
			end

			local var_108_12 = 0.001

			if var_108_11 <= arg_105_1.time_ and arg_105_1.time_ < var_108_11 + var_108_12 then
				local var_108_13 = (arg_105_1.time_ - var_108_11) / var_108_12
				local var_108_14 = Vector3.New(0, 100, 0)

				var_108_10.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10014ui_story, var_108_14, var_108_13)

				local var_108_15 = manager.ui.mainCamera.transform.position - var_108_10.position

				var_108_10.forward = Vector3.New(var_108_15.x, var_108_15.y, var_108_15.z)

				local var_108_16 = var_108_10.localEulerAngles

				var_108_16.z = 0
				var_108_16.x = 0
				var_108_10.localEulerAngles = var_108_16
			end

			if arg_105_1.time_ >= var_108_11 + var_108_12 and arg_105_1.time_ < var_108_11 + var_108_12 + arg_108_0 then
				var_108_10.localPosition = Vector3.New(0, 100, 0)

				local var_108_17 = manager.ui.mainCamera.transform.position - var_108_10.position

				var_108_10.forward = Vector3.New(var_108_17.x, var_108_17.y, var_108_17.z)

				local var_108_18 = var_108_10.localEulerAngles

				var_108_18.z = 0
				var_108_18.x = 0
				var_108_10.localEulerAngles = var_108_18
			end

			local var_108_19 = arg_105_1.actors_["1095ui_story"].transform
			local var_108_20 = 0

			if var_108_20 < arg_105_1.time_ and arg_105_1.time_ <= var_108_20 + arg_108_0 then
				arg_105_1.var_.moveOldPos1095ui_story = var_108_19.localPosition
			end

			local var_108_21 = 0.001

			if var_108_20 <= arg_105_1.time_ and arg_105_1.time_ < var_108_20 + var_108_21 then
				local var_108_22 = (arg_105_1.time_ - var_108_20) / var_108_21
				local var_108_23 = Vector3.New(0, 100, 0)

				var_108_19.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1095ui_story, var_108_23, var_108_22)

				local var_108_24 = manager.ui.mainCamera.transform.position - var_108_19.position

				var_108_19.forward = Vector3.New(var_108_24.x, var_108_24.y, var_108_24.z)

				local var_108_25 = var_108_19.localEulerAngles

				var_108_25.z = 0
				var_108_25.x = 0
				var_108_19.localEulerAngles = var_108_25
			end

			if arg_105_1.time_ >= var_108_20 + var_108_21 and arg_105_1.time_ < var_108_20 + var_108_21 + arg_108_0 then
				var_108_19.localPosition = Vector3.New(0, 100, 0)

				local var_108_26 = manager.ui.mainCamera.transform.position - var_108_19.position

				var_108_19.forward = Vector3.New(var_108_26.x, var_108_26.y, var_108_26.z)

				local var_108_27 = var_108_19.localEulerAngles

				var_108_27.z = 0
				var_108_27.x = 0
				var_108_19.localEulerAngles = var_108_27
			end

			local var_108_28 = 0
			local var_108_29 = 0.9

			if var_108_28 < arg_105_1.time_ and arg_105_1.time_ <= var_108_28 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_30 = arg_105_1:GetWordFromCfg(319961026)
				local var_108_31 = arg_105_1:FormatText(var_108_30.content)

				arg_105_1.text_.text = var_108_31

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_32 = 36
				local var_108_33 = utf8.len(var_108_31)
				local var_108_34 = var_108_32 <= 0 and var_108_29 or var_108_29 * (var_108_33 / var_108_32)

				if var_108_34 > 0 and var_108_29 < var_108_34 then
					arg_105_1.talkMaxDuration = var_108_34

					if var_108_34 + var_108_28 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_34 + var_108_28
					end
				end

				arg_105_1.text_.text = var_108_31
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_35 = math.max(var_108_29, arg_105_1.talkMaxDuration)

			if var_108_28 <= arg_105_1.time_ and arg_105_1.time_ < var_108_28 + var_108_35 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_28) / var_108_35

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_28 + var_108_35 and arg_105_1.time_ < var_108_28 + var_108_35 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play319961027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319961027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play319961028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1.575

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_2 = arg_109_1:GetWordFromCfg(319961027)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 63
				local var_112_5 = utf8.len(var_112_3)
				local var_112_6 = var_112_4 <= 0 and var_112_1 or var_112_1 * (var_112_5 / var_112_4)

				if var_112_6 > 0 and var_112_1 < var_112_6 then
					arg_109_1.talkMaxDuration = var_112_6

					if var_112_6 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_6 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_3
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_7 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_7 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_7

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_7 and arg_109_1.time_ < var_112_0 + var_112_7 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play319961028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319961028
		arg_113_1.duration_ = 2.333

		local var_113_0 = {
			zh = 2,
			ja = 2.333
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
				arg_113_0:Play319961029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = "1284ui_story"

			if arg_113_1.actors_[var_116_0] == nil then
				local var_116_1 = Object.Instantiate(Asset.Load("Char/" .. var_116_0), arg_113_1.stage_.transform)

				var_116_1.name = var_116_0
				var_116_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.actors_[var_116_0] = var_116_1

				local var_116_2 = var_116_1:GetComponentInChildren(typeof(CharacterEffect))

				var_116_2.enabled = true

				local var_116_3 = GameObjectTools.GetOrAddComponent(var_116_1, typeof(DynamicBoneHelper))

				if var_116_3 then
					var_116_3:EnableDynamicBone(false)
				end

				arg_113_1:ShowWeapon(var_116_2.transform, false)

				arg_113_1.var_[var_116_0 .. "Animator"] = var_116_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_113_1.var_[var_116_0 .. "Animator"].applyRootMotion = true
				arg_113_1.var_[var_116_0 .. "LipSync"] = var_116_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_116_4 = arg_113_1.actors_["1284ui_story"].transform
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 then
				arg_113_1.var_.moveOldPos1284ui_story = var_116_4.localPosition

				local var_116_6 = "1284ui_story"

				arg_113_1:ShowWeapon(arg_113_1.var_[var_116_6 .. "Animator"].transform, false)
			end

			local var_116_7 = 0.001

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_7 then
				local var_116_8 = (arg_113_1.time_ - var_116_5) / var_116_7
				local var_116_9 = Vector3.New(0, -0.985, -6.22)

				var_116_4.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1284ui_story, var_116_9, var_116_8)

				local var_116_10 = manager.ui.mainCamera.transform.position - var_116_4.position

				var_116_4.forward = Vector3.New(var_116_10.x, var_116_10.y, var_116_10.z)

				local var_116_11 = var_116_4.localEulerAngles

				var_116_11.z = 0
				var_116_11.x = 0
				var_116_4.localEulerAngles = var_116_11
			end

			if arg_113_1.time_ >= var_116_5 + var_116_7 and arg_113_1.time_ < var_116_5 + var_116_7 + arg_116_0 then
				var_116_4.localPosition = Vector3.New(0, -0.985, -6.22)

				local var_116_12 = manager.ui.mainCamera.transform.position - var_116_4.position

				var_116_4.forward = Vector3.New(var_116_12.x, var_116_12.y, var_116_12.z)

				local var_116_13 = var_116_4.localEulerAngles

				var_116_13.z = 0
				var_116_13.x = 0
				var_116_4.localEulerAngles = var_116_13
			end

			local var_116_14 = arg_113_1.actors_["1284ui_story"]
			local var_116_15 = 0

			if var_116_15 < arg_113_1.time_ and arg_113_1.time_ <= var_116_15 + arg_116_0 and arg_113_1.var_.characterEffect1284ui_story == nil then
				arg_113_1.var_.characterEffect1284ui_story = var_116_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_16 = 0.200000002980232

			if var_116_15 <= arg_113_1.time_ and arg_113_1.time_ < var_116_15 + var_116_16 then
				local var_116_17 = (arg_113_1.time_ - var_116_15) / var_116_16

				if arg_113_1.var_.characterEffect1284ui_story then
					arg_113_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_15 + var_116_16 and arg_113_1.time_ < var_116_15 + var_116_16 + arg_116_0 and arg_113_1.var_.characterEffect1284ui_story then
				arg_113_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_116_18 = 0

			if var_116_18 < arg_113_1.time_ and arg_113_1.time_ <= var_116_18 + arg_116_0 then
				arg_113_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action10_2")
			end

			local var_116_19 = 0

			if var_116_19 < arg_113_1.time_ and arg_113_1.time_ <= var_116_19 + arg_116_0 then
				arg_113_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_116_20 = 0
			local var_116_21 = 0.075

			if var_116_20 < arg_113_1.time_ and arg_113_1.time_ <= var_116_20 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_22 = arg_113_1:FormatText(StoryNameCfg[6].name)

				arg_113_1.leftNameTxt_.text = var_116_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_23 = arg_113_1:GetWordFromCfg(319961028)
				local var_116_24 = arg_113_1:FormatText(var_116_23.content)

				arg_113_1.text_.text = var_116_24

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_25 = 3
				local var_116_26 = utf8.len(var_116_24)
				local var_116_27 = var_116_25 <= 0 and var_116_21 or var_116_21 * (var_116_26 / var_116_25)

				if var_116_27 > 0 and var_116_21 < var_116_27 then
					arg_113_1.talkMaxDuration = var_116_27

					if var_116_27 + var_116_20 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_27 + var_116_20
					end
				end

				arg_113_1.text_.text = var_116_24
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961028", "story_v_out_319961.awb") ~= 0 then
					local var_116_28 = manager.audio:GetVoiceLength("story_v_out_319961", "319961028", "story_v_out_319961.awb") / 1000

					if var_116_28 + var_116_20 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_28 + var_116_20
					end

					if var_116_23.prefab_name ~= "" and arg_113_1.actors_[var_116_23.prefab_name] ~= nil then
						local var_116_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_23.prefab_name].transform, "story_v_out_319961", "319961028", "story_v_out_319961.awb")

						arg_113_1:RecordAudio("319961028", var_116_29)
						arg_113_1:RecordAudio("319961028", var_116_29)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_319961", "319961028", "story_v_out_319961.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_319961", "319961028", "story_v_out_319961.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_30 = math.max(var_116_21, arg_113_1.talkMaxDuration)

			if var_116_20 <= arg_113_1.time_ and arg_113_1.time_ < var_116_20 + var_116_30 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_20) / var_116_30

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_20 + var_116_30 and arg_113_1.time_ < var_116_20 + var_116_30 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319961029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319961029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play319961030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1284ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1284ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0, 100, 0)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1284ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, 100, 0)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["1284ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and arg_117_1.var_.characterEffect1284ui_story == nil then
				arg_117_1.var_.characterEffect1284ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect1284ui_story then
					local var_120_13 = Mathf.Lerp(0, 0.5, var_120_12)

					arg_117_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1284ui_story.fillRatio = var_120_13
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and arg_117_1.var_.characterEffect1284ui_story then
				local var_120_14 = 0.5

				arg_117_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1284ui_story.fillRatio = var_120_14
			end

			local var_120_15 = 0
			local var_120_16 = 0.475

			if var_120_15 < arg_117_1.time_ and arg_117_1.time_ <= var_120_15 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_17 = arg_117_1:GetWordFromCfg(319961029)
				local var_120_18 = arg_117_1:FormatText(var_120_17.content)

				arg_117_1.text_.text = var_120_18

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_19 = 19
				local var_120_20 = utf8.len(var_120_18)
				local var_120_21 = var_120_19 <= 0 and var_120_16 or var_120_16 * (var_120_20 / var_120_19)

				if var_120_21 > 0 and var_120_16 < var_120_21 then
					arg_117_1.talkMaxDuration = var_120_21

					if var_120_21 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_21 + var_120_15
					end
				end

				arg_117_1.text_.text = var_120_18
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_22 = math.max(var_120_16, arg_117_1.talkMaxDuration)

			if var_120_15 <= arg_117_1.time_ and arg_117_1.time_ < var_120_15 + var_120_22 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_15) / var_120_22

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_15 + var_120_22 and arg_117_1.time_ < var_120_15 + var_120_22 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319961030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319961030
		arg_121_1.duration_ = 2.633

		local var_121_0 = {
			zh = 1.4,
			ja = 2.633
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
				arg_121_0:Play319961031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10014ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos10014ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0, -1.06, -6.2)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos10014ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["10014ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect10014ui_story == nil then
				arg_121_1.var_.characterEffect10014ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect10014ui_story then
					arg_121_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect10014ui_story then
				arg_121_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_124_13 = 0

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_15 = 0
			local var_124_16 = 0.2

			if var_124_15 < arg_121_1.time_ and arg_121_1.time_ <= var_124_15 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_17 = arg_121_1:FormatText(StoryNameCfg[264].name)

				arg_121_1.leftNameTxt_.text = var_124_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_18 = arg_121_1:GetWordFromCfg(319961030)
				local var_124_19 = arg_121_1:FormatText(var_124_18.content)

				arg_121_1.text_.text = var_124_19

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_20 = 8
				local var_124_21 = utf8.len(var_124_19)
				local var_124_22 = var_124_20 <= 0 and var_124_16 or var_124_16 * (var_124_21 / var_124_20)

				if var_124_22 > 0 and var_124_16 < var_124_22 then
					arg_121_1.talkMaxDuration = var_124_22

					if var_124_22 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_22 + var_124_15
					end
				end

				arg_121_1.text_.text = var_124_19
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961030", "story_v_out_319961.awb") ~= 0 then
					local var_124_23 = manager.audio:GetVoiceLength("story_v_out_319961", "319961030", "story_v_out_319961.awb") / 1000

					if var_124_23 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_23 + var_124_15
					end

					if var_124_18.prefab_name ~= "" and arg_121_1.actors_[var_124_18.prefab_name] ~= nil then
						local var_124_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_18.prefab_name].transform, "story_v_out_319961", "319961030", "story_v_out_319961.awb")

						arg_121_1:RecordAudio("319961030", var_124_24)
						arg_121_1:RecordAudio("319961030", var_124_24)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_319961", "319961030", "story_v_out_319961.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_319961", "319961030", "story_v_out_319961.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_25 = math.max(var_124_16, arg_121_1.talkMaxDuration)

			if var_124_15 <= arg_121_1.time_ and arg_121_1.time_ < var_124_15 + var_124_25 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_15) / var_124_25

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_15 + var_124_25 and arg_121_1.time_ < var_124_15 + var_124_25 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play319961031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319961031
		arg_125_1.duration_ = 2.8

		local var_125_0 = {
			zh = 2.8,
			ja = 2.5
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
				arg_125_0:Play319961032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10014ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos10014ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(0, -1.06, -6.2)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10014ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = arg_125_1.actors_["10014ui_story"]
			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 and arg_125_1.var_.characterEffect10014ui_story == nil then
				arg_125_1.var_.characterEffect10014ui_story = var_128_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_11 = 0.200000002980232

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_11 then
				local var_128_12 = (arg_125_1.time_ - var_128_10) / var_128_11

				if arg_125_1.var_.characterEffect10014ui_story then
					arg_125_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_10 + var_128_11 and arg_125_1.time_ < var_128_10 + var_128_11 + arg_128_0 and arg_125_1.var_.characterEffect10014ui_story then
				arg_125_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_128_13 = 0

			if var_128_13 < arg_125_1.time_ and arg_125_1.time_ <= var_128_13 + arg_128_0 then
				arg_125_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 then
				arg_125_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_128_15 = 0
			local var_128_16 = 0.35

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_17 = arg_125_1:FormatText(StoryNameCfg[264].name)

				arg_125_1.leftNameTxt_.text = var_128_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_18 = arg_125_1:GetWordFromCfg(319961031)
				local var_128_19 = arg_125_1:FormatText(var_128_18.content)

				arg_125_1.text_.text = var_128_19

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_20 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961031", "story_v_out_319961.awb") ~= 0 then
					local var_128_23 = manager.audio:GetVoiceLength("story_v_out_319961", "319961031", "story_v_out_319961.awb") / 1000

					if var_128_23 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_23 + var_128_15
					end

					if var_128_18.prefab_name ~= "" and arg_125_1.actors_[var_128_18.prefab_name] ~= nil then
						local var_128_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_18.prefab_name].transform, "story_v_out_319961", "319961031", "story_v_out_319961.awb")

						arg_125_1:RecordAudio("319961031", var_128_24)
						arg_125_1:RecordAudio("319961031", var_128_24)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319961", "319961031", "story_v_out_319961.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319961", "319961031", "story_v_out_319961.awb")
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
	Play319961032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319961032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play319961033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10014ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect10014ui_story == nil then
				arg_129_1.var_.characterEffect10014ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect10014ui_story then
					local var_132_4 = Mathf.Lerp(0, 0.5, var_132_3)

					arg_129_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_129_1.var_.characterEffect10014ui_story.fillRatio = var_132_4
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect10014ui_story then
				local var_132_5 = 0.5

				arg_129_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_129_1.var_.characterEffect10014ui_story.fillRatio = var_132_5
			end

			local var_132_6 = 0
			local var_132_7 = 1.275

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_8 = arg_129_1:GetWordFromCfg(319961032)
				local var_132_9 = arg_129_1:FormatText(var_132_8.content)

				arg_129_1.text_.text = var_132_9

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_10 = 51
				local var_132_11 = utf8.len(var_132_9)
				local var_132_12 = var_132_10 <= 0 and var_132_7 or var_132_7 * (var_132_11 / var_132_10)

				if var_132_12 > 0 and var_132_7 < var_132_12 then
					arg_129_1.talkMaxDuration = var_132_12

					if var_132_12 + var_132_6 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_12 + var_132_6
					end
				end

				arg_129_1.text_.text = var_132_9
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_13 = math.max(var_132_7, arg_129_1.talkMaxDuration)

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_13 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_6) / var_132_13

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_6 + var_132_13 and arg_129_1.time_ < var_132_6 + var_132_13 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319961033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319961033
		arg_133_1.duration_ = 2.3

		local var_133_0 = {
			zh = 1.999999999999,
			ja = 2.3
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
				arg_133_0:Play319961034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1284ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1284ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0.7, -0.985, -6.22)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1284ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0.7, -0.985, -6.22)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["1284ui_story"]
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect1284ui_story == nil then
				arg_133_1.var_.characterEffect1284ui_story = var_136_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_11 = 0.200000002980232

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11

				if arg_133_1.var_.characterEffect1284ui_story then
					arg_133_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 and arg_133_1.var_.characterEffect1284ui_story then
				arg_133_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_136_13 = 0

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action8_1")
			end

			local var_136_14 = 0

			if var_136_14 < arg_133_1.time_ and arg_133_1.time_ <= var_136_14 + arg_136_0 then
				arg_133_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_136_15 = arg_133_1.actors_["10014ui_story"].transform
			local var_136_16 = 0

			if var_136_16 < arg_133_1.time_ and arg_133_1.time_ <= var_136_16 + arg_136_0 then
				arg_133_1.var_.moveOldPos10014ui_story = var_136_15.localPosition
			end

			local var_136_17 = 0.001

			if var_136_16 <= arg_133_1.time_ and arg_133_1.time_ < var_136_16 + var_136_17 then
				local var_136_18 = (arg_133_1.time_ - var_136_16) / var_136_17
				local var_136_19 = Vector3.New(-0.7, -1.06, -6.2)

				var_136_15.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10014ui_story, var_136_19, var_136_18)

				local var_136_20 = manager.ui.mainCamera.transform.position - var_136_15.position

				var_136_15.forward = Vector3.New(var_136_20.x, var_136_20.y, var_136_20.z)

				local var_136_21 = var_136_15.localEulerAngles

				var_136_21.z = 0
				var_136_21.x = 0
				var_136_15.localEulerAngles = var_136_21
			end

			if arg_133_1.time_ >= var_136_16 + var_136_17 and arg_133_1.time_ < var_136_16 + var_136_17 + arg_136_0 then
				var_136_15.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_136_22 = manager.ui.mainCamera.transform.position - var_136_15.position

				var_136_15.forward = Vector3.New(var_136_22.x, var_136_22.y, var_136_22.z)

				local var_136_23 = var_136_15.localEulerAngles

				var_136_23.z = 0
				var_136_23.x = 0
				var_136_15.localEulerAngles = var_136_23
			end

			local var_136_24 = arg_133_1.actors_["10014ui_story"]
			local var_136_25 = 0

			if var_136_25 < arg_133_1.time_ and arg_133_1.time_ <= var_136_25 + arg_136_0 and arg_133_1.var_.characterEffect10014ui_story == nil then
				arg_133_1.var_.characterEffect10014ui_story = var_136_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_26 = 0.200000002980232

			if var_136_25 <= arg_133_1.time_ and arg_133_1.time_ < var_136_25 + var_136_26 then
				local var_136_27 = (arg_133_1.time_ - var_136_25) / var_136_26

				if arg_133_1.var_.characterEffect10014ui_story then
					local var_136_28 = Mathf.Lerp(0, 0.5, var_136_27)

					arg_133_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_133_1.var_.characterEffect10014ui_story.fillRatio = var_136_28
				end
			end

			if arg_133_1.time_ >= var_136_25 + var_136_26 and arg_133_1.time_ < var_136_25 + var_136_26 + arg_136_0 and arg_133_1.var_.characterEffect10014ui_story then
				local var_136_29 = 0.5

				arg_133_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_133_1.var_.characterEffect10014ui_story.fillRatio = var_136_29
			end

			local var_136_30 = 0
			local var_136_31 = 0.2

			if var_136_30 < arg_133_1.time_ and arg_133_1.time_ <= var_136_30 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_32 = arg_133_1:FormatText(StoryNameCfg[6].name)

				arg_133_1.leftNameTxt_.text = var_136_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_33 = arg_133_1:GetWordFromCfg(319961033)
				local var_136_34 = arg_133_1:FormatText(var_136_33.content)

				arg_133_1.text_.text = var_136_34

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_35 = 8
				local var_136_36 = utf8.len(var_136_34)
				local var_136_37 = var_136_35 <= 0 and var_136_31 or var_136_31 * (var_136_36 / var_136_35)

				if var_136_37 > 0 and var_136_31 < var_136_37 then
					arg_133_1.talkMaxDuration = var_136_37

					if var_136_37 + var_136_30 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_37 + var_136_30
					end
				end

				arg_133_1.text_.text = var_136_34
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961033", "story_v_out_319961.awb") ~= 0 then
					local var_136_38 = manager.audio:GetVoiceLength("story_v_out_319961", "319961033", "story_v_out_319961.awb") / 1000

					if var_136_38 + var_136_30 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_38 + var_136_30
					end

					if var_136_33.prefab_name ~= "" and arg_133_1.actors_[var_136_33.prefab_name] ~= nil then
						local var_136_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_33.prefab_name].transform, "story_v_out_319961", "319961033", "story_v_out_319961.awb")

						arg_133_1:RecordAudio("319961033", var_136_39)
						arg_133_1:RecordAudio("319961033", var_136_39)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319961", "319961033", "story_v_out_319961.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319961", "319961033", "story_v_out_319961.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_40 = math.max(var_136_31, arg_133_1.talkMaxDuration)

			if var_136_30 <= arg_133_1.time_ and arg_133_1.time_ < var_136_30 + var_136_40 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_30) / var_136_40

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_30 + var_136_40 and arg_133_1.time_ < var_136_30 + var_136_40 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319961034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319961034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play319961035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1284ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1284ui_story == nil then
				arg_137_1.var_.characterEffect1284ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1284ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1284ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1284ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1284ui_story.fillRatio = var_140_5
			end

			local var_140_6 = arg_137_1.actors_["1284ui_story"].transform
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 then
				arg_137_1.var_.moveOldPos1284ui_story = var_140_6.localPosition
			end

			local var_140_8 = 0.001

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8
				local var_140_10 = Vector3.New(0, 100, 0)

				var_140_6.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1284ui_story, var_140_10, var_140_9)

				local var_140_11 = manager.ui.mainCamera.transform.position - var_140_6.position

				var_140_6.forward = Vector3.New(var_140_11.x, var_140_11.y, var_140_11.z)

				local var_140_12 = var_140_6.localEulerAngles

				var_140_12.z = 0
				var_140_12.x = 0
				var_140_6.localEulerAngles = var_140_12
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 then
				var_140_6.localPosition = Vector3.New(0, 100, 0)

				local var_140_13 = manager.ui.mainCamera.transform.position - var_140_6.position

				var_140_6.forward = Vector3.New(var_140_13.x, var_140_13.y, var_140_13.z)

				local var_140_14 = var_140_6.localEulerAngles

				var_140_14.z = 0
				var_140_14.x = 0
				var_140_6.localEulerAngles = var_140_14
			end

			local var_140_15 = arg_137_1.actors_["10014ui_story"].transform
			local var_140_16 = 0

			if var_140_16 < arg_137_1.time_ and arg_137_1.time_ <= var_140_16 + arg_140_0 then
				arg_137_1.var_.moveOldPos10014ui_story = var_140_15.localPosition
			end

			local var_140_17 = 0.001

			if var_140_16 <= arg_137_1.time_ and arg_137_1.time_ < var_140_16 + var_140_17 then
				local var_140_18 = (arg_137_1.time_ - var_140_16) / var_140_17
				local var_140_19 = Vector3.New(0, 100, 0)

				var_140_15.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10014ui_story, var_140_19, var_140_18)

				local var_140_20 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_20.x, var_140_20.y, var_140_20.z)

				local var_140_21 = var_140_15.localEulerAngles

				var_140_21.z = 0
				var_140_21.x = 0
				var_140_15.localEulerAngles = var_140_21
			end

			if arg_137_1.time_ >= var_140_16 + var_140_17 and arg_137_1.time_ < var_140_16 + var_140_17 + arg_140_0 then
				var_140_15.localPosition = Vector3.New(0, 100, 0)

				local var_140_22 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_22.x, var_140_22.y, var_140_22.z)

				local var_140_23 = var_140_15.localEulerAngles

				var_140_23.z = 0
				var_140_23.x = 0
				var_140_15.localEulerAngles = var_140_23
			end

			local var_140_24 = 0
			local var_140_25 = 1.35

			if var_140_24 < arg_137_1.time_ and arg_137_1.time_ <= var_140_24 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_26 = arg_137_1:GetWordFromCfg(319961034)
				local var_140_27 = arg_137_1:FormatText(var_140_26.content)

				arg_137_1.text_.text = var_140_27

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_28 = 54
				local var_140_29 = utf8.len(var_140_27)
				local var_140_30 = var_140_28 <= 0 and var_140_25 or var_140_25 * (var_140_29 / var_140_28)

				if var_140_30 > 0 and var_140_25 < var_140_30 then
					arg_137_1.talkMaxDuration = var_140_30

					if var_140_30 + var_140_24 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_30 + var_140_24
					end
				end

				arg_137_1.text_.text = var_140_27
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_31 = math.max(var_140_25, arg_137_1.talkMaxDuration)

			if var_140_24 <= arg_137_1.time_ and arg_137_1.time_ < var_140_24 + var_140_31 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_24) / var_140_31

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_24 + var_140_31 and arg_137_1.time_ < var_140_24 + var_140_31 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319961035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319961035
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play319961036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 1.3

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_2 = arg_141_1:GetWordFromCfg(319961035)
				local var_144_3 = arg_141_1:FormatText(var_144_2.content)

				arg_141_1.text_.text = var_144_3

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_4 = 52
				local var_144_5 = utf8.len(var_144_3)
				local var_144_6 = var_144_4 <= 0 and var_144_1 or var_144_1 * (var_144_5 / var_144_4)

				if var_144_6 > 0 and var_144_1 < var_144_6 then
					arg_141_1.talkMaxDuration = var_144_6

					if var_144_6 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_6 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_3
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_7 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_7 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_7

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_7 and arg_141_1.time_ < var_144_0 + var_144_7 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319961036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319961036
		arg_145_1.duration_ = 2.366

		local var_145_0 = {
			zh = 2.033,
			ja = 2.366
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
				arg_145_0:Play319961037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1284ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1284ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(0, -0.985, -6.22)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1284ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(0, -0.985, -6.22)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = 0

			if var_148_9 < arg_145_1.time_ and arg_145_1.time_ <= var_148_9 + arg_148_0 then
				arg_145_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 then
				arg_145_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_148_11 = arg_145_1.actors_["1284ui_story"]
			local var_148_12 = 0

			if var_148_12 < arg_145_1.time_ and arg_145_1.time_ <= var_148_12 + arg_148_0 and arg_145_1.var_.characterEffect1284ui_story == nil then
				arg_145_1.var_.characterEffect1284ui_story = var_148_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_13 = 0.2

			if var_148_12 <= arg_145_1.time_ and arg_145_1.time_ < var_148_12 + var_148_13 then
				local var_148_14 = (arg_145_1.time_ - var_148_12) / var_148_13

				if arg_145_1.var_.characterEffect1284ui_story then
					arg_145_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_12 + var_148_13 and arg_145_1.time_ < var_148_12 + var_148_13 + arg_148_0 and arg_145_1.var_.characterEffect1284ui_story then
				arg_145_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_148_15 = 0
			local var_148_16 = 0.175

			if var_148_15 < arg_145_1.time_ and arg_145_1.time_ <= var_148_15 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_17 = arg_145_1:FormatText(StoryNameCfg[6].name)

				arg_145_1.leftNameTxt_.text = var_148_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_18 = arg_145_1:GetWordFromCfg(319961036)
				local var_148_19 = arg_145_1:FormatText(var_148_18.content)

				arg_145_1.text_.text = var_148_19

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_20 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961036", "story_v_out_319961.awb") ~= 0 then
					local var_148_23 = manager.audio:GetVoiceLength("story_v_out_319961", "319961036", "story_v_out_319961.awb") / 1000

					if var_148_23 + var_148_15 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_23 + var_148_15
					end

					if var_148_18.prefab_name ~= "" and arg_145_1.actors_[var_148_18.prefab_name] ~= nil then
						local var_148_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_18.prefab_name].transform, "story_v_out_319961", "319961036", "story_v_out_319961.awb")

						arg_145_1:RecordAudio("319961036", var_148_24)
						arg_145_1:RecordAudio("319961036", var_148_24)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_319961", "319961036", "story_v_out_319961.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_319961", "319961036", "story_v_out_319961.awb")
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
	Play319961037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319961037
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play319961038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1284ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1284ui_story == nil then
				arg_149_1.var_.characterEffect1284ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.2

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1284ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1284ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1284ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1284ui_story.fillRatio = var_152_5
			end

			local var_152_6 = 0
			local var_152_7 = 1.2

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

				local var_152_8 = arg_149_1:GetWordFromCfg(319961037)
				local var_152_9 = arg_149_1:FormatText(var_152_8.content)

				arg_149_1.text_.text = var_152_9

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_10 = 48
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
	Play319961038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319961038
		arg_153_1.duration_ = 5.333

		local var_153_0 = {
			zh = 4.466,
			ja = 5.333
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
				arg_153_0:Play319961039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1284ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1284ui_story == nil then
				arg_153_1.var_.characterEffect1284ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1284ui_story then
					arg_153_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1284ui_story then
				arg_153_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_156_4 = 0

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				arg_153_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_1")
			end

			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 then
				arg_153_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_156_6 = 0
			local var_156_7 = 0.5

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_8 = arg_153_1:FormatText(StoryNameCfg[6].name)

				arg_153_1.leftNameTxt_.text = var_156_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_9 = arg_153_1:GetWordFromCfg(319961038)
				local var_156_10 = arg_153_1:FormatText(var_156_9.content)

				arg_153_1.text_.text = var_156_10

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_11 = 20
				local var_156_12 = utf8.len(var_156_10)
				local var_156_13 = var_156_11 <= 0 and var_156_7 or var_156_7 * (var_156_12 / var_156_11)

				if var_156_13 > 0 and var_156_7 < var_156_13 then
					arg_153_1.talkMaxDuration = var_156_13

					if var_156_13 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_13 + var_156_6
					end
				end

				arg_153_1.text_.text = var_156_10
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961038", "story_v_out_319961.awb") ~= 0 then
					local var_156_14 = manager.audio:GetVoiceLength("story_v_out_319961", "319961038", "story_v_out_319961.awb") / 1000

					if var_156_14 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_14 + var_156_6
					end

					if var_156_9.prefab_name ~= "" and arg_153_1.actors_[var_156_9.prefab_name] ~= nil then
						local var_156_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_9.prefab_name].transform, "story_v_out_319961", "319961038", "story_v_out_319961.awb")

						arg_153_1:RecordAudio("319961038", var_156_15)
						arg_153_1:RecordAudio("319961038", var_156_15)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_319961", "319961038", "story_v_out_319961.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_319961", "319961038", "story_v_out_319961.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_16 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_16 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_16

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_16 and arg_153_1.time_ < var_156_6 + var_156_16 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319961039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319961039
		arg_157_1.duration_ = 7.866

		local var_157_0 = {
			zh = 5.5,
			ja = 7.866
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
				arg_157_0:Play319961040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10014ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos10014ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10014ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["10014ui_story"]
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 and arg_157_1.var_.characterEffect10014ui_story == nil then
				arg_157_1.var_.characterEffect10014ui_story = var_160_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_11 = 0.200000002980232

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11

				if arg_157_1.var_.characterEffect10014ui_story then
					arg_157_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 and arg_157_1.var_.characterEffect10014ui_story then
				arg_157_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_160_13 = 0

			if var_160_13 < arg_157_1.time_ and arg_157_1.time_ <= var_160_13 + arg_160_0 then
				arg_157_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_160_15 = arg_157_1.actors_["1284ui_story"]
			local var_160_16 = 0

			if var_160_16 < arg_157_1.time_ and arg_157_1.time_ <= var_160_16 + arg_160_0 and arg_157_1.var_.characterEffect1284ui_story == nil then
				arg_157_1.var_.characterEffect1284ui_story = var_160_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_17 = 0.200000002980232

			if var_160_16 <= arg_157_1.time_ and arg_157_1.time_ < var_160_16 + var_160_17 then
				local var_160_18 = (arg_157_1.time_ - var_160_16) / var_160_17

				if arg_157_1.var_.characterEffect1284ui_story then
					local var_160_19 = Mathf.Lerp(0, 0.5, var_160_18)

					arg_157_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1284ui_story.fillRatio = var_160_19
				end
			end

			if arg_157_1.time_ >= var_160_16 + var_160_17 and arg_157_1.time_ < var_160_16 + var_160_17 + arg_160_0 and arg_157_1.var_.characterEffect1284ui_story then
				local var_160_20 = 0.5

				arg_157_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1284ui_story.fillRatio = var_160_20
			end

			local var_160_21 = arg_157_1.actors_["1284ui_story"].transform
			local var_160_22 = 0

			if var_160_22 < arg_157_1.time_ and arg_157_1.time_ <= var_160_22 + arg_160_0 then
				arg_157_1.var_.moveOldPos1284ui_story = var_160_21.localPosition
			end

			local var_160_23 = 0.001

			if var_160_22 <= arg_157_1.time_ and arg_157_1.time_ < var_160_22 + var_160_23 then
				local var_160_24 = (arg_157_1.time_ - var_160_22) / var_160_23
				local var_160_25 = Vector3.New(0.7, -0.985, -6.22)

				var_160_21.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1284ui_story, var_160_25, var_160_24)

				local var_160_26 = manager.ui.mainCamera.transform.position - var_160_21.position

				var_160_21.forward = Vector3.New(var_160_26.x, var_160_26.y, var_160_26.z)

				local var_160_27 = var_160_21.localEulerAngles

				var_160_27.z = 0
				var_160_27.x = 0
				var_160_21.localEulerAngles = var_160_27
			end

			if arg_157_1.time_ >= var_160_22 + var_160_23 and arg_157_1.time_ < var_160_22 + var_160_23 + arg_160_0 then
				var_160_21.localPosition = Vector3.New(0.7, -0.985, -6.22)

				local var_160_28 = manager.ui.mainCamera.transform.position - var_160_21.position

				var_160_21.forward = Vector3.New(var_160_28.x, var_160_28.y, var_160_28.z)

				local var_160_29 = var_160_21.localEulerAngles

				var_160_29.z = 0
				var_160_29.x = 0
				var_160_21.localEulerAngles = var_160_29
			end

			local var_160_30 = 0
			local var_160_31 = 0.65

			if var_160_30 < arg_157_1.time_ and arg_157_1.time_ <= var_160_30 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_32 = arg_157_1:FormatText(StoryNameCfg[264].name)

				arg_157_1.leftNameTxt_.text = var_160_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_33 = arg_157_1:GetWordFromCfg(319961039)
				local var_160_34 = arg_157_1:FormatText(var_160_33.content)

				arg_157_1.text_.text = var_160_34

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_35 = 26
				local var_160_36 = utf8.len(var_160_34)
				local var_160_37 = var_160_35 <= 0 and var_160_31 or var_160_31 * (var_160_36 / var_160_35)

				if var_160_37 > 0 and var_160_31 < var_160_37 then
					arg_157_1.talkMaxDuration = var_160_37

					if var_160_37 + var_160_30 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_37 + var_160_30
					end
				end

				arg_157_1.text_.text = var_160_34
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961039", "story_v_out_319961.awb") ~= 0 then
					local var_160_38 = manager.audio:GetVoiceLength("story_v_out_319961", "319961039", "story_v_out_319961.awb") / 1000

					if var_160_38 + var_160_30 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_38 + var_160_30
					end

					if var_160_33.prefab_name ~= "" and arg_157_1.actors_[var_160_33.prefab_name] ~= nil then
						local var_160_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_33.prefab_name].transform, "story_v_out_319961", "319961039", "story_v_out_319961.awb")

						arg_157_1:RecordAudio("319961039", var_160_39)
						arg_157_1:RecordAudio("319961039", var_160_39)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_319961", "319961039", "story_v_out_319961.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_319961", "319961039", "story_v_out_319961.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_40 = math.max(var_160_31, arg_157_1.talkMaxDuration)

			if var_160_30 <= arg_157_1.time_ and arg_157_1.time_ < var_160_30 + var_160_40 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_30) / var_160_40

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_30 + var_160_40 and arg_157_1.time_ < var_160_30 + var_160_40 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319961040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319961040
		arg_161_1.duration_ = 7.9

		local var_161_0 = {
			zh = 7.9,
			ja = 5.566
		}
		local var_161_1 = manager.audio:GetLocalizationFlag()

		if var_161_0[var_161_1] ~= nil then
			arg_161_1.duration_ = var_161_0[var_161_1]
		end

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play319961041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10014ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect10014ui_story == nil then
				arg_161_1.var_.characterEffect10014ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect10014ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_161_1.var_.characterEffect10014ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect10014ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_161_1.var_.characterEffect10014ui_story.fillRatio = var_164_5
			end

			local var_164_6 = arg_161_1.actors_["1284ui_story"]
			local var_164_7 = 0

			if var_164_7 < arg_161_1.time_ and arg_161_1.time_ <= var_164_7 + arg_164_0 and arg_161_1.var_.characterEffect1284ui_story == nil then
				arg_161_1.var_.characterEffect1284ui_story = var_164_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_8 = 0.200000002980232

			if var_164_7 <= arg_161_1.time_ and arg_161_1.time_ < var_164_7 + var_164_8 then
				local var_164_9 = (arg_161_1.time_ - var_164_7) / var_164_8

				if arg_161_1.var_.characterEffect1284ui_story then
					arg_161_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_7 + var_164_8 and arg_161_1.time_ < var_164_7 + var_164_8 + arg_164_0 and arg_161_1.var_.characterEffect1284ui_story then
				arg_161_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_2")
			end

			local var_164_11 = 0

			if var_164_11 < arg_161_1.time_ and arg_161_1.time_ <= var_164_11 + arg_164_0 then
				arg_161_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_164_12 = 0
			local var_164_13 = 0.95

			if var_164_12 < arg_161_1.time_ and arg_161_1.time_ <= var_164_12 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_14 = arg_161_1:FormatText(StoryNameCfg[6].name)

				arg_161_1.leftNameTxt_.text = var_164_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_15 = arg_161_1:GetWordFromCfg(319961040)
				local var_164_16 = arg_161_1:FormatText(var_164_15.content)

				arg_161_1.text_.text = var_164_16

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_17 = 38
				local var_164_18 = utf8.len(var_164_16)
				local var_164_19 = var_164_17 <= 0 and var_164_13 or var_164_13 * (var_164_18 / var_164_17)

				if var_164_19 > 0 and var_164_13 < var_164_19 then
					arg_161_1.talkMaxDuration = var_164_19

					if var_164_19 + var_164_12 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_19 + var_164_12
					end
				end

				arg_161_1.text_.text = var_164_16
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961040", "story_v_out_319961.awb") ~= 0 then
					local var_164_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961040", "story_v_out_319961.awb") / 1000

					if var_164_20 + var_164_12 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_20 + var_164_12
					end

					if var_164_15.prefab_name ~= "" and arg_161_1.actors_[var_164_15.prefab_name] ~= nil then
						local var_164_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_15.prefab_name].transform, "story_v_out_319961", "319961040", "story_v_out_319961.awb")

						arg_161_1:RecordAudio("319961040", var_164_21)
						arg_161_1:RecordAudio("319961040", var_164_21)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_319961", "319961040", "story_v_out_319961.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_319961", "319961040", "story_v_out_319961.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_22 = math.max(var_164_13, arg_161_1.talkMaxDuration)

			if var_164_12 <= arg_161_1.time_ and arg_161_1.time_ < var_164_12 + var_164_22 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_12) / var_164_22

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_12 + var_164_22 and arg_161_1.time_ < var_164_12 + var_164_22 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319961041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 319961041
		arg_165_1.duration_ = 5.3

		local var_165_0 = {
			zh = 2.866,
			ja = 5.3
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
				arg_165_0:Play319961042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10014ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect10014ui_story == nil then
				arg_165_1.var_.characterEffect10014ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.200000002980232

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect10014ui_story then
					arg_165_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect10014ui_story then
				arg_165_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_168_4 = arg_165_1.actors_["1284ui_story"]
			local var_168_5 = 0

			if var_168_5 < arg_165_1.time_ and arg_165_1.time_ <= var_168_5 + arg_168_0 and arg_165_1.var_.characterEffect1284ui_story == nil then
				arg_165_1.var_.characterEffect1284ui_story = var_168_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_6 = 0.200000002980232

			if var_168_5 <= arg_165_1.time_ and arg_165_1.time_ < var_168_5 + var_168_6 then
				local var_168_7 = (arg_165_1.time_ - var_168_5) / var_168_6

				if arg_165_1.var_.characterEffect1284ui_story then
					local var_168_8 = Mathf.Lerp(0, 0.5, var_168_7)

					arg_165_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1284ui_story.fillRatio = var_168_8
				end
			end

			if arg_165_1.time_ >= var_168_5 + var_168_6 and arg_165_1.time_ < var_168_5 + var_168_6 + arg_168_0 and arg_165_1.var_.characterEffect1284ui_story then
				local var_168_9 = 0.5

				arg_165_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1284ui_story.fillRatio = var_168_9
			end

			local var_168_10 = 0
			local var_168_11 = 0.275

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_12 = arg_165_1:FormatText(StoryNameCfg[264].name)

				arg_165_1.leftNameTxt_.text = var_168_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_13 = arg_165_1:GetWordFromCfg(319961041)
				local var_168_14 = arg_165_1:FormatText(var_168_13.content)

				arg_165_1.text_.text = var_168_14

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_15 = 11
				local var_168_16 = utf8.len(var_168_14)
				local var_168_17 = var_168_15 <= 0 and var_168_11 or var_168_11 * (var_168_16 / var_168_15)

				if var_168_17 > 0 and var_168_11 < var_168_17 then
					arg_165_1.talkMaxDuration = var_168_17

					if var_168_17 + var_168_10 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_17 + var_168_10
					end
				end

				arg_165_1.text_.text = var_168_14
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961041", "story_v_out_319961.awb") ~= 0 then
					local var_168_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961041", "story_v_out_319961.awb") / 1000

					if var_168_18 + var_168_10 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_18 + var_168_10
					end

					if var_168_13.prefab_name ~= "" and arg_165_1.actors_[var_168_13.prefab_name] ~= nil then
						local var_168_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_13.prefab_name].transform, "story_v_out_319961", "319961041", "story_v_out_319961.awb")

						arg_165_1:RecordAudio("319961041", var_168_19)
						arg_165_1:RecordAudio("319961041", var_168_19)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_319961", "319961041", "story_v_out_319961.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_319961", "319961041", "story_v_out_319961.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_20 = math.max(var_168_11, arg_165_1.talkMaxDuration)

			if var_168_10 <= arg_165_1.time_ and arg_165_1.time_ < var_168_10 + var_168_20 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_10) / var_168_20

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_10 + var_168_20 and arg_165_1.time_ < var_168_10 + var_168_20 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play319961042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 319961042
		arg_169_1.duration_ = 3.166

		local var_169_0 = {
			zh = 1.433,
			ja = 3.166
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
				arg_169_0:Play319961043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10014ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect10014ui_story == nil then
				arg_169_1.var_.characterEffect10014ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.200000002980232

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect10014ui_story then
					local var_172_4 = Mathf.Lerp(0, 0.5, var_172_3)

					arg_169_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_169_1.var_.characterEffect10014ui_story.fillRatio = var_172_4
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect10014ui_story then
				local var_172_5 = 0.5

				arg_169_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_169_1.var_.characterEffect10014ui_story.fillRatio = var_172_5
			end

			local var_172_6 = arg_169_1.actors_["1284ui_story"]
			local var_172_7 = 0

			if var_172_7 < arg_169_1.time_ and arg_169_1.time_ <= var_172_7 + arg_172_0 and arg_169_1.var_.characterEffect1284ui_story == nil then
				arg_169_1.var_.characterEffect1284ui_story = var_172_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_8 = 0.200000002980232

			if var_172_7 <= arg_169_1.time_ and arg_169_1.time_ < var_172_7 + var_172_8 then
				local var_172_9 = (arg_169_1.time_ - var_172_7) / var_172_8

				if arg_169_1.var_.characterEffect1284ui_story then
					arg_169_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_7 + var_172_8 and arg_169_1.time_ < var_172_7 + var_172_8 + arg_172_0 and arg_169_1.var_.characterEffect1284ui_story then
				arg_169_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_172_10 = 0
			local var_172_11 = 0.125

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_12 = arg_169_1:FormatText(StoryNameCfg[6].name)

				arg_169_1.leftNameTxt_.text = var_172_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_13 = arg_169_1:GetWordFromCfg(319961042)
				local var_172_14 = arg_169_1:FormatText(var_172_13.content)

				arg_169_1.text_.text = var_172_14

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_15 = 5
				local var_172_16 = utf8.len(var_172_14)
				local var_172_17 = var_172_15 <= 0 and var_172_11 or var_172_11 * (var_172_16 / var_172_15)

				if var_172_17 > 0 and var_172_11 < var_172_17 then
					arg_169_1.talkMaxDuration = var_172_17

					if var_172_17 + var_172_10 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_17 + var_172_10
					end
				end

				arg_169_1.text_.text = var_172_14
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961042", "story_v_out_319961.awb") ~= 0 then
					local var_172_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961042", "story_v_out_319961.awb") / 1000

					if var_172_18 + var_172_10 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_18 + var_172_10
					end

					if var_172_13.prefab_name ~= "" and arg_169_1.actors_[var_172_13.prefab_name] ~= nil then
						local var_172_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_13.prefab_name].transform, "story_v_out_319961", "319961042", "story_v_out_319961.awb")

						arg_169_1:RecordAudio("319961042", var_172_19)
						arg_169_1:RecordAudio("319961042", var_172_19)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_319961", "319961042", "story_v_out_319961.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_319961", "319961042", "story_v_out_319961.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_20 = math.max(var_172_11, arg_169_1.talkMaxDuration)

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_20 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_10) / var_172_20

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_10 + var_172_20 and arg_169_1.time_ < var_172_10 + var_172_20 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play319961043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319961043
		arg_173_1.duration_ = 10

		local var_173_0 = {
			zh = 9.1,
			ja = 10
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
				arg_173_0:Play319961044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["10014ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect10014ui_story == nil then
				arg_173_1.var_.characterEffect10014ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.200000002980232

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect10014ui_story then
					arg_173_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect10014ui_story then
				arg_173_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_176_4 = 0

			if var_176_4 < arg_173_1.time_ and arg_173_1.time_ <= var_176_4 + arg_176_0 then
				arg_173_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014actionlink/10014action425")
			end

			local var_176_5 = 0

			if var_176_5 < arg_173_1.time_ and arg_173_1.time_ <= var_176_5 + arg_176_0 then
				arg_173_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_176_6 = arg_173_1.actors_["1284ui_story"]
			local var_176_7 = 0

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 and arg_173_1.var_.characterEffect1284ui_story == nil then
				arg_173_1.var_.characterEffect1284ui_story = var_176_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_8 = 0.200000002980232

			if var_176_7 <= arg_173_1.time_ and arg_173_1.time_ < var_176_7 + var_176_8 then
				local var_176_9 = (arg_173_1.time_ - var_176_7) / var_176_8

				if arg_173_1.var_.characterEffect1284ui_story then
					local var_176_10 = Mathf.Lerp(0, 0.5, var_176_9)

					arg_173_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1284ui_story.fillRatio = var_176_10
				end
			end

			if arg_173_1.time_ >= var_176_7 + var_176_8 and arg_173_1.time_ < var_176_7 + var_176_8 + arg_176_0 and arg_173_1.var_.characterEffect1284ui_story then
				local var_176_11 = 0.5

				arg_173_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1284ui_story.fillRatio = var_176_11
			end

			local var_176_12 = 0
			local var_176_13 = 1.1

			if var_176_12 < arg_173_1.time_ and arg_173_1.time_ <= var_176_12 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_14 = arg_173_1:FormatText(StoryNameCfg[264].name)

				arg_173_1.leftNameTxt_.text = var_176_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_15 = arg_173_1:GetWordFromCfg(319961043)
				local var_176_16 = arg_173_1:FormatText(var_176_15.content)

				arg_173_1.text_.text = var_176_16

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_17 = 44
				local var_176_18 = utf8.len(var_176_16)
				local var_176_19 = var_176_17 <= 0 and var_176_13 or var_176_13 * (var_176_18 / var_176_17)

				if var_176_19 > 0 and var_176_13 < var_176_19 then
					arg_173_1.talkMaxDuration = var_176_19

					if var_176_19 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_19 + var_176_12
					end
				end

				arg_173_1.text_.text = var_176_16
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961043", "story_v_out_319961.awb") ~= 0 then
					local var_176_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961043", "story_v_out_319961.awb") / 1000

					if var_176_20 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_20 + var_176_12
					end

					if var_176_15.prefab_name ~= "" and arg_173_1.actors_[var_176_15.prefab_name] ~= nil then
						local var_176_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_15.prefab_name].transform, "story_v_out_319961", "319961043", "story_v_out_319961.awb")

						arg_173_1:RecordAudio("319961043", var_176_21)
						arg_173_1:RecordAudio("319961043", var_176_21)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_319961", "319961043", "story_v_out_319961.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_319961", "319961043", "story_v_out_319961.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_22 = math.max(var_176_13, arg_173_1.talkMaxDuration)

			if var_176_12 <= arg_173_1.time_ and arg_173_1.time_ < var_176_12 + var_176_22 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_12) / var_176_22

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_12 + var_176_22 and arg_173_1.time_ < var_176_12 + var_176_22 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play319961044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 319961044
		arg_177_1.duration_ = 11.5

		local var_177_0 = {
			zh = 11.5,
			ja = 9.933
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play319961045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 1.4

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[264].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(319961044)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 56
				local var_180_6 = utf8.len(var_180_4)
				local var_180_7 = var_180_5 <= 0 and var_180_1 or var_180_1 * (var_180_6 / var_180_5)

				if var_180_7 > 0 and var_180_1 < var_180_7 then
					arg_177_1.talkMaxDuration = var_180_7

					if var_180_7 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_7 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_4
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961044", "story_v_out_319961.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961044", "story_v_out_319961.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_319961", "319961044", "story_v_out_319961.awb")

						arg_177_1:RecordAudio("319961044", var_180_9)
						arg_177_1:RecordAudio("319961044", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_319961", "319961044", "story_v_out_319961.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_319961", "319961044", "story_v_out_319961.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_10 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_10 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_10

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_10 and arg_177_1.time_ < var_180_0 + var_180_10 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play319961045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 319961045
		arg_181_1.duration_ = 4.166

		local var_181_0 = {
			zh = 2.4,
			ja = 4.166
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
				arg_181_0:Play319961046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1284ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1284ui_story == nil then
				arg_181_1.var_.characterEffect1284ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1284ui_story then
					arg_181_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1284ui_story then
				arg_181_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_184_4 = 0

			if var_184_4 < arg_181_1.time_ and arg_181_1.time_ <= var_184_4 + arg_184_0 then
				arg_181_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_184_5 = 0

			if var_184_5 < arg_181_1.time_ and arg_181_1.time_ <= var_184_5 + arg_184_0 then
				arg_181_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_184_6 = arg_181_1.actors_["10014ui_story"]
			local var_184_7 = 0

			if var_184_7 < arg_181_1.time_ and arg_181_1.time_ <= var_184_7 + arg_184_0 and arg_181_1.var_.characterEffect10014ui_story == nil then
				arg_181_1.var_.characterEffect10014ui_story = var_184_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_8 = 0.200000002980232

			if var_184_7 <= arg_181_1.time_ and arg_181_1.time_ < var_184_7 + var_184_8 then
				local var_184_9 = (arg_181_1.time_ - var_184_7) / var_184_8

				if arg_181_1.var_.characterEffect10014ui_story then
					local var_184_10 = Mathf.Lerp(0, 0.5, var_184_9)

					arg_181_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_181_1.var_.characterEffect10014ui_story.fillRatio = var_184_10
				end
			end

			if arg_181_1.time_ >= var_184_7 + var_184_8 and arg_181_1.time_ < var_184_7 + var_184_8 + arg_184_0 and arg_181_1.var_.characterEffect10014ui_story then
				local var_184_11 = 0.5

				arg_181_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_181_1.var_.characterEffect10014ui_story.fillRatio = var_184_11
			end

			local var_184_12 = 0
			local var_184_13 = 0.225

			if var_184_12 < arg_181_1.time_ and arg_181_1.time_ <= var_184_12 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_14 = arg_181_1:FormatText(StoryNameCfg[6].name)

				arg_181_1.leftNameTxt_.text = var_184_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_15 = arg_181_1:GetWordFromCfg(319961045)
				local var_184_16 = arg_181_1:FormatText(var_184_15.content)

				arg_181_1.text_.text = var_184_16

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_17 = 9
				local var_184_18 = utf8.len(var_184_16)
				local var_184_19 = var_184_17 <= 0 and var_184_13 or var_184_13 * (var_184_18 / var_184_17)

				if var_184_19 > 0 and var_184_13 < var_184_19 then
					arg_181_1.talkMaxDuration = var_184_19

					if var_184_19 + var_184_12 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_19 + var_184_12
					end
				end

				arg_181_1.text_.text = var_184_16
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961045", "story_v_out_319961.awb") ~= 0 then
					local var_184_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961045", "story_v_out_319961.awb") / 1000

					if var_184_20 + var_184_12 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_20 + var_184_12
					end

					if var_184_15.prefab_name ~= "" and arg_181_1.actors_[var_184_15.prefab_name] ~= nil then
						local var_184_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_15.prefab_name].transform, "story_v_out_319961", "319961045", "story_v_out_319961.awb")

						arg_181_1:RecordAudio("319961045", var_184_21)
						arg_181_1:RecordAudio("319961045", var_184_21)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_319961", "319961045", "story_v_out_319961.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_319961", "319961045", "story_v_out_319961.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_22 = math.max(var_184_13, arg_181_1.talkMaxDuration)

			if var_184_12 <= arg_181_1.time_ and arg_181_1.time_ < var_184_12 + var_184_22 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_12) / var_184_22

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_12 + var_184_22 and arg_181_1.time_ < var_184_12 + var_184_22 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play319961046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319961046
		arg_185_1.duration_ = 1.933

		local var_185_0 = {
			zh = 1.7,
			ja = 1.933
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
				arg_185_0:Play319961047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1284ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect1284ui_story == nil then
				arg_185_1.var_.characterEffect1284ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.200000002980232

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect1284ui_story then
					local var_188_4 = Mathf.Lerp(0, 0.5, var_188_3)

					arg_185_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1284ui_story.fillRatio = var_188_4
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect1284ui_story then
				local var_188_5 = 0.5

				arg_185_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1284ui_story.fillRatio = var_188_5
			end

			local var_188_6 = arg_185_1.actors_["10014ui_story"]
			local var_188_7 = 0

			if var_188_7 < arg_185_1.time_ and arg_185_1.time_ <= var_188_7 + arg_188_0 and arg_185_1.var_.characterEffect10014ui_story == nil then
				arg_185_1.var_.characterEffect10014ui_story = var_188_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_8 = 0.200000002980232

			if var_188_7 <= arg_185_1.time_ and arg_185_1.time_ < var_188_7 + var_188_8 then
				local var_188_9 = (arg_185_1.time_ - var_188_7) / var_188_8

				if arg_185_1.var_.characterEffect10014ui_story then
					arg_185_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_7 + var_188_8 and arg_185_1.time_ < var_188_7 + var_188_8 + arg_188_0 and arg_185_1.var_.characterEffect10014ui_story then
				arg_185_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_188_10 = 0
			local var_188_11 = 0.175

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_12 = arg_185_1:FormatText(StoryNameCfg[264].name)

				arg_185_1.leftNameTxt_.text = var_188_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_13 = arg_185_1:GetWordFromCfg(319961046)
				local var_188_14 = arg_185_1:FormatText(var_188_13.content)

				arg_185_1.text_.text = var_188_14

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_15 = 7
				local var_188_16 = utf8.len(var_188_14)
				local var_188_17 = var_188_15 <= 0 and var_188_11 or var_188_11 * (var_188_16 / var_188_15)

				if var_188_17 > 0 and var_188_11 < var_188_17 then
					arg_185_1.talkMaxDuration = var_188_17

					if var_188_17 + var_188_10 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_17 + var_188_10
					end
				end

				arg_185_1.text_.text = var_188_14
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961046", "story_v_out_319961.awb") ~= 0 then
					local var_188_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961046", "story_v_out_319961.awb") / 1000

					if var_188_18 + var_188_10 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_18 + var_188_10
					end

					if var_188_13.prefab_name ~= "" and arg_185_1.actors_[var_188_13.prefab_name] ~= nil then
						local var_188_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_13.prefab_name].transform, "story_v_out_319961", "319961046", "story_v_out_319961.awb")

						arg_185_1:RecordAudio("319961046", var_188_19)
						arg_185_1:RecordAudio("319961046", var_188_19)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319961", "319961046", "story_v_out_319961.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319961", "319961046", "story_v_out_319961.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_20 = math.max(var_188_11, arg_185_1.talkMaxDuration)

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_20 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_10) / var_188_20

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_10 + var_188_20 and arg_185_1.time_ < var_188_10 + var_188_20 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319961047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319961047
		arg_189_1.duration_ = 10.2

		local var_189_0 = {
			zh = 8.166,
			ja = 10.2
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
				arg_189_0:Play319961048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["10014ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect10014ui_story == nil then
				arg_189_1.var_.characterEffect10014ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.200000002980232

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect10014ui_story then
					local var_192_4 = Mathf.Lerp(0, 0.5, var_192_3)

					arg_189_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_189_1.var_.characterEffect10014ui_story.fillRatio = var_192_4
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect10014ui_story then
				local var_192_5 = 0.5

				arg_189_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_189_1.var_.characterEffect10014ui_story.fillRatio = var_192_5
			end

			local var_192_6 = arg_189_1.actors_["1284ui_story"]
			local var_192_7 = 0

			if var_192_7 < arg_189_1.time_ and arg_189_1.time_ <= var_192_7 + arg_192_0 and arg_189_1.var_.characterEffect1284ui_story == nil then
				arg_189_1.var_.characterEffect1284ui_story = var_192_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_8 = 0.200000002980232

			if var_192_7 <= arg_189_1.time_ and arg_189_1.time_ < var_192_7 + var_192_8 then
				local var_192_9 = (arg_189_1.time_ - var_192_7) / var_192_8

				if arg_189_1.var_.characterEffect1284ui_story then
					arg_189_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_7 + var_192_8 and arg_189_1.time_ < var_192_7 + var_192_8 + arg_192_0 and arg_189_1.var_.characterEffect1284ui_story then
				arg_189_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_192_10 = 0
			local var_192_11 = 0.975

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_12 = arg_189_1:FormatText(StoryNameCfg[6].name)

				arg_189_1.leftNameTxt_.text = var_192_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_13 = arg_189_1:GetWordFromCfg(319961047)
				local var_192_14 = arg_189_1:FormatText(var_192_13.content)

				arg_189_1.text_.text = var_192_14

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_15 = 39
				local var_192_16 = utf8.len(var_192_14)
				local var_192_17 = var_192_15 <= 0 and var_192_11 or var_192_11 * (var_192_16 / var_192_15)

				if var_192_17 > 0 and var_192_11 < var_192_17 then
					arg_189_1.talkMaxDuration = var_192_17

					if var_192_17 + var_192_10 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_17 + var_192_10
					end
				end

				arg_189_1.text_.text = var_192_14
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961047", "story_v_out_319961.awb") ~= 0 then
					local var_192_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961047", "story_v_out_319961.awb") / 1000

					if var_192_18 + var_192_10 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_18 + var_192_10
					end

					if var_192_13.prefab_name ~= "" and arg_189_1.actors_[var_192_13.prefab_name] ~= nil then
						local var_192_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_13.prefab_name].transform, "story_v_out_319961", "319961047", "story_v_out_319961.awb")

						arg_189_1:RecordAudio("319961047", var_192_19)
						arg_189_1:RecordAudio("319961047", var_192_19)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_319961", "319961047", "story_v_out_319961.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_319961", "319961047", "story_v_out_319961.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_20 = math.max(var_192_11, arg_189_1.talkMaxDuration)

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_20 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_10) / var_192_20

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_10 + var_192_20 and arg_189_1.time_ < var_192_10 + var_192_20 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play319961048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319961048
		arg_193_1.duration_ = 4.5

		local var_193_0 = {
			zh = 2.566,
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
				arg_193_0:Play319961049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10014ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect10014ui_story == nil then
				arg_193_1.var_.characterEffect10014ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.200000002980232

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect10014ui_story then
					arg_193_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect10014ui_story then
				arg_193_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_196_4 = arg_193_1.actors_["1284ui_story"]
			local var_196_5 = 0

			if var_196_5 < arg_193_1.time_ and arg_193_1.time_ <= var_196_5 + arg_196_0 and arg_193_1.var_.characterEffect1284ui_story == nil then
				arg_193_1.var_.characterEffect1284ui_story = var_196_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_6 = 0.200000002980232

			if var_196_5 <= arg_193_1.time_ and arg_193_1.time_ < var_196_5 + var_196_6 then
				local var_196_7 = (arg_193_1.time_ - var_196_5) / var_196_6

				if arg_193_1.var_.characterEffect1284ui_story then
					local var_196_8 = Mathf.Lerp(0, 0.5, var_196_7)

					arg_193_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1284ui_story.fillRatio = var_196_8
				end
			end

			if arg_193_1.time_ >= var_196_5 + var_196_6 and arg_193_1.time_ < var_196_5 + var_196_6 + arg_196_0 and arg_193_1.var_.characterEffect1284ui_story then
				local var_196_9 = 0.5

				arg_193_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1284ui_story.fillRatio = var_196_9
			end

			local var_196_10 = 0
			local var_196_11 = 0.275

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_12 = arg_193_1:FormatText(StoryNameCfg[264].name)

				arg_193_1.leftNameTxt_.text = var_196_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_13 = arg_193_1:GetWordFromCfg(319961048)
				local var_196_14 = arg_193_1:FormatText(var_196_13.content)

				arg_193_1.text_.text = var_196_14

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_15 = 11
				local var_196_16 = utf8.len(var_196_14)
				local var_196_17 = var_196_15 <= 0 and var_196_11 or var_196_11 * (var_196_16 / var_196_15)

				if var_196_17 > 0 and var_196_11 < var_196_17 then
					arg_193_1.talkMaxDuration = var_196_17

					if var_196_17 + var_196_10 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_17 + var_196_10
					end
				end

				arg_193_1.text_.text = var_196_14
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961048", "story_v_out_319961.awb") ~= 0 then
					local var_196_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961048", "story_v_out_319961.awb") / 1000

					if var_196_18 + var_196_10 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_18 + var_196_10
					end

					if var_196_13.prefab_name ~= "" and arg_193_1.actors_[var_196_13.prefab_name] ~= nil then
						local var_196_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_13.prefab_name].transform, "story_v_out_319961", "319961048", "story_v_out_319961.awb")

						arg_193_1:RecordAudio("319961048", var_196_19)
						arg_193_1:RecordAudio("319961048", var_196_19)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_319961", "319961048", "story_v_out_319961.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_319961", "319961048", "story_v_out_319961.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_20 = math.max(var_196_11, arg_193_1.talkMaxDuration)

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_20 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_10) / var_196_20

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_10 + var_196_20 and arg_193_1.time_ < var_196_10 + var_196_20 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play319961049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 319961049
		arg_197_1.duration_ = 6.433

		local var_197_0 = {
			zh = 2.2,
			ja = 6.433
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
				arg_197_0:Play319961050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["10014ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect10014ui_story == nil then
				arg_197_1.var_.characterEffect10014ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect10014ui_story then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_197_1.var_.characterEffect10014ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect10014ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_197_1.var_.characterEffect10014ui_story.fillRatio = var_200_5
			end

			local var_200_6 = arg_197_1.actors_["1284ui_story"]
			local var_200_7 = 0

			if var_200_7 < arg_197_1.time_ and arg_197_1.time_ <= var_200_7 + arg_200_0 and arg_197_1.var_.characterEffect1284ui_story == nil then
				arg_197_1.var_.characterEffect1284ui_story = var_200_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_8 = 0.200000002980232

			if var_200_7 <= arg_197_1.time_ and arg_197_1.time_ < var_200_7 + var_200_8 then
				local var_200_9 = (arg_197_1.time_ - var_200_7) / var_200_8

				if arg_197_1.var_.characterEffect1284ui_story then
					arg_197_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_7 + var_200_8 and arg_197_1.time_ < var_200_7 + var_200_8 + arg_200_0 and arg_197_1.var_.characterEffect1284ui_story then
				arg_197_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 then
				arg_197_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_200_11 = 0

			if var_200_11 < arg_197_1.time_ and arg_197_1.time_ <= var_200_11 + arg_200_0 then
				arg_197_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_200_12 = 0
			local var_200_13 = 0.325

			if var_200_12 < arg_197_1.time_ and arg_197_1.time_ <= var_200_12 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_14 = arg_197_1:FormatText(StoryNameCfg[6].name)

				arg_197_1.leftNameTxt_.text = var_200_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_15 = arg_197_1:GetWordFromCfg(319961049)
				local var_200_16 = arg_197_1:FormatText(var_200_15.content)

				arg_197_1.text_.text = var_200_16

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_17 = 13
				local var_200_18 = utf8.len(var_200_16)
				local var_200_19 = var_200_17 <= 0 and var_200_13 or var_200_13 * (var_200_18 / var_200_17)

				if var_200_19 > 0 and var_200_13 < var_200_19 then
					arg_197_1.talkMaxDuration = var_200_19

					if var_200_19 + var_200_12 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_19 + var_200_12
					end
				end

				arg_197_1.text_.text = var_200_16
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961049", "story_v_out_319961.awb") ~= 0 then
					local var_200_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961049", "story_v_out_319961.awb") / 1000

					if var_200_20 + var_200_12 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_20 + var_200_12
					end

					if var_200_15.prefab_name ~= "" and arg_197_1.actors_[var_200_15.prefab_name] ~= nil then
						local var_200_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_15.prefab_name].transform, "story_v_out_319961", "319961049", "story_v_out_319961.awb")

						arg_197_1:RecordAudio("319961049", var_200_21)
						arg_197_1:RecordAudio("319961049", var_200_21)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_319961", "319961049", "story_v_out_319961.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_319961", "319961049", "story_v_out_319961.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_22 = math.max(var_200_13, arg_197_1.talkMaxDuration)

			if var_200_12 <= arg_197_1.time_ and arg_197_1.time_ < var_200_12 + var_200_22 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_12) / var_200_22

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_12 + var_200_22 and arg_197_1.time_ < var_200_12 + var_200_22 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play319961050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 319961050
		arg_201_1.duration_ = 2.1

		local var_201_0 = {
			zh = 1.999999999999,
			ja = 2.1
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
				arg_201_0:Play319961051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10014ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect10014ui_story == nil then
				arg_201_1.var_.characterEffect10014ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.200000002980232

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect10014ui_story then
					arg_201_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect10014ui_story then
				arg_201_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_204_4 = 0

			if var_204_4 < arg_201_1.time_ and arg_201_1.time_ <= var_204_4 + arg_204_0 then
				arg_201_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action5_2")
			end

			local var_204_5 = 0

			if var_204_5 < arg_201_1.time_ and arg_201_1.time_ <= var_204_5 + arg_204_0 then
				arg_201_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_204_6 = arg_201_1.actors_["1284ui_story"]
			local var_204_7 = 0

			if var_204_7 < arg_201_1.time_ and arg_201_1.time_ <= var_204_7 + arg_204_0 and arg_201_1.var_.characterEffect1284ui_story == nil then
				arg_201_1.var_.characterEffect1284ui_story = var_204_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_8 = 0.200000002980232

			if var_204_7 <= arg_201_1.time_ and arg_201_1.time_ < var_204_7 + var_204_8 then
				local var_204_9 = (arg_201_1.time_ - var_204_7) / var_204_8

				if arg_201_1.var_.characterEffect1284ui_story then
					local var_204_10 = Mathf.Lerp(0, 0.5, var_204_9)

					arg_201_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1284ui_story.fillRatio = var_204_10
				end
			end

			if arg_201_1.time_ >= var_204_7 + var_204_8 and arg_201_1.time_ < var_204_7 + var_204_8 + arg_204_0 and arg_201_1.var_.characterEffect1284ui_story then
				local var_204_11 = 0.5

				arg_201_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1284ui_story.fillRatio = var_204_11
			end

			local var_204_12 = 0
			local var_204_13 = 0.125

			if var_204_12 < arg_201_1.time_ and arg_201_1.time_ <= var_204_12 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_14 = arg_201_1:FormatText(StoryNameCfg[264].name)

				arg_201_1.leftNameTxt_.text = var_204_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_15 = arg_201_1:GetWordFromCfg(319961050)
				local var_204_16 = arg_201_1:FormatText(var_204_15.content)

				arg_201_1.text_.text = var_204_16

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_17 = 5
				local var_204_18 = utf8.len(var_204_16)
				local var_204_19 = var_204_17 <= 0 and var_204_13 or var_204_13 * (var_204_18 / var_204_17)

				if var_204_19 > 0 and var_204_13 < var_204_19 then
					arg_201_1.talkMaxDuration = var_204_19

					if var_204_19 + var_204_12 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_19 + var_204_12
					end
				end

				arg_201_1.text_.text = var_204_16
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961050", "story_v_out_319961.awb") ~= 0 then
					local var_204_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961050", "story_v_out_319961.awb") / 1000

					if var_204_20 + var_204_12 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_20 + var_204_12
					end

					if var_204_15.prefab_name ~= "" and arg_201_1.actors_[var_204_15.prefab_name] ~= nil then
						local var_204_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_15.prefab_name].transform, "story_v_out_319961", "319961050", "story_v_out_319961.awb")

						arg_201_1:RecordAudio("319961050", var_204_21)
						arg_201_1:RecordAudio("319961050", var_204_21)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_319961", "319961050", "story_v_out_319961.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_319961", "319961050", "story_v_out_319961.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_22 = math.max(var_204_13, arg_201_1.talkMaxDuration)

			if var_204_12 <= arg_201_1.time_ and arg_201_1.time_ < var_204_12 + var_204_22 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_12) / var_204_22

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_12 + var_204_22 and arg_201_1.time_ < var_204_12 + var_204_22 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play319961051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 319961051
		arg_205_1.duration_ = 2.333

		local var_205_0 = {
			zh = 1.999999999999,
			ja = 2.333
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
				arg_205_0:Play319961052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1284ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.characterEffect1284ui_story == nil then
				arg_205_1.var_.characterEffect1284ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.200000002980232

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect1284ui_story then
					arg_205_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect1284ui_story then
				arg_205_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_208_4 = 0

			if var_208_4 < arg_205_1.time_ and arg_205_1.time_ <= var_208_4 + arg_208_0 then
				arg_205_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action5_1")
			end

			local var_208_5 = 0

			if var_208_5 < arg_205_1.time_ and arg_205_1.time_ <= var_208_5 + arg_208_0 then
				arg_205_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_208_6 = arg_205_1.actors_["10014ui_story"]
			local var_208_7 = 0

			if var_208_7 < arg_205_1.time_ and arg_205_1.time_ <= var_208_7 + arg_208_0 and arg_205_1.var_.characterEffect10014ui_story == nil then
				arg_205_1.var_.characterEffect10014ui_story = var_208_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_8 = 0.200000002980232

			if var_208_7 <= arg_205_1.time_ and arg_205_1.time_ < var_208_7 + var_208_8 then
				local var_208_9 = (arg_205_1.time_ - var_208_7) / var_208_8

				if arg_205_1.var_.characterEffect10014ui_story then
					local var_208_10 = Mathf.Lerp(0, 0.5, var_208_9)

					arg_205_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_205_1.var_.characterEffect10014ui_story.fillRatio = var_208_10
				end
			end

			if arg_205_1.time_ >= var_208_7 + var_208_8 and arg_205_1.time_ < var_208_7 + var_208_8 + arg_208_0 and arg_205_1.var_.characterEffect10014ui_story then
				local var_208_11 = 0.5

				arg_205_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_205_1.var_.characterEffect10014ui_story.fillRatio = var_208_11
			end

			local var_208_12 = 0
			local var_208_13 = 0.3

			if var_208_12 < arg_205_1.time_ and arg_205_1.time_ <= var_208_12 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_14 = arg_205_1:FormatText(StoryNameCfg[6].name)

				arg_205_1.leftNameTxt_.text = var_208_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_15 = arg_205_1:GetWordFromCfg(319961051)
				local var_208_16 = arg_205_1:FormatText(var_208_15.content)

				arg_205_1.text_.text = var_208_16

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_17 = 12
				local var_208_18 = utf8.len(var_208_16)
				local var_208_19 = var_208_17 <= 0 and var_208_13 or var_208_13 * (var_208_18 / var_208_17)

				if var_208_19 > 0 and var_208_13 < var_208_19 then
					arg_205_1.talkMaxDuration = var_208_19

					if var_208_19 + var_208_12 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_19 + var_208_12
					end
				end

				arg_205_1.text_.text = var_208_16
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961051", "story_v_out_319961.awb") ~= 0 then
					local var_208_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961051", "story_v_out_319961.awb") / 1000

					if var_208_20 + var_208_12 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_20 + var_208_12
					end

					if var_208_15.prefab_name ~= "" and arg_205_1.actors_[var_208_15.prefab_name] ~= nil then
						local var_208_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_15.prefab_name].transform, "story_v_out_319961", "319961051", "story_v_out_319961.awb")

						arg_205_1:RecordAudio("319961051", var_208_21)
						arg_205_1:RecordAudio("319961051", var_208_21)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_319961", "319961051", "story_v_out_319961.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_319961", "319961051", "story_v_out_319961.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_22 = math.max(var_208_13, arg_205_1.talkMaxDuration)

			if var_208_12 <= arg_205_1.time_ and arg_205_1.time_ < var_208_12 + var_208_22 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_12) / var_208_22

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_12 + var_208_22 and arg_205_1.time_ < var_208_12 + var_208_22 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play319961052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 319961052
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play319961053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1284ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect1284ui_story == nil then
				arg_209_1.var_.characterEffect1284ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.200000002980232

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1284ui_story then
					local var_212_4 = Mathf.Lerp(0, 0.5, var_212_3)

					arg_209_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1284ui_story.fillRatio = var_212_4
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1284ui_story then
				local var_212_5 = 0.5

				arg_209_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1284ui_story.fillRatio = var_212_5
			end

			local var_212_6 = 0
			local var_212_7 = 0.7

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

				local var_212_8 = arg_209_1:GetWordFromCfg(319961052)
				local var_212_9 = arg_209_1:FormatText(var_212_8.content)

				arg_209_1.text_.text = var_212_9

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_10 = 28
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
	Play319961053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 319961053
		arg_213_1.duration_ = 10.6

		local var_213_0 = {
			zh = 4.9,
			ja = 10.6
		}
		local var_213_1 = manager.audio:GetLocalizationFlag()

		if var_213_0[var_213_1] ~= nil then
			arg_213_1.duration_ = var_213_0[var_213_1]
		end

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play319961054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1284ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1284ui_story == nil then
				arg_213_1.var_.characterEffect1284ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1284ui_story then
					arg_213_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1284ui_story then
				arg_213_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_216_4 = 0

			if var_216_4 < arg_213_1.time_ and arg_213_1.time_ <= var_216_4 + arg_216_0 then
				arg_213_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action5_2")
			end

			local var_216_5 = 0

			if var_216_5 < arg_213_1.time_ and arg_213_1.time_ <= var_216_5 + arg_216_0 then
				arg_213_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_216_6 = 0
			local var_216_7 = 0.725

			if var_216_6 < arg_213_1.time_ and arg_213_1.time_ <= var_216_6 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_8 = arg_213_1:FormatText(StoryNameCfg[6].name)

				arg_213_1.leftNameTxt_.text = var_216_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_9 = arg_213_1:GetWordFromCfg(319961053)
				local var_216_10 = arg_213_1:FormatText(var_216_9.content)

				arg_213_1.text_.text = var_216_10

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_11 = 29
				local var_216_12 = utf8.len(var_216_10)
				local var_216_13 = var_216_11 <= 0 and var_216_7 or var_216_7 * (var_216_12 / var_216_11)

				if var_216_13 > 0 and var_216_7 < var_216_13 then
					arg_213_1.talkMaxDuration = var_216_13

					if var_216_13 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_13 + var_216_6
					end
				end

				arg_213_1.text_.text = var_216_10
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961053", "story_v_out_319961.awb") ~= 0 then
					local var_216_14 = manager.audio:GetVoiceLength("story_v_out_319961", "319961053", "story_v_out_319961.awb") / 1000

					if var_216_14 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_14 + var_216_6
					end

					if var_216_9.prefab_name ~= "" and arg_213_1.actors_[var_216_9.prefab_name] ~= nil then
						local var_216_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_9.prefab_name].transform, "story_v_out_319961", "319961053", "story_v_out_319961.awb")

						arg_213_1:RecordAudio("319961053", var_216_15)
						arg_213_1:RecordAudio("319961053", var_216_15)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_319961", "319961053", "story_v_out_319961.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_319961", "319961053", "story_v_out_319961.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_16 = math.max(var_216_7, arg_213_1.talkMaxDuration)

			if var_216_6 <= arg_213_1.time_ and arg_213_1.time_ < var_216_6 + var_216_16 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_6) / var_216_16

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_6 + var_216_16 and arg_213_1.time_ < var_216_6 + var_216_16 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play319961054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 319961054
		arg_217_1.duration_ = 6.066

		local var_217_0 = {
			zh = 6.066,
			ja = 5.4
		}
		local var_217_1 = manager.audio:GetLocalizationFlag()

		if var_217_0[var_217_1] ~= nil then
			arg_217_1.duration_ = var_217_0[var_217_1]
		end

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play319961055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_220_1 = 0
			local var_220_2 = 0.825

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_3 = arg_217_1:FormatText(StoryNameCfg[6].name)

				arg_217_1.leftNameTxt_.text = var_220_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_4 = arg_217_1:GetWordFromCfg(319961054)
				local var_220_5 = arg_217_1:FormatText(var_220_4.content)

				arg_217_1.text_.text = var_220_5

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_6 = 33
				local var_220_7 = utf8.len(var_220_5)
				local var_220_8 = var_220_6 <= 0 and var_220_2 or var_220_2 * (var_220_7 / var_220_6)

				if var_220_8 > 0 and var_220_2 < var_220_8 then
					arg_217_1.talkMaxDuration = var_220_8

					if var_220_8 + var_220_1 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_1
					end
				end

				arg_217_1.text_.text = var_220_5
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961054", "story_v_out_319961.awb") ~= 0 then
					local var_220_9 = manager.audio:GetVoiceLength("story_v_out_319961", "319961054", "story_v_out_319961.awb") / 1000

					if var_220_9 + var_220_1 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_9 + var_220_1
					end

					if var_220_4.prefab_name ~= "" and arg_217_1.actors_[var_220_4.prefab_name] ~= nil then
						local var_220_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_4.prefab_name].transform, "story_v_out_319961", "319961054", "story_v_out_319961.awb")

						arg_217_1:RecordAudio("319961054", var_220_10)
						arg_217_1:RecordAudio("319961054", var_220_10)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_319961", "319961054", "story_v_out_319961.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_319961", "319961054", "story_v_out_319961.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_11 = math.max(var_220_2, arg_217_1.talkMaxDuration)

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_11 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_1) / var_220_11

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_1 + var_220_11 and arg_217_1.time_ < var_220_1 + var_220_11 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play319961055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 319961055
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play319961056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1284ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos1284ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(0, 100, 0)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1284ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0, 100, 0)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = arg_221_1.actors_["10014ui_story"].transform
			local var_224_10 = 0

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 then
				arg_221_1.var_.moveOldPos10014ui_story = var_224_9.localPosition
			end

			local var_224_11 = 0.001

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_10) / var_224_11
				local var_224_13 = Vector3.New(0, 100, 0)

				var_224_9.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10014ui_story, var_224_13, var_224_12)

				local var_224_14 = manager.ui.mainCamera.transform.position - var_224_9.position

				var_224_9.forward = Vector3.New(var_224_14.x, var_224_14.y, var_224_14.z)

				local var_224_15 = var_224_9.localEulerAngles

				var_224_15.z = 0
				var_224_15.x = 0
				var_224_9.localEulerAngles = var_224_15
			end

			if arg_221_1.time_ >= var_224_10 + var_224_11 and arg_221_1.time_ < var_224_10 + var_224_11 + arg_224_0 then
				var_224_9.localPosition = Vector3.New(0, 100, 0)

				local var_224_16 = manager.ui.mainCamera.transform.position - var_224_9.position

				var_224_9.forward = Vector3.New(var_224_16.x, var_224_16.y, var_224_16.z)

				local var_224_17 = var_224_9.localEulerAngles

				var_224_17.z = 0
				var_224_17.x = 0
				var_224_9.localEulerAngles = var_224_17
			end

			local var_224_18 = 0
			local var_224_19 = 1.225

			if var_224_18 < arg_221_1.time_ and arg_221_1.time_ <= var_224_18 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, false)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_20 = arg_221_1:GetWordFromCfg(319961055)
				local var_224_21 = arg_221_1:FormatText(var_224_20.content)

				arg_221_1.text_.text = var_224_21

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_22 = 49
				local var_224_23 = utf8.len(var_224_21)
				local var_224_24 = var_224_22 <= 0 and var_224_19 or var_224_19 * (var_224_23 / var_224_22)

				if var_224_24 > 0 and var_224_19 < var_224_24 then
					arg_221_1.talkMaxDuration = var_224_24

					if var_224_24 + var_224_18 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_24 + var_224_18
					end
				end

				arg_221_1.text_.text = var_224_21
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_25 = math.max(var_224_19, arg_221_1.talkMaxDuration)

			if var_224_18 <= arg_221_1.time_ and arg_221_1.time_ < var_224_18 + var_224_25 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_18) / var_224_25

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_18 + var_224_25 and arg_221_1.time_ < var_224_18 + var_224_25 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play319961056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 319961056
		arg_225_1.duration_ = 2.433

		local var_225_0 = {
			zh = 2.366,
			ja = 2.433
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
				arg_225_0:Play319961057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["10014ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos10014ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(0, -1.06, -6.2)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos10014ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = arg_225_1.actors_["10014ui_story"]
			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 and arg_225_1.var_.characterEffect10014ui_story == nil then
				arg_225_1.var_.characterEffect10014ui_story = var_228_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_11 = 0.200000002980232

			if var_228_10 <= arg_225_1.time_ and arg_225_1.time_ < var_228_10 + var_228_11 then
				local var_228_12 = (arg_225_1.time_ - var_228_10) / var_228_11

				if arg_225_1.var_.characterEffect10014ui_story then
					arg_225_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_10 + var_228_11 and arg_225_1.time_ < var_228_10 + var_228_11 + arg_228_0 and arg_225_1.var_.characterEffect10014ui_story then
				arg_225_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_228_13 = 0

			if var_228_13 < arg_225_1.time_ and arg_225_1.time_ <= var_228_13 + arg_228_0 then
				arg_225_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_228_14 = 0

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 then
				arg_225_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_228_15 = 0
			local var_228_16 = 0.325

			if var_228_15 < arg_225_1.time_ and arg_225_1.time_ <= var_228_15 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_17 = arg_225_1:FormatText(StoryNameCfg[264].name)

				arg_225_1.leftNameTxt_.text = var_228_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_18 = arg_225_1:GetWordFromCfg(319961056)
				local var_228_19 = arg_225_1:FormatText(var_228_18.content)

				arg_225_1.text_.text = var_228_19

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_20 = 13
				local var_228_21 = utf8.len(var_228_19)
				local var_228_22 = var_228_20 <= 0 and var_228_16 or var_228_16 * (var_228_21 / var_228_20)

				if var_228_22 > 0 and var_228_16 < var_228_22 then
					arg_225_1.talkMaxDuration = var_228_22

					if var_228_22 + var_228_15 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_22 + var_228_15
					end
				end

				arg_225_1.text_.text = var_228_19
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961056", "story_v_out_319961.awb") ~= 0 then
					local var_228_23 = manager.audio:GetVoiceLength("story_v_out_319961", "319961056", "story_v_out_319961.awb") / 1000

					if var_228_23 + var_228_15 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_23 + var_228_15
					end

					if var_228_18.prefab_name ~= "" and arg_225_1.actors_[var_228_18.prefab_name] ~= nil then
						local var_228_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_18.prefab_name].transform, "story_v_out_319961", "319961056", "story_v_out_319961.awb")

						arg_225_1:RecordAudio("319961056", var_228_24)
						arg_225_1:RecordAudio("319961056", var_228_24)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_319961", "319961056", "story_v_out_319961.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_319961", "319961056", "story_v_out_319961.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_25 = math.max(var_228_16, arg_225_1.talkMaxDuration)

			if var_228_15 <= arg_225_1.time_ and arg_225_1.time_ < var_228_15 + var_228_25 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_15) / var_228_25

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_15 + var_228_25 and arg_225_1.time_ < var_228_15 + var_228_25 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play319961057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 319961057
		arg_229_1.duration_ = 2.433

		local var_229_0 = {
			zh = 2.233,
			ja = 2.433
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
				arg_229_0:Play319961058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1284ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos1284ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0, -0.985, -6.22)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1284ui_story, var_232_4, var_232_3)

				local var_232_5 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_5.x, var_232_5.y, var_232_5.z)

				local var_232_6 = var_232_0.localEulerAngles

				var_232_6.z = 0
				var_232_6.x = 0
				var_232_0.localEulerAngles = var_232_6
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(0, -0.985, -6.22)

				local var_232_7 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_7.x, var_232_7.y, var_232_7.z)

				local var_232_8 = var_232_0.localEulerAngles

				var_232_8.z = 0
				var_232_8.x = 0
				var_232_0.localEulerAngles = var_232_8
			end

			local var_232_9 = arg_229_1.actors_["1284ui_story"]
			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 and arg_229_1.var_.characterEffect1284ui_story == nil then
				arg_229_1.var_.characterEffect1284ui_story = var_232_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_11 = 0.200000002980232

			if var_232_10 <= arg_229_1.time_ and arg_229_1.time_ < var_232_10 + var_232_11 then
				local var_232_12 = (arg_229_1.time_ - var_232_10) / var_232_11

				if arg_229_1.var_.characterEffect1284ui_story then
					arg_229_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_10 + var_232_11 and arg_229_1.time_ < var_232_10 + var_232_11 + arg_232_0 and arg_229_1.var_.characterEffect1284ui_story then
				arg_229_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_232_13 = 0

			if var_232_13 < arg_229_1.time_ and arg_229_1.time_ <= var_232_13 + arg_232_0 then
				arg_229_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_232_14 = 0

			if var_232_14 < arg_229_1.time_ and arg_229_1.time_ <= var_232_14 + arg_232_0 then
				arg_229_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_232_15 = arg_229_1.actors_["10014ui_story"].transform
			local var_232_16 = 0

			if var_232_16 < arg_229_1.time_ and arg_229_1.time_ <= var_232_16 + arg_232_0 then
				arg_229_1.var_.moveOldPos10014ui_story = var_232_15.localPosition
			end

			local var_232_17 = 0.001

			if var_232_16 <= arg_229_1.time_ and arg_229_1.time_ < var_232_16 + var_232_17 then
				local var_232_18 = (arg_229_1.time_ - var_232_16) / var_232_17
				local var_232_19 = Vector3.New(0, 100, 0)

				var_232_15.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos10014ui_story, var_232_19, var_232_18)

				local var_232_20 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_20.x, var_232_20.y, var_232_20.z)

				local var_232_21 = var_232_15.localEulerAngles

				var_232_21.z = 0
				var_232_21.x = 0
				var_232_15.localEulerAngles = var_232_21
			end

			if arg_229_1.time_ >= var_232_16 + var_232_17 and arg_229_1.time_ < var_232_16 + var_232_17 + arg_232_0 then
				var_232_15.localPosition = Vector3.New(0, 100, 0)

				local var_232_22 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_22.x, var_232_22.y, var_232_22.z)

				local var_232_23 = var_232_15.localEulerAngles

				var_232_23.z = 0
				var_232_23.x = 0
				var_232_15.localEulerAngles = var_232_23
			end

			local var_232_24 = 0
			local var_232_25 = 0.3

			if var_232_24 < arg_229_1.time_ and arg_229_1.time_ <= var_232_24 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_26 = arg_229_1:FormatText(StoryNameCfg[6].name)

				arg_229_1.leftNameTxt_.text = var_232_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_27 = arg_229_1:GetWordFromCfg(319961057)
				local var_232_28 = arg_229_1:FormatText(var_232_27.content)

				arg_229_1.text_.text = var_232_28

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_29 = 12
				local var_232_30 = utf8.len(var_232_28)
				local var_232_31 = var_232_29 <= 0 and var_232_25 or var_232_25 * (var_232_30 / var_232_29)

				if var_232_31 > 0 and var_232_25 < var_232_31 then
					arg_229_1.talkMaxDuration = var_232_31

					if var_232_31 + var_232_24 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_31 + var_232_24
					end
				end

				arg_229_1.text_.text = var_232_28
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961057", "story_v_out_319961.awb") ~= 0 then
					local var_232_32 = manager.audio:GetVoiceLength("story_v_out_319961", "319961057", "story_v_out_319961.awb") / 1000

					if var_232_32 + var_232_24 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_32 + var_232_24
					end

					if var_232_27.prefab_name ~= "" and arg_229_1.actors_[var_232_27.prefab_name] ~= nil then
						local var_232_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_27.prefab_name].transform, "story_v_out_319961", "319961057", "story_v_out_319961.awb")

						arg_229_1:RecordAudio("319961057", var_232_33)
						arg_229_1:RecordAudio("319961057", var_232_33)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_319961", "319961057", "story_v_out_319961.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_319961", "319961057", "story_v_out_319961.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_34 = math.max(var_232_25, arg_229_1.talkMaxDuration)

			if var_232_24 <= arg_229_1.time_ and arg_229_1.time_ < var_232_24 + var_232_34 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_24) / var_232_34

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_24 + var_232_34 and arg_229_1.time_ < var_232_24 + var_232_34 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play319961058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 319961058
		arg_233_1.duration_ = 7.6

		local var_233_0 = {
			zh = 1.999999999999,
			ja = 7.6
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
				arg_233_0:Play319961059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10014ui_story"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos10014ui_story = var_236_0.localPosition
			end

			local var_236_2 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2
				local var_236_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos10014ui_story, var_236_4, var_236_3)

				local var_236_5 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_5.x, var_236_5.y, var_236_5.z)

				local var_236_6 = var_236_0.localEulerAngles

				var_236_6.z = 0
				var_236_6.x = 0
				var_236_0.localEulerAngles = var_236_6
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_236_7 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_7.x, var_236_7.y, var_236_7.z)

				local var_236_8 = var_236_0.localEulerAngles

				var_236_8.z = 0
				var_236_8.x = 0
				var_236_0.localEulerAngles = var_236_8
			end

			local var_236_9 = arg_233_1.actors_["10014ui_story"]
			local var_236_10 = 0

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 and arg_233_1.var_.characterEffect10014ui_story == nil then
				arg_233_1.var_.characterEffect10014ui_story = var_236_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_11 = 0.200000002980232

			if var_236_10 <= arg_233_1.time_ and arg_233_1.time_ < var_236_10 + var_236_11 then
				local var_236_12 = (arg_233_1.time_ - var_236_10) / var_236_11

				if arg_233_1.var_.characterEffect10014ui_story then
					arg_233_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_10 + var_236_11 and arg_233_1.time_ < var_236_10 + var_236_11 + arg_236_0 and arg_233_1.var_.characterEffect10014ui_story then
				arg_233_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_236_13 = 0

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_236_14 = 0

			if var_236_14 < arg_233_1.time_ and arg_233_1.time_ <= var_236_14 + arg_236_0 then
				arg_233_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_236_15 = arg_233_1.actors_["1284ui_story"]
			local var_236_16 = 0

			if var_236_16 < arg_233_1.time_ and arg_233_1.time_ <= var_236_16 + arg_236_0 and arg_233_1.var_.characterEffect1284ui_story == nil then
				arg_233_1.var_.characterEffect1284ui_story = var_236_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_17 = 0.200000002980232

			if var_236_16 <= arg_233_1.time_ and arg_233_1.time_ < var_236_16 + var_236_17 then
				local var_236_18 = (arg_233_1.time_ - var_236_16) / var_236_17

				if arg_233_1.var_.characterEffect1284ui_story then
					local var_236_19 = Mathf.Lerp(0, 0.5, var_236_18)

					arg_233_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1284ui_story.fillRatio = var_236_19
				end
			end

			if arg_233_1.time_ >= var_236_16 + var_236_17 and arg_233_1.time_ < var_236_16 + var_236_17 + arg_236_0 and arg_233_1.var_.characterEffect1284ui_story then
				local var_236_20 = 0.5

				arg_233_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1284ui_story.fillRatio = var_236_20
			end

			local var_236_21 = arg_233_1.actors_["1284ui_story"].transform
			local var_236_22 = 0

			if var_236_22 < arg_233_1.time_ and arg_233_1.time_ <= var_236_22 + arg_236_0 then
				arg_233_1.var_.moveOldPos1284ui_story = var_236_21.localPosition
			end

			local var_236_23 = 0.001

			if var_236_22 <= arg_233_1.time_ and arg_233_1.time_ < var_236_22 + var_236_23 then
				local var_236_24 = (arg_233_1.time_ - var_236_22) / var_236_23
				local var_236_25 = Vector3.New(0.7, -0.985, -6.22)

				var_236_21.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1284ui_story, var_236_25, var_236_24)

				local var_236_26 = manager.ui.mainCamera.transform.position - var_236_21.position

				var_236_21.forward = Vector3.New(var_236_26.x, var_236_26.y, var_236_26.z)

				local var_236_27 = var_236_21.localEulerAngles

				var_236_27.z = 0
				var_236_27.x = 0
				var_236_21.localEulerAngles = var_236_27
			end

			if arg_233_1.time_ >= var_236_22 + var_236_23 and arg_233_1.time_ < var_236_22 + var_236_23 + arg_236_0 then
				var_236_21.localPosition = Vector3.New(0.7, -0.985, -6.22)

				local var_236_28 = manager.ui.mainCamera.transform.position - var_236_21.position

				var_236_21.forward = Vector3.New(var_236_28.x, var_236_28.y, var_236_28.z)

				local var_236_29 = var_236_21.localEulerAngles

				var_236_29.z = 0
				var_236_29.x = 0
				var_236_21.localEulerAngles = var_236_29
			end

			local var_236_30 = 0
			local var_236_31 = 0.225

			if var_236_30 < arg_233_1.time_ and arg_233_1.time_ <= var_236_30 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_32 = arg_233_1:FormatText(StoryNameCfg[264].name)

				arg_233_1.leftNameTxt_.text = var_236_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_33 = arg_233_1:GetWordFromCfg(319961058)
				local var_236_34 = arg_233_1:FormatText(var_236_33.content)

				arg_233_1.text_.text = var_236_34

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_35 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961058", "story_v_out_319961.awb") ~= 0 then
					local var_236_38 = manager.audio:GetVoiceLength("story_v_out_319961", "319961058", "story_v_out_319961.awb") / 1000

					if var_236_38 + var_236_30 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_38 + var_236_30
					end

					if var_236_33.prefab_name ~= "" and arg_233_1.actors_[var_236_33.prefab_name] ~= nil then
						local var_236_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_33.prefab_name].transform, "story_v_out_319961", "319961058", "story_v_out_319961.awb")

						arg_233_1:RecordAudio("319961058", var_236_39)
						arg_233_1:RecordAudio("319961058", var_236_39)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_319961", "319961058", "story_v_out_319961.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_319961", "319961058", "story_v_out_319961.awb")
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
	Play319961059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 319961059
		arg_237_1.duration_ = 1.999999999999

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play319961060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10014ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect10014ui_story == nil then
				arg_237_1.var_.characterEffect10014ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect10014ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_237_1.var_.characterEffect10014ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect10014ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_237_1.var_.characterEffect10014ui_story.fillRatio = var_240_5
			end

			local var_240_6 = 0

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				local var_240_7 = manager.ui.mainCamera.transform.localPosition
				local var_240_8 = Vector3.New(0, 0, 10) + Vector3.New(var_240_7.x, var_240_7.y, 0)
				local var_240_9 = arg_237_1.bgs_.STblack

				var_240_9.transform.localPosition = var_240_8
				var_240_9.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_240_10 = var_240_9:GetComponent("SpriteRenderer")

				if var_240_10 and var_240_10.sprite then
					local var_240_11 = (var_240_9.transform.localPosition - var_240_7).z
					local var_240_12 = manager.ui.mainCameraCom_
					local var_240_13 = 2 * var_240_11 * Mathf.Tan(var_240_12.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_240_14 = var_240_13 * var_240_12.aspect
					local var_240_15 = var_240_10.sprite.bounds.size.x
					local var_240_16 = var_240_10.sprite.bounds.size.y
					local var_240_17 = var_240_14 / var_240_15
					local var_240_18 = var_240_13 / var_240_16
					local var_240_19 = var_240_18 < var_240_17 and var_240_17 or var_240_18

					var_240_9.transform.localScale = Vector3.New(var_240_19, var_240_19, 0)
				end

				for iter_240_0, iter_240_1 in pairs(arg_237_1.bgs_) do
					if iter_240_0 ~= "STblack" then
						iter_240_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_240_20 = 0

			if var_240_20 < arg_237_1.time_ and arg_237_1.time_ <= var_240_20 + arg_240_0 then
				arg_237_1.fswbg_:SetActive(true)
				arg_237_1.dialog_:SetActive(false)

				arg_237_1.fswtw_.percent = 0

				local var_240_21 = arg_237_1:GetWordFromCfg(319961059)
				local var_240_22 = arg_237_1:FormatText(var_240_21.content)

				arg_237_1.fswt_.text = var_240_22

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.fswt_)

				arg_237_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_237_1.fswtw_:SetDirty()

				arg_237_1.typewritterCharCountI18N = 0

				SetActive(arg_237_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_237_1:ShowNextGo(false)
			end

			local var_240_23 = 0.334000001847744

			if var_240_23 < arg_237_1.time_ and arg_237_1.time_ <= var_240_23 + arg_240_0 then
				arg_237_1.var_.oldValueTypewriter = arg_237_1.fswtw_.percent

				arg_237_1:ShowNextGo(false)
			end

			local var_240_24 = 7
			local var_240_25 = 0.466666666666667
			local var_240_26 = arg_237_1:GetWordFromCfg(319961059)
			local var_240_27 = arg_237_1:FormatText(var_240_26.content)
			local var_240_28, var_240_29 = arg_237_1:GetPercentByPara(var_240_27, 1)

			if var_240_23 < arg_237_1.time_ and arg_237_1.time_ <= var_240_23 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0

				local var_240_30 = var_240_24 <= 0 and var_240_25 or var_240_25 * ((var_240_29 - arg_237_1.typewritterCharCountI18N) / var_240_24)

				if var_240_30 > 0 and var_240_25 < var_240_30 then
					arg_237_1.talkMaxDuration = var_240_30

					if var_240_30 + var_240_23 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_30 + var_240_23
					end
				end
			end

			local var_240_31 = 0.466666666666667
			local var_240_32 = math.max(var_240_31, arg_237_1.talkMaxDuration)

			if var_240_23 <= arg_237_1.time_ and arg_237_1.time_ < var_240_23 + var_240_32 then
				local var_240_33 = (arg_237_1.time_ - var_240_23) / var_240_32

				arg_237_1.fswtw_.percent = Mathf.Lerp(arg_237_1.var_.oldValueTypewriter, var_240_28, var_240_33)
				arg_237_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_237_1.fswtw_:SetDirty()
			end

			if arg_237_1.time_ >= var_240_23 + var_240_32 and arg_237_1.time_ < var_240_23 + var_240_32 + arg_240_0 then
				arg_237_1.fswtw_.percent = var_240_28

				arg_237_1.fswtw_:SetDirty()
				arg_237_1:ShowNextGo(true)

				arg_237_1.typewritterCharCountI18N = var_240_29
			end

			local var_240_34 = arg_237_1.actors_["10014ui_story"].transform
			local var_240_35 = 0

			if var_240_35 < arg_237_1.time_ and arg_237_1.time_ <= var_240_35 + arg_240_0 then
				arg_237_1.var_.moveOldPos10014ui_story = var_240_34.localPosition
			end

			local var_240_36 = 0.001

			if var_240_35 <= arg_237_1.time_ and arg_237_1.time_ < var_240_35 + var_240_36 then
				local var_240_37 = (arg_237_1.time_ - var_240_35) / var_240_36
				local var_240_38 = Vector3.New(0, 100, 0)

				var_240_34.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos10014ui_story, var_240_38, var_240_37)

				local var_240_39 = manager.ui.mainCamera.transform.position - var_240_34.position

				var_240_34.forward = Vector3.New(var_240_39.x, var_240_39.y, var_240_39.z)

				local var_240_40 = var_240_34.localEulerAngles

				var_240_40.z = 0
				var_240_40.x = 0
				var_240_34.localEulerAngles = var_240_40
			end

			if arg_237_1.time_ >= var_240_35 + var_240_36 and arg_237_1.time_ < var_240_35 + var_240_36 + arg_240_0 then
				var_240_34.localPosition = Vector3.New(0, 100, 0)

				local var_240_41 = manager.ui.mainCamera.transform.position - var_240_34.position

				var_240_34.forward = Vector3.New(var_240_41.x, var_240_41.y, var_240_41.z)

				local var_240_42 = var_240_34.localEulerAngles

				var_240_42.z = 0
				var_240_42.x = 0
				var_240_34.localEulerAngles = var_240_42
			end

			local var_240_43 = arg_237_1.actors_["1284ui_story"].transform
			local var_240_44 = 0

			if var_240_44 < arg_237_1.time_ and arg_237_1.time_ <= var_240_44 + arg_240_0 then
				arg_237_1.var_.moveOldPos1284ui_story = var_240_43.localPosition
			end

			local var_240_45 = 0.001

			if var_240_44 <= arg_237_1.time_ and arg_237_1.time_ < var_240_44 + var_240_45 then
				local var_240_46 = (arg_237_1.time_ - var_240_44) / var_240_45
				local var_240_47 = Vector3.New(0, 100, 0)

				var_240_43.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos1284ui_story, var_240_47, var_240_46)

				local var_240_48 = manager.ui.mainCamera.transform.position - var_240_43.position

				var_240_43.forward = Vector3.New(var_240_48.x, var_240_48.y, var_240_48.z)

				local var_240_49 = var_240_43.localEulerAngles

				var_240_49.z = 0
				var_240_49.x = 0
				var_240_43.localEulerAngles = var_240_49
			end

			if arg_237_1.time_ >= var_240_44 + var_240_45 and arg_237_1.time_ < var_240_44 + var_240_45 + arg_240_0 then
				var_240_43.localPosition = Vector3.New(0, 100, 0)

				local var_240_50 = manager.ui.mainCamera.transform.position - var_240_43.position

				var_240_43.forward = Vector3.New(var_240_50.x, var_240_50.y, var_240_50.z)

				local var_240_51 = var_240_43.localEulerAngles

				var_240_51.z = 0
				var_240_51.x = 0
				var_240_43.localEulerAngles = var_240_51
			end

			local var_240_52 = 0

			if var_240_52 < arg_237_1.time_ and arg_237_1.time_ <= var_240_52 + arg_240_0 then
				local var_240_53 = arg_237_1.fswbg_.transform:Find("textbox/adapt/content") or arg_237_1.fswbg_.transform:Find("textbox/content")
				local var_240_54 = var_240_53:GetComponent("Text")
				local var_240_55 = var_240_53:GetComponent("RectTransform")

				var_240_54.alignment = UnityEngine.TextAnchor.LowerCenter
				var_240_55.offsetMin = Vector2.New(0, 0)
				var_240_55.offsetMax = Vector2.New(0, 0)
			end

			local var_240_56 = 0

			if var_240_56 < arg_237_1.time_ and arg_237_1.time_ <= var_240_56 + arg_240_0 then
				arg_237_1.cswbg_:SetActive(true)

				local var_240_57 = arg_237_1.cswt_:GetComponent("RectTransform")

				arg_237_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_240_57.offsetMin = Vector2.New(0, 100)
				var_240_57.offsetMax = Vector2.New(0, 0)

				local var_240_58 = arg_237_1:GetWordFromCfg(419086)
				local var_240_59 = arg_237_1:FormatText(var_240_58.content)

				arg_237_1.cswt_.text = var_240_59

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.cswt_)

				arg_237_1.cswt_.fontSize = 155
				arg_237_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_237_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319961060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 319961060
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play319961061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 0.2

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				local var_244_2 = "play"
				local var_244_3 = "music"

				arg_241_1:AudioAction(var_244_2, var_244_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_244_4 = 0

			if var_244_4 < arg_241_1.time_ and arg_241_1.time_ <= var_244_4 + arg_244_0 then
				local var_244_5 = manager.ui.mainCamera.transform.localPosition
				local var_244_6 = Vector3.New(0, 0, 10) + Vector3.New(var_244_5.x, var_244_5.y, 0)
				local var_244_7 = arg_241_1.bgs_.I07

				var_244_7.transform.localPosition = var_244_6
				var_244_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_244_8 = var_244_7:GetComponent("SpriteRenderer")

				if var_244_8 and var_244_8.sprite then
					local var_244_9 = (var_244_7.transform.localPosition - var_244_5).z
					local var_244_10 = manager.ui.mainCameraCom_
					local var_244_11 = 2 * var_244_9 * Mathf.Tan(var_244_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_244_12 = var_244_11 * var_244_10.aspect
					local var_244_13 = var_244_8.sprite.bounds.size.x
					local var_244_14 = var_244_8.sprite.bounds.size.y
					local var_244_15 = var_244_12 / var_244_13
					local var_244_16 = var_244_11 / var_244_14
					local var_244_17 = var_244_16 < var_244_15 and var_244_15 or var_244_16

					var_244_7.transform.localScale = Vector3.New(var_244_17, var_244_17, 0)
				end

				for iter_244_0, iter_244_1 in pairs(arg_241_1.bgs_) do
					if iter_244_0 ~= "I07" then
						iter_244_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_244_18 = 0

			if var_244_18 < arg_241_1.time_ and arg_241_1.time_ <= var_244_18 + arg_244_0 then
				arg_241_1.fswbg_:SetActive(false)
				arg_241_1.dialog_:SetActive(true)
				arg_241_1:ShowNextGo(false)
			end

			local var_244_19 = 0

			if var_244_19 < arg_241_1.time_ and arg_241_1.time_ <= var_244_19 + arg_244_0 then
				arg_241_1.cswbg_:SetActive(false)
			end

			local var_244_20 = 0
			local var_244_21 = 0.425

			if var_244_20 < arg_241_1.time_ and arg_241_1.time_ <= var_244_20 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_22 = arg_241_1:GetWordFromCfg(319961060)
				local var_244_23 = arg_241_1:FormatText(var_244_22.content)

				arg_241_1.text_.text = var_244_23

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_24 = 17
				local var_244_25 = utf8.len(var_244_23)
				local var_244_26 = var_244_24 <= 0 and var_244_21 or var_244_21 * (var_244_25 / var_244_24)

				if var_244_26 > 0 and var_244_21 < var_244_26 then
					arg_241_1.talkMaxDuration = var_244_26

					if var_244_26 + var_244_20 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_26 + var_244_20
					end
				end

				arg_241_1.text_.text = var_244_23
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_27 = math.max(var_244_21, arg_241_1.talkMaxDuration)

			if var_244_20 <= arg_241_1.time_ and arg_241_1.time_ < var_244_20 + var_244_27 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_20) / var_244_27

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_20 + var_244_27 and arg_241_1.time_ < var_244_20 + var_244_27 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play319961061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 319961061
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play319961062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.875

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, false)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_2 = arg_245_1:GetWordFromCfg(319961061)
				local var_248_3 = arg_245_1:FormatText(var_248_2.content)

				arg_245_1.text_.text = var_248_3

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_4 = 35
				local var_248_5 = utf8.len(var_248_3)
				local var_248_6 = var_248_4 <= 0 and var_248_1 or var_248_1 * (var_248_5 / var_248_4)

				if var_248_6 > 0 and var_248_1 < var_248_6 then
					arg_245_1.talkMaxDuration = var_248_6

					if var_248_6 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_6 + var_248_0
					end
				end

				arg_245_1.text_.text = var_248_3
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_7 = math.max(var_248_1, arg_245_1.talkMaxDuration)

			if var_248_0 <= arg_245_1.time_ and arg_245_1.time_ < var_248_0 + var_248_7 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_0) / var_248_7

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_0 + var_248_7 and arg_245_1.time_ < var_248_0 + var_248_7 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play319961062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 319961062
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play319961063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.725

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, false)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_2 = arg_249_1:GetWordFromCfg(319961062)
				local var_252_3 = arg_249_1:FormatText(var_252_2.content)

				arg_249_1.text_.text = var_252_3

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_4 = 29
				local var_252_5 = utf8.len(var_252_3)
				local var_252_6 = var_252_4 <= 0 and var_252_1 or var_252_1 * (var_252_5 / var_252_4)

				if var_252_6 > 0 and var_252_1 < var_252_6 then
					arg_249_1.talkMaxDuration = var_252_6

					if var_252_6 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_6 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_3
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_7 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_7 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_7

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_7 and arg_249_1.time_ < var_252_0 + var_252_7 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play319961063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 319961063
		arg_253_1.duration_ = 1.999999999999

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play319961064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				local var_256_1 = manager.ui.mainCamera.transform.localPosition
				local var_256_2 = Vector3.New(0, 0, 10) + Vector3.New(var_256_1.x, var_256_1.y, 0)
				local var_256_3 = arg_253_1.bgs_.STblack

				var_256_3.transform.localPosition = var_256_2
				var_256_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_256_4 = var_256_3:GetComponent("SpriteRenderer")

				if var_256_4 and var_256_4.sprite then
					local var_256_5 = (var_256_3.transform.localPosition - var_256_1).z
					local var_256_6 = manager.ui.mainCameraCom_
					local var_256_7 = 2 * var_256_5 * Mathf.Tan(var_256_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_256_8 = var_256_7 * var_256_6.aspect
					local var_256_9 = var_256_4.sprite.bounds.size.x
					local var_256_10 = var_256_4.sprite.bounds.size.y
					local var_256_11 = var_256_8 / var_256_9
					local var_256_12 = var_256_7 / var_256_10
					local var_256_13 = var_256_12 < var_256_11 and var_256_11 or var_256_12

					var_256_3.transform.localScale = Vector3.New(var_256_13, var_256_13, 0)
				end

				for iter_256_0, iter_256_1 in pairs(arg_253_1.bgs_) do
					if iter_256_0 ~= "STblack" then
						iter_256_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_256_14 = 0

			if var_256_14 < arg_253_1.time_ and arg_253_1.time_ <= var_256_14 + arg_256_0 then
				arg_253_1.cswbg_:SetActive(true)

				local var_256_15 = arg_253_1.cswt_:GetComponent("RectTransform")

				arg_253_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_256_15.offsetMin = Vector2.New(410, 330)
				var_256_15.offsetMax = Vector2.New(-400, -175)

				local var_256_16 = arg_253_1:GetWordFromCfg(419087)
				local var_256_17 = arg_253_1:FormatText(var_256_16.content)

				arg_253_1.cswt_.text = var_256_17

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.cswt_)

				arg_253_1.cswt_.fontSize = 180
				arg_253_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_253_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_256_18 = 0

			if var_256_18 < arg_253_1.time_ and arg_253_1.time_ <= var_256_18 + arg_256_0 then
				arg_253_1.fswbg_:SetActive(true)
				arg_253_1.dialog_:SetActive(false)

				arg_253_1.fswtw_.percent = 0

				local var_256_19 = arg_253_1:GetWordFromCfg(319961063)
				local var_256_20 = arg_253_1:FormatText(var_256_19.content)

				arg_253_1.fswt_.text = var_256_20

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.fswt_)

				arg_253_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_253_1.fswtw_:SetDirty()

				arg_253_1.typewritterCharCountI18N = 0

				SetActive(arg_253_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_253_1:ShowNextGo(false)
			end

			local var_256_21 = 0.0166666666666667

			if var_256_21 < arg_253_1.time_ and arg_253_1.time_ <= var_256_21 + arg_256_0 then
				arg_253_1.var_.oldValueTypewriter = arg_253_1.fswtw_.percent

				arg_253_1:ShowNextGo(false)
			end

			local var_256_22 = 2
			local var_256_23 = 0.133333333333333
			local var_256_24 = arg_253_1:GetWordFromCfg(319961063)
			local var_256_25 = arg_253_1:FormatText(var_256_24.content)
			local var_256_26, var_256_27 = arg_253_1:GetPercentByPara(var_256_25, 1)

			if var_256_21 < arg_253_1.time_ and arg_253_1.time_ <= var_256_21 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0

				local var_256_28 = var_256_22 <= 0 and var_256_23 or var_256_23 * ((var_256_27 - arg_253_1.typewritterCharCountI18N) / var_256_22)

				if var_256_28 > 0 and var_256_23 < var_256_28 then
					arg_253_1.talkMaxDuration = var_256_28

					if var_256_28 + var_256_21 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_28 + var_256_21
					end
				end
			end

			local var_256_29 = 0.133333333333333
			local var_256_30 = math.max(var_256_29, arg_253_1.talkMaxDuration)

			if var_256_21 <= arg_253_1.time_ and arg_253_1.time_ < var_256_21 + var_256_30 then
				local var_256_31 = (arg_253_1.time_ - var_256_21) / var_256_30

				arg_253_1.fswtw_.percent = Mathf.Lerp(arg_253_1.var_.oldValueTypewriter, var_256_26, var_256_31)
				arg_253_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_253_1.fswtw_:SetDirty()
			end

			if arg_253_1.time_ >= var_256_21 + var_256_30 and arg_253_1.time_ < var_256_21 + var_256_30 + arg_256_0 then
				arg_253_1.fswtw_.percent = var_256_26

				arg_253_1.fswtw_:SetDirty()
				arg_253_1:ShowNextGo(true)

				arg_253_1.typewritterCharCountI18N = var_256_27
			end

			local var_256_32 = 0

			if var_256_32 < arg_253_1.time_ and arg_253_1.time_ <= var_256_32 + arg_256_0 then
				local var_256_33 = arg_253_1.fswbg_.transform:Find("textbox/adapt/content") or arg_253_1.fswbg_.transform:Find("textbox/content")
				local var_256_34 = var_256_33:GetComponent("Text")
				local var_256_35 = var_256_33:GetComponent("RectTransform")

				var_256_34.alignment = UnityEngine.TextAnchor.LowerCenter
				var_256_35.offsetMin = Vector2.New(0, 0)
				var_256_35.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play319961064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 319961064
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play319961065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.cswbg_:SetActive(false)
			end

			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 then
				arg_257_1.fswbg_:SetActive(false)
				arg_257_1.dialog_:SetActive(true)
				arg_257_1:ShowNextGo(false)
			end

			local var_260_2 = 0
			local var_260_3 = 1.075

			if var_260_2 < arg_257_1.time_ and arg_257_1.time_ <= var_260_2 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, false)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_4 = arg_257_1:GetWordFromCfg(319961064)
				local var_260_5 = arg_257_1:FormatText(var_260_4.content)

				arg_257_1.text_.text = var_260_5

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_6 = 43
				local var_260_7 = utf8.len(var_260_5)
				local var_260_8 = var_260_6 <= 0 and var_260_3 or var_260_3 * (var_260_7 / var_260_6)

				if var_260_8 > 0 and var_260_3 < var_260_8 then
					arg_257_1.talkMaxDuration = var_260_8

					if var_260_8 + var_260_2 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_2
					end
				end

				arg_257_1.text_.text = var_260_5
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_9 = math.max(var_260_3, arg_257_1.talkMaxDuration)

			if var_260_2 <= arg_257_1.time_ and arg_257_1.time_ < var_260_2 + var_260_9 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_2) / var_260_9

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_2 + var_260_9 and arg_257_1.time_ < var_260_2 + var_260_9 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play319961065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 319961065
		arg_261_1.duration_ = 3.9

		local var_261_0 = {
			zh = 1.999999999999,
			ja = 3.9
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
				arg_261_0:Play319961066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.2

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				local var_264_2 = "play"
				local var_264_3 = "music"

				arg_261_1:AudioAction(var_264_2, var_264_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_264_4 = 0.233333333333333
			local var_264_5 = 1

			if var_264_4 < arg_261_1.time_ and arg_261_1.time_ <= var_264_4 + arg_264_0 then
				local var_264_6 = "play"
				local var_264_7 = "music"

				arg_261_1:AudioAction(var_264_6, var_264_7, "bgm_activity_3_0_story_theme_orgel", "bgm_activity_3_0_story_theme_orgel", "bgm_activity_3_0_story_theme_orgel.awb")
			end

			local var_264_8 = arg_261_1.actors_["1284ui_story"].transform
			local var_264_9 = 0

			if var_264_9 < arg_261_1.time_ and arg_261_1.time_ <= var_264_9 + arg_264_0 then
				arg_261_1.var_.moveOldPos1284ui_story = var_264_8.localPosition
			end

			local var_264_10 = 0.001

			if var_264_9 <= arg_261_1.time_ and arg_261_1.time_ < var_264_9 + var_264_10 then
				local var_264_11 = (arg_261_1.time_ - var_264_9) / var_264_10
				local var_264_12 = Vector3.New(0, -0.985, -6.22)

				var_264_8.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1284ui_story, var_264_12, var_264_11)

				local var_264_13 = manager.ui.mainCamera.transform.position - var_264_8.position

				var_264_8.forward = Vector3.New(var_264_13.x, var_264_13.y, var_264_13.z)

				local var_264_14 = var_264_8.localEulerAngles

				var_264_14.z = 0
				var_264_14.x = 0
				var_264_8.localEulerAngles = var_264_14
			end

			if arg_261_1.time_ >= var_264_9 + var_264_10 and arg_261_1.time_ < var_264_9 + var_264_10 + arg_264_0 then
				var_264_8.localPosition = Vector3.New(0, -0.985, -6.22)

				local var_264_15 = manager.ui.mainCamera.transform.position - var_264_8.position

				var_264_8.forward = Vector3.New(var_264_15.x, var_264_15.y, var_264_15.z)

				local var_264_16 = var_264_8.localEulerAngles

				var_264_16.z = 0
				var_264_16.x = 0
				var_264_8.localEulerAngles = var_264_16
			end

			local var_264_17 = 0

			if var_264_17 < arg_261_1.time_ and arg_261_1.time_ <= var_264_17 + arg_264_0 then
				arg_261_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_264_18 = 0

			if var_264_18 < arg_261_1.time_ and arg_261_1.time_ <= var_264_18 + arg_264_0 then
				arg_261_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_264_19 = arg_261_1.actors_["1284ui_story"]
			local var_264_20 = 0

			if var_264_20 < arg_261_1.time_ and arg_261_1.time_ <= var_264_20 + arg_264_0 and arg_261_1.var_.characterEffect1284ui_story == nil then
				arg_261_1.var_.characterEffect1284ui_story = var_264_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_21 = 0.2

			if var_264_20 <= arg_261_1.time_ and arg_261_1.time_ < var_264_20 + var_264_21 then
				local var_264_22 = (arg_261_1.time_ - var_264_20) / var_264_21

				if arg_261_1.var_.characterEffect1284ui_story then
					arg_261_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_20 + var_264_21 and arg_261_1.time_ < var_264_20 + var_264_21 + arg_264_0 and arg_261_1.var_.characterEffect1284ui_story then
				arg_261_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_264_23 = 0
			local var_264_24 = 0.125

			if var_264_23 < arg_261_1.time_ and arg_261_1.time_ <= var_264_23 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0

				arg_261_1.dialog_:SetActive(true)

				local var_264_25 = LeanTween.value(arg_261_1.dialog_, 0, 1, 0.3)

				var_264_25:setOnUpdate(LuaHelper.FloatAction(function(arg_265_0)
					arg_261_1.dialogCg_.alpha = arg_265_0
				end))
				var_264_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_261_1.dialog_)
					var_264_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_261_1.duration_ = arg_261_1.duration_ + 0.3

				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_26 = arg_261_1:FormatText(StoryNameCfg[6].name)

				arg_261_1.leftNameTxt_.text = var_264_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_27 = arg_261_1:GetWordFromCfg(319961065)
				local var_264_28 = arg_261_1:FormatText(var_264_27.content)

				arg_261_1.text_.text = var_264_28

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_29 = 5
				local var_264_30 = utf8.len(var_264_28)
				local var_264_31 = var_264_29 <= 0 and var_264_24 or var_264_24 * (var_264_30 / var_264_29)

				if var_264_31 > 0 and var_264_24 < var_264_31 then
					arg_261_1.talkMaxDuration = var_264_31
					var_264_23 = var_264_23 + 0.3

					if var_264_31 + var_264_23 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_31 + var_264_23
					end
				end

				arg_261_1.text_.text = var_264_28
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961065", "story_v_out_319961.awb") ~= 0 then
					local var_264_32 = manager.audio:GetVoiceLength("story_v_out_319961", "319961065", "story_v_out_319961.awb") / 1000

					if var_264_32 + var_264_23 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_32 + var_264_23
					end

					if var_264_27.prefab_name ~= "" and arg_261_1.actors_[var_264_27.prefab_name] ~= nil then
						local var_264_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_27.prefab_name].transform, "story_v_out_319961", "319961065", "story_v_out_319961.awb")

						arg_261_1:RecordAudio("319961065", var_264_33)
						arg_261_1:RecordAudio("319961065", var_264_33)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_319961", "319961065", "story_v_out_319961.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_319961", "319961065", "story_v_out_319961.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_34 = var_264_23 + 0.3
			local var_264_35 = math.max(var_264_24, arg_261_1.talkMaxDuration)

			if var_264_34 <= arg_261_1.time_ and arg_261_1.time_ < var_264_34 + var_264_35 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_34) / var_264_35

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_34 + var_264_35 and arg_261_1.time_ < var_264_34 + var_264_35 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play319961066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 319961066
		arg_267_1.duration_ = 3.9

		local var_267_0 = {
			zh = 2.633,
			ja = 3.9
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
				arg_267_0:Play319961067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_1")
			end

			local var_270_2 = 0
			local var_270_3 = 0.2

			if var_270_2 < arg_267_1.time_ and arg_267_1.time_ <= var_270_2 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_4 = arg_267_1:FormatText(StoryNameCfg[6].name)

				arg_267_1.leftNameTxt_.text = var_270_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_5 = arg_267_1:GetWordFromCfg(319961066)
				local var_270_6 = arg_267_1:FormatText(var_270_5.content)

				arg_267_1.text_.text = var_270_6

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_7 = 8
				local var_270_8 = utf8.len(var_270_6)
				local var_270_9 = var_270_7 <= 0 and var_270_3 or var_270_3 * (var_270_8 / var_270_7)

				if var_270_9 > 0 and var_270_3 < var_270_9 then
					arg_267_1.talkMaxDuration = var_270_9

					if var_270_9 + var_270_2 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_9 + var_270_2
					end
				end

				arg_267_1.text_.text = var_270_6
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961066", "story_v_out_319961.awb") ~= 0 then
					local var_270_10 = manager.audio:GetVoiceLength("story_v_out_319961", "319961066", "story_v_out_319961.awb") / 1000

					if var_270_10 + var_270_2 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_10 + var_270_2
					end

					if var_270_5.prefab_name ~= "" and arg_267_1.actors_[var_270_5.prefab_name] ~= nil then
						local var_270_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_5.prefab_name].transform, "story_v_out_319961", "319961066", "story_v_out_319961.awb")

						arg_267_1:RecordAudio("319961066", var_270_11)
						arg_267_1:RecordAudio("319961066", var_270_11)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_319961", "319961066", "story_v_out_319961.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_319961", "319961066", "story_v_out_319961.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_12 = math.max(var_270_3, arg_267_1.talkMaxDuration)

			if var_270_2 <= arg_267_1.time_ and arg_267_1.time_ < var_270_2 + var_270_12 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_2) / var_270_12

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_2 + var_270_12 and arg_267_1.time_ < var_270_2 + var_270_12 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play319961067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 319961067
		arg_271_1.duration_ = 0.799999999999

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"

			SetActive(arg_271_1.choicesGo_, true)

			for iter_272_0, iter_272_1 in ipairs(arg_271_1.choices_) do
				local var_272_0 = iter_272_0 <= 1

				SetActive(iter_272_1.go, var_272_0)
			end

			arg_271_1.choices_[1].txt.text = arg_271_1:FormatText(StoryChoiceCfg[800].name)
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play319961068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.allBtn_.enabled = false
			end

			local var_274_1 = 0.6

			if arg_271_1.time_ >= var_274_0 + var_274_1 and arg_271_1.time_ < var_274_0 + var_274_1 + arg_274_0 then
				arg_271_1.allBtn_.enabled = true
			end

			local var_274_2 = arg_271_1.actors_["1284ui_story"]
			local var_274_3 = 0

			if var_274_3 < arg_271_1.time_ and arg_271_1.time_ <= var_274_3 + arg_274_0 and arg_271_1.var_.characterEffect1284ui_story == nil then
				arg_271_1.var_.characterEffect1284ui_story = var_274_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_4 = 0.2

			if var_274_3 <= arg_271_1.time_ and arg_271_1.time_ < var_274_3 + var_274_4 then
				local var_274_5 = (arg_271_1.time_ - var_274_3) / var_274_4

				if arg_271_1.var_.characterEffect1284ui_story then
					local var_274_6 = Mathf.Lerp(0, 0.5, var_274_5)

					arg_271_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1284ui_story.fillRatio = var_274_6
				end
			end

			if arg_271_1.time_ >= var_274_3 + var_274_4 and arg_271_1.time_ < var_274_3 + var_274_4 + arg_274_0 and arg_271_1.var_.characterEffect1284ui_story then
				local var_274_7 = 0.5

				arg_271_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1284ui_story.fillRatio = var_274_7
			end
		end
	end,
	Play319961068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 319961068
		arg_275_1.duration_ = 7.833

		local var_275_0 = {
			zh = 4.933,
			ja = 7.833
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
				arg_275_0:Play319961069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1284ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect1284ui_story == nil then
				arg_275_1.var_.characterEffect1284ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.2

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect1284ui_story then
					arg_275_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect1284ui_story then
				arg_275_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_278_4 = 0

			if var_278_4 < arg_275_1.time_ and arg_275_1.time_ <= var_278_4 + arg_278_0 then
				arg_275_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_2")
			end

			local var_278_5 = 0
			local var_278_6 = 0.425

			if var_278_5 < arg_275_1.time_ and arg_275_1.time_ <= var_278_5 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_7 = arg_275_1:FormatText(StoryNameCfg[6].name)

				arg_275_1.leftNameTxt_.text = var_278_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_8 = arg_275_1:GetWordFromCfg(319961068)
				local var_278_9 = arg_275_1:FormatText(var_278_8.content)

				arg_275_1.text_.text = var_278_9

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_10 = 17
				local var_278_11 = utf8.len(var_278_9)
				local var_278_12 = var_278_10 <= 0 and var_278_6 or var_278_6 * (var_278_11 / var_278_10)

				if var_278_12 > 0 and var_278_6 < var_278_12 then
					arg_275_1.talkMaxDuration = var_278_12

					if var_278_12 + var_278_5 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_12 + var_278_5
					end
				end

				arg_275_1.text_.text = var_278_9
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961068", "story_v_out_319961.awb") ~= 0 then
					local var_278_13 = manager.audio:GetVoiceLength("story_v_out_319961", "319961068", "story_v_out_319961.awb") / 1000

					if var_278_13 + var_278_5 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_13 + var_278_5
					end

					if var_278_8.prefab_name ~= "" and arg_275_1.actors_[var_278_8.prefab_name] ~= nil then
						local var_278_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_8.prefab_name].transform, "story_v_out_319961", "319961068", "story_v_out_319961.awb")

						arg_275_1:RecordAudio("319961068", var_278_14)
						arg_275_1:RecordAudio("319961068", var_278_14)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_319961", "319961068", "story_v_out_319961.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_319961", "319961068", "story_v_out_319961.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_15 = math.max(var_278_6, arg_275_1.talkMaxDuration)

			if var_278_5 <= arg_275_1.time_ and arg_275_1.time_ < var_278_5 + var_278_15 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_5) / var_278_15

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_5 + var_278_15 and arg_275_1.time_ < var_278_5 + var_278_15 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play319961069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 319961069
		arg_279_1.duration_ = 5.266

		local var_279_0 = {
			zh = 2.3,
			ja = 5.266
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
				arg_279_0:Play319961070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_282_1 = 0
			local var_282_2 = 0.225

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_3 = arg_279_1:FormatText(StoryNameCfg[6].name)

				arg_279_1.leftNameTxt_.text = var_282_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_4 = arg_279_1:GetWordFromCfg(319961069)
				local var_282_5 = arg_279_1:FormatText(var_282_4.content)

				arg_279_1.text_.text = var_282_5

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_6 = 9
				local var_282_7 = utf8.len(var_282_5)
				local var_282_8 = var_282_6 <= 0 and var_282_2 or var_282_2 * (var_282_7 / var_282_6)

				if var_282_8 > 0 and var_282_2 < var_282_8 then
					arg_279_1.talkMaxDuration = var_282_8

					if var_282_8 + var_282_1 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_8 + var_282_1
					end
				end

				arg_279_1.text_.text = var_282_5
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961069", "story_v_out_319961.awb") ~= 0 then
					local var_282_9 = manager.audio:GetVoiceLength("story_v_out_319961", "319961069", "story_v_out_319961.awb") / 1000

					if var_282_9 + var_282_1 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_9 + var_282_1
					end

					if var_282_4.prefab_name ~= "" and arg_279_1.actors_[var_282_4.prefab_name] ~= nil then
						local var_282_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_4.prefab_name].transform, "story_v_out_319961", "319961069", "story_v_out_319961.awb")

						arg_279_1:RecordAudio("319961069", var_282_10)
						arg_279_1:RecordAudio("319961069", var_282_10)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_319961", "319961069", "story_v_out_319961.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_319961", "319961069", "story_v_out_319961.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_11 = math.max(var_282_2, arg_279_1.talkMaxDuration)

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_11 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_1) / var_282_11

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_1 + var_282_11 and arg_279_1.time_ < var_282_1 + var_282_11 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play319961070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 319961070
		arg_283_1.duration_ = 0.999999999999

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"

			SetActive(arg_283_1.choicesGo_, true)

			for iter_284_0, iter_284_1 in ipairs(arg_283_1.choices_) do
				local var_284_0 = iter_284_0 <= 1

				SetActive(iter_284_1.go, var_284_0)
			end

			arg_283_1.choices_[1].txt.text = arg_283_1:FormatText(StoryChoiceCfg[801].name)
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play319961071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.allBtn_.enabled = false
			end

			local var_286_1 = 0.999999999999

			if arg_283_1.time_ >= var_286_0 + var_286_1 and arg_283_1.time_ < var_286_0 + var_286_1 + arg_286_0 then
				arg_283_1.allBtn_.enabled = true
			end

			local var_286_2 = arg_283_1.actors_["1284ui_story"]
			local var_286_3 = 0

			if var_286_3 < arg_283_1.time_ and arg_283_1.time_ <= var_286_3 + arg_286_0 and arg_283_1.var_.characterEffect1284ui_story == nil then
				arg_283_1.var_.characterEffect1284ui_story = var_286_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_4 = 0.2

			if var_286_3 <= arg_283_1.time_ and arg_283_1.time_ < var_286_3 + var_286_4 then
				local var_286_5 = (arg_283_1.time_ - var_286_3) / var_286_4

				if arg_283_1.var_.characterEffect1284ui_story then
					local var_286_6 = Mathf.Lerp(0, 0.5, var_286_5)

					arg_283_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1284ui_story.fillRatio = var_286_6
				end
			end

			if arg_283_1.time_ >= var_286_3 + var_286_4 and arg_283_1.time_ < var_286_3 + var_286_4 + arg_286_0 and arg_283_1.var_.characterEffect1284ui_story then
				local var_286_7 = 0.5

				arg_283_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1284ui_story.fillRatio = var_286_7
			end
		end
	end,
	Play319961071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 319961071
		arg_287_1.duration_ = 2.6

		local var_287_0 = {
			zh = 1.999999999999,
			ja = 2.6
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
				arg_287_0:Play319961072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1284ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1284ui_story == nil then
				arg_287_1.var_.characterEffect1284ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.2

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1284ui_story then
					arg_287_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1284ui_story then
				arg_287_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_290_4 = 0

			if var_290_4 < arg_287_1.time_ and arg_287_1.time_ <= var_290_4 + arg_290_0 then
				arg_287_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_290_5 = 0
			local var_290_6 = 0.125

			if var_290_5 < arg_287_1.time_ and arg_287_1.time_ <= var_290_5 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_7 = arg_287_1:FormatText(StoryNameCfg[6].name)

				arg_287_1.leftNameTxt_.text = var_290_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_8 = arg_287_1:GetWordFromCfg(319961071)
				local var_290_9 = arg_287_1:FormatText(var_290_8.content)

				arg_287_1.text_.text = var_290_9

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_10 = 5
				local var_290_11 = utf8.len(var_290_9)
				local var_290_12 = var_290_10 <= 0 and var_290_6 or var_290_6 * (var_290_11 / var_290_10)

				if var_290_12 > 0 and var_290_6 < var_290_12 then
					arg_287_1.talkMaxDuration = var_290_12

					if var_290_12 + var_290_5 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_12 + var_290_5
					end
				end

				arg_287_1.text_.text = var_290_9
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961071", "story_v_out_319961.awb") ~= 0 then
					local var_290_13 = manager.audio:GetVoiceLength("story_v_out_319961", "319961071", "story_v_out_319961.awb") / 1000

					if var_290_13 + var_290_5 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_13 + var_290_5
					end

					if var_290_8.prefab_name ~= "" and arg_287_1.actors_[var_290_8.prefab_name] ~= nil then
						local var_290_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_8.prefab_name].transform, "story_v_out_319961", "319961071", "story_v_out_319961.awb")

						arg_287_1:RecordAudio("319961071", var_290_14)
						arg_287_1:RecordAudio("319961071", var_290_14)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_319961", "319961071", "story_v_out_319961.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_319961", "319961071", "story_v_out_319961.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_15 = math.max(var_290_6, arg_287_1.talkMaxDuration)

			if var_290_5 <= arg_287_1.time_ and arg_287_1.time_ < var_290_5 + var_290_15 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_5) / var_290_15

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_5 + var_290_15 and arg_287_1.time_ < var_290_5 + var_290_15 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play319961072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 319961072
		arg_291_1.duration_ = 0.999999999999

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"

			SetActive(arg_291_1.choicesGo_, true)

			for iter_292_0, iter_292_1 in ipairs(arg_291_1.choices_) do
				local var_292_0 = iter_292_0 <= 1

				SetActive(iter_292_1.go, var_292_0)
			end

			arg_291_1.choices_[1].txt.text = arg_291_1:FormatText(StoryChoiceCfg[802].name)
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play319961073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.allBtn_.enabled = false
			end

			local var_294_1 = 0.6

			if arg_291_1.time_ >= var_294_0 + var_294_1 and arg_291_1.time_ < var_294_0 + var_294_1 + arg_294_0 then
				arg_291_1.allBtn_.enabled = true
			end

			local var_294_2 = arg_291_1.actors_["1284ui_story"]
			local var_294_3 = 0

			if var_294_3 < arg_291_1.time_ and arg_291_1.time_ <= var_294_3 + arg_294_0 and arg_291_1.var_.characterEffect1284ui_story == nil then
				arg_291_1.var_.characterEffect1284ui_story = var_294_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_4 = 0.2

			if var_294_3 <= arg_291_1.time_ and arg_291_1.time_ < var_294_3 + var_294_4 then
				local var_294_5 = (arg_291_1.time_ - var_294_3) / var_294_4

				if arg_291_1.var_.characterEffect1284ui_story then
					local var_294_6 = Mathf.Lerp(0, 0.5, var_294_5)

					arg_291_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1284ui_story.fillRatio = var_294_6
				end
			end

			if arg_291_1.time_ >= var_294_3 + var_294_4 and arg_291_1.time_ < var_294_3 + var_294_4 + arg_294_0 and arg_291_1.var_.characterEffect1284ui_story then
				local var_294_7 = 0.5

				arg_291_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1284ui_story.fillRatio = var_294_7
			end
		end
	end,
	Play319961073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 319961073
		arg_295_1.duration_ = 0.999999999999

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"

			SetActive(arg_295_1.choicesGo_, true)

			for iter_296_0, iter_296_1 in ipairs(arg_295_1.choices_) do
				local var_296_0 = iter_296_0 <= 1

				SetActive(iter_296_1.go, var_296_0)
			end

			arg_295_1.choices_[1].txt.text = arg_295_1:FormatText(StoryChoiceCfg[803].name)
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play319961074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.allBtn_.enabled = false
			end

			local var_298_1 = 0.6

			if arg_295_1.time_ >= var_298_0 + var_298_1 and arg_295_1.time_ < var_298_0 + var_298_1 + arg_298_0 then
				arg_295_1.allBtn_.enabled = true
			end
		end
	end,
	Play319961074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 319961074
		arg_299_1.duration_ = 6.4

		local var_299_0 = {
			zh = 6.1,
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
				arg_299_0:Play319961075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1284ui_story"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.characterEffect1284ui_story == nil then
				arg_299_1.var_.characterEffect1284ui_story = var_302_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_2 = 0.2

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.characterEffect1284ui_story then
					arg_299_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect1284ui_story then
				arg_299_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_302_4 = 0

			if var_302_4 < arg_299_1.time_ and arg_299_1.time_ <= var_302_4 + arg_302_0 then
				arg_299_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action5_1")
			end

			local var_302_5 = 0
			local var_302_6 = 0.575

			if var_302_5 < arg_299_1.time_ and arg_299_1.time_ <= var_302_5 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_7 = arg_299_1:FormatText(StoryNameCfg[6].name)

				arg_299_1.leftNameTxt_.text = var_302_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_8 = arg_299_1:GetWordFromCfg(319961074)
				local var_302_9 = arg_299_1:FormatText(var_302_8.content)

				arg_299_1.text_.text = var_302_9

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_10 = 23
				local var_302_11 = utf8.len(var_302_9)
				local var_302_12 = var_302_10 <= 0 and var_302_6 or var_302_6 * (var_302_11 / var_302_10)

				if var_302_12 > 0 and var_302_6 < var_302_12 then
					arg_299_1.talkMaxDuration = var_302_12

					if var_302_12 + var_302_5 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_12 + var_302_5
					end
				end

				arg_299_1.text_.text = var_302_9
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961074", "story_v_out_319961.awb") ~= 0 then
					local var_302_13 = manager.audio:GetVoiceLength("story_v_out_319961", "319961074", "story_v_out_319961.awb") / 1000

					if var_302_13 + var_302_5 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_13 + var_302_5
					end

					if var_302_8.prefab_name ~= "" and arg_299_1.actors_[var_302_8.prefab_name] ~= nil then
						local var_302_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_8.prefab_name].transform, "story_v_out_319961", "319961074", "story_v_out_319961.awb")

						arg_299_1:RecordAudio("319961074", var_302_14)
						arg_299_1:RecordAudio("319961074", var_302_14)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_319961", "319961074", "story_v_out_319961.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_319961", "319961074", "story_v_out_319961.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_15 = math.max(var_302_6, arg_299_1.talkMaxDuration)

			if var_302_5 <= arg_299_1.time_ and arg_299_1.time_ < var_302_5 + var_302_15 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_5) / var_302_15

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_5 + var_302_15 and arg_299_1.time_ < var_302_5 + var_302_15 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play319961075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 319961075
		arg_303_1.duration_ = 6

		local var_303_0 = {
			zh = 4.8,
			ja = 6
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
				arg_303_0:Play319961076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284actionlink/1284action459")
			end

			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_306_2 = 0
			local var_306_3 = 0.0329999998211861

			if var_306_2 < arg_303_1.time_ and arg_303_1.time_ <= var_306_2 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_4 = arg_303_1:FormatText(StoryNameCfg[6].name)

				arg_303_1.leftNameTxt_.text = var_306_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_5 = arg_303_1:GetWordFromCfg(319961075)
				local var_306_6 = arg_303_1:FormatText(var_306_5.content)

				arg_303_1.text_.text = var_306_6

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_7 = 18
				local var_306_8 = utf8.len(var_306_6)
				local var_306_9 = var_306_7 <= 0 and var_306_3 or var_306_3 * (var_306_8 / var_306_7)

				if var_306_9 > 0 and var_306_3 < var_306_9 then
					arg_303_1.talkMaxDuration = var_306_9

					if var_306_9 + var_306_2 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_9 + var_306_2
					end
				end

				arg_303_1.text_.text = var_306_6
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961075", "story_v_out_319961.awb") ~= 0 then
					local var_306_10 = manager.audio:GetVoiceLength("story_v_out_319961", "319961075", "story_v_out_319961.awb") / 1000

					if var_306_10 + var_306_2 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_10 + var_306_2
					end

					if var_306_5.prefab_name ~= "" and arg_303_1.actors_[var_306_5.prefab_name] ~= nil then
						local var_306_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_5.prefab_name].transform, "story_v_out_319961", "319961075", "story_v_out_319961.awb")

						arg_303_1:RecordAudio("319961075", var_306_11)
						arg_303_1:RecordAudio("319961075", var_306_11)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_319961", "319961075", "story_v_out_319961.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_319961", "319961075", "story_v_out_319961.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_12 = math.max(var_306_3, arg_303_1.talkMaxDuration)

			if var_306_2 <= arg_303_1.time_ and arg_303_1.time_ < var_306_2 + var_306_12 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_2) / var_306_12

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_2 + var_306_12 and arg_303_1.time_ < var_306_2 + var_306_12 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play319961076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 319961076
		arg_307_1.duration_ = 8.7

		local var_307_0 = {
			zh = 6.4,
			ja = 8.7
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
				arg_307_0:Play319961077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 0.55

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_2 = arg_307_1:FormatText(StoryNameCfg[6].name)

				arg_307_1.leftNameTxt_.text = var_310_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_3 = arg_307_1:GetWordFromCfg(319961076)
				local var_310_4 = arg_307_1:FormatText(var_310_3.content)

				arg_307_1.text_.text = var_310_4

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_5 = 22
				local var_310_6 = utf8.len(var_310_4)
				local var_310_7 = var_310_5 <= 0 and var_310_1 or var_310_1 * (var_310_6 / var_310_5)

				if var_310_7 > 0 and var_310_1 < var_310_7 then
					arg_307_1.talkMaxDuration = var_310_7

					if var_310_7 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_7 + var_310_0
					end
				end

				arg_307_1.text_.text = var_310_4
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961076", "story_v_out_319961.awb") ~= 0 then
					local var_310_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961076", "story_v_out_319961.awb") / 1000

					if var_310_8 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_8 + var_310_0
					end

					if var_310_3.prefab_name ~= "" and arg_307_1.actors_[var_310_3.prefab_name] ~= nil then
						local var_310_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_3.prefab_name].transform, "story_v_out_319961", "319961076", "story_v_out_319961.awb")

						arg_307_1:RecordAudio("319961076", var_310_9)
						arg_307_1:RecordAudio("319961076", var_310_9)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_319961", "319961076", "story_v_out_319961.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_319961", "319961076", "story_v_out_319961.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_10 = math.max(var_310_1, arg_307_1.talkMaxDuration)

			if var_310_0 <= arg_307_1.time_ and arg_307_1.time_ < var_310_0 + var_310_10 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_0) / var_310_10

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_0 + var_310_10 and arg_307_1.time_ < var_310_0 + var_310_10 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play319961077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 319961077
		arg_311_1.duration_ = 0.999999999999

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"

			SetActive(arg_311_1.choicesGo_, true)

			for iter_312_0, iter_312_1 in ipairs(arg_311_1.choices_) do
				local var_312_0 = iter_312_0 <= 1

				SetActive(iter_312_1.go, var_312_0)
			end

			arg_311_1.choices_[1].txt.text = arg_311_1:FormatText(StoryChoiceCfg[804].name)
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play319961078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.allBtn_.enabled = false
			end

			local var_314_1 = 0.6

			if arg_311_1.time_ >= var_314_0 + var_314_1 and arg_311_1.time_ < var_314_0 + var_314_1 + arg_314_0 then
				arg_311_1.allBtn_.enabled = true
			end

			local var_314_2 = arg_311_1.actors_["1284ui_story"]
			local var_314_3 = 0

			if var_314_3 < arg_311_1.time_ and arg_311_1.time_ <= var_314_3 + arg_314_0 and arg_311_1.var_.characterEffect1284ui_story == nil then
				arg_311_1.var_.characterEffect1284ui_story = var_314_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_4 = 0.2

			if var_314_3 <= arg_311_1.time_ and arg_311_1.time_ < var_314_3 + var_314_4 then
				local var_314_5 = (arg_311_1.time_ - var_314_3) / var_314_4

				if arg_311_1.var_.characterEffect1284ui_story then
					local var_314_6 = Mathf.Lerp(0, 0.5, var_314_5)

					arg_311_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1284ui_story.fillRatio = var_314_6
				end
			end

			if arg_311_1.time_ >= var_314_3 + var_314_4 and arg_311_1.time_ < var_314_3 + var_314_4 + arg_314_0 and arg_311_1.var_.characterEffect1284ui_story then
				local var_314_7 = 0.5

				arg_311_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1284ui_story.fillRatio = var_314_7
			end
		end
	end,
	Play319961078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 319961078
		arg_315_1.duration_ = 3.466

		local var_315_0 = {
			zh = 3.466,
			ja = 3.333
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
				arg_315_0:Play319961079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_2")
			end

			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_318_2 = arg_315_1.actors_["1284ui_story"]
			local var_318_3 = 0

			if var_318_3 < arg_315_1.time_ and arg_315_1.time_ <= var_318_3 + arg_318_0 and arg_315_1.var_.characterEffect1284ui_story == nil then
				arg_315_1.var_.characterEffect1284ui_story = var_318_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_4 = 0.2

			if var_318_3 <= arg_315_1.time_ and arg_315_1.time_ < var_318_3 + var_318_4 then
				local var_318_5 = (arg_315_1.time_ - var_318_3) / var_318_4

				if arg_315_1.var_.characterEffect1284ui_story then
					arg_315_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_3 + var_318_4 and arg_315_1.time_ < var_318_3 + var_318_4 + arg_318_0 and arg_315_1.var_.characterEffect1284ui_story then
				arg_315_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_318_6 = 0
			local var_318_7 = 0.4

			if var_318_6 < arg_315_1.time_ and arg_315_1.time_ <= var_318_6 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_8 = arg_315_1:FormatText(StoryNameCfg[6].name)

				arg_315_1.leftNameTxt_.text = var_318_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_9 = arg_315_1:GetWordFromCfg(319961078)
				local var_318_10 = arg_315_1:FormatText(var_318_9.content)

				arg_315_1.text_.text = var_318_10

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_11 = 16
				local var_318_12 = utf8.len(var_318_10)
				local var_318_13 = var_318_11 <= 0 and var_318_7 or var_318_7 * (var_318_12 / var_318_11)

				if var_318_13 > 0 and var_318_7 < var_318_13 then
					arg_315_1.talkMaxDuration = var_318_13

					if var_318_13 + var_318_6 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_13 + var_318_6
					end
				end

				arg_315_1.text_.text = var_318_10
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961078", "story_v_out_319961.awb") ~= 0 then
					local var_318_14 = manager.audio:GetVoiceLength("story_v_out_319961", "319961078", "story_v_out_319961.awb") / 1000

					if var_318_14 + var_318_6 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_14 + var_318_6
					end

					if var_318_9.prefab_name ~= "" and arg_315_1.actors_[var_318_9.prefab_name] ~= nil then
						local var_318_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_9.prefab_name].transform, "story_v_out_319961", "319961078", "story_v_out_319961.awb")

						arg_315_1:RecordAudio("319961078", var_318_15)
						arg_315_1:RecordAudio("319961078", var_318_15)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_319961", "319961078", "story_v_out_319961.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_319961", "319961078", "story_v_out_319961.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_16 = math.max(var_318_7, arg_315_1.talkMaxDuration)

			if var_318_6 <= arg_315_1.time_ and arg_315_1.time_ < var_318_6 + var_318_16 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_6) / var_318_16

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_6 + var_318_16 and arg_315_1.time_ < var_318_6 + var_318_16 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play319961079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 319961079
		arg_319_1.duration_ = 0.999999999999

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"

			SetActive(arg_319_1.choicesGo_, true)

			for iter_320_0, iter_320_1 in ipairs(arg_319_1.choices_) do
				local var_320_0 = iter_320_0 <= 1

				SetActive(iter_320_1.go, var_320_0)
			end

			arg_319_1.choices_[1].txt.text = arg_319_1:FormatText(StoryChoiceCfg[805].name)
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play319961080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1.allBtn_.enabled = false
			end

			local var_322_1 = 0.6

			if arg_319_1.time_ >= var_322_0 + var_322_1 and arg_319_1.time_ < var_322_0 + var_322_1 + arg_322_0 then
				arg_319_1.allBtn_.enabled = true
			end

			local var_322_2 = arg_319_1.actors_["1284ui_story"]
			local var_322_3 = 0

			if var_322_3 < arg_319_1.time_ and arg_319_1.time_ <= var_322_3 + arg_322_0 and arg_319_1.var_.characterEffect1284ui_story == nil then
				arg_319_1.var_.characterEffect1284ui_story = var_322_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_4 = 0.2

			if var_322_3 <= arg_319_1.time_ and arg_319_1.time_ < var_322_3 + var_322_4 then
				local var_322_5 = (arg_319_1.time_ - var_322_3) / var_322_4

				if arg_319_1.var_.characterEffect1284ui_story then
					local var_322_6 = Mathf.Lerp(0, 0.5, var_322_5)

					arg_319_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1284ui_story.fillRatio = var_322_6
				end
			end

			if arg_319_1.time_ >= var_322_3 + var_322_4 and arg_319_1.time_ < var_322_3 + var_322_4 + arg_322_0 and arg_319_1.var_.characterEffect1284ui_story then
				local var_322_7 = 0.5

				arg_319_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1284ui_story.fillRatio = var_322_7
			end
		end
	end,
	Play319961080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 319961080
		arg_323_1.duration_ = 0.999999999999

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"

			SetActive(arg_323_1.choicesGo_, true)

			for iter_324_0, iter_324_1 in ipairs(arg_323_1.choices_) do
				local var_324_0 = iter_324_0 <= 1

				SetActive(iter_324_1.go, var_324_0)
			end

			arg_323_1.choices_[1].txt.text = arg_323_1:FormatText(StoryChoiceCfg[806].name)
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play319961081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1.allBtn_.enabled = false
			end

			local var_326_1 = 0.6

			if arg_323_1.time_ >= var_326_0 + var_326_1 and arg_323_1.time_ < var_326_0 + var_326_1 + arg_326_0 then
				arg_323_1.allBtn_.enabled = true
			end
		end
	end,
	Play319961081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 319961081
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play319961082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_330_1 = 0
			local var_330_2 = 0.625

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_3 = arg_327_1:GetWordFromCfg(319961081)
				local var_330_4 = arg_327_1:FormatText(var_330_3.content)

				arg_327_1.text_.text = var_330_4

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_5 = 25
				local var_330_6 = utf8.len(var_330_4)
				local var_330_7 = var_330_5 <= 0 and var_330_2 or var_330_2 * (var_330_6 / var_330_5)

				if var_330_7 > 0 and var_330_2 < var_330_7 then
					arg_327_1.talkMaxDuration = var_330_7

					if var_330_7 + var_330_1 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_7 + var_330_1
					end
				end

				arg_327_1.text_.text = var_330_4
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_8 = math.max(var_330_2, arg_327_1.talkMaxDuration)

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_8 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_1) / var_330_8

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_1 + var_330_8 and arg_327_1.time_ < var_330_1 + var_330_8 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play319961082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 319961082
		arg_331_1.duration_ = 2.032999999999

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
			arg_331_1.auto_ = false
		end

		function arg_331_1.playNext_(arg_333_0)
			arg_331_1.onStoryFinished_()
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1284ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1284ui_story == nil then
				arg_331_1.var_.characterEffect1284ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.2

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1284ui_story then
					local var_334_4 = Mathf.Lerp(0, 0.5, var_334_3)

					arg_331_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1284ui_story.fillRatio = var_334_4
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1284ui_story then
				local var_334_5 = 0.5

				arg_331_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1284ui_story.fillRatio = var_334_5
			end

			local var_334_6 = 0

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1.fswbg_:SetActive(true)
				arg_331_1.dialog_:SetActive(false)

				arg_331_1.fswtw_.percent = 0

				local var_334_7 = arg_331_1:GetWordFromCfg(319961082)
				local var_334_8 = arg_331_1:FormatText(var_334_7.content)

				arg_331_1.fswt_.text = var_334_8

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.fswt_)

				arg_331_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_331_1.fswtw_:SetDirty()

				arg_331_1.typewritterCharCountI18N = 0

				SetActive(arg_331_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_331_1:ShowNextGo(false)
			end

			local var_334_9 = 0.0166666666666667

			if var_334_9 < arg_331_1.time_ and arg_331_1.time_ <= var_334_9 + arg_334_0 then
				arg_331_1.var_.oldValueTypewriter = arg_331_1.fswtw_.percent

				arg_331_1:ShowNextGo(false)
			end

			local var_334_10 = 2
			local var_334_11 = 0.215999998152256
			local var_334_12 = arg_331_1:GetWordFromCfg(319961082)
			local var_334_13 = arg_331_1:FormatText(var_334_12.content)
			local var_334_14, var_334_15 = arg_331_1:GetPercentByPara(var_334_13, 1)

			if var_334_9 < arg_331_1.time_ and arg_331_1.time_ <= var_334_9 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0

				local var_334_16 = var_334_10 <= 0 and var_334_11 or var_334_11 * ((var_334_15 - arg_331_1.typewritterCharCountI18N) / var_334_10)

				if var_334_16 > 0 and var_334_11 < var_334_16 then
					arg_331_1.talkMaxDuration = var_334_16

					if var_334_16 + var_334_9 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_16 + var_334_9
					end
				end
			end

			local var_334_17 = 0.215999998152256
			local var_334_18 = math.max(var_334_17, arg_331_1.talkMaxDuration)

			if var_334_9 <= arg_331_1.time_ and arg_331_1.time_ < var_334_9 + var_334_18 then
				local var_334_19 = (arg_331_1.time_ - var_334_9) / var_334_18

				arg_331_1.fswtw_.percent = Mathf.Lerp(arg_331_1.var_.oldValueTypewriter, var_334_14, var_334_19)
				arg_331_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_331_1.fswtw_:SetDirty()
			end

			if arg_331_1.time_ >= var_334_9 + var_334_18 and arg_331_1.time_ < var_334_9 + var_334_18 + arg_334_0 then
				arg_331_1.fswtw_.percent = var_334_14

				arg_331_1.fswtw_:SetDirty()
				arg_331_1:ShowNextGo(true)

				arg_331_1.typewritterCharCountI18N = var_334_15
			end

			local var_334_20 = 0

			if var_334_20 < arg_331_1.time_ and arg_331_1.time_ <= var_334_20 + arg_334_0 then
				local var_334_21 = arg_331_1.fswbg_.transform:Find("textbox/adapt/content") or arg_331_1.fswbg_.transform:Find("textbox/content")
				local var_334_22 = var_334_21:GetComponent("Text")
				local var_334_23 = var_334_21:GetComponent("RectTransform")

				var_334_22.alignment = UnityEngine.TextAnchor.LowerCenter
				var_334_23.offsetMin = Vector2.New(0, 0)
				var_334_23.offsetMax = Vector2.New(0, 0)
			end

			local var_334_24 = arg_331_1.actors_["1284ui_story"].transform
			local var_334_25 = 0

			if var_334_25 < arg_331_1.time_ and arg_331_1.time_ <= var_334_25 + arg_334_0 then
				arg_331_1.var_.moveOldPos1284ui_story = var_334_24.localPosition
			end

			local var_334_26 = 0.001

			if var_334_25 <= arg_331_1.time_ and arg_331_1.time_ < var_334_25 + var_334_26 then
				local var_334_27 = (arg_331_1.time_ - var_334_25) / var_334_26
				local var_334_28 = Vector3.New(0, 100, 0)

				var_334_24.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1284ui_story, var_334_28, var_334_27)

				local var_334_29 = manager.ui.mainCamera.transform.position - var_334_24.position

				var_334_24.forward = Vector3.New(var_334_29.x, var_334_29.y, var_334_29.z)

				local var_334_30 = var_334_24.localEulerAngles

				var_334_30.z = 0
				var_334_30.x = 0
				var_334_24.localEulerAngles = var_334_30
			end

			if arg_331_1.time_ >= var_334_25 + var_334_26 and arg_331_1.time_ < var_334_25 + var_334_26 + arg_334_0 then
				var_334_24.localPosition = Vector3.New(0, 100, 0)

				local var_334_31 = manager.ui.mainCamera.transform.position - var_334_24.position

				var_334_24.forward = Vector3.New(var_334_31.x, var_334_31.y, var_334_31.z)

				local var_334_32 = var_334_24.localEulerAngles

				var_334_32.z = 0
				var_334_32.x = 0
				var_334_24.localEulerAngles = var_334_32
			end

			local var_334_33 = 0
			local var_334_34 = 2.033
			local var_334_35 = manager.audio:GetVoiceLength("story_v_out_319961", "319961082", "story_v_out_319961.awb") / 1000

			if var_334_35 > 0 and var_334_34 < var_334_35 and var_334_35 + var_334_33 > arg_331_1.duration_ then
				local var_334_36 = var_334_35

				arg_331_1.duration_ = var_334_35 + var_334_33
			end

			if var_334_33 < arg_331_1.time_ and arg_331_1.time_ <= var_334_33 + arg_334_0 then
				local var_334_37 = "play"
				local var_334_38 = "voice"

				arg_331_1:AudioAction(var_334_37, var_334_38, "story_v_out_319961", "319961082", "story_v_out_319961.awb")
			end

			local var_334_39 = 0

			if var_334_39 < arg_331_1.time_ and arg_331_1.time_ <= var_334_39 + arg_334_0 then
				local var_334_40 = manager.ui.mainCamera.transform.localPosition
				local var_334_41 = Vector3.New(0, 0, 10) + Vector3.New(var_334_40.x, var_334_40.y, 0)
				local var_334_42 = arg_331_1.bgs_.STblack

				var_334_42.transform.localPosition = var_334_41
				var_334_42.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_334_43 = var_334_42:GetComponent("SpriteRenderer")

				if var_334_43 and var_334_43.sprite then
					local var_334_44 = (var_334_42.transform.localPosition - var_334_40).z
					local var_334_45 = manager.ui.mainCameraCom_
					local var_334_46 = 2 * var_334_44 * Mathf.Tan(var_334_45.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_334_47 = var_334_46 * var_334_45.aspect
					local var_334_48 = var_334_43.sprite.bounds.size.x
					local var_334_49 = var_334_43.sprite.bounds.size.y
					local var_334_50 = var_334_47 / var_334_48
					local var_334_51 = var_334_46 / var_334_49
					local var_334_52 = var_334_51 < var_334_50 and var_334_50 or var_334_51

					var_334_42.transform.localScale = Vector3.New(var_334_52, var_334_52, 0)
				end

				for iter_334_0, iter_334_1 in pairs(arg_331_1.bgs_) do
					if iter_334_0 ~= "STblack" then
						iter_334_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_334_53 = 0

			if var_334_53 < arg_331_1.time_ and arg_331_1.time_ <= var_334_53 + arg_334_0 then
				arg_331_1.cswbg_:SetActive(true)

				local var_334_54 = arg_331_1.cswt_:GetComponent("RectTransform")

				arg_331_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_334_54.offsetMin = Vector2.New(0, 100)
				var_334_54.offsetMax = Vector2.New(0, 0)

				local var_334_55 = arg_331_1:GetWordFromCfg(419088)
				local var_334_56 = arg_331_1:FormatText(var_334_55.content)

				arg_331_1.cswt_.text = var_334_56

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.cswt_)

				arg_331_1.cswt_.fontSize = 155
				arg_331_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_331_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I07"
	},
	voices = {
		"story_v_out_319961.awb"
	}
}
