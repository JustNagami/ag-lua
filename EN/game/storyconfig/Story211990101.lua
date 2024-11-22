return {
	Play119901001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 119901001
		arg_1_1.duration_ = 7.366

		local var_1_0 = {
			ja = 7.366,
			ko = 7.166,
			zh = 6.2,
			en = 5.233
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
				arg_1_0:Play119901002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "D02a"

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
				local var_4_5 = arg_1_1.bgs_.D02a

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
					if iter_4_0 ~= "D02a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

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

			local var_4_22 = "1119ui_story"

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

			local var_4_26 = arg_1_1.actors_["1119ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1119ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(-0.7, -1.08, -5.9)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1119ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1119ui_story"]
			local var_4_36 = 2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1119ui_story == nil then
				arg_1_1.var_.characterEffect1119ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.2

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1119ui_story then
					arg_1_1.var_.characterEffect1119ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1119ui_story then
				arg_1_1.var_.characterEffect1119ui_story.fillFlat = false
			end

			local var_4_39 = 2

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action445")
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
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

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.525

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

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[13].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(119901001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 21
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

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901001", "story_v_side_old_119901.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901001", "story_v_side_old_119901.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_side_old_119901", "119901001", "story_v_side_old_119901.awb")

						arg_1_1:RecordAudio("119901001", var_4_59)
						arg_1_1:RecordAudio("119901001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901001", "story_v_side_old_119901.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901001", "story_v_side_old_119901.awb")
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
	Play119901002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 119901002
		arg_7_1.duration_ = 4.3

		local var_7_0 = {
			ja = 4.3,
			ko = 2.4,
			zh = 3.2,
			en = 3.433
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
				arg_7_0:Play119901003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1099ui_story"

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

			local var_10_4 = arg_7_1.actors_["1099ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1099ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0.7, -1.08, -5.9)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1099ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["1119ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1119ui_story == nil then
				arg_7_1.var_.characterEffect1119ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.2

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect1119ui_story then
					local var_10_17 = Mathf.Lerp(0, 0.5, var_10_16)

					arg_7_1.var_.characterEffect1119ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1119ui_story.fillRatio = var_10_17
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1119ui_story then
				local var_10_18 = 0.5

				arg_7_1.var_.characterEffect1119ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1119ui_story.fillRatio = var_10_18
			end

			local var_10_19 = arg_7_1.actors_["1099ui_story"]
			local var_10_20 = 0

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 and arg_7_1.var_.characterEffect1099ui_story == nil then
				arg_7_1.var_.characterEffect1099ui_story = var_10_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_21 = 0.2

			if var_10_20 <= arg_7_1.time_ and arg_7_1.time_ < var_10_20 + var_10_21 then
				local var_10_22 = (arg_7_1.time_ - var_10_20) / var_10_21

				if arg_7_1.var_.characterEffect1099ui_story then
					arg_7_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_20 + var_10_21 and arg_7_1.time_ < var_10_20 + var_10_21 + arg_10_0 and arg_7_1.var_.characterEffect1099ui_story then
				arg_7_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action4_1")
			end

			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_10_25 = 0
			local var_10_26 = 0.325

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[84].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(119901002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 12
				local var_10_31 = utf8.len(var_10_29)
				local var_10_32 = var_10_30 <= 0 and var_10_26 or var_10_26 * (var_10_31 / var_10_30)

				if var_10_32 > 0 and var_10_26 < var_10_32 then
					arg_7_1.talkMaxDuration = var_10_32

					if var_10_32 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_32 + var_10_25
					end
				end

				arg_7_1.text_.text = var_10_29
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901002", "story_v_side_old_119901.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901002", "story_v_side_old_119901.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_side_old_119901", "119901002", "story_v_side_old_119901.awb")

						arg_7_1:RecordAudio("119901002", var_10_34)
						arg_7_1:RecordAudio("119901002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901002", "story_v_side_old_119901.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901002", "story_v_side_old_119901.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_35 = math.max(var_10_26, arg_7_1.talkMaxDuration)

			if var_10_25 <= arg_7_1.time_ and arg_7_1.time_ < var_10_25 + var_10_35 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_25) / var_10_35

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_25 + var_10_35 and arg_7_1.time_ < var_10_25 + var_10_35 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play119901003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 119901003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play119901004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1099ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1099ui_story == nil then
				arg_11_1.var_.characterEffect1099ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.2

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1099ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1099ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1099ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1099ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.525

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[7].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(119901003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 21
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
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_14 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_14 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_14

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_14 and arg_11_1.time_ < var_14_6 + var_14_14 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play119901004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 119901004
		arg_15_1.duration_ = 7.733

		local var_15_0 = {
			ja = 7.266,
			ko = 7.733,
			zh = 5.133,
			en = 6.8
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
				arg_15_0:Play119901005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1119ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1119ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, 100, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1119ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, 100, 0)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["1099ui_story"].transform
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.var_.moveOldPos1099ui_story = var_18_9.localPosition
			end

			local var_18_11 = 0.001

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11
				local var_18_13 = Vector3.New(0, 100, 0)

				var_18_9.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1099ui_story, var_18_13, var_18_12)

				local var_18_14 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_14.x, var_18_14.y, var_18_14.z)

				local var_18_15 = var_18_9.localEulerAngles

				var_18_15.z = 0
				var_18_15.x = 0
				var_18_9.localEulerAngles = var_18_15
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 then
				var_18_9.localPosition = Vector3.New(0, 100, 0)

				local var_18_16 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_16.x, var_18_16.y, var_18_16.z)

				local var_18_17 = var_18_9.localEulerAngles

				var_18_17.z = 0
				var_18_17.x = 0
				var_18_9.localEulerAngles = var_18_17
			end

			local var_18_18 = "1093ui_story"

			if arg_15_1.actors_[var_18_18] == nil then
				local var_18_19 = Object.Instantiate(Asset.Load("Char/" .. var_18_18), arg_15_1.stage_.transform)

				var_18_19.name = var_18_18
				var_18_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_18] = var_18_19

				local var_18_20 = var_18_19:GetComponentInChildren(typeof(CharacterEffect))

				var_18_20.enabled = true

				local var_18_21 = GameObjectTools.GetOrAddComponent(var_18_19, typeof(DynamicBoneHelper))

				if var_18_21 then
					var_18_21:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_20.transform, false)

				arg_15_1.var_[var_18_18 .. "Animator"] = var_18_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_18 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_18 .. "LipSync"] = var_18_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_22 = arg_15_1.actors_["1093ui_story"].transform
			local var_18_23 = 0

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 then
				arg_15_1.var_.moveOldPos1093ui_story = var_18_22.localPosition
			end

			local var_18_24 = 0.001

			if var_18_23 <= arg_15_1.time_ and arg_15_1.time_ < var_18_23 + var_18_24 then
				local var_18_25 = (arg_15_1.time_ - var_18_23) / var_18_24
				local var_18_26 = Vector3.New(0, -1.11, -5.88)

				var_18_22.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1093ui_story, var_18_26, var_18_25)

				local var_18_27 = manager.ui.mainCamera.transform.position - var_18_22.position

				var_18_22.forward = Vector3.New(var_18_27.x, var_18_27.y, var_18_27.z)

				local var_18_28 = var_18_22.localEulerAngles

				var_18_28.z = 0
				var_18_28.x = 0
				var_18_22.localEulerAngles = var_18_28
			end

			if arg_15_1.time_ >= var_18_23 + var_18_24 and arg_15_1.time_ < var_18_23 + var_18_24 + arg_18_0 then
				var_18_22.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_18_29 = manager.ui.mainCamera.transform.position - var_18_22.position

				var_18_22.forward = Vector3.New(var_18_29.x, var_18_29.y, var_18_29.z)

				local var_18_30 = var_18_22.localEulerAngles

				var_18_30.z = 0
				var_18_30.x = 0
				var_18_22.localEulerAngles = var_18_30
			end

			local var_18_31 = arg_15_1.actors_["1093ui_story"]
			local var_18_32 = 0

			if var_18_32 < arg_15_1.time_ and arg_15_1.time_ <= var_18_32 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story == nil then
				arg_15_1.var_.characterEffect1093ui_story = var_18_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_33 = 0.2

			if var_18_32 <= arg_15_1.time_ and arg_15_1.time_ < var_18_32 + var_18_33 then
				local var_18_34 = (arg_15_1.time_ - var_18_32) / var_18_33

				if arg_15_1.var_.characterEffect1093ui_story then
					arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_32 + var_18_33 and arg_15_1.time_ < var_18_32 + var_18_33 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story then
				arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_18_35 = 0

			if var_18_35 < arg_15_1.time_ and arg_15_1.time_ <= var_18_35 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action8_1")
			end

			local var_18_36 = 0

			if var_18_36 < arg_15_1.time_ and arg_15_1.time_ <= var_18_36 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_18_37 = 0
			local var_18_38 = 0.525

			if var_18_37 < arg_15_1.time_ and arg_15_1.time_ <= var_18_37 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_39 = arg_15_1:FormatText(StoryNameCfg[73].name)

				arg_15_1.leftNameTxt_.text = var_18_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_40 = arg_15_1:GetWordFromCfg(119901004)
				local var_18_41 = arg_15_1:FormatText(var_18_40.content)

				arg_15_1.text_.text = var_18_41

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_42 = 21
				local var_18_43 = utf8.len(var_18_41)
				local var_18_44 = var_18_42 <= 0 and var_18_38 or var_18_38 * (var_18_43 / var_18_42)

				if var_18_44 > 0 and var_18_38 < var_18_44 then
					arg_15_1.talkMaxDuration = var_18_44

					if var_18_44 + var_18_37 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_44 + var_18_37
					end
				end

				arg_15_1.text_.text = var_18_41
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901004", "story_v_side_old_119901.awb") ~= 0 then
					local var_18_45 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901004", "story_v_side_old_119901.awb") / 1000

					if var_18_45 + var_18_37 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_45 + var_18_37
					end

					if var_18_40.prefab_name ~= "" and arg_15_1.actors_[var_18_40.prefab_name] ~= nil then
						local var_18_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_40.prefab_name].transform, "story_v_side_old_119901", "119901004", "story_v_side_old_119901.awb")

						arg_15_1:RecordAudio("119901004", var_18_46)
						arg_15_1:RecordAudio("119901004", var_18_46)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901004", "story_v_side_old_119901.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901004", "story_v_side_old_119901.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_47 = math.max(var_18_38, arg_15_1.talkMaxDuration)

			if var_18_37 <= arg_15_1.time_ and arg_15_1.time_ < var_18_37 + var_18_47 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_37) / var_18_47

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_37 + var_18_47 and arg_15_1.time_ < var_18_37 + var_18_47 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play119901005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 119901005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play119901006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1093ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story == nil then
				arg_19_1.var_.characterEffect1093ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1093ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0
			local var_22_7 = 0.175

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(119901005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 7
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
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_14 and arg_19_1.time_ < var_22_6 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play119901006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 119901006
		arg_23_1.duration_ = 6.1

		local var_23_0 = {
			ja = 6,
			ko = 6.1,
			zh = 5.066,
			en = 4.233
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
				arg_23_0:Play119901007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1093ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1093ui_story == nil then
				arg_23_1.var_.characterEffect1093ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1093ui_story then
					arg_23_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1093ui_story then
				arg_23_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action484")
			end

			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_26_6 = 0
			local var_26_7 = 0.45

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[73].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(119901006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 18
				local var_26_12 = utf8.len(var_26_10)
				local var_26_13 = var_26_11 <= 0 and var_26_7 or var_26_7 * (var_26_12 / var_26_11)

				if var_26_13 > 0 and var_26_7 < var_26_13 then
					arg_23_1.talkMaxDuration = var_26_13

					if var_26_13 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_10
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901006", "story_v_side_old_119901.awb") ~= 0 then
					local var_26_14 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901006", "story_v_side_old_119901.awb") / 1000

					if var_26_14 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_6
					end

					if var_26_9.prefab_name ~= "" and arg_23_1.actors_[var_26_9.prefab_name] ~= nil then
						local var_26_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_9.prefab_name].transform, "story_v_side_old_119901", "119901006", "story_v_side_old_119901.awb")

						arg_23_1:RecordAudio("119901006", var_26_15)
						arg_23_1:RecordAudio("119901006", var_26_15)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901006", "story_v_side_old_119901.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901006", "story_v_side_old_119901.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_16 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_16 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_16

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_16 and arg_23_1.time_ < var_26_6 + var_26_16 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play119901007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 119901007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play119901008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1093ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1093ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1093ui_story, var_30_4, var_30_3)

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

			local var_30_9 = 0
			local var_30_10 = 1.8

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_11 = arg_27_1:GetWordFromCfg(119901007)
				local var_30_12 = arg_27_1:FormatText(var_30_11.content)

				arg_27_1.text_.text = var_30_12

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_13 = 72
				local var_30_14 = utf8.len(var_30_12)
				local var_30_15 = var_30_13 <= 0 and var_30_10 or var_30_10 * (var_30_14 / var_30_13)

				if var_30_15 > 0 and var_30_10 < var_30_15 then
					arg_27_1.talkMaxDuration = var_30_15

					if var_30_15 + var_30_9 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_15 + var_30_9
					end
				end

				arg_27_1.text_.text = var_30_12
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_16 = math.max(var_30_10, arg_27_1.talkMaxDuration)

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_16 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_9) / var_30_16

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_9 + var_30_16 and arg_27_1.time_ < var_30_9 + var_30_16 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play119901008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 119901008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play119901009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.95

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

				local var_34_2 = arg_31_1:GetWordFromCfg(119901008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 38
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
	Play119901009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 119901009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play119901010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1.475

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_2 = arg_35_1:GetWordFromCfg(119901009)
				local var_38_3 = arg_35_1:FormatText(var_38_2.content)

				arg_35_1.text_.text = var_38_3

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_4 = 59
				local var_38_5 = utf8.len(var_38_3)
				local var_38_6 = var_38_4 <= 0 and var_38_1 or var_38_1 * (var_38_5 / var_38_4)

				if var_38_6 > 0 and var_38_1 < var_38_6 then
					arg_35_1.talkMaxDuration = var_38_6

					if var_38_6 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_6 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_3
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_7 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_7 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_7

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_7 and arg_35_1.time_ < var_38_0 + var_38_7 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play119901010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 119901010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play119901011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.425

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(119901010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 17
				local var_42_6 = utf8.len(var_42_4)
				local var_42_7 = var_42_5 <= 0 and var_42_1 or var_42_1 * (var_42_6 / var_42_5)

				if var_42_7 > 0 and var_42_1 < var_42_7 then
					arg_39_1.talkMaxDuration = var_42_7

					if var_42_7 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_7 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_4
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_8 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_8 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_8

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_8 and arg_39_1.time_ < var_42_0 + var_42_8 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play119901011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 119901011
		arg_43_1.duration_ = 4.2

		local var_43_0 = {
			ja = 4.2,
			ko = 3.633,
			zh = 3.333,
			en = 3.966
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
				arg_43_0:Play119901012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = "1050ui_story"

			if arg_43_1.actors_[var_46_0] == nil then
				local var_46_1 = Object.Instantiate(Asset.Load("Char/" .. var_46_0), arg_43_1.stage_.transform)

				var_46_1.name = var_46_0
				var_46_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.actors_[var_46_0] = var_46_1

				local var_46_2 = var_46_1:GetComponentInChildren(typeof(CharacterEffect))

				var_46_2.enabled = true

				local var_46_3 = GameObjectTools.GetOrAddComponent(var_46_1, typeof(DynamicBoneHelper))

				if var_46_3 then
					var_46_3:EnableDynamicBone(false)
				end

				arg_43_1:ShowWeapon(var_46_2.transform, false)

				arg_43_1.var_[var_46_0 .. "Animator"] = var_46_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_43_1.var_[var_46_0 .. "Animator"].applyRootMotion = true
				arg_43_1.var_[var_46_0 .. "LipSync"] = var_46_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_46_4 = arg_43_1.actors_["1050ui_story"].transform
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				arg_43_1.var_.moveOldPos1050ui_story = var_46_4.localPosition
			end

			local var_46_6 = 0.001

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6
				local var_46_8 = Vector3.New(-0.7, -1, -6.1)

				var_46_4.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1050ui_story, var_46_8, var_46_7)

				local var_46_9 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_9.x, var_46_9.y, var_46_9.z)

				local var_46_10 = var_46_4.localEulerAngles

				var_46_10.z = 0
				var_46_10.x = 0
				var_46_4.localEulerAngles = var_46_10
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 then
				var_46_4.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_46_11 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_11.x, var_46_11.y, var_46_11.z)

				local var_46_12 = var_46_4.localEulerAngles

				var_46_12.z = 0
				var_46_12.x = 0
				var_46_4.localEulerAngles = var_46_12
			end

			local var_46_13 = arg_43_1.actors_["1050ui_story"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.characterEffect1050ui_story == nil then
				arg_43_1.var_.characterEffect1050ui_story = var_46_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_15 = 0.2

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.characterEffect1050ui_story then
					arg_43_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.characterEffect1050ui_story then
				arg_43_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_46_17 = 0

			if var_46_17 < arg_43_1.time_ and arg_43_1.time_ <= var_46_17 + arg_46_0 then
				arg_43_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action5_1")
			end

			local var_46_18 = 0

			if var_46_18 < arg_43_1.time_ and arg_43_1.time_ <= var_46_18 + arg_46_0 then
				arg_43_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_46_19 = 0
			local var_46_20 = 0.35

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[74].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(119901011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 14
				local var_46_25 = utf8.len(var_46_23)
				local var_46_26 = var_46_24 <= 0 and var_46_20 or var_46_20 * (var_46_25 / var_46_24)

				if var_46_26 > 0 and var_46_20 < var_46_26 then
					arg_43_1.talkMaxDuration = var_46_26

					if var_46_26 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_26 + var_46_19
					end
				end

				arg_43_1.text_.text = var_46_23
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901011", "story_v_side_old_119901.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901011", "story_v_side_old_119901.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_side_old_119901", "119901011", "story_v_side_old_119901.awb")

						arg_43_1:RecordAudio("119901011", var_46_28)
						arg_43_1:RecordAudio("119901011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901011", "story_v_side_old_119901.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901011", "story_v_side_old_119901.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_29 = math.max(var_46_20, arg_43_1.talkMaxDuration)

			if var_46_19 <= arg_43_1.time_ and arg_43_1.time_ < var_46_19 + var_46_29 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_19) / var_46_29

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_19 + var_46_29 and arg_43_1.time_ < var_46_19 + var_46_29 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play119901012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 119901012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play119901013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1050ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1050ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0, 100, 0)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1050ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, 100, 0)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = 0
			local var_50_10 = 0.925

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

				local var_50_11 = arg_47_1:GetWordFromCfg(119901012)
				local var_50_12 = arg_47_1:FormatText(var_50_11.content)

				arg_47_1.text_.text = var_50_12

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_13 = 37
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
	Play119901013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 119901013
		arg_51_1.duration_ = 9.3

		local var_51_0 = {
			ja = 9.3,
			ko = 4.3,
			zh = 4.266,
			en = 6.933
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
				arg_51_0:Play119901014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1099ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1099ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0.7, -1.08, -5.9)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1099ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["1099ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect1099ui_story == nil then
				arg_51_1.var_.characterEffect1099ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.2

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect1099ui_story then
					arg_51_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect1099ui_story then
				arg_51_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action4_1")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_54_15 = 0
			local var_54_16 = 0.55

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_17 = arg_51_1:FormatText(StoryNameCfg[84].name)

				arg_51_1.leftNameTxt_.text = var_54_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_18 = arg_51_1:GetWordFromCfg(119901013)
				local var_54_19 = arg_51_1:FormatText(var_54_18.content)

				arg_51_1.text_.text = var_54_19

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_20 = 22
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

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901013", "story_v_side_old_119901.awb") ~= 0 then
					local var_54_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901013", "story_v_side_old_119901.awb") / 1000

					if var_54_23 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_23 + var_54_15
					end

					if var_54_18.prefab_name ~= "" and arg_51_1.actors_[var_54_18.prefab_name] ~= nil then
						local var_54_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_18.prefab_name].transform, "story_v_side_old_119901", "119901013", "story_v_side_old_119901.awb")

						arg_51_1:RecordAudio("119901013", var_54_24)
						arg_51_1:RecordAudio("119901013", var_54_24)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901013", "story_v_side_old_119901.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901013", "story_v_side_old_119901.awb")
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
	Play119901014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 119901014
		arg_55_1.duration_ = 12

		local var_55_0 = {
			ja = 12,
			ko = 7.9,
			zh = 8.5,
			en = 11.966
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
				arg_55_0:Play119901015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1050ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1050ui_story == nil then
				arg_55_1.var_.characterEffect1050ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1050ui_story then
					arg_55_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1050ui_story then
				arg_55_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_58_4 = 0

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050actionlink/1050action453")
			end

			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_58_6 = arg_55_1.actors_["1099ui_story"]
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 and arg_55_1.var_.characterEffect1099ui_story == nil then
				arg_55_1.var_.characterEffect1099ui_story = var_58_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_8 = 0.2

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8

				if arg_55_1.var_.characterEffect1099ui_story then
					local var_58_10 = Mathf.Lerp(0, 0.5, var_58_9)

					arg_55_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1099ui_story.fillRatio = var_58_10
				end
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 and arg_55_1.var_.characterEffect1099ui_story then
				local var_58_11 = 0.5

				arg_55_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1099ui_story.fillRatio = var_58_11
			end

			local var_58_12 = arg_55_1.actors_["1050ui_story"].transform
			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1.var_.moveOldPos1050ui_story = var_58_12.localPosition
			end

			local var_58_14 = 0.001

			if var_58_13 <= arg_55_1.time_ and arg_55_1.time_ < var_58_13 + var_58_14 then
				local var_58_15 = (arg_55_1.time_ - var_58_13) / var_58_14
				local var_58_16 = Vector3.New(-0.7, -1, -6.1)

				var_58_12.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1050ui_story, var_58_16, var_58_15)

				local var_58_17 = manager.ui.mainCamera.transform.position - var_58_12.position

				var_58_12.forward = Vector3.New(var_58_17.x, var_58_17.y, var_58_17.z)

				local var_58_18 = var_58_12.localEulerAngles

				var_58_18.z = 0
				var_58_18.x = 0
				var_58_12.localEulerAngles = var_58_18
			end

			if arg_55_1.time_ >= var_58_13 + var_58_14 and arg_55_1.time_ < var_58_13 + var_58_14 + arg_58_0 then
				var_58_12.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_58_19 = manager.ui.mainCamera.transform.position - var_58_12.position

				var_58_12.forward = Vector3.New(var_58_19.x, var_58_19.y, var_58_19.z)

				local var_58_20 = var_58_12.localEulerAngles

				var_58_20.z = 0
				var_58_20.x = 0
				var_58_12.localEulerAngles = var_58_20
			end

			local var_58_21 = 0
			local var_58_22 = 0.8

			if var_58_21 < arg_55_1.time_ and arg_55_1.time_ <= var_58_21 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_23 = arg_55_1:FormatText(StoryNameCfg[74].name)

				arg_55_1.leftNameTxt_.text = var_58_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_24 = arg_55_1:GetWordFromCfg(119901014)
				local var_58_25 = arg_55_1:FormatText(var_58_24.content)

				arg_55_1.text_.text = var_58_25

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_26 = 32
				local var_58_27 = utf8.len(var_58_25)
				local var_58_28 = var_58_26 <= 0 and var_58_22 or var_58_22 * (var_58_27 / var_58_26)

				if var_58_28 > 0 and var_58_22 < var_58_28 then
					arg_55_1.talkMaxDuration = var_58_28

					if var_58_28 + var_58_21 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_28 + var_58_21
					end
				end

				arg_55_1.text_.text = var_58_25
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901014", "story_v_side_old_119901.awb") ~= 0 then
					local var_58_29 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901014", "story_v_side_old_119901.awb") / 1000

					if var_58_29 + var_58_21 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_29 + var_58_21
					end

					if var_58_24.prefab_name ~= "" and arg_55_1.actors_[var_58_24.prefab_name] ~= nil then
						local var_58_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_24.prefab_name].transform, "story_v_side_old_119901", "119901014", "story_v_side_old_119901.awb")

						arg_55_1:RecordAudio("119901014", var_58_30)
						arg_55_1:RecordAudio("119901014", var_58_30)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901014", "story_v_side_old_119901.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901014", "story_v_side_old_119901.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_31 = math.max(var_58_22, arg_55_1.talkMaxDuration)

			if var_58_21 <= arg_55_1.time_ and arg_55_1.time_ < var_58_21 + var_58_31 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_21) / var_58_31

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_21 + var_58_31 and arg_55_1.time_ < var_58_21 + var_58_31 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play119901015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 119901015
		arg_59_1.duration_ = 12.3

		local var_59_0 = {
			ja = 12.3,
			ko = 8.333,
			zh = 6.533,
			en = 9.266
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
				arg_59_0:Play119901016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_62_1 = 0
			local var_62_2 = 0.825

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_3 = arg_59_1:FormatText(StoryNameCfg[74].name)

				arg_59_1.leftNameTxt_.text = var_62_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_4 = arg_59_1:GetWordFromCfg(119901015)
				local var_62_5 = arg_59_1:FormatText(var_62_4.content)

				arg_59_1.text_.text = var_62_5

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_6 = 33
				local var_62_7 = utf8.len(var_62_5)
				local var_62_8 = var_62_6 <= 0 and var_62_2 or var_62_2 * (var_62_7 / var_62_6)

				if var_62_8 > 0 and var_62_2 < var_62_8 then
					arg_59_1.talkMaxDuration = var_62_8

					if var_62_8 + var_62_1 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_1
					end
				end

				arg_59_1.text_.text = var_62_5
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901015", "story_v_side_old_119901.awb") ~= 0 then
					local var_62_9 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901015", "story_v_side_old_119901.awb") / 1000

					if var_62_9 + var_62_1 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_9 + var_62_1
					end

					if var_62_4.prefab_name ~= "" and arg_59_1.actors_[var_62_4.prefab_name] ~= nil then
						local var_62_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_4.prefab_name].transform, "story_v_side_old_119901", "119901015", "story_v_side_old_119901.awb")

						arg_59_1:RecordAudio("119901015", var_62_10)
						arg_59_1:RecordAudio("119901015", var_62_10)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901015", "story_v_side_old_119901.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901015", "story_v_side_old_119901.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_11 = math.max(var_62_2, arg_59_1.talkMaxDuration)

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_11 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_1) / var_62_11

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_1 + var_62_11 and arg_59_1.time_ < var_62_1 + var_62_11 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play119901016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 119901016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play119901017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1050ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1050ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, 100, 0)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1050ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, 100, 0)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1099ui_story"].transform
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.var_.moveOldPos1099ui_story = var_66_9.localPosition
			end

			local var_66_11 = 0.001

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11
				local var_66_13 = Vector3.New(0, 100, 0)

				var_66_9.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1099ui_story, var_66_13, var_66_12)

				local var_66_14 = manager.ui.mainCamera.transform.position - var_66_9.position

				var_66_9.forward = Vector3.New(var_66_14.x, var_66_14.y, var_66_14.z)

				local var_66_15 = var_66_9.localEulerAngles

				var_66_15.z = 0
				var_66_15.x = 0
				var_66_9.localEulerAngles = var_66_15
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 then
				var_66_9.localPosition = Vector3.New(0, 100, 0)

				local var_66_16 = manager.ui.mainCamera.transform.position - var_66_9.position

				var_66_9.forward = Vector3.New(var_66_16.x, var_66_16.y, var_66_16.z)

				local var_66_17 = var_66_9.localEulerAngles

				var_66_17.z = 0
				var_66_17.x = 0
				var_66_9.localEulerAngles = var_66_17
			end

			local var_66_18 = 0
			local var_66_19 = 0.875

			if var_66_18 < arg_63_1.time_ and arg_63_1.time_ <= var_66_18 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_20 = arg_63_1:GetWordFromCfg(119901016)
				local var_66_21 = arg_63_1:FormatText(var_66_20.content)

				arg_63_1.text_.text = var_66_21

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_22 = 34
				local var_66_23 = utf8.len(var_66_21)
				local var_66_24 = var_66_22 <= 0 and var_66_19 or var_66_19 * (var_66_23 / var_66_22)

				if var_66_24 > 0 and var_66_19 < var_66_24 then
					arg_63_1.talkMaxDuration = var_66_24

					if var_66_24 + var_66_18 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_24 + var_66_18
					end
				end

				arg_63_1.text_.text = var_66_21
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_25 = math.max(var_66_19, arg_63_1.talkMaxDuration)

			if var_66_18 <= arg_63_1.time_ and arg_63_1.time_ < var_66_18 + var_66_25 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_18) / var_66_25

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_18 + var_66_25 and arg_63_1.time_ < var_66_18 + var_66_25 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play119901017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 119901017
		arg_67_1.duration_ = 4.3

		local var_67_0 = {
			ja = 2.466,
			ko = 4.3,
			zh = 2.766,
			en = 3.466
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
				arg_67_0:Play119901018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1119ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1119ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0, -1.08, -5.9)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1119ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["1119ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1119ui_story == nil then
				arg_67_1.var_.characterEffect1119ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.2

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect1119ui_story then
					arg_67_1.var_.characterEffect1119ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect1119ui_story then
				arg_67_1.var_.characterEffect1119ui_story.fillFlat = false
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_70_15 = 0
			local var_70_16 = 0.3

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_17 = arg_67_1:FormatText(StoryNameCfg[13].name)

				arg_67_1.leftNameTxt_.text = var_70_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_18 = arg_67_1:GetWordFromCfg(119901017)
				local var_70_19 = arg_67_1:FormatText(var_70_18.content)

				arg_67_1.text_.text = var_70_19

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_20 = 12
				local var_70_21 = utf8.len(var_70_19)
				local var_70_22 = var_70_20 <= 0 and var_70_16 or var_70_16 * (var_70_21 / var_70_20)

				if var_70_22 > 0 and var_70_16 < var_70_22 then
					arg_67_1.talkMaxDuration = var_70_22

					if var_70_22 + var_70_15 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_22 + var_70_15
					end
				end

				arg_67_1.text_.text = var_70_19
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901017", "story_v_side_old_119901.awb") ~= 0 then
					local var_70_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901017", "story_v_side_old_119901.awb") / 1000

					if var_70_23 + var_70_15 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_23 + var_70_15
					end

					if var_70_18.prefab_name ~= "" and arg_67_1.actors_[var_70_18.prefab_name] ~= nil then
						local var_70_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_18.prefab_name].transform, "story_v_side_old_119901", "119901017", "story_v_side_old_119901.awb")

						arg_67_1:RecordAudio("119901017", var_70_24)
						arg_67_1:RecordAudio("119901017", var_70_24)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901017", "story_v_side_old_119901.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901017", "story_v_side_old_119901.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_25 = math.max(var_70_16, arg_67_1.talkMaxDuration)

			if var_70_15 <= arg_67_1.time_ and arg_67_1.time_ < var_70_15 + var_70_25 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_15) / var_70_25

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_15 + var_70_25 and arg_67_1.time_ < var_70_15 + var_70_25 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play119901018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 119901018
		arg_71_1.duration_ = 13.9

		local var_71_0 = {
			ja = 13.9,
			ko = 10.2,
			zh = 8.3,
			en = 7.566
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
				arg_71_0:Play119901019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1119ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1119ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0, 100, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1119ui_story, var_74_4, var_74_3)

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

			local var_74_9 = arg_71_1.actors_["1099ui_story"].transform
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 then
				arg_71_1.var_.moveOldPos1099ui_story = var_74_9.localPosition
			end

			local var_74_11 = 0.001

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11
				local var_74_13 = Vector3.New(0, -1.08, -5.9)

				var_74_9.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1099ui_story, var_74_13, var_74_12)

				local var_74_14 = manager.ui.mainCamera.transform.position - var_74_9.position

				var_74_9.forward = Vector3.New(var_74_14.x, var_74_14.y, var_74_14.z)

				local var_74_15 = var_74_9.localEulerAngles

				var_74_15.z = 0
				var_74_15.x = 0
				var_74_9.localEulerAngles = var_74_15
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 then
				var_74_9.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_74_16 = manager.ui.mainCamera.transform.position - var_74_9.position

				var_74_9.forward = Vector3.New(var_74_16.x, var_74_16.y, var_74_16.z)

				local var_74_17 = var_74_9.localEulerAngles

				var_74_17.z = 0
				var_74_17.x = 0
				var_74_9.localEulerAngles = var_74_17
			end

			local var_74_18 = arg_71_1.actors_["1099ui_story"]
			local var_74_19 = 0

			if var_74_19 < arg_71_1.time_ and arg_71_1.time_ <= var_74_19 + arg_74_0 and arg_71_1.var_.characterEffect1099ui_story == nil then
				arg_71_1.var_.characterEffect1099ui_story = var_74_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_20 = 0.2

			if var_74_19 <= arg_71_1.time_ and arg_71_1.time_ < var_74_19 + var_74_20 then
				local var_74_21 = (arg_71_1.time_ - var_74_19) / var_74_20

				if arg_71_1.var_.characterEffect1099ui_story then
					arg_71_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_19 + var_74_20 and arg_71_1.time_ < var_74_19 + var_74_20 + arg_74_0 and arg_71_1.var_.characterEffect1099ui_story then
				arg_71_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_74_22 = 0

			if var_74_22 < arg_71_1.time_ and arg_71_1.time_ <= var_74_22 + arg_74_0 then
				arg_71_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_1")
			end

			local var_74_23 = 0

			if var_74_23 < arg_71_1.time_ and arg_71_1.time_ <= var_74_23 + arg_74_0 then
				arg_71_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_74_24 = 0
			local var_74_25 = 0.95

			if var_74_24 < arg_71_1.time_ and arg_71_1.time_ <= var_74_24 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_26 = arg_71_1:FormatText(StoryNameCfg[84].name)

				arg_71_1.leftNameTxt_.text = var_74_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_27 = arg_71_1:GetWordFromCfg(119901018)
				local var_74_28 = arg_71_1:FormatText(var_74_27.content)

				arg_71_1.text_.text = var_74_28

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_29 = 38
				local var_74_30 = utf8.len(var_74_28)
				local var_74_31 = var_74_29 <= 0 and var_74_25 or var_74_25 * (var_74_30 / var_74_29)

				if var_74_31 > 0 and var_74_25 < var_74_31 then
					arg_71_1.talkMaxDuration = var_74_31

					if var_74_31 + var_74_24 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_31 + var_74_24
					end
				end

				arg_71_1.text_.text = var_74_28
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901018", "story_v_side_old_119901.awb") ~= 0 then
					local var_74_32 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901018", "story_v_side_old_119901.awb") / 1000

					if var_74_32 + var_74_24 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_32 + var_74_24
					end

					if var_74_27.prefab_name ~= "" and arg_71_1.actors_[var_74_27.prefab_name] ~= nil then
						local var_74_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_27.prefab_name].transform, "story_v_side_old_119901", "119901018", "story_v_side_old_119901.awb")

						arg_71_1:RecordAudio("119901018", var_74_33)
						arg_71_1:RecordAudio("119901018", var_74_33)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901018", "story_v_side_old_119901.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901018", "story_v_side_old_119901.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_34 = math.max(var_74_25, arg_71_1.talkMaxDuration)

			if var_74_24 <= arg_71_1.time_ and arg_71_1.time_ < var_74_24 + var_74_34 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_24) / var_74_34

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_24 + var_74_34 and arg_71_1.time_ < var_74_24 + var_74_34 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play119901019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 119901019
		arg_75_1.duration_ = 4.6

		local var_75_0 = {
			ja = 4.6,
			ko = 4.366,
			zh = 2.6,
			en = 3.966
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
				arg_75_0:Play119901020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1050ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1050ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(-0.7, -1, -6.1)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1050ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1099ui_story"].transform
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.var_.moveOldPos1099ui_story = var_78_9.localPosition
			end

			local var_78_11 = 0.001

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11
				local var_78_13 = Vector3.New(0.7, -1.08, -5.9)

				var_78_9.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1099ui_story, var_78_13, var_78_12)

				local var_78_14 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_14.x, var_78_14.y, var_78_14.z)

				local var_78_15 = var_78_9.localEulerAngles

				var_78_15.z = 0
				var_78_15.x = 0
				var_78_9.localEulerAngles = var_78_15
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 then
				var_78_9.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_78_16 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_16.x, var_78_16.y, var_78_16.z)

				local var_78_17 = var_78_9.localEulerAngles

				var_78_17.z = 0
				var_78_17.x = 0
				var_78_9.localEulerAngles = var_78_17
			end

			local var_78_18 = arg_75_1.actors_["1050ui_story"]
			local var_78_19 = 0

			if var_78_19 < arg_75_1.time_ and arg_75_1.time_ <= var_78_19 + arg_78_0 and arg_75_1.var_.characterEffect1050ui_story == nil then
				arg_75_1.var_.characterEffect1050ui_story = var_78_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_20 = 0.2

			if var_78_19 <= arg_75_1.time_ and arg_75_1.time_ < var_78_19 + var_78_20 then
				local var_78_21 = (arg_75_1.time_ - var_78_19) / var_78_20

				if arg_75_1.var_.characterEffect1050ui_story then
					arg_75_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_19 + var_78_20 and arg_75_1.time_ < var_78_19 + var_78_20 + arg_78_0 and arg_75_1.var_.characterEffect1050ui_story then
				arg_75_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_78_22 = arg_75_1.actors_["1099ui_story"]
			local var_78_23 = 0

			if var_78_23 < arg_75_1.time_ and arg_75_1.time_ <= var_78_23 + arg_78_0 and arg_75_1.var_.characterEffect1099ui_story == nil then
				arg_75_1.var_.characterEffect1099ui_story = var_78_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_24 = 0.2

			if var_78_23 <= arg_75_1.time_ and arg_75_1.time_ < var_78_23 + var_78_24 then
				local var_78_25 = (arg_75_1.time_ - var_78_23) / var_78_24

				if arg_75_1.var_.characterEffect1099ui_story then
					local var_78_26 = Mathf.Lerp(0, 0.5, var_78_25)

					arg_75_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1099ui_story.fillRatio = var_78_26
				end
			end

			if arg_75_1.time_ >= var_78_23 + var_78_24 and arg_75_1.time_ < var_78_23 + var_78_24 + arg_78_0 and arg_75_1.var_.characterEffect1099ui_story then
				local var_78_27 = 0.5

				arg_75_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1099ui_story.fillRatio = var_78_27
			end

			local var_78_28 = 0

			if var_78_28 < arg_75_1.time_ and arg_75_1.time_ <= var_78_28 + arg_78_0 then
				arg_75_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_78_29 = 0

			if var_78_29 < arg_75_1.time_ and arg_75_1.time_ <= var_78_29 + arg_78_0 then
				arg_75_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_78_30 = 0
			local var_78_31 = 0.375

			if var_78_30 < arg_75_1.time_ and arg_75_1.time_ <= var_78_30 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_32 = arg_75_1:FormatText(StoryNameCfg[74].name)

				arg_75_1.leftNameTxt_.text = var_78_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_33 = arg_75_1:GetWordFromCfg(119901019)
				local var_78_34 = arg_75_1:FormatText(var_78_33.content)

				arg_75_1.text_.text = var_78_34

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_35 = 15
				local var_78_36 = utf8.len(var_78_34)
				local var_78_37 = var_78_35 <= 0 and var_78_31 or var_78_31 * (var_78_36 / var_78_35)

				if var_78_37 > 0 and var_78_31 < var_78_37 then
					arg_75_1.talkMaxDuration = var_78_37

					if var_78_37 + var_78_30 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_37 + var_78_30
					end
				end

				arg_75_1.text_.text = var_78_34
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901019", "story_v_side_old_119901.awb") ~= 0 then
					local var_78_38 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901019", "story_v_side_old_119901.awb") / 1000

					if var_78_38 + var_78_30 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_38 + var_78_30
					end

					if var_78_33.prefab_name ~= "" and arg_75_1.actors_[var_78_33.prefab_name] ~= nil then
						local var_78_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_33.prefab_name].transform, "story_v_side_old_119901", "119901019", "story_v_side_old_119901.awb")

						arg_75_1:RecordAudio("119901019", var_78_39)
						arg_75_1:RecordAudio("119901019", var_78_39)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901019", "story_v_side_old_119901.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901019", "story_v_side_old_119901.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_40 = math.max(var_78_31, arg_75_1.talkMaxDuration)

			if var_78_30 <= arg_75_1.time_ and arg_75_1.time_ < var_78_30 + var_78_40 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_30) / var_78_40

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_30 + var_78_40 and arg_75_1.time_ < var_78_30 + var_78_40 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play119901020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 119901020
		arg_79_1.duration_ = 14.133

		local var_79_0 = {
			ja = 14.133,
			ko = 11,
			zh = 9.266,
			en = 13.066
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
				arg_79_0:Play119901021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1050ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1050ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1050ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, 100, 0)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["1099ui_story"].transform
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1.var_.moveOldPos1099ui_story = var_82_9.localPosition
			end

			local var_82_11 = 0.001

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11
				local var_82_13 = Vector3.New(0, 100, 0)

				var_82_9.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1099ui_story, var_82_13, var_82_12)

				local var_82_14 = manager.ui.mainCamera.transform.position - var_82_9.position

				var_82_9.forward = Vector3.New(var_82_14.x, var_82_14.y, var_82_14.z)

				local var_82_15 = var_82_9.localEulerAngles

				var_82_15.z = 0
				var_82_15.x = 0
				var_82_9.localEulerAngles = var_82_15
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 then
				var_82_9.localPosition = Vector3.New(0, 100, 0)

				local var_82_16 = manager.ui.mainCamera.transform.position - var_82_9.position

				var_82_9.forward = Vector3.New(var_82_16.x, var_82_16.y, var_82_16.z)

				local var_82_17 = var_82_9.localEulerAngles

				var_82_17.z = 0
				var_82_17.x = 0
				var_82_9.localEulerAngles = var_82_17
			end

			local var_82_18 = arg_79_1.actors_["1119ui_story"].transform
			local var_82_19 = 0

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.var_.moveOldPos1119ui_story = var_82_18.localPosition
			end

			local var_82_20 = 0.001

			if var_82_19 <= arg_79_1.time_ and arg_79_1.time_ < var_82_19 + var_82_20 then
				local var_82_21 = (arg_79_1.time_ - var_82_19) / var_82_20
				local var_82_22 = Vector3.New(0, -1.08, -5.9)

				var_82_18.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1119ui_story, var_82_22, var_82_21)

				local var_82_23 = manager.ui.mainCamera.transform.position - var_82_18.position

				var_82_18.forward = Vector3.New(var_82_23.x, var_82_23.y, var_82_23.z)

				local var_82_24 = var_82_18.localEulerAngles

				var_82_24.z = 0
				var_82_24.x = 0
				var_82_18.localEulerAngles = var_82_24
			end

			if arg_79_1.time_ >= var_82_19 + var_82_20 and arg_79_1.time_ < var_82_19 + var_82_20 + arg_82_0 then
				var_82_18.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_82_25 = manager.ui.mainCamera.transform.position - var_82_18.position

				var_82_18.forward = Vector3.New(var_82_25.x, var_82_25.y, var_82_25.z)

				local var_82_26 = var_82_18.localEulerAngles

				var_82_26.z = 0
				var_82_26.x = 0
				var_82_18.localEulerAngles = var_82_26
			end

			local var_82_27 = 0

			if var_82_27 < arg_79_1.time_ and arg_79_1.time_ <= var_82_27 + arg_82_0 then
				arg_79_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_82_28 = 0

			if var_82_28 < arg_79_1.time_ and arg_79_1.time_ <= var_82_28 + arg_82_0 then
				arg_79_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_82_29 = 0
			local var_82_30 = 1.15

			if var_82_29 < arg_79_1.time_ and arg_79_1.time_ <= var_82_29 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_31 = arg_79_1:FormatText(StoryNameCfg[13].name)

				arg_79_1.leftNameTxt_.text = var_82_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_32 = arg_79_1:GetWordFromCfg(119901020)
				local var_82_33 = arg_79_1:FormatText(var_82_32.content)

				arg_79_1.text_.text = var_82_33

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_34 = 46
				local var_82_35 = utf8.len(var_82_33)
				local var_82_36 = var_82_34 <= 0 and var_82_30 or var_82_30 * (var_82_35 / var_82_34)

				if var_82_36 > 0 and var_82_30 < var_82_36 then
					arg_79_1.talkMaxDuration = var_82_36

					if var_82_36 + var_82_29 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_36 + var_82_29
					end
				end

				arg_79_1.text_.text = var_82_33
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901020", "story_v_side_old_119901.awb") ~= 0 then
					local var_82_37 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901020", "story_v_side_old_119901.awb") / 1000

					if var_82_37 + var_82_29 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_37 + var_82_29
					end

					if var_82_32.prefab_name ~= "" and arg_79_1.actors_[var_82_32.prefab_name] ~= nil then
						local var_82_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_32.prefab_name].transform, "story_v_side_old_119901", "119901020", "story_v_side_old_119901.awb")

						arg_79_1:RecordAudio("119901020", var_82_38)
						arg_79_1:RecordAudio("119901020", var_82_38)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901020", "story_v_side_old_119901.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901020", "story_v_side_old_119901.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_39 = math.max(var_82_30, arg_79_1.talkMaxDuration)

			if var_82_29 <= arg_79_1.time_ and arg_79_1.time_ < var_82_29 + var_82_39 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_29) / var_82_39

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_29 + var_82_39 and arg_79_1.time_ < var_82_29 + var_82_39 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play119901021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 119901021
		arg_83_1.duration_ = 7.566

		local var_83_0 = {
			ja = 7.3,
			ko = 6.6,
			zh = 5.566,
			en = 7.566
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
				arg_83_0:Play119901022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action454")
			end

			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_86_2 = 0
			local var_86_3 = 0.725

			if var_86_2 < arg_83_1.time_ and arg_83_1.time_ <= var_86_2 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_4 = arg_83_1:FormatText(StoryNameCfg[13].name)

				arg_83_1.leftNameTxt_.text = var_86_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_5 = arg_83_1:GetWordFromCfg(119901021)
				local var_86_6 = arg_83_1:FormatText(var_86_5.content)

				arg_83_1.text_.text = var_86_6

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_7 = 29
				local var_86_8 = utf8.len(var_86_6)
				local var_86_9 = var_86_7 <= 0 and var_86_3 or var_86_3 * (var_86_8 / var_86_7)

				if var_86_9 > 0 and var_86_3 < var_86_9 then
					arg_83_1.talkMaxDuration = var_86_9

					if var_86_9 + var_86_2 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_9 + var_86_2
					end
				end

				arg_83_1.text_.text = var_86_6
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901021", "story_v_side_old_119901.awb") ~= 0 then
					local var_86_10 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901021", "story_v_side_old_119901.awb") / 1000

					if var_86_10 + var_86_2 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_10 + var_86_2
					end

					if var_86_5.prefab_name ~= "" and arg_83_1.actors_[var_86_5.prefab_name] ~= nil then
						local var_86_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_5.prefab_name].transform, "story_v_side_old_119901", "119901021", "story_v_side_old_119901.awb")

						arg_83_1:RecordAudio("119901021", var_86_11)
						arg_83_1:RecordAudio("119901021", var_86_11)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901021", "story_v_side_old_119901.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901021", "story_v_side_old_119901.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_12 = math.max(var_86_3, arg_83_1.talkMaxDuration)

			if var_86_2 <= arg_83_1.time_ and arg_83_1.time_ < var_86_2 + var_86_12 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_2) / var_86_12

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_2 + var_86_12 and arg_83_1.time_ < var_86_2 + var_86_12 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play119901022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 119901022
		arg_87_1.duration_ = 1.999999999999

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play119901023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1119ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1119ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, 100, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1119ui_story, var_90_4, var_90_3)

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

			local var_90_9 = arg_87_1.actors_["1099ui_story"].transform
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.var_.moveOldPos1099ui_story = var_90_9.localPosition
			end

			local var_90_11 = 0.001

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11
				local var_90_13 = Vector3.New(0, -1.08, -5.9)

				var_90_9.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1099ui_story, var_90_13, var_90_12)

				local var_90_14 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_14.x, var_90_14.y, var_90_14.z)

				local var_90_15 = var_90_9.localEulerAngles

				var_90_15.z = 0
				var_90_15.x = 0
				var_90_9.localEulerAngles = var_90_15
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 then
				var_90_9.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_90_16 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_16.x, var_90_16.y, var_90_16.z)

				local var_90_17 = var_90_9.localEulerAngles

				var_90_17.z = 0
				var_90_17.x = 0
				var_90_9.localEulerAngles = var_90_17
			end

			local var_90_18 = arg_87_1.actors_["1099ui_story"]
			local var_90_19 = 0

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 and arg_87_1.var_.characterEffect1099ui_story == nil then
				arg_87_1.var_.characterEffect1099ui_story = var_90_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_20 = 0.2

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_20 then
				local var_90_21 = (arg_87_1.time_ - var_90_19) / var_90_20

				if arg_87_1.var_.characterEffect1099ui_story then
					arg_87_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_19 + var_90_20 and arg_87_1.time_ < var_90_19 + var_90_20 + arg_90_0 and arg_87_1.var_.characterEffect1099ui_story then
				arg_87_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_90_22 = 0

			if var_90_22 < arg_87_1.time_ and arg_87_1.time_ <= var_90_22 + arg_90_0 then
				arg_87_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action5_1")
			end

			local var_90_23 = 0

			if var_90_23 < arg_87_1.time_ and arg_87_1.time_ <= var_90_23 + arg_90_0 then
				arg_87_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_90_24 = 0
			local var_90_25 = 0.175

			if var_90_24 < arg_87_1.time_ and arg_87_1.time_ <= var_90_24 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_26 = arg_87_1:FormatText(StoryNameCfg[84].name)

				arg_87_1.leftNameTxt_.text = var_90_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_27 = arg_87_1:GetWordFromCfg(119901022)
				local var_90_28 = arg_87_1:FormatText(var_90_27.content)

				arg_87_1.text_.text = var_90_28

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_29 = 7
				local var_90_30 = utf8.len(var_90_28)
				local var_90_31 = var_90_29 <= 0 and var_90_25 or var_90_25 * (var_90_30 / var_90_29)

				if var_90_31 > 0 and var_90_25 < var_90_31 then
					arg_87_1.talkMaxDuration = var_90_31

					if var_90_31 + var_90_24 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_31 + var_90_24
					end
				end

				arg_87_1.text_.text = var_90_28
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901022", "story_v_side_old_119901.awb") ~= 0 then
					local var_90_32 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901022", "story_v_side_old_119901.awb") / 1000

					if var_90_32 + var_90_24 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_32 + var_90_24
					end

					if var_90_27.prefab_name ~= "" and arg_87_1.actors_[var_90_27.prefab_name] ~= nil then
						local var_90_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_27.prefab_name].transform, "story_v_side_old_119901", "119901022", "story_v_side_old_119901.awb")

						arg_87_1:RecordAudio("119901022", var_90_33)
						arg_87_1:RecordAudio("119901022", var_90_33)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901022", "story_v_side_old_119901.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901022", "story_v_side_old_119901.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_34 = math.max(var_90_25, arg_87_1.talkMaxDuration)

			if var_90_24 <= arg_87_1.time_ and arg_87_1.time_ < var_90_24 + var_90_34 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_24) / var_90_34

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_24 + var_90_34 and arg_87_1.time_ < var_90_24 + var_90_34 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play119901023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 119901023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play119901024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1099ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1099ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0, 100, 0)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1099ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, 100, 0)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = 0
			local var_94_10 = 0.725

			if var_94_9 < arg_91_1.time_ and arg_91_1.time_ <= var_94_9 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_11 = arg_91_1:GetWordFromCfg(119901023)
				local var_94_12 = arg_91_1:FormatText(var_94_11.content)

				arg_91_1.text_.text = var_94_12

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_13 = 29
				local var_94_14 = utf8.len(var_94_12)
				local var_94_15 = var_94_13 <= 0 and var_94_10 or var_94_10 * (var_94_14 / var_94_13)

				if var_94_15 > 0 and var_94_10 < var_94_15 then
					arg_91_1.talkMaxDuration = var_94_15

					if var_94_15 + var_94_9 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_15 + var_94_9
					end
				end

				arg_91_1.text_.text = var_94_12
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_16 = math.max(var_94_10, arg_91_1.talkMaxDuration)

			if var_94_9 <= arg_91_1.time_ and arg_91_1.time_ < var_94_9 + var_94_16 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_9) / var_94_16

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_9 + var_94_16 and arg_91_1.time_ < var_94_9 + var_94_16 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play119901024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 119901024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play119901025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				local var_98_2 = "play"
				local var_98_3 = "effect"

				arg_95_1:AudioAction(var_98_2, var_98_3, "se_story_side_1199", "se_story_1199_call", "")
			end

			local var_98_4 = 0
			local var_98_5 = 1.15

			if var_98_4 < arg_95_1.time_ and arg_95_1.time_ <= var_98_4 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_6 = arg_95_1:GetWordFromCfg(119901024)
				local var_98_7 = arg_95_1:FormatText(var_98_6.content)

				arg_95_1.text_.text = var_98_7

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_8 = 46
				local var_98_9 = utf8.len(var_98_7)
				local var_98_10 = var_98_8 <= 0 and var_98_5 or var_98_5 * (var_98_9 / var_98_8)

				if var_98_10 > 0 and var_98_5 < var_98_10 then
					arg_95_1.talkMaxDuration = var_98_10

					if var_98_10 + var_98_4 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_10 + var_98_4
					end
				end

				arg_95_1.text_.text = var_98_7
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_11 = math.max(var_98_5, arg_95_1.talkMaxDuration)

			if var_98_4 <= arg_95_1.time_ and arg_95_1.time_ < var_98_4 + var_98_11 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_4) / var_98_11

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_4 + var_98_11 and arg_95_1.time_ < var_98_4 + var_98_11 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play119901025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 119901025
		arg_99_1.duration_ = 3.766

		local var_99_0 = {
			ja = 2.9,
			ko = 2.466,
			zh = 1.999999999999,
			en = 3.766
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
				arg_99_0:Play119901026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1050ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1050ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(-0.7, -1, -6.1)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1050ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1050ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1050ui_story == nil then
				arg_99_1.var_.characterEffect1050ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.2

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1050ui_story then
					arg_99_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1050ui_story then
				arg_99_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action4_1")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_102_15 = 0
			local var_102_16 = 0.225

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_17 = arg_99_1:FormatText(StoryNameCfg[74].name)

				arg_99_1.leftNameTxt_.text = var_102_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_18 = arg_99_1:GetWordFromCfg(119901025)
				local var_102_19 = arg_99_1:FormatText(var_102_18.content)

				arg_99_1.text_.text = var_102_19

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_20 = 9
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

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901025", "story_v_side_old_119901.awb") ~= 0 then
					local var_102_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901025", "story_v_side_old_119901.awb") / 1000

					if var_102_23 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_23 + var_102_15
					end

					if var_102_18.prefab_name ~= "" and arg_99_1.actors_[var_102_18.prefab_name] ~= nil then
						local var_102_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_18.prefab_name].transform, "story_v_side_old_119901", "119901025", "story_v_side_old_119901.awb")

						arg_99_1:RecordAudio("119901025", var_102_24)
						arg_99_1:RecordAudio("119901025", var_102_24)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901025", "story_v_side_old_119901.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901025", "story_v_side_old_119901.awb")
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
	Play119901026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 119901026
		arg_103_1.duration_ = 2.4

		local var_103_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.4
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
				arg_103_0:Play119901027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = "1199ui_story"

			if arg_103_1.actors_[var_106_0] == nil then
				local var_106_1 = Object.Instantiate(Asset.Load("Char/" .. var_106_0), arg_103_1.stage_.transform)

				var_106_1.name = var_106_0
				var_106_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_103_1.actors_[var_106_0] = var_106_1

				local var_106_2 = var_106_1:GetComponentInChildren(typeof(CharacterEffect))

				var_106_2.enabled = true

				local var_106_3 = GameObjectTools.GetOrAddComponent(var_106_1, typeof(DynamicBoneHelper))

				if var_106_3 then
					var_106_3:EnableDynamicBone(false)
				end

				arg_103_1:ShowWeapon(var_106_2.transform, false)

				arg_103_1.var_[var_106_0 .. "Animator"] = var_106_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_103_1.var_[var_106_0 .. "Animator"].applyRootMotion = true
				arg_103_1.var_[var_106_0 .. "LipSync"] = var_106_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_106_4 = arg_103_1.actors_["1199ui_story"].transform
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1.var_.moveOldPos1199ui_story = var_106_4.localPosition
			end

			local var_106_6 = 0.001

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6
				local var_106_8 = Vector3.New(0.7, -1.08, -5.9)

				var_106_4.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1199ui_story, var_106_8, var_106_7)

				local var_106_9 = manager.ui.mainCamera.transform.position - var_106_4.position

				var_106_4.forward = Vector3.New(var_106_9.x, var_106_9.y, var_106_9.z)

				local var_106_10 = var_106_4.localEulerAngles

				var_106_10.z = 0
				var_106_10.x = 0
				var_106_4.localEulerAngles = var_106_10
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 then
				var_106_4.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_106_11 = manager.ui.mainCamera.transform.position - var_106_4.position

				var_106_4.forward = Vector3.New(var_106_11.x, var_106_11.y, var_106_11.z)

				local var_106_12 = var_106_4.localEulerAngles

				var_106_12.z = 0
				var_106_12.x = 0
				var_106_4.localEulerAngles = var_106_12
			end

			local var_106_13 = arg_103_1.actors_["1050ui_story"]
			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 and arg_103_1.var_.characterEffect1050ui_story == nil then
				arg_103_1.var_.characterEffect1050ui_story = var_106_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_15 = 0.2

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_15 then
				local var_106_16 = (arg_103_1.time_ - var_106_14) / var_106_15

				if arg_103_1.var_.characterEffect1050ui_story then
					local var_106_17 = Mathf.Lerp(0, 0.5, var_106_16)

					arg_103_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1050ui_story.fillRatio = var_106_17
				end
			end

			if arg_103_1.time_ >= var_106_14 + var_106_15 and arg_103_1.time_ < var_106_14 + var_106_15 + arg_106_0 and arg_103_1.var_.characterEffect1050ui_story then
				local var_106_18 = 0.5

				arg_103_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1050ui_story.fillRatio = var_106_18
			end

			local var_106_19 = arg_103_1.actors_["1199ui_story"]
			local var_106_20 = 0

			if var_106_20 < arg_103_1.time_ and arg_103_1.time_ <= var_106_20 + arg_106_0 and arg_103_1.var_.characterEffect1199ui_story == nil then
				arg_103_1.var_.characterEffect1199ui_story = var_106_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_21 = 0.2

			if var_106_20 <= arg_103_1.time_ and arg_103_1.time_ < var_106_20 + var_106_21 then
				local var_106_22 = (arg_103_1.time_ - var_106_20) / var_106_21

				if arg_103_1.var_.characterEffect1199ui_story then
					arg_103_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_20 + var_106_21 and arg_103_1.time_ < var_106_20 + var_106_21 + arg_106_0 and arg_103_1.var_.characterEffect1199ui_story then
				arg_103_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_106_23 = 0

			if var_106_23 < arg_103_1.time_ and arg_103_1.time_ <= var_106_23 + arg_106_0 then
				arg_103_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_1")
			end

			local var_106_24 = 0

			if var_106_24 < arg_103_1.time_ and arg_103_1.time_ <= var_106_24 + arg_106_0 then
				arg_103_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_106_25 = 0
			local var_106_26 = 0.05

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_27 = arg_103_1:FormatText(StoryNameCfg[84].name)

				arg_103_1.leftNameTxt_.text = var_106_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_28 = arg_103_1:GetWordFromCfg(119901026)
				local var_106_29 = arg_103_1:FormatText(var_106_28.content)

				arg_103_1.text_.text = var_106_29

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_30 = 2
				local var_106_31 = utf8.len(var_106_29)
				local var_106_32 = var_106_30 <= 0 and var_106_26 or var_106_26 * (var_106_31 / var_106_30)

				if var_106_32 > 0 and var_106_26 < var_106_32 then
					arg_103_1.talkMaxDuration = var_106_32

					if var_106_32 + var_106_25 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_32 + var_106_25
					end
				end

				arg_103_1.text_.text = var_106_29
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901026", "story_v_side_old_119901.awb") ~= 0 then
					local var_106_33 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901026", "story_v_side_old_119901.awb") / 1000

					if var_106_33 + var_106_25 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_33 + var_106_25
					end

					if var_106_28.prefab_name ~= "" and arg_103_1.actors_[var_106_28.prefab_name] ~= nil then
						local var_106_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_28.prefab_name].transform, "story_v_side_old_119901", "119901026", "story_v_side_old_119901.awb")

						arg_103_1:RecordAudio("119901026", var_106_34)
						arg_103_1:RecordAudio("119901026", var_106_34)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901026", "story_v_side_old_119901.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901026", "story_v_side_old_119901.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_35 = math.max(var_106_26, arg_103_1.talkMaxDuration)

			if var_106_25 <= arg_103_1.time_ and arg_103_1.time_ < var_106_25 + var_106_35 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_25) / var_106_35

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_25 + var_106_35 and arg_103_1.time_ < var_106_25 + var_106_35 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play119901027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 119901027
		arg_107_1.duration_ = 4.666

		local var_107_0 = {
			ja = 4.666,
			ko = 2.333,
			zh = 2.1,
			en = 2.633
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
				arg_107_0:Play119901028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1050ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1050ui_story == nil then
				arg_107_1.var_.characterEffect1050ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1050ui_story then
					arg_107_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1050ui_story then
				arg_107_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_110_4 = arg_107_1.actors_["1199ui_story"]
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 and arg_107_1.var_.characterEffect1199ui_story == nil then
				arg_107_1.var_.characterEffect1199ui_story = var_110_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_6 = 0.2

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6

				if arg_107_1.var_.characterEffect1199ui_story then
					local var_110_8 = Mathf.Lerp(0, 0.5, var_110_7)

					arg_107_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1199ui_story.fillRatio = var_110_8
				end
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect1199ui_story then
				local var_110_9 = 0.5

				arg_107_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1199ui_story.fillRatio = var_110_9
			end

			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 then
				arg_107_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050actionlink/1050action446")
			end

			local var_110_11 = 0

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_110_12 = 0
			local var_110_13 = 0.2

			if var_110_12 < arg_107_1.time_ and arg_107_1.time_ <= var_110_12 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_14 = arg_107_1:FormatText(StoryNameCfg[74].name)

				arg_107_1.leftNameTxt_.text = var_110_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_15 = arg_107_1:GetWordFromCfg(119901027)
				local var_110_16 = arg_107_1:FormatText(var_110_15.content)

				arg_107_1.text_.text = var_110_16

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_17 = 8
				local var_110_18 = utf8.len(var_110_16)
				local var_110_19 = var_110_17 <= 0 and var_110_13 or var_110_13 * (var_110_18 / var_110_17)

				if var_110_19 > 0 and var_110_13 < var_110_19 then
					arg_107_1.talkMaxDuration = var_110_19

					if var_110_19 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_12
					end
				end

				arg_107_1.text_.text = var_110_16
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901027", "story_v_side_old_119901.awb") ~= 0 then
					local var_110_20 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901027", "story_v_side_old_119901.awb") / 1000

					if var_110_20 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_20 + var_110_12
					end

					if var_110_15.prefab_name ~= "" and arg_107_1.actors_[var_110_15.prefab_name] ~= nil then
						local var_110_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_15.prefab_name].transform, "story_v_side_old_119901", "119901027", "story_v_side_old_119901.awb")

						arg_107_1:RecordAudio("119901027", var_110_21)
						arg_107_1:RecordAudio("119901027", var_110_21)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901027", "story_v_side_old_119901.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901027", "story_v_side_old_119901.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_22 = math.max(var_110_13, arg_107_1.talkMaxDuration)

			if var_110_12 <= arg_107_1.time_ and arg_107_1.time_ < var_110_12 + var_110_22 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_12) / var_110_22

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_12 + var_110_22 and arg_107_1.time_ < var_110_12 + var_110_22 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play119901028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 119901028
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play119901029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1050ui_story"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1050ui_story = var_114_0.localPosition
			end

			local var_114_2 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2
				local var_114_4 = Vector3.New(0, 100, 0)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1050ui_story, var_114_4, var_114_3)

				local var_114_5 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_5.x, var_114_5.y, var_114_5.z)

				local var_114_6 = var_114_0.localEulerAngles

				var_114_6.z = 0
				var_114_6.x = 0
				var_114_0.localEulerAngles = var_114_6
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(0, 100, 0)

				local var_114_7 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_7.x, var_114_7.y, var_114_7.z)

				local var_114_8 = var_114_0.localEulerAngles

				var_114_8.z = 0
				var_114_8.x = 0
				var_114_0.localEulerAngles = var_114_8
			end

			local var_114_9 = arg_111_1.actors_["1199ui_story"].transform
			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 then
				arg_111_1.var_.moveOldPos1199ui_story = var_114_9.localPosition
			end

			local var_114_11 = 0.001

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_11 then
				local var_114_12 = (arg_111_1.time_ - var_114_10) / var_114_11
				local var_114_13 = Vector3.New(0, 100, 0)

				var_114_9.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1199ui_story, var_114_13, var_114_12)

				local var_114_14 = manager.ui.mainCamera.transform.position - var_114_9.position

				var_114_9.forward = Vector3.New(var_114_14.x, var_114_14.y, var_114_14.z)

				local var_114_15 = var_114_9.localEulerAngles

				var_114_15.z = 0
				var_114_15.x = 0
				var_114_9.localEulerAngles = var_114_15
			end

			if arg_111_1.time_ >= var_114_10 + var_114_11 and arg_111_1.time_ < var_114_10 + var_114_11 + arg_114_0 then
				var_114_9.localPosition = Vector3.New(0, 100, 0)

				local var_114_16 = manager.ui.mainCamera.transform.position - var_114_9.position

				var_114_9.forward = Vector3.New(var_114_16.x, var_114_16.y, var_114_16.z)

				local var_114_17 = var_114_9.localEulerAngles

				var_114_17.z = 0
				var_114_17.x = 0
				var_114_9.localEulerAngles = var_114_17
			end

			local var_114_18 = 0
			local var_114_19 = 0.325

			if var_114_18 < arg_111_1.time_ and arg_111_1.time_ <= var_114_18 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_20 = arg_111_1:GetWordFromCfg(119901028)
				local var_114_21 = arg_111_1:FormatText(var_114_20.content)

				arg_111_1.text_.text = var_114_21

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_22 = 13
				local var_114_23 = utf8.len(var_114_21)
				local var_114_24 = var_114_22 <= 0 and var_114_19 or var_114_19 * (var_114_23 / var_114_22)

				if var_114_24 > 0 and var_114_19 < var_114_24 then
					arg_111_1.talkMaxDuration = var_114_24

					if var_114_24 + var_114_18 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_24 + var_114_18
					end
				end

				arg_111_1.text_.text = var_114_21
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_25 = math.max(var_114_19, arg_111_1.talkMaxDuration)

			if var_114_18 <= arg_111_1.time_ and arg_111_1.time_ < var_114_18 + var_114_25 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_18) / var_114_25

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_18 + var_114_25 and arg_111_1.time_ < var_114_18 + var_114_25 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play119901029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 119901029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play119901030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 1.125

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_2 = arg_115_1:GetWordFromCfg(119901029)
				local var_118_3 = arg_115_1:FormatText(var_118_2.content)

				arg_115_1.text_.text = var_118_3

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_4 = 45
				local var_118_5 = utf8.len(var_118_3)
				local var_118_6 = var_118_4 <= 0 and var_118_1 or var_118_1 * (var_118_5 / var_118_4)

				if var_118_6 > 0 and var_118_1 < var_118_6 then
					arg_115_1.talkMaxDuration = var_118_6

					if var_118_6 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_6 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_3
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_7 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_7 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_7

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_7 and arg_115_1.time_ < var_118_0 + var_118_7 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play119901030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 119901030
		arg_119_1.duration_ = 13.533

		local var_119_0 = {
			ja = 13.533,
			ko = 8,
			zh = 7.733,
			en = 10.133
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
				arg_119_0:Play119901031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1199ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1199ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, -1.08, -5.9)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1199ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1199ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1199ui_story == nil then
				arg_119_1.var_.characterEffect1199ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.2

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1199ui_story then
					arg_119_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1199ui_story then
				arg_119_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_122_13 = 0

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action464")
			end

			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				arg_119_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_122_15 = 0
			local var_122_16 = 0.75

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_17 = arg_119_1:FormatText(StoryNameCfg[84].name)

				arg_119_1.leftNameTxt_.text = var_122_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_18 = arg_119_1:GetWordFromCfg(119901030)
				local var_122_19 = arg_119_1:FormatText(var_122_18.content)

				arg_119_1.text_.text = var_122_19

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_20 = 30
				local var_122_21 = utf8.len(var_122_19)
				local var_122_22 = var_122_20 <= 0 and var_122_16 or var_122_16 * (var_122_21 / var_122_20)

				if var_122_22 > 0 and var_122_16 < var_122_22 then
					arg_119_1.talkMaxDuration = var_122_22

					if var_122_22 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_22 + var_122_15
					end
				end

				arg_119_1.text_.text = var_122_19
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901030", "story_v_side_old_119901.awb") ~= 0 then
					local var_122_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901030", "story_v_side_old_119901.awb") / 1000

					if var_122_23 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_23 + var_122_15
					end

					if var_122_18.prefab_name ~= "" and arg_119_1.actors_[var_122_18.prefab_name] ~= nil then
						local var_122_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_18.prefab_name].transform, "story_v_side_old_119901", "119901030", "story_v_side_old_119901.awb")

						arg_119_1:RecordAudio("119901030", var_122_24)
						arg_119_1:RecordAudio("119901030", var_122_24)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901030", "story_v_side_old_119901.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901030", "story_v_side_old_119901.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_25 = math.max(var_122_16, arg_119_1.talkMaxDuration)

			if var_122_15 <= arg_119_1.time_ and arg_119_1.time_ < var_122_15 + var_122_25 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_15) / var_122_25

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_15 + var_122_25 and arg_119_1.time_ < var_122_15 + var_122_25 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play119901031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 119901031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play119901032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1199ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1199ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0, 100, 0)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1199ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, 100, 0)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = 0
			local var_126_10 = 1

			if var_126_9 < arg_123_1.time_ and arg_123_1.time_ <= var_126_9 + arg_126_0 then
				local var_126_11 = "play"
				local var_126_12 = "effect"

				arg_123_1:AudioAction(var_126_11, var_126_12, "se_story_side_1199", "se_story_1199_unsheath", "")
			end

			local var_126_13 = 0
			local var_126_14 = 1.475

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_15 = arg_123_1:GetWordFromCfg(119901031)
				local var_126_16 = arg_123_1:FormatText(var_126_15.content)

				arg_123_1.text_.text = var_126_16

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_17 = 59
				local var_126_18 = utf8.len(var_126_16)
				local var_126_19 = var_126_17 <= 0 and var_126_14 or var_126_14 * (var_126_18 / var_126_17)

				if var_126_19 > 0 and var_126_14 < var_126_19 then
					arg_123_1.talkMaxDuration = var_126_19

					if var_126_19 + var_126_13 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_19 + var_126_13
					end
				end

				arg_123_1.text_.text = var_126_16
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_20 = math.max(var_126_14, arg_123_1.talkMaxDuration)

			if var_126_13 <= arg_123_1.time_ and arg_123_1.time_ < var_126_13 + var_126_20 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_13) / var_126_20

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_13 + var_126_20 and arg_123_1.time_ < var_126_13 + var_126_20 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play119901032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 119901032
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play119901033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.95

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_2 = arg_127_1:GetWordFromCfg(119901032)
				local var_130_3 = arg_127_1:FormatText(var_130_2.content)

				arg_127_1.text_.text = var_130_3

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_4 = 38
				local var_130_5 = utf8.len(var_130_3)
				local var_130_6 = var_130_4 <= 0 and var_130_1 or var_130_1 * (var_130_5 / var_130_4)

				if var_130_6 > 0 and var_130_1 < var_130_6 then
					arg_127_1.talkMaxDuration = var_130_6

					if var_130_6 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_6 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_3
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_7 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_7 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_7

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_7 and arg_127_1.time_ < var_130_0 + var_130_7 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play119901033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 119901033
		arg_131_1.duration_ = 3.1

		local var_131_0 = {
			ja = 3.1,
			ko = 1.999999999999,
			zh = 2.066,
			en = 2.233
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
				arg_131_0:Play119901034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1199ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos1199ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, -1.08, -5.9)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1199ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["1199ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect1199ui_story == nil then
				arg_131_1.var_.characterEffect1199ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.2

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect1199ui_story then
					arg_131_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect1199ui_story then
				arg_131_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action4_2")
			end

			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_134_15 = 0
			local var_134_16 = 0.2

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_17 = arg_131_1:FormatText(StoryNameCfg[84].name)

				arg_131_1.leftNameTxt_.text = var_134_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_18 = arg_131_1:GetWordFromCfg(119901033)
				local var_134_19 = arg_131_1:FormatText(var_134_18.content)

				arg_131_1.text_.text = var_134_19

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_20 = 8
				local var_134_21 = utf8.len(var_134_19)
				local var_134_22 = var_134_20 <= 0 and var_134_16 or var_134_16 * (var_134_21 / var_134_20)

				if var_134_22 > 0 and var_134_16 < var_134_22 then
					arg_131_1.talkMaxDuration = var_134_22

					if var_134_22 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_22 + var_134_15
					end
				end

				arg_131_1.text_.text = var_134_19
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901033", "story_v_side_old_119901.awb") ~= 0 then
					local var_134_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901033", "story_v_side_old_119901.awb") / 1000

					if var_134_23 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_23 + var_134_15
					end

					if var_134_18.prefab_name ~= "" and arg_131_1.actors_[var_134_18.prefab_name] ~= nil then
						local var_134_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_18.prefab_name].transform, "story_v_side_old_119901", "119901033", "story_v_side_old_119901.awb")

						arg_131_1:RecordAudio("119901033", var_134_24)
						arg_131_1:RecordAudio("119901033", var_134_24)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901033", "story_v_side_old_119901.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901033", "story_v_side_old_119901.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_25 = math.max(var_134_16, arg_131_1.talkMaxDuration)

			if var_134_15 <= arg_131_1.time_ and arg_131_1.time_ < var_134_15 + var_134_25 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_15) / var_134_25

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_15 + var_134_25 and arg_131_1.time_ < var_134_15 + var_134_25 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play119901034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 119901034
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play119901035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1199ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1199ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, 100, 0)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1199ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, 100, 0)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = 0
			local var_138_10 = 1.2

			if var_138_9 < arg_135_1.time_ and arg_135_1.time_ <= var_138_9 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_11 = arg_135_1:GetWordFromCfg(119901034)
				local var_138_12 = arg_135_1:FormatText(var_138_11.content)

				arg_135_1.text_.text = var_138_12

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_13 = 48
				local var_138_14 = utf8.len(var_138_12)
				local var_138_15 = var_138_13 <= 0 and var_138_10 or var_138_10 * (var_138_14 / var_138_13)

				if var_138_15 > 0 and var_138_10 < var_138_15 then
					arg_135_1.talkMaxDuration = var_138_15

					if var_138_15 + var_138_9 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_15 + var_138_9
					end
				end

				arg_135_1.text_.text = var_138_12
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_16 = math.max(var_138_10, arg_135_1.talkMaxDuration)

			if var_138_9 <= arg_135_1.time_ and arg_135_1.time_ < var_138_9 + var_138_16 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_9) / var_138_16

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_9 + var_138_16 and arg_135_1.time_ < var_138_9 + var_138_16 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play119901035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 119901035
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play119901036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 2
			local var_142_1 = 1

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				local var_142_2 = "play"
				local var_142_3 = "effect"

				arg_139_1:AudioAction(var_142_2, var_142_3, "se_story_side_1199", "se_story_1199_chop", "")
			end

			local var_142_4 = 0
			local var_142_5 = 1.1

			if var_142_4 < arg_139_1.time_ and arg_139_1.time_ <= var_142_4 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_6 = arg_139_1:GetWordFromCfg(119901035)
				local var_142_7 = arg_139_1:FormatText(var_142_6.content)

				arg_139_1.text_.text = var_142_7

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_8 = 44
				local var_142_9 = utf8.len(var_142_7)
				local var_142_10 = var_142_8 <= 0 and var_142_5 or var_142_5 * (var_142_9 / var_142_8)

				if var_142_10 > 0 and var_142_5 < var_142_10 then
					arg_139_1.talkMaxDuration = var_142_10

					if var_142_10 + var_142_4 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_10 + var_142_4
					end
				end

				arg_139_1.text_.text = var_142_7
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_11 = math.max(var_142_5, arg_139_1.talkMaxDuration)

			if var_142_4 <= arg_139_1.time_ and arg_139_1.time_ < var_142_4 + var_142_11 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_4) / var_142_11

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_4 + var_142_11 and arg_139_1.time_ < var_142_4 + var_142_11 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play119901036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 119901036
		arg_143_1.duration_ = 4.766

		local var_143_0 = {
			ja = 3.566,
			ko = 3,
			zh = 2.8,
			en = 4.766
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
				arg_143_0:Play119901037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1050ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1050ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(-0.7, -1, -6.1)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1050ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = arg_143_1.actors_["1050ui_story"]
			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 and arg_143_1.var_.characterEffect1050ui_story == nil then
				arg_143_1.var_.characterEffect1050ui_story = var_146_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_11 = 0.2

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_10) / var_146_11

				if arg_143_1.var_.characterEffect1050ui_story then
					arg_143_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_10 + var_146_11 and arg_143_1.time_ < var_146_10 + var_146_11 + arg_146_0 and arg_143_1.var_.characterEffect1050ui_story then
				arg_143_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_146_13 = 0

			if var_146_13 < arg_143_1.time_ and arg_143_1.time_ <= var_146_13 + arg_146_0 then
				arg_143_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_146_14 = 0

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 then
				arg_143_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_146_15 = 0
			local var_146_16 = 0.15

			if var_146_15 < arg_143_1.time_ and arg_143_1.time_ <= var_146_15 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_17 = arg_143_1:FormatText(StoryNameCfg[74].name)

				arg_143_1.leftNameTxt_.text = var_146_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_18 = arg_143_1:GetWordFromCfg(119901036)
				local var_146_19 = arg_143_1:FormatText(var_146_18.content)

				arg_143_1.text_.text = var_146_19

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_20 = 6
				local var_146_21 = utf8.len(var_146_19)
				local var_146_22 = var_146_20 <= 0 and var_146_16 or var_146_16 * (var_146_21 / var_146_20)

				if var_146_22 > 0 and var_146_16 < var_146_22 then
					arg_143_1.talkMaxDuration = var_146_22

					if var_146_22 + var_146_15 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_22 + var_146_15
					end
				end

				arg_143_1.text_.text = var_146_19
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901036", "story_v_side_old_119901.awb") ~= 0 then
					local var_146_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901036", "story_v_side_old_119901.awb") / 1000

					if var_146_23 + var_146_15 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_23 + var_146_15
					end

					if var_146_18.prefab_name ~= "" and arg_143_1.actors_[var_146_18.prefab_name] ~= nil then
						local var_146_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_18.prefab_name].transform, "story_v_side_old_119901", "119901036", "story_v_side_old_119901.awb")

						arg_143_1:RecordAudio("119901036", var_146_24)
						arg_143_1:RecordAudio("119901036", var_146_24)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901036", "story_v_side_old_119901.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901036", "story_v_side_old_119901.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_25 = math.max(var_146_16, arg_143_1.talkMaxDuration)

			if var_146_15 <= arg_143_1.time_ and arg_143_1.time_ < var_146_15 + var_146_25 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_15) / var_146_25

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_15 + var_146_25 and arg_143_1.time_ < var_146_15 + var_146_25 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play119901037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 119901037
		arg_147_1.duration_ = 5.866

		local var_147_0 = {
			ja = 5.866,
			ko = 3.566,
			zh = 3.433,
			en = 4.633
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
				arg_147_0:Play119901038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1199ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos1199ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(0.7, -1.08, -5.9)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1199ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = arg_147_1.actors_["1050ui_story"]
			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 and arg_147_1.var_.characterEffect1050ui_story == nil then
				arg_147_1.var_.characterEffect1050ui_story = var_150_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_11 = 0.2

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_11 then
				local var_150_12 = (arg_147_1.time_ - var_150_10) / var_150_11

				if arg_147_1.var_.characterEffect1050ui_story then
					local var_150_13 = Mathf.Lerp(0, 0.5, var_150_12)

					arg_147_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1050ui_story.fillRatio = var_150_13
				end
			end

			if arg_147_1.time_ >= var_150_10 + var_150_11 and arg_147_1.time_ < var_150_10 + var_150_11 + arg_150_0 and arg_147_1.var_.characterEffect1050ui_story then
				local var_150_14 = 0.5

				arg_147_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1050ui_story.fillRatio = var_150_14
			end

			local var_150_15 = arg_147_1.actors_["1199ui_story"]
			local var_150_16 = 0

			if var_150_16 < arg_147_1.time_ and arg_147_1.time_ <= var_150_16 + arg_150_0 and arg_147_1.var_.characterEffect1199ui_story == nil then
				arg_147_1.var_.characterEffect1199ui_story = var_150_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_17 = 0.2

			if var_150_16 <= arg_147_1.time_ and arg_147_1.time_ < var_150_16 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_16) / var_150_17

				if arg_147_1.var_.characterEffect1199ui_story then
					arg_147_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_16 + var_150_17 and arg_147_1.time_ < var_150_16 + var_150_17 + arg_150_0 and arg_147_1.var_.characterEffect1199ui_story then
				arg_147_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_150_19 = 0

			if var_150_19 < arg_147_1.time_ and arg_147_1.time_ <= var_150_19 + arg_150_0 then
				arg_147_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action3_1")
			end

			local var_150_20 = 0

			if var_150_20 < arg_147_1.time_ and arg_147_1.time_ <= var_150_20 + arg_150_0 then
				arg_147_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_150_21 = 0
			local var_150_22 = 0.4

			if var_150_21 < arg_147_1.time_ and arg_147_1.time_ <= var_150_21 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_23 = arg_147_1:FormatText(StoryNameCfg[84].name)

				arg_147_1.leftNameTxt_.text = var_150_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_24 = arg_147_1:GetWordFromCfg(119901037)
				local var_150_25 = arg_147_1:FormatText(var_150_24.content)

				arg_147_1.text_.text = var_150_25

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_26 = 16
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

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901037", "story_v_side_old_119901.awb") ~= 0 then
					local var_150_29 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901037", "story_v_side_old_119901.awb") / 1000

					if var_150_29 + var_150_21 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_29 + var_150_21
					end

					if var_150_24.prefab_name ~= "" and arg_147_1.actors_[var_150_24.prefab_name] ~= nil then
						local var_150_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_24.prefab_name].transform, "story_v_side_old_119901", "119901037", "story_v_side_old_119901.awb")

						arg_147_1:RecordAudio("119901037", var_150_30)
						arg_147_1:RecordAudio("119901037", var_150_30)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901037", "story_v_side_old_119901.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901037", "story_v_side_old_119901.awb")
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
	Play119901038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 119901038
		arg_151_1.duration_ = 15.566

		local var_151_0 = {
			ja = 9.8,
			ko = 12.233,
			zh = 9.9,
			en = 15.566
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
				arg_151_0:Play119901039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1050ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1050ui_story == nil then
				arg_151_1.var_.characterEffect1050ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.2

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1050ui_story then
					arg_151_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1050ui_story then
				arg_151_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_154_4 = arg_151_1.actors_["1199ui_story"]
			local var_154_5 = 0

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 and arg_151_1.var_.characterEffect1199ui_story == nil then
				arg_151_1.var_.characterEffect1199ui_story = var_154_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_6 = 0.2

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6

				if arg_151_1.var_.characterEffect1199ui_story then
					local var_154_8 = Mathf.Lerp(0, 0.5, var_154_7)

					arg_151_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1199ui_story.fillRatio = var_154_8
				end
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1199ui_story then
				local var_154_9 = 0.5

				arg_151_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1199ui_story.fillRatio = var_154_9
			end

			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 then
				arg_151_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_154_11 = 0
			local var_154_12 = 1.075

			if var_154_11 < arg_151_1.time_ and arg_151_1.time_ <= var_154_11 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_13 = arg_151_1:FormatText(StoryNameCfg[74].name)

				arg_151_1.leftNameTxt_.text = var_154_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_14 = arg_151_1:GetWordFromCfg(119901038)
				local var_154_15 = arg_151_1:FormatText(var_154_14.content)

				arg_151_1.text_.text = var_154_15

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_16 = 43
				local var_154_17 = utf8.len(var_154_15)
				local var_154_18 = var_154_16 <= 0 and var_154_12 or var_154_12 * (var_154_17 / var_154_16)

				if var_154_18 > 0 and var_154_12 < var_154_18 then
					arg_151_1.talkMaxDuration = var_154_18

					if var_154_18 + var_154_11 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_18 + var_154_11
					end
				end

				arg_151_1.text_.text = var_154_15
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901038", "story_v_side_old_119901.awb") ~= 0 then
					local var_154_19 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901038", "story_v_side_old_119901.awb") / 1000

					if var_154_19 + var_154_11 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_19 + var_154_11
					end

					if var_154_14.prefab_name ~= "" and arg_151_1.actors_[var_154_14.prefab_name] ~= nil then
						local var_154_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_14.prefab_name].transform, "story_v_side_old_119901", "119901038", "story_v_side_old_119901.awb")

						arg_151_1:RecordAudio("119901038", var_154_20)
						arg_151_1:RecordAudio("119901038", var_154_20)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901038", "story_v_side_old_119901.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901038", "story_v_side_old_119901.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_21 = math.max(var_154_12, arg_151_1.talkMaxDuration)

			if var_154_11 <= arg_151_1.time_ and arg_151_1.time_ < var_154_11 + var_154_21 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_11) / var_154_21

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_11 + var_154_21 and arg_151_1.time_ < var_154_11 + var_154_21 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play119901039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 119901039
		arg_155_1.duration_ = 4.8

		local var_155_0 = {
			ja = 4.8,
			ko = 2.6,
			zh = 2.533,
			en = 3.566
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
				arg_155_0:Play119901040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050actionlink/1050action436")
			end

			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_158_2 = 0
			local var_158_3 = 0.3

			if var_158_2 < arg_155_1.time_ and arg_155_1.time_ <= var_158_2 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_4 = arg_155_1:FormatText(StoryNameCfg[74].name)

				arg_155_1.leftNameTxt_.text = var_158_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_5 = arg_155_1:GetWordFromCfg(119901039)
				local var_158_6 = arg_155_1:FormatText(var_158_5.content)

				arg_155_1.text_.text = var_158_6

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_7 = 12
				local var_158_8 = utf8.len(var_158_6)
				local var_158_9 = var_158_7 <= 0 and var_158_3 or var_158_3 * (var_158_8 / var_158_7)

				if var_158_9 > 0 and var_158_3 < var_158_9 then
					arg_155_1.talkMaxDuration = var_158_9

					if var_158_9 + var_158_2 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_9 + var_158_2
					end
				end

				arg_155_1.text_.text = var_158_6
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901039", "story_v_side_old_119901.awb") ~= 0 then
					local var_158_10 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901039", "story_v_side_old_119901.awb") / 1000

					if var_158_10 + var_158_2 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_10 + var_158_2
					end

					if var_158_5.prefab_name ~= "" and arg_155_1.actors_[var_158_5.prefab_name] ~= nil then
						local var_158_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_5.prefab_name].transform, "story_v_side_old_119901", "119901039", "story_v_side_old_119901.awb")

						arg_155_1:RecordAudio("119901039", var_158_11)
						arg_155_1:RecordAudio("119901039", var_158_11)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901039", "story_v_side_old_119901.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901039", "story_v_side_old_119901.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_12 = math.max(var_158_3, arg_155_1.talkMaxDuration)

			if var_158_2 <= arg_155_1.time_ and arg_155_1.time_ < var_158_2 + var_158_12 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_2) / var_158_12

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_2 + var_158_12 and arg_155_1.time_ < var_158_2 + var_158_12 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play119901040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 119901040
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play119901041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1050ui_story"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos1050ui_story = var_162_0.localPosition
			end

			local var_162_2 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2
				local var_162_4 = Vector3.New(0, 100, 0)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1050ui_story, var_162_4, var_162_3)

				local var_162_5 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_5.x, var_162_5.y, var_162_5.z)

				local var_162_6 = var_162_0.localEulerAngles

				var_162_6.z = 0
				var_162_6.x = 0
				var_162_0.localEulerAngles = var_162_6
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(0, 100, 0)

				local var_162_7 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_7.x, var_162_7.y, var_162_7.z)

				local var_162_8 = var_162_0.localEulerAngles

				var_162_8.z = 0
				var_162_8.x = 0
				var_162_0.localEulerAngles = var_162_8
			end

			local var_162_9 = arg_159_1.actors_["1199ui_story"].transform
			local var_162_10 = 0

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 then
				arg_159_1.var_.moveOldPos1199ui_story = var_162_9.localPosition
			end

			local var_162_11 = 0.001

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_11 then
				local var_162_12 = (arg_159_1.time_ - var_162_10) / var_162_11
				local var_162_13 = Vector3.New(0, 100, 0)

				var_162_9.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1199ui_story, var_162_13, var_162_12)

				local var_162_14 = manager.ui.mainCamera.transform.position - var_162_9.position

				var_162_9.forward = Vector3.New(var_162_14.x, var_162_14.y, var_162_14.z)

				local var_162_15 = var_162_9.localEulerAngles

				var_162_15.z = 0
				var_162_15.x = 0
				var_162_9.localEulerAngles = var_162_15
			end

			if arg_159_1.time_ >= var_162_10 + var_162_11 and arg_159_1.time_ < var_162_10 + var_162_11 + arg_162_0 then
				var_162_9.localPosition = Vector3.New(0, 100, 0)

				local var_162_16 = manager.ui.mainCamera.transform.position - var_162_9.position

				var_162_9.forward = Vector3.New(var_162_16.x, var_162_16.y, var_162_16.z)

				local var_162_17 = var_162_9.localEulerAngles

				var_162_17.z = 0
				var_162_17.x = 0
				var_162_9.localEulerAngles = var_162_17
			end

			local var_162_18 = 0
			local var_162_19 = 1.275

			if var_162_18 < arg_159_1.time_ and arg_159_1.time_ <= var_162_18 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_20 = arg_159_1:GetWordFromCfg(119901040)
				local var_162_21 = arg_159_1:FormatText(var_162_20.content)

				arg_159_1.text_.text = var_162_21

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_22 = 51
				local var_162_23 = utf8.len(var_162_21)
				local var_162_24 = var_162_22 <= 0 and var_162_19 or var_162_19 * (var_162_23 / var_162_22)

				if var_162_24 > 0 and var_162_19 < var_162_24 then
					arg_159_1.talkMaxDuration = var_162_24

					if var_162_24 + var_162_18 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_24 + var_162_18
					end
				end

				arg_159_1.text_.text = var_162_21
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_25 = math.max(var_162_19, arg_159_1.talkMaxDuration)

			if var_162_18 <= arg_159_1.time_ and arg_159_1.time_ < var_162_18 + var_162_25 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_18) / var_162_25

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_18 + var_162_25 and arg_159_1.time_ < var_162_18 + var_162_25 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play119901041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 119901041
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play119901042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_2 = arg_163_1:GetWordFromCfg(119901041)
				local var_166_3 = arg_163_1:FormatText(var_166_2.content)

				arg_163_1.text_.text = var_166_3

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_4 = 40
				local var_166_5 = utf8.len(var_166_3)
				local var_166_6 = var_166_4 <= 0 and var_166_1 or var_166_1 * (var_166_5 / var_166_4)

				if var_166_6 > 0 and var_166_1 < var_166_6 then
					arg_163_1.talkMaxDuration = var_166_6

					if var_166_6 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_6 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_3
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_7 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_7 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_7

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_7 and arg_163_1.time_ < var_166_0 + var_166_7 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play119901042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 119901042
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play119901043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.375

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[7].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(119901042)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 15
				local var_170_6 = utf8.len(var_170_4)
				local var_170_7 = var_170_5 <= 0 and var_170_1 or var_170_1 * (var_170_6 / var_170_5)

				if var_170_7 > 0 and var_170_1 < var_170_7 then
					arg_167_1.talkMaxDuration = var_170_7

					if var_170_7 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_7 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_4
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_8 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_8 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_8

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_8 and arg_167_1.time_ < var_170_0 + var_170_8 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play119901043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 119901043
		arg_171_1.duration_ = 12.066

		local var_171_0 = {
			ja = 12.066,
			ko = 11.1,
			zh = 8.1,
			en = 9.6
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
				arg_171_0:Play119901044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1119ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1119ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0, -1.08, -5.9)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1119ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["1119ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect1119ui_story == nil then
				arg_171_1.var_.characterEffect1119ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.2

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect1119ui_story then
					arg_171_1.var_.characterEffect1119ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect1119ui_story then
				arg_171_1.var_.characterEffect1119ui_story.fillFlat = false
			end

			local var_174_13 = 0

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_174_15 = 0
			local var_174_16 = 0.9

			if var_174_15 < arg_171_1.time_ and arg_171_1.time_ <= var_174_15 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_17 = arg_171_1:FormatText(StoryNameCfg[13].name)

				arg_171_1.leftNameTxt_.text = var_174_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_18 = arg_171_1:GetWordFromCfg(119901043)
				local var_174_19 = arg_171_1:FormatText(var_174_18.content)

				arg_171_1.text_.text = var_174_19

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_20 = 36
				local var_174_21 = utf8.len(var_174_19)
				local var_174_22 = var_174_20 <= 0 and var_174_16 or var_174_16 * (var_174_21 / var_174_20)

				if var_174_22 > 0 and var_174_16 < var_174_22 then
					arg_171_1.talkMaxDuration = var_174_22

					if var_174_22 + var_174_15 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_22 + var_174_15
					end
				end

				arg_171_1.text_.text = var_174_19
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901043", "story_v_side_old_119901.awb") ~= 0 then
					local var_174_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901043", "story_v_side_old_119901.awb") / 1000

					if var_174_23 + var_174_15 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_23 + var_174_15
					end

					if var_174_18.prefab_name ~= "" and arg_171_1.actors_[var_174_18.prefab_name] ~= nil then
						local var_174_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_18.prefab_name].transform, "story_v_side_old_119901", "119901043", "story_v_side_old_119901.awb")

						arg_171_1:RecordAudio("119901043", var_174_24)
						arg_171_1:RecordAudio("119901043", var_174_24)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901043", "story_v_side_old_119901.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901043", "story_v_side_old_119901.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_25 = math.max(var_174_16, arg_171_1.talkMaxDuration)

			if var_174_15 <= arg_171_1.time_ and arg_171_1.time_ < var_174_15 + var_174_25 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_15) / var_174_25

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_15 + var_174_25 and arg_171_1.time_ < var_174_15 + var_174_25 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play119901044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 119901044
		arg_175_1.duration_ = 12.233

		local var_175_0 = {
			ja = 12.233,
			ko = 9.766,
			zh = 10.3,
			en = 8.966
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
				arg_175_0:Play119901045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action465")
			end

			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_178_2 = 0
			local var_178_3 = 1.05

			if var_178_2 < arg_175_1.time_ and arg_175_1.time_ <= var_178_2 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_4 = arg_175_1:FormatText(StoryNameCfg[13].name)

				arg_175_1.leftNameTxt_.text = var_178_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_5 = arg_175_1:GetWordFromCfg(119901044)
				local var_178_6 = arg_175_1:FormatText(var_178_5.content)

				arg_175_1.text_.text = var_178_6

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_7 = 42
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

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901044", "story_v_side_old_119901.awb") ~= 0 then
					local var_178_10 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901044", "story_v_side_old_119901.awb") / 1000

					if var_178_10 + var_178_2 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_10 + var_178_2
					end

					if var_178_5.prefab_name ~= "" and arg_175_1.actors_[var_178_5.prefab_name] ~= nil then
						local var_178_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_5.prefab_name].transform, "story_v_side_old_119901", "119901044", "story_v_side_old_119901.awb")

						arg_175_1:RecordAudio("119901044", var_178_11)
						arg_175_1:RecordAudio("119901044", var_178_11)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901044", "story_v_side_old_119901.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901044", "story_v_side_old_119901.awb")
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
	Play119901045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 119901045
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play119901046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1119ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1119ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0, 100, 0)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1119ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, 100, 0)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = 0
			local var_182_10 = 1.675

			if var_182_9 < arg_179_1.time_ and arg_179_1.time_ <= var_182_9 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_11 = arg_179_1:GetWordFromCfg(119901045)
				local var_182_12 = arg_179_1:FormatText(var_182_11.content)

				arg_179_1.text_.text = var_182_12

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_13 = 67
				local var_182_14 = utf8.len(var_182_12)
				local var_182_15 = var_182_13 <= 0 and var_182_10 or var_182_10 * (var_182_14 / var_182_13)

				if var_182_15 > 0 and var_182_10 < var_182_15 then
					arg_179_1.talkMaxDuration = var_182_15

					if var_182_15 + var_182_9 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_15 + var_182_9
					end
				end

				arg_179_1.text_.text = var_182_12
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_16 = math.max(var_182_10, arg_179_1.talkMaxDuration)

			if var_182_9 <= arg_179_1.time_ and arg_179_1.time_ < var_182_9 + var_182_16 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_9) / var_182_16

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_9 + var_182_16 and arg_179_1.time_ < var_182_9 + var_182_16 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play119901046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 119901046
		arg_183_1.duration_ = 1.999999999999

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play119901047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1119ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1119ui_story == nil then
				arg_183_1.var_.characterEffect1119ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.2

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1119ui_story then
					arg_183_1.var_.characterEffect1119ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1119ui_story then
				arg_183_1.var_.characterEffect1119ui_story.fillFlat = false
			end

			local var_186_4 = 0

			if var_186_4 < arg_183_1.time_ and arg_183_1.time_ <= var_186_4 + arg_186_0 then
				arg_183_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_2")
			end

			local var_186_5 = 0

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 then
				arg_183_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_186_6 = arg_183_1.actors_["1119ui_story"].transform
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 then
				arg_183_1.var_.moveOldPos1119ui_story = var_186_6.localPosition
			end

			local var_186_8 = 0.001

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8
				local var_186_10 = Vector3.New(0, -1.08, -5.9)

				var_186_6.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1119ui_story, var_186_10, var_186_9)

				local var_186_11 = manager.ui.mainCamera.transform.position - var_186_6.position

				var_186_6.forward = Vector3.New(var_186_11.x, var_186_11.y, var_186_11.z)

				local var_186_12 = var_186_6.localEulerAngles

				var_186_12.z = 0
				var_186_12.x = 0
				var_186_6.localEulerAngles = var_186_12
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 then
				var_186_6.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_186_13 = manager.ui.mainCamera.transform.position - var_186_6.position

				var_186_6.forward = Vector3.New(var_186_13.x, var_186_13.y, var_186_13.z)

				local var_186_14 = var_186_6.localEulerAngles

				var_186_14.z = 0
				var_186_14.x = 0
				var_186_6.localEulerAngles = var_186_14
			end

			local var_186_15 = 0
			local var_186_16 = 0.075

			if var_186_15 < arg_183_1.time_ and arg_183_1.time_ <= var_186_15 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_17 = arg_183_1:FormatText(StoryNameCfg[13].name)

				arg_183_1.leftNameTxt_.text = var_186_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_18 = arg_183_1:GetWordFromCfg(119901046)
				local var_186_19 = arg_183_1:FormatText(var_186_18.content)

				arg_183_1.text_.text = var_186_19

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_20 = 3
				local var_186_21 = utf8.len(var_186_19)
				local var_186_22 = var_186_20 <= 0 and var_186_16 or var_186_16 * (var_186_21 / var_186_20)

				if var_186_22 > 0 and var_186_16 < var_186_22 then
					arg_183_1.talkMaxDuration = var_186_22

					if var_186_22 + var_186_15 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_22 + var_186_15
					end
				end

				arg_183_1.text_.text = var_186_19
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901046", "story_v_side_old_119901.awb") ~= 0 then
					local var_186_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901046", "story_v_side_old_119901.awb") / 1000

					if var_186_23 + var_186_15 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_23 + var_186_15
					end

					if var_186_18.prefab_name ~= "" and arg_183_1.actors_[var_186_18.prefab_name] ~= nil then
						local var_186_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_18.prefab_name].transform, "story_v_side_old_119901", "119901046", "story_v_side_old_119901.awb")

						arg_183_1:RecordAudio("119901046", var_186_24)
						arg_183_1:RecordAudio("119901046", var_186_24)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901046", "story_v_side_old_119901.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901046", "story_v_side_old_119901.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_25 = math.max(var_186_16, arg_183_1.talkMaxDuration)

			if var_186_15 <= arg_183_1.time_ and arg_183_1.time_ < var_186_15 + var_186_25 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_15) / var_186_25

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_15 + var_186_25 and arg_183_1.time_ < var_186_15 + var_186_25 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play119901047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 119901047
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play119901048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1119ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1119ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(0, 100, 0)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1119ui_story, var_190_4, var_190_3)

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

			local var_190_9 = 0
			local var_190_10 = 1.15

			if var_190_9 < arg_187_1.time_ and arg_187_1.time_ <= var_190_9 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_11 = arg_187_1:GetWordFromCfg(119901047)
				local var_190_12 = arg_187_1:FormatText(var_190_11.content)

				arg_187_1.text_.text = var_190_12

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_13 = 45
				local var_190_14 = utf8.len(var_190_12)
				local var_190_15 = var_190_13 <= 0 and var_190_10 or var_190_10 * (var_190_14 / var_190_13)

				if var_190_15 > 0 and var_190_10 < var_190_15 then
					arg_187_1.talkMaxDuration = var_190_15

					if var_190_15 + var_190_9 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_15 + var_190_9
					end
				end

				arg_187_1.text_.text = var_190_12
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_16 = math.max(var_190_10, arg_187_1.talkMaxDuration)

			if var_190_9 <= arg_187_1.time_ and arg_187_1.time_ < var_190_9 + var_190_16 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_9) / var_190_16

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_9 + var_190_16 and arg_187_1.time_ < var_190_9 + var_190_16 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play119901048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 119901048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play119901049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 1.4

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

				local var_194_2 = arg_191_1:GetWordFromCfg(119901048)
				local var_194_3 = arg_191_1:FormatText(var_194_2.content)

				arg_191_1.text_.text = var_194_3

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_4 = 56
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
	Play119901049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 119901049
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play119901050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.975

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_2 = arg_195_1:GetWordFromCfg(119901049)
				local var_198_3 = arg_195_1:FormatText(var_198_2.content)

				arg_195_1.text_.text = var_198_3

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_4 = 39
				local var_198_5 = utf8.len(var_198_3)
				local var_198_6 = var_198_4 <= 0 and var_198_1 or var_198_1 * (var_198_5 / var_198_4)

				if var_198_6 > 0 and var_198_1 < var_198_6 then
					arg_195_1.talkMaxDuration = var_198_6

					if var_198_6 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_6 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_3
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_7 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_7 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_7

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_7 and arg_195_1.time_ < var_198_0 + var_198_7 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play119901050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 119901050
		arg_199_1.duration_ = 5.7

		local var_199_0 = {
			ja = 2.9,
			ko = 1.999999999999,
			zh = 3.566,
			en = 5.7
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
				arg_199_0:Play119901051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1050ui_story"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1050ui_story = var_202_0.localPosition
			end

			local var_202_2 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2
				local var_202_4 = Vector3.New(0, -1, -6.1)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1050ui_story, var_202_4, var_202_3)

				local var_202_5 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_5.x, var_202_5.y, var_202_5.z)

				local var_202_6 = var_202_0.localEulerAngles

				var_202_6.z = 0
				var_202_6.x = 0
				var_202_0.localEulerAngles = var_202_6
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_202_7 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_7.x, var_202_7.y, var_202_7.z)

				local var_202_8 = var_202_0.localEulerAngles

				var_202_8.z = 0
				var_202_8.x = 0
				var_202_0.localEulerAngles = var_202_8
			end

			local var_202_9 = arg_199_1.actors_["1050ui_story"]
			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 and arg_199_1.var_.characterEffect1050ui_story == nil then
				arg_199_1.var_.characterEffect1050ui_story = var_202_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_11 = 0.2

			if var_202_10 <= arg_199_1.time_ and arg_199_1.time_ < var_202_10 + var_202_11 then
				local var_202_12 = (arg_199_1.time_ - var_202_10) / var_202_11

				if arg_199_1.var_.characterEffect1050ui_story then
					arg_199_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_10 + var_202_11 and arg_199_1.time_ < var_202_10 + var_202_11 + arg_202_0 and arg_199_1.var_.characterEffect1050ui_story then
				arg_199_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_202_13 = 0

			if var_202_13 < arg_199_1.time_ and arg_199_1.time_ <= var_202_13 + arg_202_0 then
				arg_199_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action6_1")
			end

			local var_202_14 = 0

			if var_202_14 < arg_199_1.time_ and arg_199_1.time_ <= var_202_14 + arg_202_0 then
				arg_199_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_202_15 = 0
			local var_202_16 = 0.075

			if var_202_15 < arg_199_1.time_ and arg_199_1.time_ <= var_202_15 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_17 = arg_199_1:FormatText(StoryNameCfg[74].name)

				arg_199_1.leftNameTxt_.text = var_202_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_18 = arg_199_1:GetWordFromCfg(119901050)
				local var_202_19 = arg_199_1:FormatText(var_202_18.content)

				arg_199_1.text_.text = var_202_19

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_20 = 3
				local var_202_21 = utf8.len(var_202_19)
				local var_202_22 = var_202_20 <= 0 and var_202_16 or var_202_16 * (var_202_21 / var_202_20)

				if var_202_22 > 0 and var_202_16 < var_202_22 then
					arg_199_1.talkMaxDuration = var_202_22

					if var_202_22 + var_202_15 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_22 + var_202_15
					end
				end

				arg_199_1.text_.text = var_202_19
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901050", "story_v_side_old_119901.awb") ~= 0 then
					local var_202_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901050", "story_v_side_old_119901.awb") / 1000

					if var_202_23 + var_202_15 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_23 + var_202_15
					end

					if var_202_18.prefab_name ~= "" and arg_199_1.actors_[var_202_18.prefab_name] ~= nil then
						local var_202_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_18.prefab_name].transform, "story_v_side_old_119901", "119901050", "story_v_side_old_119901.awb")

						arg_199_1:RecordAudio("119901050", var_202_24)
						arg_199_1:RecordAudio("119901050", var_202_24)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901050", "story_v_side_old_119901.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901050", "story_v_side_old_119901.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_25 = math.max(var_202_16, arg_199_1.talkMaxDuration)

			if var_202_15 <= arg_199_1.time_ and arg_199_1.time_ < var_202_15 + var_202_25 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_15) / var_202_25

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_15 + var_202_25 and arg_199_1.time_ < var_202_15 + var_202_25 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play119901051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 119901051
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play119901052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1050ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1050ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0, 100, 0)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1050ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, 100, 0)

				local var_206_7 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_7.x, var_206_7.y, var_206_7.z)

				local var_206_8 = var_206_0.localEulerAngles

				var_206_8.z = 0
				var_206_8.x = 0
				var_206_0.localEulerAngles = var_206_8
			end

			local var_206_9 = 0
			local var_206_10 = 1.7

			if var_206_9 < arg_203_1.time_ and arg_203_1.time_ <= var_206_9 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_11 = arg_203_1:GetWordFromCfg(119901051)
				local var_206_12 = arg_203_1:FormatText(var_206_11.content)

				arg_203_1.text_.text = var_206_12

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_13 = 68
				local var_206_14 = utf8.len(var_206_12)
				local var_206_15 = var_206_13 <= 0 and var_206_10 or var_206_10 * (var_206_14 / var_206_13)

				if var_206_15 > 0 and var_206_10 < var_206_15 then
					arg_203_1.talkMaxDuration = var_206_15

					if var_206_15 + var_206_9 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_15 + var_206_9
					end
				end

				arg_203_1.text_.text = var_206_12
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_16 = math.max(var_206_10, arg_203_1.talkMaxDuration)

			if var_206_9 <= arg_203_1.time_ and arg_203_1.time_ < var_206_9 + var_206_16 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_9) / var_206_16

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_9 + var_206_16 and arg_203_1.time_ < var_206_9 + var_206_16 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play119901052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 119901052
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play119901053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 1.025

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

				local var_210_2 = arg_207_1:GetWordFromCfg(119901052)
				local var_210_3 = arg_207_1:FormatText(var_210_2.content)

				arg_207_1.text_.text = var_210_3

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_4 = 41
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
	Play119901053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 119901053
		arg_211_1.duration_ = 1.333

		local var_211_0 = {
			ja = 1.333,
			ko = 1.2,
			zh = 0.999999999999,
			en = 1
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
				arg_211_0:Play119901054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.075

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[84].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, true)
				arg_211_1.iconController_:SetSelectedState("hero")

				arg_211_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1199")

				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(119901053)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901053", "story_v_side_old_119901.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901053", "story_v_side_old_119901.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_side_old_119901", "119901053", "story_v_side_old_119901.awb")

						arg_211_1:RecordAudio("119901053", var_214_9)
						arg_211_1:RecordAudio("119901053", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901053", "story_v_side_old_119901.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901053", "story_v_side_old_119901.awb")
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
	Play119901054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 119901054
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play119901055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.225

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_2 = arg_215_1:GetWordFromCfg(119901054)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 9
				local var_218_5 = utf8.len(var_218_3)
				local var_218_6 = var_218_4 <= 0 and var_218_1 or var_218_1 * (var_218_5 / var_218_4)

				if var_218_6 > 0 and var_218_1 < var_218_6 then
					arg_215_1.talkMaxDuration = var_218_6

					if var_218_6 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_6 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_3
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_7 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_7 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_7

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_7 and arg_215_1.time_ < var_218_0 + var_218_7 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play119901055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 119901055
		arg_219_1.duration_ = 5

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play119901056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 1.45

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, false)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_2 = arg_219_1:GetWordFromCfg(119901055)
				local var_222_3 = arg_219_1:FormatText(var_222_2.content)

				arg_219_1.text_.text = var_222_3

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_4 = 58
				local var_222_5 = utf8.len(var_222_3)
				local var_222_6 = var_222_4 <= 0 and var_222_1 or var_222_1 * (var_222_5 / var_222_4)

				if var_222_6 > 0 and var_222_1 < var_222_6 then
					arg_219_1.talkMaxDuration = var_222_6

					if var_222_6 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_6 + var_222_0
					end
				end

				arg_219_1.text_.text = var_222_3
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)
				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_7 = math.max(var_222_1, arg_219_1.talkMaxDuration)

			if var_222_0 <= arg_219_1.time_ and arg_219_1.time_ < var_222_0 + var_222_7 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_0) / var_222_7

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_0 + var_222_7 and arg_219_1.time_ < var_222_0 + var_222_7 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play119901056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 119901056
		arg_223_1.duration_ = 8.5

		local var_223_0 = {
			ja = 8.5,
			ko = 4.733,
			zh = 5,
			en = 4.266
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
				arg_223_0:Play119901057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1119ui_story"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1119ui_story = var_226_0.localPosition
			end

			local var_226_2 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2
				local var_226_4 = Vector3.New(0, -1.08, -5.9)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1119ui_story, var_226_4, var_226_3)

				local var_226_5 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_5.x, var_226_5.y, var_226_5.z)

				local var_226_6 = var_226_0.localEulerAngles

				var_226_6.z = 0
				var_226_6.x = 0
				var_226_0.localEulerAngles = var_226_6
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_226_7 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_7.x, var_226_7.y, var_226_7.z)

				local var_226_8 = var_226_0.localEulerAngles

				var_226_8.z = 0
				var_226_8.x = 0
				var_226_0.localEulerAngles = var_226_8
			end

			local var_226_9 = arg_223_1.actors_["1119ui_story"]
			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 and arg_223_1.var_.characterEffect1119ui_story == nil then
				arg_223_1.var_.characterEffect1119ui_story = var_226_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_11 = 0.2

			if var_226_10 <= arg_223_1.time_ and arg_223_1.time_ < var_226_10 + var_226_11 then
				local var_226_12 = (arg_223_1.time_ - var_226_10) / var_226_11

				if arg_223_1.var_.characterEffect1119ui_story then
					arg_223_1.var_.characterEffect1119ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_10 + var_226_11 and arg_223_1.time_ < var_226_10 + var_226_11 + arg_226_0 and arg_223_1.var_.characterEffect1119ui_story then
				arg_223_1.var_.characterEffect1119ui_story.fillFlat = false
			end

			local var_226_13 = 0

			if var_226_13 < arg_223_1.time_ and arg_223_1.time_ <= var_226_13 + arg_226_0 then
				arg_223_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_2")
			end

			local var_226_14 = 0

			if var_226_14 < arg_223_1.time_ and arg_223_1.time_ <= var_226_14 + arg_226_0 then
				arg_223_1:PlayTimeline("1119ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_226_15 = 0
			local var_226_16 = 0.6

			if var_226_15 < arg_223_1.time_ and arg_223_1.time_ <= var_226_15 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_17 = arg_223_1:FormatText(StoryNameCfg[13].name)

				arg_223_1.leftNameTxt_.text = var_226_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_18 = arg_223_1:GetWordFromCfg(119901056)
				local var_226_19 = arg_223_1:FormatText(var_226_18.content)

				arg_223_1.text_.text = var_226_19

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_20 = 24
				local var_226_21 = utf8.len(var_226_19)
				local var_226_22 = var_226_20 <= 0 and var_226_16 or var_226_16 * (var_226_21 / var_226_20)

				if var_226_22 > 0 and var_226_16 < var_226_22 then
					arg_223_1.talkMaxDuration = var_226_22

					if var_226_22 + var_226_15 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_22 + var_226_15
					end
				end

				arg_223_1.text_.text = var_226_19
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901056", "story_v_side_old_119901.awb") ~= 0 then
					local var_226_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901056", "story_v_side_old_119901.awb") / 1000

					if var_226_23 + var_226_15 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_23 + var_226_15
					end

					if var_226_18.prefab_name ~= "" and arg_223_1.actors_[var_226_18.prefab_name] ~= nil then
						local var_226_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_18.prefab_name].transform, "story_v_side_old_119901", "119901056", "story_v_side_old_119901.awb")

						arg_223_1:RecordAudio("119901056", var_226_24)
						arg_223_1:RecordAudio("119901056", var_226_24)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901056", "story_v_side_old_119901.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901056", "story_v_side_old_119901.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_25 = math.max(var_226_16, arg_223_1.talkMaxDuration)

			if var_226_15 <= arg_223_1.time_ and arg_223_1.time_ < var_226_15 + var_226_25 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_15) / var_226_25

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_15 + var_226_25 and arg_223_1.time_ < var_226_15 + var_226_25 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play119901057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 119901057
		arg_227_1.duration_ = 6.866

		local var_227_0 = {
			ja = 6.866,
			ko = 3.5,
			zh = 3.633,
			en = 3.533
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
				arg_227_0:Play119901058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1099ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1099ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(0.7, -1.08, -5.9)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1099ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = arg_227_1.actors_["1099ui_story"]
			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 and arg_227_1.var_.characterEffect1099ui_story == nil then
				arg_227_1.var_.characterEffect1099ui_story = var_230_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_11 = 0.2

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_11 then
				local var_230_12 = (arg_227_1.time_ - var_230_10) / var_230_11

				if arg_227_1.var_.characterEffect1099ui_story then
					arg_227_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_10 + var_230_11 and arg_227_1.time_ < var_230_10 + var_230_11 + arg_230_0 and arg_227_1.var_.characterEffect1099ui_story then
				arg_227_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_230_13 = 0

			if var_230_13 < arg_227_1.time_ and arg_227_1.time_ <= var_230_13 + arg_230_0 then
				arg_227_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action5_2")
			end

			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 then
				arg_227_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_230_15 = arg_227_1.actors_["1119ui_story"].transform
			local var_230_16 = 0

			if var_230_16 < arg_227_1.time_ and arg_227_1.time_ <= var_230_16 + arg_230_0 then
				arg_227_1.var_.moveOldPos1119ui_story = var_230_15.localPosition
			end

			local var_230_17 = 0.001

			if var_230_16 <= arg_227_1.time_ and arg_227_1.time_ < var_230_16 + var_230_17 then
				local var_230_18 = (arg_227_1.time_ - var_230_16) / var_230_17
				local var_230_19 = Vector3.New(0, 100, 0)

				var_230_15.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1119ui_story, var_230_19, var_230_18)

				local var_230_20 = manager.ui.mainCamera.transform.position - var_230_15.position

				var_230_15.forward = Vector3.New(var_230_20.x, var_230_20.y, var_230_20.z)

				local var_230_21 = var_230_15.localEulerAngles

				var_230_21.z = 0
				var_230_21.x = 0
				var_230_15.localEulerAngles = var_230_21
			end

			if arg_227_1.time_ >= var_230_16 + var_230_17 and arg_227_1.time_ < var_230_16 + var_230_17 + arg_230_0 then
				var_230_15.localPosition = Vector3.New(0, 100, 0)

				local var_230_22 = manager.ui.mainCamera.transform.position - var_230_15.position

				var_230_15.forward = Vector3.New(var_230_22.x, var_230_22.y, var_230_22.z)

				local var_230_23 = var_230_15.localEulerAngles

				var_230_23.z = 0
				var_230_23.x = 0
				var_230_15.localEulerAngles = var_230_23
			end

			local var_230_24 = 0
			local var_230_25 = 0.275

			if var_230_24 < arg_227_1.time_ and arg_227_1.time_ <= var_230_24 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_26 = arg_227_1:FormatText(StoryNameCfg[84].name)

				arg_227_1.leftNameTxt_.text = var_230_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_27 = arg_227_1:GetWordFromCfg(119901057)
				local var_230_28 = arg_227_1:FormatText(var_230_27.content)

				arg_227_1.text_.text = var_230_28

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_29 = 11
				local var_230_30 = utf8.len(var_230_28)
				local var_230_31 = var_230_29 <= 0 and var_230_25 or var_230_25 * (var_230_30 / var_230_29)

				if var_230_31 > 0 and var_230_25 < var_230_31 then
					arg_227_1.talkMaxDuration = var_230_31

					if var_230_31 + var_230_24 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_31 + var_230_24
					end
				end

				arg_227_1.text_.text = var_230_28
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901057", "story_v_side_old_119901.awb") ~= 0 then
					local var_230_32 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901057", "story_v_side_old_119901.awb") / 1000

					if var_230_32 + var_230_24 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_32 + var_230_24
					end

					if var_230_27.prefab_name ~= "" and arg_227_1.actors_[var_230_27.prefab_name] ~= nil then
						local var_230_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_27.prefab_name].transform, "story_v_side_old_119901", "119901057", "story_v_side_old_119901.awb")

						arg_227_1:RecordAudio("119901057", var_230_33)
						arg_227_1:RecordAudio("119901057", var_230_33)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901057", "story_v_side_old_119901.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901057", "story_v_side_old_119901.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_34 = math.max(var_230_25, arg_227_1.talkMaxDuration)

			if var_230_24 <= arg_227_1.time_ and arg_227_1.time_ < var_230_24 + var_230_34 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_24) / var_230_34

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_24 + var_230_34 and arg_227_1.time_ < var_230_24 + var_230_34 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play119901058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 119901058
		arg_231_1.duration_ = 2.933

		local var_231_0 = {
			ja = 2.933,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_231_0:Play119901059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1050ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1050ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(-0.7, -1, -6.1)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1050ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["1099ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect1099ui_story == nil then
				arg_231_1.var_.characterEffect1099ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.2

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect1099ui_story then
					local var_234_13 = Mathf.Lerp(0, 0.5, var_234_12)

					arg_231_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1099ui_story.fillRatio = var_234_13
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect1099ui_story then
				local var_234_14 = 0.5

				arg_231_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1099ui_story.fillRatio = var_234_14
			end

			local var_234_15 = arg_231_1.actors_["1050ui_story"]
			local var_234_16 = 0

			if var_234_16 < arg_231_1.time_ and arg_231_1.time_ <= var_234_16 + arg_234_0 and arg_231_1.var_.characterEffect1050ui_story == nil then
				arg_231_1.var_.characterEffect1050ui_story = var_234_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_17 = 0.2

			if var_234_16 <= arg_231_1.time_ and arg_231_1.time_ < var_234_16 + var_234_17 then
				local var_234_18 = (arg_231_1.time_ - var_234_16) / var_234_17

				if arg_231_1.var_.characterEffect1050ui_story then
					arg_231_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_16 + var_234_17 and arg_231_1.time_ < var_234_16 + var_234_17 + arg_234_0 and arg_231_1.var_.characterEffect1050ui_story then
				arg_231_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_234_19 = 0

			if var_234_19 < arg_231_1.time_ and arg_231_1.time_ <= var_234_19 + arg_234_0 then
				arg_231_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_234_20 = 0

			if var_234_20 < arg_231_1.time_ and arg_231_1.time_ <= var_234_20 + arg_234_0 then
				arg_231_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_234_21 = 0
			local var_234_22 = 0.075

			if var_234_21 < arg_231_1.time_ and arg_231_1.time_ <= var_234_21 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_23 = arg_231_1:FormatText(StoryNameCfg[74].name)

				arg_231_1.leftNameTxt_.text = var_234_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_24 = arg_231_1:GetWordFromCfg(119901058)
				local var_234_25 = arg_231_1:FormatText(var_234_24.content)

				arg_231_1.text_.text = var_234_25

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_26 = 3
				local var_234_27 = utf8.len(var_234_25)
				local var_234_28 = var_234_26 <= 0 and var_234_22 or var_234_22 * (var_234_27 / var_234_26)

				if var_234_28 > 0 and var_234_22 < var_234_28 then
					arg_231_1.talkMaxDuration = var_234_28

					if var_234_28 + var_234_21 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_28 + var_234_21
					end
				end

				arg_231_1.text_.text = var_234_25
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901058", "story_v_side_old_119901.awb") ~= 0 then
					local var_234_29 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901058", "story_v_side_old_119901.awb") / 1000

					if var_234_29 + var_234_21 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_29 + var_234_21
					end

					if var_234_24.prefab_name ~= "" and arg_231_1.actors_[var_234_24.prefab_name] ~= nil then
						local var_234_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_24.prefab_name].transform, "story_v_side_old_119901", "119901058", "story_v_side_old_119901.awb")

						arg_231_1:RecordAudio("119901058", var_234_30)
						arg_231_1:RecordAudio("119901058", var_234_30)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901058", "story_v_side_old_119901.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901058", "story_v_side_old_119901.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_31 = math.max(var_234_22, arg_231_1.talkMaxDuration)

			if var_234_21 <= arg_231_1.time_ and arg_231_1.time_ < var_234_21 + var_234_31 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_21) / var_234_31

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_21 + var_234_31 and arg_231_1.time_ < var_234_21 + var_234_31 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play119901059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 119901059
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play119901060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1050ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1050ui_story == nil then
				arg_235_1.var_.characterEffect1050ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.2

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1050ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1050ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1050ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1050ui_story.fillRatio = var_238_5
			end

			local var_238_6 = 0
			local var_238_7 = 1.225

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

				local var_238_8 = arg_235_1:GetWordFromCfg(119901059)
				local var_238_9 = arg_235_1:FormatText(var_238_8.content)

				arg_235_1.text_.text = var_238_9

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_10 = 50
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
	Play119901060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 119901060
		arg_239_1.duration_ = 2.766

		local var_239_0 = {
			ja = 2.766,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_239_0:Play119901061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1099ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1099ui_story == nil then
				arg_239_1.var_.characterEffect1099ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.2

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1099ui_story then
					arg_239_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1099ui_story then
				arg_239_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_242_4 = 0

			if var_242_4 < arg_239_1.time_ and arg_239_1.time_ <= var_242_4 + arg_242_0 then
				arg_239_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_1")
			end

			local var_242_5 = 0

			if var_242_5 < arg_239_1.time_ and arg_239_1.time_ <= var_242_5 + arg_242_0 then
				arg_239_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_242_6 = 0
			local var_242_7 = 0.125

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_8 = arg_239_1:FormatText(StoryNameCfg[84].name)

				arg_239_1.leftNameTxt_.text = var_242_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_9 = arg_239_1:GetWordFromCfg(119901060)
				local var_242_10 = arg_239_1:FormatText(var_242_9.content)

				arg_239_1.text_.text = var_242_10

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_11 = 5
				local var_242_12 = utf8.len(var_242_10)
				local var_242_13 = var_242_11 <= 0 and var_242_7 or var_242_7 * (var_242_12 / var_242_11)

				if var_242_13 > 0 and var_242_7 < var_242_13 then
					arg_239_1.talkMaxDuration = var_242_13

					if var_242_13 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_13 + var_242_6
					end
				end

				arg_239_1.text_.text = var_242_10
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901060", "story_v_side_old_119901.awb") ~= 0 then
					local var_242_14 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901060", "story_v_side_old_119901.awb") / 1000

					if var_242_14 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_14 + var_242_6
					end

					if var_242_9.prefab_name ~= "" and arg_239_1.actors_[var_242_9.prefab_name] ~= nil then
						local var_242_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_9.prefab_name].transform, "story_v_side_old_119901", "119901060", "story_v_side_old_119901.awb")

						arg_239_1:RecordAudio("119901060", var_242_15)
						arg_239_1:RecordAudio("119901060", var_242_15)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901060", "story_v_side_old_119901.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901060", "story_v_side_old_119901.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_16 = math.max(var_242_7, arg_239_1.talkMaxDuration)

			if var_242_6 <= arg_239_1.time_ and arg_239_1.time_ < var_242_6 + var_242_16 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_6) / var_242_16

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_6 + var_242_16 and arg_239_1.time_ < var_242_6 + var_242_16 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play119901061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 119901061
		arg_243_1.duration_ = 8.5

		local var_243_0 = {
			ja = 3.766,
			ko = 8.5,
			zh = 7.133,
			en = 8.066
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
				arg_243_0:Play119901062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1099ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect1099ui_story == nil then
				arg_243_1.var_.characterEffect1099ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.2

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect1099ui_story then
					local var_246_4 = Mathf.Lerp(0, 0.5, var_246_3)

					arg_243_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1099ui_story.fillRatio = var_246_4
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect1099ui_story then
				local var_246_5 = 0.5

				arg_243_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1099ui_story.fillRatio = var_246_5
			end

			local var_246_6 = arg_243_1.actors_["1050ui_story"]
			local var_246_7 = 0

			if var_246_7 < arg_243_1.time_ and arg_243_1.time_ <= var_246_7 + arg_246_0 and arg_243_1.var_.characterEffect1050ui_story == nil then
				arg_243_1.var_.characterEffect1050ui_story = var_246_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_8 = 0.2

			if var_246_7 <= arg_243_1.time_ and arg_243_1.time_ < var_246_7 + var_246_8 then
				local var_246_9 = (arg_243_1.time_ - var_246_7) / var_246_8

				if arg_243_1.var_.characterEffect1050ui_story then
					arg_243_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_7 + var_246_8 and arg_243_1.time_ < var_246_7 + var_246_8 + arg_246_0 and arg_243_1.var_.characterEffect1050ui_story then
				arg_243_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_246_10 = 0

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 then
				arg_243_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_246_11 = 0

			if var_246_11 < arg_243_1.time_ and arg_243_1.time_ <= var_246_11 + arg_246_0 then
				arg_243_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_2")
			end

			local var_246_12 = 0
			local var_246_13 = 0.75

			if var_246_12 < arg_243_1.time_ and arg_243_1.time_ <= var_246_12 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_14 = arg_243_1:FormatText(StoryNameCfg[74].name)

				arg_243_1.leftNameTxt_.text = var_246_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_15 = arg_243_1:GetWordFromCfg(119901061)
				local var_246_16 = arg_243_1:FormatText(var_246_15.content)

				arg_243_1.text_.text = var_246_16

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_17 = 29
				local var_246_18 = utf8.len(var_246_16)
				local var_246_19 = var_246_17 <= 0 and var_246_13 or var_246_13 * (var_246_18 / var_246_17)

				if var_246_19 > 0 and var_246_13 < var_246_19 then
					arg_243_1.talkMaxDuration = var_246_19

					if var_246_19 + var_246_12 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_19 + var_246_12
					end
				end

				arg_243_1.text_.text = var_246_16
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901061", "story_v_side_old_119901.awb") ~= 0 then
					local var_246_20 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901061", "story_v_side_old_119901.awb") / 1000

					if var_246_20 + var_246_12 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_20 + var_246_12
					end

					if var_246_15.prefab_name ~= "" and arg_243_1.actors_[var_246_15.prefab_name] ~= nil then
						local var_246_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_15.prefab_name].transform, "story_v_side_old_119901", "119901061", "story_v_side_old_119901.awb")

						arg_243_1:RecordAudio("119901061", var_246_21)
						arg_243_1:RecordAudio("119901061", var_246_21)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901061", "story_v_side_old_119901.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901061", "story_v_side_old_119901.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_22 = math.max(var_246_13, arg_243_1.talkMaxDuration)

			if var_246_12 <= arg_243_1.time_ and arg_243_1.time_ < var_246_12 + var_246_22 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_12) / var_246_22

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_12 + var_246_22 and arg_243_1.time_ < var_246_12 + var_246_22 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play119901062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 119901062
		arg_247_1.duration_ = 8.166

		local var_247_0 = {
			ja = 8.166,
			ko = 4.9,
			zh = 3.566,
			en = 5.2
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
				arg_247_0:Play119901063(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1050ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1050ui_story == nil then
				arg_247_1.var_.characterEffect1050ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1050ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1050ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1050ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1050ui_story.fillRatio = var_250_5
			end

			local var_250_6 = arg_247_1.actors_["1099ui_story"]
			local var_250_7 = 0

			if var_250_7 < arg_247_1.time_ and arg_247_1.time_ <= var_250_7 + arg_250_0 and arg_247_1.var_.characterEffect1099ui_story == nil then
				arg_247_1.var_.characterEffect1099ui_story = var_250_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_8 = 0.2

			if var_250_7 <= arg_247_1.time_ and arg_247_1.time_ < var_250_7 + var_250_8 then
				local var_250_9 = (arg_247_1.time_ - var_250_7) / var_250_8

				if arg_247_1.var_.characterEffect1099ui_story then
					arg_247_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_7 + var_250_8 and arg_247_1.time_ < var_250_7 + var_250_8 + arg_250_0 and arg_247_1.var_.characterEffect1099ui_story then
				arg_247_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 then
				arg_247_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action464")
			end

			local var_250_11 = 0

			if var_250_11 < arg_247_1.time_ and arg_247_1.time_ <= var_250_11 + arg_250_0 then
				arg_247_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_250_12 = 0
			local var_250_13 = 0.45

			if var_250_12 < arg_247_1.time_ and arg_247_1.time_ <= var_250_12 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_14 = arg_247_1:FormatText(StoryNameCfg[84].name)

				arg_247_1.leftNameTxt_.text = var_250_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_15 = arg_247_1:GetWordFromCfg(119901062)
				local var_250_16 = arg_247_1:FormatText(var_250_15.content)

				arg_247_1.text_.text = var_250_16

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_17 = 18
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

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901062", "story_v_side_old_119901.awb") ~= 0 then
					local var_250_20 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901062", "story_v_side_old_119901.awb") / 1000

					if var_250_20 + var_250_12 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_20 + var_250_12
					end

					if var_250_15.prefab_name ~= "" and arg_247_1.actors_[var_250_15.prefab_name] ~= nil then
						local var_250_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_15.prefab_name].transform, "story_v_side_old_119901", "119901062", "story_v_side_old_119901.awb")

						arg_247_1:RecordAudio("119901062", var_250_21)
						arg_247_1:RecordAudio("119901062", var_250_21)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901062", "story_v_side_old_119901.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901062", "story_v_side_old_119901.awb")
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
	Play119901063 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 119901063
		arg_251_1.duration_ = 9.966

		local var_251_0 = {
			ja = 9.966,
			ko = 8.2,
			zh = 7.266,
			en = 8.566
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
				arg_251_0:Play119901064(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action442")
			end

			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_254_2 = 0
			local var_254_3 = 0.8

			if var_254_2 < arg_251_1.time_ and arg_251_1.time_ <= var_254_2 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_4 = arg_251_1:FormatText(StoryNameCfg[84].name)

				arg_251_1.leftNameTxt_.text = var_254_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_5 = arg_251_1:GetWordFromCfg(119901063)
				local var_254_6 = arg_251_1:FormatText(var_254_5.content)

				arg_251_1.text_.text = var_254_6

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_7 = 32
				local var_254_8 = utf8.len(var_254_6)
				local var_254_9 = var_254_7 <= 0 and var_254_3 or var_254_3 * (var_254_8 / var_254_7)

				if var_254_9 > 0 and var_254_3 < var_254_9 then
					arg_251_1.talkMaxDuration = var_254_9

					if var_254_9 + var_254_2 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_9 + var_254_2
					end
				end

				arg_251_1.text_.text = var_254_6
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901063", "story_v_side_old_119901.awb") ~= 0 then
					local var_254_10 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901063", "story_v_side_old_119901.awb") / 1000

					if var_254_10 + var_254_2 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_10 + var_254_2
					end

					if var_254_5.prefab_name ~= "" and arg_251_1.actors_[var_254_5.prefab_name] ~= nil then
						local var_254_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_5.prefab_name].transform, "story_v_side_old_119901", "119901063", "story_v_side_old_119901.awb")

						arg_251_1:RecordAudio("119901063", var_254_11)
						arg_251_1:RecordAudio("119901063", var_254_11)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901063", "story_v_side_old_119901.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901063", "story_v_side_old_119901.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_12 = math.max(var_254_3, arg_251_1.talkMaxDuration)

			if var_254_2 <= arg_251_1.time_ and arg_251_1.time_ < var_254_2 + var_254_12 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_2) / var_254_12

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_2 + var_254_12 and arg_251_1.time_ < var_254_2 + var_254_12 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play119901064 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 119901064
		arg_255_1.duration_ = 9.5

		local var_255_0 = {
			ja = 9.5,
			ko = 7.866,
			zh = 6.633,
			en = 8.633
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
				arg_255_0:Play119901065(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1050ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1050ui_story == nil then
				arg_255_1.var_.characterEffect1050ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.2

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1050ui_story then
					arg_255_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1050ui_story then
				arg_255_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_258_4 = arg_255_1.actors_["1099ui_story"]
			local var_258_5 = 0

			if var_258_5 < arg_255_1.time_ and arg_255_1.time_ <= var_258_5 + arg_258_0 and arg_255_1.var_.characterEffect1099ui_story == nil then
				arg_255_1.var_.characterEffect1099ui_story = var_258_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_6 = 0.2

			if var_258_5 <= arg_255_1.time_ and arg_255_1.time_ < var_258_5 + var_258_6 then
				local var_258_7 = (arg_255_1.time_ - var_258_5) / var_258_6

				if arg_255_1.var_.characterEffect1099ui_story then
					local var_258_8 = Mathf.Lerp(0, 0.5, var_258_7)

					arg_255_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1099ui_story.fillRatio = var_258_8
				end
			end

			if arg_255_1.time_ >= var_258_5 + var_258_6 and arg_255_1.time_ < var_258_5 + var_258_6 + arg_258_0 and arg_255_1.var_.characterEffect1099ui_story then
				local var_258_9 = 0.5

				arg_255_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1099ui_story.fillRatio = var_258_9
			end

			local var_258_10 = 0

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 then
				arg_255_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_258_11 = 0

			if var_258_11 < arg_255_1.time_ and arg_255_1.time_ <= var_258_11 + arg_258_0 then
				arg_255_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_258_12 = 0
			local var_258_13 = 0.8

			if var_258_12 < arg_255_1.time_ and arg_255_1.time_ <= var_258_12 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_14 = arg_255_1:FormatText(StoryNameCfg[74].name)

				arg_255_1.leftNameTxt_.text = var_258_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_15 = arg_255_1:GetWordFromCfg(119901064)
				local var_258_16 = arg_255_1:FormatText(var_258_15.content)

				arg_255_1.text_.text = var_258_16

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_17 = 32
				local var_258_18 = utf8.len(var_258_16)
				local var_258_19 = var_258_17 <= 0 and var_258_13 or var_258_13 * (var_258_18 / var_258_17)

				if var_258_19 > 0 and var_258_13 < var_258_19 then
					arg_255_1.talkMaxDuration = var_258_19

					if var_258_19 + var_258_12 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_19 + var_258_12
					end
				end

				arg_255_1.text_.text = var_258_16
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901064", "story_v_side_old_119901.awb") ~= 0 then
					local var_258_20 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901064", "story_v_side_old_119901.awb") / 1000

					if var_258_20 + var_258_12 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_20 + var_258_12
					end

					if var_258_15.prefab_name ~= "" and arg_255_1.actors_[var_258_15.prefab_name] ~= nil then
						local var_258_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_15.prefab_name].transform, "story_v_side_old_119901", "119901064", "story_v_side_old_119901.awb")

						arg_255_1:RecordAudio("119901064", var_258_21)
						arg_255_1:RecordAudio("119901064", var_258_21)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901064", "story_v_side_old_119901.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901064", "story_v_side_old_119901.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_22 = math.max(var_258_13, arg_255_1.talkMaxDuration)

			if var_258_12 <= arg_255_1.time_ and arg_255_1.time_ < var_258_12 + var_258_22 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_12) / var_258_22

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_12 + var_258_22 and arg_255_1.time_ < var_258_12 + var_258_22 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play119901065 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 119901065
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play119901066(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1050ui_story"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1050ui_story = var_262_0.localPosition
			end

			local var_262_2 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2
				local var_262_4 = Vector3.New(0, 100, 0)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1050ui_story, var_262_4, var_262_3)

				local var_262_5 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_5.x, var_262_5.y, var_262_5.z)

				local var_262_6 = var_262_0.localEulerAngles

				var_262_6.z = 0
				var_262_6.x = 0
				var_262_0.localEulerAngles = var_262_6
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(0, 100, 0)

				local var_262_7 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_7.x, var_262_7.y, var_262_7.z)

				local var_262_8 = var_262_0.localEulerAngles

				var_262_8.z = 0
				var_262_8.x = 0
				var_262_0.localEulerAngles = var_262_8
			end

			local var_262_9 = arg_259_1.actors_["1099ui_story"].transform
			local var_262_10 = 0

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 then
				arg_259_1.var_.moveOldPos1099ui_story = var_262_9.localPosition
			end

			local var_262_11 = 0.001

			if var_262_10 <= arg_259_1.time_ and arg_259_1.time_ < var_262_10 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_10) / var_262_11
				local var_262_13 = Vector3.New(0, 100, 0)

				var_262_9.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1099ui_story, var_262_13, var_262_12)

				local var_262_14 = manager.ui.mainCamera.transform.position - var_262_9.position

				var_262_9.forward = Vector3.New(var_262_14.x, var_262_14.y, var_262_14.z)

				local var_262_15 = var_262_9.localEulerAngles

				var_262_15.z = 0
				var_262_15.x = 0
				var_262_9.localEulerAngles = var_262_15
			end

			if arg_259_1.time_ >= var_262_10 + var_262_11 and arg_259_1.time_ < var_262_10 + var_262_11 + arg_262_0 then
				var_262_9.localPosition = Vector3.New(0, 100, 0)

				local var_262_16 = manager.ui.mainCamera.transform.position - var_262_9.position

				var_262_9.forward = Vector3.New(var_262_16.x, var_262_16.y, var_262_16.z)

				local var_262_17 = var_262_9.localEulerAngles

				var_262_17.z = 0
				var_262_17.x = 0
				var_262_9.localEulerAngles = var_262_17
			end

			local var_262_18 = 0
			local var_262_19 = 0.625

			if var_262_18 < arg_259_1.time_ and arg_259_1.time_ <= var_262_18 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_20 = arg_259_1:GetWordFromCfg(119901065)
				local var_262_21 = arg_259_1:FormatText(var_262_20.content)

				arg_259_1.text_.text = var_262_21

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_22 = 25
				local var_262_23 = utf8.len(var_262_21)
				local var_262_24 = var_262_22 <= 0 and var_262_19 or var_262_19 * (var_262_23 / var_262_22)

				if var_262_24 > 0 and var_262_19 < var_262_24 then
					arg_259_1.talkMaxDuration = var_262_24

					if var_262_24 + var_262_18 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_24 + var_262_18
					end
				end

				arg_259_1.text_.text = var_262_21
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_25 = math.max(var_262_19, arg_259_1.talkMaxDuration)

			if var_262_18 <= arg_259_1.time_ and arg_259_1.time_ < var_262_18 + var_262_25 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_18) / var_262_25

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_18 + var_262_25 and arg_259_1.time_ < var_262_18 + var_262_25 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play119901066 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 119901066
		arg_263_1.duration_ = 9

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play119901067(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				local var_266_1 = manager.ui.mainCamera.transform.localPosition
				local var_266_2 = Vector3.New(0, 0, 10) + Vector3.New(var_266_1.x, var_266_1.y, 0)
				local var_266_3 = arg_263_1.bgs_.D02a

				var_266_3.transform.localPosition = var_266_2
				var_266_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_266_4 = var_266_3:GetComponent("SpriteRenderer")

				if var_266_4 and var_266_4.sprite then
					local var_266_5 = (var_266_3.transform.localPosition - var_266_1).z
					local var_266_6 = manager.ui.mainCameraCom_
					local var_266_7 = 2 * var_266_5 * Mathf.Tan(var_266_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_266_8 = var_266_7 * var_266_6.aspect
					local var_266_9 = var_266_4.sprite.bounds.size.x
					local var_266_10 = var_266_4.sprite.bounds.size.y
					local var_266_11 = var_266_8 / var_266_9
					local var_266_12 = var_266_7 / var_266_10
					local var_266_13 = var_266_12 < var_266_11 and var_266_11 or var_266_12

					var_266_3.transform.localScale = Vector3.New(var_266_13, var_266_13, 0)
				end

				for iter_266_0, iter_266_1 in pairs(arg_263_1.bgs_) do
					if iter_266_0 ~= "D02a" then
						iter_266_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_266_14 = "ST16a"

			if arg_263_1.bgs_[var_266_14] == nil then
				local var_266_15 = Object.Instantiate(arg_263_1.paintGo_)

				var_266_15:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_266_14)
				var_266_15.name = var_266_14
				var_266_15.transform.parent = arg_263_1.stage_.transform
				var_266_15.transform.localPosition = Vector3.New(0, 100, 0)
				arg_263_1.bgs_[var_266_14] = var_266_15
			end

			local var_266_16 = 2

			if var_266_16 < arg_263_1.time_ and arg_263_1.time_ <= var_266_16 + arg_266_0 then
				local var_266_17 = manager.ui.mainCamera.transform.localPosition
				local var_266_18 = Vector3.New(0, 0, 10) + Vector3.New(var_266_17.x, var_266_17.y, 0)
				local var_266_19 = arg_263_1.bgs_.ST16a

				var_266_19.transform.localPosition = var_266_18
				var_266_19.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_266_20 = var_266_19:GetComponent("SpriteRenderer")

				if var_266_20 and var_266_20.sprite then
					local var_266_21 = (var_266_19.transform.localPosition - var_266_17).z
					local var_266_22 = manager.ui.mainCameraCom_
					local var_266_23 = 2 * var_266_21 * Mathf.Tan(var_266_22.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_266_24 = var_266_23 * var_266_22.aspect
					local var_266_25 = var_266_20.sprite.bounds.size.x
					local var_266_26 = var_266_20.sprite.bounds.size.y
					local var_266_27 = var_266_24 / var_266_25
					local var_266_28 = var_266_23 / var_266_26
					local var_266_29 = var_266_28 < var_266_27 and var_266_27 or var_266_28

					var_266_19.transform.localScale = Vector3.New(var_266_29, var_266_29, 0)
				end

				for iter_266_2, iter_266_3 in pairs(arg_263_1.bgs_) do
					if iter_266_2 ~= "ST16a" then
						iter_266_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_266_30 = 0

			if var_266_30 < arg_263_1.time_ and arg_263_1.time_ <= var_266_30 + arg_266_0 then
				arg_263_1.mask_.enabled = true
				arg_263_1.mask_.raycastTarget = false

				arg_263_1:SetGaussion(false)
			end

			local var_266_31 = 2

			if var_266_30 <= arg_263_1.time_ and arg_263_1.time_ < var_266_30 + var_266_31 then
				local var_266_32 = (arg_263_1.time_ - var_266_30) / var_266_31
				local var_266_33 = Color.New(0, 0, 0)

				var_266_33.a = Mathf.Lerp(0, 1, var_266_32)
				arg_263_1.mask_.color = var_266_33
			end

			if arg_263_1.time_ >= var_266_30 + var_266_31 and arg_263_1.time_ < var_266_30 + var_266_31 + arg_266_0 then
				local var_266_34 = Color.New(0, 0, 0)

				var_266_34.a = 1
				arg_263_1.mask_.color = var_266_34
			end

			local var_266_35 = 2

			if var_266_35 < arg_263_1.time_ and arg_263_1.time_ <= var_266_35 + arg_266_0 then
				arg_263_1.mask_.enabled = true
				arg_263_1.mask_.raycastTarget = false

				arg_263_1:SetGaussion(false)
			end

			local var_266_36 = 2

			if var_266_35 <= arg_263_1.time_ and arg_263_1.time_ < var_266_35 + var_266_36 then
				local var_266_37 = (arg_263_1.time_ - var_266_35) / var_266_36
				local var_266_38 = Color.New(0, 0, 0)

				var_266_38.a = Mathf.Lerp(1, 0, var_266_37)
				arg_263_1.mask_.color = var_266_38
			end

			if arg_263_1.time_ >= var_266_35 + var_266_36 and arg_263_1.time_ < var_266_35 + var_266_36 + arg_266_0 then
				local var_266_39 = Color.New(0, 0, 0)
				local var_266_40 = 0

				arg_263_1.mask_.enabled = false
				var_266_39.a = var_266_40
				arg_263_1.mask_.color = var_266_39
			end

			if arg_263_1.frameCnt_ <= 1 then
				arg_263_1.dialog_:SetActive(false)
			end

			local var_266_41 = 4
			local var_266_42 = 0.125

			if var_266_41 < arg_263_1.time_ and arg_263_1.time_ <= var_266_41 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0

				arg_263_1.dialog_:SetActive(true)

				local var_266_43 = LeanTween.value(arg_263_1.dialog_, 0, 1, 0.3)

				var_266_43:setOnUpdate(LuaHelper.FloatAction(function(arg_267_0)
					arg_263_1.dialogCg_.alpha = arg_267_0
				end))
				var_266_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_263_1.dialog_)
					var_266_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_263_1.duration_ = arg_263_1.duration_ + 0.3

				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_44 = arg_263_1:FormatText(StoryNameCfg[7].name)

				arg_263_1.leftNameTxt_.text = var_266_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_45 = arg_263_1:GetWordFromCfg(119901066)
				local var_266_46 = arg_263_1:FormatText(var_266_45.content)

				arg_263_1.text_.text = var_266_46

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_47 = 5
				local var_266_48 = utf8.len(var_266_46)
				local var_266_49 = var_266_47 <= 0 and var_266_42 or var_266_42 * (var_266_48 / var_266_47)

				if var_266_49 > 0 and var_266_42 < var_266_49 then
					arg_263_1.talkMaxDuration = var_266_49
					var_266_41 = var_266_41 + 0.3

					if var_266_49 + var_266_41 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_49 + var_266_41
					end
				end

				arg_263_1.text_.text = var_266_46
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_50 = var_266_41 + 0.3
			local var_266_51 = math.max(var_266_42, arg_263_1.talkMaxDuration)

			if var_266_50 <= arg_263_1.time_ and arg_263_1.time_ < var_266_50 + var_266_51 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_50) / var_266_51

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_50 + var_266_51 and arg_263_1.time_ < var_266_50 + var_266_51 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play119901067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 119901067
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play119901068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 1

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				local var_272_2 = "play"
				local var_272_3 = "effect"

				arg_269_1:AudioAction(var_272_2, var_272_3, "se_story_side_1199", "se_story_1199_door", "")
			end

			local var_272_4 = 0
			local var_272_5 = 1.55

			if var_272_4 < arg_269_1.time_ and arg_269_1.time_ <= var_272_4 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_6 = arg_269_1:GetWordFromCfg(119901067)
				local var_272_7 = arg_269_1:FormatText(var_272_6.content)

				arg_269_1.text_.text = var_272_7

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_8 = 62
				local var_272_9 = utf8.len(var_272_7)
				local var_272_10 = var_272_8 <= 0 and var_272_5 or var_272_5 * (var_272_9 / var_272_8)

				if var_272_10 > 0 and var_272_5 < var_272_10 then
					arg_269_1.talkMaxDuration = var_272_10

					if var_272_10 + var_272_4 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_10 + var_272_4
					end
				end

				arg_269_1.text_.text = var_272_7
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_11 = math.max(var_272_5, arg_269_1.talkMaxDuration)

			if var_272_4 <= arg_269_1.time_ and arg_269_1.time_ < var_272_4 + var_272_11 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_4) / var_272_11

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_4 + var_272_11 and arg_269_1.time_ < var_272_4 + var_272_11 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play119901068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 119901068
		arg_273_1.duration_ = 4.233

		local var_273_0 = {
			ja = 3.433,
			ko = 1.999999999999,
			zh = 3.4,
			en = 4.233
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
				arg_273_0:Play119901069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1099ui_story"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos1099ui_story = var_276_0.localPosition
			end

			local var_276_2 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2
				local var_276_4 = Vector3.New(0, -1.08, -5.9)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1099ui_story, var_276_4, var_276_3)

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

			local var_276_9 = arg_273_1.actors_["1099ui_story"]
			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 and arg_273_1.var_.characterEffect1099ui_story == nil then
				arg_273_1.var_.characterEffect1099ui_story = var_276_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_11 = 0.2

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_11 then
				local var_276_12 = (arg_273_1.time_ - var_276_10) / var_276_11

				if arg_273_1.var_.characterEffect1099ui_story then
					arg_273_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_10 + var_276_11 and arg_273_1.time_ < var_276_10 + var_276_11 + arg_276_0 and arg_273_1.var_.characterEffect1099ui_story then
				arg_273_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_276_13 = 0

			if var_276_13 < arg_273_1.time_ and arg_273_1.time_ <= var_276_13 + arg_276_0 then
				arg_273_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action4_1")
			end

			local var_276_14 = 0

			if var_276_14 < arg_273_1.time_ and arg_273_1.time_ <= var_276_14 + arg_276_0 then
				arg_273_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_276_15 = 0
			local var_276_16 = 0.175

			if var_276_15 < arg_273_1.time_ and arg_273_1.time_ <= var_276_15 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_17 = arg_273_1:FormatText(StoryNameCfg[84].name)

				arg_273_1.leftNameTxt_.text = var_276_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_18 = arg_273_1:GetWordFromCfg(119901068)
				local var_276_19 = arg_273_1:FormatText(var_276_18.content)

				arg_273_1.text_.text = var_276_19

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_20 = 7
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

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901068", "story_v_side_old_119901.awb") ~= 0 then
					local var_276_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901068", "story_v_side_old_119901.awb") / 1000

					if var_276_23 + var_276_15 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_23 + var_276_15
					end

					if var_276_18.prefab_name ~= "" and arg_273_1.actors_[var_276_18.prefab_name] ~= nil then
						local var_276_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_18.prefab_name].transform, "story_v_side_old_119901", "119901068", "story_v_side_old_119901.awb")

						arg_273_1:RecordAudio("119901068", var_276_24)
						arg_273_1:RecordAudio("119901068", var_276_24)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901068", "story_v_side_old_119901.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901068", "story_v_side_old_119901.awb")
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
	Play119901069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 119901069
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play119901070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1099ui_story"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos1099ui_story = var_280_0.localPosition
			end

			local var_280_2 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2
				local var_280_4 = Vector3.New(0, 100, 0)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1099ui_story, var_280_4, var_280_3)

				local var_280_5 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_5.x, var_280_5.y, var_280_5.z)

				local var_280_6 = var_280_0.localEulerAngles

				var_280_6.z = 0
				var_280_6.x = 0
				var_280_0.localEulerAngles = var_280_6
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 then
				var_280_0.localPosition = Vector3.New(0, 100, 0)

				local var_280_7 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_7.x, var_280_7.y, var_280_7.z)

				local var_280_8 = var_280_0.localEulerAngles

				var_280_8.z = 0
				var_280_8.x = 0
				var_280_0.localEulerAngles = var_280_8
			end

			local var_280_9 = 0
			local var_280_10 = 1.1

			if var_280_9 < arg_277_1.time_ and arg_277_1.time_ <= var_280_9 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, false)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_11 = arg_277_1:GetWordFromCfg(119901069)
				local var_280_12 = arg_277_1:FormatText(var_280_11.content)

				arg_277_1.text_.text = var_280_12

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_13 = 44
				local var_280_14 = utf8.len(var_280_12)
				local var_280_15 = var_280_13 <= 0 and var_280_10 or var_280_10 * (var_280_14 / var_280_13)

				if var_280_15 > 0 and var_280_10 < var_280_15 then
					arg_277_1.talkMaxDuration = var_280_15

					if var_280_15 + var_280_9 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_15 + var_280_9
					end
				end

				arg_277_1.text_.text = var_280_12
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_16 = math.max(var_280_10, arg_277_1.talkMaxDuration)

			if var_280_9 <= arg_277_1.time_ and arg_277_1.time_ < var_280_9 + var_280_16 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_9) / var_280_16

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_9 + var_280_16 and arg_277_1.time_ < var_280_9 + var_280_16 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play119901070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 119901070
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play119901071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.25

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[7].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(119901070)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 10
				local var_284_6 = utf8.len(var_284_4)
				local var_284_7 = var_284_5 <= 0 and var_284_1 or var_284_1 * (var_284_6 / var_284_5)

				if var_284_7 > 0 and var_284_1 < var_284_7 then
					arg_281_1.talkMaxDuration = var_284_7

					if var_284_7 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_7 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_4
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_8 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_8 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_8

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_8 and arg_281_1.time_ < var_284_0 + var_284_8 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play119901071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 119901071
		arg_285_1.duration_ = 2.466

		local var_285_0 = {
			ja = 2.466,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_285_0:Play119901072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1099ui_story"].transform
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.var_.moveOldPos1099ui_story = var_288_0.localPosition
			end

			local var_288_2 = 0.001

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2
				local var_288_4 = Vector3.New(0, -1.08, -5.9)

				var_288_0.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1099ui_story, var_288_4, var_288_3)

				local var_288_5 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_5.x, var_288_5.y, var_288_5.z)

				local var_288_6 = var_288_0.localEulerAngles

				var_288_6.z = 0
				var_288_6.x = 0
				var_288_0.localEulerAngles = var_288_6
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 then
				var_288_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_288_7 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_7.x, var_288_7.y, var_288_7.z)

				local var_288_8 = var_288_0.localEulerAngles

				var_288_8.z = 0
				var_288_8.x = 0
				var_288_0.localEulerAngles = var_288_8
			end

			local var_288_9 = arg_285_1.actors_["1099ui_story"]
			local var_288_10 = 0

			if var_288_10 < arg_285_1.time_ and arg_285_1.time_ <= var_288_10 + arg_288_0 and arg_285_1.var_.characterEffect1099ui_story == nil then
				arg_285_1.var_.characterEffect1099ui_story = var_288_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_11 = 0.2

			if var_288_10 <= arg_285_1.time_ and arg_285_1.time_ < var_288_10 + var_288_11 then
				local var_288_12 = (arg_285_1.time_ - var_288_10) / var_288_11

				if arg_285_1.var_.characterEffect1099ui_story then
					arg_285_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_285_1.time_ >= var_288_10 + var_288_11 and arg_285_1.time_ < var_288_10 + var_288_11 + arg_288_0 and arg_285_1.var_.characterEffect1099ui_story then
				arg_285_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_288_13 = 0

			if var_288_13 < arg_285_1.time_ and arg_285_1.time_ <= var_288_13 + arg_288_0 then
				arg_285_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action443")
			end

			local var_288_14 = 0

			if var_288_14 < arg_285_1.time_ and arg_285_1.time_ <= var_288_14 + arg_288_0 then
				arg_285_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_288_15 = 0
			local var_288_16 = 0.1

			if var_288_15 < arg_285_1.time_ and arg_285_1.time_ <= var_288_15 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_17 = arg_285_1:FormatText(StoryNameCfg[84].name)

				arg_285_1.leftNameTxt_.text = var_288_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_18 = arg_285_1:GetWordFromCfg(119901071)
				local var_288_19 = arg_285_1:FormatText(var_288_18.content)

				arg_285_1.text_.text = var_288_19

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_20 = 4
				local var_288_21 = utf8.len(var_288_19)
				local var_288_22 = var_288_20 <= 0 and var_288_16 or var_288_16 * (var_288_21 / var_288_20)

				if var_288_22 > 0 and var_288_16 < var_288_22 then
					arg_285_1.talkMaxDuration = var_288_22

					if var_288_22 + var_288_15 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_22 + var_288_15
					end
				end

				arg_285_1.text_.text = var_288_19
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901071", "story_v_side_old_119901.awb") ~= 0 then
					local var_288_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901071", "story_v_side_old_119901.awb") / 1000

					if var_288_23 + var_288_15 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_23 + var_288_15
					end

					if var_288_18.prefab_name ~= "" and arg_285_1.actors_[var_288_18.prefab_name] ~= nil then
						local var_288_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_18.prefab_name].transform, "story_v_side_old_119901", "119901071", "story_v_side_old_119901.awb")

						arg_285_1:RecordAudio("119901071", var_288_24)
						arg_285_1:RecordAudio("119901071", var_288_24)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901071", "story_v_side_old_119901.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901071", "story_v_side_old_119901.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_25 = math.max(var_288_16, arg_285_1.talkMaxDuration)

			if var_288_15 <= arg_285_1.time_ and arg_285_1.time_ < var_288_15 + var_288_25 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_15) / var_288_25

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_15 + var_288_25 and arg_285_1.time_ < var_288_15 + var_288_25 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play119901072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 119901072
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play119901073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["1099ui_story"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos1099ui_story = var_292_0.localPosition
			end

			local var_292_2 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2
				local var_292_4 = Vector3.New(0, 100, 0)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1099ui_story, var_292_4, var_292_3)

				local var_292_5 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_5.x, var_292_5.y, var_292_5.z)

				local var_292_6 = var_292_0.localEulerAngles

				var_292_6.z = 0
				var_292_6.x = 0
				var_292_0.localEulerAngles = var_292_6
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(0, 100, 0)

				local var_292_7 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_7.x, var_292_7.y, var_292_7.z)

				local var_292_8 = var_292_0.localEulerAngles

				var_292_8.z = 0
				var_292_8.x = 0
				var_292_0.localEulerAngles = var_292_8
			end

			local var_292_9 = 0
			local var_292_10 = 1.35

			if var_292_9 < arg_289_1.time_ and arg_289_1.time_ <= var_292_9 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_11 = arg_289_1:GetWordFromCfg(119901072)
				local var_292_12 = arg_289_1:FormatText(var_292_11.content)

				arg_289_1.text_.text = var_292_12

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_13 = 54
				local var_292_14 = utf8.len(var_292_12)
				local var_292_15 = var_292_13 <= 0 and var_292_10 or var_292_10 * (var_292_14 / var_292_13)

				if var_292_15 > 0 and var_292_10 < var_292_15 then
					arg_289_1.talkMaxDuration = var_292_15

					if var_292_15 + var_292_9 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_15 + var_292_9
					end
				end

				arg_289_1.text_.text = var_292_12
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_16 = math.max(var_292_10, arg_289_1.talkMaxDuration)

			if var_292_9 <= arg_289_1.time_ and arg_289_1.time_ < var_292_9 + var_292_16 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_9) / var_292_16

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_9 + var_292_16 and arg_289_1.time_ < var_292_9 + var_292_16 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play119901073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 119901073
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play119901074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 0.65

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_2 = arg_293_1:GetWordFromCfg(119901073)
				local var_296_3 = arg_293_1:FormatText(var_296_2.content)

				arg_293_1.text_.text = var_296_3

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_4 = 26
				local var_296_5 = utf8.len(var_296_3)
				local var_296_6 = var_296_4 <= 0 and var_296_1 or var_296_1 * (var_296_5 / var_296_4)

				if var_296_6 > 0 and var_296_1 < var_296_6 then
					arg_293_1.talkMaxDuration = var_296_6

					if var_296_6 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_6 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_3
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_7 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_7 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_7

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_7 and arg_293_1.time_ < var_296_0 + var_296_7 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play119901074 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 119901074
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play119901075(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 1.625

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, false)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_2 = arg_297_1:GetWordFromCfg(119901074)
				local var_300_3 = arg_297_1:FormatText(var_300_2.content)

				arg_297_1.text_.text = var_300_3

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_4 = 65
				local var_300_5 = utf8.len(var_300_3)
				local var_300_6 = var_300_4 <= 0 and var_300_1 or var_300_1 * (var_300_5 / var_300_4)

				if var_300_6 > 0 and var_300_1 < var_300_6 then
					arg_297_1.talkMaxDuration = var_300_6

					if var_300_6 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_6 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_3
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_7 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_7 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_7

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_7 and arg_297_1.time_ < var_300_0 + var_300_7 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play119901075 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 119901075
		arg_301_1.duration_ = 4.433

		local var_301_0 = {
			ja = 4.433,
			ko = 2.7,
			zh = 3.433,
			en = 2.2
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
				arg_301_0:Play119901076(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1099ui_story"].transform
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1.var_.moveOldPos1099ui_story = var_304_0.localPosition
			end

			local var_304_2 = 0.001

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2
				local var_304_4 = Vector3.New(0, -1.08, -5.9)

				var_304_0.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1099ui_story, var_304_4, var_304_3)

				local var_304_5 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_5.x, var_304_5.y, var_304_5.z)

				local var_304_6 = var_304_0.localEulerAngles

				var_304_6.z = 0
				var_304_6.x = 0
				var_304_0.localEulerAngles = var_304_6
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 then
				var_304_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_304_7 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_7.x, var_304_7.y, var_304_7.z)

				local var_304_8 = var_304_0.localEulerAngles

				var_304_8.z = 0
				var_304_8.x = 0
				var_304_0.localEulerAngles = var_304_8
			end

			local var_304_9 = arg_301_1.actors_["1099ui_story"]
			local var_304_10 = 0

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 and arg_301_1.var_.characterEffect1099ui_story == nil then
				arg_301_1.var_.characterEffect1099ui_story = var_304_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_11 = 0.2

			if var_304_10 <= arg_301_1.time_ and arg_301_1.time_ < var_304_10 + var_304_11 then
				local var_304_12 = (arg_301_1.time_ - var_304_10) / var_304_11

				if arg_301_1.var_.characterEffect1099ui_story then
					arg_301_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_10 + var_304_11 and arg_301_1.time_ < var_304_10 + var_304_11 + arg_304_0 and arg_301_1.var_.characterEffect1099ui_story then
				arg_301_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_304_13 = 0

			if var_304_13 < arg_301_1.time_ and arg_301_1.time_ <= var_304_13 + arg_304_0 then
				arg_301_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_304_14 = 0
			local var_304_15 = 0.4

			if var_304_14 < arg_301_1.time_ and arg_301_1.time_ <= var_304_14 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_16 = arg_301_1:FormatText(StoryNameCfg[84].name)

				arg_301_1.leftNameTxt_.text = var_304_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_17 = arg_301_1:GetWordFromCfg(119901075)
				local var_304_18 = arg_301_1:FormatText(var_304_17.content)

				arg_301_1.text_.text = var_304_18

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_19 = 16
				local var_304_20 = utf8.len(var_304_18)
				local var_304_21 = var_304_19 <= 0 and var_304_15 or var_304_15 * (var_304_20 / var_304_19)

				if var_304_21 > 0 and var_304_15 < var_304_21 then
					arg_301_1.talkMaxDuration = var_304_21

					if var_304_21 + var_304_14 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_21 + var_304_14
					end
				end

				arg_301_1.text_.text = var_304_18
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901075", "story_v_side_old_119901.awb") ~= 0 then
					local var_304_22 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901075", "story_v_side_old_119901.awb") / 1000

					if var_304_22 + var_304_14 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_22 + var_304_14
					end

					if var_304_17.prefab_name ~= "" and arg_301_1.actors_[var_304_17.prefab_name] ~= nil then
						local var_304_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_17.prefab_name].transform, "story_v_side_old_119901", "119901075", "story_v_side_old_119901.awb")

						arg_301_1:RecordAudio("119901075", var_304_23)
						arg_301_1:RecordAudio("119901075", var_304_23)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901075", "story_v_side_old_119901.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901075", "story_v_side_old_119901.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_24 = math.max(var_304_15, arg_301_1.talkMaxDuration)

			if var_304_14 <= arg_301_1.time_ and arg_301_1.time_ < var_304_14 + var_304_24 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_14) / var_304_24

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_14 + var_304_24 and arg_301_1.time_ < var_304_14 + var_304_24 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play119901076 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 119901076
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play119901077(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1099ui_story"]
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 and arg_305_1.var_.characterEffect1099ui_story == nil then
				arg_305_1.var_.characterEffect1099ui_story = var_308_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_2 = 0.2

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2

				if arg_305_1.var_.characterEffect1099ui_story then
					local var_308_4 = Mathf.Lerp(0, 0.5, var_308_3)

					arg_305_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_305_1.var_.characterEffect1099ui_story.fillRatio = var_308_4
				end
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 and arg_305_1.var_.characterEffect1099ui_story then
				local var_308_5 = 0.5

				arg_305_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_305_1.var_.characterEffect1099ui_story.fillRatio = var_308_5
			end

			local var_308_6 = 0
			local var_308_7 = 0.25

			if var_308_6 < arg_305_1.time_ and arg_305_1.time_ <= var_308_6 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_8 = arg_305_1:FormatText(StoryNameCfg[7].name)

				arg_305_1.leftNameTxt_.text = var_308_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_9 = arg_305_1:GetWordFromCfg(119901076)
				local var_308_10 = arg_305_1:FormatText(var_308_9.content)

				arg_305_1.text_.text = var_308_10

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_11 = 10
				local var_308_12 = utf8.len(var_308_10)
				local var_308_13 = var_308_11 <= 0 and var_308_7 or var_308_7 * (var_308_12 / var_308_11)

				if var_308_13 > 0 and var_308_7 < var_308_13 then
					arg_305_1.talkMaxDuration = var_308_13

					if var_308_13 + var_308_6 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_13 + var_308_6
					end
				end

				arg_305_1.text_.text = var_308_10
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_14 = math.max(var_308_7, arg_305_1.talkMaxDuration)

			if var_308_6 <= arg_305_1.time_ and arg_305_1.time_ < var_308_6 + var_308_14 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_6) / var_308_14

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_6 + var_308_14 and arg_305_1.time_ < var_308_6 + var_308_14 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play119901077 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 119901077
		arg_309_1.duration_ = 3.2

		local var_309_0 = {
			ja = 3.2,
			ko = 2.233,
			zh = 3.1,
			en = 2.066
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
				arg_309_0:Play119901078(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1099ui_story"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.characterEffect1099ui_story == nil then
				arg_309_1.var_.characterEffect1099ui_story = var_312_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_2 = 0.2

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.characterEffect1099ui_story then
					arg_309_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.characterEffect1099ui_story then
				arg_309_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_312_4 = 0

			if var_312_4 < arg_309_1.time_ and arg_309_1.time_ <= var_312_4 + arg_312_0 then
				arg_309_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action435")
			end

			local var_312_5 = 0

			if var_312_5 < arg_309_1.time_ and arg_309_1.time_ <= var_312_5 + arg_312_0 then
				arg_309_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_312_6 = 0
			local var_312_7 = 0.25

			if var_312_6 < arg_309_1.time_ and arg_309_1.time_ <= var_312_6 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_8 = arg_309_1:FormatText(StoryNameCfg[84].name)

				arg_309_1.leftNameTxt_.text = var_312_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_9 = arg_309_1:GetWordFromCfg(119901077)
				local var_312_10 = arg_309_1:FormatText(var_312_9.content)

				arg_309_1.text_.text = var_312_10

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_11 = 10
				local var_312_12 = utf8.len(var_312_10)
				local var_312_13 = var_312_11 <= 0 and var_312_7 or var_312_7 * (var_312_12 / var_312_11)

				if var_312_13 > 0 and var_312_7 < var_312_13 then
					arg_309_1.talkMaxDuration = var_312_13

					if var_312_13 + var_312_6 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_13 + var_312_6
					end
				end

				arg_309_1.text_.text = var_312_10
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901077", "story_v_side_old_119901.awb") ~= 0 then
					local var_312_14 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901077", "story_v_side_old_119901.awb") / 1000

					if var_312_14 + var_312_6 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_14 + var_312_6
					end

					if var_312_9.prefab_name ~= "" and arg_309_1.actors_[var_312_9.prefab_name] ~= nil then
						local var_312_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_9.prefab_name].transform, "story_v_side_old_119901", "119901077", "story_v_side_old_119901.awb")

						arg_309_1:RecordAudio("119901077", var_312_15)
						arg_309_1:RecordAudio("119901077", var_312_15)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901077", "story_v_side_old_119901.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901077", "story_v_side_old_119901.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_16 = math.max(var_312_7, arg_309_1.talkMaxDuration)

			if var_312_6 <= arg_309_1.time_ and arg_309_1.time_ < var_312_6 + var_312_16 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_6) / var_312_16

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_6 + var_312_16 and arg_309_1.time_ < var_312_6 + var_312_16 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play119901078 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 119901078
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play119901079(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1099ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect1099ui_story == nil then
				arg_313_1.var_.characterEffect1099ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.2

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect1099ui_story then
					local var_316_4 = Mathf.Lerp(0, 0.5, var_316_3)

					arg_313_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1099ui_story.fillRatio = var_316_4
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect1099ui_story then
				local var_316_5 = 0.5

				arg_313_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1099ui_story.fillRatio = var_316_5
			end

			local var_316_6 = 0
			local var_316_7 = 0.275

			if var_316_6 < arg_313_1.time_ and arg_313_1.time_ <= var_316_6 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_8 = arg_313_1:FormatText(StoryNameCfg[7].name)

				arg_313_1.leftNameTxt_.text = var_316_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_9 = arg_313_1:GetWordFromCfg(119901078)
				local var_316_10 = arg_313_1:FormatText(var_316_9.content)

				arg_313_1.text_.text = var_316_10

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_11 = 11
				local var_316_12 = utf8.len(var_316_10)
				local var_316_13 = var_316_11 <= 0 and var_316_7 or var_316_7 * (var_316_12 / var_316_11)

				if var_316_13 > 0 and var_316_7 < var_316_13 then
					arg_313_1.talkMaxDuration = var_316_13

					if var_316_13 + var_316_6 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_13 + var_316_6
					end
				end

				arg_313_1.text_.text = var_316_10
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_14 = math.max(var_316_7, arg_313_1.talkMaxDuration)

			if var_316_6 <= arg_313_1.time_ and arg_313_1.time_ < var_316_6 + var_316_14 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_6) / var_316_14

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_6 + var_316_14 and arg_313_1.time_ < var_316_6 + var_316_14 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play119901079 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 119901079
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play119901080(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1099ui_story"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos1099ui_story = var_320_0.localPosition
			end

			local var_320_2 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2
				local var_320_4 = Vector3.New(0, 100, 0)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1099ui_story, var_320_4, var_320_3)

				local var_320_5 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_5.x, var_320_5.y, var_320_5.z)

				local var_320_6 = var_320_0.localEulerAngles

				var_320_6.z = 0
				var_320_6.x = 0
				var_320_0.localEulerAngles = var_320_6
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(0, 100, 0)

				local var_320_7 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_7.x, var_320_7.y, var_320_7.z)

				local var_320_8 = var_320_0.localEulerAngles

				var_320_8.z = 0
				var_320_8.x = 0
				var_320_0.localEulerAngles = var_320_8
			end

			local var_320_9 = 0
			local var_320_10 = 1.2

			if var_320_9 < arg_317_1.time_ and arg_317_1.time_ <= var_320_9 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, false)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_11 = arg_317_1:GetWordFromCfg(119901079)
				local var_320_12 = arg_317_1:FormatText(var_320_11.content)

				arg_317_1.text_.text = var_320_12

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_13 = 48
				local var_320_14 = utf8.len(var_320_12)
				local var_320_15 = var_320_13 <= 0 and var_320_10 or var_320_10 * (var_320_14 / var_320_13)

				if var_320_15 > 0 and var_320_10 < var_320_15 then
					arg_317_1.talkMaxDuration = var_320_15

					if var_320_15 + var_320_9 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_15 + var_320_9
					end
				end

				arg_317_1.text_.text = var_320_12
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_16 = math.max(var_320_10, arg_317_1.talkMaxDuration)

			if var_320_9 <= arg_317_1.time_ and arg_317_1.time_ < var_320_9 + var_320_16 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_9) / var_320_16

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_9 + var_320_16 and arg_317_1.time_ < var_320_9 + var_320_16 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play119901080 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 119901080
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play119901081(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 0.85

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_2 = arg_321_1:FormatText(StoryNameCfg[7].name)

				arg_321_1.leftNameTxt_.text = var_324_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_3 = arg_321_1:GetWordFromCfg(119901080)
				local var_324_4 = arg_321_1:FormatText(var_324_3.content)

				arg_321_1.text_.text = var_324_4

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_5 = 34
				local var_324_6 = utf8.len(var_324_4)
				local var_324_7 = var_324_5 <= 0 and var_324_1 or var_324_1 * (var_324_6 / var_324_5)

				if var_324_7 > 0 and var_324_1 < var_324_7 then
					arg_321_1.talkMaxDuration = var_324_7

					if var_324_7 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_7 + var_324_0
					end
				end

				arg_321_1.text_.text = var_324_4
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_8 = math.max(var_324_1, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_8 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_0) / var_324_8

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_8 and arg_321_1.time_ < var_324_0 + var_324_8 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play119901081 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 119901081
		arg_325_1.duration_ = 10.433

		local var_325_0 = {
			ja = 10.433,
			ko = 7.866,
			zh = 8.3,
			en = 8.6
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
				arg_325_0:Play119901082(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1099ui_story"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos1099ui_story = var_328_0.localPosition
			end

			local var_328_2 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2
				local var_328_4 = Vector3.New(0, -1.08, -5.9)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos1099ui_story, var_328_4, var_328_3)

				local var_328_5 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_5.x, var_328_5.y, var_328_5.z)

				local var_328_6 = var_328_0.localEulerAngles

				var_328_6.z = 0
				var_328_6.x = 0
				var_328_0.localEulerAngles = var_328_6
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_328_7 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_7.x, var_328_7.y, var_328_7.z)

				local var_328_8 = var_328_0.localEulerAngles

				var_328_8.z = 0
				var_328_8.x = 0
				var_328_0.localEulerAngles = var_328_8
			end

			local var_328_9 = arg_325_1.actors_["1099ui_story"]
			local var_328_10 = 0

			if var_328_10 < arg_325_1.time_ and arg_325_1.time_ <= var_328_10 + arg_328_0 and arg_325_1.var_.characterEffect1099ui_story == nil then
				arg_325_1.var_.characterEffect1099ui_story = var_328_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_11 = 0.2

			if var_328_10 <= arg_325_1.time_ and arg_325_1.time_ < var_328_10 + var_328_11 then
				local var_328_12 = (arg_325_1.time_ - var_328_10) / var_328_11

				if arg_325_1.var_.characterEffect1099ui_story then
					arg_325_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_10 + var_328_11 and arg_325_1.time_ < var_328_10 + var_328_11 + arg_328_0 and arg_325_1.var_.characterEffect1099ui_story then
				arg_325_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_328_13 = 0

			if var_328_13 < arg_325_1.time_ and arg_325_1.time_ <= var_328_13 + arg_328_0 then
				arg_325_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action454")
			end

			local var_328_14 = 0

			if var_328_14 < arg_325_1.time_ and arg_325_1.time_ <= var_328_14 + arg_328_0 then
				arg_325_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_328_15 = 0
			local var_328_16 = 0.85

			if var_328_15 < arg_325_1.time_ and arg_325_1.time_ <= var_328_15 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_17 = arg_325_1:FormatText(StoryNameCfg[84].name)

				arg_325_1.leftNameTxt_.text = var_328_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_18 = arg_325_1:GetWordFromCfg(119901081)
				local var_328_19 = arg_325_1:FormatText(var_328_18.content)

				arg_325_1.text_.text = var_328_19

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_20 = 33
				local var_328_21 = utf8.len(var_328_19)
				local var_328_22 = var_328_20 <= 0 and var_328_16 or var_328_16 * (var_328_21 / var_328_20)

				if var_328_22 > 0 and var_328_16 < var_328_22 then
					arg_325_1.talkMaxDuration = var_328_22

					if var_328_22 + var_328_15 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_22 + var_328_15
					end
				end

				arg_325_1.text_.text = var_328_19
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901081", "story_v_side_old_119901.awb") ~= 0 then
					local var_328_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901081", "story_v_side_old_119901.awb") / 1000

					if var_328_23 + var_328_15 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_23 + var_328_15
					end

					if var_328_18.prefab_name ~= "" and arg_325_1.actors_[var_328_18.prefab_name] ~= nil then
						local var_328_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_18.prefab_name].transform, "story_v_side_old_119901", "119901081", "story_v_side_old_119901.awb")

						arg_325_1:RecordAudio("119901081", var_328_24)
						arg_325_1:RecordAudio("119901081", var_328_24)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901081", "story_v_side_old_119901.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901081", "story_v_side_old_119901.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_25 = math.max(var_328_16, arg_325_1.talkMaxDuration)

			if var_328_15 <= arg_325_1.time_ and arg_325_1.time_ < var_328_15 + var_328_25 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_15) / var_328_25

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_15 + var_328_25 and arg_325_1.time_ < var_328_15 + var_328_25 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play119901082 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 119901082
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play119901083(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1099ui_story"]
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 and arg_329_1.var_.characterEffect1099ui_story == nil then
				arg_329_1.var_.characterEffect1099ui_story = var_332_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_2 = 0.2

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2

				if arg_329_1.var_.characterEffect1099ui_story then
					local var_332_4 = Mathf.Lerp(0, 0.5, var_332_3)

					arg_329_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_329_1.var_.characterEffect1099ui_story.fillRatio = var_332_4
				end
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 and arg_329_1.var_.characterEffect1099ui_story then
				local var_332_5 = 0.5

				arg_329_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_329_1.var_.characterEffect1099ui_story.fillRatio = var_332_5
			end

			local var_332_6 = 0
			local var_332_7 = 0.75

			if var_332_6 < arg_329_1.time_ and arg_329_1.time_ <= var_332_6 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_8 = arg_329_1:FormatText(StoryNameCfg[7].name)

				arg_329_1.leftNameTxt_.text = var_332_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_9 = arg_329_1:GetWordFromCfg(119901082)
				local var_332_10 = arg_329_1:FormatText(var_332_9.content)

				arg_329_1.text_.text = var_332_10

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_11 = 30
				local var_332_12 = utf8.len(var_332_10)
				local var_332_13 = var_332_11 <= 0 and var_332_7 or var_332_7 * (var_332_12 / var_332_11)

				if var_332_13 > 0 and var_332_7 < var_332_13 then
					arg_329_1.talkMaxDuration = var_332_13

					if var_332_13 + var_332_6 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_13 + var_332_6
					end
				end

				arg_329_1.text_.text = var_332_10
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_14 = math.max(var_332_7, arg_329_1.talkMaxDuration)

			if var_332_6 <= arg_329_1.time_ and arg_329_1.time_ < var_332_6 + var_332_14 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_6) / var_332_14

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_6 + var_332_14 and arg_329_1.time_ < var_332_6 + var_332_14 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play119901083 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 119901083
		arg_333_1.duration_ = 12.433

		local var_333_0 = {
			ja = 12.433,
			ko = 7.3,
			zh = 6.833,
			en = 5.7
		}
		local var_333_1 = manager.audio:GetLocalizationFlag()

		if var_333_0[var_333_1] ~= nil then
			arg_333_1.duration_ = var_333_0[var_333_1]
		end

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play119901084(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1099ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.characterEffect1099ui_story == nil then
				arg_333_1.var_.characterEffect1099ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.2

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect1099ui_story then
					arg_333_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.characterEffect1099ui_story then
				arg_333_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_336_4 = 0

			if var_336_4 < arg_333_1.time_ and arg_333_1.time_ <= var_336_4 + arg_336_0 then
				arg_333_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action443")
			end

			local var_336_5 = 0

			if var_336_5 < arg_333_1.time_ and arg_333_1.time_ <= var_336_5 + arg_336_0 then
				arg_333_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_336_6 = 0
			local var_336_7 = 0.725

			if var_336_6 < arg_333_1.time_ and arg_333_1.time_ <= var_336_6 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_8 = arg_333_1:FormatText(StoryNameCfg[84].name)

				arg_333_1.leftNameTxt_.text = var_336_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_9 = arg_333_1:GetWordFromCfg(119901083)
				local var_336_10 = arg_333_1:FormatText(var_336_9.content)

				arg_333_1.text_.text = var_336_10

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_11 = 29
				local var_336_12 = utf8.len(var_336_10)
				local var_336_13 = var_336_11 <= 0 and var_336_7 or var_336_7 * (var_336_12 / var_336_11)

				if var_336_13 > 0 and var_336_7 < var_336_13 then
					arg_333_1.talkMaxDuration = var_336_13

					if var_336_13 + var_336_6 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_13 + var_336_6
					end
				end

				arg_333_1.text_.text = var_336_10
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901083", "story_v_side_old_119901.awb") ~= 0 then
					local var_336_14 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901083", "story_v_side_old_119901.awb") / 1000

					if var_336_14 + var_336_6 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_14 + var_336_6
					end

					if var_336_9.prefab_name ~= "" and arg_333_1.actors_[var_336_9.prefab_name] ~= nil then
						local var_336_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_9.prefab_name].transform, "story_v_side_old_119901", "119901083", "story_v_side_old_119901.awb")

						arg_333_1:RecordAudio("119901083", var_336_15)
						arg_333_1:RecordAudio("119901083", var_336_15)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901083", "story_v_side_old_119901.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901083", "story_v_side_old_119901.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_16 = math.max(var_336_7, arg_333_1.talkMaxDuration)

			if var_336_6 <= arg_333_1.time_ and arg_333_1.time_ < var_336_6 + var_336_16 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_6) / var_336_16

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_6 + var_336_16 and arg_333_1.time_ < var_336_6 + var_336_16 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play119901084 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 119901084
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play119901085(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1099ui_story"]
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 and arg_337_1.var_.characterEffect1099ui_story == nil then
				arg_337_1.var_.characterEffect1099ui_story = var_340_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_2 = 0.2

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2

				if arg_337_1.var_.characterEffect1099ui_story then
					local var_340_4 = Mathf.Lerp(0, 0.5, var_340_3)

					arg_337_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_337_1.var_.characterEffect1099ui_story.fillRatio = var_340_4
				end
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 and arg_337_1.var_.characterEffect1099ui_story then
				local var_340_5 = 0.5

				arg_337_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_337_1.var_.characterEffect1099ui_story.fillRatio = var_340_5
			end

			local var_340_6 = 0
			local var_340_7 = 0.65

			if var_340_6 < arg_337_1.time_ and arg_337_1.time_ <= var_340_6 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_8 = arg_337_1:GetWordFromCfg(119901084)
				local var_340_9 = arg_337_1:FormatText(var_340_8.content)

				arg_337_1.text_.text = var_340_9

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_10 = 26
				local var_340_11 = utf8.len(var_340_9)
				local var_340_12 = var_340_10 <= 0 and var_340_7 or var_340_7 * (var_340_11 / var_340_10)

				if var_340_12 > 0 and var_340_7 < var_340_12 then
					arg_337_1.talkMaxDuration = var_340_12

					if var_340_12 + var_340_6 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_12 + var_340_6
					end
				end

				arg_337_1.text_.text = var_340_9
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_13 = math.max(var_340_7, arg_337_1.talkMaxDuration)

			if var_340_6 <= arg_337_1.time_ and arg_337_1.time_ < var_340_6 + var_340_13 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_6) / var_340_13

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_6 + var_340_13 and arg_337_1.time_ < var_340_6 + var_340_13 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play119901085 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 119901085
		arg_341_1.duration_ = 13.8

		local var_341_0 = {
			ja = 13.8,
			ko = 13,
			zh = 13.733,
			en = 11
		}
		local var_341_1 = manager.audio:GetLocalizationFlag()

		if var_341_0[var_341_1] ~= nil then
			arg_341_1.duration_ = var_341_0[var_341_1]
		end

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play119901086(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1099ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1099ui_story == nil then
				arg_341_1.var_.characterEffect1099ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.2

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1099ui_story then
					arg_341_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1099ui_story then
				arg_341_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_344_4 = 0

			if var_344_4 < arg_341_1.time_ and arg_341_1.time_ <= var_344_4 + arg_344_0 then
				arg_341_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_344_5 = 0
			local var_344_6 = 1.425

			if var_344_5 < arg_341_1.time_ and arg_341_1.time_ <= var_344_5 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_7 = arg_341_1:FormatText(StoryNameCfg[84].name)

				arg_341_1.leftNameTxt_.text = var_344_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_8 = arg_341_1:GetWordFromCfg(119901085)
				local var_344_9 = arg_341_1:FormatText(var_344_8.content)

				arg_341_1.text_.text = var_344_9

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_10 = 56
				local var_344_11 = utf8.len(var_344_9)
				local var_344_12 = var_344_10 <= 0 and var_344_6 or var_344_6 * (var_344_11 / var_344_10)

				if var_344_12 > 0 and var_344_6 < var_344_12 then
					arg_341_1.talkMaxDuration = var_344_12

					if var_344_12 + var_344_5 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_12 + var_344_5
					end
				end

				arg_341_1.text_.text = var_344_9
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901085", "story_v_side_old_119901.awb") ~= 0 then
					local var_344_13 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901085", "story_v_side_old_119901.awb") / 1000

					if var_344_13 + var_344_5 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_13 + var_344_5
					end

					if var_344_8.prefab_name ~= "" and arg_341_1.actors_[var_344_8.prefab_name] ~= nil then
						local var_344_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_8.prefab_name].transform, "story_v_side_old_119901", "119901085", "story_v_side_old_119901.awb")

						arg_341_1:RecordAudio("119901085", var_344_14)
						arg_341_1:RecordAudio("119901085", var_344_14)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901085", "story_v_side_old_119901.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901085", "story_v_side_old_119901.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_15 = math.max(var_344_6, arg_341_1.talkMaxDuration)

			if var_344_5 <= arg_341_1.time_ and arg_341_1.time_ < var_344_5 + var_344_15 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_5) / var_344_15

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_5 + var_344_15 and arg_341_1.time_ < var_344_5 + var_344_15 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play119901086 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 119901086
		arg_345_1.duration_ = 12.266

		local var_345_0 = {
			ja = 12.266,
			ko = 8.2,
			zh = 9.033,
			en = 9.3
		}
		local var_345_1 = manager.audio:GetLocalizationFlag()

		if var_345_0[var_345_1] ~= nil then
			arg_345_1.duration_ = var_345_0[var_345_1]
		end

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play119901087(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_348_1 = 0
			local var_348_2 = 1.05

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_3 = arg_345_1:FormatText(StoryNameCfg[84].name)

				arg_345_1.leftNameTxt_.text = var_348_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_4 = arg_345_1:GetWordFromCfg(119901086)
				local var_348_5 = arg_345_1:FormatText(var_348_4.content)

				arg_345_1.text_.text = var_348_5

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_6 = 42
				local var_348_7 = utf8.len(var_348_5)
				local var_348_8 = var_348_6 <= 0 and var_348_2 or var_348_2 * (var_348_7 / var_348_6)

				if var_348_8 > 0 and var_348_2 < var_348_8 then
					arg_345_1.talkMaxDuration = var_348_8

					if var_348_8 + var_348_1 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_8 + var_348_1
					end
				end

				arg_345_1.text_.text = var_348_5
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901086", "story_v_side_old_119901.awb") ~= 0 then
					local var_348_9 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901086", "story_v_side_old_119901.awb") / 1000

					if var_348_9 + var_348_1 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_9 + var_348_1
					end

					if var_348_4.prefab_name ~= "" and arg_345_1.actors_[var_348_4.prefab_name] ~= nil then
						local var_348_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_4.prefab_name].transform, "story_v_side_old_119901", "119901086", "story_v_side_old_119901.awb")

						arg_345_1:RecordAudio("119901086", var_348_10)
						arg_345_1:RecordAudio("119901086", var_348_10)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901086", "story_v_side_old_119901.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901086", "story_v_side_old_119901.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_11 = math.max(var_348_2, arg_345_1.talkMaxDuration)

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_11 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_1) / var_348_11

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_1 + var_348_11 and arg_345_1.time_ < var_348_1 + var_348_11 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play119901087 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 119901087
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play119901088(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1099ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect1099ui_story == nil then
				arg_349_1.var_.characterEffect1099ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.2

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1099ui_story then
					local var_352_4 = Mathf.Lerp(0, 0.5, var_352_3)

					arg_349_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_349_1.var_.characterEffect1099ui_story.fillRatio = var_352_4
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1099ui_story then
				local var_352_5 = 0.5

				arg_349_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_349_1.var_.characterEffect1099ui_story.fillRatio = var_352_5
			end

			local var_352_6 = 0
			local var_352_7 = 0.525

			if var_352_6 < arg_349_1.time_ and arg_349_1.time_ <= var_352_6 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_8 = arg_349_1:FormatText(StoryNameCfg[7].name)

				arg_349_1.leftNameTxt_.text = var_352_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_9 = arg_349_1:GetWordFromCfg(119901087)
				local var_352_10 = arg_349_1:FormatText(var_352_9.content)

				arg_349_1.text_.text = var_352_10

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_11 = 21
				local var_352_12 = utf8.len(var_352_10)
				local var_352_13 = var_352_11 <= 0 and var_352_7 or var_352_7 * (var_352_12 / var_352_11)

				if var_352_13 > 0 and var_352_7 < var_352_13 then
					arg_349_1.talkMaxDuration = var_352_13

					if var_352_13 + var_352_6 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_13 + var_352_6
					end
				end

				arg_349_1.text_.text = var_352_10
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_14 = math.max(var_352_7, arg_349_1.talkMaxDuration)

			if var_352_6 <= arg_349_1.time_ and arg_349_1.time_ < var_352_6 + var_352_14 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_6) / var_352_14

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_6 + var_352_14 and arg_349_1.time_ < var_352_6 + var_352_14 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play119901088 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 119901088
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play119901089(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 0.725

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[7].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(119901088)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 29
				local var_356_6 = utf8.len(var_356_4)
				local var_356_7 = var_356_5 <= 0 and var_356_1 or var_356_1 * (var_356_6 / var_356_5)

				if var_356_7 > 0 and var_356_1 < var_356_7 then
					arg_353_1.talkMaxDuration = var_356_7

					if var_356_7 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_7 + var_356_0
					end
				end

				arg_353_1.text_.text = var_356_4
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_8 = math.max(var_356_1, arg_353_1.talkMaxDuration)

			if var_356_0 <= arg_353_1.time_ and arg_353_1.time_ < var_356_0 + var_356_8 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_0) / var_356_8

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_0 + var_356_8 and arg_353_1.time_ < var_356_0 + var_356_8 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play119901089 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 119901089
		arg_357_1.duration_ = 2.7

		local var_357_0 = {
			ja = 2.7,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_357_1 = manager.audio:GetLocalizationFlag()

		if var_357_0[var_357_1] ~= nil then
			arg_357_1.duration_ = var_357_0[var_357_1]
		end

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play119901090(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["1099ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect1099ui_story == nil then
				arg_357_1.var_.characterEffect1099ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.2

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect1099ui_story then
					arg_357_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect1099ui_story then
				arg_357_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_360_4 = 0

			if var_360_4 < arg_357_1.time_ and arg_357_1.time_ <= var_360_4 + arg_360_0 then
				arg_357_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_360_5 = 0
			local var_360_6 = 0.175

			if var_360_5 < arg_357_1.time_ and arg_357_1.time_ <= var_360_5 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_7 = arg_357_1:FormatText(StoryNameCfg[84].name)

				arg_357_1.leftNameTxt_.text = var_360_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_8 = arg_357_1:GetWordFromCfg(119901089)
				local var_360_9 = arg_357_1:FormatText(var_360_8.content)

				arg_357_1.text_.text = var_360_9

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_10 = 7
				local var_360_11 = utf8.len(var_360_9)
				local var_360_12 = var_360_10 <= 0 and var_360_6 or var_360_6 * (var_360_11 / var_360_10)

				if var_360_12 > 0 and var_360_6 < var_360_12 then
					arg_357_1.talkMaxDuration = var_360_12

					if var_360_12 + var_360_5 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_12 + var_360_5
					end
				end

				arg_357_1.text_.text = var_360_9
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901089", "story_v_side_old_119901.awb") ~= 0 then
					local var_360_13 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901089", "story_v_side_old_119901.awb") / 1000

					if var_360_13 + var_360_5 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_13 + var_360_5
					end

					if var_360_8.prefab_name ~= "" and arg_357_1.actors_[var_360_8.prefab_name] ~= nil then
						local var_360_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_8.prefab_name].transform, "story_v_side_old_119901", "119901089", "story_v_side_old_119901.awb")

						arg_357_1:RecordAudio("119901089", var_360_14)
						arg_357_1:RecordAudio("119901089", var_360_14)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901089", "story_v_side_old_119901.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901089", "story_v_side_old_119901.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_15 = math.max(var_360_6, arg_357_1.talkMaxDuration)

			if var_360_5 <= arg_357_1.time_ and arg_357_1.time_ < var_360_5 + var_360_15 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_5) / var_360_15

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_5 + var_360_15 and arg_357_1.time_ < var_360_5 + var_360_15 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play119901090 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 119901090
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play119901091(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1099ui_story"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.characterEffect1099ui_story == nil then
				arg_361_1.var_.characterEffect1099ui_story = var_364_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_2 = 0.2

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.characterEffect1099ui_story then
					local var_364_4 = Mathf.Lerp(0, 0.5, var_364_3)

					arg_361_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_361_1.var_.characterEffect1099ui_story.fillRatio = var_364_4
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect1099ui_story then
				local var_364_5 = 0.5

				arg_361_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_361_1.var_.characterEffect1099ui_story.fillRatio = var_364_5
			end

			local var_364_6 = 0
			local var_364_7 = 0.75

			if var_364_6 < arg_361_1.time_ and arg_361_1.time_ <= var_364_6 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, false)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_8 = arg_361_1:GetWordFromCfg(119901090)
				local var_364_9 = arg_361_1:FormatText(var_364_8.content)

				arg_361_1.text_.text = var_364_9

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_10 = 30
				local var_364_11 = utf8.len(var_364_9)
				local var_364_12 = var_364_10 <= 0 and var_364_7 or var_364_7 * (var_364_11 / var_364_10)

				if var_364_12 > 0 and var_364_7 < var_364_12 then
					arg_361_1.talkMaxDuration = var_364_12

					if var_364_12 + var_364_6 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_12 + var_364_6
					end
				end

				arg_361_1.text_.text = var_364_9
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_13 = math.max(var_364_7, arg_361_1.talkMaxDuration)

			if var_364_6 <= arg_361_1.time_ and arg_361_1.time_ < var_364_6 + var_364_13 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_6) / var_364_13

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_6 + var_364_13 and arg_361_1.time_ < var_364_6 + var_364_13 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play119901091 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 119901091
		arg_365_1.duration_ = 10.366

		local var_365_0 = {
			ja = 9.166,
			ko = 8.733,
			zh = 10.366,
			en = 9.933
		}
		local var_365_1 = manager.audio:GetLocalizationFlag()

		if var_365_0[var_365_1] ~= nil then
			arg_365_1.duration_ = var_365_0[var_365_1]
		end

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play119901092(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1099ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect1099ui_story == nil then
				arg_365_1.var_.characterEffect1099ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.2

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect1099ui_story then
					arg_365_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect1099ui_story then
				arg_365_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_368_4 = 0

			if var_368_4 < arg_365_1.time_ and arg_365_1.time_ <= var_368_4 + arg_368_0 then
				arg_365_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_368_5 = 0
			local var_368_6 = 0.95

			if var_368_5 < arg_365_1.time_ and arg_365_1.time_ <= var_368_5 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_7 = arg_365_1:FormatText(StoryNameCfg[84].name)

				arg_365_1.leftNameTxt_.text = var_368_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_8 = arg_365_1:GetWordFromCfg(119901091)
				local var_368_9 = arg_365_1:FormatText(var_368_8.content)

				arg_365_1.text_.text = var_368_9

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_10 = 38
				local var_368_11 = utf8.len(var_368_9)
				local var_368_12 = var_368_10 <= 0 and var_368_6 or var_368_6 * (var_368_11 / var_368_10)

				if var_368_12 > 0 and var_368_6 < var_368_12 then
					arg_365_1.talkMaxDuration = var_368_12

					if var_368_12 + var_368_5 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_12 + var_368_5
					end
				end

				arg_365_1.text_.text = var_368_9
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901091", "story_v_side_old_119901.awb") ~= 0 then
					local var_368_13 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901091", "story_v_side_old_119901.awb") / 1000

					if var_368_13 + var_368_5 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_13 + var_368_5
					end

					if var_368_8.prefab_name ~= "" and arg_365_1.actors_[var_368_8.prefab_name] ~= nil then
						local var_368_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_8.prefab_name].transform, "story_v_side_old_119901", "119901091", "story_v_side_old_119901.awb")

						arg_365_1:RecordAudio("119901091", var_368_14)
						arg_365_1:RecordAudio("119901091", var_368_14)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901091", "story_v_side_old_119901.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901091", "story_v_side_old_119901.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_15 = math.max(var_368_6, arg_365_1.talkMaxDuration)

			if var_368_5 <= arg_365_1.time_ and arg_365_1.time_ < var_368_5 + var_368_15 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_5) / var_368_15

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_5 + var_368_15 and arg_365_1.time_ < var_368_5 + var_368_15 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play119901092 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 119901092
		arg_369_1.duration_ = 15.8

		local var_369_0 = {
			ja = 10.033,
			ko = 15.8,
			zh = 11.433,
			en = 6.966
		}
		local var_369_1 = manager.audio:GetLocalizationFlag()

		if var_369_0[var_369_1] ~= nil then
			arg_369_1.duration_ = var_369_0[var_369_1]
		end

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play119901093(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_372_1 = 0
			local var_372_2 = 1.1

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_3 = arg_369_1:FormatText(StoryNameCfg[84].name)

				arg_369_1.leftNameTxt_.text = var_372_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_4 = arg_369_1:GetWordFromCfg(119901092)
				local var_372_5 = arg_369_1:FormatText(var_372_4.content)

				arg_369_1.text_.text = var_372_5

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_6 = 44
				local var_372_7 = utf8.len(var_372_5)
				local var_372_8 = var_372_6 <= 0 and var_372_2 or var_372_2 * (var_372_7 / var_372_6)

				if var_372_8 > 0 and var_372_2 < var_372_8 then
					arg_369_1.talkMaxDuration = var_372_8

					if var_372_8 + var_372_1 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_1
					end
				end

				arg_369_1.text_.text = var_372_5
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901092", "story_v_side_old_119901.awb") ~= 0 then
					local var_372_9 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901092", "story_v_side_old_119901.awb") / 1000

					if var_372_9 + var_372_1 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_9 + var_372_1
					end

					if var_372_4.prefab_name ~= "" and arg_369_1.actors_[var_372_4.prefab_name] ~= nil then
						local var_372_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_4.prefab_name].transform, "story_v_side_old_119901", "119901092", "story_v_side_old_119901.awb")

						arg_369_1:RecordAudio("119901092", var_372_10)
						arg_369_1:RecordAudio("119901092", var_372_10)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901092", "story_v_side_old_119901.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901092", "story_v_side_old_119901.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_11 = math.max(var_372_2, arg_369_1.talkMaxDuration)

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_11 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_1) / var_372_11

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_1 + var_372_11 and arg_369_1.time_ < var_372_1 + var_372_11 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play119901093 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 119901093
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play119901094(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1099ui_story"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.characterEffect1099ui_story == nil then
				arg_373_1.var_.characterEffect1099ui_story = var_376_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_2 = 0.2

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.characterEffect1099ui_story then
					local var_376_4 = Mathf.Lerp(0, 0.5, var_376_3)

					arg_373_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_373_1.var_.characterEffect1099ui_story.fillRatio = var_376_4
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.characterEffect1099ui_story then
				local var_376_5 = 0.5

				arg_373_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_373_1.var_.characterEffect1099ui_story.fillRatio = var_376_5
			end

			local var_376_6 = 0
			local var_376_7 = 0.325

			if var_376_6 < arg_373_1.time_ and arg_373_1.time_ <= var_376_6 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_8 = arg_373_1:FormatText(StoryNameCfg[7].name)

				arg_373_1.leftNameTxt_.text = var_376_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_9 = arg_373_1:GetWordFromCfg(119901093)
				local var_376_10 = arg_373_1:FormatText(var_376_9.content)

				arg_373_1.text_.text = var_376_10

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_11 = 13
				local var_376_12 = utf8.len(var_376_10)
				local var_376_13 = var_376_11 <= 0 and var_376_7 or var_376_7 * (var_376_12 / var_376_11)

				if var_376_13 > 0 and var_376_7 < var_376_13 then
					arg_373_1.talkMaxDuration = var_376_13

					if var_376_13 + var_376_6 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_13 + var_376_6
					end
				end

				arg_373_1.text_.text = var_376_10
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_14 = math.max(var_376_7, arg_373_1.talkMaxDuration)

			if var_376_6 <= arg_373_1.time_ and arg_373_1.time_ < var_376_6 + var_376_14 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_6) / var_376_14

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_6 + var_376_14 and arg_373_1.time_ < var_376_6 + var_376_14 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play119901094 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 119901094
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play119901095(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1099ui_story"].transform
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1.var_.moveOldPos1099ui_story = var_380_0.localPosition
			end

			local var_380_2 = 0.001

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2
				local var_380_4 = Vector3.New(0, 100, 0)

				var_380_0.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1099ui_story, var_380_4, var_380_3)

				local var_380_5 = manager.ui.mainCamera.transform.position - var_380_0.position

				var_380_0.forward = Vector3.New(var_380_5.x, var_380_5.y, var_380_5.z)

				local var_380_6 = var_380_0.localEulerAngles

				var_380_6.z = 0
				var_380_6.x = 0
				var_380_0.localEulerAngles = var_380_6
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 then
				var_380_0.localPosition = Vector3.New(0, 100, 0)

				local var_380_7 = manager.ui.mainCamera.transform.position - var_380_0.position

				var_380_0.forward = Vector3.New(var_380_7.x, var_380_7.y, var_380_7.z)

				local var_380_8 = var_380_0.localEulerAngles

				var_380_8.z = 0
				var_380_8.x = 0
				var_380_0.localEulerAngles = var_380_8
			end

			local var_380_9 = 0
			local var_380_10 = 1.025

			if var_380_9 < arg_377_1.time_ and arg_377_1.time_ <= var_380_9 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_11 = arg_377_1:GetWordFromCfg(119901094)
				local var_380_12 = arg_377_1:FormatText(var_380_11.content)

				arg_377_1.text_.text = var_380_12

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_13 = 41
				local var_380_14 = utf8.len(var_380_12)
				local var_380_15 = var_380_13 <= 0 and var_380_10 or var_380_10 * (var_380_14 / var_380_13)

				if var_380_15 > 0 and var_380_10 < var_380_15 then
					arg_377_1.talkMaxDuration = var_380_15

					if var_380_15 + var_380_9 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_15 + var_380_9
					end
				end

				arg_377_1.text_.text = var_380_12
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_16 = math.max(var_380_10, arg_377_1.talkMaxDuration)

			if var_380_9 <= arg_377_1.time_ and arg_377_1.time_ < var_380_9 + var_380_16 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_9) / var_380_16

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_9 + var_380_16 and arg_377_1.time_ < var_380_9 + var_380_16 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play119901095 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 119901095
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play119901096(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 1.225

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, false)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_2 = arg_381_1:GetWordFromCfg(119901095)
				local var_384_3 = arg_381_1:FormatText(var_384_2.content)

				arg_381_1.text_.text = var_384_3

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_4 = 49
				local var_384_5 = utf8.len(var_384_3)
				local var_384_6 = var_384_4 <= 0 and var_384_1 or var_384_1 * (var_384_5 / var_384_4)

				if var_384_6 > 0 and var_384_1 < var_384_6 then
					arg_381_1.talkMaxDuration = var_384_6

					if var_384_6 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_6 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_3
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_7 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_7 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_7

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_7 and arg_381_1.time_ < var_384_0 + var_384_7 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play119901096 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 119901096
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play119901097(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 0.6

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_2 = arg_385_1:FormatText(StoryNameCfg[7].name)

				arg_385_1.leftNameTxt_.text = var_388_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_3 = arg_385_1:GetWordFromCfg(119901096)
				local var_388_4 = arg_385_1:FormatText(var_388_3.content)

				arg_385_1.text_.text = var_388_4

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_5 = 24
				local var_388_6 = utf8.len(var_388_4)
				local var_388_7 = var_388_5 <= 0 and var_388_1 or var_388_1 * (var_388_6 / var_388_5)

				if var_388_7 > 0 and var_388_1 < var_388_7 then
					arg_385_1.talkMaxDuration = var_388_7

					if var_388_7 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_7 + var_388_0
					end
				end

				arg_385_1.text_.text = var_388_4
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_8 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_8 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_8

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_8 and arg_385_1.time_ < var_388_0 + var_388_8 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play119901097 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 119901097
		arg_389_1.duration_ = 2.633

		local var_389_0 = {
			ja = 2.633,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_389_1 = manager.audio:GetLocalizationFlag()

		if var_389_0[var_389_1] ~= nil then
			arg_389_1.duration_ = var_389_0[var_389_1]
		end

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play119901098(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1099ui_story"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos1099ui_story = var_392_0.localPosition
			end

			local var_392_2 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2
				local var_392_4 = Vector3.New(0, -1.08, -5.9)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1099ui_story, var_392_4, var_392_3)

				local var_392_5 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_5.x, var_392_5.y, var_392_5.z)

				local var_392_6 = var_392_0.localEulerAngles

				var_392_6.z = 0
				var_392_6.x = 0
				var_392_0.localEulerAngles = var_392_6
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_392_7 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_7.x, var_392_7.y, var_392_7.z)

				local var_392_8 = var_392_0.localEulerAngles

				var_392_8.z = 0
				var_392_8.x = 0
				var_392_0.localEulerAngles = var_392_8
			end

			local var_392_9 = arg_389_1.actors_["1099ui_story"]
			local var_392_10 = 0

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 and arg_389_1.var_.characterEffect1099ui_story == nil then
				arg_389_1.var_.characterEffect1099ui_story = var_392_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_11 = 0.2

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_11 then
				local var_392_12 = (arg_389_1.time_ - var_392_10) / var_392_11

				if arg_389_1.var_.characterEffect1099ui_story then
					arg_389_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_10 + var_392_11 and arg_389_1.time_ < var_392_10 + var_392_11 + arg_392_0 and arg_389_1.var_.characterEffect1099ui_story then
				arg_389_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_392_13 = 0

			if var_392_13 < arg_389_1.time_ and arg_389_1.time_ <= var_392_13 + arg_392_0 then
				arg_389_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action443")
			end

			local var_392_14 = 0

			if var_392_14 < arg_389_1.time_ and arg_389_1.time_ <= var_392_14 + arg_392_0 then
				arg_389_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_392_15 = 0
			local var_392_16 = 0.15

			if var_392_15 < arg_389_1.time_ and arg_389_1.time_ <= var_392_15 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_17 = arg_389_1:FormatText(StoryNameCfg[84].name)

				arg_389_1.leftNameTxt_.text = var_392_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_18 = arg_389_1:GetWordFromCfg(119901097)
				local var_392_19 = arg_389_1:FormatText(var_392_18.content)

				arg_389_1.text_.text = var_392_19

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_20 = 6
				local var_392_21 = utf8.len(var_392_19)
				local var_392_22 = var_392_20 <= 0 and var_392_16 or var_392_16 * (var_392_21 / var_392_20)

				if var_392_22 > 0 and var_392_16 < var_392_22 then
					arg_389_1.talkMaxDuration = var_392_22

					if var_392_22 + var_392_15 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_22 + var_392_15
					end
				end

				arg_389_1.text_.text = var_392_19
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901097", "story_v_side_old_119901.awb") ~= 0 then
					local var_392_23 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901097", "story_v_side_old_119901.awb") / 1000

					if var_392_23 + var_392_15 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_23 + var_392_15
					end

					if var_392_18.prefab_name ~= "" and arg_389_1.actors_[var_392_18.prefab_name] ~= nil then
						local var_392_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_18.prefab_name].transform, "story_v_side_old_119901", "119901097", "story_v_side_old_119901.awb")

						arg_389_1:RecordAudio("119901097", var_392_24)
						arg_389_1:RecordAudio("119901097", var_392_24)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901097", "story_v_side_old_119901.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901097", "story_v_side_old_119901.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_25 = math.max(var_392_16, arg_389_1.talkMaxDuration)

			if var_392_15 <= arg_389_1.time_ and arg_389_1.time_ < var_392_15 + var_392_25 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_15) / var_392_25

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_15 + var_392_25 and arg_389_1.time_ < var_392_15 + var_392_25 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play119901098 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 119901098
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play119901099(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1099ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect1099ui_story == nil then
				arg_393_1.var_.characterEffect1099ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.2

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect1099ui_story then
					local var_396_4 = Mathf.Lerp(0, 0.5, var_396_3)

					arg_393_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1099ui_story.fillRatio = var_396_4
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect1099ui_story then
				local var_396_5 = 0.5

				arg_393_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1099ui_story.fillRatio = var_396_5
			end

			local var_396_6 = 0
			local var_396_7 = 1.05

			if var_396_6 < arg_393_1.time_ and arg_393_1.time_ <= var_396_6 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, false)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_8 = arg_393_1:GetWordFromCfg(119901098)
				local var_396_9 = arg_393_1:FormatText(var_396_8.content)

				arg_393_1.text_.text = var_396_9

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_10 = 42
				local var_396_11 = utf8.len(var_396_9)
				local var_396_12 = var_396_10 <= 0 and var_396_7 or var_396_7 * (var_396_11 / var_396_10)

				if var_396_12 > 0 and var_396_7 < var_396_12 then
					arg_393_1.talkMaxDuration = var_396_12

					if var_396_12 + var_396_6 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_12 + var_396_6
					end
				end

				arg_393_1.text_.text = var_396_9
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_13 = math.max(var_396_7, arg_393_1.talkMaxDuration)

			if var_396_6 <= arg_393_1.time_ and arg_393_1.time_ < var_396_6 + var_396_13 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_6) / var_396_13

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_6 + var_396_13 and arg_393_1.time_ < var_396_6 + var_396_13 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play119901099 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 119901099
		arg_397_1.duration_ = 4.666

		local var_397_0 = {
			ja = 3.566,
			ko = 2.1,
			zh = 1.999999999999,
			en = 4.666
		}
		local var_397_1 = manager.audio:GetLocalizationFlag()

		if var_397_0[var_397_1] ~= nil then
			arg_397_1.duration_ = var_397_0[var_397_1]
		end

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play119901100(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1099ui_story"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.characterEffect1099ui_story == nil then
				arg_397_1.var_.characterEffect1099ui_story = var_400_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_2 = 0.2

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.characterEffect1099ui_story then
					arg_397_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.characterEffect1099ui_story then
				arg_397_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_400_4 = 0

			if var_400_4 < arg_397_1.time_ and arg_397_1.time_ <= var_400_4 + arg_400_0 then
				arg_397_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action434")
			end

			local var_400_5 = 0

			if var_400_5 < arg_397_1.time_ and arg_397_1.time_ <= var_400_5 + arg_400_0 then
				arg_397_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_400_6 = 0
			local var_400_7 = 0.225

			if var_400_6 < arg_397_1.time_ and arg_397_1.time_ <= var_400_6 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_8 = arg_397_1:FormatText(StoryNameCfg[84].name)

				arg_397_1.leftNameTxt_.text = var_400_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_9 = arg_397_1:GetWordFromCfg(119901099)
				local var_400_10 = arg_397_1:FormatText(var_400_9.content)

				arg_397_1.text_.text = var_400_10

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_11 = 9
				local var_400_12 = utf8.len(var_400_10)
				local var_400_13 = var_400_11 <= 0 and var_400_7 or var_400_7 * (var_400_12 / var_400_11)

				if var_400_13 > 0 and var_400_7 < var_400_13 then
					arg_397_1.talkMaxDuration = var_400_13

					if var_400_13 + var_400_6 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_13 + var_400_6
					end
				end

				arg_397_1.text_.text = var_400_10
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901099", "story_v_side_old_119901.awb") ~= 0 then
					local var_400_14 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901099", "story_v_side_old_119901.awb") / 1000

					if var_400_14 + var_400_6 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_14 + var_400_6
					end

					if var_400_9.prefab_name ~= "" and arg_397_1.actors_[var_400_9.prefab_name] ~= nil then
						local var_400_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_9.prefab_name].transform, "story_v_side_old_119901", "119901099", "story_v_side_old_119901.awb")

						arg_397_1:RecordAudio("119901099", var_400_15)
						arg_397_1:RecordAudio("119901099", var_400_15)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901099", "story_v_side_old_119901.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901099", "story_v_side_old_119901.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_16 = math.max(var_400_7, arg_397_1.talkMaxDuration)

			if var_400_6 <= arg_397_1.time_ and arg_397_1.time_ < var_400_6 + var_400_16 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_6) / var_400_16

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_6 + var_400_16 and arg_397_1.time_ < var_400_6 + var_400_16 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play119901100 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 119901100
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play119901101(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1099ui_story"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and arg_401_1.var_.characterEffect1099ui_story == nil then
				arg_401_1.var_.characterEffect1099ui_story = var_404_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_2 = 0.2

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.characterEffect1099ui_story then
					local var_404_4 = Mathf.Lerp(0, 0.5, var_404_3)

					arg_401_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_401_1.var_.characterEffect1099ui_story.fillRatio = var_404_4
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and arg_401_1.var_.characterEffect1099ui_story then
				local var_404_5 = 0.5

				arg_401_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_401_1.var_.characterEffect1099ui_story.fillRatio = var_404_5
			end

			local var_404_6 = 0
			local var_404_7 = 1.275

			if var_404_6 < arg_401_1.time_ and arg_401_1.time_ <= var_404_6 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_8 = arg_401_1:FormatText(StoryNameCfg[7].name)

				arg_401_1.leftNameTxt_.text = var_404_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_9 = arg_401_1:GetWordFromCfg(119901100)
				local var_404_10 = arg_401_1:FormatText(var_404_9.content)

				arg_401_1.text_.text = var_404_10

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_11 = 51
				local var_404_12 = utf8.len(var_404_10)
				local var_404_13 = var_404_11 <= 0 and var_404_7 or var_404_7 * (var_404_12 / var_404_11)

				if var_404_13 > 0 and var_404_7 < var_404_13 then
					arg_401_1.talkMaxDuration = var_404_13

					if var_404_13 + var_404_6 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_13 + var_404_6
					end
				end

				arg_401_1.text_.text = var_404_10
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_14 = math.max(var_404_7, arg_401_1.talkMaxDuration)

			if var_404_6 <= arg_401_1.time_ and arg_401_1.time_ < var_404_6 + var_404_14 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_6) / var_404_14

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_6 + var_404_14 and arg_401_1.time_ < var_404_6 + var_404_14 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play119901101 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 119901101
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play119901102(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 0.75

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_2 = arg_405_1:FormatText(StoryNameCfg[7].name)

				arg_405_1.leftNameTxt_.text = var_408_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_3 = arg_405_1:GetWordFromCfg(119901101)
				local var_408_4 = arg_405_1:FormatText(var_408_3.content)

				arg_405_1.text_.text = var_408_4

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_5 = 30
				local var_408_6 = utf8.len(var_408_4)
				local var_408_7 = var_408_5 <= 0 and var_408_1 or var_408_1 * (var_408_6 / var_408_5)

				if var_408_7 > 0 and var_408_1 < var_408_7 then
					arg_405_1.talkMaxDuration = var_408_7

					if var_408_7 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_7 + var_408_0
					end
				end

				arg_405_1.text_.text = var_408_4
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_8 = math.max(var_408_1, arg_405_1.talkMaxDuration)

			if var_408_0 <= arg_405_1.time_ and arg_405_1.time_ < var_408_0 + var_408_8 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_0) / var_408_8

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_0 + var_408_8 and arg_405_1.time_ < var_408_0 + var_408_8 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play119901102 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 119901102
		arg_409_1.duration_ = 6.866

		local var_409_0 = {
			ja = 6.866,
			ko = 3.966,
			zh = 4.4,
			en = 6.433
		}
		local var_409_1 = manager.audio:GetLocalizationFlag()

		if var_409_0[var_409_1] ~= nil then
			arg_409_1.duration_ = var_409_0[var_409_1]
		end

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play119901103(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1099ui_story"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 and arg_409_1.var_.characterEffect1099ui_story == nil then
				arg_409_1.var_.characterEffect1099ui_story = var_412_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_2 = 0.2

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2

				if arg_409_1.var_.characterEffect1099ui_story then
					arg_409_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 and arg_409_1.var_.characterEffect1099ui_story then
				arg_409_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_412_4 = 0

			if var_412_4 < arg_409_1.time_ and arg_409_1.time_ <= var_412_4 + arg_412_0 then
				arg_409_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_412_5 = 0
			local var_412_6 = 0.375

			if var_412_5 < arg_409_1.time_ and arg_409_1.time_ <= var_412_5 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_7 = arg_409_1:FormatText(StoryNameCfg[84].name)

				arg_409_1.leftNameTxt_.text = var_412_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_8 = arg_409_1:GetWordFromCfg(119901102)
				local var_412_9 = arg_409_1:FormatText(var_412_8.content)

				arg_409_1.text_.text = var_412_9

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_10 = 15
				local var_412_11 = utf8.len(var_412_9)
				local var_412_12 = var_412_10 <= 0 and var_412_6 or var_412_6 * (var_412_11 / var_412_10)

				if var_412_12 > 0 and var_412_6 < var_412_12 then
					arg_409_1.talkMaxDuration = var_412_12

					if var_412_12 + var_412_5 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_12 + var_412_5
					end
				end

				arg_409_1.text_.text = var_412_9
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901102", "story_v_side_old_119901.awb") ~= 0 then
					local var_412_13 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901102", "story_v_side_old_119901.awb") / 1000

					if var_412_13 + var_412_5 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_13 + var_412_5
					end

					if var_412_8.prefab_name ~= "" and arg_409_1.actors_[var_412_8.prefab_name] ~= nil then
						local var_412_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_8.prefab_name].transform, "story_v_side_old_119901", "119901102", "story_v_side_old_119901.awb")

						arg_409_1:RecordAudio("119901102", var_412_14)
						arg_409_1:RecordAudio("119901102", var_412_14)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901102", "story_v_side_old_119901.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901102", "story_v_side_old_119901.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_15 = math.max(var_412_6, arg_409_1.talkMaxDuration)

			if var_412_5 <= arg_409_1.time_ and arg_409_1.time_ < var_412_5 + var_412_15 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_5) / var_412_15

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_5 + var_412_15 and arg_409_1.time_ < var_412_5 + var_412_15 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play119901103 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 119901103
		arg_413_1.duration_ = 5

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play119901104(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1099ui_story"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.characterEffect1099ui_story == nil then
				arg_413_1.var_.characterEffect1099ui_story = var_416_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_2 = 0.2

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.characterEffect1099ui_story then
					local var_416_4 = Mathf.Lerp(0, 0.5, var_416_3)

					arg_413_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_413_1.var_.characterEffect1099ui_story.fillRatio = var_416_4
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.characterEffect1099ui_story then
				local var_416_5 = 0.5

				arg_413_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_413_1.var_.characterEffect1099ui_story.fillRatio = var_416_5
			end

			local var_416_6 = 0
			local var_416_7 = 1.025

			if var_416_6 < arg_413_1.time_ and arg_413_1.time_ <= var_416_6 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_8 = arg_413_1:FormatText(StoryNameCfg[7].name)

				arg_413_1.leftNameTxt_.text = var_416_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_9 = arg_413_1:GetWordFromCfg(119901103)
				local var_416_10 = arg_413_1:FormatText(var_416_9.content)

				arg_413_1.text_.text = var_416_10

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_11 = 41
				local var_416_12 = utf8.len(var_416_10)
				local var_416_13 = var_416_11 <= 0 and var_416_7 or var_416_7 * (var_416_12 / var_416_11)

				if var_416_13 > 0 and var_416_7 < var_416_13 then
					arg_413_1.talkMaxDuration = var_416_13

					if var_416_13 + var_416_6 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_13 + var_416_6
					end
				end

				arg_413_1.text_.text = var_416_10
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_14 = math.max(var_416_7, arg_413_1.talkMaxDuration)

			if var_416_6 <= arg_413_1.time_ and arg_413_1.time_ < var_416_6 + var_416_14 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_6) / var_416_14

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_6 + var_416_14 and arg_413_1.time_ < var_416_6 + var_416_14 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play119901104 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 119901104
		arg_417_1.duration_ = 9.1

		local var_417_0 = {
			ja = 9.1,
			ko = 4.533,
			zh = 6.133,
			en = 6.766
		}
		local var_417_1 = manager.audio:GetLocalizationFlag()

		if var_417_0[var_417_1] ~= nil then
			arg_417_1.duration_ = var_417_0[var_417_1]
		end

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play119901105(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1099ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect1099ui_story == nil then
				arg_417_1.var_.characterEffect1099ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.2

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect1099ui_story then
					arg_417_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect1099ui_story then
				arg_417_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_420_4 = 0

			if var_420_4 < arg_417_1.time_ and arg_417_1.time_ <= var_420_4 + arg_420_0 then
				arg_417_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action443")
			end

			local var_420_5 = 0

			if var_420_5 < arg_417_1.time_ and arg_417_1.time_ <= var_420_5 + arg_420_0 then
				arg_417_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_420_6 = 0
			local var_420_7 = 0.6

			if var_420_6 < arg_417_1.time_ and arg_417_1.time_ <= var_420_6 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_8 = arg_417_1:FormatText(StoryNameCfg[84].name)

				arg_417_1.leftNameTxt_.text = var_420_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_9 = arg_417_1:GetWordFromCfg(119901104)
				local var_420_10 = arg_417_1:FormatText(var_420_9.content)

				arg_417_1.text_.text = var_420_10

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_11 = 24
				local var_420_12 = utf8.len(var_420_10)
				local var_420_13 = var_420_11 <= 0 and var_420_7 or var_420_7 * (var_420_12 / var_420_11)

				if var_420_13 > 0 and var_420_7 < var_420_13 then
					arg_417_1.talkMaxDuration = var_420_13

					if var_420_13 + var_420_6 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_13 + var_420_6
					end
				end

				arg_417_1.text_.text = var_420_10
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901104", "story_v_side_old_119901.awb") ~= 0 then
					local var_420_14 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901104", "story_v_side_old_119901.awb") / 1000

					if var_420_14 + var_420_6 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_14 + var_420_6
					end

					if var_420_9.prefab_name ~= "" and arg_417_1.actors_[var_420_9.prefab_name] ~= nil then
						local var_420_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_9.prefab_name].transform, "story_v_side_old_119901", "119901104", "story_v_side_old_119901.awb")

						arg_417_1:RecordAudio("119901104", var_420_15)
						arg_417_1:RecordAudio("119901104", var_420_15)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901104", "story_v_side_old_119901.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901104", "story_v_side_old_119901.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_16 = math.max(var_420_7, arg_417_1.talkMaxDuration)

			if var_420_6 <= arg_417_1.time_ and arg_417_1.time_ < var_420_6 + var_420_16 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_6) / var_420_16

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_6 + var_420_16 and arg_417_1.time_ < var_420_6 + var_420_16 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play119901105 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 119901105
		arg_421_1.duration_ = 17.433

		local var_421_0 = {
			ja = 14.333,
			ko = 13.733,
			zh = 11.2,
			en = 17.433
		}
		local var_421_1 = manager.audio:GetLocalizationFlag()

		if var_421_0[var_421_1] ~= nil then
			arg_421_1.duration_ = var_421_0[var_421_1]
		end

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play119901106(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = 0

			if var_424_0 < arg_421_1.time_ and arg_421_1.time_ <= var_424_0 + arg_424_0 then
				arg_421_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_424_1 = 0
			local var_424_2 = 1.325

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_3 = arg_421_1:FormatText(StoryNameCfg[84].name)

				arg_421_1.leftNameTxt_.text = var_424_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_4 = arg_421_1:GetWordFromCfg(119901105)
				local var_424_5 = arg_421_1:FormatText(var_424_4.content)

				arg_421_1.text_.text = var_424_5

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_6 = 53
				local var_424_7 = utf8.len(var_424_5)
				local var_424_8 = var_424_6 <= 0 and var_424_2 or var_424_2 * (var_424_7 / var_424_6)

				if var_424_8 > 0 and var_424_2 < var_424_8 then
					arg_421_1.talkMaxDuration = var_424_8

					if var_424_8 + var_424_1 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_8 + var_424_1
					end
				end

				arg_421_1.text_.text = var_424_5
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901105", "story_v_side_old_119901.awb") ~= 0 then
					local var_424_9 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901105", "story_v_side_old_119901.awb") / 1000

					if var_424_9 + var_424_1 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_9 + var_424_1
					end

					if var_424_4.prefab_name ~= "" and arg_421_1.actors_[var_424_4.prefab_name] ~= nil then
						local var_424_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_4.prefab_name].transform, "story_v_side_old_119901", "119901105", "story_v_side_old_119901.awb")

						arg_421_1:RecordAudio("119901105", var_424_10)
						arg_421_1:RecordAudio("119901105", var_424_10)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901105", "story_v_side_old_119901.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901105", "story_v_side_old_119901.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_11 = math.max(var_424_2, arg_421_1.talkMaxDuration)

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_11 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_1) / var_424_11

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_1 + var_424_11 and arg_421_1.time_ < var_424_1 + var_424_11 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play119901106 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 119901106
		arg_425_1.duration_ = 15.233

		local var_425_0 = {
			ja = 8.933,
			ko = 8.866,
			zh = 7.866,
			en = 15.233
		}
		local var_425_1 = manager.audio:GetLocalizationFlag()

		if var_425_0[var_425_1] ~= nil then
			arg_425_1.duration_ = var_425_0[var_425_1]
		end

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play119901107(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action434")
			end

			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 then
				arg_425_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_428_2 = 0
			local var_428_3 = 0.925

			if var_428_2 < arg_425_1.time_ and arg_425_1.time_ <= var_428_2 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_4 = arg_425_1:FormatText(StoryNameCfg[84].name)

				arg_425_1.leftNameTxt_.text = var_428_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_5 = arg_425_1:GetWordFromCfg(119901106)
				local var_428_6 = arg_425_1:FormatText(var_428_5.content)

				arg_425_1.text_.text = var_428_6

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_7 = 37
				local var_428_8 = utf8.len(var_428_6)
				local var_428_9 = var_428_7 <= 0 and var_428_3 or var_428_3 * (var_428_8 / var_428_7)

				if var_428_9 > 0 and var_428_3 < var_428_9 then
					arg_425_1.talkMaxDuration = var_428_9

					if var_428_9 + var_428_2 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_9 + var_428_2
					end
				end

				arg_425_1.text_.text = var_428_6
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901106", "story_v_side_old_119901.awb") ~= 0 then
					local var_428_10 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901106", "story_v_side_old_119901.awb") / 1000

					if var_428_10 + var_428_2 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_10 + var_428_2
					end

					if var_428_5.prefab_name ~= "" and arg_425_1.actors_[var_428_5.prefab_name] ~= nil then
						local var_428_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_5.prefab_name].transform, "story_v_side_old_119901", "119901106", "story_v_side_old_119901.awb")

						arg_425_1:RecordAudio("119901106", var_428_11)
						arg_425_1:RecordAudio("119901106", var_428_11)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901106", "story_v_side_old_119901.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901106", "story_v_side_old_119901.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_12 = math.max(var_428_3, arg_425_1.talkMaxDuration)

			if var_428_2 <= arg_425_1.time_ and arg_425_1.time_ < var_428_2 + var_428_12 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_2) / var_428_12

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_2 + var_428_12 and arg_425_1.time_ < var_428_2 + var_428_12 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play119901107 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 119901107
		arg_429_1.duration_ = 5

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play119901108(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1099ui_story"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.characterEffect1099ui_story == nil then
				arg_429_1.var_.characterEffect1099ui_story = var_432_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_2 = 0.2

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.characterEffect1099ui_story then
					local var_432_4 = Mathf.Lerp(0, 0.5, var_432_3)

					arg_429_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_429_1.var_.characterEffect1099ui_story.fillRatio = var_432_4
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.characterEffect1099ui_story then
				local var_432_5 = 0.5

				arg_429_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_429_1.var_.characterEffect1099ui_story.fillRatio = var_432_5
			end

			local var_432_6 = 0
			local var_432_7 = 1.525

			if var_432_6 < arg_429_1.time_ and arg_429_1.time_ <= var_432_6 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, false)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_8 = arg_429_1:GetWordFromCfg(119901107)
				local var_432_9 = arg_429_1:FormatText(var_432_8.content)

				arg_429_1.text_.text = var_432_9

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_10 = 61
				local var_432_11 = utf8.len(var_432_9)
				local var_432_12 = var_432_10 <= 0 and var_432_7 or var_432_7 * (var_432_11 / var_432_10)

				if var_432_12 > 0 and var_432_7 < var_432_12 then
					arg_429_1.talkMaxDuration = var_432_12

					if var_432_12 + var_432_6 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_12 + var_432_6
					end
				end

				arg_429_1.text_.text = var_432_9
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_13 = math.max(var_432_7, arg_429_1.talkMaxDuration)

			if var_432_6 <= arg_429_1.time_ and arg_429_1.time_ < var_432_6 + var_432_13 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_6) / var_432_13

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_6 + var_432_13 and arg_429_1.time_ < var_432_6 + var_432_13 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play119901108 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 119901108
		arg_433_1.duration_ = 5

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play119901109(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = 0
			local var_436_1 = 0.925

			if var_436_0 < arg_433_1.time_ and arg_433_1.time_ <= var_436_0 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_2 = arg_433_1:FormatText(StoryNameCfg[7].name)

				arg_433_1.leftNameTxt_.text = var_436_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_3 = arg_433_1:GetWordFromCfg(119901108)
				local var_436_4 = arg_433_1:FormatText(var_436_3.content)

				arg_433_1.text_.text = var_436_4

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_5 = 37
				local var_436_6 = utf8.len(var_436_4)
				local var_436_7 = var_436_5 <= 0 and var_436_1 or var_436_1 * (var_436_6 / var_436_5)

				if var_436_7 > 0 and var_436_1 < var_436_7 then
					arg_433_1.talkMaxDuration = var_436_7

					if var_436_7 + var_436_0 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_7 + var_436_0
					end
				end

				arg_433_1.text_.text = var_436_4
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)
				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_8 = math.max(var_436_1, arg_433_1.talkMaxDuration)

			if var_436_0 <= arg_433_1.time_ and arg_433_1.time_ < var_436_0 + var_436_8 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_0) / var_436_8

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_0 + var_436_8 and arg_433_1.time_ < var_436_0 + var_436_8 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play119901109 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 119901109
		arg_437_1.duration_ = 8.266

		local var_437_0 = {
			ja = 8.266,
			ko = 7.533,
			zh = 7.3,
			en = 6.566
		}
		local var_437_1 = manager.audio:GetLocalizationFlag()

		if var_437_0[var_437_1] ~= nil then
			arg_437_1.duration_ = var_437_0[var_437_1]
		end

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play119901110(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1099ui_story"]
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 and arg_437_1.var_.characterEffect1099ui_story == nil then
				arg_437_1.var_.characterEffect1099ui_story = var_440_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_2 = 0.2

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2

				if arg_437_1.var_.characterEffect1099ui_story then
					arg_437_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 and arg_437_1.var_.characterEffect1099ui_story then
				arg_437_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_440_4 = 0

			if var_440_4 < arg_437_1.time_ and arg_437_1.time_ <= var_440_4 + arg_440_0 then
				arg_437_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_440_5 = 0
			local var_440_6 = 0.775

			if var_440_5 < arg_437_1.time_ and arg_437_1.time_ <= var_440_5 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_7 = arg_437_1:FormatText(StoryNameCfg[84].name)

				arg_437_1.leftNameTxt_.text = var_440_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_8 = arg_437_1:GetWordFromCfg(119901109)
				local var_440_9 = arg_437_1:FormatText(var_440_8.content)

				arg_437_1.text_.text = var_440_9

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_10 = 31
				local var_440_11 = utf8.len(var_440_9)
				local var_440_12 = var_440_10 <= 0 and var_440_6 or var_440_6 * (var_440_11 / var_440_10)

				if var_440_12 > 0 and var_440_6 < var_440_12 then
					arg_437_1.talkMaxDuration = var_440_12

					if var_440_12 + var_440_5 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_12 + var_440_5
					end
				end

				arg_437_1.text_.text = var_440_9
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901109", "story_v_side_old_119901.awb") ~= 0 then
					local var_440_13 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901109", "story_v_side_old_119901.awb") / 1000

					if var_440_13 + var_440_5 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_13 + var_440_5
					end

					if var_440_8.prefab_name ~= "" and arg_437_1.actors_[var_440_8.prefab_name] ~= nil then
						local var_440_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_8.prefab_name].transform, "story_v_side_old_119901", "119901109", "story_v_side_old_119901.awb")

						arg_437_1:RecordAudio("119901109", var_440_14)
						arg_437_1:RecordAudio("119901109", var_440_14)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901109", "story_v_side_old_119901.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901109", "story_v_side_old_119901.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_15 = math.max(var_440_6, arg_437_1.talkMaxDuration)

			if var_440_5 <= arg_437_1.time_ and arg_437_1.time_ < var_440_5 + var_440_15 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_5) / var_440_15

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_5 + var_440_15 and arg_437_1.time_ < var_440_5 + var_440_15 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play119901110 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 119901110
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play119901111(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["1099ui_story"]
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 and arg_441_1.var_.characterEffect1099ui_story == nil then
				arg_441_1.var_.characterEffect1099ui_story = var_444_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_2 = 0.2

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2

				if arg_441_1.var_.characterEffect1099ui_story then
					local var_444_4 = Mathf.Lerp(0, 0.5, var_444_3)

					arg_441_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_441_1.var_.characterEffect1099ui_story.fillRatio = var_444_4
				end
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 and arg_441_1.var_.characterEffect1099ui_story then
				local var_444_5 = 0.5

				arg_441_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_441_1.var_.characterEffect1099ui_story.fillRatio = var_444_5
			end

			local var_444_6 = 0
			local var_444_7 = 0.1

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

				local var_444_9 = arg_441_1:GetWordFromCfg(119901110)
				local var_444_10 = arg_441_1:FormatText(var_444_9.content)

				arg_441_1.text_.text = var_444_10

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_11 = 4
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
	Play119901111 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 119901111
		arg_445_1.duration_ = 5

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play119901112(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1099ui_story"].transform
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 then
				arg_445_1.var_.moveOldPos1099ui_story = var_448_0.localPosition
			end

			local var_448_2 = 0.001

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2
				local var_448_4 = Vector3.New(0, 100, 0)

				var_448_0.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos1099ui_story, var_448_4, var_448_3)

				local var_448_5 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_5.x, var_448_5.y, var_448_5.z)

				local var_448_6 = var_448_0.localEulerAngles

				var_448_6.z = 0
				var_448_6.x = 0
				var_448_0.localEulerAngles = var_448_6
			end

			if arg_445_1.time_ >= var_448_1 + var_448_2 and arg_445_1.time_ < var_448_1 + var_448_2 + arg_448_0 then
				var_448_0.localPosition = Vector3.New(0, 100, 0)

				local var_448_7 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_7.x, var_448_7.y, var_448_7.z)

				local var_448_8 = var_448_0.localEulerAngles

				var_448_8.z = 0
				var_448_8.x = 0
				var_448_0.localEulerAngles = var_448_8
			end

			local var_448_9 = 0
			local var_448_10 = 0.85

			if var_448_9 < arg_445_1.time_ and arg_445_1.time_ <= var_448_9 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, false)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_11 = arg_445_1:GetWordFromCfg(119901111)
				local var_448_12 = arg_445_1:FormatText(var_448_11.content)

				arg_445_1.text_.text = var_448_12

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_13 = 34
				local var_448_14 = utf8.len(var_448_12)
				local var_448_15 = var_448_13 <= 0 and var_448_10 or var_448_10 * (var_448_14 / var_448_13)

				if var_448_15 > 0 and var_448_10 < var_448_15 then
					arg_445_1.talkMaxDuration = var_448_15

					if var_448_15 + var_448_9 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_15 + var_448_9
					end
				end

				arg_445_1.text_.text = var_448_12
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)
				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_16 = math.max(var_448_10, arg_445_1.talkMaxDuration)

			if var_448_9 <= arg_445_1.time_ and arg_445_1.time_ < var_448_9 + var_448_16 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_9) / var_448_16

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_9 + var_448_16 and arg_445_1.time_ < var_448_9 + var_448_16 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play119901112 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 119901112
		arg_449_1.duration_ = 5

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play119901113(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 0
			local var_452_1 = 0.55

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_2 = arg_449_1:FormatText(StoryNameCfg[7].name)

				arg_449_1.leftNameTxt_.text = var_452_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_3 = arg_449_1:GetWordFromCfg(119901112)
				local var_452_4 = arg_449_1:FormatText(var_452_3.content)

				arg_449_1.text_.text = var_452_4

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_5 = 22
				local var_452_6 = utf8.len(var_452_4)
				local var_452_7 = var_452_5 <= 0 and var_452_1 or var_452_1 * (var_452_6 / var_452_5)

				if var_452_7 > 0 and var_452_1 < var_452_7 then
					arg_449_1.talkMaxDuration = var_452_7

					if var_452_7 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_7 + var_452_0
					end
				end

				arg_449_1.text_.text = var_452_4
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_8 = math.max(var_452_1, arg_449_1.talkMaxDuration)

			if var_452_0 <= arg_449_1.time_ and arg_449_1.time_ < var_452_0 + var_452_8 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_0) / var_452_8

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_0 + var_452_8 and arg_449_1.time_ < var_452_0 + var_452_8 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play119901113 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 119901113
		arg_453_1.duration_ = 5

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play119901114(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = 0
			local var_456_1 = 0.325

			if var_456_0 < arg_453_1.time_ and arg_453_1.time_ <= var_456_0 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, false)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_2 = arg_453_1:GetWordFromCfg(119901113)
				local var_456_3 = arg_453_1:FormatText(var_456_2.content)

				arg_453_1.text_.text = var_456_3

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_4 = 13
				local var_456_5 = utf8.len(var_456_3)
				local var_456_6 = var_456_4 <= 0 and var_456_1 or var_456_1 * (var_456_5 / var_456_4)

				if var_456_6 > 0 and var_456_1 < var_456_6 then
					arg_453_1.talkMaxDuration = var_456_6

					if var_456_6 + var_456_0 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_6 + var_456_0
					end
				end

				arg_453_1.text_.text = var_456_3
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)
				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_7 = math.max(var_456_1, arg_453_1.talkMaxDuration)

			if var_456_0 <= arg_453_1.time_ and arg_453_1.time_ < var_456_0 + var_456_7 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_0) / var_456_7

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_0 + var_456_7 and arg_453_1.time_ < var_456_0 + var_456_7 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play119901114 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 119901114
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play119901115(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = 0
			local var_460_1 = 0.575

			if var_460_0 < arg_457_1.time_ and arg_457_1.time_ <= var_460_0 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_2 = arg_457_1:FormatText(StoryNameCfg[7].name)

				arg_457_1.leftNameTxt_.text = var_460_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_3 = arg_457_1:GetWordFromCfg(119901114)
				local var_460_4 = arg_457_1:FormatText(var_460_3.content)

				arg_457_1.text_.text = var_460_4

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_5 = 23
				local var_460_6 = utf8.len(var_460_4)
				local var_460_7 = var_460_5 <= 0 and var_460_1 or var_460_1 * (var_460_6 / var_460_5)

				if var_460_7 > 0 and var_460_1 < var_460_7 then
					arg_457_1.talkMaxDuration = var_460_7

					if var_460_7 + var_460_0 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_7 + var_460_0
					end
				end

				arg_457_1.text_.text = var_460_4
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_8 = math.max(var_460_1, arg_457_1.talkMaxDuration)

			if var_460_0 <= arg_457_1.time_ and arg_457_1.time_ < var_460_0 + var_460_8 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_0) / var_460_8

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_0 + var_460_8 and arg_457_1.time_ < var_460_0 + var_460_8 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play119901115 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 119901115
		arg_461_1.duration_ = 5

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play119901116(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = 0
			local var_464_1 = 0.2

			if var_464_0 < arg_461_1.time_ and arg_461_1.time_ <= var_464_0 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, false)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_2 = arg_461_1:GetWordFromCfg(119901115)
				local var_464_3 = arg_461_1:FormatText(var_464_2.content)

				arg_461_1.text_.text = var_464_3

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_4 = 8
				local var_464_5 = utf8.len(var_464_3)
				local var_464_6 = var_464_4 <= 0 and var_464_1 or var_464_1 * (var_464_5 / var_464_4)

				if var_464_6 > 0 and var_464_1 < var_464_6 then
					arg_461_1.talkMaxDuration = var_464_6

					if var_464_6 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_6 + var_464_0
					end
				end

				arg_461_1.text_.text = var_464_3
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)
				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_7 = math.max(var_464_1, arg_461_1.talkMaxDuration)

			if var_464_0 <= arg_461_1.time_ and arg_461_1.time_ < var_464_0 + var_464_7 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_0) / var_464_7

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_0 + var_464_7 and arg_461_1.time_ < var_464_0 + var_464_7 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play119901116 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 119901116
		arg_465_1.duration_ = 7.333

		local var_465_0 = {
			ja = 7.333,
			ko = 4.2,
			zh = 4.5,
			en = 5.433
		}
		local var_465_1 = manager.audio:GetLocalizationFlag()

		if var_465_0[var_465_1] ~= nil then
			arg_465_1.duration_ = var_465_0[var_465_1]
		end

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play119901117(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["1099ui_story"]
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 and arg_465_1.var_.characterEffect1099ui_story == nil then
				arg_465_1.var_.characterEffect1099ui_story = var_468_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_2 = 0.2

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2

				if arg_465_1.var_.characterEffect1099ui_story then
					arg_465_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 and arg_465_1.var_.characterEffect1099ui_story then
				arg_465_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_468_4 = 0

			if var_468_4 < arg_465_1.time_ and arg_465_1.time_ <= var_468_4 + arg_468_0 then
				arg_465_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_468_5 = arg_465_1.actors_["1099ui_story"].transform
			local var_468_6 = 0

			if var_468_6 < arg_465_1.time_ and arg_465_1.time_ <= var_468_6 + arg_468_0 then
				arg_465_1.var_.moveOldPos1099ui_story = var_468_5.localPosition
			end

			local var_468_7 = 0.001

			if var_468_6 <= arg_465_1.time_ and arg_465_1.time_ < var_468_6 + var_468_7 then
				local var_468_8 = (arg_465_1.time_ - var_468_6) / var_468_7
				local var_468_9 = Vector3.New(0, -1.08, -5.9)

				var_468_5.localPosition = Vector3.Lerp(arg_465_1.var_.moveOldPos1099ui_story, var_468_9, var_468_8)

				local var_468_10 = manager.ui.mainCamera.transform.position - var_468_5.position

				var_468_5.forward = Vector3.New(var_468_10.x, var_468_10.y, var_468_10.z)

				local var_468_11 = var_468_5.localEulerAngles

				var_468_11.z = 0
				var_468_11.x = 0
				var_468_5.localEulerAngles = var_468_11
			end

			if arg_465_1.time_ >= var_468_6 + var_468_7 and arg_465_1.time_ < var_468_6 + var_468_7 + arg_468_0 then
				var_468_5.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_468_12 = manager.ui.mainCamera.transform.position - var_468_5.position

				var_468_5.forward = Vector3.New(var_468_12.x, var_468_12.y, var_468_12.z)

				local var_468_13 = var_468_5.localEulerAngles

				var_468_13.z = 0
				var_468_13.x = 0
				var_468_5.localEulerAngles = var_468_13
			end

			local var_468_14 = 0
			local var_468_15 = 0.5

			if var_468_14 < arg_465_1.time_ and arg_465_1.time_ <= var_468_14 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_16 = arg_465_1:FormatText(StoryNameCfg[84].name)

				arg_465_1.leftNameTxt_.text = var_468_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_17 = arg_465_1:GetWordFromCfg(119901116)
				local var_468_18 = arg_465_1:FormatText(var_468_17.content)

				arg_465_1.text_.text = var_468_18

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_19 = 20
				local var_468_20 = utf8.len(var_468_18)
				local var_468_21 = var_468_19 <= 0 and var_468_15 or var_468_15 * (var_468_20 / var_468_19)

				if var_468_21 > 0 and var_468_15 < var_468_21 then
					arg_465_1.talkMaxDuration = var_468_21

					if var_468_21 + var_468_14 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_21 + var_468_14
					end
				end

				arg_465_1.text_.text = var_468_18
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901116", "story_v_side_old_119901.awb") ~= 0 then
					local var_468_22 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901116", "story_v_side_old_119901.awb") / 1000

					if var_468_22 + var_468_14 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_22 + var_468_14
					end

					if var_468_17.prefab_name ~= "" and arg_465_1.actors_[var_468_17.prefab_name] ~= nil then
						local var_468_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_17.prefab_name].transform, "story_v_side_old_119901", "119901116", "story_v_side_old_119901.awb")

						arg_465_1:RecordAudio("119901116", var_468_23)
						arg_465_1:RecordAudio("119901116", var_468_23)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901116", "story_v_side_old_119901.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901116", "story_v_side_old_119901.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_24 = math.max(var_468_15, arg_465_1.talkMaxDuration)

			if var_468_14 <= arg_465_1.time_ and arg_465_1.time_ < var_468_14 + var_468_24 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_14) / var_468_24

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_14 + var_468_24 and arg_465_1.time_ < var_468_14 + var_468_24 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play119901117 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 119901117
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play119901118(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1099ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect1099ui_story == nil then
				arg_469_1.var_.characterEffect1099ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.2

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect1099ui_story then
					local var_472_4 = Mathf.Lerp(0, 0.5, var_472_3)

					arg_469_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_469_1.var_.characterEffect1099ui_story.fillRatio = var_472_4
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect1099ui_story then
				local var_472_5 = 0.5

				arg_469_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_469_1.var_.characterEffect1099ui_story.fillRatio = var_472_5
			end

			local var_472_6 = 0
			local var_472_7 = 0.65

			if var_472_6 < arg_469_1.time_ and arg_469_1.time_ <= var_472_6 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_8 = arg_469_1:FormatText(StoryNameCfg[7].name)

				arg_469_1.leftNameTxt_.text = var_472_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_9 = arg_469_1:GetWordFromCfg(119901117)
				local var_472_10 = arg_469_1:FormatText(var_472_9.content)

				arg_469_1.text_.text = var_472_10

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_11 = 26
				local var_472_12 = utf8.len(var_472_10)
				local var_472_13 = var_472_11 <= 0 and var_472_7 or var_472_7 * (var_472_12 / var_472_11)

				if var_472_13 > 0 and var_472_7 < var_472_13 then
					arg_469_1.talkMaxDuration = var_472_13

					if var_472_13 + var_472_6 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_13 + var_472_6
					end
				end

				arg_469_1.text_.text = var_472_10
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_14 = math.max(var_472_7, arg_469_1.talkMaxDuration)

			if var_472_6 <= arg_469_1.time_ and arg_469_1.time_ < var_472_6 + var_472_14 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_6) / var_472_14

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_6 + var_472_14 and arg_469_1.time_ < var_472_6 + var_472_14 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play119901118 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 119901118
		arg_473_1.duration_ = 5

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play119901119(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = 0
			local var_476_1 = 0.925

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_2 = arg_473_1:FormatText(StoryNameCfg[7].name)

				arg_473_1.leftNameTxt_.text = var_476_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_3 = arg_473_1:GetWordFromCfg(119901118)
				local var_476_4 = arg_473_1:FormatText(var_476_3.content)

				arg_473_1.text_.text = var_476_4

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_5 = 37
				local var_476_6 = utf8.len(var_476_4)
				local var_476_7 = var_476_5 <= 0 and var_476_1 or var_476_1 * (var_476_6 / var_476_5)

				if var_476_7 > 0 and var_476_1 < var_476_7 then
					arg_473_1.talkMaxDuration = var_476_7

					if var_476_7 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_7 + var_476_0
					end
				end

				arg_473_1.text_.text = var_476_4
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)
				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_8 = math.max(var_476_1, arg_473_1.talkMaxDuration)

			if var_476_0 <= arg_473_1.time_ and arg_473_1.time_ < var_476_0 + var_476_8 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_0) / var_476_8

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_0 + var_476_8 and arg_473_1.time_ < var_476_0 + var_476_8 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play119901119 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 119901119
		arg_477_1.duration_ = 5.966

		local var_477_0 = {
			ja = 5.966,
			ko = 3.066,
			zh = 4,
			en = 3.766
		}
		local var_477_1 = manager.audio:GetLocalizationFlag()

		if var_477_0[var_477_1] ~= nil then
			arg_477_1.duration_ = var_477_0[var_477_1]
		end

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play119901120(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1099ui_story"]
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 and arg_477_1.var_.characterEffect1099ui_story == nil then
				arg_477_1.var_.characterEffect1099ui_story = var_480_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_2 = 0.2

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2

				if arg_477_1.var_.characterEffect1099ui_story then
					arg_477_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 and arg_477_1.var_.characterEffect1099ui_story then
				arg_477_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_480_4 = 0

			if var_480_4 < arg_477_1.time_ and arg_477_1.time_ <= var_480_4 + arg_480_0 then
				arg_477_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action4_2")
			end

			local var_480_5 = 0

			if var_480_5 < arg_477_1.time_ and arg_477_1.time_ <= var_480_5 + arg_480_0 then
				arg_477_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_480_6 = 0
			local var_480_7 = 0.275

			if var_480_6 < arg_477_1.time_ and arg_477_1.time_ <= var_480_6 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_8 = arg_477_1:FormatText(StoryNameCfg[84].name)

				arg_477_1.leftNameTxt_.text = var_480_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_9 = arg_477_1:GetWordFromCfg(119901119)
				local var_480_10 = arg_477_1:FormatText(var_480_9.content)

				arg_477_1.text_.text = var_480_10

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_11 = 11
				local var_480_12 = utf8.len(var_480_10)
				local var_480_13 = var_480_11 <= 0 and var_480_7 or var_480_7 * (var_480_12 / var_480_11)

				if var_480_13 > 0 and var_480_7 < var_480_13 then
					arg_477_1.talkMaxDuration = var_480_13

					if var_480_13 + var_480_6 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_13 + var_480_6
					end
				end

				arg_477_1.text_.text = var_480_10
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_119901", "119901119", "story_v_side_old_119901.awb") ~= 0 then
					local var_480_14 = manager.audio:GetVoiceLength("story_v_side_old_119901", "119901119", "story_v_side_old_119901.awb") / 1000

					if var_480_14 + var_480_6 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_14 + var_480_6
					end

					if var_480_9.prefab_name ~= "" and arg_477_1.actors_[var_480_9.prefab_name] ~= nil then
						local var_480_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_9.prefab_name].transform, "story_v_side_old_119901", "119901119", "story_v_side_old_119901.awb")

						arg_477_1:RecordAudio("119901119", var_480_15)
						arg_477_1:RecordAudio("119901119", var_480_15)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_side_old_119901", "119901119", "story_v_side_old_119901.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_side_old_119901", "119901119", "story_v_side_old_119901.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_16 = math.max(var_480_7, arg_477_1.talkMaxDuration)

			if var_480_6 <= arg_477_1.time_ and arg_477_1.time_ < var_480_6 + var_480_16 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_6) / var_480_16

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_6 + var_480_16 and arg_477_1.time_ < var_480_6 + var_480_16 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play119901120 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 119901120
		arg_481_1.duration_ = 5

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
			arg_481_1.auto_ = false
		end

		function arg_481_1.playNext_(arg_483_0)
			arg_481_1.onStoryFinished_()
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["1099ui_story"]
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 and arg_481_1.var_.characterEffect1099ui_story == nil then
				arg_481_1.var_.characterEffect1099ui_story = var_484_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_2 = 0.2

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2

				if arg_481_1.var_.characterEffect1099ui_story then
					local var_484_4 = Mathf.Lerp(0, 0.5, var_484_3)

					arg_481_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_481_1.var_.characterEffect1099ui_story.fillRatio = var_484_4
				end
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 and arg_481_1.var_.characterEffect1099ui_story then
				local var_484_5 = 0.5

				arg_481_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_481_1.var_.characterEffect1099ui_story.fillRatio = var_484_5
			end

			local var_484_6 = 0
			local var_484_7 = 0.375

			if var_484_6 < arg_481_1.time_ and arg_481_1.time_ <= var_484_6 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_8 = arg_481_1:FormatText(StoryNameCfg[7].name)

				arg_481_1.leftNameTxt_.text = var_484_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_9 = arg_481_1:GetWordFromCfg(119901120)
				local var_484_10 = arg_481_1:FormatText(var_484_9.content)

				arg_481_1.text_.text = var_484_10

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_11 = 15
				local var_484_12 = utf8.len(var_484_10)
				local var_484_13 = var_484_11 <= 0 and var_484_7 or var_484_7 * (var_484_12 / var_484_11)

				if var_484_13 > 0 and var_484_7 < var_484_13 then
					arg_481_1.talkMaxDuration = var_484_13

					if var_484_13 + var_484_6 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_13 + var_484_6
					end
				end

				arg_481_1.text_.text = var_484_10
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)
				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_14 = math.max(var_484_7, arg_481_1.talkMaxDuration)

			if var_484_6 <= arg_481_1.time_ and arg_481_1.time_ < var_484_6 + var_484_14 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_6) / var_484_14

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_6 + var_484_14 and arg_481_1.time_ < var_484_6 + var_484_14 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/D02a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST16a"
	},
	voices = {
		"story_v_side_old_119901.awb"
	}
}
