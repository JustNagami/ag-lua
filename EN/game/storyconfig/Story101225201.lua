return {
	Play122521001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 122521001
		arg_1_1.duration_ = 7.93300000298023

		local var_1_0 = {
			ja = 7.93300000298023,
			ko = 5.60000000298023,
			zh = 5.60000000298023
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
				arg_1_0:Play122521002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J07f"

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
				local var_4_5 = arg_1_1.bgs_.J07f

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
					if iter_4_0 ~= "J07f" then
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

			local var_4_22 = "4037ui_story"

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

			local var_4_26 = arg_1_1.actors_["4037ui_story"].transform
			local var_4_27 = 1.8

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos4037ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -1.12, -6.2)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos4037ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["4037ui_story"]
			local var_4_36 = 1.8

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect4037ui_story == nil then
				arg_1_1.var_.characterEffect4037ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect4037ui_story then
					arg_1_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect4037ui_story then
				arg_1_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_4_39 = 1.8

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_4_40 = 1.8

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_4_41 = 0
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 1.5
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_activity_2_0_story_source_xuheng", "bgm_activity_2_0_story_source_xuheng", "bgm_activity_2_0_story_source_xuheng.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2.00000000298023
			local var_4_50 = 0.425

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

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[453].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(122521001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521001", "story_v_out_122521.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_122521", "122521001", "story_v_out_122521.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_122521", "122521001", "story_v_out_122521.awb")

						arg_1_1:RecordAudio("122521001", var_4_59)
						arg_1_1:RecordAudio("122521001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_122521", "122521001", "story_v_out_122521.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_122521", "122521001", "story_v_out_122521.awb")
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
	Play122521002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 122521002
		arg_7_1.duration_ = 17.466

		local var_7_0 = {
			ja = 17.466,
			ko = 6.9,
			zh = 6.9
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
				arg_7_0:Play122521003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action2_1")
			end

			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_10_2 = 0
			local var_10_3 = 0.625

			if var_10_2 < arg_7_1.time_ and arg_7_1.time_ <= var_10_2 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_4 = arg_7_1:FormatText(StoryNameCfg[453].name)

				arg_7_1.leftNameTxt_.text = var_10_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_5 = arg_7_1:GetWordFromCfg(122521002)
				local var_10_6 = arg_7_1:FormatText(var_10_5.content)

				arg_7_1.text_.text = var_10_6

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_7 = 25
				local var_10_8 = utf8.len(var_10_6)
				local var_10_9 = var_10_7 <= 0 and var_10_3 or var_10_3 * (var_10_8 / var_10_7)

				if var_10_9 > 0 and var_10_3 < var_10_9 then
					arg_7_1.talkMaxDuration = var_10_9

					if var_10_9 + var_10_2 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_9 + var_10_2
					end
				end

				arg_7_1.text_.text = var_10_6
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521002", "story_v_out_122521.awb") ~= 0 then
					local var_10_10 = manager.audio:GetVoiceLength("story_v_out_122521", "122521002", "story_v_out_122521.awb") / 1000

					if var_10_10 + var_10_2 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_10 + var_10_2
					end

					if var_10_5.prefab_name ~= "" and arg_7_1.actors_[var_10_5.prefab_name] ~= nil then
						local var_10_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_5.prefab_name].transform, "story_v_out_122521", "122521002", "story_v_out_122521.awb")

						arg_7_1:RecordAudio("122521002", var_10_11)
						arg_7_1:RecordAudio("122521002", var_10_11)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_122521", "122521002", "story_v_out_122521.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_122521", "122521002", "story_v_out_122521.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_12 = math.max(var_10_3, arg_7_1.talkMaxDuration)

			if var_10_2 <= arg_7_1.time_ and arg_7_1.time_ < var_10_2 + var_10_12 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_2) / var_10_12

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_2 + var_10_12 and arg_7_1.time_ < var_10_2 + var_10_12 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play122521003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 122521003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play122521004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["4037ui_story"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos4037ui_story = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(0, 100, 0)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos4037ui_story, var_14_4, var_14_3)

				local var_14_5 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_5.x, var_14_5.y, var_14_5.z)

				local var_14_6 = var_14_0.localEulerAngles

				var_14_6.z = 0
				var_14_6.x = 0
				var_14_0.localEulerAngles = var_14_6
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, 100, 0)

				local var_14_7 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_7.x, var_14_7.y, var_14_7.z)

				local var_14_8 = var_14_0.localEulerAngles

				var_14_8.z = 0
				var_14_8.x = 0
				var_14_0.localEulerAngles = var_14_8
			end

			local var_14_9 = arg_11_1.actors_["4037ui_story"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect4037ui_story == nil then
				arg_11_1.var_.characterEffect4037ui_story = var_14_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_11 = 0.200000002980232

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.characterEffect4037ui_story then
					local var_14_13 = Mathf.Lerp(0, 0.5, var_14_12)

					arg_11_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_11_1.var_.characterEffect4037ui_story.fillRatio = var_14_13
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.characterEffect4037ui_story then
				local var_14_14 = 0.5

				arg_11_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_11_1.var_.characterEffect4037ui_story.fillRatio = var_14_14
			end

			local var_14_15 = 0
			local var_14_16 = 1.4

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

				local var_14_17 = arg_11_1:GetWordFromCfg(122521003)
				local var_14_18 = arg_11_1:FormatText(var_14_17.content)

				arg_11_1.text_.text = var_14_18

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_19 = 56
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
	Play122521004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 122521004
		arg_15_1.duration_ = 6.133

		local var_15_0 = {
			ja = 6.133,
			ko = 2.233,
			zh = 2.233
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
				arg_15_0:Play122521005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "10045ui_story"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("Char/" .. var_18_0), arg_15_1.stage_.transform)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_0] = var_18_1

				local var_18_2 = var_18_1:GetComponentInChildren(typeof(CharacterEffect))

				var_18_2.enabled = true

				local var_18_3 = GameObjectTools.GetOrAddComponent(var_18_1, typeof(DynamicBoneHelper))

				if var_18_3 then
					var_18_3:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_2.transform, false)

				arg_15_1.var_[var_18_0 .. "Animator"] = var_18_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_0 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_0 .. "LipSync"] = var_18_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_4 = arg_15_1.actors_["10045ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos10045ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(-0.7, -1.18, -6.05)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10045ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = arg_15_1.actors_["10045ui_story"]
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 and arg_15_1.var_.characterEffect10045ui_story == nil then
				arg_15_1.var_.characterEffect10045ui_story = var_18_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_15 = 0.200000002980232

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_15 then
				local var_18_16 = (arg_15_1.time_ - var_18_14) / var_18_15

				if arg_15_1.var_.characterEffect10045ui_story then
					arg_15_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_14 + var_18_15 and arg_15_1.time_ < var_18_14 + var_18_15 + arg_18_0 and arg_15_1.var_.characterEffect10045ui_story then
				arg_15_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action1_1")
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_18_19 = 0
			local var_18_20 = 0.275

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_21 = arg_15_1:FormatText(StoryNameCfg[45].name)

				arg_15_1.leftNameTxt_.text = var_18_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_22 = arg_15_1:GetWordFromCfg(122521004)
				local var_18_23 = arg_15_1:FormatText(var_18_22.content)

				arg_15_1.text_.text = var_18_23

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_24 = 11
				local var_18_25 = utf8.len(var_18_23)
				local var_18_26 = var_18_24 <= 0 and var_18_20 or var_18_20 * (var_18_25 / var_18_24)

				if var_18_26 > 0 and var_18_20 < var_18_26 then
					arg_15_1.talkMaxDuration = var_18_26

					if var_18_26 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_26 + var_18_19
					end
				end

				arg_15_1.text_.text = var_18_23
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521004", "story_v_out_122521.awb") ~= 0 then
					local var_18_27 = manager.audio:GetVoiceLength("story_v_out_122521", "122521004", "story_v_out_122521.awb") / 1000

					if var_18_27 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_27 + var_18_19
					end

					if var_18_22.prefab_name ~= "" and arg_15_1.actors_[var_18_22.prefab_name] ~= nil then
						local var_18_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_22.prefab_name].transform, "story_v_out_122521", "122521004", "story_v_out_122521.awb")

						arg_15_1:RecordAudio("122521004", var_18_28)
						arg_15_1:RecordAudio("122521004", var_18_28)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_122521", "122521004", "story_v_out_122521.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_122521", "122521004", "story_v_out_122521.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_29 = math.max(var_18_20, arg_15_1.talkMaxDuration)

			if var_18_19 <= arg_15_1.time_ and arg_15_1.time_ < var_18_19 + var_18_29 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_19) / var_18_29

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_19 + var_18_29 and arg_15_1.time_ < var_18_19 + var_18_29 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play122521005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 122521005
		arg_19_1.duration_ = 9.566

		local var_19_0 = {
			ja = 9.566,
			ko = 5.266,
			zh = 5.266
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
				arg_19_0:Play122521006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["4037ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos4037ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0.7, -1.12, -6.2)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos4037ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["4037ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect4037ui_story == nil then
				arg_19_1.var_.characterEffect4037ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect4037ui_story then
					arg_19_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect4037ui_story then
				arg_19_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_14 = arg_19_1.actors_["10045ui_story"]
			local var_22_15 = 0

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 and arg_19_1.var_.characterEffect10045ui_story == nil then
				arg_19_1.var_.characterEffect10045ui_story = var_22_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_16 = 0.200000002980232

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_16 then
				local var_22_17 = (arg_19_1.time_ - var_22_15) / var_22_16

				if arg_19_1.var_.characterEffect10045ui_story then
					local var_22_18 = Mathf.Lerp(0, 0.5, var_22_17)

					arg_19_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_19_1.var_.characterEffect10045ui_story.fillRatio = var_22_18
				end
			end

			if arg_19_1.time_ >= var_22_15 + var_22_16 and arg_19_1.time_ < var_22_15 + var_22_16 + arg_22_0 and arg_19_1.var_.characterEffect10045ui_story then
				local var_22_19 = 0.5

				arg_19_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_19_1.var_.characterEffect10045ui_story.fillRatio = var_22_19
			end

			local var_22_20 = arg_19_1.actors_["4037ui_story"].transform
			local var_22_21 = 0

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 then
				arg_19_1.var_.moveOldPos4037ui_story = var_22_20.localPosition
			end

			local var_22_22 = 0.001

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_22 then
				local var_22_23 = (arg_19_1.time_ - var_22_21) / var_22_22
				local var_22_24 = Vector3.New(0.7, -1.12, -6.2)

				var_22_20.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos4037ui_story, var_22_24, var_22_23)

				local var_22_25 = manager.ui.mainCamera.transform.position - var_22_20.position

				var_22_20.forward = Vector3.New(var_22_25.x, var_22_25.y, var_22_25.z)

				local var_22_26 = var_22_20.localEulerAngles

				var_22_26.z = 0
				var_22_26.x = 0
				var_22_20.localEulerAngles = var_22_26
			end

			if arg_19_1.time_ >= var_22_21 + var_22_22 and arg_19_1.time_ < var_22_21 + var_22_22 + arg_22_0 then
				var_22_20.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_22_27 = manager.ui.mainCamera.transform.position - var_22_20.position

				var_22_20.forward = Vector3.New(var_22_27.x, var_22_27.y, var_22_27.z)

				local var_22_28 = var_22_20.localEulerAngles

				var_22_28.z = 0
				var_22_28.x = 0
				var_22_20.localEulerAngles = var_22_28
			end

			local var_22_29 = 0
			local var_22_30 = 0.3

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_31 = arg_19_1:FormatText(StoryNameCfg[453].name)

				arg_19_1.leftNameTxt_.text = var_22_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_32 = arg_19_1:GetWordFromCfg(122521005)
				local var_22_33 = arg_19_1:FormatText(var_22_32.content)

				arg_19_1.text_.text = var_22_33

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_34 = 12
				local var_22_35 = utf8.len(var_22_33)
				local var_22_36 = var_22_34 <= 0 and var_22_30 or var_22_30 * (var_22_35 / var_22_34)

				if var_22_36 > 0 and var_22_30 < var_22_36 then
					arg_19_1.talkMaxDuration = var_22_36

					if var_22_36 + var_22_29 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_36 + var_22_29
					end
				end

				arg_19_1.text_.text = var_22_33
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521005", "story_v_out_122521.awb") ~= 0 then
					local var_22_37 = manager.audio:GetVoiceLength("story_v_out_122521", "122521005", "story_v_out_122521.awb") / 1000

					if var_22_37 + var_22_29 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_37 + var_22_29
					end

					if var_22_32.prefab_name ~= "" and arg_19_1.actors_[var_22_32.prefab_name] ~= nil then
						local var_22_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_32.prefab_name].transform, "story_v_out_122521", "122521005", "story_v_out_122521.awb")

						arg_19_1:RecordAudio("122521005", var_22_38)
						arg_19_1:RecordAudio("122521005", var_22_38)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_122521", "122521005", "story_v_out_122521.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_122521", "122521005", "story_v_out_122521.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_39 = math.max(var_22_30, arg_19_1.talkMaxDuration)

			if var_22_29 <= arg_19_1.time_ and arg_19_1.time_ < var_22_29 + var_22_39 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_29) / var_22_39

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_29 + var_22_39 and arg_19_1.time_ < var_22_29 + var_22_39 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play122521006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 122521006
		arg_23_1.duration_ = 11.566

		local var_23_0 = {
			ja = 11.566,
			ko = 8.066,
			zh = 8.066
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
				arg_23_0:Play122521007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10045ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect10045ui_story == nil then
				arg_23_1.var_.characterEffect10045ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect10045ui_story then
					arg_23_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect10045ui_story then
				arg_23_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action1_1")
			end

			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_6 = arg_23_1.actors_["4037ui_story"]
			local var_26_7 = 0

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 and arg_23_1.var_.characterEffect4037ui_story == nil then
				arg_23_1.var_.characterEffect4037ui_story = var_26_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_8 = 0.200000002980232

			if var_26_7 <= arg_23_1.time_ and arg_23_1.time_ < var_26_7 + var_26_8 then
				local var_26_9 = (arg_23_1.time_ - var_26_7) / var_26_8

				if arg_23_1.var_.characterEffect4037ui_story then
					local var_26_10 = Mathf.Lerp(0, 0.5, var_26_9)

					arg_23_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_23_1.var_.characterEffect4037ui_story.fillRatio = var_26_10
				end
			end

			if arg_23_1.time_ >= var_26_7 + var_26_8 and arg_23_1.time_ < var_26_7 + var_26_8 + arg_26_0 and arg_23_1.var_.characterEffect4037ui_story then
				local var_26_11 = 0.5

				arg_23_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_23_1.var_.characterEffect4037ui_story.fillRatio = var_26_11
			end

			local var_26_12 = 0
			local var_26_13 = 1.1

			if var_26_12 < arg_23_1.time_ and arg_23_1.time_ <= var_26_12 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_14 = arg_23_1:FormatText(StoryNameCfg[45].name)

				arg_23_1.leftNameTxt_.text = var_26_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_15 = arg_23_1:GetWordFromCfg(122521006)
				local var_26_16 = arg_23_1:FormatText(var_26_15.content)

				arg_23_1.text_.text = var_26_16

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_17 = 44
				local var_26_18 = utf8.len(var_26_16)
				local var_26_19 = var_26_17 <= 0 and var_26_13 or var_26_13 * (var_26_18 / var_26_17)

				if var_26_19 > 0 and var_26_13 < var_26_19 then
					arg_23_1.talkMaxDuration = var_26_19

					if var_26_19 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_19 + var_26_12
					end
				end

				arg_23_1.text_.text = var_26_16
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521006", "story_v_out_122521.awb") ~= 0 then
					local var_26_20 = manager.audio:GetVoiceLength("story_v_out_122521", "122521006", "story_v_out_122521.awb") / 1000

					if var_26_20 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_20 + var_26_12
					end

					if var_26_15.prefab_name ~= "" and arg_23_1.actors_[var_26_15.prefab_name] ~= nil then
						local var_26_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_15.prefab_name].transform, "story_v_out_122521", "122521006", "story_v_out_122521.awb")

						arg_23_1:RecordAudio("122521006", var_26_21)
						arg_23_1:RecordAudio("122521006", var_26_21)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_122521", "122521006", "story_v_out_122521.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_122521", "122521006", "story_v_out_122521.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_22 = math.max(var_26_13, arg_23_1.talkMaxDuration)

			if var_26_12 <= arg_23_1.time_ and arg_23_1.time_ < var_26_12 + var_26_22 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_12) / var_26_22

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_12 + var_26_22 and arg_23_1.time_ < var_26_12 + var_26_22 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play122521007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 122521007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play122521008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10045ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10045ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10045ui_story, var_30_4, var_30_3)

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

			local var_30_9 = arg_27_1.actors_["10045ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect10045ui_story == nil then
				arg_27_1.var_.characterEffect10045ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect10045ui_story then
					local var_30_13 = Mathf.Lerp(0, 0.5, var_30_12)

					arg_27_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_27_1.var_.characterEffect10045ui_story.fillRatio = var_30_13
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect10045ui_story then
				local var_30_14 = 0.5

				arg_27_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_27_1.var_.characterEffect10045ui_story.fillRatio = var_30_14
			end

			local var_30_15 = arg_27_1.actors_["4037ui_story"].transform
			local var_30_16 = 0

			if var_30_16 < arg_27_1.time_ and arg_27_1.time_ <= var_30_16 + arg_30_0 then
				arg_27_1.var_.moveOldPos4037ui_story = var_30_15.localPosition
			end

			local var_30_17 = 0.001

			if var_30_16 <= arg_27_1.time_ and arg_27_1.time_ < var_30_16 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_16) / var_30_17
				local var_30_19 = Vector3.New(0, 100, 0)

				var_30_15.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos4037ui_story, var_30_19, var_30_18)

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

			local var_30_24 = arg_27_1.actors_["4037ui_story"]
			local var_30_25 = 0

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 and arg_27_1.var_.characterEffect4037ui_story == nil then
				arg_27_1.var_.characterEffect4037ui_story = var_30_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_26 = 0.200000002980232

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_26 then
				local var_30_27 = (arg_27_1.time_ - var_30_25) / var_30_26

				if arg_27_1.var_.characterEffect4037ui_story then
					local var_30_28 = Mathf.Lerp(0, 0.5, var_30_27)

					arg_27_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_27_1.var_.characterEffect4037ui_story.fillRatio = var_30_28
				end
			end

			if arg_27_1.time_ >= var_30_25 + var_30_26 and arg_27_1.time_ < var_30_25 + var_30_26 + arg_30_0 and arg_27_1.var_.characterEffect4037ui_story then
				local var_30_29 = 0.5

				arg_27_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_27_1.var_.characterEffect4037ui_story.fillRatio = var_30_29
			end

			local var_30_30 = 0
			local var_30_31 = 0.95

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

				local var_30_32 = arg_27_1:GetWordFromCfg(122521007)
				local var_30_33 = arg_27_1:FormatText(var_30_32.content)

				arg_27_1.text_.text = var_30_33

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_34 = 38
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
	Play122521008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 122521008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play122521009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1.025

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

				local var_34_2 = arg_31_1:GetWordFromCfg(122521008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 41
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
	Play122521009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 122521009
		arg_35_1.duration_ = 2.1

		local var_35_0 = {
			ja = 2.1,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_35_0:Play122521010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["4037ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos4037ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, -1.12, -6.2)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos4037ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["4037ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect4037ui_story == nil then
				arg_35_1.var_.characterEffect4037ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect4037ui_story then
					arg_35_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect4037ui_story then
				arg_35_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action3_1")
			end

			local var_38_14 = 0
			local var_38_15 = 0.175

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_16 = arg_35_1:FormatText(StoryNameCfg[453].name)

				arg_35_1.leftNameTxt_.text = var_38_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_17 = arg_35_1:GetWordFromCfg(122521009)
				local var_38_18 = arg_35_1:FormatText(var_38_17.content)

				arg_35_1.text_.text = var_38_18

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_19 = 7
				local var_38_20 = utf8.len(var_38_18)
				local var_38_21 = var_38_19 <= 0 and var_38_15 or var_38_15 * (var_38_20 / var_38_19)

				if var_38_21 > 0 and var_38_15 < var_38_21 then
					arg_35_1.talkMaxDuration = var_38_21

					if var_38_21 + var_38_14 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_21 + var_38_14
					end
				end

				arg_35_1.text_.text = var_38_18
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521009", "story_v_out_122521.awb") ~= 0 then
					local var_38_22 = manager.audio:GetVoiceLength("story_v_out_122521", "122521009", "story_v_out_122521.awb") / 1000

					if var_38_22 + var_38_14 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_22 + var_38_14
					end

					if var_38_17.prefab_name ~= "" and arg_35_1.actors_[var_38_17.prefab_name] ~= nil then
						local var_38_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_17.prefab_name].transform, "story_v_out_122521", "122521009", "story_v_out_122521.awb")

						arg_35_1:RecordAudio("122521009", var_38_23)
						arg_35_1:RecordAudio("122521009", var_38_23)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_122521", "122521009", "story_v_out_122521.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_122521", "122521009", "story_v_out_122521.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_24 = math.max(var_38_15, arg_35_1.talkMaxDuration)

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_24 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_14) / var_38_24

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_14 + var_38_24 and arg_35_1.time_ < var_38_14 + var_38_24 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play122521010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 122521010
		arg_39_1.duration_ = 7.366

		local var_39_0 = {
			ja = 7.366,
			ko = 5.1,
			zh = 5.1
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
				arg_39_0:Play122521011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10045ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10045ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(-0.7, -1.18, -6.05)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10045ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["10045ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect10045ui_story == nil then
				arg_39_1.var_.characterEffect10045ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect10045ui_story then
					arg_39_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect10045ui_story then
				arg_39_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_42_13 = 0

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action1_1")
			end

			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_15 = arg_39_1.actors_["4037ui_story"].transform
			local var_42_16 = 0

			if var_42_16 < arg_39_1.time_ and arg_39_1.time_ <= var_42_16 + arg_42_0 then
				arg_39_1.var_.moveOldPos4037ui_story = var_42_15.localPosition
			end

			local var_42_17 = 0.001

			if var_42_16 <= arg_39_1.time_ and arg_39_1.time_ < var_42_16 + var_42_17 then
				local var_42_18 = (arg_39_1.time_ - var_42_16) / var_42_17
				local var_42_19 = Vector3.New(0.7, -1.12, -6.2)

				var_42_15.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos4037ui_story, var_42_19, var_42_18)

				local var_42_20 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_20.x, var_42_20.y, var_42_20.z)

				local var_42_21 = var_42_15.localEulerAngles

				var_42_21.z = 0
				var_42_21.x = 0
				var_42_15.localEulerAngles = var_42_21
			end

			if arg_39_1.time_ >= var_42_16 + var_42_17 and arg_39_1.time_ < var_42_16 + var_42_17 + arg_42_0 then
				var_42_15.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_42_22 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_22.x, var_42_22.y, var_42_22.z)

				local var_42_23 = var_42_15.localEulerAngles

				var_42_23.z = 0
				var_42_23.x = 0
				var_42_15.localEulerAngles = var_42_23
			end

			local var_42_24 = arg_39_1.actors_["4037ui_story"]
			local var_42_25 = 0

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 and arg_39_1.var_.characterEffect4037ui_story == nil then
				arg_39_1.var_.characterEffect4037ui_story = var_42_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_26 = 0.200000002980232

			if var_42_25 <= arg_39_1.time_ and arg_39_1.time_ < var_42_25 + var_42_26 then
				local var_42_27 = (arg_39_1.time_ - var_42_25) / var_42_26

				if arg_39_1.var_.characterEffect4037ui_story then
					local var_42_28 = Mathf.Lerp(0, 0.5, var_42_27)

					arg_39_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_39_1.var_.characterEffect4037ui_story.fillRatio = var_42_28
				end
			end

			if arg_39_1.time_ >= var_42_25 + var_42_26 and arg_39_1.time_ < var_42_25 + var_42_26 + arg_42_0 and arg_39_1.var_.characterEffect4037ui_story then
				local var_42_29 = 0.5

				arg_39_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_39_1.var_.characterEffect4037ui_story.fillRatio = var_42_29
			end

			local var_42_30 = 0
			local var_42_31 = 0.725

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_32 = arg_39_1:FormatText(StoryNameCfg[45].name)

				arg_39_1.leftNameTxt_.text = var_42_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(122521010)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 29
				local var_42_36 = utf8.len(var_42_34)
				local var_42_37 = var_42_35 <= 0 and var_42_31 or var_42_31 * (var_42_36 / var_42_35)

				if var_42_37 > 0 and var_42_31 < var_42_37 then
					arg_39_1.talkMaxDuration = var_42_37

					if var_42_37 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_37 + var_42_30
					end
				end

				arg_39_1.text_.text = var_42_34
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521010", "story_v_out_122521.awb") ~= 0 then
					local var_42_38 = manager.audio:GetVoiceLength("story_v_out_122521", "122521010", "story_v_out_122521.awb") / 1000

					if var_42_38 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_38 + var_42_30
					end

					if var_42_33.prefab_name ~= "" and arg_39_1.actors_[var_42_33.prefab_name] ~= nil then
						local var_42_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_33.prefab_name].transform, "story_v_out_122521", "122521010", "story_v_out_122521.awb")

						arg_39_1:RecordAudio("122521010", var_42_39)
						arg_39_1:RecordAudio("122521010", var_42_39)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_122521", "122521010", "story_v_out_122521.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_122521", "122521010", "story_v_out_122521.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_40 = math.max(var_42_31, arg_39_1.talkMaxDuration)

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_40 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_30) / var_42_40

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_30 + var_42_40 and arg_39_1.time_ < var_42_30 + var_42_40 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play122521011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 122521011
		arg_43_1.duration_ = 7.633

		local var_43_0 = {
			ja = 7.633,
			ko = 7.333,
			zh = 7.333
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
				arg_43_0:Play122521012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["4037ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect4037ui_story == nil then
				arg_43_1.var_.characterEffect4037ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect4037ui_story then
					arg_43_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect4037ui_story then
				arg_43_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_46_4 = 0

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action3_2")
			end

			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				arg_43_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_6 = arg_43_1.actors_["10045ui_story"]
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 and arg_43_1.var_.characterEffect10045ui_story == nil then
				arg_43_1.var_.characterEffect10045ui_story = var_46_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_8 = 0.200000002980232

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_8 then
				local var_46_9 = (arg_43_1.time_ - var_46_7) / var_46_8

				if arg_43_1.var_.characterEffect10045ui_story then
					local var_46_10 = Mathf.Lerp(0, 0.5, var_46_9)

					arg_43_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_43_1.var_.characterEffect10045ui_story.fillRatio = var_46_10
				end
			end

			if arg_43_1.time_ >= var_46_7 + var_46_8 and arg_43_1.time_ < var_46_7 + var_46_8 + arg_46_0 and arg_43_1.var_.characterEffect10045ui_story then
				local var_46_11 = 0.5

				arg_43_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_43_1.var_.characterEffect10045ui_story.fillRatio = var_46_11
			end

			local var_46_12 = 0
			local var_46_13 = 0.75

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_14 = arg_43_1:FormatText(StoryNameCfg[453].name)

				arg_43_1.leftNameTxt_.text = var_46_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_15 = arg_43_1:GetWordFromCfg(122521011)
				local var_46_16 = arg_43_1:FormatText(var_46_15.content)

				arg_43_1.text_.text = var_46_16

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_17 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521011", "story_v_out_122521.awb") ~= 0 then
					local var_46_20 = manager.audio:GetVoiceLength("story_v_out_122521", "122521011", "story_v_out_122521.awb") / 1000

					if var_46_20 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_20 + var_46_12
					end

					if var_46_15.prefab_name ~= "" and arg_43_1.actors_[var_46_15.prefab_name] ~= nil then
						local var_46_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_15.prefab_name].transform, "story_v_out_122521", "122521011", "story_v_out_122521.awb")

						arg_43_1:RecordAudio("122521011", var_46_21)
						arg_43_1:RecordAudio("122521011", var_46_21)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_122521", "122521011", "story_v_out_122521.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_122521", "122521011", "story_v_out_122521.awb")
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
	Play122521012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 122521012
		arg_47_1.duration_ = 12.766

		local var_47_0 = {
			ja = 12.766,
			ko = 9.1,
			zh = 9.1
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
				arg_47_0:Play122521013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.975

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[453].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(122521012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 27
				local var_50_6 = utf8.len(var_50_4)
				local var_50_7 = var_50_5 <= 0 and var_50_1 or var_50_1 * (var_50_6 / var_50_5)

				if var_50_7 > 0 and var_50_1 < var_50_7 then
					arg_47_1.talkMaxDuration = var_50_7

					if var_50_7 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_7 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_4
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521012", "story_v_out_122521.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521012", "story_v_out_122521.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_122521", "122521012", "story_v_out_122521.awb")

						arg_47_1:RecordAudio("122521012", var_50_9)
						arg_47_1:RecordAudio("122521012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_122521", "122521012", "story_v_out_122521.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_122521", "122521012", "story_v_out_122521.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_10 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_10 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_10

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_10 and arg_47_1.time_ < var_50_0 + var_50_10 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play122521013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 122521013
		arg_51_1.duration_ = 5.8

		local var_51_0 = {
			ja = 5.8,
			ko = 5.033,
			zh = 5.033
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
				arg_51_0:Play122521014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10045ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10045ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(-0.7, -1.18, -6.05)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10045ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["10045ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect10045ui_story == nil then
				arg_51_1.var_.characterEffect10045ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect10045ui_story then
					arg_51_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect10045ui_story then
				arg_51_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action4_1")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_54_15 = arg_51_1.actors_["4037ui_story"]
			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 and arg_51_1.var_.characterEffect4037ui_story == nil then
				arg_51_1.var_.characterEffect4037ui_story = var_54_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_17 = 0.200000002980232

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17

				if arg_51_1.var_.characterEffect4037ui_story then
					local var_54_19 = Mathf.Lerp(0, 0.5, var_54_18)

					arg_51_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_51_1.var_.characterEffect4037ui_story.fillRatio = var_54_19
				end
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 and arg_51_1.var_.characterEffect4037ui_story then
				local var_54_20 = 0.5

				arg_51_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_51_1.var_.characterEffect4037ui_story.fillRatio = var_54_20
			end

			local var_54_21 = 0
			local var_54_22 = 0.475

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_23 = arg_51_1:FormatText(StoryNameCfg[45].name)

				arg_51_1.leftNameTxt_.text = var_54_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_24 = arg_51_1:GetWordFromCfg(122521013)
				local var_54_25 = arg_51_1:FormatText(var_54_24.content)

				arg_51_1.text_.text = var_54_25

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_26 = 19
				local var_54_27 = utf8.len(var_54_25)
				local var_54_28 = var_54_26 <= 0 and var_54_22 or var_54_22 * (var_54_27 / var_54_26)

				if var_54_28 > 0 and var_54_22 < var_54_28 then
					arg_51_1.talkMaxDuration = var_54_28

					if var_54_28 + var_54_21 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_28 + var_54_21
					end
				end

				arg_51_1.text_.text = var_54_25
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521013", "story_v_out_122521.awb") ~= 0 then
					local var_54_29 = manager.audio:GetVoiceLength("story_v_out_122521", "122521013", "story_v_out_122521.awb") / 1000

					if var_54_29 + var_54_21 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_29 + var_54_21
					end

					if var_54_24.prefab_name ~= "" and arg_51_1.actors_[var_54_24.prefab_name] ~= nil then
						local var_54_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_24.prefab_name].transform, "story_v_out_122521", "122521013", "story_v_out_122521.awb")

						arg_51_1:RecordAudio("122521013", var_54_30)
						arg_51_1:RecordAudio("122521013", var_54_30)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_122521", "122521013", "story_v_out_122521.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_122521", "122521013", "story_v_out_122521.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_31 = math.max(var_54_22, arg_51_1.talkMaxDuration)

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_31 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_21) / var_54_31

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_21 + var_54_31 and arg_51_1.time_ < var_54_21 + var_54_31 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play122521014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 122521014
		arg_55_1.duration_ = 4.933

		local var_55_0 = {
			ja = 4.933,
			ko = 4.2,
			zh = 4.2
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
				arg_55_0:Play122521015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["4037ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect4037ui_story == nil then
				arg_55_1.var_.characterEffect4037ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect4037ui_story then
					arg_55_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect4037ui_story then
				arg_55_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_58_4 = 0

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_58_6 = arg_55_1.actors_["10045ui_story"]
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 and arg_55_1.var_.characterEffect10045ui_story == nil then
				arg_55_1.var_.characterEffect10045ui_story = var_58_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_8 = 0.200000002980232

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8

				if arg_55_1.var_.characterEffect10045ui_story then
					local var_58_10 = Mathf.Lerp(0, 0.5, var_58_9)

					arg_55_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_55_1.var_.characterEffect10045ui_story.fillRatio = var_58_10
				end
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 and arg_55_1.var_.characterEffect10045ui_story then
				local var_58_11 = 0.5

				arg_55_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_55_1.var_.characterEffect10045ui_story.fillRatio = var_58_11
			end

			local var_58_12 = 0
			local var_58_13 = 0.425

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_14 = arg_55_1:FormatText(StoryNameCfg[453].name)

				arg_55_1.leftNameTxt_.text = var_58_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(122521014)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 17
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_13 or var_58_13 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_13 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_12
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521014", "story_v_out_122521.awb") ~= 0 then
					local var_58_20 = manager.audio:GetVoiceLength("story_v_out_122521", "122521014", "story_v_out_122521.awb") / 1000

					if var_58_20 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_12
					end

					if var_58_15.prefab_name ~= "" and arg_55_1.actors_[var_58_15.prefab_name] ~= nil then
						local var_58_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_15.prefab_name].transform, "story_v_out_122521", "122521014", "story_v_out_122521.awb")

						arg_55_1:RecordAudio("122521014", var_58_21)
						arg_55_1:RecordAudio("122521014", var_58_21)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_122521", "122521014", "story_v_out_122521.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_122521", "122521014", "story_v_out_122521.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_22 = math.max(var_58_13, arg_55_1.talkMaxDuration)

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_22 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_12) / var_58_22

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_12 + var_58_22 and arg_55_1.time_ < var_58_12 + var_58_22 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play122521015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 122521015
		arg_59_1.duration_ = 12.066

		local var_59_0 = {
			ja = 12.066,
			ko = 8.9,
			zh = 8.9
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
				arg_59_0:Play122521016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10045ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect10045ui_story == nil then
				arg_59_1.var_.characterEffect10045ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect10045ui_story then
					arg_59_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect10045ui_story then
				arg_59_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_62_4 = 0

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action4_2")
			end

			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 then
				arg_59_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_62_6 = arg_59_1.actors_["4037ui_story"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.characterEffect4037ui_story == nil then
				arg_59_1.var_.characterEffect4037ui_story = var_62_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_8 = 0.200000002980232

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8

				if arg_59_1.var_.characterEffect4037ui_story then
					local var_62_10 = Mathf.Lerp(0, 0.5, var_62_9)

					arg_59_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_59_1.var_.characterEffect4037ui_story.fillRatio = var_62_10
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 and arg_59_1.var_.characterEffect4037ui_story then
				local var_62_11 = 0.5

				arg_59_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_59_1.var_.characterEffect4037ui_story.fillRatio = var_62_11
			end

			local var_62_12 = 0
			local var_62_13 = 1.1

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[45].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(122521015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 44
				local var_62_18 = utf8.len(var_62_16)
				local var_62_19 = var_62_17 <= 0 and var_62_13 or var_62_13 * (var_62_18 / var_62_17)

				if var_62_19 > 0 and var_62_13 < var_62_19 then
					arg_59_1.talkMaxDuration = var_62_19

					if var_62_19 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_19 + var_62_12
					end
				end

				arg_59_1.text_.text = var_62_16
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521015", "story_v_out_122521.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_122521", "122521015", "story_v_out_122521.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_122521", "122521015", "story_v_out_122521.awb")

						arg_59_1:RecordAudio("122521015", var_62_21)
						arg_59_1:RecordAudio("122521015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_122521", "122521015", "story_v_out_122521.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_122521", "122521015", "story_v_out_122521.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_22 = math.max(var_62_13, arg_59_1.talkMaxDuration)

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_22 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_12) / var_62_22

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_12 + var_62_22 and arg_59_1.time_ < var_62_12 + var_62_22 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play122521016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 122521016
		arg_63_1.duration_ = 5.133

		local var_63_0 = {
			ja = 5.133,
			ko = 2.766,
			zh = 2.766
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
				arg_63_0:Play122521017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.225

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[45].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(122521016)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521016", "story_v_out_122521.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521016", "story_v_out_122521.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_122521", "122521016", "story_v_out_122521.awb")

						arg_63_1:RecordAudio("122521016", var_66_9)
						arg_63_1:RecordAudio("122521016", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_122521", "122521016", "story_v_out_122521.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_122521", "122521016", "story_v_out_122521.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_10 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_10 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_10

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_10 and arg_63_1.time_ < var_66_0 + var_66_10 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play122521017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 122521017
		arg_67_1.duration_ = 9.666

		local var_67_0 = {
			ja = 9.666,
			ko = 5.566,
			zh = 5.566
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
				arg_67_0:Play122521018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["4037ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect4037ui_story == nil then
				arg_67_1.var_.characterEffect4037ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect4037ui_story then
					arg_67_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect4037ui_story then
				arg_67_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_70_4 = 0

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action5_1")
			end

			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_6 = arg_67_1.actors_["10045ui_story"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.characterEffect10045ui_story == nil then
				arg_67_1.var_.characterEffect10045ui_story = var_70_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_8 = 0.200000002980232

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.characterEffect10045ui_story then
					local var_70_10 = Mathf.Lerp(0, 0.5, var_70_9)

					arg_67_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10045ui_story.fillRatio = var_70_10
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.characterEffect10045ui_story then
				local var_70_11 = 0.5

				arg_67_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10045ui_story.fillRatio = var_70_11
			end

			local var_70_12 = 0
			local var_70_13 = 0.525

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_14 = arg_67_1:FormatText(StoryNameCfg[453].name)

				arg_67_1.leftNameTxt_.text = var_70_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_15 = arg_67_1:GetWordFromCfg(122521017)
				local var_70_16 = arg_67_1:FormatText(var_70_15.content)

				arg_67_1.text_.text = var_70_16

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_17 = 21
				local var_70_18 = utf8.len(var_70_16)
				local var_70_19 = var_70_17 <= 0 and var_70_13 or var_70_13 * (var_70_18 / var_70_17)

				if var_70_19 > 0 and var_70_13 < var_70_19 then
					arg_67_1.talkMaxDuration = var_70_19

					if var_70_19 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_12
					end
				end

				arg_67_1.text_.text = var_70_16
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521017", "story_v_out_122521.awb") ~= 0 then
					local var_70_20 = manager.audio:GetVoiceLength("story_v_out_122521", "122521017", "story_v_out_122521.awb") / 1000

					if var_70_20 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_12
					end

					if var_70_15.prefab_name ~= "" and arg_67_1.actors_[var_70_15.prefab_name] ~= nil then
						local var_70_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_15.prefab_name].transform, "story_v_out_122521", "122521017", "story_v_out_122521.awb")

						arg_67_1:RecordAudio("122521017", var_70_21)
						arg_67_1:RecordAudio("122521017", var_70_21)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_122521", "122521017", "story_v_out_122521.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_122521", "122521017", "story_v_out_122521.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_22 = math.max(var_70_13, arg_67_1.talkMaxDuration)

			if var_70_12 <= arg_67_1.time_ and arg_67_1.time_ < var_70_12 + var_70_22 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_12) / var_70_22

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_12 + var_70_22 and arg_67_1.time_ < var_70_12 + var_70_22 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play122521018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 122521018
		arg_71_1.duration_ = 3.033

		local var_71_0 = {
			ja = 3.033,
			ko = 1.866,
			zh = 1.866
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
				arg_71_0:Play122521019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10045ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos10045ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(-0.7, -1.18, -6.05)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10045ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["10045ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect10045ui_story == nil then
				arg_71_1.var_.characterEffect10045ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect10045ui_story then
					arg_71_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect10045ui_story then
				arg_71_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_74_13 = 0

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action1_1")
			end

			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_74_15 = arg_71_1.actors_["4037ui_story"]
			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 and arg_71_1.var_.characterEffect4037ui_story == nil then
				arg_71_1.var_.characterEffect4037ui_story = var_74_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_17 = 0.200000002980232

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / var_74_17

				if arg_71_1.var_.characterEffect4037ui_story then
					local var_74_19 = Mathf.Lerp(0, 0.5, var_74_18)

					arg_71_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_71_1.var_.characterEffect4037ui_story.fillRatio = var_74_19
				end
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 and arg_71_1.var_.characterEffect4037ui_story then
				local var_74_20 = 0.5

				arg_71_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_71_1.var_.characterEffect4037ui_story.fillRatio = var_74_20
			end

			local var_74_21 = 0
			local var_74_22 = 0.15

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_23 = arg_71_1:FormatText(StoryNameCfg[45].name)

				arg_71_1.leftNameTxt_.text = var_74_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_24 = arg_71_1:GetWordFromCfg(122521018)
				local var_74_25 = arg_71_1:FormatText(var_74_24.content)

				arg_71_1.text_.text = var_74_25

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_26 = 6
				local var_74_27 = utf8.len(var_74_25)
				local var_74_28 = var_74_26 <= 0 and var_74_22 or var_74_22 * (var_74_27 / var_74_26)

				if var_74_28 > 0 and var_74_22 < var_74_28 then
					arg_71_1.talkMaxDuration = var_74_28

					if var_74_28 + var_74_21 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_28 + var_74_21
					end
				end

				arg_71_1.text_.text = var_74_25
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521018", "story_v_out_122521.awb") ~= 0 then
					local var_74_29 = manager.audio:GetVoiceLength("story_v_out_122521", "122521018", "story_v_out_122521.awb") / 1000

					if var_74_29 + var_74_21 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_29 + var_74_21
					end

					if var_74_24.prefab_name ~= "" and arg_71_1.actors_[var_74_24.prefab_name] ~= nil then
						local var_74_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_24.prefab_name].transform, "story_v_out_122521", "122521018", "story_v_out_122521.awb")

						arg_71_1:RecordAudio("122521018", var_74_30)
						arg_71_1:RecordAudio("122521018", var_74_30)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_122521", "122521018", "story_v_out_122521.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_122521", "122521018", "story_v_out_122521.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_31 = math.max(var_74_22, arg_71_1.talkMaxDuration)

			if var_74_21 <= arg_71_1.time_ and arg_71_1.time_ < var_74_21 + var_74_31 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_21) / var_74_31

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_21 + var_74_31 and arg_71_1.time_ < var_74_21 + var_74_31 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play122521019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 122521019
		arg_75_1.duration_ = 7.2

		local var_75_0 = {
			ja = 7.2,
			ko = 7,
			zh = 7
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
				arg_75_0:Play122521020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["4037ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos4037ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0.7, -1.12, -6.2)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos4037ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["4037ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect4037ui_story == nil then
				arg_75_1.var_.characterEffect4037ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect4037ui_story then
					arg_75_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect4037ui_story then
				arg_75_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action5_2")
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_15 = arg_75_1.actors_["10045ui_story"]
			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 and arg_75_1.var_.characterEffect10045ui_story == nil then
				arg_75_1.var_.characterEffect10045ui_story = var_78_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_17 = 0.200000002980232

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17

				if arg_75_1.var_.characterEffect10045ui_story then
					local var_78_19 = Mathf.Lerp(0, 0.5, var_78_18)

					arg_75_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_75_1.var_.characterEffect10045ui_story.fillRatio = var_78_19
				end
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 and arg_75_1.var_.characterEffect10045ui_story then
				local var_78_20 = 0.5

				arg_75_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_75_1.var_.characterEffect10045ui_story.fillRatio = var_78_20
			end

			local var_78_21 = 0
			local var_78_22 = 0.8

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_23 = arg_75_1:FormatText(StoryNameCfg[453].name)

				arg_75_1.leftNameTxt_.text = var_78_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_24 = arg_75_1:GetWordFromCfg(122521019)
				local var_78_25 = arg_75_1:FormatText(var_78_24.content)

				arg_75_1.text_.text = var_78_25

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_26 = 32
				local var_78_27 = utf8.len(var_78_25)
				local var_78_28 = var_78_26 <= 0 and var_78_22 or var_78_22 * (var_78_27 / var_78_26)

				if var_78_28 > 0 and var_78_22 < var_78_28 then
					arg_75_1.talkMaxDuration = var_78_28

					if var_78_28 + var_78_21 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_28 + var_78_21
					end
				end

				arg_75_1.text_.text = var_78_25
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521019", "story_v_out_122521.awb") ~= 0 then
					local var_78_29 = manager.audio:GetVoiceLength("story_v_out_122521", "122521019", "story_v_out_122521.awb") / 1000

					if var_78_29 + var_78_21 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_29 + var_78_21
					end

					if var_78_24.prefab_name ~= "" and arg_75_1.actors_[var_78_24.prefab_name] ~= nil then
						local var_78_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_24.prefab_name].transform, "story_v_out_122521", "122521019", "story_v_out_122521.awb")

						arg_75_1:RecordAudio("122521019", var_78_30)
						arg_75_1:RecordAudio("122521019", var_78_30)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_122521", "122521019", "story_v_out_122521.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_122521", "122521019", "story_v_out_122521.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_31 = math.max(var_78_22, arg_75_1.talkMaxDuration)

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_31 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_21) / var_78_31

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_21 + var_78_31 and arg_75_1.time_ < var_78_21 + var_78_31 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play122521020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 122521020
		arg_79_1.duration_ = 21

		local var_79_0 = {
			ja = 21,
			ko = 14.166,
			zh = 14.166
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
				arg_79_0:Play122521021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["4037ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos4037ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0.7, -1.12, -6.2)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos4037ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["4037ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect4037ui_story == nil then
				arg_79_1.var_.characterEffect4037ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect4037ui_story then
					arg_79_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect4037ui_story then
				arg_79_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_15 = 0
			local var_82_16 = 1.45

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_17 = arg_79_1:FormatText(StoryNameCfg[453].name)

				arg_79_1.leftNameTxt_.text = var_82_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_18 = arg_79_1:GetWordFromCfg(122521020)
				local var_82_19 = arg_79_1:FormatText(var_82_18.content)

				arg_79_1.text_.text = var_82_19

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_20 = 58
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521020", "story_v_out_122521.awb") ~= 0 then
					local var_82_23 = manager.audio:GetVoiceLength("story_v_out_122521", "122521020", "story_v_out_122521.awb") / 1000

					if var_82_23 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_23 + var_82_15
					end

					if var_82_18.prefab_name ~= "" and arg_79_1.actors_[var_82_18.prefab_name] ~= nil then
						local var_82_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_18.prefab_name].transform, "story_v_out_122521", "122521020", "story_v_out_122521.awb")

						arg_79_1:RecordAudio("122521020", var_82_24)
						arg_79_1:RecordAudio("122521020", var_82_24)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_122521", "122521020", "story_v_out_122521.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_122521", "122521020", "story_v_out_122521.awb")
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
	Play122521021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 122521021
		arg_83_1.duration_ = 9.433

		local var_83_0 = {
			ja = 9.433,
			ko = 8.333,
			zh = 8.333
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
				arg_83_0:Play122521022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10045ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos10045ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(-0.7, -1.18, -6.05)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10045ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["10045ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect10045ui_story == nil then
				arg_83_1.var_.characterEffect10045ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect10045ui_story then
					arg_83_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect10045ui_story then
				arg_83_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action1_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_86_15 = arg_83_1.actors_["4037ui_story"]
			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 and arg_83_1.var_.characterEffect4037ui_story == nil then
				arg_83_1.var_.characterEffect4037ui_story = var_86_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_17 = 0.200000002980232

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17

				if arg_83_1.var_.characterEffect4037ui_story then
					local var_86_19 = Mathf.Lerp(0, 0.5, var_86_18)

					arg_83_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_83_1.var_.characterEffect4037ui_story.fillRatio = var_86_19
				end
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 and arg_83_1.var_.characterEffect4037ui_story then
				local var_86_20 = 0.5

				arg_83_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_83_1.var_.characterEffect4037ui_story.fillRatio = var_86_20
			end

			local var_86_21 = 0
			local var_86_22 = 0.875

			if var_86_21 < arg_83_1.time_ and arg_83_1.time_ <= var_86_21 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_23 = arg_83_1:FormatText(StoryNameCfg[45].name)

				arg_83_1.leftNameTxt_.text = var_86_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_24 = arg_83_1:GetWordFromCfg(122521021)
				local var_86_25 = arg_83_1:FormatText(var_86_24.content)

				arg_83_1.text_.text = var_86_25

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_26 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521021", "story_v_out_122521.awb") ~= 0 then
					local var_86_29 = manager.audio:GetVoiceLength("story_v_out_122521", "122521021", "story_v_out_122521.awb") / 1000

					if var_86_29 + var_86_21 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_29 + var_86_21
					end

					if var_86_24.prefab_name ~= "" and arg_83_1.actors_[var_86_24.prefab_name] ~= nil then
						local var_86_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_24.prefab_name].transform, "story_v_out_122521", "122521021", "story_v_out_122521.awb")

						arg_83_1:RecordAudio("122521021", var_86_30)
						arg_83_1:RecordAudio("122521021", var_86_30)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_122521", "122521021", "story_v_out_122521.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_122521", "122521021", "story_v_out_122521.awb")
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
	Play122521022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 122521022
		arg_87_1.duration_ = 5.433

		local var_87_0 = {
			ja = 4.866,
			ko = 5.433,
			zh = 5.433
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
				arg_87_0:Play122521023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["4037ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos4037ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0.7, -1.12, -6.2)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos4037ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["4037ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect4037ui_story == nil then
				arg_87_1.var_.characterEffect4037ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect4037ui_story then
					arg_87_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect4037ui_story then
				arg_87_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_15 = arg_87_1.actors_["10045ui_story"]
			local var_90_16 = 0

			if var_90_16 < arg_87_1.time_ and arg_87_1.time_ <= var_90_16 + arg_90_0 and arg_87_1.var_.characterEffect10045ui_story == nil then
				arg_87_1.var_.characterEffect10045ui_story = var_90_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_17 = 0.200000002980232

			if var_90_16 <= arg_87_1.time_ and arg_87_1.time_ < var_90_16 + var_90_17 then
				local var_90_18 = (arg_87_1.time_ - var_90_16) / var_90_17

				if arg_87_1.var_.characterEffect10045ui_story then
					local var_90_19 = Mathf.Lerp(0, 0.5, var_90_18)

					arg_87_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_87_1.var_.characterEffect10045ui_story.fillRatio = var_90_19
				end
			end

			if arg_87_1.time_ >= var_90_16 + var_90_17 and arg_87_1.time_ < var_90_16 + var_90_17 + arg_90_0 and arg_87_1.var_.characterEffect10045ui_story then
				local var_90_20 = 0.5

				arg_87_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_87_1.var_.characterEffect10045ui_story.fillRatio = var_90_20
			end

			local var_90_21 = 0
			local var_90_22 = 0.375

			if var_90_21 < arg_87_1.time_ and arg_87_1.time_ <= var_90_21 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_23 = arg_87_1:FormatText(StoryNameCfg[453].name)

				arg_87_1.leftNameTxt_.text = var_90_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_24 = arg_87_1:GetWordFromCfg(122521022)
				local var_90_25 = arg_87_1:FormatText(var_90_24.content)

				arg_87_1.text_.text = var_90_25

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_26 = 15
				local var_90_27 = utf8.len(var_90_25)
				local var_90_28 = var_90_26 <= 0 and var_90_22 or var_90_22 * (var_90_27 / var_90_26)

				if var_90_28 > 0 and var_90_22 < var_90_28 then
					arg_87_1.talkMaxDuration = var_90_28

					if var_90_28 + var_90_21 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_28 + var_90_21
					end
				end

				arg_87_1.text_.text = var_90_25
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521022", "story_v_out_122521.awb") ~= 0 then
					local var_90_29 = manager.audio:GetVoiceLength("story_v_out_122521", "122521022", "story_v_out_122521.awb") / 1000

					if var_90_29 + var_90_21 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_29 + var_90_21
					end

					if var_90_24.prefab_name ~= "" and arg_87_1.actors_[var_90_24.prefab_name] ~= nil then
						local var_90_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_24.prefab_name].transform, "story_v_out_122521", "122521022", "story_v_out_122521.awb")

						arg_87_1:RecordAudio("122521022", var_90_30)
						arg_87_1:RecordAudio("122521022", var_90_30)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_122521", "122521022", "story_v_out_122521.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_122521", "122521022", "story_v_out_122521.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_31 = math.max(var_90_22, arg_87_1.talkMaxDuration)

			if var_90_21 <= arg_87_1.time_ and arg_87_1.time_ < var_90_21 + var_90_31 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_21) / var_90_31

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_21 + var_90_31 and arg_87_1.time_ < var_90_21 + var_90_31 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play122521023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 122521023
		arg_91_1.duration_ = 9.566

		local var_91_0 = {
			ja = 9.566,
			ko = 6.066,
			zh = 6.066
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
				arg_91_0:Play122521024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10045ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos10045ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(-0.7, -1.18, -6.05)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10045ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["10045ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect10045ui_story == nil then
				arg_91_1.var_.characterEffect10045ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect10045ui_story then
					arg_91_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect10045ui_story then
				arg_91_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action1_1")
			end

			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_94_15 = arg_91_1.actors_["4037ui_story"]
			local var_94_16 = 0

			if var_94_16 < arg_91_1.time_ and arg_91_1.time_ <= var_94_16 + arg_94_0 and arg_91_1.var_.characterEffect4037ui_story == nil then
				arg_91_1.var_.characterEffect4037ui_story = var_94_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_17 = 0.200000002980232

			if var_94_16 <= arg_91_1.time_ and arg_91_1.time_ < var_94_16 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_16) / var_94_17

				if arg_91_1.var_.characterEffect4037ui_story then
					local var_94_19 = Mathf.Lerp(0, 0.5, var_94_18)

					arg_91_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_91_1.var_.characterEffect4037ui_story.fillRatio = var_94_19
				end
			end

			if arg_91_1.time_ >= var_94_16 + var_94_17 and arg_91_1.time_ < var_94_16 + var_94_17 + arg_94_0 and arg_91_1.var_.characterEffect4037ui_story then
				local var_94_20 = 0.5

				arg_91_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_91_1.var_.characterEffect4037ui_story.fillRatio = var_94_20
			end

			local var_94_21 = 0
			local var_94_22 = 0.7

			if var_94_21 < arg_91_1.time_ and arg_91_1.time_ <= var_94_21 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_23 = arg_91_1:FormatText(StoryNameCfg[45].name)

				arg_91_1.leftNameTxt_.text = var_94_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_24 = arg_91_1:GetWordFromCfg(122521023)
				local var_94_25 = arg_91_1:FormatText(var_94_24.content)

				arg_91_1.text_.text = var_94_25

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_26 = 28
				local var_94_27 = utf8.len(var_94_25)
				local var_94_28 = var_94_26 <= 0 and var_94_22 or var_94_22 * (var_94_27 / var_94_26)

				if var_94_28 > 0 and var_94_22 < var_94_28 then
					arg_91_1.talkMaxDuration = var_94_28

					if var_94_28 + var_94_21 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_28 + var_94_21
					end
				end

				arg_91_1.text_.text = var_94_25
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521023", "story_v_out_122521.awb") ~= 0 then
					local var_94_29 = manager.audio:GetVoiceLength("story_v_out_122521", "122521023", "story_v_out_122521.awb") / 1000

					if var_94_29 + var_94_21 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_29 + var_94_21
					end

					if var_94_24.prefab_name ~= "" and arg_91_1.actors_[var_94_24.prefab_name] ~= nil then
						local var_94_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_24.prefab_name].transform, "story_v_out_122521", "122521023", "story_v_out_122521.awb")

						arg_91_1:RecordAudio("122521023", var_94_30)
						arg_91_1:RecordAudio("122521023", var_94_30)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_122521", "122521023", "story_v_out_122521.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_122521", "122521023", "story_v_out_122521.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_31 = math.max(var_94_22, arg_91_1.talkMaxDuration)

			if var_94_21 <= arg_91_1.time_ and arg_91_1.time_ < var_94_21 + var_94_31 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_21) / var_94_31

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_21 + var_94_31 and arg_91_1.time_ < var_94_21 + var_94_31 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play122521024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 122521024
		arg_95_1.duration_ = 2.733

		local var_95_0 = {
			ja = 2.733,
			ko = 2.6,
			zh = 2.6
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
				arg_95_0:Play122521025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["4037ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos4037ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0.7, -1.12, -6.2)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos4037ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["4037ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect4037ui_story == nil then
				arg_95_1.var_.characterEffect4037ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect4037ui_story then
					arg_95_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect4037ui_story then
				arg_95_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action1_1")
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_15 = arg_95_1.actors_["10045ui_story"]
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 and arg_95_1.var_.characterEffect10045ui_story == nil then
				arg_95_1.var_.characterEffect10045ui_story = var_98_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_17 = 0.200000002980232

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17

				if arg_95_1.var_.characterEffect10045ui_story then
					local var_98_19 = Mathf.Lerp(0, 0.5, var_98_18)

					arg_95_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10045ui_story.fillRatio = var_98_19
				end
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 and arg_95_1.var_.characterEffect10045ui_story then
				local var_98_20 = 0.5

				arg_95_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10045ui_story.fillRatio = var_98_20
			end

			local var_98_21 = 0
			local var_98_22 = 0.25

			if var_98_21 < arg_95_1.time_ and arg_95_1.time_ <= var_98_21 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_23 = arg_95_1:FormatText(StoryNameCfg[453].name)

				arg_95_1.leftNameTxt_.text = var_98_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_24 = arg_95_1:GetWordFromCfg(122521024)
				local var_98_25 = arg_95_1:FormatText(var_98_24.content)

				arg_95_1.text_.text = var_98_25

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_26 = 10
				local var_98_27 = utf8.len(var_98_25)
				local var_98_28 = var_98_26 <= 0 and var_98_22 or var_98_22 * (var_98_27 / var_98_26)

				if var_98_28 > 0 and var_98_22 < var_98_28 then
					arg_95_1.talkMaxDuration = var_98_28

					if var_98_28 + var_98_21 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_28 + var_98_21
					end
				end

				arg_95_1.text_.text = var_98_25
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521024", "story_v_out_122521.awb") ~= 0 then
					local var_98_29 = manager.audio:GetVoiceLength("story_v_out_122521", "122521024", "story_v_out_122521.awb") / 1000

					if var_98_29 + var_98_21 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_29 + var_98_21
					end

					if var_98_24.prefab_name ~= "" and arg_95_1.actors_[var_98_24.prefab_name] ~= nil then
						local var_98_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_24.prefab_name].transform, "story_v_out_122521", "122521024", "story_v_out_122521.awb")

						arg_95_1:RecordAudio("122521024", var_98_30)
						arg_95_1:RecordAudio("122521024", var_98_30)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_122521", "122521024", "story_v_out_122521.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_122521", "122521024", "story_v_out_122521.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_31 = math.max(var_98_22, arg_95_1.talkMaxDuration)

			if var_98_21 <= arg_95_1.time_ and arg_95_1.time_ < var_98_21 + var_98_31 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_21) / var_98_31

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_21 + var_98_31 and arg_95_1.time_ < var_98_21 + var_98_31 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play122521025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 122521025
		arg_99_1.duration_ = 3.533

		local var_99_0 = {
			ja = 3.533,
			ko = 2.666,
			zh = 2.666
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
				arg_99_0:Play122521026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10045ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos10045ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(-0.7, -1.18, -6.05)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10045ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["10045ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect10045ui_story == nil then
				arg_99_1.var_.characterEffect10045ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect10045ui_story then
					arg_99_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect10045ui_story then
				arg_99_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action1_1")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_15 = arg_99_1.actors_["4037ui_story"]
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 and arg_99_1.var_.characterEffect4037ui_story == nil then
				arg_99_1.var_.characterEffect4037ui_story = var_102_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_17 = 0.200000002980232

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17

				if arg_99_1.var_.characterEffect4037ui_story then
					local var_102_19 = Mathf.Lerp(0, 0.5, var_102_18)

					arg_99_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_99_1.var_.characterEffect4037ui_story.fillRatio = var_102_19
				end
			end

			if arg_99_1.time_ >= var_102_16 + var_102_17 and arg_99_1.time_ < var_102_16 + var_102_17 + arg_102_0 and arg_99_1.var_.characterEffect4037ui_story then
				local var_102_20 = 0.5

				arg_99_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_99_1.var_.characterEffect4037ui_story.fillRatio = var_102_20
			end

			local var_102_21 = 0
			local var_102_22 = 0.3

			if var_102_21 < arg_99_1.time_ and arg_99_1.time_ <= var_102_21 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_23 = arg_99_1:FormatText(StoryNameCfg[45].name)

				arg_99_1.leftNameTxt_.text = var_102_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_24 = arg_99_1:GetWordFromCfg(122521025)
				local var_102_25 = arg_99_1:FormatText(var_102_24.content)

				arg_99_1.text_.text = var_102_25

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_26 = 12
				local var_102_27 = utf8.len(var_102_25)
				local var_102_28 = var_102_26 <= 0 and var_102_22 or var_102_22 * (var_102_27 / var_102_26)

				if var_102_28 > 0 and var_102_22 < var_102_28 then
					arg_99_1.talkMaxDuration = var_102_28

					if var_102_28 + var_102_21 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_28 + var_102_21
					end
				end

				arg_99_1.text_.text = var_102_25
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521025", "story_v_out_122521.awb") ~= 0 then
					local var_102_29 = manager.audio:GetVoiceLength("story_v_out_122521", "122521025", "story_v_out_122521.awb") / 1000

					if var_102_29 + var_102_21 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_29 + var_102_21
					end

					if var_102_24.prefab_name ~= "" and arg_99_1.actors_[var_102_24.prefab_name] ~= nil then
						local var_102_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_24.prefab_name].transform, "story_v_out_122521", "122521025", "story_v_out_122521.awb")

						arg_99_1:RecordAudio("122521025", var_102_30)
						arg_99_1:RecordAudio("122521025", var_102_30)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_122521", "122521025", "story_v_out_122521.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_122521", "122521025", "story_v_out_122521.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_31 = math.max(var_102_22, arg_99_1.talkMaxDuration)

			if var_102_21 <= arg_99_1.time_ and arg_99_1.time_ < var_102_21 + var_102_31 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_21) / var_102_31

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_21 + var_102_31 and arg_99_1.time_ < var_102_21 + var_102_31 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play122521026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 122521026
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play122521027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10045ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10045ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, 100, 0)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10045ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, 100, 0)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["10045ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect10045ui_story == nil then
				arg_103_1.var_.characterEffect10045ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect10045ui_story then
					local var_106_13 = Mathf.Lerp(0, 0.5, var_106_12)

					arg_103_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_103_1.var_.characterEffect10045ui_story.fillRatio = var_106_13
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect10045ui_story then
				local var_106_14 = 0.5

				arg_103_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_103_1.var_.characterEffect10045ui_story.fillRatio = var_106_14
			end

			local var_106_15 = arg_103_1.actors_["4037ui_story"].transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.moveOldPos4037ui_story = var_106_15.localPosition
			end

			local var_106_17 = 0.001

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Vector3.New(0, 100, 0)

				var_106_15.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos4037ui_story, var_106_19, var_106_18)

				local var_106_20 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_20.x, var_106_20.y, var_106_20.z)

				local var_106_21 = var_106_15.localEulerAngles

				var_106_21.z = 0
				var_106_21.x = 0
				var_106_15.localEulerAngles = var_106_21
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				var_106_15.localPosition = Vector3.New(0, 100, 0)

				local var_106_22 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_22.x, var_106_22.y, var_106_22.z)

				local var_106_23 = var_106_15.localEulerAngles

				var_106_23.z = 0
				var_106_23.x = 0
				var_106_15.localEulerAngles = var_106_23
			end

			local var_106_24 = arg_103_1.actors_["4037ui_story"]
			local var_106_25 = 0

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 and arg_103_1.var_.characterEffect4037ui_story == nil then
				arg_103_1.var_.characterEffect4037ui_story = var_106_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_26 = 0.200000002980232

			if var_106_25 <= arg_103_1.time_ and arg_103_1.time_ < var_106_25 + var_106_26 then
				local var_106_27 = (arg_103_1.time_ - var_106_25) / var_106_26

				if arg_103_1.var_.characterEffect4037ui_story then
					local var_106_28 = Mathf.Lerp(0, 0.5, var_106_27)

					arg_103_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_103_1.var_.characterEffect4037ui_story.fillRatio = var_106_28
				end
			end

			if arg_103_1.time_ >= var_106_25 + var_106_26 and arg_103_1.time_ < var_106_25 + var_106_26 + arg_106_0 and arg_103_1.var_.characterEffect4037ui_story then
				local var_106_29 = 0.5

				arg_103_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_103_1.var_.characterEffect4037ui_story.fillRatio = var_106_29
			end

			local var_106_30 = 0
			local var_106_31 = 0.475

			if var_106_30 < arg_103_1.time_ and arg_103_1.time_ <= var_106_30 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_32 = arg_103_1:GetWordFromCfg(122521026)
				local var_106_33 = arg_103_1:FormatText(var_106_32.content)

				arg_103_1.text_.text = var_106_33

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_34 = 19
				local var_106_35 = utf8.len(var_106_33)
				local var_106_36 = var_106_34 <= 0 and var_106_31 or var_106_31 * (var_106_35 / var_106_34)

				if var_106_36 > 0 and var_106_31 < var_106_36 then
					arg_103_1.talkMaxDuration = var_106_36

					if var_106_36 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_36 + var_106_30
					end
				end

				arg_103_1.text_.text = var_106_33
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_37 = math.max(var_106_31, arg_103_1.talkMaxDuration)

			if var_106_30 <= arg_103_1.time_ and arg_103_1.time_ < var_106_30 + var_106_37 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_30) / var_106_37

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_30 + var_106_37 and arg_103_1.time_ < var_106_30 + var_106_37 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play122521027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 122521027
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play122521028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = manager.ui.mainCamera.transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.shakeOldPos = var_110_0.localPosition
			end

			local var_110_2 = 1

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / 0.066
				local var_110_4, var_110_5 = math.modf(var_110_3)

				var_110_0.localPosition = Vector3.New(var_110_5 * 0.13, var_110_5 * 0.13, var_110_5 * 0.13) + arg_107_1.var_.shakeOldPos
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = arg_107_1.var_.shakeOldPos
			end

			local var_110_6 = 0

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.allBtn_.enabled = false
			end

			local var_110_7 = 1

			if arg_107_1.time_ >= var_110_6 + var_110_7 and arg_107_1.time_ < var_110_6 + var_110_7 + arg_110_0 then
				arg_107_1.allBtn_.enabled = true
			end

			local var_110_8 = 0
			local var_110_9 = 1.275

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0

				arg_107_1.dialog_:SetActive(true)

				local var_110_10 = LeanTween.value(arg_107_1.dialog_, 0, 1, 0.3)

				var_110_10:setOnUpdate(LuaHelper.FloatAction(function(arg_111_0)
					arg_107_1.dialogCg_.alpha = arg_111_0
				end))
				var_110_10:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_107_1.dialog_)
					var_110_10:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_107_1.duration_ = arg_107_1.duration_ + 0.3

				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_11 = arg_107_1:GetWordFromCfg(122521027)
				local var_110_12 = arg_107_1:FormatText(var_110_11.content)

				arg_107_1.text_.text = var_110_12

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_13 = 51
				local var_110_14 = utf8.len(var_110_12)
				local var_110_15 = var_110_13 <= 0 and var_110_9 or var_110_9 * (var_110_14 / var_110_13)

				if var_110_15 > 0 and var_110_9 < var_110_15 then
					arg_107_1.talkMaxDuration = var_110_15
					var_110_8 = var_110_8 + 0.3

					if var_110_15 + var_110_8 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_15 + var_110_8
					end
				end

				arg_107_1.text_.text = var_110_12
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_16 = var_110_8 + 0.3
			local var_110_17 = math.max(var_110_9, arg_107_1.talkMaxDuration)

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_16) / var_110_17

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play122521028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 122521028
		arg_113_1.duration_ = 6.23333333333333

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play122521029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.mask_.enabled = true
				arg_113_1.mask_.raycastTarget = true

				arg_113_1:SetGaussion(false)
			end

			local var_116_1 = 2

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_1 then
				local var_116_2 = (arg_113_1.time_ - var_116_0) / var_116_1
				local var_116_3 = Color.New(1, 1, 1)

				var_116_3.a = Mathf.Lerp(1, 0, var_116_2)
				arg_113_1.mask_.color = var_116_3
			end

			if arg_113_1.time_ >= var_116_0 + var_116_1 and arg_113_1.time_ < var_116_0 + var_116_1 + arg_116_0 then
				local var_116_4 = Color.New(1, 1, 1)
				local var_116_5 = 0

				arg_113_1.mask_.enabled = false
				var_116_4.a = var_116_5
				arg_113_1.mask_.color = var_116_4
			end

			local var_116_6 = "STwhite"

			if arg_113_1.bgs_[var_116_6] == nil then
				local var_116_7 = Object.Instantiate(arg_113_1.paintGo_)

				var_116_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_116_6)
				var_116_7.name = var_116_6
				var_116_7.transform.parent = arg_113_1.stage_.transform
				var_116_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.bgs_[var_116_6] = var_116_7
			end

			local var_116_8 = 0

			if var_116_8 < arg_113_1.time_ and arg_113_1.time_ <= var_116_8 + arg_116_0 then
				local var_116_9 = manager.ui.mainCamera.transform.localPosition
				local var_116_10 = Vector3.New(0, 0, 10) + Vector3.New(var_116_9.x, var_116_9.y, 0)
				local var_116_11 = arg_113_1.bgs_.STwhite

				var_116_11.transform.localPosition = var_116_10
				var_116_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_116_12 = var_116_11:GetComponent("SpriteRenderer")

				if var_116_12 and var_116_12.sprite then
					local var_116_13 = (var_116_11.transform.localPosition - var_116_9).z
					local var_116_14 = manager.ui.mainCameraCom_
					local var_116_15 = 2 * var_116_13 * Mathf.Tan(var_116_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_116_16 = var_116_15 * var_116_14.aspect
					local var_116_17 = var_116_12.sprite.bounds.size.x
					local var_116_18 = var_116_12.sprite.bounds.size.y
					local var_116_19 = var_116_16 / var_116_17
					local var_116_20 = var_116_15 / var_116_18
					local var_116_21 = var_116_20 < var_116_19 and var_116_19 or var_116_20

					var_116_11.transform.localScale = Vector3.New(var_116_21, var_116_21, 0)
				end

				for iter_116_0, iter_116_1 in pairs(arg_113_1.bgs_) do
					if iter_116_0 ~= "STwhite" then
						iter_116_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_116_22 = 0
			local var_116_23 = 1

			if var_116_22 < arg_113_1.time_ and arg_113_1.time_ <= var_116_22 + arg_116_0 then
				local var_116_24 = "play"
				local var_116_25 = "effect"

				arg_113_1:AudioAction(var_116_24, var_116_25, "se_story_121_04", "se_story_121_04_explosion", "")
			end

			local var_116_26 = 0
			local var_116_27 = 1

			if var_116_26 < arg_113_1.time_ and arg_113_1.time_ <= var_116_26 + arg_116_0 then
				local var_116_28 = "play"
				local var_116_29 = "effect"

				arg_113_1:AudioAction(var_116_28, var_116_29, "se_story_122_03", "se_story_122_03_4038bullet6", "")
			end

			if arg_113_1.frameCnt_ <= 1 then
				arg_113_1.dialog_:SetActive(false)
			end

			local var_116_30 = 1.23333333333333
			local var_116_31 = 1.4

			if var_116_30 < arg_113_1.time_ and arg_113_1.time_ <= var_116_30 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0

				arg_113_1.dialog_:SetActive(true)

				local var_116_32 = LeanTween.value(arg_113_1.dialog_, 0, 1, 0.3)

				var_116_32:setOnUpdate(LuaHelper.FloatAction(function(arg_117_0)
					arg_113_1.dialogCg_.alpha = arg_117_0
				end))
				var_116_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_113_1.dialog_)
					var_116_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_113_1.duration_ = arg_113_1.duration_ + 0.3

				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_33 = arg_113_1:GetWordFromCfg(122521028)
				local var_116_34 = arg_113_1:FormatText(var_116_33.content)

				arg_113_1.text_.text = var_116_34

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_35 = 56
				local var_116_36 = utf8.len(var_116_34)
				local var_116_37 = var_116_35 <= 0 and var_116_31 or var_116_31 * (var_116_36 / var_116_35)

				if var_116_37 > 0 and var_116_31 < var_116_37 then
					arg_113_1.talkMaxDuration = var_116_37
					var_116_30 = var_116_30 + 0.3

					if var_116_37 + var_116_30 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_37 + var_116_30
					end
				end

				arg_113_1.text_.text = var_116_34
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_38 = var_116_30 + 0.3
			local var_116_39 = math.max(var_116_31, arg_113_1.talkMaxDuration)

			if var_116_38 <= arg_113_1.time_ and arg_113_1.time_ < var_116_38 + var_116_39 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_38) / var_116_39

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_38 + var_116_39 and arg_113_1.time_ < var_116_38 + var_116_39 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play122521029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 122521029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play122521030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 1

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				local var_122_2 = "play"
				local var_122_3 = "effect"

				arg_119_1:AudioAction(var_122_2, var_122_3, "se_story_122_03", "se_story_122_03_4038bullet1", "")
			end

			local var_122_4 = 0
			local var_122_5 = 1.75

			if var_122_4 < arg_119_1.time_ and arg_119_1.time_ <= var_122_4 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_6 = arg_119_1:GetWordFromCfg(122521029)
				local var_122_7 = arg_119_1:FormatText(var_122_6.content)

				arg_119_1.text_.text = var_122_7

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_8 = 70
				local var_122_9 = utf8.len(var_122_7)
				local var_122_10 = var_122_8 <= 0 and var_122_5 or var_122_5 * (var_122_9 / var_122_8)

				if var_122_10 > 0 and var_122_5 < var_122_10 then
					arg_119_1.talkMaxDuration = var_122_10

					if var_122_10 + var_122_4 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_10 + var_122_4
					end
				end

				arg_119_1.text_.text = var_122_7
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_11 = math.max(var_122_5, arg_119_1.talkMaxDuration)

			if var_122_4 <= arg_119_1.time_ and arg_119_1.time_ < var_122_4 + var_122_11 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_4) / var_122_11

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_4 + var_122_11 and arg_119_1.time_ < var_122_4 + var_122_11 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play122521030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 122521030
		arg_123_1.duration_ = 11

		local var_123_0 = {
			ja = 11,
			ko = 5.633,
			zh = 5.633
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
				arg_123_0:Play122521031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.425

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[36].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(122521030)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 17
				local var_126_6 = utf8.len(var_126_4)
				local var_126_7 = var_126_5 <= 0 and var_126_1 or var_126_1 * (var_126_6 / var_126_5)

				if var_126_7 > 0 and var_126_1 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_4
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521030", "story_v_out_122521.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521030", "story_v_out_122521.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_122521", "122521030", "story_v_out_122521.awb")

						arg_123_1:RecordAudio("122521030", var_126_9)
						arg_123_1:RecordAudio("122521030", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_122521", "122521030", "story_v_out_122521.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_122521", "122521030", "story_v_out_122521.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_10 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_10 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_10

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_10 and arg_123_1.time_ < var_126_0 + var_126_10 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play122521031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 122521031
		arg_127_1.duration_ = 3.166

		local var_127_0 = {
			ja = 3.166,
			ko = 1.533,
			zh = 1.533
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
				arg_127_0:Play122521032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.125

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[453].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4037")

				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(122521031)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 5
				local var_130_6 = utf8.len(var_130_4)
				local var_130_7 = var_130_5 <= 0 and var_130_1 or var_130_1 * (var_130_6 / var_130_5)

				if var_130_7 > 0 and var_130_1 < var_130_7 then
					arg_127_1.talkMaxDuration = var_130_7

					if var_130_7 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_7 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_4
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521031", "story_v_out_122521.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521031", "story_v_out_122521.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_122521", "122521031", "story_v_out_122521.awb")

						arg_127_1:RecordAudio("122521031", var_130_9)
						arg_127_1:RecordAudio("122521031", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_122521", "122521031", "story_v_out_122521.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_122521", "122521031", "story_v_out_122521.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_10 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_10 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_10

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_10 and arg_127_1.time_ < var_130_0 + var_130_10 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play122521032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 122521032
		arg_131_1.duration_ = 6.999999999999

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play122521033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = "XH0605"

			if arg_131_1.bgs_[var_134_0] == nil then
				local var_134_1 = Object.Instantiate(arg_131_1.paintGo_)

				var_134_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_134_0)
				var_134_1.name = var_134_0
				var_134_1.transform.parent = arg_131_1.stage_.transform
				var_134_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_131_1.bgs_[var_134_0] = var_134_1
			end

			local var_134_2 = 0

			if var_134_2 < arg_131_1.time_ and arg_131_1.time_ <= var_134_2 + arg_134_0 then
				local var_134_3 = manager.ui.mainCamera.transform.localPosition
				local var_134_4 = Vector3.New(0, 0, 10) + Vector3.New(var_134_3.x, var_134_3.y, 0)
				local var_134_5 = arg_131_1.bgs_.XH0605

				var_134_5.transform.localPosition = var_134_4
				var_134_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_134_6 = var_134_5:GetComponent("SpriteRenderer")

				if var_134_6 and var_134_6.sprite then
					local var_134_7 = (var_134_5.transform.localPosition - var_134_3).z
					local var_134_8 = manager.ui.mainCameraCom_
					local var_134_9 = 2 * var_134_7 * Mathf.Tan(var_134_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_134_10 = var_134_9 * var_134_8.aspect
					local var_134_11 = var_134_6.sprite.bounds.size.x
					local var_134_12 = var_134_6.sprite.bounds.size.y
					local var_134_13 = var_134_10 / var_134_11
					local var_134_14 = var_134_9 / var_134_12
					local var_134_15 = var_134_14 < var_134_13 and var_134_13 or var_134_14

					var_134_5.transform.localScale = Vector3.New(var_134_15, var_134_15, 0)
				end

				for iter_134_0, iter_134_1 in pairs(arg_131_1.bgs_) do
					if iter_134_0 ~= "XH0605" then
						iter_134_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_134_16 = 0

			if var_134_16 < arg_131_1.time_ and arg_131_1.time_ <= var_134_16 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_17 = 2

			if var_134_16 <= arg_131_1.time_ and arg_131_1.time_ < var_134_16 + var_134_17 then
				local var_134_18 = (arg_131_1.time_ - var_134_16) / var_134_17
				local var_134_19 = Color.New(1, 1, 1)

				var_134_19.a = Mathf.Lerp(1, 0, var_134_18)
				arg_131_1.mask_.color = var_134_19
			end

			if arg_131_1.time_ >= var_134_16 + var_134_17 and arg_131_1.time_ < var_134_16 + var_134_17 + arg_134_0 then
				local var_134_20 = Color.New(1, 1, 1)
				local var_134_21 = 0

				arg_131_1.mask_.enabled = false
				var_134_20.a = var_134_21
				arg_131_1.mask_.color = var_134_20
			end

			local var_134_22 = arg_131_1.actors_["4037ui_story"]
			local var_134_23 = 0

			if var_134_23 < arg_131_1.time_ and arg_131_1.time_ <= var_134_23 + arg_134_0 and arg_131_1.var_.characterEffect4037ui_story == nil then
				arg_131_1.var_.characterEffect4037ui_story = var_134_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_24 = 0.200000002980232

			if var_134_23 <= arg_131_1.time_ and arg_131_1.time_ < var_134_23 + var_134_24 then
				local var_134_25 = (arg_131_1.time_ - var_134_23) / var_134_24

				if arg_131_1.var_.characterEffect4037ui_story then
					local var_134_26 = Mathf.Lerp(0, 0.5, var_134_25)

					arg_131_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_131_1.var_.characterEffect4037ui_story.fillRatio = var_134_26
				end
			end

			if arg_131_1.time_ >= var_134_23 + var_134_24 and arg_131_1.time_ < var_134_23 + var_134_24 + arg_134_0 and arg_131_1.var_.characterEffect4037ui_story then
				local var_134_27 = 0.5

				arg_131_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_131_1.var_.characterEffect4037ui_story.fillRatio = var_134_27
			end

			local var_134_28 = arg_131_1.actors_["4037ui_story"].transform
			local var_134_29 = 0

			if var_134_29 < arg_131_1.time_ and arg_131_1.time_ <= var_134_29 + arg_134_0 then
				arg_131_1.var_.moveOldPos4037ui_story = var_134_28.localPosition
			end

			local var_134_30 = 0.001

			if var_134_29 <= arg_131_1.time_ and arg_131_1.time_ < var_134_29 + var_134_30 then
				local var_134_31 = (arg_131_1.time_ - var_134_29) / var_134_30
				local var_134_32 = Vector3.New(0, 100, 0)

				var_134_28.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos4037ui_story, var_134_32, var_134_31)

				local var_134_33 = manager.ui.mainCamera.transform.position - var_134_28.position

				var_134_28.forward = Vector3.New(var_134_33.x, var_134_33.y, var_134_33.z)

				local var_134_34 = var_134_28.localEulerAngles

				var_134_34.z = 0
				var_134_34.x = 0
				var_134_28.localEulerAngles = var_134_34
			end

			if arg_131_1.time_ >= var_134_29 + var_134_30 and arg_131_1.time_ < var_134_29 + var_134_30 + arg_134_0 then
				var_134_28.localPosition = Vector3.New(0, 100, 0)

				local var_134_35 = manager.ui.mainCamera.transform.position - var_134_28.position

				var_134_28.forward = Vector3.New(var_134_35.x, var_134_35.y, var_134_35.z)

				local var_134_36 = var_134_28.localEulerAngles

				var_134_36.z = 0
				var_134_36.x = 0
				var_134_28.localEulerAngles = var_134_36
			end

			local var_134_37 = arg_131_1.bgs_.XH0605.transform
			local var_134_38 = 0

			if var_134_38 < arg_131_1.time_ and arg_131_1.time_ <= var_134_38 + arg_134_0 then
				arg_131_1.var_.moveOldPosXH0605 = var_134_37.localPosition
			end

			local var_134_39 = 0.001

			if var_134_38 <= arg_131_1.time_ and arg_131_1.time_ < var_134_38 + var_134_39 then
				local var_134_40 = (arg_131_1.time_ - var_134_38) / var_134_39
				local var_134_41 = Vector3.New(0, 1, 9.5)

				var_134_37.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPosXH0605, var_134_41, var_134_40)
			end

			if arg_131_1.time_ >= var_134_38 + var_134_39 and arg_131_1.time_ < var_134_38 + var_134_39 + arg_134_0 then
				var_134_37.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_134_42 = arg_131_1.bgs_.XH0605.transform
			local var_134_43 = 0.034

			if var_134_43 < arg_131_1.time_ and arg_131_1.time_ <= var_134_43 + arg_134_0 then
				arg_131_1.var_.moveOldPosXH0605 = var_134_42.localPosition
			end

			local var_134_44 = 4.5

			if var_134_43 <= arg_131_1.time_ and arg_131_1.time_ < var_134_43 + var_134_44 then
				local var_134_45 = (arg_131_1.time_ - var_134_43) / var_134_44
				local var_134_46 = Vector3.New(0, 1, 10)

				var_134_42.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPosXH0605, var_134_46, var_134_45)
			end

			if arg_131_1.time_ >= var_134_43 + var_134_44 and arg_131_1.time_ < var_134_43 + var_134_44 + arg_134_0 then
				var_134_42.localPosition = Vector3.New(0, 1, 10)
			end

			local var_134_47 = 1.999999999999

			if var_134_47 < arg_131_1.time_ and arg_131_1.time_ <= var_134_47 + arg_134_0 then
				arg_131_1.allBtn_.enabled = false
			end

			local var_134_48 = 2.534000000001

			if arg_131_1.time_ >= var_134_47 + var_134_48 and arg_131_1.time_ < var_134_47 + var_134_48 + arg_134_0 then
				arg_131_1.allBtn_.enabled = true
			end

			if arg_131_1.frameCnt_ <= 1 then
				arg_131_1.dialog_:SetActive(false)
			end

			local var_134_49 = 1.999999999999
			local var_134_50 = 0.8

			if var_134_49 < arg_131_1.time_ and arg_131_1.time_ <= var_134_49 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				arg_131_1.dialog_:SetActive(true)

				local var_134_51 = LeanTween.value(arg_131_1.dialog_, 0, 1, 0.3)

				var_134_51:setOnUpdate(LuaHelper.FloatAction(function(arg_135_0)
					arg_131_1.dialogCg_.alpha = arg_135_0
				end))
				var_134_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_131_1.dialog_)
					var_134_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_131_1.duration_ = arg_131_1.duration_ + 0.3

				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_52 = arg_131_1:GetWordFromCfg(122521032)
				local var_134_53 = arg_131_1:FormatText(var_134_52.content)

				arg_131_1.text_.text = var_134_53

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_54 = 32
				local var_134_55 = utf8.len(var_134_53)
				local var_134_56 = var_134_54 <= 0 and var_134_50 or var_134_50 * (var_134_55 / var_134_54)

				if var_134_56 > 0 and var_134_50 < var_134_56 then
					arg_131_1.talkMaxDuration = var_134_56
					var_134_49 = var_134_49 + 0.3

					if var_134_56 + var_134_49 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_56 + var_134_49
					end
				end

				arg_131_1.text_.text = var_134_53
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_57 = var_134_49 + 0.3
			local var_134_58 = math.max(var_134_50, arg_131_1.talkMaxDuration)

			if var_134_57 <= arg_131_1.time_ and arg_131_1.time_ < var_134_57 + var_134_58 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_57) / var_134_58

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_57 + var_134_58 and arg_131_1.time_ < var_134_57 + var_134_58 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play122521033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 122521033
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play122521034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 1.6

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_2 = arg_137_1:GetWordFromCfg(122521033)
				local var_140_3 = arg_137_1:FormatText(var_140_2.content)

				arg_137_1.text_.text = var_140_3

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_4 = 64
				local var_140_5 = utf8.len(var_140_3)
				local var_140_6 = var_140_4 <= 0 and var_140_1 or var_140_1 * (var_140_5 / var_140_4)

				if var_140_6 > 0 and var_140_1 < var_140_6 then
					arg_137_1.talkMaxDuration = var_140_6

					if var_140_6 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_6 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_3
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_7 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_7 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_7

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_7 and arg_137_1.time_ < var_140_0 + var_140_7 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play122521034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 122521034
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play122521035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.525

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

				local var_144_2 = arg_141_1:GetWordFromCfg(122521034)
				local var_144_3 = arg_141_1:FormatText(var_144_2.content)

				arg_141_1.text_.text = var_144_3

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_4 = 21
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
	Play122521035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 122521035
		arg_145_1.duration_ = 5.6

		local var_145_0 = {
			ja = 5.6,
			ko = 3.866,
			zh = 3.866
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
				arg_145_0:Play122521036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.325

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[453].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, true)
				arg_145_1.iconController_:SetSelectedState("hero")

				arg_145_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4037")

				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(122521035)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 13
				local var_148_6 = utf8.len(var_148_4)
				local var_148_7 = var_148_5 <= 0 and var_148_1 or var_148_1 * (var_148_6 / var_148_5)

				if var_148_7 > 0 and var_148_1 < var_148_7 then
					arg_145_1.talkMaxDuration = var_148_7

					if var_148_7 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_7 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_4
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521035", "story_v_out_122521.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521035", "story_v_out_122521.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_122521", "122521035", "story_v_out_122521.awb")

						arg_145_1:RecordAudio("122521035", var_148_9)
						arg_145_1:RecordAudio("122521035", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_122521", "122521035", "story_v_out_122521.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_122521", "122521035", "story_v_out_122521.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_10 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_10 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_10

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_10 and arg_145_1.time_ < var_148_0 + var_148_10 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play122521036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 122521036
		arg_149_1.duration_ = 18.233

		local var_149_0 = {
			ja = 18.233,
			ko = 10.6,
			zh = 10.6
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
				arg_149_0:Play122521037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 1

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[319].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(122521036)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 40
				local var_152_6 = utf8.len(var_152_4)
				local var_152_7 = var_152_5 <= 0 and var_152_1 or var_152_1 * (var_152_6 / var_152_5)

				if var_152_7 > 0 and var_152_1 < var_152_7 then
					arg_149_1.talkMaxDuration = var_152_7

					if var_152_7 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_7 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_4
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521036", "story_v_out_122521.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521036", "story_v_out_122521.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_122521", "122521036", "story_v_out_122521.awb")

						arg_149_1:RecordAudio("122521036", var_152_9)
						arg_149_1:RecordAudio("122521036", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_122521", "122521036", "story_v_out_122521.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_122521", "122521036", "story_v_out_122521.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_10 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_10 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_10

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_10 and arg_149_1.time_ < var_152_0 + var_152_10 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play122521037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 122521037
		arg_153_1.duration_ = 17.066

		local var_153_0 = {
			ja = 17.066,
			ko = 7.3,
			zh = 7.3
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
				arg_153_0:Play122521038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.85

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[319].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(122521037)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 34
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521037", "story_v_out_122521.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521037", "story_v_out_122521.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_122521", "122521037", "story_v_out_122521.awb")

						arg_153_1:RecordAudio("122521037", var_156_9)
						arg_153_1:RecordAudio("122521037", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_122521", "122521037", "story_v_out_122521.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_122521", "122521037", "story_v_out_122521.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_10 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_10 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_10

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_10 and arg_153_1.time_ < var_156_0 + var_156_10 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play122521038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 122521038
		arg_157_1.duration_ = 9.3

		local var_157_0 = {
			ja = 9.3,
			ko = 6.633,
			zh = 6.633
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
				arg_157_0:Play122521039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.625

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[453].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, true)
				arg_157_1.iconController_:SetSelectedState("hero")

				arg_157_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4037")

				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(122521038)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 25
				local var_160_6 = utf8.len(var_160_4)
				local var_160_7 = var_160_5 <= 0 and var_160_1 or var_160_1 * (var_160_6 / var_160_5)

				if var_160_7 > 0 and var_160_1 < var_160_7 then
					arg_157_1.talkMaxDuration = var_160_7

					if var_160_7 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_7 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_4
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521038", "story_v_out_122521.awb") ~= 0 then
					local var_160_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521038", "story_v_out_122521.awb") / 1000

					if var_160_8 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_8 + var_160_0
					end

					if var_160_3.prefab_name ~= "" and arg_157_1.actors_[var_160_3.prefab_name] ~= nil then
						local var_160_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_3.prefab_name].transform, "story_v_out_122521", "122521038", "story_v_out_122521.awb")

						arg_157_1:RecordAudio("122521038", var_160_9)
						arg_157_1:RecordAudio("122521038", var_160_9)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_122521", "122521038", "story_v_out_122521.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_122521", "122521038", "story_v_out_122521.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_10 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_10 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_10

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_10 and arg_157_1.time_ < var_160_0 + var_160_10 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play122521039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 122521039
		arg_161_1.duration_ = 10.433

		local var_161_0 = {
			ja = 10.433,
			ko = 4.7,
			zh = 4.7
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
				arg_161_0:Play122521040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.375

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[319].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(122521039)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 15
				local var_164_6 = utf8.len(var_164_4)
				local var_164_7 = var_164_5 <= 0 and var_164_1 or var_164_1 * (var_164_6 / var_164_5)

				if var_164_7 > 0 and var_164_1 < var_164_7 then
					arg_161_1.talkMaxDuration = var_164_7

					if var_164_7 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_7 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_4
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521039", "story_v_out_122521.awb") ~= 0 then
					local var_164_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521039", "story_v_out_122521.awb") / 1000

					if var_164_8 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_8 + var_164_0
					end

					if var_164_3.prefab_name ~= "" and arg_161_1.actors_[var_164_3.prefab_name] ~= nil then
						local var_164_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_3.prefab_name].transform, "story_v_out_122521", "122521039", "story_v_out_122521.awb")

						arg_161_1:RecordAudio("122521039", var_164_9)
						arg_161_1:RecordAudio("122521039", var_164_9)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_122521", "122521039", "story_v_out_122521.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_122521", "122521039", "story_v_out_122521.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_10 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_10 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_10

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_10 and arg_161_1.time_ < var_164_0 + var_164_10 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play122521040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 122521040
		arg_165_1.duration_ = 13.2

		local var_165_0 = {
			ja = 13.2,
			ko = 8.7,
			zh = 8.7
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
				arg_165_0:Play122521041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.9

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[319].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(122521040)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 36
				local var_168_6 = utf8.len(var_168_4)
				local var_168_7 = var_168_5 <= 0 and var_168_1 or var_168_1 * (var_168_6 / var_168_5)

				if var_168_7 > 0 and var_168_1 < var_168_7 then
					arg_165_1.talkMaxDuration = var_168_7

					if var_168_7 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_7 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_4
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521040", "story_v_out_122521.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521040", "story_v_out_122521.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_out_122521", "122521040", "story_v_out_122521.awb")

						arg_165_1:RecordAudio("122521040", var_168_9)
						arg_165_1:RecordAudio("122521040", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_122521", "122521040", "story_v_out_122521.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_122521", "122521040", "story_v_out_122521.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_10 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_10 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_10

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_10 and arg_165_1.time_ < var_168_0 + var_168_10 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play122521041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 122521041
		arg_169_1.duration_ = 4.3

		local var_169_0 = {
			ja = 4.3,
			ko = 1.4,
			zh = 1.4
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
				arg_169_0:Play122521042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.15

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_2 = arg_169_1:FormatText(StoryNameCfg[319].name)

				arg_169_1.leftNameTxt_.text = var_172_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_3 = arg_169_1:GetWordFromCfg(122521041)
				local var_172_4 = arg_169_1:FormatText(var_172_3.content)

				arg_169_1.text_.text = var_172_4

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521041", "story_v_out_122521.awb") ~= 0 then
					local var_172_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521041", "story_v_out_122521.awb") / 1000

					if var_172_8 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_8 + var_172_0
					end

					if var_172_3.prefab_name ~= "" and arg_169_1.actors_[var_172_3.prefab_name] ~= nil then
						local var_172_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_3.prefab_name].transform, "story_v_out_122521", "122521041", "story_v_out_122521.awb")

						arg_169_1:RecordAudio("122521041", var_172_9)
						arg_169_1:RecordAudio("122521041", var_172_9)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_122521", "122521041", "story_v_out_122521.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_122521", "122521041", "story_v_out_122521.awb")
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
	Play122521042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 122521042
		arg_173_1.duration_ = 6.7

		local var_173_0 = {
			ja = 6.7,
			ko = 2.5,
			zh = 2.5
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
				arg_173_0:Play122521043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 0.3

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_2 = arg_173_1:FormatText(StoryNameCfg[453].name)

				arg_173_1.leftNameTxt_.text = var_176_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4037")

				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_3 = arg_173_1:GetWordFromCfg(122521042)
				local var_176_4 = arg_173_1:FormatText(var_176_3.content)

				arg_173_1.text_.text = var_176_4

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_5 = 12
				local var_176_6 = utf8.len(var_176_4)
				local var_176_7 = var_176_5 <= 0 and var_176_1 or var_176_1 * (var_176_6 / var_176_5)

				if var_176_7 > 0 and var_176_1 < var_176_7 then
					arg_173_1.talkMaxDuration = var_176_7

					if var_176_7 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_7 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_4
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521042", "story_v_out_122521.awb") ~= 0 then
					local var_176_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521042", "story_v_out_122521.awb") / 1000

					if var_176_8 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_8 + var_176_0
					end

					if var_176_3.prefab_name ~= "" and arg_173_1.actors_[var_176_3.prefab_name] ~= nil then
						local var_176_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_3.prefab_name].transform, "story_v_out_122521", "122521042", "story_v_out_122521.awb")

						arg_173_1:RecordAudio("122521042", var_176_9)
						arg_173_1:RecordAudio("122521042", var_176_9)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_122521", "122521042", "story_v_out_122521.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_122521", "122521042", "story_v_out_122521.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_10 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_10 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_10

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_10 and arg_173_1.time_ < var_176_0 + var_176_10 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play122521043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 122521043
		arg_177_1.duration_ = 8

		local var_177_0 = {
			ja = 8,
			ko = 3.5,
			zh = 3.5
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
				arg_177_0:Play122521044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.275

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[319].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(122521043)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521043", "story_v_out_122521.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521043", "story_v_out_122521.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_122521", "122521043", "story_v_out_122521.awb")

						arg_177_1:RecordAudio("122521043", var_180_9)
						arg_177_1:RecordAudio("122521043", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_122521", "122521043", "story_v_out_122521.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_122521", "122521043", "story_v_out_122521.awb")
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
	Play122521044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 122521044
		arg_181_1.duration_ = 1.5

		local var_181_0 = {
			ja = 1.5,
			ko = 0.999999999999,
			zh = 0.999999999999
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
				arg_181_0:Play122521045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.05

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_2 = arg_181_1:FormatText(StoryNameCfg[453].name)

				arg_181_1.leftNameTxt_.text = var_184_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, true)
				arg_181_1.iconController_:SetSelectedState("hero")

				arg_181_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4037")

				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_3 = arg_181_1:GetWordFromCfg(122521044)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 2
				local var_184_6 = utf8.len(var_184_4)
				local var_184_7 = var_184_5 <= 0 and var_184_1 or var_184_1 * (var_184_6 / var_184_5)

				if var_184_7 > 0 and var_184_1 < var_184_7 then
					arg_181_1.talkMaxDuration = var_184_7

					if var_184_7 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_7 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_4
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521044", "story_v_out_122521.awb") ~= 0 then
					local var_184_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521044", "story_v_out_122521.awb") / 1000

					if var_184_8 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_8 + var_184_0
					end

					if var_184_3.prefab_name ~= "" and arg_181_1.actors_[var_184_3.prefab_name] ~= nil then
						local var_184_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_3.prefab_name].transform, "story_v_out_122521", "122521044", "story_v_out_122521.awb")

						arg_181_1:RecordAudio("122521044", var_184_9)
						arg_181_1:RecordAudio("122521044", var_184_9)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_122521", "122521044", "story_v_out_122521.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_122521", "122521044", "story_v_out_122521.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_10 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_10 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_10

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_10 and arg_181_1.time_ < var_184_0 + var_184_10 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play122521045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 122521045
		arg_185_1.duration_ = 15.5

		local var_185_0 = {
			ja = 15.5,
			ko = 9.2,
			zh = 9.2
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
				arg_185_0:Play122521046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.875

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_2 = arg_185_1:FormatText(StoryNameCfg[319].name)

				arg_185_1.leftNameTxt_.text = var_188_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_3 = arg_185_1:GetWordFromCfg(122521045)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 35
				local var_188_6 = utf8.len(var_188_4)
				local var_188_7 = var_188_5 <= 0 and var_188_1 or var_188_1 * (var_188_6 / var_188_5)

				if var_188_7 > 0 and var_188_1 < var_188_7 then
					arg_185_1.talkMaxDuration = var_188_7

					if var_188_7 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_7 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_4
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521045", "story_v_out_122521.awb") ~= 0 then
					local var_188_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521045", "story_v_out_122521.awb") / 1000

					if var_188_8 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_8 + var_188_0
					end

					if var_188_3.prefab_name ~= "" and arg_185_1.actors_[var_188_3.prefab_name] ~= nil then
						local var_188_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_3.prefab_name].transform, "story_v_out_122521", "122521045", "story_v_out_122521.awb")

						arg_185_1:RecordAudio("122521045", var_188_9)
						arg_185_1:RecordAudio("122521045", var_188_9)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_122521", "122521045", "story_v_out_122521.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_122521", "122521045", "story_v_out_122521.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_10 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_10 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_10

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_10 and arg_185_1.time_ < var_188_0 + var_188_10 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play122521046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 122521046
		arg_189_1.duration_ = 16.866

		local var_189_0 = {
			ja = 16.866,
			ko = 7.933,
			zh = 7.933
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
				arg_189_0:Play122521047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.95

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[319].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(122521046)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 38
				local var_192_6 = utf8.len(var_192_4)
				local var_192_7 = var_192_5 <= 0 and var_192_1 or var_192_1 * (var_192_6 / var_192_5)

				if var_192_7 > 0 and var_192_1 < var_192_7 then
					arg_189_1.talkMaxDuration = var_192_7

					if var_192_7 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_7 + var_192_0
					end
				end

				arg_189_1.text_.text = var_192_4
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521046", "story_v_out_122521.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521046", "story_v_out_122521.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_122521", "122521046", "story_v_out_122521.awb")

						arg_189_1:RecordAudio("122521046", var_192_9)
						arg_189_1:RecordAudio("122521046", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_122521", "122521046", "story_v_out_122521.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_122521", "122521046", "story_v_out_122521.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_10 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_10 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_10

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_10 and arg_189_1.time_ < var_192_0 + var_192_10 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play122521047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 122521047
		arg_193_1.duration_ = 17.033

		local var_193_0 = {
			ja = 17.033,
			ko = 8.466,
			zh = 8.466
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
				arg_193_0:Play122521048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.925

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[319].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(122521047)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 37
				local var_196_6 = utf8.len(var_196_4)
				local var_196_7 = var_196_5 <= 0 and var_196_1 or var_196_1 * (var_196_6 / var_196_5)

				if var_196_7 > 0 and var_196_1 < var_196_7 then
					arg_193_1.talkMaxDuration = var_196_7

					if var_196_7 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_7 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_4
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521047", "story_v_out_122521.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521047", "story_v_out_122521.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_122521", "122521047", "story_v_out_122521.awb")

						arg_193_1:RecordAudio("122521047", var_196_9)
						arg_193_1:RecordAudio("122521047", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_122521", "122521047", "story_v_out_122521.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_122521", "122521047", "story_v_out_122521.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_10 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_10 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_10

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_10 and arg_193_1.time_ < var_196_0 + var_196_10 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play122521048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 122521048
		arg_197_1.duration_ = 13.666

		local var_197_0 = {
			ja = 12.233,
			ko = 13.666,
			zh = 13.666
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
				arg_197_0:Play122521049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 1.225

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[319].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(122521048)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 49
				local var_200_6 = utf8.len(var_200_4)
				local var_200_7 = var_200_5 <= 0 and var_200_1 or var_200_1 * (var_200_6 / var_200_5)

				if var_200_7 > 0 and var_200_1 < var_200_7 then
					arg_197_1.talkMaxDuration = var_200_7

					if var_200_7 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_7 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_4
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521048", "story_v_out_122521.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521048", "story_v_out_122521.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_122521", "122521048", "story_v_out_122521.awb")

						arg_197_1:RecordAudio("122521048", var_200_9)
						arg_197_1:RecordAudio("122521048", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_122521", "122521048", "story_v_out_122521.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_122521", "122521048", "story_v_out_122521.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_10 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_10 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_10

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_10 and arg_197_1.time_ < var_200_0 + var_200_10 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play122521049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 122521049
		arg_201_1.duration_ = 10.1

		local var_201_0 = {
			ja = 10.1,
			ko = 7.7,
			zh = 7.7
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
				arg_201_0:Play122521050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 0.85

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_2 = arg_201_1:FormatText(StoryNameCfg[453].name)

				arg_201_1.leftNameTxt_.text = var_204_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, true)
				arg_201_1.iconController_:SetSelectedState("hero")

				arg_201_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4037")

				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_3 = arg_201_1:GetWordFromCfg(122521049)
				local var_204_4 = arg_201_1:FormatText(var_204_3.content)

				arg_201_1.text_.text = var_204_4

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521049", "story_v_out_122521.awb") ~= 0 then
					local var_204_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521049", "story_v_out_122521.awb") / 1000

					if var_204_8 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_8 + var_204_0
					end

					if var_204_3.prefab_name ~= "" and arg_201_1.actors_[var_204_3.prefab_name] ~= nil then
						local var_204_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_3.prefab_name].transform, "story_v_out_122521", "122521049", "story_v_out_122521.awb")

						arg_201_1:RecordAudio("122521049", var_204_9)
						arg_201_1:RecordAudio("122521049", var_204_9)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_122521", "122521049", "story_v_out_122521.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_122521", "122521049", "story_v_out_122521.awb")
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
	Play122521050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 122521050
		arg_205_1.duration_ = 12.266

		local var_205_0 = {
			ja = 12.266,
			ko = 4.6,
			zh = 4.6
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
				arg_205_0:Play122521051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.5

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[453].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, true)
				arg_205_1.iconController_:SetSelectedState("hero")

				arg_205_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4037")

				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(122521050)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 20
				local var_208_6 = utf8.len(var_208_4)
				local var_208_7 = var_208_5 <= 0 and var_208_1 or var_208_1 * (var_208_6 / var_208_5)

				if var_208_7 > 0 and var_208_1 < var_208_7 then
					arg_205_1.talkMaxDuration = var_208_7

					if var_208_7 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_7 + var_208_0
					end
				end

				arg_205_1.text_.text = var_208_4
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521050", "story_v_out_122521.awb") ~= 0 then
					local var_208_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521050", "story_v_out_122521.awb") / 1000

					if var_208_8 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_8 + var_208_0
					end

					if var_208_3.prefab_name ~= "" and arg_205_1.actors_[var_208_3.prefab_name] ~= nil then
						local var_208_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_3.prefab_name].transform, "story_v_out_122521", "122521050", "story_v_out_122521.awb")

						arg_205_1:RecordAudio("122521050", var_208_9)
						arg_205_1:RecordAudio("122521050", var_208_9)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_122521", "122521050", "story_v_out_122521.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_122521", "122521050", "story_v_out_122521.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_10 = math.max(var_208_1, arg_205_1.talkMaxDuration)

			if var_208_0 <= arg_205_1.time_ and arg_205_1.time_ < var_208_0 + var_208_10 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_0) / var_208_10

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_0 + var_208_10 and arg_205_1.time_ < var_208_0 + var_208_10 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play122521051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 122521051
		arg_209_1.duration_ = 2.9

		local var_209_0 = {
			ja = 2.9,
			ko = 2.233,
			zh = 2.233
		}
		local var_209_1 = manager.audio:GetLocalizationFlag()

		if var_209_0[var_209_1] ~= nil then
			arg_209_1.duration_ = var_209_0[var_209_1]
		end

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play122521052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 0.25

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[319].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(122521051)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 10
				local var_212_6 = utf8.len(var_212_4)
				local var_212_7 = var_212_5 <= 0 and var_212_1 or var_212_1 * (var_212_6 / var_212_5)

				if var_212_7 > 0 and var_212_1 < var_212_7 then
					arg_209_1.talkMaxDuration = var_212_7

					if var_212_7 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_7 + var_212_0
					end
				end

				arg_209_1.text_.text = var_212_4
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521051", "story_v_out_122521.awb") ~= 0 then
					local var_212_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521051", "story_v_out_122521.awb") / 1000

					if var_212_8 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_0
					end

					if var_212_3.prefab_name ~= "" and arg_209_1.actors_[var_212_3.prefab_name] ~= nil then
						local var_212_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_3.prefab_name].transform, "story_v_out_122521", "122521051", "story_v_out_122521.awb")

						arg_209_1:RecordAudio("122521051", var_212_9)
						arg_209_1:RecordAudio("122521051", var_212_9)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_122521", "122521051", "story_v_out_122521.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_122521", "122521051", "story_v_out_122521.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_10 = math.max(var_212_1, arg_209_1.talkMaxDuration)

			if var_212_0 <= arg_209_1.time_ and arg_209_1.time_ < var_212_0 + var_212_10 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_0) / var_212_10

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_0 + var_212_10 and arg_209_1.time_ < var_212_0 + var_212_10 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play122521052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 122521052
		arg_213_1.duration_ = 8.8

		local var_213_0 = {
			ja = 8.8,
			ko = 4.733,
			zh = 4.733
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
				arg_213_0:Play122521053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 0.45

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_2 = arg_213_1:FormatText(StoryNameCfg[319].name)

				arg_213_1.leftNameTxt_.text = var_216_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_3 = arg_213_1:GetWordFromCfg(122521052)
				local var_216_4 = arg_213_1:FormatText(var_216_3.content)

				arg_213_1.text_.text = var_216_4

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_5 = 18
				local var_216_6 = utf8.len(var_216_4)
				local var_216_7 = var_216_5 <= 0 and var_216_1 or var_216_1 * (var_216_6 / var_216_5)

				if var_216_7 > 0 and var_216_1 < var_216_7 then
					arg_213_1.talkMaxDuration = var_216_7

					if var_216_7 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_7 + var_216_0
					end
				end

				arg_213_1.text_.text = var_216_4
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521052", "story_v_out_122521.awb") ~= 0 then
					local var_216_8 = manager.audio:GetVoiceLength("story_v_out_122521", "122521052", "story_v_out_122521.awb") / 1000

					if var_216_8 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_8 + var_216_0
					end

					if var_216_3.prefab_name ~= "" and arg_213_1.actors_[var_216_3.prefab_name] ~= nil then
						local var_216_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_3.prefab_name].transform, "story_v_out_122521", "122521052", "story_v_out_122521.awb")

						arg_213_1:RecordAudio("122521052", var_216_9)
						arg_213_1:RecordAudio("122521052", var_216_9)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_122521", "122521052", "story_v_out_122521.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_122521", "122521052", "story_v_out_122521.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_10 = math.max(var_216_1, arg_213_1.talkMaxDuration)

			if var_216_0 <= arg_213_1.time_ and arg_213_1.time_ < var_216_0 + var_216_10 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_0) / var_216_10

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_0 + var_216_10 and arg_213_1.time_ < var_216_0 + var_216_10 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play122521053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 122521053
		arg_217_1.duration_ = 9

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play122521054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 2

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				local var_220_1 = manager.ui.mainCamera.transform.localPosition
				local var_220_2 = Vector3.New(0, 0, 10) + Vector3.New(var_220_1.x, var_220_1.y, 0)
				local var_220_3 = arg_217_1.bgs_.J07f

				var_220_3.transform.localPosition = var_220_2
				var_220_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_220_4 = var_220_3:GetComponent("SpriteRenderer")

				if var_220_4 and var_220_4.sprite then
					local var_220_5 = (var_220_3.transform.localPosition - var_220_1).z
					local var_220_6 = manager.ui.mainCameraCom_
					local var_220_7 = 2 * var_220_5 * Mathf.Tan(var_220_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_220_8 = var_220_7 * var_220_6.aspect
					local var_220_9 = var_220_4.sprite.bounds.size.x
					local var_220_10 = var_220_4.sprite.bounds.size.y
					local var_220_11 = var_220_8 / var_220_9
					local var_220_12 = var_220_7 / var_220_10
					local var_220_13 = var_220_12 < var_220_11 and var_220_11 or var_220_12

					var_220_3.transform.localScale = Vector3.New(var_220_13, var_220_13, 0)
				end

				for iter_220_0, iter_220_1 in pairs(arg_217_1.bgs_) do
					if iter_220_0 ~= "J07f" then
						iter_220_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_220_14 = 0

			if var_220_14 < arg_217_1.time_ and arg_217_1.time_ <= var_220_14 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_15 = 2

			if var_220_14 <= arg_217_1.time_ and arg_217_1.time_ < var_220_14 + var_220_15 then
				local var_220_16 = (arg_217_1.time_ - var_220_14) / var_220_15
				local var_220_17 = Color.New(0, 0, 0)

				var_220_17.a = Mathf.Lerp(0, 1, var_220_16)
				arg_217_1.mask_.color = var_220_17
			end

			if arg_217_1.time_ >= var_220_14 + var_220_15 and arg_217_1.time_ < var_220_14 + var_220_15 + arg_220_0 then
				local var_220_18 = Color.New(0, 0, 0)

				var_220_18.a = 1
				arg_217_1.mask_.color = var_220_18
			end

			local var_220_19 = 2

			if var_220_19 < arg_217_1.time_ and arg_217_1.time_ <= var_220_19 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_20 = 2

			if var_220_19 <= arg_217_1.time_ and arg_217_1.time_ < var_220_19 + var_220_20 then
				local var_220_21 = (arg_217_1.time_ - var_220_19) / var_220_20
				local var_220_22 = Color.New(0, 0, 0)

				var_220_22.a = Mathf.Lerp(1, 0, var_220_21)
				arg_217_1.mask_.color = var_220_22
			end

			if arg_217_1.time_ >= var_220_19 + var_220_20 and arg_217_1.time_ < var_220_19 + var_220_20 + arg_220_0 then
				local var_220_23 = Color.New(0, 0, 0)
				local var_220_24 = 0

				arg_217_1.mask_.enabled = false
				var_220_23.a = var_220_24
				arg_217_1.mask_.color = var_220_23
			end

			if arg_217_1.frameCnt_ <= 1 then
				arg_217_1.dialog_:SetActive(false)
			end

			local var_220_25 = 4
			local var_220_26 = 1.525

			if var_220_25 < arg_217_1.time_ and arg_217_1.time_ <= var_220_25 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0

				arg_217_1.dialog_:SetActive(true)

				local var_220_27 = LeanTween.value(arg_217_1.dialog_, 0, 1, 0.3)

				var_220_27:setOnUpdate(LuaHelper.FloatAction(function(arg_221_0)
					arg_217_1.dialogCg_.alpha = arg_221_0
				end))
				var_220_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_217_1.dialog_)
					var_220_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_217_1.duration_ = arg_217_1.duration_ + 0.3

				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_28 = arg_217_1:GetWordFromCfg(122521053)
				local var_220_29 = arg_217_1:FormatText(var_220_28.content)

				arg_217_1.text_.text = var_220_29

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_30 = 61
				local var_220_31 = utf8.len(var_220_29)
				local var_220_32 = var_220_30 <= 0 and var_220_26 or var_220_26 * (var_220_31 / var_220_30)

				if var_220_32 > 0 and var_220_26 < var_220_32 then
					arg_217_1.talkMaxDuration = var_220_32
					var_220_25 = var_220_25 + 0.3

					if var_220_32 + var_220_25 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_32 + var_220_25
					end
				end

				arg_217_1.text_.text = var_220_29
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_33 = var_220_25 + 0.3
			local var_220_34 = math.max(var_220_26, arg_217_1.talkMaxDuration)

			if var_220_33 <= arg_217_1.time_ and arg_217_1.time_ < var_220_33 + var_220_34 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_33) / var_220_34

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_33 + var_220_34 and arg_217_1.time_ < var_220_33 + var_220_34 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play122521054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 122521054
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play122521055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 1.6

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

				local var_226_2 = arg_223_1:GetWordFromCfg(122521054)
				local var_226_3 = arg_223_1:FormatText(var_226_2.content)

				arg_223_1.text_.text = var_226_3

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_4 = 64
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
	Play122521055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 122521055
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play122521056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 1.4

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, false)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_2 = arg_227_1:GetWordFromCfg(122521055)
				local var_230_3 = arg_227_1:FormatText(var_230_2.content)

				arg_227_1.text_.text = var_230_3

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_4 = 56
				local var_230_5 = utf8.len(var_230_3)
				local var_230_6 = var_230_4 <= 0 and var_230_1 or var_230_1 * (var_230_5 / var_230_4)

				if var_230_6 > 0 and var_230_1 < var_230_6 then
					arg_227_1.talkMaxDuration = var_230_6

					if var_230_6 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_6 + var_230_0
					end
				end

				arg_227_1.text_.text = var_230_3
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_7 = math.max(var_230_1, arg_227_1.talkMaxDuration)

			if var_230_0 <= arg_227_1.time_ and arg_227_1.time_ < var_230_0 + var_230_7 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_0) / var_230_7

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_0 + var_230_7 and arg_227_1.time_ < var_230_0 + var_230_7 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play122521056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 122521056
		arg_231_1.duration_ = 9.333

		local var_231_0 = {
			ja = 9.333,
			ko = 5.466,
			zh = 5.466
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
				arg_231_0:Play122521057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["10045ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos10045ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0, -1.18, -6.05)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos10045ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, -1.18, -6.05)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["10045ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect10045ui_story == nil then
				arg_231_1.var_.characterEffect10045ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.200000002980232

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect10045ui_story then
					arg_231_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect10045ui_story then
				arg_231_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_234_13 = 0

			if var_234_13 < arg_231_1.time_ and arg_231_1.time_ <= var_234_13 + arg_234_0 then
				arg_231_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action2_1")
			end

			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 then
				arg_231_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_234_15 = 0
			local var_234_16 = 0.6

			if var_234_15 < arg_231_1.time_ and arg_231_1.time_ <= var_234_15 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_17 = arg_231_1:FormatText(StoryNameCfg[45].name)

				arg_231_1.leftNameTxt_.text = var_234_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_18 = arg_231_1:GetWordFromCfg(122521056)
				local var_234_19 = arg_231_1:FormatText(var_234_18.content)

				arg_231_1.text_.text = var_234_19

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_20 = 24
				local var_234_21 = utf8.len(var_234_19)
				local var_234_22 = var_234_20 <= 0 and var_234_16 or var_234_16 * (var_234_21 / var_234_20)

				if var_234_22 > 0 and var_234_16 < var_234_22 then
					arg_231_1.talkMaxDuration = var_234_22

					if var_234_22 + var_234_15 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_22 + var_234_15
					end
				end

				arg_231_1.text_.text = var_234_19
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521056", "story_v_out_122521.awb") ~= 0 then
					local var_234_23 = manager.audio:GetVoiceLength("story_v_out_122521", "122521056", "story_v_out_122521.awb") / 1000

					if var_234_23 + var_234_15 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_23 + var_234_15
					end

					if var_234_18.prefab_name ~= "" and arg_231_1.actors_[var_234_18.prefab_name] ~= nil then
						local var_234_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_18.prefab_name].transform, "story_v_out_122521", "122521056", "story_v_out_122521.awb")

						arg_231_1:RecordAudio("122521056", var_234_24)
						arg_231_1:RecordAudio("122521056", var_234_24)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_122521", "122521056", "story_v_out_122521.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_122521", "122521056", "story_v_out_122521.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_25 = math.max(var_234_16, arg_231_1.talkMaxDuration)

			if var_234_15 <= arg_231_1.time_ and arg_231_1.time_ < var_234_15 + var_234_25 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_15) / var_234_25

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_15 + var_234_25 and arg_231_1.time_ < var_234_15 + var_234_25 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play122521057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 122521057
		arg_235_1.duration_ = 6.466

		local var_235_0 = {
			ja = 6.466,
			ko = 2,
			zh = 2
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
				arg_235_0:Play122521058(arg_235_1)
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

			local var_238_15 = arg_235_1.actors_["10045ui_story"].transform
			local var_238_16 = 0

			if var_238_16 < arg_235_1.time_ and arg_235_1.time_ <= var_238_16 + arg_238_0 then
				arg_235_1.var_.moveOldPos10045ui_story = var_238_15.localPosition
			end

			local var_238_17 = 0.001

			if var_238_16 <= arg_235_1.time_ and arg_235_1.time_ < var_238_16 + var_238_17 then
				local var_238_18 = (arg_235_1.time_ - var_238_16) / var_238_17
				local var_238_19 = Vector3.New(0, 100, 0)

				var_238_15.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10045ui_story, var_238_19, var_238_18)

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

			local var_238_24 = arg_235_1.actors_["10045ui_story"]
			local var_238_25 = 0

			if var_238_25 < arg_235_1.time_ and arg_235_1.time_ <= var_238_25 + arg_238_0 and arg_235_1.var_.characterEffect10045ui_story == nil then
				arg_235_1.var_.characterEffect10045ui_story = var_238_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_26 = 0.200000002980232

			if var_238_25 <= arg_235_1.time_ and arg_235_1.time_ < var_238_25 + var_238_26 then
				local var_238_27 = (arg_235_1.time_ - var_238_25) / var_238_26

				if arg_235_1.var_.characterEffect10045ui_story then
					local var_238_28 = Mathf.Lerp(0, 0.5, var_238_27)

					arg_235_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_235_1.var_.characterEffect10045ui_story.fillRatio = var_238_28
				end
			end

			if arg_235_1.time_ >= var_238_25 + var_238_26 and arg_235_1.time_ < var_238_25 + var_238_26 + arg_238_0 and arg_235_1.var_.characterEffect10045ui_story then
				local var_238_29 = 0.5

				arg_235_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_235_1.var_.characterEffect10045ui_story.fillRatio = var_238_29
			end

			local var_238_30 = 0
			local var_238_31 = 0.3

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

				local var_238_33 = arg_235_1:GetWordFromCfg(122521057)
				local var_238_34 = arg_235_1:FormatText(var_238_33.content)

				arg_235_1.text_.text = var_238_34

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_35 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521057", "story_v_out_122521.awb") ~= 0 then
					local var_238_38 = manager.audio:GetVoiceLength("story_v_out_122521", "122521057", "story_v_out_122521.awb") / 1000

					if var_238_38 + var_238_30 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_38 + var_238_30
					end

					if var_238_33.prefab_name ~= "" and arg_235_1.actors_[var_238_33.prefab_name] ~= nil then
						local var_238_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_33.prefab_name].transform, "story_v_out_122521", "122521057", "story_v_out_122521.awb")

						arg_235_1:RecordAudio("122521057", var_238_39)
						arg_235_1:RecordAudio("122521057", var_238_39)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_122521", "122521057", "story_v_out_122521.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_122521", "122521057", "story_v_out_122521.awb")
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
	Play122521058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 122521058
		arg_239_1.duration_ = 17.066

		local var_239_0 = {
			ja = 17.066,
			ko = 5.766,
			zh = 5.766
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
				arg_239_0:Play122521059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["4037ui_story"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos4037ui_story = var_242_0.localPosition
			end

			local var_242_2 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2
				local var_242_4 = Vector3.New(0, -1.12, -6.2)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos4037ui_story, var_242_4, var_242_3)

				local var_242_5 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_5.x, var_242_5.y, var_242_5.z)

				local var_242_6 = var_242_0.localEulerAngles

				var_242_6.z = 0
				var_242_6.x = 0
				var_242_0.localEulerAngles = var_242_6
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_242_7 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_7.x, var_242_7.y, var_242_7.z)

				local var_242_8 = var_242_0.localEulerAngles

				var_242_8.z = 0
				var_242_8.x = 0
				var_242_0.localEulerAngles = var_242_8
			end

			local var_242_9 = arg_239_1.actors_["4037ui_story"]
			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 and arg_239_1.var_.characterEffect4037ui_story == nil then
				arg_239_1.var_.characterEffect4037ui_story = var_242_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_11 = 0.200000002980232

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_11 then
				local var_242_12 = (arg_239_1.time_ - var_242_10) / var_242_11

				if arg_239_1.var_.characterEffect4037ui_story then
					arg_239_1.var_.characterEffect4037ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_10 + var_242_11 and arg_239_1.time_ < var_242_10 + var_242_11 + arg_242_0 and arg_239_1.var_.characterEffect4037ui_story then
				arg_239_1.var_.characterEffect4037ui_story.fillFlat = false
			end

			local var_242_13 = 0

			if var_242_13 < arg_239_1.time_ and arg_239_1.time_ <= var_242_13 + arg_242_0 then
				arg_239_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/story4037/story4037action/4037action3_1")
			end

			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				arg_239_1:PlayTimeline("4037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_242_15 = 0
			local var_242_16 = 0.875

			if var_242_15 < arg_239_1.time_ and arg_239_1.time_ <= var_242_15 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_17 = arg_239_1:FormatText(StoryNameCfg[453].name)

				arg_239_1.leftNameTxt_.text = var_242_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_18 = arg_239_1:GetWordFromCfg(122521058)
				local var_242_19 = arg_239_1:FormatText(var_242_18.content)

				arg_239_1.text_.text = var_242_19

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_20 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521058", "story_v_out_122521.awb") ~= 0 then
					local var_242_23 = manager.audio:GetVoiceLength("story_v_out_122521", "122521058", "story_v_out_122521.awb") / 1000

					if var_242_23 + var_242_15 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_23 + var_242_15
					end

					if var_242_18.prefab_name ~= "" and arg_239_1.actors_[var_242_18.prefab_name] ~= nil then
						local var_242_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_18.prefab_name].transform, "story_v_out_122521", "122521058", "story_v_out_122521.awb")

						arg_239_1:RecordAudio("122521058", var_242_24)
						arg_239_1:RecordAudio("122521058", var_242_24)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_122521", "122521058", "story_v_out_122521.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_122521", "122521058", "story_v_out_122521.awb")
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
	Play122521059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 122521059
		arg_243_1.duration_ = 12.066

		local var_243_0 = {
			ja = 12.066,
			ko = 5.7,
			zh = 5.7
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
			arg_243_1.auto_ = false
		end

		function arg_243_1.playNext_(arg_245_0)
			arg_243_1.onStoryFinished_()
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = "1029ui_story"

			if arg_243_1.actors_[var_246_0] == nil then
				local var_246_1 = Object.Instantiate(Asset.Load("Char/" .. var_246_0), arg_243_1.stage_.transform)

				var_246_1.name = var_246_0
				var_246_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_243_1.actors_[var_246_0] = var_246_1

				local var_246_2 = var_246_1:GetComponentInChildren(typeof(CharacterEffect))

				var_246_2.enabled = true

				local var_246_3 = GameObjectTools.GetOrAddComponent(var_246_1, typeof(DynamicBoneHelper))

				if var_246_3 then
					var_246_3:EnableDynamicBone(false)
				end

				arg_243_1:ShowWeapon(var_246_2.transform, false)

				arg_243_1.var_[var_246_0 .. "Animator"] = var_246_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_243_1.var_[var_246_0 .. "Animator"].applyRootMotion = true
				arg_243_1.var_[var_246_0 .. "LipSync"] = var_246_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_246_4 = arg_243_1.actors_["1029ui_story"].transform
			local var_246_5 = 0

			if var_246_5 < arg_243_1.time_ and arg_243_1.time_ <= var_246_5 + arg_246_0 then
				arg_243_1.var_.moveOldPos1029ui_story = var_246_4.localPosition
			end

			local var_246_6 = 0.001

			if var_246_5 <= arg_243_1.time_ and arg_243_1.time_ < var_246_5 + var_246_6 then
				local var_246_7 = (arg_243_1.time_ - var_246_5) / var_246_6
				local var_246_8 = Vector3.New(0, -1.09, -6.2)

				var_246_4.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1029ui_story, var_246_8, var_246_7)

				local var_246_9 = manager.ui.mainCamera.transform.position - var_246_4.position

				var_246_4.forward = Vector3.New(var_246_9.x, var_246_9.y, var_246_9.z)

				local var_246_10 = var_246_4.localEulerAngles

				var_246_10.z = 0
				var_246_10.x = 0
				var_246_4.localEulerAngles = var_246_10
			end

			if arg_243_1.time_ >= var_246_5 + var_246_6 and arg_243_1.time_ < var_246_5 + var_246_6 + arg_246_0 then
				var_246_4.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_246_11 = manager.ui.mainCamera.transform.position - var_246_4.position

				var_246_4.forward = Vector3.New(var_246_11.x, var_246_11.y, var_246_11.z)

				local var_246_12 = var_246_4.localEulerAngles

				var_246_12.z = 0
				var_246_12.x = 0
				var_246_4.localEulerAngles = var_246_12
			end

			local var_246_13 = arg_243_1.actors_["1029ui_story"]
			local var_246_14 = 0

			if var_246_14 < arg_243_1.time_ and arg_243_1.time_ <= var_246_14 + arg_246_0 and arg_243_1.var_.characterEffect1029ui_story == nil then
				arg_243_1.var_.characterEffect1029ui_story = var_246_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_15 = 0.200000002980232

			if var_246_14 <= arg_243_1.time_ and arg_243_1.time_ < var_246_14 + var_246_15 then
				local var_246_16 = (arg_243_1.time_ - var_246_14) / var_246_15

				if arg_243_1.var_.characterEffect1029ui_story then
					arg_243_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_14 + var_246_15 and arg_243_1.time_ < var_246_14 + var_246_15 + arg_246_0 and arg_243_1.var_.characterEffect1029ui_story then
				arg_243_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_246_17 = 0

			if var_246_17 < arg_243_1.time_ and arg_243_1.time_ <= var_246_17 + arg_246_0 then
				arg_243_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_246_18 = 0

			if var_246_18 < arg_243_1.time_ and arg_243_1.time_ <= var_246_18 + arg_246_0 then
				arg_243_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_246_19 = arg_243_1.actors_["4037ui_story"].transform
			local var_246_20 = 0

			if var_246_20 < arg_243_1.time_ and arg_243_1.time_ <= var_246_20 + arg_246_0 then
				arg_243_1.var_.moveOldPos4037ui_story = var_246_19.localPosition
			end

			local var_246_21 = 0.001

			if var_246_20 <= arg_243_1.time_ and arg_243_1.time_ < var_246_20 + var_246_21 then
				local var_246_22 = (arg_243_1.time_ - var_246_20) / var_246_21
				local var_246_23 = Vector3.New(0, 100, 0)

				var_246_19.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos4037ui_story, var_246_23, var_246_22)

				local var_246_24 = manager.ui.mainCamera.transform.position - var_246_19.position

				var_246_19.forward = Vector3.New(var_246_24.x, var_246_24.y, var_246_24.z)

				local var_246_25 = var_246_19.localEulerAngles

				var_246_25.z = 0
				var_246_25.x = 0
				var_246_19.localEulerAngles = var_246_25
			end

			if arg_243_1.time_ >= var_246_20 + var_246_21 and arg_243_1.time_ < var_246_20 + var_246_21 + arg_246_0 then
				var_246_19.localPosition = Vector3.New(0, 100, 0)

				local var_246_26 = manager.ui.mainCamera.transform.position - var_246_19.position

				var_246_19.forward = Vector3.New(var_246_26.x, var_246_26.y, var_246_26.z)

				local var_246_27 = var_246_19.localEulerAngles

				var_246_27.z = 0
				var_246_27.x = 0
				var_246_19.localEulerAngles = var_246_27
			end

			local var_246_28 = arg_243_1.actors_["4037ui_story"]
			local var_246_29 = 0

			if var_246_29 < arg_243_1.time_ and arg_243_1.time_ <= var_246_29 + arg_246_0 and arg_243_1.var_.characterEffect4037ui_story == nil then
				arg_243_1.var_.characterEffect4037ui_story = var_246_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_30 = 0.200000002980232

			if var_246_29 <= arg_243_1.time_ and arg_243_1.time_ < var_246_29 + var_246_30 then
				local var_246_31 = (arg_243_1.time_ - var_246_29) / var_246_30

				if arg_243_1.var_.characterEffect4037ui_story then
					local var_246_32 = Mathf.Lerp(0, 0.5, var_246_31)

					arg_243_1.var_.characterEffect4037ui_story.fillFlat = true
					arg_243_1.var_.characterEffect4037ui_story.fillRatio = var_246_32
				end
			end

			if arg_243_1.time_ >= var_246_29 + var_246_30 and arg_243_1.time_ < var_246_29 + var_246_30 + arg_246_0 and arg_243_1.var_.characterEffect4037ui_story then
				local var_246_33 = 0.5

				arg_243_1.var_.characterEffect4037ui_story.fillFlat = true
				arg_243_1.var_.characterEffect4037ui_story.fillRatio = var_246_33
			end

			local var_246_34 = 0
			local var_246_35 = 0.525

			if var_246_34 < arg_243_1.time_ and arg_243_1.time_ <= var_246_34 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_36 = arg_243_1:FormatText(StoryNameCfg[319].name)

				arg_243_1.leftNameTxt_.text = var_246_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_37 = arg_243_1:GetWordFromCfg(122521059)
				local var_246_38 = arg_243_1:FormatText(var_246_37.content)

				arg_243_1.text_.text = var_246_38

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_39 = 21
				local var_246_40 = utf8.len(var_246_38)
				local var_246_41 = var_246_39 <= 0 and var_246_35 or var_246_35 * (var_246_40 / var_246_39)

				if var_246_41 > 0 and var_246_35 < var_246_41 then
					arg_243_1.talkMaxDuration = var_246_41

					if var_246_41 + var_246_34 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_41 + var_246_34
					end
				end

				arg_243_1.text_.text = var_246_38
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122521", "122521059", "story_v_out_122521.awb") ~= 0 then
					local var_246_42 = manager.audio:GetVoiceLength("story_v_out_122521", "122521059", "story_v_out_122521.awb") / 1000

					if var_246_42 + var_246_34 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_42 + var_246_34
					end

					if var_246_37.prefab_name ~= "" and arg_243_1.actors_[var_246_37.prefab_name] ~= nil then
						local var_246_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_37.prefab_name].transform, "story_v_out_122521", "122521059", "story_v_out_122521.awb")

						arg_243_1:RecordAudio("122521059", var_246_43)
						arg_243_1:RecordAudio("122521059", var_246_43)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_122521", "122521059", "story_v_out_122521.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_122521", "122521059", "story_v_out_122521.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_44 = math.max(var_246_35, arg_243_1.talkMaxDuration)

			if var_246_34 <= arg_243_1.time_ and arg_243_1.time_ < var_246_34 + var_246_44 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_34) / var_246_44

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_34 + var_246_44 and arg_243_1.time_ < var_246_34 + var_246_44 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J07f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0605"
	},
	voices = {
		"story_v_out_122521.awb"
	}
}
